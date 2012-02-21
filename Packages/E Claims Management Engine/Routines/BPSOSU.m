BPSOSU ;BHAM ISC/FCS/DRS/FLS - Common utilities ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
 ; some common utilities called a lot.
 ;
 ; SETSTAT - set status field for ^BPST(ABSBRXI,
 ; Input: 
 ;   ABSBRXI - This needs to be newed and defined by the calling routine
 ;   STATUS  - Value to set into BPS Transaction
SETSTAT(STATUS) ;EP - from many places
 ; set ^BPST( status for ABSBRXI
 ;
 ; Timing problem:  if response got processed before the SETCSTAT
 ; was sent for "waiting to process response",  don't reset it now.
 I STATUS=80,$P(^BPST(ABSBRXI,0),U,2)>80 Q
 ;
 ; Perhaps other such detection would be a good idea here.
 ;
 ; LOCK the file - something is very wrong if you can't get the lock
 F  L +^BPST(ABSBRXI):300 Q:$T  Q:'$$IMPOSS^BPSOSUE("L","RTI","LOCK +^BPST",,"SETSTAT",$T(+0))
 N DIE,DA,DR,X S DIE=9002313.59,DA=ABSBRXI,DR="1///"_STATUS_";7///NOW"
 I STATUS=0 S DR=DR_";15///NOW" ; START TIME, too.
 D ^DIE
 N X S X="" F  S X=$O(^BPST("AD",X)) Q:X=""  D
 .I X'=STATUS K ^BPST("AD",X,ABSBRXI)
 I STATUS=99 D STATUS99
 L -^BPST(ABSBRXI)
 Q
 ;
 ; STATUS99 - Special activity when a claim reaches status 99
 ; Input:
 ;   ABSBRXI - This is called by SETSTAT (above) and this variable is set
STATUS99 ;
 ; Transaction log in .57  (but not if it's a canceled transaction!)
 N RX,RF,CLMSTAT
 S RX=$P(ABSBRXI,"."),RF=+$E($P(ABSBRXI,".",2),1,4)
 ;
 ; Get status of the claim
 S CLMSTAT=$$CATEG^BPSOSUC(ABSBRXI)
 ;
 ; Canceled - shouldn't we restore old .57 into this .59?
 I $P($G(^BPST(ABSBRXI,3)),U,2) D
 . D LOG^BPSOSL($T(+0)_" - Cancellation succeeded.")
 E  D
 . N BPS57 S BPS57=$$NEW57(ABSBRXI)
 . D TRANSACT^BPSOSBC(BPS57) ; hand it to posting
 . D RECEIPT(BPS57) ; automatic receipt printing
 ;
 ; If the Reverse Then Resubmit field is set to Resubmitting (2),
 ;   then set to 'Done' (0)
 I $P(^BPST(ABSBRXI,1),U,12)=2 S $P(^BPST(ABSBRXI,1),U,12)=0
 ;
 ; If resubmit flag is set to 'Reverse, then Resubmit' (1), see about
 ;   doing a resubmit
 I $P(^BPST(ABSBRXI,1),U,12)=1 D
 . ;
 . ; Slot stuff
 . N OLDSLOT,SLOT,SKIP,SITE
 . S OLDSLOT=$$GETSLOT^BPSOSL
 . S SLOT=ABSBRXI D SETSLOT^BPSOSL(SLOT)
 . D LOG^BPSOSL($T(+0)_" "_SLOT_" Reverse then Resubmit attempt:"_$J)
 . ;
 . ; Initialize the skip flag
 . S SKIP=0
 . ;
 . ; Get Site info and make sure it exists
 . I 'RF S SITE=$$GET1^DIQ(52,RX,20,"I")
 . I RF S SITE=$$GET1^DIQ(52.1,RF_","_RX,8,"I")
 . I '$G(SITE) D
 .. D LOG^BPSOSL($T(+0)_" Cannot - No site information")
 .. S SKIP=1
 . ;
 . ; Check the ECME switch for the site
 . I $G(SITE),'$$ECMEON^BPSUTIL(SITE) D
 . . D LOG^BPSOSL($T(+0)_" Cannot - Site not linked to a BPS Pharmacy")
 . . S SKIP=1
 . ;
 . ; If reversal was not successful, log message and quit
 . I CLMSTAT'="E REVERSAL ACCEPTED" D
 . . D LOG^BPSOSL($T(+0)_" Cannot - Reversal failed - "_X)
 . . S SKIP=1
 . ;
 . ; Check if the MOREDATA array is defined
 . I '$D(^XTMP("BPSOSRB","MOREDATA",ABSBRXI,"RESUB")) D
 . . D LOG^BPSOSL($T(+0)_" Cannot - MOREDATA array undefined")
 . . S SKIP=1
 . ;
 . ; If skip flag is set, clear the resubmit flag and do nothing else
 . ; Else resubmit the claim and set resubmit flag
 . ;  to 'Resubmitting'
 . I SKIP S $P(^BPST(ABSBRXI,1),U,12)=0
 . E  D
 . . K MOREDATA
 . . M MOREDATA=^XTMP("BPSOSRB","MOREDATA",ABSBRXI,"RESUB")
 . . K ^XTMP("BPSOSRB","MOREDATA",ABSBRXI,"RESUB")
 . . D LOG^BPSOSL($T(+0)_" Now resubmit "_$J)
 . . D CLAIM^BPSOSRB(RX,RF,ABSBRXI,.MOREDATA)
 . D RELSLOT^BPSOSL
 . I OLDSLOT D SETSLOT^BPSOSL(OLDSLOT)
 ;
 ; Check Auto-Reversed claims to see if they should be resubmitted, which
 ;  should be done if the reversal was accepted and the RX/Fill was released
 ;  while waiting for the payer response
 ; Need to check for 'normal' auto-reversals
 I CLMSTAT="E REVERSAL ACCEPTED",$$RXRLDT^PSOBPSUT(RX,RF) D
 . N CLAIMIEN,AUTOREV
 . S CLAIMIEN=$$GET1^DIQ(9002313.59,ABSBRXI,3,"I")
 . I '$G(CLAIMIEN) Q
 . S AUTOREV=$$GET1^DIQ(9002313.02,CLAIMIEN,.07,"I")
 . I $G(AUTOREV)'=1 Q
 . N BDOS,BRES,BMES,BMSG
 . D LOG^BPSOSL($T(+0)_" Submit released auto-reversal")
 . S BDOS=$$DOSDATE^BPSSCRRS(RX,RF)
 . S BRES=$$EN^BPSNCPDP(RX,RF,BDOS,"ARES")
 . D LOG^BPSOSL($T(+0)_" Response from BPSNCPDP: "_BRES)
 . S BMSG=$P(BRES,U,2),BRES=+BRES
 . S BMES="Submitted to ECME: Resubmit for released autoreversal"
 . S BMES=BMES_$S(BRES=1:"-NO SUBMISSION VIA ECME",BRES=4:"-NOT PROCESSED",BRES=5:"-SOFTWARE ERROR",1:"")
 . D ECMEACT^PSOBPSU1(RX,RF,BMES,.5)
 . I BRES=2 D ECMEACT^PSOBPSU1(RX,RF,"Not ECME Billable: "_BMSG,.5)
 ;
 ; And at random times, winnow the log files 
 I $R(10000)=0 D
 . N ZTRTN,ZTIO,ZTSAVE,ZTDTH
 . S ZTRTN="SILENT^BPSOSK(1)"
 . S ZTIO="",ZTDTH=$$TADD^BPSOSUD(DT,1)_".0222" ; tomorrow early a.m.
 . D ^%ZTLOAD
 Q
 ;
NEW57(RXI) ;EP - copy this ^BPST(RXI) into ^BPSTL(N)
 F  L +^BPSTL:300 Q:$T  Q:'$$IMPOSS^BPSOSUE("L","RTI","LOCK ^BPSTL",,"NEW57",$T(+0))
NEW57A N N S N=$P(^BPSTL(0),U,3)+1
 N C S C=$P(^BPSTL(0),U,4)+1
 S $P(^BPSTL(0),U,3,4)=N_U_C
 I $D(^BPSTL(N)) G NEW57A ; should never happen
 L -^BPSTL
 M ^BPSTL(N)=^BPST(RXI)
 ;
 ; Indexing - First, fileman indexing
 D
 . N DIK,DA S DIK="^BPSTL(",DA=N N N D IX1^DIK
 ;
 ; The NON-FILEMAN index on RXI,RXR
 D
 . N INDEX,A,B,TYPE S TYPE=$E(RXI,$L(RXI))
 . I TYPE=1!(TYPE=2) D
 . . S A=$P(^BPSTL(N,1),U,11)
 . . S B=$P(^BPSTL(N,1),U)
 . . S INDEX=$S(TYPE=1:"RXIRXR",TYPE=2:"POSTAGE")
 . E  I TYPE=3 D
 . . S A=$P(^BPSTL(N,0),U,7)
 . . S B=$P(^BPSTL(N,1),U,3) ; VCPT
 . . S INDEX="OTHERS"
 . E  D IMPOSS^BPSOSUE("DB,P","TI","Bad TYPE="_TYPE,"in RXI="_RXI,"NEW57",$T(+0))
 . S ^BPSTL("NON-FILEMAN",INDEX,A,B,N)=""
 Q N
 ; $$PREV57(point to 57) returns pointer to previous transaction
 ; for the same RXI,RXR - returns "" if no such
PREV57(N57) ; EP -
 N RXI,RXR S RXI=$P(^BPSTL(N57,1),U,11)
 S RXR=$P(^BPSTL(N57,1),U)
 I RXI=""!(RXR="") Q ""
 Q $O(^BPSTL("NON-FILEMAN","RXIRXR",RXI,RXR,N57),-1)
 ;
 ; SETCSTAT - set the status for every prescription associated with
 ; this claim
 ;
SETCSTAT(CLAIM,STATUS)       ;EP - BPSOSAM
 N ABSBRXI
 I $$ISREVERS(CLAIM) D  Q  ; different for reversals
 .S ABSBRXI=$$RXI4REV(CLAIM) I ABSBRXI D SETSTAT(STATUS)
 S ABSBRXI=""
 F  S ABSBRXI=$O(^BPST("AE",CLAIM,ABSBRXI)) Q:ABSBRXI=""  D
 .D SETSTAT(STATUS)
 Q
ISREVERS(CLAIM) ;EP - BPSOSP2
 ; is this a reversal claim?  $$ returns 1 or 0
 Q $P($G(^BPSC(CLAIM,100)),"^",3)=11!($P($G(^BPSC(CLAIM,100)),"^",3)="B2")  ;LJE;9/19/03
RXI4REV(REVCLAIM)  ; given IEN of reversal claim $$this to get RXI
 ; The reversal claim must be associated with exactly one RXI.
 N RET,MBN ; MBN=Must Be Null
 S RET=$O(^BPST("AER",REVCLAIM,0)),MBN=$O(^(RET))
 I 'RET D IMPOSS^BPSOSUE("DB,P","TI","REVCLAIM="_REVCLAIM_" and ""AER"" index",,"RXI4REV",$T(+0)) ; may not apply to certification testing!! SEE ABOVE.
 I MBN'="" D IMPOSS^BPSOSUE("DB,P","TI","REVCLAIM="_REVCLAIM_" points back to multiple .59 entries",,"RXI4REV",$T(+0))
 Q RET
 ;
 ; SETCOMMS - for each prescription associated with this claim,
 ; point back to the log of the comms session wherein xmit/rcv happened
 ;
SETCOMMS(CLAIM,POINTER) ;EP - BPSOSAM
 N ABSBRXI S ABSBRXI=""
 F  S ABSBRXI=$O(^BPST("AE",CLAIM,ABSBRXI)) Q:ABSBRXI=""  D
 .S $P(^BPST(ABSBRXI,0),"^",12)=POINTER
 Q
 ;
 ; SETRESU - Set Result  into ^BPST(ABSBRXI,2)
 ;
 ;    NOTE !!! NOTE !!! NOTE !!!  ABSBRXI must be set (not RXI) !!!
 ;
SETRESU(RESULT,TEXT)    ;EP - from many places
 S $P(^BPST(ABSBRXI,2),U)=RESULT
 I $G(TEXT)]"" D
 . N X,Y S X=^BPST(ABSBRXI,2)
 . S Y=$P(X,U),X=$P(X,U,2,$L(X,U))
 . I X="" S X=$E(TEXT,1,255-$L(Y)-1)
 . E  D
 .. I $E(X,1,12)'="[Previously:" D
 ... D PREVISLY^BPSOSIZ(ABSBRXI)
 ... S X=$P(^BPST(ABSBRXI,2),U,2)
 .. S X=$E(TEXT_X,1,255-$L(Y)-1)
 . S ^BPST(ABSBRXI,2)=Y_U_X
 I RESULT=0 Q  ; look at the associated RESPONSE in ^BPSR(
 ;
 ; For other RESULT codes, put a textual explanation in 
 Q
 ;
 ; SETCRESU - set the result code for every prescription assoc'd with
 ; this claim
SETCRESU(CLAIM,RESULT,TEXT) ;
 N ABSBRXI S ABSBRXI=""
 F  S ABSBRXI=$O(^BPST("AE",CLAIM,ABSBRXI)) Q:ABSBRXI=""  D
 .D SETRESU(RESULT,$G(TEXT))
 Q
 ;
 ; STATI(X) gives a text version of what status code X means.
 ;
STATI(X) ;EP - from many places ; perhaps should be a Fileman file
 I X=99 Q "Done"
 I X=50 Q "Waiting for transmit"
 I X=30 Q "Waiting for packet build"
 I X=0 Q "Waiting to start"
 I X=10 Q "Gathering claim info"
 I X=40 Q "Packet being built"
 I X=60 Q "Transmitting"
 I X=61 Q "Transmitting"
 I X=70 Q "Receiving response"
 I X=80 Q "Waiting to process response"
 I X=90 Q "Processing response"
 I X=51 Q "Wait for retry (comms error)"
 I X=31 Q "Wait for retry (insurer asleep)"
 I X=19 Q "Special grouping"
 I X=98 Q "Resubmitting" ;Used only by STATUS^BPSOSRX (Not stored in BPS Transactions)
 ; When you add new X=, account for these in FETSTAT^BPSOS2
 Q "?"_X_"?"
 ;
 ; RESULTI(X) gives a text version of what result code X means
 ;
RESULTI(X)         ;
 I X=0 Q "See detail in BPS RESPONSES file" ; say more
 Q "Result code "_X ; a catch-all default
 ;
RECEIPT(IEN57) ; This is where the receipt would go - taskman it to print in
 ; background, somewhere, somehow
 Q:'$$DORECEI
 Q
DORECEI() ; Should we print a receipt? 
 ; Site-specific conditions needed.
 ; example:  electronic claims only;
 ;   only claims with co-pay;
 ;   etc.
 Q 0
