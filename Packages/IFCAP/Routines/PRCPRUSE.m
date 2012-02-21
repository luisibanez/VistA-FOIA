PRCPRUSE ;WISC/RFJ,DWA-usage demand item report  ;18 Sep 91
V ;;5.1;IFCAP;**1,27,84**;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 D ^PRCPUSEL Q:'$G(PRCP("I"))
 ;
 N DATEEND,DATEENDD,DATESTRD,DATESTRT,DIR,GROUPALL,PRCPALLI,PRCPEND,PRCPSTRT,TOTALDAY,X,X1,X2,Y
 ;
 K X S X(1)="The Usage Demand Item Report will show the quantity of items used within a specified date period."
 D DISPLAY^PRCPUX2(40,79,.X)
 ;
 K X S X(1)="Select the date range which should be used for displaying the usage.        *** Select by month & year only. ***"
 D DISPLAY^PRCPUX2(2,40,.X)
 D MONTHSEL^PRCPURS2
 I '$G(DATEEND) Q
 ;
 S X1=DATEEND,X2=DATESTRT D ^%DTC S TOTALDAY=X+1
 S Y=DATEEND D DD^%DT
 S DATEENDD=Y,Y=DATESTRT D DD^%DT
 S DATESTRD=Y
 W !?5,"-- TOTAL NUMBER OF DAYS: ",TOTALDAY
 ;
 ;  item(s)
 K X S X(1)="Select the items to display."
 D DISPLAY^PRCPUX2(2,40,.X)
 D ITEMSEL^PRCPURS4
 I '$G(PRCPALLI),'$O(^TMP($J,"PRCPURS4","")) Q
 I '$G(PRCPALLI) D  G SORT
 .   S GROUPALL=1
 ;
 ;  whse sort
 I PRCP("DPTYPE")="W" D  I '$D(PRCPSTRT) Q
 .   K X S X(1)="Select the range of NSNs to display" D DISPLAY^PRCPUX2(2,40,.X)
 .   D NSNSEL^PRCPURS0
 ;
 ;  prim/seco sort
 I PRCP("DPTYPE")'="W" D  I '$G(GROUPALL),'$O(^TMP($J,"PRCPURS1","YES",0)) W !,"*** NO GROUP CATEGORIES SELECTED !" Q
 .   K X S X(1)="Select the Group Categories to display" D DISPLAY^PRCPUX2(2,40,.X)
 .   D GROUPSEL^PRCPURS1(PRCP("I"))
 ;
SORT K X S X(1)="Select the order in which you want the item information to appear."
 D DISPLAY^PRCPUX2(2,40,.X)
 S DIR(0)="S^1:ITEM DESCRIPTION;2:ITEM NUMBER"
 S DIR("A")="Sort by"
 S DIR("B")="ITEM DESCRIPTION"
 D ^DIR K DIR
 I Y'=1,Y'=2 Q
 S PRCPSORT=+Y
 ;
QUEUE S %ZIS="Q" D ^%ZIS Q:POP  I $D(IO("Q")) D  Q
 .   S ZTDESC="Usage Demand Item Report",ZTRTN="DQ^PRCPRUSE"
 .   S ZTSAVE("^TMP($J,""PRCPURS4"",")="",ZTSAVE("^TMP($J,""PRCPURS1"",")=""
 .   S ZTSAVE("DATE*")="",ZTSAVE("GROUP*")="",ZTSAVE("PRCP*")="",ZTSAVE("TOTALDAY")="",ZTSAVE("ZTREQ")="@"
 .   D ^%ZTLOAD
 W !!,"<*> please wait <*>"
 ;
DQ ;  queue starts here
 N %,%H,%I,COLUMN,DATA,DATE,DESCR,GROUP,GROUPNM,ITEMDA,MONYR,NOW,NSN,PAGE,PRCPFLAG,SCREEN,TOTCOST,TOTUSED,TTOTCOST,TTOTUSED,VALUE,X,Y
 K ^TMP($J,"PRCPRUSE")
 S ITEMDA=0
 I $G(PRCPALLI) F  S ITEMDA=$O(^PRCP(445,PRCP("I"),1,ITEMDA)) Q:'ITEMDA  S DATA=$G(^(ITEMDA,0)) I DATA'="" D
 .   S DESCR=$$DESCR^PRCPUX1(PRCP("I"),ITEMDA)
 .   S VALUE=DESCR_"^"_$$UNIT^PRCPUX1(PRCP("I"),ITEMDA,"/")_"^"_$P(DATA,"^",15)_"^"_$P(DATA,"^",22)_"^"_($P(DATA,"^",7)+$P(DATA,"^",19))
 .   ;
 .   ;  sort for whse
 .   I PRCP("DPTYPE")="W" D  Q
 .   .   S NSN=$$NSN^PRCPUX1(ITEMDA) S:NSN="" NSN=" "
 .   .   I $E(NSN,1,$L(PRCPSTRT))'=PRCPSTRT,$E(NSN,1,$L(PRCPEND))'=PRCPEND I NSN']PRCPSTRT!(PRCPEND']NSN) Q
 .   .   I PRCPSORT=1 S ^TMP($J,"PRCPRUSE",NSN,$E(DESCR,1,15),ITEMDA)=VALUE
 .   .   I PRCPSORT=2 S ^TMP($J,"PRCPRUSE",NSN,$E("000000000",$L(ITEMDA)+1,9)_ITEMDA,ITEMDA)=VALUE
 .   ;
 .   ;  sort for primary and secondary
 .   S GROUP=+$P(DATA,"^",21)
 .   I 'GROUP,'$G(GROUPALL) Q
 .   I $G(GROUPALL),$D(^TMP($J,"PRCPURS1","NO",GROUP)) Q
 .   I '$G(GROUPALL),'$D(^TMP($J,"PRCPURS1","YES",GROUP)) Q
 .   S GROUPNM=$$GROUPNM^PRCPEGRP(GROUP)
 .   I GROUPNM'="" S GROUPNM=$E(GROUPNM,1,20)_" (#"_GROUP_")"
 .   S:GROUPNM="" GROUPNM=" "
 .   I PRCPSORT=1 S ^TMP($J,"PRCPRUSE",GROUPNM,$E(DESCR,1,15),ITEMDA)=VALUE
 .   I PRCPSORT=2 S ^TMP($J,"PRCPRUSE",GROUPNM,$E("000000000",$L(ITEMDA)+1,9)_ITEMDA,ITEMDA)=VALUE
 ;
 I '$G(PRCPALLI) F  S ITEMDA=$O(^TMP($J,"PRCPURS4",ITEMDA)) Q:'ITEMDA  S DATA=$G(^PRCP(445,PRCP("I"),1,ITEMDA,0)) I DATA'="" D
 .   S DESCR=$$DESCR^PRCPUX1(PRCP("I"),ITEMDA)
 .   S VALUE=DESCR_"^"_$$UNIT^PRCPUX1(PRCP("I"),ITEMDA,"/")_"^"_$P(DATA,"^",15)_"^"_$P(DATA,"^",22)_"^"_($P(DATA,"^",7)+$P(DATA,"^",19))
 .   ;
 .   ;  sort for whse
 .   I PRCP("DPTYPE")="W" D  Q
 .   .   S NSN=$$NSN^PRCPUX1(ITEMDA) S:NSN="" NSN=" "
 .   .   I PRCPSORT=1 S ^TMP($J,"PRCPRUSE",NSN,$E(DESCR,1,15),ITEMDA)=VALUE
 .   .   I PRCPSORT=2 S ^TMP($J,"PRCPRUSE",NSN,$E("000000000",$L(ITEMDA)+1,9)_ITEMDA,ITEMDA)=VALUE
 .   ;
 .   ;  sort for primary and secondary
 .   S GROUP=+$P(DATA,"^",21)
 .   I 'GROUP,'$G(GROUPALL) Q
 .   I $G(GROUPALL),$D(^TMP($J,"PRCPURS1","NO",GROUP)) Q
 .   I '$G(GROUPALL),'$D(^TMP($J,"PRCPURS1","YES",GROUP)) Q
 .   S GROUPNM=$$GROUPNM^PRCPEGRP(GROUP)
 .   I GROUPNM'="" S GROUPNM=$E(GROUPNM,1,20)_" (#"_GROUP_")"
 .   S:GROUPNM="" GROUPNM=" "
 .   I PRCPSORT=1 S ^TMP($J,"PRCPRUSE",GROUPNM,$E(DESCR,1,15),ITEMDA)=VALUE
 .   I PRCPSORT=2 S ^TMP($J,"PRCPRUSE",GROUPNM,$E("000000000",$L(ITEMDA)+1,9)_ITEMDA,ITEMDA)=VALUE
 ;
 D PRINT^PRCPRUSP
 Q
