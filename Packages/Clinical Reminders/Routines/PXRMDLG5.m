PXRMDLG5 ; SLC/PJH - Reminder Dialog Edit/Inquiry ;08/05/2003
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;
ASK(YESNO,PIEN) ;Confirm
 K DIR,DIROUT,DIRUT,DNAME,DTOUT,DTYP,DUOUT,TEXT,X,Y
 ;
 N DDATA,DNAME,DTYP
 S DDATA=$G(^PXRMD(801.41,PIEN,0))
 ;Parent name and type
 S DNAME=$P(DDATA,U),DTYP=$P(DDATA,U,4)
 ;
 S DIR(0)="YA0"
 S DIR("A")="Add sequence "_SEQ_" to "
 I DTYP="G" S DIR("A")=DIR("A")_"group "_DNAME_": "
 E  S DIR("A")=DIR("A")_"reminder dialog ?: "
 S DIR("B")="N",DIR("?")="Enter Y or N. For detailed help type ??"
 S DIR("??")=U_"D XHLP^PXRMDLG(1)"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 S YESNO=$E(Y(0)) I YESNO'="Y" S DUOUT=1
 S VALMBCK="R"
 Q
 ;
ALT(DIEN,LEV,DSEQ,NODE,VIEW,NLINE,CNT,ALTLEN) ;
 ;Display branching logic text in dialog summary view
 N DATA,DNAM,DTYP,IEN,TERM,TNAME,TSTAT,TEMP
 S DATA=$G(^PXRMD(801.41,DIEN,49))
 I '+$P(DATA,U)!($P($G(DATA),U,2)="") Q
 S TNAME=$P($G(^PXRMD(811.5,$P(DATA,U),0)),U)
 S TSTAT=$S($P(DATA,U,2)="1":"TRUE",1:"FALSE")
 I +$P(DATA,U,3)>0 D
 .S IEN=$P(DATA,U,3),DNAM=$P($G(^PXRMD(801.41,IEN,0)),U)
 .S DTYP=$S($P($G(^PXRMD(801.41,IEN,0)),U,4)="E":"Element",$P($G(^PXRMD(801.41,IEN,0)),U,4)="G":"Group")
 I $G(DNAM)="" S TEMP="Suppressed if Reminder Term "_TNAME_" evaluates as "_TSTAT
 I $G(DNAM)'="" S TEMP="Replaced by "_DNAM_" if Reminder Term "_TNAME_" evaluates as "_TSTAT
 D TEXT(.NLINES,CNT,ALTLEN,TEMP,NODE)
 Q
 ;
OTERM(DA) ;
 K OTERM
 S OTERM=$P($G(^PXRMD(801.41,DA,49)),U) Q
 ;
NTERM(DA,OTERM,NTERM) ;
 I +OTERM=0 S OTERM=$P($G(DA),U)
 I +NTERM=0 K OTERM Q 2
 I +OTERM=0,+NTERM>0 K OTERM Q 1
 I +OTERM'=+NTERM K OTERM Q 0
 K OTERM
 Q 1
 ;
TERMS(DA,X) ;
 N TERM
 S TERM=$P($G(^PXRMD(801.41,DA,49)),U)
 I +TERM=0 D  Q 0
 .W !,"Cannot set Reminder Term Status if the Reminder Term field is blank"
 .H 2
 I +TERM>0,$G(X)="" Q 2
 Q 1
 ;
BHELP(VALUE) ;
 N HTEXT
 D FULL^VALM1
 ;Help text for Reminder Dialog Branching logic
 I VALUE=1 D
 .;Reminder Term field
 .S HTEXT(1)="Enter a reminder term that will be used to determine if the reminder"
 .S HTEXT(2)="element/group should be replace or suppress if the reminder term evaluation"
 .S HTEXT(3)="matches the value in the Reminder Term Status field."
 I VALUE=2 D
 .;Reminder Term Status field
 .S HTEXT(1)="Enter either 1 for true or 0 for false. This value will be used with the"
 .S HTEXT(2)="reminder term field to determine if this item should be replaced with a"
 .S HTEXT(3)="different element/group defined in the Replacement Element/Group field, or if"
 .S HTEXT(4)="this item should be suppressed."
 I VALUE=3 D
 .;Replacement Element/Group field
 .S HTEXT(1)="Enter an element/group that will be used as a replacement to thisitem, or"
 .S HTEXT(2)="leave this field blank to suppress this item if the term evaluation"
 .S HTEXT(3)="matches the value defined in the term status field. "
 I VALUE=4 D
 .;Patient Specific field
 .S HTEXT(1)="Enter either 1 for true or 0 for false. This value must be set totrue"
 .S HTEXT(2)="if item in this dialog will be using reminder term to either replace an item"
 .S HTEXT(3)="or to suppress an item."
 D HELP^PXRMEUT(.HTEXT)
 Q
 ;
TEXT(NLINES,CNT,ATLEN,TEMP,NODE) ;
 N CNT1,NOUT,OUTPUT,WIDHT
 S WIDTH=IOM-(2+(CNT+ATLEN))
 S CNT1=1 D FORMATS^PXRMTEXT(1,WIDTH,TEMP,.NOUT,.OUTPUT)
 I NOUT>0 F CNT1=1:1:NOUT D
 .S NLINE=NLINE+1,^TMP(NODE,$J,NLINE,0)=$J("",2+(CNT+ATLEN))_OUTPUT(CNT1)
 Q
 ;
INQ(DIEN) ;INQ Inquiry/Print option
 ;
 ; Used by 801.41 print templates
 ; [PXRM REMINDER DIALOG]
 ; [PXRM DIALOG GROUP]
 ;
 N DEF,DEF1,DEF2 D DEF^PXRMRUTL("811.902",.DEF,.DEF1,.DEF2)
 ;
 N NLINE,NODE,NSEL,SUB
 S NLINE=0,NODE="PXRMDLG4",NSEL=0
 K ^TMP(NODE,$J)
 ;
 ;Components
 W !!,"      Seq.       Dialog",!
 D DETAIL^PXRMDLG4(DIEN,"",4,NODE)
 ;
 ;Bookmark print lines from workfile
 S SUB=""
 F  S SUB=$O(^TMP(NODE,$J,SUB)) Q:'SUB  W !,^TMP(NODE,$J,SUB,0)
 ;
 K ^TMP(NODE,$J)
 Q
