FHINI0A8	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,6923,2)
	;;=2.143^25^.536^2.5^357.143^^^^0^^^^^^^^0
	;;^UTILITY(U,$J,112,6923,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,6924,0)
	;;=CEREALS,R-T-E,TOTAL,GENERAL MILLS^BC-00197^oz.^28
	;;^UTILITY(U,$J,112,6924,1)
	;;=10^2.143^79.643^357.143^3.929^^^171.429^64.286^114.286^392.857^392.857^500^2.393^.436^1.518^^17857.143^214.286^5.286
	;;^UTILITY(U,$J,112,6924,2)
	;;=6^70.714^.714^7.143^1428.571^22.143^^^0^.357^.357^1.071^5364.286^^^^10.714
	;;^UTILITY(U,$J,112,6924,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,6925,0)
	;;=CEREALS,R-T-E,TRIX,GENERAL MILLS^BC-00198^oz.^28
	;;^UTILITY(U,$J,112,6925,1)
	;;=5.357^1.429^90^392.857^^^^21.429^15.893^21.429^67.857^89.286^500^.464^.161^^^4464.286^53.571^1.321
	;;^UTILITY(U,$J,112,6925,2)
	;;=1.5^17.857^.286^1.786^^5.357^^^0^^^^1339.286
	;;^UTILITY(U,$J,112,6925,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,6926,0)
	;;=CEREALS,R-T-E,WHEAT CHEX,RALSTON PURINA^BC-00199^oz.^28
	;;^UTILITY(U,$J,112,6926,1)
	;;=10.357^2.5^82.143^357.143^2.5^^^39.286^16.071^117.857^389.286^382.143^714.286^2.643^.482^^^^53.571^1.357
	;;^UTILITY(U,$J,112,6926,2)
	;;=.357^17.857^.429^1.786^357.143^5.357^^^^^^^^^^^13.214
	;;^UTILITY(U,$J,112,6926,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,6927,0)
	;;=CEREALS,R-T-E,WHEATIES,GENERAL MILLS^BC-00200^oz.^28
	;;^UTILITY(U,$J,112,6927,1)
	;;=9.643^1.786^80.714^357.143^.357^^^153.571^15.893^110.714^350^392.857^714.286^2.25^.468^1.518^^4464.286^53.571^1.321
	;;^UTILITY(U,$J,112,6927,2)
	;;=1.5^17.857^.75^1.786^32.143^5.357^^^0^.357^.357^.714^1339.286^^^^10.714
	;;^UTILITY(U,$J,112,6927,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,6928,0)
	;;=CHEESE,AMERICAN&SWISS,PROCESSED,LAND O'LAKES^BC-00201^oz.^28
	;;^UTILITY(U,$J,112,6928,1)
	;;=20.714^29.643^2.5^360.714^^^^614.286^.464^^639.286^128.571^1582.143^0^^^^960.714^0^.036
	;;^UTILITY(U,$J,112,6928,2)
	;;=.357^0^^^^^^^92.857^18.571^7.857^1.071
	;;^UTILITY(U,$J,112,6928,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,6929,0)
	;;=CHEESE,CHEDDAR&BACON,PROCESSED,LAND O'LAKES^BC-00202^oz.^28
	;;^UTILITY(U,$J,112,6929,1)
	;;=21.429^32.143^3.571^392.857^^^^^^^^107.143^1250
	;;^UTILITY(U,$J,112,6929,2)
	;;=^^^^^^^^89.286^17.857^10.714^0
	;;^UTILITY(U,$J,112,6929,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,6930,0)
	;;=CHEESE,CREAM CHEESE,LIGHT,PHILADELPHIA BRAND^BC-00203^oz.^28
	;;^UTILITY(U,$J,112,6930,1)
	;;=10.357^16.786^6.429^221.429^65.357^^^135.714^.143^10.714^160.714^185.714^571.429^.75^.029^.018^^600^0^.036
	;;^UTILITY(U,$J,112,6930,2)
	;;=.25^0^.571^.036^17.857^.321^^^57.143^10^^.357
	;;^UTILITY(U,$J,112,6930,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,6931,0)
	;;=CHEESE,CREAM CHEESE,PHILADELPHIA BRAND^BC-00204^oz.^28
	;;^UTILITY(U,$J,112,6931,1)
	;;=8.214^33.929^2.5^350^55.357^^^71.429^.071^7.143^96.429^89.286^307.143^.607^.032^.036^^1246.429^0^.036
	;;^UTILITY(U,$J,112,6931,2)
	;;=.143^.357^.357^.036^17.857^.214^^^100^19.286^^1.071
	;;^UTILITY(U,$J,112,6931,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,6932,0)
	;;=CHEESE,HAVARTI,CASINO^BC-00205^oz.^28
	;;^UTILITY(U,$J,112,6932,1)
	;;=21.786^37.857^1.071^432.143^37.143^^^628.571^.143^17.857^407.143^46.429^514.286^3.036^.054^.018^^1289.286^0^.036
	;;^UTILITY(U,$J,112,6932,2)
	;;=.321^0^.286^.036^39.286^.571^^^121.429^23.214^^1.071
	;;^UTILITY(U,$J,112,6932,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,6933,0)
	;;=CHEESE PRODUCTS,CHEESE FOOD,PROCESSED,LAND O'LAKES^BC-00206^oz.^28
	;;^UTILITY(U,$J,112,6933,1)
	;;=18.571^22.857^8.571^314.286^^^^600^.571^^475^350^1225^8.571^^^^728.571^0^.071
	;;^UTILITY(U,$J,112,6933,2)
	;;=.571^.357^^^^^^^71.429^14.643^5.714^.714
	;;^UTILITY(U,$J,112,6933,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,6934,0)
	;;=CHEESE PRODUCTS,CHEESE NUGGETS,MOZZARELLA,BANQUET HOT BITES^BC-00207^2.63-oz.^75
	;;^UTILITY(U,$J,112,6934,1)
	;;=18.667^17.333^21.333^320^^^^525.333^1.333^^^80^706.667^^^^^25.333^0^.107
	;;^UTILITY(U,$J,112,6934,2)
	;;=.2^.267
	;;^UTILITY(U,$J,112,6934,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,6935,0)
	;;=CHEESE PRODUCTS,CHEDDAR&BACON,COUNTRY CROCK^BC-00208^oz.^28
	;;^UTILITY(U,$J,112,6935,1)
	;;=17.5^13.929^8.214^235.714^^^^^^^^^739.286
	;;^UTILITY(U,$J,112,6935,2)
	;;=^^^^^^^^57.143
