BQIPLFL ;PRXM/HC/ALA-Set the Panel's Filter Parameters ; 16 Dec 2005  2:58 PM
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 ;
 Q
 ;
RET(DATA,OWNR,PLIEN) ; EP -- BQI GET PANEL FILTERS
 ;
 ;Description - Retrieves the panel filter parameters for a specific panel
 ;
 ;Input
 ;  OWNR  = Owner of the panel internal entry number
 ;  PLIEN = Panel internal entry number
 ;Output
 ;  DATA  = name of global (passed by reference) in which the data
 ;          is stored
 ;Assumes
 ;  DUZ   = User who signed onto iCare
 ;
 NEW UID,II,X,MASP,MM,MPARMS,MSN,N,NAME,NM,NN,PARMS,PM,PPIEN,PTYP,VM
 NEW FILTER,FSOURCE,IENS,AN,ASN,ASPM,ATYP,DA
 S UID=$S($G(ZTSK):"Z"_ZTSK,1:$J)
 S DATA=$NA(^TMP("BQIPLFL",UID))
 K @DATA
 ;
 S II=0
 NEW $ESTACK,$ETRAP S $ETRAP="D ERR^BQIPLFL D UNWIND^%ZTER" ; SAC 2006 2.2.3.3.2
 ;
 S @DATA@(II)="T03200FILTERS"_$C(30)
 ;
 ;NEW DA,IENS,FSOURCE,PPIEN,PTYP,N,NN,PARMS,MPARMS
 S DA(1)=OWNR,DA=PLIEN,IENS=$$IENS^DILF(.DA)
 S FSOURCE=$$GET1^DIQ(90505.01,IENS,.14,"E")
 ;
 ; Find definition
 I FSOURCE="" G DONE
 S PPIEN=$$PP^BQIDCDF(FSOURCE) I PPIEN=-1 S BMXSEC="Pre-defined panel type "_FSOURCE_" was not found" Q
 ;
 S N=0,PARMS="",MPARMS=""
 F  S N=$O(^BQICARE(OWNR,1,PLIEN,15,N)) Q:'N  D
 . NEW DA,IENS
 . S DA(2)=OWNR,DA(1)=PLIEN,DA=N,IENS=$$IENS^DILF(.DA)
 . S NAME=$$GET1^DIQ(90505.115,IENS,.01,"E")
 . S PTYP=$$PTYP^BQIDCDF(FSOURCE,NAME)
 . S FILTER(N)=NAME
 . I '$D(^BQICARE(OWNR,1,PLIEN,15,N,1)) D  Q
 .. NEW DA,IENS,NAME,VALUE
 .. S DA(2)=OWNR,DA(1)=PLIEN,DA=N,IENS=$$IENS^DILF(.DA)
 .. I PTYP="T" S VALUE=$$GET1^DIQ(90505.115,IENS,.03,"E")
 .. I PTYP'="T" S VALUE=$$GET1^DIQ(90505.115,IENS,.02,"E")
 .. I PTYP="D" S VALUE=$$FMTE^BQIUL1(VALUE)
 .. S FILTER(N,1)=VALUE
 .. ; Check for associated parameters
 .. S ASN=0
 .. F  S ASN=$O(^BQICARE(OWNR,1,PLIEN,15,N,2,ASN)) Q:'ASN  D
 ... NEW DA,IENS,ASSOC,AVALUE,VALUE
 ... S DA(3)=OWNR,DA(2)=PLIEN,DA(1)=N,DA=ASN,IENS=$$IENS^DILF(.DA)
 ... S ASSOC=$$GET1^DIQ(90505.1152,IENS,.01,"E")
 ... S ATYP=$$PTYP^BQIDCDF(FSOURCE,ASSOC)
 ... S FILTER(N,1,ASN)=ASSOC
 ... I '$D(^BQICARE(OWNR,1,PLIEN,15,N,2,ASN,1)) D  Q
 .... I ATYP="T" S VALUE=$$GET1^DIQ(90505.1152,IENS,.03,"E")
 .... I ATYP'="T" S VALUE=$$GET1^DIQ(90505.1152,IENS,.02,"E")
 .... I ATYP="D" S VALUE=$$FMTE^BQIUL1(VALUE)
 .... S FILTER(N,1,ASN,1)=VALUE
 ... S MSN=0
 ... F  S MSN=$O(^BQICARE(OWNR,1,PLIEN,15,N,2,ASN,1,MSN)) Q:'MSN  D
 .... NEW DA,IENS,VALUE
 .... S DA(4)=OWNR,DA(3)=PLIEN,DA(2)=N,DA(1)=ASN,DA=MSN,IENS=$$IENS^DILF(.DA)
 .... I ATYP="T" S VALUE=$$GET1^DIQ(90505.11521,IENS,.02,"E")
 .... I ATYP'="T" S VALUE=$$GET1^DIQ(90505.11521,IENS,.01,"E")
 .... I ATYP="D" S VALUE=$$FMTE^BQIUL1(VALUE)
 .... S FILTER(N,1,ASN,MSN)=VALUE
 . ;
 . S NN=0
 . F  S NN=$O(^BQICARE(OWNR,1,PLIEN,15,N,1,NN)) Q:'NN  D
 .. NEW DA,IENS,VALUE
 .. S DA(3)=OWNR,DA(2)=PLIEN,DA(1)=N,DA=NN,IENS=$$IENS^DILF(.DA)
 .. I PTYP="T" S VALUE=$$GET1^DIQ(90505.1151,IENS,.02,"E")
 .. I PTYP'="T" S VALUE=$$GET1^DIQ(90505.1151,IENS,.01,"E")
 .. I PTYP="D" S VALUE=$$FMTE^BQIUL1(VALUE)
 .. S FILTER(N,NN)=VALUE
 .. ; Check for associated parameters
 .. S ASN=0
 .. F  S ASN=$O(^BQICARE(OWNR,1,PLIEN,15,N,1,NN,2,ASN)) Q:'ASN  D
 ... NEW DA,IENS,ASSOC,AVALUE,VALUE
 ... S DA(4)=OWNR,DA(3)=PLIEN,DA(2)=N,DA(1)=NN,DA=ASN,IENS=$$IENS^DILF(.DA)
 ... S ASSOC=$$GET1^DIQ(90505.11512,IENS,.01,"E")
 ... S ATYP=$$PTYP^BQIDCDF(FSOURCE,ASSOC)
 ... S FILTER(N,NN,ASN)=ASSOC
 ... I '$D(^BQICARE(OWNR,1,PLIEN,15,N,1,NN,2,ASN,1)) D  Q
 .... I ATYP="T" S VALUE=$$GET1^DIQ(90505.11512,IENS,.03,"E")
 .... I ATYP'="T" S VALUE=$$GET1^DIQ(90505.11512,IENS,.02,"E")
 .... I ATYP="D" S VALUE=$$FMTE^BQIUL1(VALUE)
 .... S FILTER(N,NN,ASN,1)=VALUE
 ... S MSN=0
 ... F  S MSN=$O(^BQICARE(OWNR,1,PLIEN,15,N,1,NN,2,ASN,1,MSN)) Q:'MSN  D
 .... NEW DA,IENS,VALUE
 .... S DA(5)=OWNR,DA(4)=PLIEN,DA(3)=N,DA(2)=NN,DA(1)=ASN,DA=MSN,IENS=$$IENS^DILF(.DA)
 .... I ATYP="T" S VALUE=$$GET1^DIQ(90505.115121,IENS,.02,"E")
 .... I ATYP'="T" S VALUE=$$GET1^DIQ(90505.115121,IENS,.01,"E")
 .... I ATYP="D" S VALUE=$$FMTE^BQIUL1(VALUE)
 .... S FILTER(N,NN,ASN,MSN)=VALUE
 ;
 ; Build PARMS
 S PM=""
 F  S PM=$O(FILTER(PM)) Q:PM=""  D
 . S NAME=FILTER(PM),PARMS=$G(PARMS)_NAME_"="
 . S VM=""
 . F  S VM=$O(FILTER(PM,VM)) Q:VM=""  D
 .. S AN=""
 .. F  S AN=$O(FILTER(PM,VM,AN)) Q:AN=""  D
 ... S MM="",MASP=""
 ... F  S MM=$O(FILTER(PM,VM,AN,MM)) Q:MM=""  D
 .... S MASP=$G(MASP)_FILTER(PM,VM,AN,MM)_$C(24)
 ... S MASP=$$TKO^BQIUL1(MASP,$C(24))
 ... S ASPM=FILTER(PM,VM,AN)_"="_MASP
 ... S MPRM(VM)=FILTER(PM,VM)_$C(25)_ASPM_$C(29)
 .. I '$D(MPRM(VM)) S MPRM(VM)=FILTER(PM,VM)_$C(29)
 . S NM=""
 . F  S NM=$O(MPRM(NM)) Q:NM=""  S PARMS=PARMS_MPRM(NM)
 . S PARMS=$$TKO^BQIUL1(PARMS,$C(29))
 . S PARMS=PARMS_$C(28)
 . K MPRM
 ;
 S II=II+1
 S PARMS=$$TKO^BQIUL1(PARMS,$C(28))
 ;S PARMS=$$TKO^BQIUL1(PARMS,$C(29))
 S @DATA@(II)=PARMS_$C(30)
 ;
DONE ;
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
UPD(DATA,OWNR,PLIEN,PARMS) ; EP -- BQI SET PANEL FILTERS
 ;
 ;Description
 ;  Update or set the filter parameters
 ;Input
 ;  OWNR    = Owner of panel IEN
 ;  PLIEN   = Panel internal entry number
 ;  PARMS   = Filter parameters (if NULL, deletes ALL)
 ;         if PARMS contain a $C(29), then that is
 ;         a multiple value parameter
 ;
 NEW UID,II,X,BN,FSOURCE,PPIEN,PTYP,BQ,BQIUPD,PDATA,MVAL,PDA,QFL,ACT
 NEW ASDATA,ASNAME,ASV,AVAL,AVCT,BQQ,CT,MBQ,MVN,RESULT,VAL
 S UID=$S($G(ZTSK):"Z"_ZTSK,1:$J)
 S DATA=$NA(^TMP("BQIPLFL",UID))
 K @DATA
 ;
 ; Check if share and has write access
 I '$$CKSHR^BQIPLSH(OWNR,PLIEN) S BMXSEC="You do not have write access" Q
 ;
 S II=0
 NEW $ESTACK,$ETRAP S $ETRAP="D ERR^BQIPLFL D UNWIND^%ZTER" ; SAC 2006 2.2.3.3.2
 ;
 S PARMS=$G(PARMS,""),RESULT=1
 S @DATA@(II)="I00010RESULT^T00050MSG"_$C(30)
 ;
 D DEL(.OWNR,.PLIEN)
 ;
 NEW DA,IENS
 S DA(1)=OWNR,DA=PLIEN,IENS=$$IENS^DILF(.DA)
 S FSOURCE=$$GET1^DIQ(90505.01,IENS,.14,"E")
 ;
 ; Find definition panel
 I FSOURCE="" G DONE
 S PPIEN=$$PP^BQIDCDF(FSOURCE) I PPIEN=-1 S BMXSEC="Pre-defined panel type "_FSOURCE_" was not found" Q
 ;
 S PARMS=$G(PARMS,"")
 I PARMS="" D
 . S LIST="",BN=""
 . F  S BN=$O(PARMS(BN)) Q:BN=""  S LIST=LIST_PARMS(BN)
 . K PARMS
 . S PARMS=LIST
 . K LIST
 ;
 K FILTER
 S QFL=0
 F BQ=1:1:$L(PARMS,$C(28)) S FILTER(BQ)=$P(PARMS,$C(28),BQ)
 F BQQ=1:1:BQ D
 . S PDATA=$G(FILTER(BQQ)) Q:PDATA=""
 . S NAME=$P(PDATA,"=",1),VALUE=$P(PDATA,"=",2,99)
 . S FDATA(BQQ)=NAME
 . F II=1:1:$L(VALUE,$C(29)) D
 .. S VAL=$P(VALUE,$C(29),II),ASSOC=$P(VAL,$C(25),2,99)
 .. S FILTER(BQQ,II)=$P(VAL,$C(25),1)
 .. I ASSOC'="" D
 ... F ASN=1:1:$L(ASSOC,$C(25)) D
 .... S ASDATA=$P(ASSOC,$C(25),ASN)
 .... S ASVAL=$P(ASDATA,"=",2),ASNAME=$P(ASDATA,"=",1)
 .... S FILTER(BQQ,II,ASN)=ASNAME
 .... I ASVAL'[$C(24) S FILTER(BQQ,II,ASN,1)=ASVAL Q
 .... F ASV=1:1:$L(ASVAL,$C(24)) S FILTER(BQQ,II,ASN,ASV)=$P(ASVAL,$C(24),ASV)
 F BQQ=1:1:BQ S FILTER(BQQ)=FDATA(BQQ)
 K FDATA
 ;
 ; Store the filter data
 S BQQ=""
 F  S BQQ=$O(FILTER(BQQ)) Q:BQQ=""  D
 . S NAME=FILTER(BQQ)
 . S PTYP=$$PTYP^BQIDCDF(FSOURCE,NAME)
 . ; Create parameter entry
 . NEW DA,IENS,DIC,DLAYGO
 . S DA(2)=OWNR,DA(1)=PLIEN,X=NAME
 . S DLAYGO=90505.115,DIC(0)="L",DIC("P")=DLAYGO
 . S DIC="^BQICARE("_DA(2)_",1,"_DA(1)_",15,"
 . I '$D(^BQICARE(DA(2),1,DA(1),15,0)) S ^BQICARE(DA(2),1,DA(1),15,0)="^90505.115^^"
 . K DO,DD D FILE^DICN
 . S PDA=+Y
 . I PDA=-1 S RESULT=-1,QFL=1 Q
 . ;
 . S MBQ="",CT=1
 . F  S MBQ=$O(FILTER(BQQ,MBQ)) Q:MBQ=""  D
 .. ; If there are no multiple values, store and quit
 .. S VALUE=FILTER(BQQ,MBQ)
 .. I $O(FILTER(BQQ,MBQ))="",CT=1 D PMSV(OWNR,PLIEN,PDA,VALUE,PTYP) Q
 .. D PMMV(OWNR,PLIEN,PDA,VALUE,PTYP)
 .. S CT=CT+1
 .. ;
 ;
 S II=II+1,@DATA@(II)=RESULT_U_$C(30)
 S II=II+1,@DATA@(II)=$C(31)
 D DSC
 Q
 ;
PMSV(BOWNR,BPLIEN,BDA,BVALUE,BTYP) ; Store singular parameter value
 NEW DA,IENS
 S DA(2)=BOWNR,DA(1)=BPLIEN,DA=BDA
 S IENS=$$IENS^DILF(.DA)
 I BTYP="D" S BVALUE=$$DATE^BQIUL1(BVALUE)
 I BTYP="T" S BQIUPD(90505.115,IENS,.03)=BVALUE
 I BTYP'="T" S BQIUPD(90505.115,IENS,.02)=BVALUE
 D FILE^DIE("","BQIUPD","ERROR")
 ; Check if there are associated parameters
 D CKAS
 Q
 ;
PMMV(BOWNR,BPLIEN,BDA,BVAL,BTYP) ;EP
 NEW DA,IENS,DIC,DLAYGO
 S DA(3)=BOWNR,DA(2)=BPLIEN,DA(1)=BDA,X=BVAL
 S DLAYGO=90505.1151,DIC(0)="L",DIC("P")=DLAYGO
 S DIC="^BQICARE("_DA(3)_",1,"_DA(2)_",15,"_DA(1)_",1,"
 K DO,DD D FILE^DICN
 S (DA,MDA)=+Y
 I DA=-1 S RESULT=-1,QFL=1 Q
 S IENS=$$IENS^DILF(.DA)
 I BTYP="D" S BVAL=$$DATE^BQIUL1(BVAL)
 I BTYP="T" S BQIUPD(90505.1151,IENS,.02)=BVAL
 I BTYP'="T" S BQIUPD(90505.1151,IENS,.01)=BVAL
 D FILE^DIE("","BQIUPD","ERROR")
 ; Check if there are associated parameters
 D CKAM
 Q
 ;
SASV(AOWNR,APLIEN,PDA,ADA,VALUE,PTYP) ; Single associated parameter
 ; Input
 ;   AOWNR  - Panel Owner
 ;   APLIEN - Panel IEN
 ;   PDA    - Parameter record
 ;   ADA    - Associated parameter record
 ;   VALUE  - Value
 ;   PTYP   - Associate parameter type
 NEW DA,IENS
 S DA(3)=AOWNR,DA(2)=APLIEN,DA(1)=PDA,DA=ADA
 S IENS=$$IENS^DILF(.DA)
 I PTYP="D" S VALUE=$$DATE^BQIUL1(VALUE)
 I PTYP="T" S BQIUPD(90505.1152,IENS,.03)=VALUE
 I PTYP'="T" S BQIUPD(90505.1152,IENS,.02)=VALUE
 D FILE^DIE("","BQIUPD","ERROR")
 Q
 ;
MASV(AOWNR,APLIEN,ADA,ASDA,ASVAL,ASTYP) ; Multiple associated parameter values
 NEW DA,IENS,DIC,DLAYGO
 S DA(4)=AOWNR,DA(3)=APLIEN,DA(2)=ADA,DA(1)=ASDA,X=ASVAL
 S DLAYGO=90505.11521,DIC(0)="L",DIC("P")=DLAYGO
 S DIC="^BQICARE("_DA(4)_",1,"_DA(3)_",15,"_DA(2)_",2,"_DA(1)_",1,"
 I '$D(^BQICARE(DA(4),1,DA(3),15,DA(2),2,DA(1),1,0)) S ^BQICARE(DA(4),1,DA(3),15,DA(2),2,DA(1),1,0)="^90505.11521^^"
 K DO,DD D FILE^DICN
 S DA=+Y
 I DA=-1 S RESULT=-1,QFL=1 Q
 S IENS=$$IENS^DILF(.DA)
 I ASTYP="D" S ASVAL=$$DATE^BQIUL1(ASVAL)
 I ASTYP="T" S BQIUPD(90505.11521,IENS,.02)=ASVAL
 I ASTYP'="T" S BQIUPD(90505.11521,IENS,.01)=ASVAL
 D FILE^DIE("","BQIUPD","ERROR")
 Q
 ;
DSC ; Generate panel description to include any filters
 NEW DA,IENS
 S DA(1)=OWNR,DA=PLIEN,IENS=$$IENS^DILF(.DA)
 K DESC
 D PEN^BQIPLDSC(OWNR,PLIEN,.DESC)
 D WP^DIE(90505.01,IENS,5,"","DESC")
 K DESC
 Q
 ;
DEL(OWNR,PLIEN) ;EP - Remove the previous filter parameters
 NEW DA,IENS,DIK
 S DA(2)=OWNR,DA(1)=PLIEN,DA=0
 S DIK="^BQICARE("_DA(2)_",1,"_DA(1)_",15,"
 F  S DA=$O(^BQICARE(OWNR,1,PLIEN,15,DA)) Q:'DA  D ^DIK
 Q
 ;
CKAS ; Check for associated parameters for a single parameter
 S ASN="",ACT=1
 F  S ASN=$O(FILTER(BQQ,MBQ,ASN)) Q:ASN=""  D
 . ; Check for multiple associated parameters
 . S ASSOC=FILTER(BQQ,MBQ,ASN)
 . NEW DA,DIC,DLAYGO
 . S DA(3)=BOWNR,DA(2)=BPLIEN,DA(1)=BDA,X=ASSOC
 . S ATYP=$$PTYP^BQIDCDF(FSOURCE,ASSOC)
 . S DLAYGO=90505.1152,DIC(0)="L",DIC("P")=DLAYGO
 . S DIC="^BQICARE("_DA(3)_",1,"_DA(2)_",15,"_DA(1)_",2,"
 . I '$D(^BQICARE(DA(3),1,DA(2),15,DA(1),2,0)) S ^BQICARE(DA(3),1,DA(2),15,DA(1),2,0)="^90505.1152^^"
 . K DO,DD D FILE^DICN
 . S (DA,ADA)=+Y
 . I DA=-1 S RESULT=-1,QFL=1 Q
 . S MVN="",AVCT=1
 . F  S MVN=$O(FILTER(BQQ,MBQ,ASN,MVN)) Q:MVN=""  D
 .. S AVAL=FILTER(BQQ,MBQ,ASN,MVN)
 .. ; If single associated parameter value
 .. I $O(FILTER(BQQ,MBQ,ASN,MVN))="",AVCT=1 D SASV(BOWNR,BPLIEN,BDA,ADA,AVAL,ATYP) Q
 .. ; If multiple associated parameter values
 .. D MASV(BOWNR,BPLIEN,BDA,ADA,AVAL,ATYP)
 .. S AVCT=AVCT+1
 Q
 ;
CKAM ;
 S ASN="",ACT=1
 F  S ASN=$O(FILTER(BQQ,MBQ,ASN)) Q:ASN=""  D
 . ; Check for multiple associated parameters
 . S ASSOC=FILTER(BQQ,MBQ,ASN)
 . NEW DA,DIC,DLAYGO
 . S DA(4)=BOWNR,DA(3)=BPLIEN,DA(2)=BDA,DA(1)=MDA,X=ASSOC
 . S ATYP=$$PTYP^BQIDCDF(FSOURCE,ASSOC)
 . S DLAYGO=90505.11512,DIC(0)="L",DIC("P")=DLAYGO
 . S DIC="^BQICARE("_DA(4)_",1,"_DA(3)_",15,"_DA(2)_",1,"_DA(1)_",2,"
 . I '$D(^BQICARE(DA(4),1,DA(3),15,DA(2),1,DA(1),2,0)) S ^BQICARE(DA(4),1,DA(3),15,DA(2),1,DA(1),2,0)="^90505.11512^^"
 . K DO,DD D FILE^DICN
 . S (DA,ADA)=+Y
 . I DA=-1 S RESULT=-1,QFL=1 Q
 . S MVN="",AVCT=1
 . F  S MVN=$O(FILTER(BQQ,MBQ,ASN,MVN)) Q:MVN=""  D
 .. S AVAL=FILTER(BQQ,MBQ,ASN,MVN)
 .. ; If single associated parameter value
 .. I $O(FILTER(BQQ,MBQ,ASN,MVN))="",AVCT=1 D MPSV(BOWNR,BPLIEN,BDA,MDA,ADA,AVAL,ATYP) Q
 .. ; If multiple associated parameter values
 .. D MPMV(BOWNR,BPLIEN,BDA,MDA,ADA,AVAL,ATYP)
 .. S AVCT=AVCT+1
 Q
 ;
MPSV(AOWNR,APLIEN,PDA,MPDA,ASDA,VALUE,PTYP) ;
 NEW DA,IENS
 S DA(4)=AOWNR,DA(3)=APLIEN,DA(2)=PDA,DA(1)=MPDA,DA=ASDA
 S IENS=$$IENS^DILF(.DA)
 I PTYP="D" S VALUE=$$DATE^BQIUL1(VALUE)
 I PTYP="T" S BQIUPD(90505.11512,IENS,.03)=VALUE
 I PTYP'="T" S BQIUPD(90505.11512,IENS,.02)=VALUE
 D FILE^DIE("","BQIUPD","ERROR")
 Q
 ;
MPMV(AOWNR,APLIEN,BDA,MDA,ADA,ASVAL,ATYP) ;
 NEW DA,IENS,DIC,DLAYGO
 S DA(5)=AOWNR,DA(4)=APLIEN,DA(3)=BDA,DA(2)=MDA,DA(1)=ADA,X=ASVAL
 S DLAYGO=90505.115121,DIC(0)="L",DIC("P")=DLAYGO
 S DIC="^BQICARE("_DA(5)_",1,"_DA(4)_",15,"_DA(3)_",1,"_DA(2)_",2,"_DA(1)_",1,"
 I '$D(^BQICARE(DA(5),1,DA(4),15,DA(3),1,DA(2),2,DA(1),1,0)) S ^BQICARE(DA(5),1,DA(4),15,DA(3),1,DA(2),2,DA(1),1,0)="^90505.115121^^"
 K DO,DD D FILE^DICN
 S DA=+Y
 I DA=-1 S RESULT=-1,QFL=1 Q
 S IENS=$$IENS^DILF(.DA)
 I ATYP="D" S ASVAL=$$DATE^BQIUL1(ASVAL)
 I ATYP="T" S BQIUPD(90505.115121,IENS,.02)=ASVAL
 I ATYP'="T" S BQIUPD(90505.115121,IENS,.01)=ASVAL
 D FILE^DIE("","BQIUPD","ERROR")
 Q
