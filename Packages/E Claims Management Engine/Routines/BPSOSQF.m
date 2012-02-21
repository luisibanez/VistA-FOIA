BPSOSQF ;BHAM ISC/FCS/DRS/FLS - Insurer asleep - status 31 ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
 ;
 ; Continuation of BPSOSQ2
 ;
STATUS31 ;EP - BPSOSQ2
 ; Situation:  you have 1 or 2 or maybe 200 claims in status 31,
 ; because we've determined that the insurer is asleep.
 ; change at most one claim per insurer to status 30, to let it
 ; go through and try again.  But if the insurer is awake for sure,
 ; let all of the claims for that insurer go on through.
 N VARX,T,PROBER
 S VARX=0
 I '$P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) S VARX=1
 N STATUS30,IEN59,INSURER S STATUS30=31,IEN59=""
 K ^TMP("BPSOSQF",$J) ; build ^TMP("BPSOSQF",$J,INSURER,IEN59)=""
 Q:'$$LOCK59^BPSOSQ2
 F  S IEN59=$$NEXT59^BPSOSQ2(IEN59) Q:'IEN59  D
 . ; if $$NEXT59() returned us an IEN59, then the waiting time
 . ; has expired - or better yet, the insurer has awakened
 . S T="",PROBER=""
 . I 'VARX D
 . . S INSURER=$P(^BPST(IEN59,1),U,6)
 . . N X S X=$G(^BPSEI(INSURER,101))
 . . S T=$P(X,U),PROBER=$P(X,U,6)
 . E  D
 . . S INSURER=$$PAYERSH(IEN59)
 . . I INSURER="" Q
 . . N X S X=$G(^BPSF(9002313.92,INSURER,1))
 . . S T=$P(X,U,12),PROBER=$P(X,U,11)
 . I INSURER="" Q
 . ; If still in wait, but wait expired, just allow one claim thru.
 . ; But if wait has been canceled - that is, we had a successful
 . ; transmit, meaning the insurer has awakened - then let them all
 . ; go through to status 30.
 . ; if somehow the prober became complete, without clearing 101;6
 . ; (maybe this happens if cancellation takes place?)
 . I PROBER D
 . . N X S X=$P($G(^BPST(PROBER,0)),U,2)
 . . I X=99!(X="") S PROBER=""
 . I T,PROBER,PROBER'=IEN59 Q  ; only prober can go thru during wait
 . I T,'VARX S $P(^BPSEI(INSURER,101),U,6)=IEN59,PROBER=IEN59 ; you're the prober
 . I T,VARX S $P(^BPSF(9002313.92,INSURER,1),U,11)=IEN59,PROBER=IEN59
 . S ^TMP("BPSOSQF",$J,INSURER,IEN59)=""
 D UNLOCK59^BPSOSQ2
 S INSURER="" F  S INSURER=$O(^TMP("BPSOSQF",$J,INSURER)) Q:'INSURER  D
 . S IEN59="" F  S IEN59=$O(^TMP("BPSOSQF",$J,INSURER,IEN59)) Q:'IEN59  D
 . . D SETSTAT^BPSOSQ2(30) ; reset to status 30
 . . D LOG59^BPSOSQ($T(+0)_" - Retrying Asleep Claim.  Prober? "_$S(PROBER=IEN59:"YES",1:"NO"),IEN59)
 . . I 'VARX K ^BPST(IEN59,8) ; clear Listmanager wait info
 Q
PAYERSH(IEN59) ;
 N POS
 S POS=$P($G(^BPST(IEN59,9)),U,1)
 I POS="" Q ""
 Q $$GET1^DIQ(9002313.59902,POS_","_IEN59_",",902.02,"I")
