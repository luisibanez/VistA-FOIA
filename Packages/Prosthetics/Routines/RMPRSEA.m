RMPRSEA ;PHX/RFM-SEARCH FILE 660 ENTRIES FOR RECALLED ITEM ;8/29/1994
 ;;3.0;PROSTHETICS;**77,90**;Feb 09, 1996
 ;RVD 3/17/03 patch #77 - allow queing to p-message.  IO to ION
 ;HNC 10/29/04 #90 - ITEM to BILLING ITEM
 D HOME^%ZIS,DIV4^RMPRSIT G:$D(X) EXIT S RMPRCOUN=0,RMPREND="" W !! S %DT("A")="Beginning Date: ",%DT="AEPX" D ^%DT S RMPRBDT=Y G:Y<0 EXIT
ENDATE S %DT("A")="Ending Date: ",%DT="AEX" D ^%DT G:Y<0 EXIT I RMPRBDT>Y W !,$C(7),"Invalid Date Range Selection!!" G ENDATE
 G:Y<0 EXIT S RMPREDT=Y,Y=RMPRBDT D DD^%DT S RMPRX=Y,Y=RMPREDT D DD^%DT S RMPRY=Y
 K DIR S DIR(0)="S^1:Search by Serial Number or Lot Number;2:Search by Billing Item;" D ^DIR G:$D(DIRUT) EXIT S GOTO=$S(Y=1:"SERIAL",Y=2:"ITEM") D @GOTO G:$D(DIRUT) EXIT1
 S %ZIS="MQ" K IOP D ^%ZIS G:POP EXIT
 I '$D(IO("Q")) U IO G PRINT
 S ZTDESC="SEARCH FOR RECALLED ITEM",ZTRTN="PRINT^RMPRSEA",ZTIO=ION,ZTSAVE("RMPRBDT")="",ZTSAVE("RMPREDT")="",ZTSAVE("RMPRSE")="",ZTSAVE("RMPRX")="",ZTSAVE("RMPRY")="",ZTSAVE("GOTO")="",ZTSAVE("RMPR(""STA"")")=""
 D ^%ZTLOAD W:$D(ZTSK) !,"REQUEST QUEUED!" H 1 G EXIT
PRINT S X1=RMPRBDT,X2=-1 D C^%DTC S RO=X,RP=0,PAGE=1,RMPRCOUN=0,RMPREND="" I $E(IOST)["C" D WAIT^DICD
PRI F J=0:0 S RO=$O(^RMPR(660,"B",RO)) Q:RO'>0!(RO>RMPREDT)  Q:RMPREND=1  F K=0:0 S RP=$O(^RMPR(660,"B",RO,RP)) Q:RP'>0  Q:RMPREND=1  D CK G:$D(DUOUT) EXIT
 I $D(RMPREDT),'POP,'RMPRCOUN W @IOF D HEAD W $C(7),!!,"NO SELECTIONS MADE DURING THIS DATE RANGE!!"
 I RMPRCOUN,$D(RMPREDT),RMPREND'=1 W !!?32,"END OF REPORT"
EXIT I IOST["C-"&($Y<22) F  W ! Q:$Y>20
 I $D(RMPREDT),IOST["C-",'$D(RMPRFLL),RMPREND'=1,'$D(DUOUT),'$D(DTOUT) K DIR S DIR(0)="E" D ^DIR
EXIT1 K GOTO,DIC,DIR,DIRUT,DTOUT,DUOUT,RMPREND,PAGE,RMPRFLL,RAUT,RPAT,LI,RO,RMPRCOUN,RMPRSE,RMPRBDT,RMPREDT,RMPRX,RMPRY,RP,Y,K,X,J D ^%ZISC
 Q
CK Q:'$D(^RMPR(660,RP,0))  Q:$P(^(0),U,4)="X"!('$P(^(0),U,6))  Q:'$D(^PRC(441,$P(^RMPR(661,+$P(^(0),U,6),0),U)))
 I GOTO["SERIAL",$P(^RMPR(660,RP,0),U,11)[RMPRSE!($P(^(0),U,24)[RMPRSE) D CON
 I GOTO["ITEM",RMPRSE=$P(^PRC(441,$P(^RMPR(661,$P(^RMPR(660,RP,0),U,6),0),U),0),U) D CON
 Q
CON I $Y>(IOSL-6),PAGE=1,'RMPRCOUN W @IOF
 D HEAD S RMPRCOUN=RMPRCOUN+1
 S Y=$P(^RMPR(660,RP,0),U,3) D DD^%DT W !,Y,?15,$E($P(^DPT($P(^RMPR(660,RP,0),U,2),0),U,1),1,13),?30,$E($P(^DPT($P(^RMPR(660,RP,0),U,2),0),U,9),6,9),?36,$E($P(^PRC(441,$P(^RMPR(661,$P(^RMPR(660,RP,0),U,6),0),U,1),0),U,2),1,17)
 W:$P(^RMPR(660,RP,0),U,9)'="" ?55,$E($P(^PRC(440,$P(^RMPR(660,RP,0),U,9),0),U,1),1,25)
 W !,"LOT NBR:",?10,$P(^RMPR(660,RP,0),U,24),?25,"SERIAL NBR:",?37,$P(^RMPR(660,RP,0),U,11),!
 I IOST["C-"&($Y>(IOSL-6)) S DUOUT=1,DIR(0)="E" D ^DIR S:Y="" RMPREND=1 Q:Y=""  S:Y<1 RMPRFLL=1 Q:Y<1  K DIR W @IOF D HEAD Q
 I $Y>(IOSL-6) W @IOF D HEAD
 Q
HEAD I $Y<2 W !,?10,"RECALLED ITEM REPORT" S Y=RMPRBDT D DD^%DT W ?39,Y_"-" S Y=RMPREDT D DD^%DT W Y_"  "_"STA ",$$STA^RMPRUTIL_"  "_"PAGE ",PAGE,!,"REQUEST DATE",?15,"PATIENT NAME",?30,"SSN",?36,"ITEM",?55,"VENDOR",! S PAGE=PAGE+1 Q
 Q
AUT ;AUTOMOTIVE EQUIPMENT SEARCH
 S RMPRCOUN=0,RMPREND="" W !! S %DT("A")="Beginning Date: ",%DT="AEPX" D ^%DT S RMPRBDT=Y G:Y<0 EXIT
 S %DT("A")="Ending Date: ",%DT="AEX" D ^%DT G:Y<0 EXIT I RMPRBDT>Y W !,$C(7),"Invalid Date Range Selection!!" G AUT
 G:Y<0 EXIT S RMPREDT=Y,Y=RMPREDT D DD^%DT S RMPRX=Y,Y=RMPREDT D DD^%DT S RMPRY=Y
 S DIR(0)="F^1:20^K:$E(X)="" "" X",DIR("A")="Enter Serial Number" D ^DIR G:$D(DIRUT) EXIT S RMPRSE=X K DIR
 S %ZIS="MQ" K IOP D ^%ZIS G:POP EXIT
 I '$D(IO("Q")) U IO G PRINTA
 K IO("Q") S ZTDESC="SEARCH FOR RECALLED AUTO ITEM",ZTRTN="PRINTA^RMPRSEA",ZTIO=ION,ZTSAVE("RMPRBDT")="",ZTSAVE("RMPREDT")="",ZTSAVE("RMPRSE")="",ZTSAVE("RMPRX")="",ZTSAVE("RMPRY")="" D ^%ZTLOAD G EXIT
PRINTA S X1=RMPRBDT,X2=-1 D C^%DTC S RO=X,RP=0,RMPRCOUN=0,PAGE=1,RMPREND="" D HDR
 F J=0:0 S RO=$O(^RMPR(667.3,"B",RO)) Q:RO'>0  Q:RO>RMPREDT  Q:RMPREND=1  F K=0:0 S RP=$O(^RMPR(667.3,"B",RO,RP)) Q:RP'>0  Q:RMPREND=1  D CK1 G:$D(DUOUT) EXIT
 I RMPRCOUN=0 W !!,"NO SELECTION MADE DURING THIS DATE RANGE!!"
 G EXIT
CK1 Q:'$D(^RMPR(667.3,RP,0))  G:$P(^RMPR(667.3,RP,0),U,6)[RMPRSE INF
 Q
INF S RMPRCOUN=RMPRCOUN+1,Y=$P(^RMPR(667.3,RP,0),U,1) S RAUT=^(0),RPAT=$P(^RMPR(667,$P(RAUT,U,2),0),U,2)
 D DD^%DT W !,Y,?15,$E($P(^DPT(RPAT,0),U,1),1,13),?30,$E($P(^DPT(RPAT,0),U,9),6,9),?36,$P(^RMPR(667.1,$P(RAUT,U,3),0),U,1)
 W !,"VEHICLE ID# ",$P(^RMPR(667,$P(RAUT,U,2),0),U,1),?50,"SERIAL # ",$P(RAUT,U,6) S $P(LI,"-",IOM)="" W !,LI
 I IOST?1"C-".E&($Y>(IOSL-4)) S DUOUT=1,DIR(0)="E" D ^DIR S:Y<1 RMPREND=1 Q:Y=""  S:Y<1 RMPRFLL=1 Q:Y<1  K DIR D HDR Q
 I $Y'>(IOSL-4) Q
HDR W @IOF,!,"REQUEST DATE",?15,"PATIENT NAME",?30,"SSN",?36,"ITEM",?70,"PAGE ",PAGE S $P(LI,"-",IOM)="",PAGE=PAGE+1 W !,LI
 Q
SERIAL S DIR(0)="F^1:20",DIR("A")="Enter Serial Number or Lot Number" D ^DIR Q:$D(DIRUT)  S RMPRSE=X K DIR
 Q
ITEM S DIC="^RMPR(661,",DIC(0)="AEQM",DIC("A")="Select BILLING ITEM: " D ^DIC I Y<0 S DIRUT=1 Q 
 S RMPRSE=$P(Y,U,2)
 Q