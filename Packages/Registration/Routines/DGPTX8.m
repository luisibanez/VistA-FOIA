DGPTX8 ; GENERATED FROM 'DG801' INPUT TEMPLATE(#1664), FILE 46.1;03/24/04
 D DE G BEGIN
DE S DIE="^DGICD9(46.1,",DIC=DIE,DP=46.1,DL=1,DIEL=0,DU="" K DG,DE,DB Q:$O(^DGICD9(46.1,DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,2) S:%]"" DE(3)=%,DE(6)=% S %=$P(%Z,U,3) S:%]"" DE(15)=%,DE(18)=% S %=$P(%Z,U,4) S:%]"" DE(21)=%,DE(24)=% S %=$P(%Z,U,5) S:%]"" DE(27)=%,DE(30)=% S %=$P(%Z,U,6) S:%]"" DE(33)=%,DE(36)=%
 I  S %=$P(%Z,U,8) S:%]"" DE(9)=%,DE(12)=%
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
BEGIN S DNM="DGPTX8",DQ=1
 N DIEZTMP,DIEZAR,DIEZRXR,DIIENS,DIXR K DIEFIRE,DIEBADK S DIEZTMP=$$GETTMP^DIKC1("DIEZ")
 M DIEZAR=^DIE(1664,"AR") S DICRREC="TRIG^DIE17"
 S:$D(DTIME)[0 DTIME=300 S D0=DA,DIIENS=DA_",",DIEZ=1664,U="^"
1 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=1 D X1 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X1 I '$D(SDCLY(3)) S Y=$S($P($G(^DGICD9(46.1,D0,0)),U,2)="":"@11",1:"@10")
 Q
2 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=2 D X2 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X2 D ELIG^DGPTUTL1
 Q
3 S DW="0;2",DV="RS",DU="",DLB="WAS TREATMENT FOR A SERVICE CONNECTED CONDITION?",DIFLD=.02
 S DU="1:YES;0:NO;"
 G RE
X3 Q
4 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=4 D X4 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X4 S Y="@11"
 Q
5 S DQ=6 ;@10
6 S DW="0;2",DV="RS",DU="",DLB="TREATED FOR SC CONDITION",DIFLD=.02
 S DU="1:YES;0:NO;"
 S Y="0"
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X6 Q
7 S DQ=8 ;@11
8 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=8 D X8 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X8 I '$D(SDCLY(7)) S Y=$S($P($G(^DGICD9(46.1,D0,0)),U,8)="":"@21",1:"@20")
 Q
9 S DW="0;8",DV="S",DU="",DLB="WAS TREATMENT RELATED TO COMBAT?",DIFLD=.08
 S DU="Y:YES;N:NO;"
 G RE
X9 Q
10 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=10 D X10 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X10 S Y="@21"
 Q
11 S DQ=12 ;@20
12 S DW="0;8",DV="S",DU="",DLB="COMBAT VET",DIFLD=.08
 S DU="Y:YES;N:NO;"
 S Y="N"
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X12 Q
13 S DQ=14 ;@21
14 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=14 D X14 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X14 I '$D(SDCLY(1)) S Y=$S($P($G(^DGICD9(46.1,D0,0)),U,3)="":"@31",1:"@30")
 Q
15 S DW="0;3",DV="RS",DU="",DLB="WAS TREATMENT RELATED TO AGENT ORANGE EXPOSURE?",DIFLD=.03
 S DU="1:YES;0:NO;"
 G RE
X15 Q
16 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=16 D X16 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X16 S Y="@31"
 Q
17 S DQ=18 ;@30
18 S DW="0;3",DV="RS",DU="",DLB="TREATED FOR AO CONDITION",DIFLD=.03
 S DU="1:YES;0:NO;"
 S Y="0"
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X18 Q
19 S DQ=20 ;@31
20 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=20 D X20 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X20 I '$D(SDCLY(2)) S Y=$S($P($G(^DGICD9(46.1,D0,0)),U,4)="":"@41",1:"@40")
 Q
21 S DW="0;4",DV="RS",DU="",DLB="WAS TREATMENT RELATED TO IONIZING RADIATION EXPOSURE?",DIFLD=.04
 S DU="1:YES;0:NO;"
 G RE
X21 Q
22 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=22 D X22 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X22 S Y="@41"
 Q
23 S DQ=24 ;@40
24 S DW="0;4",DV="RS",DU="",DLB="TREATMENT FOR IR CONDITION",DIFLD=.04
 S DU="1:YES;0:NO;"
 S Y="0"
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X24 Q
25 S DQ=26 ;@41
26 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=26 D X26 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X26 I '$D(SDCLY(4)) S Y=$S($P($G(^DGICD9(46.1,D0,0)),U,5)="":"@51",1:"@50")
 Q
27 S DW="0;5",DV="RS",DU="",DLB="WAS TREATMENT RELATED TO ENVIRONMENTAL CONTAMINANT EXPOSURE?",DIFLD=.05
 S DU="1:YES;0:NO;"
 G RE
X27 Q
28 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=28 D X28 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X28 S Y="@51"
 Q
29 S DQ=30 ;@50
30 S DW="0;5",DV="RS",DU="",DLB="EXPOSURE TO ENVIR CONTAMINANTS",DIFLD=.05
 S DU="1:YES;0:NO;"
 S Y="0"
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X30 Q
31 S DQ=32 ;@51
32 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=32 D X32 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X32 I '$D(SDCLY(5)) S Y=$S($P($G(^DGICD9(46.1,D0,0)),U,6)="":"@61",1:"@60")
 Q
33 S DW="0;6",DV="RS",DU="",DLB="WAS TREATMENT RELATED TO MILITARY SEXUAL TRAUMA?",DIFLD=.06
 S DU="1:YES;0:NO;"
 G RE
X33 Q
34 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=34 D X34 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X34 S Y="@61"
 Q
35 S DQ=36 ;@60
36 S DW="0;6",DV="RS",DU="",DLB="TREATMENT FOR MST",DIFLD=.06
 S DU="1:YES;0:NO;"
 S Y="0"
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X36 Q
37 S DQ=38 ;@61
38 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=38 D X38 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X38 I '$D(SDCLY(6)) S Y=$S($P($G(^DGICD9(46.1,D0,0)),U,7)="":"@71",1:"@70")
 Q
39 D:$D(DG)>9 F^DIE17 G ^DGPTX81
