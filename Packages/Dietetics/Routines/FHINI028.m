FHINI028	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,602,4)
	;;=^0^.02^.11^.02^.08^.16
	;;^UTILITY(U,$J,112,602,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,603,0)
	;;=SOUP, CREAM OF VEGETABLE, DEHYDRATED, PREP W/WATER^6-501^cups^260.1^100^N
	;;^UTILITY(U,$J,112,603,1)
	;;=.73^2.19^4.73^41^91.18^^^12^.2^4^21^37^450^.1^.04^.07^^14^1.5^.47
	;;^UTILITY(U,$J,112,603,2)
	;;=.041^.2^.06^.01^3^.05^.54^.04^0^.55^.98^.57^1^1.17^^^.2
	;;^UTILITY(U,$J,112,603,4)
	;;=^^.01^.31^^.23^.98
	;;^UTILITY(U,$J,112,603,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,604,0)
	;;=SAUCE, SWEET & SOUR, DEHYDRATED, PREP W/WATER & VINEGAR^6-510^cups^313.3^100^N
	;;^UTILITY(U,$J,112,604,1)
	;;=.24^.02^23.19^94^76.01^^^13^.52^3^14^21^249^.029^.009^0^^0^0^.003
	;;^UTILITY(U,$J,112,604,2)
	;;=.031^.3^.2^.1^.6^0^.01^0^0^0^.01^.01^0^.53^^^.2
	;;^UTILITY(U,$J,112,604,4)
	;;=^0^0^0^0^0^.01^^^.4
	;;^UTILITY(U,$J,112,604,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,605,0)
	;;=SAUCE, TERIYAKI, DEHYDRATED, PREP W/WATER^6-511^cups^283^100^N
	;;^UTILITY(U,$J,112,605,1)
	;;=1.47^.33^9.77^46^83.89^^^40^.99^30^76^76^1693^.05^.5^0^^0^0^.01
	;;^UTILITY(U,$J,112,605,2)
	;;=.03^.459^.1^.05^10^0^.17^.02^0^.05^.08^.19^0^4.56
	;;^UTILITY(U,$J,112,605,4)
	;;=^^0^.03^0^.01^.07
	;;^UTILITY(U,$J,112,605,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,606,0)
	;;=GRAVY, AU JUS, DEHYD. PREP W/WATER^6-515^cups^246.1^100^N
	;;^UTILITY(U,$J,112,606,1)
	;;=.48^.54^1.61^13^96.13^^^9^.01^3^0^0^392^.06^.01^.001^^0^0^0
	;;^UTILITY(U,$J,112,606,2)
	;;=0^0^0^0^0^0^.017^.003^1^.264^.22^.02^0^1.24
	;;^UTILITY(U,$J,112,606,4)
	;;=^.005^.02^.136^.023^.103^.196
	;;^UTILITY(U,$J,112,606,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,607,0)
	;;=GRAVY, BROWN, DEHYDRATED, PREP W/WATER^6-518^cups^260.6^100^N
	;;^UTILITY(U,$J,112,607,1)
	;;=.93^.67^5.05^29^91.87^^^26^.09^4^17^22^417^.12^.022^.036^^0^0^.015
	;;^UTILITY(U,$J,112,607,2)
	;;=.033^.313^0^0^0^0^.021^.004^1^.326^.272^.026^0^1.47
	;;^UTILITY(U,$J,112,607,4)
	;;=^.006^.025^.168^.028^.128^.243
	;;^UTILITY(U,$J,112,607,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,608,0)
	;;=GRAVY, CHICKEN, DEHYDRATED, PREP W/WATER^6-520^cups^259.7^100^N
	;;^UTILITY(U,$J,112,608,1)
	;;=1.01^.74^5.52^32^91.44^^^15^.1^4^18^24^436^.123^.01^.04^^0^1^.02
	;;^UTILITY(U,$J,112,608,2)
	;;=.056^.3^.01^.01^1^.06^.16^.01^1^.2^.33^.17^0^1.29
	;;^UTILITY(U,$J,112,608,4)
	;;=^0^.01^.13^.02^.06^.3^0^^.8
	;;^UTILITY(U,$J,112,608,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,609,0)
	;;=GRAVY, MUSHROOM, DEHYDRATED, PREP W/WATER^6-522^cups^257.9^100^N
	;;^UTILITY(U,$J,112,609,1)
	;;=.83^.33^5.34^27^92.02^^^19^.1^3^17^22^543^.127^.044^.03^^0^.6^.02
	;;^UTILITY(U,$J,112,609,2)
	;;=.03^.3^.01^.01^1^.06^.01^0^0^.2^.11^.01^0^1.49^^^.4
	;;^UTILITY(U,$J,112,609,4)
	;;=.01^.04^.02^.07^.01^.05^.09
	;;^UTILITY(U,$J,112,609,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,610,0)
	;;=GRAVY, ONION, DEHYDRATED, PREP W/WATER^6-523^cups^261.4^100^N
	;;^UTILITY(U,$J,112,610,1)
	;;=.83^.28^6.23^30^91.1^^^28^.01^1^0^0^388^.11^.021^.001^^0^0^0
	;;^UTILITY(U,$J,112,610,2)
	;;=0^0^0^0^0^0^.007^.001^0^.169^.079^.008^0^1.56
	;;^UTILITY(U,$J,112,610,4)
	;;=.005^.043^.022^.053^.007^.037^.066
	;;^UTILITY(U,$J,112,610,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,611,0)
	;;=GRAVY, PORK, DEHYDRATED, PREP W/WATER^6-524^cups^257.9^100^N
	;;^UTILITY(U,$J,112,611,1)
	;;=.74^.74^5.2^30^92.07^^^12^.1^4^17^22^479^.1^.01^.03^^0^.6^.02
	;;^UTILITY(U,$J,112,611,2)
	;;=.023^.3^.01^.01^1.2^.06^.08^.01^1^.29^.34^.08^0^1.24^^^.4
	;;^UTILITY(U,$J,112,611,4)
	;;=0^0^.01^.18^.02^.1^.31
	;;^UTILITY(U,$J,112,611,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,612,0)
	;;=GRAVY, TURKEY, DEHYDRATED, PREP W/WATER^6-526^cups^261.4^100^N
	;;^UTILITY(U,$J,112,612,1)
	;;=1.12^.72^5.75^33^90.92^^^19^.1^4^19^25^573^.1^.01^.04^^0^.7^.02
	;;^UTILITY(U,$J,112,612,2)
	;;=.043^.4^.01^.01^1.3^.1^.15^.01^1^.21^.31^.17^0^1.5^^^.4
	;;^UTILITY(U,$J,112,612,4)
	;;=^^.01^.15^.04^.05^.26
	;;^UTILITY(U,$J,112,612,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,613,0)
	;;=GRAVY, UNSPECIFIED TYPE, PREP W/WATER^6-527^cups^261.4^100^N
	;;^UTILITY(U,$J,112,613,1)
	;;=1.23^.76^5.5^33^90.89^^^14^.1^4^19^25^544^.1^.01^.04^^0^.7^.02
	;;^UTILITY(U,$J,112,613,2)
	;;=.041^.3^.01^.01^1.3^.07^.14^.01^0^.27^.3^.15^0^1.61
	;;^UTILITY(U,$J,112,613,4)
	;;=.01^.04^.02^.11^0^.08^.29
	;;^UTILITY(U,$J,112,613,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,614,0)
	;;=SOUP, CHICKEN NOODLE, DEHYDRATED, PREP W/WATER^6-528^cups^252.3^100^N
