PSODRDUP ;BIR/SAB - Dup drug class checker ;28-Mar-2011 18:30;DU
 ;;7.0;OUTPATIENT PHARMACY;**11,23,27,32,39,56,130,132,1006,1009,1011**;DEC 1997;Build 17
 ;External references PSOL and PSOUL^PSSLOCK supported by DBIA 2789
 ; Modified - IHS/MSC/PLS - 10/05/07 - Added auto RTS/Delete feature
 ;                          09/27/10 - Added Expired med to ASKCAN1+8
 ;                          10/19/10 - Added EXPCMF API
 ;                          03/28/11 - Added ASKCAN+12
 S $P(PSONULN,"-",79)="-",(STA,DNM)="" K CLS
 F  S STA=$O(PSOSD(STA)) Q:STA=""  F  S DNM=$O(PSOSD(STA,DNM)) Q:DNM=""!$G(PSORX("DFLG"))  I $P(PSOSD(STA,DNM),"^")'=$G(PSORENW("OIRXN")) D  Q:$G(PSORX("DFLG"))
 .I STA="PENDING" D ^PSODRDU1 Q
 .I STA="ZNONVA" D NVA^PSODRDU1 Q
 .D:PSODRUG("NAME")=$P(DNM,"^")&('$D(^XUSEC("PSORPH",DUZ)))  Q:$G(PSORX("DFLG"))
 ..I $P($G(PSOPAR),"^",16) D DUP Q:$G(PSORX("DFLG"))
 ..I $P(PSOPAR,"^",2),'$P($G(PSOPAR),"^",16) D DUP Q:$G(PSORX("DFLG"))
 ..I '$P(PSOPAR,"^",2),'$P($G(PSOPAR),"^",16) D DUP
 .D:PSODRUG("NAME")=$P(DNM,"^")&($D(^XUSEC("PSORPH",DUZ))) DUP Q:$G(PSORX("DFLG"))
 .I PSODRUG("VA CLASS")]"",$E(PSODRUG("VA CLASS"),1,4)=$E($P(PSOSD(STA,DNM),"^",5),1,4),PSODRUG("NAME")'=$P(DNM,"^") D CLS
 G EXIT
DOSE ;I '$D(PSOCLOZ) G EXIT
 S DIR(0)="N^12.5:3000:1",DIR("A")="CLOZAPINE dosage (mg/day) ? " D ^DIR K DIR I $D(DIRUT) S (ANQX,ANQNO)=1 G EXIT
 S PSOCD=X
 I PSOCD#25=0,PSOCD'<12.5,PSOCD<900 S PSONEW("SAND")=PSOCD_"^"_$G(PSOLR)_"^"_$G(PSOLDT) G EXIT
 I PSOCD#12.5 S DIR(0)="Y",DIR("B")="NO",DIR("A")=PSOCD_" is an unusual dose.  Are you sure " D ^DIR K DIR G EXIT:$D(DIRUT) I 'Y G DOSE
 I PSOCD>900 S DIR(0)="Y",DIR("A")="Recommended maximum daily dose is 900. Are you sure " D ^DIR K DIR G EXIT:$D(DIRUT) I 'Y G DOSE
 S PSONEW("SAND")=PSOCD_"^"_$G(PSOLR)_"^"_$G(PSOLDT)
EXIT D ^PSOBUILD K CAN,DA,DIR,DNM,DUPRX0,ISSD,J,LSTFL,MSG,PHYS,PSOCLC,PSONULN,REA,RFLS,RX0,RX2,RXN,RXREC,ST,Y,ZZ,ACT,PSOCLOZ,PSOLR,PSOLDT,PSOCD,SIG
 Q
DUP S:$P(PSOSD(STA,DNM),"^",2)<10!($P(PSOSD(STA,DNM),"^",2)=16) DUP=1 W !,PSONULN,!,$C(7),"Duplicate Drug "_$P(DNM,"^")_" in Prescription: ",$P(^PSRX(+PSOSD(STA,DNM),0),"^")
 S RXREC=+PSOSD(STA,DNM),MSG="Discontinued During "_$S('$G(PSONV):"New Prescription Entry",1:"Verification")_" - Duplicate Drug"
DATA S DUPRX0=^PSRX(RXREC,0),RFLS=$P(DUPRX0,"^",9),ISSD=$P(^PSRX(RXREC,0),"^",13),RX0=DUPRX0,RX2=^PSRX(RXREC,2),$P(RX0,"^",15)=+$G(^PSRX(RXREC,"STA"))
 S RXRECLOC=$G(RXREC)
 W !!,$J("Status: ",24) S J=RXREC D STAT^PSOFUNC W ST K RX0,RX2 W ?40,$J("Issued: ",24),$E(ISSD,4,5)_"/"_$E(ISSD,6,7)_"/"_$E(ISSD,2,3)
 S DA=RXREC D ^PSOCMOPA I $G(PSOCMOP)]"" D  K CMOP,PSOTRANS,PSOREL
 .S PSOTRANS=$E($P(PSOCMOP,"^",2),4,5)_"/"_$E($P(PSOCMOP,"^",2),6,7)_"/"_$E($P(PSOCMOP,"^",2),2,3)
 .S PSOREL=$S(CMOP("L")=0:$P($G(^PSRX(DA,2)),"^",13),1:$P(^PSRX(DA,1,CMOP("L"),0),"^",18))
 .S PSOREL=$E(PSOREL,4,5)_"/"_$E(PSOREL,6,7)_"/"_$E(PSOREL,2,3)_"@"_$E($P(PSOREL,".",2),1,4)
 .W !,$J("CMOP Status: ",24)_$S($P(PSOCMOP,"^")=0!($P(PSOCMOP,"^")=2):"Transmitted to on "_PSOTRANS,$P(PSOCMOP,"^")=1:"Released by CMOP on "_PSOREL,1:"Not Dispensed")
 K FSIG,BSIG I $P($G(^PSRX(RXREC,"SIG")),"^",2) D FSIG^PSOUTLA("R",RXREC,54) F PSREV=1:1 Q:'$D(FSIG(PSREV))  S BSIG(PSREV)=FSIG(PSREV)
 K FSIG,PSREV I '$P($G(^PSRX(RXREC,"SIG")),"^",2) D EN2^PSOUTLA1(RXREC,54)
 W !,$J("SIG: ",24) W $G(BSIG(1))
 I $O(BSIG(1)) F PSREV=1:0 S PSREV=$O(BSIG(PSREV)) Q:'PSREV  W !?24,$G(BSIG(PSREV))
 K BSIG,PSREV
 W !,$J("QTY: ",24)_$P(DUPRX0,"^",7),?40,$J("# of refills: ",24)_RFLS S PHYS=$S($D(^VA(200,+$P(DUPRX0,"^",4),0)):$P(^(0),"^"),1:"UNKNOWN")
 W !,$J("Provider: ",24)_PHYS,?40,$J("Refills remaining: ",24),RFLS-$S($D(^PSRX(RXREC,1,0)):$P(^(0),"^",4),1:0)
 S LSTFL=+^PSRX(RXREC,3) W !?40,$J("Last filled on: ",24)_$E(LSTFL,4,5)_"/"_$E(LSTFL,6,7)_"/"_$E(LSTFL,2,3),!?40,$J("Days Supply: ",24)_$P(DUPRX0,"^",8)
 W !,PSONULN,! I $P($G(^PS(53,+$P($G(PSORX("PATIENT STATUS")),"^"),0)),"^")["AUTH ABS"!($G(PSORX("PATIENT STATUS"))["AUTH ABS")&'$P(PSOPAR,"^",5) W !,"PATIENT ON AUTHORIZED ABSENSE!" K RXRECLOC Q
ASKCAN ;IHS/MSC/PLS - 09/27/10
 N APSPCMF
 ;I $P(PSOSD(STA,DNM),"^",2)>10,$P(PSOSD(STA,DNM),"^",2)'=16 K DIR S DIR(0)="E",DIR("A")="Press Return to continue" D ^DIR K DIR,DTOUT,DUOUT,DIRUT,RXRECLOC Q
 I $P(PSOSD(STA,DNM),"^",2)>10,$P(PSOSD(STA,DNM),"^",2)'=16 S:$P(PSOSD(STA,DNM),U,2)=11 APSPCMF=1 D:$G(APSPCMF) EXPCMF K DIR S DIR(0)="E",DIR("A")="Press Return to continue" D ^DIR K DIR,DTOUT,DUOUT,DIRUT,RXRECLOC Q
 I '$P(PSOPAR,"^",2),'$P(PSOPAR,"^",16),'$D(^XUSEC("PSORPH",DUZ)),'$G(CLS) S PSORX("DFLG")=1 K RXRECLOC Q
 I $P(PSOPAR,"^",2),'$P(PSOPAR,"^",16),'$D(^XUSEC("PSORPH",DUZ)),'$G(CLS) S PSORX("DFLG")=1 K RXRECLOC Q
 I $P(PSOSD(STA,DNM),"^",2)=16,$G(DUP) W !!,"Prescription "_$P($G(^PSRX(+$G(RXRECLOC),0)),"^")_" is on Provider Hold, it cannot be discontinued.",! K DUP,RXRECLOC S PSORX("DFLG")=1 Q
 D PSOL^PSSLOCK(RXRECLOC) I '$G(PSOMSG) D  K PSOMSG,DIR,DUP,RXRECLOC S DIR("A")="Press Return to continue",DIR(0)="E" D ^DIR K DIR S PSORX("DFLG")=1 Q
 .I $P($G(PSOMSG),"^",2)'="" W !!,$P(PSOMSG,"^",2),! Q
 .W !!,"Another person is editing Rx "_$P($G(^PSRX(RXRECLOC,0)),"^"),!
 ; IHS/MSC/PLS - 10/05/07 - added next two lines
 ;N APSPRTS,APSPQ S:$P(^PSRX(RXREC,2),U,2)=DT&('($P(PSOSD(STA,DNM),"^",2)=12)) APSPRTS=$$DIRYN^APSPUTIL("Return Rx # "_$P(^PSRX(+PSOSD(STA,DNM),0),U)_" to stock and mark it for deletion?","YES",,.APSPQ)
 ; IHS/MSC/PLS - 03/28/2011 - removed default and set to required
 N APSPRTS,APSPQ S:$P(^PSRX(RXREC,2),U,2)=DT&('($P(PSOSD(STA,DNM),"^",2)=12)) APSPRTS=$$DIRYNR^APSPUTIL("Return Rx # "_$P(^PSRX(+PSOSD(STA,DNM),0),U)_" to stock and mark it for deletion?","",,.APSPQ)
 I '$G(APSPQ),$G(APSPRTS),$$CHK(.APSPRTS,RXREC) S Y=1 G ASKCAN1
 K PSOMSG S DIR("A")=$S($P(PSOSD(STA,DNM),"^",2)=12:"Reinstate",1:"Discontinue")_" RX # "_$P(^PSRX(+PSOSD(STA,DNM),0),"^"),DIR(0)="Y",DIR("?")="Enter Y to "_$S($P(PSOSD(STA,DNM),"^",2)=12:"reinstate",1:"discontinue")_" this RX."
 D ^DIR K DIR
ASKCAN1 S DA=RXREC S ACT=$S($D(SPCANC):"Reinstated during Rx cancel.",1:$S($P(PSOSD(STA,DNM),"^",2)=12:"Reinstated",1:"Discontinued")_" while "_$S('$G(PSONV):"entering",1:"verifying")_" new RX")
 D CMOP^PSOUTL I $G(CMOP("S"))="L" W !,"A CMOP Rx cannot be discontinued during transmission!",! S Y=0 K CMOP
 I 'Y W $C(7)," -Prescription was not "_$S($P(PSOSD(STA,DNM),"^",2)=12:"reinstated",1:"discontinued")_"..." D  Q
 .S:'$D(PSOCLC) PSOCLC=DUZ S MSG=ACT,REA=$S($P(PSOSD(STA,DNM),"^",2)=12:"R",1:"C") S:$G(DUP) PSORX("DFLG")=1 K DUP D ULRX K RXRECLOC
 .I $D(^TMP("PSORXDC",$J,RXREC,0)) K ^TMP("PSORXDC",$J,RXREC,0)
 I $P(PSOSD(STA,DNM),"^",2)=16,$G(CLS) W !!,"Prescription "_$P($G(^PSRX(+$G(RXRECLOC),0)),"^")_" is on Provider Hold, it cannot be discontinued.",! D ULRX K CLS,DUP,RXRECLOC S PSORX("DFLG")=1 H 2 Q
 S PSOCLC=DUZ,MSG=$S($G(MSG)]"":MSG,1:ACT_" During New RX "_$S('$G(PSONV):"Entry",1:"Verification")_" - Duplicate Rx"),REA=$S($P(PSOSD(STA,DNM),"^",2)=12:"R",1:"C")
 W !!,"Duplicate "_$S($G(CLS):"Class",1:"Drug")_" will be discontinued after the acceptance of the new order.",!
 S ^TMP("PSORXDC",$J,RXREC,0)="52^"_DA_"^"_MSG_"^"_REA_"^"_ACT_"^"_STA_"^"_DNM_U_$G(APSPRTS)_U_$G(APSPCMF),PSONOOR="D"  ;IHS/MSC/PLS - 10/05/07 - Added APSPRTS ; 09/27/10 - Added APSPCMF
 K RXRECLOC,DUP,CLS,PSONOOR Q
CLS K DUP
 I $E($G(PSODRUG("VA CLASS")),1,2)="HA",$E($P($G(PSOSD(STA,DNM)),"^",5),1,2)="HA" K PSOELSE Q
 S CLS=1,MSG="Discontinued During "_$S('$G(PSONV):"New Prescription Entry",1:"Verification")_" - Duplicate Class" W !,PSONULN
 W !?5,$C(7),"*** SAME CLASS *** OF DRUG IN RX #"_$P(^PSRX(+PSOSD(STA,DNM),0),"^")_" FOR "_$P(DNM,"^"),!,"CLASS: "_PSODRUG("VA CLASS")
 S CAN=$P(PSOSD(STA,DNM),"^",2)'<11!($P(PSOSD(STA,DNM),"^",2)=1) S RXREC=+PSOSD(STA,DNM) I $P($G(PSOPAR),"^",10) D DATA Q
 E  W !,PSONULN K DIR S DIR(0)="E",DIR("A")="Press Return to continue" D ^DIR K DIR,DTOUT,DUOUT,DIRUT
 K PSOELSE Q
ULRX ;
 I '$G(RXRECLOC) Q
 D PSOUL^PSSLOCK(RXRECLOC)
 Q
 ; Apply additional auto RTS/Delete business rules
 ; Input:  FLG - pass by reference
 ;         RX - Prescription IEN
 ; Return: Boolean flag - 1: auto RS/Delete 0: normal process
CHK(FLG,RX) ; EP - IHS/MSC/PLS - 10/05/07 - New API for auto RTS/delete feature
 ;Only allow auto RTS/Delete on original prescriptions
 I $O(^PSRX(RX,1,0))!$O(^PSRX(RX,"P",0)) D  Q FLG
 .S FLG=0
 .W !,"The auto RTS/Delete feature is only available for original prescriptions."
 .W !,"This prescription has a refill and/or partial fill."
 ; Apply business rules for controlled substances
 N NAR,NMSG
 S NAR=$P($G(^PSDRUG(+$G(PSODRUG("IEN")),2)),U,3)["N"
 S NMSG="An Electronic Signature is required to auto RTS/Delete a controlled drug."
 I NAR,'$D(^XUSEC("PSDMGR",DUZ)) D  Q FLG
 .W !,"You must possess the PSDMGR security key to RTS controlled substance."
 .S FLG=0
 I NAR D
 .N X,X1,EXIT
 .S EXIT=0
 .F  Q:EXIT  D
 ..D SIG^XUSESIG
 ..I X[U S FLG=0,EXIT=1 W !,NMSG,!,"Bypassing auto RTS/Delete feature." Q
 ..I X1'="" S EXIT=1 Q
 ..W !,NMSG
 ..W !,"Please try again...Enter '^' to bypass."
 Q FLG
EXPCMF ; EP - Set flag to remove CMF flag on expired duplicate meds
 S ^TMP("PSORXDC",$J,RXREC,0)="52^"_RXREC_"^^^^"_STA_"^"_DNM_U_$G(APSPRTS)_U_$G(APSPCMF)
 Q
