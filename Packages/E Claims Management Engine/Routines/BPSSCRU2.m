BPSSCRU2 ;BHAM ISC/SS - ECME SCREEN UTILITIES ;05-APR-05
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;; Per VHA Directive 10-93-142, this routine should not be modified.
 ;USER SCREEN
 Q
 ;/**
 ;Input:
 ; BP59 - pointer to file #9002313.59
 ;Output:
 ;get filling "location" like "WINDOW/LOCALMAIL/CMOP"
GETMWC(BP59) ;*/
 N BP1 S BP1=$$RXREF(BP59)
 Q:+BP1=0 ""
 Q $$MWC($P(BP1,U),$P(BP1,U,2))
 ;
 ;converts numbers to letters to display on the screen
 ;2-MAIL/3-WINDOW/4-CMOP
MWCNAME(BPMWC) ;
 Q $S(BPMWC=2:"M",BPMWC=3:"W",BPMWC=4:"C",1:"?")
 ;/**
 ;Input:
 ; BP59 - pointer to file #9002313.59
 ;Output:
 ;get RX pointer in file #52 and refill number in its multiple (0 - original refill)
RXREF(BP59) ;
 N BPRX,BPREF
 S BPRX=+$P($G(^BPST(BP59,1)),U,11) ;ptr to RX node in #52
 S BPREF=+$P($G(^BPST(BP59,1)),U) ;ptr to refill multiple in #52
 Q BPRX_U_BPREF
 ; determines if the refill was MAIL/WINDOW/CMOP
MWC(BPRX,BPREF) ;MAIL/WINDOW/CMOP
 ;input:
 ; BPRX ptr to #52 (RX)
 ; BPREF ptr to #52.1 (refills)
 ;return value:
 ; 2-MAIL/3-WINDOW/4-CMOP
 N BPX,BPY,BPZ S BPY=2
 ;if 1st fill check #52 (#11) MAIL/WINDOW
 I BPREF=0 S BPX=$P($G(^PSRX(BPRX,0)),U,11)
 ;if refill check refills multiple #52.1 (#2) MAIL/WINDOW
 E  S BPX=$P($G(^PSRX(BPRX,1,BPREF,0)),U,2)
 ; if WINDOW then 3(W)
 I BPX="W" Q 3
 ; else
 ;  check STATUS of RX
 ;  if STATUS="SUSPENSE" check 
 I $G(^PSRX(BPRX,"STA"))=5 D  Q BPY
 . ;   check #52.5
 . S BPX=$O(^PS(52.5,"B",BPRX,0))
 . ;   if CMOP INDICATOR = "P" then 2 (M)
 . S BPZ=$P($G(^PS(52.5,BPX,0)),U,7)
 . I (BPZ="")!(BPZ="P") S BPY=2 Q
 . ;   else (i.e. Q!X!L) 4(C)
 . S BPY=4
 ;  else 
 ;  check CMOP EVENTS for this 0 fill
 S BPY=2
 S BPX=0 F  S BPX=$O(^PSRX(BPRX,4,BPX)) Q:+BPX=0!(BPY=4)  D
 . ;  if exists for BPREF then 4("C")
 . I $P($G(^PSRX(BPRX,4,BPX,0)),U,3)=BPREF S BPY=4
 ;  else 2("M")
 Q BPY
 ;
 ;
 ;/**
 ;Input:
 ; BP59 - pointer to file #9002313.59
 ;Output:
 ; insurance ien ^ name ^ phone
GETINSUR(BP59) ;get insurance info by the pointer of #9002313.59
 N BPHONE,BPINSNM,BPINSID,BP57,BPINSN,BPX
 S BPX=$$NAMEPHON^BPSSCRU3(BP59)
 S BPINSNM=$P(BPX,U,1)
 S BPHONE=$P(BPX,U,2)
 ;Get a temporary ID for the insurance from ^TMP list of insurances.
 ;If doesn't exist yet then create a new record in ^TMP list of insurances 
 ;   for this insurance and return the ID for the record.
 ;A lifetime for ^TMP list of insurances is the time period the user is using 
 ;   the User Screen menu option
 S BPINSID=$$CHKINSUR^BPSSCR(BPINSNM,BPHONE)
 I $L(BPHONE)=0 S BPHONE=" "
 I $L(BPINSNM)=0 S BPINSNM="?NODATA?"
 Q BPINSID_U_BPINSNM_U_BPHONE
 ;
 ;/**
 ;Input:
 ; BP59 - pointer to file #9002313.59
 ;Output:
 ;transaction date
TRANDT(BP59) ;
 Q $P($G(^BPST(BP59,0)),U,8)\1
 ;
 ;/**
 ;Input:
 ; BP59 - pointer to file #9002313.59
 ;Output:
 ;ECME pharmacy division (9002313.56)
DIVIS(BP59) ;
 Q $P($G(^BPST(BP59,1)),U,7)
 ;
 ;/**
 ;Input:
 ; BP59 - pointer to file #9002313.59
 ;Output:
 ;patient's DFN (file #2)
GETPATID(BP59) ;
 Q $P($G(^BPST(BP59,0)),U,6)
 ;
 ;/**
 ;determines if the RX is active 
 ;Input:
 ; BP59 - pointer to file #9002313.59
 ;Output:
 ;Active (returns 1) means : ACTIVE/NON-VERIFIED/REFILL/HOLD/DRUG INTERACTIONS/SUSPENDED
 ;inactive (returns 0) means: Discontinued/deleted/expired
 ;error (returns -1)
ACTIVERX(BP59) ;
 Q $$RXACTIVE($$RXSTATUS(+$$RXREF(BP59),0))
 ;return RX status as ACT/DIS/etc
RXST(BP59) ;
 N BPRXREF
 S BPRXREF=$$RXREF^BPSSCRU2(BP59)
 ;display status ONLY if the refill is the most recent 
 ;otherwise display blanks (three spaces for sorting purposes)
 I +$P(BPRXREF,U,2)'=(+$$LSTRFL^PSOBPSU1(+$P(BPRXREF,U,1))) Q "***"
 Q $$RXSTANAM($$RXSTATUS(+$P(BPRXREF,U,1),0))
 ;/**
 ;RX status
 ;Input 
 ; RXNUM:
 ;  ien of file #52 (if MODE=0) 
 ;  or RX number (if MODE=1)
 ; MODE:
 ;  0-ien of file #52
 ;  1-RX number  
 ;----------
 ;Output:
 ; 0    if not found
 ; status set#
RXSTATUS(RXNUM,MODE) ;*/
 I $G(MODE) S RXNUM=$O(^PSRX("B",RXNUM,0)) I +RXNUM=0 Q -1
 I '$D(^PSRX(RXNUM,"STA")) Q -1
 Q $G(^PSRX(RXNUM,"STA"))
 ;/**
 ;if RX "valid" 
RXACTIVE(BPRXSTAT) ;*/
 ; 0    not valid
 ; 1    valid (i.e. ACTIVE/NON-VERIFIED/REFILL/HOLD/DRUG INTERACTIONS/SUSPENDED) 
 ; -1   doesn't exist
 Q:BPRXSTAT<6 1  ;active
 ;/**
 ;RX status text
RXSTANAM(BPRXSTAT) ;*/
 Q:BPRXSTAT=0 "ACT"  ; ACTIVE; 
 Q:BPRXSTAT=1 "NVER"  ; NON-VERIFIED; 
 Q:BPRXSTAT=3 "HLD"  ; HOLD; 
 Q:BPRXSTAT=5 "SUS"  ; SUSPENDED; 
 Q:BPRXSTAT=11 "EXP"  ; EXPIRED; 
 Q:BPRXSTAT=12 "DIS"  ; DISCONTINUED; 
 Q:BPRXSTAT=13 "DEL"  ; DELETED; 
 Q:BPRXSTAT=14 "DIS"  ; DISCONTINUED BY PROVIDER; 
 Q:BPRXSTAT=15 "DIS"  ; DISCONTINUED (EDIT); 
 Q:BPRXSTAT=16 "HLD"  ; PROVIDER HOLD; 
 Q:BPRXSTAT=-1 "???"
 Q ""
 ;/**
 ;Input:
 ; BP59 - pointer to file #9002313.59
 ;Output:
 ;returns:
 ;>0  Released
 ;0   non released
 ;-1  error
ISRXREL(BP59) ;
 N BP1
 S BP1=$$REFILINF(BP59)
 Q:BP1<0 -1
 Q $P(BP1,U,2) ; i.e. it is non-released if there is no any release date
 ;
 ;release status
RL(BP59) ;
 Q $S($$ISRXREL(BP59)>0:"RL",1:"NR")
 ;/**
 ;get refill (including original refill) info by BP59
 ;Input:
 ; BP59 - pointer to file #9002313.59
 ;Output:
 ;returns:
 ;on error : "-1"  
 ;on success : refill# ^ release date ^label print date ^ fill date ^ issue date
REFILINF(BP59) ;*/
 N BP1 S BP1=$$RXREF(BP59)
 N BPRX S BPRX=$P(BP1,U,1) ;ptr to #52
 N BPREF S BPREF=$P(BP1,U,2) ;ptr in its refill multiple
 I BPREF,$$IFREFILL(BPRX,BPREF)=0 Q -1  ;if bad data
 ;original refill
 I BPREF=0 Q "0"_U_$$RXRELDT(BPRX)_U_$$RXLBLDT(BPRX,1)_U_$$RXFILDT(BPRX)_U_$$RXISSDT(BPRX)
 ;refill's release date
 I BPREF>0 Q BPREF_U_$$REFRELDT(BPRX,BPREF)_U_$$REFLBLDT(BPRX,1)_U_$$REFFILDT(BPRX,BPREF)_U_$$REFISSDT(BPRX,BPREF)
 Q -1
 ;
 ;-Prescriptions-----------------------
 ;RX issue date
RXISSDT(BPRX) ;
 Q +$P($G(^PSRX(BPRX,0)),U,13)
 ;
 ;RX's release date
RXRELDT(BPRX) ;
 Q +$P($G(^PSRX(BPRX,2)),U,13)
 ;
 ;RX's fill date
RXFILDT(BPRX) ;
 Q +$P($G(^PSRX(BPRX,2)),U,2)
 ;
 ;get label date for RX,
RXLBLDT(BPRX,BPDIR) ;
 ;BPDIR=0 - the first
 ;BPDIR=1 - the last
 N BPRET
 I BPDIR=0 S BPRET=$O(^PSRX(BPRX,"L",0))
 I BPDIR=1 S BPRET=$O(^PSRX(BPRX,"L",9999),-1)
 I BPRET S BPRET=$P($G(^PSRX(BPRX,"L",+BPRET,0)),U)\1
 Q BPRET
 ;
 ;-Refills -----------------------
 ;get label date for refills
REFLBLDT(BPRX,BPDIR) ;
 Q $$RXLBLDT(BPRX,BPDIR)
 ;
 ;refill's release date
REFRELDT(BPRX,BPREF) ;
 Q +$P($G(^PSRX(BPRX,1,BPREF,0)),U,18)
 ;
 ;refill's refill date
REFFILDT(BPRX,BPREF) ;
 Q +$P($G(^PSRX(BPRX,1,BPREF,0)),U)
 ;
 ;refill's issue date
REFISSDT(BPRX,BPREF) ;
 Q $$REFDISDT(BPRX,BPREF)
 ;
 ;refill's dispense date
REFDISDT(BPRX,BPREF) ;
 Q +$P($G(^PSRX(BPRX,1,BPREF,0)),U,19)
 ;
 ;if refill exists
IFREFILL(BPRX,BPREF) ;
 Q $D(^PSRX(BPRX,1,BPREF))>0
 ;/**
 ;Get shortened drug name concatenated with its IEN in file 50) for sorting
 ;
SORTDRUG(BP59) ;
 ;Get the name of the drug
 N BPRX S BPRX=+$$RXREF(BP59)
 N BPDRUG S BPDRUG=+$P($G(^PSRX(BPRX,0)),U,6) ;drug ptr to file #50
 N BPDRNAME S BPDRNAME=$P($G(^PSDRUG(BPDRUG,0)),U) ; drug name
 Q $E(BPDRNAME,1,10)_"-"_BPDRUG
 ;
 ;/**
 ;input 
 ;ptr to 9002313.59
 ;output :
 ; BB - back billing
 ; RT - all other values in (#1201) RX ACTION field on 9002313.59
RTBB(BP59) ;*/
 N BPTRBB
 S BPTRBB=$P($G(^BPST(BP59,12)),U)
 I BPTRBB="" Q "**"
 I BPTRBB="BB" Q "BB"
 Q "RT"
 ;
 ;------------ patient's name
PATNAME(BPDFN) ;
 Q $E($P($G(^DPT(BPDFN,0)),U),1,15)
 ;
SSN4(DFN) ;last 4 SSN
 N X
 S X=$P($G(^DPT(DFN,0)),U,9)
 Q "("_$E(X,$L(X)-3,$L(X))_")"
 ;
 ;get drug generic name
DRGNAM(BP50) ;
 ;BP50 - ptr to #50
 Q $E($P($G(^PSDRUG(BP50,0)),U),1,35)
 ;get drug
GETDRUG(BP52,BPREFN) ;
 ;return value:
 ; 0 - unknown
 ; n - ptr to DRUG file #50
 Q +$P($G(^PSRX(BP52,0)),U,6)
 ;
GETDRG59(BP59) ;
 N BPX
 S BPX=$$RXREF(BP59)
 Q $$GETDRUG(+BPX,$P(BPX,U,2))
 ;
 ;
 ;review %% for each of claims in the array 
 ;and calculate "overall" "done" status
 ;input:
 ; BPARR59 - array of ptr to #9002313.59
 ;output:
 ; status
FINISHST(BPARR59) ;
 N BPFIN,BP59
 S BPFIN=1,BP59=0
 F  S BP59=$O(BPARR59(BP59)) Q:+BP59=0  D  Q:BPFIN=0
 . I $$PRCNTG^BPSSCRU3(BP59)<99 S BPFIN=0
 I BPFIN=1 Q "**FINISHED**"
 Q ""
 ;
 ;/**
 ;BP59 - ptr to 9002313.59
 ;output :
 ;ECME number 
 ; 7 digits of the prescription IEN file 52
 ;or 7 spaces
ECMENUM(BP59) ;*/
 N X
 S X=$P($G(^BPST(BP59,0)),"^")
 I X="" Q $$FORMAT(X,7," ",1)
 Q $$FORMAT(X\1,7,"0",1)
 ;
 ;BPRX - ptr to #52
RXNUM(BPRX) ;
 Q $P($G(^PSRX(BPRX,0)),U)_$S($G(^PSRX(BPRX,"IB")):"$",1:"")
 ;
 ;/**
 ;get NDC
 ;input 
 ;BPRX - ptr to #52
 ;BPREF - refill # (0,1,2,3...)
NDC(BPRX,BPREF) ;*/
 Q $$GETNDC^PSONDCUT(BPRX,BPREF)
 ;
DRGNAME(BP59) ;drug name BP59 -ptr to .59 file
 N BPRX,BPREF
 S BPRX=+$P($G(^BPST(BP59,1)),U,11) ;ptr to RX node in #52
 S BPREF=+$P($G(^BPST(BP59,1)),U) ;ptr to refill multiple in #52
 Q $E($$DRGNAM^BPSSCRU2($$GETDRUG^BPSSCRU2(BPRX,BPREF)),1,23)
 ;
 ;is the number even?
 ;1-yes
 ;0 -no
ISEVEN(BPNUM) ;
 Q ((BPNUM/2)-(BPNUM\2))=0
 ;
 ;BPSTR - string to format
 ;BPSMLEN - max lenght
 ;BPSCHR - char to add
 ;BPSLFT - 1 - add from the left, 0 - from the right
FORMAT(BPSTR,BPSMLEN,BPSCHR,BPSLFT) ;
 N LN S LN=$L(BPSTR)
 N ZZ S ZZ=""
 I LN=BPSMLEN Q BPSTR
 I LN>BPSMLEN Q:BPSLFT $E(BPSTR,LN-BPSMLEN+1,9999) Q $E(BPSTR,1,BPSMLEN)
 S $P(ZZ,BPSCHR,BPSMLEN-LN+1)=""
 Q:BPSLFT ZZ_BPSTR
 Q BPSTR_ZZ
 ;
