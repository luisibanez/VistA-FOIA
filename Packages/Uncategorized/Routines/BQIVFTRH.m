BQIVFTRH ;PRXM/HC/ALA-Trigger Health Factor ; 23 Aug 2007  3:55 PM
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 Q
 ;
EN(DATA,CAT) ;EP - BQI VFILE TRIGGER FACTOR for a category
 ;
 ; Input
 ;   CAT  - Health Factor Category IEN
 ;
 NEW UID,II,PARMS,DA,IENS,NM,VALUE
 S UID=$S($G(ZTSK):"Z"_ZTSK,1:$J)
 S DATA=$NA(^TMP("BQIVFTRH",UID))
 K @DATA
 S II=0,CAT=$G(CAT,"")
 NEW $ESTACK,$ETRAP S $ETRAP="D ERR^BQIVFTRH D UNWIND^%ZTER" ; SAC 2006 2.2.3.3.2
 S SOURCE="APCDTHF"
 S @DATA@(II)="T00008SOURCE^T00001CODE_TYPE^T01024PARMS"_$C(30)
 S IEN=0,NAME="IEN=",VALUE=""
 F  S IEN=$O(^AUTTHF(IEN)) Q:'IEN  D
 . I $$GET1^DIQ(9999999.64,IEN,.13,"I")=1 Q
 . I CAT'="",$$GET1^DIQ(9999999.64,IEN,.03,"I")'=CAT Q
 . I $$GET1^DIQ(9999999.64,IEN,.1,"I")'="F" Q
 . S VALUE=VALUE_IEN_$C(29)_$$GET1^DIQ(9999999.64,IEN,.01,"E")_$C(28)
 S VALUE=$$TKO^BQIUL1(VALUE,$C(28))
 S II=II+1,@DATA@(II)=SOURCE_U_"C"_U_VALUE_$C(30)
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
