APC09 ; GENERATED FROM 'APCD FS (ADD)' INPUT TEMPLATE(#320), FILE 9000007;04/28/95
 D DE G BEGIN
DE S DIE="^AUPNFSE(",DIC=DIE,DP=9000007,DL=1,DIEL=0,DU="" K DG,DE,DB Q:$O(^AUPNFSE(DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,2) S:%]"" DE(2)=% S %=$P(%Z,U,3) S:%]"" DE(3)=% S %=$P(%Z,U,7) S:%]"" DE(6)=% S %=$P(%Z,U,8) S:%]"" DE(4)=% S %=$P(%Z,U,9) S:%]"" DE(5)=%
 K %Z Q
 ;
W W !?DL+DL-2,DLB_": "
 Q
O D W W Y W:$X>45 !?9
 I $L(Y)>19,'DV,DV'["I",(DV["F"!(DV["K")) G RW^DIR2
 W:Y]"" "// " I 'DV,DV["I",$D(DE(DQ))#2 S X="" W "  (No Editing)" Q
TR R X:DTIME E  S (DTOUT,X)=U W *7
 Q
A K DQ(DQ) S DQ=DQ+1
B G @DQ
RE G PR:$D(DE(DQ)) D W,TR
N I X="" G A:DV'["R",X:'DV,X:D'>0,A
RD G QS:X?."?" I X["^" D D G ^DIE17
 I X="@" D D G Z^DIE2
 I X=" ",DV["d",DV'["P",$D(^DISV(DUZ,"DIE",DLB)) S X=^(DLB) I DV'["D",DV'["S" W "  "_X
T G M^DIE17:DV,^DIE3:DV["V",P:DV'["S" X:$D(^DD(DP,DIFLD,12.1)) ^(12.1) S %=$P($P(";"_DU,";"_X_":",2),";"),Y=X I %]"" X:$D(DIC("S")) DIC("S") I  W:'$D(DB(DQ)) "  "_% G V
 F %=1:1 S Y=$P(DU,";",%),DG=$F(Y,":"_X) G X:Y="" S YS=Y,Y=$P(Y,":") I DG X:$D(DIC("S")) DIC("S") I  Q:DG
 W:'$D(DB(DQ)) $E(YS,DG,999) S X=$P(YS,":")
P I DV["P" S DIC=U_DU,DIC(0)=$E("EN",$D(DB(DQ))+1)_"M"_$E("L",DV'["'") S:DIC(0)["L" DLAYGO=+$P(DV,"P",2) I DV'["*" D ^DIC S X=+Y,DIC=DIE G X:X<0
 G V:DV'["N" D D I $L($P(X,"."))>24 K X G Z
 I +$P(DV,",",2),X[".",$P(DQ(DQ),U,5)'["$" S X=$S($P(X,"00")="":"",$E(X)[0:$E(X,2,$L(X)),1:X) S:$E($P(X,".",2),$L($P(X,".",2)))[0 X=$E(X,1,$L(X)-1) I $P(X,".",2)=""&(X[".") S X=+X
V D @("X"_DQ) K YS
Z K DIC("S"),DLAYGO I $D(X),X'=U S DG(DW)=X S:DV["d" ^DISV(DUZ,"DIE",DLB)=X G A
X W *7,"??" I $D(DB(DQ)) G Z^DIE17
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
BEGIN S DNM="APC09",DQ=1
 S:$D(DTIME)[0 DTIME=999 S D0=DA,DIEZ=320,U="^"
1 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=1 D X1 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X1 S APCDLOOK=""
 Q
2 S DW="0;2",DV="RP9000001'I",DU="",DLB="PATIENT NAME",DIFLD=.02
 S DE(DW)="C2^APC09"
 S DU="AUPNPAT("
 S X=APCDPAT
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G Z:X,RD
C2 G C2S:$D(DE(2))[0 K DB S X=DE(2),DIC=DIE
 K ^AUPNFSE("AC",$E(X,1,30),DA)
 S X=DE(2),DIC=DIE
 K ^AUPNFSE("AA",X,$P(^AUPNFSE(DA,0),U,1),DA)
C2S S X="" Q:DG(DQ)=X  K DB S X=DG(DQ),DIC=DIE
 S ^AUPNFSE("AC",$E(X,1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 S ^AUPNFSE("AA",X,$P(^AUPNFSE(DA,0),U,1),DA)=""
 Q
X2 Q
3 D:$D(DG)>9 F^DIE17,DE S DQ=3,DW="0;3",DV="RDI",DU="",DLB="SCHED ON DATE",DIFLD=.03
 S X=APCDVSIT
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G Z:X,RD
X3 Q
4 S DW="0;8",DV="RP6'",DU="",DLB="SCHED FOR PROVIDER",DIFLD=.08
 S DU="DIC(6,"
 G RE
X4 Q
5 S DW="0;9",DV="RF",DU="",DLB="NARRATIVE",DIFLD=.09
 G RE
X5 K:$L(X)>44!($L(X)<2) X
 I $D(X),X'?.ANP K X
 Q
 ;
6 S DW="0;7",DV="RP9999999.06'",DU="",DLB="SCHED FOR FACILITY",DIFLD=.07
 S DU="AUTTLOC("
 S X=APCDLOC
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G Z:X,RD
X6 Q
7 G 0^DIE17
