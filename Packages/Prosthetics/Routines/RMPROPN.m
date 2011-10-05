RMPROPN ;PHX/RFM,JLT-LISTS OPEN 1358 TRANSACTIONS ;8/29/1994
 ;;3.0;PROSTHETICS;**77**;Feb 09, 1996
 ;RVD 3/17/03 patch #77 - allow queing to p-message.  IO to ION
 W !,"This report lists open purchasing transactions created in the"
 W !,"Prosthetic Package.  It will not include manual transactions done"
 W !,"in the IFCAP 1358 module.",!
START K ^TMP($J) D DIV4^RMPRSIT G:$D(X) EX S RMPRCOUN=0 D HOME^%ZIS W !! S %DT("A")="Starting Date: ",%DT="AEPX" D ^%DT S RMPRBDT=Y G:Y<0 EX
 S %DT("A")="Ending Date: ",%DT="AEX" D ^%DT G:Y<0 EX I RMPRBDT>Y W !,$C(7),"Invalid Date Range Selection!!" G START
 S RMPREDT=Y,Y=RMPRBDT D DD^%DT S RMPRX=Y,Y=RMPREDT D DD^%DT S RMPRY=Y
 S %ZIS="MQ" K IOP D ^%ZIS G:POP EX
 I '$D(IO("Q")) U IO G PRINT
 S ZTDESC="OPEN 1358 TRANSACTIONS",ZTRTN="PRINT^RMPROPN",ZTIO=ION,ZTSAVE("RMPRBDT")="",ZTSAVE("RMPREDT")="",ZTSAVE("RMPRX")="",ZTSAVE("RMPRY")="",ZTSAVE("RMPR(""STA"")")=""
 D ^%ZTLOAD W:$D(ZTSK) !,"REQUEST QUEUED!" H 1 G EX
PRINT S X1=RMPRBDT,X2=-1 D C^%DTC S RO=X,RP=0,PAGE=1,RMPRCOUN=0,RMPREND="" I IOST["C-" D WAIT^DICD
 F  S RO=$O(^RMPR(664,"B",RO)) Q:RO'>0  Q:RO>RMPREDT  F  S RP=$O(^RMPR(664,"B",RO,RP)) Q:RP'>0  D CK
 S (RP,RMPROBL)="" F  S RMPROBL=$O(^TMP($J,RMPROBL)) Q:RMPROBL'>0  Q:RMPREND=1  F  S RP=$O(^TMP($J,RMPROBL,RP)) Q:RP'>0  Q:RMPREND=1  D WRI
 I $D(RMPREDT)&(RMPRCOUN=0) W @IOF D HDR W $C(7),!!,"NO SELECTIONS MADE DURING THIS DATE RANGE!!"
 I $D(RMPREDT),RMPRCOUN>0,RMPREND'=1 W !!?32,"END OF REPORT" H 1
EXIT I $E(IOST)["C"&($Y<20) F  W ! Q:$Y>20
 I $D(RMPREDT),'$D(DTOUT),'$D(DUOUT),$E(IOST)["C",'$D(RMPRFLL),RMPREND'=1 S DIR(0)="E" D ^DIR
EX K RMPREND,RMPROBL,RMPRFLL,RMPRFLG,DUOUT,DIR,RO,RP,RMPRY,RMPRCOUN,RMPRX,RMPRBDT,RMPREDT,RMPRCK,%DT,X,Y,PAGE,IT,ZTSK,^TMP($J) D ^%ZISC
 Q
CK Q:'$D(^RMPR(664,RP,0))  Q:$P(^(0),U,4)=""!($P(^(0),U,7)="")!($P(^(0),U,5)'="")!($P(^(0),U,8)'="")  Q:$P(^(0),U,14)'=""&($P(^(0),U,14)'=RMPR("STA"))  S RMPROBL=$P(^(0),U,3),^TMP($J,RMPROBL,RP)="",RMPRCOUN=RMPRCOUN+1
 Q
WRI I '$D(RMPRFLG) D HDR W !,"PATIENT NAME",?14,"SSN",?20,"OBLIGATION",?33,"REQUEST DATE",?48,"VENDOR",?62,"ITEM",?70,"ITEM COST"
 W !,$E($P(^DPT($P(^RMPR(664,RP,0),U,2),0),U,1),1,12),?14,$E($P(^DPT($P(^RMPR(664,RP,0),U,2),0),U,9),6,9),?20,$P($P(^RMPR(664,RP,0),U,7),"-",2,99)
 S Y=$P(^RMPR(664,RP,0),U,1) D DD^%DT S Y=$E(Y,1,12) W ?33,Y,?47 W:+$P(^RMPR(664,RP,0),U,4) $E($P(^PRC(440,$P(^RMPR(664,RP,0),U,4),0),U,1),1,12) D ITE
 Q
ITE I '$D(^RMPR(664,RP,1))&($P(^RMPR(664,RP,0),U,12)) W ?61,"*DELIVERY",?71,$J($FN($P(^RMPR(660,$P(^RMPR(664,RP,0),U,12),0),U,16),"P",2),9) S RMPRFLG=1 D:$Y>(IOSL-6) HDR Q
 I $P(^RMPR(664,RP,0),U,12)'="" W ?61,"*SHIPPING",?71,$J($FN($P(^RMPR(660,$P(^RMPR(664,RP,0),U,12),0),U,17),"P",2),9),!
 S (IT)=0
 F  S IT=$O(^RMPR(664,RP,1,IT)) Q:IT'>0!($D(DUOUT))!($D(DTOUT))  W:IT>1 ! W ?61,$E($P(^PRC(441,$P(^RMPR(661,$P(^RMPR(664,RP,1,IT,0),U,1),0),U,1),0),U,2),1,10) Q:$P(^RMPR(664,RP,1,IT,0),U,13)=""  D COST
 Q
COST W ?71,$J($FN($P(^RMPR(660,$P(^RMPR(664,RP,1,IT,0),U,13),0),U,16),"P",2),9) S RMPRFLG=1
 I $E(IOST)["C"&($Y>(IOSL-6)) W ! S DIR(0)="E" D ^DIR S:Y<1 RMPREND=1 Q:Y=""  S:Y<1 RMPRFLL=1 Q:Y<1  S:$D(DTOUT) RMPREND=1 Q:$D(DTOUT)  D HDR Q
 I $Y>(IOSL-6) K RMPRFLG
 Q
HDR I PAGE'=1!($E(IOST)["C") W @IOF
 W !,"FROM: ",RMPRX_"-",RMPRY,?34,"OPEN 1358 TRANSACTIONS"_"     "_"STA "_$$STA^RMPRUTIL,?72,"PAGE ",PAGE,! S PAGE=PAGE+1 Q