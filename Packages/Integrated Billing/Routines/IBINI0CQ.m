IBINI0CQ	; ; 21-MAR-1994
	;;Version 2.0 ; INTEGRATED BILLING ;; 21-MAR-94
	F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,"DIE",1236,"DIAB",2,1,357.22,0)
	;;=.01;"SUBCOLUMN NUMBER"
	;;^UTILITY(U,$J,"DIE",1236,"DIAB",4,1,357.22,1)
	;;=.07;T;REQ
	;;^UTILITY(U,$J,"DIE",1236,"DIAB",5,1,357.22,0)
	;;=.02;T
	;;^UTILITY(U,$J,"DIE",1236,"DIAB",6,1,357.22,0)
	;;=.04;T
	;;^UTILITY(U,$J,"DIE",1236,"DIAB",8,1,357.22,0)
	;;=.06;T;REQ
	;;^UTILITY(U,$J,"DIE",1236,"DIAB",9,0,357.2,0)
	;;=.05;T
	;;^UTILITY(U,$J,"DIE",1236,"DIAB",11,0,357.2,0)
	;;=.06;T
	;;^UTILITY(U,$J,"DIE",1236,"DIAB",13,0,357.2,0)
	;;=.07//LINE;T
	;;^UTILITY(U,$J,"DIE",1236,"DIAB",14,0,357.2,0)
	;;=.09;T
	;;^UTILITY(U,$J,"DIE",1236,"DIAB",15,0,357.2,0)
	;;=.08//0;T
	;;^UTILITY(U,$J,"DIE",1236,"DIAB",16,0,357.2,0)
	;;=.12//YES;T
	;;^UTILITY(U,$J,"DIE",1236,"DR",1,357.2)
	;;=S IBDELETE=1;I IBOLD S Y="@1";D FULL^VALM1;.01;.02////^S X=$G(IBBLK);.11////^S X=$G(IBRTN);D DATASIZE^IBDF9A(+X);@1;.05T~;I X="" S Y="@2";.06T~;@2;.07T~//LINE;.09T~;.08T~//0;.12T~//YES;D MSG3^IBDF9A;D HELP4^IBDFU5;2;S IBDELETE=0;
	;;^UTILITY(U,$J,"DIE",1236,"DR",2,357.22)
	;;=S IBSC1=$P($G(^IBE(357.2,D0,2,D1,0)),U);.01SUBCOLUMN NUMBER~;S IBSC2=$P($G(^IBE(357.2,D0,2,D1,0)),U);S:(IBSC1'=IBSC2) IBSWITCH(+$G(IBP))=IBSC1_"^"_IBSC2,IBP=$G(IBP)+1;.02T~;.04T~;I X=1 S Y="@3";.06R~T~;S Y="@99";@3;D HELP2^IBDFU5;
	;;^UTILITY(U,$J,"DIE",1236,"DR",2,357.22,1)
	;;=.05R~Select Subcolumn's Data~;S IBP=+X;.03//^S X=$G(IBLEN(IBP));.07R~T~;@99;D HELP4^IBDFU5;
	;;^UTILITY(U,$J,"DIE",1237,0)
	;;=IBDF EDIT SELECTION^2930402.094^^357.3^^^^
	;;^UTILITY(U,$J,"DIE",1237,"%D",0)
	;;=^^1^1^2940308^
	;;^UTILITY(U,$J,"DIE",1237,"%D",1,0)
	;;=Used to edit a selection.
	;;^UTILITY(U,$J,"DIE",1237,"DR",1,357.3)
	;;=.05;1;
	;;^UTILITY(U,$J,"DIE",1237,"DR",2,357.31)
	;;=I '$G(IBDFEDIT(+$G(^IBE(357.3,D0,1,D1,0)))) S Y="@1";.02;
	;;^UTILITY(U,$J,"DIE",1238,0)
	;;=IBDF EDIT OLD OR COPIED FORM^2930625.0828^^357^^^2940201^
	;;^UTILITY(U,$J,"DIE",1238,"%D",0)
	;;=^^1^1^2940308^
	;;^UTILITY(U,$J,"DIE",1238,"%D",1,0)
	;;=Used to edit an existing form.
	;;^UTILITY(U,$J,"DIE",1238,"DIAB",3,0,357,0)
	;;=.09;T
	;;^UTILITY(U,$J,"DIE",1238,"DIAB",4,0,357,0)
	;;=.1;T
	;;^UTILITY(U,$J,"DIE",1238,"DIAB",6,0,357,0)
	;;=.03;T
	;;^UTILITY(U,$J,"DIE",1238,"DR",1,357)
	;;=S IBDELETE=1;.01;.09T~;.1T~;.11//1;.03T~;.07////^S X=$S(+$G(IBTKFORM):1,1:0);S IBDELETE=0;
	;;^UTILITY(U,$J,"DIE",1239,0)
	;;=IBDF EDIT NEW FORM^2930810.1058^^357^^^2940131^
	;;^UTILITY(U,$J,"DIE",1239,"%D",0)
	;;=^^1^1^2940308^
	;;^UTILITY(U,$J,"DIE",1239,"%D",1,0)
	;;=Used to edit a new form.
	;;^UTILITY(U,$J,"DIE",1239,"DIAB",7,0,357,0)
	;;=.03;T
	;;^UTILITY(U,$J,"DIE",1239,"DR",1,357)
	;;=S IBDELETE=1;.01;.04////1;.09//132;.1//80;.11//1;.03T~;.07////^S X=$S(+$G(IBTKFORM):1,1:0);S IBDELETE=0;
	;;^UTILITY(U,$J,"DIE",1244,0)
	;;=IBDF EDIT AVAILABLE REPORT^2930924.1337^^357.6^^^2940202^
	;;^UTILITY(U,$J,"DIE",1244,"%D",0)
	;;=^^2^2^2940308^
	;;^UTILITY(U,$J,"DIE",1244,"%D",1,0)
	;;=Used to define a package interface that prints a report other than a
	;;^UTILITY(U,$J,"DIE",1244,"%D",2,0)
	;;=Health Summary.
	;;^UTILITY(U,$J,"DIE",1244,"DIAB",1,1,357.66,0)
	;;=ALL
	;;^UTILITY(U,$J,"DIE",1244,"DIAB",1,1,357.67,0)
	;;=ALL
	;;^UTILITY(U,$J,"DIE",1244,"DIAB",3,0,357.6,0)
	;;=1;REQ
	;;^UTILITY(U,$J,"DIE",1244,"DIAB",5,0,357.6,0)
	;;=.04;REQ
	;;^UTILITY(U,$J,"DIE",1244,"DIAB",6,0,357.6,0)
	;;=.02;REQ
	;;^UTILITY(U,$J,"DIE",1244,"DIAB",7,0,357.6,0)
	;;=.03;REQ
	;;^UTILITY(U,$J,"DIE",1244,"DIAB",13,0,357.6,0)
	;;=.09;REQ
	;;^UTILITY(U,$J,"DIE",1244,"DR",1,357.6)
	;;=.01;.06////4;1R~;3;.04R~;.02R~;.03R~;.1///NO;4.01;5.01;6;7;.09R~;S IBDELETE=0;
	;;^UTILITY(U,$J,"DIE",1244,"DR",2,357.66)
	;;=.01
