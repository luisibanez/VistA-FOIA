BKMVD5 ;PRXM/HC/JGH - V-File Procedure Add/Edit/Delete; 24-JAN-2005 ; 12 Apr 2005  6:31 PM
 ;;2.1;HIV MANAGEMENT SYSTEM;;Feb 07, 2011
 ;
 Q
 ;
EN ;ENTRY POINT -- ListMan template BKMV PCC PRC UPDATE
 ; Called by Add New Data option for Procedure
 ; Assumes existence of DFN,DUZ
 N HIVIEN
 S HIVIEN=$$HIVIEN^BKMIXX3()
 I HIVIEN="" W !,"There is no HMS register defined." H 2 Q
 I '$$VALID^BKMIXX3(DUZ) Q
 I '$$BKMPRIV^BKMIXX3(DUZ) D NOGO^BKMIXX3 Q
 K ^TMP("BKMVD5",$J)
 D ^XBFMK
 D EN^VALM("BKMV PCC PRC UPDATE")
 D ^XBFMK
 D EXIT
 Q
 ;
HDR ; -- header code
 ; Assumes existence of DUZ
 N DA,IENS,SITE
 S DA=$G(DUZ(2)),IENS=$$IENS^DILF(.DA),SITE=$$GET1^DIQ(4,IENS,.01,"E")
 S VALMHDR(1)=$$PAD^BKMIXX4("",">"," ",(80-$L(SITE)+2)\2)_"["_$G(SITE)_"]"
 S VALMHDR(2)=$G(RCRDHDR)
 Q
 ;
INIT ; -- init variables and list array
 ; Assumes existence of DFN
 D GETALL(DFN)
 Q
 ;
HELP ; -- help code
 S X="?" D DISP^XQORM1 W !
 Q
 ;
EXIT ; -- exit code
 K ^TMP("BKMVD5",$J)
 K VALM0,VALMAR,VALMCNT,VALMHDR
 Q
 ;
EXPND ; -- expand code
 Q
 ;
GETALL(DFN) ; Build ListMan display array
 ; Input variables:
 ;  DFN - IEN for File 2
 ; Output variables:
 ;  VALMAR - Builds ListMan array
 ;  VALMCNT - List array count
 ;  VALM0
 N DA0,DA1,TEXT,PRCDT,IENS,PPRCDT
 D ^XBFMK
 S VALMCNT=0,VALMAR="^TMP(""BKMVD5"","""_$J_""")",VALM0=""
 S DA1=$O(^BKM(90459,"B",$J,""))
 Q:DA1=""
 S (PRCDT,PPRCDT)=""
 F  S PRCDT=$O(^BKM(90459,DA1,20,"B",PRCDT),-1) Q:PRCDT=""  D
 . S DA0=""
 . F  S DA0=$O(^BKM(90459,DA1,20,"B",PRCDT,DA0)) Q:DA0=""  D
 . . S DA(1)=DA1,DA=DA0
 . . S IENS=$$IENS^DILF(.DA)
 . . S VALMCNT=$G(VALMCNT)+1
 . . S TEXT=""
 . . S TEXT=$$SETFLD^VALM1($$PAD^BKMIXX4(VALMCNT,"<"," ",3)_".",TEXT,"Item")
 . . ;S TEXT=$$SETFLD^VALM1($$FMTE^XLFDT($$GET1^DIQ(90459.22222,IENS,".01","I"),"5Z"),TEXT,"Visit")
 . . ; Display only date when it does not equal the previous date
 . . S TEXT=$$SETFLD^VALM1($S((PRCDT\1)'=(PPRCDT\1):$$FMTE^XLFDT(PRCDT\1,"5Z"),1:""),TEXT,"Visit")
 . . S TEXT=$$SETFLD^VALM1($$GET1^DIQ(90459.22222,IENS,".02","E"),TEXT,"Procedure")
 . . S TEXT=$$SETFLD^VALM1($$GET1^DIQ(90459.22222,IENS,".04","E"),TEXT,"Provider Narrative")
 . . D SET^VALM10(VALMCNT,TEXT,DA0)
 . . S PPRCDT=PRCDT
 D ^XBFMK
 Q
 ;
ADD ; Add entry to File 90459
 D FULL^VALM1
 N DA,DA1,DA0,DIC,Y,DIE,DR,BKMDTM,IENS,BKMPRC,DIK,BKMDOD
 S (DA(1),DA1)=$O(^BKM(90459,"B",$J,""))
 Q:DA(1)=""
 ; Default to today's date for prompt, except for deceased patients
 ;S X=$$NOW^XLFDT()
 S X=$$DT^XLFDT()
 S BKMDOD=$$GET1^DIQ(2,DFN,".351","I")
 I BKMDOD'="" S X=$$FMADD^XLFDT(BKMDOD,-1)
 S DIC="^BKM(90459,"_DA(1)_",20,"
 S DIC(0)="L"
 ; Add new entry
 K DO
 D FILE^DICN
 I Y=-1 G ADDX
 S DA0=+Y
ADD1 ; Edit Exam fields in subfile
 S DIE="^BKM(90459,"_DA1_",20,"
 ; Internal entry number of subentry chosen
 S DA=DA0,DA(1)=DA1
 S DR=".02;S BKMX=$G(X);.01;.04"
 D ^DIE
 K DA
 S DA=DA0,DA(1)=DA1,IENS=$$IENS^DILF(.DA)
 S BKMDTM=$$GET1^DIQ(90459.22222,IENS,".01","I")
 S BKMPRC=$$GET1^DIQ(90459.22222,IENS,".02","I")
 I BKMDTM=""!(BKMPRC="") D  G ADDX
 . K DA
 . S DA=DA0,DA(1)=DA1
 . S DIK="^BKM(90459,"_DA(1)_",20,"
 . D ^DIK
 . W " *** Required field(s) missing, entry deleted! ***" H 1
 I $P(BKMDTM,".")#100=0!(BKMDTM=(BKMDTM\1)) D
 . ; Default to first day of month, if date is imprecise
 . I $P(BKMDTM,".")#100=0 D
 . . S BKMDTM=$S($L(BKMDTM,".")=2:($P(BKMDTM,".")+1)_"."_$P(BKMDTM,".",2),1:$P(BKMDTM,".")+1)
 . ; Default time to noon, if not included, unless it is in the future
 . I BKMDTM=(BKMDTM\1) D
 . . S BKMDTM=BKMDTM_".1200"
 . . I BKMDTM>$$NOW^XLFDT() S BKMDTM=$$NOW^XLFDT()
 . S DR=".01///"_BKMDTM
 . D ^DIE
 ;
ADDX ; Add entry exit point
 K ^TMP("BKMVD5",$J)
 D INIT
 Q
 ;
EDIT ; Edit File 90459
 I +$G(VALMCNT)=0 D EN^DDIOL("No items to select") H 2 Q
 D FULL^VALM1
 N BKMLST,BKMI,VALMI,VALMAT,DA,DIE,DR,BKMDTM
 S BKMLST=$$SELECT^BKMVD2()
 I BKMLST'="" D
 . F BKMI=1:1:$L(BKMLST,",") S VALMI=$P(BKMLST,",",BKMI) Q:'VALMI  D
 . . S VALMAT=$O(@VALMAR@("IDX",VALMI,""))
 . . Q:VALMAT=""
 . . S DA(1)=$O(^BKM(90459,"B",$J,""))
 . . Q:DA(1)=""
 . . S DA=VALMAT
 . . S DIE="^BKM(90459,"_DA(1)_",20,"
 . . S DR=".02;.01;.04"
 . . D ^DIE
 . . ; If user deleted .01 field, DA is killed so quit this iteration
 . . I '$D(DA) Q
 . . S BKMDTM=$$GET1^DIQ(90459.22222,DA_","_DA(1)_",",.01,"I")
 . . I $P(BKMDTM,".")#100=0!(BKMDTM=(BKMDTM\1)) D
 . . . ; Default to first day of month, if date is imprecise
 . . . I $P(BKMDTM,".")#100=0 D
 . . . . S BKMDTM=$S($L(BKMDTM,".")=2:($P(BKMDTM,".")+1)_"."_$P(BKMDTM,".",2),1:$P(BKMDTM,".")+1)
 . . . ; Default time to noon, if not included, unless it is in the future
 . . . I BKMDTM=(BKMDTM\1) D
 . . . . S BKMDTM=BKMDTM_".1200"
 . . . . I BKMDTM>$$NOW^XLFDT() S BKMDTM=$$NOW^XLFDT()
 . . . S DR=".01///"_BKMDTM
 . . . D ^DIE
 . . W " Edited!" H 2
 K ^TMP("BKMVD5",$J)
 D INIT
 Q
 ;
DELETE ; Delete entry in File 90459
 I +$G(VALMCNT)=0 D EN^DDIOL("No items to select") H 2 Q
 D FULL^VALM1
 N BKMLST,BKMI,VALMI,VALMAT,DA,DIK
 S BKMLST=$$SELECT^BKMVD2()
 I BKMLST'="" D
 . F BKMI=1:1:$L(BKMLST,",") S VALMI=$P(BKMLST,",",BKMI) Q:'VALMI  D
 . . S VALMAT=$O(@VALMAR@("IDX",VALMI,""))
 . . Q:VALMAT=""
 . . ; Confirm deletion
 . . I '$$YNP^BKMVD2("Confirm deletion of Item "_VALMI,"NO") Q
 . . S DA(1)=$O(^BKM(90459,"B",$J,""))
 . . Q:DA(1)=""
 . . S DA=VALMAT
 . . S DIK="^BKM(90459,"_DA(1)_",20,"
 . . D ^DIK
 . . W " Deleted!" H 2
 K ^TMP("BKMVD5",$J)
 D INIT
 Q
 ;
 ;