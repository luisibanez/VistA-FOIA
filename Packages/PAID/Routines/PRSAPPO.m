PRSAPPO ; HISC/REL-Open New Pay Period ;5/31/95  09:31
 ;;4.0;PAID;;Sep 21, 1995
 S PPI=$P(^PRST(458,0),"^",3),PPE=$P(^PRST(458,PPI,0),"^",1)
 D NX^PRSAPPU S X1=D1,X2=14 D C^%DTC S D1=X
 S X1=DT,X2=7 D C^%DTC I D1>X W *7,!!,"You cannot open a Pay Period more than 7 days in advance!" G EX
 D PP^PRSAPPU S X=D1 D DTP^PRSAPPU
A1 W !!,"Do you wish to Open Pay Period ",PPE," beginning ",Y," ? "
 R X:DTIME G:'$T!(X["^") EX S:X="" X="*" S X=$TR(X,"yesno","YESNO")
 I $P("YES",X,1)'="",$P("NO",X,1)'="" W !?5,*7,"Answer YES or NO" G A1
 G:$E(X,1)'="Y" EX
 I $D(^PRST(458,"B",PPE)) W !!,*7,"That Pay Period is already open!" G EX
 K DIC,DD,DO S DIC="^PRST(458,",DIC(0)="L",DLAYGO=458,X=PPE D FILE^DICN G:Y<1 EX
 K DIC,DLAYGO S PPI=+Y,PPIP=PPI-1
A2 I PPIP,'$D(^PRST(458,PPIP)) S PPIP=PPIP-1 G A2
 ; Generate dates
 S Y1=D1 F K=1:1:13 S X2=K,X1=D1 D C^%DTC S Y1=Y1_"^"_X
 S Y2="" F K=1:1:14 S X=$P(Y1,"^",K) D DTP^PRSAPPU S Y=$P("Sat Sun Mon Tue Wed Thu Fri"," ",K#7+1)_" "_Y S $P(Y2,"^",K)=Y
 S ^PRST(458,PPI,1)=Y1,^(2)=Y2
 F K=1:1:14 S X=$P(Y1,"^",K),^PRST(458,"AD",X)=PPI_"^"_K
A3 S ^PRST(458,PPI,"E",0)="^458.01P^^" D NOW^%DTC S NOW=% D ^PRSAPPH
 W !!,"Moving Current Employees into Pay Period ... " S N=0
 S ATL="ATL00" F  S ATL=$O(^PRSPC(ATL)) Q:ATL'?1"ATL".E  S TLE=$E(ATL,4,6),NAM="" F  S NAM=$O(^PRSPC(ATL,NAM)) Q:NAM=""  F DFN=0:0 S DFN=$O(^PRSPC(ATL,NAM,DFN)) Q:DFN<1  D
 .Q:$D(^PRST(458,PPI,"E",DFN,"D",14,0))
 .I $P($G(^PRSPC(DFN,"LWOP")),"^",1)="Y" Q
 .I $P($G(^PRSPC(DFN,1)),"^",20)="Y" Q
 .I $P($G(^PRSPC(DFN,1)),"^",33)'="N" Q
 .D MOV I $D(HOL) S TT="HX",DUP=0 D E^PRSAPPH
 .S N=N+1 W:N#100=0 "." Q
 S $P(^PRST(458,PPI,"E",0),"^",3,4)=N_"^"_N W !!,N," Employee Records created.",!
EX G KILL^XUSCLEAN
RES ; Re-start/Re-open a Pay Period
 S PPI=$P(^PRST(458,0),"^",3),PPIP=PPI-1 G A3
MOV ; Create PP entry for Employee
 I '$D(^PRST(458,PPI,"E",DFN,0)) S ^(0)=DFN_"^T" D
 .S CPI=$G(^PRST(458,PPIP,"E",DFN,0))
 .S CPI=$S($P(CPI,"^",7)'="":$P(CPI,"^",7),$P(CPI,"^",6)'="":$P(CPI,"^",6),1:$P($G(^PRSPC(DFN,1)),"^",7))
 .S:CPI="" CPI=0 S $P(^PRST(458,PPI,"E",DFN,0),"^",6)=CPI Q
 I '$D(^PRST(458,PPI,"E",DFN,"D",0)) S ^(0)="^458.02^14^14"
 F DAY=1:1:14 I '$P($G(^PRST(458,PPI,"E",DFN,"D",DAY,0)),"^",2) D M1
 Q
M1 ; Set a day
 S Z=$G(^PRST(458,PPIP,"E",DFN,"D",DAY,0)),TD=$P(Z,"^",2) I $P(Z,"^",3) S TD=$P(Z,"^",4)
 S X=$G(^PRST(457.1,+TD,1)),TDH=$P($G(^(0)),"^",6)
 S ^PRST(458,PPI,"E",DFN,"D",DAY,0)=DAY_"^"_TD S:TDH'="" $P(^(0),"^",8)=TDH S:X'="" ^(1)=X
 Q
