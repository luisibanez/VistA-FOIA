FHINI0EP	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,9130,0)
	;;=HAM,CURED,BOILED,OSCAR MAYER^BC-02403^slice^21
	;;^UTILITY(U,$J,112,9130,1)
	;;=18.571^3.333^.952^109.524^72.857^^^4.762^.952^19.048^323.81^280.952^1309.524^1.571
	;;^UTILITY(U,$J,112,9130,2)
	;;=^^^^^^^^57.143^1.429^1.905^.476
	;;^UTILITY(U,$J,112,9130,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9131,0)
	;;=HAM,CURED,CHOPPED,OSCAR MAYER^BC-02404^slice^28
	;;^UTILITY(U,$J,112,9131,1)
	;;=16.429^12.5^2.857^185.714^65^^^7.143^1.071^17.857^217.857^325^1157.143^3
	;;^UTILITY(U,$J,112,9131,2)
	;;=^^^^^^^^60.714^4.286^6.429^1.786
	;;^UTILITY(U,$J,112,9131,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9132,0)
	;;=HAM,CURED,DEVILED,ARMOUR STAR^BC-02405^1.5-oz.^43
	;;^UTILITY(U,$J,112,9132,1)
	;;=13.953^20.93^0^255.814^^^^^^^^^883.721
	;;^UTILITY(U,$J,112,9132,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9133,0)
	;;=HAM,CURED,LOW SALT,OSCAR MAYER^BC-02406^slice^21
	;;^UTILITY(U,$J,112,9133,1)
	;;=17.143^3.333^2.857^114.286^72.857^^^4.762^1.238^19.048^257.143^890.476^790.476^1.952
	;;^UTILITY(U,$J,112,9133,2)
	;;=^^^^^^^^47.619^1.429^1.429^.476
	;;^UTILITY(U,$J,112,9133,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9134,0)
	;;=HAM,CURED,SMOKED,OSCAR MAYER^BC-02407^slice^21
	;;^UTILITY(U,$J,112,9134,1)
	;;=18.095^3.81^.476^104.762^73.81^^^4.762^.905^19.048^280.952^.476^1261.905^1.762
	;;^UTILITY(U,$J,112,9134,2)
	;;=^^^^^^^^57.143^1.429^1.905^0
	;;^UTILITY(U,$J,112,9134,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9135,0)
	;;=HAM,CURED W/BLACK CRACKED PEPPER,OSCAR MAYER^BC-02408^slice^21
	;;^UTILITY(U,$J,112,9135,1)
	;;=18.095^3.333^.952^104.762^73.333^^^4.762^1.048^19.048^276.19^300^1352.381^1.857^.286
	;;^UTILITY(U,$J,112,9135,2)
	;;=^^^^^^^^52.381^1.429^1.905^.476
	;;^UTILITY(U,$J,112,9135,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9136,0)
	;;=HAM & CHEESE LOAF,OSCAR MAYER^BC-02409^slice^28
	;;^UTILITY(U,$J,112,9136,1)
	;;=15.357^17.857^3.571^235.714^59.286^^^64.286^.857^17.857^267.857^271.429^1285.714^1.786
	;;^UTILITY(U,$J,112,9136,2)
	;;=^^^^^^^^67.857
	;;^UTILITY(U,$J,112,9136,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9137,0)
	;;=HEADCHEESE (PORK),OSCAR MAYER^BC-02410^slice^28
	;;^UTILITY(U,$J,112,9137,1)
	;;=16.071^14.643^0^196.429^66.429^^^14.286^1.357^10.714^60.714^32.143^1239.286^1.214
	;;^UTILITY(U,$J,112,9137,2)
	;;=^^^^^^^^92.857^5^7.857^1.786
	;;^UTILITY(U,$J,112,9137,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9138,0)
	;;=HONEY HAM,OSCAR MAYER^BC-02411^slice^21
	;;^UTILITY(U,$J,112,9138,1)
	;;=18.095^3.333^2.381^109.524^71.905^^^4.762^1.095^19.048^266.667^290.476^1276.19^1.81
	;;^UTILITY(U,$J,112,9138,2)
	;;=^^^^^^^^57.143^1.429^2.381^.476
	;;^UTILITY(U,$J,112,9138,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9139,0)
	;;=HONEY LOAF (PORK&BEEF),OSCAR MAYER^BC-02412^slice^28
	;;^UTILITY(U,$J,112,9139,1)
	;;=18.214^3.571^3.929^121.429^70.357^^^21.429^1.214^21.429^178.571^360.714^1353.571^2.607
	;;^UTILITY(U,$J,112,9139,2)
	;;=^^^^^^^^57.143^1.429^2.143^.357
	;;^UTILITY(U,$J,112,9139,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9140,0)
	;;=JALAPENO LOAF,OSCAR MAYER^BC-02413^slice^28
	;;^UTILITY(U,$J,112,9140,1)
	;;=11.071^19.643^8.571^257.143^55.357^^^60.714^.679^17.857^171.429^300^1657.143^1.214
	;;^UTILITY(U,$J,112,9140,2)
	;;=^^^^^^^^35.714^8.214^10^2.143
	;;^UTILITY(U,$J,112,9140,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9141,0)
	;;=LEBANON BOLOGNA (BEEF),OSCAR MAYER^BC-02414^slice^23
	;;^UTILITY(U,$J,112,9141,1)
	;;=20.435^13.043^1.304^204.348^60.87^^^13.043^2.565^17.391^152.174^308.696^1313.043^3.957
	;;^UTILITY(U,$J,112,9141,2)
	;;=^^^^^^^^69.565^6.087^6.522^.435
	;;^UTILITY(U,$J,112,9141,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9142,0)
	;;=MEAT SPREAD,CHICKEN CARNATION^BC-02415^1.9-oz.^53
	;;^UTILITY(U,$J,112,9142,1)
	;;=11.321^11.321^3.774^169.811^64.34^^^11.321^.566^13.208^88.679^135.849^377.358^.528^.038^^^16.981^0^.038
	;;^UTILITY(U,$J,112,9142,2)
	;;=.057^4.528^.358^.226^5.66^.132^^^30.189^2.264^^7.547
	;;^UTILITY(U,$J,112,9142,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,9143,0)
	;;=MEAT SPREAD,CHICKEN CHUNKY,SWANSON^BC-02416^oz.^28
	;;^UTILITY(U,$J,112,9143,1)
	;;=16.786^11.429^6.071^196.429^^^^85.714^1.071^^^82.143^514.286^^^^^0^0^0
