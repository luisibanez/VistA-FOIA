FHINI07C	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,2559,0)
	;;=FF, BURRITO, W/ BEEF^21-066^burritos^110^100^N
	;;^UTILITY(U,$J,112,2559,1)
	;;=12.09^9.46^26.6^238^49.61^^^38^2.77^37^79^336^678^2.15^.186^.357^^126^.5^.11
	;;^UTILITY(U,$J,112,2559,2)
	;;=.42^2.93^1.36^.14^18^.89^.35^.039^29^4.754^3.368^.388^13^2.24
	;;^UTILITY(U,$J,112,2559,3)
	;;=.147^.449^.482^.909^.782^.256^.155^.494^.367^.548^.712^.347^.663^.945^2.582^.746^.824^.5
	;;^UTILITY(U,$J,112,2559,4)
	;;=^^.414^2.59^^1.75^3.368
	;;^UTILITY(U,$J,112,2559,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2560,0)
	;;=FF, BURRITO, W/ BEEF AND CHILI PEPPERS^21-067^burritos^100.5^100^N
	;;^UTILITY(U,$J,112,2560,1)
	;;=10.7^8.23^24.6^212^54.45^^^43^2.21^30^70^248^555^2.15^.157^.371^^230^.8^.2
	;;^UTILITY(U,$J,112,2560,2)
	;;=.4^2.53^.93^.15^18^.64^.451^.034^27^3.98^3.022^.485^23^2.02
	;;^UTILITY(U,$J,112,2560,3)
	;;=.13^.409^.432^.81^.733^.23^.13^.427^.325^.49^.65^.313^.61^.886^2.193^.684^.68^.436
	;;^UTILITY(U,$J,112,2560,4)
	;;=^^.299^2.293^^1.388^3.022
	;;^UTILITY(U,$J,112,2560,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2561,0)
	;;=FF, BURRITO, W/ BEEF, CHEESE, AND CHILI PEPPERS^21-068^burritos^152^100^N
	;;^UTILITY(U,$J,112,2561,1)
	;;=13.46^8.15^20.96^208^55.19^^^73^2.57^23^104^219^688^2.6^.119^.2^^320^1.2^.2
	;;^UTILITY(U,$J,112,2561,2)
	;;=.41^2.74^.99^.12^19^.68^^^56^3.42^3.267^.732^37^2.24
	;;^UTILITY(U,$J,112,2561,3)
	;;=.162^.495^.574^1.032^.92^.289^.147^.554^.436^.642^.756^.397^.686^1.054^2.851^.739^.947^.574
	;;^UTILITY(U,$J,112,2561,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2562,0)
	;;=FF, BURRITO, W/ FRUIT (APPLE OR CHERRY)^21-069^burritos^74^100^N
	;;^UTILITY(U,$J,112,2562,1)
	;;=3.38^12.87^47.27^312^35.63^^^21^1.45^10^20^141^286^.54^.11^.175^^548^1^.23
	;;^UTILITY(U,$J,112,2562,2)
	;;=.24^2.51^1.28^.1^5^.69^1.426^^5^6.175^4.621^1.426^50^.85
	;;^UTILITY(U,$J,112,2562,3)
	;;=.041^.091^.117^.228^.078^.059^.071^.167^.1^.135^.135^.075^.108^.168^1.109^.12^.382^.166
	;;^UTILITY(U,$J,112,2562,4)
	;;=^^.304^3.236^^2.635^4.621
	;;^UTILITY(U,$J,112,2562,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2563,0)
	;;=FF, CHIMICHANGA, W/ BEEF^21-070^chimichan.^174^100^N
	;;^UTILITY(U,$J,112,2563,1)
	;;=11.27^11.31^24.6^244^50.68^^^36^2.61^36^71^337^523^2.85^.243^.32^^84^2.7^.28
	;;^UTILITY(U,$J,112,2563,2)
	;;=.37^3.32^1.18^.16^18^.87^.604^.049^5^4.888^4.635^.653^9^2.14
	;;^UTILITY(U,$J,112,2563,3)
	;;=.137^.436^.465^.87^.773^.247^.141^.464^.349^.527^.688^.332^.642^.899^2.273^.727^.747^.467
	;;^UTILITY(U,$J,112,2563,4)
	;;=.027^.027^.591^2.693^^1.551^4.635
	;;^UTILITY(U,$J,112,2563,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2564,0)
	;;=FF, CHIMICHANGA, W/ BEEF AND CHEESE^21-071^chimichan.^183^100^N
	;;^UTILITY(U,$J,112,2564,1)
	;;=10.96^12.81^21.49^242^52.7^^^130^2.1^33^102^111^523^1.84^.192^.267^^295^1.5^.21
	;;^UTILITY(U,$J,112,2564,2)
	;;=.47^2.55^.98^.12^18^.71^.398^^28^6.108^5.155^.398^69^2.04
	;;^UTILITY(U,$J,112,2564,3)
	;;=.132^.397^.481^.858^.722^.239^.127^.474^.366^.538^.588^.32^.527^.79^2.375^.565^.851^.486
	;;^UTILITY(U,$J,112,2564,4)
	;;=^^.459^3.157^^2.492^5.155
	;;^UTILITY(U,$J,112,2564,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2565,0)
	;;=FF, CHIMICHANGE, W/ BEEF AND RED CHILI PEPPERS^21-072^chimichan.^190^100^N
	;;^UTILITY(U,$J,112,2565,1)
	;;=9.53^10.07^24.09^223^54.24^^^37^2.2^34^59^323^615^1.59^.145^.324^^138^.2^.15
	;;^UTILITY(U,$J,112,2565,2)
	;;=.35^2.81^1.15^.12^18^.57^.538^.044^5^4.354^4.128^.582^14^2.07
	;;^UTILITY(U,$J,112,2565,3)
	;;=.118^.364^.388^.728^.637^.203^.121^.396^.292^.44^.576^.279^.531^.796^2.062^.594^.632^.402
	;;^UTILITY(U,$J,112,2565,4)
	;;=.024^.024^.526^2.399^^1.381^4.128
	;;^UTILITY(U,$J,112,2565,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2566,0)
	;;=FF, CHIMICHANGA, W/ BEEF, CHEESE, AND RED CHILI PEPPERS^21-073^chimichan.^180^100^N
	;;^UTILITY(U,$J,112,2566,1)
	;;=8.15^9.75^21.26^202^59.19^^^121^1.75^23^81^183^497^2.57^.313^.217^^390^1^.13
	;;^UTILITY(U,$J,112,2566,2)
	;;=.53^1.92^.82^.09^18^.71^.303^^28^4.649^3.923^.303^55^1.65
	;;^UTILITY(U,$J,112,2566,3)
	;;=.097^.288^.332^.605^.5^.166^.1^.342^.254^.374^.438^.228^.392^.619^1.84^.422^.593^.35
	;;^UTILITY(U,$J,112,2566,4)
	;;=^^.349^2.402^^1.897^3.923
	;;^UTILITY(U,$J,112,2566,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,2567,0)
	;;=FF, ENCHILADA, W/ CHEESE^21-074^enchiladas^163^100^N
	;;^UTILITY(U,$J,112,2567,1)
	;;=5.91^11.56^17.51^196^63.23^^^199^.81^31^82^147^481^1.54^.159^.147^^712^.6^.05
	;;^UTILITY(U,$J,112,2567,2)
	;;=.26^1.17^.93^.24^21^.46^.449^.051^27^6.496^3.872^.501^114^1.78
