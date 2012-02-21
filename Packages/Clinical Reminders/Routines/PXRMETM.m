PXRMETM ; SLC/PKR/PJH - Extract/Transmission Management ;12/05/2002
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;Main entry point for PXRM EXTRACT MANAGEMENT
START N PXRMDONE,VALMBCK,VALMCNT,VALMSG,X,XMZ,XQORM,XQORNOD
 S X="IORESET"
 D ENDR^%ZISS
 S VALMCNT=0
 D EN^VALM("PXRM EXTRACT MANAGEMENT")
 W IORESET
 D KILL^%ZISS
 Q
 ;
BLDLIST ;Build workfile
 K ^TMP("PXRMETM",$J)
 N IEN,IND,PLIST
 D LIST(.PLIST,.IEN)
 M ^TMP("PXRMETM",$J)=PLIST
 S VALMCNT=PLIST("VALMCNT")
 F IND=1:1:VALMCNT D
 .S ^TMP("PXRMETM",$J,"IDX",IND,IND)=IEN(IND)
 Q
 ;
LIST(RLIST,IEN) ;Build a list of extract parameter entries.
 N EPCLASS,IND,FNAME,NAME
 ;Build the list in alphabetical order.
 S VALMCNT=0
 S NAME=""
 F  S NAME=$O(^PXRM(810.2,"B",NAME)) Q:NAME=""  D
 .S IND=$O(^PXRM(810.2,"B",NAME,"")) Q:'IND
 .S FNAME=$P($G(^PXRM(810.2,IND,0)),U)
 .S EPCLASS=$P($G(^PXRM(810.2,IND,100)),U)
 .S VALMCNT=VALMCNT+1
 .S RLIST(VALMCNT,0)=$$FRE(VALMCNT,FNAME,EPCLASS)
 .S IEN(VALMCNT)=IND
 S RLIST("VALMCNT")=VALMCNT
 Q
 ;
FRE(NUMBER,NAME,CLASS) ;Format  entry number, name
 ;and date packed.
 N TCLASS,TEMP,TNAME,TSOURCE
 S TEMP=$$RJ^XLFSTR(NUMBER,5," ")
 S TNAME=$E(NAME,1,46)
 S TEMP=TEMP_"  "_$$LJ^XLFSTR(TNAME,60," ")
 S TCLASS=$S(CLASS="N":"NATIONAL",CLASS="V":"VISN",1:"LOCAL")
 S TEMP=TEMP_"  "_TCLASS
 Q TEMP
 ;
ENTRY ;Entry code
 D BLDLIST,XQORM
 Q
 ;
EXIT ;Exit code
 K ^TMP("PXRMETM",$J)
 K ^TMP("PXRMETMH",$J)
 D CLEAN^VALM10
 D FULL^VALM1
 S VALMBCK="Q"
 Q
 ;
HDR ; Header code
 S VALMHDR(1)="Available Extract Parameters:"
 S VALMSG="+ Next Screen   - Prev Screen   ?? More Actions"
 Q
 ;
HLP ;Help code
 N ORU,ORUPRMT,SUB,XQORM
 S SUB="PXRMETMH"
 D EN^VALM("PXRM EXTRACT HELP")
 Q
 ;
INIT ;Init
 S VALMCNT=0
 Q
 ;
PEXIT ;PXRM EXCH MENU protocol exit code
 S VALMSG="+ Next Screen   - Prev Screen   ?? More Actions"
 ;Reset after page up/down etc
 D XQORM
 Q
 ;
XQORM S XQORM("#")=$O(^ORD(101,"B","PXRM EXTRACT MANAGEMENT SELECT ENTRY",0))_U_"1:"_VALMCNT
 S XQORM("A")="Select Item: "
 Q
 ;
XSEL ;PXRM EXTRACT MANAGEMENT SELECT ENTRY validation
 N SEL,IEN
 S SEL=$P(XQORNOD(0),"=",2)
 ;Remove trailing ,
 I $E(SEL,$L(SEL))="," S SEL=$E(SEL,1,$L(SEL)-1)
 ;Invalid selection
 I SEL["," D  Q
 .W $C(7),!,"Only one item number allowed." H 2
 .S VALMBCK="R"
 I ('SEL)!(SEL>VALMCNT)!('$D(@VALMAR@("IDX",SEL))) D  Q
 .W $C(7),!,SEL_" is not a valid item number." H 2
 .S VALMBCK="R"
 ;
 ;Get the list ien.
 S IEN=^TMP("PXRMETM",$J,"IDX",SEL,SEL)
 ;
 ;Full screen mode
 D FULL^VALM1
 ;
 ;Options
 N X,Y,DIR,OPTION K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="SBM"_U_"EPM:Extract Parameter Management;"
 S DIR(0)=DIR(0)_"VSE:Examine/Schedule Extract;"
 S DIR("A")="Select Action"
 S DIR("B")="VSE"
 S DIR("?")="Select from the codes displayed. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMETM(1)"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) S VALMBCK="R" Q
 S OPTION=Y
 ;
 ;Display Extract Parameters
 I OPTION="EPM" D
 .;D PPDISP(IEN)
 .D START^PXRMEPED(IEN)
 ;
 ;Examine/Run Extract
 I OPTION="VSE" D
 .D START^PXRMETH(IEN)
 ;
 ;Examine/Run Extract
 I OPTION="REP" D
 .D GENSEL(IEN)
 ;
 S VALMBCK="R"
 Q
 ;
HELP(CALL) ;General help text routine
 N HTEXT
 I CALL=1 D
 .S HTEXT(1)="Select EPM to edit/display extract parameters."
 .S HTEXT(2)="extract. Select VSE to view previous extracts or "
 .S HTEXT(3)="initiate a manual extract or transmission."
 ;
 D HELP^PXRMEUT(.HTEXT)
 Q
 ;
GEN ;Ad hoc report option
 ;
 ;Reset Screen Mode
 W IORESET
 ;
 N IND,LISTIEN,VALMY
 D EN^VALM2(XQORNOD(0))
 ;If there is no list quit.
 I '$D(VALMY) Q
 S PXRMDONE=0
 S IND=""
 F  S IND=$O(VALMY(IND)) Q:(+IND=0)!(PXRMDONE)  D
 .;Get the ien.
 .S LISTIEN=^TMP("PXRMETM",$J,"IDX",IND,IND)
 .D GENSEL(LISTIEN)
 ;
 S VALMBCK="R"
 Q
 ;
GENSEL(IEN) ;Report for selected parameter
 N ANS,BEGIN,END,RTN,TEXT
 D DATES^PXRMEUT(.BEGIN,.END,"Report")
 ;Options
 S RTN="PXRMETM",TEXT="Run compliance report for this period: "
 D ASK^PXRMEUT(.ANS,TEXT,RTN,1) Q:ANS="N"  Q:$D(DUOUT)!$D(DTOUT)
 ;Print Report
 D ADHOC^PXRMETCO(IEN,BEGIN,END)
 Q
 ;
HLIST ;Extract History
 N IND,LISTIEN,VALMY
 D EN^VALM2(XQORNOD(0))
 ;If there is no list quit.
 I '$D(VALMY) Q
 S PXRMDONE=0
 S IND=""
 F  S IND=$O(VALMY(IND)) Q:(+IND=0)!(PXRMDONE)  D
 .;Get the ien.
 .S LISTIEN=^TMP("PXRMETM",$J,"IDX",IND,IND)
 .D START^PXRMETH(LISTIEN)
 ;
 S VALMBCK="R"
 Q
 ;
PLIST ;Extract Parameter Inquiry
 N IND,EPIEN,VALMY
 D EN^VALM2(XQORNOD(0))
 ;If there is no list quit.
 I '$D(VALMY) Q
 S PXRMDONE=0
 S IND=""
 F  S IND=$O(VALMY(IND)) Q:(+IND=0)!(PXRMDONE)  D
 .;Get the ien.
 .S EPIEN=^TMP("PXRMETM",$J,"IDX",IND,IND)
 .;D PPDISP(EPIEN)
 .D START^PXRMEPED(EPIEN)
 ;
 S VALMBCK="R"
 Q
