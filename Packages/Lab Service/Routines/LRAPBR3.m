LRAPBR3 ;VA/DALOI/WTY - AP Browser Print Cont.;04/06/01
 ;;5.2;LAB SERVICE;**1030**;NOV 01, 1997
 ;;5.2;LAB SERVICE;**259**;Sep 27, 1994
 ;
 ; This routine was created from LRSPRPT1 to be used for printing
 ; the SF515 to the browser and storing the report in a global format
 ; This routine displays any special studies.  Printing of SNOMED
 ; codes and associated journal references (if any) has been removed.
MAIN ;
 N LRTP,LRCNT1,LRA1,LRFILE,LRFILE1
 N LRIENS1,LRA2
 Q:$G(LRSF)=""
 S LRA1=0,LRIENS=LRI_","_LRDFN_","
 S LRFILE=+$$GET1^DID(LRSF,10,"","SPECIFIER")
 F  S LRA1=$O(^LR(LRDFN,LRSS,LRI,2,LRA1)) Q:'LRA1  D
 .S LRIENS1=LRA1_","_LRIENS
 .S LRTP(1)=$$GET1^DIQ(LRFILE,LRIENS1,.01)
 .S LRTP(2)=$$GET1^DIQ(LRFILE,LRIENS1,.01,"I")
 .S LRTP(8)=$$GET1^DIQ(LRFILE,LRIENS1,".01:2")
 .D SPCSTD
 .D JRNLREF
 Q
SPCSTD ;Display Special Studies
 Q:'$P($G(^LR(LRDFN,LRSS,LRI,2,LRA1,5,0)),"^",4)
 D GLENTRY("SPECIAL STUDIES:","",1)
 N LRX,DIWR,DIWL,LRC,LRTMP
 S LRC=0 F  S LRC=$O(^LR(LRDFN,LRSS,LRI,2,LRA1,5,LRC)) Q:'LRC  D
 .S LRFILE1=+$$GET1^DID(LRFILE,5,"","SPECIFIER")
 .F I=.01:.01:.03 D
 ..S LRTP(I)=$$GET1^DIQ(LRFILE1,LRC_","_LRIENS1,I)
 .D GLENTRY("","",1)
 .D GLENTRY(LRTP(.01)_" "_LRTP(.03)_" Date: "_LRTP(.02),"",1)
 .D GLENTRY(LRTP(1),"",1)
 .K ^UTILITY($J,"W")
 .S LRX=$$GET1^DIQ(LRFILE1,LRA1_","_LRIENS1,1,"","LRTMP")
 .S DIWR=IOM-10,DIWL=10,DIWF=""
 .S LRX=+$$GET1^DID(LRFILE1,1,"","SPECIFIER")
 .I $$GET1^DID(LRX,.01,"","SPECIFIER")["L" S DIWF="N"
 .S LRA2=0 F  S LRA2=$O(LRTMP(LRA2)) Q:'LRA2  S X=LRTMP(LRA2) D ^DIWP
 .S LRA2=0 F  S LRA2=$O(^UTILITY($J,"W",DIWL,LRA2)) Q:'LRA2  D
 ..D GLENTRY(^UTILITY($J,"W",DIWL,LRA2,0),DIWL,1)
 .K ^UTILITY($J,"W")
 Q
 ;
JRNLREF ;Display Journal References
 ;Topography
 N LRFL,LRM,LRN
 S LRFL=LRTP(2),LRFILE1=61 D JREFPRT
 ;Morphology
 S LRFILE1=61.1,LRFILE3=+$$GET1^DID(LRFILE,4,"","SPECIFIER")
 S LRM=0 F  S LRM=$O(^LR(LRDFN,LRSS,LRI,2,LRA1,2,LRM)) Q:'LRM  D
 .S LRIENS2=LRM_","_LRIENS1
 .S LRFL=$$GET1^DIQ(LRFILE3,LRIENS2,.01,"I")
 .D JREFPRT
 .;Etiology
 .S LRFILE1=61.2,LRFILE4=+$$GET1^DID(LRFILE3,1,"","SPECIFIER")
 .S LRN=0 F  S LRN=$O(^LR(LRDFN,LRSS,LRI,2,LRA1,2,LRM,1,LRN)) Q:'LRN  D
 ..S LRIENS3=LRN_","_LRIENS2
 ..S LRFL=$$GET1^DIQ(LRFILE4,LRIENS3,.01,"I")
 ..D JREFPRT
 ;Disease
 S LRFILE1=61.4,LRFILE3=+$$GET1^DID(LRFILE,3,"","SPECIFIER")
 S LRM=0 F  S LRM=$O(^LR(LRDFN,LRSS,LRI,2,LRA1,1,LRM)) Q:'LRM  D
 .S LRIENS2=LRM_","_LRIENS1
 .S LRFL=$$GET1^DIQ(LRFILE3,LRIENS2,.01,"I")
 .D JREFPRT
 ;Function
 S LRFILE1=61.3,LRFILE3=+$$GET1^DID(LRFILE,1,"","SPECIFIER")
 S LRM=0 F  S LRM=$O(^LR(LRDFN,LRSS,LRI,2,LRA1,3,LRM)) Q:'LRM  D
 .S LRIENS2=LRM_","_LRIENS1
 .S LRFL=$$GET1^DIQ(LRFILE3,LRIENS2,.01,"I")
 .D JREFPRT
 Q
JREFPRT ;
 ; Print journal reference on the patient report if the 
 ; reference is flagged for printing.
 N LRJR,LRINC
 S LRFILE2=+$$GET1^DID(LRFILE1,5,"","SPECIFIER")
 S LRJR=0 F  S LRJR=$O(^LAB(LRFILE1,LRFL,"JR",LRJR)) Q:'LRJR  D
 .S LRJR(.01)=$$GET1^DIQ(LRFILE2,LRJR_","_LRFL_",",.01)
 .F LRINC=1:1:5 D
 ..S LRJR(LRINC)=$$GET1^DIQ(LRFILE2,LRJR_","_LRFL_",",LRINC)
 .S LRJR(6)=$$GET1^DIQ(LRFILE2,LRJR_","_LRFL_",",6,"I")
 .Q:'LRJR(6)
 .D GLENTRY(,,1),GLENTRY("Reference: ",,1)
 .D GLENTRY(LRJR(.01),,1)
 .D GLENTRY(LRJR(1),,1),GLENTRY(,,1)
 .I LRJR(2)'="" D
 ..D GLENTRY(LRJR(2)_"  vol."_LRJR(3),BTAB)
 ..D GLENTRY(" pg."_LRJR(4),BTAB)
 .D GLENTRY("  Date: "_LRJR(5),BTAB)
 Q
GLENTRY(LRPR1,LRPR2,LRPR3) ;Write to global
 ;LRPR1 = Text to be written to global
 ;LRPR2 = Tab position
 ;LRPR3 = 1 means start a new line.  Othewise, write on current line.
 S LRPR1=$G(LRPR1),LRPR2=+$G(LRPR2),LRPR3=+$G(LRPR3)
 D:LRPR3 NEWLN^LRAPUTL(LRPR1,LRPR2)
 D:'LRPR3 GLBWRT^LRAPUTL(LRPR1,LRPR2)
 Q
