FHINI0HY	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(113)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,113,972,0)
	;;=BEEF, CORNED, FRZ^BEEF,CORNED,FULCOOKED^^^LB^LB^^1^^^^^1^^^LB^1^^^^771^1
	;;^UTILITY(U,$J,113,973,0)
	;;=MILK, SKIM^MILK SKIM 5GL CT^^^CT^5 GL CT^^1^^^^^2^^^GAL^5^^^^82^8.642
	;;^UTILITY(U,$J,113,974,0)
	;;=SOUP, COND, VEGETARIAN VEGETABLE^SOUP VEGET VEG NO3^8935-01-245-3448^1^CN^#3 CN^12^1^1.45^^^^3^^^GAL^.36^^^^578^8.501
	;;^UTILITY(U,$J,113,975,0)
	;;=SPAGHETTI SAUCE, ITALIAN, MEATLESS^SPAG SAUCE #10^8950-00-092-3098^1^CN^#10 CN^6^1^2.44^^^^3^^^LB^6.5^^^^6643^1
	;;^UTILITY(U,$J,113,976,0)
	;;=TEA, 1 OZ BAG^TEA BAG 1 OZ 48S^8955-00-851-7088^1^CS^CS-48^^1^4.61^^^^6^^^EACH^48^^^^1926^.062
	;;^UTILITY(U,$J,113,977,0)
	;;=CRANBERRY SAUCE, CND, JELLIED OR STRAINED, IND^CRAN SAUCE INDIVCUP2C^^^CS^CS-200^^1^^^^^3^^^EACH^200^^^^1661^.066
	;;^UTILITY(U,$J,113,978,0)
	;;=RESOURCE INSTANT CRYSTAL^DIETSUP RES CRY 2OZ^8940-01-258-2870^1^PG^2-OZ PG^24^1^.42^^^^5^^^EACH^1^^^^^.176
	;;^UTILITY(U,$J,113,979,0)
	;;=COFFEE, GROUND, HIGH EXTRACTION^COFFEE GRN HIGHE 12OZ^8955-01-155-5174^1^BG^12-OZ BG^32^1^1.43^^^^6^^^LB^.75^^^^^1
	;;^UTILITY(U,$J,113,980,0)
	;;=MILK, SKIM, IND^MILK SKIM IND CT^^^CT^8-OZ CT^^1^^^^^2^^^EACH^1^^^^82^.54
	;;^UTILITY(U,$J,113,981,0)
	;;=MILK, CHOCOLATE, IND^MILK CHOC IND^^^CT^8-OZ CT^^1^^^^^2^^^EACH^1^^^^99^.551
	;;^UTILITY(U,$J,113,982,0)
	;;=SUSTACAL, STRAWBERRY, IND^DIET STRAWLQSUSTA 80Z^8940-01-258-2868^1^CN^8-OZ CN^12^1^.40^^^^5^^^EACH^1^^^^6003^.522
	;;^UTILITY(U,$J,113,983,0)
	;;=NUTREX BESURE, VANILLA, POWDER^DIET NUTREX PWD 14OZ^8940-01-258-2869^1^CN^14-OZ CN^6^1^2.52^^^^5^^^LB^.88^^^^^1
	;;^UTILITY(U,$J,113,984,0)
	;;=NUTRI-SOURCE CARBOHYDRATE^DIET SUP NUTRIS 4OZ^8940-01-255-6768^1^CN^4-OZ CN^48^1^1.87^^^^5^^^EACH^1^^^^6484^.551
	;;^UTILITY(U,$J,113,985,0)
	;;=NUTREX AMINEX, POWDER^DIET SUP NUTAMI 2.82O^^^PG^2.82-OZ PG^^1^^^^^5^^^EACH^1^^^^^.176
	;;^UTILITY(U,$J,113,986,0)
	;;=LONALAC, POWDER^DIET SUPLONALOAC1LB^8940-01-259-9357^1^CN^1# CN^6^1^9.07^^^^5^^^LB^1^^^^6011^1
	;;^UTILITY(U,$J,113,987,0)
	;;=BACON BITS, COOKED ^BACON BITS CKD^8940-01-269-1900^1^CO^10# CO^2^1^25.41^^^^6^^^LB^10^^^^^1
	;;^UTILITY(U,$J,113,988,0)
	;;=BEVERAGE BASE, CHERRY, SWT^DRNKMX CHERRY^8960-01-272-7835^1^CO^BG^12^1^.96^^^^6^^^EACH^1^^^^^.529
	;;^UTILITY(U,$J,113,989,0)
	;;=BEVERAGE BASE, FRUIT PUNCH, SWT^DRNKMX FRT PUNCH^8960-01-272-3133^1^CO^BG^12^1^.96^^^^6^^^EACH^1^^^^^.529
	;;^UTILITY(U,$J,113,990,0)
	;;=BEVERAGE BASE, GRAPE, SWT^DRNKMX GRAPE^8960-01-272-4459^1^CO^BG^12^1^.96^^^^6^^^EACH^1^^^^^.529
	;;^UTILITY(U,$J,113,991,0)
	;;=BEVERAGE BASE, LEMON, SWT^DRNKMX LEMON^8960-01-272-3134^1^CO^BG^12^1^.96^^^^6^^^EACH^1^^^^^.529
	;;^UTILITY(U,$J,113,992,0)
	;;=BEVERAGE BASE, ORANGE, SWT^DRNKMX ORANGE^8960-01-272-4460^1^CO^BG^12^1^.96^^^^6^^^EACH^1^^^^^.529
	;;^UTILITY(U,$J,113,993,0)
	;;=SAUCE, BROWNING/SEASONING^BRWN SEAS SCE 1GL^8950-01-269-1899^1^CO^GL JR^4^1^14.64^^^^6^^^GAL^1^^^^^8
	;;^UTILITY(U,$J,113,994,0)
	;;=CHERRIES, CND, LT SWEET, UNPITTED, NAT-PAK^CHERRIES UNP #10^8915-01-266-8642^1^CN^#10 CN^6^1^5.85^^^^3^^^LB^6.5^^^^1654^1
	;;^UTILITY(U,$J,113,996,0)
	;;=MACARONI, RIGATONI^MACARONI RIG 1#^8920-01-267-2444^1^BX^1# BX^20^1^.70^^^^4^^^LB^1^^^^1318^1
	;;^UTILITY(U,$J,113,997,0)
	;;=ORANGES, CND, MANDARIN, NAT-PAK^ORANGES CAN MAND#10^8915-01-266-9396^1^CN^#10 CN^6^1^4.54^^^^3^^^LB^6.5^^^^1736^1
	;;^UTILITY(U,$J,113,998,0)
	;;=PICKLES, CUCUMBER, DILL, HAMBURGER^PICK CUCUM HAMB #10^8950-01-264-9840^1^CN^#10 CN^6^1^2.34^^^^6^^^LB^6.5^^^^1438^1
	;;^UTILITY(U,$J,113,999,0)
	;;=PINEAPPLE, CND, SLICED, JCE-PAK^PINEAPPLE SLD#10^8915-01-266-8645^1^CN^#10 CN^6^1^3.12^^^^3^^^LB^6.5^^^^1771^1
	;;^UTILITY(U,$J,113,1000,0)
	;;=BEVERAGE BASE, CHERRY, ART SWT^DRNKMX SF CHERRY^8940-01-272-4461^1^CO^BG^12^1^1.34^^^^6^^^EACH^1^^^^^.529
	;;^UTILITY(U,$J,113,1001,0)
	;;=BEVERAGE BASE, FRUIT PUNCH, ART SWT^DRNKMX SF FRT PUNCH^8940-01-272-4463^1^CO^BG^12^1^1.34^^^^6^^^EACH^1^^^^^.529
	;;^UTILITY(U,$J,113,1002,0)
	;;=BEVERAGE BASE, GRAPE, ART SWT^DRNKMX SF GRAPE^8940-01-272-4462^1^CO^BG^12^1^1.34^^^^6^^^EACH^1^^^^^.529
	;;^UTILITY(U,$J,113,1003,0)
	;;=BEVERAGE BASE, LEMON, ART SWT^DRNKMX SF LEMON^8940-01-272-4464^1^CO^BG^12^1^1.34^^^^6^^^EACH^1^^^^^.529
	;;^UTILITY(U,$J,113,1004,0)
	;;=BEVERAGE BASE, ORANGE, ART SWT^DRNKMX SF ORANGE^8940-01-272-4465^1^CO^BG^12^1^1.34^^^^6^^^EACH^1^^^^^.529
	;;^UTILITY(U,$J,113,1005,0)
	;;=WATER, COLD^WATER^^^GL^GL BT^^1^^^^^6^^^GAL^1^^^^2021^8.36
	;;^UTILITY(U,$J,113,1006,0)
	;;=WATER, HOT^WATER^^^GL^GL JR^^1^^^^^6^^^GAL^1^^^^2021^8.36
	;;^UTILITY(U,$J,113,1007,0)
	;;=STOCK, SOUP^SOUP STOCK^^^GL^GL JR^^1^^^^^6^^^GAL^1^^^^^8