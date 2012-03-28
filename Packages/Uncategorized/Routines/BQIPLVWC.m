BQIPLVWC ;PRXM/HC/ALA-Customized Panel View ; 14 Oct 2005  4:09 PM
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 ;
 Q
 ;
LST(DATA,OWNR,PLIEN) ; EP -- BQI GET PANEL PREFS
 ;Description
 ;  This returns a customized display order list for a panel
 ;Input
 ;  OWNR  - Owner of panel internal entry number
 ;  PLIEN - Panel internal entry number
 ;Output
 ;  DATA  - name of global (passed by reference) in which the data
 ;          is stored
 ;Expected
 ;  DUZ   - User internal entry number
 ;Variables used
 ;  UID - TMP global subscript. Will be either $J or "Z" plus the
 ;        TaskMan Task ID
 ;
 NEW UID,II,IEN,DOR,SOR,DVALUE,SVALUE,X,SRC
 S UID=$S($G(ZTSK):"Z"_ZTSK,1:$J)
 S DATA=$NA(^TMP("BQIPLVWC",UID))
 K @DATA
 S II=0
 S @DATA@(II)="I00010TEMPL_IEN^T00040TEMPLATE_NAME^T00001DEFAULT^T00001TYPE^T00120DISPLAY_ORDER^T00120SORT_ORDER^T00120SORT_DIRECTION"_$C(30)
 ;
 NEW $ESTACK,$ETRAP S $ETRAP="D ERR^BQIPLVWC D UNWIND^%ZTER" ; SAC 2006 2.2.3.3.2
 ;
 S OWNR=$G(OWNR,""),PLIEN=$G(PLIEN,"")
 ; If there is a template
 I $$TMPL() G DONE
 ;
 ; If there is a customized view
 I $$CVW() G DONE
 ;
 S TIEN="",TEMPL="",DEF="",TYP="D"
 S DISPLAY=$$DFNC^BQIPLVW()
 S SORT=$$SFNC^BQIPLVW()
 S SDIR="A",TEMPL="System Default"
 S II=II+1,@DATA@(II)=TIEN_U_TEMPL_U_DEF_U_TYP_U_DISPLAY_U_SORT_U_SDIR_$C(30)
 ;
DONE  ;
 S II=II+1,@DATA@(II)=$C(31)
 Q
 ;
ERR ;
 D ^%ZTER
 NEW Y,ERRDTM
 S Y=$$NOW^XLFDT() X ^DD("DD") S ERRDTM=Y
 S BMXSEC="Recording that an error occurred at "_ERRDTM
 I $D(II),$D(DATA) S II=II+1,@DATA@(II)=$C(31)
 Q
 ;
DFNC() ;EP - Custom Display Order function for Owner
 S DVALUE=""
 S DOR="" F  S DOR=$O(^BQICARE(OWNR,1,PLIEN,20,"C",DOR)) Q:DOR=""  D
 . S IEN=""
 . F  S IEN=$O(^BQICARE(OWNR,1,PLIEN,20,"C",DOR,IEN)) Q:IEN=""  D
 .. NEW DA,IENS,STVW,STVCD
 .. S DA(2)=OWNR,DA(1)=PLIEN,DA=IEN,IENS=$$IENS^DILF(.DA)
 .. S STVW=$$GET1^DIQ(90505.05,IENS,.01,"I")
 .. I $$GET1^DIQ(90506.1,STVW_",",.1,"I")=1 Q
 .. I $$GET1^DIQ(90506.1,STVW_",",3.01,"I")'=SRC Q
 .. S STVCD=$$GET1^DIQ(90506.1,STVW_",",.01,"E")
 .. S DVALUE=DVALUE_STVCD_$C(29)
 S DVALUE=$$TKO^BQIUL1(DVALUE,$C(29))
 Q DVALUE
 ;
SFNC() ;EP - Custom Sort Order function for Owner
 S SVALUE=""
 S SOR="" F  S SOR=$O(^BQICARE(OWNR,1,PLIEN,20,"D",SOR)) Q:SOR=""  D
 . S IEN="" F  S IEN=$O(^BQICARE(OWNR,1,PLIEN,20,"D",SOR,IEN)) Q:IEN=""  D
 .. NEW DA,IENS,STVW,STVCD
 .. S DA(2)=OWNR,DA(1)=PLIEN,DA=IEN,IENS=$$IENS^DILF(.DA)
 .. S STVW=$$GET1^DIQ(90505.05,IENS,.01,"I")
 .. I $$GET1^DIQ(90506.1,STVW_",",.1,"I")=1 Q
 .. I $$GET1^DIQ(90506.1,STVW_",",3.01,"I")'=SRC Q
 .. S STVCD=$$GET1^DIQ(90506.1,STVW_",",.01,"E")
 .. S SVALUE=SVALUE_STVCD_$C(29)
 S SVALUE=$$TKO^BQIUL1(SVALUE,$C(29))
 Q SVALUE
 ;
SDIR() ;EP - Custom Sort Direction function for Owner
 S SVALUE=""
 S SOR="" F  S SOR=$O(^BQICARE(OWNR,1,PLIEN,20,"D",SOR)) Q:SOR=""  D
 . S IEN="" F  S IEN=$O(^BQICARE(OWNR,1,PLIEN,20,"D",SOR,IEN)) Q:IEN=""  D
 .. NEW DA,IENS,STVW,STVCD
 .. S DA(2)=OWNR,DA(1)=PLIEN,DA=IEN,IENS=$$IENS^DILF(.DA)
 .. S STVCD=$$GET1^DIQ(90505.05,IENS,.04,"I")
 .. S STVW=$$GET1^DIQ(90505.05,IENS,.01,"I")
 .. I $$GET1^DIQ(90506.1,STVW_",",.1,"I")=1 Q
 .. I $$GET1^DIQ(90506.1,STVW_",",3.01,"I")'=SRC Q
 .. I STVCD="" S STVCD="A"
 .. S SVALUE=SVALUE_STVCD_$C(29)
 S SVALUE=$$TKO^BQIUL1(SVALUE,$C(29))
 Q SVALUE
 ;
SDFNC()  ;EP - Custom Display Order function for Sharer
 S DVALUE=""
 S DOR="" F  S DOR=$O(^BQICARE(OWNR,1,PLIEN,30,DUZ,20,"C",DOR)) Q:DOR=""  D
 . S IEN="" F  S IEN=$O(^BQICARE(OWNR,1,PLIEN,30,DUZ,20,"C",DOR,IEN)) Q:IEN=""  D
 .. NEW DA,IENS,STVW,STVCD
 .. S DA(3)=OWNR,DA(2)=PLIEN,DA(1)=DUZ,DA=IEN,IENS=$$IENS^DILF(.DA)
 .. S STVW=$$GET1^DIQ(90505.06,IENS,.01,"I")
 .. I $$GET1^DIQ(90506.1,STVW_",",.1,"I")=1 Q
 .. I $$GET1^DIQ(90506.1,STVW_",",3.01,"I")'=SRC Q
 .. S STVCD=$$GET1^DIQ(90506.1,STVW_",",.01,"E")
 .. S DVALUE=DVALUE_STVCD_$C(29)
 S DVALUE=$$TKO^BQIUL1(DVALUE,$C(29))
 Q DVALUE
 ;
SSFNC()  ;EP - Custom Sort Order function for Sharer
 S SVALUE=""
 S SOR="" F  S SOR=$O(^BQICARE(OWNR,1,PLIEN,30,DUZ,20,"D",SOR)) Q:SOR=""  D
 . S IEN="" F  S IEN=$O(^BQICARE(OWNR,1,PLIEN,30,DUZ,20,"D",SOR,IEN)) Q:IEN=""  D
 .. NEW DA,IENS,STVW,STVCD
 .. S DA(3)=OWNR,DA(2)=PLIEN,DA(1)=DUZ,DA=IEN,IENS=$$IENS^DILF(.DA)
 .. S STVW=$$GET1^DIQ(90505.06,IENS,.01,"I")
 .. I $$GET1^DIQ(90506.1,STVW_",",.1,"I")=1 Q
 .. I $$GET1^DIQ(90506.1,STVW_",",3.01,"I")'=SRC Q
 .. S STVCD=$$GET1^DIQ(90506.1,STVW_",",.01,"E")
 .. S SVALUE=SVALUE_STVCD_$C(29)
 S SVALUE=$$TKO^BQIUL1(SVALUE,$C(29))
 Q SVALUE
 ;
SSDIR() ;EP - Custom Sort Direction function for Sharer
 S SVALUE=""
 S SOR="" F  S SOR=$O(^BQICARE(OWNR,1,PLIEN,30,DUZ,20,"D",SOR)) Q:SOR=""  D
 . S IEN="" F  S IEN=$O(^BQICARE(OWNR,1,PLIEN,30,DUZ,20,"D",SOR,IEN)) Q:IEN=""  D
 .. NEW DA,IENS,STVW,STVCD
 .. S DA(3)=OWNR,DA(2)=PLIEN,DA(1)=DUZ,DA=IEN,IENS=$$IENS^DILF(.DA)
 .. S STVCD=$$GET1^DIQ(90505.06,IENS,.04,"I")
 .. S STVW=$$GET1^DIQ(90505.06,IENS,.01,"I")
 .. I $$GET1^DIQ(90506.1,STVW_",",.1,"I")=1 Q
 .. I $$GET1^DIQ(90506.1,STVW_",",3.01,"I")'=SRC Q
 .. I STVCD="" S STVCD="A"
 .. S SVALUE=SVALUE_STVCD_$C(29)
 S SVALUE=$$TKO^BQIUL1(SVALUE,$C(29))
 Q SVALUE
 ;
UPD(DATA,OWNR,PLIEN,TEMPL,SOR,SDIR,DOR) ; EP -- BQI SET PANEL PREFS
 ;
 ;Description
 ;   Update the display and sort order for a specified owner and panel
 ;Input
 ;
 NEW UID,II,IEN,ERROR,BQIDEL,DI,SI,SRDR,X,LIST,BN
 S UID=$S($G(ZTSK):"Z"_ZTSK,1:$J)
 S DATA=$NA(^TMP("BQIPLVWC",UID))
 K @DATA
 S II=0
 S @DATA@(II)="I00010RESULT"_$C(30)
 ;
 NEW $ESTACK,$ETRAP S $ETRAP="D ERR^BQIPLVWC D UNWIND^%ZTER" ; SAC 2006 2.2.3.3.2
 ;
 S TEMPL=$G(TEMPL,""),SOR=$G(SOR,""),SDIR=$G(SDIR,""),DOR=$G(DOR,"")
 I DOR="" D
 . S LIST="",BN=""
 . F  S BN=$O(DOR(BN)) Q:BN=""  S LIST=LIST_DOR(BN)
 . K DOR
 . S DOR=LIST
 . K LIST
 ;
 D FIL(OWNR,PLIEN,TEMPL,SOR,SDIR,DOR)
 ;
 I $D(ERROR) S II=II+1,@DATA@(II)="-1"_$C(30)
 I '$D(ERROR) S II=II+1,@DATA@(II)="1"_$C(30)
 S II=II+1,@DATA@(II)=$C(31)
 Q
 ;
FIL(OWNR,PLIEN,TEMPL,SOR,SDIR,DOR) ; EP - File
 ; If the Owner and the User are the same person.
 I OWNR=DUZ D  Q
 . NEW DA,IENS,Y,STVW,STVCD,BQIDEL
 . S DA(2)=OWNR,DA(1)=PLIEN,DA=0
 . F  S DA=$O(^BQICARE(OWNR,1,PLIEN,20,DA)) Q:'DA  D
 .. S IENS=$$IENS^DILF(.DA)
 .. S BQIDEL(90505.05,IENS,.01)="@"
 . I $D(BQIDEL) D FILE^DIE("","BQIDEL","ERROR")
 . S DA=0
 . F  S DA=$O(^BQICARE(OWNR,1,PLIEN,4,DA)) Q:'DA  D
 .. S IENS=$$IENS^DILF(.DA)
 .. I $$GET1^DIQ(90505.14,IENS,.02,"I")'="D" Q
 .. S BQIDEL(90505.14,IENS,.01)="@"
 . I $D(BQIDEL) D FILE^DIE("","BQIDEL","ERROR")
 . ;
 . ; If template
 . I $G(TEMPL)'=""  D  Q
 .. NEW DA,DIC,DLAYGO,IENS,DIE
 .. S DA(2)=OWNR,DA(1)=PLIEN
 .. S DIC="^BQICARE("_DA(2)_",1,"_DA(1)_",4,",DIE=DIC
 .. S DLAYGO=90505.14,DIC(0)="L",DIC("P")=DLAYGO
 .. I '$D(^BQICARE(DA(2),1,DA(1),4,0)) S ^BQICARE(DA(2),1,DA(1),4,0)="^90505.14^^"
 .. S X=TEMPL
 .. D ^DIC
 .. S DA=+Y
 .. S IENS=$$IENS^DILF(.DA)
 .. S BQIUPD(90505.14,IENS,.02)="D"
 .. I $D(BQIUPD) D FILE^DIE("","BQIUPD","ERROR")
 .. K BQIUPD
 . ; If customized
 . F DI=1:1:$L(DOR,$C(29)) S STVCD=$P(DOR,$C(29),DI) Q:STVCD=""  D
 .. S STVW=$O(^BQI(90506.1,"B",STVCD,""))
 .. NEW DA,X,DINUM,DIC,DIE,DLAYGO,IENS
 .. S DA(2)=OWNR,DA(1)=PLIEN
 .. S DIC="^BQICARE("_DA(2)_",1,"_DA(1)_",20,",DIE=DIC
 .. S DLAYGO=90505.05,DIC(0)="L",DIC("P")=DLAYGO
 .. S X=STVW
 .. I '$D(^BQICARE(DA(2),1,DA(1),20,0)) S ^BQICARE(DA(2),1,DA(1),20,0)="^90505.05P^^"
 .. K DO,DD D FILE^DICN
 .. S DA=+Y
 .. S IENS=$$IENS^DILF(.DA)
 .. S BQIUPD(90505.05,IENS,.02)=DI
 . I $D(BQIUPD) D FILE^DIE("","BQIUPD","ERROR")
 . K BQIUPD
 . ;
 . F SI=1:1:$L(SOR,$C(29)) S STVCD=$P(SOR,$C(29),SI) Q:STVCD=""  D
 .. S SRDR=$P(SDIR,$C(29),SI) S:SRDR="" SRDR="A"
 .. S STVW=$O(^BQI(90506.1,"B",STVCD,""))
 .. NEW DA,IENS
 .. S DA(2)=OWNR,DA(1)=PLIEN,DA=$O(^BQICARE(OWNR,1,PLIEN,20,"B",STVW,""))
 .. S IENS=$$IENS^DILF(.DA)
 .. S BQIUPD(90505.05,IENS,.03)=SI
 .. S BQIUPD(90505.05,IENS,.04)=SRDR
 . I $D(BQIUPD) D FILE^DIE("","BQIUPD","ERROR")
 . K BQIUPD
 ;
 NEW DA,IENS
 S DA(3)=OWNR,DA(2)=PLIEN,DA(1)=DUZ,DA=0
 F  S DA=$O(^BQICARE(OWNR,1,PLIEN,30,DUZ,20,DA)) Q:'DA  D
 . S IENS=$$IENS^DILF(.DA)
 . S BQIDEL(90505.06,IENS,.01)="@"
 I $D(BQIDEL) D FILE^DIE("","BQIDEL","ERROR")
 S DA=0
 F  S DA=$O(^BQICARE(OWNR,1,PLIEN,30,DUZ,4,DA)) Q:'DA  D
 . S IENS=$$IENS^DILF(.DA)
 . I $$GET1^DIQ(90505.34,IENS,.02,"I")'="D" Q
 . S BQIDEL(90505.34,IENS,.01)="@"
 I $D(BQIDEL) D FILE^DIE("","BQIDEL","ERROR")
 ; If template
 I $G(TEMPL)'=""  D  Q
 . NEW DA,DIC,DLAYGO,IENS,DIE
 . S DA(3)=OWNR,DA(2)=PLIEN,DA(1)=DUZ
 . S DIC="^BQICARE("_DA(3)_",1,"_DA(2)_",30,"_DUZ_",4,",DIE=DIC
 . S DLAYGO=90505.34,DIC(0)="L",DIC("P")=DLAYGO
 . I '$D(^BQICARE(DA(3),1,DA(2),30,DA(1),20,0)) S ^BQICARE(DA(3),1,DA(2),30,DA(1),4,0)="^90505.34^^"
 . S X=TEMPL
 . D ^DIC
 . S DA=+Y
 . S IENS=$$IENS^DILF(.DA)
 . S BQIUPD(90505.34,IENS,.02)="D"
 . I $D(BQIUPD) D FILE^DIE("","BQIUPD","ERROR")
 . K BQIUPD
 ; If customized
 F DI=1:1:$L(DOR,$C(29)) S STVCD=$P(DOR,$C(29),DI) Q:STVCD=""  D
 . S STVW=$O(^BQI(90506.1,"B",STVCD,""))
 . NEW DA,X,DINUM,DIC,DIE,DLAYGO,IENS
 . S DA(3)=OWNR,DA(2)=PLIEN,DA(1)=DUZ
 . S DIC="^BQICARE("_DA(3)_",1,"_DA(2)_",30,"_DUZ_",20,",DIE=DIC
 . S DLAYGO=90505.06,DIC(0)="L",DIC("P")=DLAYGO
 . S X=STVW
 . I '$D(^BQICARE(DA(3),1,DA(2),30,DA(1),20,0)) S ^BQICARE(DA(3),1,DA(2),30,DA(1),20,0)="^90505.06P^^"
 . K DO,DD D FILE^DICN
 . S DA=+Y
 . S IENS=$$IENS^DILF(.DA)
 . S BQIUPD(90505.06,IENS,.02)=DI
 I $D(BQIUPD) D FILE^DIE("","BQIUPD","ERROR")
 K BQIUPD
 ;
 F SI=1:1:$L(SOR,$C(29)) S STVCD=$P(SOR,$C(29),SI) Q:STVCD=""  D
 . S SRDR=$P(SDIR,$C(29),SI) S:SRDR="" SRDR="A"
 . S STVW=$O(^BQI(90506.1,"B",STVCD,""))
 . NEW DA,IENS
 . S DA(3)=OWNR,DA(2)=PLIEN,DA(1)=DUZ,DA=$O(^BQICARE(OWNR,1,PLIEN,30,DUZ,20,"B",STVW,""))
 . S IENS=$$IENS^DILF(.DA)
 . S BQIUPD(90505.06,IENS,.03)=SI
 . S BQIUPD(90505.06,IENS,.04)=SRDR
 I $D(BQIUPD) D FILE^DIE("","BQIUPD","ERROR")
 K BQIUPD
 Q
 ;
TMPL() ;EP - Check if layout template is used
 NEW RESULT,CTYP
 S RESULT=0,CTYP="D"
 NEW DA,IENS,TEMPL,LYIEN
 S TEMPL=""
 I OWNR'=DUZ D
 . I $G(PLIEN)="" Q
 . S DA=$O(^BQICARE(OWNR,1,PLIEN,30,DUZ,4,"C",CTYP,""))
 . I DA="" Q
 . S DA(3)=OWNR,DA(2)=PLIEN,DA(1)=DUZ,IENS=$$IENS^DILF(.DA)
 . S TEMPL=$$GET1^DIQ(90505.34,IENS,.01,"E")
 I OWNR=DUZ D
 . I $G(PLIEN)="" Q
 . S DA=$O(^BQICARE(OWNR,1,PLIEN,4,"C",CTYP,""))
 . I DA="" Q
 . S DA(2)=OWNR,DA(1)=PLIEN,IENS=$$IENS^DILF(.DA)
 . S TEMPL=$$GET1^DIQ(90505.14,IENS,.01,"E")
 I TEMPL'="" D
 . ;S LYIEN=$$DEF^BQILYUTL(OWNR,"M")
 . S LYIEN=$$TPN^BQILYUTL(DUZ,TEMPL)
 . I LYIEN="" Q
 . D DEF^BQILYDEF(LYIEN)
 . S RESULT=1
 . ;S DISPLAY=$P(@DATA@(II),U,3),SOR=$P(@DATA@(II),U,4),SDIR=$P(@DATA@(II),U,5)
 Q RESULT
 ;
CVW() ;EP - Get Customized view
 NEW TIEN,TEMPL,DEF,TYP,DISPLAY,SORT,SDIR,IEN,GIEN,SIEN,RIEN,CODE,SOR
 S DISPLAY="",SORT="",SDIR="",TIEN="",TEMPL="",RESULT=0,DEF=""
 S TYP="D"
 ;
 ; Owner and user are the same
 I OWNR=DUZ D
 . S IEN=0,DISPLAY="",SORT="",SDIR=""
 . I $G(PLIEN)="" Q
 . F  S IEN=$O(^BQICARE(OWNR,1,PLIEN,20,IEN)) Q:'IEN  D
 .. S GIEN=$P(^BQICARE(OWNR,1,PLIEN,20,IEN,0),"^",1)
 .. S SIEN=$P(^BQICARE(OWNR,1,PLIEN,20,IEN,0),"^",3)
 .. S RIEN=$P(^BQICARE(OWNR,1,PLIEN,20,IEN,0),"^",4)
 .. S CODE=$P(^BQI(90506.1,GIEN,0),U,1)
 .. S DISPLAY=DISPLAY_CODE_$C(29)
 .. I SIEN'="" D
 ... ;I SIEN?.N S CODE=$P(^BQI(90506.1,SIEN,0),U,1)
 ... ;E  S CODE=SIEN
 ... ;S SORT=SORT_CODE_$C(29)
 ... S $P(SORT,$C(29),SIEN)=CODE
 ... S $P(SDIR,$C(29),SIEN)=RIEN
 .. ;S SDIR=SDIR_RIEN_$C(29)
 ;
 ; User is not owner but share
 I OWNR'=DUZ D
 . S IEN=0,DISPLAY="",SORT="",SDIR=""
 . I $G(PLIEN)="" Q
 . F  S IEN=$O(^BQICARE(OWNR,1,PLIEN,30,DUZ,20,IEN)) Q:'IEN  D
 .. S GIEN=$P(^BQICARE(OWNR,1,PLIEN,30,DUZ,20,IEN,0),"^",1)
 .. S SIEN=$P(^BQICARE(OWNR,1,PLIEN,30,DUZ,20,IEN,0),"^",3)
 .. S RIEN=$P(^BQICARE(OWNR,1,PLIEN,30,DUZ,20,IEN,0),"^",4)
 .. S CODE=$P(^BQI(90506.1,GIEN,0),U,1)
 .. S DISPLAY=DISPLAY_CODE_$C(29)
 .. I SIEN'="" D
 ... ;I SIEN?.N S CODE=$P(^BQI(90506.1,SIEN,0),U,1)
 ... ;E  S CODE=SIEN
 ... ;S SORT=SORT_CODE_$C(29)
 ... S $P(SORT,$C(29),SIEN)=CODE
 ... S $P(SDIR,$C(29),SIEN)=RIEN
 .. ;S SDIR=SDIR_RIEN_$C(29)
 ;
 S DISPLAY=$$TKO^BQIUL1(DISPLAY,$C(29))
 S SORT=$$TKO^BQIUL1(SORT,$C(29))
 S SDIR=$$TKO^BQIUL1(SDIR,$C(29))
 I DISPLAY'="" D
 . S RESULT=1
 . S II=II+1,@DATA@(II)=TIEN_U_TEMPL_U_DEF_U_TYP_U_DISPLAY_U_SORT_U_SDIR_$C(30)
 Q RESULT
