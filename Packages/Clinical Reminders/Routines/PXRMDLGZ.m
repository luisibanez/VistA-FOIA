PXRMDLGZ ; SLC/PJH - Link reminder to dialog. ;07/29/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;Called by option PXRM DIALOG/COMPONENT EDIT
 ;
START N BY,DATA,DDES,DHD,DIC,DNAM,DTYP,FLDS,FR,L,LOGIC,NOW,PNAM,TO,Y
 N PXRMBG,PXRMHD,PXRMDIEN,PXRMGTYP,PXRMDTYP,PXRMITEM,PXRMMODE,PXRMNAME
 N PXRMTEMP,PXRMTITL,PXRMVIEW
 ;Refresh on return
 S VALMBCK="R"
 S VALMSG="+ Next Screen   - Prev Screen   ?? More Actions"
 ;Default is display dialog elements
 S PXRMDTYP="R",PXRMGTYP="DLGR",PXRMVIEW="AN"
 ;Select dialog for display
 F  D  Q:'PXRMTEMP
 .S PXRMTEMP=""
 .D START^PXRMSEL(.PXRMHD,.PXRMGTYP,"PXRMTEMP") Q:'PXRMTEMP
 .N X S X="IORESET"
 .D ENDR^%ZISS,@(PXRMGTYP_"("_PXRMTEMP_")")
END Q
 ;
 ;Reminder View
 ;-------------
DLGR(PXRMITEM) ;
 N PXRMDIEN,PXRMCS1,PXRMCS2
 ;Format headings to include reminder and name
 S DATA=$G(^PXD(811.9,PXRMITEM,0)),RNAM=$P(DATA,U),PNAM=$P(DATA,U,3)
 S PXRMHD="REMINDER NAME: "_RNAM
 ;
 ;Dialog History
 F  D  Q:'PXRMDIEN
 .D START^PXRMDLGH(PXRMITEM,.PXRMDIEN,"PXRMDIEN") Q:'PXRMDIEN
 .N PXRMHD,VALMBCK,VALMBG,VALMSG,VIEW,X,XMZ
 .S DNAM=$P($G(^PXRMD(801.41,PXRMDIEN,0)),U)
 .I $P($G(^PXRMD(801.41,PXRMDIEN,0)),U,3)]"" S DNAM=DNAM_" (DISABLED)"
 .S PXRMHD="REMINDER DIALOG NAME: "_DNAM
 .S PXRMCS1=$$FILE^PXRMEXCS(801.41,PXRMDIEN)
 .S X="IORESET"
 .D ENDR^%ZISS,EN^VALM("PXRM DIALOG LIST")
 .I PXRMDIEN,$D(^PXRMD(801.41,PXRMDIEN,0)) D
 ..S PXRMCS2=$$FILE^PXRMEXCS(801.41,PXRMDIEN) Q:+PXRMCS2=0
 ..Q:PXRMCS1=PXRMCS2
 ..D SEHIST^PXRMUTIL(801.41,"^PXRMD(801,41,",PXRMDIEN)
 .W IORESET
 .D KILL^%ZISS
 Q
 ;
 ;Edit element/prompt/group
 ;-------------------------
DLGE(PXRMDIEN) ;
 N LOCK,LFIND
 ;Check for Uneditable flag
 S LOCK=$P($G(^PXRMD(801.41,PXRMTEMP,100)),U,4)
 S LFIND=$P($G(^PXRMD(801.41,PXRMTEMP,1)),U,5)
 I LOCK=1,$G(LFIND)'="",$G(LFIND)'["ORD",'$G(PXRMINST) D  Q
 .W !,"This item can not be edited" H 2
 ;
 S PXRMHD="Dialog Name: ",PXRMDIEN=PXRMTEMP
 ;Format headings to include dialog name
 S DATA=$G(^PXRMD(801.41,PXRMDIEN,0)),DDES=$P(DATA,U),DTYP=$P(DATA,U,4)
 ;Test
 I DTYP="G" D DLG(PXRMDIEN) Q
 ;
 S PXRMHD=PXRMHD_" "_DDES W PXRMHD,!
 ;Edit selected dialog
 D EDIT^PXRMDEDT(DTYP,PXRMDIEN)
 Q
 ;
 ;Reminder dialog view
 ;--------------------
DLG(PXRMDIEN) ;
 S PXRMDIEN=PXRMTEMP
 S PXRMNAME=$P($G(^PXRMD(801.41,PXRMDIEN,0)),U)
 S PXRMITEM=$P($G(^PXRMD(801.41,PXRMDIEN,0)),U,2)
 ;Format headings to include dialog name
 S PXRMHD=PXRMHD_PXRMNAME
 ;Check if the set is disable and add to header if disabled
 I $P(^PXRMD(801.41,PXRMDIEN,0),U,3)]"" S PXRMHD=PXRMHD_" (DISABLED)"
 ;Listman option
 D EN^VALM("PXRM DIALOG LIST")
 W IORESET
 D KILL^%ZISS
 Q
 ;
 ;Other subroutines
 ;
 ;Ask update or no
 ;----------------
ASK(YESNO) ;
 N X,Y,TEXT,DIR
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="YA0"
 S DIR("A")="LINK THIS REMINDER TO DIALOG - "_$P(PXRMHD,": ",2)_": "
 S DIR("B")="Y"
 S DIR("?")="Enter Y or N. For detailed help type ??"
 S DIR("??")=U_"D HLP^PXRMDLGY(1)"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S YESNO=$E(Y(0))
 Q
 ;
 ;Display dialogs autogenerated from this reminder
 ;------------------------------------------------
DISP(RIEN) ;
 N ARRAY,DSUB,FIRST
 ;Get OTHER dialogs
 S FIRST=1,DSUB=""
 F  S DSUB=$O(^PXRMD(801.41,"AG",RIEN,DSUB)) Q:'DSUB  D
 .W !
 .D:FIRST
 ..W "DIALOGS ALREADY GENERATED FROM THIS REMINDER:",!! S FIRST=0
 .W ?20,$P($G(^PXRMD(801.41,DSUB,0)),U)
 ;
 I 'FIRST W !
 ;
 Q
 ;
 ;Display linked reminders
 ;------------------------
DISPL(DIEN) ;
 N ARRAY,DLG,RSUB,FIRST,RNAM
 S RSUB=$P($G(^PXRMD(801.41,DIEN,0)),U,2)
 I RSUB W !!,"SOURCE REMINDER: "_$P($G(^PXD(811.9,RSUB,0)),U)
 ;Linked reminders
 S FIRST=1,RNAM=""
 F  S RNAM=$O(^PXD(811.9,"B",RNAM)) Q:RNAM=""  D
 .S RSUB=$O(^PXD(811.9,"B",RNAM,"")) Q:'RSUB
 .S DLG=$P($G(^PXD(811.9,RSUB,51)),U) Q:DLG'=DIEN
 .W ! I FIRST W !,"REMINDERS ALREADY LINKED TO THIS DIALOG:",!! S FIRST=0
 .W ?18,$P($G(^PXD(811.9,RSUB,0)),U)
 Q
 ;
 ;Link a dialog (called by protocol PXRM DIALOG/REMINDER LINK)
 ;-------------
LINK(DIEN) ;
 F  D  Q:$D(DTOUT)!$D(DUOUT)
 .W IORESET
 .S VALMBCK="R"
 .;Display linked reminders
 .D DISPL(DIEN)
 .;
 .N ANS,DIC,DIR,DLG,LIT1,PNAME,PXRMREM,REM
 .S DIC("A")="SELECT A REMINDER TO LINK OR CHANGE: "
 .S LIT1="You must select a reminder!"
 .D SEL(811.9,"AEQMZ",.PXRMREM)
 .Q:$D(DTOUT)!$D(DUOUT)
 .S REM=$P(PXRMREM(1),U),PNAME=$P(PXRMREM(1),U,3)
 .I PNAME]"" W !!,"REMINDER PRINT NAME: "_PNAME,!
 .;Display related dialogs
 .D DISP(REM)
 .;Check if already linked
 .S DLG=$P($G(^PXD(811.9,REM,51)),U)
 .;Reconfirm to link reminder
 .I 'DLG S ANS="" D ASK(.ANS) Q:ANS'="Y"
 .;
 .N DA,DR,DIE
 .;Edit selected reminder
 .S DA=REM
 .;Settup local variables
 .S DIE="^PXD(811.9,",DR=51
 .;If no link force entry
 .I 'DLG S DR=DR_"///"_PXRMNAME
 .D ^DIE
 Q
 ;
 ;Link a Reminder (called by protocol PXRM DIALOG LINK)
 ;---------------
RLINK(REM) ;
 N DLG
 ;Re-display reminder name
 W IORESET
 W !,PXRMHD
 ;
 N DA,DR,DIE
 ;Edit selected reminder
 S DA=REM
 ;Settup local variables
 S DIE="^PXD(811.9,",DR=51
 ;If no link force entry
 D ^DIE
 Q
 ;
 ;General help text routine.
 ;--------------------------
HLP(CALL) ;
 N HTEXT
 N DIWF,DIWL,DIWR,IC
 S DIWF="C75",DIWL=0,DIWR=75
 ;
 I CALL=1 D
 .S HTEXT(1)="Enter Yes to link reminder to this dialog."
 I CALL=2 D
 .S HTEXT(1)="Enter Yes to link reminder to this dialog."
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
 ;Input transform for FINDING ITEM in 801.41
XINP(X) ;Taxonomy findings are not allowed for dialog groups
 I $P(X,";",2)="PXD(811.2,",$P($G(^PXRMD(801.41,DA,0)),U,4)="G" D  Q 0
 .W $C(7),!,"A taxonomy cannot be entered as the finding item for a group"
 ;Only applies to MH
 I $P(X,";",2)'="YTT(601," Q 1
 ;GAF
 I $P($G(^YTT(601,$P(X,";"),0)),U)="GAF" Q 1
 ;Check if a VALID GUI test
 I $P($G(^YTT(601.6,$P(X,";"),0)),U,4)="Y" Q 1
 ;else
 W *7,!,"This test is not appropriate for the GUI",!
 Q 0
