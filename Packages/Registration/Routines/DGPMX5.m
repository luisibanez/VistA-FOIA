DGPMX5 ; GENERATED FROM 'DGPM LODGER CHECK-OUT' INPUT TEMPLATE(#1836), FILE 405;10/29/04
 D DE G BEGIN
DE S DIE="^DGPM(",DIC=DIE,DP=405,DL=1,DIEL=0,DU="" K DG,DE,DB Q:$O(^DGPM(DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,1) S:%]"" DE(2)=% S %=$P(%Z,U,4) S:%]"" DE(6)=%,DE(11)=%
 I $D(^("LD")) S %Z=^("LD") S %=$P(%Z,U,3) S:%]"" DE(15)=%
 I $D(^("USR")) S %Z=^("USR") S %=$P(%Z,U,3) S:%]"" DE(17)=%
 K %Z Q
 ;
W W !?DL+DL-2,DLB_": "
 Q
O D W W Y W:$X>45 !?9
 I $L(Y)>19,'DV,DV'["I",(DV["F"!(DV["K")) G RW^DIR2
 W:Y]"" "// " I 'DV,DV["I",$D(DE(DQ))#2 S X="" W "  (No Editing)" Q
TR R X:DTIME E  S (DTOUT,X)=U W $C(7)
 Q
A K DQ(DQ) S DQ=DQ+1
B G @DQ
RE G PR:$D(DE(DQ)) D W,TR
N I X="" G NKEY:$D(^DD("KEY","F",DP,DIFLD)),A:DV'["R",X:'DV,X:D'>0,A
RD G QS:X?."?" I X["^" D D G ^DIE17
 I X="@" D D G Z^DIE2
 I X=" ",DV["d",DV'["P",$D(^DISV(DUZ,"DIE",DLB)) S X=^(DLB) I DV'["D",DV'["S" W "  "_X
T G M^DIE17:DV,^DIE3:DV["V",P:DV'["S" X:$D(^DD(DP,DIFLD,12.1)) ^(12.1) I X?.ANP D SET I 'DDER X:$D(DIC("S")) DIC("S") I  W:'$D(DB(DQ)) "  "_% G V
 K DDER G X
P I DV["P" S DIC=U_DU,DIC(0)=$E("EN",$D(DB(DQ))+1)_"M"_$E("L",DV'["'") S:DIC(0)["L" DLAYGO=+$P(DV,"P",2) G:DV["*" AST^DIED D NOSCR^DIED S X=+Y,DIC=DIE G X:X<0
 G V:DV'["N" D D I $L($P(X,"."))>24 K X G Z
 I $P(DQ(DQ),U,5)'["$",X?.1"-".N.1".".N,$P(DQ(DQ),U,5,99)["+X'=X" S X=+X
V D @("X"_DQ) K YS
Z K DIC("S"),DLAYGO I $D(X),X'=U D:$G(DE(DW,"INDEX")) SAVEVALS G:'$$KEYCHK UNIQFERR^DIE17 S DG(DW)=X S:DV["d" ^DISV(DUZ,"DIE",DLB)=X G A
X W:'$D(ZTQUEUED) $C(7),"??" I $D(DB(DQ)) G Z^DIE17
 S X="?BAD"
QS S DZ=X D D,QQ^DIEQ G B
D S D=DIFLD,DQ(DQ)=DLB_U_DV_U_DU_U_DW_U_$P($T(@("X"_DQ))," ",2,99) Q
Y I '$D(DE(DQ)) D O G RD:"@"'[X,A:DV'["R"&(X="@"),X:X="@" S X=Y G N
PR S DG=DV,Y=DE(DQ),X=DU I $D(DQ(DQ,2)) X DQ(DQ,2) G RP
R I DG["P",@("$D(^"_X_"0))") S X=+$P(^(0),U,2) G RP:'$D(^(Y,0)) S Y=$P(^(0),U),X=$P(^DD(X,.01,0),U,3),DG=$P(^(0),U,2) G R
 I DG["V",+Y,$P(Y,";",2)["(",$D(@(U_$P(Y,";",2)_"0)")) S X=+$P(^(0),U,2) G RP:'$D(^(+Y,0)) S Y=$P(^(0),U) I $D(^DD(+X,.01,0)) S DG=$P(^(0),U,2),X=$P(^(0),U,3) G R
 X:DG["D" ^DD("DD") I DG["S" S %=$P($P(";"_X,";"_Y_":",2),";") S:%]"" Y=%
RP D O I X="" S X=DE(DQ) G A:'DV,A:DC<2,N^DIE17
I I DV'["I",DV'["#" G RD
 D E^DIE0 G RD:$D(X),PR
 Q
SET N DIR S DIR(0)="SV"_$E("o",$D(DB(DQ)))_U_DU,DIR("V")=1
 I $D(DB(DQ)),'$D(DIQUIET) N DIQUIET S DIQUIET=1
 D ^DIR I 'DDER S %=Y(0),X=Y
 Q
SAVEVALS S @DIEZTMP@("V",DP,DIIENS,DIFLD,"O")=$G(DE(DQ)) S:$D(^("F"))[0 ^("F")=$G(DE(DQ))
 I $D(DE(DW,"4/")) S @DIEZTMP@("V",DP,DIIENS,DIFLD,"4/")=""
 E  K @DIEZTMP@("V",DP,DIIENS,DIFLD,"4/")
 Q
NKEY W:'$D(ZTQUEUED) "??  Required key field" S X="?BAD" G QS
KEYCHK() Q:$G(DE(DW,"KEY"))="" 1 Q @DE(DW,"KEY")
BEGIN S DNM="DGPMX5",DQ=1
 N DIEZTMP,DIEZAR,DIEZRXR,DIIENS,DIXR K DIEFIRE,DIEBADK S DIEZTMP=$$GETTMP^DIKC1("DIEZ")
 M DIEZAR=^DIE(1836,"AR") S DICRREC="TRIG^DIE17"
 S:$D(DTIME)[0 DTIME=300 S D0=DA,DIIENS=DA_",",DIEZ=1836,U="^"
1 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=1 D X1 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X1 S:$S(DGPMN:1,DGPMY=+^DGPM(DA,0):1,1:0) Y="@51"
 Q
2 S DW="0;1",DV="RDXa",DU="",DLB="DATE/TIME",DIFLD=.01
 S DE(DW)="C2^DGPMX5"
 S X=DGPMY
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
C2 G C2S:$D(DE(2))[0 K DB
 S X=DE(2),DIC=DIE
 K ^DGPM("B",$E(X,1,30),DA)
 S X=DE(2),DIC=DIE
 S DGPMDDF=1 D ^DGPMDD2
 S X=DE(2),DIC=DIE
 ;
 S X=DE(2),DIC=DIE
 ;
 S X=DE(2),DIC=DIE
 ;
 S X=DE(2),DIC=DIE
 K:$P(^DGPM(DA,0),U,3) ^DGPM("ADFN"_$P(^(0),U,3),X,DA)
 S X=DE(2),DIC=DIE
 S Y=$P(^DGPM(DA,0),U,2) I Y,Y'=4,Y'=5,X,X<DT S DGHNYT=$S(Y=1:2,Y=2:5,Y=3:8,1:14) D ^DGPMGLC
 S X=DE(2),DIC=DIE
 I "^1^3^"[("^"_$P(^DGPM(DA,0),"^",2)_"^") S A1B2TAG="ADM" D ^A1B2XFR
 S X=DE(2),DIIX=2_U_DIFLD D AUDIT^DIET
C2S S X="" G:DG(DQ)=X C2F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^DGPM("B",$E(X,1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 S DGPMDDF=1 D ^DGPMDD1
 S X=DG(DQ),DIC=DIE
 X ^DD(405,.01,1,3,1.3) I X S X=DIV X ^DD(405,.01,1,3,89.2) S X=$P(Y(101),U,1) S D0=I(0,0) S DIU=X K Y S X=DIV S X=DIV X ^DD(405,.01,1,3,1.4)
 S X=DG(DQ),DIC=DIE
 S:$P(^DGPM(DA,0),U,22)="" $P(^(0),U,22)=0
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X=$S('$D(^DGPM(+$P(^DGPM(DA,0),U,24),0)):0,1:X'=+^(0)) I X S X=DIV S Y(1)=$S($D(^DGPM(D0,0)):^(0),1:"") S X=$P(Y(1),U,24),X=X S DIU=X K Y S X="" X ^DD(405,.01,1,5,1.4)
 S X=DG(DQ),DIC=DIE
 S:$P(^DGPM(DA,0),U,3) ^DGPM("ADFN"_$P(^(0),U,3),X,DA)=""
 S X=DG(DQ),DIC=DIE
 S Y=$P(^DGPM(DA,0),U,2) I Y,Y'=4,Y'=5,X,X<DT S DGHNYT=$S(Y=1:$S($D(DGIDX):3,1:1),Y=2:$S($D(DGIDX):6,1:4),Y=3:$S($D(DGIDX):9,1:7),1:15) D ^DGPMGLC K DGIDX
 S X=DG(DQ),DIC=DIE
 I "^1^3^"[("^"_$P(^DGPM(DA,0),"^",2)_"^") S A1B2TAG="ADM" D ^A1B2XFR
 I $D(DE(2))'[0!(^DD(DP,DIFLD,"AUDIT")'="e") S X=DG(DQ),DIIX=3_U_DIFLD D AUDIT^DIET
C2F1 Q
X2 S %DT="ST" D ^%DT K %DT S X=Y K:Y<1 X I $D(X),'$D(DGPMT) W !?3,*7,"USE BED CONTROL MOVEMENT OPTIONS!" K X
 Q
 ;
3 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=3 G A
4 S DQ=5 ;@51
5 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=5 D X5 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X5 D ONLY^DGPMV35 S:'$D(DGPMCO) Y="@52"
 Q
6 D:$D(DG)>9 F^DIE17,DE S DQ=6,DW="0;4",DV="R*P405.1'X",DU="",DLB="TYPE OF MOVEMENT",DIFLD=.04
 S DE(DW)="C6^DGPMX5"
 S DU="DG(405.1,"
 S X=DGPMCO
 S Y=X
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
C6 G C6S:$D(DE(6))[0 K DB
 S X=DE(6),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGPM(D0,0)):^(0),1:"") S X=$P(Y(1),U,18),X=X S DIU=X K Y S X="" S DIH=$S($D(^DGPM(DIV(0),0)):^(0),1:""),DIV=X S $P(^(0),U,18)=DIV,DIH=405,DIG=.18 D ^DICR:$N(^DD(DIH,DIG,1,0))>0
C6S S X="" G:DG(DQ)=X C6F1 K DB
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGPM(D0,0)):^(0),1:"") S X=$P(Y(1),U,18),X=X S DIU=X K Y X ^DD(405,.04,1,1,1.1) X ^DD(405,.04,1,1,1.4)
C6F1 Q
X6 Q
7 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=7 D X7 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X7 K DGPMCO
 Q
8 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=8 D X8 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X8 S Y="@53"
 Q
9 S DQ=10 ;@52
10 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=10 D X10 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X10 S ^DISV(DUZ,"^DG(405.1,")=$S($D(^DISV(DUZ,"DGPM5")):^("DGPM5"),1:"")
 Q
11 D:$D(DG)>9 F^DIE17,DE S DQ=11,DW="0;4",DV="R*P405.1'X",DU="",DLB="CHECK-OUT TYPE",DIFLD=.04
 S DE(DW)="C11^DGPMX5"
 S DU="DG(405.1,"
 G RE
C11 G C11S:$D(DE(11))[0 K DB
 S X=DE(11),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGPM(D0,0)):^(0),1:"") S X=$P(Y(1),U,18),X=X S DIU=X K Y S X="" S DIH=$S($D(^DGPM(DIV(0),0)):^(0),1:""),DIV=X S $P(^(0),U,18)=DIV,DIH=405,DIG=.18 D ^DICR:$N(^DD(DIH,DIG,1,0))>0
C11S S X="" G:DG(DQ)=X C11F1 K DB
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^DGPM(D0,0)):^(0),1:"") S X=$P(Y(1),U,18),X=X S DIU=X K Y X ^DD(405,.04,1,1,1.1) X ^DD(405,.04,1,1,1.4)
C11F1 Q
X11 S DIC("S")="I $D(DGPMT),($P(^(0),""^"",2)=DGPMT),$P(^(0),""^"",4) S DGER=0,DGPMTYP=$P(^(0),""^"",3) D:DGPMT<4!(DGPMT=6)!(DGPMT=5) @(""DICS^DGPMV3""_DGPMT) I 'DGER" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
12 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=12 D X12 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X12 S ^DISV(DUZ,"DGPM5")=$S($D(^DISV(DUZ,"^DG(405.1,")):^("^DG(405.1,"),1:"")
 Q
13 S DQ=14 ;@53
14 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=14 D X14 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X14 S:DGPMN DIE("NO^")=""
 Q
15 D:$D(DG)>9 F^DIE17,DE S DQ=15,DW="LD;3",DV="RS",DU="",DLB="DISPOSITION",DIFLD=30.03
 S DU="a:ADMITTED;d:DISMISSED;"
 G RE
X15 Q
16 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=16 D X16 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X16 I DGPMP=^DGPM(DA,0) S Y=""
 Q
17 S DW="USR;3",DV="RP200'a",DU="",DLB="LAST EDITED BY",DIFLD=102
 S DE(DW)="C17^DGPMX5"
 S DU="VA(200,"
 S X=DUZ
 S Y=X
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
C17 G C17S:$D(DE(17))[0 K DB
 D ^DGPMX51
C17S S X="" G:DG(DQ)=X C17F1 K DB
 D ^DGPMX52
C17F1 Q
X17 Q
18 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=18 G A
19 D:$D(DG)>9 F^DIE17 G ^DGPMX53
