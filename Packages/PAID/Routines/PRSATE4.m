PRSATE4 ; HISC/REL-Second Tour Entry ;8/12/94  10:12
 ;;4.0;PAID;;Sep 21, 1995
 W:'TYP !!,"Warning: This second tour will be temporary and will not carry forward."
 R !!,"For which Day (1-14) do you wish to enter a second Tour? ",DAY:DTIME Q:'$T!(DAY["^")
 I DAY'?1.2N!(DAY<1)!(DAY>14) W *7,!!,"Enter a Day Number from 1 to 14." G PRSATE4
 S TD=$P($G(^PRST(458,PPI,"E",DFN,"D",DAY,0)),"^",13) G:'TD P0
 W !!,"Existing Second Tour ",$P($G(^PRST(457.1,TD,0)),"^",1)," will be deleted."
 S $P(^PRST(458,PPI,"E",DFN,"D",DAY,0),"^",13,15)="^^" K ^(4)
P0 I $P($G(^PRST(458,PPI,"E",DFN,"D",DAY,0)),"^",2)<6 W *7,!!,"A second Tour is not valid on this day." G PRSATE4
 K DIC S DIC="^PRST(455.5,",DIC(0)="AEQM",DIC("A")="T&L on which Tour will be worked: ",DIC("B")=TLE W ! D ^DIC Q:Y<1  K DIC S WTL=+Y
P1 S DIC="^PRST(457.1,",DIC(0)="AEQMN"
 S DIC("S")="I Y>5,$P(^PRST(457.1,+Y,0),U,4)!($D(^PRST(457.1,+Y,""T"",""B"",WTL)))"
 S DIC("A")="Select TOUR OF DUTY: " W ! D ^DIC K DIC Q:Y'>0
 S TD=+Y,Y=$G(^PRST(457.1,TD,1)),TDH=$P(^(0),"^",6)
 S (ZENT,STR)="" D OT^PRSATP,VS^PRSATE0 I STR'="" W *7,!!,STR G P1
 K ^PRST(458,PPI,"E",DFN,"D",DAY,2),^(3),^(4),^(10)
 S $P(^PRST(458,PPI,"E",DFN,"D",DAY,0),"^",13,15)=TD_"^"_TDH_"^"_$S(WTL=TLI:"",1:WTL),^(4)=Y
 S ^PRST(458,"ATC",DFN,PPI,DAY)=""
 S HRS=0 F DAY=1:1:14 S Z=$P($G(^PRST(458,PPI,"E",DFN,"D",DAY,0)),"^",8) S:Z HRS=HRS+Z S Z=$P($G(^(0)),"^",14) S:Z HRS=HRS+Z
 W "  ... done" D:HRS'=NH W1 Q
W1 Q:NH=112  W *7,!!,"Warning: Normal Hours are "_NH_"; Tour Hours are "_HRS Q
