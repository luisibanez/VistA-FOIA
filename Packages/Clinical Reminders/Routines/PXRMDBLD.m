PXRMDBLD ; SLC/PJH - Reminder Dialog Generation. ;04/07/2000
 ;;1.5;CLINICAL REMINDERS;;Jun 19, 2000
 ;
 ;Called from PXRMGEDT
 ;
START N ANS,DIC,DNAME,LIT,LIT1,MSG,NAME,REDO,REM,RLNK,RNAME,ORY
 N PXRMENAB,PXRMLINK,PXRMREPL,PXRMREM
 ;Prompt for auto or manual addition
 S ANS="" D ASK(.ANS) Q:$D(DUOUT)!$D(DTOUT)
 ;Auto
 I ANS="Y" D AUTO Q
 ;Manual
 I ANS'="Y" D ADD^PXRMDEDT
END Q
 ;
 ;Called by protocol PXRM DIALOG ADD
 ;----------------------------------
ADD(PXRMITEM) ;
 N ANS,DNAME,DTOUT,DUOUT
 S VALMBCK="R"
 W IORESET
 W !,PXRMHD
 S DNAME=""
 D ASK^PXRMDBLD(.ANS) Q:$D(DTOUT)!$D(DUOUT)
 I ANS="Y" D AUTOP(PXRMITEM) Q
 Q
 ;
 ;Ask autogenerate/manual
 ;-----------------------
ASK(YESNO) ;
 N X,Y,TEXT,DIR
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="YA0"
 S DIR("A")="GENERATE DIALOG AUTOMATICALLY: "
 S DIR("B")="Y"
 S DIR("?")="Enter Y or N. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMDBLD(1)"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S YESNO=$E(Y(0))
 Q
 ;
 ;Source reminder for auto-generate
 ;---------------------------------
AUTO S DIC("A")="SELECT REMINDER TO GENERATE DIALOG FROM: "
 S LIT1="You must select a reminder!"
 D SEL(811.9,"AEQMZ",.PXRMREM)
 Q:$D(DTOUT)!$D(DUOUT)
 S REM=$P(PXRMREM(1),U),DNAME=""
 ;Display related dialogs
 D DISP(REM)
 ;Promt for type of generate
 D AUTOP(REM)
 Q
 ;
 ;Autogenerate prompts
 ;--------------------
AUTOP(REM) ;
 S RNAME=$P($G(^PXD(811.9,REM,0)),U)
 F  D  Q:$D(DUOUT)!$D(DTOUT)!(DNAME]"")
 .N X,Y,DIR
 .K DIROUT,DIRUT,DTOUT,DUOUT
 .S DIR(0)="F"_U_"3:40"_U_"K:(X?.N)!'(X'?1P.E) X"
 .S DIR("A")="ENTER A UNIQUE DIALOG NAME"
 .S DIR("B")=RNAME
 .S DIR("?")="Select a unique name for the generated dialog."
 .S DIR("??")=U_"D HELP^PXRMDBLD(6)"
 .D ^DIR K DIR
 .I $D(DIROUT) S DTOUT=1
 .I $D(DTOUT)!($D(DUOUT)) Q
 .I Y["""" D EN^DDIOL(" name cannot contain quotes!") Q
 .;Choose to override existing reminder dialog
 .I $D(^PXRMD(801.41,"B",Y)) Q:'$$OVER(Y)  D
 ..;Delete existing reminder dialog
 ..N DA,DIK
 ..S DA=$O(^PXRMD(801.41,"B",Y,"")) Q:'DA
 ..;If this is the linked reminder clear it
 ..I $P($G(^PXD(811.9,REM,51)),U)=DA S $P(^PXD(811.9,REM,51),U)=""
 ..N Y S DIK="^PXRMD(801.41," D ^DIK
 .;Option to LINK DIALOG to REMINDER if reminder is not linked already
 .S RLNK=$P($G(^PXD(811.9,REM,51)),U),PXRMLINK=0
 .I 'RLNK D LINK(.PXRMLINK) Q:$D(DTOUT)!$D(DUOUT)
 .;Option to enable dialog
 .D ENABLE(.PXRMENAB) Q:$D(DTOUT)!$D(DUOUT)
 .;Option to replace existing dialog elements
 .D REPL(.PXRMREPL) Q:$D(DTOUT)!$D(DUOUT)
 .;Use name entered
 .S DNAME=Y
 ;
 Q:$D(DUOUT)!$D(DTOUT)
 ;Build dialog
 N CHECK D BUILD^PXRMDBL1(REM,DNAME,.CHECK)
 Q
 ;
 ;Display dialogs autogenerated from this reminder
 ;------------------------------------------------
DISP(RIEN) ;
 N ARRAY,DSUB,FIRST
 ;Get Autogenerated dialogs
 S FIRST=1,DSUB=""
 F  S DSUB=$O(^PXRMD(801.41,"AG",RIEN,DSUB)) Q:'DSUB  D
 .I FIRST W !!,"Associated Dialogs:" S FIRST=0
 .W ?25,$P($G(^PXRMD(801.41,DSUB,0)),U),!
 Q
 ;
 ;Disable generated dialog 
 ;------------------------
ENABLE(YESNO) ;
 N X,Y,TEXT,DIR
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="YA0"
 S DIR("A")="ENABLE DIALOG: "
 S DIR("B")="NO"
 S DIR("?")="Enter Y or N. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMDBLD(4)"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S YESNO=$E(Y(0))
 Q
 ;
 ;Link dialog to reminder 
 ;-----------------------
LINK(YESNO) ;
 N X,Y,TEXT,DIR
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="YA0"
 S DIR("A")="LINK DIALOG TO REMINDER: "
 S DIR("B")="YES"
 S DIR("?")="Enter Y or N. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMDBLD(5)"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S YESNO=$E(Y(0))
 Q
 ;
 ;Option to override existing dialog
 ;----------------------------------
OVER(DNAME) ;
 N DIR,X,Y
 S DIR(0)="Y",DIR("B")="YES"
 S DIR("A")="OVERWRITE EXISTING REMINDER DIALOG "
 S DIR("?")="Enter Y or N. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMDBLD(2)"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q 0
 Q $S(Y(0)="YES":1,1:0)
 ;
 ;Option to replace existing dialog elements
 ;------------------------------------------
REPL(INP) ;
 N DIR,X,Y
 S DIR(0)="Y",DIR("B")="NO"
 S DIR("A")="REPLACE ANY EXISTING DIALOG ELEMENTS"
 S DIR("?")="Enter Y or N. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMDBLD(3)"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S INP=$S(Y(0)="YES":1,1:0)
 Q
 ;
 ;Reminder selection
 ;------------------
SEL(FILE,MODE,ARRAY) ;
 N X,Y,CNT
 K DIROUT,DIRUT,DTOUT,DUOUT
 S CNT=0
 W !
 F  D  Q:$D(DTOUT)  Q:$D(DUOUT)  Q:CNT>0  Q:(Y=-1)&(CNT>0)
 .S DIC=FILE,DIC(0)=MODE
 .D ^DIC
 .I X=(U_U) S DTOUT=1
 .I '$D(DTOUT),('$D(DUOUT)) D
 ..I +Y'=-1 D  Q
 ...S CNT=CNT+1,ARRAY(CNT)=Y_U_Y(0,0)_U_$P(Y(0),U,3)
 ..W:CNT=0 !,LIT1
 .K DIC
 Q
 ;
 ;General help text routine.
 ;--------------------------
HELP(CALL) ;
 N HTEXT
 N DIWF,DIWL,DIWR,IC
 S DIWF="C75",DIWL=0,DIWR=75
 ;
 I CALL=1 D
 .S HTEXT(1)="Enter Yes to generate reminder dialog automatically for a"
 .S HTEXT(2)="selected reminder. Enter No to create a reminder dialog"
 .S HTEXT(3)="using the standard fileman edit."
 I CALL=2 D
 .S HTEXT(1)="Enter Yes to replace the existing reminder dialog."
 .S HTEXT(2)="Enter No to return and enter an alternative dialog name."
 I CALL=3 D
 .S HTEXT(1)="For each FINDING ITEM on the reminder a dialog element"
 .S HTEXT(2)="will be created. A separate DIALOG ELEMENT is created for"
 .S HTEXT(3)="each enabled RESOLUTION STATUS in the FINDING TYPE"
 .S HTEXT(4)="PARAMETERS for this finding type. The dialog element is"
 .S HTEXT(5)="unique for finding type, finding item name and resolution"
 .S HTEXT(6)="status name."
 .S HTEXT(7)="e.g. VM WEIGHT DONE will be generated for the finding item"
 .S HTEXT(8)="     vitals measurement/weight."
 .S HTEXT(9)=""
 .S HTEXT(10)="Enter Yes to rebuild all dialog elements used by this"
 .S HTEXT(11)="reminder overwriting any existing modifications."
 .S HTEXT(12)=""
 .S HTEXT(13)="Enter No to use existing dialog elements if they exist."
 .S HTEXT(14)="New dialog elements will be created if they don't already"
 .S HTEXT(15)="exist."
 I CALL=4 D
 .S HTEXT(1)="Enter Yes to create a dialog enabled for use in CPRS."
 .S HTEXT(2)="Enter No to create a dialog disabled for CPRS."
 I CALL=5 D
 .S HTEXT(1)="If the source reminder is not linked to any other dialog"
 .S HTEXT(2)="enter Yes to link the reminder to the generated dialog."
 .S HTEXT(3)="Enter No if no link should be made."
 I CALL=6 D
 .S HTEXT(1)="Enter the name of the dialog. The default is the reminder"
 .S HTEXT(2)="name. If the name of an existing dialog is specified the"
 .S HTEXT(3)="option to override the existing dialog will be given."
 K ^UTILITY($J,"W")
 S IC=""
 F  S IC=$O(HTEXT(IC)) Q:IC=""  D
 . S X=HTEXT(IC)
 . D ^DIWP
 W !
 S IC=0
 F  S IC=$O(^UTILITY($J,"W",0,IC)) Q:IC=""  D
 . W !,^UTILITY($J,"W",0,IC,0)
 K ^UTILITY($J,"W")
 W !
 Q
