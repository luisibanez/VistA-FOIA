FHINI0AL	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,7107,0)
	;;=DOUGHNUTS,KRUNCH,HOSTESS^BC-00380^doughnuts^28
	;;^UTILITY(U,$J,112,7107,1)
	;;=3.571^14.286^57.143^392.857^^^^^^^^^464.286^^^^^0^0
	;;^UTILITY(U,$J,112,7107,2)
	;;=^^^^^^^^14.286
	;;^UTILITY(U,$J,112,7107,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7108,0)
	;;=DOUGHNUTS,OLD FASHIONED,HOSTESS^BC-00381^doughnuts^43
	;;^UTILITY(U,$J,112,7108,1)
	;;=4.651^23.256^51.163^418.605^^^^^^^^^511.628^^^^^0^0
	;;^UTILITY(U,$J,112,7108,2)
	;;=^^^^^^^^20.93
	;;^UTILITY(U,$J,112,7108,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7109,0)
	;;=DOUGHNUTS,POWDERED SUGAR,HOSTESS^BC-00382^doughnuts^28
	;;^UTILITY(U,$J,112,7109,1)
	;;=3.571^17.857^53.571^392.857^^^^^^^^^500^^^^^0^0
	;;^UTILITY(U,$J,112,7109,2)
	;;=^^^^^^^^21.429
	;;^UTILITY(U,$J,112,7109,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7110,0)
	;;=DOUGHNUTS,POWDERED SUGAR DONETTE,HOSTESS^BC-00383^donettes^9
	;;^UTILITY(U,$J,112,7110,1)
	;;=0^22.222^55.556^444.444^^^^0^0^^^^444.444^^^^^0^0
	;;^UTILITY(U,$J,112,7110,2)
	;;=0^0^^^^^^^22.222
	;;^UTILITY(U,$J,112,7110,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7111,0)
	;;=DOUGHNUTS,STICKS,LITTLE DEBBIE^BC-00384^1.7-oz.^47
	;;^UTILITY(U,$J,112,7111,1)
	;;=3.83^18.723^61.064^429.787^14.681^^^85.106^1.191^^^^470.213^^^^^0^0^.191
	;;^UTILITY(U,$J,112,7111,2)
	;;=.17^1.702^^^^^^^2.128^4.681^11.277^2.766
	;;^UTILITY(U,$J,112,7111,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7112,0)
	;;=BON BON ICE CREAM NUGGETS,CARNATION (VAN W/CHOC)^BC-00385^5-nuggets^54
	;;^UTILITY(U,$J,112,7112,1)
	;;=3.704^20.37^27.778^314.815^^^^101.852^.185^12.963^90.741^148.148^92.593^.352^.093^.035^^296.296^0^.037
	;;^UTILITY(U,$J,112,7112,2)
	;;=.148^.185^.259^.037^3.704^.296^^^25.926
	;;^UTILITY(U,$J,112,7112,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7113,0)
	;;=BON BON ICE CREAM NUGGETS,CARNATION (VAN/MILK CHOC)^BC-00386^5-nuggets^53
	;;^UTILITY(U,$J,112,7113,1)
	;;=3.774^20.755^26.415^311.321^^^^141.509^.415^11.321^122.642^207.547^94.34^.34^.096^.036^^320.755^0^.038
	;;^UTILITY(U,$J,112,7113,2)
	;;=.189^.189^.208^.019^1.887^.434^^^30.189
	;;^UTILITY(U,$J,112,7113,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7114,0)
	;;=COOL'N CREAMY BARS,GENERAL FOODS (CHOC/VAN)^BC-00387^bars^50
	;;^UTILITY(U,$J,112,7114,1)
	;;=4^4^14^108^^^^64^.2^12^58^146^102^^.06^^^98^^.02
	;;^UTILITY(U,$J,112,7114,2)
	;;=.08^^.18^.02^2^.2^^^2
	;;^UTILITY(U,$J,112,7114,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7115,0)
	;;=COOL'N CREAMY BARS,GENERAL FOODS (DOUBLE CHOC FUDGE)^BC-00388^bars^50
	;;^UTILITY(U,$J,112,7115,1)
	;;=4^4^14^110^^^^64^.4^18^64^160^114^^.08^^^106^^.02
	;;^UTILITY(U,$J,112,7115,2)
	;;=.08^^.18^.02^2^.2^^^2
	;;^UTILITY(U,$J,112,7115,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7116,0)
	;;=COOL'N CREAMY BARS,GENERAL MILLS (ORANGE/VAN)^BC-00389^bars^48
	;;^UTILITY(U,$J,112,7116,1)
	;;=2.083^2.083^10.417^64.583^^^^27.083^^2.083^20.833^50^37.5^^^^^39.583
	;;^UTILITY(U,$J,112,7116,2)
	;;=.021^.208^.063^^2.083^^^^0
	;;^UTILITY(U,$J,112,7116,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7117,0)
	;;=CRYSTAL LIGHT FLAVOR POPS,ALL FLAVORS^BC-00390^pops^51
	;;^UTILITY(U,$J,112,7117,1)
	;;=0^^3.922^27.451^^^^1.961^.196^^^25.49^3.922
	;;^UTILITY(U,$J,112,7117,2)
	;;=^.196
	;;^UTILITY(U,$J,112,7117,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7118,0)
	;;=GELATIN POPS,ALL FLAVORS,JELL-O^BC-00391^pops^44
	;;^UTILITY(U,$J,112,7118,1)
	;;=2.273^0^16.591^72.727^82.045^^^0^0^0^0^2.273^47.727^0^0^^^0^0^0
	;;^UTILITY(U,$J,112,7118,2)
	;;=0^0^0^0^0^0^^^0^0^0^0
	;;^UTILITY(U,$J,112,7118,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7119,0)
	;;=ICE CREAM,CHOC,HAAGEN-DAZS^BC-00392^1/2-cup^91
	;;^UTILITY(U,$J,112,7119,1)
	;;=4.615^16.374^22.198^254.945^56.044^^^92.308^.505^^105.495^219.78^49.451^^^^^576.923^^.011
	;;^UTILITY(U,$J,112,7119,2)
	;;=.198^^^.659
	;;^UTILITY(U,$J,112,7119,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7120,0)
	;;=ICE CREAM,CHOC CHOC CHIP,HAAGEN-DAZS^BC-00393^1/2-cup^89
	;;^UTILITY(U,$J,112,7120,1)
	;;=4.831^16.067^25.393^265.169^49.888^^^85.393^1.663^^114.607^229.213^39.326^^^^^476.404^1.124^.011
	;;^UTILITY(U,$J,112,7120,2)
	;;=.191^.787
	;;^UTILITY(U,$J,112,7120,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.