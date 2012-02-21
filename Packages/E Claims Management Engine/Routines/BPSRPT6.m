BPSRPT6 ;BHAM ISC/BEE - ECME REPORTS ;14-FEB-05
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;; Per VHA Directive 10-93-142, this routine should not be modified.
 ;
 Q
 ;
 ;Get the Insurance Company pointer and name
 ;
 ; Returned Value -> ptr^Insurance Company Name
 ; 
INSNAM(BP59) N BPIN,BPDOS,BPDFN,BPSZZ,BP36,BPX
 ;
 ;Reset Insurance
 S BP36=""
 ;
 ;First Pull From BPS Transactions
 S BPIN=+$P($G(^BPST(BP59,9)),U)
 I +BPIN S BP36=$P($G(^BPST(BP59,10,BPIN,0)),U,7) S:BP36]"" BP36="1^"_BP36
 ;
 ;If Not Found, look up using API
 I BP36="" D
 .S BPDOS=+$P($G(^BPST(BP59,12)),U,2)\1
 .I BPDOS=0 S BPDOS=+$P($G(^BPST(BP59,0)),U,8)\1
 .S BPDFN=+$P($G(^BPST(BP59,0)),U,6)
 .S BPX=$$INSUR^IBBAPI(BPDFN,BPDOS,,.BPSZZ,"1")
 .S BP36=$G(BPSZZ("IBBAPI","INSUR",1,1))
 ;
 ;If Not Found, put in MISSING INSURANCE
 I $TR(BP36,U)="" S BP36=" ^**MISSING INSURANCE**"
 ;
 Q BP36
 ;
 ;Select an Insurance Company file entry (Fileman Lookup)
 ;
 ; Returned value -> Insurance Company Name
 ; 
SELINS() N INS
 S INS=$$SELINSUR^IBNCPDPI("Select Insurance","")
 I $P(INS,U)=-1 S INS="^"
 E  S INS=$P(INS,U,2)
 Q INS
 ;
 ;Get the drug name for display
 ;
 ; Input variable ->  BP50 - Lookup to DRUG (#50)
 ;                   BPLEN - Length of the display field
 ; Returned value -> Name of the drug
 ;        
DRGNAM(BP50,BPLEN) Q $E($P($G(^PSDRUG(+BP50,0)),U),1,BPLEN)
 ;
 ;Select a DRUG file entry (Fileman Lookup)
 ;
 ; Returned Variable -> Y
 ; 
SELDRG N DIC S DIC(0)="QEAM",DIC=50,DIC("A")="Select Drug: "
 D ^DIC
 Q
 ;
 ;Get the drug class for display
 ;
 ; Input variable -> BP50605 - Lookup to VA DRUG CLASS (#50.605)
 ;                   BPLEN - Length of the display field
 ; Returned value -> Name of the drug class
 ;                   
DRGCLNAM(BP50605,BPLEN) N IEN,Y
 K ^TMP($J,"L")
 S Y=""
 I BP50605]"" D 
 .D C^PSN50P65(BP50605,"","L")
 .S IEN=$O(^TMP($J,"L",0))
 .I IEN]"" S Y=$E($G(^TMP($J,"L",IEN,1)),1,BPLEN)
 K ^TMP($J,"L")
 Q Y
 ;
 ;Select a VA DRUG CLASS file entry (Fileman Lookup)
 ;
SELDRGC N DIR,DIRUT,DTOUT,DUOUT,IEN,TOT,X
 K ^TMP($J,"L")
 ;
 F  D  Q:Y]""
 .S DIR(0)="FO^1:35"
 .S DIR("A")="Select Drug Class"
 .S DIR("?")="Answer with VA DRUG CLASS CODE, or CLASSIFICATION. TYPE '??' FOR A LIST"
 .S DIR("??")="^D DCLIST^BPSRPT6"
 .D ^DIR
 .I ($G(DUOUT)=1)!($G(DTOUT)=1)!($G(Y)="") S Y="^" Q
 .D C^PSN50P65("",Y,"L")
 .;
 .;Pull Total Entries Found
 .S TOT=+$G(^TMP($J,"L",0))
 .;
 .;Check for no entries found
 .I TOT<1 W "  ??" S Y="" Q
 .;
 .;Check for Unique Entry
 .I TOT=1 D  Q
 ..S Y="",IEN=$O(^TMP($J,"L",0))
 ..I IEN]"" S Y=$G(^TMP($J,"L",IEN,1)) W $C(13),"Select Drug Class: ",Y
 .;
 .;Check for multiple entries - allow user to pick
 .I TOT>1 S Y=$$DCSEL(TOT)
 .;
 K ^TMP($J,"L")
 Q
 ;
 ;List Entries in VA DRUG CLASS
 ;
DCLIST N CL,DTOUT,IEN,Y
 K ^TMP($J,"L")
 D C^PSN50P65("","??","L")
 ;
 ;First create new index - sorted by CLASSIFICATION
 S IEN=0 F  S IEN=$O(^TMP($J,"L",IEN)) Q:'IEN  D
 .S CL=$G(^TMP($J,"L",IEN,1)) Q:CL=""
 .S ^TMP($J,"L","B",CL,IEN)=$G(^TMP($J,"L",IEN,".01"))
 ;
 ;Now loop through and display entries
 S $X=0,$Y=0 W !,?3,"Choose from: ",!
 S (Y,CL)="" F  S CL=$O(^TMP($J,"L","B",CL)) Q:CL=""  D  Q:Y]""
 .S IEN="" F  S IEN=$O(^TMP($J,"L","B",CL,IEN)) Q:IEN=""  D  Q:Y]""
 ..W ?3,$G(^TMP($J,"L","B",CL,IEN)),!,?3,CL,!
 ..I $Y>19!'$Y D
 ...W ?3 R "'^' TO STOP: ",Y:$G(DTIME,300)
 ...E  S DTOUT=1
 ...W $C(13),$J("",17),$C(13)
 ...I ($G(DTOUT)=1)!($G(Y)="^") S Y="^" Q
 ...S $X=0,$Y=0
 ;
 K ^TMP($J,"L")
 Q
 ;
 ;Allow user to pick VA DRUG CLASS entry based on initial input
 ;
 ; Input variable - TOT -> Total entries placed in ^TMP($J,"L")
 ; Returned value - VA DRUG CLASSIFICATION
 ;
DCSEL(TOT) N CL,I,IEN,IX,Y
 ;
 ;First create new index
 F IX="B","N" K ^TMP($J,"L",IX)
 S Y="",IEN=0 F  S IEN=$O(^TMP($J,"L",IEN)) Q:'IEN  D
 .S CL=$G(^TMP($J,"L",IEN,1)) Q:CL=""
 .S ^TMP($J,"L","B",CL,IEN)=$G(^TMP($J,"L",IEN,".01"))
 ;
 ;Now loop through and allow one to be picked
 S (Y,CL)="" F  S CL=$O(^TMP($J,"L","B",CL)) Q:CL=""  D  Q:Y]""
 .S IEN="" F  S IEN=$O(^TMP($J,"L","B",CL,IEN)) Q:IEN=""  D  Q:Y]""
 ..S I=$G(I)+1 W !,?5,I,?9,$G(^TMP($J,"L","B",CL,IEN)),!,?3,CL
 ..S ^TMP($J,"L","N",I)=CL
 ..;
 ..;Stop after every 5 entries
 ..I I#5=0 I TOT>I D
 ...W !,"Press <RETURN> to see more, '^' to exit this list, OR"
 ...W !,"CHOOSE 1 - "_I R ": ",Y:DTIME S:'$T DTOUT=1
 ..;
 ..;Stop after last entry
 ..I I=TOT D
 ...W !,"CHOOSE 1 - "_I R ": ",Y:DTIME S:'$T DTOUT=1
 ..I ($G(DTOUT)=1)!($G(Y)="^") S Y="^"
 ..;
 ..;Check for valid entry
 ..I Y]"",'$D(^TMP($J,"L","N",Y)) W "  ??" S Y=""
 ..I Y]"",$D(^TMP($J,"L","N",Y)) S Y=$G(^TMP($J,"L","N",Y))
 ;
 Q Y
 ;
 ;Get DRUG file pointer
 ;       
 ; Return Value -> n = ptr to DRUG (#50)
 ;                 0 = Unknown
 ; 
GETDRUG(BPRX) Q +$P($G(^PSRX(BPRX,0)),U,6)
 ;
 ;Get VA DRUG CLASS pointer
 ;       
 ; Input Variables: BP50 - ptr to DRUG (#50)
 ;
 ; Return Value -> n = ptr to VA DRUG CLASS (#50.605)
 ;                 0 = Unknown
 ;
GETDRGCL(BP50) Q $P($G(^PSDRUG(BP50,"ND")),U,6)
 ;
 ;Determine whether claim was Mail, Window, or CMOP
 ;
 ; Input Variables: BPREF - refill # (0-No Refills,1-1st Refill, 2-2nd, ...) 
 ;
 ; Return Value -> 2 = Mail
 ;                 3 = Window
 ;                 4 = CMOP
 ;
MWC(BPRX,BPREF) N BPX,BPY
 S BPY=2
 ;
 ;if 1st fill check #52 (#11) MAIL/WINDOW
 ;if refill check refills multiple #52.1 (#2) MAIL/WINDOW
 I BPREF=0 S BPX=$P($G(^PSRX(BPRX,0)),U,11)
 E  S BPX=$P($G(^PSRX(BPRX,1,BPREF,0)),U,2)
 ;
 ; if WINDOW then 3(W)
 I BPX="W" Q 3
 ; else
 ;  check STATUS of RX
 ;  if STATUS="SUSPENSE" check 
 I $G(^PSRX(BPRX,"STA"))=5 D  Q BPY
 . ;   check #52.5
 . S BPX=$O(^PS(52.5,"B",BPRX,0))
 . ;   if CMOP INDICATOR = "P" then 2 (M)
 . I $P($G(^PS(52.5,BPX,0)),U,7)="P" S BPY=2 Q
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
 ;Get Patient Name
 ;
 ; Input variable -> BPDFN - ptr to PATIENT (#2)
 ; Returned value -> Patient Name (shortened)
 ; 
PATNAME(BPDFN) Q $E($P($G(^DPT(BPDFN,0)),U),1,25)
 ;
 ;Get Last 4 of SSN
 ;
 ; Input variable -> BPDFN - ptr to PATIENT (#2)
 ; Returned value -> Last 4 digits of patient's SSN
 ; 
SSN4(BPDFN) N X
 S X=$P($G(^DPT(BPDFN,0)),U,9)
 Q $E(X,$L(X)-3,$L(X))
 ;
 ;Get RX#
 ;
 ; Returned value -> RX#
 ; 
RXNUM(BPRX) ;
 Q $P($G(^PSRX(+BPRX,0)),U)
 ;
 ;Determine $Collected
 ;
 ; Returned Value -> $Collected
 ;
COLLECTD(BPRX,BPREF) N COL,RET
 S RET=$$BILLINFO^IBNCPDPI(BPRX,BPREF)
 S COL=$P(RET,U,5) I COL="0",($P(RET,U,3)=16)!($P(RET,U,3)=27) S COL=""
 I $P(RET,U,7)=1 S COL="N/A"
 Q COL
 ;
 ;Determine Bill #
 ;
 ; Returned Value -> Bill Number
 ;
BILL(BPRX,BPREF) N BILL
 S BILL=$P($$BILLINFO^IBNCPDPI(BPRX,BPREF),U)
 Q BILL
 ;
 ;Determine $Ins Paid
 ;
INSPAID(BP59) N X,RESP,POSITION
 S X=$G(^BPST(BP59,0))
 S RESP=$P(X,U,5)
 S POSITION=$P(X,U,9)
 Q $S(RESP&POSITION:$$NETPAID1^BPSOS03(RESP,POSITION),1:0)
 ;
 ;Get the Closed Claim Reason
 ;
 ; Input variable -> 0 for All Closed Claim Reasons or
 ;                   lookup to CLAIMS TRACKING NON-BILLABLE REASONS (#356.8)
 ; Returned value -> ALL or the selected Closed Claim Reason
 ; 
GETCLR(RSN) ;
 I RSN="0" S RSN="ALL"
 E  S RSN=$P($G(^IBE(356.8,+RSN,0)),U)
 Q RSN
 ;
 ;Get the Closed By Person
 ;
 ; Returned Value -> Closed By Name
 ; 
CLSBY(BP59) N BP02,CBY,Y
 S BP02=+$P($G(^BPST(BP59,0)),U,4)
 S CBY=+$P($G(^BPSC(BP02,900)),U,3)
 S Y=$$GET1^DIQ(200,CBY_",",".01")
 Q Y
 ;
 ;Get the Claim Status
 ;
 ; Input Variables: BPREF - refill # (0-No Refills,1-1st Refill, 2-2nd, ...) 
 ;
STATUS(BPRX,BPREF) Q $$STATUS^BPSOSRX(BPRX,BPREF,0)
 ;
 ;Elapsed Time
 ;
 ; Returned Value -> TIME - Elapsed Processing Time
 ; 
ELAPSE(BP59) Q $$TIMEDIFI^BPSOSUD($P($G(^BPST(BP59,0)),U,11),$P($G(^BPST(BP59,0)),U,8))
 ;
 ;Get RX issue date
 ;
RXISSDT(BPRX) Q +$P($G(^PSRX(BPRX,0)),U,13)
 ;
 ;
 ;Get RX's fill date
RXFILDT(BPRX) Q +$P($G(^PSRX(BPRX,2)),U,2)
 ;
 ;Get label date for RX,
RXLBLDT(BPRX,BPDIR) N BPRET
 I BPDIR=0 S BPRET=$O(^PSRX(BPRX,"L",0))
 I BPDIR=1 S BPRET=$O(^PSRX(BPRX,"L",9999),-1)
 I BPRET S BPRET=$P($G(^PSRX(BPRX,"L",+BPRET,0)),U)\1
 Q BPRET
 ;
 ;Get label date for refills
 ;
REFLBLDT(BPRX,BPDIR) Q $$RXLBLDT(BPRX,BPDIR)
 ;
 ;Get Refill's issue date
 ;
REFISSDT(BPRX,BPREF) Q $$REFDISDT(BPRX,BPREF)
 ;
 ;Get Refill's dispense date
 ;
REFDISDT(BPRX,BPREF) Q +$P($G(^PSRX(BPRX,1,BPREF,0)),U,19)
 ;
 ;Get Refill's refill date
 ;
REFFILDT(BPRX,BPREF) Q +$P($G(^PSRX(BPRX,1,BPREF,0)),U)
 ;
 ;Get RX's release date
 ;
RXRELDT(BPRX) Q +$P($G(^PSRX(BPRX,2)),U,13)
 ;
 ;Get Refill's release date
 ;
REFRELDT(BPRX,BPREF) Q +$P($G(^PSRX(BPRX,1,BPREF,0)),U,18)
 ;
 ;See if refill exists
 ;
IFREFILL(BPRX,BPREF) Q $D(^PSRX(BPRX,1,BPREF))>0
 ;
 ;Get RX status
 ;
 ; Input Variables -> RXNUM = ptr to #52 (MODE = 0)
 ;                            or RX Number (MODE = 1)
 ;                            
RXSTATUS(RXNUM,MODE) ;
 I $G(MODE) S RXNUM=$O(^PSRX("B",RXNUM,0)) I +RXNUM=0 Q -1
 I '$D(^PSRX(RXNUM,"STA")) Q -1
 Q $G(^PSRX(RXNUM,"STA"))
 ;
 ;Return RX Quantity
 ;
QTY(BPRX,BPREF) ;
 I +$G(BPREF)=0 Q +$P($G(^PSRX(BPRX,0)),U,7)
 Q +$P($G(^PSRX(BPRX,1,BPREF,0)),U,4)
 ;
 ;Return NDC Number
GETNDC(BPRX,BPREF) Q $$GETNDC^PSONDCUT(BPRX,BPREF)
 ;
 ;Return Copay Status ($)
COPAY(BPRX) Q $S($G(^PSRX(BPRX,"IB")):"$",1:"")
