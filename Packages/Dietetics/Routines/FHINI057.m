FHINI057	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,1758,4)
	;;=^^^.001^^^.006^^.5
	;;^UTILITY(U,$J,112,1758,20)
	;;=USDA Std. Reference, Release 10;HCF Nutrition Research Foundation, Inc, 1990
	;;^UTILITY(U,$J,112,1759,0)
	;;=PEARS, CND, JUICE PACK^9-254^halves^77^100^N
	;;^UTILITY(U,$J,112,1759,1)
	;;=.34^.07^12.94^50^86.47^^^9^.29^7^12^96^4^.09^.053^.034^^6^1.6^.011
	;;^UTILITY(U,$J,112,1759,2)
	;;=.011^.2^.022^.014^1.2^0^.015^^0^.004^.014^.015^1^.19^^^2
	;;^UTILITY(U,$J,112,1759,3)
	;;=^.009^.01^.017^.012^.004^.003^.009^.003^.012^.006^.004^.011^.068^.025^.01^.009^.012
	;;^UTILITY(U,$J,112,1759,4)
	;;=^^^.003^^^.013^^.46
	;;^UTILITY(U,$J,112,1759,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1760,0)
	;;=PEARS, CND, LIGHT SIRUP ^9-256^halves^79^100^N
	;;^UTILITY(U,$J,112,1760,1)
	;;=.19^.03^15.17^57^84.46^^^5^.28^4^7^66^5^.08^.049^.033^^0^.7^.01
	;;^UTILITY(U,$J,112,1760,2)
	;;=.016^.154^.022^.014^1.2^0^.007^^0^.002^.006^.007^0^.14^^^2
	;;^UTILITY(U,$J,112,1760,3)
	;;=^.005^.006^.01^.007^.002^.002^.005^.002^.007^.003^.002^.006^.038^.014^.006^.005^.007
	;;^UTILITY(U,$J,112,1760,4)
	;;=^^^.001^^^.006
	;;^UTILITY(U,$J,112,1760,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1761,0)
	;;=PEARS, CND, HEAVY SIRUP ^9-257^halves^79^100^N
	;;^UTILITY(U,$J,112,1761,1)
	;;=.2^.13^19.17^74^80.35^^^5^.22^4^7^65^5^.08^.049^.032^^0^1.1^.01
	;;^UTILITY(U,$J,112,1761,2)
	;;=.022^.242^.022^.014^1.2^0^.03^^0^.007^.027^.03^0^.15^^^2
	;;^UTILITY(U,$J,112,1761,3)
	;;=^.005^.006^.01^.007^.002^.002^.005^.002^.007^.003^.002^.007^.039^.014^.006^.005^.007
	;;^UTILITY(U,$J,112,1761,4)
	;;=^^^.006^.001^.001^.026
	;;^UTILITY(U,$J,112,1761,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1762,0)
	;;=PEARS, DRIED, UNCKD^9-259^halves^17.5^100^N
	;;^UTILITY(U,$J,112,1762,1)
	;;=1.87^.63^69.7^262^26.69^^^34^2.1^33^59^533^6^.39^.371^.327^^3^7^.008
	;;^UTILITY(U,$J,112,1762,2)
	;;=.145^1.372^.153^.072^0^0^.146^.002^0^.035^.132^.148^0^1.11^^^7.5
	;;^UTILITY(U,$J,112,1762,3)
	;;=^.049^.054^.094^.066^.022^.018^.049^.016^.066^.032^.02^.062^.368^.135^.054^.051^.067
	;;^UTILITY(U,$J,112,1762,4)
	;;=^^^.027^.003^.004^.128
	;;^UTILITY(U,$J,112,1762,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1763,0)
	;;=PEARS, DRIED, STEWED, WO/ADDED SUGAR^9-260^cups^256^161^N
	;;^UTILITY(U,$J,112,1763,1)
	;;=.91^.31^33.81^127^64.44^^^16^1.02^16^28^258^3^.19^.18^.159^^42^4^.004
	;;^UTILITY(U,$J,112,1763,2)
	;;=.02^.351^.074^.035^0^0^.071^.001^0^.017^.064^.072^4^.54^^^6.4
	;;^UTILITY(U,$J,112,1763,3)
	;;=^.023^.026^.046^.032^.011^.009^.024^.008^.032^.016^.01^.03^.178^.065^.026^.025^.032
	;;^UTILITY(U,$J,112,1763,4)
	;;=^^^.013^.001^.002^.062
	;;^UTILITY(U,$J,112,1763,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1764,0)
	;;=PEARS, DRIED, STEWED, W/ADDED SUGAR^9-261^cups^280^153^N
	;;^UTILITY(U,$J,112,1764,1)
	;;=.86^.29^37.14^140^61.2^^^15^.97^15^27^245^3^.18^.171^.151^^40^3.8^.004
	;;^UTILITY(U,$J,112,1764,2)
	;;=.019^.333^.07^.033^0^0^.067^.001^0^.016^.061^.068^4^.51^^^5.8
	;;^UTILITY(U,$J,112,1764,3)
	;;=^.022^.025^.043^.03^.01^.008^.023^.007^.03^.015^.009^.029^.169^.062^.025^.023^.031
	;;^UTILITY(U,$J,112,1764,4)
	;;=^^^.012^.001^.002^.059
	;;^UTILITY(U,$J,112,1764,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1765,0)
	;;=PEAR NECTAR, CND, WO/ADDED ASC ACID^9-262^fl oz.^31.2^100^N
	;;^UTILITY(U,$J,112,1765,1)
	;;=.11^.01^15.76^60^84.01^^^5^.26^3^3^13^4^.07^.067^.03^^1^1.1^.002
	;;^UTILITY(U,$J,112,1765,2)
	;;=.013^.128^.022^.014^1.2^0^.003^^0^.001^.003^.003^0^.1^^^.6
	;;^UTILITY(U,$J,112,1765,4)
	;;=^^^.001^^^.002
	;;^UTILITY(U,$J,112,1765,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1766,0)
	;;=PERSIMMONS, JAPANESE, RAW^9-263^fruits^168^84^N
	;;^UTILITY(U,$J,112,1766,1)
	;;=.58^.19^18.59^70^80.32^^^8^.15^9^17^161^1^.11^.113^.355^^2167^7.5^.03
	;;^UTILITY(U,$J,112,1766,2)
	;;=.02^.1^^^7.5^0^^^0^^^^217^.33^^^3.6
	;;^UTILITY(U,$J,112,1766,3)
	;;=.01^.03^.025^.042^.033^.005^.013^.026^.016^.03^.025^.012^.029^.057^.076^.025^.022^.022
	;;^UTILITY(U,$J,112,1766,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1767,0)
	;;=PERSIMMONS, JAPANESE, DRIED^9-264^fruits^34^92^N
	;;^UTILITY(U,$J,112,1767,1)
	;;=1.38^.59^73.43^274^23.01^^^25^.74^31^81^802^2^.42^.442^1.39^^558^0
	;;^UTILITY(U,$J,112,1767,2)
	;;=.029^.18^^^^0^^^0^^^^56^1.59^^^14.5
	;;^UTILITY(U,$J,112,1767,3)
	;;=.024^.071^.06^.101^.078^.012^.03^.063^.039^.072^.059^.027^.068^.136^.179^.06^.053^.053
	;;^UTILITY(U,$J,112,1767,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1768,0)
	;;=PERSIMMONS, NATIVE, RAW^9-265^fruits^25^82^N
