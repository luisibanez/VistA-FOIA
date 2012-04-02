LRAPBR2 ;DALOI/WTY/KLL - AP Browser Print ;04/04/01
 ;;5.2;LAB SERVICE;**1030**;NOV 01, 1997
 ;;5.2;LAB SERVICE;**259**;Sep 27, 1994
 ;
 ; This routine is a modified version of LRAPT1 to be used for 
 ; browser display.
 ;
 N LRSS,LRI,LRPATH,LRIENS,LRACN,LRRLDTE,LRRCDTE
 N LRTEXT,LRI1,LRI2,LRIENS1,LRSPC
 S LR("F")=1
 F LRSS="SP","CY","EM" D
 .Q:'+$P($G(^LR(LRDFN,LRSS,0)),"^",4)
 .S LRTMP=""
 .S:LRSS="SP" LRTMP="SURGICAL PATHOLOGY",(LRFILE,LRXF)=63.08
 .S:LRSS="CY" LRTMP="CYTOPATHOLOGY",(LRFILE,LRXF)=63.09
 .S:LRSS="EM" LRTMP="ELECTRON MICROSCOPY",(LRFILE,LRXF)=63.02
 .D GLENTRY("","",1),GLENTRY(LRTMP,30,1)
 .K LRTMP
 .S LRI=0 F  S LRI=$O(^LR(LRDFN,LRSS,LRI)) Q:'LRI  D
 ..S LRIENS=LRI_","_LRDFN_","
 ..S LRPATH=$E($$GET1^DIQ(LRFILE,LRIENS,.02,""),1,12)
 ..S LRACN=$$GET1^DIQ(LRFILE,LRIENS,.06,"")
 ..S:LRACN="" LRACN="?"
 ..S LRRLDTE=$$GET1^DIQ(LRFILE,LRIENS,.11,"")
 ..S LRRCDTE=$$FMTE^XLFDT($$GET1^DIQ(LRFILE,LRIENS,.1,"I"),"D")
 ..D GLENTRY("Organ/tissue:",2,1)
 ..D GLENTRY("Date rec'd: "_LRRCDTE,17)
 ..D GLENTRY("Acc #:"_LRACN,43)
 ..D GLENTRY(LRPATH,64)
 ..I LRRLDTE="" D GLENTRY("Report not verified.",5,1)
 ..;KLL - Display Snomed Codes on report in Browser
 ..D GETSNMD
 ..Q:LRRLDTE=""
 ..;Special Studies
 ..S LRFILE1=+$$GET1^DID(LRFILE,10,"","SPECIFIER")
 ..S LRI1=0 F  S LRI1=$O(^LR(LRDFN,LRSS,LRI,2,LRI1)) Q:'LRI1  D
 ...S LRFILE2=+$$GET1^DID(LRFILE1,5,"","SPECIFIER")
 ...S LRI2=0 F  S LRI2=$O(^LR(LRDFN,LRSS,LRI,2,LRI1,5,LRI2)) Q:'LRI2  D
 ....S LRIENS1=LRI2_","_LRI1_","_LRIENS
 ....D GETS^DIQ(LRFILE2,LRIENS1,".01;.03","","LRARR")
 ....M LRSPC=LRARR(LRFILE2,LRIENS1)
 ....S LRSPC(.02)=$$GET1^DIQ(LRFILE2,LRIENS1,.02,"E")
 ....S LRTEXT=LRSPC(.01)_" "_LRSPC(.03)_" Date: "_LRSPC(.02)
 ....D GLENTRY(LRTEXT,5,1)
 Q
GETSNMD ;Retrieve SNOMED codes, desc. for display to Browser
 S LRQUIT=0
 D CHKSNMD
 Q:LRQUIT
 I LRAU D
 .S LRFIL="^LR(LRDFN,""AY"",",LRFILE1=63.2,LRIENS=LRDFN_",",LRCASE=1
 I 'LRAU D
 .S LRFIL="^LR(LRDFN,LRSS,LRI,2,"
 .S LRFILE1=+$$GET1^DID(LRFILE,10,"","SPECIFIER")
 .S LRIENS=LRI_","_LRDFN_","
 .S LRCASE=+$$GET1^DIQ(69.2,LRAA_",",.05,"I")
 S LRA=0  F  S LRA=$O(@(LRFIL_"LRA)")) Q:LRA'>0!(LRQUIT)  D
 .;Topography
 .S LRIENS1=LRA_","_LRIENS
 .D WRTSNMD(LRFILE1,LRIENS1,LRCASE,"T",0)
 .;Morphology
 .S LRA1=0
 .F  S LRA1=$O(@(LRFIL_"LRA,2,LRA1)")) Q:LRA1'>0!(LRQUIT)  D
 ..S LRFILE2=+$$GET1^DID(LRFILE1,4,"","SPECIFIER")
 ..S LRIENS2=LRA1_","_LRIENS1
 ..D WRTSNMD(LRFILE2,LRIENS2,LRCASE,"M",5)
 ..;Etiology
 ..S LRA2=0
 ..F  S LRA2=$O(@(LRFIL_"LRA,2,LRA1,1,LRA2)")) Q:LRA2'>0!(LRQUIT)  D
 ...S LRFILE3=+$$GET1^DID(LRFILE2,1,"","SPECIFIER")
 ...S LRIENS3=LRA2_","_LRIENS2
 ...D WRTSNMD(LRFILE3,LRIENS3,LRCASE,"E",10)
 .;Disease,Function,Procedure
 .F LRDFP="1;3","3;1","4;1.5" D
 ..S LRDFP(1)=$P(LRDFP,";"),LRDFP(2)=$P(LRDFP,";",2),LRA1=0
 ..F  S LRA1=$O(@(LRFIL_"LRA,LRDFP(1),LRA1)")) Q:LRA1'>0!(LRQUIT)  D
 ...S LRFILE2=+$$GET1^DID(LRFILE1,LRDFP(2),"","SPECIFIER")
 ...S LRIENS2=LRA1_","_LRIENS1
 ...S LRPRFX=$S(LRDFP(1)=1:"D",LRDFP(1)=3:"F",1:"P")
 ...D WRTSNMD(LRFILE2,LRIENS2,LRCASE,LRPRFX,5)
 Q
CHKSNMD ;Check for SNOMED codes on the accession
 N LRSB
 I LRAU D  Q
 .S LRSB=$Q(^LR(LRDFN,"AY",0))
 .I $QS(LRSB,2)'="AY" S LRQUIT=1
 S LRSB=$Q(^LR(LRDFN,LRSS,LRI,2,0))
 I $QS(LRSB,4)'=2 S LRQUIT=1
 Q
WRTSNMD(LRP1,LRP2,LRP3,LRP4,LRP5) ;
 ;LRP1=File number
 ;LRP2=IEN string
 ;LRP3=Case (Upper or Lower)
 ;LRP4=Prefix
 ;LRP5=Tab position
 N LRSM
 S LRSM(1)=$$GET1^DIQ(LRP1,LRP2,.01)
 S:LRP3 LRSM(1)=$$LOW^XLFSTR(LRSM(1))
 S LRSM(2)=LRP4_"-"_$$GET1^DIQ(LRP1,LRP2,".01:2")
 S LRTXT=LRSM(2)_": "_LRSM(1)
 I LRP4="P" D
 .S LRSM(3)=$$GET1^DIQ(LRP1,LRP2,.02,"I")
 .I LRSM(3)'="" S LRTXT=LRTXT_" ("_$S('LRSM(3):"negative",LRSM(3)=1:"positive",1:"?")_")"
 D GLENTRY(LRTXT,LRP5,1)
 Q
GLENTRY(LRPR1,LRPR2,LRPR3) ;Write to global
 ;LRPR1 = Text to be written to global
 ;LRPR2 = Tab position
 ;LRPR3 = 1 means start a new line.  Othewise, write an current line.
 S LRPR3=+$G(LRPR3)
 D:LRPR3 NEWLN^LRAPUTL(LRPR1,LRPR2)
 D:'LRPR3 GLBWRT^LRAPUTL(LRPR1,LRPR2)
 Q
