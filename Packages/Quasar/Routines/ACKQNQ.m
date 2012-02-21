ACKQNQ ;AUG/JLTP,AEM BIR/PTD HCIOFO/BH HCIOFO/AG-Inquire - A&SP Patient ; 04/01/99 
 ;;3.0;QUASAR;**8**;Feb 11, 2000
 ;Per VHA Directive 10-93-142, this routine SHOULD NOT be modified.
 ;
OPTN ;  Introduce option.
 S ACKQUIT=0
 W:IOST["C-" @IOF,!,"This option displays demographic data, inpatient status, and diagnostic",!,"history for a selected A&SP patient."
 ;
DIC ;  LOOKUP PATIENT
 N DIC
 W ! S DIC=509850.2,DIC(0)="AEMQ" D ^DIC
 I (Y<0)!($D(DUOUT)) S ACKQUIT=1 G EXIT
 S ACKDFN=+Y
 ;
ASK ;  Update patient's diagnostic history?
 S DIR(0)="Y",DIR("A")="Do you want to update this patient's diagnostic history NOW",DIR("B")="NO",DIR("?")="Enter YES to recompile the Problem List; enter NO to continue."
 S DIR("??")="^D UPDATE^ACKQHLP1" W ! D ^DIR K DIR G:$D(DIRUT) EXIT I Y=1 D UPDATE
 ;
DEV W !!,"The right margin for this report is 80.",!,"You can queue it to run at a later time.",!
 K %ZIS,IOP S %ZIS="QM",%ZIS("B")="" D ^%ZIS I POP W !,"NO DEVICE SELECTED OR REPORT PRINTED." G EXIT
 I $D(IO("Q")) K IO("Q") S ZTRTN="EN^ACKQNQ",ZTSAVE("ACKDFN")="",ZTDESC="QUASAR - Inquire - A&SP Patient" D ^%ZTLOAD D HOME^%ZIS K ZTSK D EXIT
 ;
EN U IO N DFN,I,X,Y S DFN=ACKDFN
 D DEM^VADPT,INP^VADPT,ELIG^VADPT
 S ACKIVD=$$NUMDT^ACKQUTL($P(^ACK(509850.2,DFN,0),U,2))
 K ACK S ACK(1)=VADM(1),ACK(2)=$P(VADM(3),U,2),ACK(3)=$P(VADM(2),U,2),ACK(4)=VADM(7),ACK(6)=$P(VAIN(4),U,2)
 S ACKINP=$S($L(ACK(6)):1,1:0),ACK(5)="Patient is "_$S(ACKINP:"",1:"not ")_"currently an inpatient."
 S ACK(7)=VAIN(5),ACK(8)=$P(VAIN(3),U,2),ACK(9)=$P(VAEL(1),U,2)
 ;
 ;
PRINT W:IOST @IOF S X="Patient Inquiry" D CNTR^ACKQUTL(X)
 ;
 W !!
 W "PATIENT: ",ACK(1),?45,"DOB: ",ACK(2),?63,"SSN: ",ACK(3)
 W !,"ELIGIBILITY: ",ACK(9)
 W ?45,"INITIAL VISIT DATE: ",ACKIVD
 W:$L(ACK(4)) !,ACK(4) W !,ACK(5) D:ACKINP INP
 ;
 I $P(VAEL(3),U,1) W !!,"Patient is Service Connected.",!
 I '$P(VAEL(3),U,1) D
 . S ACKPAT=DFN D STATUS^ACKQUTL4 K VASV
 . D NOT^ACKQUTL7("Patient is not Service Connected.",ACKAO,ACKRAD,ACKENV)
 . K ACKPAT,ACKAO,ACKRAD,ACKENV
 ;
 D RATDIS
 W !!,"Patient Diagnostic History",!,$S($P(VADM(5),U)="F":"Ms. ",1:"Mr. "),$P(VADM(1),",")," has been seen for the following:",! D DIHEAD,ICDSORT
 K DIRUT W ! S ACKI="" F  S ACKI=$O(ACKICD(ACKI)) Q:ACKI=""  D:$Y>(IOSL-5) WAIT Q:$D(DIRUT)  W !,$P(ACKICD(ACKI),U),?15,$P(ACKICD(ACKI),U,3),?60,$$NUMDT^ACKQUTL($P(ACKICD(ACKI),U,4))
 ;
 ;
EXIT I $G(ACKVISIT)'="",$G(DIRUT)=1 S ACKDIRUT=1  ;  Quit flag for template
 K %ZIS,ACK,ACKDC,ACKDD,ACKDFN,ACKDN,ACKI,ACKICD,ACKINP,ACKIVD,ACKLINE
 K ACKRD,DIRUT,DTOUT,DUOUT,VA,VADM,VAEL,VAERR,VAIN,X,X1,Y,ZTDESC,ZTIO
 K ZTRTN,ZTSAVE
 I ACKQUIT=1 D KILL^%ZISS Q
 I $E(IOST)="C" W !!,"Press return to continue." R X:DTIME  W @IOF
 D ^%ZISC S:$D(ZTQUEUED) ZTREQ="@"
 S ACKQUIT=0 G DIC
 Q
 ;
EN1 ;  CALL THIS ENTRY POINT INSTEAD OF EN
 D HOME^%ZIS G EN
 ;
 ;
INP ;  PRINT INPATIENT INFO
 W !,"WARD: ",ACK(6),?20,"ROOM/BED: ",ACK(7),?40,"TREATING SPEC: ",$E(ACK(8),1,25)
 Q
 ;
 ;
RATDIS ;  Display Patients RATED DISABILITIES
 Q:'$O(^DPT(DFN,.372,0))
 D ENS^%ZISS
 W !!,IOUON,"Rated Disabilities",IOUOFF,!
 S ACKRD=0 F  S ACKRD=$O(^DPT(DFN,.372,ACKRD)) Q:'ACKRD  D
 .S X=^DPT(DFN,.372,ACKRD,0),X1=$P(^DIC(31,+X,0),U)
 .W !,X1_"  ("_$P(X,U,2)_"%)" I $P(X,U,3) W "  (SC)"
 W ! Q
 ;
 ;
CLASDIS ;  Display Patient Servive Classifications
 I '$D(ACKQSER),'$D(ACKQORG),'$D(ACKQIR),'$D(ACKQECON) Q
 D ENS^%ZISS
 W !,IOUON,"Service Classifications",IOUOFF,!
 W:$D(ACKQSER) " SERVICE-CONNECTED " W:$D(ACKQORG) " AGENT-ORANGE " W:$D(ACKQIR) " RADIATION " W:$D(ACKQECON) " ENVIRONMENTAL-CONTAMINANTS"
 W !
 Q
 ;
 ;
WAIT I $E(IOST)'="C" W @IOF Q
 S DIR(0)="E" D ^DIR K DIR Q:$D(DIRUT)  W @IOF,"Patient Diagnostic History (Cont'd)","  (",ACK(1),")" D DIHEAD
 Q
 ;
 ;
DIHEAD W !,"DIAGNOSIS",?60,"DATE ENTERED" S ACKLINE="",$P(ACKLINE,"-",IOM)="" W !,ACKLINE
 Q
 ;
 ;
ICDSORT S ACKI=0 F  S ACKI=$O(^ACK(509850.2,DFN,1,ACKI)) Q:'ACKI  D
 . S ACKDC=^ACK(509850.2,DFN,1,ACKI,0),ACKDD=$P(ACKDC,U,2)
 . D GETS^DIQ(80,+ACKDC_",",".01","E","ACKTGT","ACKMSG")
 . S ACKDN=ACKTGT(80,+ACKDC_",",.01,"E")
 . S ACKICD(ACKDN)=ACKDN_U_""_U_$$DIAGTXT^ACKQUTL8(+ACKDC,ACKDD)_U_ACKDD
 K ACKTGT,ACKMSG
 Q
 ;
UPDATE ;  Update patient's diagnostic history in 509850.2.
 ;  ACKDFN is defined upon entry to this module.
 D WAIT^DICD W !
 D PROBLIST^ACKQUTL3(ACKDFN,1)
 Q
 ;
 ;
