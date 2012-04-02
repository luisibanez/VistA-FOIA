AGGEDCHK ;VNGT/HS/ALA-Edit Check ; 27 Apr 2010  6:56 AM
 ;;1.0;PATIENT REGISTRATION GUI;;Nov 15, 2010
 ;
 ;
CHK(DATA,AGPATDFN) ; EP -- AGG PATIENT EDIT CHECK
 ; Input
 ;   DFN - Patient IEN
 ;
 NEW UID,II,ERRORS,VARS,AGN,EDATA,Y,TYPE,TYP,VAR,ACTIVE,AGERNODE
 NEW AGERRCAL,AGERRMSG,AGERRSOL,FAC,HDR,I,INSGEND,INSPTR,DEF,FLD
 NEW AGERRTYP,AGGUAR,AGSEL,AOPCOINS,D0,DATEINEF,EMPSTAT,END,ERRORNUM
 NEW ISACTIVE,LSTUPD,MISSING,P,PHREC,REC,RECPTR,RELPOLHO,RET,SEL,SEQREQ
 NEW AGQI,AGQT,AGTP,C,DGNEWVAL,TAB,KEY,AG
 S UID=$S($G(ZTSK):"Z"_ZTSK,1:$J)
 S DATA=$NA(^TMP("AGGEDCHK",UID))
 K @DATA
 S II=0
 NEW $ESTACK,$ETRAP S $ETRAP="D ERR^AGGEDCHK D UNWIND^%ZTER" ; SAC 2006 2.2.3.3.2
 ;
 S HDR="I00010HIDE_ERROR_NUM^T00030MSG^T00001TYPE^T00030HIDE_WINDOW^T00008HIDE_FIELD^T00050HIDE_TAB^T00001HIDE_KEY"
 S @DATA@(II)=HDR_$C(30)
 D FETCHERR^AGEDERR("",.ERRORS)
 S VARS("DFN")=AGPATDFN
 S VARS("FINDCALL")=""
 S VARS("SITE")=DUZ(2)
 ;
 K AGOPT,AG
 D ^AGVAR
 D EDITCHEK^AGEDERR(.ERRORS,.VARS,0)
 S AGN=0
 F  S AGN=$O(ERRORS(AGN)) Q:'AGN  D
 . I '$G(ERRORS(AGN)) Q
 . S EDATA=^AGEDERRS(AGN,0)
 . S TYP=$P(EDATA,U,2)
 . S TYP=$$STC^AGGUL1(9009061.5,.02,TYP)
 . D FER(AGN)
 . S II=II+1,@DATA@(II)=AGN_U_$P(EDATA,U,3)_U_TYP_U_DEF_U_FLD_U_TAB_U_KEY_$C(30)
 ;
 D OTH(AGPATDFN)
 ;
 S II=II+1,@DATA@(II)=$C(31)
 K AGOPT
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
FND(DATA,ERRNUM) ; EP -- AGG ERROR SCREEN
 ; Input
 ;   ERRNUM - Error number
 NEW UID,II
 S UID=$S($G(ZTSK):"Z"_ZTSK,1:$J)
 S DATA=$NA(^TMP("AGGERROR",UID))
 K @DATA
 S II=0
 NEW $ESTACK,$ETRAP S $ETRAP="D ERR^AGGEDCHK D UNWIND^%ZTER" ; SAC 2006 2.2.3.3.2
 ;
 S HDR="I00010ERROR_NUM^T00030WINDOW^T00008FIELD"
 S @DATA@(II)=HDR_$C(30)
 I $G(ERRNUM)'="" D FER(ERRNUM)
 I $G(ERRNUM)="" S ERRNUM="" F  S ERRNUM=$O(^AGG(9009068.5,"B",ERRNUM)) Q:ERRNUM=""  D FER(ERRNUM)
 S II=II+1,@DATA@(II)=$C(31)
 Q
 ;
FER(ERRNUM) ;
 NEW IEN,EDATA
 S IEN=$O(^AGG(9009068.5,"B",ERRNUM,""))
 I IEN="" S (DEF,TAB,KEY,FLD)="" Q
 S EDATA=^AGG(9009068.5,IEN,0)
 S DEF=$P(EDATA,U,2) I DEF'="" S DEF=$P(^AGG(9009068.3,DEF,0),U,1)
 S TAB=$P(EDATA,U,4),KEY=$P(EDATA,U,5),FLD=$P(EDATA,U,3)
 ;S II=II+1,@DATA@(II)=ERRNUM_U_DEF_U_$P(EDATA,U,3)_$C(30)
 Q
 ;
OTH(DFN) ; EP - Other data checks
 NEW AGOPT,DG20NAME,AG
 D ^AGDATCK
 F I=1:1:13 I $D(AG("ER",I)) D
 . S EDATA=$T(VAR+I),AGN=$P($P(EDATA,U,1),";;",2),TYP="MANDATORY"
 . D FER(AGN)
 . S II=II+1,@DATA@(II)=AGN_U_$P(EDATA,U,3)_U_TYP_U_DEF_U_FLD_U_TAB_U_KEY_$C(30)
 Q
 ;
VAR ;EP
 ;;800^^invalid NAME
 ;;801^^invalid CHART NUMBER
 ;;802^^missing DATE OF BIRTH
 ;;803^^invalid SEX
 ;;804^^missing or unspecified TRIBE
 ;;805^^missing INDIAN QUANTUM
 ;;806^^missing CURRENT COMMUNITY
 ;;807^^missing BENEFICIARY
 ;;808^^invalid ELIGIBILITY &/OR CLASS/TRIBE/QUANTUM DEMOGRAPHICS
 ;;809^^patient not eligible for BIC
 ;;810^^missing SOCIAL SECURITY NUMBER
 ;;811^^OLD (unused) TRIBE still in use
 ;;812^^no Official Registering Facility:Health Record Number
 ;;813^^Patient has been marked INACTIVE
 Q