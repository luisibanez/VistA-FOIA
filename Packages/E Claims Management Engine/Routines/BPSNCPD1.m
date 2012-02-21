BPSNCPD1 ;BHAM ISC/LJE - Pharmacy API part 2 ;06/16/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;External reference to file #50.68 supported by DBIA 3735
 ;
 ; STARRAY - Retrieve information for API call to IB and store in ARRAY
 ; Incoming Parameters
 ;    BRXIEN - Prescription IEN
 ;    BFILL  - Fill Number
 ;    BWHERE - RX action
 ;    ARRAY  - Array that is built (passed by reference)
STARRAY(BRXIEN,BFILL,BWHERE,ARRAY) ;
 N RXINFO,DRUGIEN,DRUGINFO,CMOP,EIS
 S ARRAY("DFN")=DFN
 S ARRAY("DRUG")=$G(PSODRUG("NAME"))
 I ARRAY("DRUG")="" S ARRAY("DRUG")=$P(^PSRX(BRXIEN,0),"^",6)
 S ARRAY("DAYS SUPPLY")=$G(PSOX("DAYS SUPPLY"))
 I ARRAY("DAYS SUPPLY")="" S ARRAY("DAYS SUPPLY")=$P(^PSRX(BRXIEN,0),"^",8)
 S ARRAY("IEN")=BRXIEN
 S ARRAY("FILL NUMBER")=BFILL
 S ARRAY("NDC")=BILLNDC
 S RXINFO=^PSRX(BRXIEN,0)
 S DRUGIEN=$P(RXINFO,"^",6),DRUGINFO=^PSDRUG(DRUGIEN,0)
 S CMOP=0 S CMOP=$P($G(^PSDRUG(DRUGIEN,3)),"^") S:CMOP="" CMOP=0
 S ARRAY("DEA")=$P(DRUGINFO,U,3)
 S ARRAY("COST")=$P($G(^PSDRUG(DRUGIEN,660)),U,6)
 S ARRAY("QTY")=$P(RXINFO,U,7)
 S ARRAY("FILL DATE")=BFILLDAT
 S ARRAY("DIVISION")=$$MCDIV^BPSBUTL(BRXIEN,BFILL)
 S ARRAY("RELEASE DATE")=$P($S(BFILL=0:$P(^PSRX(BRXIEN,2),"^",13),1:$P(^PSRX(BRXIEN,1,BFILL,0),"^",18)),".")
 S ARRAY("AO")="",ARRAY("EC")="",ARRAY("HNC")="",ARRAY("IR")="",ARRAY("MST")="",ARRAY("SC")="",ARRAY("CV")=""
 ;
 ; New way of getting SC/EI (CIDC)
 S EIS=$G(^PSRX(BRXIEN,"ICD",1,0))
 I $G(EIS)]"" D
 . S ARRAY("AO")=$P(EIS,U,2)
 . S ARRAY("EC")=$P(EIS,U,5)
 . S ARRAY("HNC")=$P(EIS,U,7)
 . S ARRAY("CV")=$P(EIS,U,8)
 . S ARRAY("IR")=$P(EIS,U,3)
 . S ARRAY("SC")=$P(EIS,U,4)
 . S ARRAY("MST")=$P(EIS,U,6)
 ; If not available, pull from IBQ node (old way)
 E  S EIS=$G(^PSRX(BRXIEN,"IBQ")) I EIS'="" D
 . S ARRAY("AO")=$P(EIS,U,3)
 . S ARRAY("EC")=$P(EIS,U,5)
 . S ARRAY("HNC")=$P(EIS,U,6)
 . S ARRAY("CV")=$P(EIS,U,7)
 . S ARRAY("IR")=$P(EIS,U,4)
 . S ARRAY("SC")=$P(EIS,U,1)
 . S ARRAY("MST")=$P(EIS,U,2)
 ;
 ; Add user so that it is stored correctly in the IB Event Log
 ;  Note: Auto-Reversals (AREV) and CMOP/OPAI (CR*/PC/RL) use postmaster (.5)
 I ",AREV,CRLB,CRLX,CRLR,PC,RL,"[(","_BWHERE_",") S ARRAY("USER")=.5
 E  S ARRAY("USER")=DUZ
 Q
 ;
 ; Called by BPSNCPDP to display progress of claim
STATUS(BRXIEN,BFILL,REBILL,REVONLY,BPSTART,BWHERE) ;
 ; Initialization
 N TRANSIEN,CERTUSER,BPSTO,END,IBSEQ,BPQ
 N CLMSTAT,OCLMSTAT,RESUB,RESFL
 S (CLMSTAT,OCLMSTAT)=0
 ;
 ; Set CERTUSER to true if this user is the certifier
 S CERTUSER=^BPS(9002313.99,1,"CERTIFIER")=DUZ
 ;
 ; Build Transaction IEN
 S TRANSIEN=BRXIEN_"."_$E($TR($J("",4-$L(BFILL))," ","0")_BFILL,1,4)_1
 ;
 ; Write Rebill and Status Messages
 W !!,"Claim Status: "
 I REBILL W !,"Reversing and Rebilling a previously submitted claim...",!,"Reversing..."
 ;
 ; Get the ECME Timeout and set the display timeout
 S BPSTO=$$GET1^DIQ(9002313.99,"1,",3.01),END=$S(CERTUSER:50,$G(BPSTO)]"":BPSTO,1:5)
 ;
 ; For remaining time, loop through and display status
 S (BPQ,RESFL)=0
 F IBSEQ=1:1:END D  Q:BPQ=1
 . H 1
 . ;
 . ; Get status of resubmit, last update, and claim status
 . S CLMSTAT=$$STATUS^BPSOSRX(BRXIEN,BFILL,1)
 . S RESUB=$$GET1^DIQ(9002313.59,TRANSIEN_",",1.12,"I")
 . ;
 . ; Format status message
 . S CLMSTAT=$P(CLMSTAT,"^",1)_$S($P(CLMSTAT,"^",1)["IN PROGRESS":"-"_$P(CLMSTAT,"^",3),1:"")
 . ;
 . ; If we are starting the resubmit, display message
 . I REBILL,RESFL=0,RESUB=1,CLMSTAT["Resubmitting" W !,"Resubmitting..." S RESFL=1 Q
 . I REBILL,RESFL=0,RESUB=2,CLMSTAT["IN PROGRESS" W !,"Resubmitting..." S RESFL=1
 . ;
 . ; If the status has changed, display the new message
 . I OCLMSTAT'=CLMSTAT W !,CLMSTAT S OCLMSTAT=CLMSTAT
 . ;
 . ; If the status is not IN PROGRESS, then we are done
 . I CLMSTAT'["IN PROGRESS" S BPQ=1
 W !
 ;
 ; Log messages to developer log
 D LOG^BPSNCPDP($T(+0)_" - After Status Loop")
 Q
 ;
 ; Bulletin to the OPECC
BULL(RXI,RXR,SITE,DFN,PATNAME) ;
 N BTXT,XMSUB,XMY,XMTEXT,XMDUZ
 N SSN,X,SITENM
 I $G(SITE) S SITENM=$P($G(^PS(59,SITE,0)),U)
 I $G(DFN) D
 . S X=$P($G(^DPT(DFN,0)),U,9)
 . S SSN=$E(X,$L(X)-3,$L(X))
 ;
 ; Need to do in the background
 ;   Mailman calls CMOP which calls EN^BPSNCPDP.
 ;   If BPSNCPDP* (same process) then calls mailman, it gets confused.
 N ZTIO,ZTRTN,ZTDTH,ZTSAVE,ZTDESC
 N %,%H,%I,X
 D NOW^%DTC
 S ZTIO="",ZTDTH=%,ZTDESC="IN PROGRESS BULLETIN"
 S ZTSAVE("RXR")="",ZTSAVE("RXI")=""
 S ZTSAVE("SITENM")="",ZTSAVE("PATNAME")=""
 S ZTSAVE("SSN")=""
 S ZTRTN="BULL1^BPSNCPD1"
 D ^%ZTLOAD
 Q
 ;
BULL1 ;
 S XMSUB="RX not processed for site "_$G(SITENM)
 S BTXT(1)="Prescription "_$P(^PSRX(RXI,0),"^",1)_" and fill number "_+RXR_" could "
 S BTXT(1)=BTXT(1)_"not be processed because the "
 S BTXT(2)="previous request was in progress.  There may have been a delay in processing "
 S BTXT(3)="of the previous claim or the previous claim may be stranded."
 S BTXT(4)=""
 S BTXT(5)="For more information on this prescription's activity, please view the "
 S BTXT(6)="ECME log within the View Prescription (VP) option on the Further Research (FR) "
 S BTXT(7)="menu of the ECME user screen."
 S BTXT(8)=""
 S BTXT(9)="Patient Name: "_$G(PATNAME)
 S BTXT(10)="Last four digits of SSN: "_$G(SSN)
 S BTXT(11)=""
 ;
 S XMDUZ="BPS PACKAGE",XMTEXT="BTXT("
 S XMY("G.BPS OPECC")=""
 I $G(DUZ)'<1 S XMY(DUZ)=""
 D ^XMD
 Q
