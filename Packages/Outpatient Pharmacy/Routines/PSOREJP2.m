PSOREJP2 ;BIRM/MFR - Third Party Rejects View/Process ;04/28/05
 ;;7.0;OUTPATIENT PHARMACY;**148**;DEC 1997
 ;Reference to ^PSSLOCK   supported by DBIA #2789
 ; 
 N PSORJSRT,PSOPTFLT,PSODRFLT,PSORXFLT,PSOBYFLD,PSOSTFLT,DIR,DIRUT,DUOUT,DTOUT
 N PSOINFLT
 S PSORJASC=1
 ;
 ; - Division/Site selection
 D SEL^PSOREJU1("DIVISION","^PS(59,",.PSOREJST) I $G(PSOREJST)="^" G EXIT
 ;
SEL ; - Field Selection (Patient/Drug/Rx)
 S DIR(0)="S^P:PATIENT;D:DRUG;R:Rx;I:INSURANCE",DIR("B")="P"
 S DIR("A")="By (P)atient, (D)rug, (R)x or (I)nsurance" D ^DIR I $D(DIRUT) G EXIT
 S PSOBYFLD=Y,DIR("B")=""
 ;
 I PSOBYFLD="P" D  I $G(PSOPTFLT)="^" G SEL
 . S (PSODRFLT,PSORXFLT,PSOINFLT)="ALL",PSORJSRT="DR"
 . D SEL^PSOREJU1("PATIENT","^DPT(",.PSOPTFLT)
 ;
 I PSOBYFLD="D" D  I $G(PSODRFLT)="^" G SEL
 . S (PSOPTFLT,PSORXFLT,PSOINFLT)="ALL",PSORJSRT="PA"
 . D SEL^PSOREJU1("DRUG","^PSDRUG(",.PSODRFLT)
 ;
 I PSOBYFLD="R" D  I $D(DUOUT)!$D(DTOUT)!'$G(PSORXFLT) G SEL
 . S (PSOPTFLT,PSODRFLT,PSOINFLT)="ALL",PSORJSRT="PA"
 . N DIC,Y,X,OK K PSOSTFLT,PSORXFLT
 . S DIC=52,DIC(0)="QEZA",DIC("A")="PRESCRIPTION: "
 . F  W ! D ^DIC D  Q:$G(OK) 
 . . I $D(DUOUT)!$D(DTOUT)!(X="") S OK=1 Q
 . . I '$O(^PSRX(+Y,"REJ",0)) D  Q
 . . . W !?40,"Prescription does not have rejects!",$C(7)
 . . S PSORXFLT=+Y,OK=1
 ;
 I PSOBYFLD="I" D  I $O(PSOINFLT(""))="" G SEL
 . S (PSOPTFLT,PSODRFLT,PSORXFLT)="ALL",PSORJSRT="PA"
 . N DIR,Y,X,OK K PSOINFLT W !
 . S DIR("A",1)="Enter the whole or part of the Insurance Company"
 . S DIR("A",2)="name for which you want to view/process REJECTS."
 . S DIR("A",3)=""
 . S DIR(0)="FO^3:30",DIR("A")="  INSURANCE"
 . F  D ^DIR D  Q:$G(OK) 
 . . I $D(DIRUT)!(X="") S OK=1 Q
 . . S PSOINFLT(X)="" K DIR("A") S DIR("A")="ANOTHER ONE"
 ;
 ; - Status Selection (UNRESOLVED or RESOLVED)
 I $G(PSOSTFLT)="" D  I $D(DIRUT) G EXIT
 . S DIR(0)="S^U:UNRESOLVED;R:RESOLVED;B:BOTH",DIR("B")="B"
 . S DIR("A")="(U)NRESOLVED, (R)RESOLVED or (B)OTH REJECT statuses" D ^DIR
 . S PSOSTFLT=Y
 ;
 D LST^PSOREJP0
 ;
EXIT Q
 ;
CLO      ; - Ignore a REJECT hidden action
 I $$CLOSED^PSOREJP1(RX,REJ) D  Q
 . S VALMSG="This Reject is marked resolved!",VALMBCK="R"
 N DIR,COM
 D FULL^VALM1
 I '$$SIG^PSOREJU1() S VALMBCK="R" Q
 W !
 S COM=$$COM^PSOREJU1() I COM="^" S VALMBCK="R" Q
 W !
 S DIR(0)="Y",DIR("A")="     Confirm? ",DIR("B")="NO"
 S DIR("A",1)="     When you confirm this REJECT will be marked RESOLVED."
 S DIR("A",2)=" "
 D ^DIR I $G(Y)=0!$D(DIRUT) S VALMBCK="R" Q
 W ?40,"[Closing..." D CLOSE^PSOREJUT(RX,FILL,REJ,DUZ,6,COM) W "OK]",!,$C(7) H 1
 I $D(PSOSTFLT),PSOSTFLT'="B" S CHANGE=1
 Q
 ;
OPN ; - Re-open a Closed/Resolved Reject
 I '$$CLOSED^PSOREJP1(RX,REJ) D  Q
 . S VALMSG="This Reject is NOT marked resolved!",VALMBCK="R"
 N DIR,COM,REJDATA,NEWDATA
 D FULL^VALM1
 I '$$SIG^PSOREJU1() S VALMBCK="R" Q
 W !
 S DIR(0)="Y",DIR("A")="     Confirm? ",DIR("B")="NO"
 S DIR("A",1)="     When you confirm this REJECT will be marked UNRESOLVED."
 S DIR("A",2)=" "
 D ^DIR I $G(Y)=0!$D(DIRUT) S VALMBCK="R" Q
 ;
 W ?40,"[Re-opening..."
 K REJDATA D GET^PSOREJU2(RX,FILL,.REJDATA,REJ,1) D SETOPN^PSOREJU2(RX,REJ)
 K NEWDATA M NEWDATA=REJDATA(REJ) S NEWDATA("PHARMACIST")=DUZ
 D SAVE^PSOREJUT(RX,FILL,.NEWDATA),RETRXF^PSOREJU2(RX,FILL,0)
 W "OK]",!,$C(7) H 1
 S CHANGE=1
 Q
 ;
CHG ; - Change Suspense Date action
 I $$CLOSED^PSOREJP1(RX,REJ) D  Q
 . S VALMSG="This Reject is marked resolved!",VALMBCK="R" W $C(7)
 ;
 N SUSDT,PSOMSG,Y,SUSRX,%DT,DA,DIE,DR,ISSDT,EXPDT,PSOMSG
 ;
 S RFL=+$$GET1^DIQ(52.25,REJ_","_RX,5),SUSDT=$$RXSUDT^PSOBPSUT(RX,RFL)
 I SUSDT="" S VALMSG="Prescription is not suspended!",VALMBCK="R" W $C(7) Q
 I $$RXRLDT^PSOBPSUT(RX,RFL) S VALMSG="Prescription has been released already!",VALMBCK="R" W $C(7) Q
 D PSOL^PSSLOCK(RX) I '$G(PSOMSG) S VALMSG=$P(PSOMSG,"^",2),VALMBCK="R" W $C(7) Q
 ;
 S ISSDT=$$GET1^DIQ(52,RX,1,"I"),EXPDT=$$GET1^DIQ(52,RX,26,"I")
 S SUSRX=$O(^PS(52.5,"B",RX,0))
 ;
SUDT ; Asks for the new Suspense Date
 D FULL^VALM1 S %DT("B")=$$FMTE^XLFDT(SUSDT),%DT="EA",%DT("A")="SUSPENSE DATE: "
 W ! D ^%DT I Y<0!($D(DTOUT)) D PSOUL^PSSLOCK(RX) S VALMBCK="R" Q
 I Y<ISSDT D  G SUDT
 . W !!?5,"Suspense Date cannot be before Issue Date: ",$$FMTE^XLFDT(ISSDT),$C(7)
 I Y>EXPDT D  G SUDT
 . W !!?5,"Suspense Date cannot be after Expiration Date: ",$$FMTE^XLFDT(EXPDT),$C(7)
 S SUSDT=Y
 ;
 N DIR,DIRUT W !
 S DIR("A",1)="     When you confirm, this REJECT will be marked resolved. A"
 S DIR("A",2)="     new claim will be re-submitted to the 3rd party payer"
 I $$GET1^DIQ(52.5,SUSRX,3)="" D
 . I SUSDT>DT D
 . . S DIR("A",3)="     when the prescription label for this fill is printed"
 . . S DIR("A",4)="     from suspense on "_$$FMTE^XLFDT(SUSDT)_"."
 . . S DIR("A",5)=" "
 . . S DIR("A",6)="     Note: THE LABEL FOR THIS PRESCRIPTION FILL WILL NOT BE"
 . . S DIR("A",7)="           PRINTED LOCAL FROM SUSPENSE BEFORE "_$$FMTE^XLFDT(SUSDT)_"."
 . E  D
 . . S DIR("A",3)="     the next time local labels are printed from suspense."
 E  D
 . I SUSDT>DT D
 . . S DIR("A",3)="     when the prescription is transmitted to CMOP on "
 . . S DIR("A",4)="     "_$$FMTE^XLFDT(SUSDT)_"."
 . . S DIR("A",5)=" "
 . . S DIR("A",6)="     Note: THIS PRESCRIPTION FILL WILL NOT BE TRANSMITTED TO"
 . . S DIR("A",7)="           CMOP BEFORE "_$$FMTE^XLFDT(SUSDT)_"."
 . E  D
 . . S DIR("A",3)="     when this prescription fill is transmitted to CMOP on"
 . . S DIR("A",4)="     the next CMOP transmission."
    ;
 S DIR("A",$O(DIR("A",""),-1)+1)=" "
 S DIR(0)="Y",DIR("A")="     Confirm? ",DIR("B")="YES"
 D ^DIR I $G(Y)=0!$D(DIRUT) S VALMBCK="R" D PSOUL^PSSLOCK(RX) Q
 ;
 ; - Suspense/Fill Date updates
 I SUSDT'=$$RXSUDT^PSOBPSUT(RX,RFL) D
 . N DA,DIE,DR,PSOX,SFN,INDT,DEAD
 . S DA=SUSRX,DIE="^PS(52.5,",DR=".02///"_SUSDT D ^DIE
 . S SFN=SUSRX,DEAD=0,INDT=SUSDT D CHANGE^PSOSUCH1(RX,RFL)
 ;
 ; - Flagging the prescription to be re-submitted to ECME on the next CMOP/Print from Suspense
 D RETRXF^PSOREJU2(RX,RFL,1)
 W ?40,"[Closing..."
 D CLOSE^PSOREJUT(RX,RFL,REJ,DUZ,8,"Fill Date changed to "_$$FMTE^XLFDT(SUSDT)_". A new claim will be re-submitted on this date.")
 W "OK]",!,$C(7) H 1 I $D(PSOSTFLT),PSOSTFLT'="B" S CHANGE=1
 D PSOUL^PSSLOCK(RX)
 Q
