PRCPRIT1 ;WISC/RFJ-display item (print);28 Jul 91 [1/19/99 4:25pm]
 ;;5.1;IFCAP;;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 Q
 ;
 ;
DQ ;queue comes here
 N %I,D,D0,ITEMDATA,PRCPDA,DATA,DATE,INVNAME,NOW,PAGE,PRCPFLAG,SCREEN,UNIT,X,Y
 D NOW^%DTC S Y=%,DATE=$E(%,1,7) D DD^%DT S NOW=Y,PAGE=1,SCREEN=$$SCRPAUSE^PRCPUREP,INVNAME=$$INVNAME^PRCPUX1(INVPT) U IO D H
 S MASTDATA=$G(^PRC(441,ITEMDA,0)),ITEMDATA=$G(^PRCP(445,INVPT,1,ITEMDA,0))
 W !,$P(MASTDATA,"^",5),?19,$E($$DESCR^PRCPUX1(INVPT,ITEMDA),1,28),?49,"[#",ITEMDA,"]",?59,$E($$GROUPNM^PRCPEGRP(+$P(ITEMDATA,"^",21)),1,20)
 W !?14,"BOC: ",$P($G(^PRCD(420.2,+$P(MASTDATA,"^",10),0)),"^")
 S UNIT=$$UNIT^PRCPUX1(INVPT,ITEMDA," per ") W !?3,"UNIT per ISSUE: ",UNIT
 W !?6,"QTY ON HAND: ",+$P(ITEMDATA,"^",7),?33,"DUE-IN: ",$$GETIN^PRCPUDUE(INVPT,ITEMDA),?60,"DUE-OUT: ",$$GETOUT^PRCPUDUE(INVPT,ITEMDA),!?6,"QTY NON-ISS: ",+$P(ITEMDATA,"^",19)
 I $P(ITEMDATA,"^",26)="Y" W !?19,"** DELETE ITEM WHEN QTY ON HAND REACHES ZERO **"
 W !?6,"TOTAL VALUE: ",$P(ITEMDATA,"^",27)
 W !?5,"NORM STL LVL: ",$P(ITEMDATA,"^",9),?29,"REORDER PT: ",$P(ITEMDATA,"^",10),?55,"INT ORDER PT: ",$P(ITEMDATA,"^",4)
 W !?4,"EMERGENCY LVL: ",$P(ITEMDATA,"^",11),?29,"ISSUE MULT: ",$P(ITEMDATA,"^",25),?54,"MIN ISSUE QTY: ",$P(ITEMDATA,"^",17)
 I $P(ITEMDATA,"^",23) S Y=$P(ITEMDATA,"^",24) D DD^%DT W !?5,"TEMP STK LVL: ",$P(ITEMDATA,"^",23),?29,"UNTIL DATE: ",Y
 S Y=$P(ITEMDATA,"^",3) D DD^%DT W !?8,"LAST COST: ",$P(ITEMDATA,"^",15),?29,"LAST REC'D: ",Y,?55,"AVERAGE COST: ",$P(ITEMDATA,"^",22)
 W !?1,"MAIN STORAGE LOC: ",$$STORELOC^PRCPESTO(+$P(ITEMDATA,"^",6))
 I $O(^PRCP(445,INVPT,1,ITEMDA,5,0)) D
 .   D HS S PRCPDA=0 F  S PRCPDA=$O(^PRCP(445,INVPT,1,ITEMDA,5,PRCPDA)) Q:'PRCPDA!($G(PRCPFLAG))  S DATA=$G(^(PRCPDA,0)) D
 .   .   W ! I $P(ITEMDATA,"^",12)=$P(DATA,"^") W ?3,"m"
 .   .   S Y=$P(DATA,"^"),Y=$S(Y["PRC(440":$P($G(^PRC(440,+Y,0)),"^"),1:$P($G(^PRCP(445,+Y,0)),"^")) S:'+$P(DATA,"^",4) $P(DATA,"^",4)=1
 .   .   W ?5,$E(Y,1,27),?37,"[#",+DATA,"]",?45,$J($P(DATA,"^",4),9),?68,$J($$UNITVAL^PRCPUX1($P(DATA,"^",3),$P(DATA,"^",2)," per "),11)
 .   .   I $Y>(IOSL-5),$O(^PRCP(445,INVPT,1,ITEMDA,5,PRCPDA)) D:SCREEN P^PRCPUREP Q:$G(PRCPFLAG)  D H,HS
 I $G(PRCPFLAG) D Q Q
 I $O(^PRCP(445,INVPT,1,ITEMDA,7,0)) D
 .   I $Y>(IOSL-7) D:SCREEN P^PRCPUREP Q:$G(PRCPFLAG)  D H
 .   D HO S PRCPDA=0 F  S PRCPDA=$O(^PRCP(445,INVPT,1,ITEMDA,7,PRCPDA)) Q:'PRCPDA!($G(PRCPFLAG))  S DATA=$G(^(PRCPDA,0)) D
 .   .   S:'+$P(DATA,"^",5) $P(DATA,"^",5)=1
 .   .   W !?1,$P($G(^PRCS(410,PRCPDA,0)),"^"),?21,$J(+$P(DATA,"^",2),7),?32,$J(UNIT,11),?50,$J($P(DATA,"^",5),5),?57,$J($P(DATA,"^",2)/$P(DATA,"^",5),7),?68,$J($$UNITVAL^PRCPUX1($P(DATA,"^",4),$P(DATA,"^",3)," per "),11)
 .   .   S D0=PRCPDA D STATUS^PRCSES W !?10,"REQUEST STATUS: ",X
 .   .   I $Y>(IOSL-5),$O(^PRCP(445,INVPT,1,ITEMDA,7,PRCPDA)) D:SCREEN P^PRCPUREP Q:$G(PRCPFLAG)  D H,HO
 I $G(PRCPFLAG) D Q Q
 S X1=$E(DATE,1,5)_"01",X2=-180 D C^%DTC S X=$E(X,1,5)
 I $O(^PRCP(445,INVPT,1,ITEMDA,2,X)) D
 .   I $Y>(IOSL-7) D:SCREEN P^PRCPUREP Q:$G(PRCPFLAG)  D H
 .   D HU S PRCPDA=X F  S PRCPDA=$O(^PRCP(445,INVPT,1,ITEMDA,2,PRCPDA)) Q:'PRCPDA!($G(PRCPFLAG))  S DATA=$G(^(PRCPDA,0)) D
 .   .   W !?9,$P("JAN^FEB^MAR^APR^MAY^JUN^JUL^AUG^SEP^OCT^NOV^DEC","^",+$E(PRCPDA,4,5))," ",17+$E(PRCPDA),$E(PRCPDA,2,3),?29,$J($P(DATA,"^",2),15),?47,$J($P(DATA,"^",3),17,3)
 .   .   I $Y>(IOSL-5),$O(^PRCP(445,INVPT,1,ITEMDA,2,PRCPDA)) D:SCREEN P^PRCPUREP Q:$G(PRCPFLAG)  D H,HU
 I $G(PRCPFLAG) D Q Q
 I $O(^PRCP(445,INVPT,1,ITEMDA,3,X_"01")) D
 .   I $Y>(IOSL-7) D:SCREEN P^PRCPUREP Q:$G(PRCPFLAG)  D H
 .   D HR S PRCPDA=X_"01" F  S PRCPDA=$O(^PRCP(445,INVPT,1,ITEMDA,3,PRCPDA)) Q:'PRCPDA!($G(PRCPFLAG))  S DATA=$G(^(PRCPDA,0)) D
 .   .   W !?9,$P("JAN^FEB^MAR^APR^MAY^JUN^JUL^AUG^SEP^OCT^NOV^DEC","^",+$E(PRCPDA,4,5))," ",$E(PRCPDA,6,7),", ",17+$E(PRCPDA),$E(PRCPDA,2,3),?29,$J($P(DATA,"^",2),13)
 .   .   I $Y>(IOSL-5),$O(^PRCP(445,INVPT,1,ITEMDA,3,PRCPDA)) D:SCREEN P^PRCPUREP Q:$G(PRCPFLAG)  D H,HR
 I '$G(PRCPFLAG) D END^PRCPUREP
Q D ^%ZISC Q
 ;
 ;
H S %=NOW_"  PAGE: "_PAGE,PAGE=PAGE+1 I PAGE'=2!(SCREEN) W @IOF
 W $C(13),"DISPLAY ITEM REPORT FOR ",INVNAME,?(80-$L(%)),%
 S %="",$P(%,"-",81)="" W !,"NSN",?19,"DESCRIPTION",?49,"[#MI]",?59,"GROUP : DESCRIPTION",!,%
 Q
 ;
 ;
HS ;header for procurement sources
 W !?15,"-----POSSIBLE SOURCES (m=MANDATORY SOURCE)-----",!?5,"VENDOR",?37,"[#V]",?45,"CONV FACT",?68,"UNIT per REC"
 Q
 ;
 ;
HO ;header for outstanding transactions
 W !?22,"-----OUTSTANDING TRANSACTIONS-----",!?1,"TRANSACTION NO.     QTY ORD in UNIT per ISS  CONV FACT  QTY REC in UNIT per REC"
 Q
 ;
 ;
HU ;header for usage
 W !?24,"-----USAGE/ISSUES HISTORY-----",!?9,"DATE USED/ISSUED    QTY USED/ISSUED    COST USED/ISSUED"
 Q
 ;
 ;
HR ;header for receipts
 W !?26,"-----RECEIPTS HISTORY-----",!?9,"DATE RECEIVED        QTY RECEIVED"
 Q
