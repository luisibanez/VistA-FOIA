PXRMLPHS ; SLC/PJH - Run Health Summaries from Patient List ;07/12/2002
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ; 
 ;External Ref DBIA #398
 ;
HSA(IEN) ;Run health summary for this patient list
 N BEG,DFN,DTOUT,DUOUT,END,HSIEN,OPT,SUB
 ;Initialise
 D FULL^VALM1
 K ^TMP("PXRMLPHS",$J)
 ;Reset screen mode
 W IORESET
 ;
 ;Prompt Text
 S OPT="Print Health Summary for all patients on this list"
 ;
 ;Check if OK to print
 D ASK(IEN,OPT) Q:$D(DUOUT)!$D(DTOUT)
 ;
 ;Select Health Summary
 D HSEL(.HSIEN) Q:$D(DTOUT)!$D(DUOUT)
 ;
 ;Determine whether the report should be queued.
JOB ;
 N PXRMQUE,%ZIS,ZTDESC,ZTRTN,ZTSK,ZTSAVE
 S %ZIS="M"
 S ZTDESC="Patient List Health Summaries - print"
 S ZTRTN="PRINT^PXRMLPHS"
 S ZTSAVE("*")=""
 S ZTSK=1
 S PXRMQUE=$$DEVICE^PXRMXQUE(ZTRTN,ZTDESC,.ZTSAVE,.%ZIS,.ZTSK)
 S VALMBCK="R"
HSEXIT Q
 ;
ASK(IEN,OPT) ;Verify OPTION
 N X,Y,TEXT
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="YA0"
 S DIR("A")=OPT_" ?: "
 S DIR("B")="N"
 S DIR("?")="Enter Y or N. For detailed help type ??"
 W !
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 I $E(Y(0))="N" S DUOUT=1 Q
 Q
 ;
HSEL(IEN) ;Select Health Summary Type
 N X,Y,DIC
HS1 S DIC=142,DIC(0)="QAEMZ"
 S DIC("A")="Select HEALTH SUMMARY TYPE: "
 W !
 D ^DIC
 I X="" W !,"A health summary type name must be entered" G HS1
 I X=(U_U) S DTOUT=1
 I Y=-1 S DUOUT=1
 I $D(DTOUT)!$D(DUOUT) Q
 ;Return HS ien
 S IEN=$P(Y,U)
 Q
 ;
HSI(DFN) ;Individual Health Summary
 N DTOUT,DUOUT,HSIEN,OPT,VADM,VAERR
 ;
 D DEM^VADPT
 ;
 ;Prompt Text
 S OPT="Print Health Summary for "_$G(VADM(1))
 ;
 ;Check if OK to print
 D ASK(DFN,OPT) Q:$D(DUOUT)!$D(DTOUT)
 ;
 ;Select Health Summary
 D HSEL(.HSIEN) Q:$D(DTOUT)!$D(DUOUT)
 ;
 N DIR,IEN,PXRMQUE,%ZIS,ZTDESC,ZTRTN,ZTSAVE
 S %ZIS="M"
 S ZTDESC="Print individual HS"
 S ZTRTN="HSOUT^PXRMLPHS(DFN,HSIEN)"
 S ZTSAVE("HSIEN")=""
 S PXRMQUE=0
 S PXRMQUE=$$DEVICE^PXRMXQUE(ZTRTN,ZTDESC,.ZTSAVE,.%ZIS,.ZTSK)
EXIT ;
 S DIR("A")="Enter RETURN to continue or '^' to exit",DIR(0)="E" D ^DIR
 Q
 ;
HSOUT(DFN,HSIEN) ;
 D ENX^GMTSDVR(DFN,HSIEN,"","") ; DBIA #398
 Q
 ;
PRINT ;Print HS for Pateint List IEN
 N DIROUT
 ;Sort list as required - BOOKMARK - merge with PXRMLPPA
 D SORT(IEN,"PXRMLPHS")
 ;Print HS for each patient
 S SUB=""
 F  S SUB=$O(^TMP("PXRMLPHS",$J,SUB)) Q:(SUB="")!$D(DIROUT)  D
 .S DFN=^TMP("PXRMLPHS",$J,SUB)
 .D ENX^GMTSDVR(DFN,HSIEN,"","") ; DBIA #398
 ;
 ;Clear workfile
 K ^TMP("PXRMLPHS",$J)
 ;
 Q
 ;
SAVE ;Variables required by print
 S ZTSAVE("BEG")=""
 S ZTSAVE("END")=""
 S ZTSAVE("HSIEN")=""
 S ZTSAVE("IEN")=""
 Q
 ;
SORT(IEN,NODE) ;Sort workfile as required
 N DATA,DFN,PNAME,IND,VADM,VAERR
 K ^TMP(NODE,$J)
 ;Build the list in alphabetical order.
 S IND=0
 F  S IND=$O(^PXRMXP(810.5,IEN,30,IND)) Q:'IND  D
 .S DATA=$G(^PXRMXP(810.5,IEN,30,IND,0)) Q:DATA=""
 .S DFN=$P(DATA,U) Q:'DFN
 .D DEM^VADPT S PNAME=$G(VADM(1)) Q:PNAME=""
 .S ^TMP(NODE,$J,PNAME)=DFN
 Q
