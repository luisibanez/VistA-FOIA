RMPR8PG ;PHX/JLT-PURGE 668 SUSPENSE FILE ;8/29/1994
 ;;3.0;PROSTHETICS;**5**;Feb 09, 1996
EN D DIV4^RMPRSIT Q:$D(X)
EN2 K %ZIS,IOP,ZTIO S %ZIS="MQ",%ZIS("B")="" D ^%ZIS G:POP END
 ;I IOST["C-" W !,$C(7),"YOU MAY NOT SELECT YOUR TERMINAL" G EN2
 I $D(IO("Q")) S ZTRTN="EN1^RMPR8PG",ZTDESC="PURGE 668 SUSPENSE FILE" F RD="I","RMPRIEN","RMPRDT","ION","RMPR(","RMPRSITE" S ZTSAVE(RD)=""
 I $D(IO("Q")) K IO("Q") D ^%ZTLOAD W !,"<REQUEST QUEUED!>" G EXIT
EN1 S (I,RMPRIEN,RDEL)=0,RMPRDT=$P(^RMPR(669.9,RMPRSITE,0),U,8) G:RMPRDT'>89 END
 S X1=DT,X2=-RMPRDT D C^%DTC S RMPRDT=X I RMPRDT<$O(^RMPR(668,"B",""))!('$O(^RMPR(668,0))) G END
 S DIS(0)="I $P(^RMPR(668,D0,0),U,7)=RMPR(""STA"")",IOP=ION,DIC="^RMPR(668,",FLDS=".01;C1,1;C20;L17,2,3,6;C45;L15,5;C65,4;C1,7;C1",BY="5",FR=$S($D(^RMPR(668,"B")):$O(^RMPR(668,"B","")),1:2890101)
 S TO=RMPRDT,DHD="Purge Suspense File Entries from Station/Division "_RMPR("STA") D EN1^DIP
 F  S RMPRIEN=$O(^RMPR(668,RMPRIEN)) Q:RMPRIEN'>0  I $P($G(^RMPR(668,RMPRIEN,0)),U,7)=RMPR("STA") I ($P(^RMPR(668,RMPRIEN,0),U,5))&($P(^(0),U,5)<RMPRDT) S DA=RMPRIEN,DIC="^RMPR(668," S DA=RMPRIEN,DIK=DIC D ^DIK S RDEL=RDEL+1
END I $G(RDEL)<1 W !!,"No Suspense entries purged."
 I $G(RDEL)>1 W !!,RDEL," Suspense entries purged."
 I $G(RDEL)=1 W !!,RDEL,"Suspense entry purged. "
EXIT ;common exit point
 K I,RD,X,DIS,%ZIS,X1,X2,RMPRIEN,RMPRDT,RDEL,DIC,DIK,DA,RL,BY,DHD,DHIT,FLDS,FR,TO D ^%ZISC Q
