LRAPBRPW ;VA/DALOI/WTY - POW Patient Browser Print;04/03/01
 ;;5.2;LAB SERVICE;**1030**;NOV 01, 1997
 ;;5.2;LAB SERVICE;**259**;Sep 27, 1994
 ;
MAIN ;Main subroutine
 N LRTEXT
 D:$$GET1^DIQ(2,DFN_",",.525,"I")="Y" POW
 D:$$GET1^DIQ(2,DFN_",",.32201,"I")="Y" PERSGULF
 Q
POW ;Prisoner-of-War text
 N LRCLOC
 D GLENTRY("","",1)
 S LRTEXT="*** THIS PATIENT WAS A PRISONER OF WAR ***"
 D GLENTRY(LRTEXT,19,1)
 F I=1:1:2 D GLENTRY("","",1)
 S LRCLOC=$$GET1^DIQ(2,DFN_",",".526:.01")
 D:LRCLOC'="" GLENTRY("POW PERIOD: "_LRCLOC,24)
 D GLENTRY("","",1)
 S LRTEXT="FORWARD A DUPLICATE SET OF SLIDES, BLOCKS AND REPRESENTATIVE "
 S LRTEXT=LRTEXT_"WET TISSUE TO:"
 D GLENTRY(LRTEXT,"",1)
 D GLENTRY("","",1)
 D GLENTRY("DIRECTOR,ARMED FORCES INSTITUTE OF PATHOLOGY",3,1)
 D GLENTRY("ATTENTION: FORMER POW REGISTRY",3,1)
 D GLENTRY("WASHINGTON, D.C. 20306",3,1)
 S LRTEXT="<A POW label (VA Form 10-5558) may be attached to packaged "
 S LRTEXT=LRTEXT_"specimens>"
 D GLENTRY(LRTEXT,"",1)
 D GLENTRY("","",1)
 D GLENTRY("MARK CASE CLEARLY AS:  FORMER POW  "_LRCLOC,"",1)
 S LRTEXT="NOTE IN APPROPRIATE FORM THAT MATERIAL HAS BEEN SENT TO THE "
 S LRTEXT=LRTEXT_"AFIP"
 D GLENTRY(LRTEXT,"",1)
 I $D(LRSS),LRSS="AU" D AUNOTE
 F I=1:1:2 D GLENTRY("","",1)
 Q
AUNOTE ;Autopsy text
 D GLENTRY("","",1)
 S LRTEXT="Follow Guidelines for Performing Autopsy Examination on "
 S LRTEXT=LRTEXT_"Former Prisoners of War (POW's)  PROFESSIONAL "
 S LRTEXT=LRTEXT_"SERVICES LETTER  IL 11-82-17"
 D GLENTRY(LRTEXT,"",1)
 D GLENTRY("Be sure to take appropriate samples of:","",1)
 S LRTEXT="BRAIN, NERVE, TESTES, PROSTATE, URINARY BLADDER, and KIDNEY"
 D GLENTRY(LRTEXT,"",1)
 Q
PERSGULF ;Persian Gulf text
 S LRTEXT="***THIS PATIENT SERVED IN THE PERSIAN GULF WAR***"
 S LRTEXT=$$CJ^XLFSTR(LRTEXT,IOM)
 D GLENTRY("","",1)
 D GLENTRY(LRTEXT,"",1)
 F I=1:1:2 D GLENTRY("","",1)
 S LRTEXT=$$CJ^XLFSTR("***************",IOM)
 D GLENTRY(LRTEXT,"",1)
 D GLENTRY("","",1)
 S LRTEXT="Send a set of DUPLICATE paraffin blocks/smears, "
 S LRTEXT=LRTEXT_"H & E slides for "
 S LRTEXT=$$CJ^XLFSTR(LRTEXT,IOM)
 D GLENTRY(LRTEXT,"",1)
 D GLENTRY("","",1)
 S LRTEXT="Anatomic Path material and a copy of the Final Pathology "
 S LRTEXT=LRTEXT_"Report to "
 S LRTEXT=$$CJ^XLFSTR(LRTEXT,IOM)
 D GLENTRY(LRTEXT,"",1)
 D GLENTRY("","",1)
 S LRTEXT=$$CJ^XLFSTR("the AFIP using the AFIP Requisition form.  ",IOM)
 D GLENTRY(LRTEXT,"",1)
 F I=1:1:2 D GLENTRY("","",1)
 S LRTEXT=$$CJ^XLFSTR("***************",IOM)
 D GLENTRY(LRTEXT,"",1)
 D GLENTRY("","",1)
 Q
GLENTRY(LRPR1,LRPR2,LRPR3) ;Write to global
 ;LRPR1 = Text to be written to global
 ;LRPR2 = Tab position
 ;LRPR3 = 1 means start a new line.  Othewise, write an current line.
 S LRPR3=+$G(LRPR3)
 D:LRPR3 NEWLN^LRAPUTL(LRPR1,LRPR2)
 D:'LRPR3 GLBWRT^LRAPUTL(LRPR1,LRPR2)
 Q
