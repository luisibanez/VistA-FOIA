PXRMLPP ; SLC/PKR/PJH - Reminder Patient List Patients ;17/04/2003
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;Main entry point for PXRM PATIENT LIST
START(IEN) ;
 N VALMBCK,VALMBG,VALMCNT,VALMSG,X,XMZ,XQORM,XQORNOD
 N PXRMVIEW,SCLASS,DATA,SDATA,SNAME,SOURCE
 ;Get Patient List record 
 S SDATA=$G(^PXRMXP(810.5,IEN,0)),SOURCE=$P(SDATA,U,5),SNAME="NONE"
 ;Check if generated from #810.2
 I SOURCE S SNAME="Extract Parameter - "_$P($G(^PXRM(810.2,SOURCE,0)),U)
 ;If not check if generated from #810.4
 I 'SOURCE S SOURCE=$P(SDATA,U,6) S:SOURCE SNAME="List Rule - "_$P($G(^PXRM(810.4,SOURCE,0)),U)
 ;Class
 S CLASS=$P($G(^PXRMXP(810.5,IEN,100)),U)
 S CLASS=$S(CLASS="N":"National",CLASS="V":"VISN",1:"Local")
 ;Default view by facility
 S PXRMVIEW="F"
 ;
 S VALMCNT=0
 D EN^VALM("PXRM PATIENT LIST PATIENTS")
 Q
 ;
BLDLIST(IEN) ;Build a list of all patients
 N IND
 K ^TMP("PXRMLPP",$J),^TMP("PXRMLPPA",$J),^TMP("PXRMLPPI",$J)
 D LIST(.VALMCNT,.IEN)
 F IND=1:1:VALMCNT D
 .S ^TMP("PXRMLPP",$J,"IDX",IND,IND)=^TMP("PXRMLPPI",$J,IND)
 K ^TMP("PXRMLPPI",$J)
 Q
 ;
LIST(VALMCNT,IEN) ;Build a list of patients.
 N DATA,DFN,PNAME,IND,NEXT,SNAME,SUB,VADM,VAERR
 ;Build the list in alphabetical order.
 S IND=0
 F  S IND=$O(^PXRMXP(810.5,IEN,30,IND)) Q:'IND  D
 .S DATA=$G(^PXRMXP(810.5,IEN,30,IND,0)) Q:DATA=""
 .S DFN=$P(DATA,U) Q:'DFN
 .D DEM^VADPT S PNAME=$G(VADM(1))
 .S SNAME=$P(DATA,U,2) S:SNAME="" SNAME="NONE"
 .S SUB=SNAME S:PXRMVIEW="N" SUB="NAME"
 .S ^TMP("PXRMLPPA",$J,SUB,PNAME_"/"_DFN_"/")=SNAME
 ;Transfer to list manager array 
 S SUB="",VALMCNT=0
 F  S SUB=$O(^TMP("PXRMLPPA",$J,SUB)) Q:SUB=""  D
 .S NEXT=""
 .F  S NEXT=$O(^TMP("PXRMLPPA",$J,SUB,NEXT)) Q:NEXT=""  D
 ..S PNAME=$P(NEXT,"/",1),DFN=$P(NEXT,"/",2)
 ..S SNAME=^TMP("PXRMLPPA",$J,SUB,NEXT)
 ..S VALMCNT=VALMCNT+1
 ..S ^TMP("PXRMLPP",$J,VALMCNT,0)=$$FRE(VALMCNT,PNAME,SNAME,DFN)
 ..;S ^TMP("PXRMLPP",$J,VALMCNT,0)=$$FRE(VALMCNT,PNAME,DFN)
 ..S ^TMP("PXRMLPPI",$J,VALMCNT)=DFN
 ;
 K ^TMP("PXRMLPPA",$J)
 Q
 ;
FRE(NUMBER,NAME,SNAME,IEN) ;Format  entry number, name and primary station
 ;and date packed.
 N TEMP,TNAME,TSOURCE
 S TEMP=$$RJ^XLFSTR(NUMBER,5," ")
 S TNAME=$E(NAME,1,30)
 S TEMP=TEMP_"  "_$$LJ^XLFSTR(TNAME,32," ")
 S TEMP=TEMP_"  "_$$LJ^XLFSTR(IEN,15," ")
 S TEMP=TEMP_"  "_$$LJ^XLFSTR(SNAME,8," ")
 Q TEMP
 ;
DEM ;
 D FULL^VALM1
 D EN^PXRMPD(IEN)
 ;
 S VALMBCK="R"
 Q
 ;
USER ;
 I $P($G(^PXRMXP(810.5,IEN,0)),U,7)="" D FULL^VALM1 W !,"This option is lock for Public List." H 2 Q
 D FULL^VALM1
 D START^PXRMLPAU(IEN)
 ;
 S VALMBCK="R"
 Q
 ;
ENTRY ;Entry code
 D BLDLIST(IEN)
 D XQORM
 Q
 ;
EXIT ;Exit code
 K ^TMP("PXRMLPP",$J)
 K ^TMP("PXRMLPPH",$J)
 D CLEAN^VALM10
 D FULL^VALM1
 S VALMBCK="R"
 Q
 ;
HDR ; Header code
 N CREAT
 S CREAT=$P($G(^PXRMXP(810.5,IEN,0)),U,7)
 S VALMHDR(1)="List Name: "_$P($G(^PXRMXP(810.5,IEN,0)),U)_" ("_VALMCNT_" patients)"
 S VALMHDR(2)="  Created: "_$$FMTE^XLFDT($P($G(^PXRMXP(810.5,IEN,0)),U,4),"5Z")
 S VALMHDR(2)=$$LJ^XLFSTR(VALMHDR(2),40)_"Creator: "_$S($G(CREAT)>0:$$GET1^DIQ(200,CREAT,.01),1:"None")
 S VALMHDR(3)="   Source: "_SNAME
 S VALMHDR(3)=$$LJ^XLFSTR(VALMHDR(3),54)_"Class: "_CLASS
 S VALMSG="+ Next Screen   - Prev Screen   ?? More Actions"
 Q
 ;
HLP ;Help code
 N ORU,ORUPRMT,SUB,XQORM
 S SUB="PXRMLPPH"
 D EN^VALM("PXRM PATIENT LIST HELP")
 Q
 ;
INIT ;Init
 S VALMCNT=0
 Q
 ;
PEXIT ;PXRM PATIENT LIST PATIENTS MENU protocol exit code
 S VALMSG="+ Next Screen   - Prev Screen   ?? More Actions"
 D XQORM
 Q
 ;
XQORM S XQORM("#")=$O(^ORD(101,"B","PXRM PATIENT LIST PATIENT SELECT",0))_U_"1:"_VALMCNT
 S XQORM("A")="Select Item: "
 Q
 ;
XSEL ;PXRM PATIENT LIST PATIENT SELECT validation
 N EPIEN,DFN,SEL
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
 S DFN=^TMP("PXRMLPP",$J,"IDX",SEL,SEL)
 ;Full screen mode
 D FULL^VALM1
 ;Print individual Health Summary
 D HSI^PXRMLPHS(DFN)
 ;
 S VALMBCK="R"
 Q
 ;
HSA ;Print Health Summary for all patients on list
 D HSA^PXRMLPHS(IEN)
 ;
 S VALMBCK="R"
 Q
 ;
HSI ;Print Health Summary for a selected patient
 ;
 ;Full Screen
 W IORESET
 ;
 N IND,DFN,VALMY
 D EN^VALM2(XQORNOD(0))
 ;If there is no list quit.
 I '$D(VALMY) Q
 S IND="",PXRMDONE=0
 F  S IND=$O(VALMY(IND)) Q:(+IND=0)!(PXRMDONE)  D
 .;Get the patient list ien.
 .S DFN=^TMP("PXRMLPP",$J,"IDX",IND,IND)
 .D HSI^PXRMLPHS(DFN)
 ;
 S VALMBCK="R"
 Q
 ;
VIEW ;Select view
 ;
 W IORESET
 ;
 S VALMBCK="R",VALMBG=1
 ;
 N X,Y,CODE,DIR
 K DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="S"_U_"F:Sort by Facility and Name;"
 S DIR(0)=DIR(0)_"N:Sort by Name;"
 S DIR("A")="TYPE OF VIEW"
 S DIR("B")=$S(PXRMVIEW="N":"F",1:"N")
 S DIR("?")="Select from the codes displayed. For detailed help type ??"
 S DIR("??")=U_"D HELP^PXRMSEL2(3)"
 D ^DIR K DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q
 ;Change display type
 S PXRMVIEW=Y
 ;
 ;Rebuild Workfile
 D BLDLIST^PXRMLPP(IEN),HDR
 Q
 ;
