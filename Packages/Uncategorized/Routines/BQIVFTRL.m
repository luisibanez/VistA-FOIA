BQIVFTRL ;PRXM/HC/ALA-V File Trigger RPC for Lab fields ; 24 May 2007  4:53 PM
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 Q
 ;
EN(DATA,LAB,SITE,RSLT,BQDFN) ;EP - BQI VFILE TRIGGER LAB
 ;
 ; Input
 ;   SITE  - The site specimen IEN
 ;   LAB   - Lab test IEN
 ;   RSLT  - Lab test result
 ;   BQDFN - Patient internal entry number
 ;
 NEW UID,II,PARMS,DA,IENS,NM,VALUE
 S UID=$S($G(ZTSK):"Z"_ZTSK,1:$J)
 S DATA=$NA(^TMP("BQIVFTRL",UID))
 K @DATA
 S II=0
 NEW $ESTACK,$ETRAP S $ETRAP="D ERR^BQIVFTRL D UNWIND^%ZTER" ; SAC 2006 2.2.3.3.2
 ;
 S SITE=$G(SITE,""),RSLT=$G(RSLT,""),BQDFN=$G(BQDFN,"")
 I SITE="",RSLT="" D TBL G DONE
 I SITE'="",RSLT="" D SITE G DONE
 I RSLT'="" D RES G DONE
 Q
 ;
SITE ; Get site specific defaults
 NEW LOINC,LOW,HIGH,SEX,AGE
 S @DATA@(II)="T00008SOURCE^T00001CODE_TYPE^T01024PARMS^T00200HELP_TEXT"_$C(30)
 S DA(1)=LAB,DA=SITE,IENS=$$IENS^DILF(.DA)
 S LOW=$$GET1^DIQ(60.01,IENS,1,"E")
 I LOW["$S(" D
 . I $G(BQDFN)="" S LOW="" Q
 . S AGE=$$AGE^BQIAGE(BQDFN)
 . S SEX=$$GET1^DIQ(2,BQDFN_",",.02,"I")
 . S LOW="S LOW="_LOW
 . X LOW
 S HIGH=$$GET1^DIQ(60.01,IENS,2,"E")
 I HIGH["$S" D
 . I $G(BQDFN)="" S HIGH="" Q
 . S AGE=$$AGE^BQIAGE(BQDFN)
 . S SEX=$$GET1^DIQ(2,BQDFN_",",.02,"I")
 . S HIGH="S HIGH="_HIGH
 . X HIGH
 S PARMS("APCDTRFL")=LOW
 S PARMS("APCDTRFH")=HIGH
 S PARMS("APCDTUNI")=$$GET1^DIQ(60.01,IENS,6,"E")
 ;S PARMS("APCDTCPT")=$$GET1^DIQ(60.01,IENS,15,"E")
 S LOINC=$$GET1^DIQ(60.01,IENS,95.3,"E")
 I LOINC'="" S PARMS("APCDTLNC")=$$GET1^DIQ(60.01,IENS,95.3,"I")_$C(29)_$$GET1^DIQ(60.01,IENS,95.3,"E")
 S NM="",VALUE=""
 F  S NM=$O(PARMS(NM)) Q:NM=""  D
 . S II=II+1,@DATA@(II)=NM_U_U_PARMS(NM)_U_$C(30)
 Q
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
TBL ; Get all possible lab results values
 ;
 NEW LIST,HELP,LDATA,LTYPE,WHERE,BII,IEN,VALUE,PARMS
 S @DATA@(II)="T00008SOURCE^T00001CODE_TYPE^T01024PARMS^T00200HELP_TEXT"_$C(30)
 S IEN=0,VALUE="",PARMS="",LTYPE=""
 ;
 S WHERE=$P(^LAB(60,LAB,0),U,12)
 I WHERE'="" D
 . S LDATA=U_WHERE_"0)"
 . S LTYPE=$P(@LDATA,U,2)
 . S LTYPE=$S(LTYPE["N":"N",LTYPE["S":"S",1:"F")
 . ;I LTYPE="S" S LIST=$P(@LDATA,U,3)
 . S LIST=$P(@LDATA,U,3)
 . S LDATA=U_WHERE_"3)",HELP=$G(@LDATA)
 . I HELP="",LTYPE["S" D
 .. S HELP="Select one of the following:"_$C(10)
 .. F BII=1:1:$L(LIST,";") S HELP=HELP_$P($P(LIST,";",BII),":",2)_$C(10)
 . I LTYPE="S" S LTYPE="C"
 . S LIST=$TR(LIST,":",$C(29)),LIST=$TR(LIST,";",$C(28))
 ;
 S II=II+1,@DATA@(II)="APCDTRES"_U_LTYPE_U_$G(LIST)_U_$G(HELP)_$C(30)
 ;
 F  S IEN=$O(^LAB(60,LAB,1,IEN)) Q:'IEN  D
 . S VALUE=VALUE_IEN_$C(29)_$$GET1^DIQ(61,IEN,.01,"E")_$C(28)
 S VALUE=$$TKO^BQIUL1(VALUE,$C(28))
 S II=II+1,@DATA@(II)="APCDTSTE"_U_"C"_U_VALUE_U_$C(30)
 Q
 ;
RES ; Get trigger abnormal value from result
 NEW LRTS,LRQ,LRSPEC,LRSB,HELP,NM,VALUE,LRFLG
 S X=RSLT,LRTS=LAB,LRQ=1,LRSPEC=SITE,LRSB=LAB
 I BQDFN'="" S AGE=$$AGE^BQIAGE(BQDFN),SEX=$P(^DPT(BQDFN,0),U,2)
 D V25^LRVER5
 D RANGE^LRVER5
 S @DATA@(II)="T00008SOURCE^T00001CODE_TYPE^T01024PARMS^T00200HELP_TEXT"_$C(30)
 S PARMS("APCDTABN")=$G(LRFLG)
 S HELP="L*=Critical Low, L=Low, H=High, H*=Critical High, Blank for normal"
 S NM="",VALUE=""
 F  S NM=$O(PARMS(NM)) Q:NM=""  D
 . S II=II+1,@DATA@(II)=NM_U_U_PARMS(NM)_U_HELP_$C(30)
 Q
