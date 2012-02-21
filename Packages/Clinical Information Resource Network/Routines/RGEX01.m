RGEX01 ;BAY/ALS-LIST MANAGER FOR MPI/PD EXCEPTIONS ;10/07/99
 ;;1.0;CLINICAL INFO RESOURCE NETWORK;**3,12,19,23,43**;30 Apr 99
 ;
 ;Reference to MAIN^VAFCPDAT supported by IA #3299
EN ; -- main entry point for RG EXCPT SUMMARY
 N STDT,ENDDT,PRGSTAT,XFLAG
 S XFLAG=0
 S STDT=$P($G(^RGSITE(991.8,1,"EXCPRG")),"^",1)
 I $D(STDT) S STDT=$$FMTE^XLFDT(STDT,1)
 S PRGSTAT=$P($G(^RGSITE(991.8,1,"EXCPRG")),"^",3)
 I PRGSTAT="" D
 . W $C(7)
 . W !!,"The MPI/PD Exception Purge process has not been run."
 . S DIR(0)="YA",DIR("B")="NO"
 . S DIR("??")="^D HLPPRG^RGEX01"
 . S DIR("A")="Do you want to run it now? "
 . D ^DIR K DIR
 . I $D(DIRUT)!$D(DUOUT) S XFLAG=1 Q
 . I Y>0 D
 .. W !!,"The MPI/PD Exception Purge process will now run."
 .. W !,"Please come back to this option in ten minutes."
 .. S XFLAG=1 D QUEPRG
 L +^RGHL7(991.1,"RG PURGE EXCEPTION"):0 I '$T W $C(7),!!,"The MPI/PD Exception Purge process is currently running.",!,"Please try this option again in ten minutes." S XFLAG=1 G EXIT
 L -^RGHL7(991.1,"RG PURGE EXCEPTION")
 I $G(PRGSTAT)="C" D
 . W !!,"The MPI/PD Exception Purge process last ran "_STDT_"."
 . S DIR(0)="YA",DIR("B")="NO",DIR("??")="^D HLPPRG^RGEX01"
 . S DIR("A")="Do you want to run the MPI/PD Exception Purge process now? "
 . D ^DIR K DIR,RGANS S RGANS=Y
 . I $D(DIRUT)!$D(DUOUT) S XFLAG=1 Q
 . Q:RGANS=0  ;**43
 . L +^RGHL7(991.1,"RG PURGE EXCEPTION"):0 I '$T S RGANS=0 Q  ;**43
 . L -^RGHL7(991.1,"RG PURGE EXCEPTION")
 . I RGANS>0 D
 .. W !!,"The MPI/PD Exception Purge process will now run."
 .. W !,"Please come back to this option in ten minutes."
 .. S XFLAG=1 D QUEPRG
 I XFLAG=1 G EXIT
 K RGANS
 D WAIT^DICD
 D EN^VALM("RG EXCPT SUMMARY")
 Q
 ;
HDR ; -- header code
 S VALMHDR(1)="MPI/PD Exception Handling"
 S VALMHDR(2)=""
 Q
 ;
INIT ; -- init variables and list array
 I '$D(RGSORT) S RGSORT="SD"
 K @VALMAR
 I RGSORT="SD" D DTLIST^RGEXHND1
 E  I RGSORT="ST" D EXCLST^RGEXHND1
 E  I RGSORT="SN" D PATLST^RGEXHND1
 E  I RGSORT="VT" D SELTYP^RGEXHND1
 Q
 ;
SORT ;
 D INIT
 S VALMBCK="R"
 Q
HELP ; -- help code
 S X="?" D DISP^XQORM1 W !!
 Q
HLPPRG ;
 W !,"Enter Y(YES) to run the MPI/PD Exception Purge process now."
 W !!,"Enter N(NO) to go directly into the MPI/PD Exception Handling option."
 Q
 ;
EXIT ; -- exit code
 K VADM,RGDFN,RGNM,RGSORT,RGSSN,STAT,STRING,NDX,NM,IEN,IEN2,X,DATA,CNT,EXCTYPE,ETYPE,^TMP("RGEXC",$J),^TMP("RGEX01",$J)
 Q
QUEPRG S ZTRTN="MAIN^RGEVPRG",ZTDESC="PURGE ZZ*, OVER 30 DAY AND DUPLICATE RECORDS FROM THE CIRN HL7 EXCEPTION LOG FILE"
 D NOW^%DTC
 S ZTIO="",ZTDTH=%
 I $D(DUZ) S ZTSAVE("DUZ")=DUZ
 D ^%ZTLOAD
 D HOME^%ZIS K IO("Q")
 K ZTDESC,ZTDTH,ZTIO,ZTQUEUED,ZTREQ,ZTRTN,ZTSAVE,ZTSK,%
 Q
 ;
EXPND ; -- expand code
 Q
CUREX() ;Call to check if there are any patients in the CIRN HL7 EXCEPTION
 ;LOG file (#991.1) that currently need to be resolved
 N STAT,EXCTYP,RGEX
 S STAT="",EXCTYP="",RGEX=0
 F  S STAT=$O(^RGHL7(991.1,"ASTAT",STAT)) Q:STAT=""!RGEX=1  D
 . F  S EXCTYP=$O(^RGHL7(991.1,"ASTAT",STAT,EXCTYP)) Q:'EXCTYP!RGEX=1  D
 .. I (EXCTYP=(209)!((EXCTYP>212)&(EXCTYP<219)))&(STAT=0) S RGEX=1
 Q RGEX
PROC ; For a given patient, set exceptions STATUS to PROCESSED.
 ; DFN must be defined
 Q:'$D(DFN)
 S EXCTYP=""
 S HOME=$$SITE^VASITE()
 F  S EXCTYP=$O(^RGHL7(991.1,"ADFN",EXCTYP)) Q:'EXCTYP  D
 . S RGDFN="",ICN=""
 . F  S RGDFN=$O(^RGHL7(991.1,"ADFN",EXCTYP,RGDFN)) Q:'RGDFN  D
 .. I DFN=RGDFN D
 ... S ICN=+$$GETICN^MPIF001(DFN)
 ... ;Only set to PROCESSED if patient has national ICN.
 ... I $E(ICN,1,3)'=$E($P(HOME,"^",3),1,3)&(ICN>0) D
 .... ;Exclude Death exceptions (215-217); they must be processed manually.
 .... ;Exclude 218 Potential Matches Returned exception **43
 .... I (EXCTYP>218)!(EXCTYP<215) D
 ..... S IEN=0
 ..... F  S IEN=$O(^RGHL7(991.1,"ADFN",EXCTYP,RGDFN,IEN)) Q:'IEN  D
 ...... S IEN2=0
 ...... F  S IEN2=$O(^RGHL7(991.1,"ADFN",EXCTYP,RGDFN,IEN,IEN2)) Q:'IEN2  D
 ....... L +^RGHL7(991.1,IEN):10
 ....... S DA(1)=IEN,DA=IEN2,DR="6///"_1,DIE="^RGHL7(991.1,"_DA(1)_",1,"
 ....... D ^DIE K DIE,DA,DR
 ....... L -^RGHL7(991.1,IEN)
 K IEN,IEN2,RGDFN,EXCTYP,ICN
 Q
PDAT ;
 K DIRUT
 W !,"This report prints MPI/PD Data for a selected patient.  The"
 W !,"information displayed includes the Integration Control Number"
 W !,"(ICN), Coordinating Master of Record (CMOR), MPI/PD Activity"
 W !,"Score, Subscription Control Number, Treating Facility list,"
 W !,"CMOR History and CMOR Change Request History."
 W !!,"The information is pulled from the Patient (#2) file, Treating"
 W !,"Facility List (#391.91) file and MPIF CMOR Request (#984.9) file."
ASK ;Ask for PATIENT
 I $D(DIRUT) G QUIT
 W !!,"Patient lookup can be done by Patient Name/SSN or by ICN.",!
 N DFN,ICN
 S DIC="^DPT(",DIC(0)="QEAM",DIC("A")="Select PATIENT: ",D="SSN^AICN^B^BS^BS5"
 D MIX^DIC1 K DIC
 G:Y<0 QUIT
 S DFN=+Y
 D MAIN^VAFCPDAT
 G ASK
 Q
QUIT ;
 K DFN,ICN,D,Y,HOME
