MAGJLS3        ;WIRMFO/JHC Rad. Workstation RPC calls ; 29 Jul 2003  10:00 AM
 ;;3.0;IMAGING;**16,22**;Jul 29, 2003
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
 ;
 ; Subroutines for fetching Exam Info for Radiology Workstation
 ; Exam listings:
 ;   BLDACTV -- Compile list of active exams
 Q
 ;
BLDACTV(MAGGRY,DATA,MAGLST) ; get subset of Active Exams from Rad files
 ; Called from MAGJLS2
 ; MAGGRY - Indirect Global ref of return array
 ; DATA   - type of listing ^ Imaging Types to process
 ;   Piece 1 = U  -- UNREAD Exams only (Status Category=E)
 ;           = R  -- RECENT Exams (Status Categories D & T)
 ;           = A  -- ALL Active exams (Categories E, D, & T)
 ;           = P  -- PENDING exams (Category "W")
 ;           = N  -- Newly Interpreted Exams (No Cat.-Internal use only)
 ;   Piece 2,ff = List of Imaging Types to process, or "ALL" for all
 ; MAGLST holds $NA reference to global containing returned list; references
 ;        to MAGLST use subscript indirection
 ; Value of MAGLST may optionally be passed in to specify return global location
 ; 
 ;* This subroutine can continue to receive U/R/A/P/N (LSTREQ),
 ;                                ^_delim list of ImgTypes (IMTYPS)
 ; BKGPROC
 N RADFN,RADTI,RACNI
 N HDR,HDRLST,MAGIMGTY,MAGRACNT,MAGRET,LSTREQ,LISTYP,LISCAT,IMTYPS
 N REPLY,STAT,TYP,SORTMAG,DIQUIET,STATCHK,LASTDT,IMGSONLY,URGORD,REMONLY
 S DIQUIET=1 D DT^DICRW
 I $G(MAGLST)="" S MAGLST=$NA(^TMP($J,"MAGJACTIVE")) ; default loc'n if not passed in
 K ^TMP($J,"MAGRAEX"),@MAGLST
 S LSTREQ=$P(DATA,U),IMTYPS=$P(DATA,U,2,99)
 I LSTREQ="U"!(LSTREQ="R")!(LSTREQ="A")!(LSTREQ="P")!(LSTREQ="N")
 E  S REPLY="0^4~Invalid Request (List Type="_LSTREQ_")" G BLDACTVZ
 S MAGRACNT=0
 S X=$G(^MAG(2006.69,1,0)),IMGSONLY=+$P(X,U,7) ; show only exams w/ images?
 S REMONLY=$G(MAGJOB("REMOTE"))&+$P(X,U,10) ;show remote cache only?
 S X=$G(^MAG(2006.69,1,1)),URGORD=$P(X,U)
 S:URGORD="" URGORD="S,U,P,R" S URGORD=$TR(URGORD,",") ; "Priority" sort
 S HDR=$S(LSTREQ="U":"UNREAD",LSTREQ="R":"RECENT",LSTREQ="P":"PENDING",LSTREQ="A":"UNREAD and RECENT",LSTREQ="N":"NEWLY INTERP",1:"")_" Exams"_" for IMAGING TYPES: "
 S LISTYP=$S(LSTREQ="U":"E",LSTREQ="R":"D^T",LSTREQ="A":"E^D^T",LSTREQ="P":"W",LSTREQ="N":"",1:"E")
 S REPLY="0^4~Compiling list of Radiology Exams (ACTIVE)."
 I $G(BKGPROC),(LSTREQ="R") K ^TMP($J,"NEWINT") S ^TMP($J,"NEWINT")=+$G(^XTMP("MAGJ2","RECENT",0))
 I LSTREQ="N" D BLDACT2
 I LSTREQ'="N" D BLDACT1
BLDACTVZ ;
 I 'MAGRACNT S:(REPLY["Compiling") REPLY="0^2~No Exams Found"
 E  D
 . I IMTYPS="ALL" S HDR=HDR_" ALL"
 . E  S Y="" F I=0:1 S Y=$O(HDRLST(Y)) Q:Y=""  S HDR=HDR_$S('I:"",1:", ")_Y
 . S REPLY=MAGRACNT_U_"1~"_HDR
 S @MAGLST@(0,1)=REPLY,^(2)=""
 K ^TMP($J,"MAGRAEX"),^("RAE1")
 S MAGGRY=MAGLST
 Q
BLDACT1 ; Compile exams by Status codes
 D BLDSTAT
 F  S LISCAT=$P(LISTYP,U),LISTYP=$P(LISTYP,U,2,9) Q:LISCAT=""  D
 . I IMTYPS="ALL" S TYP="" D  Q
 .. F  S TYP=$O(STAT(LISCAT,TYP)) Q:TYP=""  D IMGTYP(LISCAT,TYP)
 . E  I +IMTYPS D IMGTYLST(LISCAT,IMTYPS) Q
 . E  S REPLY="0^4~Invalid Imaging Type"
 Q
BLDACT2 ; Add recently interpreted exams to the "Recent" compile data
 ; First, compile these exams into their own list
 N CNT,INDX,RAST,STATCHK,RECLIST
 S X=$G(^XTMP("MAGJ2","RECENT",0)),INDX=+$P(X,U,2)
 F  S INDX=$O(^XTMP("MAGJ2","RECENT",INDX)) Q:'INDX  S X=^(INDX) D
 . S RADFN=$P(X,U),RADTI=$P(X,U,2),RACNI=$P(X,U,3),(RAST,STATCHK)=$P(X,U,4)
 . D GETEXAM2^MAGJUTL1(RADFN,RADTI,RACNI,0,.MAGRET)
 . I MAGRET D SVMAG2A
 . S $P(^XTMP("MAGJ2","RECENT",0),U,2)=INDX
 ; now copy the above list records to the "RECENT" curlist
 S RECLIST=+$$CURLIST^MAGJLS2("LS9992")
 I 'RECLIST S RECLIST=+$G(^XTMP("MAGJ2","BKGND","LS9992",0))
 I 'RECLIST Q  ; Recent list not being compiled--skip it!
 F CNT=1:1:MAGRACNT S X1=@MAGLST@(CNT,1),X2=^(2) D  ; MAGLST described at BLDACTV
 . S REC=^XTMP("MAGJ2","LS9992",RECLIST,0,1)+1
 . S ^XTMP("MAGJ2","LS9992",RECLIST,REC,1)=X1,^(2)=X2
 . S $P(^XTMP("MAGJ2","LS9992",RECLIST,0,1),U)=REC
 Q
 ;
 ;
SVMAG2A ; 2A used by subroutine at tag BLDACTV
 ; load return array @MAGLST@(n, ...
 ; Note: ^TMP("MAGRAEX" is set by the subroutine Getexam2^Magjutl1
 ;
 N MAGDT,SORTDT,IMGCNT,ONL,XX,XX2,Y
 N REMOTE,MODALITY,DAYCASE,EXCAT,ORD,URG,URG1,PREOP,LASTSSN
 S URG="",PREOP=""   ; <*> Need below until RAO7PC1A returns URG
 S X=$G(^RADPT(RADFN,"DT",RADTI,"P",RACNI,0))
 S ORD=$P(X,U,11)
 I ORD S Y=$G(^RAO(75.1,ORD,0)),URG=$P(Y,U,6),PREOP=$P(Y,U,12)
 S XX=$G(^TMP($J,"MAGRAEX",1,1)),XX2=$G(^(2))
 I $G(STATCHK),(STATCHK=$P(XX,U,11))
 E  Q       ;  index '= stored status
 D IMGINFO^MAGJUTL2($P(XX,U,10),.Y)
 S IMGCNT=$P(Y,U),ONL=$P(Y,U,2),MAGDT=$P(Y,U,3),REMOTE=$P(Y,U,4),MODALITY=$P(Y,U,5),PLACE=$P(Y,U,6)
 I IMGSONLY,'IMGCNT Q  ;only list exams w/ imgs
 I REMONLY,'REMOTE,'$G(BKGPROC) Q  ; only list exams cached remotely
 S:PLACE PLACE=$P($G(^MAG(2006.1,PLACE,0)),U,9)
 I MAGDT="" S MAGDT=$P(XX,U,7)
 S SORTDT=MAGDT
 S MAGDT=$$FMTE^XLFDT(MAGDT,"5Z")
   ; XX 1 RADFN   RADTI    RACNI   RANME    RASSN  <-- from GETEXAM
   ;    6 RADATE  RADTE    RACN    RAPRC     RARPT
   ;   11 RAST    DAYCASE  RAELOC   RASTP     RASTORD
   ;   16 RADTPRT RACPT    IMTYPABB
   ;XX2 1 REQLOCABB  REQLOCNM  RdRIST  COMPLIC  RAD_DIV
   ;    6 SITE_CODE  RISTISME  PROCMOD  REQLOCT
 S:'URG URG=9  ;  request urgency default to Routine
 I URG=9,(PREOP]"") S URG=8  ; dummy value for Pre-Op "urgency"
 S URG1=$S(URG=1:"Stat",URG=2:"Urg",URG=8:"PreOp",1:"Rout"),X=$E(URG1),URG1=$F(URGORD,X)-1_"-"_URG1
 I PREOP]"",(URG'=8) S URG1=URG1_"/Pre" ; show PreOp & another priority
 S SORTMAG=$S(+IMGCNT:"A",1:"B") ; sort index: has/not images
 S DAYCASE=$P(XX,U,12)
 S Z=$D(^RA(72,"AVC","E",$P(XX,U,11))),EXCAT=$S(Z:"E",1:"") ; "Examined" indic.
 S LASTSSN=$P($P(XX,U,5),"-",3)
 ; build output string in Y & Y2
 S Y=DAYCASE_U_U_$E($P(XX,U,4),1,30)_U_$E($P(XX,U,4))_LASTSSN
 S Y=Y_U_URG1_U_$E($P(XX,U,9),1,30)_U_MAGDT_U_$E($P(XX,U,14),1,10)_U_IMGCNT
 S Y=Y_U_ONL_U_$E($P(XX,U,13),1,15)_U_REMOTE
 S Y=Y_U_SORTMAG_U_SORTDT_U_MODALITY_U_RAST_U_$$RAIMTYP(RAST)
 S X=$P(XX2,U,7),RISTISME=$S(X:"Y",1:"N")
 S Y2=$P(XX2,U,1,3)_U_LASTSSN_U_$P(XX2,U,5)_U_PLACE_U_RISTISME_U_$P(XX2,U,8,9)_U_"|"_$P(XX,U,1,3)_U_$P(XX,U,10)_"||"_EXCAT
 S MAGRACNT=MAGRACNT+1
 S @MAGLST@(MAGRACNT,1)=Y,^(2)=Y2  ; save output nodes for one exam
 I $G(BKGPROC),(LSTREQ="R") S ^TMP($J,"NEWINT",$P(XX,U,1,3))=""
 Q
 ;
RAIMTYP(RAST)   ; return Imaging Type Abbrev for Status Code
 N X S X="" I RAST]"" D
 . S X=$G(RAIMTYP(RAST)) Q:X]""
 . S X=$P($G(^RA(72,RAST,0)),U,7)
 . I X S X=$P($G(^RA(79.2,X,0)),U,3)_"~"_X  ; abb~ien
 . S RAIMTYP(RAST)=X   ; save for future use
 Q X
 ;
IMGTYLST(LISCAT,LST)       ; get exams for list of image types for input LISCAT
 N TYP
 F  Q:'(LST?1.N.E)  S TYP=+$P(LST,U),LST=$P(LST,U,2,99) D:TYP IMGTYP(LISCAT,TYP)
 Q
 ;
IMGTYP(LISCAT,IMGTY)       ; process statuses for one Image Type for LISCAT
 I '$D(^RA(79.2,IMGTY,0)) S REPLY="0^4~Invalid Imaging Type" Q
 N LST
 I $D(STAT)<10 D BLDSTAT
 S (STAT,LST)=""
 S LASTDT=$P(STAT(LISCAT),U)
 F  S STAT=$O(STAT(LISCAT,IMGTY,STAT)) Q:STAT=""  S LST=LST_$S(LST="":"",1:U)_STAT,HDRLST(STAT(LISCAT,IMGTY))=""
 I LST]"" D STATLST(LST)
 Q
 ;
STATLST(LST)       ; get exams for a list of status codes
 F  Q:'(LST?1.N.E)  S STAT=+$P(LST,U),LST=$P(LST,U,2,99) D:STAT STAT(STAT)
 Q
 ;
STAT(RAST)           ; get exams for one status code
 ; this subroutine uses ^RADPT (#70) "AS" index of exams not yet complete
 ;
 N RASTP
 I $D(^RA(72,RAST)) S RASTP=$P(^(RAST,0),U)
 E  S REPLY="0^4~Invalid Exam Status" Q
 I '$D(^RADPT("AS",RAST)) S REPLY="0^2~No exams on file with Exam Status "_RASTP Q
 S RADFN=0,STATCHK=RAST
 F  S RADFN=$O(^RADPT("AS",RAST,RADFN)) Q:RADFN'>0  S RADTI=0 D
 . F  S RADTI=$O(^RADPT("AS",RAST,RADFN,RADTI)) Q:RADTI'>0!(RADTI>LASTDT)  S RACNI=0 D
 .. F  S RACNI=$O(^RADPT("AS",RAST,RADFN,RADTI,RACNI)) Q:RACNI'>0  D
 ... D GETEXAM2^MAGJUTL1(RADFN,RADTI,RACNI,0,.MAGRET)
 ... Q:'MAGRET  ; no exam returned
 ... D SVMAG2A
 Q
 ;
BLDSTAT ; build list of Exam Status codes: STAT(CATEGORY,IMAG_TYP,STAT)=STATNM
 N X,CAT,TYP,STNM K STAT S CAT="",STAT=0
 F  S CAT=$O(^RA(72,"AVC",CAT)) Q:CAT=""  D
 . S X=$S(CAT="E":3,1:2),X=$P($G(^MAG(2006.69,1,0)),U,X)
 . S:'X X=$S(CAT="E":30,1:6) S X=$H-X+1,X=$$HTFM^XLFDT(X),X=9999999.9999-X
 . S STAT(CAT)=X
 . F  S STAT=$O(^RA(72,"AVC",CAT,STAT)) Q:'STAT  D
 .. S TYP=$P($G(^RA(72,STAT,0)),U,7),STNM=$P(^(0),U) S:TYP="" TYP="~"
 .. S STAT(CAT,TYP)=$P($G(^RA(79.2,TYP,0)),U,3),STAT(CAT,TYP,STAT)=STNM
 Q
 ;
END Q  ;
