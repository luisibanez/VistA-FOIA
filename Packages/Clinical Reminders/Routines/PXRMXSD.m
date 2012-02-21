PXRMXSD ; SLC/PJH - Reminder Reports DIR Prompts;12/30/2002
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;Called by PXRMXD
 ;
BED(YESNO) ;Option to sort by inpatient location and bed
 N X,Y,TEXT,DIR
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="YA0"
 S DIR("A")="Sort by Inpatient Location/Bed: "
 S DIR("B")="N"
 S DIR("?")="Enter Y or N. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMXHLP(11)"
 W !
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S YESNO=$E(Y(0))
 I YESNO="Y" S YESNO="B"
 Q
 ;
COMB(YESNO,LIT,DEF) ;Option to combine report
 N X,Y,DIR,TEXT
 K DIROUT,DIRUT,DTOUT,DUOUT
 ;I $G(LIT)="" S DUOUT=1 Q
 S DIR(0)="YA0"
 S DIR("A")="Combined report for all "_LIT_" : "
 S DIR("B")=DEF
 S DIR("?")="Enter Y or N. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMXHLP(9)"
 W !
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S YESNO=$E(Y(0))
 Q
 ;
FUTURE(YESNO,PROMPT,NUM) ;Option to display all future appointments on detail report
 N X,Y,DIR,TEXT
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="YA0"
 S DIR("A")=PROMPT
 S DIR("B")="N"
 S DIR("?")="Enter Y or N. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMXHLP("_NUM_")"
 W !
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S YESNO=$E(Y(0))
 Q
 ;
PREV(TYPE) ;Future Appts/Prior Encounters selection
 N X,Y,DIR
 S NREM=0
 K DIROUT,DIRUT,DTOUT,DUOUT
 I 'PXRMINP D
 .S DIR(0)="S"_U_"P:Previous Encounters;"
 .S DIR(0)=DIR(0)_"F:Future Appointments;"
 .S DIR("A")="PREVIOUS ENCOUNTERS OR FUTURE APPOINTMENTS"
 .S DIR("B")="P"
 .S DIR("??")=U_"D HELP^PXRMXHLP(3)"
 I PXRMINP D
 .S DIR(0)="S"_U_"A:Admissions to Location in date range;"
 .S DIR(0)=DIR(0)_"C:Current Inpatients;"
 .S DIR("A")="CURRENT INPATIENTS OR ADMISSIONS"
 .S DIR("B")="C"
 .S DIR("??")=U_"D HELP^PXRMXHLP(7)"
 S DIR("?")="Select from the codes displayed. For detailed help type ??"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S TYPE=Y
 Q
 ;
PRIME(TYPE) ;Primary Provider patients only or All
 N X,Y,DIR
 S NREM=0
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="S"_U_"P:Primary care assigned patients only;"
 S DIR(0)=DIR(0)_"A:All patients on list;"
 S DIR("A")="PRIMARY CARE ONLY OR ALL"
 S DIR("B")="P"
 S DIR("?")="Select from the codes displayed. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMXHLP(4)"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S TYPE=Y
 Q
 ;
REP(TYPE) ;Report type selection
 N X,Y,DIR
 S NREM=0
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="S"_U_"D:Detailed;"
 S DIR(0)=DIR(0)_"S:Summary;"
 S DIR("A")="TYPE OF REPORT"
 S DIR("B")="S"
 I PXRMSEL="I" S DIR("B")="D"
 S DIR("?")="Select from the codes displayed. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMXHLP(2)"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S TYPE=Y
 Q
 ;
SELECT(TYPE) ;Patient Sample Selection
 N X,Y,DIR
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="S"_U_"I:Individual Patient;"
 S DIR(0)=DIR(0)_"R:Reminder Patient List;"
 S DIR(0)=DIR(0)_"L:Location;"
 S DIR(0)=DIR(0)_"O:OE/RR Team;"
 S DIR(0)=DIR(0)_"P:PCMM Provider;"
 S DIR(0)=DIR(0)_"T:PCMM Team;"
 S DIR("A")="PATIENT SAMPLE"
 S DIR("B")="L"
 S DIR("?")="Select from the codes displayed. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMXHLP(0)"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S TYPE=Y
 Q
 ;
SRT(YESNO) ;Option to sort by next appointment date on detail report
 N X,Y,TEXT,DIR
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="YA0"
 S DIR("A")="Sort by Next Appointment date: "
 S DIR("B")="N"
 S DIR("?")="Enter Y or N. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMXHLP(6)"
 W !
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S YESNO=$E(Y(0))
 Q
 ;
SSN(YESNO) ;Option to combine multifacility report
 N X,Y,DIR,TEXT
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="YA0"
 S DIR("A")="Print full SSN: "
 I $P($G(^PXRM(800,1,"FULL SSN")),U)="Y" S DIR("B")="Y"
 E  S DIR("B")="N"
 S DIR("?")="Enter Y or N. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMXHLP(12)"
 W !
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S YESNO=$E(Y(0))
 Q
 ;
TABS(YESNO) ;Option print compressed report
 N X,Y,DIR,TEXT
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="YA0"
 S DIR("A")="Print Delimiter Separated output only: "
 S DIR("B")="N"
 S DIR("?")="Enter Y or N. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMXHLP(13)"
 W !
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S YESNO=$E(Y(0))
 Q
 ;
TABSEL(TYPE) ;Select DELIMITER CHARACTER
 N X,Y,DIR
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="S"_U_"C:Comma;"
 S DIR(0)=DIR(0)_"M:Semicolon;"
 S DIR(0)=DIR(0)_"S:Space;"
 S DIR(0)=DIR(0)_"T:Tab;"
 S DIR(0)=DIR(0)_"U:Up arrow;"
 S DIR("A")="Specify REPORT DELIMITER CHARACTER"
 S DIR("B")="U"
 S DIR("?")="Select from the codes displayed. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMXHLP(14)"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S TYPE=Y
 Q
 ;
TOTALS(TYPE,LIT1,LIT2,LIT3) ;Totals Selection
 N X,Y,DIR
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="S"_U_"I:"_LIT1_";"
 S DIR(0)=DIR(0)_"R:"_LIT2_";"
 S DIR(0)=DIR(0)_"T:"_LIT3_";"
 S DIR("A")="REPORT TOTALS"
 S DIR("B")="I"
 S DIR("?")="Select from the codes displayed. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMXHLP(10)"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S TYPE=Y
 Q
