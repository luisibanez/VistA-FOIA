ACGPTCS1 ; GENERATED FROM 'ACG PHSCIS SUMMARY' PRINT TEMPLATE (#4000) ; 10/01/09 ; (continued)
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
 S X=$G(^ACGS(D0,"DT3")) W ?17 S Y=$P(X,U,12) W:Y]"" $J(Y,8,0)
 D N:$X>39 Q:'DN  W ?39 W "68 NEXT HI BID:"
 W ?56 S Y=$P(X,U,13) W:Y]"" $J(Y,10,0)
 D N:$X>0 Q:'DN  W ?0 W "69 BIDDER EIN.:"
 W ?17,$E($P(X,U,14),1,30)
 W ?49 D:$D(ACGAH)&'$D(ACGRDAM) ADHOC^ACGSPSUM K DIP K:DN Y
 K Y
 Q
HEAD ;
 W !,"--------------------------------------------------------------------------------",!!
