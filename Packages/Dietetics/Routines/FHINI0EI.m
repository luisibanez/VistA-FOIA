FHINI0EI	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,9035,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9036,0)
	;;=MEAT SUBS,LEANIES,WORTHINGTON^BC-02309^link^40
	;;^UTILITY(U,$J,112,9036,1)
	;;=20^12.5^10^232.5^53.75^^^102.5^4.725^^^97.5^962.5^^^^^^^.775
	;;^UTILITY(U,$J,112,9036,2)
	;;=.45^8.25^^.475^^7.75^^^^1.75^^9.5
	;;^UTILITY(U,$J,112,9036,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9037,0)
	;;=MEAT SUBS,LINKETTS,CND,LOMA LINDA^BC-02310^2-links^74
	;;^UTILITY(U,$J,112,9037,1)
	;;=20.27^10.811^6.757^202.703^59.459^^^27.027^2.432^^^101.351^459.459^1.203^^^^^^.5
	;;^UTILITY(U,$J,112,9037,2)
	;;=.595^8.108^1.095^.5^^2.703^^^0
	;;^UTILITY(U,$J,112,9037,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9038,0)
	;;=MEAT SUBS,LITTLE LINKS,CND,LOMA LINDA^BC-02311^2-links^46
	;;^UTILITY(U,$J,112,9038,1)
	;;=17.391^10.87^4.348^173.913^63.043^^^26.087^2.391^^^86.957^456.522^1.304^^^^^^1.196
	;;^UTILITY(U,$J,112,9038,2)
	;;=.891^13.043^3.261^.348^^4.348^^^0
	;;^UTILITY(U,$J,112,9038,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9039,0)
	;;=MEAT SUBS,MEAT EXTENDER,SIMULATED MEAT PRODUCT^BC-02312^oz.^28
	;;^UTILITY(U,$J,112,9039,1)
	;;=38.214^2.857^38.214^314.286^7.5^^^203.571^12^217.857^^^10.714^^^^^32.143^^.714
	;;^UTILITY(U,$J,112,9039,2)
	;;=.893^22.143^^1.321^^6.286^^^0^.357^.714^1.786^3.571
	;;^UTILITY(U,$J,112,9039,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9040,0)
	;;=MEAT SUBS,MEATLESS LOAF,MILLSTONE^BC-02313^oz.^28
	;;^UTILITY(U,$J,112,9040,1)
	;;=35.357^2.857^42.857^321.429^10.357^^^239.286^7.857^^^1035.714^1357.143^1.643^^^^^^1.036
	;;^UTILITY(U,$J,112,9040,2)
	;;=.571^2.143^4.286^^^^^^0
	;;^UTILITY(U,$J,112,9040,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9041,0)
	;;=MEAT SUBS,NUTEENA,CND,LOMA LINDA^BC-02314^1/2"-slice^67
	;;^UTILITY(U,$J,112,9041,1)
	;;=11.94^17.91^7.463^238.806^58.209^^^31.343^1.791^^^298.507^179.104^1.299^^^^^^.701
	;;^UTILITY(U,$J,112,9041,2)
	;;=.866^20.896^4.179^.672^^1.493^^^0
	;;^UTILITY(U,$J,112,9041,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9042,0)
	;;=MEAT SUBS,NUTMEAT,MILISTONE^BC-02315^2.5-oz.^71
	;;^UTILITY(U,$J,112,9042,1)
	;;=10.141^14.085^9.296^211.268^61.972^^^29.577^.507^^^366.197^394.366^.859^^^^^^.014
	;;^UTILITY(U,$J,112,9042,2)
	;;=.042^2.817^1.296^^^^^^0
	;;^UTILITY(U,$J,112,9042,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9043,0)
	;;=MEAT SUBS,OCEAN FILLET,FROZEN,LOMA LINDA^BC-02316^fillet^47
	;;^UTILITY(U,$J,112,9043,1)
	;;=23.404^17.021^8.511^276.596^44.681^^^95.745^2^^^595.745^489.362^1.404^^^^^^1.106
	;;^UTILITY(U,$J,112,9043,2)
	;;=.894^11.915^4.468^1.511^^4.255^^^0
	;;^UTILITY(U,$J,112,9043,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9044,0)
	;;=MEAT SUBS,OCEAN PLATTER,DRY PACK,LOMA LINDA^BC-02317^1/4-cup^16
	;;^UTILITY(U,$J,112,9044,1)
	;;=50^6.25^31.25^312.5^6.25^^^162.5^4.5^^^1062.5^1625^2.188^^^^^^3.813
	;;^UTILITY(U,$J,112,9044,2)
	;;=1.625^18.75^9.375^2.5^^12.5^^^0
	;;^UTILITY(U,$J,112,9044,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9045,0)
	;;=MEAT SUBS,PATTY MIX,DRY PACK,LOMA LINDA^BC-02318^1/4-cup^16
	;;^UTILITY(U,$J,112,9045,1)
	;;=56.25^6.25^25^312.5^6.25^^^187.5^4.5^^^937.5^2000^1.813^^^^^^3.813
	;;^UTILITY(U,$J,112,9045,2)
	;;=2.125^23.125^9.375^3.625^^12.5^^^0
	;;^UTILITY(U,$J,112,9045,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9046,0)
	;;=MEAT SUBS,PROTEENA,CND,LOMA LINDA^BC-02319^1/2"-slice^71
	;;^UTILITY(U,$J,112,9046,1)
	;;=23.944^8.451^7.042^197.183^56.338^^^30.986^2.254^^^394.366^647.887^1.69^^^^^^.901
	;;^UTILITY(U,$J,112,9046,2)
	;;=.704^10.986^3.521^.704^^2.817^^^0
	;;^UTILITY(U,$J,112,9046,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9047,0)
	;;=MEAT SUBS,REDI-BURGER,CND,LOMA LINDA^BC-02320^1/2"-slice^68
	;;^UTILITY(U,$J,112,9047,1)
	;;=20.588^8.824^7.353^191.176^57.353^^^27.941^2.059^^^176.471^544.118^1.765^^^^^^.882
	;;^UTILITY(U,$J,112,9047,2)
	;;=.588^9.853^2.206^1.176^^2.941^^^0
	;;^UTILITY(U,$J,112,9047,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9048,0)
	;;=MEAT SUBS,ROAST BEEF,FROZEN,LOMA LINDA^BC-02321^2-slices^57
	;;^UTILITY(U,$J,112,9048,1)
	;;=19.298^19.298^3.509^263.158^54.386^^^42.105^2.632^^^210.526^1175.439^1.404^^^^^^.298
	;;^UTILITY(U,$J,112,9048,2)
	;;=.509^2.456^3.158^.561^^1.754^^^0
