OCXOZ03 ;SLC/RJS,CLA - Order Check Scan ;OCT 20,2005 at 22:40
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**32,221**;Dec 17,1997
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
CHK12 ; Look through the current environment for valid Event/Elements for this patient.
 ;  Called from CHK1+26^OCXOZ02.
 ;
 Q:$G(OCXOERR)
 ;
 ;    Local CHK12 Variables
 ; OCXDF(1) ----> Data Field: CONTROL CODE (FREE TEXT)
 ; OCXDF(2) ----> Data Field: FILLER (FREE TEXT)
 ; OCXDF(34) ---> Data Field: ORDER NUMBER (NUMERIC)
 ; OCXDF(37) ---> Data Field: PATIENT IEN (NUMERIC)
 ; OCXDF(105) --> Data Field: ORDER TEXT (51 CHARS) (FREE TEXT)
 ; OCXDF(146) --> Data Field: INPT/OUTPT (FREE TEXT)
 ; OCXDF(147) --> Data Field: PATIENT LOCATION (FREE TEXT)
 ; OCXDF(148) --> Data Field: FOOD-DRUG INTERACTION MED (BOOLEAN)
 ;
 ;      Local Extrinsic Functions
 ; FILE(DFN,126, ----> FILE DATA IN PATIENT ACTIVE DATA FILE  (Event/Element: HL7 DCED OERR ORDER)
 ; FILE(DFN,20, -----> FILE DATA IN PATIENT ACTIVE DATA FILE  (Event/Element: HL7 LAB ORDER CANCELLED)
 ; FILE(DFN,30, -----> FILE DATA IN PATIENT ACTIVE DATA FILE  (Event/Element: RADIOLOGY ORDER PUT ON-HOLD)
 ; FILE(DFN,31, -----> FILE DATA IN PATIENT ACTIVE DATA FILE  (Event/Element: RADIOLOGY ORDER CANCELLED)
 ; FILE(DFN,32, -----> FILE DATA IN PATIENT ACTIVE DATA FILE  (Event/Element: RADIOLOGY ORDER DISCONTINUED)
 ; FILE(DFN,40, -----> FILE DATA IN PATIENT ACTIVE DATA FILE  (Event/Element: HL7 LAB REQUEST CANCELLED)
 ; FILE(DFN,6, ------> FILE DATA IN PATIENT ACTIVE DATA FILE  (Event/Element: HL7 NEW OERR ORDER)
 ; FOODDRG( ---------> FOOD-DRUG INTERACTION MED
 ; LIST( ------------> IN LIST OPERATOR
 ; PATLOC( ----------> PATIENT LOCATION
 ;
 I $$LIST(OCXDF(1),"NW,SN,XR"),$L(OCXDF(37)) S OCXDF(147)=$P($$PATLOC(OCXDF(37)),"^",2),OCXOERR=$$FILE(DFN,6,"147") Q:OCXOERR 
 I (OCXDF(1)="OC"),$L(OCXDF(2)),($E(OCXDF(2),1,2)="LR"),$L(OCXDF(34)) S OCXDF(105)=$P($$TEXT^ORKOR(OCXDF(34),51),"^",2),OCXOERR=$$FILE(DFN,20,"105") Q:OCXOERR 
 I (OCXDF(1)="OH"),$L(OCXDF(2)),(OCXDF(2)="RA"),$L(OCXDF(34)) S OCXDF(105)=$P($$TEXT^ORKOR(OCXDF(34),51),"^",2),OCXOERR=$$FILE(DFN,30,"105") Q:OCXOERR 
 I (OCXDF(1)="OD"),$L(OCXDF(2)),(OCXDF(2)="RA"),$L(OCXDF(34)) S OCXDF(105)=$P($$TEXT^ORKOR(OCXDF(34),51),"^",2),OCXOERR=$$FILE(DFN,31,"105") Q:OCXOERR 
 I (OCXDF(1)="DC"),$L(OCXDF(2)),(OCXDF(2)="RA"),$L(OCXDF(34)) S OCXDF(105)=$P($$TEXT^ORKOR(OCXDF(34),51),"^",2),OCXOERR=$$FILE(DFN,32,"105") Q:OCXOERR 
 I (OCXDF(1)="CA"),$L(OCXDF(2)),($E(OCXDF(2),1,2)="LR"),$L(OCXDF(34)) S OCXDF(105)=$P($$TEXT^ORKOR(OCXDF(34),51),"^",2),OCXOERR=$$FILE(DFN,40,"105") Q:OCXOERR 
 I $$LIST(OCXDF(1),"NW,SN,XO"),$L(OCXDF(37)) S OCXDF(146)=$P($$PATLOC(OCXDF(37)),"^",1) I $L(OCXDF(146)),$L(OCXDF(34)) D CHK131^OCXOZ07
 I $$LIST(OCXDF(1),"NW,SN"),$L(OCXDF(34)) S OCXDF(148)=$P($$FOODDRG(OCXDF(34)),"^",1) I $L(OCXDF(148)),(OCXDF(148)),$L(OCXDF(37)) D CHK269^OCXOZ0B
 I $$LIST(OCXDF(1),"DC,CA,OD,OC"),$L(OCXDF(37)) S OCXDF(147)=$P($$PATLOC(OCXDF(37)),"^",2),OCXOERR=$$FILE(DFN,126,"147") Q:OCXOERR 
 Q
 ;
CHK23 ; Look through the current environment for valid Event/Elements for this patient.
 ;  Called from UPDATE+11^OCXOZ01.
 ;
 Q:$G(OCXOERR)
 ;
 ;    Local CHK23 Variables
 ; OCXDF(25) ---> Data Field: PATIENT MOVEMENT TYPE CURRENT (FREE TEXT)
 ; OCXDF(92) ---> Data Field: PATIENT MOVEMENT WARD IEN CURRENT (NUMERIC)
 ; OCXDF(93) ---> Data Field: PATIENT MOVEMENT WARD IEN PREVIOUS (NUMERIC)
 ; OCXDF(94) ---> Data Field: PATIENT MOVEMENT SERVICE PREVIOUS (FREE TEXT)
 ;
 ;      Local Extrinsic Functions
 ; POINTER( ---------> RETURN POINTED TO VALUE
 ; WARDSERV( --------> GET WARD SERVICE
 ;
 S OCXDF(25)=$$POINTER(405.3,$P($G(DGPMA),"^",2)) I $L(OCXDF(25)) D CHK25^OCXOZ04
 S OCXDF(93)=$P($G(DGPM0),"^",6) I $L(OCXDF(93)) S OCXDF(94)=$$WARDSERV(OCXDF(93)) I $L(OCXDF(94)),(OCXDF(94)="PSYCHIATRY") S OCXDF(92)=$P($G(DGPMA),"^",6) D CHK87^OCXOZ05
 Q
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
FOODDRG(OCXOR) ;func rtns 1^<med name> if OCXOR is food-drug med
 N OCXTL,OCXT,OCXFD,OCXOI
 S OCXOI=$$OI(OCXOR)
 Q:'$L(OCXOI) "0^"
 Q:'$$TERMLKUP("FOOD-DRUG INTERACTION MED",.OCXTL) "0^"
 S OCXFD="",OCXT=0 F  S OCXT=$O(OCXTL(OCXT)) Q:'OCXT  D  Q:$L(OCXFD)
 .I OCXT=OCXOI S OCXFD="1^"_OCXTL(OCXT)
 Q:'$L(OCXFD) "0^"
 Q OCXFD
 ;
LIST(DATA,LIST) ;   IS THE DATA FIELD IN THE LIST
 ;
 S:'($E(LIST,1)=",") LIST=","_LIST S:'($E(LIST,$L(LIST))=",") LIST=LIST_"," S DATA=","_DATA_","
 Q (LIST[DATA)
 ;
OI(OCXOR) ;func rtns orderable item for an order number (OCXOR)
 Q:+$G(OCXOR)<1 ""
 N OCXOI S OCXOI=""
 S OCXOI=+$G(^OR(100,+$G(OCXOR),.1,1,0))
 Q OCXOI
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
