FBCTAU2 ; ;06/28/03
 D DE G BEGIN
DE S DIE="^FBAAA(D0,1,",DIC=DIE,DP=161.01,DL=2,DIEL=1,DU="" K DG,DE,DB Q:$O(^FBAAA(D0,1,DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,4) S:%]"" DE(15)=% S %=$P(%Z,U,8) S:%]"" DE(6)=% S %=$P(%Z,U,13) S:%]"" DE(2)=% S %=$P(%Z,U,14) S:%]"" DE(12)=% S %=$P(%Z,U,18) S:%]"" DE(1)=% S %=$P(%Z,U,19) S:%]"" DE(19)=% S %=$P(%Z,U,20) S:%]"" DE(20)=%
 I $D(^(3)) S %Z=^(3) S %=$P(%Z,U,1) S:%]"" DE(8)=% S %=$P(%Z,U,2) S:%]"" DE(10)=%
 I $D(^(100)) S %Z=^(100) S %=$P(%Z,U,1) S:%]"" DE(17)=%
 I $D(^("C")) S %Z=^("C") S %=$P(%Z,U,1) S:%]"" DE(21)=%,DE(24)=%
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
BEGIN S DNM="FBCTAU2",DQ=1
1 S DW="0;18",DV="S",DU="",DLB="PATIENT TYPE CODE",DIFLD=.065
 S DU="00:SURGICAL;10:MEDICAL;60:HOME NURSING SERVICE;85:PSYCHIATRIC-CONTRACT;86:PSYCHIATRIC;95:NEUROLOGICAL-CONTRACT;96:NEUROLOGICAL;"
 G RE
X1 Q
2 S DW="0;13",DV="R*S",DU="",DLB="TREATMENT TYPE CODE",DIFLD=.095
 S DE(DW)="C2^FBCTAU2"
 S DU="1:SHORT TERM FEE STATUS;2:HOME NURSING SERVICES;3:I.D. CARD STATUS;4:STATE HOME;"
 G RE
C2 G C2S:$D(DE(2))[0 K DB
 S X=DE(2),DIC=DIE
 ;
C2S S X="" G:DG(DQ)=X C2F1 K DB
 S X=DG(DQ),DIC=DIE
 D:'$D(DIU(0)) EVENT^IVMPLOG(DA(1))
C2F1 Q
X2 Q
3 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=3 D X3 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X3 S FBAATT=X
 Q
4 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=4 D X4 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X4 S FBAALT=$S(X=2:"Y",X=3:"Y",1:"")
 Q
5 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=5 D X5 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X5 K DIE("NO^")
 Q
6 D:$D(DG)>9 F^DIE17,DE S DQ=6,DW="0;8",DV="F",DU="",DLB="DX LINE 1",DIFLD=.08
 G RE
X6 K:$L(X)>60!($L(X)<3) X
 I $D(X),X'?.ANP K X
 Q
 ;
7 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=7 D X7 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X7 S:X="" Y=.021
 Q
8 S DW="3;1",DV="F",DU="",DLB="DX LINE 2",DIFLD=.085
 G RE
X8 K:$L(X)>60!($L(X)<2) X
 I $D(X),X'?.ANP K X
 Q
 ;
9 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=9 D X9 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X9 S:X="" Y=.021
 Q
10 S DW="3;2",DV="F",DU="",DLB="DX LINE 3",DIFLD=.086
 G RE
X10 K:$L(X)>60!($L(X)<2) X
 I $D(X),X'?.ANP K X
 Q
 ;
11 S D=0 K DE(1) ;.021
 S Y="AUTHORIZATION REMARKS^W^^0;1^Q",DG="2",DC="^161.06" D DIEN^DIWE K DE(1) G A
 ;
12 S DW="0;14",DV="S",DU="",DLB="TYPE OF CARE",DIFLD=2
 S DU="1:C&P;2:OPT NSC;3:OPT SC;"
 G RE
X12 Q
13 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=13 D X13 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X13 S:'$D(FBAAASKV) FBAAASKV="N"
 Q
14 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=14 D X14 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X14 S:FBAAASKV'="y" Y=100
 Q
15 S DW="0;4",DV="P161.2",DU="",DLB="VENDOR",DIFLD=.04
 S DE(DW)="C15^FBCTAU2"
 S DU="FBAAV("
 G RE
C15 G C15S:$D(DE(15))[0 K DB
 S X=DE(15),DIC=DIE
 K ^FBAAA("ACV",$E(X,1,30),DA(1),DA)
C15S S X="" G:DG(DQ)=X C15F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^FBAAA("ACV",$E(X,1,30),DA(1),DA)=""
C15F1 Q
X15 Q
16 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=16 G A
17 D:$D(DG)>9 F^DIE17,DE S DQ=17,DW="100;1",DV="P200'",DU="",DLB="CLERK",DIFLD=100
 S DU="VA(200,"
 S X=DUZ
 S Y=X
 S X=Y,DB(DQ)=1,DE(DW,"4/")="" G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD:X="@",Z
X17 Q
18 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=18 D X18 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X18 W !!
 Q
19 S DW="0;19",DV="FXO",DU="",DLB="ACCIDENT RELATED (Y/N)",DIFLD=.096
 S DQ(19,2)="S Y(0)=Y D OUTYN^FBAAUTL3"
 S DE(DW)="C19^FBCTAU2"
 G RE
C19 G C19S:$D(DE(19))[0 K DB
 S X=DE(19),DIC=DIE
 K ^FBAAA("AA",X,$P(^FBAAA(DA(1),1,DA,0),U,1),DA(1),DA)
C19S S X="" G:DG(DQ)=X C19F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^FBAAA("AA",X,$P(^FBAAA(DA(1),1,DA,0),U,1),DA(1),DA)=""
C19F1 Q
X19 I $D(X) D YN^FBAAUTL3
 I $D(X),X'?.ANP K X
 Q
 ;
20 D:$D(DG)>9 F^DIE17,DE S DQ=20,DW="0;20",DV="RFXO",DU="",DLB="POTENTIAL COST RECOVERY CASE",DIFLD=.097
 S DQ(20,2)="S Y(0)=Y D OUTYN^FBAAUTL3"
 S DE(DW)="C20^FBCTAU2"
 S X="NO"
 S Y=X
 G Y
C20 G C20S:$D(DE(20))[0 K DB
 S X=DE(20),DIC=DIE
 K ^FBAAA("AC",X,$P(^FBAAA(DA(1),1,DA,0),U,1),DA(1),DA)
 S X=DE(20),DIC=DIE
 K:$P(^FBAAA(DA(1),1,DA,0),U) ^FBAAA("AIC",DA(1),-($P(^FBAAA(DA(1),1,DA,0),U)),X,DA)
C20S S X="" G:DG(DQ)=X C20F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^FBAAA("AC",X,$P(^FBAAA(DA(1),1,DA,0),U,1),DA(1),DA)=""
 S X=DG(DQ),DIC=DIE
 S:$P(^FBAAA(DA(1),1,DA,0),U) ^FBAAA("AIC",DA(1),-($P(^FBAAA(DA(1),1,DA,0),U)),X,DA)=""
C20F1 Q
X20 I $D(X) D YN^FBAAUTL3
 I $D(X),X'?.ANP K X
 Q
 ;
21 D:$D(DG)>9 F^DIE17,DE S DQ=21,DW="C;1",DV="FX",DU="",DLB="PRINT AUTHORIZATION (Y/N)",DIFLD=1
 S DE(DW)="C21^FBCTAU2"
 S X="YES"
 S Y=X
 G Y
C21 G C21S:$D(DE(21))[0 K DB
 S X=DE(21),DIC=DIE
 D KILL^FBAAUTL2
C21S S X="" G:DG(DQ)=X C21F1 K DB
 S X=DG(DQ),DIC=DIE
 D ADD^FBAAUTL2
C21F1 Q
X21 I $D(X) D YN^FBAAUTL3
 I $D(X),X'?.ANP K X
 Q
 ;
22 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=22 D X22 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X22 S FBAAP79=$S(X["Y":"Y",1:"")
 Q
23 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=23 D X23 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X23 I X["Y" S Y=""
 Q
24 D:$D(DG)>9 F^DIE17,DE S DQ=24,DW="C;1",DV="FX",DU="",DLB="PRINT AUTHORIZATION (Y/N)",DIFLD=1
 S DE(DW)="C24^FBCTAU2"
 S X="@"
 S Y=X
 S X=Y,DB(DQ)=1 G:X="" N^DIE17:DV,A I $D(DE(DQ)),DV["I"!(DV["#") D E^DIE0 G A:'$D(X)
 G RD
C24 G C24S:$D(DE(24))[0 K DB
 D ^FBCTAU3
C24S S X="" G:DG(DQ)=X C24F1 K DB
 D ^FBCTAU4
C24F1 Q
X24 I $D(X) D YN^FBAAUTL3
 I $D(X),X'?.ANP K X
 Q
 ;
25 G 1^DIE17
