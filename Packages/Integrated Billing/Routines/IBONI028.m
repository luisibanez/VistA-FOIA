IBONI028	; ; 21-MAR-1994
	;;Version 2.0 ; INTEGRATED BILLING ;; 21-MAR-94
	F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,"PRO",958,10,15,"^")
	;;=IBTRE PROVIDER UPDATE
	;;^UTILITY(U,$J,"PRO",958,10,16,0)
	;;=1067^BI^18
	;;^UTILITY(U,$J,"PRO",958,10,16,"^")
	;;=IBTRE BILLING INFO
	;;^UTILITY(U,$J,"PRO",958,15)
	;;=I $G(IBFASTXT)=1 S VALMBCK="Q"
	;;^UTILITY(U,$J,"PRO",958,26)
	;;=D SHOW^VALM
	;;^UTILITY(U,$J,"PRO",958,28)
	;;=Select Action: 
	;;^UTILITY(U,$J,"PRO",958,99)
	;;=55804,54407
	;;^UTILITY(U,$J,"PRO",959,0)
	;;=IBTRE CHANGE PATIENT^Change Patient^^A^^^^^^^^INTEGRATED BILLING
	;;^UTILITY(U,$J,"PRO",959,20)
	;;=D CP^IBTRE1
	;;^UTILITY(U,$J,"PRO",959,99)
	;;=55760,74735
	;;^UTILITY(U,$J,"PRO",960,0)
	;;=IBTRE ADD TRACKING^Add Tracking Entry^^A^^^^^^^^INTEGRATED BILLING
	;;^UTILITY(U,$J,"PRO",960,20)
	;;=D AT^IBTRE2
	;;^UTILITY(U,$J,"PRO",960,99)
	;;=55760,74735
	;;^UTILITY(U,$J,"PRO",961,0)
	;;=IBTRE DELETE TRACKING^Delete Tracking Entry^^A^^^^^^^^INTEGRATED BILLING
	;;^UTILITY(U,$J,"PRO",961,20)
	;;=D DT^IBTRE1
	;;^UTILITY(U,$J,"PRO",961,99)
	;;=55760,74735
	;;^UTILITY(U,$J,"PRO",962,0)
	;;=IBTRE EDIT REVIEWS^Hospital Reviews^^A^^^^^^^^INTEGRATED BILLING
	;;^UTILITY(U,$J,"PRO",962,20)
	;;=D NX^IBTRE1("IBT REVIEW EDITOR")
	;;^UTILITY(U,$J,"PRO",962,99)
	;;=55760,74735
	;;^UTILITY(U,$J,"PRO",963,0)
	;;=IBTRE QUICK EDIT^Quick Edit^^A^^^^^^^^INTEGRATED BILLING
	;;^UTILITY(U,$J,"PRO",963,20)
	;;=D QE^IBTRE1
	;;^UTILITY(U,$J,"PRO",963,99)
	;;=55760,74735
	;;^UTILITY(U,$J,"PRO",964,0)
	;;=IBTRE COMMUNICATIONS EDIT^Insurance Reviews^^A^^^^^^^^INTEGRATED BILLING
	;;^UTILITY(U,$J,"PRO",964,20)
	;;=D NX^IBTRE1("IBT COMMUNICATIONS EDITOR")
	;;^UTILITY(U,$J,"PRO",964,99)
	;;=55760,74735
	;;^UTILITY(U,$J,"PRO",965,0)
	;;=IBTRE VIEW/EDIT TRACKING^View/Edit Episode^^A^^^^^^^^INTEGRATED BILLING
	;;^UTILITY(U,$J,"PRO",965,20)
	;;=D NX^IBTRE1("IBT EXPAND/EDIT TRACKING")
	;;^UTILITY(U,$J,"PRO",965,99)
	;;=55760,74735
	;;^UTILITY(U,$J,"PRO",966,0)
	;;=IBTRE DENIALS/APPEALS^Appeals Edit^^A^^^^^^^^INTEGRATED BILLING
	;;^UTILITY(U,$J,"PRO",966,20)
	;;=D NX^IBTRE1("IBT APPEAL/DENIAL EDITOR")
	;;^UTILITY(U,$J,"PRO",966,99)
	;;=55760,74735
	;;^UTILITY(U,$J,"PRO",967,0)
	;;=IBTRE CHANGE DATE^Change Date Range^^A^^^^^^^^INTEGRATED BILLING
	;;^UTILITY(U,$J,"PRO",967,20)
	;;=D CD^IBTRE1
	;;^UTILITY(U,$J,"PRO",967,99)
	;;=55760,74735
	;;^UTILITY(U,$J,"PRO",968,0)
	;;=IBTRED  MENU^Expanded Claims Tracking Menu^^M^^^^^^^^INTEGRATED BILLING
	;;^UTILITY(U,$J,"PRO",968,4)
	;;=26^4
	;;^UTILITY(U,$J,"PRO",968,10,0)
	;;=^101.01PA^9^10
	;;^UTILITY(U,$J,"PRO",968,10,1,0)
	;;=969^BI^11
	;;^UTILITY(U,$J,"PRO",968,10,1,"^")
	;;=IBTRED BILLING INFO
	;;^UTILITY(U,$J,"PRO",968,10,3,0)
	;;=971^RI^21
	;;^UTILITY(U,$J,"PRO",968,10,3,"^")
	;;=IBTRED UR INFO
	;;^UTILITY(U,$J,"PRO",968,10,4,0)
	;;=972^TA^22
	;;^UTILITY(U,$J,"PRO",968,10,4,"^")
	;;=IBTRED PRECERT INFO
	;;^UTILITY(U,$J,"PRO",968,10,5,0)
	;;=973^HR^31
	;;^UTILITY(U,$J,"PRO",968,10,5,"^")
	;;=IBTRED EDIT REVIEWS
	;;^UTILITY(U,$J,"PRO",968,10,6,0)
	;;=974^IR^32
	;;^UTILITY(U,$J,"PRO",968,10,6,"^")
	;;=IBTRED COMMUNICATIONS EDIT
	;;^UTILITY(U,$J,"PRO",968,10,7,0)
	;;=1041^DU^35
	;;^UTILITY(U,$J,"PRO",968,10,7,"^")
	;;=IBTRED DIAGNOSIS UPDATE
	;;^UTILITY(U,$J,"PRO",968,10,8,0)
	;;=927^EX^41
	;;^UTILITY(U,$J,"PRO",968,10,8,"^")
	;;=IBCNS EXIT
	;;^UTILITY(U,$J,"PRO",968,10,9,0)
	;;=1045^PU^36
	;;^UTILITY(U,$J,"PRO",968,10,9,"^")
	;;=IBTRED PROCEDURE UPDATE
	;;^UTILITY(U,$J,"PRO",968,10,10,0)
	;;=1051^PV^37
	;;^UTILITY(U,$J,"PRO",968,10,10,"^")
	;;=IBTRED PROVIDER UPDATE
	;;^UTILITY(U,$J,"PRO",968,15)
	;;=I $G(IBFASTXT)=1 S VALMBCK="Q"
	;;^UTILITY(U,$J,"PRO",968,26)
	;;=D SHOW^VALM
	;;^UTILITY(U,$J,"PRO",968,28)
	;;=Select Action: 
