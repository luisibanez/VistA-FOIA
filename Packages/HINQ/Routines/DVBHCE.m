DVBHCE ; GENERATED FROM 'DVBHINQ UPDATE' INPUT TEMPLATE(#960), FILE 2;04/10/06
 D DE G BEGIN
DE S DIE="^DPT(",DIC=DIE,DP=2,DL=1,DIEL=0,DU="" K DG,DE,DB Q:$O(^DPT(DA,""))=""
 I $D(^(.32)) S %Z=^(.32) S %=$P(%Z,U,4) S:%]"" DE(23)=% S %=$P(%Z,U,5) S:%]"" DE(21)=% S %=$P(%Z,U,6) S:%]"" DE(19)=% S %=$P(%Z,U,7) S:%]"" DE(20)=% S %=$P(%Z,U,8) S:%]"" DE(24)=%
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
BEGIN S DNM="DVBHCE",DQ=1
 N DIEZTMP,DIEZAR,DIEZRXR,DIIENS,DIXR K DIEFIRE,DIEBADK S DIEZTMP=$$GETTMP^DIKC1("DIEZ")
 M DIEZAR=^DIE(960,"AR") S DICRREC="TRIG^DIE17"
 S:$D(DTIME)[0 DTIME=300 S D0=DA,DIIENS=DA_",",DIEZ=960,U="^"
1 S DQ=2 ;@101
2 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=2 D X2 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X2 W @$S('$D(IOF):"#",IOF="":"#",1:IOF),! K ^UTILITY($J) D ^DVBHSVER
 Q
3 S DQ=4 ;@7
4 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=4 D X4 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X4 D Q^DVBHUTIL
 Q
5 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=5 D X5 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X5 S DIE("NO^")=""
 Q
6 S DQ=7 ;@1001
7 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=7 D X7 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X7 D ^DVBHS1 S Y="@5"
 Q
8 S DQ=9 ;@1
9 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=9 D X9 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X9 D ^DVBHS2 S Y="@5" W !
 Q
10 S DQ=11 ;@2
11 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=11 D X11 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X11 D ^DVBHS3 S Y="@5"
 Q
12 S DQ=13 ;@3
13 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=13 D X13 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X13 D ^DVBHS4 S Y="@5"
 Q
14 S DQ=15 ;@1006
15 S DQ=16 ;@30
16 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=16 D X16 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X16 I Z2'[1 S Y="@32"
 Q
17 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=17 D X17 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X17 S DVBSCR=1 D ^DVBHS4 W !,?34,DVBON,"[LAST]",DVBOFF X DVBLIT1
 Q
18 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=18 D X18 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X18 S DVBJC=$S('$D(^DPT(DFN,.32)):"",1:$P(^(0),U,5))
 Q
19 S DW=".32;6",DV="RDX",DU="",DLB="L-EOD",DIFLD=.326
 S DE(DW)="C19^DVBHCE",DE(DW,"INDEX")=1
 G RE
C19 G C19S:$D(DE(19))[0 K DB
 S X=DE(19),DIC=DIE
 ;
 S X=DE(19),DIC=DIE
 D EVENT^IVMPLOG(DA)
 S X=DE(19),DIC=DIE
 D:($T(ADGRU^DGRUDD01)'="") ADGRU^DGRUDD01(DA)
C19S S X="" G:DG(DQ)=X C19F1 K DB
 S X=DG(DQ),DIC=DIE
 ;
 S X=DG(DQ),DIC=DIE
 D EVENT^IVMPLOG(DA)
 S X=DG(DQ),DIC=DIE
 D:($T(ADGRU^DGRUDD01)'="") ADGRU^DGRUDD01(DA)
C19F1 S DIEZRXR(2,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=640 S DIEZRXR(2,DIXR)=""
 Q
X19 S %DT="E",%DT(0)=-DT D ^%DT K %DT S X=Y K:Y<1 X I $D(X) S DFN=DA D SV^DGLOCK I $D(X) K:'$$VALMSE^DGRPMS(DFN,X,0,"MSL") X I $D(X) S DGFRDT=X I $D(^DG(43,1)) S SD1=1 D POS^DGINP
 Q
 ;
20 D:$D(DG)>9 F^DIE17,DE S DQ=20,DW=".32;7",DV="RDX",DU="",DLB="L-RAD",DIFLD=.327
 S DE(DW)="C20^DVBHCE",DE(DW,"INDEX")=1
 G RE
C20 G C20S:$D(DE(20))[0 K DB
 S X=DE(20),DIC=DIE
 D EVENT^IVMPLOG(DA)
 S X=DE(20),DIC=DIE
 D:($T(ADGRU^DGRUDD01)'="") ADGRU^DGRUDD01(DA)
C20S S X="" G:DG(DQ)=X C20F1 K DB
 S X=DG(DQ),DIC=DIE
 D EVENT^IVMPLOG(DA)
 S X=DG(DQ),DIC=DIE
 D:($T(ADGRU^DGRUDD01)'="") ADGRU^DGRUDD01(DA)
C20F1 S DIEZRXR(2,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=303,640 S DIEZRXR(2,DIXR)=""
 Q
X20 S %DT="E",%DT(0)=-DT D ^%DT K %DT S X=Y K:Y<1 X I $D(X) S DFN=DA D SV^DGLOCK I $D(X) K:'$$VALMSE^DGRPMS(DFN,X,1,"MSL") X I $D(X),$D(^DG(43,1)) S SD1=1 D PS^DGINP
 Q
 ;
21 D:$D(DG)>9 F^DIE17,DE S DQ=21,DW=".32;5",DV="P23'X",DU="",DLB="L-Bran.. Ser.",DIFLD=.325
 S DE(DW)="C21^DVBHCE",DE(DW,"INDEX")=1
 S DU="DIC(23,"
 G RE
C21 G C21S:$D(DE(21))[0 K DB
 S X=DE(21),DIC=DIE
 S A1B2TAG="PAT" D ^A1B2XFR
 S X=DE(21),DIC=DIE
 I $P($G(^DPT(DA,.321)),U,14)]"" D FVP^DGRPMS
 S X=DE(21),DIC=DIE
 D EVENT^IVMPLOG(DA)
C21S S X="" G:DG(DQ)=X C21F1 K DB
 S X=DG(DQ),DIC=DIE
 S A1B2TAG="PAT" D ^A1B2XFR
 S X=DG(DQ),DIC=DIE
 ;
 S X=DG(DQ),DIC=DIE
 D EVENT^IVMPLOG(DA)
C21F1 N X,X1,X2 S DIXR=408 D C21X1(U) K X2 M X2=X D C21X1("O") K X1 M X1=X
 D
 . N DIEXARR M DIEXARR=X S DIEZCOND=1
 . S X=X2(1)=""
 . S DIEZCOND=$G(X) K X M X=DIEXARR Q:'DIEZCOND
 . D DELMSE^DGRPMS(DFN,1)
 G C21F2
C21X1(DION) K X
 S X(1)=$G(@DIEZTMP@("V",2,DIIENS,.325,DION),$P($G(^DPT(DA,.32)),U,5))
 S X=$G(X(1))
 Q
C21F2 Q
X21 S DFN=DA K:X=$O(^DIC(23,"B","B.E.C.","")) X I $D(X) D SV^DGLOCK S DGCOMBR=$G(Y) Q
 Q
 ;
22 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=22 D X22 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X22 I X'=DVBJC S DVBJ2=1
 Q
23 D:$D(DG)>9 F^DIE17,DE S DQ=23,DW=".32;4",DV="RP25'X",DU="",DLB="L-Char. Ser.",DIFLD=.324
 S DE(DW)="C23^DVBHCE"
 S DU="DIC(25,"
 G RE
C23 G C23S:$D(DE(23))[0 K DB
 S X=DE(23),DIC=DIE
 D EVENT^IVMPLOG(DA)
C23S S X="" G:DG(DQ)=X C23F1 K DB
 S X=DG(DQ),DIC=DIE
 D EVENT^IVMPLOG(DA)
C23F1 Q
X23 S DFN=DA I $D(X) D SV^DGLOCK Q
 Q
 ;
24 D:$D(DG)>9 F^DIE17,DE S DQ=24,DW=".32;8",DV="FX",DU="",DLB="L-Ser. Num.",DIFLD=.328
 S DE(DW)="C24^DVBHCE"
 G RE
C24 G C24S:$D(DE(24))[0 K DB
 S X=DE(24),DIC=DIE
 D EVENT^IVMPLOG(DA)
C24S S X="" G:DG(DQ)=X C24F1 K DB
 D ^DVBHCE1
C24F1 Q
X24 S DFN=DA D SV^DGLOCK I $D(X) S:X?1"SS".E L=$S($D(^DPT(DA,0)):$P(^(0),U,9),1:X) W:X?1"SS".E "  ",L S:X?1"SS".E X=L K:$L(X)>15!($L(X)<1)!'(X?.N) X
 I $D(X),X'?.ANP K X
 Q
 ;
25 S DQ=26 ;@32
26 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=26 D X26 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X26 I Z2'[2 S Y="@31"
 Q
27 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=27 D X27 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X27 I '$D(^DPT(D0,.32)) W !!,*7,?17,DVBON,"No Last episode can't edit NTLast   <RET>",DVBOFF X DVBLIT1 R DVBZ:DTIME K DVBZ S Y="@33"
 Q
28 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=28 D X28 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X28 I $P(^DPT(D0,.32),U,6)="" W !!,*7,?17,DVBON,"No last episode can't edit NTLast   <RET>",DVBOFF X DVBLIT1 R DVBZ:DTIME K DVBZ S Y="@33"
 Q
29 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=29 D X29 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X29 S DVBSCR=1 D ^DVBHS4 W !,?34,DVBON,"[NTLAST]",DVBOFF X DVBLIT1
 Q
30 D:$D(DG)>9 F^DIE17 G ^DVBHCE2
