PXRMEPM ; SLC/PKR/PJH - Extract Parameter Management ;11/21/2002
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;Main entry point for PXRM EXTRACT PARAMETERS
START N PXRMDONE,VALMBCK,VALMCNT,VALMSG,X,XMZ,XQORM,XQORNOD
 S X="IORESET"
 D ENDR^%ZISS
 S VALMCNT=0
 D EN^VALM("PXRM EXTRACT PARAMETERS")
 Q
 ;
BLDLIST ;Build workfile
 K ^TMP("PXRMEPM",$J)
 N IEN,IND,PLIST
 D LIST^PXRMETM(.PLIST,.IEN)
 M ^TMP("PXRMEPM",$J)=PLIST
 S VALMCNT=PLIST("VALMCNT")
 F IND=1:1:VALMCNT D
 .S ^TMP("PXRMEPM",$J,"IDX",IND,IND)=IEN(IND)
 Q
 ;
ENTRY ;Entry code
 D BLDLIST,XQORM
 Q
 ;
EXIT ;Exit code
 K ^TMP("PXRMEPM",$J)
 K ^TMP("PXRMEPMH",$J)
 D CLEAN^VALM10
 D FULL^VALM1
 S VALMBCK="Q"
 Q
 ;
HDR ; Header code
 S VALMSG="+ Next Screen   - Prev Screen   ?? More Actions"
 Q
 ;
HLP ;Help code
 N ORU,ORUPRMT,SUB,XQORM
 S SUB="PXRMEPMH"
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
XQORM S XQORM("#")=$O(^ORD(101,"B","PXRM EXTRACT PARAMETER SELECT ENTRY",0))_U_"1:"_VALMCNT
 S XQORM("A")="Select Item: "
 Q
 ;
XSEL ;PXRM EXTRACT PARAMETER SELECT ENTRY validation
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
 S IEN=^TMP("PXRMEPM",$J,"IDX",SEL,SEL)
 ;Display/Edit Extract Parameter
 D START^PXRMEPED(IEN)
 ;
 D BLDLIST
 ;
 S VALMBCK="R"
 Q
 ;
HELP(CALL) ;General help text routine
 N HTEXT
 I CALL=1 D
 .S HTEXT(1)="Select DR to display or edit a rule."
 .S HTEXT(2)="Select ED to edit a rule"
 ;
 D HELP^PXRMEUT(.HTEXT)
 Q
 ;
EPADD ;Add Rule Option
 ;
 ;Reset Screen Mode
 W IORESET
 ;
 ;Add Rule
 D ADD^PXRMEPED
 ;
 ;Rebuild Workfile
 D BLDLIST
 ;
 S VALMBCK="R"
 Q
 ;
EPINQ ;Parameter Inquiry - PXRM EXTRACT PARAMETER DISPLAY/EDIT entry 
 N IND,LRIEN,VALMY
 D EN^VALM2(XQORNOD(0))
 ;
 ;If there is no list quit.
 I '$D(VALMY) Q
 S PXRMDONE=0
 S IND=""
 F  S IND=$O(VALMY(IND)) Q:(+IND=0)!(PXRMDONE)  D
 .;Get the ien.
 .S LRIEN=^TMP("PXRMEPM",$J,"IDX",IND,IND)
 .D START^PXRMEPED(LRIEN)
 ;
 D BLDLIST
 ;
 S VALMBCK="R"
 Q
 ;
PPLR ;Display rule set components 
 ;used by [PXRM EXTRACT PARAMETER] template)
 N ACT,DATA,FIRST,IEN,LRDATA,LRIEN,SEQ,SUB
 S IEN=$P(X,U,2) Q:'IEN
 W !," Description: ",$P($G(^PXRM(810.4,IEN,0)),U,2)
 S SEQ="",FIRST=1
 F  S SEQ=$O(^PXRM(810.4,IEN,30,"B",SEQ)) Q:'SEQ  D
 .S SUB=$O(^PXRM(810.4,IEN,30,"B",SEQ,"")) Q:'SUB
 .S DATA=$G(^PXRM(810.4,IEN,30,SUB,0)) Q:DATA=""
 .S LRIEN=$P(DATA,U,2) Q:LRIEN=""
 .S ACT=$P(DATA,U,3),LRDATA=$G(^PXRM(810.4,LRIEN,0))
 .I FIRST W !!,?2,"List Rules:" S FIRST=0
 .W !,?2,SEQ,?7,$P(LRDATA,U),?66
 .W $S(ACT="A":"ADD PATIENT",ACT="R":"REMOVE PATIENT",ACT="F":"ADD FINDING",1:"SELECT PATIENT")
 .W !,?3,"Description:"
 .;Display List Rule fields
 .D LROUT^PXRMLRED(LRIEN,1)
 .W !
 Q
 ;
PPFR ;Display finding total TERMS and count type 
 ;used by [PXRM EXTRACT PARAMETER] template)
 W !
 N DATA,GIEN,GSTATUS,IEN,SEQ,SUB
 S IEN=$P(X,U,3) Q:'IEN
 S SEQ=""
 F  S SEQ=$O(^PXRM(810.7,IEN,10,"B",SEQ)) Q:SEQ=""  D
 .S SUB=$O(^PXRM(810.7,IEN,10,"B",SEQ,"")) Q:'SUB
 .S DATA=$G(^PXRM(810.7,IEN,10,SUB,0)) Q:DATA=""
 .S GIEN=$P(DATA,U,2) Q:GIEN=""
 .S GSTATUS=$P(DATA,U,3)
 .;Get finding groups
 .N CTYP,CTXT,DATA,EXCL,FIRST,GNAME,PNAME,TIEN,TNAME,GSEQ,GSUB
 .S DATA=$G(^PXRM(810.8,GIEN,0)),GNAME=$P(DATA,U)
 .S CTYP=$P(DATA,U,3),PNAME=$P(DATA,U,2),GSEQ="",FIRST=1
 .S CTXT=$$TXT(CTYP,GSTATUS)
 .F  S GSEQ=$O(^PXRM(810.8,GIEN,10,"B",GSEQ)) Q:GSEQ=""  D
 ..S GSUB=$O(^PXRM(810.8,GIEN,10,"B",GSEQ,"")) Q:'GSUB
 ..S DATA=$G(^PXRM(810.8,GIEN,10,GSUB,0)) Q:DATA=""
 ..S TIEN=$P(DATA,U,2) Q:TIEN=""
 ..S EXCL=$P(DATA,U,3) Q:EXCL="E"
 ..S TNAME=$P($G(^PXRMD(811.5,TIEN,0)),U)
 ..I FIRST D
 ...W !,?14,SEQ
 ...W ?18,"Finding Group: ",GNAME
 ...W !,?18,$$TXT(CTYP,GSTATUS)
 ...W !,?23,"Terms:" S FIRST=0
 ..W ?30,TNAME,!
 Q
 ;
SCREEN ;Screen for 810.210 field .02
 S DIC("S")="I $P(^(0),U,3)=3"
 Q
 ;
TXT(COUNT,COHORT) ;Text to describe group
 N TXT
 ;Determine count type
 I COUNT="MRFP" S TXT="Most recent finding patient counts for "
 I COUNT="MRF" S TXT="Most recent finding counts for "
 I COUNT="UR" S TXT="Utilization in period finding counts for "
 ;Error
 I $G(TXT)="" Q "Unknown count type - error"
 ;Determine cohort
 S TXT=TXT_$S(COHORT="A":"APPLICABLE",1:"TOTAL")_" patients"
 Q TXT
