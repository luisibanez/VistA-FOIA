FHINI0DC	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,8468,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8469,0)
	;;=GRAIN PRODUCTS,BUTTERMILK,BIG COUNTRY^BC-01742^1.2-oz.^34
	;;^UTILITY(U,$J,112,8469,1)
	;;=6.471^11.176^43.235^300^35.882^^^20.588^3.088^^452.941^261.765^947.059^^^^^0^0^.471
	;;^UTILITY(U,$J,112,8469,2)
	;;=.147^1.765
	;;^UTILITY(U,$J,112,8469,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8470,0)
	;;=GRAIN PRODUCTS,BUTTERMILK,EXTRA RICH,HUNGRY JACK^BC-01743^.74-oz.^21
	;;^UTILITY(U,$J,112,8470,1)
	;;=5.714^6.19^44.286^252.381^39.524^^^23.81^2.571^^442.857^476.19^819.048^^^^^0^0^.333
	;;^UTILITY(U,$J,112,8470,2)
	;;=.238^2.857
	;;^UTILITY(U,$J,112,8470,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8471,0)
	;;=GRAIN PRODUCTS,BUTTERMILK,FLAKY,HUNGRY JACK^BC-01744^biscuits^28
	;;^UTILITY(U,$J,112,8471,1)
	;;=5.357^12.857^41.786^300^36.071^^^14.286^2.429^^435.714^57.143^1050^^^^^0^0^.321
	;;^UTILITY(U,$J,112,8471,2)
	;;=.214^2.857
	;;^UTILITY(U,$J,112,8471,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8472,0)
	;;=GRAIN PRODUCTS,BUTTERMILK,FLAKY,PILSBURY EXTRA LIGHTS^BC-01745^.72-oz.^20
	;;^UTILITY(U,$J,112,8472,1)
	;;=6^9^42^265^39^^^25^1.9^^425^455^790^^^^^0^0^.35
	;;^UTILITY(U,$J,112,8472,2)
	;;=.25^3
	;;^UTILITY(U,$J,112,8472,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8473,0)
	;;=GRAIN PRODUCTS,COUNTRY,PILSBURY^BC-01746^.74-oz.^21
	;;^UTILITY(U,$J,112,8473,1)
	;;=6.19^3.333^46.19^238.095^40^^^23.81^2.667^^457.143^485.714^842.857^^^^^0^0^.381
	;;^UTILITY(U,$J,112,8473,2)
	;;=.238^3.333
	;;^UTILITY(U,$J,112,8473,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8474,0)
	;;=GRAIN PRODUCTS,FLAKY,HUNGRY JACK^BC-01747^biscuits^28
	;;^UTILITY(U,$J,112,8474,1)
	;;=5.357^12.857^41.429^300^36.071^^^14.286^2.429^^435.714^57.143^1050^^^^^0^0^.321
	;;^UTILITY(U,$J,112,8474,2)
	;;=.214^2.857
	;;^UTILITY(U,$J,112,8474,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8475,0)
	;;=GRAIN PRODUCTS,HEAT'N EAT BIG PREMIUM,PILSBURY^BC-01748^2.5-oz.^71
	;;^UTILITY(U,$J,112,8475,1)
	;;=6.479^20.563^45.352^390.141^23.662^^^50.704^2^^316.901^107.042^853.521^^^^^7.042^0^.268
	;;^UTILITY(U,$J,112,8475,2)
	;;=.437^2.394
	;;^UTILITY(U,$J,112,8475,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8476,0)
	;;=GRAIN PRODUCTS,SOUTHERN STYLE,BIG COUNTRY^BC-01749^1.2-oz.^34
	;;^UTILITY(U,$J,112,8476,1)
	;;=5.588^11.765^41.471^288.235^37.353^^^17.647^2.559^^444.118^267.647^952.941^^^^^0^0^.353
	;;^UTILITY(U,$J,112,8476,2)
	;;=.235^3.235
	;;^UTILITY(U,$J,112,8476,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8477,0)
	;;=GRAIN PRODUCTS,CORNBREAD FROM MIX,AUNT JEMIMA^BC-01750^1/6 mix^65
	;;^UTILITY(U,$J,112,8477,1)
	;;=6.154^10.769^52.308^323.077^^^^23.077^2.492^20^407.692^138.462^1061.538^0^.062^0^^^^.385
	;;^UTILITY(U,$J,112,8477,2)
	;;=.308^3.077^0^.123^70.769^0^^^^^^^^^^^2.154
	;;^UTILITY(U,$J,112,8477,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8478,0)
	;;=GRAIN PRODUCTS,BRAN'NOLA NUTTY GRAINS,ARNOLD^BC-01751^slices^38
	;;^UTILITY(U,$J,112,8478,1)
	;;=10.263^4.211^45.789^223.684^37.632^^^47.368^3.289^^^^378.947^^^^^^^.342
	;;^UTILITY(U,$J,112,8478,2)
	;;=.289^2.895^^^^^^^0^^^^^^^^7.895
	;;^UTILITY(U,$J,112,8478,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8479,0)
	;;=GRAIN PRODUCTS,BRAN'NOLA ORIGINAL,ARNOLD^BC-01752^slices^38
	;;^UTILITY(U,$J,112,8479,1)
	;;=10.263^3.684^46.053^223.684^37.368^^^28.947^3.947^^^^360.526^^^^^^^.316
	;;^UTILITY(U,$J,112,8479,2)
	;;=.289^3.421^^^^^^^0^^^^^^^^7.632
	;;^UTILITY(U,$J,112,8479,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8480,0)
	;;=GRAIN PRODUCTS,CINN,APPLE & WALNUT,PEPPERIDGE FARMS^BC-01753^.9-oz.^25
	;;^UTILITY(U,$J,112,8480,1)
	;;=7.6^10^46^304^^^^36^2.8^^^132^368^^^^^0^0^.32
	;;^UTILITY(U,$J,112,8480,2)
	;;=.32^3.6
	;;^UTILITY(U,$J,112,8480,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8481,0)
	;;=GRAIN PRODUCTS,CINN,PEPERIDGEFARMS^BC-01754^slices^28
	;;^UTILITY(U,$J,112,8481,1)
	;;=7.857^8.929^53.571^325^^^^39.286^2.5^^^100^400^^^^^0^0^.393
	;;^UTILITY(U,$J,112,8481,2)
	;;=.214^3.214
	;;^UTILITY(U,$J,112,8481,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8482,0)
	;;=GRAIN PRODUCTS,CRACKED WHEAT^BC-01755^slices^25
	;;^UTILITY(U,$J,112,8482,1)
	;;=9.2^3.6^50^264^35.2^^^64^2.68^36^128^132^432^^^^^0^0^.4
