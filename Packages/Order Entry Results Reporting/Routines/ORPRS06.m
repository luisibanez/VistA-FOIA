ORPRS06 ; slc/dcm - Driving Miss ChartCopy ;3/15/05  11:18
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**11,69,99,215**;Dec 17, 1997
 ;
 ; DBIA 3869   GETPLIST^SDAMA202   ^TMP($J,"SDAMA202")
 ;
MAIN ; Control module
 N %,%H,%I,%T,ORDT,ORNOW,OREARLY,ORLATE,ORHPRM,ORLOC,X,X1,X2
 N ORSC,ORSSC,ZTDESC,ZTDTH,ZTIO,ZTRTN,ZTSAVE,ZTSK,ORPCCS,ORPCCP,ORCONTX
 D NOW^%DTC
 S ORDT=$P(%,"."),ORNOW=$P(%,".",2)
 I $E(ORNOW,1,2)>14 S OREARLY=ORDT
 E  S X1=ORDT,X2=-1 D C^%DTC S OREARLY=X
 S X1=OREARLY,X2=1
 D C^%DTC
 S ORLATE=X,ORCONTX=21
 D ENVAL^XPAR(.ORPCCS,"ORPF PRINT CHART COPY SUMMARY")
 D ENVAL^XPAR(.ORPCCP,"ORPF CHART COPY PRINT DEVICE")
 S ORSC="" F  S ORSC=$O(ORPCCS(ORSC)) Q:ORSC=""  I ORPCCS(ORSC,1),$G(ORPCCP(ORSC,1)) D
 . S ORHPRM=ORPCCP(ORSC,1),ORSSC=+ORSC,ORLOC=$S(+$G(^SC(ORSSC,42)):$P($G(^DIC(42,+$G(^SC(ORSSC,42)),0)),U),1:$P($G(^SC(ORSSC,0)),U)_"^"_1)
 . S ZTRTN=$S($L(ORLOC,U)=2:"CLINIC^ORPRS06",1:"WARD^ORPRS06"),ZTDTH=$H
 . S ZTIO="`"_+ORHPRM,ZTSAVE("OR*")=""
 . S ZTDESC="Chart copy of orders for "_ORLOC
 . D ^%ZTLOAD
 Q
WARD ; Gets list of patients for a specified non-clinic ward
 N DFN,ORDLRJ,X,Y
 I $S('$L(ORLOC):1,'$O(^DPT("CN",ORLOC,0)):1,1:0) Q
 S ORDLRJ=$J,DFN=0
 F  S DFN=$O(^DPT("CN",ORLOC,DFN)) Q:'DFN  D PATIENT(DFN,OREARLY,ORLATE,ORHPRM,$G(ORCONTX),$G(ORSSC))
 D ^%ZISC
 I $D(ZTSK) D KILL^%ZTLOAD K ZTSK
 Q
CLINIC ; Sets up call for clinic patients
 ; DBIA 3869
 N ORAPT,ORERR,ORI,ORCSTAT
 K ^TMP($J,"SDAMA202","GETPLIST")
 D GETPLIST^SDAMA202(ORSSC,"1;4","",9999999-OREARLY,9999999-ORLATE)  ;DBIA 3869
 S ORERR=$$CLINERR^ORQRY01
 I $L(ORERR) D  Q
 . N XMDUZ,XMSUB,XMTEXT,XMY K XMY,^TMP("OR SCHED DB ERROR",$J)
 . S XMDUZ=.5
 . S XMY(.5)=""
 . S XMSUB=ORERR
 . S XMTEXT="^TMP(""OR SCHED DB ERROR"",$J,0,"
 . S ^TMP("OR SCHED DB ERROR",$J,0,1,0)=ORERR
 . S ^TMP("OR SCHED DB ERROR",$J,0,2,0)=""
 . D ^XMD
 . K ^TMP("OR SCHED DB ERROR",$J)
 S ORI=0
 F  S ORI=$O(^TMP($J,"SDAMA202","GETPLIST",ORI)) Q:ORI<1  D  ;DBIA 3869
 . S ORCSTAT=+$G(^TMP($J,"SDAMA202","GETPLIST",ORI,3))
 . Q:ORCSTAT="C"
 . S ORAPT=+$G(^TMP($J,"SDAMA202","GETPLIST",ORI,1))
 . S DFN=+$G(^TMP($J,"SDAMA202","GETPLIST",ORI,4))
 . I ORAPT,DFN D PATIENT(DFN,OREARLY,ORLATE,ORHPRM,$G(ORCONTX),$G(ORSSC))
 K ^TMP($J,"SDAMA202","GETPLIST")
 D ^%ZISC
 I $D(ZTSK) D KILL^%ZTLOAD K ZTSK
 Q
PATIENT(DFN,EARLY,LATE,DEVICE,CONTEXT,LOC44) ; Gets orders by patient, date, context
 ;DFN=ptr to file 2
 ;EARLY=Starting date
 ;LATE=Ending date
 ;DEVICE=device to print on.
 ;CONTEXT=context sent to ORQ1 (default=1)
 ;LOC44=ptr to location, file 44
 N ARRAY,ORVP
 S ORVP=DFN_";DPT("
 S:'$G(CONTEXT) CONTEXT=1
 D EN^ORQ1(ORVP,1,CONTEXT,"",LATE,EARLY,0,1)
 I $$GET^XPAR("ALL","ORPF CHART SUMMARY SORT",1,"I") D SORT^ORPRS02
 I '$O(^TMP("ORR",$J,ORLIST,0)) G PATX
 S ARRAY="^TMP(""ORR"",$J,ORLIST)",LOC44=$S($G(LOC44):LOC44_";SC(",1:"")
 D GUI^ORPR02(.ARRAY,DEVICE,"C",LOC44,1)
PATX ;
 K ^TMP("ORR",$J,ORLIST)
 Q
WORK(DFN,EARLY,LATE,DEVICE) ;Gets orders for work copy
 ;Same description as PATIENT()
 N ARRAY,ORVP
 S ORVP=DFN_";DPT("
 D EN^ORQ1(ORVP,1,1,"",LATE,EARLY,0,1)
 I $$GET^XPAR("ALL","ORPF WORK SUMMARY SORT",1,"I") D SORT^ORPRS02
 I '$O(^TMP("ORR",$J,ORLIST,0)) G WRKX
 S ARRAY="^TMP(""ORR"",$J,ORLIST)"
 D GUI^ORPR02(.ARRAY,DEVICE,"W",,1)
WRKX ;
 K ^TMP("ORR",$J,ORLIST)
 Q
