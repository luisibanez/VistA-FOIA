FHINI0EV	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,9211,0)
	;;=YOGURT (FROM COW MILK),LOWFAT,DANNON^BC-02484^8-floz.^227
	;;^UTILITY(U,$J,112,9211,1)
	;;=4.846^1.762^6.608^61.674^^^^176.211^^^110.132^^55.066^^^^^^0
	;;^UTILITY(U,$J,112,9211,2)
	;;=.225^0^^^^.106^^^6.608
	;;^UTILITY(U,$J,112,9211,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9212,0)
	;;=YOGURT (FROM COW MILK),LOWFAT,FRUIT FLAVOR,YOPLAIT^BC-02485^6-floz.^170
	;;^UTILITY(U,$J,112,9212,1)
	;;=4.706^1.765^18.824^111.765^^^^^^^^205.882^64.706
	;;^UTILITY(U,$J,112,9212,2)
	;;=^^^^^^^^5.882
	;;^UTILITY(U,$J,112,9212,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9213,0)
	;;=YOGURT (FROM COW MILK),LOWFAT,VANILLA,YOPLAIT^BC-02486^6-floz.^170
	;;^UTILITY(U,$J,112,9213,1)
	;;=5.294^1.765^17.059^105.882^^^^^^^^217.647^70.588
	;;^UTILITY(U,$J,112,9213,2)
	;;=^^^^^^^^8.824
	;;^UTILITY(U,$J,112,9213,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9214,0)
	;;=YOGURT (FROM COW MILK),LOWFAT,YOPLAIT^BC-02487^6-floz.^170
	;;^UTILITY(U,$J,112,9214,1)
	;;=5.882^1.765^8.824^76.471^^^^^^^^217.647^82.353
	;;^UTILITY(U,$J,112,9214,2)
	;;=^^^^^^^^8.824
	;;^UTILITY(U,$J,112,9214,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9215,0)
	;;=YOGURT (FROM COW MILK),SKIM,FRUIT FLAVORS,YOPLAIT^BC-02488^6-floz.^170
	;;^UTILITY(U,$J,112,9215,1)
	;;=4.118^0^18.235^88.235^^^^^^^^229.412^55.882
	;;^UTILITY(U,$J,112,9215,2)
	;;=^^^^^^^^2.941
	;;^UTILITY(U,$J,112,9215,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9216,0)
	;;=YOGURT (FROM COW MILK),SKIM,VANILLA,YOPLAIT^BC-02489^6-floz.^170
	;;^UTILITY(U,$J,112,9216,1)
	;;=4.706^0^16.471^88.235^^^^^^^^223.529^64.706
	;;^UTILITY(U,$J,112,9216,2)
	;;=^^^^^^^^0
	;;^UTILITY(U,$J,112,9216,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9217,0)
	;;=YOGURT (FROM COW MILK),SKIM,YOPLAIT^BC-02490^8-floz.^227
	;;^UTILITY(U,$J,112,9217,1)
	;;=5.727^0^7.93^52.863^^^^^^^^259.912^70.485
	;;^UTILITY(U,$J,112,9217,2)
	;;=^^^^^^^^2.203
	;;^UTILITY(U,$J,112,9217,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9218,0)
	;;=MILK,ALBA CHOC FLAVOR NONFAT DRY MILK IN WATER^BC-02491^8-floz.^250
	;;^UTILITY(U,$J,112,9218,1)
	;;=2.4^.4^5.2^32^^^^124^.096^^67.6^^48^^^^^151.2^.4^.028
	;;^UTILITY(U,$J,112,9218,2)
	;;=.116^.08^^.024
	;;^UTILITY(U,$J,112,9218,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9219,0)
	;;=MILK,CHOC,LOWFAT W/NUTRASWEET,LAND O'LAKES^BC-02492^8-floz.^244
	;;^UTILITY(U,$J,112,9219,1)
	;;=3.279^1.23^5.738^45.082^^^^^^^^^81.967
	;;^UTILITY(U,$J,112,9219,2)
	;;=^^^^^^^^2.049^.82^.41^0
	;;^UTILITY(U,$J,112,9219,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9220,0)
	;;=MILK,WHOLE,INSTANT BREAKFAST,CHOC,CARNATION^BC-02493^8-floz.^280
	;;^UTILITY(U,$J,112,9220,1)
	;;=5^3.214^12.857^100^^^^157.5^1.65^40.357^135^278.571^92.857^1.404^.179^^^734.643^10.357^.139
	;;^UTILITY(U,$J,112,9220,2)
	;;=.204^1.857^.989^.179^40^.525^^^12.5^2^.929^.143^^^^^.071
	;;^UTILITY(U,$J,112,9220,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9221,0)
	;;=MILK,WHOLE,INSTANT BREAKFAST,CHOC,DELMARK^BC-02494^8-floz.^279
	;;^UTILITY(U,$J,112,9221,1)
	;;=5.376^3.226^13.262^103.943^^^^168.459^2.115^47.312^150.538^258.065^96.774^1.756^.237^.004^^591.398^7.168^.179
	;;^UTILITY(U,$J,112,9221,2)
	;;=.254^2.366^1.183^.237^46.595^.717^^^14.337^^^^^^^^0
	;;^UTILITY(U,$J,112,9221,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9222,0)
	;;=MILK,WHOLE,INSTANT BREAKFAST,STRAWBERRY,CARNATION^BC-02495^8-floz.^280
	;;^UTILITY(U,$J,112,9222,1)
	;;=5^2.857^12.857^100^^^^157.5^1.65^40.357^135^239.286^117.857^1.404^.179^^^734.643^10.357^.139
	;;^UTILITY(U,$J,112,9222,2)
	;;=.204^1.786^.989^.179^40^.525^^^12.857^1.857^.857^.107^^^^^.036
	;;^UTILITY(U,$J,112,9222,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9223,0)
	;;=MILK,WHOLE,INSTANT BREAKFAST,VAN,CARNATION^BC-02496^8-floz.^279
	;;^UTILITY(U,$J,112,9223,1)
	;;=5.018^2.867^12.903^100.358^^^^158.065^1.656^40.502^135.484^240.143^93.19^1.409^.179^^^737.276^10.394^.14
	;;^UTILITY(U,$J,112,9223,2)
	;;=.204^1.864^.993^.179^40.143^.527^^^12.903^1.864^.86^.108^^^^^.036
	;;^UTILITY(U,$J,112,9223,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9224,0)
	;;=MILK,WHOLE,INSTANT BREAKFAST,VAN/STRAWBERRY,DELMARK^BC-02497^8-floz.^279
	;;^UTILITY(U,$J,112,9224,1)
	;;=5.376^3.226^13.262^103.943^^^^168.459^2.115^47.312^150.538^225.806^78.853^1.756^.237^.004^^591.398^7.168^.179
