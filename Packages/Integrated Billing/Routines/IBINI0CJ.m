IBINI0CJ	; ; 21-MAR-1994
	;;Version 2.0 ; INTEGRATED BILLING ;; 21-MAR-94
	F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,"DIBT",820,2,1,"T")
	;;=1^1
	;;^UTILITY(U,$J,"DIBT",820,2,2)
	;;=354^.03^COPAY EXEMPTION STATUS DATE^'@^
	;;^UTILITY(U,$J,"DIBT",820,2,2,"ASK")
	;;=
	;;^UTILITY(U,$J,"DIBT",820,2,2,"F")
	;;=2930413.99999^T-9
	;;^UTILITY(U,$J,"DIBT",820,2,2,"IX")
	;;=^IBA(354,"AD",^IBA(354,^2
	;;^UTILITY(U,$J,"DIBT",820,2,2,"T")
	;;=2930423.9999^T
	;;^UTILITY(U,$J,"DIBT",820,2,3)
	;;=354^^PATIENT NAME^@".01^
	;;^UTILITY(U,$J,"DIBT",820,2,3,"ASK")
	;;=
	;;^UTILITY(U,$J,"DIBT",820,2,3,"CM")
	;;=S Y(1)=$S($D(^IBA(354,D0,0)):^(0),1:"") S X=$S('$D(^DPT(+$P(Y(1),U,1),0)):"",1:$P(^(0),U,1)) I D0>0 S X(3)=X
	;;^UTILITY(U,$J,"DIBT",820,2,3,"F")
	;;=@z^A
	;;^UTILITY(U,$J,"DIBT",820,2,3,"T")
	;;=Z^Z
	;;^UTILITY(U,$J,"DIBT",829,0)
	;;=IB EXEMPTION LETTER^2930604.1544^^354^^^2940309
	;;^UTILITY(U,$J,"DIBT",845,0)
	;;=IB AB COMMENTS^2940211.0941^@^362.1^10882^@^2940317
	;;^UTILITY(U,$J,"DIBT",845,2,1)
	;;=362.1^.05^DATE ENTERED^^;S1
	;;^UTILITY(U,$J,"DIBT",845,2,1,"ASK")
	;;=
	;;^UTILITY(U,$J,"DIBT",845,2,1,"F")
	;;=2930100.99999^1 1 93
	;;^UTILITY(U,$J,"DIBT",845,2,1,"T")
	;;=z^
	;;^UTILITY(U,$J,"DIBT",845,2,2)
	;;=362.1^^CLAIMS TRACKING ID:EVENT TYPE^@"^;S1
	;;^UTILITY(U,$J,"DIBT",845,2,2,"CM")
	;;=X DPP(2,"OVF0",9.2) S X=$S('$D(^IBE(356.6,+$P(Y(101),U,18),0)):"",1:$P(^(0),U,1)) S D0=I(0,0) I D0>0 S X(2)=X
	;;^UTILITY(U,$J,"DIBT",845,2,2,"F")
	;;=?z^@
	;;^UTILITY(U,$J,"DIBT",845,2,2,"OVF0",9.2)
	;;=S I(0,0)=$S($D(D0):D0,1:""),Y(1)=$S($D(^IBA(362.1,D0,0)):^(0),1:""),D0=$P(Y(1),U,2) S:'$D(^IBT(356,+D0,0)) D0=-1 S Y(101)=$S($D(^IBT(356,D0,0)):^(0),1:"")
	;;^UTILITY(U,$J,"DIBT",845,2,2,"T")
	;;=z^
	;;^UTILITY(U,$J,"DIBT",845,2,3)
	;;=362.1^^CLAIMS TRACKING ID:PATIENT^@"^;"CLAIMS TRACKING PATIENT"
	;;^UTILITY(U,$J,"DIBT",845,2,3,"ASK")
	;;=
	;;^UTILITY(U,$J,"DIBT",845,2,3,"CM")
	;;=X DPP(3,"OVF0",9.2) S X=$S('$D(^DPT(+$P(Y(101),U,2),0)):"",1:$P(^(0),U,1)) S D0=I(0,0) I D0>0 S X(3)=X
	;;^UTILITY(U,$J,"DIBT",845,2,3,"F")
	;;=@z^A
	;;^UTILITY(U,$J,"DIBT",845,2,3,"OVF0",9.2)
	;;=S I(0,0)=$S($D(D0):D0,1:""),Y(1)=$S($D(^IBA(362.1,D0,0)):^(0),1:""),D0=$P(Y(1),U,2) S:'$D(^IBT(356,+D0,0)) D0=-1 S Y(101)=$S($D(^IBT(356,D0,0)):^(0),1:"")
	;;^UTILITY(U,$J,"DIBT",845,2,3,"T")
	;;=z^
	;;^UTILITY(U,$J,"DIBT",845,2,4)
	;;=362.1^^CLAIMS TRACKING ID:EPISODE DATE^@"^^^D
	;;^UTILITY(U,$J,"DIBT",845,2,4,"CM")
	;;=X DPP(4,"OVF0",9.2) S X=$P(Y(101),U,6) S D0=I(0,0) I D0>0 S X(4)=X
	;;^UTILITY(U,$J,"DIBT",845,2,4,"F")
	;;=?z^@
	;;^UTILITY(U,$J,"DIBT",845,2,4,"OVF0",9.2)
	;;=S I(0,0)=$S($D(D0):D0,1:""),Y(1)=$S($D(^IBA(362.1,D0,0)):^(0),1:""),D0=$P(Y(1),U,2) S:'$D(^IBT(356,+D0,0)) D0=-1 S Y(101)=$S($D(^IBT(356,D0,0)):^(0),1:"")
	;;^UTILITY(U,$J,"DIBT",845,2,4,"T")
	;;=z^
	;;^UTILITY(U,$J,"DIBT",851,0)
	;;=IB INACTIVE INS CO^2931104.111^@^36^1453^@^2940228
	;;^UTILITY(U,$J,"DIBT",851,2,1)
	;;=36^.05^INACTIVE^'@^
	;;^UTILITY(U,$J,"DIBT",851,2,1,"F")
	;;=.99999^1
	;;^UTILITY(U,$J,"DIBT",851,2,1,"T")
	;;=1^1
	;;^UTILITY(U,$J,"DIBT",851,2,2)
	;;=36^.01^NAME^@^;"INSURANCE COMPANY"
	;;^UTILITY(U,$J,"DIBT",851,2,2,"ASK")
	;;=
	;;^UTILITY(U,$J,"DIBT",851,2,2,"F")
	;;=@z^A
	;;^UTILITY(U,$J,"DIBT",851,2,2,"IX")
	;;=^DIC(36,"B",^DIC(36,^2
	;;^UTILITY(U,$J,"DIBT",851,2,2,"T")
	;;=Z^Z
	;;^UTILITY(U,$J,"DIBT",853,0)
	;;=IBNOTVER^2931129.1527^^2^^^2940309^
	;;^UTILITY(U,$J,"DIBT",853,2,1)
	;;=2.312^1.03^DATE LAST VERIFIED^]@^
	;;^UTILITY(U,$J,"DIBT",853,2,1,2)
	;;=.312
	;;^UTILITY(U,$J,"DIBT",853,2,1,"F")
	;;=?z^@
	;;^UTILITY(U,$J,"DIBT",853,2,1,"T")
	;;=@^@
	;;^UTILITY(U,$J,"DIBT",853,2,2)
	;;=2.312^1.01^DATE ENTERED^@^
	;;^UTILITY(U,$J,"DIBT",853,2,2,2)
	;;=.312