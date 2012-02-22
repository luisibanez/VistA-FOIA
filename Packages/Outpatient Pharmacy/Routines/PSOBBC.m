PSOBBC ;IHS/DSD/JCM-BATCH BARCODE DRIVER ;3/30/06 10:10am
 ;;7.0;OUTPATIENT PHARMACY;**11,22,27,34,46,130,146,185,242,264,300**;DEC 1997;Build 4
 ;External reference to ^IBE(350.1,"ANEW" supported by DBIA 592
 ;External references CHPUS^IBACUS and TRI^IBACUS supported by DBIA 2030
 ;External references LK^ORX2 and ULK^ORX2 supported by DBIA 867
 ;External references ^PS(55 supported by DBIA 2228
 ;External references U, UL, PSOL, and PSOUL^PSSLOCK supported by DBIA 2789
 ;PSO*242 change default to from Q to S
 ;-------------------------------------------------------------------
START ;
 N PSODFN,PSOBBCNO
 D INIT I '$D(PSOPAR) D ^PSOLSET G:'$D(PSOPAR) EOJ
 I $G(PSOSITE) S PSOBARID=$G(^PS(59,PSOSITE,"IB")) I '$D(^IBE(350.1,"ANEW",+PSOBARID,1,1)) D  S PSORX("QFLG")=1 K PSOBARID G END
 .W $C(7),!!,"WARNING: Pharmacy Copay not working,",!,?10,"Check IB SERVICE/SECTION in Pharmacy Site File.",!!!,"You will not be able to enter any new prescriptions until this is corrected!"
 S PSOBBC("QFLG")=0,PSORX("BAR CODE")=1
 D FROM I PSOBBC("QFLG") S PSORX("QFLG")=1 G END
 D ASK I PSOBBC("QFLG") S PSORX("QFLG")=1 G END
 D PROCESS
END D EOJ
 Q
 ;--------------------------------------------------------------------
INIT ;
 S PSOBBC("QFLG")=0,PSORX("BAR CODE")=1 K PPL
 I '$G(PSOINST) D
 .K DIC,DR,DIQ S DA=$P($$SITE^VASITE(),"^") I DA D
 ..K PSOINST S DIC=4,DIQ(0)="I",DR=99,DIQ="PSOINST" D EN^DIQ1
 ..S PSOINST=PSOINST(4,DA,99,"I") K DIC,DA,DIQ,PSOINST(4)
 Q
FROM ;
 S DIR(0)="S^1:REFILLS;2:RENEWS;"
 S DIR("A")="Batch Barcode for",DIR("B")="REFILLS"
 D DIR G:'Y FROMX
 S PSOBBC1("FROM")=$S(Y=1:"REFILL",1:"NEW")
FROMX K X,Y,DIR
 Q
 ;
ASK ;
 K BINGCRT,BINGRTE,BBRX
 W !,"Please answer the following for this session of prescriptions",!
 D EN^PSOREF2(.PSOBBC) I PSOBBC("DFLG") S PSOBBC("QFLG")=1 G ASKX
 D SUSP
 D INPT,CNH
 D:'$P($G(PSOPAR),"^",6) EARLY
 D SET
 D:PSOBBC1("FROM")="NEW" NOORE^PSONEW(.PSOBBC) S:$G(PSOBBC("NOO"))'="" PSOBBCNO=$G(PSOBBC("NOO")) S:$G(PSOBBC("DFLG")) PSOBBC("QFLG")=1
ASKX Q
 ;
SUSP ;
 S DIR(0)="SAB^Q:QUEUED;S:SUSPENDED"
 S DIR("A")="Will these refills be Queued or Suspended ? "
 S DIR("B")="S"   ;PSO*242
 D DIR G:PSOBBC("QFLG") SUSPX
 S (PSOBBC1("QS"),PSOBBC("QS"))=Y S:PSOBBC1("QS")="S" BINGCRT=0
SUSPX K X,Y,DIR
 Q
 ;
INPT ;
 S DIR(0)="YA"
 S DIR("A")="Allow refills for inpatient ? "
 S DIR("B")="N"
 D DIR G:PSOBBC("QFLG") INPTX
 S (PSOBBC1("INOK"),PSOBBC("INOK"))=Y
INPTX K X,Y,DIR
 Q
CNH ;
 S DIR(0)="YA"
 S DIR("A")="Allow refills for CNH ? "
 S DIR("B")="N"
 D DIR G:PSOBBC("QFLG") CNHX
 S (PSOBBC1("CNHOK"),PSOBBC("CNHOK"))=Y
CNHX K X,Y,DIR
 Q
 ;
EARLY ;
 S DIR(0)="YA"
 S DIR("A")="Allow early refills ? "
 S DIR("B")="N"
 D DIR G:PSOBBC("QFLG") EARLYX
 S (PSOBBC1("EAOK"),PSOBBC("EAOK"))=Y
EARLYX K X,Y,DIR
 Q
 ;
SET ;
 S PSOBBC1("MAIL/WINDOW")=PSOBBC("MAIL/WINDOW") S:PSOBBC1("MAIL/WINDOW")="W" BINGRTE="W"
 S PSOBBC1("FILL DATE")=PSOBBC("FILL DATE")
 S:$G(PSOBBC("CLERK CODE")) PSOBBC1("CLERK CODE")=PSOBBC("CLERK CODE")
 S:$G(PSOBBC("EXPIRATION DATE")) PSOBBC1("EXPIRATION DATE")=PSOBBC("EXPIRATION DATE")
 Q
DIR ;
 D ^DIR
 S:$D(DIRUT) PSOBBC("QFLG")=1,PSORX("QFLG")=1
 K DIRUT,DUOUT,DTOUT,DIROUT
 Q
 ;
PROCESS ;
 S PSOBBC("DFLG")=0 D NOW^%DTC S TM=$E(%,1,12),TM1=$P(TM,".",2)
 S RXN=$O(^TMP("PSORXN",$J,0)) I RXN D
 .S RXN1=^TMP("PSORXN",$J,RXN) D EN^PSOHLSN1(RXN,$P(RXN1,"^"),$P(RXN1,"^",2),"",$P(RXN1,"^",3))
 .I $P(^PSRX(RXN,"STA"),"^")=5 D EN^PSOHLSN1(RXN,"SC","ZS","")
 K RXN,RXN1,^TMP("PSORXN",$J) D CLEAN^PSOVER1 K ^TMP("PSORXDC",$J)
 D GETRXM D:PSOBBC("QFLG") ULK,ULP,ULRX G:PSOBBC("QFLG") PROCESSX
 I $G(PSODFN)'=$P(^PSRX(PSOBBC("IRXN"),0),"^",2) D  G:PSOBBC("DFLG") PROCESS
 .I $G(PSODFN) D ULK,ULP
 .D PT Q:PSOBBC("DFLG")
 .D PROFILE^PSORX1
 E  D PTC G:PSOBBC("DFLG") PROCESS
 D:'$G(PSOSD) ^PSOBUILD
 S PSOBBC("DONE")=PSOBBC("IRXN")_","
 D @PSOBBC1("FROM") S:$G(PPL)&$D(BINGRTE) BBRX(1)=$S($D(PSOBBC("DONE")):PSOBBC("DONE"),1:BBRX) D:$D(BINGCRT)&($D(BINGRTE)&($D(DISGROUP))) ^PSOBING1 K BBRX D ULRX G PROCESS
PROCESSX I $G(PPL) D SETX,TRI,Q^PSORXL K PPL,RXFL
 Q
GETRXM ;
 K DIR,PSOBBC("IRXN"),PSOREFXM
 S DIR(0)="FO^5:245^K:X'?3N1""-""1.N X"
 S DIR("A")="WAND BARCODE"
 S DIR("?",1)="Wand the barcoded number of the prescription to be processed."
 S DIR("?",2)="The number should be of the form NNN-NNNNNN"
 S DIR("?",3)="where the number before the dash is your station number."
 S DIR("?")="Enter ""^"", or a RETURN to quit."
 D DIR G:PSOBBC("QFLG") GETRXMX
 I $P(X,"-")'=PSOINST W !?7,$C(7),$C(7),$C(7),"Not From this Institution" G GETRXM
 S (PSOBBC("IRXN"),PSOBBC("OIRXN"),BBRX)=$P(X,"-",2)
 I $G(^PSRX(PSOBBC("IRXN"),0))']"" W !,$C(7),"Rx data is not on file !",! G GETRXM
 S PSOXDFN=+$P($G(^PSRX(PSOBBC("IRXN"),0)),"^",2) I PSOXDFN S PSOLOUD=1 D:$P($G(^PS(55,PSOXDFN,0)),"^",6)'=2 EN^PSOHLUP(PSOXDFN) K PSOLOUD
 K PSOXDFN I $P($G(^PSRX(PSOBBC("IRXN"),"STA")),"^")=13 W !,$C(7),"Rx has already been deleted." G GETRXM
 I $G(PSOBBC("DONE"))[PSOBBC("IRXN")_"," W !,$C(7),"Rx has already been entered" G GETRXM
 I $G(PSOBBC1("FROM"))="REFILL" S PSOREFXM=$G(PSOBBC("IRXN")) I PSOREFXM D PSOL^PSSLOCK(PSOREFXM) I '$G(PSOMSG) D  K PSOMSG G GETRXM
 .I $P($G(PSOMSG),"^",2)'="" W $C(7),!!?5,$P(PSOMSG,"^",2),! Q
 .W $C(7),!!?5,"Another person is editing Rx "_$P($G(^PSRX(+$G(PSOBBC("IRXN")),0)),"^"),!
 I '$D(PSODFNX(+$P(^PSRX(PSOBBC("IRXN"),0),"^",2))),$G(PSOBBC1("FROM"))="NEW" K PSONOERR D  G:'$G(PSOPLCK)!($G(PSONOERR)) GETRXM
 .S PSOPLCK=$$L^PSSLOCK(+$P(^PSRX(PSOBBC("IRXN"),0),"^",2),0) I '$G(PSOPLCK) D LOCK^PSOORCPY Q
 .S X=+$P(^PSRX(PSOBBC("IRXN"),0),"^",2)_";DPT(" D LK^ORX2 I 'Y S PSONOERR=1 D UL^PSSLOCK(+$P(^PSRX(PSOBBC("IRXN"),0),"^",2)) Q
 .S PSODFNX(+$P(^PSRX(PSOBBC("IRXN"),0),"^",2))=""
GETRXMX K X,Y,DIR,PSOOPT
 Q
 ;
PT ;
 S PSOBBC("DFLG")=0
 W !,$C(7),"New Patient, please pause"
 I $G(PPL) D SETX,TRI,Q^PSORXL K PPL
 K RXFL
 S (DFN,PSODFN)=$P(^PSRX(PSOBBC("IRXN"),0),"^",2),PSORX("NAME")=$P(^DPT(PSODFN,0),"^")
 D ICN^PSODPT(DFN)
 ;CHECK FOR BAD ADDRESS/SAB
 S PSOLOUD=1 D:$P($G(^PS(55,PSODFN,0)),"^",6)'=2 EN^PSOHLUP(PSODFN) K PSOLOUD
 D ^PSOBUILD
 S PSOX=$G(^PS(55,PSODFN,"PS")) I PSOX]"" S PSORX("PATIENT STATUS")=$P($G(^PS(53,PSOX,0)),"^")
 K PSOX
PTC S (DFN,PSODFN)=$P(^PSRX(PSOBBC("IRXN"),0),"^",2)
 S PSOLOUD=1 D:$P($G(^PS(55,PSODFN,0)),"^",6)'=2 EN^PSOHLUP(PSODFN) K PSOLOUD
 S PSOBBC("DFLG")=0 D GET^PSOPTPST
 I $G(PSOPTPST(2,PSODFN,.351))]"" S PSOBBC("DFLG")=1 D DEAD^PSOPTPST G PTX
 N PSOTPEXT I $G(PSOBBC1("FROM"))="NEW",$D(^PS(52.91,PSODFN,0)) I '$P(^PS(52.91,PSODFN,0),"^",3)!($P(^(0),"^",3)>DT) D PDIR^PSOTPCAN(PSODFN) I $G(PSOTPEXT) K PSOTPEXT S PSOBBC("DFLG")=1 G PTX
 K PSOTPEXT
 I $G(PSOPTPST(2,PSODFN,.1))]"" D:'PSOBBC("INOK") PID W !,$C(7),?10,"PATIENT IS AN INPATIENT ON WARD ",PSOPTPST(2,PSODFN,.1)," !!" I 'PSOBBC("INOK") S PSOBBC("DFLG")=1 G PTX
 K PSORX("CNH")
 I $G(PSOPTPST(2,PSODFN,148))="YES" D:'PSOBBC("CNHOK") PID W !,$C(7),?10,"PATIENT IS IN A CONTRACT NURSING HOME !!" S:PSOBBC("CNHOK") PSORX("CNH")=1 I 'PSOBBC("CNHOK") S PSOBBC("DFLG")=1 G PTX
 D:PSOBBC1("FROM")="NEW" COPAY^PSOPTPST
PTX K PSOPTPST W:PSOBBC("DFLG") !!,$C(7),"Rx not filled"
 Q
 ;
REFILL ;
 N PSOFROM S PSOFROM="REFILL",XFROM="BATCH"
 D EN^PSOREF0(.PSOBBC)
 Q
REFILLX ;
 Q
 ;
NEW ;
 N PSOFROM S (PSOFROM,XFROM)="BATCH"
 S PSOBBC("OIRXN")=PSOBBC("IRXN")
 S PSORNW("FILL DATE")=PSOBBC1("FILL DATE"),PSOOPT=3
 S PSORX("DFLG")=0,PSOBBC("NOO")=$G(PSOBBCNO) D EN^PSORENW0(.PSOBBC)
 S PSOBBC("MAIL/WINDOW")=PSOBBC1("MAIL/WINDOW")
 S PSOBBC("EAOK")=$G(PSOBBC1("EAOK"))
 S PSOBBC("QS")=PSOBBC1("QS")
 S PSOBBC("INOK")=PSOBBC1("INOK")
 S PSOBBC("CNHOK")=PSOBBC1("CNHOK")
 S:$G(PSOBBC1("CLERK CODE")) PSOBBC("CLERK CODE")=PSOBBC1("CLERK CODE")
 S:$G(PSOBBC1("EXPIRATION DATE")) PSOBBC("EXPIRATION DATE")=PSOBBC1("EXPIRATION DATE")
 K PSORNW,PSOOPT
 Q
 ;
EOJ ;
 K PSOMSG,PSOREFXM,PSONOERR,PSOPLCK,PSOSD,PSOBBC,PSOBBC1,PSOBARID,Y,X,XFROM,PSOCOUU,PSOCOU,ACNT,ADFN,CLS,CMOP,CNT,FDR,HDR,PSCAN,JJ,POERR,PSOBCK,PSONEW3,PSORENW3,RXFL,PSOOPT
 K PSORX,RFDT,RX1,RXS,SDA,PSONOOR,VALMBCK,VALMSG,SIG,SIGOK,STA,TM,TM1,VA,VADM,VAEL,VAPA
 D CLEAN^PSOVER1 K ^TMP("PSORXDC",$J)
 Q
TRI ;Check for Tricare Rx's
 S X="IBACUS" X ^%ZOSF("TEST") I '$T Q
 I '$$TRI^IBACUS Q
 Q:'$G(PPL)
 ;PREV LINE, IN V 7 D ZOSF FIRST
 N DA,NEWPPL,WWFLAG,PSOWRX,PSOWW,WWNEXT,WXRX,WPAT,WSITE,WDUZ,WFILL,WLOOP,WBILL,WPPLFLG,WWW
 D DEV^PSOCPTRI
 S NEWPPL=PPL S PPL=""
 S (WWFLAG,WPPLFLG)=0 F PSOWW=1:1 S PSOWRX=$P(NEWPPL,",",PSOWW) D  Q:$G(WWFLAG)
 .S WWNEXT=$P(NEWPPL,",",(PSOWW+1)) I WWNEXT=""!(WWNEXT=",") S WWFLAG=1
 .I '$G(DT) S DT=$$DT^XLFDT
 .S WPAT=$P($G(^PSRX(+PSOWRX,0)),"^",2),WSITE=+$G(PSOSITE),WDUZ=+$G(DUZ)
 .S WFILL=0 F WLOOP=0:0 S WLOOP=$O(^PSRX(+PSOWRX,1,WLOOP)) Q:'WLOOP  S WFILL=WLOOP
 .S WBILL=$$CHPUS^IBACUS(WPAT,DT,PSOWRX,WFILL,PSOLAP,WSITE,WDUZ)
 .I '$G(WBILL) S WXRX(PSOWW,PSOWRX)="" Q
 .S WPPLFLG=1
 .S FLD(99)="99",FLD(99.1)="Awaiting CHAMPUS billing approval"
 .N RSDT,ACT,PSUS,RXF,I,PSDA,NOW,IR,FDA,RFN S DA=PSOWRX D H^PSOCPTRH Q
 I '$G(WPPLFLG) S PPL=NEWPPL Q
 S WWW="" F  S WWW=$O(WXRX(WWW)) Q:WWW=""  D
 .I $G(PPL)="" S PPL=$O(WXRX(WWW,0))_"," Q
 .S PPL=PPL_$O(WXRX(WWW,0))_","
 Q
ULK ;
 Q:$G(PSOBBC1("FROM"))'="NEW"
 I '$G(PSODFN) Q
 S X=PSODFN_";DPT(" D ULK^ORX2 K PSODFNX(PSODFN) Q
ULP Q:$G(PSOBBC1("FROM"))'="NEW"
 Q:'$G(PSODFN)
 D UL^PSSLOCK(PSODFN)
 Q
ULRX ;
 Q:$G(PSOBBC1("FROM"))'="REFILL"
 Q:'$G(PSOREFXM)
 D PSOUL^PSSLOCK(PSOREFXM)
 K PSOREFXM
 Q
 ;
SETX ;
 S:$G(PSOBBC1("FROM"))="REFILL" XFROM="BATCH"
 S:$G(PSOBBC1("FROM"))="NEW" XFROM="BATCH"
 Q
PID ;
 I '$G(DFN) S DFN=+$G(PSODFN)
 Q:'$G(DFN)
 K VAPTYP D PID^VADPT
 W !!,?9,$G(PSORX("NAME"))_"    ",$G(VA("BID"))
 K VA("BID"),VA("PID")
 Q
