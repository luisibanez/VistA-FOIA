FHINI0BL	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,7585,0)
	;;=ENTREES,POT PIE,CHICKEN,SWANSON DELUXE^BC-00858^9-oz.^255
	;;^UTILITY(U,$J,112,7585,1)
	;;=5.961^8.235^15.843^161.569^^^^19.608^1.059^^^98.431^401.176^^^^^750.588^1.569^.11
	;;^UTILITY(U,$J,112,7585,2)
	;;=.118^2.196
	;;^UTILITY(U,$J,112,7585,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7586,0)
	;;=ENTREES,POT PIE,CHICKEN,SWANSON HUNGRY-MAN^BC-00859^14-oz.^397
	;;^UTILITY(U,$J,112,7586,1)
	;;=5.919^8.791^14.408^160.453^^^^16.121^1.033^^^83.879^366.499^^^^^960.202^.252^.113
	;;^UTILITY(U,$J,112,7586,2)
	;;=.106^1.889
	;;^UTILITY(U,$J,112,7586,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7587,0)
	;;=ENTREES,POT PIE,TUNA,BANQUET^BC-00860^7-oz.^198
	;;^UTILITY(U,$J,112,7587,1)
	;;=8.586^16.667^22.222^272.727^^^^73.737^1.01^^115.152^141.414^409.091^^^^^292.929^1.01^.177
	;;^UTILITY(U,$J,112,7587,2)
	;;=.197^3.182^^^^^^^15.152
	;;^UTILITY(U,$J,112,7587,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7588,0)
	;;=ENTREES,POT PIE,TURKEY,BANQUET^BC-00861^7-oz.^198
	;;^UTILITY(U,$J,112,7588,1)
	;;=8.081^15.657^19.697^257.576^^^^20.202^1.01^^82.323^116.162^434.343^^^^^144.949^0^.157
	;;^UTILITY(U,$J,112,7588,2)
	;;=.141^2.828^^^^^^^20.202
	;;^UTILITY(U,$J,112,7588,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7589,0)
	;;=ENTREES,POT PIE,TURKEY,MORTON^BC-00862^7-oz.^198
	;;^UTILITY(U,$J,112,7589,1)
	;;=7.071^14.141^13.636^212.121^^^^17.172^1.01^^72.222^116.162^373.737^^^^^110.606^.505^.116
	;;^UTILITY(U,$J,112,7589,2)
	;;=.126^2.222^^^^^^^20.202
	;;^UTILITY(U,$J,112,7589,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7590,0)
	;;=ENTREES,POT PIE,TURKEY,SINGLE CRUST,BANQUET SUPREME^BC-00863^7-oz.^198
	;;^UTILITY(U,$J,112,7590,1)
	;;=7.576^13.636^15.152^217.172^^^^17.677^1.01^^76.768^126.263^373.737^^^^^371.717^1.01^.126
	;;^UTILITY(U,$J,112,7590,2)
	;;=.121^2.626^^^^^^^17.677
	;;^UTILITY(U,$J,112,7590,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7591,0)
	;;=ENTREES,POT PIE,TURKEY,SWANSON^BC-00864^7-oz.^198
	;;^UTILITY(U,$J,112,7591,1)
	;;=5.505^10.808^18.232^192.424^^^^14.646^1.212^^^69.697^363.131^^^^^993.434^1.01^.146
	;;^UTILITY(U,$J,112,7591,2)
	;;=.121^1.566
	;;^UTILITY(U,$J,112,7591,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7592,0)
	;;=ENTREES,POT PIE,TURKEY,SWANSON CHUNKY^BC-00865^10-oz.^284
	;;^UTILITY(U,$J,112,7592,1)
	;;=6.866^11.444^19.225^207.394^^^^13.732^1.127^^^65.493^355.986^^^^^1540.141^.352^.144
	;;^UTILITY(U,$J,112,7592,2)
	;;=.13^1.901
	;;^UTILITY(U,$J,112,7592,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7593,0)
	;;=ENTREES,POT PIE,TURKEY,SWANSON HUNGRY-MAN^BC-00866^14-oz.^397
	;;^UTILITY(U,$J,112,7593,1)
	;;=6.02^9.118^14.358^163.476^^^^14.358^1.083^^^74.307^366.247^^^^^912.091^1.008^.108
	;;^UTILITY(U,$J,112,7593,2)
	;;=.103^1.637
	;;^UTILITY(U,$J,112,7593,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7594,0)
	;;=ENTREES,RAVIOLI,CHEESE,LE MENU LIGHTSTYLE^BC-00867^8.75-oz.^248
	;;^UTILITY(U,$J,112,7594,1)
	;;=5.444^2.46^15.161^104.435^^^^53.629^1.008^^^203.629^257.661^^^^^222.984^18.145^.133
	;;^UTILITY(U,$J,112,7594,2)
	;;=.161^1.331^^^^^^^4.839^1.048^^.403
	;;^UTILITY(U,$J,112,7594,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7595,0)
	;;=ENTREES,RAVIOLI,CHEESE W/TOMATO SCE,SWANSON^BC-00868^8.75-oz.^248
	;;^UTILITY(U,$J,112,7595,1)
	;;=5.161^3.024^15.605^110.081^^^^88.306^.968^^^142.742^410.081^^^^^402.016^3.629^.093
	;;^UTILITY(U,$J,112,7595,2)
	;;=.097^1.371
	;;^UTILITY(U,$J,112,7595,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7596,0)
	;;=ENTREES,RICE & BROCCOLI W/CHEESE SCE,PILSBURY^BC-00869^4.5-oz.^156
	;;^UTILITY(U,$J,112,7596,1)
	;;=2.885^3.974^16.09^114.103^75.513^^^55.128^.5^^83.974^67.308^446.795^^^^^873.077^5.128^.141
	;;^UTILITY(U,$J,112,7596,2)
	;;=.019^1.41^^^^^^^3.205^1.282^^.641
	;;^UTILITY(U,$J,112,7596,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7597,0)
	;;=ENTREES,RICE ORIGINALS^BC-00870^1/2-cup^113
	;;^UTILITY(U,$J,112,7597,1)
	;;=3.097^3.805^15.929^109.735^75.752^^^43.363^1.301^^66.372^63.717^446.903^^^^^872.566^5.31^.204
	;;^UTILITY(U,$J,112,7597,2)
	;;=.044^1.327^^^^^^^^^^^^^^^.177
	;;^UTILITY(U,$J,112,7597,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,7598,0)
	;;=ENTREES,RICE,CONFETTI,STOUFFERS^BC-00871^3-oz.^85
