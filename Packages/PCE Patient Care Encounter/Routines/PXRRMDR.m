PXRRMDR ;BP/WLC - PCE Missing Data Report ;11 Feb 04  10:10 AM
 ;;1.0;PCE;**124,174**;FEB 11, 2004
 ; 04/11/05 WLC changed to check for AO, IR and EC, only if SC'=YES
 Q
 ;
EN N PX,PXPAGE,PXLOC,PXPROV,SDDIV,ZTSAVE,%DT,DIR,DTOUT,DUOUT,X,Y,POP,PXDT,PXDS,RPTYP,EDT,PAT,SSN,DT,TY,CBU,VDT,LOC,PROV,SORT,SORTHDR,CNT,PRIO
 S (POP,PXPAGE)=0
 K PXDS
 D HOME^%ZIS S:'$D(IOF) IOF=FF W @IOF,!!
 S X=$$CTR("PCE Missing Data Report")
 W !! D DATASRC^PXRRMDR1 G:POP EXIT   ; sets PXDS() PX*1.0*174
 W @IOF,!! S X=$$CTR("**** Date Range Selection ****")
 W !!! S %DT="AEPX",%DT("A")="Beginning date: " D ^%DT G:Y<1 EXIT S PX("BDT")=Y
EDT S %DT("A")="   Ending date: " W ! D ^%DT G:Y<1 EXIT
 I Y<PX("BDT") W !!,$C(7),"End date cannot be before begin date!",! G EDT
 S PX("EDT")=Y_.999999
 W @IOF,!! S X=$$CTR("*** Report Sort Selection ***")
 W !!! K DIR S SORTHDR="DATA SOURCE^CPT^ICD9^PATIENT^ELIGIBILITY"
 F LOOP=1:1:$L(SORTHDR,U) S DESC=$P(SORTHDR,U,LOOP) W !,"("_LOOP_")  "_DESC
 W ! S DIR(0)="N^^I X<1!(X>5) K X",DIR("A")="Enter number between 1 and 5" D ^DIR Q:$D(DIRUT)  S PXSRT=+X
 S DIR(0)="S^D:DETAILED REPORT;S:STATISTICS ONLY",DIR("A")="Select report type",DIR("B")="DETAILED REPORT" D ^DIR Q:$D(DIRUT)
 S RPTYP=Y
 W !!,"This report requires 132 column output.",!
 S %ZIS="QM" D ^%ZIS Q:POP
 I $D(IO("Q")) D  G EXIT
 . S ZTRTN="RUN^PXRRMDR",ZTDESC="PCE MISSING DATA REPORT"
 . S ZTSAVE("PX*")=""
 . S ZTSAVE("RPTYP")="",ZTSAVE("SORTHDR")=""
 . D ^%ZTLOAD W !!,$S($D(ZTSK):"This job has been queued.  The task number is "_ZTSK_".",1:"Unable to queue this job.")
 .K ZTSK,IO("Q"),ZTSAVE D HOME^%ZIS
 ;
RUN ;
 U IO
 K ^TMP("PXCRPW",$J),DIR S (PXOUT)=""
 N LOOP,PXDT,I,VSN,VISITS,CLASSIF
 S PXDT=(PX("BDT")-1)_.99999 K ^TMP("PXCRPW",$J)
 F  S PXDT=$O(^AUPNVSIT("ADEL",PXDT)) Q:PXDT>PX("EDT")!('PXDT)  D
 . S VSN=0 F  S VSN=$O(^AUPNVSIT("ADEL",PXDT,VSN)) Q:'VSN  D
 . . S VISITS=$P($G(^AUPNVSIT(VSN,812)),U,3) S:VISITS="" VISITS="Unknown"
 . . Q:'$D(PXDS(VISITS))
 . . D ENCEVENT^PXKENC(VSN,0)
 . . Q:$P($G(^TMP("PXKENC",$J,VSN,"VST",VSN,0)),U,7)="E"  ;Historic encounter PX*1.0*174
 . . Q:$$TESTPAT^VADPT($P($G(^TMP("PXKENC",$J,VSN,"VST",VSN,0)),U,5))  ;Test patient PX*1.0*174
 . . N OE S OE=$O(^SCE("AVSIT",VSN,0)) Q:'OE  Q:$P(^SCE(OE,0),U,6)]""  Q:$P(^SCE(OE,0),U,12)=12  ;Check if a child encounter, non-count  PX*1.0*174
 . . I '$D(^TMP("PXKENC",$J,VSN,"CPT")) D SET("Visit is missing a Procedure Code",1) Q
 . . I $$EXOE^SDCOU2(OE) Q  ;Determine if Encounter is Exempt from Outpatient Classifications and Diagnoses PX*1.0*174
 . . N I,J S (I,CNT)=0 F  S I=$O(^TMP("PXKENC",$J,VSN,"CPT",I)) Q:'I  D
 . . . S CNT=0 F J=5,9,10,11,12,13,14,15 I $P(^TMP("PXKENC",$J,VSN,"CPT",I,0),U,J) S CNT=CNT+1
 . . . I CNT=0 D SET("Procedure: "_$$DISPLYP($P(^TMP("PXKENC",$J,VSN,"CPT",I,0),U))_" missing assoc. DXs",1)
 . . S (I,J)=0 F  S I=$O(^TMP("PXKENC",$J,VSN,"POV",I)) Q:'I  D
 . . . K CLASSIF S DFN=$$GET1^DIQ(9000010,VSN_",",.05,"I")
 . . . I $$AO^SDCO22(DFN) S CLASSIF(1)=""
 . . . I $$IR^SDCO22(DFN) S CLASSIF(2)=""
 . . . I $$SC^SDCO22(DFN) S CLASSIF(3)=""
 . . . I $$EC^SDCO22(DFN) S CLASSIF(4)=""
 . . . I $$MST^SDCO22(DFN) S CLASSIF(5)=""
 . . . I $$HNC^SDCO22(DFN) S CLASSIF(6)=""
 . . . I +$P($$CVEDT^DGCV(DFN,PXDT),"^",3) S CLASSIF(7)=""
 . . . I $D(CLASSIF),'$D(^TMP("PXKENC",$J,VSN,"POV",I,800)) D SET("Diagnosis: "_$$DISPLYDX($P(^TMP("PXKENC",$J,VSN,"POV",I,0),U))_" missing SC/EI",1) Q
 . . . S J="" F  S J=$O(CLASSIF(J)) Q:'J  D
 . . . . N SCEIREC S SCEIREC=$G(^TMP("PXKENC",$J,VSN,"POV",I,800))
 . . . . I J=3&($P(SCEIREC,U,1)="") D SET("Diagnosis: "_$$DISPLYDX($P(^TMP("PXKENC",$J,VSN,"POV",I,0),U))_" missing Service Connect.",1)
 . . . . I J=1&($P(SCEIREC,U,2)="")&($P(SCEIREC,U,1)'=1) D SET("Diagnosis: "_$$DISPLYDX($P(^TMP("PXKENC",$J,VSN,"POV",I,0),U))_" missing Agent Orange",3)
 . . . . I J=2&($P(SCEIREC,U,3)="")&($P(SCEIREC,U,1)'=1) D SET("Diagnosis: "_$$DISPLYDX($P(^TMP("PXKENC",$J,VSN,"POV",I,0),U))_" missing Ion. Rad.",4)
 . . . . I J=4&($P(SCEIREC,U,4)="")&($P(SCEIREC,U,1)'=1) D SET("Diagnosis: "_$$DISPLYDX($P(^TMP("PXKENC",$J,VSN,"POV",I,0),U))_" missing Env. Contam.",5)
 . . . . I J=5&($P(SCEIREC,U,5)="") D SET("Diagnosis: "_$$DISPLYDX($P(^TMP("PXKENC",$J,VSN,"POV",I,0),U))_" missing MST",6)
 . . . . I J=6&($P(SCEIREC,U,6)="") D SET("Diagnosis: "_$$DISPLYDX($P(^TMP("PXKENC",$J,VSN,"POV",I,0),U))_" missing Head/Neck Cancer",6)
 . . . . I J=7&($P(SCEIREC,U,7)="") D SET("Diagnosis: "_$$DISPLYDX($P(^TMP("PXKENC",$J,VSN,"POV",I,0),U))_" missing Combat Vet",2)
 U IO D PRINT,^%ZISC
 K ^TMP("PXCRPW",$J)
EXIT Q
 ;
STOP ;Check for stop task request
 S:$G(ZTQUEUED) (PXOUT,ZTSTOP)=$S($$S^%ZTLOAD:1,1:0)
 Q
 ;
EVAL ;
 S PXLOC=$$GET1^DIQ(9000010,VSN_",",.22)
 S:$G(PXLOC)="" PXLOC="Unknown"
 N PXPTR S PXPTR=$O(^AUPNVPRV("AD",VSN,""))
 S PXPRV=$$GET1^DIQ(9000010.06,PXPTR_",",.01)
 S:$G(PRPRV)="" PXPRV="Unknown"
 Q
 ;
DISPLYDX(PXCEPOV)       ;
 N ICDSTR
 S ICDSTR=$$ICDDX^ICDCODE($P(PXCEPOV,"^"),$P(^AUPNVSIT(VSN,0),"^"))
 Q $P(ICDSTR,"^",2) ;code
 ;
DISPLYP(PXCECPT) ;
 N CPTSTR
 S CPTSTR=$$CPT^ICPTCOD($P(PXCECPT,U),$P(^AUPNVSIT(VSN,0),"^"))
 Q $P(CPTSTR,U,2) ;code
 ;
SET(SDX,PRIO) ;
 N A1
 S PRIO=$G(PRIO)
 D EVAL
 I PXSRT="" S A1="Unknown" D SET1(PRIO) Q
 D @PXSRT
 Q
 ;
1 ; Data Source
 S A1=$$GET1^DIQ(9000010,VSN_",",81203)
 S:A1="" A1=" "
 D SET1(PRIO)
 Q
 ;
2 ; CPT
 N CPT,CPT1
 S CPT=$O(^AUPNVCPT("AD",VSN,""))
 S:CPT'="" CPT1=$$GET1^DIQ(9000010.18,CPT_",",.01)
 S A1=$G(CPT1) D SET1(PRIO)
 Q
 ;
3 ; ICD-9
 N ICD,ICD9 S ICD="",ICD9="Unknown"
 F  S ICD=$O(^AUPNVPOV("AD",VSN,ICD)) Q:'ICD  D
 . S ICD9=$$GET1^DIQ(9000010.07,ICD,.01)
 S A1=ICD9 D SET1(PRIO)
 Q
 ;
4 S A1=$$GET1^DIQ(9000010,VSN_",",.05)
 S:A1="" A1="Unknown"
 D SET1(PRIO)
 Q
 ;
5 ; Eligibility
 S A1=$$GET1^DIQ(9000010,VSN_",",.21)
 S:A1="" A1="Unknown"
 D SET1(PRIO)
 Q
 ;
6 ; Default Sort
 S A1="Default" D SET1(PRIO)
 Q
 ;
SET1(PR) ; set temp global
 I A1="" S A1="Unknown"
 S Y=$$GET1^DIQ(9000010,VSN_",",.01) X ^DD("DD") S VDT=Y
 S:VDT="" VDT="Unknown" S VDT=$P(VDT,"@",1)
 S ^TMP("PXCRPW",$J,PXLOC,PXPRV,A1,VDT,VSN,PR,SDX)=VSN
 Q
PRINT ; Print Report
 N A,I,REC,TOT,TOTE,Y,SHDR
 N PAT,SSN,SSND,TYP,VIN,DEFD,ENCD
 K TOT,TOTE
 S DEFD="TOTAL DEFECTS FOR ",ENCD="TOTAL ENCOUNTERS FOR "
 S (TOT(1),TOTE(1))=0
 S LOC="" F  S LOC=$O(^TMP("PXCRPW",$J,LOC)),HDR=0 Q:LOC=""!(POP)  D
 . S (TOT(2),TOTE(2))=0
 . S PROV="" F  S PROV=$O(^TMP("PXCRPW",$J,LOC,PROV)) Q:PROV=""!(POP)  D
 . . S (TOT(3),TOTE(3))=0
 . . S SORT="" F  S SORT=$O(^TMP("PXCRPW",$J,LOC,PROV,SORT)) Q:SORT=""!(POP)  D
 . . . S (TOT(4),TOTE(4))=0
 . . . S VDT="" F  S VDT=$O(^TMP("PXCRPW",$J,LOC,PROV,SORT,VDT)) Q:VDT=""!(POP)  D
 . . . . S (TOT(5),TOTE(5))=0
 . . . . S VIN="" F  S VIN=$O(^TMP("PXCRPW",$J,LOC,PROV,SORT,VDT,VIN)),HDR1=0 Q:VIN=""!(POP)  D
 . . . . . S TOT(6)=0
 . . . . . S TOTE(5)=TOTE(5)+1
 . . . . . S PR="" F  S PR=$O(^TMP("PXCRPW",$J,LOC,PROV,SORT,VDT,VIN,PR)) Q:PR=""  D
 . . . . . . S SHDR=0
 . . . . . . S SDX="" F  S SDX=$O(^TMP("PXCRPW",$J,LOC,PROV,SORT,VDT,VIN,PR,SDX)) Q:SDX=""!(POP)  D
 . . . . . . . S REC=^TMP("PXCRPW",$J,LOC,PROV,SORT,VDT,VIN,PR,SDX)
 . . . . . . . S PAT=$$GET1^DIQ(9000010,REC_",",.05)
 . . . . . . . S SSN=$$GET1^DIQ(2,$$GET1^DIQ(9000010,REC_",",.05,"I"),.09)
 . . . . . . . S SSND=$E(SSN,1,3)_"-"_$E(SSN,4,5)_"-"_$E(SSN,6,9)
 . . . . . . . S EDT=$$GET1^DIQ(9000010,REC_",",.01)
 . . . . . . . S TYP=$$GET1^DIQ(9000010,REC_",",15001)
 . . . . . . . S USR=$$GET1^DIQ(9000010,REC_",",.23)
 . . . . . . . D:HDR=0 HEADER Q:POP
 . . . . . . . I RPTYP="D" D
 . . . . . . . . I HDR1=0 D
 . . . . . . . . . W ! S $P(HLINE,"-",132)="" W HLINE
 . . . . . . . . . W !,$E(PAT,1,25),?26,SSND,?39,EDT,?59,$E(TYP,1,15),?75,$E(USR,1,15) S HDR1=1
 . . . . . . . . W ?94,$E(SDX,1,37),!
 . . . . . . . S TOT(6)=TOT(6)+1
 . . . . . . . I $Y>(IOSL-4) S HDR=0
 . . . . . . Q:POP
 . . . . . Q:POP
 . . . . . I $Y>(IOSL-4) D HEADER Q:POP
 . . . . . S SHDR=1
 . . . . . W:RPTYP="D" !?94,DEFD_TYP_":  ",TOT(6),!
 . . . . . S TOT(5)=TOT(5)+TOT(6)
 . . . . Q:POP
 . . . . W !?6,DEFD_VDT_":  ",TOT(5)
 . . . . W !?6,ENCD_VDT_":  ",TOTE(5)
 . . . . S TOT(4)=TOT(4)+TOT(5)
 . . . . S TOTE(4)=TOTE(4)+TOTE(5)
 . . . Q:POP
 . . . W !?4,DEFD_"SORT VALUE - "_SORT_": ",TOT(4)
 . . . W !?4,ENCD_"SORT VALUE - "_SORT_": ",TOTE(4)
 . . . S TOT(3)=TOT(3)+TOT(4)
 . . . S TOTE(3)=TOTE(3)+TOTE(4)
 . . Q:POP
 . . W !?2,DEFD_PROV_": ",TOT(3)
 . . W !?2,ENCD_PROV_": ",TOTE(3)
 . . S TOT(2)=TOT(2)+TOT(3)
 . . S TOTE(2)=TOTE(2)+TOTE(3)
 . Q:POP
 . W !,DEFD_LOC_":  ",TOT(2)
 . W !,ENCD_LOC_": ",TOTE(2)
 . S TOT(1)=TOT(1)+TOT(2)
 . S TOTE(1)=TOTE(1)+TOTE(2)
 Q:POP
 I TOT(1)+TOTE(1)=0 W !!,"No Data to print",! Q
 W !!,"GRAND TOTAL NUMBER OF DEFECTS:  ",TOT(1)
 W !,"GRAND TOTAL NUMBER OF ENCOUNTERS = ",TOTE(1)
 Q
 ;
HEADER ;print header
 N %,X,Y,MSG,HLINE,DLINE
 I (PXPAGE>0)&(($E(IOST)="C")&(IO=IO(0))) D
 . S DIR(0)="E"
 . W !
 . D ^DIR K DIR
 I $D(DUOUT)!($D(DTOUT)) D  Q
 . S POP=1
 I PXPAGE>0 W:$D(IOF) @IOF
 S PXPAGE=PXPAGE+1
 W !
 S X=$$CTR132("PCE MISSING DATA REPORT") W !
 D NOW^%DTC S Y=% X ^DD("DD") S X=$$CTR(Y) W !
 S X=$$CTR132("By Clinic, Provider, and Date") W !
 S Y=PX("BDT") X ^DD("DD") S STDT=$P(Y,"@",1)
 S Y=PX("EDT") X ^DD("DD") S ENDT=$P(Y,"@",1)
 S MSG=STDT_" through "_ENDT
 S X=$$CTR(MSG) W !
 S X=$$CTR132("Page "_PXPAGE) W !
 W !!,"Patient",?26,"SSN",?39,"Date/Time",?59,"Enc. ID",?75,"Created by User",?94,"Defect",!
 S $P(HLINE,"=",132)="" W HLINE,!
 Q:SHDR
 W !,LOC
 W !?2,PROV
 N SORTD S SORTD=SORT
 S:SORTD=" " SORTD="Unknown"
 W !?4,"SORT VALUE:  ",$P(SORTHDR,U,PXSRT),"= ",SORTD
 S:VDT="" VDT="Unknown"
 W !?6,$P(VDT,"@",1),":"
 S HDR=1
 Q
 ;
CTR(X) ;
 W ?(IOM-$L(X))\2,X
 Q 1
 ;
CTR132(X) ;
 W ?(132-$L(X))\2,X
 Q 1
 ;
