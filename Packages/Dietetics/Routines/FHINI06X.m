FHINI06X	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,2402,0)
	;;=BF, FRUIT, APPLESAUCE & CHERRIES, STRAINED^3-144^jars^135^100^N
	;;^UTILITY(U,$J,112,2402,1)
	;;=.3^0^13.1^48^86.4^^^10^.39^4^8^96^2^.027^.045^^^39^33.5^.016
	;;^UTILITY(U,$J,112,2402,2)
	;;=.042^.098^.131^.037^.4^0^^^^^^^4^.3^^^1.5
	;;^UTILITY(U,$J,112,2402,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2403,0)
	;;=BF, FRUIT, APPLESAUCE & CHERRIES, JUNIOR^3-145^jars^220^100^N
	;;^UTILITY(U,$J,112,2403,1)
	;;=.3^0^13.2^48^86.3^^^9^.41^4^8^97^3^.028^.046^^^41^23.2^.015
	;;^UTILITY(U,$J,112,2403,2)
	;;=.046^.098^.13^.039^.4^0^^^^^^^4^.3^^^1.5
	;;^UTILITY(U,$J,112,2403,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2404,0)
	;;=BF, FRUIT, APPLESAUCE & PINEAPPLE, STRAINED^3-150^jars^128^100^N
	;;^UTILITY(U,$J,112,2404,1)
	;;=.1^.1^10.1^37^89.5^^^4^.1^3^6^78^2^.015^.035^^^20^28.1^.021
	;;^UTILITY(U,$J,112,2404,2)
	;;=.026^.078^.101^.039^1.9^0^^^^^^^2^.2^^^1.5
	;;^UTILITY(U,$J,112,2404,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2405,0)
	;;=BF, FRUIT, APPLESAUCE & PINEAPPLE, JUNIOR^3-151^jars^213^100^N
	;;^UTILITY(U,$J,112,2405,1)
	;;=.1^.1^10.5^39^89.1^^^4^.1^4^6^76^2^.03^.036^^^21^26.8^.022
	;;^UTILITY(U,$J,112,2405,2)
	;;=.027^.079^.104^.039^2^0^^^^^^^2^.2^^^1.5
	;;^UTILITY(U,$J,112,2405,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2406,0)
	;;=BF, FRUIT, APPLE & RASPBERRY, W/SUGAR, STRAINED^3-152^jars^135^100^N
	;;^UTILITY(U,$J,112,2406,1)
	;;=.2^.2^15.7^58^83.8^^^5^.22^4^8^80^2^.033^.054^^^22^26.8^.014
	;;^UTILITY(U,$J,112,2406,2)
	;;=.028^.106^.09^.034^3.4^0^^^^^^^2^.2^^^2.1
	;;^UTILITY(U,$J,112,2406,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2407,0)
	;;=BF, FRUIT, APPLE & RASPBERRY, W/SUGAR, JUNIOR^3-153^jars^220^100^N
	;;^UTILITY(U,$J,112,2407,1)
	;;=.2^.2^15.5^58^84^^^5^.22^4^8^72^2^.032^.053^^^30^28.9^.012
	;;^UTILITY(U,$J,112,2407,2)
	;;=.029^.104^.088^.034^3.3^0^^^^^^^3^.2^^^2.1
	;;^UTILITY(U,$J,112,2407,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2408,0)
	;;=BF, FRUIT, BANANAS & PINEAPPLE WITH TAPIOCA, JNR^3-156^jars^135^100^N
	;;^UTILITY(U,$J,112,2408,1)
	;;=.2^.1^18.4^68^81.1^^^7^.13^6^5^78^8^.031^.04^^^40^21.2^.015
	;;^UTILITY(U,$J,112,2408,2)
	;;=.019^.182^.148^.092^5.5^0^^^^^^^4^.2^^^1.6
	;;^UTILITY(U,$J,112,2408,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2409,0)
	;;=BF, FRUIT, BANANAS & PINEAPPLE WITH TAPIOCA, STR^3-157^jars^220^100^N
	;;^UTILITY(U,$J,112,2409,1)
	;;=.2^0^17.8^65^81.7^^^7^.23^6^5^68^6^.04^.039^^^41^19.2^.019
	;;^UTILITY(U,$J,112,2409,2)
	;;=.019^.168^.143^.082^5.4^0^^^^^^^4^.2^^^1.6
	;;^UTILITY(U,$J,112,2409,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2410,0)
	;;=BF, FRUIT, PEARS & PINEAPPLE, STR^3-158^jars^128^100^N
	;;^UTILITY(U,$J,112,2410,1)
	;;=.3^.1^10.9^41^88.5^^^10^.25^7^9^116^4^.065^.14^^^29^27.5^.021
	;;^UTILITY(U,$J,112,2410,2)
	;;=.028^.207^.089^.016^2.8^0^^^^^^^3^.3^^^2.6
	;;^UTILITY(U,$J,112,2410,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2411,0)
	;;=BF, FRUIT, PEARS & PINEAPPLE, JNR^3-159^jars^213^100^N
	;;^UTILITY(U,$J,112,2411,1)
	;;=.3^.2^11.4^44^87.8^^^10^.21^7^10^118^1^.127^.105^^^32^16.8^.024
	;;^UTILITY(U,$J,112,2411,2)
	;;=.023^.183^.095^.013^2.9^0^^^^^^^3^.3^^^2.6
	;;^UTILITY(U,$J,112,2411,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2412,0)
	;;=BF, FRUIT, GUAVA & PAPAYA W/TAPIOCA, STRAINED^3-160^jars^128^100^N
	;;^UTILITY(U,$J,112,2412,1)
	;;=.2^.1^17^63^82.5^^^7^.2^5^6^74^4^.06^^^^184^80.9^.01
	;;^UTILITY(U,$J,112,2412,2)
	;;=.022^.263^^.014^2^0^^^^^^^18^.2
	;;^UTILITY(U,$J,112,2412,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2413,0)
	;;=BF, FRUIT, PAPAYA & APPLESAUCE W/TAPIOCA, STRAINED^3-162^jars^128^100^N
	;;^UTILITY(U,$J,112,2413,1)
	;;=.2^.1^18.9^70^80.6^^^7^.44^5^5^79^5^.03^.044^^^76^113.1^.01
	;;^UTILITY(U,$J,112,2413,2)
	;;=.028^.108^.28^.023^2^0^^^^^^^8^.2^^^1.4
	;;^UTILITY(U,$J,112,2413,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2414,0)
	;;=BF, FRUIT, APPLE & BLUEBERRY, STRAINED^3-164^jars^135^100^N
	;;^UTILITY(U,$J,112,2414,1)
	;;=.2^.2^16.3^61^83.1^^^4^.2^3^8^69^2^.034^.056^^^20^27.8^.017
	;;^UTILITY(U,$J,112,2414,2)
	;;=.034^.12^.163^.037^3.5^0^^^^^^^2^.2^^^1.8
	;;^UTILITY(U,$J,112,2414,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2415,0)
	;;=BF, FRUIT, APPLE & BLUEBERRY, JUNIOR^3-165^jars^220^100^N
	;;^UTILITY(U,$J,112,2415,1)
	;;=.2^.2^16.6^62^82.8^^^5^.4^3^7^65^13^.035^.057^^^42^13.9^.018
	;;^UTILITY(U,$J,112,2415,2)
	;;=.043^.103^.164^.042^3.5^0^^^^^^^4^.2^^^1.8
