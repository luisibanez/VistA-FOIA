PRCPRIIP ;WISC/RFJ-inactive items report (primary, second)          ;10 Aug 93
 ;;5.1;IFCAP;;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 Q
 ;
 ;
PRIMARY ;  inactive items report for primary and secondary
 N DATEINAC,GROUPALL,X,Y
 K X S X(1)="The Inactive Items Report will print items which have no receipts or issues after a specified cutoff date.  The report is sorted by group category and description."
 D DISPLAY^PRCPUX2(40,79,.X)
 K X S X(1)="Select the Group Categories to display" D DISPLAY^PRCPUX2(2,40,.X)
 D GROUPSEL^PRCPURS1(PRCP("I"))
 I '$G(GROUPALL),'$O(^TMP($J,"PRCPURS1","YES",0)) W !,"*** NO GROUP CATEGORIES SELECTED !" D Q Q
 W !,"NOTE:  The report will",$S('$G(GROUPALL):" NOT",1:"")," include items not stored in a group category."
 K X S X(1)="Enter the Inactivity cutoff date." D DISPLAY^PRCPUX2(2,40,.X)
 S X1=DT,X2=-90 D C^%DTC S Y=$E(X,1,5)_"00" D DD^%DT
 S %DT(0)=-($E(DT,1,5)_"00"),%DT="AEP",%DT("B")=Y,%DT("A")="Enter Inactivity Cutoff MONTH and YEAR: " D ^%DT K %DT I Y<1 Q
 S DATEINAC=$E(Y,1,5)_"00"
 W ! S %ZIS="Q" D ^%ZIS Q:POP  I $D(IO("Q")) D  D ^%ZTLOAD K IO("Q"),ZTSK Q
 .   S ZTDESC="Inactive Item Report",ZTRTN="DQ^PRCPRIIP"
 .   S ZTSAVE("PRCP*")="",ZTSAVE("GROUP*")="",ZTSAVE("DATEINAC")="",ZTSAVE("^TMP($J,""PRCPURS1"",")="",ZTSAVE("ZTREQ")="@"
 W !!,"<*> please wait <*>"
DQ ;  queue starts here
 N %,%I,D,DATEFROM,DESCR,DUEOUT,GROUP,GROUPNM,ITEMDA,NOW,PAGE,PRCPFLAG,QTY,RECPT,SCREEN,TOTAL,TOTDAYS,USAGE,X,Y
 K ^TMP($J,"PRCPRIIP")
 S ITEMDA=0 F  S ITEMDA=$O(^PRCP(445,PRCP("I"),1,ITEMDA)) Q:'ITEMDA  S D=$G(^(ITEMDA,0)) I D'="" D
 .   ;  if reusable quit
 .   I $$REUSABLE^PRCPU441(ITEMDA) Q
 .   S QTY=$P(D,"^",7)+$P(D,"^",19) I 'QTY Q
 .   S GROUP=+$P(D,"^",21)
 .   I 'GROUP,'$G(GROUPALL) Q
 .   I $G(GROUPALL),$D(^TMP($J,"PRCPURS1","NO",GROUP)) Q
 .   I '$G(GROUPALL),'$D(^TMP($J,"PRCPURS1","YES",GROUP)) Q
 .   S GROUPNM=$$GROUPNM^PRCPEGRP(GROUP)
 .   I GROUPNM'="" S GROUPNM=$E(GROUPNM,1,20)_" (#"_GROUP_")"
 .   S:GROUPNM="" GROUPNM=" "
 .   S DESCR=$$DESCR^PRCPUX1(PRCP("I"),ITEMDA) S:DESCR="" DESCR=" "
 .   I $O(^PRCP(445,PRCP("I"),1,ITEMDA,2,$E(DATEINAC,1,5)-.01))!($O(^PRCP(445,PRCP("I"),1,ITEMDA,3,DATEINAC))) Q
 .   ;  find last usage date
 .   S (USAGE,X)=0 F  S X=$O(^PRCP(445,PRCP("I"),1,ITEMDA,2,X)) Q:'X  S USAGE=X
 .   S USAGE=$S('USAGE:"",1:$E(USAGE,4,5)_"/"_$E(USAGE,2,3))
 .   ;  find last receipt date
 .   S (RECPT,X)=0 F  S X=$O(^PRCP(445,PRCP("I"),1,ITEMDA,3,X)) Q:'X  S RECPT=X
 .   S RECPT=$S('RECPT:"",1:$E(RECPT,4,5)_"/"_$E(RECPT,6,7)_"/"_$E(RECPT,2,3))
 .   S DUEOUT=$$GETOUT^PRCPUDUE(PRCP("I"),ITEMDA) I 'DUEOUT S DUEOUT=""
 .   S ^TMP($J,"PRCPRIIP",GROUPNM,$E(DESCR,1,15),ITEMDA)=USAGE_"^"_RECPT_"^"_DUEOUT_"^"_QTY_"^"_$P(D,"^",27)_"^"_$S($P(D,"^",26)="Y":"*",1:"")
 ;  print report
 S X1=DT,X2=DATEINAC D ^%DTC S TOTDAYS=X
 S Y=DATEINAC D DD^%DT S DATEFROM=Y
 D NOW^%DTC S Y=% D DD^%DT S NOW=Y,PAGE=1,SCREEN=$$SCRPAUSE^PRCPUREP U IO D H
 S TOTAL=0,GROUP="" F  S GROUP=$O(^TMP($J,"PRCPRIIP",GROUP)) Q:GROUP=""!($G(PRCPFLAG))  D
 .   I $G(ZTQUEUED),$$S^%ZTLOAD S PRCPFLAG=1 W !?10,"<<< TASKMANAGER JOB TERMINATED BY USER >>>" Q
 .   I $Y>(IOSL-6) D:SCREEN P^PRCPUREP Q:$D(PRCPFLAG)  D H
 .   W !!?5,"GROUP: ",$S(GROUP=" ":"<<NONE>>",1:GROUP)
 .   S DESCR="" F  S DESCR=$O(^TMP($J,"PRCPRIIP",GROUP,DESCR)) Q:DESCR=""!($G(PRCPFLAG))  S ITEMDA=0 F  S ITEMDA=$O(^TMP($J,"PRCPRIIP",GROUP,DESCR,ITEMDA)) Q:'ITEMDA!($G(PRCPFLAG))  S D=^(ITEMDA) D
 .   .   W !,$E($$DESCR^PRCPUX1(PRCP("I"),ITEMDA),1,35),?36,ITEMDA
 .   .   W ?42,$J($P(D,"^"),5),$J($P(D,"^",2),10),$J($P(D,"^",3),6),$J($P(D,"^",4),7),$J($P(D,"^",5),8,2),$J($P(D,"^",6),2)
 .   .   S TOTAL=TOTAL+$P(D,"^",5)
 .   .   I $Y>(IOSL-4) D:SCREEN P^PRCPUREP Q:$D(PRCPFLAG)  D H
 I '$G(PRCPFLAG),$Y>(IOSL-3) D:SCREEN P^PRCPUREP I '$G(PRCPFLAG) D H
 I $G(PRCPFLAG) D Q Q
 W !!?30,"TOTAL INACTIVE ITEM VALUE IN STOCK: ",$J(TOTAL,12,2)
 D END^PRCPUREP
Q D ^%ZISC K ^TMP($J,"PRCPRIIP"),^TMP($J,"PRCPURS1")
 Q
 ;
 ;
H S %=NOW_"  PAGE "_PAGE,PAGE=PAGE+1 I PAGE'=2!(SCREEN) W @IOF
 W $C(13),"INACTIVE ITEM REPORT FOR: ",$E(PRCP("IN"),1,20),?(80-$L(%)),%
 S %="",$P(%,"-",81)=""
 W !?5,"INACTIVE ITEMS RANGE FROM ",DATEFROM,"  TO  ",$P(NOW,"@"),"  (",TOTDAYS," DAYS)",?79,"K"
 W !?42,$J("LAST",5),$J("LAST",10),$J("DUE",6),$J("QTY",7),$J("TOTAL",8),$J("W",2),!,"DESCRIPTION",?36,"MI",?42,$J("USAGE",5),$J("RECEIPT",10),$J("OUT",6),$J("ONHND",7),$J("VALUE",8),$J("Z",2),!,%
 Q
