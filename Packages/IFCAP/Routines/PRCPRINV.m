PRCPRINV ;WISC/RFJ/DGL-inventory control parameters report ; 7/21/99 9:32am
V ;;5.1;IFCAP;;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 D ^PRCPUSEL Q:'$G(PRCP("I"))
 N PRCPINPT,X
 I "WP"[PRCP("DPTYPE") W !!,"--Press RETURN to print parameters for ",PRCP("IN"),"--" S PRCPINPT=$$TO^PRCPUDPT(PRCP("I")) I PRCPINPT["^" Q
 I '$G(PRCPINPT) S PRCPINPT=PRCP("I")
 W !!,"Print control parameters for ",$$INVNAME^PRCPUX1(PRCPINPT),!
 S %ZIS="Q" D ^%ZIS Q:POP  I $D(IO("Q")) D  D ^%ZTLOAD K IO("Q"),ZTSK Q
 .   S ZTDESC="Inventory Parameters",ZTRTN="DQ^PRCPRINV"
 .   S ZTSAVE("PRCP*")="",ZTSAVE("ZTREQ")="@"
 W !!,"<*> please wait <*>"
DQ ;  queue starts here
 N %,%I,DATA,DISTR,FCP,NOW,PAGE,PRCPFLAG,PRCPNAME,PRCPTYPE,SCREEN,SECT,STATION,USER,X,Y
 S DATA=$G(^PRCP(445,PRCPINPT,0)),PRCPNAME=$P(DATA,"^"),PRCPTYPE=$P(DATA,"^",3)
 D NOW^%DTC S Y=% D DD^%DT S NOW=Y,PAGE=1,SCREEN=$$SCRPAUSE^PRCPUREP U IO D H
 W !!,"TYPE OF INVENTORY POINT",?30,": ",$S(PRCPTYPE="W":"SUPPLY WAREHOUSE",PRCPTYPE="P":"PRIMARY",PRCPTYPE="S":"SECONDARY",1:"<<NOT DEFINED>>")
 W !,"ABBREVIATED NAME",?30,": ",$P(DATA,"^",5)
 I PRCPTYPE="W"!(PRCPTYPE="P") W !,"COST CENTER",?30,": ",$E($P($G(^PRCD(420.1,+$P(DATA,"^",7),0)),"^"),1,48)
 W !,"KEEP PERPETUAL INVENTORY",?30,": ",$S($P(DATA,"^",2)="Y":"YES",1:"NO")
 W !,"KEEP TRANSACTION/USAGE HISTORY",?30,": ",$S($P(DATA,"^",6)="Y":"YES",1:"NO")
 I $Y>(IOSL-7) D:SCREEN P^PRCPUREP G:$D(PRCPFLAG) Q D H
 I PRCPTYPE="P" D
 .   W !,"PRIMARY UPDATED BY WAREHOUSE",?30,": ",$S($P(DATA,"^",16)="N":"NO",1:"YES")
 .   W !,"SPECIAL INVENTORY POINT TYPE",?30,": ",$S($P(DATA,"^",20)="D":"DRUG ACCOUNTABILITY",$P(DATA,"^",20)="S":"SPD",1:"")
 .   I $P(DATA,"^",20)="S" W !,"SPD PICKING TICKET PRINTER: ",$P($G(^PRCP(445,PRCPINPT,"DEV")),"^")
 .   W !,"ISSUE BOOK SORT",?30,": ",$S($P(DATA,"^",10)="A":"ALPHA SORT",$P(DATA,"^",10)="N":"NSN SORT",1:"")
 .   W !,"REGULAR WHSE ISSUES SCHEDULE",?30,": ",$S($P(DATA,"^",4)="W":"WEEKLY",$P(DATA,"^",4)=2:"EVERY 2 WEEKS",$P(DATA,"^",4)="M":"MONTHLY",$P(DATA,"^",4)="O":"OTHER",1:"")
 .   W !,"DEPARTMENT NUMBER",?30,": ",$P(DATA,"^",8)
 W !,"MONTHS INACTIVE ITEM DELETION",?30,": ",$P(DATA,"^",13)
 W !,"TOTAL NUMBER OF ITEMS STORED",?30,": ",+$P($G(^PRCP(445,PRCPINPT,1,0)),"^",4)
 I $Y>(IOSL-6) D:SCREEN P^PRCPUREP G:$D(PRCPFLAG) Q D H
 I PRCPTYPE="W"!(PRCPTYPE="P") D
 .   W !!,"FUND CONTROL POINTS",?30,": "
 .   S STATION=0 F  S STATION=$O(^PRC(420,"AE",STATION)) Q:'STATION!($G(PRCPFLAG))  S FCP=0 F  S FCP=$O(^PRC(420,"AE",STATION,PRCPINPT,FCP)) Q:'FCP!($G(PRCPFLAG))  D
 .   .   W $P($G(^PRC(420,STATION,1,FCP,0)),"^")
 .   .   I $Y>(IOSL-6) D:SCREEN P^PRCPUREP Q:$D(PRCPFLAG)  D H
 .   .   W !?32
 I $G(PRCPFLAG) D Q Q
 I $Y>(IOSL-6) D:SCREEN P^PRCPUREP G:$D(PRCPFLAG) Q D H
 I PRCPTYPE="S"!(PRCPTYPE="P") D
 .   W !!,"MIS COSTING SECTION",?30,": "
 .   S SECT=0 F  S SECT=$O(^PRCP(445,PRCPINPT,3,SECT)) Q:'SECT!($G(PRCPFLAG))  D
 .   .   S %=$G(^PRCP(445,PRCPINPT,3,SECT,0))
 .   .   W $E($P($G(^DIC(49,+$P(%,"^"),0)),"^"),1,30),?64,$J($P(%,"^",2),5)," %"
 .   .   I $Y>(IOSL-6) D:SCREEN P^PRCPUREP Q:$D(PRCPFLAG)  D H
 .   .   W !?32
 I $G(PRCPFLAG) D Q Q
 I $Y>(IOSL-6) D:SCREEN P^PRCPUREP G:$D(PRCPFLAG) Q D H
 W !!,"INVENTORY USERS",?30,": "
 S USER=0 F  S USER=$O(^PRCP(445,PRCPINPT,4,USER)) Q:'USER!($G(PRCPFLAG))  D
 .   W $E($$USER^PRCPUREP(USER),1,30)
 .   I $$KEY^PRCPUREP("PRCP"_$S(PRCPTYPE="P":"",PRCPTYPE="W":"W",PRCPTYPE="S":"2",1:"?")_" MGRKEY",USER) W ?64,"**MANAGER**"
 .   I $Y>(IOSL-6) D:SCREEN P^PRCPUREP Q:$D(PRCPFLAG)  D H
 .   W !?32
 I $G(PRCPFLAG) D Q Q
 I $Y>(IOSL-6) D:SCREEN P^PRCPUREP G:$D(PRCPFLAG) Q D H
 I PRCPTYPE="W"!(PRCPTYPE="P") D
 .   W !!,"DISTRIBUTION POINTS",?30,": "
 .   S DISTR=0 F  S DISTR=$O(^PRCP(445,PRCPINPT,2,DISTR)) Q:'DISTR!($G(PRCPFLAG))  D
 .   .   S %=$P($G(^PRCP(445,DISTR,0)),"^",3)
 .   .   W $$INVNAME^PRCPUX1(DISTR),?64,$S(%="W":"SUPPLY WAREHOUSE",%="P":"PRIMARY",%="S":"SECONDARY",1:"<<NOT DEFINED>>")
 .   .   I $Y>(IOSL-6) D:SCREEN P^PRCPUREP Q:$D(PRCPFLAG)  D H
 .   .   W !?32
 I '$G(PRCPFLAG) D END^PRCPUREP
Q D ^%ZISC
 Q
 ;
 ;
H S %=NOW_"  PAGE "_PAGE,PAGE=PAGE+1 I PAGE'=2!(SCREEN) W @IOF
 W $C(13),"INVENTORY PARAMETERS FOR: ",$E(PRCPNAME,1,20),?(80-$L(%)),%
 S %="",$P(%,"-",81)=""
 W !,%
 Q
