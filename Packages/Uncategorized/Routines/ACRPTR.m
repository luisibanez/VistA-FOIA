ACRPTR ; GENERATED FROM 'ACR TRIP REPORT' PRINT TEMPLATE (#3966) ; 09/29/09 ; (FILE 9002189, MARGIN=80)
 G BEGIN
N W !
T W:$X ! I '$D(DIOT(2)),DN,$D(IOSL),$S('$D(DIWF):1,$P(DIWF,"B",2):$P(DIWF,"B",2),1:1)+$Y'<IOSL,$D(^UTILITY($J,1))#2,^(1)?1U1P1E.E X ^(1)
 S DISTP=DISTP+1,DILCT=DILCT+1 D:'(DISTP#100) CSTP^DIO2
 Q
DT I $G(DUZ("LANG"))>1,Y W $$OUT^DIALOGU(Y,"DD") Q
 I Y W $P("JAN^FEB^MAR^APR^MAY^JUN^JUL^AUG^SEP^OCT^NOV^DEC",U,$E(Y,4,5))_" " W:Y#100 $J(Y#100\1,2)_"," W Y\10000+1700 W:Y#1 "  "_$E(Y_0,9,10)_":"_$E(Y_"000",11,12) Q
 W Y Q
M D @DIXX
 Q
BEGIN ;
 S:'$D(DN) DN=1 S DISTP=$G(DISTP),DILCT=$G(DILCT)
 S I(0)="^ACROBL(",J(0)=9002189
 S DIWF="W"
 S I(1)=2,J(1)=9002189.201 F D1=0:0 Q:$O(^ACROBL(D0,2,D1))'>0  S D1=$O(^(D1)) D:$X>0 T Q:'DN  D A1
 G A1R
A1 ;
 S X=$G(^ACROBL(D0,2,D1,0)) S DIWL=1,DIWR=78 D ^DIWP
 Q
A1R ;
 D 0^DIWW
 D ^DIWW K Y K DIWF
 Q
HEAD ;
 W !,"--------------------------------------------------------------------------------",!!
