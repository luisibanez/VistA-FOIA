BPSOSRX ;BHAM ISC/FCS/DRS/FLS - callable from RPMS pharm ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
 ;
 ; Also used by other BPSOSR* routines to find transactions
 ; that need to be submitted to ECME.
DOCU N I,X F I=0:1 S X=$T(DOCU1+I) Q:X["END OF DOCUMENTATION"  D
 . W $P(X,";",2,99),!
 Q
DOCU1 ; There are only four callable entry points!
 ; $$CLAIM^BPSOSRX     Submit a claim to ECME
 ; $$UNCLAIM^BPSOSRX   Reverse a previously submitted claim.   
 ; $$STATUS^BPSOSRX    Inquire about a claim's status
 ; SHOWQ^BPSOSRX       Display queue of claims to be processed
 ;
 ;  The RXI argument is required - a pointer to ^PSRX(*
 ;  The RXR argument is optional - a pointer to ^PSRX(RXI,1,*
 ;     If RXR is omitted, the first fill is assumed.
 ;  Should have MOREDATA("ORIGIN")
 ;     = undefined - if caller is RPMS Pharmacy package
 ;     = some assigned value - for all other callers
 ;
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
 ; $$CLAIM^BPSOSRX - Submit a claim to ECME
 ;
 ;    $$CLAIM^BPSOSRX(RXI,RXR,.MOREDATA)
 ;    Submit a claim to ECME
 ;    Use, for example, when a prescription is released.
 ;    All this does is to put it on a list and start a background job.
 ;    Return values:
 ;       1 = accepted for processing
 ;       0^reason = failure (should never happen)
 ;
 ;    Note:  If the claim has already been processed, and it's 
 ;       resubmitted, then a reversal will be done first,
 ;       and then the resubmit will be done.   Intervening calls
 ;       to $$STATUS may show progress of the reversal before
 ;       the resubmitted claim is processed.
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
 ; $$UNCLAIM^BPSOSRX - Reverse a previously submitted claim.   
 ;     Use, for example, if a prescription has been canceled.
 ;
 ;    $$UNCLAIM^BPSOSRX(RXI,RXR,.MOREDATA)
 ;     Return value = 1 = will submit request for reversal
 ;                  = 0^reason = failure (should never happen)
 ;
 ;     Note:  The reversal will actually be done ONLY if the
 ;     most recent processing of the claim resulted in something
 ;     reversible, namely E PAYABLE or E REVERSAL REJECTED
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
 ; $$STATUS^BPSOSRX    inquire about a claim's status
 ;
 ;    $$STATUS^BPSOSRX(RXI,RXR,SDT,QUE)
 ;    Parameters
 ;       RXI and RXR describe above
 ;       QUE:  0/null - Do not check if a RX/fill is on the queue (opt)
 ;                  1 - Check if RX/fill is on the queue
 ;             
 ;    Returns     Result^Time^Description
 ;    Returns null  if there's no ECME record of this RXI,RXR.
 ;
 ;    Result is either:
 ;      1. IN PROGRESS for incomplete claims
 ;      2. Final status for complete claims.  See comments for 
 ;           BPSOSUC for complete list of possible statuses.
 ;
 ;    Time is the Fileman date and time of the last update
 ;      to the status of this claim.
 ;
 ;    Description:
 ;      For in Progress, it will be the status (i.e., Waiting to Start,
 ;        Transmitting)
 ;      For completed claims, it will be lists of current and prior
 ;        submission (For example, Payable[Previously: Payable].
 ;        Note that 'Payable' in this case really means submitted.
 ;        Note that E OTHER may have the reason that the ECME process
 ;          wa aborted
 ;
 ; = = = = = = = = END OF DOCUMENTATION = = = = = = = = =
 ; = = = Everything below this line is for internal use only
 ; = = = and subject to sudden unannounced changes!
 ; = = = Please don't call any of it directly, nor depend on
 ; = = = any of the techniques used.
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = =
CLAIM(RXI,RXR,MOREDATA)     ;
 N RETVAL,STAT,TYPE S TYPE="CLAIM"
 I '$D(RXR) S RXR=0
 I '$$LOCK("SUBMIT",5) Q 0
 K ^BPSECP($T(+0),TYPE,RXI,RXR)
 S ^BPSECP($T(+0),TYPE,RXI,RXR)=$$NOW
 I $D(MOREDATA) M ^BPSECP($T(+0),TYPE,RXI,RXR,"MOREDATA")=MOREDATA
 N X,X1,X2
 S X1=DT,X2=30 D C^%DTC
 S ^XTMP("BPSOSRX",0)=X_U_DT_U_"ECME SUBMIT DATE FOR A RX AND FILL"
 S ^XTMP("BPSOSRX",RXI,RXR)=$$NOW
 D UNLOCK("SUBMIT")
 D RUNNING()
 S RETVAL=1
 Q RETVAL
 ;
UNCLAIM(RXI,RXR,MOREDATA) ;
 N RETVAL,STAT,RESULT,TYPE S TYPE="UNCLAIM"
 I '$D(RXR) S RXR=0
 I '$$LOCK("SUBMIT",5) Q 0
 K ^BPSECP($T(+0),TYPE,RXI,RXR)
 S ^BPSECP($T(+0),TYPE,RXI,RXR)=$$NOW
 I $D(MOREDATA) M ^BPSECP($T(+0),TYPE,RXI,RXR,"MOREDATA")=MOREDATA
 N X,X1,X2
 S X1=DT,X2=30 D C^%DTC
 S ^XTMP("BPSOSRX",0)=X_U_DT_U_"ECME SUBMIT DATE FOR A RX AND FILL"
 S ^XTMP("BPSOSRX",RXI,RXR)=$$NOW
 D UNLOCK("SUBMIT")
 D RUNNING()
 S RETVAL=1
 Q RETVAL
 ;
 ; STATUS - Returns the current status of a RX/Fill
 ;   For more information, see the top of this routine
STATUS(RXI,RXR,QUE) ;
 ;
 ; Set needed variables
 N IEN59,SDT,A
 I '$G(RXI) Q ""
 I $G(RXR)="" Q ""
 I $G(QUE)="" S QUE=1
 S IEN59=$$IEN59(RXI,RXR)
 S SDT=$G(^XTMP("BPSOSRX",RXI,RXR))
 ;
 ; ECME record not created
 I '$D(^BPST(IEN59)) D  Q A
 . I QUE,SDT S A="IN PROGRESS"_U_SDT_U_$$STATI^BPSOSU(0)_U_-1 Q
 . I QUE,$D(^BPSECP("BPSOSRX","CLAIM",RXI,RXR)) S A="IN PROGRESS"_U_SDT_U_$$STATI^BPSOSU(0)_U_-1 Q
 . S A=""
 ;
 ; Loop: Get data, quit if times and status match (no change during gather)
 N C,T1,T2,S1,S2 F  D  I T1=T2,S1=S2 Q
 . S T1=$$LASTUP59(RXI,RXR)
 . S S1=$$STATUS59(RXI,RXR)
 . I S1=99 D  ; completed
 . . S A=$$RESULT59(RXI,RXR)
 . . S C=$$RESTXT59(RXI,RXR)
 . I S1'=99 D
 . . S A="IN PROGRESS"
 . . S C=$$STATI^BPSOSU(S1)
 . S T2=$$LASTUP59(RXI,RXR)
 . S S2=$$STATUS59(RXI,RXR)
 ;
 ; If the queue parameter is set and the submit date follows the LAST UPDATE date or the
 ;   RX/fill is on the queue, then change the response to IN PROGRESS^Submit Date^WAITING TO START 
 I $G(QUE),SDT>T1!($D(^BPSECP("BPSOSRX","CLAIM",RXI,RXR))) S A="IN PROGRESS",T1=SDT,S1=-1,C=$$STATI^BPSOSU(0)
 ;
 ; When finishing the reversal of a Reversal/Resubmit, display IN PROGRESS
 I $P($G(^BPST(IEN59,1)),"^",12)=1,S1=99 S A="IN PROGRESS",S1=98,C=$$STATI^BPSOSU(S1)
 ;
 ; Return results
 Q A_U_T1_U_$E(C,1,255-$L(A)-$L(T1)-2)_U_S1
SHOWQ G SHOWQ^BPSOSR2
 ;
 ;    $$EDCLAIM(RXI,RXR,MOREDATA)
 ;    Invoke the ECME data input screen for this
 ;    prescription and fill.  Use this if you want the opportunity
 ;    to edit the claim data - for example, pre-authorization numbers,
 ;    price overrides, insurance order of billing, etc. 
 ;    The data entry screen is invoked.  The claim can be submitted
 ;    or not, at the user's option, by using Screenman <PF1>E or <PF1>Q
 ;
EDCLAIM(RXI,RXR,MOREDATA)    ;
 I 1 D IMPOSS^BPSOSUE("P","TI","entry point not available in this release",$P($T(+2),";",3),"EDCLAIM",$T(+0)) Q
 ; for devel & testing, change above to I 0 and add to code below
 N RETVAL S RETVAL=1
 D LOCK
 D UNLOCK
 Q RETVAL
 ;    
NOW() N %,%H,%I,X D NOW^%DTC Q %
 ; $$RESULT59 returns result of a finished claim in .59
 ; Can send RXI and have RXR defaulted
 ;  PAPER or E PAYABLE or E REJECTED or E CAPTURED or E DUPLICATE
 ;  or E OTHER (should never happen)
 ;  or PAPER REVERSAL or E REVERSAL ACCEPTED or E REVERSAL REJECTED
RESULT59(RXI,RXR) ;EP - BPSOS6D ;  result as defined in CATEG^BPSOSUC
 N IEN59 I RXI["." S IEN59=RXI
 E  S:'$D(RXR) RXR=$$RXRDEF(RXI) S IEN59=$$IEN59(RXI,RXR)
 Q $$CATEG^BPSOSUC(IEN59)
RESTXT59(RXI,RXR)  ; result text
 N IEN59 I RXI["." S IEN59=RXI
 E  S:'$D(RXR) RXR=$$RXRDEF(RXI) S IEN59=$$IEN59(RXI,RXR)
 Q $P($G(^BPST(IEN59,2)),U,2)
LASTUP59(RXI,RXR) ;EP - BPSOSR1;  time of last update
 N IEN59 I RXI["." S IEN59=RXI
 E  S:'$D(RXR) RXR=$$RXRDEF(RXI) S IEN59=$$IEN59(RXI,RXR)
 Q $P(^BPST(IEN59,0),U,8)
 ;
RXRDEF(RXI) ;EP - BPSOSNC
 Q +$P($G(^PSRX(RXI,1,0)),U,3) ; highest refill #
 ;
 ;
 ; Utilties
 ;
 ;  LOCKING:  Just one user of this routine at a time.
 ;  X = "SUBMIT" to interlock the claim submission
 ;  X = "BACKGROUND" to interlock the background job
LOCK(X,TIMEOUT) ;EP - BPSOSRB
 I $G(TIMEOUT)="" S TIMEOUT=0
 L +^BPSECP($T(+0),X):TIMEOUT Q $T
LOCKNOW(X) ;EP - BPSOSRB
 L +^BPSECP($T(+0),X):0 Q $T
UNLOCK(X) ;EP - BPSOSRB
 L -^BPSECP($T(+0),X) Q
LOCK59() L +^BPST:300 Q $T
UNLOCK59 L -^BPST Q
 ;
RUNNING()          ;
 I '$$LOCKNOW("BACKGROUND") Q  ; it is running; don't start another
 D UNLOCK("BACKGROUND") ; it's not running; release our probing lock
 D TASK
 Q
IEN59(RXI,RXR) ;EP - from BPSOS,BPSOSNC,BPSOSRB
 Q RXI_"."_$TR($J(RXR,4)," ","0")_"1"
 ; 
 ; $$STATUS59 returns processing status from .59 record
 ; "" if there's no such claim    note: 99 means complete
STATUS59(RXI,RXR) ;
 N IEN59,STAT
 I RXI["." S IEN59=RXI
 E  S:'$D(RXR) RXR=$$RXRDEF(RXI) S IEN59=$$IEN59(RXI,RXR)
 S STAT=$P($G(^BPST(IEN59,0)),U,2)
 Q STAT
 ; 
 ; The background job
 ;
TASK N X,Y,%DT S X="N",%DT="ST" D ^%DT D TASKAT(Y) Q
TASKAT(ZTDTH)      ;
 N ZTIO S ZTIO="" ; no device
 N ZTRTN S ZTRTN="BACKGR^BPSOSRB" D ^%ZTLOAD Q
LASTLOG ; tool for test - find and print most recent log file
 N X S X=999999999999
 F  S X=$O(^BPSECP("LOG",X),-1) Q:'X  Q:X#1=.4
 I 'X W "No log file found",! Q
 D PRINTLOG^BPSOSL(X)
 Q
