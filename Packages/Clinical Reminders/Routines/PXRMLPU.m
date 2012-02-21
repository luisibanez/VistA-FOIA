PXRMLPU ; SLC/PKR/PJH - Reminder Patient List ;07/29/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;Main entry point for PXRM PATIENT LIST
START(WVPUB) ;
 N PXRMDONE,VALMBCK,VALMSG,X,XMZ
 D CLEAN^VALM10
 S VALMCNT=0
 D EN^VALM("PXRM PATIENT LIST USER")
 Q
 ;
HDR ; Header code
 N NAME
 I $G(DUZ)'="" S NAME=$$GET1^DIQ(200,DUZ,.01)
 I $G(WVPUB)=1,$G(NAME)'="" S VALMHDR(2)="Private Patient Lists for "_NAME
 I $G(WVPUB)=1,$G(DUZ)="" S VALMHDR(2)="Private Patient Lists"
 I $G(WVPUB)=0 S VALMHDR(2)="Public Patient Lists"
 S VALMSG="+ Next Screen   - Prev Screen   ?? More Actions"
 Q
 ;
BLDLIST N IEN,PLIST
 K ^TMP("PXRMLPU",$J)
 K ^TMP("PXRMLPUH",$J)
 I $G(WVPUB)=1 D LIST(.PLIST,.IEN)
 I $G(WVPUB)=0 D PULIST(.PLIST,.IEN)
 M ^TMP("PXRMLPU",$J)=PLIST
 S VALMCNT=PLIST("VALMCNT")
 F IND=1:1:VALMCNT D
 .S ^TMP("PXRMLPU",$J,"IDX",IND,IND)=IEN(IND)
 Q
 ;
LIST(RLIST,IEN) ;Build a list of patient list entries.
 N COUNT,DATE,IND,SIEN,FNAME,NAME,NODE,LEVEL
 ;Build the list in alphabetical order.
 S VALMCNT=0,NAME=""
 F  S NAME=$O(^PXRMXP(810.5,"B",NAME)) Q:NAME=""  D
 .S IND="" F  S IND=$O(^PXRMXP(810.5,"B",NAME,IND)) Q:'IND  D
 ..S NODE=$G(^PXRMXP(810.5,IND,0)),LEVEL=""
 ..I $P($G(NODE),U,7)=DUZ S LEVEL="CREATOR"
 ..I LEVEL="" S SIEN="" D
 ...F  S SIEN=$O(^PXRMXP(810.5,IND,40,"B",SIEN)) Q:SIEN=""!($G(LEVEL)'="")  D
 ....I SIEN=DUZ S LEVEL="AUTHORIZED" Q
 ..I LEVEL="" Q
 ..S FNAME=$P($G(NODE),U),DATE=$P($G(NODE),U,4)
 ..S COUNT=+$P($G(^PXRMXP(810.5,IND,30,0)),U,4),VALMCNT=VALMCNT+1
 ..S RLIST(VALMCNT,0)=$$FRE(VALMCNT,FNAME,DATE,COUNT,LEVEL)
 ..S IEN(VALMCNT)=IND
 S RLIST("VALMCNT")=VALMCNT
 Q
 ;
PULIST(RLIST,IEN) ;Build a list of patient list entries.
 N COUNT,DATE,IND,SIEN,FNAME,NAME,NODE,LEVEL
 ;Build the list in alphabetical order.
 S VALMCNT=0,NAME=""
 F  S NAME=$O(^PXRMXP(810.5,"B",NAME)) Q:NAME=""  D
 .S IND="" F  S IND=$O(^PXRMXP(810.5,"B",NAME,IND)) Q:'IND  D
 ..S NODE=$G(^PXRMXP(810.5,IND,0)) I $P($G(NODE),U,7)'="" Q
 ..S FNAME=$P($G(NODE),U),DATE=$P($G(NODE),U,4)
 ..S COUNT=+$P($G(^PXRMXP(810.5,IND,30,0)),U,4),VALMCNT=VALMCNT+1
 ..S RLIST(VALMCNT,0)=$$FRE(VALMCNT,FNAME,DATE,COUNT)
 ..S IEN(VALMCNT)=IND
 S RLIST("VALMCNT")=VALMCNT
 Q
 ;
FRE(NUMBER,NAME,DATE,COUNT,LEVEL) ;Format  entry number, name, source,
 ;and date packed.
 N TEMP,TNAME,TSOURCE
 S TEMP=$$RJ^XLFSTR(NUMBER,5," ")
 S TNAME=$E(NAME,1,45)
 S TEMP=TEMP_"  "_$$LJ^XLFSTR(TNAME,45," ")
 S DATE=$$FMTE^XLFDT(DATE,2)
 S TEMP=TEMP_"  "_$$LJ^XLFSTR(DATE,17," ")
 S TEMP=TEMP_"  "_$$RJ^XLFSTR(COUNT,6," ")
 I $G(LEVEL)'="" S TEMP=TEMP_"  "_$$LJ^XLFSTR(LEVEL,10," ")
 Q TEMP
 ;
ENTRY ;Entry code
 ;D CLEAN^VALM10
 D BLDLIST,XQORM
 Q
 ;
EXIT ;Exit code
 K ^TMP("PXRMLPU",$J)
 K ^TMP("PXRMLPUH",$J)
 D CLEAN^VALM10
 D FULL^VALM1
 S VALMBCK="R"
 Q
 ;
HLP ;Help code
 N ORU,ORUPRMT,SUB,XQORM
 I $G(WVPUB)=0 S SUB="PXRMLPUP"
 E  S SUB="PXRMLPUH"
 D EN^VALM("PXRM PATIENT LIST HELP")
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
XQORM ;
 S XQORM("#")=$O(^ORD(101,"B","PXRM PATIENT LIST USER SELECT ENTRY",0))_U_"1:"_VALMCNT
 S XQORM("A")="Select Item: "
 Q
 ;
XSEL ;PXRM EXCH SELECT COMPONENT validation
 N CREAT,EPIEN,LEVEL,LISTIEN,LRIEN,SEL
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
 ;Get the patient list ien
 S LISTIEN=^TMP("PXRMLPU",$J,"IDX",SEL,SEL)
 ;Get extract parameter ien (if present)
 S EPIEN=$P($G(^PXRMXP(810.5,LISTIEN,0)),U,5)
 ;Get list rule ien
 S LRIEN=$P($G(^PXRMXP(810.5,LISTIEN,0)),U,6)
 S CREAT=$P($G(^PXRMXP(810.5,LISTIEN,0)),U,7)
 ;
 ;Full screen mode
 D FULL^VALM1
 ;
 ;Option to Install, Delete or Install History
 N X,Y,DIR,OPTION,RIEN K DIROUT,DIRUT,DTOUT,DUOUT
 S LEVEL=0
 I $G(WVPUB)=1 D
 . I $G(CREAT)=DUZ S LEVEL=1 Q
 . S RIEN=$O(^PXRMXP(810.5,LISTIEN,40,"B",DUZ,"")) I $G(RIEN)="" Q
 . I $P($G(^PXRMXP(810.5,LISTIEN,40,RIEN,0)),U,2)="F" S LEVEL=1 Q
 I ($G(WVPUB)=1&(LEVEL=1))!($G(WVPUB)=0) D
 .S DIR(0)="SBM"_U_"CO:Copy Patient List;"
 .S DIR(0)=DIR(0)_"COE:Copy to OE/RR Team;"
 .S DIR(0)=DIR(0)_"DE:Delete Patient List;"
 .S DIR(0)=DIR(0)_"DSP:Display Patient List;"
 .S DIR("A")="Select Action: "
 .S DIR("B")="DSP"
 .S DIR("?")="Select from the codes displayed. For detailed help type ??"
 .S DIR("??")=U_"D HELP^PXRMLPM(1)"
 .D ^DIR K DIR
 .I $D(DIROUT) S DTOUT=1
 .I $D(DTOUT)!($D(DUOUT)) S VALMBCK="R" Q
 .S OPTION=Y
 ;
 I $G(WVPUB)=1,LEVEL=0 D
 .S DIR(0)="SBM"_U_"CO:Copy Patient List;"
 .S DIR(0)=DIR(0)_"DSP:Display Patient List;"
 .S DIR("A")="Select Action: "
 .S DIR("B")="DSP"
 .S DIR("?")="Select from the codes displayed. For detailed help type ??"
 .S DIR("??")=U_"D HELP^PXRMLPM(1)"
 .D ^DIR K DIR
 .I $D(DIROUT) S DTOUT=1
 .I $D(DTOUT)!($D(DUOUT)) S VALMBCK="R" Q
 .S OPTION=Y
 ;
 ;Copy patient list
 I $G(OPTION)="" G XSELE
 I OPTION="CO" D
 .D COPY^PXRMRULE(LISTIEN)
 .;D BLDLIST
 ;
 ;Copy to OE/RR Team
 I OPTION="COE" D
 .D OERR^PXRMLPOE(LISTIEN) Q:$D(DUOUT)!$D(DTOUT)
 ;
 ;Delete patient list
 I OPTION="DE" D
 .D DELETE^PXRMRULE(LISTIEN) Q:$D(DUOUT)!$D(DTOUT)
 .W !,"Patient List Deleted" H 2
 ;
 ;Display patient list
 I OPTION="DSP" D
 .D START^PXRMLPP(LISTIEN)
 ;
XSELE ;
 D CLEAN^VALM10
 D BLDLIST,XQORM
 S VALMBCK="R"
 Q
 ;
HELP(CALL) ;General help text routine
 N HTEXT
 ;
 I CALL=1 D
 .S HTEXT(1)="Select CO to copy patient list."
 .S HTEXT(2)="Select COE to copy patient list to OE/RR Team."
 .S HTEXT(3)="Select CR to delete patient list."
 .S HTEXT(4)="Select DSP to display patient list."
 ;
 D HELP^PXRMEUT(.HTEXT)
 Q
 ;
PCOPY ;Patient list copy
 ;
 S SUB="PXRMLPU"
 D PCOPY1(SUB)
 D BLDLIST
 S VALMBCK="R"
 Q
 ;
PCOPY1(SUB) ;
 ;Full Screen
 W IORESET
 ;
 N IND,LISTIEN,VALMY
 D EN^VALM2(XQORNOD(0))
 ;If there is no list quit.
 I '$D(VALMY) Q
 S IND="",PXRMDONE=0
 F  S IND=$O(VALMY(IND)) Q:(+IND=0)!(PXRMDONE)  D
 .;Get the patient list ien.
 .S LISTIEN=^TMP(SUB,$J,"IDX",IND,IND)
 .D COPY^PXRMRULE(LISTIEN)
 ;
 ;D BLDLIST
 ;
 ;S VALMBCK="R"
 Q
 ;
PLIST ;Patient list inquiry.
 N CREAT,NAME,IND,LISTIEN,VALMY,CREAT,NODE
 D EN^VALM2(XQORNOD(0))
 ;If there is no list quit.
 I '$D(VALMY) Q
 ;PXRMDONE is newed in PXRMLPU
 S PXRMDONE=0
 S IND=""
 F  S IND=$O(VALMY(IND)) Q:(+IND=0)!(PXRMDONE)  D
 .;Get the patient list ien.
 .S LISTIEN=^TMP("PXRMLPU",$J,"IDX",IND,IND)
 .S NODE=$G(^PXRMXP(810.5,LISTIEN,0))
 .I $G(WVPUB)=1 D
 ..S CREAT=0 I DUZ=$P($G(NODE),U,7) S CREAT=1
 ..I CREAT=0 S NAME=0 D
 ...F  S NAME=$O(^PXRMXP(810.5,LISTIEN,40,"B",NAME)) Q:+NAME'>0!(CREAT=1)  D
 ....I DUZ=NAME S CREAT=1
 ..I CREAT=0 D
 ...W !,"You must be the creator or a Authorized User of "_$P($G(NODE),U)_" to view the list"
 ...S PXRMDONE=1 H 2
 ..I CREAT=1 D START^PXRMLPP(LISTIEN)
 .I $G(WVPUB)=0 D START^PXRMLPP(LISTIEN)
 D BLDLIST
 S VALMBCK="R"
 Q
 ;
PDELETE ;Patient list delete
 ;
 ;Full Screen
 W IORESET
 ;
 N CREAT,IND,LISTIEN,NODE,VALMY
 D EN^VALM2(XQORNOD(0))
 ;If there is no list quit.
 I '$D(VALMY) Q
 S IND="",PXRMDONE=0
 F  S IND=$O(VALMY(IND)) Q:(+IND=0)!(PXRMDONE)  D
 .;Get the patient list ien.
 .S LISTIEN=^TMP("PXRMLPU",$J,"IDX",IND,IND)
 .S NODE=$G(^PXRMXP(810.5,LISTIEN,0))
 .I $G(WVPUB)=1 D
 ..S CREAT=$P($G(NODE),U,7)
 ..I CREAT=DUZ D
 ...D DELETE^PXRMRULE(LISTIEN) Q:$D(DUOUT)!$D(DTOUT)
 ...W !,"Patient List Deleted (Item "_IND_")" H 2
 ..E  D  Q
 ...W !,"You must be the creator of "_$P($G(NODE),U)_" to view the list"
 ...S PXRMDONE=1 H 2
 .I $G(WVPUB)=0 D DELETE^PXRMRULE(LISTIEN) Q:$D(DUOUT)!$D(DTOUT)
 ;
 D BLDLIST
 ;
 S VALMBCK="R"
 Q
 ;
POERR ;Patient list copy to OERR Team (#101.21)
 ;
 ;Full Screen
 W IORESET
 ;
 N CREAT,IND,LISTIEN,NODE,TRUE,USIEN,VALMY
 D EN^VALM2(XQORNOD(0))
 ;If there is no list quit.
 I '$D(VALMY) Q
 S IND="",PXRMDONE=0
 F  S IND=$O(VALMY(IND)) Q:(+IND=0)!(PXRMDONE)  D
 .;Get the patient list ien.
 .S LISTIEN=^TMP("PXRMLPU",$J,"IDX",IND,IND)
 .S NODE=$G(^PXRMXP(810.5,LISTIEN,0))
 .I $G(WVPUB)=1 D
 ..S TRUE=0
 ..S CREAT=$P($G(NODE),U,7)
 ..I CREAT=DUZ S TRUE=1
 ..I TRUE=0 D
 ...S USIEN=$O(^PXRMXP(810.5,LISTIEN,40,"B",DUZ,""))
 ...I $G(USIEN)="" Q
 ...I $P($G(^PXRMXP(810.5,LISTIEN,40,USIEN,0)),U,2)="F" S TRUE=1
 ..I TRUE=1 D OERR^PXRMLPOE(LISTIEN)
 ..I TRUE=0 D
 ...W !,"You must be the creator of "_$P($G(NODE),U)_" or have full access to copy the list to a OE/RR team"
 ...S PXRMDONE=1 H 2
 .I $G(WVPUB)=0 D OERR^PXRMLPOE(LISTIEN)
 .;S LISTIEN=^TMP("PXRMLPU",$J,"IDX",IND,IND)
 ;
 S VALMBCK="R"
 Q
