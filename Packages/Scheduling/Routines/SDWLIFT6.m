SDWLIFT6 ;IOFO BAY PINES/OG - INTER-FACILITY TRANSFER: DISPLAY ACCEPT DETAILS  ; Compiled March 23, 2005 12:38:06
 ;;5.3;Scheduling;**415**;AUG 13 1993
 ;
 ;
 ;******************************************************************
 ;                             CHANGE LOG
 ;                                               
 ;   DATE                        PATCH                   DESCRIPTION
 ;   ----                        -----                   -----------
 ;
 ;
 Q
EN ; INITIALIZE VARIABLES FOR DISPLAY
 N SDWLI,SDWLOK
 K SDWLLIST
 D GETLIST^SDWLIFT5
 S SDWLIFTN=$$GETTN^SDWLIFT(.SDWLLIST)
 I 'SDWLIFTN S VALMBCK="R" Q
 ; Refresh list and loop to ensure that the selection hasn't been removed while the choice was being made.
 K SDWLLIST D GETLIST^SDWLIFT5
 S (SDWLOK,SDWLI)=0 F  S SDWLI=$O(SDWLLIST(SDWLI)) Q:'SDWLI  I SDWLLIST(SDWLI,1)=SDWLIFTN S SDWLOK=1 Q
 D:SDWLOK EN^VALM("SDWL TRANSFER ACC VIEW")
 D INIT^SDWLIFT5
 S VALMBCK="R"
 Q
INIT ; Default initialization options.
 N SDWLINFO
 D GETINFO(.SDWLINFO)
 F VALMCNT=1:1:SDWLINFO(0) D SET^VALM10(VALMCNT,SDWLINFO(VALMCNT,0))
 Q
GETINFO(SDWLOUT) ; The Coversheet function calls here too.
 N DIC,D,X,WP,TMP,SDWLADD,SDWLFID,SDWLI
 D GETS^DIQ(409.36,SDWLIFTN,"*",,"TMP")
 S SDWLOUT(0)=1
 S SDWLOUT(SDWLOUT(0),0)="Transmg. Inst: "_$E($$GET1^DIQ(4,$$FIND1^DIC(4,"","X",TMP(409.36,SDWLIFTN_",",.1),"D"),.01)_SDWLSPS,1,28)_" "
 S SDWLOUT(SDWLOUT(0),0)=SDWLOUT(SDWLOUT(0),0)_"Transmn. Date: "_TMP(409.36,SDWLIFTN_",",.2)
 S SDWLOUT(0)=SDWLOUT(0)+1
 S SDWLOUT(SDWLOUT(0),0)="Name: "_$E(TMP(409.36,SDWLIFTN_",",.01)_SDWLSPS,1,27)_" "
 S SDWLOUT(SDWLOUT(0),0)=SDWLOUT(SDWLOUT(0),0)_"Sex: "_$E(TMP(409.36,SDWLIFTN_",",.02)_SDWLSPS,1,7)
 S SDWLOUT(SDWLOUT(0),0)=SDWLOUT(SDWLOUT(0),0)_"DoB: "_$E(TMP(409.36,SDWLIFTN_",",.03)_SDWLSPS,1,13)
 S SDWLOUT(SDWLOUT(0),0)=SDWLOUT(SDWLOUT(0),0)_"SSN: "_TMP(409.36,SDWLIFTN_",",.09)
 ;
 S SDWLOUT(0)=SDWLOUT(0)+1,SDWLADD=SDWLOUT(0)
 S SDWLOUT(SDWLOUT(0),0)="Address: "_TMP(409.36,SDWLIFTN_",",.111)
 F SDWLFID=.112:.001:.114,.117 I TMP(409.36,SDWLIFTN_",",SDWLFID)'=""  S SDWLOUT(0)=SDWLOUT(0)+1,SDWLOUT(SDWLOUT(0),0)=$E(SDWLSPS,1,9)_TMP(409.36,SDWLIFTN_",",SDWLFID)
 I TMP(409.36,SDWLIFTN_",",.115)_TMP(409.36,SDWLIFTN_",",.116)'="" D
 .S SDWLOUT(0)=SDWLOUT(0)+1
 .S SDWLOUT(SDWLOUT(0),0)=$E(SDWLSPS,1,9)
 .I TMP(409.36,SDWLIFTN_",",.115)'="" S SDWLOUT(SDWLOUT(0),0)=SDWLOUT(SDWLOUT(0),0)_TMP(409.36,SDWLIFTN_",",.115)
 .S SDWLOUT(SDWLOUT(0),0)=SDWLOUT(SDWLOUT(0),0)_" "_TMP(409.36,SDWLIFTN_",",.116)
 .Q
 I TMP(409.36,SDWLIFTN_",",.131)'="" S SDWLOUT(0)=SDWLOUT(0)+1,SDWLOUT(SDWLOUT(0),0)="Phone no "_TMP(409.36,SDWLIFTN_",",.131)
 D:TMP(409.36,SDWLIFTN_",",.1217)'=""  ; Temporary address details. Displayed to the right of the address in up to 3 lines starting column 62
 .S SDWLOUT(SDWLADD,0)=$E(SDWLOUT(SDWLADD,0)_SDWLSPS,1,61)_"Temporary address"  ; There should be at least three lines if it is also indicated as temporary.
 .S SDWLOUT(SDWLADD+1,0)=$E(SDWLOUT(SDWLADD+1,0)_SDWLSPS,1,61)_"From: "_TMP(409.36,SDWLIFTN_",",.1217)
 .S SDWLOUT(SDWLADD+2,0)=$E(SDWLOUT(SDWLADD+2,0)_SDWLSPS,1,61)_"To  : "_TMP(409.36,SDWLIFTN_",",.1218)
 .Q
 S SDWLOUT(0)=SDWLOUT(0)+1,SDWLOUT(SDWLOUT(0),0)="Service connected: "_TMP(409.36,SDWLIFTN_",",.301)
 I TMP(409.36,SDWLIFTN_",",.301)="YES" S SDWLOUT(SDWLOUT(0),0)=SDWLOUT(SDWLOUT(0),0)_"  Percentage: "_TMP(409.36,SDWLIFTN_",",.302)
 S SDWLOUT(0)=SDWLOUT(0)+1,SDWLOUT(SDWLOUT(0),0)="Primary Eligibility: "_TMP(409.36,SDWLIFTN_",",.361)
 S SDWLOUT(0)=SDWLOUT(0)+1,SDWLOUT(SDWLOUT(0),0)="Wait List Type: "
 S SDWLOUT(SDWLOUT(0),0)=SDWLOUT(SDWLOUT(0),0)_TMP(409.36,SDWLIFTN_",",4)_" : "_TMP(409.36,SDWLIFTN_",",5)
 S SDWLOUT(0)=SDWLOUT(0)+1,SDWLOUT(SDWLOUT(0),0)="Desired Date of Appt: "
 S SDWLOUT(SDWLOUT(0),0)=SDWLOUT(SDWLOUT(0),0)_TMP(409.36,SDWLIFTN_",",22)
 S SDWLOUT(SDWLOUT(0),0)=SDWLOUT(SDWLOUT(0),0)_"  Integration Control Number: "
 S SDWLOUT(SDWLOUT(0),0)=SDWLOUT(SDWLOUT(0),0)_TMP(409.36,SDWLIFTN_",",991.01)
 S SDWLOUT(0)=SDWLOUT(0)+1,SDWLOUT(SDWLOUT(0),0)="Comments: "
 S X=$$GET1^DIQ(409.36,SDWLIFTN_",",.4,"Z","WP")
 S SDWLI=0 F  S SDWLI=$O(WP(SDWLI)) Q:'SDWLI  S SDWLOUT(0)=SDWLOUT(0)+1,SDWLOUT(SDWLOUT(0),0)=WP(SDWLI,0)
 Q
GETTN(SDWLLIST) ; Get transfer id.
 N DIR,Y
 I 'SDWLLIST(0) S DIR(0)="Y",DIR("A")="No entries. OK",DIR("B")="YES" D ^DIR Q 0
 I SDWLLIST(0)=1 S Y=1  ; If there is only one, don't ask.
 E  S DIR(0)="L^1:"_SDWLLIST(0),DIR("A")="Which entry?" D ^DIR
 Q $G(SDWLLIST(+Y,1),0)
HD ; -- Make header line for list processor
 S (VALMHDR(1),VALMHDR(2))=""
 Q
ACCEPT ; Sign the transaction off as accepted. Remove the temporary file and send a message to transmitting facility
 N DIR
 I $$GET1^DIQ(409.36,SDWLIFTN,.3)'="YES" D  Q
 .S DIR("A")="A coversheet does not appear to have been requested."_$C(13,10)_"This is required before acceptance. Enter RETURN to continue or '^' to exit"
 .S DIR(0)="E"
 .D ^DIR
 .S VALMBCK=$S(Y:"R",1:"Q")
 .Q
 D FULL^VALM1
 S DIR(0)="Y"
 S DIR("A")="Do you confirm that the appropriate action was taken to schedule this patient"_$C(13,10)_"for an appointment or she/he has EWL entry and the cover sheet has been printed"
 S DIR("B")="N"
 D ^DIR
 D:Y
 .N SDWLSTN,SDWLINST,XMY,XMSUB,XMTEXT,XMDUZ,SDWLX,DA,DIK
 .S SDWLSTN=$$GET1^DIQ(409.36,SDWLIFTN,.1)
 .S SDWLINST=$$FIND1^DIC(4,"","X",SDWLSTN,"D")
 .S XMY("S.SDWL-XFER-SERVER@"_$$GET1^DIQ(4,SDWLINST,60))=""
 .S XMSUB="SDWL TRANSFER ACCEPTANCE"
 .S XMTEXT="SDWLX("
 .S XMDUZ="POSTMASTER"
 .S SDWLX(1,0)=".5"_U_"SENDING FACILITY TRANSFER ID"_U_$$GET1^DIQ(409.36,SDWLIFTN,.5)
 .S SDWLX(2,0)="7"_U_"ACCEPTING PERSON"_U_$$GET1^DIQ(200,DUZ,.01)
 .S SDWLX(0)=2
 .D ^XMD
 .S DA=SDWLIFTN,DIK="^SDWL(409.36," D ^DIK
 .Q
 S VALMBCK="Q"
 Q
REJECT ; Sign the transaction off as rejected. Remove the temporary file and send a message to transmitting facility
 N SDWLSTN,SDWLINST,XMSUB,XMY,XMTEXT,XMDUZ,SDWLX
 S SDWLSTN=$$GET1^DIQ(409.36,SDWLIFTN,.1)
 S SDWLINST=$$FIND1^DIC(4,"","X",SDWLSTN,"D")
 S XMY("S.SDWL-XFER-SERVER@"_$$GET1^DIQ(4,SDWLINST,60))=""
 S XMSUB="SDWL TRANSFER REJECTION"
 S XMTEXT="SDWLX("
 S XMDUZ="POSTMASTER"
 S SDWLX(1,0)=".5"_U_"SENDING FACILITY TRANSFER ID"_U_$$GET1^DIQ(409.36,SDWLIFTN,.5)
 S SDWLX(0)=1
 D ^XMD
 S DA=SDWLIFTN,DIK="^SDWL(409.36," D ^DIK
 ;teh/05/20/2005 cleans the SDWLLIST array and reset count.
 K SDWLLIST(SDWLIFTN)
 S SDWLLIST(0)=SDWLLIST(0)-1
 S VALMBCK="Q"
EXIT ; Tidy up
 K SDWLIFTN
 Q
