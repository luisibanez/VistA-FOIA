AQAOT511 ; GENERATED FROM 'AQAO IND DISPLAY' PRINT TEMPLATE (#1316) ; 05/13/96 ; (continued)
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
 D N:$X>0 Q:'DN  W ?0 X DXS(12,9.2) S X=X="DELETED",DIP(103)=X S X="",DIP(104)=X S X=1,DIP(105)=X S X="#",X=$S(DIP(103):DIP(104),DIP(105):X) K DIP K:DN Y W X
 X DXS(13,9) K DIP K:DN Y W X
 D N:$X>14 Q:'DN  W ?14 X DXS(14,9.3) S X=$P($P(DIP(106),$C(59)_$P(DIP(101),U,5)_":",2),$C(59),1),X=$S(DIP(103):DIP(104),DIP(105):X) K DIP K:DN Y W X
 D N:$X>44 Q:'DN  W ?44 X DXS(15,9.2) S X=X="DELETED",DIP(103)=X S X="",DIP(104)=X S X=1,DIP(105)=X S X="TYPE: ",X=$S(DIP(103):DIP(104),DIP(105):X) K DIP K:DN Y W X
 X DXS(16,9.4) S X=$S(DIP(103):DIP(104),DIP(105):X) S D0=I(100,0) K DIP K:DN Y W X
 D N:$X>59 Q:'DN  W ?59 X DXS(17,9) K DIP K:DN Y W X
 X DXS(18,9.3) S X=$S(DIP(103):DIP(104),DIP(105):X) K DIP K:DN Y W X
 D N:$X>4 Q:'DN  W ?4 X DXS(19,9) K DIP K:DN Y W X
 X DXS(20,9.3) S X=$S(DIP(103):DIP(104),DIP(105):X) K DIP K:DN Y W X
 D N:$X>29 Q:'DN  W ?29 X DXS(21,9) K DIP K:DN Y W X
 X DXS(22,9.3) S X=$S(DIP(103):DIP(104),DIP(105):X) K DIP K:DN Y W X
 D N:$X>59 Q:'DN  W ?59 X DXS(23,9.2) S X=X="DELETED",DIP(103)=X S X="",DIP(104)=X S X=1,DIP(105)=X S X="CLOSED: ",X=$S(DIP(103):DIP(104),DIP(105):X) K DIP K:DN Y W X
 X DXS(24,9.3) S X=$S(DIP(103):DIP(104),DIP(105):X) K DIP K:DN Y W X
 Q
G1R ;
 K J(100),I(100) S:$D(I(0,0)) D0=I(0,0)
 K Y K DIWF
 Q
HEAD ;
 W !,?0,"METHODOLOGY"
 W !,?62,"TYPE"
 W !,?0,"REASON"
 W !,?0,"$S(PLAN",?14,"$S(PLAN",?44,"$S(PLAN",?59,"$S(PLAN"
 W !,?0,"STATUS=",?14,"STATUS=",?44,"STATUS=",?59,"STATUS="
 W !,?4,"$S(PLAN",?29,"$S(PLAN",?59,"$S(PLAN"
 W !,?4,"STATUS=",?29,"STATUS=",?59,"STATUS="
 W !,"--------------------------------------------------------------------------------",!!
