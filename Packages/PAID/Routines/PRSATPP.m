PRSATPP ; HISC/REL-Timekeeper Prior PP Post Time ;9/14/95  15:44
 ;;4.0;PAID;;Sep 21, 1995
 S PRSTLV=2 D ^PRSAUTL G:TLI<1 EX
 S X=$P(^PRST(455.5,TLI,0),"^",3) D NOW^%DTC S NOW=%,DT=%\1
D1 S %DT="AEPX",%DT("A")="Posting Date: ",%DT(0)=-DT W ! D ^%DT
 G:Y<1 EX S D1=Y S Y=$G(^PRST(458,"AD",D1)),PPI=$P(Y,"^",1),DAY=$P(Y,"^",2)
 I PPI="" W !!,*7,"Pay Period is Not Open Yet!" G EX
 S PPE=$P($G(^PRST(458,PPI,0)),"^",1),DTE=$P($G(^PRST(458,PPI,2)),"^",DAY),DTI=$P($G(^(1)),"^",DAY)
NME K DIC S DIC("A")="Select EMPLOYEE: ",DIC("S")="I $P(^(0),""^"",8)=TLE,$D(^PRST(458,PPI,""E"",+Y))",DIC(0)="AEQM",DIC="^PRSPC(",D="ATL"_TLE W ! D IX^DIC S DFN=+Y K DIC
 G:DFN<1 EX
 D ^PRSAENT I ENT="" W *7,!!,"Employee has no Pay Entitlement table entry." G EX
 S STAT=$P($G(^PRST(458,PPI,"E",DFN,0)),"^",2) I "T"[STAT W *7,!!,"Employee still open for regular posting." G NME
 I STAT'="X" W !!,*7,"Card in Payroll and not transmitted; request return of card." G NME
 K AUR S L2=0 F L1=0,1,2,10,3,4 S Z=$G(^PRST(458,PPI,"E",DFN,"D",DAY,L1)),L2=L2+1 S:Z'="" AUR(L2)=Z
 S STAT=$P($G(AUR(4)),"^",1) D POST
 S (Z,L2)=0 F L1=0,1,2,10,3,4 S L2=L2+1 I $G(^PRST(458,PPI,"E",DFN,"D",DAY,L1))'=$G(AUR(L2)) S Z=1
 I Z S AUT="T",AUS="R" D ^PRSAUD I $G(AUR(7))["^" S L2=0 F L1=0,1,2,10,3,4 S L2=L2+1 K ^PRST(458,PPI,"E",DFN,"D",DAY,L1) I $D(AUR(L2)) S ^(L1)=AUR(L2)
 G NME
POST S TC=$P($G(^PRST(458,PPI,"E",DFN,"D",DAY,0)),"^",2),TC2=$P($G(^(0)),"^",13)
 D ^PRSADP1,LP,^PRSATP2 G:'TC T1
T0 R !!,"Do you wish to change Scheduled Tour? N// ",X:DTIME Q:'$T!(X["^")  S:X="" X="N" S X=$TR(X,"yesno","YESNO")
 I $P("YES",X,1)'="",$P("NO",X,1)'="" W *7," Answer YES or NO" G T0
 G:X?1"N".E T3
T1 ; Get new tour
 S TYP=1,WTL=TLI
 S DIC="^PRST(455.5,",DIC(0)="AEQM",DIC("A")="T&L on which Tour will be worked: ",DIC("B")=TLE W ! D ^DIC Q:Y<1  K DIC S WTL=+Y
 S DIC="^PRST(457.1,",DIC(0)="AEQMN"
 S DIC("S")="I "_$S($E(ENT,1)="D":"Y<3",1:"Y>5!(Y=1)")_",$P(^PRST(457.1,+Y,0),U,4)!($D(^PRST(457.1,+Y,""T"",""B"",WTL)))"
 S DIC("A")="Select TOUR OF DUTY: " W ! D ^DIC Q:Y'>0
 S TD=+Y,Y=$G(^PRST(457.1,TD,1)),TDH=$P(^(0),"^",6) D SET^PRSATE,HOL^PRSATE S TC=TD
T3 G P1^PRSATP:TC=1,P3^PRSATP:TC=4,P0^PRSATP
LP W !!,"Enter '^' to bypass this employee." W ! Q
EX G KILL^XUSCLEAN
