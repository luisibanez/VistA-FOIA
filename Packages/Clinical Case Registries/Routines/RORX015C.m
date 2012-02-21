RORX015C ;HCIOFO/SG - PROCEDURES (STORE) ; 10/27/05 11:30am
 ;;1.5;CLINICAL CASE REGISTRIES;;Feb 17, 2006
 ;
 ; This routine uses the following IAs:
 ;
 ; #1995         $$CPT^ICPTCOD (supported)
 ;
 Q
 ;
 ;***** STORES THE CPT CODE TABLE
 ;
 ; PTAG          IEN of the parent element
 ;
 ; NODE          Closed root of the node of the temporary global
 ;
 ; Return Values:
 ;       <0  Error code
 ;        0  Ok
 ;       >0  Number of non-fatal errors
 ;
CODES(PTAG,NODE) ;
 N CPTIEN,ITEM,TABLE,TMP
 S TABLE=$$ADDVAL^RORTSK11(RORTSK,"CPTLST",,PTAG)
 Q:TABLE<0 TABLE
 D ADDATTR^RORTSK11(RORTSK,TABLE,"TABLE","CPTLST")
 S CPTIEN=0
 F  S CPTIEN=$O(@NODE@("CPT",CPTIEN))  Q:CPTIEN'>0  D
 . S ITEM=$$ADDVAL^RORTSK11(RORTSK,"CPT",,TABLE)
 . S TMP=@NODE@("CPT",CPTIEN)
 . D ADDVAL^RORTSK11(RORTSK,"CODE",$P(TMP,U,1),ITEM,2)
 . D ADDVAL^RORTSK11(RORTSK,"DESCR",$P(TMP,U,2),ITEM,2)
 . S TMP=$G(@NODE@("CPT",CPTIEN,"P"))
 . D ADDVAL^RORTSK11(RORTSK,"NP",TMP,ITEM,3)
 . S TMP=$G(@NODE@("CPT",CPTIEN,"C"))
 . D ADDVAL^RORTSK11(RORTSK,"NC",TMP,ITEM,3)
 Q 0
 ;
 ;***** STORES THE PATIENT TABLE
 ;
 ; PTAG          IEN of the parent element
 ;
 ; NODE          Closed root of the node of the temporary global
 ;
 ; Return Values:
 ;       <0  Error code
 ;        0  Ok
 ;       >0  Number of non-fatal errors
 ;
PATIENTS(PTAG,NODE) ;
 N DATE,CPT,CPTIEN,ITEM,PATIEN,PTCPTL,SOURCE,TABLE,TMP
 S TABLE=$$ADDVAL^RORTSK11(RORTSK,"PATIENTS",,PTAG)
 Q:TABLE<0 TABLE
 D ADDATTR^RORTSK11(RORTSK,TABLE,"TABLE","PATIENTS")
 S PATIEN=0
 F  S PATIEN=$O(@NODE@("PAT",PATIEN))  Q:PATIEN'>0  D
 . S ITEM=$$ADDVAL^RORTSK11(RORTSK,"PATIENT",,TABLE)
 . S TMP=@NODE@("PAT",PATIEN)
 . D ADDVAL^RORTSK11(RORTSK,"NAME",$P(TMP,U,2),ITEM,2)
 . D ADDVAL^RORTSK11(RORTSK,"LAST4",$P(TMP,U,1),ITEM,2)
 . D ADDVAL^RORTSK11(RORTSK,"DOD",$P(TMP,U,3),ITEM,1)
 . S PTCPTL=$$ADDVAL^RORTSK11(RORTSK,"PTCPTL",,ITEM)
 . S CPTIEN=0
 . F  S CPTIEN=$O(@NODE@("PAT",PATIEN,CPTIEN))  Q:CPTIEN'>0  D
 . . S CPT=$$ADDVAL^RORTSK11(RORTSK,"CPT",,PTCPTL)
 . . S TMP=$G(@NODE@("PAT",PATIEN,CPTIEN))
 . . S DATE=$P(TMP,U),SOURCE=$P(TMP,U,2)
 . . S TMP=$$CPT^ICPTCOD(CPTIEN,DATE)
 . . S:TMP<0 TMP=""
 . . D ADDVAL^RORTSK11(RORTSK,"CODE",$P(TMP,U,2),CPT,2)
 . . D ADDVAL^RORTSK11(RORTSK,"DESCR",$P(TMP,U,3),CPT,2)
 . . D ADDVAL^RORTSK11(RORTSK,"DATE",$$DATE^RORXU002(DATE\1),CPT,1)
 . . D ADDVAL^RORTSK11(RORTSK,"SOURCE",SOURCE,CPT,2)
 Q 0
 ;
 ;***** STORES THE REPORT DATA
 ;
 ; REPORT        IEN of the REPORT element
 ;
 ; Return Values:
 ;       <0  Error code
 ;        0  Ok
 ;       >0  Number of non-fatal errors
 ;
STORE(REPORT) ;
 N ECNT,PATIEN,RC,SECTION,TMP
 S (ECNT,RC)=0
 ;--- CPT codes
 S RC=$$CODES(REPORT,RORTMP)
 I RC  Q:RC<0 RC  S ECNT=ECNT+RC
 S RC=$$LOOP^RORTSK01(.3)  Q:RC<0 RC
 ;--- Patients
 S TMP=$$PARAM^RORTSK01("OPTIONS","COMPLETE")
 I TMP  D  I RC  Q:RC<0 RC  S ECNT=ECNT+RC
 . S RC=$$PATIENTS(REPORT,RORTMP)
 S RC=$$LOOP^RORTSK01(.99)  Q:RC<0 RC
 ;--- Totals
 S SECTION=$$ADDVAL^RORTSK11(RORTSK,"SUMMARY",,REPORT)
 Q:SECTION<0 SECTION
 S TMP=$G(@RORTMP@("CPT"))
 D ADDVAL^RORTSK11(RORTSK,"NC",+$P(TMP,U,1),SECTION)
 D ADDVAL^RORTSK11(RORTSK,"NDC",+$P(TMP,U,2),SECTION)
 S TMP=$G(@RORTMP@("PAT"))
 D ADDVAL^RORTSK11(RORTSK,"NP",+TMP,SECTION)
 ;---
 Q ECNT
