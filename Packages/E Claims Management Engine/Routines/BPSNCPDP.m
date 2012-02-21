BPSNCPDP ;BHAM ISC/LJE - API to submit a claim to ECME ;8/01/03
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ; Reference to ^PSRX supported by DBIA 1977
 ;Input
 ; BRXIEN = Prescription IEN
 ; BFILL = Fill Number
 ; BFILLDAT = Fill Date of current prescription and fill number
 ; BWHERE (RX Action)
 ;    ARES = Resubmit for an auto-reversed claim was released while waiting
 ;           for the payer response
 ;    AREV = Auto-Reversal
 ;    BB   = Back Billing
 ;    CRLB = CMOP Release & Rebill
 ;    CRLR = CMOP Release & Reverse (successful release)
 ;    CRLX = CMOP unsuccessful release & reverse
 ;    DC   = Discontinue - only reverse un-released PAYABLE DC's, release date check
 ;           should be in calling routine.
 ;    DDED = Delete in edit
 ;    DE   = Delete
 ;    ED   = Edit
 ;    ERES = Resubmit from ECME user screen
 ;    EREV = Reversal from ECME user screen
 ;    HLD  = Put prescription on Hold
 ;    OF   = Original Fill
 ;    PC   = Pull CMOPs
 ;    PE   = Pull early from suspense
 ;    PL   = Pull local from suspense
 ;    PP   = PP from Patient Prescription Processing option
 ;    RF   = Refill
 ;    RL   = Release Rx NDC check - Rebill if billed NDC doesn't match release NDC
 ;    RN   = Renew
 ;    RRL  = Original claim rejected, submit another claim, no reversal
 ;    RS   = Return-to-Stock
 ; BILLNDC = Valid NDC# with format 5-4-2
 ; REVREAS = Reversal Reason
 ; DURREC  = String of DUR info - Three "^" pieces
 ;                Professional Service Code
 ;                Reason for Service Code
 ;                Result of Service Code
 ;Output (RESPONSE^MESSAGE)
 ; RESPONSE
 ;    0  Submitted through ECME
 ;    1  No submission through ECME
 ;    2  IB not billable
 ;    3  Claim was closed, not submitted (RTS/Deletes)
 ;    4  Unable to queue claim
 ;    5  Incorrect information supplied to ECME
 ; MESSAGE = Message associated with the response (error/submitted)
 ;    
EN(BRXIEN,BFILL,BFILLDAT,BWHERE,BILLNDC,REVREAS,DURREC) ;
EN1 N DFN,PNAME,BRX,ARRAY,MOREDATA,SITE,WFLG,OLDRESP
 N %,%I,%H,X,TODAY
 N QUIT,CERTIFY,CERTIEN,PAYERSH
 N REBILL,REVONLY,CLMSTAT,RESPONSE,BPSTART,IB,RESP
 ;
 ; Default variables
 S RESPONSE="",CLMSTAT=""
 ;
 ; Check for missing parameters
 I '$G(BRXIEN) S CLMSTAT="Prescription IEN parameter missing",RESPONSE=5 G END
 I $G(BWHERE)="" S CLMSTAT="RX Action parameter missing",RESPONSE=5 G END
 I '$G(BFILL) S BFILL=0
 ;
 ; Check that the prescription exists
 I '$D(^PSRX(BRXIEN,0)) S CLMSTAT="Prescription does not exist",RESPONSE=5 G END
 ;
 ; Get the NDC if it was not passed in
 I $G(BILLNDC)="" S BILLNDC=$$GETNDC^PSONDCUT(BRXIEN,BFILL)
 ;
 ; Patient Info
 S DFN=$$GET1^DIQ(52,BRXIEN_",",2,"I"),PNAME=$$GET1^DIQ(2,DFN,.01)
 ;
 ; Get prescription number
 S BRX=$P(^PSRX(BRXIEN,0),"^",1)
 ;
 ; Set write flag
 S WFLG=1
 I ",ARES,AREV,CRLB,CRLR,CRLX,DDED,DE,EREV,HLD,PC,PE,PL,RS,"[(","_BWHERE_",") S WFLG=0
 ;
 ; Get status of previously submitted claim and set rebill/revonly flags
 S (REBILL,REVONLY)=0
 S OLDRESP=$P($$STATUS^BPSOSRX(BRXIEN,BFILL,1),U,1)
 I ",AREV,CRLR,CRLX,DC,DDED,DE,EREV,HLD,RS,"[(","_BWHERE_",") S REVONLY=1
 E  I OLDRESP="E PAYABLE"!(OLDRESP="E DUPLICATE") S REBILL=1
 ;
 ; Get Site info and check if the site has ECME turned on
 ;   Do not check for reversals/rebill as these need to be processed for the old site
 I 'BFILL S SITE=$$GET1^DIQ(52,BRXIEN,20,"I")
 I BFILL S SITE=$$GET1^DIQ(52.1,BFILL_","_BRXIEN,8,"I")
 I 'REVONLY,'REBILL D  I RESPONSE=1 G END
 . I '$G(SITE) S CLMSTAT="No Site Information",RESPONSE=1 Q
 . I '$$ECMEON^BPSUTIL(SITE) S CLMSTAT="ECME switch is not on for the site",RESPONSE=1
 ;
 ; In Progress/Stranded claims check
 I OLDRESP["IN PROGRESS" D  G END
 . S CLMSTAT="Previous request is IN PROGRESS.  It may need to be unstranded.",RESPONSE=4
 . I WFLG W !,CLMSTAT,! H 2
 . ; If not OP, then send an email to the OPECC
 . I ",AREV,BB,ERES,EREV,"'[(","_BWHERE_",") D BULL^BPSNCPD1(BRXIEN,BFILL,$G(SITE),$G(DFN),$G(PNAME))
 ;
 ; Backbilling check
 I BWHERE="BB",OLDRESP'="" D  G END
 . S CLMSTAT="Previously billed through ECME: "_OLDRESP,RESPONSE=1
 . I WFLG W !,CLMSTAT,! H 2
 ;
 ; Do not reverse if the prescription was not previously billed through ECME
 I OLDRESP="",(",AREV,CRLR,CRLX,DC,DDED,DE,EREV,HLD,RS,"[(","_BWHERE_",")) D  G END
 . S CLMSTAT="Prescription not previously billed through ECME.  Cannot Reverse claim.",RESPONSE=1
 . I WFLG W !,CLMSTAT,! H 2
 ;
 ; If returning to stock or deleting and the previous claim was not paid, then no reversal is needed
 ;   so close the prescription and quit
 I OLDRESP'["E PAYABLE",OLDRESP'["E REVERSAL REJECTED",(",RS,DE,"[(","_BWHERE_",")) D  G END
 . D CLOSE2^BPSBUTL(BRXIEN,BFILL,BWHERE)
 . S CLMSTAT="Claim was not payable so it has been closed.  No ECME claim created.",RESPONSE=3
 . I WFLG W !,CLMSTAT,! H 2
 ;
 ; Do not reverse if the claim is not E PAYABLE
 I OLDRESP'["E PAYABLE",OLDRESP'["E DUPLICATE",(",AREV,CRLR,CRLX,DC,DDED,HLD,"[(","_BWHERE_",")) D  G END
 . S CLMSTAT="Claim has status "_OLDRESP_".  Not reversed.",RESPONSE=1
 . I WFLG W !,CLMSTAT,! H 2
 ;
 ; EREV can be re-reversed if the previous submission is Payable or Rejected Revesal
 I BWHERE="EREV",",E PAYABLE,E DUPLICATE,E REVERSAL REJECTED,E REVERSAL STRANDED,"'[(","_OLDRESP_",") D  G END
 . S CLMSTAT="Claim has status "_OLDRESP_".  Not reversed.",RESPONSE=1
 . I WFLG W !,CLMSTAT,! H 2
 ;
 ; Make sure fill date is not in the future or empty
 D NOW^%DTC
 S TODAY=$P(%,".",1)
 I '$G(BFILLDAT)!($G(BFILLDAT)>TODAY) S BFILLDAT=TODAY
 ;
 ; Store needed parameters into MOREDATA
 S MOREDATA("USER")=DUZ
 S MOREDATA("RX ACTION")=$G(BWHERE)
 S MOREDATA("DATE OF SERVICE")=$P($G(BFILLDAT),".",1)
 S MOREDATA("REVERSAL REASON")=$S($G(REVREAS)="":"UNKNOWN",1:$E($G(REVREAS),1,40))
 I $G(DURREC)]"" S MOREDATA("DUR",1,0)=DURREC
 ;
 ; Do a reversal for the appropriate actions
 I ",AREV,CRLR,CRLX,DC,DDED,DE,EREV,HLD,RS,"[(","_BWHERE_",") D  G STATUS:RESPONSE=0,END:RESPONSE=4
 . ; If override flag is set, prompt for override values - MUST be commented out for any release.
 . ;I $L($T(CHECK^ZZGIZOV1))>0,$$CHECK^ZZGIZOV1 D GETOVER^ZZGIZOV1(BRXIEN,BFILL,OLDRESP,BWHERE,"R")
 . D LOG(DT_" Before Submit of Reversal")
 . S BPSTART=$$STTM()
 . S RESP=$$UNCLAIM^BPSOSRX(BRXIEN,BFILL,.MOREDATA)
 . D LOG("After Submit of Reversal. Return Value: "_RESP)
 . I RESP=1 D
 .. S RESPONSE=0,CLMSTAT="Reversing prescription "_BRX_"."
 .. I WFLG W !,CLMSTAT H 2
 . I RESP=0 D
 .. S RESPONSE=4,CLMSTAT="No claim submission made.  Unable to queue reversal."
 .. D LOG(CLMSTAT)
 .. I WFLG W !,CLMSTAT,! H 2
 .. L -^BPST
 ;
 ; Can not resubmit reversed claims unless they are accepted
 I OLDRESP]"",OLDRESP["E REVERSAL",OLDRESP'="E REVERSAL ACCEPTED" D  G END
 . S CLMSTAT="Can not resubmit a rejected or stranded reversal",RESPONSE=1
 . I WFLG W !,CLMSTAT,! H 2
 ;
 ; Some actions require a paid claim (they will not do a reversal/resubmit)
 I OLDRESP]"",OLDRESP'="E REVERSAL ACCEPTED",OLDRESP'="E REJECTED",(",CRLB,ED,ERES,RL,RRL,"'[(","_BWHERE_",")) D  G END
 . S CLMSTAT="Previously billed through ECME: "_OLDRESP,RESPONSE=1
 . I WFLG W !,CLMSTAT,! H 2
 ;
 ; Certification Testing
 S (QUIT,CERTIFY)=0
 I ^BPS(9002313.99,1,"CERTIFIER")=DUZ D  I QUIT S CLMSTAT="User exited from certification questions",RESPONSE=1 G END
 . S CERTIFY=1
C1 . R !,"ENTER NDC: ",BILLNDC:120 S:BILLNDC="^" QUIT=1 Q:QUIT  I BILLNDC="" G C1
C2 . R !,"PAYER SHEET: ",PAYERSH:120 I '$D(^BPSF(9002313.92,"B",PAYERSH)) S:PAYERSH="^" QUIT=1 Q:QUIT  W !,"INVALID SHEET" G C2
C3 . R !,"CERTIFICATION ENTRY: ",CERTIEN:120 I '$D(^BPS(9002313.31,CERTIEN)) S:CERTIEN="^" QUIT=1 Q:QUIT  W !,"INVALID IEN" G C3
 I WFLG W !!
 ;
 ; Build array with prescription data
 D STARRAY^BPSNCPD1(BRXIEN,BFILL,BWHERE,.ARRAY)
 ;
 ; Do IB billing determination and check response
 ; If IB=2, then not billable, so write messages
 S IB=0
 D EN^BPSNCPD2
 I IB=2 D  G END
 . S RESPONSE=2
 . S CLMSTAT=$P(MOREDATA("BILL"),"^",2)
 . I OLDRESP]"" D LOG(CLMSTAT)
 ;
 ; Check for missing data (Will IB billing determination catch this?)
 I $D(MOREDATA("IBDATA",1,1)),$P(MOREDATA("IBDATA",1,1),"^",1)="" D  G END
 . S RESPONSE=2,CLMSTAT="Information missing from IB data."
 . I WFLG W !,CLMSTAT,! H 2
 ;
 ; Check for missing/invalid payer sheets (I think IB billing determination will catch this)
 I $P($G(MOREDATA("IBDATA",1,1)),"^",4)="" D  G END
 . S RESPONSE=2,CLMSTAT="Invalid/missing payer sheet from IB data."
 . I WFLG W !,CLMSTAT,! H 2
 ;
 ; Check if IB says to bill
 I '$G(MOREDATA("BILL")) D  G END
 . S RESPONSE=2
 . S CLMSTAT="Flagged by IB to not 3rd Party Insurance bill through ECME."
 . I WFLG W !,CLMSTAT,! H 2
 ;
 ; Log message to ECME log
 D LOG(DT_" Before submit of claim")
 ;
 ; If override flag is set, prompt for override values - MUST be commented out for any release.
 ;I $L($T(CHECK^ZZGIZOV1))>0,$$CHECK^ZZGIZOV1 D GETOVER^ZZGIZOV1(BRXIEN,BFILL,OLDRESP,BWHERE,"S")
 ;
 ; Get require data
 S BPSTART=$$STTM()
 ;
 ; Submit claim and check result
 S RESP=$$CLAIM^BPSOSRX(BRXIEN,BFILL,.MOREDATA)
 D LOG("After Submit of Claim.  Return Value: "_RESP)
 I RESP=1 D
 . S RESPONSE=0
 . S CLMSTAT="Prescription "_BRX_" successfully submitted to ECME for claim generation."
 . I WFLG W !!,CLMSTAT
 I RESP=0 D  G END
 . S RESPONSE=4
 . S CLMSTAT="No claim submission made.  Unable to queue claim submission."
 . I WFLG W !!,CLMSTAT,!
 . D LOG(CLMSTAT)
 ;
 ; Display status
STATUS I 'WFLG H 1
 E  D STATUS^BPSNCPD1(BRXIEN,BFILL,REBILL,REVONLY,BPSTART,BWHERE)
 ;
 ; Clean up and quit
END K BRXIEN,BFILL,BFILLDAT,BWHERE,MOREDATA
 S:'$D(RESPONSE) RESPONSE=1
 Q RESPONSE_"^"_$G(CLMSTAT)
 ;
LOG(LOGMSG) ;
 D LOG59^BPSOSL($T(+0)_" - "_LOGMSG,BRXIEN_"."_$E($TR($J("",4-$L(BFILL))," ","0")_BFILL,1,4)_1)
 Q
STTM() ;
 N %,%H,%I
 D NOW^%DTC
 Q %
