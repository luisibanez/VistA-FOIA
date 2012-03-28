IBCF3P	;ALB/BGA -UB92 HCFA-1450 (print data ) ;7-SEPT-93
	;;Version 2.0 ; INTEGRATED BILLING ;; 21-MAR-94
	;;Per VHA Directive 10-93-142, this routine should not be modified.
	;
	;
EN	;This routine prints out the bill from the data gathered in
	;routines IBCF3,IBCF31, and IBCF32
	S IBPGS=1
	;
0	W IBFL(0,"SR"),?34,IBFL(0,"ZBILL")
1	W !,$E(IBFL(1,"PROVL1"),1,25),?26,IBFL(2,1)
	W !,$E(IBFL(1,"PROVL2"),1,25),?26,IBFL(2,2),?57,$E(IBFL(3),1,20),?77,IBFL(4)
	W !,$E(IBFL(1,"PROVL3"),1,25),?68,IBFL(11,1)
	W !,$E(IBFL(1,"PROVL4"),1,25),?26,$E(IBFL(5),1,10),?37,IBFL(6,"FROM"),?44,IBFL(6,"TO"),?51,IBFL(7),?55,IBFL(8),?67,IBFL(11,2)
	W !
	W !,$E(IBFL(12),1,30),?31,$E(IBFL(13),1,49)
	W !,?75,IBFL(31,1)
	W !,IBFL(14),?9,IBFL(15),?12,IBFL(16),?14,IBFL(17),?21,IBFL(18),?25,IBFL(19),?28,IBFL(20),?30,IBFL(21),?33,IBFL(22),?36,$E(IBFL(23),1,17)
CC	;
	I +IBFL(24) S IBC=54,IBX=$P(IBFL(24),U,2) F IBI=1:1:7 S IBX=$O(IBFL(24,IBX)) Q:'IBX  D
	. W ?IBC,IBFL(24,IBX) S IBC=IBC+3 S $P(IBFL(24),U,1)=$P(IBFL(24),U,1)-1,$P(IBFL(24),U,2)=IBX
	W ?74,IBFL(31,2)
	W !,?57,IBFL(37,1)
	;W !
OC	;
	F IBJ=2,3 S IBC=0 W ! D
	. F IBI=32,33,34,35 S IBX=+IBFL(IBI) D  S IBC=IBC+10
	.. Q:+IBX'>0  S IBX=$P(IBFL(IBI),U,2)+1,IBY=$G(IBFL(IBI,+IBX)) W ?IBC,$P(IBY,U,1),?(IBC+3),$P(IBY,U,2)
	.. S $P(IBFL(IBI),U,1)=+IBFL(IBI)-1,$P(IBFL(IBI),U,2)=+IBX
	. S IBI=36,IBX=+IBFL(IBI) I +IBX>0 D
	.. S IBX=$P(IBFL(IBI),U,2)+1,IBY=$G(IBFL(IBI,+IBX)) W ?40,$P(IBY,U,1),?43,$P(IBY,U,2),?50,$P(IBY,U,3)
	.. S $P(IBFL(IBI),U,1)=+IBFL(IBI)-1,$P(IBFL(IBI),U,2)=+IBX
	. W ?57,$G(IBFL(37,IBJ))
	;
	;
38	;responsible party name/address and value codes
	S IB38C1=+$P(IBSIGN,U,31),IB38C2=42-IB38C1
	F IBI=1:1:5 W !,?IB38C1,$E($G(IBFL(38,IBI)),1,IB38C2) I IBI>1,+IBFL(39) D
	. S IBX=$P(IBFL(39),U,2) F IBJ=1:1:3 S IBX=$O(IBFL(39,IBX)) Q:'IBX  D
	.. S IBC=(30+(13*IBJ)) W ?IBC,$P(IBFL(39,IBX),U,1),?(IBC+2),$S(+$P(IBFL(39,IBX),U,3):$J($P(IBFL(39,IBX),U,2),10,2),1:$J($P(IBFL(39,IBX),U,2),8))
	.. S $P(IBFL(39),U,1)=$P(IBFL(39),U,1)-1,$P(IBFL(39),U,2)=IBX
	W ! K IB38C1,IB38C2
	;
42	;Rev Codes
	S IBX=$G(^TMP($J,"IBC-RC")) I +IBX S IBX=$P(IBX,U,2) F IBI=1:1:23 S IBX=$O(^TMP($J,"IBC-RC",IBX)) Q:'IBX  D
	. S $P(^TMP($J,"IBC-RC"),U,1)=+$P(^TMP($J,"IBC-RC"),U,1)-1,$P(^TMP($J,"IBC-RC"),U,2)=IBX
	. S IBY=^TMP($J,"IBC-RC",IBX) I +IBY>1 W !,?($S(+IBY=3:5,1:0)),$E($P(IBY,U,2),1,76) Q
	. W !,$P(IBY,U,2),?5,$E($P(IBY,U,3),1,24),?30,$P(IBY,U,4)
	. I +$P(IBY,U,5) W:$P(IBY,U,4)'="" "/"_$J($P(IBY,U,5),0,2) I $P(IBY,U,4)="" W $J($P(IBY,U,5),7,2)
	. W ?48,$P(IBY,U,6) I $P(IBY,U,7)'="" W ?53,$J($P(IBY,U,7),11,2)
	;
	;Payer
	W !,?67,IBFL(56,1)
50	F IBI=1:1:3 D
	. W !,$E($G(IBFL(50,IBI)),1,25),?26,$E($G(IBFL(51,IBI)),1,13),?40,$G(IBFL(52,IBI)),?43,$G(IBFL(53,IBI)),?66,IBFL(56,(IBI+1))
	W !,?1,IBFL(57),?56,IBFL(56,5)
58	W ! F IBI=1:1:3 D
	. W !,$E($G(IBFL(58,IBI)),1,25),?26,$G(IBFL(59,IBI)),?29,$E($G(IBFL(60,IBI)),1,19),?49,$E($G(IBFL(61,IBI)),1,14),?64,$E($G(IBFL(62,IBI)),1,16)
63	W ! F IBI=1:1:3 D
	. W !,$E($G(IBFL(63,IBI)),1,18),?19,$G(IBFL(64,IBI)),?21,$E($G(IBFL(65,IBI)),1,24),?46,$E($G(IBFL(66,IBI)),1,34)
	;
67	;field locators 67-71 and 76,78
	W !,?78,IBFL(78,1)
	W ! S IBC=0 F IBI=1:1:9 W ?IBC,$G(IBFL(66+IBI)) S IBC=IBC+7
	W ?64,$E($G(IBFL(76)),1,6),?77,IBFL(78,2)
	W !
79	;field locators 80-83
	W !,IBFL(79) S IBC=3 F IBI=1:1:3 W ?IBC,$P($G(IBFL(80,IBI)),U,1),?(IBC+8),$P($G(IBFL(80,IBI)),U,2) S IBC=IBC+15
	W ?50,$E($G(IBFL(82)),1,30)
	W !!
	S IBC=3 F IBI=4:1:6 W ?IBC,$P($G(IBFL(80,IBI)),U,1),?(IBC+8),$P($G(IBFL(80,IBI)),U,2) S IBC=IBC+15
	W ?50,$E($G(IBFL(83)),1,30)
84	;remarks field locator 84
	W !,?7,$E(IBFL(84,1),1,27),?35,"(PAGE ",IBPGS," OF ",IBPG,")" S IBI=1 F  S IBI=$O(IBFL(84,IBI)) Q:'IBI  W !,$E($G(IBFL(84,IBI)),1,48)
	W ?50,$E($G(IBFL(85,1)),1,22),?74,$G(IBFL(86)),!,?50,$E($G(IBFL(85,2)),1,22)
	I IBPGS<IBPG S IBPGS=IBPGS+1 W @IOF G 0
	K IBPGS,IBC
	Q
