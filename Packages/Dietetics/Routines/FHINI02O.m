FHINI02O	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,790,1)
	;;=0^0^0^295^57.5^^^0^.04^0^4^2^1^.04^.021^.018^^0^0^.006
	;;^UTILITY(U,$J,112,790,2)
	;;=.004^.013^0^.001^0^0^0^0^0^0^0^0^0^0^42.5
	;;^UTILITY(U,$J,112,790,3)
	;;=0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0
	;;^UTILITY(U,$J,112,790,4)
	;;=0^0^0^0^0^0^0^0
	;;^UTILITY(U,$J,112,790,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,791,0)
	;;=BEVERAGE, WINE, DESSERT^14-057^fl. oz.^30^100^N
	;;^UTILITY(U,$J,112,791,1)
	;;=.2^0^11.8^153^72.5^^^8^.24^9^9^92^9^.07^.045^.119^^0^0^.018
	;;^UTILITY(U,$J,112,791,2)
	;;=.018^.213^.032^0^.4^0^0^0^0^0^0^0^0^.3^15.3^^0
	;;^UTILITY(U,$J,112,791,4)
	;;=0^0^0^0^0^0^0^0^0
	;;^UTILITY(U,$J,112,791,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,792,0)
	;;=BEVERAGE, WINE, TABLE^14-084^fl. oz.^29^100^N
	;;^UTILITY(U,$J,112,792,1)
	;;=.2^0^1.4^70^88.9^^^8^.41^10^14^89^8^.07^.014^.145^^0^0^.004
	;;^UTILITY(U,$J,112,792,2)
	;;=.016^.074^.028^.024^1.1^.01^0^0^0^0^0^0^0^.2^9.3^^0
	;;^UTILITY(U,$J,112,792,4)
	;;=0^0^0^0^0^0^0^0^.005
	;;^UTILITY(U,$J,112,792,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,793,0)
	;;=BEVERAGE, QUININE SODAS, CARBONATED, SWEETENED^14-155^fl. oz.^30.5^100^N
	;;^UTILITY(U,$J,112,793,1)
	;;=0^0^8.8^34^91.1^^^1^.01^0^0^0^4^.1^.006^.001^^0^0^0
	;;^UTILITY(U,$J,112,793,2)
	;;=0^0^0^0^0^0^0^0^0^0^0^0^0^.1^^^0
	;;^UTILITY(U,$J,112,793,3)
	;;=0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0
	;;^UTILITY(U,$J,112,793,4)
	;;=0^0^0^0^0^0^0^0
	;;^UTILITY(U,$J,112,793,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,794,0)
	;;=BEVERAGE, CLUB SODAS, CARBONATED, UNSW^14-121^fl. oz.^29.6^100^N
	;;^UTILITY(U,$J,112,794,1)
	;;=0^0^0^0^99.9^^^5^.01^1^0^2^21^.1^.006^.001^^0^0^0
	;;^UTILITY(U,$J,112,794,2)
	;;=0^0^0^0^0^0^0^0^0^0^0^0^0^.1^^^0
	;;^UTILITY(U,$J,112,794,3)
	;;=0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0
	;;^UTILITY(U,$J,112,794,4)
	;;=0^0^0^0^0^0^0^0
	;;^UTILITY(U,$J,112,794,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,795,0)
	;;=BEVERAGE, COLA TYPE, CARBONATED^14-400^fl. oz.^30.8^100^N
	;;^UTILITY(U,$J,112,795,1)
	;;=0^0^10.4^41^89.4^^^3^.03^1^12^1^4^.01^.011^.035^^0^0^0
	;;^UTILITY(U,$J,112,795,2)
	;;=0^0^0^0^0^0^.022^^0^.005^^^0^.1^^10^0
	;;^UTILITY(U,$J,112,795,4)
	;;=^^^^^^.009^^.005^.1
	;;^UTILITY(U,$J,112,795,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,796,0)
	;;=BEVERAGE, CREAM SODAS, CARBONATED^14-130^fl. oz.^30.9^100^N
	;;^UTILITY(U,$J,112,796,1)
	;;=0^0^13.3^51^86.7^^^5^.05^1^0^1^12^.07^.008^.013^^0^0^0
	;;^UTILITY(U,$J,112,796,2)
	;;=0^0^0^0^0^0^0^0^0^0^0^0^0^.1^^^0
	;;^UTILITY(U,$J,112,796,3)
	;;=0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0
	;;^UTILITY(U,$J,112,796,4)
	;;=0^0^0^0^0^0^0^0
	;;^UTILITY(U,$J,112,796,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,797,0)
	;;=BEVERAGE, FRUIT-FLAV SODAS & MIXERS, CARBONATED^14-150^fl. oz.^31^100^N
	;;^UTILITY(U,$J,112,797,1)
	;;=0^0^12.3^48^87.6^^^5^.06^1^1^2^12^.1^.015^.013^^0^0^0
	;;^UTILITY(U,$J,112,797,2)
	;;=0^0^0^0^0^0^0^0^0^0^0^0^0^.1^^^0
	;;^UTILITY(U,$J,112,797,3)
	;;=0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0
	;;^UTILITY(U,$J,112,797,4)
	;;=0^0^0^0^0^0^0^0
	;;^UTILITY(U,$J,112,797,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,798,0)
	;;=BEVERAGE, GINGER ALE^14-136^fl. oz.^30.5^100^N
	;;^UTILITY(U,$J,112,798,1)
	;;=0^0^8.7^34^91.2^^^3^.18^1^0^1^7^.05^.018^.013^^0^0^0
	;;^UTILITY(U,$J,112,798,2)
	;;=0^0^0^0^0^0^0^^0^0^^^0^0^^^0
	;;^UTILITY(U,$J,112,798,4)
	;;=^^^^^^0^^.01
	;;^UTILITY(U,$J,112,798,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,799,0)
	;;=BEVERAGE, ROOT BEER, CARBONATED^14-157^fl. oz.^30.8^100^N
	;;^UTILITY(U,$J,112,799,1)
	;;=0^0^10.6^41^89.3^^^5^.05^1^0^1^13^.07^.007^.013^^0^0^0
	;;^UTILITY(U,$J,112,799,2)
	;;=0^0^0^0^0^0^0^0^0^0^0^0^0^.1^^0^0
	;;^UTILITY(U,$J,112,799,4)
	;;=0^0^0^0^0^0^0^0
	;;^UTILITY(U,$J,112,799,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,800,0)
	;;=BEVERAGE, SPECIAL DIETARY, CARBONATED, <1 KCAL/OZ^14-166^fl. oz.^29.6^100^N
	;;^UTILITY(U,$J,112,800,1)
	;;=0^0^.1^0^99.8^^^4^.04^1^11^2^16^.05^.025^.017^^0^0^0
	;;^UTILITY(U,$J,112,800,2)
	;;=0^0^0^0^0^0^0^0^0^0^0^0^0^.1^^11^0
	;;^UTILITY(U,$J,112,800,4)
	;;=0^0^0^0^0^0^0^0^.005
	;;^UTILITY(U,$J,112,800,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,801,0)
	;;=BISCUITS, HOME REC, BAKING POW, ENR^18-016^biscuits^28^100^N
	;;^UTILITY(U,$J,112,801,1)
	;;=7^16.3^44.6^354^28.9^^^235^2.9^18^164^121^580^.54^.082^.378^^82^.2^.356
	;;^UTILITY(U,$J,112,801,2)
	;;=.31^2.949^.285^.035^12^.08^3.9^.263^3^4.324^6.93^4.163^23^3.2
	;;^UTILITY(U,$J,112,801,3)
	;;=.087^.211^.273^.514^.226^.132^.132^.347^.232^.313^.275^.161^.226^.335^2.175^.231^.78^.352
