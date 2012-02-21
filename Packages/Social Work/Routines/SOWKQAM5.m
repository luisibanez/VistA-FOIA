SOWKQAM5 ;B'HAM ISC/SAB,DLR-Routine to print quality mgmt. monitor V report ; 20 Apr 93 / 7:58 AM [ 09/26/94  8:44 AM ]
 ;;3.0; Social Work ;**34,53**;27 Apr 93
 K ^TMP($J)
BEG W ! S %DT="AEXP",%DT("A")="ALL CASES STARTING FROM: " D ^%DT G:"^"[X CLOS G:Y'>0 BEG S SB1=Y X ^DD("DD") S SBA=Y
END W ! S %DT("A")="ALL CASES ENDING: " D ^%DT G:"^"[X CLOS G:Y'>0 END S SE1=Y X ^DD("DD") S SEA=Y I SE1<SB1 W !,"Ending date must be after starting date ",! G BEG
DEV W !!,"WARNING !!!",!?5,"This report is formatted for 132 columns and will be",!?5,"difficult to read if printed to the screen.",!
 K ZTSK,%ZIS,IOP S SOWKION=ION,%ZIS="QM",%ZIS("B")="" D ^%ZIS K %ZIS I POP S IOP=SOWKION D ^%ZIS K SOWKION,IOP G CLOS Q
 K SOWKION I $D(IO("Q")) S ZTRTN="ENQ^SOWKQAM5",ZTDESC="QUALITY MGMT. MONITOR V REPORT - SOCIAL WORK" F G="SE1","SB1","SBA","SEA" S:$D(@G) ZTSAVE(G)=""
 I  K IO("Q") D ^%ZTLOAD I '$D(ZTSK) G CLOS
 I $D(ZTSK) W !!,"Task Queued to Print",! K ZTSK G CLOS
ENQ F I=0:0 S I=$O(^SOWK(650.1,1,4,I)) Q:'I  S SWCL=+^(I,0),SWCC=$G(^DIC(40.7,$P($G(^SC(SWCL,0)),"^",7),0)),SWCL(SWCL)=SWCL_"^"_$P(SWCC,"^",2)_"^"_$P(SWCC,"^",5)
 S SDATE=SB1,(TOT,TOP)=0 F SWCL=0:0 S SWCL=$O(SWCL(SWCL)) Q:'SWCL  S CL=$P(SWCL(SWCL),"^"),CLP=$P(SWCL(SWCL),"^",2),CLS=0 D SWCL S CLS=1 D TOC S SDATE=SB1
 D PRI I $G(OUT)'=1 W !?64,"----",?90,"----",?118,"----",!,"TOTALS",?65,$J(TOT,3,0),?91,$J(TOT,3,0),?119,$S(TOP:$J((TOT/TOP)*100,3,0)_"%",1:"***")
CLOS W ! W:$E(IOST)'["C" @IOF D ^%ZISC K CL,ID,SDATE,CLP,CLS,DFN,I,ZZ,^TMP($J),I2,SB1,CDC,CN,SBA,SEA,Y,SE1,IOP,OUT,POP,SOWK,%DT,I1,G,TOT,TOP,SWCC,X,SWCL D KVA^VADPT D:$D(ZTSK) KILL^%ZTLOAD
 Q
 ;CALCULATE TOTALS
SWCL F ZZ=0:0 S SDATE=$O(^SC(CL,"S",SDATE)) Q:SDATE>SE1!'SDATE  F ID=0:0 S ID=$O(^SC(CL,"S",SDATE,1,ID)) Q:'ID  S DFN=$P(^SC(CL,"S",SDATE,1,ID,0),"^") D CLST
 Q
TOC S SDATE=SB1 F CL=0:0 S CL=$O(^SC(CL)) Q:'CL  I $P($G(^SC(CL,0)),"^",7)'="" I CLP=$P($G(^DIC(40.7,$P(^SC(CL,0),"^",7),0)),U,2) S TOP=TOP+1 D SWCL
 Q
CLST I $P(^DPT(DFN,"S",SDATE,0),"^",2)']"" S $P(SWCL(SWCL),"^",$S(CLS:5,1:4))=$P(SWCL(SWCL),"^",$S(CLS:5,1:4))+1 S:'CLS TOT=TOT+1
 Q
PRI ;print data
 U IO W:$Y @IOF D HDR1 Q:$G(OUT)=1  F CDC=0:0 S CDC=$O(SWCL(CDC)) Q:'CDC!($G(OUT)=1)  D:($Y+13)>IOSL CHK D:$G(OUT)'=1 OUT
 Q
HDR1 W !!?45,"Department of Veterans Affairs",!?45,$P(^DD("SITE"),"^")_" ("_$P(^DD("SITE",1),"^")_")",!?40,"Social Work Information Management System",!?45,"Quality Management Monitor V"
 W !?40,"Access to Social Work Services by Location",!,"Date: "_$E(DT,4,5)_"/"_$E(DT,6,7)_"/"_$E(DT,2,3),?60,"Reporting Period "_SBA_" to "_SEA,!
 W !?34,"Stop",?60,"# Pats. Open/",?86,"Total # Patients",?116,"% Population",!,"Clinic",?34,"Code",?46,"Location",?60,"# PT. Visits",?86,"Treatment Episodes",?118,"Served",!
 Q
OUT W !,$P(^SC($P(SWCL(CDC),"^"),0),"^"),?35,$P(SWCL(CDC),"^",2)
 W ?46,$P(SWCL(CDC),"^",3),?65,$J($P(SWCL(CDC),"^",4),3,0),?91,$J($P(SWCL(CDC),"^",5),3,0),?119,$S(+$P(SWCL(CDC),"^",5):$J(+$P(SWCL(CDC),"^",4)/+$P(SWCL(CDC),"^",5)*100,3,0),1:$J("0",3,0))
 Q
CHK ;
 N SWXX
 I $E(IOST)["C" R !,"Press <RETURN> to continue: ",SWXX:DTIME I SWXX["^" S OUT=1 W @IOF Q
 W @IOF D HDR1
 Q
