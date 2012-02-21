BPSBUTL ;BHAM ISC/MFR/VA/DLF - IB Communication Utilities ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;Reference to ^PSRX supported by DBIA 1977
 ;Reference to STORESP^IBNCPDP supported by DBIA 4299
 ;Reference to ^DG(40.8,"AD" supported by DBIA 2817
 ;----------------------------------------------------------------------
CLOSE(CLAIM,TRNDX,REASON,PAPER,RELCOP,COMMENT,ERROR) ; Send IB an update on the CLAIM status for a Closed Claim
 N DFN,IBARY,BILLNUM,CLAIMNFO,RXINFO,RFINFO,TRANINFO
 ;
 ; - Data gathering
 D GETS^DIQ("9002313.59",TRNDX,"1.11;9","I","TRANINFO")
 S RXIEN=TRANINFO(9002313.59,TRNDX_",",1.11,"I")
 I '$D(^PSRX(RXIEN,0)) S ERROR="Prescription not found." Q
 S IBARY("FILL NUMBER")=TRANINFO(9002313.59,TRNDX_",",9,"I")
 D GETS^DIQ("9002313.02",CLAIM,"400*;401;402;403;426","","CLAIMNFO")
 S IBARY("FILL DATE")=$$EXT2FM^BPSOSU1(CLAIMNFO("9002313.0201","1,"_CLAIM_",","401"))
 D GETS^DIQ("52",RXIEN,".01;4;6;8;7;16;27","IE","RXINFO")
 S FILLNUM=+IBARY("FILL NUMBER") I FILLNUM>0 D GETS^DIQ("52.1",FILLNUM_","_RXIEN,".01;1;1.1;11","","RFINFO")
 S DFN=$P(^PSRX(RXIEN,0),"^",2)
 S IBARY("FILLED BY")=RXINFO(52,RXIEN_",",16,"I"),IBARY("PRESCRIPTION")=RXIEN
 S IBARY("BILLED")=$$DFF2EXT^BPSECFM($P(CLAIMNFO("9002313.0201","1,"_CLAIM_",","426"),"DQ",2))
 S IBARY("CLAIMID")=$P(CLAIMNFO("9002313.0201","1,"_CLAIM_",","402"),"D2",2)
 S IBARY("PLAN")=$P(^BPST(TRNDX,10,1,0),"^"),IBARY("STATUS")="CLOSED",IBARY("PAID")=0
 S IBARY("RELEASE DATE")=$S(FILLNUM=0:$P(^PSRX(RXIEN,2),"^",13),1:$P($G(^PSRX(RXIEN,1,FILLNUM,0)),"^",18))
 S IBARY("DIVISION")=$$MCDIV(RXIEN,FILLNUM),IBARY("USER")=DUZ
 I REASON'="" D
 . S IBARY("CLOSE REASON")=$O(^IBE(356.8,"B",REASON,0))
 . S IBARY("DROP TO PAPER")=+$G(PAPER)
 . S IBARY("RELEASE COPAY")=+$G(RELCOP)
 I $G(COMMENT)]"" S IBARY("CLOSE COMMENT")=COMMENT
 ;
 S BILLNUM=$$STORESP^IBNCPDP(DFN,.IBARY)
 Q
 ; Send IB an update on the CLAIM status for a restocked or deleted prescription
CLOSE2(RXIEN,BFILL,BWHERE) ;
 N IEN59,IBARY,DFN,BILLNUM,FILL,REASON
 N CLAIMNFO,RXINFO,RFINFO
 N DIE,DA,DR
 ;
 ; Check parameters
 I '$G(RXIEN) S ERROR="No prescription parameter" Q
 I '$D(^PSRX(RXIEN,0)) S ERROR="Prescription not found." Q
 I ",DDED,DE,RS,"'[(","_BWHERE_",") S ERROR="Invalid BWHERE parameter" Q
 ;
 ; Calculate the transaction IEN and see that it exists
 S FILL=".0000"_+BFILL
 S IEN59=RXIEN_"."_$E(FILL,$L(FILL)-3,$L(FILL))_"1"
 I '$D(^BPST(IEN59,0)) Q
 ;
 ; Get claim data
 S CLAIM=$P(^BPST(IEN59,0),"^",4)
 D GETS^DIQ("9002313.02",CLAIM,"400*;401;402;426","","CLAIMNFO")
 S IBARY("FILL NUMBER")=+BFILL
 S IBARY("FILL DATE")=$$EXT2FM^BPSOSU1(CLAIMNFO("9002313.0201","1,"_CLAIM_",","401"))
 ;
 ; Get prescription data
 D GETS^DIQ("52",RXIEN,".01;4;6;8;7;16;27","IE","RXINFO")
 S FILLNUM=IBARY("FILL NUMBER")
 I FILLNUM>0 D GETS^DIQ("52.1",FILLNUM_","_RXIEN,".01;1;1.1;11","","RFINFO")
 S DFN=$P(^PSRX(RXIEN,0),"^",2)
 S IBARY("FILLED BY")=RXINFO(52,RXIEN_",",16,"I"),IBARY("PRESCRIPTION")=RXIEN
 S IBARY("BILLED")=$$DFF2EXT^BPSECFM($P(CLAIMNFO("9002313.0201","1,"_CLAIM_",","426"),"DQ",2))
 S IBARY("CLAIMID")=$P(CLAIMNFO("9002313.0201","1,"_CLAIM_",","402"),"D2",2)
 S IBARY("PLAN")=$P(^BPST(IEN59,10,1,0),"^"),IBARY("STATUS")="CLOSED",IBARY("PAID")=0
 S IBARY("RELEASE DATE")=$S(FILLNUM=0:$P(^PSRX(RXIEN,2),"^",13),1:$P($G(^PSRX(RXIEN,1,FILLNUM,0)),"^",18))
 ;
 ; Determine the reversal reason based on the BWHERE value
 I BWHERE="RS" S REASON="PRESCRIPTION NOT RELEASED"
 I BWHERE="DE"!(BWHERE="DDED") S REASON="PRESCRIPTION DELETED"
 I REASON]"" S IBARY("CLOSE REASON")=$O(^IBE(356.8,"B",REASON,0))
 ;
 ;if a refill was deleted while RX is still active (not deleted) then send DELETION OF REFILL comment for CT record
 I BWHERE="DE",$$RXSTATUS^BPSSCRU2(RXIEN,0)'=13 S IBARY("CLOSE COMMENT")="DELETION OF REFILL ONLY - ORIGINAL RX MAY REMAIN ACTIVE"
 ;
 ; Miscellaneous values
 S IBARY("DIVISION")=$$MCDIV(RXIEN,FILLNUM),IBARY("USER")=.5
 ;
 ; Update IB
 S BILLNUM=$$STORESP^IBNCPDP(DFN,.IBARY)
 ;
 ; Update the claim file that the claim is closed and the reason why.
 S DIE="^BPSC(",DA=CLAIM
 S DR="901///1;902///"_$$NOW^XLFDT()_";903///.5;904///"_IBARY("CLOSE REASON")
 D ^DIE
 Q
 ;
 ; Function to return Transaction, claim, and response IENs
 ; Parameters:
 ;    RXI: Prescription IEN
 ;    RXR: Fill Number
 ; Returns:
 ;    IEN59^Claim IEN^Response IEN^Reversal Claim IEN^Reversal Response IEN
CLAIM(RXI,RXR) ;
 N IEN59,CLAIMIEN,RESPIEN,REVCLAIM,REVRESP
 I '$G(RXI) Q
 S IEN59=$$IEN59^BPSOSRX(RXI,RXR)
 I '$D(^BPST(IEN59,0)) Q ""
 S CLAIMIEN=$P(^BPST(IEN59,0),"^",4),RESPIEN=$P(^BPST(IEN59,0),"^",5)
 S REVCLAIM=$P($G(^BPST(IEN59,4)),"^",1),REVRESP=$P($G(^BPST(IEN59,4)),"^",2)
 Q IEN59_U_CLAIMIEN_U_RESPIEN_U_REVCLAIM_U_REVRESP
 ;
NABP(RXP,BFILL) ;
 N BPSTIEN,BPSCIEN,DFILL,NABP
 S DFILL=$E($TR($J("",4-$L(BFILL))," ","0")_BFILL,1,4)
 S BPSTIEN=RXP_"."_DFILL_"1"
 I 'BPSTIEN Q 0
 S BPSCIEN=$P($G(^BPST(BPSTIEN,0)),U,4)
 I 'BPSCIEN Q 0
 S NABP=$P($G(^BPSC(BPSCIEN,200)),U)
 Q NABP
 ;
 ;MC Division for the IB
MCDIV(RXIEN,FILLNUM) ; Get MC DIVISION from the Rx/Fill
 N BPSDIV,BINST,BMCDIV
 ; outpatient division
 I 'FILLNUM S BPSDIV=+$P($G(^PSRX(RXIEN,2)),U,9)
 E  S BPSDIV=+$P($G(^PSRX(RXIEN,1,FILLNUM,0)),U,9)
 I 'BPSDIV Q ""
 ; related institution
 S BINST=+$P($G(^PS(59,BPSDIV,"INI")),U) Q:'BINST ""
 S BMCDIV=$O(^DG(40.8,"AD",BINST,0)) ; medical center division
 Q BMCDIV
 ;
 ; DIVNABP - Get NABP/NCPDP number for a specific outpatient site
 ; Input
 ;   ABSBPDIV - Outpatient Site
 ; Output
 ;   "" - No BPS Pharmacies or no NABP/NCPDP number found
 ;   NABP/NCPCP number 
DIVNCPDP(ABSBPDIV) ;
 N BPSHARM,NABP,ABSBSDIV
 I '$G(ABSBPDIV) Q ""
 S NABP="",ABSBSDIV=1
 ; GETPHARM expects ABSBPDIV and ABSBSDIV to be set
 ; Returns BPSHARM (BPS Pharmacy IEN)
 D GETPHARM^BPSOSQC
 I BPSHARM'=0 S NABP=$$GET1^DIQ(9002313.56,BPSHARM_",",.02)
 Q NABP
 ;
 ;ADDCOMM - Add a comment to a ECME claim
 ;Input:
 ; BPRX - ien in file #52 or external RX# (see BPMODE)
 ; BPREF - refill number (0,1,2,...)
 ; BPRCMNT - comment text 
 ; BPMODE - 1 if external RX#, 0 if ien of #52
 ;Output:
 ;  1 - okay
 ; -1 - failed
ADDCOMM(BPRX,BPREF,BPRCMNT,BPMODE) ;*/
 N BP59,BPNOW,BPLCK,BPREC,BPDA,BPERR
 N %,%H,%I,X
 I $L(BPRX)<1 Q -1
 I $G(BPMODE) S BPRX=+$O(^PSRX("B",BPRX,0)) I +BPRX=0 Q -1
 I $G(BPRCMNT)="" Q -1
 S BP59=BPRX_$S($L(+BPREF)=1:".000",1:".00")_+BPREF_"1" ;borrowed from CLOSE2 above
 D NOW^%DTC
 S BPNOW=%
 L +^BPST(9002313.59111,+BP59):10
 S BPLCK=$T
 I 'BPLCK Q -1  ;quit
 D INSITEM^BPSCMT01(9002313.59111,+BP59,BPNOW)
 S BPREC=$O(^BPST(BP59,11,"B",BPNOW,0))
 I BPREC>0 D
 . S BPDA(9002313.59111,BPREC_","_BP59_",",.02)=+$G(DUZ)
 . S BPDA(9002313.59111,BPREC_","_BP59_",",.03)=$G(BPRCMNT)
 . D FILE^DIE("","BPDA","BPERR")
 I BPLCK L -^BPST(9002313.59111,+BP59)
 I BPREC>0,'$D(BPERR) Q 1
 Q -1
