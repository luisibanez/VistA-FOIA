FHINI0CU	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,8197,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8198,0)
	;;=MCDLT,MCDONALD'S^BC-01471^sandwich^234
	;;^UTILITY(U,$J,112,8198,1)
	;;=11.239^15.726^15.385^247.863^^^^96.154^1.671^^^^423.077^^^^^322.222^2.991^.167
	;;^UTILITY(U,$J,112,8198,2)
	;;=.154^2.949^^^^^^^46.581^4.915^7.137^3.632
	;;^UTILITY(U,$J,112,8198,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8199,0)
	;;=MUFFLN, APPLE BRAN,MCDONALD'S^BC-01472^muffin^85
	;;^UTILITY(U,$J,112,8199,1)
	;;=5.882^0^54.118^223.529^^^^36.471^.706^^^^270.588^^^^^8.235^1.176^.024
	;;^UTILITY(U,$J,112,8199,2)
	;;=.094^.471^^^^^^^0^0^0^0
	;;^UTILITY(U,$J,112,8199,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8200,0)
	;;=PIE,APPLE,MCDONALD'S^BC-01473^snack pie^83
	;;^UTILITY(U,$J,112,8200,1)
	;;=2.651^17.831^36.145^313.253^^^^13.253^.855^^^^289.157^^^^^0^13.253^.072
	;;^UTILITY(U,$J,112,8200,2)
	;;=.024^.361^^^^^^^7.229^5.783^10.964^1.084
	;;^UTILITY(U,$J,112,8200,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8201,0)
	;;=QUARTER POUNDER,MCDONALD'S^BC-01474^sandwich^166
	;;^UTILITY(U,$J,112,8201,1)
	;;=13.916^12.47^20.482^246.988^^^^85.542^2.217^^^^397.59^^^^^134.337^1.807^.217
	;;^UTILITY(U,$J,112,8201,2)
	;;=.175^4.036^^^^^^^51.807^4.88^6.867^.723
	;;^UTILITY(U,$J,112,8201,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8202,0)
	;;=QUARTER POUNDER W/ CHEESE,MCDONALD'S^BC-01475^sandwich^194
	;;^UTILITY(U,$J,112,8202,1)
	;;=14.691^15.052^18.093^268.041^^^^152.062^1.918^^^^592.784^^^^^362.371^1.546^.191
	;;^UTILITY(U,$J,112,8202,2)
	;;=.201^3.454^^^^^^^60.825^5.773^8.505^.773
	;;^UTILITY(U,$J,112,8202,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8203,0)
	;;=SALAD DRESSING & TOPPINGS,BACON BITS,MCDONALD'S^BC-01476^.1-oz.^3
	;;^UTILITY(U,$J,112,8203,1)
	;;=43.333^40^3.333^533.333^^^^0^0^^^^3166.667^^^^^0^0^0
	;;^UTILITY(U,$J,112,8203,2)
	;;=0^0^^^^^^^0^0^40^0
	;;^UTILITY(U,$J,112,8203,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8204,0)
	;;=SALAD DRESSING & TOPPINGS,BLUE CHEESE,MCDONALD'S^BC-01477^.5-oz.^14
	;;^UTILITY(U,$J,112,8204,1)
	;;=3.571^49.286^8.571^500^^^^107.143^.214^^^^1071.429^^^^^128.571^0^0
	;;^UTILITY(U,$J,112,8204,2)
	;;=.143^0^^^^^^^42.857^9.286^12.857^27.143
	;;^UTILITY(U,$J,112,8204,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8205,0)
	;;=SALAD DRESSING & TOPPINGS,CROUTONS,MCDONALD'S^BC-01478^.4-oz.^11
	;;^UTILITY(U,$J,112,8205,1)
	;;=12.727^20^61.818^454.545^^^^54.545^3.182^^^^1272.727^^^^^0^0^.455
	;;^UTILITY(U,$J,112,8205,2)
	;;=.273^3.636^^^^^^^0^4.545^11.818^.909
	;;^UTILITY(U,$J,112,8205,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8206,0)
	;;=SALAD DRESSING & TOPPINGS,PEPPERCORN,MCDONALD'S^BC-01479^.5-oz.^14
	;;^UTILITY(U,$J,112,8206,1)
	;;=1.429^62.143^3.571^571.429^^^^21.429^.357^^^^607.143^^^^^64.286^0^0
	;;^UTILITY(U,$J,112,8206,2)
	;;=0^0^^^^^^^50^10^15.714^37.143
	;;^UTILITY(U,$J,112,8206,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8207,0)
	;;=SALAD DRESSING & TOPPINGS,RANCH,MCDONALD'S^BC-01480^.5-oz.^14
	;;^UTILITY(U,$J,112,8207,1)
	;;=1.429^61.429^9.286^592.857^^^^50^.286^^^^928.571^^^^^78.571^0^.071
	;;^UTILITY(U,$J,112,8207,2)
	;;=.143^0^^^^^^^35.714^10^15.714^36.429
	;;^UTILITY(U,$J,112,8207,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8208,0)
	;;=SALAD DRESSING & TOPPINGS,RED FRENCH,RED. CALORIE,MCDONALD'S^BC-01481^.5-oz.^14
	;;^UTILITY(U,$J,112,8208,1)
	;;=.714^13.571^37.143^285.714^^^^21.429^.714^^^^785.714^^^^^528.571^7.143^0
	;;^UTILITY(U,$J,112,8208,2)
	;;=0^.714^^^^^^^0^2.143^3.571^7.857
	;;^UTILITY(U,$J,112,8208,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8209,0)
	;;=SALAD DRESSING & TOPPINGS,THOUSAND ISLAND,MCDONALD'S^BC-01482^.5-oz.^14
	;;^UTILITY(U,$J,112,8209,1)
	;;=1.429^53.571^17.143^557.143^^^^21.429^.571^^^^714.286^^^^^350^0^0
	;;^UTILITY(U,$J,112,8209,2)
	;;=0^0^^^^^^^57.143^8.571^13.571^31.429
	;;^UTILITY(U,$J,112,8209,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8210,0)
	;;=SALAD DRESSING & TOPPINGS,VINAIGRETTE,LITE,MCDONALD'S^BC-01483^.5-oz.^14
	;;^UTILITY(U,$J,112,8210,1)
	;;=1.429^3.571^14.286^107.143^^^^21.429^.286^^^^535.714^^^^^657.143^0^0
	;;^UTILITY(U,$J,112,8210,2)
	;;=0^0^^^^^^^0^.714^.714^2.143
	;;^UTILITY(U,$J,112,8210,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
