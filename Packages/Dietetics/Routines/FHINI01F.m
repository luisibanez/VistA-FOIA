FHINI01F	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,328,3)
	;;=.011^.022^.024^.032^.02^.009^.006^.024^.019^.03^.05^.012^.04^.123^.218^.021^.02^.024
	;;^UTILITY(U,$J,112,328,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,329,0)
	;;=BF, VEGETABLES, SQUASH, STR^3-104^jars^128^100^N
	;;^UTILITY(U,$J,112,329,1)
	;;=.8^.2^5.6^24^92.7^^^24^.3^12^15^179^2^.141^.054^^^2023^7.7^.011
	;;^UTILITY(U,$J,112,329,2)
	;;=.056^.354^.22^.063^15.4^0^^^^^^^202^.6^^^2.1
	;;^UTILITY(U,$J,112,329,3)
	;;=.012^.025^.033^.047^.031^.01^.007^.029^.028^.036^.046^.016^.035^.089^.146^.031^.03^.033
	;;^UTILITY(U,$J,112,329,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,330,0)
	;;=BF, VEGETABLES, SWEETPOTATOES, STR^3-108^jars^135^100^N
	;;^UTILITY(U,$J,112,330,1)
	;;=1.1^.1^13.2^57^84.8^^^16^.37^13^24^263^20^.206^.081^^^6438^9.9^.028
	;;^UTILITY(U,$J,112,330,2)
	;;=.033^.358^.39^.093^9.8^0^^^^^^^644^.8^^^1.5
	;;^UTILITY(U,$J,112,330,3)
	;;=.022^.054^.051^.078^.044^.024^.015^.062^.041^.073^.054^.026^.061^.199^.118^.05^.055^.051
	;;^UTILITY(U,$J,112,330,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,331,0)
	;;=BF, VEGETABLES, SWEETPOTATOES, BUTTERED, STR^3-110^jars^135^100^N
	;;^UTILITY(U,$J,112,331,1)
	;;=.9^.7^11.8^56^85.9^^^21^.45^^^208^8^^^^^6814^9.1^.018
	;;^UTILITY(U,$J,112,331,2)
	;;=.04^.272^^^13.1^^^^^^^^681^.7
	;;^UTILITY(U,$J,112,331,3)
	;;=.018^.045^.042^.064^.036^.02^.013^.052^.034^.061^.045^.021^.05^.165^.098^.042^.046^.042
	;;^UTILITY(U,$J,112,331,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,332,0)
	;;=BF, FRUIT, APPLESAUCE, STR^3-116^jars^128^100^N
	;;^UTILITY(U,$J,112,332,1)
	;;=.2^.2^10.9^41^88.6^^^4^.22^3^7^71^2^.023^.038^^^17^38.3^.012
	;;^UTILITY(U,$J,112,332,2)
	;;=.028^.061^.11^.031^1.9^0^^^^^^^2^.2^^^1.7
	;;^UTILITY(U,$J,112,332,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,333,0)
	;;=BF, FRUIT, APRICOT W/TAPIOCA, STR^3-118^jars^135^100^N
	;;^UTILITY(U,$J,112,333,1)
	;;=.3^0^16.3^60^83.1^^^9^.3^4^10^121^8^.045^.034^^^725^21.6^.008
	;;^UTILITY(U,$J,112,333,2)
	;;=.013^.195^.13^.03^1.5^0^^^^^^^72^.3^^^1.5
	;;^UTILITY(U,$J,112,333,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,334,0)
	;;=BF, VEGETABLES, CORN, CREAMED, STR^3-119^jars^128^100^N
	;;^UTILITY(U,$J,112,334,1)
	;;=1.4^.4^14.1^57^83.6^^^20^.28^8^33^90^43^.19^.034^^^75^2.1^.013
	;;^UTILITY(U,$J,112,334,2)
	;;=.047^.512^.29^.041^11.3^.02^^^^^^^7^.5^^^2.1
	;;^UTILITY(U,$J,112,334,3)
	;;=.015^.052^.065^.14^.081^.04^.018^.049^.067^.077^.06^.046^.07^.099^.275^.036^.161^.062
	;;^UTILITY(U,$J,112,334,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,335,0)
	;;=BF, VEGETABLES, PEAS, STR^3-121^jars^128^100^N
	;;^UTILITY(U,$J,112,335,1)
	;;=3.5^.3^8.1^40^87.5^^^20^.96^15^43^112^4^.349^.064^^^565^6.9^.081
	;;^UTILITY(U,$J,112,335,2)
	;;=.061^1.018^.28^.069^25.9^0^^^^^^^56^.5^^^2.1
	;;^UTILITY(U,$J,112,335,3)
	;;=.034^.136^.151^.235^.234^.04^.026^.143^.119^.169^.389^.075^.185^.311^.507^.133^.165^.132
	;;^UTILITY(U,$J,112,335,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,336,0)
	;;=BF, FRUIT, BANANAS, STR^3-129^jars^135^100^N
	;;^UTILITY(U,$J,112,336,1)
	;;=.4^.1^15.3^57^84^^^5^.2^10^7^88^9^.06^.04^^^43^16.7^.012
	;;^UTILITY(U,$J,112,336,2)
	;;=.031^.183^.15^.115^5.5^0^^^^^^^4^.3^^^1.6
	;;^UTILITY(U,$J,112,336,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,337,0)
	;;=BF, FRUIT, PEACHES W/SUGAR, STR^3-130^jars^135^100^N
	;;^UTILITY(U,$J,112,337,1)
	;;=.5^.2^18.9^71^80.1^^^6^.24^6^12^162^6^.085^.053^^^161^31.4^.011
	;;^UTILITY(U,$J,112,337,2)
	;;=.033^.609^.13^.015^3.9^0^^^^^^^16^.3^^^1.5
	;;^UTILITY(U,$J,112,337,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,338,0)
	;;=BF, FRUIT, PEARS, STR^3-132^jars^128^100^N
	;;^UTILITY(U,$J,112,338,1)
	;;=.3^.2^10.8^41^88.4^^^8^.24^8^12^130^2^.075^.065^^^33^24.5^.013
	;;^UTILITY(U,$J,112,338,2)
	;;=.028^.189^.09^.008^3.6^0^^^^^^^3^.3^^^3.6
	;;^UTILITY(U,$J,112,338,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,339,0)
	;;=BF, FRUIT, PLUMS W/TAPIOCA, WO ASCORBIC ACID, STR^3-134^jars^135^100^N
	;;^UTILITY(U,$J,112,339,1)
	;;=.1^0^19.7^71^80^^^6^.2^4^6^85^6^.078^.037^^^95^1.1^.008
	;;^UTILITY(U,$J,112,339,2)
	;;=.028^.213^.11^.024^.9^0^^^^^^^10^.2^^^1.2
	;;^UTILITY(U,$J,112,339,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,340,0)
	;;=BF, FRUIT, PRUNES W/TAPIOCA, WO/ASCORBIC ACID, STR^3-136^jars^135^100^N
	;;^UTILITY(U,$J,112,340,1)
	;;=.6^.1^18.5^70^80.3^^^15^.35^10^15^177^5^.089^.061^^^453^.8^.022
	;;^UTILITY(U,$J,112,340,2)
	;;=.075^.525^.14^.081^.2^0^^^^^^^45^.5^^^2.7
