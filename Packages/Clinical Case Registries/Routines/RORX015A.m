RORX015A ;HCIOFO/SG - PROCEDURES (QUERY & SORT) ; 10/27/05 11:29am
 ;;1.5;CLINICAL CASE REGISTRIES;;Feb 17, 2006
 ;
 ; This routine uses the following IAs:
 ;
 ; #1995         $$CODEN^ICPTCOD and $$CPT^ICPTCOD (supported)
 ;
 Q
 ;
 ;**** STORES THE CPT CODE
 ;
 ; PTIEN         Patient IEN (DFN)
 ; SOURCE        CPT source code ("I", "O")
 ; [CPTIEN]      IEN of the CPT descriptor in file #81
 ; DATE          Date when the code was entered
 ; [CPT]         CPT code
 ;
 ; Either the CPTIEN or the CPT parameter must be provided.
 ;
CPTSET(PTIEN,SOURCE,CPTIEN,DATE,CPT) ;
 Q:DATE'>0
 N TMP
 S CPTIEN=+$G(CPTIEN)
 I CPTIEN'>0  Q:$G(CPT)=""  D  Q:CPTIEN'>0
 . S CPTIEN=+$$CODEN^ICPTCOD(CPT)
 I '$$PARAM^RORTSK01("CPTLST","ALL")  D  Q:'TMP
 . S TMP=$D(RORTSK("PARAMS","CPTLST","C",CPTIEN))
 ;---
 S TMP=+$G(@RORTMP@("PAT",PTIEN,CPTIEN))
 S:'TMP!(DATE<TMP) @RORTMP@("PAT",PTIEN,CPTIEN)=DATE_U_SOURCE
 S ^(SOURCE)=$G(@RORTMP@("PAT",PTIEN,CPTIEN,SOURCE))+1
 Q
 ;
 ;***** SEARCHES FOR INPATIENT PROCEDURES
 ;
 ; PATIEN        Patient IEN (DFN)
 ;
 ; Return Values:
 ;       <0  Error code
 ;        0  Ok
 ;
INPAT(PATIEN) ;
 N RC
 S RC=0
 Q $S(RC<0:RC,1:0)
 ;
 ;***** CALL-BACK PROCEDURE FOR THE OUTPATIENT SEARCH
 ;
 ; PATIEN        Patient IEN (DFN)
 ;
OPSCAN(PTIEN) ;
 N CPTIEN,DATE,IEN,RORCPT,VDATE
 D GETCPT^SDOE(Y,"RORCPT")
 Q:$G(RORCPT)'>0
 S VDATE=+$P(Y0,U)
 ;---
 S IEN=0
 F  S IEN=$O(RORCPT(IEN))  Q:IEN'>0  D
 . S CPTIEN=+$P(RORCPT(IEN),U),DATE=+$P($G(RORCPT(IEN,12)),U)
 . D:CPTIEN>0 CPTSET(PTIEN,"O",CPTIEN,$S(DATE>0:DATE,1:VDATE))
 Q
 ;
 ;***** SEARCHES FOR OUTPATIENT PROCEDURES
 ;
 ; PTIEN         Patient IEN (DFN)
 ;
 ; Return Values:
 ;       <0  Error code
 ;        0  Ok
 ;
OUTPAT(PTIEN) ;
 N QUERY
 D OPEN^SDQ(.QUERY)
 D INDEX^SDQ(.QUERY,"PATIENT/DATE","SET")
 D PAT^SDQ(.QUERY,PTIEN,"SET")
 D DATE^SDQ(.QUERY,RORSDT,ROREDT1,"SET")
 D SCANCB^SDQ(.QUERY,"D OPSCAN^RORX015A("_PTIEN_")","SET")
 D ACTIVE^SDQ(.QUERY,"TRUE","SET")
 D SCAN^SDQ(.QUERY,"FORWARD")
 D CLOSE^SDQ(.QUERY)
 Q 0
 ;
 ;***** QUERIES THE REGISTRY
 ;
 ; FLAGS         Flags for the $$SKIP^RORXU005
 ;
 ; Return Values:
 ;       <0  Error code
 ;        0  Ok
 ;       >0  Number of non-fatal errors
 ;
QUERY(FLAGS) ;
 N ROREDT1       ; Day after the end date
 N RORPTN        ; Number of patients in the registry
 ;
 N CNT,ECNT,IEN,IENS,PATIEN,RC,TMP,XREFNODE
 S XREFNODE=$NA(^RORDATA(798,"AC",+RORREG))
 S RORPTN=$$REGSIZE^RORUTL02(+RORREG)  S:RORPTN<0 RORPTN=0
 S ROREDT1=$$FMADD^XLFDT(ROREDT\1,1)
 S (CNT,ECNT,RC)=0
 ;
 ;=== Browse through the registry records
 S IEN=0
 F  S IEN=$O(@XREFNODE@(IEN))  Q:IEN'>0  D  Q:RC<0
 . S TMP=$S(RORPTN>0:CNT/RORPTN,1:"")
 . S RC=$$LOOP^RORTSK01(TMP)  Q:RC<0
 . S IENS=IEN_",",CNT=CNT+1
 . ;--- Check if the patient should be skipped
 . Q:$$SKIP^RORXU005(IEN,FLAGS,RORSDT,ROREDT)
 . ;
 . ;--- Get the patient IEN (DFN)
 . S PATIEN=$$PTIEN^RORUTL01(IEN)  Q:PATIEN'>0
 . ;
 . ;--- Inpatient codes
 . ;S RC=$$INPAT(PATIEN)
 . ;I RC  Q:RC<0  S ECNT=ECNT+RC
 . ;
 . ;--- Outpatient codes
 . S RC=$$OUTPAT(PATIEN)
 . I RC  Q:RC<0  S ECNT=ECNT+RC
 . ;
 . ;--- Skip the patient if no data has been found
 . Q:$D(@RORTMP@("PAT",PATIEN))<10
 . ;
 . ;--- Calculate the patient's totals
 . S RC=$$TOTALS(PATIEN)
 . I RC  Q:RC<0  S ECNT=ECNT+RC
 ;---
 Q $S(RC<0:RC,1:ECNT)
 ;
 ;***** SORTS THE RESULTS AND COMPILES THE TOTALS
 ;
 ; Return Values:
 ;       <0  Error code
 ;        0  Ok
 ;       >0  Number of non-fatal errors
 ;
SORT() ;
 N CPTIEN,TMP,TNC,TNDC
 ;---
 S CPTIEN=0,(TNC,TNDC)=0
 F  S CPTIEN=$O(@RORTMP@("CPT",CPTIEN))  Q:CPTIEN'>0  D
 . S TNC=TNC+$G(@RORTMP@("CPT",CPTIEN,"C"))
 . S TNDC=TNDC+1
 S @RORTMP@("CPT")=TNC_U_TNDC
 ;---
 Q 0
 ;
 ;***** CALCULATES INTERMEDIATE TOTALS
 ;
 ; PATIEN        Patient IEN (DFN)
 ;
 ; Return Values:
 ;       <0  Error code
 ;        0  Ok
 ;       >0  Number of non-fatal errors
 ;
TOTALS(PATIEN) ;
 N CNT,CPT,CPTIEN,CPTNAME,PNODE,RC,TMP,VA,VADM
 S PNODE=$NA(@RORTMP@("PAT",PATIEN))
 ;--- Get and store the patient's data
 D VADEM^RORUTL05(PATIEN,1)
 S @PNODE=VA("BID")_U_VADM(1)_U_$$DATE^RORXU002(VADM(6)\1)
 S ^("PAT")=$G(@RORTMP@("PAT"))+1
 ;
 S CPTIEN=0
 F  S CPTIEN=$O(@PNODE@(CPTIEN))  Q:CPTIEN'>0  D
 . S CPT=$P($G(@RORTMP@("CPT",CPTIEN)),U)
 . D:CPT=""
 . . S TMP=$$CPT^ICPTCOD(CPTIEN)
 . . I TMP'<0  S CPT=$P(TMP,U,2),CPTNAME=$P(TMP,U,3)
 . . E  S CPTNAME=""
 . . S:CPT="" CPT="UNKN"
 . . S:CPTNAME="" CPTNAME="Unknown ("_CPTIEN_")"
 . . S @RORTMP@("CPT",CPTIEN)=CPT_U_CPTNAME
 . ;---
 . S CNT=0
 . F TMP="I","O"  S CNT=CNT+$G(@PNODE@(CPTIEN,TMP))
 . S @PNODE@(CPTIEN,"C")=CNT
 . S ^("C")=$G(@RORTMP@("CPT",CPTIEN,"C"))+CNT
 . S ^("P")=$G(@RORTMP@("CPT",CPTIEN,"P"))+1
 Q 0
