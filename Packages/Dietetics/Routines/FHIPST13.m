FHIPST13	; HISC/NCA - Ingredient Items 5 ;5/1/95  12:11
	;;5.0;Dietetics;;Oct 11, 1995
	F I=1:1 S A=$P($T(ITEMS+I),";",3,99) Q:A=""  I $P(A,"^",2) S ^TMP($J,"FHING",CTR)=A,CTR=CTR+1
	Q
ITEMS	;;
	;;PORK CHOPS, BONELESS^161^1
	;;TAMALES, BEEF, CND, W/CHILI GRAVY^^1
	;;PUDDING, CND, RICE^^1
	;;SOUP, COND, FRENCH ONION^564^8.501
	;;SOUP, COND, MINESTRONE^560^8.501
	;;SOUP, COND, CREAM OF CELERY^547^8.607
	;;SOUP, COND, CHICKEN-VEGETABLE^555^8.501
	;;COLESLAW DRESSING^^8.5
	;;ICING MIX, WHITE CREAM^893^1
	;;CHICKEN/VEGETABLES, CND, CHOW MEIN^980^1
	;;POTATO CHIPS, IND^1529^.094
	;;CREAMER, NONDAIRY, POWDER IND^67^.062
	;;VANILLA, IMITATION FLAVOR^^8
	;;MUSHROOMS, CND, WHOLE, DIET LO NA^2022^1
	;;STARCH, TAPIOCA^^1
	;;MACARONI, ELBOW ENRICHED^1318^1
	;;MUFFIN MIX, DATE^^1
	;;WALNUTS, ENGLISH, SHELLED^1993^1
	;;JELLY, APPLE, BULK^1264^1
	;;JELLY, GRAPE, BULK^1264^1
	;;SOY SAUCE^3025^8.184
	;;PEPPER, RED, GROUND^289^1
	;;LARD^350^1
	;;PEAS, CND, DIET, LO NA^1418^1
	;;CARROT PUREE^6449^1
	;;BEET PUREE^6448^1
	;;CRANBERRY SAUCE, CND, WHOLE^1661^1
	;;CRANBERRY SAUCE, CND, JELLIED OR STRAINED^1661^1
	;;BEANS, KIDNEY, CND, IN BRINE^2645^1
	;;JUICE, VEGETABLE, CND^1976^8.536
	;;MUSHROOMS, CND, PIECES^1346^1
	;;JUICE, PRUNE, CND, UNSW^1790^9.03
	;;JUICE, ORANGE, FROZEN, CONC, UNSW^1733^8.776
	;;SPAGHETTI, REGULAR COOKING^1857^1
	;;JAM, APRICOT^1262^1
	;;TOMATOES, CND, DIET^1935^1
	;;CHERRIES, CND, LT SWEET, UNPITTED, WATER-PAK^1653^1
	;;CARROTS, CND, SLICED OR DICED, DIET, LO NA^941^1
	;;FRUIT SALAD, CND, WATER PAK, DIET^1678^1
	;;GREEN BEAN PUREE,  DIET LO NA^6451^1
	;;CORN, CND, WHOLE GRAIN, DIET LO NA^1038^1
	;;SUSTACAL, VANILLA, BULK^6003^2.116
	;;SQUASH, FROZEN, MASHED^1901^1
	;;CHOWCHOW, SWEET^1443^8.642
	;;APPLE RINGS, SPICED, UNPEELED, SYRUP PAK^^.022
	;;PAPAYA, CND, SYRUP-PAK^^1
	;;ASPARAGUS PUREE, GREEN, DIET^6447^1
	;;PEPPERS, GREEN, CND, HALVED, BELL^2053^1
	;;CORN PUREE, DIET LOW SODIUM^6450^1
	;;SOUP, COND, BEEF WITH BARLEY^^8.6
	;;CEREAL, CREAM OF RICE, QUIK-COOK^1161^1
	;;CAKE MIX, CHOCOLATE^2686^1
	;;MEAT TENDERIZER^^1
	;;PIE FILLING, INSTANT, CHEESE CAKE MIX^^1
	;;CEREAL, CORN FLAKES, LOW SODIUM, IND^1109^.04
	;;EGGNOG MIX, DRY^2224^1
	;;GREENS, KALE, CND, CHOPPED^1269^1
	;;MERITENE, EGGNOG, BULK^6013^1
	;;GREENS, TURNIP, FROZEN^1967^1
	;;FRUIT SALAD, CND, SYRUP-PAK^1681^1
	;;GARLIC PASTE, PURE^^1
	;;SOY SAUCE, IND^3025^.009
	;;CRACKERS, SODA, SALTED, BULK^1080^1
	;;SOUP AND GRAVY BASE, HAM^^1
	;;MAYONNAISE, IND^360^.055
	;;BEANS, LIMA, DRY^697^1
	;;PEAS, DRY, SPLIT, GREEN^1425^1
	;;JUICE, GRAPEFRUIT, CND^1693^8.804
	;;SAUERKRAUT, CND^1604^1
	;;CATSUP, TOMATO, BULK^1938^1
	;;BEANS, KIDNEY, DRY^2644^1
	;;JUICE, APRICOT AND ORANGE, CND^1387^8.804
	;;JAM, STRAWBERRY, IND^1263^.031
	;;POPCORN, YELLOW^1499^1
	;;BARBECUE SAUCE, REGULAR FLAVOR^523^8.819
	;;CRABAPPLES, SPICED, CANNED, WHOLE, SYRUP-PAK^^1
	;;BANANA PULP, MASHED^1635^1
	;;BEETS, CND, DICED^780^1
	;;GRAPEFRUIT AND ORANGES, CND, SYRUP-PAK^^1
	;;SALAD DRESSING, MAYO-TYPE, IND^354^.050
	;;CEREAL, ROLLED OATS, REGULAR-COOKING^1171^1
	;;BEANS, WHITE, DRY, GREAT NORTHERN^2269^1
	;;SAUCE FOR MEAT, (A-1)^^8.53
	;;PEACHES, FROZEN, SLICED^1755^1
	;;PLUMS, CND, GREEN GAGE^^1
	;;BEANS, CUT GREEN, DIET, CND^717^1
	;;BEANS, CUT GREEN, CND^715^1
	;;BEANS, LIMA, CND^700^1
	;;BEANS, LIMA, CND, DIET^702^1
	;;TOMATO PUREE^1950^1
	;;VINEGAR, CIDER^1986^8.466
	;;SOUP, COND, SPLIT GREEN PEA W/HAM^568^8.924
	;;SOUP, COND, NAVY BEAN^544^8.924
	;;DESSERT POWDER, PUDDING, STRAWBERRY^^1
	;;CLAMS, CND, MINCED^982^1
	;;POLYCOSE, UNFLAVORED^6421^.265
	;;CHICKEN BREAST, FROZEN, READY-TO-COOK^423^1
	;;CHERRIES, MARASCHINO, HALVES^962^8.27
	;;SPINACH, FROZEN, CHOPPED^1871^1
	;;CITROTEIN, ORANGE^6031^1
	;;STRAWBERRIES, FROZEN, WHOLE, UNSW^1804^1
	;;CEREAL, ASSORTED, IND^^.062
	;;JUICE, APPLE, FROZEN, UNSW, IND^1818^.264
	;;CRANBERRY JUICE COCKTAIL, FROZEN, UNSW, IND^2261^.275
	;;PORK PUREE, W/SALT ADDED^^1
	;;PANCAKE MIX, BLUEBERRY^^1
	;;DESSERT POWDER, PUDDING, TAPIOCA^1923^1
	;;SUSTACAL, VANILLA, IND^6003^.522
	;;PINEAPPLE, CND, CHUNKS, SYRUP-PAK^1773^1
	;;CRANBERRY SAUCE, CND, JELLIED, DIET IND^^.066
	;;PIE FILLING, INSTANT, VANILLA CREME^^1
	;;BEANS, SMALL, RED, DRY^695^1
	;;CHEESE, SWISS, SLICES^40^.066
	;;PINEAPPLE, CND, SLICED, SYRUP-PAK^1772^1
	;;PIE FILLING, CHERRY^^1
	;;PIE FILLING, BLUEBERRY^^1
	;;TURKEY PUREE, W/SALT^6477^1
	;;JUICE, PRUNE, FROZEN, CONC, UNSW^1790^9.03
	;;HAM PUREE, SALTED^^1
	;;AMIN-AID, ORANGE^6135^.325
	;;MARGARINE, CORN OIL, UNSALTED, STICK^371^1
	;;CRANBERRY JUICE COCKTAIL, SWEETENED, IND^1660^.279
	;;JUICE, VEGETABLE, CND, IND^1976^.401
	;;PUDDING, CND, BANANA^6614^1
	;;FLOUR, GENERAL PURPOSE^1998^1
	;;CRACKERS, OYSTER, SALTED, IND^^.018
