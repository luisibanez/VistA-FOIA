AQAOT85 ; GENERATED FROM 'AQAO PROV LIST' PRINT TEMPLATE (#1309) ; 05/13/96 ; (FILE 200, MARGIN=80)
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
 W ?0,$E(D0,1,9)
 S X=$G(^VA(200,D0,0)) W ?11,$E($P(X,U,1),1,30)
 W ?43 X ^DD(200,9999999.039,9.2) S X=X S X=X_Y(200,9999999.039,2)_$P(Y(200,9999999.039,1),U,2) W $E(X,1,8) K Y(200,9999999.039)
 K Y
 Q
HEAD ;
 W !,?0,"QI CODE",?11,"PROVDER NAME",?43,"PCC CODE"
 W !,"--------------------------------------------------------------------------------",!!
