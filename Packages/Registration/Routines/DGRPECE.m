DGRPECE ;ALB/MRY - REGISTRATION CATASTROPHIC EDITS ; 11/16/04 9:00am
 ;;5.3;Registration;**638,682,700**;Aug 13, 1993
 ;
CEDITS(DFN) ;catastrophic edits  - buffer values, save after check
 ;Input;
 ;  DFN  := patient ien
 ;Catastrophic edits will prompt for name, ssn, dob, and sex.  Placing
 ;responses into a buffer space.  User will be alerted on catastrophic
 ;edits on the following conditions:
 ; 1. Two or more catastrophic edits will generate a warning message.
 ; 2. Acceptance of two or more catatrophic edits will generate an alert
 ; to appropriate supervising staff holding the DG CATASTROPHIC EDIT key.
 ; 3. Acceptance of <2 catatrophic edits will process normally.
 ;
 ; Arrays: BEFORE - Holds patient values before the edit process
 ;                  (before snapshot).
 ;         BUFFER - initialized with BEFORE array, holds edited changes
 ;                  (after snapshot).
 ;         SAVE   - holds only edited changes for filing into file #2.
 ;
 N DA,DIR,DIRUT,Y,BUFFER,BEFORE,SAVE,DG20IEN
 D BEFORE(DFN,.BEFORE,.BUFFER) ;retrieve before patient values
 ;buffer - get name
 K DG20NAME
 S BUFFER("NAME")=$$NCEDIT^DPTNAME(DFN,,.DG20NAME)
 I BUFFER("NAME")="" S BUFFER("NAME")=BEFORE("NAME")
 I $D(DG20NAME("FAMILY")) S BUFFER("FAMILY")=DG20NAME("FAMILY")
 I $D(DG20NAME("GIVEN")) S BUFFER("GIVEN")=DG20NAME("GIVEN")
 I $D(DG20NAME("MIDDLE")) S BUFFER("MIDDLE")=DG20NAME("MIDDLE")
 I $D(DG20NAME("SUFFIX")) S BUFFER("SUFFIX")=DG20NAME("SUFFIX")
 ; the formal name is last name, first name, middle name and suffix
 ; the prefix and degree are only stored in file 20
 I $D(DG20NAME("PREFIX")) S BUFFER("PREFIX")=DG20NAME("PREFIX")
 I $D(DG20NAME("DEGREE")) S BUFFER("DEGREE")=DG20NAME("DEGREE")
 K DG20NAME
 ;buffer - get ssn
 S DIR(0)="2,.09^^"
 S DA=DFN D ^DIR
 I $D(DIRUT) D CECHECK Q
 S BUFFER("SSN")=Y
 ;buffer - get dob
 S DIR(0)="2,.03^^"
 S DA=DFN D ^DIR
 I $D(DIRUT) D CECHECK Q
 S BUFFER("DOB")=Y
 ;buffer - get sex
 S DIR(0)="2,.02^^"
 S DA=DFN D ^DIR
 I $D(DIRUT) D CECHECK Q
 S BUFFER("SEX")=Y
 ; buffer - get MBI (multiple birth indicator)
 S DIR(0)="2,994^^"
 S DA=DFN D ^DIR
 I $D(DIRUT) D CECHECK Q
 S BUFFER("MBI")=Y
CECHECK ;do catastrophic edit checks, alert, and save
 N DGCNT,DGCEFLG
 ;Compare before/buffer arrays, putting edits into save array.
 S DGCNT=$$AFTER(.BEFORE,.BUFFER,.SAVE)
 ;   DGCNT:  0  = no changes
 ;           1  = only one edit change, ok to save w/o CE message
 ;           >1 = more then 1 edit, give CE message
 I DGCNT>1 D  ;give CE message
 . S DGCEFLG=$$WARNING()
 . ;    DGCEFLG: 0  = exit without saving changes
 . ;             1  = send alert and save
 . I DGCEFLG=0 S DGCNT=0
 I DGCNT>0 D SAVE(DFN) I $D(DGCEFLG),DGCEFLG D ALERT
 Q
 ;
SAVE(DFN) ;store accepted/edited values into patient file
 N FDATA,DIERR
 I $D(SAVE("NAME")) S FDATA(2,+DFN_",",.01)=SAVE("NAME")
 I $D(SAVE("DOB")) S FDATA(2,+DFN_",",.03)=SAVE("DOB")
 I $D(SAVE("SEX")) S FDATA(2,+DFN_",",.02)=SAVE("SEX")
 I $D(SAVE("SSN")) S FDATA(2,+DFN_",",.09)=SAVE("SSN")
 I $D(SAVE("MBI")) S FDATA(2,+DFN_",",994)=SAVE("MBI")
 D FILE^DIE("","FDATA","DIERR")
 K FDATA,DIERR
 I '$D(^VA(20,DG20IEN)) S DG20IEN=$$GET1^DIQ(2,+DFN_",",1.01,"I")
 I $D(SAVE("NAME")) D
 .S FDATA(20,+DG20IEN_",",1)=BUFFER("FAMILY")
 .S FDATA(20,+DG20IEN_",",2)=BUFFER("GIVEN")
 .S FDATA(20,+DG20IEN_",",3)=BUFFER("MIDDLE")
 .S FDATA(20,+DG20IEN_",",5)=BUFFER("SUFFIX")
 .D FILE^DIE("","FDATA","DIERR")
 .K FDATA,DIERR
 I $D(BUFFER("PREFIX")) S FDATA(20,+DG20IEN_",",4)=BUFFER("PREFIX")
 I $D(BUFFER("DEGREE")) S FDATA(20,+DG20IEN_",",6)=BUFFER("DEGREE")
 I $D(SAVE("PREFIX")) S FDATA(20,+DG20IEN_",",4)=SAVE("PREFIX")
 I $D(SAVE("DEGREE")) S FDATA(20,+DG20IEN_",",6)=SAVE("DEGREE")
 D FILE^DIE("","FDATA","DIERR")
 K FDATA,DIERR
 Q
 ;
BEFORE(IEN,BEF,BUF) ;save original name, ssn, dob, sex
 N DG20
 S BEF("NAME")=$$GET1^DIQ(2,+IEN_",",.01),BUF("NAME")=BEF("NAME")
 S BEF("SSN")=$$GET1^DIQ(2,+IEN_",",.09),BUF("SSN")=BEF("SSN")
 S BEF("DOB")=$$GET1^DIQ(2,+IEN_",",.03,"I"),BUF("DOB")=BEF("DOB")
 S BEF("SEX")=$$GET1^DIQ(2,+IEN_",",.02,"I"),BUF("SEX")=BEF("SEX")
 S BEF("MBI")=$$GET1^DIQ(2,+IEN_",",994,"I"),BUF("MBI")=BEF("MBI")
 D GETS^DIQ(2,+IEN_",",1.01,"I","DG20")
 S BEF("FAMILY")="",BEF("GIVEN")="",BUF("FAMILY")="",BUF("GIVEN")=""
 S BEF("MIDDLE")="",BEF("SUFFIX")="",BUF("MIDDLE")="",BUF("MIDDLE")=""
 S BEF("PREFIX")="",BEF("DEGREE")="",BUF("PREFIX")="",BUF("DEGREE")=""
 S DG20IEN=DG20(2,+IEN_",",1.01,"I")
 I $$GET1^DIQ(20,+DG20IEN_",",.03)[+IEN D
 . S BEF("FAMILY")=$$GET1^DIQ(20,+DG20IEN_",",1),BUF("FAMILY")=BEF("FAMILY")
 . S BEF("GIVEN")=$$GET1^DIQ(20,+DG20IEN_",",2),BUF("GIVEN")=BEF("GIVEN")
 . S BEF("MIDDLE")=$$GET1^DIQ(20,+DG20IEN_",",3),BUF("MIDDLE")=BEF("MIDDLE")
 . S BEF("SUFFIX")=$$GET1^DIQ(20,+DG20IEN_",",5),BUF("SUFFIX")=BEF("SUFFIX")
 . S BEF("PREFIX")=$$GET1^DIQ(20,+DG20IEN_",",4),BUF("PREFIX")=BEF("PREFIX")
 . S BEF("DEGREE")=$$GET1^DIQ(20,+DG20IEN_",",6),BUF("DEGREE")=BEF("DEGREE")
 ;add some demographic information (before snapshot)
 S BEF("MAIDEN")=$E($$GET1^DIQ(2,+IEN_",",.2403),1,17)
 S BEF("POBCITY")=$E($$GET1^DIQ(2,+IEN_",",.092),1,15)
 S BEF("POBSTATE")=$$GET1^DIQ(2,+IEN_",",.093,"I")
 Q
 ;
AFTER(BEF,BUF,SAV) ;prevent catastrophic edit checks
 N DGCNT,DG20CNT S (DGCNT,DG20CNT)=0
 I $D(BUF("FAMILY")),BUF("FAMILY")'="",BUF("FAMILY")'=BEF("FAMILY") D
 . S DG20CNT=DG20CNT+1
 . S SAV("NAME")=BUF("NAME")
 I $D(BUF("GIVEN")),BUF("GIVEN")'="",BUF("GIVEN")'=BEF("GIVEN") D
 . S DG20CNT=DG20CNT+1
 . S SAV("NAME")=BUF("NAME")
 I $D(BUF("MIDDLE")),BUF("MIDDLE")'="",BUF("MIDDLE")'=BEF("MIDDLE") D
 . S SAV("NAME")=BUF("NAME") ; minor change doesn't count
 I $D(BUF("SUFFIX")),BUF("SUFFIX")'="",BUF("SUFFIX")'=BEF("SUFFIX") D
 . S SAV("NAME")=BUF("NAME") ; minor change doesn't count
 I DG20CNT>0 S DGCNT=1
 I $D(BUF("PREFIX")),BUF("PREFIX")'=BEF("PREFIX") D
 . S SAV("PREFIX")=BUF("PREFIX")
 I $D(BUF("DEGREE")),BUF("DEGREE")'=BEF("DEGREE") D
 . S SAV("DEGREE")=BUF("DEGREE")
 I $D(BUF("DOB")),BUF("DOB")'="",BUF("DOB")'=BEF("DOB") D
 . S SAV("DOB")=BUF("DOB"),DGCNT=DGCNT+1
 I $D(BUF("SEX")),BUF("SEX")'="",BUF("SEX")'=BEF("SEX") D
 . S SAV("SEX")=BUF("SEX"),DGCNT=DGCNT+1
 I $D(BUF("SSN")),BUF("SSN")'="",BUF("SSN")'=BEF("SSN") D
 . S SAV("SSN")=BUF("SSN"),DGCNT=DGCNT+1
 I $D(BUF("MBI")),BUF("MBI")'="",BUF("MBI")'=BEF("MBI") D
 . S SAV("MBI")=BUF("MBI"),DGCNT=DGCNT+1
 I DGCNT=0,$D(SAV("NAME")) Q 1 ;minor name change (i.e. middle name or suffix)
 I DGCNT=0,$D(SAV("PREFIX"))!($D(SAV("DEGREE"))) Q 1 ; prefix or degree change
 I DGCNT=0 Q 0 ;no changes
 I DGCNT<2 Q 1 ;make one change w/o alert
 I DGCNT>1 Q 2 ;more than 1 change, send warning message
 ;
WARNING() ;CE warning message
 ;Output     0  = exit without saving changes
 ;           1  = send alert and save
 W !!,?25,"**WARNING!!**"
 W !!,"The edits you are about to make, may potentially change the identity of"
 W !,"this patient.  Please verify that you have selected the correct patient"
 W !,"and ensure that supporting documentation exists for these changes.  If"
 W !,"you continue with these edits, an alert will be generated and sent to"
 W !,"your Supervisor and ADPAC, notifying them of the changes."
 N DIR,DGANS,Y
 S DIR(0)="Y",DIR("A")="Do you wish to continue and save your edits:"
 S DIR("B")="NO" D ^DIR K DIR S DGANS=Y
 S DGANS=$S(Y=1:1,1:0) ;0=don't save, 1=save with CE alert
 Q DGANS
 ;
ALERT ;Queue alert
 X ^%ZOSF("UCI") S ZTUCI=Y,ZTRTN="ALERT^DGRPECE1",ZTDTH=$H,ZTIO="",IEN=DFN
 F V="IEN","BEFORE(","BUFFER(","SAVE(","XQY" S ZTSAVE(V)=""
 S ZTDESC="Patient Catastrophic Edits alert" K V,ZTSK N X D ^%ZTLOAD  Q
 ;D ALERT^DGRPECE1(DFN,.BEFORE,.BUFFER,.SAVE)
 Q
