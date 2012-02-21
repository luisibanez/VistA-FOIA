PSOREJP1 ;BIRM/MFR - Third Party Reject Display Screen ;04/29/05
 ;;7.0;OUTPATIENT PHARMACY;**148**;DEC 1997
 ;Reference to File 9002313.93 - BPS NCPDP REJECT CODES supported by DBIA 4720
 ;
EN(RX,REJ,CHANGE) ; Entry point
 ;
 ; - DO NOT change the IF logic below as both of them might get executed (intentional)
 S FILL=+$$GET1^DIQ(52.25,REJ_","_RX,5)
 I $$CLOSED(RX,REJ) D EN^VALM("PSO REJECT DISPLAY - RESOLVED")
 I '$$CLOSED(RX,REJ) D EN^VALM("PSO REJECT DISPLAY")
 D FULL^VALM1
 Q
 ;
HDR      ; - Builds the Header section
 N LINE1,LINE2,X
 S VALMHDR(1)=$$DVINFO^PSOREJU2(RX,FILL,1),VALMHDR(2)=$$PTINFO^PSOREJU2(RX,1)
 S VALMHDR(3)=$$RXINFO(RX,FILL,1),VALMHDR(4)=$$RXINFO(RX,FILL,2)
 Q
 ;
INIT ; Builds the Body  section
 N DATA,LINE
 K ^TMP("PSOREJP1",$J) S VALMCNT=0,LINE=0
 D GET^PSOREJU2(RX,FILL,.DATA,REJ,1)
 D REJ                   ; Display the REJECT Information
 D OTH                   ; Display the Other Rejects Information
 D INS                   ; Display the Insurance Information
 D CLS                   ; Display the Resolution Information
 S VALMCNT=LINE
 Q
 ;
REJ ; - DUR Information
 N TYPE,PFLDT
 D SETLN("REJECT Information",1,1)
 S TYPE=$S($G(DATA(REJ,"CODE"))=79:"79 - REFILL TOO SOON",1:"88 - DUR REJECT")
 D SETLN("Reject Type   : "_TYPE_" received on "_$$FMTE^XLFDT($G(DATA(REJ,"DATE/TIME"))),,,17)
 D SETLN("Reject Status : "_$G(DATA(REJ,"STATUS")),,,17)
 D SET("PAYER MESSAGE",64)
 D SET("REASON",64)
 S PFLDT=$$FMTE^XLFDT($G(DATA(REJ,"PLAN PREVIOUS FILL DATE")))
 D SET("DUR TEXT",64,$S(PFLDT="":1,1:0))
 I PFLDT'="" D SETLN("Last Fill Date: "_PFLDT_" (from payer)",,1,17)
 Q
 ;
OTH ; - Other Rejects Information
 N LST,I,RJC,J,LAST
 S LST=$G(DATA(REJ,"OTHER REJECTS")) I LST="" Q
 D SETLN()
 D SETLN("OTHER REJECTS",1,1)
 F I=1:1:$L(LST,",") S RJC=$P(LST,",",I) D
 . S LAST=1 F J=(I+1):1:$L(LST,",") I $P(LST,",",J)'="" S LAST=0 Q
 . I RJC'="" D SETLN(RJC_" - "_$$EXP(RJC),,$S(LAST:1,1:0),6)
 Q
 ;
INS ; - Insurance Information
 D SETLN()
 D SETLN("INSURANCE Information",1,1)
 D SETLN("Insurance     : "_$G(DATA(REJ,"INSURANCE NAME")),,,17)
 D SETLN("Contact       : "_$G(DATA(REJ,"PLAN CONTACT")),,,17)
 D SETLN("Group Name    : "_$G(DATA(REJ,"GROUP NAME")),,,17)
 D SETLN("Group Number  : "_$G(DATA(REJ,"GROUP NUMBER")),,,17)
 D SETLN("Cardholder ID : "_$G(DATA(REJ,"CARDHOLDER ID")),,1,17)
 Q
 ;
CLS ; - Resolution Information
 I '$$CLOSED(RX,REJ) Q
 D SETLN()
 D SETLN("RESOLUTION Information",1,1)
 D SETLN("Resolved By   : "_$G(DATA(REJ,"CLOSED BY")),,,17)
 D SETLN("Date/Time     : "_$G(DATA(REJ,"CLOSED DATE/TIME")),,,17)
 I $G(DATA(REJ,"CLOSE COMMENTS"))'="" D SET("CLOSE COMMENTS",64)
 I $G(DATA(REJ,"COD1"))'="" D SETLN("Reason for Svc: "_$$OVRX^PSOREJU1(1,$G(DATA(REJ,"COD1"))),,,17)
 I $G(DATA(REJ,"COD2"))'="" D SETLN("Profes. Svc   : "_$$OVRX^PSOREJU1(2,$G(DATA(REJ,"COD2"))),,,17)
 I $G(DATA(REJ,"COD3"))'="" D SETLN("Result of Svc : "_$$OVRX^PSOREJU1(3,$G(DATA(REJ,"COD3"))),,,17)
 D SETLN("Reason        : "_$G(DATA(REJ,"CLOSE REASON")),,1,17)
 Q
 ;
SET(FIELD,L,UND) ; Sets the lines for fields that require text wrapping
 N TXT,T
 S TXT=DATA(REJ,FIELD) I $L(TXT)'>L D SETLN($$LABEL(FIELD)_TXT,,$S($G(UND):1,1:0),80-L) Q
 F I=1:1 Q:TXT=""  D
 . I I=1 D SETLN($$LABEL(FIELD)_$E(TXT,1,L),,,80-L) S TXT=$E(TXT,L+1,999) Q
 . S T="",$E(T,81-L)=$E(TXT,1,L) D SETLN(T,,$S($E(TXT,L+1,999)=""&$G(UND):1,1:0),80-L) S TXT=$E(TXT,L+1,999)
 Q
 ;
LABEL(FIELD) ; Sets the label for the field
 I FIELD="REASON" Q "Reason        : "
 I FIELD="PAYER MESSAGE" Q "Payer Message : "
 I FIELD="DUR TEXT" Q "DUR Text      : "
 I FIELD="CLOSE COMMENTS" Q "Comments      : "
 Q ""
 ;
VIEW ; - Rx View hidden action
 N VALMCNT,TITLE
 I $G(PSOBACK) D  Q
 . S VALMSG="Not available through Backdoor!",VALMBCK="R"
 S TITLE=VALM("TITLE")
 ;
 ; - DO structure used to avoid losing variables RX,FILL,REJ,LINE,TITLE
 DO
 . N PSOVDA,DA,PS
 . S (PSOVDA,DA)=RX,PS="REJECT"
 . N RX,REJ,FILL,LINE,TITLE D DP^PSORXVW
 ;
 S VALMBCK="R",VALM("TITLE")=TITLE
 Q
 ;
EDT ; - Rx Edit hidden action
 N VALMCNT,TITLE
 I $G(PSOBACK) D  Q
 . S VALMSG="Not available through Backdoor!",VALMBCK="R"
 S TITLE=VALM("TITLE")
 ;
 ; - DO structure used to avoid losing variables RX,FILL,REJ,LINE,TITLE
 DO
 . N PSOSITE,ORN,PSOPAR,PSOLIST
 . S PSOSITE=$$RXSITE^PSOBPSUT(RX,FILL),ORN=RX
 . S PSOPAR=$G(^PS(59,PSOSITE,1)),PSOLIST(1)=ORN_","
 . N RX,REJ,FILL,LINE,TITLE D EPH^PSORXEDT
 ;
 K VALMBCK I $$CLOSED(RX,REJ),$D(PSOSTFLT),PSOSTFLT'="B" S CHANGE=1 Q
 S VALMBCK="R",VALM("TITLE")=TITLE
 Q
 ;
OVR ; - Override a REJECT action
 I $$CLOSED(RX,REJ) D  Q
 . S VALMSG="This Reject is marked resolved!",VALMBCK="R" W $C(7)
 I $$GET1^DIQ(52.25,REJ_","_RX,.01)'=88 D  Q
 . S VALMSG="Only DUR rejects can be overriden!",VALMBCK="R" W $C(7)
 N COD1,COD2,COD3
 D FULL^VALM1 W !
 S COD1=$$OVRCOD^PSOREJU1(1,$$GET1^DIQ(52.25,REJ_","_RX,14)) I COD1="^" S VALMBCK="R" Q
 S COD2=$$OVRCOD^PSOREJU1(2) I COD2="^" S VALMBCK="R" Q
 S COD3=$$OVRCOD^PSOREJU1(3) I COD3="^" S VALMBCK="R" Q
 ;
 D OVRDSP^PSOREJU1(COD1_"^"_COD2_"^"_COD3)
 ;
RES ; - Re-submit a claim action
 I $$CLOSED(RX,REJ) D  Q
 . S VALMSG="This Reject is marked resolved!",VALMBCK="R"
 N DIR,OVRC,RESP
 D FULL^VALM1 W !
 S DIR(0)="Y",DIR("A")="     Confirm? ",DIR("B")="YES"
 S DIR("A",1)="     When you confirm, a new claim will be submitted for"
 S DIR("A",2)="     the prescription and this REJECT will be marked"
 S DIR("A",3)="     resolved."
 S DIR("A",4)=" "
 D ^DIR I $G(Y)=0!$D(DIRUT) S VALMBCK="R" Q
 D CLOSE^PSOREJUT(RX,FILL,REJ,DUZ,1,,$G(COD1),$G(COD2),$G(COD3))
 I $G(COD1)'="" S OVRC=$G(COD1)_"^"_$G(COD2)_"^"_$G(COD3)
 D ECMESND^PSOBPSU1(RX,FILL,,"ED",$$GETNDC^PSONDCUT(RX,FILL),,,$G(OVRC),,.RESP,,"REJECT WORKLIST RESUBMISSION")
 I $G(RESP) D  Q
 . W !!?10,"Claim could not be submitted. Please try again later!"
 . W !,?10,"Reason: ",$S($P(RESP,"^",2)="":"UNKNOWN",1:$P(RESP,"^",2)),$C(7) H 2
 I $D(PSOSTFLT),PSOSTFLT'="B" S CHANGE=1
 Q
 ;
EXIT ;
 K ^TMP("PSOREJP1",$J)
 Q
 ;
SETLN(TEXT,REV,UND,HIG) ; Sets a line to be displayed in the Body section
 N X
 S:$G(TEXT)="" $E(TEXT,80)=""
 S:$L(TEXT)>80 TEXT=$E(TEXT,1,80)
 S LINE=LINE+1,^TMP("PSOREJP1",$J,LINE,0)=$G(TEXT)
 ;
 I $G(REV) D  Q
 . D CNTRL^VALM10(LINE,1,$L(TEXT),IORVON,IOINORM)
 . I $G(UND) D CNTRL^VALM10(LINE,$L(TEXT)+1,80,IOUON,IOINORM)
 I $G(UND) D CNTRL^VALM10(LINE,1,80,IOUON,IOINORM)
 I $G(HIG) D
 . D CNTRL^VALM10(LINE,HIG,80,IOINHI,IOINORM)
 Q
HELP ;
 Q
 ;
RXINFO(RX,FILL,LINE) ; Returns header displayable Rx Information
 N TXT,RXINFO,LBL,CMOP,DRG
 I LINE=1 D
 . S RXINFO="Rx#      : "_$$GET1^DIQ(52,RX,.01)_"/"_FILL
 . S $E(RXINFO,30)="ECME#: "_$E(10000000+RX,2,8)
 . S $E(RXINFO,55)="Fill Date: "_$$FMTE^XLFDT($$RXFLDT^PSOBPSUT(RX,FILL))
 I LINE=2 D
 . S DRG=$$GET1^DIQ(52,RX,6,"I"),CMOP=$S($D(^PSDRUG("AQ",DRG)):1,1:0)
 . S RXINFO=$S(CMOP:"CMOP ",1:"")_"Drug",$E(RXINFO,10)=": "_$E($$GET1^DIQ(52,RX,6),1,43)
 . S $E(RXINFO,56)="NDC Code: "_$$GETNDC^PSONDCUT(RX,FILL)
 Q $G(RXINFO)
 ;
CLOSED(RX,REJ) ; Returns whether the REJECT is RESOLVED or NOT
 Q $S($$GET1^DIQ(52.25,REJ_","_RX,10)="":0,1:1)
 ;
REOPN(RX,REJ) ; Returns whether the REJECT was RE-OPENED or NOT
 Q $S($$GET1^DIQ(52.25,REJ_","_RX,23)="":0,1:1)
 ;
EXP(CODE) ; - Returns the explanation field (.02) for a reject code
 ; Input:  (r) CODE - .01 field (Code) value from file 9002313.93
 ; Output: .02 field (Explanation) value from file 9002313.93
 N DIC,X,Y
 S DIC=9002313.93,DIC(0)="Z",X=CODE D ^DIC
 Q $P($G(Y(0)),"^",2)
 ;
OUT(RX) ; - Supported call by outside PROTOCOLs to act on specific REJECTs
 N I,RFL,DATA,REJ,PSOBACK,VALMCNT
 S PSOBACK=1
 S (RFL,I)=0 F I=1:1 Q:'$D(^PSRX(RX,1,I))  S RFL=I
 S X=$$FIND^PSOREJUT(RX,RFL,.DATA) S REJ=$O(DATA(""))
 I '$G(REJ) S VALMSG="Invalid selection!",VALMBCK="R" Q
 D EN(RX,REJ) S VALMBCK="R"
 Q
