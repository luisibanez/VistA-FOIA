BQIRPLN ;VANGENT/HC/ALA-Problem List Notes ; 08 May 2008  4:59 PM
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 ;
 ;
EN(DATA,BQPIEN) ;EP - BQI PATIENT PROBLEM NOTES
 ;Input
 ; BQPIEN - Specific problem IEN
 ;
 ;Output
 ; DATA - Name of global in which data is stored
 ;
 NEW II,UID,BQDL,LOCN,LOC,NN,PBNIEN,PBNTNB,PBNNAR,PBNSTN,PBNSTAT
 NEW PBNDT,PBNUSN,PBNUSR
 S UID=$S($G(ZTSK):"Z"_ZTSK,1:$J)
 S DATA=$NA(^TMP("BQIRPLN",UID))
 K @DATA
 ;
 S II=0
 ;
 NEW $ESTACK,$ETRAP S $ETRAP="D ERR^BQIRPL D UNWIND^%ZTER" ; SAC 2006 2.2.3.3.2
 ;
 S BQPIEN=$G(BQPIEN,"") I BQPIEN="" S BMXSEC="No problem identified" Q
 ;
 S @DATA@(II)="I00010PBNIEN^T00030APCDFAC^T00010PBNTNB^T00060PBNNAR^T00001PBNSTAT^D00015PBNDT^T00035PBNUSR"_$C(30)
 ;
 S BQDL=0
 F  S BQDL=$O(^AUPNPROB(BQPIEN,11,BQDL)) Q:'BQDL  D
 . NEW DA,IENS
 . S DA(1)=BQPIEN,DA=BQDL,IENS=$$IENS^DILF(.DA)
 . S LOCN=$$GET1^DIQ(9000011.11,IENS,.01,"I")
 . I LOCN'="" S LOC=LOCN_$C(28)_$$GET1^DIQ(9000011.11,IENS,.01,"E")
 . S NN=0
 . F  S NN=$O(^AUPNPROB(BQPIEN,11,BQDL,11,NN)) Q:'NN  D
 .. NEW DA,IENS
 .. S DA(2)=BQPIEN,DA(1)=BQDL,DA=NN,IENS=$$IENS^DILF(.DA)
 .. S PBNIEN=NN
 .. S PBNTNB=$$GET1^DIQ(9000011.1111,IENS,.01,"E")
 .. S PBNNAR=$P(^AUPNPROB(BQPIEN,11,BQDL,11,NN,0),U,3)
 .. ;S PBNNAR=$$STRIP^XLFSTR(PBNNAR,$C(13))
 .. ;S PBNNAR=$TR(PBNNAR,$C(10)," ")
 .. S PBNSTN=$$GET1^DIQ(9000011.1111,IENS,.04,"I")
 .. I PBNSTN'="" S PBNSTAT=PBNSTN_$C(28)_$$GET1^DIQ(9000011.1111,IENS,.04,"E")
 .. S PBNDT=$$GET1^DIQ(9000011.1111,IENS,.05,"I")
 .. S PBNUSN=$$GET1^DIQ(9000011.1111,IENS,.06,"I")
 .. I PBNUSN'="" S PBNUSR=PBNUSN_$C(28)_$$GET1^DIQ(9000011.1111,IENS,.06,"E")
 .. S II=II+1,@DATA@(II)=PBNIEN_U_$G(LOC)_U_$G(PBNTNB)_U_$G(PBNNAR)_U_$G(PBNSTAT)_U_$$FMTE^BQIUL1(PBNDT)_U_$G(PBNUSR)_$C(30)
 S II=II+1,@DATA@(II)=$C(31)
 Q
 ;
UPD(DATA,PBLIEN,PBNIEN,PARMS) ; EP - BQI UPDATE PROBLEM NOTE
 NEW UID,II,VFIEN,FILE,LIST,BN,PDATA,NAME,VALUE,PFIEN,PTYP,CHIEN,FIELD,BQIUPD,FACN
 NEW PBNTNB,RESULT,ERROR,BQ,APCDFAC
 S UID=$S($G(ZTSK):"Z"_ZTSK,1:$J)
 S DATA=$NA(^TMP("BQIRPLNU",UID))
 K @DATA
 ;
 S II=0
 NEW $ESTACK,$ETRAP S $ETRAP="D ERR^BQIRPL D UNWIND^%ZTER" ; SAC 2006 2.2.3.3.2
 S @DATA@(II)="I00010RESULT^T01024MSG"_$C(30)
 S VFIEN=$O(^BQI(90506.3,"B","Problem Notes",""))
 I VFIEN="" S BMXSEC="RPC Call Failed: Problem Notes Definition does not exist." Q
 S FILE=$P(^BQI(90506.3,VFIEN,0),U,2)
 ;
 S PARMS=$G(PARMS,"")
 I PARMS="" D
 . S LIST="",BN=""
 . F  S BN=$O(PARMS(BN)) Q:BN=""  S LIST=LIST_PARMS(BN)
 . K PARMS
 . S PARMS=LIST
 . K LIST
 ;
 F BQ=1:1:$L(PARMS,$C(28)) D
 . S PDATA=$P(PARMS,$C(28),BQ) Q:PDATA=""
 . S NAME=$P(PDATA,"=",1),VALUE=$P(PDATA,"=",2,99) I VALUE="" Q
 . S PFIEN=$O(^BQI(90506.3,VFIEN,10,"AC",NAME,""))
 . S PTYP=$P($G(^BQI(90506.3,VFIEN,10,PFIEN,1)),U,1)
 . I PTYP="D" S VALUE=$$DATE^BQIUL1(VALUE)
 . ;I PTYP="T" S VALUE=VALUE
 . I PTYP="C" D
 .. S CHIEN=$O(^BQI(90506.3,VFIEN,10,PFIEN,5,"B",VALUE,"")) I CHIEN="" Q
 .. S VALUE=$P(^BQI(90506.3,VFIEN,10,PFIEN,5,CHIEN,0),U,2)
 . S FIELD=$P($G(^BQI(90506.3,VFIEN,10,PFIEN,3)),U,1)
 . I FIELD'="" S BQIUPD(FILE,1_",",FIELD)=VALUE
 . S @NAME=VALUE
 ;
 ;
 S FACN=""
 I $G(APCDFAC)="" S FACN=$O(^AUPNPROB(PBLIEN,11,"B",DUZ(2),""))
 I $G(APCDFAC)'="" S FACN=$O(^AUPNPROB(PBLIEN,11,"B",APCDFAC,""))
 I FACN="" D
 . NEW DA,DIC,DLAYGO,Y,X
 . S DA(1)=PBLIEN
 . S DIC(0)="LN",DLAYGO=9000011.11,DIC("P")=DLAYGO,DIC="^AUPNPROB("_DA(1)_",11,",X=DUZ(2)
 . K DO,DD D FILE^DICN
 . S FACN=+Y
 ;
 I $G(PBNIEN)="" D
 . NEW DA,DIC,DLAYGO,Y,X
 . S DA(2)=PBLIEN,DA(1)=FACN
 . S DIC(0)="LN",DLAYGO=9000011.1111,DIC("P")=DLAYGO,DIC="^AUPNPROB("_DA(2)_",11,"_DA(1)_",11,"
 . S X=PBNTNB
 . K DO,DD D FILE^DICN
 . S PBNIEN=+Y
 ;
 NEW DA,IENS,BQIUPDT
 S DA(2)=PBLIEN,DA(1)=FACN,DA=PBNIEN,IENS=$$IENS^DILF(.DA)
 M BQIUPDT(FILE,IENS)=BQIUPD(FILE,1_",")
 K BQIUPD
 D FILE^DIE("","BQIUPDT","ERROR")
 S RESULT=1_U
 I $D(ERROR)>0 S RESULT=-1_U_$G(ERROR("DIERR","1","TEXT","1"))
 S II=II+1,@DATA@(II)=RESULT_$C(30)
 S II=II+1,@DATA@(II)=$C(31)
 Q
