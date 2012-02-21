MAGJLST1 ;WIRMFO/JHC VistARad RPC calls ; 29 Jul 2003  10:01 AM
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
 ;     PTLIST -- list subset of all exams for a patient
 ;          Note, this is a reworked vs of tag 'LIST' from the
 ;          routine MAGGTRA
 ;        RPC Call: MAGJ PTRADEXAMS
 ;   PTLSTALL -- list ALL exams for a patient
 ;       RPC Call: MAGJ PT ALL EXAMS
 ; Subroutine for display Radiology Report:
 ;     RADRPT -- 
 ;       RPC Call: MAGJ EXAM REPORT
 Q
ERR N ERR S ERR=$$EC^%ZOSV S ^TMP($J,"RET",0)="0^4~"_ERR
 S MAGGRY=$NA(^TMP($J,"RET"))
 D @^%ZOSF("ERRTN")
 Q:$Q 1  Q
 ;
RADRPT(MAGRPTY,DATA) ; Display rad report; 1st must pass integrity checks
 ; Note: adds an additional line of output for the Report Window header
 ;  RPC is MAGJ EXAM REPORT
 ;
 ; MAGRPTY holds $NA reference to  return message; references to it use subscript indirection
 ;
 S MAGRPTY=$NA(^TMP($J,"WSDAT")) K @MAGRPTY
 N $ETRAP,$ESTACK S $ETRAP="D ERR^MAGJLST1"
 N RARPT,RADATA,MAGDFN,MAGDTI,MAGCNI,X,MAGRET,HDR,REPLY,POP,MAGPRC,COMPLIC
 S MAGDFN=$P(DATA,U),MAGDTI=$P(DATA,U,2),MAGCNI=$P(DATA,U,3),RARPT=+$P(DATA,U,4)
 I '(MAGDFN&MAGDTI&MAGCNI) D  G RPTZ
 . S REPLY="0^4~Request Contains Invalid Case Pointer ("_MAGDFN_" "_MAGDTI_" "_MAGCNI_")."
 . I $L(DATA,U)=1 S REPLY=REPLY_"  VistaRSV module must be updated to newer version (T17 or later); contact Imaging support."
 D GETEXAM2^MAGJUTL1(MAGDFN,MAGDTI,MAGCNI,"",.MAGRET)
 S RADATA=$G(^TMP($J,"MAGRAEX",1,1)),XX=$G(^(2)),HDR=""
 S COMPLIC=$P(XX,U,4)  ;  Complications text
 F I=4,12,9 S HDR=HDR_$P(RADATA,U,I)_"   "
 D CKINTEG(.REPLY,MAGDFN,MAGDTI,MAGCNI,RARPT,RADATA)
 I REPLY]"" S REPLY="0^7~"_REPLY G RPTZ  ; DB integ problem
 D OPENDEV^MAGJORD
 I POP S REPLY="0^4~Unable to open device 'IMAGING WORKSTATION'" G RPTZ
 D EN3^RAO7PC3(MAGDFN_"^"_MAGDTI_"^"_MAGCNI)
 I '$D(^TMP($J,"RAE3")) S REPLY="0^4~No report on file." G RPTZ
 D COMMENTS^MAGJORD(MAGDFN,MAGDTI,MAGCNI,MAGRPTY,2,COMPLIC)
 S MAGPRC=$O(^TMP($J,"RAE3",MAGDFN,MAGCNI,"")),I=0
 F  S I=$O(^TMP($J,"RAE3",MAGDFN,MAGCNI,MAGPRC,I)) Q:'I  W !,$G(^TMP($J,"RAE3",MAGDFN,MAGCNI,MAGPRC,I))
 D:IO'=IO(0) ^%ZISC
 S REPLY="1^1~Radiology Report"
RPTZ S @MAGRPTY@(0)=REPLY
 I +$G(@MAGRPTY@(0)) S @MAGRPTY@(1)="RPT: "_HDR ; if a report exists, add header line to output
 K ^TMP($J,"MAGRAEX"),^("RAE3")
 Q
 ;
CKINTEG(REPLY,RADFN,RADTI,RACNI,RARPT,RADATA) ; check integrity between Exam, Report, and Image Group Headers
 ; This subroutine used by other programs (magjord)
 ;
 N IEN,MAGIEN,MIXEDUP,X,CKDFN,CKACN
 S MIXEDUP=0,REPLY=""
 I RARPT D  G CK2:MIXEDUP
 . S X=$G(^RARPT(RARPT,0)),CKDFN=$P(X,U,2),CKACN=$P(X,U,4)
 . I CKDFN'=RADFN S MIXEDUP=1_U_+CKDFN Q
 . I $G(RADATA)]"" D
 .. I $P(RADATA,U,8)'=CKACN D
 ... N MAGPSET,RAPRTSET,ACN,OK S OK=0
 ... S RAPRTSET=0 D EN2^RAUTL20(.MAGPSET) I RAPRTSET D
 .... N I S I=0 F  S I=$O(MAGPSET(I)) Q:'I  I +MAGPSET(I)=CKACN S OK=1 Q
 ... I 'OK S MIXEDUP=5_U_CKACN_U_$P(RADATA,U,8)
 I $D(^RARPT(+RARPT,2005)) S IEN=0 D  G CK2:MIXEDUP
 . F  S IEN=$O(^RARPT(RARPT,2005,IEN)) Q:'IEN  S MAGIEN=+$G(^(IEN,0)) D  Q:MIXEDUP
 .. S X=$P($G(^MAG(2005,MAGIEN,0)),U,7) I X'=RADFN S MIXEDUP=2_U_+X Q
 .. S X=$P($G(^MAG(2005,MAGIEN,2)),U,7) I X'=RARPT S MIXEDUP=3_U_+X Q
CK2 I 'MIXEDUP Q  ; no problems detected
 I +MIXEDUP=1!(+MIXEDUP=2) D  Q
 . S X=$$PNAM^MAGJEX1($P(MIXEDUP,U,2))
 . I +MIXEDUP=1 S REPLY="The Exam file for this exam has patient "_$$PNAM^MAGJEX1(RADFN)_"; the corresponding Report file has patient "_X_".  This is a serious problem--immediately report it to Radiology management and Imaging support!"
 . I +MIXEDUP=2 S REPLY="This exam is registered for "_$$PNAM^MAGJEX1(RADFN)_"; however, it is linked to images for patient "_X_".  This is a serious problem--immediately report it to Radiology management and Imaging support staff!"
 I +MIXEDUP=3 D  Q
 . N T S T=$P(MIXEDUP,U,2) S:'T T="Missing Link"
 . S REPLY="This exam is linked to Report entry #"_RARPT_", but some of its images may be linked to Report entry #"_T_".  This is a potentially serious problem--immediately report it to Radiology management and Imaging support staff!"
 I +MIXEDUP=4 D  Q
 . N T S T=$P(MIXEDUP,U,2) S:'T T="Missing Reference"
 . S X=" ("_RARPT_" and "_T_" )"
 . S REPLY="This exam has problems in the Radiology Report file, with two different report entries referenced"_X_".  This is a potentially serious problem--immediately report it to Radiology management and Imaging support staff!"
 I +MIXEDUP=5 D  Q
 . N T S X=$P(MIXEDUP,U,2) S:X="" X="Missing"
 . S T=$P(MIXEDUP,U,3) S:T="" T="Missing"
 . S X=" ("_X_" and "_T_") "
 . S REPLY="This exam has problems in the Radiology files, with two different Case Numbers referenced"_X_".  This is a potentially serious problem--immediately report it to Radiology management and Imaging support staff!"
 Q
 ;
PTLSTALL(MAGGRY,DATA) ; List ALL exams for a patient
 ;  RPC is MAGJ PT ALL EXAMS
 D PTLIST(.MAGGRY,$P(DATA,U)_"^99^999")
 Q
 ;
PTLIST(MAGGRY,DATA) ; get list of exams for a patient
 ; 
 ; MAGGRY - indirect reference to return array of exams for a patient
 ; DATA   - DFN--Radiology Patient's DFN
 ;          LIMYRS--Restrict listed exams up to # Years back
 ;          LIMEXAMS--Restrict listed exams up to # of exams
 ; Returns data in ^TMP($J,"MAGRAEX",0:n)
 ; RPC Call: MAGJ PTRADEXAMS
 ;
 N CNT,DFN,ISS,PATNAME,DIQUIET,MAGRACNT,MAGRET,REPLY,REMOTE,SNDREMOT
 N DAYCASE,DIV,EXCAT,MAGDT,XX,XX2,WHOLOCK,MODALITY,MYLOCK,PLACE
 N LIMYRS,LIMEXAMS,BEGDT,MORE,SHOWPLAC,RDRIST,PSSN
 N $ETRAP,$ESTACK S $ETRAP="D ERR^MAGJLST1"
 S DIQUIET=1 D DT^DICRW
 S X=$G(^MAG(2006.69,1,0))
 S SNDREMOT=+$P(X,U,11) ; Site routes images remotely?
 S SHOWPLAC=$$SHOWPLAC^MAGJLS2B("")
 S LIMYRS=+$P(X,U,14),LIMEXAMS=+$P(X,U,15)
 S:'LIMYRS LIMYRS=99 S:'LIMEXAMS LIMEXAMS=999 ; default to show ALL Exams
 K MAGGRY S DFN=+DATA
 I $P(DATA,U,2) S LIMYRS=+$P(DATA,U,2)
 I $P(DATA,U,3) S LIMEXAMS=+$P(DATA,U,3)
 I LIMYRS>74 S LIMYRS=""
 I LIMYRS,LIMYRS<2 S LIMYRS=2
 I LIMEXAMS<15 S LIMEXAMS=15
 S MAGRACNT=1,CNT=0 K ^TMP($J,"MAGRAEX"),^("MAGRAEX2")
 S REPLY="0^4~Compiling list of Radiology Exams."
 I DFN,$D(^DPT(DFN,0)) S PATNAME=$P(^(0),U),PSSN=$P(^(0),U,9) D
 . S BEGDT=""
 . I LIMYRS S BEGDT=($E(DT,1,3)-LIMYRS)_$E(DT,4,7)
 . D GETEXAM3^MAGJUTL1(DFN,BEGDT,"",.MAGRACNT,.MAGRET,.MORE,LIMEXAMS)
 . S ISS=0
 . Q:'MAGRET      ;  No exams found
 . F  S ISS=$O(^TMP($J,"MAGRAEX",ISS)) Q:'ISS  S XX=^(ISS,1),XX2=^(2) D
 .. S CNT=CNT+1
 .. D IMGINFO^MAGJUTL2($P(XX,U,10),.Y)
 .. S IMGCNT=$P(Y,U),ONL=$P(Y,U,2),MAGDT=$P(Y,U,3),REMOTE=$P(Y,U,4),MODALITY=$P(Y,U,5),PLACE=$P(Y,U,6)
 .. S:PLACE PLACE=$P($G(^MAG(2006.1,PLACE,0)),U,9)
 .. I PLACE]"",SHOWPLAC D
 ... I SHOWPLAC'[(","_PLACE_",") S PLACE="" ; don't show user's logon pl
 .. I SNDREMOT,REMOTE D
 ... I $G(MAGJOB("REMOTE")) D  Q
 .... F I=1:1:$L(REMOTE,",") I $D(MAGJOB("LOC",$P(REMOTE,",",I))) S REMOTE=$P($G(^MAG(2005.2,$P(REMOTE,",",I),3)),U,5) Q
 ... E  S T="" D  Q
 .... F I=1:1:$L(REMOTE,",") S T=T_$S(T="":"",1:",")_$P($G(^MAG(2005.2,$P(REMOTE,",",I),3)),U,5)
 .... S REMOTE=T
 .. S DIV="",X=$P(XX2,U,5) I X'=DUZ(2) S DIV=$$STATN(X)
 .. I MAGDT="" S MAGDT=$P(XX,U,7)
 .. S MAGDT=$$FMTE^XLFDT(MAGDT,"5Z")
 .. S WHOLOCK=$P(XX,U,10),MYLOCK="",DAYCASE=$P(XX,U,12)
 .. I WHOLOCK]"" S T=$$CHKLOCK^MAGJLS2B(WHOLOCK),WHOLOCK=$P(T,U),MYLOCK=$P(T,U,2)
 .. S RDRIST=$P(XX2,U,3),PROCMOD=$P(XX2,U,8)
 .. S Y=U_DAYCASE_U_WHOLOCK_U_$E($P(XX,U,9),1,26)_U_PROCMOD_U_MAGDT_U_$E($P(XX,U,14),1,16)_U_IMGCNT_U_ONL
 .. I $G(SNDREMOT) S Y=Y_U_REMOTE
 .. S Y=Y_$S(SHOWPLAC:U_PLACE,1:"")_U_MODALITY_U_$E($P(XX,U,13),1,11)_U_RDRIST
 .. S EXCAT=$P(XX,U,11)
 .. I EXCAT]"" S EXCAT=$S($D(^RA(72,"AVC","E",EXCAT)):"E",1:"")
 .. S ^TMP($J,"MAGRAEX2",ISS)=Y_"^|"_$P(XX,U,1,3)_U_$P(XX,U,10)_"||"_EXCAT_U_WHOLOCK_U_MYLOCK_U_MODALITY
 E  S REPLY="0^4~Invalid Radiology Patient"
 I MAGRACNT<2 S:(REPLY["Compiling") REPLY="0^2~No Exams Found for "_PATNAME
 I CNT!(REPLY["No Exams Found") D
 . I 'MORE S MSG="ALL exams are listed."
 . E  S MORE=$$FMTE^XLFDT(MORE) S MSG="Patient has more exams on file."
 . ; show SSN only if the user is a radiologist
 . S X=+MAGJOB("USER",1) I '(X=12!(X=15)) S PSSN=""
 . E  S PSSN=" ("_$E(PSSN,1,3)_"-"_$E(PSSN,4,5)_"-"_$E(PSSN,6,9)_")"
 . I CNT S REPLY=CNT_"^1~Radiology Exams for: "_PATNAME_PSSN_" -- "_MSG
 . E  S REPLY=REPLY_" -- "_MSG
 . S ^TMP($J,"MAGRAEX2",1)="^Day/Case~S3^Lock^Procedure^Modifier^Image Date/Time~S1^Status^# Img~S2^Onl"_$S($G(SNDREMOT):"^RC",1:"")_$S(SHOWPLAC:"^Site",1:"")_"^Mod^Imaging Loc^Interp By"
 S ^TMP($J,"MAGRAEX2",0)=REPLY
 S MAGGRY=$NA(^TMP($J,"MAGRAEX2"))
 K ^TMP($J,"RAE1"),^("MAGRAEX")
 Q
 ;
STATN(X) ; get station #, else return input value
 N T
 I X]"" D GETS^DIQ(4,X,99,"E","T") S T=$G(T(4,X_",",99,"E")) I T]"" S X=T
 Q X
 ;
END Q  ;
