PXRMDEV ; SLC/PKR - This is a driver for testing Clinical Reminders.;01/11/2005
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;==================================================
CMOUT ;Do formatted Clinical Maintenance output.
 N DUE,DUECOL,HIST,LAST,LASTCOL,LNUM,RIEN,RNAME,STATUS,STATCOL,TEMP,TYPE
 W !!,"Formatted Output:"
 S RIEN=$O(^TMP("PXRHM",$J,""))
 S RNAME=$O(^TMP("PXRHM",$J,RIEN,""))
 S TEMP=$G(^TMP("PXRHM",$J,RIEN,RNAME))
 S STATUS=$P(TEMP,U,1)
 S DUE=$$EDATE^PXRMDATE($P(TEMP,U,2))
 S LAST=$$EDATE^PXRMDATE($P(TEMP,U,3))
 S STATCOL=41-($L(STATUS)/2)
 S DUECOL=53-($L(DUE)/2)
 S LASTCOL=67-($L(LAST)/2)
 W !!,?36,"--STATUS--",?47,"--DUE DATE--",?61,"--LAST DONE--",!
 W !,RNAME,?STATCOL,STATUS,?DUECOL,DUE,?LASTCOL,LAST,!
 S LNUM=0
 F  S LNUM=$O(^TMP("PXRHM",$J,RIEN,RNAME,"TXT",LNUM)) Q:LNUM=""  D
 . W !,^TMP("PXRHM",$J,RIEN,RNAME,"TXT",LNUM)
 Q
 ;
 ;==================================================
DEB ;Prompt for patient and reminder by name input component.
 N DFN,DIC,DIR,DIROUT,DTOUT,DUOUT,PXRMITEM,PXRHM,X,Y
 S DIC=2,DIC("A")="Select Patient: "
 S DIC(0)="AEQMZ"
 D ^DIC
 I $D(DTOUT)!$D(DUOUT) Q
 S DFN=+$P(Y,U,1)
 I DFN=-1 W !,"No patient selected!" Q
 S DIC=811.9,DIC("A")="Select Reminder: "
 D ^DIC
 I $D(DIROUT)!$D(DIRUT) Q
 I $D(DTOUT)!$D(DUOUT) Q
 S PXRMITEM=+$P(Y,U,1)
 I PXRMITEM=-1 W !,"No reminder selected!" Q
 S DIR(0)="LA"_U_"0"
 S DIR("A")="Enter component number 0, 1, 5, 10, 11: "
 D ^DIR
 I $D(DIROUT)!$D(DIRUT) Q
 I $D(DTOUT)!$D(DUOUT) Q
 I X="" S X=5
 S PXRHM=X
 D DOREM(DFN,PXRMITEM,PXRHM)
 Q
 ;
 ;==================================================
DEV ;Prompt for patient and reminder by name.
 N DFN,DIC,DIR,DIROUT,DIRUT,DTOUT,DUOUT,PXRMITEM,PXRHM,X,Y
 S DIC=2,DIC("A")="Select Patient: "
 S DIC(0)="AEQMZ"
 D ^DIC
 I $D(DIROUT)!$D(DIRUT) Q
 I $D(DTOUT)!$D(DUOUT) Q
 S DFN=+$P(Y,U,1)
 I DFN=-1 W !,"No patient selected!" Q
 S DIC=811.9,DIC("A")="Select Reminder: "
 D ^DIC
 I $D(DIROUT)!$D(DIRUT) Q
 I $D(DTOUT)!$D(DUOUT) Q
 S PXRMITEM=+$P(Y,U,1)
 I PXRMITEM=-1 W !,"No reminder selected!" Q
 S PXRHM=5
 D DOREM(DFN,PXRMITEM,5)
 Q
 ;
 ;==================================================
DEVD ;Prompt for patient and reminder by name and evaluation date.
 N DATE,DFN,DIC,DIROUT,DIRUT,DTOUT,DUOUT,PXRMITEM,PXRHM,REF,X,Y
 S DIC=2,DIC("A")="Select Patient: "
 S DIC(0)="AEQMZ"
 D ^DIC
 I $D(DIROUT)!$D(DIRUT) Q
 I $D(DTOUT)!$D(DUOUT) Q
 S DFN=+$P(Y,U,1)
 S DIC=811.9,DIC("A")="Select Reminder: "
 D ^DIC
 I $D(DIROUT)!$D(DIRUT) Q
 I $D(DTOUT)!$D(DUOUT) Q
 S PXRMITEM=+$P(Y,U,1)
 S PXRHM=5
 S DIR(0)="DA^"_0_"::ETX"
 S DIR("A")="Enter date for reminder evalution: "
 S DIR("B")=$$FMTE^XLFDT($$DT^XLFDT,"D")
 W !
 D ^DIR K DIR
 I $D(DIROUT)!$D(DIRUT) Q
 I $D(DTOUT)!$D(DUOUT) Q
 S DATE=Y
 D DOREM(DFN,PXRMITEM,PXRHM,DATE)
 Q
 ;
 ;==================================================
DOREM(DFN,PXRMITEM,PXRMHM,DATE) ;Do the reminder
 N DEFARR,FIEVAL,PXRMDEBG,PXRMID,REF
 ;This is a debugging run so set PXRMDEBG.
 S PXRMDEBG=1
 D DEF^PXRMLDR(PXRMITEM,.DEFARR)
 I +$G(DATE)=0 D EVAL^PXRM(DFN,.DEFARR,PXRHM,1,.FIEVAL)
 I +$G(DATE)>0 D EVAL^PXRM(DFN,.DEFARR,PXRHM,1,.FIEVAL,DATE)
 ;
 W !!,"The elements of the FIEVAL array are:"
 S REF="FIEVAL"
 D AWRITE^PXRMUTIL(REF)
 ;
 W !!,"The elements of the ^TMP(PXRMID,$J) array are:"
 I $D(PXRMID) S REF="^TMP(PXRMID,$J)" D AWRITE^PXRMUTIL(REF) K ^TMP(PXRMID,$J)
 ;
 W !!,"The elements of the ^TMP(""PXRHM"",$J) array are:"
 S REF="^TMP(""PXRHM"",$J)"
 D AWRITE^PXRMUTIL(REF)
 ;
 I $D(^TMP("PXRHM",$J)) D CMOUT
 K ^TMP("PXRM",$J),^TMP("PXRHM",$J)
 Q
