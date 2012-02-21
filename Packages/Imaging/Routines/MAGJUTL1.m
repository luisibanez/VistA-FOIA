MAGJUTL1 ;WIRMFO/JHC VistARad subroutines for RPC calls ; 29 Jul 2003  10:03 AM
 ;;3.0;IMAGING;**22**;Jul 29, 2003
 ;; +---------------------------------------------------------------+
 ;; | Property of the US Government.                                |
 ;; | No permission to copy or redistribute this software is given. |
 ;; | Use of unreleased versions of this software requires the user |
 ;; | to execute a written test agreement with the VistA Imaging    |
 ;; | Development Office of the Department of Veterans Affairs,     |
 ;; | telephone (301) 734-0100.                                     |
 ;; |                                                               |
 ;; | The Food and Drug Administration classifies this software as  |
 ;; | a medical device.  As such, it may not be changed in any way. |
 ;; | Modifications to this software may result in an adulterated   |
 ;; | medical device under 21CFR820, the use of which is considered |
 ;; | to be a violation of US Federal Statutes.                     |
 ;; +---------------------------------------------------------------+
 ;;
 Q
 ;<*>Notes on possible changes to ^RAO7PC1/1A for fetching rad pkg data:
 ; 1) Return also: Exam Status IEN, Order Request Urgency, & Pre-Op Date
 ; 2) Allow to retrieve one specific exam; e.g. modify SETDATA^RAO7PC1A
 ;    to act as a true subrtn, W/ params for RADFN, RADTI, & RACNI--if
 ;    passed, then only the one exam would be returned
 ;
GETEXAM3(DFN,BEGDT,ENDT,MAGRACNT,MAGRET,MORE,LIMEXAMS) ; Get data for all exams for a
 ; pt within a date range (default all dates); limit returned list to LIMEXAMS
 ; Input:
 ;      DFN -- Patient DFN
 ;    BEGDT -- Opt, earliest date desired
 ;     ENDT -- Opt, latest date desired
 ; MAGRACNT -- Opt, pass by ref to init counter to ref return data in ^TMP (see GETEXSET)
 ; LIMEXAMS -- Opt, limit # exams to return
 ; Return:
 ; MAGRACNT -- highest counter for return data
 ;   MAGRET -- 1/0: exam was/not found
 ;     MORE -- date before which more exams exist for pt
 ;     ^TMP -- data returned (see GETEXSET)
 ;
 I '$D(DT) S DIQUIET=1 D DT^DICRW
 N MORECHK
 S LIMEXAMS=+$G(LIMEXAMS)
 S MORECHK=BEGDT!LIMEXAMS
 S:$G(BEGDT)="" BEGDT=2010101 S:$G(ENDT)="" ENDT=DT ; default all dates
 S MAGRACNT=+$G(MAGRACNT),MAGRET=0,MORE=0  ; Init return data
 I BEGDT>ENDT S X=ENDT,ENDT=BEGDT,BEGDT=X
 I '(DFN&BEGDT&ENDT) Q
 K ^TMP($J,"RAE1") D EN1^RAO7PC1(DFN,BEGDT,ENDT,LIMEXAMS)
 N EXID S EXID=0
 F MAGRET=0:1 S EXID=$O(^TMP($J,"RAE1",DFN,EXID)) Q:'EXID  D GETEXSET(DFN,EXID,"")
 K ^TMP($J,"RAE1")
 I 'MORECHK Q  ; all done; else indicate if pt has more exams
 N DTI,CNI,STS
 I 'MAGRET S DTI=9999999.9999-DT,CNI=0 ; no exam found in orig dt range
 E  S X=^TMP($J,"MAGRAEX",MAGRACNT,1),DTI=$P(X,U,2),CNI=$P(X,U,3) ; last exam processed
 ; loop thru addl exams til find one that is NOT Cancelled
MORE1 F  S CNI=$O(^RADPT(DFN,"DT",DTI,"P",CNI)) Q:'CNI  S STS=$P($G(^(CNI,0)),U,3) I STS]"" D  Q:MORE
 . S MORE='($P($G(^RA(72,STS,0)),U,3)=0) ; True if sts is NOT Canc
 I 'MORE S DTI=$O(^RADPT(DFN,"DT",DTI)),CNI=0 G MORE1:DTI
 Q
 ;
GETEXAM2(DFN,DTI,CNI,MAGRACNT,MAGRET) ; Fetch data for one exam
 ;Input:
 ; DFN -- Pt DFN
 ; DTI -- Internal Date pointer to Rad exam
 ; CNI -- Case pointer to Rad exam
 ; MAGRACNT -- Opt, pass by ref to init counter for return data in ^TMP (see GETEXSET)
 ; Return:
 ; MAGRACNT -- highest counter for return data
 ;   MAGRET -- 1/0: exam was/not found
 ;     ^TMP -- data returned (see GETEXSET)
 ;
 ; This subroutine calls RAO7PC1A directly to fetch exam data
 ; which is returned in ^TMP($J,"RAE1",DFN,DTI_"-"_CNI).
 ; RAO7PC1A currently returns ALL exams filed under one DTI,
 ; but this subroutine returns the single exam for the input DTI, CNI
 ;
 N RADFN,RACNT,RAIBDT,RAEXN,RAXIT  ; Vars input to RAO7PC1A
 S RADFN=DFN,RACNT=0,RAIBDT=DTI,RAEXN=0,RAXIT=0
 ; other Vars set by RAO7PC1A:
 N RABNOR,RACSE,RADIAG,RANO,RAPRC,RAREX,RARPT,RARPTST,RASTNM,RAXAM,RAXID
 N RABNORMR,RACPT
 S MAGRACNT=+$G(MAGRACNT)
 K ^TMP($J,"RAE1") D SETDATA^RAO7PC1A
 S MAGRET=RACNT Q:'RACNT     ; no exams found
 D GETEXSET(DFN,DTI_"-"_CNI,.X)
 I 'X S MAGRET=0   ; no exam for this CNI
 K ^TMP($J,"RAE1")
 Q
 ;
GETEXSET(RADFN,EXID,MAGRET) ; 
 ; Used by GETEXAM* subroutines above to set up rad data for vrad
 ; Input:
 ;  RADFN -- Pt DFN
 ;  EXID --- RADTI_"-"_RACNI, pointers to Rad exam
 ; Output:
 ;  MAGRET- 1/0: an exam was/was not filed
 ;  ^TMP($J,"MAGRAEX",MAGRACNT)=Data String (see code at end)
 ;  MAGRACNT described in above subroutines
 ;
 N RACN,RACNI,RADATA,RADATE,RADTE,RADTI,RADTPRT,RAELOC,RANME
 N RAPRC,RARPT,RASSN,RAST,RASTORD,RASTP,RASTNM,RACPT,IMTYPABB,PROCMOD
 N DAYCASE,REQLOC,REQLOCN,REQLOCA,REQLOCT,RIST,RIST1,RIST2,COMPLIC,RADIV,RISTISME
 S MAGRET=0,RADTI=$P(EXID,"-"),RACNI=$P(EXID,"-",2)
 Q:'(RADTI&RACNI)
 S RADIV=""
 S RADATA=$G(^TMP($J,"RAE1",RADFN,EXID))
 Q:RADATA=""        ;  no exam for this EXID
 S RARPT=$P(RADATA,U,5)
 S X=$P(RADATA,U,6),RASTORD=$P(X,"~"),RASTNM=$P(X,"~",2)
 S X=^RADPT(RADFN,"DT",RADTI,"P",RACNI,0),COMPLIC=$D(^("COMP")),PROCMOD=$D(^("M"))
 S RAST=$P(X,U,3),REQLOC=$P(X,U,22),RIST1=$P(X,U,12),RIST2=$P(X,U,15),COMPLIC=$P(X,U,16)_"~"_COMPLIC
 I 'PROCMOD S PROCMOD=""
 E  D
 . N IEN S IEN=0,PROCMOD=""
 . F  S IEN=$O(^RADPT(RADFN,"DT",RADTI,"P",RACNI,"M",IEN)) Q:'IEN  S X=$P($G(^(IEN,0)),U) I X D
 . . S X=$P($G(^RAMIS(71.2,X,0)),U) Q:X=""
 . . S PROCMOD=PROCMOD_$S(PROCMOD="":"",1:";")_X
 S RADIV=$P(^RADPT(RADFN,"DT",RADTI,0),U,3)
 I 'REQLOC S (REQLOCN,REQLOCT,REQLOCA)=""
 E  D
 . S X=$G(^SC(REQLOC,0)),REQLOCN=$P(X,U),REQLOCA=$P(X,U,2)
 . S:REQLOCA="" REQLOCA=REQLOCN
 . S DIC="44",DR="2",DA=REQLOC,DIQ="REQLOCT" D EN^DIQ1 K DIC,DR,DA,DIQ
 . S REQLOCT=REQLOCT(44,REQLOC,2)
 S (RIST,RISTISME)="" I RIST1!RIST2 D  ; Interp Rist(s)
 . I RIST1 S RISTISME=RIST1=DUZ S RIST=$$USERINF^MAGJUTL3(RIST1,1)
 . I RIST2 S:'RISTISME RISTISME=RIST2=DUZ S RIST2=$$USERINF^MAGJUTL3(RIST2,1)
 . I RIST]"" S RIST=RIST_$S(RIST2]"":"/"_RIST2,1:"")
 . E  S RIST=RIST2
 S RADTE=9999999.9999-RADTI,(RADTPRT,Y)=RADTE D D^RAUTL S RADATE=Y
 S RADTPRT=$E(RADTPRT,4,5)_"/"_$E(RADTPRT,6,7)_"/"_$E(RADTPRT,2,3)
 S RAPRC=$E($P(RADATA,U),1,40),RACN=$P(RADATA,U,2),RAELOC=$P(RADATA,U,7)
 S IMTYPABB=$P($P(RADATA,U,8),"~"),RACPT=$P(RADATA,U,10)
 S DAYCASE=$E(RADTE,4,7)_$E(RADTE,2,3)_"-"_RACN
 S RASTP=RASTNM
 S RANME=$P(^DPT(RADFN,0),U)
 S DFN=RADFN D PID^VADPT6 S RASSN=$S(VAERR:"Unknown",1:VA("PID"))
 K VA("PID"),VA("BID"),VAERR
 S MAGRACNT=$G(MAGRACNT)+1
 I MAGRACNT=1 K ^TMP($J,"MAGRAEX")
 ; Return Data:                              2               4                        6              8                     10             12              14               16                 18                    20
 S ^TMP($J,"MAGRAEX",MAGRACNT,1)=RADFN_U_RADTI_U_RACNI_U_$E(RANME,1,30)_U_RASSN_U_RADATE_U_RADTE_U_RACN_U_$E(RAPRC,1,35)_U_RARPT_U_RAST_U_DAYCASE_U_RAELOC_U_RASTP_U_RASTORD_U_RADTPRT_U_RACPT_U_IMTYPABB
 S ^TMP($J,"MAGRAEX",MAGRACNT,2)=REQLOCA_U_$E(REQLOCN,1,25)_U_RIST_U_COMPLIC_U_RADIV_U_$P($$IMGSIT(RADIV),U,2)_U_RISTISME_U_PROCMOD_U_REQLOCT
 S MAGRET=1
 Q
 ;
IMGSIT(X) ; Return Imaging Site code for input Division
 ; From 2006.1:  IEN ^ Site Code
 I X]"" D
 . N IEN I $D(^MAG(2006.1,"B",X)) S IEN=$O(^(X,"")) I IEN
 . E  S X="" Q
 . S X=IEN_U_$P(^MAG(2006.1,IEN,0),U,9)
 Q X
 ;
END Q  ;
