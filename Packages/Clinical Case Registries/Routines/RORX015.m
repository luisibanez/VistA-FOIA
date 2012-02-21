RORX015 ;HOIFO/SG - PROCEDURES (CPT) REPORT ; 10/26/05 9:46am
 ;;1.5;CLINICAL CASE REGISTRIES;;Feb 17, 2006
 ;
 Q
 ;
 ;***** OUTPUTS THE REPORT HEADER
 ;
 ; PARTAG        Reference (IEN) to the parent tag
 ;
 ; Return Values:
 ;       <0  Error code
 ;       >0  IEN of the HEADER element
 ;
HEADER(PARTAG) ;
 ;;CPTLST(#,CODE,DESCR,NP,NC)
 ;;PATIENTS(#,NAME,LAST4,DOD,PTCPTL(CODE,DESCR,DATE,SOURCE))
 ;
 N HEADER,RC
 S HEADER=$$HEADER^RORXU002(.RORTSK,PARTAG)
 Q:HEADER<0 HEADER
 S RC=$$TBLDEF^RORXU002("HEADER^RORX015",HEADER)
 Q $S(RC<0:RC,1:HEADER)
 ;
 ;
 ;***** COMPILES THE "PROCEDURES" REPORT
 ; REPORT CODE: 015
 ;
 ; .RORTSK       Task number and task parameters
 ;
 ; @RORTMP@(
 ;
 ;   "PAT",              Number of patients
 ;     DFN,              Descriptor
 ;                         ^01: Las 4 digits of SSN
 ;                         ^02: Name
 ;                         ^03: Date of Death
 ;       CPTIEN,         Earliest Code Descriptor
 ;                         ^01: Date
 ;                         ^02: Source ("I" or "O")
 ;         "C")          Quantity
 ;         "I")          Inpatient quantity
 ;         "O")          Outpatient quantity
 ;
 ;   "CPT",              Totals
 ;                         ^01: Number of CPT codes
 ;                         ^02: Number of different codes
 ;     CPTIEN,           CPT Descriptor
 ;                         ^01: Code
 ;                         ^02: Short description (current version)
 ;       "C")            Quantity
 ;       "P")            Number of unique patients
 ;
 ; Return Values:
 ;       <0  Error code
 ;        0  Ok
 ;
CPTLST(RORTSK) ;
 N ROREDT        ; End date
 N RORREG        ; Registry IEN
 N RORSDT        ; Start date
 N RORTMP        ; Closed root of the temporary buffer
 ;
 N ECNT,RC,REPORT,SFLAGS,TMP
 ;--- Root node of the report
 S REPORT=$$ADDVAL^RORTSK11(RORTSK,"REPORT")
 Q:REPORT<0 REPORT
 ;
 ;--- Get and prepare the report parameters
 S RORREG=$$PARAM^RORTSK01("REGIEN")
 S RC=$$PARAMS(REPORT,.RORSDT,.ROREDT,.SFLAGS)  Q:RC<0 RC
 ;
 ;--- Initialize constants and variables
 S (ECNT,RC)=0
 ;
 ;--- Report header
 S RC=$$HEADER(REPORT)  Q:RC<0 RC
 S RORTMP=$$ALLOC^RORTMP()
 D
 . ;--- Query the registry
 . D TPPSETUP^RORTSK01(70)
 . S RC=$$QUERY^RORX015A(SFLAGS)
 . I RC  Q:RC<0  S ECNT=ECNT+RC
 . ;--- Sort the data
 . D TPPSETUP^RORTSK01(10)
 . S RC=$$SORT^RORX015A()
 . I RC  Q:RC<0  S ECNT=ECNT+RC
 . ;--- Store the results
 . D TPPSETUP^RORTSK01(20)
 . S RC=$$STORE^RORX015C(REPORT)
 . I RC  Q:RC<0  S ECNT=ECNT+RC
 ;
 ;--- Cleanup
 D FREE^RORTMP(RORTMP)
 Q $S(RC<0:RC,ECNT>0:-43,1:0)
 ;
 ;***** OUTPUTS THE PARAMETERS TO THE REPORT
 ;
 ; PARTAG        Reference (IEN) to the parent tag
 ;
 ; [.STDT]       Start and end dates of the report
 ; [.ENDT]       are returned via these parameters
 ;
 ; [.FLAGS]      Flags for the $$SKIP^RORXU005 are
 ;               returned via this parameter
 ;
 ; Return Values:
 ;       <0  Error code
 ;       >0  IEN of the PARAMETERS element
 ;
PARAMS(PARTAG,STDT,ENDT,FLAGS) ;
 N PARAMS,TMP
 S PARAMS=$$PARAMS^RORXU002(.RORTSK,PARTAG,.STDT,.ENDT,.FLAGS)
 Q:PARAMS<0 PARAMS
 ;--- Process the list of CPT codes
 S TMP=$$CPTLST^RORXU006(.RORTSK,PARAMS)  Q:TMP<0 TMP
 ;---
 Q PARAMS
