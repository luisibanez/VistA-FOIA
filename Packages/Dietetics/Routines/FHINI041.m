FHINI041	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,1313,0)
	;;=LAMB, LIVER, BROILED^1276-0^oz.^28.3^^N
	;;^UTILITY(U,$J,112,1313,1)
	;;=32.3^12.4^2.8^261^50.4^^^16^17.9^^572^331^85^^^^^74500^36^.49
	;;^UTILITY(U,$J,112,1313,2)
	;;=5.11^24.9^^^^^0^^438^3
	;;^UTILITY(U,$J,112,1313,20)
	;;=USDA  Std. Reference, Release 8
	;;^UTILITY(U,$J,112,1314,0)
	;;=LOBSTER, NORTHERN, CND OR CKD^15-148^oz.^28.3^100^N
	;;^UTILITY(U,$J,112,1314,1)
	;;=20.5^.59^1.28^98^76.03^^^61^.39^35^185^352^380^2.92^1.94^.061^^87^0^.007
	;;^UTILITY(U,$J,112,1314,2)
	;;=.066^1.07^.285^.077^11.1^3.11^.005^^72^.107^.16^.091^26^1.6^^^0
	;;^UTILITY(U,$J,112,1314,3)
	;;=.285^.83^.994^1.627^1.784^.577^.23^.866^.682^.964^1.791^.417^1.161^2.119^3.496^1.237^.676^.807
	;;^UTILITY(U,$J,112,1314,4)
	;;=^^.006^.081^.03^.02^.095
	;;^UTILITY(U,$J,112,1314,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1315,0)
	;;=LOBSTER NEWBERG^1281-0^cups^250^100^N
	;;^UTILITY(U,$J,112,1315,1)
	;;=18.5^10.6^5.1^194^64^^^87^.9^^192^171^229^^^^^0^0^.07
	;;^UTILITY(U,$J,112,1315,2)
	;;=.11^1.5^^^^^0^^182^6^^^^1.8
	;;^UTILITY(U,$J,112,1315,4)
	;;=^^^^^^4
	;;^UTILITY(U,$J,112,1315,20)
	;;=USDA  Std. Reference, Release 8
	;;^UTILITY(U,$J,112,1316,0)
	;;=LOBSTER SALAD^1282-0^cups^520^100^N
	;;^UTILITY(U,$J,112,1316,1)
	;;=10.1^6.4^2.3^110^80.3^^^36^.9^^95^264^124^^^^^0^18^.09
	;;^UTILITY(U,$J,112,1316,2)
	;;=.08^1.5^^^^^3^^46^1^^^^.9
	;;^UTILITY(U,$J,112,1316,4)
	;;=^^^^^^1
	;;^UTILITY(U,$J,112,1316,20)
	;;=USDA  Std. Reference, Release 8
	;;^UTILITY(U,$J,112,1317,0)
	;;=MACADAMIA NUTS^12-131^oz.^28.3^31^N
	;;^UTILITY(U,$J,112,1317,1)
	;;=8.3^73.72^13.73^702^2.88^^^70^2.41^116^136^368^5^1.71^.296^.588^^0^0^.35
	;;^UTILITY(U,$J,112,1317,2)
	;;=.11^2.14^.437^.196^15.7^0^1.271^^0^11.037^58.171^1.271^0^1.36^^^9.3
	;;^UTILITY(U,$J,112,1317,3)
	;;=.213^.263^.244^.462^.324^.092^.096^.26^.337^.321^.899^.168^.329^.827^1.782^.371^.396^.351
	;;^UTILITY(U,$J,112,1317,4)
	;;=^^.468^6.247^15.961^2.704^41.163
	;;^UTILITY(U,$J,112,1317,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1318,0)
	;;=MACARONI, ENR, FIRM STAGE, 8-10 MIN^20-100^cups^130^294^N
	;;^UTILITY(U,$J,112,1318,1)
	;;=4.77^.67^28.34^141^65.99^^^7^1.4^18^54^31^1^.53^.098^.285^^0^0^.204
	;;^UTILITY(U,$J,112,1318,2)
	;;=.098^1.672^.112^.035^7^0^.249^.024^0^.095^.079^.273^0^.24^^^1
	;;^UTILITY(U,$J,112,1318,3)
	;;=.061^.126^.184^.326^.091^.074^.134^.231^.125^.203^.176^.097^.14^.195^1.718^.151^.524^.225
	;;^UTILITY(U,$J,112,1318,4)
	;;=^^.001^.083^^.011^.079^^^21.3
	;;^UTILITY(U,$J,112,1318,20)
	;;=USDA Std. Reference, Release 10;HCF Nutrition Research Foundation, Inc, 1990
	;;^UTILITY(U,$J,112,1319,0)
	;;=MACARONI, VEGETABLE, COOKED, ENRICHED^20-106^cups^140^316^N
	;;^UTILITY(U,$J,112,1319,1)
	;;=4.53^.11^26.61^128^68.37^^^11^.49^19^50^31^6^.44^.092^.986^^53^0^.112
	;;^UTILITY(U,$J,112,1319,2)
	;;=.061^1.071^.35^.024^6^0^.039^.005^0^.016^.012^.044^5^.38^^^4.3
	;;^UTILITY(U,$J,112,1319,3)
	;;=.058^.122^.175^.309^.093^.07^.125^.218^.12^.194^.168^.092^.135^.196^1.603^.144^.483^.215
	;;^UTILITY(U,$J,112,1319,4)
	;;=^^0^.013^0^.002^.012
	;;^UTILITY(U,$J,112,1319,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1320,0)
	;;=MACARONI, UNENR, FIRM STAGE, 8-10 MIN^20-400^cups^130^294^N
	;;^UTILITY(U,$J,112,1320,1)
	;;=4.77^.67^28.34^141^65.99^^^7^.5^18^54^31^1^.53^.098^.285^^^0^.02
	;;^UTILITY(U,$J,112,1320,2)
	;;=.02^.4^.112^.035^7^0^.249^.024^0^.095^.079^.273^^.24^^^1.3
	;;^UTILITY(U,$J,112,1320,3)
	;;=.061^.126^.184^.326^.091^.074^.134^.231^.125^.203^.176^.097^.14^.195^1.718^.151^.524^.225
	;;^UTILITY(U,$J,112,1320,4)
	;;=^^.001^.083^^.011^.079
	;;^UTILITY(U,$J,112,1320,20)
	;;=USDA Std. Reference, Release 10
	;;^UTILITY(U,$J,112,1321,0)
	;;=MACARONI, WHOLE-WHEAT, COOKED^20-108^cups^142^304^N
	;;^UTILITY(U,$J,112,1321,1)
	;;=5.33^.54^26.54^124^67.15^^^15^1.06^30^89^44^3^.81^.167^1.379^^0^0^.108
	;;^UTILITY(U,$J,112,1321,2)
	;;=.045^.707^.419^.079^5^0^.203^.01^0^.099^.075^.213^0^.44^^^3
	;;^UTILITY(U,$J,112,1321,3)
	;;=.069^.143^.207^.364^.118^.086^.111^.265^.139^.231^.188^.125^.166^.24^1.847^.193^.568^.26
	;;^UTILITY(U,$J,112,1321,4)
	;;=^^.001^.092^.002^.005^.073
	;;^UTILITY(U,$J,112,1321,20)
	;;=USDA Std. Reference, Release 10;HCF Nutrition Research Foundation, Inc, 1990
	;;^UTILITY(U,$J,112,1322,0)
	;;=MACARONI AND CHEESE, BAKED FR HOME RECIPE^1304-2^cups^200^100^N
	;;^UTILITY(U,$J,112,1322,1)
	;;=8.4^11.1^20.1^215^58.2^^^181^.9^^161^120^543^^^^^430^.3^.1
	;;^UTILITY(U,$J,112,1322,2)
	;;=.2^.9^^^^^1.47^^21^4.45^^^^2.2
	;;^UTILITY(U,$J,112,1322,4)
	;;=^^^^^^4.41
	;;^UTILITY(U,$J,112,1322,20)
	;;=USDA  Std. Reference, Release 8