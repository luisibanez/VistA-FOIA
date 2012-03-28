BQITDPNL ;PRXM/HC/ALA-Get Patient Tags by Panel ; 20 Nov 2007  2:20 PM
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 ;
EN(DATA,OWNR,PLIEN,PLIST) ;EP - BQI GET DX CAT BY PANEL
 ;Input
 ;  OWNR  - Owner of panel internal entry number
 ;  PLIEN - Panel internal entry number
 ;  PLIST - List of patient DFNs (optional)
 ;Output
 ;  DATA  - name of global (passed by reference) in which the data
 ;          is stored
 NEW UID,II
 S UID=$S($G(ZTSK):"Z"_ZTSK,1:$J)
 S DATA=$NA(^TMP("BQITDPNL",UID))
 K @DATA
 ;
 S II=0
 NEW $ESTACK,$ETRAP S $ETRAP="D ERR^BQITDPNL D UNWIND^%ZTER" ; SAC 2006 2.2.3.3.2
 ;
 ;S @DATA@(II)="I00010DFN^T00030PATIENT_NAME^T00030HRN^D00030DOB^T00010AGE^T00001SEX^D00030DOD^"
 S @DATA@(II)="I00010DFN^T00030PATIENT_NAME^T00030HRN^D00030DOB^T00010AGE^T00001SENS_FLAG^"
 S @DATA@(II)=@DATA@(II)_"T00035TAG_NAME^I00010TAG_IEN^T00015STATUS^D00030DATE_LASTUPDATE^T00035UPDATED_BY^T00050COMMENT^T01024OTHER_COMMENT"_$C(30)
 ;
 NEW BQIDFN,DEMOG,BQI,BN,LIST
 ; If a list of DFNs, process them instead of entire panel
 I $D(PLIST)>0 D  G DONE
 . I $D(PLIST)>1 D
 .. S LIST="",BN=""
 .. F  S BN=$O(PLIST(BN)) Q:BN=""  S LIST=LIST_PLIST(BN)
 .. K PLIST S PLIST=LIST
 . F BQI=1:1 S BQIDFN=$P(PLIST,$C(28),BQI) Q:BQIDFN=""  D
 .. I $P(^BQICARE(OWNR,1,PLIEN,40,BQIDFN,0),"^",2)="R" Q
 .. D PPAT(BQIDFN,2)
 ;
 S BQIDFN=0
 F  S BQIDFN=$O(^BQICARE(OWNR,1,PLIEN,40,BQIDFN)) Q:'BQIDFN  D
 . I $P(^BQICARE(OWNR,1,PLIEN,40,BQIDFN,0),U,2)="R" Q
 . D PPAT(BQIDFN,2) ; Retrieve all tags regardless of status
 . ;D PPAT(BQIDFN)
 ;
DONE ; Finish the RPC call
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
PPAT(BQIDFN,INC) ; Get data by patient
 NEW DEMOG,TIEN,QFL,TAGIEN,TAGNM,STAT,TAGDTU,WHO,SCOM,OCOM,OCN,BQIDOD
 S DEMOG=$P($$GETDATA^BQITDLST(BQIDFN),U,1,5)_U_$$SENS^BQIULPT(BQIDFN)
 S BQIDOD=$$GET1^DIQ(2,BQIDFN_",",.351,"I")
 S INC=$G(INC,0)
 I $O(^BQIPAT(BQIDFN,20,0))="",$O(^BQIREG("AC",BQIDFN,""))="" D  Q
 . S II=II+1,@DATA@(II)=DEMOG_U_$S(BQIDOD'="":"{D}",1:"{None}")_U_U_U_U_$C(30)
 . ;S II=II+1,@DATA@(II)=$P(DEMOG,U,1,6)_U_"{None}"_U_U_U_U_$C(30)
 ;
 ; if searching for active tags and person has no active tags
 I 'INC,'$$ACT^BQITDUTL(BQIDFN) S II=II+1,@DATA@(II)=DEMOG_U_$S(BQIDOD'="":"{D}",1:"{None}")_U_U_U_U_$C(30) Q
 ;I 'INC,'$$ACT^BQITDUTL(BQIDFN) S II=II+1,@DATA@(II)=$P(DEMOG,U,1,6)_U_"{None}"_U_U_U_U_$C(30) Q
 ;
 S TIEN="",QFL=0
 F  S TIEN=$O(^BQIREG("AC",BQIDFN,TIEN)) Q:TIEN=""  D
 . D TAG(TIEN,INC,1)
 Q
 ;
TAG(IEN,INC,FULL) ;EP - Get current tag data
 ; Check status
 ; INC - if set to 0 only include tag if active
 ;       if set to 1 only include tag if active or Not Accepted tags
 ;       if set to anything else include tag regardless of status
 ; FULL  if set to 0, don't include full demographics
 ;       if set to 1, include full demographics
 ;
 S TAGIEN=$$GET1^DIQ(90509,IEN_",",.01,"I")
 S TAGNM=$$GET1^DIQ(90509,IEN_",",.01,"E")
 S STAT=$$GET1^DIQ(90509,IEN_",",.03,"I")
 I $G(INC)=0 I STAT'="A",STAT'="P" Q
 I $G(INC)=1 I STAT'="A",STAT'="P",STAT'="N" Q
 S FULL=$G(FULL,0)
 S TAGDTU=$P(^BQIREG(IEN,0),U,4)
 S TAGDTU=$$FMTE^BQIUL1(TAGDTU)
 S WHO=$P(^BQIREG(IEN,0),U,5)
 S SCOM=$$GET1^DIQ(90509,IEN_",",.06,"I")
 S OCOM=""
 S OCN=0
 F  S OCN=$O(^BQIREG(IEN,1,OCN)) Q:'OCN  D
 . S OCOM=OCOM_^BQIREG(IEN,1,OCN,0)_" "
 I FULL S II=II+1,@DATA@(II)=DEMOG_U_TAGNM_U_TAGIEN_U_STAT_U_TAGDTU_U_WHO_U_SCOM_U_OCOM_$C(30)
 I 'FULL S II=II+1,@DATA@(II)=$P(DEMOG,U,1,5)_U_TAGNM_U_TAGIEN_U_STAT_U_TAGDTU_U_WHO_U_SCOM_U_OCOM_$C(30)
 Q
 ;
PAT(DATA,DFN) ;EP - BQI GET DX CAT BY PATIENT
 NEW UID,II
 S UID=$S($G(ZTSK):"Z"_ZTSK,1:$J)
 S DATA=$NA(^TMP("BQITDPT",UID))
 K @DATA
 ;
 S II=0
 NEW $ESTACK,$ETRAP S $ETRAP="D ERR^BQITDPNL D UNWIND^%ZTER" ; SAC 2006 2.2.3.3.2
 ;
 S @DATA@(II)="I00010DFN^T00030PATIENT_NAME^T00030HRN^D00030DOB^T00010AGE^T00035TAG_NAME^I00010TAG_IEN^T00015STATUS^"
 S @DATA@(II)=@DATA@(II)_"D00030DATE_LASTUPDATE^T00035UPDATED_BY^T00050COMMENT^T01024OTHER_COMMENT"_$C(30)
 ;
 D PPAT(DFN,1)
 G DONE
