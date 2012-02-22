OCXOZ04 ;SLC/RJS,CLA - Order Check Scan ;APR 17,2009 at 14:23
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**32,221,243**;Dec 17,1997;Build 242
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
CHK25 ; Look through the current environment for valid Event/Elements for this patient.
 ;  Called from CHK23+15^OCXOZ03.
 ;
 Q:$G(OCXOERR)
 ;
 ;    Local CHK25 Variables
 ; OCXDF(25) ---> Data Field: PATIENT MOVEMENT TYPE CURRENT (FREE TEXT)
 ; OCXDF(26) ---> Data Field: PATIENT MOVEMENT DATE CURRENT (DATE/TIME)
 ; OCXDF(97) ---> Data Field: NEW PATIENT MOVEMENT (BOOLEAN)
 ;
 ;      Local Extrinsic Functions
 ; DT2INT( ----------> CONVERT DATE FROM FILEMAN FORMAT TO OCX FORMAT
 ; FILE(DFN,56, -----> FILE DATA IN PATIENT ACTIVE DATA FILE  (Event/Element: PATIENT DISCHARGE)
 ;
 I (OCXDF(25)="ADMISSION") S OCXDF(97)=('(+$G(DGPMA)=+$G(DGPM0))&'$L(DGPMP)) I $L(OCXDF(97)),(OCXDF(97)) S OCXDF(26)=$$DT2INT($P($G(DGPMA),"^",1)) D CHK30
 I (OCXDF(25)="DISCHARGE") S OCXDF(26)=$$DT2INT($P($G(DGPMA),"^",1)),OCXOERR=$$FILE(DFN,56,"26") Q:OCXOERR 
 Q
 ;
CHK30 ; Look through the current environment for valid Event/Elements for this patient.
 ;  Called from CHK25+14.
 ;
 Q:$G(OCXOERR)
 ;
 ;    Local CHK30 Variables
 ; OCXDF(37) ---> Data Field: PATIENT IEN (NUMERIC)
 ; OCXDF(83) ---> Data Field: PATIENT WARD ROOM-BED (FREE TEXT)
 ;
 ;      Local Extrinsic Functions
 ; FILE(DFN,21, -----> FILE DATA IN PATIENT ACTIVE DATA FILE  (Event/Element: PATIENT ADMISSION)
 ; WARDRMBD( --------> WARD ROOM-BED
 ;
 S OCXDF(37)=$G(DFN) I $L(OCXDF(37)) S OCXDF(83)=$P($$WARDRMBD(OCXDF(37)),"^",2),OCXOERR=$$FILE(DFN,21,"26,83") Q:OCXOERR 
 Q
 ;
CHK34 ; Look through the current environment for valid Event/Elements for this patient.
 ;  Called from CHK1+28^OCXOZ02.
 ;
 Q:$G(OCXOERR)
 ;
 ;    Local CHK34 Variables
 ; OCXDF(1) ----> Data Field: CONTROL CODE (FREE TEXT)
 ; OCXDF(2) ----> Data Field: FILLER (FREE TEXT)
 ; OCXDF(6) ----> Data Field: ABNORMAL FLAG (FREE TEXT)
 ; OCXDF(23) ---> Data Field: REQUEST STATUS (OBR) (FREE TEXT)
 ; OCXDF(34) ---> Data Field: ORDER NUMBER (NUMERIC)
 ;
 ;      Local Extrinsic Functions
 ; LIST( ------------> IN LIST OPERATOR
 ;
 I $$LIST(OCXDF(6),"H,L") D CHK35
 I $$LIST(OCXDF(6),"HH,LL"),$L(OCXDF(23)),$$LIST(OCXDF(23),"F,C"),$L(OCXDF(1)),$$LIST(OCXDF(1),"RE"),$L(OCXDF(2)),($E(OCXDF(2),1,2)="LR"),$L(OCXDF(34)) D CHK324^OCXOZ0C
 Q
 ;
CHK35 ; Look through the current environment for valid Event/Elements for this patient.
 ;  Called from CHK34+15.
 ;
 Q:$G(OCXOERR)
 ;
 ;    Local CHK35 Variables
 ; OCXDF(1) ----> Data Field: CONTROL CODE (FREE TEXT)
 ; OCXDF(2) ----> Data Field: FILLER (FREE TEXT)
 ; OCXDF(15) ---> Data Field: RESULT STATUS (OBX) (FREE TEXT)
 ; OCXDF(23) ---> Data Field: REQUEST STATUS (OBR) (FREE TEXT)
 ; OCXDF(34) ---> Data Field: ORDER NUMBER (NUMERIC)
 ; OCXDF(96) ---> Data Field: ORDERABLE ITEM NAME (FREE TEXT)
 ;
 ;      Local Extrinsic Functions
 ; LIST( ------------> IN LIST OPERATOR
 ; ORDITEM( ---------> GET ORDERABLE ITEM FROM ORDER NUMBER
 ;
 I $L(OCXDF(23)),$$LIST(OCXDF(23),"F,C"),$L(OCXDF(1)),$$LIST(OCXDF(1),"RE"),$L(OCXDF(2)),($E(OCXDF(2),1,2)="LR"),$L(OCXDF(34)) S OCXDF(96)=$$ORDITEM(OCXDF(34)) D CHK43
 I $L(OCXDF(15)),$$LIST(OCXDF(15),"F,C"),$L(OCXDF(1)),$$LIST(OCXDF(1),"RE"),$L(OCXDF(2)),($E(OCXDF(2),1,2)="LR"),$L(OCXDF(34)) S OCXDF(96)=$$ORDITEM(OCXDF(34)) D CHK314^OCXOZ0C
 Q
 ;
CHK43 ; Look through the current environment for valid Event/Elements for this patient.
 ;  Called from CHK35+17.
 ;
 Q:$G(OCXOERR)
 ;
 ;    Local CHK43 Variables
 ; OCXDF(113) --> Data Field: LAB TEST ID (NUMERIC)
 ; OCXDF(114) --> Data Field: LAB TEST PRINT NAME (FREE TEXT)
 ;
 ;      Local Extrinsic Functions
 ; FILE(DFN,23, -----> FILE DATA IN PATIENT ACTIVE DATA FILE  (Event/Element: HL7 LAB ORDER RESULTS ABNORMAL)
 ;
 I $L(OCXDF(113)) S OCXDF(114)=$$PRINTNAM^ORQQLR1(OCXDF(113)),OCXOERR=$$FILE(DFN,23,"12,13,96,114") Q:OCXOERR 
 Q
 ;
DT2INT(OCXDT) ;      This Local Extrinsic Function converts a date into an integer
 ; By taking the Years, Months, Days, Hours and Minutes converting
 ; Them into Seconds and then adding them all together into one big integer
 ;
 Q:'$L($G(OCXDT)) ""
 N OCXDIFF,OCXVAL S (OCXDIFF,OCXVAL)=0
 ;
 I $L(OCXDT),'OCXDT,(OCXDT[" at ") D  ; EXTERNAL EXPERT SYSTEM FORMAT 1 TO EXTERNAL FORMAT
 .N OCXHR,OCXMIN,OCXTIME
 .S OCXTIME=$P($P(OCXDT," at ",2),".",1),OCXHR=$P(OCXTIME,":",1),OCXMIN=$P(OCXTIME,":",2)
 .S:(OCXDT["Midnight") OCXHR=00
 .S:(OCXDT["PM") OCXHR=OCXHR+12
 .S OCXDT=$P(OCXDT," at ")_"@"_$E(OCXHR+100,2,3)_$E(OCXMIN+100,2,3)
 ;
 I $L(OCXDT),(OCXDT?1.2N1"/"1.2N.1" ".2N.1":".2N) D  ; EXTERNAL EXPERT SYSTEM FORMAT 2 TO EXTERNAL FORMAT
 .N OCXMON
 .S OCXMON=$P("January^February^March^April^May^June^July^August^September^October^November^December",U,$P(OCXDT,"/",1))
 .I $L($P(OCXDT," ",2)) S OCXDT=OCXMON_" "_$P($P(OCXDT," ",1),"/",2)_"@"_$TR($P(OCXDT," ",2),":","")
 .E  S OCXDT=OCXMON_" "_$P($P(OCXDT," ",1),"/",2)
 ;
 I $L(OCXDT),(OCXDT?1.2N1"/"1.2N1"/"1.2N.1" ".2N.1":".2N) D  ; EXTERNAL EXPERT SYSTEM FORMAT 3 TO EXTERNAL FORMAT
 .N OCXMON
 .S OCXMON=$P("January^February^March^April^May^June^July^August^September^October^November^December",U,$P(OCXDT,"/",1))
 .I $L($P(OCXDT," ",2)) S OCXDT=OCXMON_" "_$P($P(OCXDT," ",1),"/",2)_","_$P($P(OCXDT," ",1),"/",3)_"@"_$TR($P(OCXDT," ",2),":","")
 .E  S OCXDT=OCXMON_" "_$P($P(OCXDT," ",1),"/",2)_", "_$P($P(OCXDT," ",1),"/",3)
 ;
 I $L(OCXDT),'OCXDT D  ; EXTERNAL FORMAT TO INTERNAL FILEMAN FORMAT
 .I (OCXDT["@0000") S OCXDT=$P(OCXDT,"@",1),OCXDIFF=1
 .N %DT,X,Y S X=OCXDT,%DT="" S:(OCXDT["@")!(OCXDT="N") %DT="T" D ^%DT S OCXDT=+Y
 ;
 I ($L(OCXDT\1)>7) S OCXDT=$$HL7TFM^XLFDT(OCXDT)  ; HL7 FORMAT TO INTERNAL FILEMAN FORMAT
 ;
 I ($L(OCXDT\1)=7) S OCXDT=$$FMTH^XLFDT(+OCXDT)   ; INTERNAL FILEMAN FORMAT TO $H FORMAT
 ;
 I (OCXDT?5N1","1.5N) S OCXVAL=(OCXDT*86400)+$P(OCXDT,",",2)     ;  $H FORMAT TO EXPERT SYSTEM INTERNAL FORMAT
 ;
 Q OCXVAL
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
WARDRMBD(DFN) ;  Compiler Function: WARD ROOM-BED
 ;
 Q:'$G(DFN) 0
 N OUT S OUT=$G(^DPT(DFN,.1)) Q:'$L(OUT) 0
 S OUT=1_"^"_OUT_" "_$G(^DPT(DFN,.101)) Q OUT
 ;
