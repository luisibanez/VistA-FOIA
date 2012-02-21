BPSOSRB ;BHAM ISC/FCS/DRS/FLS - background from BPSOSRX ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
BACKGR ;
 I '$$LOCKNOW^BPSOSRX("BACKGROUND") Q
 N BACKSLOT S BACKSLOT=DT+.4
 D INIT^BPSOSL(BACKSLOT,1,-1)
 N LIST,TYPE,RXI,RXR,IEN59  S LIST="BPSOSRX"
 I '$$LOCK^BPSOSRX("BACKGROUND",300) D  G FAIL
 . D LOG^BPSOSL("Failed to $$LOCK^BPSOSRX(""BACKGROUND"")")
 I $D(MOREDATA("DIALOUT")) S VADIAL=MOREDATA("DIALOUT") ;VA
 F TYPE="CLAIM","UNCLAIM" D
 . S RXI="" F  S RXI=$O(^BPSECP(LIST,TYPE,RXI)) Q:RXI=""  D
 . . S RXR="" F  S RXR=$O(^BPSECP(LIST,TYPE,RXI,RXR)) Q:RXR=""  D
 . . . N X S X=$$STATUS^BPSOSRX(RXI,RXR,0)
 . . . S IEN59=$$IEN59^BPSOSRX(RXI,RXR)
 . . . D LOG59^BPSOSL($T(+0)_" - Dequeuing.  Type is "_TYPE,IEN59)
 . . . I $P(X,U)="IN PROGRESS" D  Q
 . . . . D LOG59^BPSOSL($T(+0)_" - Status is 'IN PROGRESS'.  Will retry later.",IEN59)
 . . . N TIME,MOREDATA
 . . . S TIME=^BPSECP(LIST,TYPE,RXI,RXR) ; time requested
 . . . I '$$LOCK^BPSOSRX("SUBMIT",10) D  Q
 . . . . D LOG59^BPSOSL($T(+0)_" - Failed to $$LOCK^BPSOSRX(""SUBMIT"").  Will retry later.",IEN59)
 . . . I $D(^BPSECP(LIST,TYPE,RXI,RXR,"MOREDATA")) M MOREDATA=^("MOREDATA")
 . . . E  S MOREDATA=0
 . . . K ^BPSECP(LIST,TYPE,RXI,RXR)
 . . . D BACKGR1(TYPE,RXI,RXR,TIME,.MOREDATA)
 . . . D UNLOCK^BPSOSRX("SUBMIT")
 . . . I $P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) D HANG  ;VA; don't hang for VA Rx's
FAIL D RELSLOT^BPSOSL
 D UNLOCK^BPSOSRX("BACKGROUND")
 Q
STARTTIM(RXI,RXR)  Q $P($G(^BPST($$IEN59(RXI,RXR),0)),U,11)
BACKGLOG(X) ;
 N MSG S MSG=RXI_","_RXR_" "_$S(TYPE="CLAIM":"",1:TYPE)_" "_X
 D LOG2SLOT^BPSOSL(MSG,BACKSLOT)
 Q
BACKGR1(TYPE,RXI,RXR,TIME,MOREDATA)        ;
 ; Resolve multiple requests
 N SKIP S SKIP=0 ; skip if you already got desired result
 N SKIPREAS
 N RESULT S RESULT=$$STATUS^BPSOSRX(RXI,RXR,0),RESULT=$P(RESULT,U)
 N STARTTIM S STARTTIM=$$STARTTIM(RXI,RXR)
 I TYPE="CLAIM" D
 . I $$RXDEL^BPSOS(RXI,RXR) D  Q
 . . S SKIP=1,SKIPREAS="Prescription is marked as DELETED or CANCELLED"
 . ; If it's never been through ECME before, good.
 . I RESULT="" Q
 . ; There's already a complete transaction for this RXI,RXR
 . ; (We screened out "IN PROGRESS" earlier)
 . ; The program to poll indexes would have set DO NOT RESUBMIT.
 . ; Calls from pharm pkg to ECME have '$D(MOREDATA("DO NOT RESUBMIT"))
 . I $D(MOREDATA("DO NOT RESUBMIT")) D
 . . S SKIP=1
 . . S SKIPREAS="MOREDATA(""DO NOT RESUBMIT"") is set"
 . E  I TIME<STARTTIM D  ; our request was made before trans. began
 . . ; submit claim but only if the prev result was successful reversal
 . . I RESULT="PAPER REVERSAL" Q
 . . I RESULT="E REVERSAL ACCEPTED" Q
 . . S SKIP=1
 . . S SKIPREAS="Prev result "_RESULT_"; claim started "_STARTTIM_">"_TIME_" submitted"
 . E  D  ; our request was made after it began
 . . ; So we will make a reversal if necessary,
 . . ; and then the claim will be resubmitted.
 . . I RESULT="E PAYABLE"!(RESULT="E DUPLICATE") D
 . . . S MOREDATA("REVERSE THEN RESUBMIT")=1
 E  I TYPE="UNCLAIM" D
 . ; It must have gone through ECME with a payable result
 . I RESULT="E PAYABLE" Q
 . I RESULT="E DUPLICATE" Q
 . N RXACTION S RXACTION=$G(MOREDATA("RX ACTION"))
 . I RESULT="E REVERSAL REJECTED",(",DE,EREV,RS,"[(","_RXACTION_",")) Q
 . I RESULT="E REVERSAL STRANDED",RXACTION="EREV" Q
 . S SKIP=1
 . S SKIPREAS="Cannot reverse - previous result was "_RESULT
 E  D IMPOSS^BPSOSUE("P","TI","bad arg TYPE="_TYPE,,"BACKGR1",$T(+0))
 I SKIP D  Q
 . D LOG59^BPSOSL($T(+0)_" - Skipping.  Reason: "_SKIPREAS,IEN59)
 I TYPE="UNCLAIM"!$G(MOREDATA("REVERSE THEN RESUBMIT")) D REVERSE
 E  D CLAIM(RXI,RXR,IEN59,.MOREDATA)
 Q
 ;
 ; Process claim request
 ; EP - Above and BPSOSU (for a resubmit after a reversal)
CLAIM(RXI,RXR,IEN59,MOREDATA) ;
 N ABSBRXI,ABSBRXR,ABSBNDC
 S (ABSBRXI,ABSBRXI(1))=RXI,(ABSBRXR,ABSBRXR(1))=RXR
 S ABSBNDC(1)=$$DEFNDC^BPSOSIV
 ;
 ; If MOREDATA("ORIGIN") is undefined, give it a "1" here.
 I '$D(MOREDATA("ORIGIN")) S MOREDATA("ORIGIN")=1
 D LOG59^BPSOSL($T(+0)_" - Initiating Claim",IEN59)
 D FILING^BPSOSIV(0,MOREDATA("ORIGIN"),.MOREDATA)  ;6/23/03 PASS MOREDATA FOR IB DATA FILING
 Q
 ; Process the reversal
 ; EP - Above 
REVERSE ;
 N IEN59 S IEN59=$$IEN59(RXI,RXR)
 N M S M=$T(+0)_" - Initiating Reversal"
 I $G(MOREDATA("REVERSE THEN RESUBMIT")) D
 . S M=M_" and after that, claim will be resubmitted"
 . N X,X1,X2
 . S X1=DT,X2=30 D C^%DTC
 . S ^XTMP("BPSOSRB",0)=X_U_DT_U_"PASS VARIABLES FOR RESUBMITS"
 . K ^XTMP("BPSOSRB","MOREDATA",IEN59)
 . M ^XTMP("BPSOSRB","MOREDATA",IEN59,"RESUB")=MOREDATA
 D LOG59^BPSOSL(M,IEN59)
 N RETVAL S RETVAL=$$REVERS59^BPSOS6D(IEN59,1)
 D LOG59^BPSOSL($T(+0)_" - Return Value from BPSOS6D: "_RETVAL,IEN59)
 ;
 ; Reset $T so the calling code does not fall through to the else
 I 1
 Q
LASTLOG ; tool for test - find and print most recent log file
 N X S X=999999999999
 F  S X=$O(^BPSECP("LOG",X),-1) Q:'X  Q:X#1=.4
 I 'X W "No log file found",! Q
 D PRINTLOG^BPSOSL(X)
 Q
HANG ; how long to hang before submitting the next claim?
 ; usually not at all (0 secs)
 ; but if there are an extraordinary # of claims in processing,
 ; then wait up a bit before letting anything else through
 ;
 ; FUTURE:  Have to make this smarter - make it aware of how many
 ; claims have been requested in, say, the past 1 minute as well.
 ; This would be to keep the backbilling from flooding taskman
 ; with excessive BPSOSQ1 and BPSOSQ2 jobs which have nothing to
 ; do.  That way, the BPSOSQ3 jobs would activate more quickly.
 ;
 ; I $H<some date H $R(10) ; put in this line if doing massive backbill
 I $R(50) Q  ; for efficiency - check only once every 50 claims
 N LOCK,MYDEST
HANGA ;
 I '$G(VARX) S VARX=0 S:$P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1)=0 VARX=1
 K MYDEST S LOCK=0 D FETSTAT^BPSOS2("MYDEST")
 N T,S S T=0 F S=0:10:90 S T=T+$G(MYDEST(S))
 I T<20 Q  ; not too many; that's fine
 I '$G(VARX) H 30 ; wait 30 secs and try again until things have settled down
 E  H 5
 G HANGA
IEN59(RXI,RXR)     Q $$IEN59^BPSOSRX(RXI,RXR)
