FHINI031	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,930,1)
	;;=7.8^18.6^70.2^456^2.3^^^100^1.9^^166^255^20^^^^^0^0^.05
	;;^UTILITY(U,$J,112,930,2)
	;;=.27^1^^^^^3.72^^0^1.49^^^^1.1
	;;^UTILITY(U,$J,112,930,4)
	;;=^^^^^^12.46
	;;^UTILITY(U,$J,112,930,20)
	;;=USDA  Std. Reference, Release 8
	;;^UTILITY(U,$J,112,931,0)
	;;=CANDY, SUGAR COATED CHOCOLATE DISCS^614-0^oz.^28.3^100^N
	;;^UTILITY(U,$J,112,931,1)
	;;=5.2^19.7^72.7^466^1.2^^^135^1.3^^140^250^72^^^^^100^0^.06
	;;^UTILITY(U,$J,112,931,2)
	;;=.2^.3^^^^^.43^^12^10.99^^^^1.2
	;;^UTILITY(U,$J,112,931,4)
	;;=^^^^^^7.13
	;;^UTILITY(U,$J,112,931,20)
	;;=USDA  Std. Reference, Release 8
	;;^UTILITY(U,$J,112,933,0)
	;;=CAROB FLOUR, (ST JOHNSBREAD)^16-055^tbsp.^8^100^N
	;;^UTILITY(U,$J,112,933,1)
	;;=4.62^.65^88.88^383^3.58^^^348^2.94^54^79^827^35^.92^.571^.508^^14^.2^.053
	;;^UTILITY(U,$J,112,933,2)
	;;=.461^1.897^.047^.366^29^0^.212^.004^0^.09^.197^.216^1^2.27^^^39.8
	;;^UTILITY(U,$J,112,933,3)
	;;=.048^.271^.209^.442^.196^.081^.029^.151^.12^.446^.13^.122^.584^.503^.362^.267^.354^.304
	;;^UTILITY(U,$J,112,933,4)
	;;=^^.001^.072^.004^.014^.194
	;;^UTILITY(U,$J,112,933,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,934,0)
	;;=CARROTS, RAW^11-124^carrots^72.09^89^N
	;;^UTILITY(U,$J,112,934,1)
	;;=1.03^.19^10.14^43^87.79^^^27^.5^15^44^323^35^.2^.047^.142^^28129^9.3^.097
	;;^UTILITY(U,$J,112,934,2)
	;;=.059^.928^.197^.147^14^0^.067^.01^0^.03^.008^.077^2813^.87^^^3.2
	;;^UTILITY(U,$J,112,934,3)
	;;=.011^.038^.041^.043^.04^.007^.008^.032^.02^.044^.043^.016^.059^.137^.202^.03^.029^.035
	;;^UTILITY(U,$J,112,934,4)
	;;=^.002^.001^.023^.002^.001^.006^^5^1.1
	;;^UTILITY(U,$J,112,934,20)
	;;=USDA Std. Reference, Release 10;HCF Nutrition Research Foundation, Inc, 1990
	;;^UTILITY(U,$J,112,935,0)
	;;=CARROTS, CKD WO/SALT^11-125^cups^145^100^N
	;;^UTILITY(U,$J,112,935,1)
	;;=1.09^.18^10.48^45^87.38^^^31^.62^13^30^227^66^.3^.134^.752^^24554^2.3^.034
	;;^UTILITY(U,$J,112,935,2)
	;;=.056^.506^.304^.246^13.9^0^.076^.011^0^.034^.009^.088^2455^.87^^^2.6
	;;^UTILITY(U,$J,112,935,3)
	;;=.012^.04^.043^.046^.043^.007^.009^.034^.021^.046^.045^.017^.062^.144^.213^.031^.031^.037
	;;^UTILITY(U,$J,112,935,4)
	;;=^.002^.001^.026^.002^.001^.006^^18^.8
	;;^UTILITY(U,$J,112,935,20)
	;;=USDA Std. Reference, Release 10;HCF Nutrition Research Foundation, Inc, 1990
	;;^UTILITY(U,$J,112,936,0)
	;;=CARROTS, CKD W/SALT^11-757^cups^145^100^N
	;;^UTILITY(U,$J,112,936,1)
	;;=1.09^.18^10.48^45^87.38^^^31^.62^13^30^227^302^.3^.134^.752^^24554^2.3^.034
	;;^UTILITY(U,$J,112,936,2)
	;;=.056^.506^.304^.246^13.9^0^.076^.011^0^.034^.009^.088^2455^.87
	;;^UTILITY(U,$J,112,936,3)
	;;=.012^.04^.043^.046^.043^.007^.009^.034^.021^.046^.045^.017^.062^.144^.213^.031^.031^.037
	;;^UTILITY(U,$J,112,936,4)
	;;=^.002^.001^.026^.002^.001^.006
	;;^UTILITY(U,$J,112,936,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,939,0)
	;;=CARROTS, CND, REG PK^11-128^cups^145^100^N
	;;^UTILITY(U,$J,112,939,1)
	;;=.64^.19^5.54^23^92.95^^^25^.64^8^24^179^241^.26^.104^.45^^13774^2.7^.018
	;;^UTILITY(U,$J,112,939,2)
	;;=.03^.552^.135^.112^9.2^0^.079^.011^0^.036^.009^.092^1377^.68^^^2
	;;^UTILITY(U,$J,112,939,3)
	;;=.007^.023^.025^.027^.025^.004^.005^.02^.012^.027^.026^.01^.036^.084^.124^.018^.018^.021
	;;^UTILITY(U,$J,112,939,4)
	;;=^.002^.001^.027^.002^.001^.007
	;;^UTILITY(U,$J,112,939,20)
	;;=USDA Std. Reference, Release 10;HCF Nutrition Research Foundation, Inc, 1990
	;;^UTILITY(U,$J,112,941,0)
	;;=CARROTS, CND, DIET PK, LO NA^11-759^cups^155^100^N
	;;^UTILITY(U,$J,112,941,1)
	;;=.64^.19^5.54^23^92.95^^^25^.64^8^24^179^42^.26^.104^.45^^13774^2.7^.018
	;;^UTILITY(U,$J,112,941,2)
	;;=.03^.552^.135^.112^9.2^0^.079^.011^0^.036^.009^.092^1377^.68
	;;^UTILITY(U,$J,112,941,3)
	;;=.007^.023^.025^.027^.025^.004^.005^.02^.012^.027^.026^.01^.036^.084^.124^.018^.018^.021
	;;^UTILITY(U,$J,112,941,4)
	;;=^.002^.001^.027^.002^.001^.007
	;;^UTILITY(U,$J,112,941,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,942,0)
	;;=CASHEW NUTS, WO/SALT^12-086^oz.^28.3^100^N
	;;^UTILITY(U,$J,112,942,1)
	;;=16.15^48.21^28.52^576^3.91^^^41^4.1^255^426^530^17^4.75^2.17^.807^^0^0^.424
	;;^UTILITY(U,$J,112,942,2)
	;;=.175^1.8^1.19^.25^67.7^0^7.968^.167^0^9.526^28.415^8.152^0^3.21^^^3.8
	;;^UTILITY(U,$J,112,942,3)
	;;=.25^.625^.771^1.356^.862^.289^.299^.835^.518^1.097^1.837^.42^.74^1.587^3.824^.847^.728^.896
	;;^UTILITY(U,$J,112,942,4)
	;;=.137^.816^.361^4.526^.331^3.091^27.886^^^11.4
	;;^UTILITY(U,$J,112,942,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,943,0)
	;;=CASHEW NUTS, W/SALT^12-586^oz.^28.3^100^N
