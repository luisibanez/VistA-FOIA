FHINI0CH	; ; 11-OCT-1995
	;;5.0;Dietetics;;Oct 11, 1995
	Q:'DIFQR(112)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,112,8014,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8015,0)
	;;=SAUCE,SWEET & SOUR DIPPING SCE,BURGER KING^BC-01288^serving^28
	;;^UTILITY(U,$J,112,8015,1)
	;;=0^0^39.286^160.714^^^^^^^^^185.714
	;;^UTILITY(U,$J,112,8015,2)
	;;=^^^^^^^^0^0^0^0
	;;^UTILITY(U,$J,112,8015,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8016,0)
	;;=SAUCE,TARTAR DIPPING SCE,BURGER KING^BC-01289^serving^28
	;;^UTILITY(U,$J,112,8016,1)
	;;=0^64.286^10.714^621.429^^^^^^^^^1078.571
	;;^UTILITY(U,$J,112,8016,2)
	;;=^^^^^^^^57.143^10.714^14.286^39.286
	;;^UTILITY(U,$J,112,8016,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8017,0)
	;;=SAUCE,TARTAR SCE,BURGER KING^BC-01290^serving^28
	;;^UTILITY(U,$J,112,8017,1)
	;;=0^50^7.143^478.571^^^^^^^^^721.429
	;;^UTILITY(U,$J,112,8017,2)
	;;=^^^^^^^^71.429^7.143^7.143^35.714
	;;^UTILITY(U,$J,112,8017,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8018,0)
	;;=SCRAMBLED EGG PLATTER,BURGER KING^BC-01291^platter^211
	;;^UTILITY(U,$J,112,8018,1)
	;;=8.057^16.114^20.853^260.19^^^^47.867^1.275^15.166^128.436^230.806^423.223^^.028^^^177.725^1.422^.147
	;;^UTILITY(U,$J,112,8018,2)
	;;=.166^1.374^^^^^^^172.986^4.265^8.531^2.844
	;;^UTILITY(U,$J,112,8018,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8019,0)
	;;=SCRAMBLED EGG PLATTER W/BACON,BURGER KING^BC-01292^platter^221
	;;^UTILITY(U,$J,112,8019,1)
	;;=9.502^17.647^19.91^276.018^^^^46.606^1.276^15.837^135.294^240.724^471.946^.837^.027^^^169.683^1.357^.176
	;;^UTILITY(U,$J,112,8019,2)
	;;=.172^1.629^^^^^^^168.778^4.977^9.05^3.167
	;;^UTILITY(U,$J,112,8019,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8020,0)
	;;=SCRAMBLED EGG PLATTER W/SAUSAGE,BURGER KING^BC-01293^platter^260
	;;^UTILITY(U,$J,112,8020,1)
	;;=10^20.385^18.077^295.385^^^^43.077^1.408^12.692^128.846^239.615^488.846^1.035^.023^^^144.231^1.154^.162
	;;^UTILITY(U,$J,112,8020,2)
	;;=.154^2.115^^^^^^^158.462^5.769^11.538^3.077
	;;^UTILITY(U,$J,112,8020,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8021,0)
	;;=SHAKE,CHOCOLATE,BURGER KING^BC-01294^med.^284
	;;^UTILITY(U,$J,112,8021,1)
	;;=3.169^3.521^17.254^114.789^^^^91.549^.567^16.197^92.254^199.648^69.718^.335^.032^^^^^.046
	;;^UTILITY(U,$J,112,8021,2)
	;;=.194^^^^^^^^10.915^2.113^1.408^0
	;;^UTILITY(U,$J,112,8021,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8022,0)
	;;=SHAKE,CHOCOLATE W/ADDED SYRUP,BURGER KING^BC-01295^med.^312
	;;^UTILITY(U,$J,112,8022,1)
	;;=3.205^3.526^21.795^131.09^^^^79.487^.497^17.949^84.615^189.103^79.487^.337^.051^^^^^.038
	;;^UTILITY(U,$J,112,8022,2)
	;;=.163^^^^^^^^10.577^1.923^.962^0
	;;^UTILITY(U,$J,112,8022,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8023,0)
	;;=SHAKE,STRAWBERRY W/ADDED SYRUP,BURGER KING^BC-01296^med.^312
	;;^UTILITY(U,$J,112,8023,1)
	;;=2.885^3.205^21.154^126.282^^^^^^^^^73.718
	;;^UTILITY(U,$J,112,8023,2)
	;;=^^^^^^^^10.577^1.923^.962^0
	;;^UTILITY(U,$J,112,8023,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8024,0)
	;;=SHAKE,VANILLA,BURGER KING^BC-01297^med.^284
	;;^UTILITY(U,$J,112,8024,1)
	;;=3.169^3.521^17.958^117.606^^^^103.873^^11.268^100^178.873^75^^^^^^^.039
	;;^UTILITY(U,$J,112,8024,2)
	;;=.201^^^^^^^^11.62^2.113^1.056^0
	;;^UTILITY(U,$J,112,8024,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8025,0)
	;;=WHOPPER SANDWICH,BURGER KING^BC-01298^sandwich^270
	;;^UTILITY(U,$J,112,8025,1)
	;;=10^13.333^16.667^227.407^^^^29.63^1.807^15.926^87.778^202.593^320.37^1.681^.052^^^228.889^5.185^.122
	;;^UTILITY(U,$J,112,8025,2)
	;;=.152^2.519^^^^^^^33.333^4.444^4.074^4.815
	;;^UTILITY(U,$J,112,8025,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8026,0)
	;;=WHOPPER SANDWICH,DOUBLE,BURGER KING^BC-01299^sandwich^351
	;;^UTILITY(U,$J,112,8026,1)
	;;=13.105^15.1^12.821^240.456^^^^25.926^2.083^17.094^110.256^^265.812^2.433^.051^^^175.783^3.989^.097
	;;^UTILITY(U,$J,112,8026,2)
	;;=.16^2.963^^^^^^^48.148^5.413^5.413^3.704
	;;^UTILITY(U,$J,112,8026,20)
	;;=Bowes & Church's Food Values, Sixteenth Edition.
	;;^UTILITY(U,$J,112,8027,0)
	;;=WHOPPER SANDWICH,DOUBLE W/CHEESE,BURGER KING^BC-01300^sandwich^375
	;;^UTILITY(U,$J,112,8027,1)
	;;=16.267^16.267^12.533^249.333^^^^59.2^1.957^17.333^136^^332^2.419^.048^^^266.933^3.733^.093
	;;^UTILITY(U,$J,112,8027,2)
	;;=.168^2.773^^^^^^^51.733^6.4^5.867^3.733