ACRFUFMX ;IHS/OIRM/DSD/AEF - UTILITY STANDALONE TO READ OPEN DOCUMENTS FROM CORE FOR UFMS [ 05/09/2007   9:44 AM ]
 ;;2.1;ADMIN RESOURCE MGMT SYSTEM;**22**;NOV 05, 2001
 ;NEW ROUTINE; CONTINUATION OF ACRFUFMZ  ;ACR*2.1*22 UFMS
 ;
 ; *********************************************
 ;
 ; This routine is a continuation of ACRFUFMZ.  If there is no match to the
 ; FMS DOCUMENT file, it attempts to match the CORE document number in the
 ; 1166 APPROVALS FOR PAYMENT and the FMS DOCUMENT HISTORY RECORD files.
 ;
 Q   ;MUST ENTER AT LINE LABELS
 ;
 ; ****************************************************
HIT1166(ACRCDOC,FLAG) ;EP; CHECK 1166 APPROVALS FOR PAYMENT FILE
 ;
 ; - Enters with: ACRCDOC = CORE document number
 ;                FLAG = 0 OR 1
 ;   ACRCORE string VARIABLES from CORE file   
 ;
 ;   ACRCTYP     ;CORE DOCUMENT TYPE
 ;   ACRCAP      ;CORE ACCOUNTING POINT
 ;   ACRCFY      ;CORE FISCAL YEAR
 ;   ACRCCAN     ;CORE CAN
 ;   ACRCOCC     ;CORE OBJECT CLASS CODE
 ;   ACRCEIN     ;CORE VENDOR EIN
 K ACRXX
 D LOOP11(ACRCDOC,.ACRXX)       ;LOOP THROUGH 1166 APPROVALS FOR PAYMENT FILE
 S:'$G(ACRXX) ACRXX=0
 Q:FLAG                         ;IF FROM FMS DOC,ONLY WANT 1166 FILE POINTERS
 S ACRHIT=0
 F I=1:1:ACRXX D                ;ALLOW FOR MULTIPLES
 .S ACRMATCH=$$MATCH2^ACRFUFMU(.ACRXX,I,.ACRV)
 .I ACRMATCH'=0 D
 ..D ITEMS11^ACRFUFMI(ACRMATCH)  ;SETS ITEMS INTO ^ACRZ("ITEMS"
 ..S ACRHIT=1
 I 'ACRHIT D SETCK^ACRFUFMU("NO MATCH 1166",ACR)
 I ACRHIT D SET^ACRFUFMZ
 Q
 ;
HITDHR(ACRCDOC) ;EP;  CHECK FMS DOCUMENT HISTORY RECORD FILE
 ;
 ; - Enters with: ACRCDOC = CORE document number
 ;
 ; ****************************************************
 N ACRZ,ACRD1,ACRI,ACRTCOD,ACRAMT
 K ACRXX
 S (ACRZ,ACRMATCH,ACRX)=0
 F  S ACRZ=$O(^ACRDHR("B",ACRCDOC,ACRZ)) Q:ACRZ=""  D
 .S ACRD1=$G(^ACRDHR(ACRZ,1))
 .S ACREDAT=$$SLDATE^ACRFUTL($P(ACRD1,U,2))                ;EFFECTIVE DATE
 .S ACRCAN=$P(ACRD1,U,12)                ;CAN
 .S ACROCC=$P(ACRD1,U,13)                ;OBJECT CLASS CODE
 .S ACRAMT=$P(ACRD1,U,14)                ;DOLLAR AMOUNT
 .S ACRTCOD=$P(ACRD1,U,3)                ;TRANSACTION CODE
 .S ACRI=$E(ACRTCOD,1,2)                 ;TRANSACTION CODE
 .S ACRIFIN=$S(ACRI="05":"OBLIGATION",ACRI="18":"PARTIAL INVOICE",ACRI="19":"FINAL INVOICE",1:ACRI)
 .S ACRVEIN=$TR($P(ACRD1,U,16)," ")      ;VENDOR EIN+
 .S:$G(ACRV)'>0 ACRV=$$VEN^ACRFUFMU(ACRVEIN)
 .S ACRCCIEN=$$CCVEN^ACRFUFMU            ;CC DEFAULT VENDOR IEN
 .S ACRCIEN=$$VEN^ACRFUFMU(ACRCEIN)
 .I ACRCIEN,ACRCIEN=ACRCCIEN S ACRV=ACRCCIEN    ;CHANGE TO CC DEFAULT VENDOR
 .S ACRFY=$P(ACRD1,U,28)                 ;2-DIGIT FY
 .S ACRMATCH=$$MATCH^ACRFUFMU
 .S ACRSTR=ACRCDOC_U_ACREDAT_U           ;NO REQ OR INVOICE INFO
 .S ACRX=$G(ACRX)+1                      ;COUNTER
 .S ACRXX(ACRMATCH,ACRX,ACRV)=ACRSTR_"@"_ACRZ_U_ACRCAN_U_ACROCC_U_ACRAMT_U_ACRIFIN_U_ACRTCOD  ;ALLOW FOR MULTIPLES
 .S ACRXX=ACRX
 S ACRHIT=0
 F I=1:1:ACRXX D
 .S ACRMATCH=$$MATCH2^ACRFUFMU(.ACRXX,I,ACRV)
 .I ACRMATCH'=0 D
 ..D ITEMSDHR^ACRFUFMI(ACRMATCH,ACRCORE)  ;SETS ITEMS INTO ^ACRZ("ITEMS"
 ..S ACRHIT=1
 I 'ACRHIT D SETCK^ACRFUFMU("NO MATCH DHR",ACR)
 I ACRHIT D SET^ACRFUFMZ
 Q
 ; ************************************************
LOOP11(ACRCDOC,ACRXX) ;
 N ACRAFY,ACRABCH,ACRASEQ,ACRADATE
 S (ACRAFY,ACRMATCH,ACRX)=0
 F  S ACRAFY=$O(^AFSLAFP("N",ACRCDOC,ACRAFY)) Q:'ACRAFY  D
 .S ACRABCH=0
 .F  S ACRABCH=$O(^AFSLAFP("N",ACRCDOC,ACRAFY,ACRABCH)) Q:'ACRABCH  D
 ..S ACRASEQ=0
 ..F  S ACRASEQ=$O(^AFSLAFP("N",ACRCDOC,ACRAFY,ACRABCH,ACRASEQ)) Q:'ACRASEQ  D
 ...S ACRAF0=$G(^AFSLAFP(ACRAFY,1,ACRABCH,1,ACRASEQ,0))
 ...Q:ACRAF0']""
 ...S ACRAF3=$G(^AFSLAFP(ACRAFY,1,ACRABCH,1,ACRASEQ,3))
 ...S ACRFY=$P(ACRAF3,U,3)
 ...S:ACRFY="" ACRFY=$P(^AFSLAFP(ACRAFY,0),U)     ;FY OF BATCH
 ...S ACRAF34=$P(ACRAF3,U,4)                      ;INVOICE IN LIEU OF IDENTIFIER
 ...S ACRADAT=$P(ACRAF0,U,13)                     ;DATE
 ...I ACRADAT="" S ACRADAT=$P($G(^AFSLAFP(ACRAFY,1,ACRABCH,1,ACRASEQ,2)),U)
 ...S ACRADAT=$$SLDATE^ACRFUTL(ACRADAT)
 ...I ACRADAT="" S ACRADAT="0/0/"_ACRFY           ;WHEN ALL ELSE FAILS
 ...S ACRCANDA=$P(ACRAF0,U,7)
 ...S ACROCCDA=$P(ACRAF0,U,8)
 ...D PIECE^ACRFUFMU
 ...S ACRMATCH=$$MATCH^ACRFUFMU
 ...S:$G(ACRV)'>0 ACRV=+$P(ACRAF0,U,10)           ;DON'T RESET VENDOR
 ...I ACRREQ,'ACRMATCH D  S ACRX=0 Q              ;IN CASE PAYMENT DOESN'T MATCH
 ....S ACRSTR=ACRREQ_U_ACRADAT_U_ACRAF34
 ...S ACRSTR=ACRCDOC_U_ACRADAT_U_ACRAF34          ;NO REQ GIVE INVOICE
 ...S ACRX=$G(ACRX)+1                 ;COUNTER
 ...S ACRXX(ACRMATCH,ACRX,ACRV)=ACRSTR_"@"_ACRAFY_U_ACRABCH_U_ACRASEQ
 ...S ACRXX=ACRX                           ;COUNT MATCHES
 Q
