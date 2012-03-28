OCXOZ05 ;SLC/RJS,CLA - Order Check Scan ;JUN 15,2011 at 12:58
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**32**;Dec 17,1997
 ;;  ;;ORDER CHECK EXPERT version 1.01 released OCT 29,1998
 ;
 ; ***************************************************************
 ; ** Warning: This routine is automatically generated by the   **
 ; ** Rule Compiler (^OCXOCMP) and ANY changes to this routine  **
 ; ** will be lost the next time the rule compiler executes.    **
 ; ***************************************************************
 ;
 Q
 ;
CHK47 ; Look through the current environment for valid Event/Elements for this patient.
 ;  Called from CHK1+29^OCXOZ02.
 ;
 Q:$G(OCXOERR)
 ;
 ;    Local CHK47 Variables
 ; OCXDF(1) ----> Data Field: CONTROL CODE (FREE TEXT)
 ; OCXDF(2) ----> Data Field: FILLER (FREE TEXT)
 ; OCXDF(6) ----> Data Field: ABNORMAL FLAG (FREE TEXT)
 ; OCXDF(34) ---> Data Field: ORDER NUMBER (NUMERIC)
 ; OCXDF(37) ---> Data Field: PATIENT IEN (NUMERIC)
 ; OCXDF(96) ---> Data Field: ORDERABLE ITEM NAME (FREE TEXT)
 ; OCXDF(146) --> Data Field: INPT/OUTPT (FREE TEXT)
 ;
 ;      Local Extrinsic Functions
 ; LIST( ------------> IN LIST OPERATOR
 ; ORDITEM( ---------> GET ORDERABLE ITEM FROM ORDER NUMBER
 ; PATLOC( ----------> PATIENT LOCATION
 ;
 I $L(OCXDF(6)),$$LIST(OCXDF(6),"HH,LL"),$L(OCXDF(1)),$$LIST(OCXDF(1),"RE"),$L(OCXDF(2)),($E(OCXDF(2),1,2)="LR"),$L(OCXDF(34)) S OCXDF(96)=$$ORDITEM(OCXDF(34)) D CHK55
 I $L(OCXDF(1)),$$LIST(OCXDF(1),"RE"),$L(OCXDF(2)),($E(OCXDF(2),1,2)="LR"),$L(OCXDF(37)) S OCXDF(146)=$P($$PATLOC(OCXDF(37)),"^",1) I $L(OCXDF(146)),$L(OCXDF(34)) D CHK144^OCXOZ07
 Q
 ;
CHK55 ; Look through the current environment for valid Event/Elements for this patient.
 ;  Called from CHK47+19.
 ;
 Q:$G(OCXOERR)
 ;
 ;    Local CHK55 Variables
 ; OCXDF(113) --> Data Field: LAB TEST ID (NUMERIC)
 ; OCXDF(114) --> Data Field: LAB TEST PRINT NAME (FREE TEXT)
 ;
 ;      Local Extrinsic Functions
 ; FILE(DFN,24, -----> FILE DATA IN PATIENT ACTIVE DATA FILE  (Event/Element: HL7 LAB TEST RESULTS CRITICAL)
 ;
 I $L(OCXDF(113)) S OCXDF(114)=$$PRINTNAM^ORQQLR1(OCXDF(113)),OCXOERR=$$FILE(DFN,24,"12,13,96,114") Q:OCXOERR 
 Q
 ;
CHK58 ; Look through the current environment for valid Event/Elements for this patient.
 ;  Called from UPDATE+11^OCXOZ01.
 ;
 Q:$G(OCXOERR)
 ;
 ;    Local CHK58 Variables
 ; OCXDF(2) ----> Data Field: FILLER (FREE TEXT)
 ; OCXDF(37) ---> Data Field: PATIENT IEN (NUMERIC)
 ; OCXDF(40) ---> Data Field: ORDER MODE (FREE TEXT)
 ; OCXDF(47) ---> Data Field: OI LOCAL TEXT (FREE TEXT)
 ; OCXDF(73) ---> Data Field: ORDERABLE ITEM IEN (NUMERIC)
 ; OCXDF(131) --> Data Field: PHARMACY LOCAL ID (FREE TEXT)
 ; OCXDF(143) --> Data Field: DANGEROUS MEDS FOR PT > 64 NAME (FREE TEXT)
 ;
 ;      Local Extrinsic Functions
 ; DMED64( ----------> DANGEROUS MEDS FOR PATIENTS > 64
 ;
 S OCXDF(2)=$P($G(OCXPSD),"|",2) I $L(OCXDF(2)) D CHK60
 S OCXDF(40)=$G(OCXPSM) I $L(OCXDF(40)) D CHK163^OCXOZ07
 S OCXDF(47)=$P($P($G(OCXPSD),"|",3),"^",5) I $L(OCXDF(47)) D CHK188^OCXOZ08
 S OCXDF(131)=$P($P($G(OCXPSD),"|",3),"^",4) I $L(OCXDF(131)) S OCXDF(37)=$G(DFN) I $L(OCXDF(37)) D CHK348^OCXOZ0B
 S OCXDF(73)=$P($G(OCXPSD),"|",1) I $L(OCXDF(73)) S OCXDF(143)=$P($$DMED64(OCXDF(73)),"^",2) I $L(OCXDF(143)) D CHK407^OCXOZ0D
 S OCXDF(37)=$G(DFN) I $L(OCXDF(37)) D CHK455^OCXOZ0E
 Q
 ;
CHK60 ; Look through the current environment for valid Event/Elements for this patient.
 ;  Called from CHK58+17.
 ;
 Q:$G(OCXOERR)
 ;
 ;    Local CHK60 Variables
 ; OCXDF(2) ----> Data Field: FILLER (FREE TEXT)
 ;
 ;      Local Extrinsic Functions
 ; FILE(DFN,135, ----> FILE DATA IN PATIENT ACTIVE DATA FILE  (Event/Element: DIET ORDER)
 ; FILE(DFN,137, ----> FILE DATA IN PATIENT ACTIVE DATA FILE  (Event/Element: PHARMACY ORDER)
 ; FILE(DFN,28, -----> FILE DATA IN PATIENT ACTIVE DATA FILE  (Event/Element: RADIOLOGY ORDER)
 ;
 I (OCXDF(2)="RA") S OCXOERR=$$FILE(DFN,28,"") Q:OCXOERR 
 I (OCXDF(2)="FH") S OCXOERR=$$FILE(DFN,135,"") Q:OCXOERR 
 I ($E(OCXDF(2),1,2)="PS") S OCXOERR=$$FILE(DFN,137,"") Q:OCXOERR 
 Q
 ;
CHK87 ; Look through the current environment for valid Event/Elements for this patient.
 ;  Called from CHK23+16^OCXOZ03.
 ;
 Q:$G(OCXOERR)
 ;
 ;    Local CHK87 Variables
 ; OCXDF(90) ---> Data Field: PATIENT MOVEMENT WARD CURRENT (FREE TEXT)
 ; OCXDF(91) ---> Data Field: PATIENT MOVEMENT SERVICE CURRENT (FREE TEXT)
 ; OCXDF(92) ---> Data Field: PATIENT MOVEMENT WARD IEN CURRENT (NUMERIC)
 ;
 ;      Local Extrinsic Functions
 ; POINTER( ---------> RETURN POINTED TO VALUE
 ; WARDSERV( --------> GET WARD SERVICE
 ;
 I $L(OCXDF(92)) S OCXDF(91)=$$WARDSERV(OCXDF(92)) I $L(OCXDF(91)),($L(OCXDF(91))>0),'(OCXDF(91)="PSYCHIATRY") S OCXDF(90)=$$POINTER(42,$P($G(DGPMA),"^",6)) D CHK93
 Q
 ;
CHK93 ; Look through the current environment for valid Event/Elements for this patient.
 ;  Called from CHK87+14.
 ;
 Q:$G(OCXOERR)
 ;
 ;    Local CHK93 Variables
 ; OCXDF(95) ---> Data Field: PATIENT MOVEMENT WARD PREVIOUS (FREE TEXT)
 ;
 ;      Local Extrinsic Functions
 ; FILE(DFN,42, -----> FILE DATA IN PATIENT ACTIVE DATA FILE  (Event/Element: PATIENT TRANSFERRED FROM PSYCH WARD)
 ; POINTER( ---------> RETURN POINTED TO VALUE
 ;
 S OCXDF(95)=$$POINTER(42,$P($G(DGPM0),"^",6)),OCXOERR=$$FILE(DFN,42,"90,95") Q:OCXOERR 
 Q
 ;
DMED64(OCXOI)   ;ext func rtns med oi^med name if OCXOI is dangerous
 N OCXTL,OCXT,OCXDM
 Q:'$$TERMLKUP("DANGEROUS MEDS FOR PTS > 64",.OCXTL) "0^"
 S OCXDM="",OCXT=0 F  S OCXT=$O(OCXTL(OCXT)) Q:'OCXT  D  Q:$L(OCXDM)
 .I OCXT=OCXOI S OCXDM=OCXT_"^"_OCXTL(OCXT)
 Q:'$L(OCXDM) "0^"
 Q OCXDM
 ;
FILE(DFN,OCXELE,OCXDFL) ;     This Local Extrinsic Function logs a validated event/element.
 ;
 N OCXTIMN,OCXTIML,OCXTIMT1,OCXTIMT2,OCXDATA,OCXPC,OCXPC,OCXVAL,OCXSUB,OCXDFI
 S DFN=+$G(DFN),OCXELE=+$G(OCXELE)
 ;
 Q:'DFN 1 Q:'OCXELE 1 K OCXDATA
 ;
 S OCXDATA(DFN,OCXELE)=1
 F OCXPC=1:1:$L(OCXDFL,",") S OCXDFI=$P(OCXDFL,",",OCXPC) I OCXDFI D
 .S OCXVAL=$G(OCXDF(+OCXDFI)),OCXDATA(DFN,OCXELE,+OCXDFI)=OCXVAL
 ;
 M ^TMP("OCXCHK",$J,DFN)=OCXDATA(DFN)
 ;
 Q 0
 ;
LIST(DATA,LIST) ;   IS THE DATA FIELD IN THE LIST
 ;
 S:'($E(LIST,1)=",") LIST=","_LIST S:'($E(LIST,$L(LIST))=",") LIST=LIST_"," S DATA=","_DATA_","
 Q (LIST[DATA)
 ;
ORDITEM(OIEN) ;  Compiler Function: GET ORDERABLE ITEM FROM ORDER NUMBER
 Q:'$G(OIEN) ""
 ;
 N OITXT,X S OITXT=$$OI^ORQOR2(OIEN) Q:'OITXT "No orderable item found."
 S X=$G(^ORD(101.43,+OITXT,0)) Q:'$L(X) "No orderable item found."
 Q $P(X,U,1)
 ;
PATLOC(DFN) ;  Compiler Function: PATIENT LOCATION
 ;
 N OCXP1,OCXP2
 S OCXP1=$G(^TMP("OCXSWAP",$J,"OCXODATA","PV1",2))
 S OCXP2=$P($G(^TMP("OCXSWAP",$J,"OCXODATA","PV1",3)),"^",1)
 I OCXP2 D
 .S OCXP2=$P($G(^SC(+OCXP2,0)),"^",1,2)
 .I $L($P(OCXP2,"^",2)) S OCXP2=$P(OCXP2,"^",2)
 .E  S OCXP2=$P(OCXP2,"^",1)
 .S:'$L(OCXP2) OCXP2="NO LOC"
 I $L(OCXP1),$L(OCXP2) Q OCXP1_"^"_OCXP2
 ;
 S OCXP2=$G(^DPT(+$G(DFN),.1))
 I $L(OCXP2) Q "I^"_OCXP2
 Q "O^OUTPT"
 ;
POINTER(OCXFILE,D0) ;    This Local Extrinsic Function gets the value of the name field
 ;  of record D0 in file OCXFILE
 Q:'$G(D0) "" Q:'$L($G(OCXFILE)) ""
 N GLREF
 I '(OCXFILE=(+OCXFILE)) S GLREF=U_OCXFILE
 E  S GLREF=$$FILE^OCXBDTD(+OCXFILE,"GLOBAL NAME") Q:'$L(GLREF) ""
 Q $P($G(@(GLREF_(+D0)_",0)")),U,1)
 ;
TERMLKUP(OCXTERM,OCXLIST) ;
 Q $$TERM^OCXOZ01(OCXTERM,.OCXLIST)
 ;
WARDSERV(WARD) ;  Compiler Function: GET WARD SERVICE
 ;
 N CODESET,PC,SERV,DIC,X,Y,DA
 S CODESET="M:MEDICINE;S:SURGERY;P:PSYCHIATRY;NH:NHCU;NE:NEUROLOGY;I:INTERMEDIATE MED;R:REHAB MEDICINE;SCI:SPINAL CORD INJURY;D:DOMICILIARY;B:BLIND REHAB;NC:NON-COUNT"
 S DIC=42,DIC(0)="NZ",X="`"_(+WARD) D ^DIC Q:(Y<1) ""
 S SERV=$P($G(Y(0)),U,3)
 Q:'$L(SERV) "" Q:'$L(CODESET) ""
 F PC=1:1:$L(CODESET,";"),0 I PC,($P($P(CODESET,";",PC),":",1)=SERV) Q
 Q:'PC "" Q $P($P(CODESET,";",PC),":",2)
 ;
