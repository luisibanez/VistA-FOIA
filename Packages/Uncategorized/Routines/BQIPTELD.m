BQIPTELD ;PRXM/HC/ALA - PATIENT ELDER CARE ; 27 Mar 2007  1:32 PM
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 ;
 Q
 ;
ELD(DATA,DFN,DRANGE) ; EP -- BQI PATIENT ELDER CARE
 ;
 ;Description - all the elder care data that a patient has
 ;
 ;Input
 ;  DFN - Patient internal entry number
 ;
 NEW UID,II,IEN,VISIT,VSDTM,HDR,VALUE,FLD,ELDN,ORPHY,ENPHY
 S UID=$S($G(ZTSK):"Z"_ZTSK,1:$J)
 S DATA=$NA(^TMP("BQIPTELD",UID))
 K @DATA
 ;
 S II=0
 NEW $ESTACK,$ETRAP S $ETRAP="D ERR^BQIPTELD D UNWIND^%ZTER" ; SAC 2006 2.2.3.3.2
 ;
 S DRANGE=$$DATE^BQIUL1($G(DRANGE))
 S HDR="I00010ELD_IEN^I00010VISIT_IEN^T00009FORM^D00030VISIT_DATETIME^T00035ORD_PROV^T00035ENC_PROV^"
 F FLD=.04:.01:.09,.11:.01:.15 S HDR=HDR_"T00020"_$E($$GET1^DID(9000010.35,FLD,"","LABEL"),1,4)_U
 S HDR=HDR_"T00020TRANSP^T00020CHANGE^T00003CAREGIVE"
 S @DATA@(II)=HDR_$C(30)
 S IEN=""
 F  S IEN=$O(^AUPNVELD("AC",DFN,IEN),-1) Q:IEN=""  D
 . S VALUE=""
 . S ELDN=$$GET1^DIQ(9000010.35,IEN_",",.01,"E") I ELDN="" Q
 . S VISIT=$$GET1^DIQ(9000010.35,IEN_",",.03,"I") I VISIT="" Q
 . S VSDTM=$$GET1^DIQ(9000010,VISIT_",",.01,"I") I VSDTM=0 Q
 . I DRANGE'="",(VSDTM\1<DRANGE) Q
 . S ORPHY=$$GET1^DIQ(9000010.35,IEN_",",1202,"E")
 . S ENPHY=$$GET1^DIQ(9000010.35,IEN_",",1204,"E")
 . S VALUE=IEN_U_VISIT_U_ELDN_U_$$FMTE^BQIUL1(VSDTM)_U_ORPHY_U_ENPHY_U
 . F FLD=.04:.01:.09,.11:.01:.18 S VALUE=VALUE_$$GET1^DIQ(9000010.35,IEN_",",FLD,"E")_U
 . S II=II+1,@DATA@(II)=$$TKO^BQIUL1(VALUE,"^")_$C(30)
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
