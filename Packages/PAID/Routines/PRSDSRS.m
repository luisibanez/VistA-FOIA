PRSDSRS ;HISC/GWB-SERVICE RECORD SCREEN ;2/8/95  14:14
 ;;4.0;PAID;;Sep 21, 1995
EMP S DA="",SSN=$P($G(^VA(200,DUZ,1)),"^",9)
 I SSN'="" S DA=$O(^PRSPC("SSN",SSN,0))
 I 'DA W !!,*7,"Your SSN was not found in both the New Person & Employee File!" G EX
START D WAIT^DICD
 K DASHES S $P(DASHES,"-",80)="-"
 S ZERO=^PRSPC(DA,0)
 S NAME=$P(ZERO,U,1),STATION=$P(ZERO,U,7),TLU=$P(ZERO,U,8)
 S SSN=$P(ZERO,U,9),SSN=$E(SSN,1,3)_"-"_$E(SSN,4,5)_"-"_$E(SSN,6,9)
 S Y=$P(ZERO,U,49) X ^DD(450,458,2.1) S CCORG=Y
 S DS=$P($G(^PRSPC(DA,1)),U,42),LPP=$P($G(^PRSPC(DA,"MISC4")),U,16)
 D ^PRSDYTD
SRS S CATEGORY="SERVICE RECORD SCREEN",PAGE=0
 K ^UTILITY("DIQ1",$J) S DIC="^PRSPC("
 S DR="2:5;9:11;13;15;15.5;16;19:23;26;28;30:32;37:39;42;43;47;52;53;64;82;83;89:116.2;139;120;132;142;143;144;226;231;395:427;458;538;600"
 S DIQ(0)="IE" D EN^DIQ1
 W @IOF D HDR S PRTC=1
 F F=16,20,15.5,13,38,28,82,83,142:1:144,23,3,37,9,15,19,21,11,458,42,39,53,52,32,31,4,43,10,5,47,139,120,132,226,231,26,64,538,22,30,2,600 D WR G:'PRTC EX
 S END="" D PRTC G:'PRTC EX
FU S FUFLD=89 K FUYES
 F  S FUFLD=$O(^UTILITY("DIQ1",$J,450,DA,FUFLD)) Q:(FUFLD>116.2)!(FUFLD="")  I ^UTILITY("DIQ1",$J,450,DA,FUFLD,"I")'="" S FUYES=""
 G:'$D(FUYES) TSP K END S CATEGORY="FOLLOWUPS"
 W @IOF D HDR S PRTC=1
 F F=115.17,89:1:97,97.1,98,98.1,98.2,98.3,98.4,99,99.1,100:1:114,114.1,114.2,115.01:.01:115.14,115.18,115.19,115.2,115.21,115.15,115.16,115.17,116.01:.01:116.2 D WR G:'PRTC EX
 S END="" D PRTC G:'PRTC EX
TSP K END S CATEGORY="THRIFT SAVINGS PLAN"
 W @IOF D HDR S PRTC=1
 F F=409,410,406,399,396,404,412,403,395,397,398,414,413,415,417,419,418,420,422,424,423,425,427,400,401,402,405,407,408 D WR G:'PRTC EX
 W:TSPYTD'=0 !!,"TSP EMP DED YTD.................",$FN(TSPYTD,",",2)
 S END="" D PRTC G:'PRTC EX
EX K ^UTILITY("DIQ1",$J)
 N PRSTLV D KILL^XUSCLEAN W @IOF
 Q
WR S NODEDD=^DD(450,F,0),NODEUTIL=$G(^UTILITY("DIQ1",$J,450,DA,F,"E"))
 I F=26 W:HBDYTD'=0 !,"HEALTH BENEFITS DEDUCTION YTD...",$FN(HBDYTD,",",2)
 I (NODEUTIL="")!(NODEUTIL="NA") K NODEDD,NODEUTIL Q
 S FLDNAM=$P(NODEDD,U,1)
 I F=15.5 S INT=^UTILITY("DIQ1",$J,450,DA,F,"E") G EXT
 S INT=^UTILITY("DIQ1",$J,450,DA,F,"I")
EXT S EXT=^UTILITY("DIQ1",$J,450,DA,F,"E")
 S IL=$L(INT)
 I $P(NODEDD,U,2)["NJ",+INT=0 K NODEDD,NODEUTIL Q
 S:F=15 FLDNAM="NORMAL HOURS" S:F=458 INT=$E(INT,1,4)_":"_$E(INT,5,8)
 S:F=414 FLDNAM="TSP CSF DIST PCT" S:F=419 FLDNAM="TSP FIF DIST PCT"
 S:F=424 FLDNAM="TSP GSF DIST PCT"
 I $P(NODEDD,U,5)["""$""" S VAL=$FN(INT,",",2) G IOSL
 I F>88,F<116.3 S VAL=EXT I $D(^PRSP(454,1,"PUC","C",FLDNAM)) S FUIEN=$O(^PRSP(454,1,"PUC","C",FLDNAM,0)) I $P(^PRSP(454,1,"PUC",FUIEN,0),U,3)'="" S VAL=VAL_"  "_$P(^PRSP(454,1,"PUC",FUIEN,0),U,3) G IOSL
 I (F=404)!(F=414)!(F=419)!(F=424) S VAL=EXT G IOSL
 I $P(NODEDD,U,2)["D" S VAL=EXT G IOSL
 I $P(NODEDD,U,2)["NJ" S VAL=$J(INT,IL,2) G IOSL
 S VAL=EXT
 S:F=458 VAL=INT
IOSL K DOTS S NOD=32-$L(FLDNAM),$P(DOTS,".",NOD)="."
 I $Y>(IOSL-4) D PRTC Q:'PRTC
 I (F=400)!(F=407)!(F=414)!(F=419)!(F=424) W !
 W !,FLDNAM,DOTS
 D VAL Q
VAL I $L(VAL)<48 W ?32,VAL Q
 S COLUMN=32,LGTH=0
 F LOOP=1:1 Q:LGTH=$L(VAL)!(LGTH>($L(VAL)))  W:$L($P(VAL," ",LOOP))>(80-COLUMN) ! S:$L($P(VAL," ",LOOP))>(80-COLUMN) COLUMN=32 W ?COLUMN,$P(VAL," ",LOOP) S COLUMN=COLUMN+$L($P(VAL," ",LOOP))+1,LGTH=LGTH+$L($P(VAL," ",LOOP))+1
 Q
HDR W:$Y>0 @IOF S PAGE=PAGE+1
 S CLNGTH=$L(CCORG),TAB=(80-CLNGTH)\2,TAB=TAB-1
 W !,NAME,?TAB,CCORG,?62,"DUTY STATION: ",STATION_DS
 W !,SSN,?71,"T&L: ",TLU,!,DASHES
 S CLNGTH=$L(CATEGORY),TAB=(80-CLNGTH)\2,TAB=TAB-1
 W !,"LAST PP: ",LPP,?TAB,CATEGORY,?73,"PAGE ",PAGE
 W !,DASHES
 K CLNGTH,TAB Q
PRTC W:$Y<22 ! K DIR,DIRUT,DIROUT,DTOUT,DUOUT
 S DIR(0)="E",DIR("A")="Press RETURN to continue" D ^DIR
 I $D(DIRUT) S PRTC=0 Q
 D:'$D(END) HDR Q
 Q
SVC S Y=$P(^PRSPC(DA,0),U,49),C=$P(^DD(450,458,0),U,2) D Y^DIQ S USRSVC=Y
 S DIC="^PRSPC(",DIC(0)="AEQ",DIC("A")="Select EMPLOYEE: "
 S DIC("S")="S YSAV=Y,Y=$P(^PRSPC(YSAV,0),U,49),C=$P(^DD(450,458,0),U,2) D Y^DIQ S EMPSVC=Y,Y=YSAV I USRSVC=EMPSVC"
 D ^DIC I Y=-1 G EX
 S DA=+Y D START G SVC
 ;S %ZIS="QM" D ^%ZIS G EX:POP
 ;I $D(IO("Q")) D  G EX
 ;.S ZTRTN="START^PRSDSRS",ZTDESC="PRS SERVICE RECORD SCREEN"
 ;.S ZTSAVE("DA")=""
 ;.D ^%ZTLOAD W:$D(ZTSK) !,"Request Queued!" D HOME^%ZIS K IO("Q") Q
