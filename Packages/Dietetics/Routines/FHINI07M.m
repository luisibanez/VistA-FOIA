FHINI07M	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,2645,4)
	;;=^^^.04^^.005^.024^^^1.2
	;;^UTILITY(U,$J,112,2645,20)
	;;=USDA Std. Reference, Release 10;HCF Nutrition Research Foundation, Inc, 1990
	;;^UTILITY(U,$J,112,2646,0)
	;;=BEANS, MUNG, BOILED, W/SALT^16-381^cups^202^100^N
	;;^UTILITY(U,$J,112,2646,1)
	;;=7.02^.38^19.14^105^72.66^^^27^1.4^48^99^266^238^.84^.156^.298^^24^1^.164
	;;^UTILITY(U,$J,112,2646,2)
	;;=.061^.577^.41^.067^158.8^0^.119^.009^0^.116^.054^.128^2^.79
	;;^UTILITY(U,$J,112,2646,3)
	;;=.076^.23^.297^.544^.49^.084^.062^.425^.21^.364^.492^.205^.309^.812^1.256^.281^.323^.346
	;;^UTILITY(U,$J,112,2646,4)
	;;=^^^.083^^.024^.054
	;;^UTILITY(U,$J,112,2646,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2647,0)
	;;=BEANS, NAVY, CANNED^16-039^cups^262^100^N
	;;^UTILITY(U,$J,112,2647,1)
	;;=7.53^.43^20.45^113^70.45^^^47^1.85^47^134^288^448^.77^.208^.375^^1^.7^.141
	;;^UTILITY(U,$J,112,2647,2)
	;;=.055^.487^.172^.103^62.3^0^.101^.085^0^.112^.038^.186^0^1.14^^^5.1
	;;^UTILITY(U,$J,112,2647,3)
	;;=.089^.317^.332^.601^.517^.113^.082^.407^.212^.394^.466^.209^.315^.91^1.147^.294^.319^.409
	;;^UTILITY(U,$J,112,2647,4)
	;;=^^0^.105^^.007^.038
	;;^UTILITY(U,$J,112,2647,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2648,0)
	;;=BEANS, PINK, BOILED, W/SALT^16-341^cups^168^100^N
	;;^UTILITY(U,$J,112,2648,1)
	;;=9.06^.49^27.91^149^61.2^^^52^2.3^65^165^508^238^.96^.271^.548^^0^0^.257
	;;^UTILITY(U,$J,112,2648,2)
	;;=.063^.57^.299^.175^168.3^0^.114^.096^0^.126^.042^.21^0^1.34
	;;^UTILITY(U,$J,112,2648,3)
	;;=.107^.381^.4^.723^.622^.136^.099^.49^.255^.474^.561^.252^.38^1.095^1.381^.354^.384^.493
	;;^UTILITY(U,$J,112,2648,4)
	;;=^^0^.118^^.008^.042
	;;^UTILITY(U,$J,112,2648,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2649,0)
	;;=BEANS, PINK, BOILED, WO/SALT^16-041^cups^168^100^N
	;;^UTILITY(U,$J,112,2649,1)
	;;=9.06^.49^27.91^149^61.2^^^52^2.3^65^165^508^2^.96^.271^.548^^0^0^.257
	;;^UTILITY(U,$J,112,2649,2)
	;;=.063^.57^.299^.175^168.3^0^.114^.096^0^.126^.042^.21^0^1.34^^^5.3
	;;^UTILITY(U,$J,112,2649,3)
	;;=.107^.381^.4^.723^.622^.136^.099^.49^.255^.474^.561^.252^.38^1.095^1.381^.354^.384^.493
	;;^UTILITY(U,$J,112,2649,4)
	;;=^^0^.118^^.008^.042
	;;^UTILITY(U,$J,112,2649,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2650,0)
	;;=BEANS, SMALL WHITE, BOILED, WO/SALT^16-046^cups^180^100^N
	;;^UTILITY(U,$J,112,2650,1)
	;;=8.97^.64^25.81^142^63.24^^^73^2.84^68^169^463^2^1.09^.149^.51^^0^0^.236
	;;^UTILITY(U,$J,112,2650,2)
	;;=.059^.272^.251^.127^136.9^0^.15^.126^0^.166^.056^.276^0^1.34
	;;^UTILITY(U,$J,112,2650,3)
	;;=.106^.377^.396^.716^.616^.135^.098^.485^.253^.469^.555^.25^.376^1.085^1.368^.35^.38^.488
	;;^UTILITY(U,$J,112,2650,4)
	;;=^^0^.155^^.01^.056
	;;^UTILITY(U,$J,112,2650,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2651,0)
	;;=BEANS, SNAP, GREEN VAR, CND, REG PK, SOL&LIQ^11-054^cups^240^100^N
	;;^UTILITY(U,$J,112,2651,1)
	;;=.85^.1^3.5^15^94.51^^^24^.88^13^19^98^368^.2^.07^.335^^324^4^.025
	;;^UTILITY(U,$J,112,2651,2)
	;;=.051^.2^.106^.03^18.2^0^.02^.032^0^.023^.004^.052^32^1.04^^^.7
	;;^UTILITY(U,$J,112,2651,3)
	;;=.009^.037^.031^.052^.041^.01^.008^.031^.02^.042^.034^.016^.039^.118^.087^.03^.031^.046
	;;^UTILITY(U,$J,112,2651,4)
	;;=^^0^.019^0^.003^.004
	;;^UTILITY(U,$J,112,2651,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2652,0)
	;;=BEANS, SNAP, GREEN VAR, FRZ, ALL STYLES, UNPREPARED^11-060^cups^124^100^N
	;;^UTILITY(U,$J,112,2652,1)
	;;=1.8^.21^7.57^33^89.88^^^42^.86^22^32^186^3^.26^.049^.385^^480^12.9^.099
	;;^UTILITY(U,$J,112,2652,2)
	;;=.092^.499^.085^.042^14.7^0^.041^.066^0^.047^.008^.108^48^.53^^^2.8
	;;^UTILITY(U,$J,112,2652,3)
	;;=.019^.079^.066^.111^.087^.022^.018^.066^.042^.089^.073^.034^.083^.253^.186^.065^.067^.099
	;;^UTILITY(U,$J,112,2652,4)
	;;=^^0^.039^0^.007^.008^^32^.4
	;;^UTILITY(U,$J,112,2652,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2653,0)
	;;=BEANS, SNAP, YELLOW VAR, CND, DIET PK, DRAINED SOLIDS^11-933^cups^136^100^N
	;;^UTILITY(U,$J,112,2653,1)
	;;=1.15^.1^4.5^20^93.3^^^26^.9^13^19^109^2^.29^.038^.2^^105^4.8^.015
	;;^UTILITY(U,$J,112,2653,2)
	;;=.056^.201^.129^.037^31.8^0^.019^.031^0^.022^.004^.051^11^.95
	;;^UTILITY(U,$J,112,2653,3)
	;;=.012^.05^.042^.071^.055^.014^.011^.042^.027^.057^.046^.022^.053^.161^.118^.041^.043^.063
	;;^UTILITY(U,$J,112,2653,4)
	;;=^^0^.019^0^.003^.004
	;;^UTILITY(U,$J,112,2653,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2654,0)
	;;=BEANS, SNAP, YELLOW VAR, FRZ, ALL STYLES, UNPREPARED^11-730^cups^124^100^N
	;;^UTILITY(U,$J,112,2654,1)
	;;=1.8^.21^7.57^33^89.88^^^42^.86^22^32^186^3^.26^.049^.385^^128^12.9^.099