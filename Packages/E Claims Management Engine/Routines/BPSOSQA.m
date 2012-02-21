BPSOSQA ;BHAM ISC/FCS/DRS/DLF - ECME background, Part 1 ;06/02/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;External reference private DBIA 4302
 Q
ONE59 ;EP - from BPSOSQ1
 ; Process this one IEN59 (was status 0, now status 10)
 ; MODULO also comes in from BPSOSQ1
 ; MODULO,COUNT,ERROR were NEW'ed in BPSOSQ1
 ;
 I '$P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) S VARX=1
 S ERROR=0
 N X S X=^BPST(IEN59,1)
 N ABSBRXR,ABSBNDC,ABSBRXI
 S ABSBRXR=$P(X,U),ABSBNDC=$P(X,U,2),ABSBRXI=$P(X,U,11)
 I '$D(^PSRX(ABSBRXI,0)) S ERROR=101 G ERRJOIN
 I ABSBRXR,'$D(^PSRX(ABSBRXI,1,ABSBRXR,0)) S ERROR=102 G ERRJOIN
 D LOG^BPSOSL("Gathering information - program BPSOSQA")
 ;
 I $E(IEN59,$L(IEN59))=1 D  ; if it's a prescription claim,
 . I 'ABSBNDC S ABSBNDC=$$GETNDC^PSONDCUT(ABSBRXI,ABSBRXR)
 S ERROR=$$CLAIMINF^BPSOSQB ; set up lots of info about this claim ;lje;6/16/03
 I ERROR G ERRJOIN
 ; Check for insurance
 I '$D(^BPST(IEN59,10,1,0)) S ERROR=103 D BULL G ERRJOIN
 ;
 ; After setting up the extra info, update the status
 ; Change status to 30 to say "Ready to be put into a trasmit. packet"
 ;
 ; Check if the drug is billable
 ;
 N INSIEN,DRUGIEN,NDCNUM,BILLABLE
 S INSIEN=$P(^BPST(IEN59,1),U,6)
 S DRUGIEN=$P(^PSRX(ABSBRXI,0),U,6)
 S NDCNUM=$P(^BPST(IEN59,1),U,2)
 ;
ERRJOIN I ERROR D
 . D SETSTAT(99)
 . N ERRTEXT
 . I ERROR=12 S ERRTEXT="PCC Link problem during visit lookup"
 . E  I ERROR=13 S ERRTEXT="Patient missing from BPS Transaction"
 . E  I ERROR=14 S ERRTEXT="Unable to determine Outpatient Site"
 . E  I ERROR=15 S ERRTEXT="Unable to link to a BPS Pharmacy"
 . E  I ERROR=101 S ERRTEXT="Missing PSRX("_ABSBRXI_",0)"
 . E  I ERROR=102 S ERRTEXT="Missing PSRX("_ABSBRXI_",1,"_ABSBRXR_",0)"
 . E  I ERROR=103 S ERRTEXT="Missing Insurance in BPST("_IEN59_",10,1,0)"
 . E  S ERRTEXT="ERROR - see LOG"
 . D SETRESU2(ERROR,ERRTEXT)
 . D LOG^BPSOSL($T(+0)_" returned error - "_ERRTEXT)
 . D INCSTAT^BPSOSUD("R",1) ; count how many Unbillable
 E  I '$$BILLABLE D  ; the prescription/fill is marked as Manual bill
 . D SETSTAT(99)
 . D SETRESU2(1,"Prescription is marked for Manual Bill")
 . D INCSTAT^BPSOSUD("R",1) ; count how many Unbillable
 E  S BILLABLE=$$BILLABLE^BPSOSQQ(INSIEN,DRUGIEN,NDCNUM) I 'BILLABLE D
 . D LOG^BPSOSL($P(BILLABLE,U,2))
 . I $$BUMPINS(IEN59) D  ; bump to next insurer
 . . ; loop will pick up this claim again; don't need to task anything
 . E  D  ; no more insurers
 . . D SETRESU2(1,"Unbillable to ins.; "_$$ELGBEN_"; "_$P(BILLABLE,U,2))
 . D INCSTAT^BPSOSUD("R",1) ; count how many Unbillable
 E  I $$PAPER D
 . D SETSTAT(99)
 . N X,Y
 . S X=$P(^BPST(IEN59,1),U,6)
 . S Y=""
 . I Y="SELF PAY"!(Y="") D
 . . S X="No insurance,"_$$ELGBEN
 . E  S X="Paper claim "
 . D SETRESU2(1,X) ; or statement or writeoff, to be det.
 . D LOG^BPSOSL(X)
 . D INCSTAT^BPSOSUD("R",1) ; count how many Unbillable
 E  D  ; it's an electronic claim
 . N STAT S STAT=30 ; new status will be 30 usually, or maybe 99 or 19
 . I $P($G(^BPS(9002313.99,1,"SPECIAL")),U) D
 . . ; The special Oklahoma Medicaid rule is in effect
 . . ; so hold Oklahoma Medicaid prescriptions a little longer
 . . N INS S INS=$P(^BPST(IEN59,7),U)
 . . I INS=$P(^BPS(9002313.99,1,"SPECIAL"),U) S STAT=19
 . D SETSTAT^BPSOSQ1(STAT)
 ;
 ; Every so often, start up a packeter.
 ; We hope that for patients with many prescriptions,
 ; they'll be bundled into single packets.
 ;
 I COUNT#MODULO=0 D PACKETER^BPSOSQ1 ; start one up every Nth claim 
 ;
 Q
ELGBEN() ; construct ELG_","_BEN string ; given IEN59
 N BEN,ELG,Y,I,X
 S X=$P(^BPST(IEN59,0),U,6)
 I X="1^C"!(X="1^D") Q "Native ben."
 S BEN=$P(X,U),ELG=$P(X,U,2)
 Q ELG_","_BEN
BUMPINS(IEN59) ;EP - BPSOSQS
 ; bump up to the next insurer
 ; When you call this, be sure you have the logging slot set to
 ; the current prescription.
 N INSIEN,MSG,PINPIECE,OLDINS ; return value is next insurer
 S PINPIECE=$P(^BPST(IEN59,1),U,8)+1
 I PINPIECE>$L($G(^BPST(IEN59,6)),U) S INSIEN=0
 E  S INSIEN=$P(^BPST(IEN59,7),U,PINPIECE)
 S OLDINS=$P(^BPST(IEN59,1),U,6)
 I 'OLDINS Q 0 ; we were already at the "no insurance" case
 S $P(^BPST(IEN59,1),U,6)=INSIEN
 S $P(^BPST(IEN59,1),U,8)=PINPIECE
 I INSIEN D
 . S MSG="Bump from insurer "_$$INSNAME(OLDINS)_" to "_$$INSNAME(INSIEN)
 . I '$P(^BPST(IEN59,5),U,6) D  ; if price autocalc'd,
 . . K ^BPST(IEN59,5) ; delete old insurer's pricing
 . D SETSTAT^BPSOSQ1(0) ; recompute the claim
 E  D
 . D SETSTAT^BPSOSQ1(99) ; processing has gone as far as it can
 . S MSG="Insurer "_$$INSNAME(OLDINS)_" was the last one."
 D LOG^BPSOSL(MSG)
 Q INSIEN
INSNAME(N)         I 'N Q "(no more insurances)"
 Q 0
BILLABLE()         ; per field 9999999.07 ; only at Pawhuska in the beginning
 N RESULT
 I ABSBRXR S RESULT=$P($G(^PSRX(ABSBRXI,1,ABSBRXR,9999999)),U,7)
 E  S RESULT=$P($G(^PSRX(ABSBRXI,9999999)),U,7)
 I RESULT="" S RESULT=1 ; default to billable
 I 'RESULT D  ; Manual Bill is indicated in prescription file.
 . N X S X=$P(^BPST(IEN59,0),U,14) ; ORIGIN
 . I X=2!(X=3) S RESULT="1^Manual input, okay" Q
 . S RESULT="0^Manual Bill is indicated in prescription file."
 Q RESULT
FLAG23(INS,VAL) ; change field .23 of ^AUTNINS to appropriate value if needed
 ; A recent patch issued by (who? 3PBilling?) has a "P" value they want
 N CUR
 I VAL="P" S VAL="" ; not likely to occur in current system
 I CUR=VAL Q  ; already set the value we want
 I CUR="U" Q  ; currently set to Unbillable for drugs? Can't be.
 N FDA,MSG ; okay, we're going to change it
 S FDA(9999999.18,INS_",",.23)=VAL
F23A D FILE^DIE(,"FDA","MSG")
 Q:'$D(MSG)  ; success
 D ZWRITE^BPSOS("FDA","MSG")
 G F23A:$$IMPOSS^BPSOSUE("FM","TRI","FILE^DIE failed",,"FLAG23",$T(+0))
 Q
PAPER() ; Return TRUE if this has to be sent as a paper claim.
 ; Also take care of the ^AUTNINS field .23 flag "P" value
 I '$P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) Q 0    ;LJE;6/25/03
 N INSURER,FORMAT,ACTDATE,FLAG23
 S INSURER=+$P($G(^BPST(IEN59,1)),U,6)
 I INSURER D
 . S FORMAT=$P($G(^BPSEI(INSURER,100)),U)
 . S ACTDATE=$P($G(^BPSEI(INSURER,100)),U,3)
 E  S (FORMAT,ACTDATE,FLAG23)=""
 I FORMAT,ACTDATE'>DT D  ; yes, this insurer is billed electronically
 . D FLAG23(INSURER,"P")
 E  D
 . Q:'INSURER  ; uninsured
 . D FLAG23(INSURER,"")
 I 'FORMAT Q 1 ; not an electronic insurer
 I ACTDATE>DT Q 1 ; not activated until some future date
 ; Looks like it's electronic but 
 ; test some more (maybe electronic for presc. but paper for postage)
 G @("PAPER"_$$TYPE^BPSOSQ)
PAPER1 ; prescription
 N P S P=$P(^BPST(IEN59,5),U,5) ; price
 I P>0,P<10000 Q 0  ; make sure positive, and < $10000 (6 digits limit)
 Q 1  ; otherwise, must go via paper
PAPER2 ; postage - depends on insurer and amount
 N X S X=$G(^BPSEI(INSURER,102))
 I X="" Q 1  ; doesn't handle postage, must send by paper
 I '$$RXI^BPSOSQ,'$P(X,U,3) Q 1  ; supplies postage not allowed in POS
 N AMT S AMT=$$AMT^BPSOSQ
 I $P(X,U,2)]"",AMT>$P(X,U,2) Q 1  ; exceeds maximum postage amount
 Q 0  ; meets requirements for ECME billing
PAPER3 ;
 N X S X=$G(^BPSEI(INSURER,103))
 I X="" Q 1  ; doesn't handle supplies, must send by paper
 Q 0  ; does handle supplies (as of 06/21/2000, we know of none that do)
SETSTAT(X)         D SETSTAT^BPSOSQ1(X) Q
SETRESU(RESCODE)   ;
 N ABSBRXI S ABSBRXI=IEN59 ; unfortunate variable name convention
 D SETRESU^BPSOSU(RESCODE) ;
 Q
SETRESU2(RESCODE,RESTEXT)    ;
 N ABSBRXI S ABSBRXI=IEN59 ; unfortunate variable name convention
 D SETRESU^BPSOSU(RESCODE,RESTEXT)
 Q
BULL ;Bulletin to the OPECC
 N XMSUB,XMY,XMTEXT,XMDUZ,BLNUM,TXT,TRXI
 ;
 S BLNUM=0
 S TRXI=$P(ABSBRXI,".")
 S XMSUB="ECME INSURANCE MISSING"
 S TXT="The insurance information is missing for prescription: "_$P(^PSRX(TRXI,0),"^",1)
 D T(TXT)
 D T()
 ;
 S XMDUZ="BPS PACKAGE",XMTEXT="BTX("
 S XMY("G.BPS OPECC")=""
 I $G(DUZ)'<1 S XMY(DUZ)=""
 D ^XMD
 Q
T(BTXT) ; Add text to the message
 ;PUBLIC BLNUM,BTEST
 S BLNUM=BLNUM+1,BTX(BLNUM)=$G(BTXT," ")
 I $G(BTEST) W !,$G(BTXT)
 Q
