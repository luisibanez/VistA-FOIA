IBCOPR ;WISC/RFJ,BOISE/WRL-print dollar amts for pre-registration ; 05 May 97  8:30 AM [5/9/97 3:17pm]
 ;;Version 2.0 ; INTEGRATED BILLING ;**75**; 21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
 W !!,"This report will sort through insurance policies in the patient file"
 W !,"and print patients, bills, and payments with an insurance policy source"
 W !,"of information equal to pre-registration."
 ;
 N DATEEND,DATESTRT,IBCNFSUM
 ;
 ;  select date range
 W ! D DATESEL I '$G(DATEEND) Q
 ;
 S IBCNFSUM=$$SUMMARY I 'IBCNFSUM Q
 ;
 W !!,"Since this report has to loop through all patients and check all insurance"
 W !,"policies, it is recommended this report be queued."
 ;
 ;  select device
 W ! S %ZIS="Q" D ^%ZIS Q:POP
 I $D(IO("Q")) D  D ^%ZTLOAD K IO("Q"),ZTSK Q
 .   S ZTDESC="Pre-Registration Source Report",ZTRTN="DQ^IBCOPR"
 .   S ZTSAVE("DATE*")="",ZTSAVE("IBCN*")="",ZTSAVE("ZTREQ")="@"
 ;
 W !!,"<*> please wait <*>"
 ;
DQ ;  report (queue) starts here
 N AMOUNT,BILLNUM,CANCEL,CLASS,COUNTNEW,DA,DATA,DATE,DFN,INSCO,PAYMTAMT,PAYMTCNT,TOTALAMT,TOTALCNT,TRANDA,VA,Y
 K ^TMP($J,"IBCOPR")
 S COUNTNEW=0
 ;
 ;  build list of patients using source
 S INSCO=0 F  S INSCO=$O(^DPT("AB",INSCO)) Q:'INSCO  D
 .   S DFN=0 F  S DFN=$O(^DPT("AB",INSCO,DFN)) Q:'DFN  D
 .   .   S DA=0 F  S DA=$O(^DPT("AB",INSCO,DFN,DA)) Q:'DA  D
 .   .   .   S DATA=$G(^DPT(DFN,.312,DA,1))
 .   .   .   S DATE=$P($P(DATA,"^",10),".")
 .   .   .   ;
 .   .   .   ;  check source of information (4=pre-registration)
 .   .   .   I $P(DATA,"^",9)'=4 Q
 .   .   .   ;
 .   .   .   ;  build list of all patients
 .   .   .   D PID^VADPT
 .   .   .   S Y=$P(DATE,".") D DD^%DT
 .   .   .   S ^TMP($J,"IBCOPR","ALL",DFN,INSCO)=$P($G(^DPT(DFN,0)),"^")_"^"_$G(VA("BID"))_"^"_Y
 .   .   .   ;
 .   .   .   ;  check date of source of information
 .   .   .   I DATE<DATESTRT!(DATE>DATEEND) Q
 .   .   .   ;
 .   .   .   ;  build list of patients match during select date range
 .   .   .   S COUNTNEW=COUNTNEW+1
 .   .   .   S ^TMP($J,"IBCOPR","NEW",DFN,INSCO)=""
 ;
 ;  get charges and payments
 S DFN=0 F  S DFN=$O(^TMP($J,"IBCOPR","ALL",DFN)) Q:'DFN  D
 .   S INSCO=0 F  S INSCO=$O(^TMP($J,"IBCOPR","ALL",DFN,INSCO)) Q:'INSCO  D
 .   .   S DA=0 F  S DA=$O(^DGCR(399,"AE",DFN,INSCO,DA)) Q:'DA  D
 .   .   .   ;  date first printed, bill classification
 .   .   .   S DATE=$P($P($G(^DGCR(399,DA,"S")),"^",12),".")
 .   .   .   S CLASS=$P($G(^DGCR(399,DA,0)),"^",5)
 .   .   .   ;
 .   .   .   ;  check for 1 or 2 inpatient, 3 or 4 outpatient
 .   .   .   S CLASS=$S(CLASS<3:1,1:3)
 .   .   .   ;
 .   .   .   ;  bill canceled
 .   .   .   S CANCEL="" I $P($G(^DGCR(399,DA,"S")),"^",16)=1 S CANCEL="*"
 .   .   .   S BILLNUM=$P($G(^DGCR(399,DA,0)),"^")
 .   .   .   S AMOUNT=+$$ORI^PRCAFN(DA) I AMOUNT'>0 Q
 .   .   .   ;
 .   .   .   I DATE'<DATESTRT,DATE'>DATEEND D
 .   .   .   .   S ^TMP($J,"IBCOPR","BILL",CLASS,DATE,DA)=DFN_"^"_INSCO_"^"_CANCEL_"^"_BILLNUM_"^"_AMOUNT
 .   .   .   .   I CANCEL="" S TOTALCNT(CLASS)=$G(TOTALCNT(CLASS))+1,TOTALAMT(CLASS)=$G(TOTALAMT(CLASS))+AMOUNT
 .   .   .   ;
 .   .   .   ;  get payments
 .   .   .   S TRANDA=0 F  S TRANDA=$O(^PRCA(433,"C",DA,TRANDA)) Q:'TRANDA  D
 .   .   .   .   S DATA=$G(^PRCA(433,TRANDA,1))
 .   .   .   .   ;  transaction type 2 and 34 are payments
 .   .   .   .   I $P(DATA,"^",2)'=2,$P(DATA,"^",2)'=34 Q
 .   .   .   .   S DATE=$P($P(DATA,"^",9),".")
 .   .   .   .   I DATE<DATESTRT!(DATE>DATEEND) Q
 .   .   .   .   I '$P($G(^PRCA(433,TRANDA,0)),"^",4) Q
 .   .   .   .   S AMOUNT=$P($G(^PRCA(433,TRANDA,3)),"^")
 .   .   .   .   S ^TMP($J,"IBCOPR","TRAN",CLASS,DATE,DA)=DFN_"^"_INSCO_"^"_CANCEL_"^"_TRANDA_"^"_$P(DATA,"^",2)_"^"_AMOUNT
 .   .   .   .   I CANCEL="" S PAYMTCNT(CLASS)=$G(PAYMTCNT(CLASS))+1,PAYMTAMT(CLASS)=$G(PAYMTAMT(CLASS))+AMOUNT
 ;
 D PRINT^IBCOPR1
 ;
 D ^%ZISC
 K ^TMP($J,"IBCOPR")
 Q
 ;
 ;
DATESEL ;  select starting and ending dates in days
 ;  returns datestrt and dateend
 N %,%DT,%H,%I,DEFAULT,X,Y
 K DATEEND,DATESTRT
START S Y=$E(DT,1,5)_"01" D DD^%DT S DEFAULT=Y
 S %DT("A")="Start with Date: ",%DT("B")=DEFAULT,%DT="AEP",%DT(0)=-DT D ^%DT I Y<0 Q
 I $E(Y,6,7)="00" S Y=$E(Y,1,5)_"01"
 S DATESTRT=Y
 S Y=DT D DD^%DT S DEFAULT=Y
 S %DT("A")="  End with Date: ",%DT("B")=DEFAULT,%DT="AEP",%DT(0)=-DT D ^%DT I Y<0 Q
 I $E(Y,6,7)="00" S Y=$E(Y,1,5)_"01"
 I Y<DATESTRT W !,"END DATE MUST BE GREATER THAN OR EQUAL TO THE START DATE.",! G START
 S DATEEND=Y,Y=DATESTRT D DD^%DT
 W !?5,"***  Selected date range from ",Y," to " S Y=DATEEND D DD^%DT W Y,"  ***"
 Q
 ;
 ;
SUMMARY() ;  ask to print detailed or summary report
 N DIR,DIRUT,X,Y
 S DIR(0)="SOA^D:detailed;S:summary;",DIR("B")="summary"
 S DIR("A")="Type of report to print: "
 W ! D ^DIR
 I $D(DIRUT) Q 0
 Q $S(Y="S":1,Y="D":2,1:0)
