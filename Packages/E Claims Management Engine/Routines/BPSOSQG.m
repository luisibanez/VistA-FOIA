BPSOSQG ;BHAM ISC/FCS/DRS/FLS - form transmission packets ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
 ; PACKET(), split off from BPSOSQ2
 ;
PACKET() ;EP - BPSOSQ2
 ; packetize one prescription (and possibly more prescriptions
 ; for the same patient, if they're ready now.)
 ; Called from BPSOSQ2,
 ;  which gave us RXILIST(IEN59) array of claims to packetize.
 ;
 N X S X="PACKERR^"_$T(+0),@^%ZOSF("TRAP")
 N CLAIMIEN,DIALOUT,ERROR
 I $P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) S DIALOUT=$$DIALOUT ;lje;6/27;/03 get dialout if not va
 E  S DIALOUT="1VA" I $D(VADIAL) S DIALOUT=VADIAL
 ;
 ; If it's a reversal, we already have an ^BPSC(  It was
 ; created by the call to BPSECA8, way back at the beginning.
 ; So, unlike claims, we need only the NCPDP formatting for it.
 N FIRST59 S FIRST59=$O(RXILIST(0))
 I $G(^BPST(FIRST59,4)) D  G POINTM
 . ; Mimic a few things that are set up in the code we're skipping
 . S CLAIMIEN=$P(^BPST(FIRST59,4),U)
 . S CLAIMIEN(CLAIMIEN)=""
 ; - - - - -  But if it's not a reversal, do all this stuff:  - - - - -
 I $O(RXILIST($O(RXILIST("")))) D
 . D LOG2LIST^BPSOSQ("Packetizing - we have more than one claim:")
 . N I,X,Y S (X,Y)=""
 . F I=1:1 S X=$O(RXILIST(X)) Q:'X  D
 . . S $P(Y,", ",I-1#4+1)=X
 . . I I#4=0 D LOG2LIST^BPSOSQ(Y) S Y=""
 . I Y]"" D LOG2LIST^BPSOSQ(Y)
 ; - - - - -  
 ; Retrieve some important variables from the ECME WORKING file
 ; The ones we retrieve are the same for all prescriptions in RXILIST(*)
 N PATDFN S PATDFN=$P(^BPST(FIRST59,0),U,6)
 N ABSBVISI S ABSBVISI=$P(^BPST(FIRST59,0),U,7)
 ;
 ;  BPSOSCA calls BPSOSCB,BPSOSCC,BPSOSCD to set up BPS(*)
 ;           then  BPSOSCE to create claims in 9002313.02
 ;
LOCK ;
 ;L +^BPSC:300 ; may be multiple copies of this running!!!
 ;I '$T D  G LOCK:$$IMPOSS^BPSOSUE("L","RIT","LOCK ^BPSC claims file",,,$T(+0))
 ;. D LOG2LIST^BPSOSQ($T(+0)_" - unable to lock file 9002313.02 - should never happen!")
 ; input RXILIST(*)
 D EN^BPSOSCA(DIALOUT) ;
 ; output ERROR, CLAIMIEN, CLAIMIEN(*)
 I ERROR D LOG2LIST^BPSOSQ($T(+0)_" - ERROR="_ERROR_" returned from BPSOSCA")
 ; BPSOSCA set up ERROR,CLAIMIEN,CLAIMIEN(*)
 ;L -^BPSC
 I $G(CLAIMIEN)<1 Q $S(ERROR:ERROR,1:300)
 ;
 ; CLAIMIEN=last claim created
 ; CLAIMIEN(CLAIMIEN)=the list of all claims created
 ;
 ; Then, BPSOSQH calls BPSECA1 to build NCPDP claim format records
 ;
POINTM ; Reversals are joining again here
 D KSCRATCH^BPSOSQ2 ; erase ^BPSECX($J)
 D PASCII^BPSOSQH(DIALOUT) ; gives you ^BPSECX($J,"C",CLAIMIEN,...
 ;
 ;  Drop the NCPDP-formatted records into the list used by
 ;  the sender-receiver.  Too coarse to lock the whole list - 
 ;  you'll be blocked by a sender-receiver who has one claim locked.
 ; (Even though we fixed that recently so that a sender locks the
 ;  claim for only the minimal amount of time.)
 ;
 ;  Drop each claim in there individually.
 ;  And as soon as the very first one hits, rev up a sender-receiver.
 ; 
 N FIRST S FIRST=1
 N X S X="" F  S X=$O(^BPSECX($J,"C",X)) Q:X=""  D
 . F  L +^BPSECX("POS",DIALOUT,"C",X):60 Q:$T  Q:'$$IMPOSS^BPSOSUE("L","RIT","LOCK claims list for DIALOUT="_DIALOUT,,"POINTM",$T(+0))
 . M ^BPSECX("POS",DIALOUT,"C",X)=^BPSECX($J,"C",X)
 . L -^BPSECX("POS",DIALOUT,"C",X)
 . N MSG S MSG="Claim ID "_$P(^BPSC(X,0),U)
 . I '$G(VARX) S MSG=MSG_" queued for "_$P(^BPS(9002313.55,DIALOUT,0),U) ;lje;7/9/03
 . E  S MSG=MSG_" queued for VA"  ;lje;7/9/03
 . D LOG2CLM^BPSOSQ(MSG,X)
 . I FIRST D TASK^BPSOSQ2 S FIRST=0
 D RELSLOT^BPSOSL
 Q 0
DIALOUT()          ; RXILIST(*) should be sent to NDC? or what other processor?
 ; Return a pointer to File 9002313.55, the DIAL OUT file.
 N IEN59 S IEN59=$O(RXILIST(0))
 N X S X=$P(^BPST(IEN59,1),U,6) ; INSURER
 S X=$P(^BPSEI(X,100),U,7) ; which DIAL OUT it points to
 ; get the default dial-out, otherwise
 I 'X S X=$P($G(^BPS(9002313.99,1,"DIAL-OUT DEFAULT")),U)
 I 'X S X=$O(^BPS(9002313.55,"B","DEFAULT",0))
 I 'X S X=$O(^BPS(9002313.55,0)) ; they deleted the DEFAULT one??
 Q X
PACKERR ; error trap comes here
 D @^%ZOSF("ERRTN") ; make error log entry, too
 Q "8899^INTERNAL ERROR: "_$$ZE^BPSOS ; this will go in transaction and eventually on display screen for user
