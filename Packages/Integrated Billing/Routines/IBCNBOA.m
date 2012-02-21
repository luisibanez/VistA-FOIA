IBCNBOA ;ALB/ARH-Ins Buffer: Activity Report ;1 Jun 97
 ;;2.0;INTEGRATED BILLING;**82**;21-MAR-94
 ;
EN ;get parameters then run the report
 ;
 K ^TMP($J) D HOME^%ZIS S IBHDR="INSURANCE BUFFER ACTIVITY REPORT" W @IOF,!!,?25,IBHDR
 W !!,"This report contains the counts and time statistics for all activity in the",!,"Insurance Buffer.",!!
 ;
 S IBBEG=$$DATES^IBCNBOE("Beginning") G:'IBBEG EXIT
 S IBEND=$$DATES^IBCNBOE("Ending",IBBEG) G:'IBEND EXIT  W !!
 ;
 S IBMONTH=$$MONTH^IBCNBOE G:IBMONTH="" EXIT  W !!
 ;
DEV ;get the device
 S %ZIS="QM",%ZIS("A")="OUTPUT DEVICE: " D ^%ZIS G:POP EXIT
 I $D(IO("Q")) S ZTRTN="RPT^IBCNBOA",ZTDESC=IBHDR,ZTSAVE("IB*")="" D ^%ZTLOAD K IO("Q") G EXIT
 U IO
 ;
RPT ; run report
 S IBQUIT=0
 ;
 D SEARCH(IBBEG,IBEND,IBMONTH) G:IBQUIT EXIT
 D PRINT(IBBEG,IBEND)
 ;
EXIT K ^TMP($J),IBHDR,IBBEG,IBEND,IBMONTH,IBQUIT
 Q:$D(ZTQUEUED)
 D ^%ZISC
 Q
 ;
SEARCH(IBBEG,IBEND,IBMONTH) ; search/sort statistics for activity report
 N IBXST,IBXDT,IBBUFDA,IBB0,IBSTAT,IBTIME,IBS3,IBDATE,IBVER,IBDT2 S IBQUIT=""
 S IBBEG=$G(IBBEG)-.01,IBEND=$S('$G(IBEND):9999999,1:$P(IBEND,".")+.9)
 ;
 S IBXST="" F  S IBXST=$O(^IBA(355.33,"AFST",IBXST)) Q:IBXST=""  D   Q:IBQUIT
 . S IBXDT=+IBBEG F  S IBXDT=$O(^IBA(355.33,"AFST",IBXST,IBXDT)) Q:'IBXDT!(IBXDT>IBEND)  D  S IBQUIT=$$STOP Q:IBQUIT
 .. S IBBUFDA=0 F  S IBBUFDA=$O(^IBA(355.33,"AFST",IBXST,IBXDT,IBBUFDA)) Q:'IBBUFDA  D
 ... ;
 ... S IBB0=$G(^IBA(355.33,IBBUFDA,0)),IBSTAT=$P(IBB0,U,4),IBVER=$P(IBB0,U,10)
 ... ;
 ... ; entered
 ... I IBXST="E" S IBDATE=+IBB0 I +IBDATE,IBDATE>IBBEG,IBDATE<IBEND D
 .... S IBDT2=+$P(IBB0,U,10) I 'IBDT2 S IBDT2=+$P(IBB0,U,5) I 'IBDT2 S IBDT2=$$NOW^XLFDT
 .... S IBTIME=+$$FMDIFF^XLFDT(IBDT2,IBDATE,2),IBSTAT="ENTERED",IBS3=1
 .... I +$G(IBMONTH) D SET(IBSTAT,$E(IBDATE,1,5),IBS3,IBTIME,IBB0)
 .... D SET(IBSTAT,99999,IBS3,IBTIME,IBB0)
 ... ;
 ... ; verified
 ... I IBXST="V" S IBDATE=+$P(IBB0,U,10) I +IBDATE,IBDATE>IBBEG,IBDATE<IBEND D
 .... S IBTIME=+$$FMDIFF^XLFDT(IBDATE,+IBB0,2),IBSTAT="VERIFIED",IBS3=2
 .... I +$G(IBMONTH) D SET(IBSTAT,$E(IBDATE,1,5),IBS3,IBTIME,IBB0)
 .... D SET(IBSTAT,99999,IBS3,IBTIME,IBB0)
 ... ;
 ... ; processed
 ... I IBXST="A"!(IBXST="R") S IBDATE=+$P(IBB0,U,5) I +IBDATE,IBDATE>IBBEG,IBDATE<IBEND D
 .... S IBDT2=+IBVER I 'IBVER S IBDT2=+IBB0
 .... S IBTIME=+$$FMDIFF^XLFDT(IBDATE,+IBDT2,2),IBSTAT="UNKNOWN",IBS3=6
 .... I $P(IBB0,U,4)="A" S IBS3=3,IBSTAT="ACCEPTED" I 'IBVER S IBS3=4,IBSTAT=IBSTAT_" (&V)"
 .... I $P(IBB0,U,4)="R" S IBS3=5,IBSTAT="REJECTED" I +IBVER S IBS3=6,IBSTAT=IBSTAT_" (V)"
 .... I +$G(IBMONTH) D SET(IBSTAT,$E(IBDATE,1,5),IBS3,IBTIME,IBB0)
 .... D SET(IBSTAT,99999,IBS3,IBTIME,IBB0)
 ;
 Q
 ;
SET(STAT,S1,S3,TIME,IBB0) ;
 D TMP("IBCNBOA",S1,1,S3,TIME,STAT)
 I S3<3 D TMP("IBCNBOA",S1,2,1,TIME,"NOT PROCESSED")
 I S3>2 D TMP("IBCNBOA",S1,2,2,TIME,"PROCESSED")
 D TMP("IBCNBOA",S1,2,9,TIME,"TOTAL")
 ;
 Q:$E(STAT)'="A"
 ;
 D TMP1("IBCNBOAC",S1,+$P(IBB0,U,7),+$P(IBB0,U,8),+$P(IBB0,U,9))
 Q
 ;
TMP(XREF,S1,S2,S3,TIME,NAME) ;
 S ^TMP($J,XREF,S1,S2,S3)=NAME
 S ^TMP($J,XREF,S1,S2,S3,"CNT")=$G(^TMP($J,XREF,S1,S2,S3,"CNT"))+1
 S ^TMP($J,XREF,S1,S2,S3,"TM")=$G(^TMP($J,XREF,S1,S2,S3,"TM"))+TIME
 I '$G(^TMP($J,XREF,S1,S2,S3,"HG"))!($G(^TMP($J,XREF,S1,S2,S3,"HG"))<TIME) S ^TMP($J,XREF,S1,S2,S3,"HG")=TIME
 I '$G(^TMP($J,XREF,S1,S2,S3,"LS"))!($G(^TMP($J,XREF,S1,S2,S3,"LS"))>TIME) S ^TMP($J,XREF,S1,S2,S3,"LS")=TIME
 Q
 ;
TMP1(XREF,S1,IC,GC,PC) ;
 I +IC S ^TMP($J,XREF,S1,"I")=$G(^TMP($J,XREF,S1,"I"))+1
 I +GC S ^TMP($J,XREF,S1,"G")=$G(^TMP($J,XREF,S1,"G"))+1
 I +PC S ^TMP($J,XREF,S1,"P")=$G(^TMP($J,XREF,S1,"P"))+1
 S ^TMP($J,XREF,S1,"CNT")=$G(^TMP($J,XREF,S1,"CNT"))+1
 Q
 ;
 ;
 ;
PRINT(IBBEG,IBEND) ;
 N IBXREF,IBLABLE,IBS1,IBS2,IBS3,IBINS,IBGRP,IBPOL,IBCNT,IBIP,IBGP,IBPP,IBRDT,IBPGN,IBRANGE,IBLN,IBI
 ;
 S IBRANGE=$$FMTE^XLFDT(+IBBEG)_" - "_$$FMTE^XLFDT(IBEND)
 S IBRDT=$$FMTE^XLFDT($J($$NOW^XLFDT,0,4),2),IBRDT=$TR(IBRDT,"@"," "),IBPGN=0
 D HDR
 ;
 S IBXREF="IBCNBOA",IBS1="" F  S IBS1=$O(^TMP($J,IBXREF,IBS1)) Q:IBS1=""  D:IBLN>(IOSL-17) HDR Q:IBQUIT  D  S IBLN=IBLN+7
 . S IBLABLE=$S(IBS1=99999:"TOTALS",($E(IBBEG,1,5)<IBS1)&($E(IBEND,1,5)>IBS1):$$FMTE^XLFDT(IBS1_"00"),1:"")
 . I IBLABLE="" S IBLABLE=$$FMTE^XLFDT($S($E(IBBEG,1,5)<IBS1:IBS1_1,1:IBBEG))_" - "_$$FMTE^XLFDT($S($E(IBEND,1,5)>IBS1:$$SCH^XLFDT("1M(L)",IBS1_11),1:IBEND))
 . W !,?(40-($L(IBLABLE)/2)),IBLABLE,!
 . W !,?43,"AVERAGE",?56,"LONGEST",?68,"SHORTEST"
 . W !,"STATUS",?22,"COUNT",?30,"PERCENT",?43,"# DAYS",?56,"# DAYS",?68,"# DAYS"
 . ;
 . S IBS2=0 F  S IBS2=$O(^TMP($J,IBXREF,IBS1,IBS2)) Q:IBS2=""  D  S IBLN=IBLN+1
 .. W !,"-----------------------------------------------------------------------------"
 .. S IBS3="" F  S IBS3=$O(^TMP($J,IBXREF,IBS1,IBS2,IBS3)) Q:'IBS3  D PRTLN  S IBLN=IBLN+1
 . ;
 . S IBINS=+$G(^TMP($J,"IBCNBOAC",IBS1,"I")),IBGRP=+$G(^TMP($J,"IBCNBOAC",IBS1,"G"))
 . S IBPOL=+$G(^TMP($J,"IBCNBOAC",IBS1,"P")),IBCNT=+$G(^TMP($J,"IBCNBOAC",IBS1,"CNT"))
 . S (IBIP,IBGP,IBPP)=0 I IBCNT'=0 S IBIP=((IBINS/IBCNT)*100)\1,IBGP=((IBGRP/IBCNT)*100)\1,IBPP=((IBPOL/IBCNT)*100)\1
 . W !!,?2,IBINS," New Compan",$S(IBINS=1:"y",1:"ies")," (",IBIP,"%), "
 . W IBGRP," New Group/Plan",$S(IBGRP=1:"",1:"s")," (",IBGP,"%), "
 . W IBPOL," New Patient Polic",$S(IBPOL=1:"y",1:"ies")," (",IBPP,"%)",!
 Q
 ;
PRTLN ;
 N IBSTX,IBCNT,IBTM,IBHG,IBLS,IBTCNT
 ;
 S IBSTX=$G(^TMP($J,IBXREF,IBS1,IBS2,IBS3))
 S IBCNT=$G(^TMP($J,IBXREF,IBS1,IBS2,IBS3,"CNT")) Q:'IBCNT
 S IBTM=$G(^TMP($J,IBXREF,IBS1,IBS2,IBS3,"TM"))
 S IBHG=$G(^TMP($J,IBXREF,IBS1,IBS2,IBS3,"HG"))
 S IBLS=$G(^TMP($J,IBXREF,IBS1,IBS2,IBS3,"LS"))
 S IBTCNT=$G(^TMP($J,IBXREF,IBS1,2,9,"CNT")) Q:'IBTCNT
 ;
 W !,IBSTX,?20,$J($FN(IBCNT,","),7),?30,$J(((IBCNT/IBTCNT)*100),6,1),"%",?43,$J($$STD((IBTM/IBCNT)),6,1),?56,$J($$STD(IBHG),6,1),?68,$J($$STD(IBLS),6,1)
 Q
 ;
STD(SEC) ; convert seconds to days
 N IBX,IBD,IBS,IBH,DAYS S DAYS="" G:'$G(SEC) STDQ
 S IBD=(SEC/86400),IBD=+$P(IBD,".")
 S IBS=SEC-(IBD*86400)
 S IBH=((IBS/60)/60),IBH=+$J(IBH,0,2)
 S DAYS=IBD+(IBH/24)
STDQ Q DAYS
 ;
HDR ;print the report header
 S IBQUIT=$$STOP Q:IBQUIT
 I IBPGN>0 S IBQUIT=$$PAUSE Q:IBQUIT
 S IBPGN=IBPGN+1,IBLN=4 I IBPGN>1!($E(IOST,1,2)["C-") W @IOF
 W !,"INSURANCE BUFFER ACTIVITY REPORT   ",IBRANGE," "
 W ?(IOM-22),IBRDT,?(IOM-7)," PAGE ",IBPGN,!
 S IBI="",$P(IBI,"-",IOM+1)="" W IBI,!
 Q
 ;
PAUSE() ;pause at end of screen if beeing displayed on a terminal
 N IBX,DIR,DIRUT,X,Y S IBX=0
 I $E(IOST,1,2)["C-" W !! S DIR(0)="E" D ^DIR K DIR I $D(DUOUT)!($D(DIRUT)) S IBX=1
 Q IBX
 ;
STOP() ;determine if user has requested the queued report to stop
 I $D(ZTQUEUED),$$S^%ZTLOAD S ZTSTOP=1 K ZTREQ I +$G(IBPGN) W !,"***TASK STOPPED BY USER***"
 Q +$G(ZTSTOP)
