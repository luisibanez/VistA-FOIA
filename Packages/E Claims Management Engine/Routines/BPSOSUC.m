BPSOSUC ;BHAM ISC/FCS/DRS/FLS - ECME utilities ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
 ; CATEG is used by ILC billing in BPSOSB2
 ; Also called by several other routines
CATEG(N,WANTREV) ;EP - many
 ; given N, return category for the duplicate resolution process
 ; Can call with either N = integer IEN into 9002313.57
 ;   or N = decimal IEN into 9002313.59
 ; $G(WANTREV) = true if you care about reversals 
 ;         (that's the default if N is an IEN59)
 ; $G(WANTREV) = false if you want to ignore reversals 
 ;         (that's the default if IEN57)
 ; because billing is handled differently.
 ;
 ; Many routines rely on these exact return values; do not change them:
 ; Return values:
 ;     For both reversals and submissions:
 ;         CANCELLED and CORRUPT
 ;
 ;     For submissions:
 ;       E PAYABLE, E CAPTURED, E DUPLICATE, E REJECTED, E OTHER, and
 ;       E STRANDED
 ;
 ;     For Reversals:
 ;       E REVERSAL ACCEPTED, E REVERSAL REJECTED, E REVERSAL OTHER, and
 ;       E REVERSAL STRANDED
 ;
 ; Notes:
 ;    E DUPLICATE - being phased out - 02/06/2001
 ;       Remap to E PAYABLE or E CAPTURED, as appropriate
 ;
 ;    CORRUPT, E OTHER, and E REVERSAL OTHER should never happen
 ;
 I N<1 Q "" ; N=-1 can happen from print templates, e.g. MISSED PRESC
 N FILENUM S FILENUM=$S(N[".":9002313.59,1:9002313.57)
 I '$D(WANTREV) S WANTREV=$S(FILENUM=9002313.57:0,FILENUM=9002313.59:1)
 N RETVAL,CLAIM,RESP,X,RESP500,CODE,STAT,DISYS
 I '$$GET1^DIQ(FILENUM,N_",",.01) Q "CORRUPT"
 S CLAIM=$$GET1^DIQ(FILENUM,N_",",3,"I")
 S RESP=$$GET1^DIQ(FILENUM,N_",",4,"I")
 S CODE=$$GET1^DIQ(FILENUM,N_",",201,"I")
 S STAT=$$GET1^DIQ(FILENUM,N_",",202,"I")
 I $P(STAT,"[")="E REVERSAL STRANDED" Q "E REVERSAL STRANDED"
 I $P(STAT,"[")="E STRANDED" Q "E STRANDED"
 ; During a reversal/resubmit, you may get the next line between the reversal and 
 ;   and the resubmit
 I 'CLAIM S RETVAL="E OTHER" Q RETVAL
 I $$GET1^DIQ(FILENUM,N_",",302) Q "CANCELLED"
 I WANTREV S X=$$GET1^DIQ(FILENUM,N_",",401,"I") I X D  Q RETVAL
 . S RESP=$$GET1^DIQ(FILENUM,N_",",402,"I")
 . S RETVAL="E REVERSAL "
 . I 'RESP S RETVAL=RETVAL_"OTHER" Q
 . S RESP500=$$RESP500^BPSOSQ4(RESP,"I")
 . S X=$$RESP1000^BPSOSQ4(RESP,1,"I")
 . I RESP500="R"!(X="R") S RETVAL=RETVAL_"REJECTED" Q
 . ; Treat Duplicate of Accepted Reversal ("S") as Accepted
 . I RESP500="A",X="A"!(X="S") S RETVAL=RETVAL_"ACCEPTED" Q
 . S RETVAL=RETVAL_"OTHER"
 ; Response not received yet
 I 'RESP S RETVAL="E OTHER" Q RETVAL
 S RESP500=$$RESP500^BPSOSQ4(RESP,"I")
 N POS S POS=$$GET1^DIQ(FILENUM,N_",",14)
 S X=$$RESP1000^BPSOSQ4(RESP,POS,"I")
 I X="P"!(X="DP") Q "E PAYABLE"
 I X="D" Q "E DUPLICATE" ; SHOULD NEVER HAPPEN as of 02/06/2001
 I X="R" Q "E REJECTED"
 I X="C"!(X="DC") Q "E CAPTURED"
 ; 1000 indefinite, fall back to 500
 I RESP500="R" Q "E REJECTED"
 Q "E OTHER" ; corrupt?
