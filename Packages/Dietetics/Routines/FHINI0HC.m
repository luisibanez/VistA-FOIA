FHINI0HC	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(113)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,113,146,0)
	;;=JUICE, LEMON, IND^JUICE LEMON INDIV 2C^^^CS^CS-200^^1^^^^^3^^^EACH^200^^^^1708^.009
	;;^UTILITY(U,$J,113,147,0)
	;;=JUICE, PRUNE, CND, UNSW, IND^JUICE PRUNE SINGLE6OZ^^^CN^6-OZ CN^^1^^^^^3^^^EACH^1^^^^1790^.423
	;;^UTILITY(U,$J,113,148,0)
	;;=JUICE, TOMATO, CND, DIET, LOW NA^JUICE TOMATO DIET NO2^^^CN^#2 CN^^1^^^^^3^^^GAL^.14^^^^1943^8.607
	;;^UTILITY(U,$J,113,149,0)
	;;=MALTED MILK, POWDER, UNFLAV^MALT MILKPWDUNFLV2LBS^^^PG^2# PG^^1^^^^^5^^^LB^2^^^^95^1
	;;^UTILITY(U,$J,113,150,0)
	;;=MARGARINE, SALTED, PATS^MARG COL INDIV PATTIE^^^LB^LB^^1^^^^^6^^^EACH^90^^^^372^.011
	;;^UTILITY(U,$J,113,151,0)
	;;=MARMALADE, ORANGE, IND^MARM ORAN INDIV CUP2C^^^CS^CS-200^^1^^^^^6^^^EACH^200^^^^1331^.031
	;;^UTILITY(U,$J,113,152,0)
	;;=MARSHMALLOWS, MINIATURE^MARS MINI WHT GRDA1LB^^^PG^1# PG^^1^^^^^6^^^LB^1^^^^927^1
	;;^UTILITY(U,$J,113,153,0)
	;;=MAYONNAISE, BULK^MAYONNAISE 1 GAL^^^JR^GL JR^^1^^^^^6^^^GAL^1^^^^360^7.76
	;;^UTILITY(U,$J,113,154,0)
	;;=MAYONNAISE, DIET, IND^MAYO DIET INDIV BAG2C^^^CS^CS-200^^1^^^^^6^^^EACH^200^^^^1588^.055
	;;^UTILITY(U,$J,113,155,0)
	;;=MAYONNAISE, DIET, BULK^MAYO DIET LOWSOD 32OZ^^^JR^QT BT^^1^^^^^6^^^GAL^.25^^^^1588^8.819
	;;^UTILITY(U,$J,113,156,0)
	;;=MILK SHAKE MIX, VANILLA^MILK SHAKEVANLL11/2LB^^^BG^1.5#-BG^^1^^^^^5^^^LB^1.5^^^^^1
	;;^UTILITY(U,$J,113,157,0)
	;;=MILK, DRY, NONFAT^MILK DRYNONFATMDM25LB^8910-01-128-0411^1^SA^25# SA^^1^25.17^^^^2^^^LB^25^^^^138^1
	;;^UTILITY(U,$J,113,158,0)
	;;=MILK, EVAPORATED, UNSW^MILK EVAP7/9PCT63/4LB^8910-00-851-5310^1^CN^6.75#-CN^6^1^2.77^^^^2^^^LB^6.75^^^^137^1
	;;^UTILITY(U,$J,113,159,0)
	;;=MINCEMEAT, CND^MINCEMEAT 1#CN^^^CN^1# CN^^1^^^^^3^^^LB^1^^^^^1
	;;^UTILITY(U,$J,113,160,0)
	;;=MOLASSES^MOLA CANE LQD 12OZ^^^BT^12-OZ BT^^1^^^^^6^^^GAL^.094^^^^1334^11.57
	;;^UTILITY(U,$J,113,161,0)
	;;=MONOSODIUM GLUTAMATE^MONO GLUTAMATE 1 LB^^^CN^1# CN^^1^^^^^6^^^LB^1^^^^^1
	;;^UTILITY(U,$J,113,162,0)
	;;=MUSTARD, DIET, LO NA, IND^MUST PRPD DIETINDIV4C^^^CS^CS-400^^1^^^^^6^^^EACH^400^^^^^.033
	;;^UTILITY(U,$J,113,163,0)
	;;=MUSTARD, BULK^MUST PRPD LIGHT 1 QT^8950-00-478-5159^1^JR^QT JR^12^1^.60^^^^6^^^GAL^.25^^^^1359^8
	;;^UTILITY(U,$J,113,164,0)
	;;=MUSTARD, IND^MUST PRPD INDIV BAG2C^^^CS^CS-200^^1^^^^^6^^^EACH^200^^^^1359^.022
	;;^UTILITY(U,$J,113,165,0)
	;;=NOODLES, CHOW MEIN^NOOD CHOW MEIN NO 10^8920-00-957-9560^1^CN^#10 CN^6^1^2.80^^^^4^^^LB^6.5^^^^1365^1
	;;^UTILITY(U,$J,113,166,0)
	;;=NOODLES, EGG TYPE^NOOD EGGRBN1/4INCHILB^8920-00-402-4362^1^PG^1# PG^12^1^.56^^^^4^^^LB^1^^^^1363^1
	;;^UTILITY(U,$J,113,167,0)
	;;=NOODLES, EGG TYPE, LASAGNA^NOOD LASAG 1#^8920-01-261-9853^1^BX^1# BX^12^1^.75^^^^4^^^LB^1^^^^1363^1
	;;^UTILITY(U,$J,113,168,0)
	;;=OLIVES, GREEN, STUFFED W/PIMENTO^OLIV GRENSTUFGRDB1GAL^8950-00-851-5291^1^JR^GL JR^4^1^7.76^^^^6^^^GAL^1^^^^1372^8.2
	;;^UTILITY(U,$J,113,169,0)
	;;=OLIVES, GREEN, W/PITS^OLIV GRNUNPITED 1 GAL^^^JR^GL JR^^1^^^^^6^^^GAL^1^^^^1372^8.2
	;;^UTILITY(U,$J,113,170,0)
	;;=OLIVES, RIPE, W/PITS^OLIVE RIPE UNPIT NO10^8950-00-127-3110^1^CN^#10 CN^6^1^4.67^^^^6^^^LB^6.5^^^^1374^1
	;;^UTILITY(U,$J,113,171,0)
	;;=ONIONS, CND, TINY^ONIONS WHL SMGRDANO10^^^CN^#10 CN^^1^^^^^3^^^LB^6.5^^^^2046^1
	;;^UTILITY(U,$J,113,172,0)
	;;=ORANGES, CND, MANDARIN, WP DIET^ORAN MANDRNDIET15-1/4^^^CN^1# CN^^1^^^^^3^^^LB^1^^^^^1
	;;^UTILITY(U,$J,113,173,0)
	;;=OREGANO, GROUND^OREG GROUND 10 OZ^^^CN^10-OZ CN^^1^^^^^6^^^LB^.63^^^^285^1
	;;^UTILITY(U,$J,113,174,0)
	;;=PANCAKE MIX, BUTTERMILK^PANC MIXBUTMLK24-30LB^^^CS^24# CS^^1^^^^^4^^^LB^24^^^^^1
	;;^UTILITY(U,$J,113,175,0)
	;;=PANCAKE MIX, PLAIN^PANC MIXPLN COMB 5 LB^^^BX^5# BX^^1^^^^^4^^^LB^5^^^^^1
	;;^UTILITY(U,$J,113,176,0)
	;;=PARSLEY, FLAKES^PARS DEHYD FLAKES 8OZ^^^CN^8-OZ CN^^1^^^^^3^^^LB^.5^^^^287^1
	;;^UTILITY(U,$J,113,177,0)
	;;=PEACH PUREE^PEACH PUREE GRDANO303^^^CN^#303 CN^^1^^^^^3^^^LB^1^^^^6453^1
	;;^UTILITY(U,$J,113,178,0)
	;;=PEACHES, CND, HALVES, SYRUP-PAK^PEAC HVD LTSYRUP NO10^8915-01-094-7048^1^CN^#10 CN^6^1^3.15^^^^3^^^LB^6.5^^^^1750^1
	;;^UTILITY(U,$J,113,179,0)
	;;=PEACHES, CND, HALVES, DIET^PEACHES WTR 8KDIET303^8940-00-851-5302^1^CN^#303 CN^24^1^.69^^^^3^^^LB^1^^^^1747^1
	;;^UTILITY(U,$J,113,180,0)
	;;=PEACHES, CND, SLICED CLINGSTONE, SYRUP-PAK^PEAC SLCDLTSYRUP NO10^8915-01-094-7049^1^CN^#10 CN^6^1^3.60^^^^3^^^LB^6.5^^^^1750^1
	;;^UTILITY(U,$J,113,181,0)
	;;=PEACHES, CND, SLICED, DIET^PEAC CNNDSLCDWTRPK303^^^CN^#303 CN^^1^^^^^3^^^LB^1^^^^1747^1
	;;^UTILITY(U,$J,113,182,0)
	;;=PEANUT BUTTER, DIET, LOW SODIUM^PEANUT BUTTERDIET12OZ^^^JR^12-OZ JR^^1^^^^^6^^^LB^.75^^^^2023^1
