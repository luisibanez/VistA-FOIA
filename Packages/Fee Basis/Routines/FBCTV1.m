FBCTV1 ; ;10/07/97
 D DE G BEGIN
DE S DIE="^FBAAV(",DIC=DIE,DP=161.2,DL=1,DIEL=0,DU="" K DG,DE,DB Q:$O(^FBAAV(DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,7) S:%]"" DE(1)=% S %=$P(%Z,U,8) S:%]"" DE(2)=% S %=$P(%Z,U,9) S:%]"" DE(3)=% S %=$P(%Z,U,10) S:%]"" DE(4)=% S %=$P(%Z,U,13) S:%]"" DE(5)=% S %=$P(%Z,U,14) S:%]"" DE(6)=%,DE(7)=% S %=$P(%Z,U,17) S:%]"" DE(8)=%
 I  S %=$P(%Z,U,18) S:%]"" DE(9)=%
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
N I X="" G A:DV'["R",X:'DV,X:D'>0,A
RD G QS:X?."?" I X["^" D D G ^DIE17
 I X="@" D D G Z^DIE2
 I X=" ",DV["d",DV'["P",$D(^DISV(DUZ,"DIE",DLB)) S X=^(DLB) I DV'["D",DV'["S" W "  "_X
T G M^DIE17:DV,^DIE3:DV["V",P:DV'["S" X:$D(^DD(DP,DIFLD,12.1)) ^(12.1) I X?.ANP D SET I 'DDER X:$D(DIC("S")) DIC("S") I  W:'$D(DB(DQ)) "  "_% G V
 K DDER G X
P I DV["P" S DIC=U_DU,DIC(0)=$E("EN",$D(DB(DQ))+1)_"M"_$E("L",DV'["'") S:DIC(0)["L" DLAYGO=+$P(DV,"P",2) I DV'["*" D ^DIC S X=+Y,DIC=DIE G X:X<0
 G V:DV'["N" D D I $L($P(X,"."))>24 K X G Z
 I $P(DQ(DQ),U,5)'["$",X?.1"-".N.1".".N,$P(DQ(DQ),U,5,99)["+X'=X" S X=+X
V D @("X"_DQ) K YS
Z K DIC("S"),DLAYGO I $D(X),X'=U S DG(DW)=X S:DV["d" ^DISV(DUZ,"DIE",DLB)=X G A
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
BEGIN S DNM="FBCTV1",DQ=1
1 S DW="0;7",DV="RS",DU="",DLB="TYPE OF VENDOR",DIFLD=6
 S DU="1:PUBLIC HOSPITAL;2:PHYSICIAN;3:PHARMACY;4:PROSTHETICS;5:TRAVEL;6:RADIOLOGY;7:LABORATORY;8:OTHER;9:PRIVATE HOSPITAL;10:FEDERAL HOSPITAL;"
 S X=$P(Z1,U,7)
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X1 Q
2 S DW="0;8",DV="P161.6'",DU="",DLB="SPECIALTY CODE",DIFLD=.05
 S DU="FBAA(161.6,"
 S X=$P(Z1,U,8)
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X2 Q
3 S DW="0;9",DV="RP161.81'",DU="",DLB="PART CODE",DIFLD=7
 S DU="FBAA(161.81,"
 S X=$P(Z1,U,9)
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X3 Q
4 S DW="0;10",DV="FX",DU="",DLB="CHAIN",DIFLD=8
 S DE(DW)="C4^FBCTV1"
 S X=$P(Z1,U,10)
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
C4 G C4S:$D(DE(4))[0 K DB S X=DE(4),DIC=DIE
 K:$P(^FBAAV(DA,0),U,2) ^FBAAV("AD",$P(^(0),U,2)_$E("0000",$L(X)+1,4)_X,DA)
C4S S X="" Q:DG(DQ)=X  K DB S X=DG(DQ),DIC=DIE
 S:$P(^FBAAV(DA,0),U,2) ^FBAAV("AD",$P(^(0),U,2)_$E("0000",$L(X)+1,4)_X,DA)=""
 Q
X4 Q
5 D:$D(DG)>9 F^DIE17,DE S DQ=5,DW="0;13",DV="RNJ4,0XO",DU="",DLB="COUNTY",DIFLD=5.5
 S DQ(5,2)="S Y(0)=Y S Y(0)=Y Q:Y']""""  S Z0=$S($D(^FBAAV(D0,0)):+$P(^(0),""^"",5),1:"""") Q:'Z0  S Y=$P($S($D(^DIC(5,Z0,1,Y,0)):^(0),1:""""),""^"",1)"
 S X=$P(Z1,U,13)
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X5 Q
6 S DW="0;14",DV="F",DU="",DLB="STREET ADDRESS 2",DIFLD=2.5
 S Y="@"
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X6 Q
7 S DW="0;14",DV="F",DU="",DLB="STREET ADDRESS 2",DIFLD=2.5
 S X=$P(Z1,U,14)
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X7 Q
8 S DW="0;17",DV="F",DU="",DLB="MEDICARE ID NUMBER",DIFLD=22
 S X=$P(Z1,U,17)
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X8 Q
9 S DW="0;18",DV="F",DU="",DLB="MAIL ROUTE CODE",DIFLD=5.18
 S X=$P(Z1,U,18)
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X9 Q
10 S DQ=11 ;@10
11 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=11 D X11 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X11 S:'$D(Z3) Y="@20"
 Q
12 D:$D(DG)>9 F^DIE17 G ^FBCTV2
