PXRMLCR ; SLC/PJH - Create Patient List from individual finding rule ;12/22/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ; 
 ; Called from PXRM PATIENT LIST CREATE protocol
 ;
START N DUOUT,DTOUT,END,LIT,BEG,END,PXRMLIST,PXRMNODE,PXRMRULE,TEXT
 ;Initialise
 K ^TMP("PXRMLCR",$J)
 ;Node for ^TMP lists created in PXRMRULE
 S PXRMNODE="PXRMRULE",LIT="Patient List"
 ;Reset screen mode
 W IORESET
 ;Set prompt text
 S TEXT="Select PATIENT LIST name: "
 ;Select Patient List
LIST D PLIST(.PXRMLIST,TEXT,"") I $D(DUOUT)!$D(DTOUT) D  Q
 . I $G(PXRMLIST)="" Q
 . I $P($G(^PXRMXP(810.5,PXRMLIST,0)),U,4)'="" Q
 . S DA=PXRMLIST,DIK="^PXRMXP(810.5," D ^DIK
 ;
SECURE ;option to secure the list
 K PATCREAT
 I $D(PATCREAT)=0 S PATCREAT="N" D ASK^PXRMXD(.PATCREAT,"Secure list?: ",2) Q:$D(DTOUT)  G:$D(DUOUT) START
 ;
 ;Select List Rule
RULE D LRULE(.PXRMRULE) Q:$D(DTOUT)  G:$D(DUOUT) LIST
 ;Select Date Range
DATE D DATES^PXRMEUT(.BEG,.END,LIT) Q:$D(DTOUT)  G:$D(DUOUT) RULE
 ;
 ;Build patient list in background
 N ZTDESC,ZTDTH,ZTIO,ZTRTN,ZTSAVE
 S ZTDESC=" CREATE PATIENT LIST"
 S ZTRTN="RUN^PXRMLCR(PXRMRULE,PXRMLIST,PXRMNODE,BEG,END)"
 S ZTSAVE("PXRMRULE")=""
 S ZTSAVE("PXRMLIST")=""
 S ZTSAVE("PXRMNODE")=""
 S ZTSAVE("BEG")=""
 S ZTSAVE("END")=""
 S ZTSAVE("PATCREAT")=""
 S ZTIO=""
 ;
 ;Select and verify start date/time for task
 N DIR,DTOUT,DUOUT,MINDT,SDTIME,STIME,X,Y
 S MINDT=$$NOW^XLFDT
 W !,"Queue the "_ZTDESC_" for "_$P($G(^PXRMXP(810.5,PXRMLIST,0)),U)_": "
 S DIR("A",1)="Enter the date and time you want the job to start."
 S DIR("A")="It must be on or after "_$$FMTE^XLFDT(MINDT,"5Z")_" "
 S DIR(0)="DAU"_U_MINDT_"::RSX"
 D ^DIR
 I $D(DTOUT)!$D(DUOUT) Q
 S SDTIME=Y
 ;
 ;Put the task into the queue.
 S ZTDTH=SDTIME
 D ^%ZTLOAD
 W !,"Task number ",ZTSK," queued." H 2
 ;
 S VALMBCK="Q"
EXIT Q
 ;
PLIST(LIST,TEXT,IENO) ;Select Patient List
 N X,Y,DIC,DLAYGO
PL1 S DIC=810.5,DLAYGO=DIC,DIC(0)="QAEMZL"
 S DIC("A")=TEXT
 S DIC("S")="I $P($G(^(100)),U)'=""N"""
 S DIC("DR")="100///L"
 W !
 D ^DIC
 I X="" W !,"A patient list name must be entered" G PL1
 I X=(U_U) S DTOUT=1
 I Y=-1 S DUOUT=1
 I $D(DTOUT)!$D(DUOUT) Q
 ;
 ;I copy mode dissallow copy to same list
 I IENO=$P(Y,U) W !,"A patient list cannot be copied to itself." G PL1
 ;
 ;Check if OK to overwrite
 N OWRITE
 S OWRITE="N"
 I ($P(Y,U,3)'=1) D  Q:$D(DTOUT)  G:$D(DUOUT)!(OWRITE="N") PL1
 .D ASK^PXRMXD(.OWRITE,"Okay to overwite "_$P(Y,U,2)_"? ",1)
 ;Return list ien
 S LIST=$P(Y,U)
 Q
 ;
LRULE(RULE) ;Select List Rule
 N X,Y,DIC
LR1 S DIC=810.4,DIC(0)="QAEMZ"
 S DIC("A")="Select LIST RULE SET: "
 ;Only allow rule sets with components
 S DIC("S")="I $P(^(0),U,3)=3"
 W !
 D ^DIC
 I X="" W !,"A list rule set name must be entered" G LR1
 I X=(U_U) S DTOUT=1
 I Y=-1 S DUOUT=1
 I $D(DTOUT)!$D(DUOUT) Q
 ;Return rule ien
 S RULE=$P(Y,U)
 ;Check that rule set is valid
 N ERROR,SUB
 S SUB=$O(^PXRM(810.4,RULE,30,0))
 I SUB="" W !,"Rule set has no component rules" G LR1
 S SUB=0,ERROR=0
 F  S SUB=$O(^PXRM(810.4,RULE,30,SUB)) Q:'SUB  D  Q:ERROR
 .I $P($G(^PXRM(810.4,RULE,30,SUB,0)),U,1)="" S ERROR=1 Q
 .I $P($G(^PXRM(810.4,RULE,30,SUB,0)),U,2)="" S ERROR=1 Q
 .I $P($G(^PXRM(810.4,RULE,30,SUB,0)),U,3)="" S ERROR=1 Q
 I ERROR W !,"Rule set is incomplete" G LR1
 Q
 ;
 ;Build list and clear ^TMP files
RUN(PXRMRULE,PXRMLIST,PXRMNODE,BEG,END) ;
 ;Process rule set and update final patient list
 D START^PXRMRULE(PXRMRULE,PXRMLIST,PXRMNODE,BEG,END,"","","")
 ;Clear ^TMP lists created for rule
 D CLEAR^PXRMRULE(PXRMRULE,PXRMNODE)
 Q
 ;
REMOVE(IEN) ;
 S $P(^PXRM(810.4,IEN,0),U,10)=""
 Q "@1"
 ;
HELP(CALL) ;General help text routine
 N HTEXT
 I CALL=1 D
 .S HTEXT(1)="Enter 'Y' to overwrite this existing list. Enter 'N' to"
 .S HTEXT(2)="use a different patient list name."
 ;
 I CALL=2 D
 .S HTEXT(1)="Enter 'Y' to secure the list by assigning yourself as the"
 .S HTEXT(2)="Creator of the list. You can assign a user to the list in the Patient List Menu screens"
 .S HTEXT(3)="or enter 'N' to make the list public."
 ;
 I CALL=3 D
 .S HTEXT(1)="Enter Y to save the patient to a Reminder Patient List. Enter N to not save the output."
 ;
 D HELP^PXRMEUT(.HTEXT)
 Q
