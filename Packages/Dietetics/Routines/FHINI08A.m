FHINI08A	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,2871,4)
	;;=^.024^.015^1.034^.013^.065^2.165^^63
	;;^UTILITY(U,$J,112,2871,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2872,0)
	;;=OIL, VEGETABLE SAFFLOWER, SALAD OR COOKING, LINOLEIC^4-510^cups^218^100^N
	;;^UTILITY(U,$J,112,2872,1)
	;;=0^100^0^884^0^^^0^0^0^0^0^0^0^^^34.1^0^0^0
	;;^UTILITY(U,$J,112,2872,2)
	;;=0^0^0^0^0^0^74.1^.4^0^9.1^12.1^74.5^0^0^^^0^38.1
	;;^UTILITY(U,$J,112,2872,3)
	;;=0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0
	;;^UTILITY(U,$J,112,2872,4)
	;;=0^0^.1^6.2^.4^2.2^11.7^0^11
	;;^UTILITY(U,$J,112,2872,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2873,0)
	;;=OIL, VEGETABLE SAFFLOWER, SALAD OR COOKING, OLEIC^4-511^cups^218^100^N
	;;^UTILITY(U,$J,112,2873,1)
	;;=0^100^0^884^0^^^0^0^0^0^0^0^0^^^34.1^0^0^0
	;;^UTILITY(U,$J,112,2873,2)
	;;=0^0^0^0^0^0^14.2^0^0^6.1^75.3^14.2^0^0^^^0^38.1
	;;^UTILITY(U,$J,112,2873,3)
	;;=0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0
	;;^UTILITY(U,$J,112,2873,4)
	;;=0^0^0^4.8^0^1.3^75.3^0
	;;^UTILITY(U,$J,112,2873,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2874,0)
	;;=OIL, VEGETABLE, COTTONSEED, SALAD OR COOKING^4-502^cups^218^100^N
	;;^UTILITY(U,$J,112,2874,1)
	;;=0^100^0^884^0^^^0^0^0^0^0^0^0^^^35.3^0^0^0
	;;^UTILITY(U,$J,112,2874,2)
	;;=^0^0^0^0^0^51.5^.2^0^25.9^17.8^51.9^0^0^^^0^65.2
	;;^UTILITY(U,$J,112,2874,3)
	;;=0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0^0
	;;^UTILITY(U,$J,112,2874,4)
	;;=0^0^.8^22.7^.8^2.3^17^.1
	;;^UTILITY(U,$J,112,2874,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2875,0)
	;;=ONIONS, FRZ, CHOPPED, BOILED, DRAINED, W/SALT^11-806^tbsp.^15^100^N
	;;^UTILITY(U,$J,112,2875,1)
	;;=.77^.1^6.6^28^92.24^^^16^.3^6^19^108^248^.07^.019^.071^^34^2.6^.023
	;;^UTILITY(U,$J,112,2875,2)
	;;=.025^^^^^^.036^.002^0^.016^.013^.038^3^.3
	;;^UTILITY(U,$J,112,2875,3)
	;;=.011^.018^.027^.027^.036^.006^.014^.02^.019^.018^.102^.012^.021^.042^.123^.032^.024^.022
	;;^UTILITY(U,$J,112,2875,4)
	;;=^^0^.014^^.001^.013
	;;^UTILITY(U,$J,112,2875,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2876,0)
	;;=ONIONS, FRZ, CHOPPED, BOILED, DRAINED, WO/SALT^11-288^tbsp.^15^100^N
	;;^UTILITY(U,$J,112,2876,1)
	;;=.77^.1^6.6^28^92.24^^^16^.3^6^19^108^12^.07^.019^.071^^34^2.6^.023
	;;^UTILITY(U,$J,112,2876,2)
	;;=.025^.139^.099^.069^13.4^0^.036^.002^0^.016^.013^.038^3^.3^^^1.6
	;;^UTILITY(U,$J,112,2876,3)
	;;=.011^.018^.027^.027^.036^.006^.014^.02^.019^.018^.102^.012^.021^.042^.123^.032^.024^.022
	;;^UTILITY(U,$J,112,2876,4)
	;;=^^0^.014^^.001^.013
	;;^UTILITY(U,$J,112,2876,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2877,0)
	;;=ONIONS, FRZ, CHOPPED, UNPREPARED^11-287^oz.^28.3^100^N
	;;^UTILITY(U,$J,112,2877,1)
	;;=.79^.1^6.81^29^91.99^^^17^.33^7^22^124^12^.07^.019^.074^^35^3.3^.03
	;;^UTILITY(U,$J,112,2877,2)
	;;=.027^.151^.102^.075^17.3^0^.037^.002^0^.017^.014^.039^4^.3^^^1.6
	;;^UTILITY(U,$J,112,2877,3)
	;;=.011^.019^.028^.028^.038^.007^.014^.02^.02^.018^.106^.013^.022^.043^.127^.033^.025^.023
	;;^UTILITY(U,$J,112,2877,4)
	;;=^^0^.015^^.001^.014
	;;^UTILITY(U,$J,112,2877,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2878,0)
	;;=ONIONS, FRZ, WHOLE, BOILED, DRAINED, W/SALT^11-807^oz.^28.3^100^N
	;;^UTILITY(U,$J,112,2878,1)
	;;=.71^.05^6.7^28^92.24^^^27^.34^8^2^101^244^.09^.024^.04^^21^5.1^.016
	;;^UTILITY(U,$J,112,2878,2)
	;;=.018^.132^.078^.07^13.4^0^.019^.001^0^.009^.007^.02^2^.3
	;;^UTILITY(U,$J,112,2878,3)
	;;=.01^.017^.025^.025^.034^.006^.013^.018^.018^.016^.095^.012^.02^.039^.114^.029^.022^.021
	;;^UTILITY(U,$J,112,2878,4)
	;;=^^0^.008^^.001^.007
	;;^UTILITY(U,$J,112,2878,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2879,0)
	;;=ONIONS, FRZ, WHOLE, BOILED, DRAINED, WO/SALT^11-290^oz.^28.3^100^N
	;;^UTILITY(U,$J,112,2879,1)
	;;=.71^.05^6.7^28^92.24^^^27^.34^8^2^101^8^.09^.024^.04^^21^5.1^.016
	;;^UTILITY(U,$J,112,2879,2)
	;;=.018^.132^.078^.07^13.4^0^.019^.001^0^.009^.007^.02^2^.3^^^2.4
	;;^UTILITY(U,$J,112,2879,3)
	;;=.01^.017^.025^.025^.034^.006^.013^.018^.018^.016^.095^.012^.02^.039^.114^.029^.022^.021
	;;^UTILITY(U,$J,112,2879,4)
	;;=^^0^.008^^.001^.007^^^.4
	;;^UTILITY(U,$J,112,2879,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2880,0)
	;;=OPOSSUM, ROASTED^17-176^oz.^28.3^100^N
	;;^UTILITY(U,$J,112,2880,1)
	;;=30.2^10.2^0^221^58.3^^^^^^^^^^^^^0^0^.1
	;;^UTILITY(U,$J,112,2880,2)
	;;=.37^^^^^^^^^^^^0^2.3^^^0
	;;^UTILITY(U,$J,112,2880,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2881,0)
	;;=PASTA, FRESH-REFRIGERATED, PLAIN, COOKED^20-094^oz.^28.3^318^N
	;;^UTILITY(U,$J,112,2881,1)
	;;=5.15^1.05^24.93^131^68.56^^^6^1.14^18^63^24^6^.56^.093^.224^^20^0^.209
