IBINI075	; ; 21-MAR-1994
	;;Version 2.0 ; INTEGRATED BILLING ;; 21-MAR-94
	Q:'DIFQR(356.8)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,356.8)
	;;=^IBE(356.8,
	;;^UTILITY(U,$J,356.8,0)
	;;=CLAIMS TRACKING NON-BILLABLE REASONS^356.8^18^19
	;;^UTILITY(U,$J,356.8,1,0)
	;;=NOT INSURED
	;;^UTILITY(U,$J,356.8,2,0)
	;;=SC TREATMENT
	;;^UTILITY(U,$J,356.8,3,0)
	;;=AGENT ORANGE
	;;^UTILITY(U,$J,356.8,4,0)
	;;=IONIZING RADIATION
	;;^UTILITY(U,$J,356.8,5,0)
	;;=ENV. CONTAM.
	;;^UTILITY(U,$J,356.8,6,0)
	;;=SERVICE NOT COVERED
	;;^UTILITY(U,$J,356.8,7,0)
	;;=COVERAGE CANCELED
	;;^UTILITY(U,$J,356.8,8,0)
	;;=NEEDS SC DETERMINATION
	;;^UTILITY(U,$J,356.8,9,0)
	;;=NON-BILLABLE APPOINTMENT TYPE
	;;^UTILITY(U,$J,356.8,10,0)
	;;=INVALID PRESCRIPTION ENTRY
	;;^UTILITY(U,$J,356.8,11,0)
	;;=REFILL ON VISIT DATE
	;;^UTILITY(U,$J,356.8,12,0)
	;;=PRESCRIPTION DELETED
	;;^UTILITY(U,$J,356.8,13,0)
	;;=PRESCRIPTION NOT RELEASED
	;;^UTILITY(U,$J,356.8,14,0)
	;;=DRUG NOT BILLABLE
	;;^UTILITY(U,$J,356.8,15,0)
	;;=HMO POLICY
	;;^UTILITY(U,$J,356.8,16,0)
	;;=REFUSES TO SIGN RELEASE (ROI)
	;;^UTILITY(U,$J,356.8,17,0)
	;;=NON-BILLABLE STOP CODE
	;;^UTILITY(U,$J,356.8,18,0)
	;;=RESEARCH VISIT
	;;^UTILITY(U,$J,356.8,999,0)
	;;=OTHER
