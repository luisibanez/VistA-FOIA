FHINI04N	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,1557,4)
	;;=^^.001^.051^.001^.004^.064^^^7.5
	;;^UTILITY(U,$J,112,1557,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1558,0)
	;;=RICE, WHITE, PRE-CKD INSTANT, ENR^20-048^cups^95^100^N
	;;^UTILITY(U,$J,112,1558,1)
	;;=7.66^.29^83.59^379^8.14^^^18^4.19^12^68^18^6^.96^.165^.647^^0^0^.618
	;;^UTILITY(U,$J,112,1558,2)
	;;=.06^5.471^.432^.044^6^0^.063^.014^0^.078^.089^.077^0^.33^^^1.6
	;;^UTILITY(U,$J,112,1558,3)
	;;=.089^.274^.331^.633^.277^.18^.157^.409^.256^.467^.638^.18^.444^.719^1.493^.349^.36^.403
	;;^UTILITY(U,$J,112,1558,4)
	;;=^^.002^.07^.001^.005^.088^^^46.9
	;;^UTILITY(U,$J,112,1558,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1559,0)
	;;=RICE, WHITE, PRE-CKD INSTANT, READY TO SERVE, W/SALT ADDED^20-049^cups^165^424^N
	;;^UTILITY(U,$J,112,1559,1)
	;;=2.06^.16^21.27^98^76.44^^^8^.63^5^14^4^3^.24^.065^.235^^0^0^.075
	;;^UTILITY(U,$J,112,1559,2)
	;;=.046^.88^.178^.01^4^0^.036^.008^0^.044^.051^.044^0^.07^^^.6
	;;^UTILITY(U,$J,112,1559,3)
	;;=.024^.074^.089^.17^.074^.048^.042^.11^.069^.126^.172^.048^.119^.193^.401^.094^.097^.108
	;;^UTILITY(U,$J,112,1559,4)
	;;=^^.001^.04^.001^.003^.05^^^4.2
	;;^UTILITY(U,$J,112,1559,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1560,0)
	;;=RICE, WHITE, PRE-CKD INSTANT, READY TO SERVE, WO/SALT ADDED^1876-2^cups^165^369^N
	;;^UTILITY(U,$J,112,1560,1)
	;;=2.2^0^24.2^109^72.9^^^3^.8^^19^0^0^^^^^0^0^.13
	;;^UTILITY(U,$J,112,1560,2)
	;;=.01^1^^^^^0^^0^0
	;;^UTILITY(U,$J,112,1560,20)
	;;=USDA  Std. Reference, Release 8
	;;^UTILITY(U,$J,112,1561,0)
	;;=RICE BRAN^20-060^oz.^28.3^100^N
	;;^UTILITY(U,$J,112,1561,1)
	;;=13.35^20.85^49.69^316^6.13^^^57^18.54^781^1677^1485^5^6.04^.728^14.21^^0^0^2.753
	;;^UTILITY(U,$J,112,1561,2)
	;;=.284^33.995^7.39^4.07^63^0^7.143^.316^0^4.171^7.549^7.459^0^9.98^^^21
	;;^UTILITY(U,$J,112,1561,3)
	;;=.108^.555^.568^1.022^.65^.306^.317^.635^.411^.881^1.058^.355^.97^1.308^1.854^.875^.668^.662
	;;^UTILITY(U,$J,112,1561,4)
	;;=^.019^.078^3.557^.075^.373^7.475^^^15.6
	;;^UTILITY(U,$J,112,1561,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1562,0)
	;;=RICE BRAN POLISH^1881-0^cups^105^^N
	;;^UTILITY(U,$J,112,1562,1)
	;;=12.1^12.8^57.7^265^9.8^^^69^16.1^^1106^714^0^^^^^0^0^1.84
	;;^UTILITY(U,$J,112,1562,2)
	;;=.18^28.2^^^^^6^^0^2
	;;^UTILITY(U,$J,112,1562,20)
	;;=USDA  Std. Reference, Release 8
	;;^UTILITY(U,$J,112,1563,0)
	;;=RICE PUDDING, W/RAISINS^19-196^cups^265^100^N
	;;^UTILITY(U,$J,112,1563,1)
	;;=3.6^2.8^26.4^143^66.4^^^102^.66^16^94^177^56^.45^.055^.144^^101^.6^.082
	;;^UTILITY(U,$J,112,1563,2)
	;;=.141^.538^.328^.056^4^.16^.09^.05^11^1.69^.79^.13^25^.8
	;;^UTILITY(U,$J,112,1563,3)
	;;=.045^.147^.188^.316^.233^.088^.043^.168^.151^.223^.173^.094^.141^.29^.724^.09^.281^.179
	;;^UTILITY(U,$J,112,1563,4)
	;;=.07^.08^.28^.76^.06^.34^.73^0
	;;^UTILITY(U,$J,112,1563,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1564,0)
	;;=ROCKFISH, PACIFIC, COOKED, DRY HEAT^15-071^oz.^28.3^100^N
	;;^UTILITY(U,$J,112,1564,1)
	;;=24.04^2.01^0^121^73.41^^^12^.53^34^228^520^77^.53^.037^.02^^219^0^.044
	;;^UTILITY(U,$J,112,1564,2)
	;;=.084^3.919^.87^.27^10.4^1.2^.038^.022^44^.474^.447^.594^66^1.54^^^0
	;;^UTILITY(U,$J,112,1564,3)
	;;=.269^1.054^1.108^1.954^2.208^.712^.258^.938^.812^1.238^1.438^.708^1.454^2.461^3.588^1.154^.85^.981
	;;^UTILITY(U,$J,112,1564,4)
	;;=^.051^.077^.246^.104^.097^.281^.021
	;;^UTILITY(U,$J,112,1564,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1565,0)
	;;=ROLLS AND BUNS, READY TO SERVE, DANISH PASTRY^18-244^pastries^65^100^N
	;;^UTILITY(U,$J,112,1565,1)
	;;=7^22.4^44.6^403^24.3^^^71^1.96^19^107^125^371^.72^.1^.362^^37^.2^.3
	;;^UTILITY(U,$J,112,1565,2)
	;;=.263^2.867^.326^.047^33^.17^2.703^.139^30^5.738^12.466^2.866^11^1.7^^^1.2
	;;^UTILITY(U,$J,112,1565,3)
	;;=.084^.245^.31^.532^.296^.139^.139^.348^.233^.344^.312^.16^.274^.463^1.882^.245^.637^.376
	;;^UTILITY(U,$J,112,1565,4)
	;;=.001^.001^.109^3.029^.046^2.595^12.416^.018^^17
	;;^UTILITY(U,$J,112,1565,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1566,0)
	;;=ROLLS AND BUNS, READY TO SERVE, HARD, ENR^18-353^rolls^50^100^N
	;;^UTILITY(U,$J,112,1566,1)
	;;=9.9^4.3^52.7^293^31^^^95^3.28^27^100^108^544^.94^.163^.46^^0^0^.478
	;;^UTILITY(U,$J,112,1566,2)
	;;=.336^4.239^.222^.055^15^0^1.621^.097^0^.606^1.133^1.719^0^2
	;;^UTILITY(U,$J,112,1566,3)
	;;=.117^.285^.383^.693^.242^.176^.216^.489^.284^.432^.36^.214^.331^.449^3.314^.35^1.105^.48
	;;^UTILITY(U,$J,112,1566,4)
	;;=^.001^.002^.476^.033^.127^1.1^^^39.1
	;;^UTILITY(U,$J,112,1566,20)
	;;=USDA Std. Reference, Release 10
