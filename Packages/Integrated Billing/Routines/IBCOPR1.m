IBCOPR1 ;WISC/RFJ,BOISE/WRL-print dollar amts for pre-registration ; 05 May 97  8:34 AM
 ;;Version 2.0 ; INTEGRATED BILLING ;**75**; 21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 Q
 ;
 ;
PRINT ;  print report
 N %,%H,%I,DATA,DATEDIS1,DATEDIS2,DFN,IBCNFLAG,IBCNLINE,INSCO,NOW,PAGE,SCREEN,X,Y
 ;
 S Y=$P(DATESTRT,".") D DD^%DT S DATEDIS1=Y
 S Y=$P(DATEEND,".") D DD^%DT S DATEDIS2=Y
 D NOW^%DTC S Y=% D DD^%DT S NOW=Y
 S PAGE=1,IBCNLINE="",$P(IBCNLINE,"-",81)=""
 S SCREEN=0 I '$D(ZTQUEUED),IO=IO(0),$E(IOST)="C" S SCREEN=1
 U IO D H
 ;
 ;  show list of new patients for source
 I IBCNFSUM=2 D H1 S DFN=0 F  S DFN=$O(^TMP($J,"IBCOPR","NEW",DFN)) Q:'DFN!($G(IBCNFLAG))  D
 .   S INSCO=0 F  S INSCO=$O(^TMP($J,"IBCOPR","NEW",DFN,INSCO)) Q:'INSCO!($G(IBCNFLAG))  D
 .   .   S DATA=^TMP($J,"IBCOPR","ALL",DFN,INSCO)
 .   .   W !,$E($P(DATA,"^"),1,25),?27,$P(DATA,"^",2),?34,$E($P($G(^DIC(36,INSCO,0)),"^"),1,30),?68,$P(DATA,"^",3)
 .   .   I $Y>(IOSL-5) D:SCREEN PAUSE Q:$G(IBCNFLAG)  D H,H1
 ;
 I $G(IBCNFLAG) Q
 I $Y>(IOSL-5) D:SCREEN PAUSE Q:$G(IBCNFLAG)  D H
 ;
 W !,"    TOTAL NEW POLICIES IDENTIFIED WITH PRE-REGISTRATION: ",COUNTNEW,!
 ;
 ;  *** INPATIENT ***
 ;  show list of new inpatient bills
 I $G(IBCNFSUM)=2 D BILL(1)
 I $G(IBCNFLAG) Q
 I $Y>(IOSL-5) D:SCREEN PAUSE Q:$G(IBCNFLAG)  D H
 ;
 W !,"    TOTAL INPATIENT BILLS COUNT: ",$G(TOTALCNT(1)),?44,"AMOUNT: ",$J($FN(+$G(TOTALAMT(1)),",",2),12),!
 I $G(IBCNFLAG) Q
 I $Y>(IOSL-5) D:SCREEN PAUSE Q:$G(IBCNFLAG)  D H
 ;
 ;  show list of inpatient transactions
 I $G(IBCNFSUM)=2 D TRAN(1)
 I $G(IBCNFLAG) Q
 I $Y>(IOSL-5) D:SCREEN PAUSE Q:$G(IBCNFLAG)  D H
 ;
 W !,"    TOTAL INPATIENT PAYMENT COUNT: ",$G(PAYMTCNT(1)),?44,"AMOUNT: ",$J($FN(+$G(PAYMTAMT(1)),",",2),12),!
 ;
 ;  *** OUTPATIENT ***
 ;  show list of new outpatient bills
 I $G(IBCNFSUM)=2 D BILL(3)
 I $G(IBCNFLAG) Q
 I $Y>(IOSL-5) D:SCREEN PAUSE Q:$G(IBCNFLAG)  D H
 ;
 W !,"    TOTAL OUTPATIENT BILLS COUNT: ",$G(TOTALCNT(3)),?44,"AMOUNT: ",$J($FN(+$G(TOTALAMT(3)),",",2),12),!
 I $G(IBCNFLAG) Q
 I $Y>(IOSL-5) D:SCREEN PAUSE Q:$G(IBCNFLAG)  D H
 ;
 ;  show list of outpatient transactions
 I $G(IBCNFSUM)=2 D TRAN(3)
 I $G(IBCNFLAG) Q
 I $Y>(IOSL-5) D:SCREEN PAUSE Q:$G(IBCNFLAG)  D H
 ;
 W !,"    TOTAL OUTPATIENT PAYMENT COUNT: ",$G(PAYMTCNT(3)),?44,"AMOUNT: ",$J($FN(+$G(PAYMTAMT(3)),",",2),12),!
 Q
 ;
 ;
 ;
BILL(CLASS) ;  print bills where class=1 inpatient, class=3 outpatient
 N CANCEL,DA,DATE,DATA,DATA1,Y
 D H2
 S DATE=0 F  S DATE=$O(^TMP($J,"IBCOPR","BILL",CLASS,DATE)) Q:'DATE!($G(IBCNFLAG))  D
 .   S DA=0 F  S DA=$O(^TMP($J,"IBCOPR","BILL",CLASS,DATE,DA)) Q:'DA!($G(IBCNFLAG))  D
 .   .   ;  data1 = dfn ^ insco ^ cancel ^ bill number ^ amount
 .   .   S DATA1=$G(^TMP($J,"IBCOPR","BILL",CLASS,DATE,DA))
 .   .   S DATA=$G(^TMP($J,"IBCOPR","ALL",+$P(DATA1,"^"),$P(DATA1,"^",2)))
 .   .   S Y=DATE D DD^%DT
 .   .   W !,$E($P(DATA,"^"),1,25),?27,$P(DATA,"^",2),?33,$P(DATA1,"^",3),?34,$P(DATA1,"^",4),?54,$J($FN(+$P(DATA1,"^",5),",",2),10),?68,Y
 .   .   I $P(DATA1,"^",3)'="" S CANCEL=1
 .   .   I $Y>(IOSL-5) D:SCREEN PAUSE Q:$G(IBCNFLAG)  D H,H2
 I $G(IBCNFLAG) Q
 I $G(CANCEL) W !,"    * Next to bill indicates bill is canceled and not used in totals"
 Q
 ;
 ;
TRAN(CLASS) ;  print transaction where class=1 inpatient, class=3 outpatient
 N CANCEL,DA,DATE,DATA,DATA1,TYPE,Y
 D H3
 S DATE=0 F  S DATE=$O(^TMP($J,"IBCOPR","TRAN",CLASS,DATE)) Q:'DATE!($G(IBCNFLAG))  D
 .   S DA=0 F  S DA=$O(^TMP($J,"IBCOPR","TRAN",CLASS,DATE,DA)) Q:'DA!($G(IBCNFLAG))  D
 .   .   ;  data1 = dfn ^ insco ^ cancel ^ trans # ^ type ^ amount 
 .   .   S DATA1=$G(^TMP($J,"IBCOPR","TRAN",CLASS,DATE,DA))
 .   .   S DATA=$G(^TMP($J,"IBCOPR","ALL",+$P(DATA1,"^"),$P(DATA1,"^",2)))
 .   .   S Y=DATE D DD^%DT
 .   .   S TYPE=$P(DATA1,"^",5),TYPE=$S(TYPE=34:"FULL",1:"PART")
 .   .   W !,$E($P(DATA,"^"),1,25),?27,$P(DATA,"^",2),?33,$P(DATA1,"^",3),?34,$P(DATA1,"^",4),?46,TYPE,?54,$J($FN(+$P(DATA1,"^",6),",",2),10),?68,Y
 .   .   I $P(DATA1,"^",3)'="" S CANCEL=1
 .   .   I $Y>(IOSL-5) D:SCREEN PAUSE Q:$G(IBCNFLAG)  D H,H3
 I $G(IBCNFLAG) Q
 I $G(CANCEL) W !,"    * Next to payment indicates payment is canceled and not used in totals"
 Q
 ;
 ;
PAUSE ;  pause at end of page
 N X U IO(0) W !,"Press RETURN to continue, '^' to exit:" R X:DTIME
 S:'$T X="^" S:X["^" IBCNFLAG=1 U IO
 Q
 ;
 ;
H ;  header
 S %=NOW_"  PAGE "_PAGE,PAGE=PAGE+1 I PAGE'=2!(SCREEN) W @IOF
 W $C(13),"PRE-REGISTRATION SOURCE REPORT",?(80-$L(%)),%
 W !,"  FOR THE DATE RANGE: ",DATEDIS1,"  TO  ",DATEDIS2,?65,$J("TYPE: "_$S(IBCNFSUM=1:"SUMMARY",1:"DETAILED"),15)
 W !,IBCNLINE
 Q
 ;
 ;
H1 ;  header for patient list
 W !,$E($TR(IBCNLINE,"-","."),1,22)," Patient Source = Pre-Registration ",$E($TR(IBCNLINE,"-","."),1,23)
 W !,"Patient Name",?27,"SSN",?34,"Insurance Company",?68,"Source Date"
 W !,$TR(IBCNLINE,"-",".")
 Q
 ;
 ;
H2 ;  header for bill list
 W !,$E($TR(IBCNLINE,"-","."),1,27)," ",$S(CLASS=1:" Inpatient",1:"Outpatient")," Bills Entered ",$E($TR(IBCNLINE,"-","."),1,27)
 W !,"Patient Name",?27,"SSN",?34,"Bill Number",?54,$J("Amount",10),?68,"Bill Date"
 W !,$TR(IBCNLINE,"-",".")
 Q
 ;
 ;
H3 ;  header for transaction list
 W !,$E($TR(IBCNLINE,"-","."),1,24)," ",$S(CLASS=1:" Inpatient",1:"Outpatient")," Payments Collected ",$E($TR(IBCNLINE,"-","."),1,25)
 W !,"Patient Name",?27,"SSN",?34,"Tran Number",?46,"Type",?54,$J("Amount",10),?68,"Bill Date"
 W !,$TR(IBCNLINE,"-",".")
 Q
