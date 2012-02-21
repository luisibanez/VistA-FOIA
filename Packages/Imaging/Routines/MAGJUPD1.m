MAGJUPD1 ;WOIFO/JHC VistARad Update Exam Status ; 29 Jul 2003  10:02 AM
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
 ; Subroutines for RPC's to update Exam Status to "Interpreted", and
 ;   for "Closing" a case that is open on the DX Workstation
 ;
ERR N ERR S ERR=$$EC^%ZOSV S MAGGRY(0)="0^Server Program Error: "_ERR
 D @^%ZOSF("ERRTN")
 Q:$Q 1  Q
STATUS(MAGGRY,DATA) ; Update Exam Status for case to "Interpreted" (or
 ;   equivalent value); optionally update the Diagnostic Code, if passed;
 ;   also, Close the case
 ; Note: this subroutine will only update the Exam Status if the current
 ;       Status value is "Examined"
 ; This routine defines variables needed for calling the Radiology
 ; package routine UP1^RAUTL1, for filing Exam Status updates
 ; Adapted from the following program:
 ;MAGKEXC ;WASH ISC/SRR - EXAMINATION COMPLETE ;11/4/93  08:07 [ 11/06/93 7:42 AM]
 ;
 ; DATA = UPDFLAG ^ RADFN ^ RADTI ^ RACNI ^ RARPT ^ DXCODE
 ;   UPDFLAG = 1/0 -- 1 to perform update; else no update made
 ;   RARPT = ptr to Rad Exam Report file
 ;   RADFN,RADTI,RACNI = pointers to Rad Patient File for the exam
 ;   DXCODE = Diagnostic Code 
 ;   MAGGRY = return results in @MAGGRY
 ;
 ;
 N $ETRAP,$ESTACK S $ETRAP="D ERR^MAGJUPD1"
 S DIQUIET=1 D DT^DICRW
 N RARPT,RADFN,RADTI,RACNI,RAEXT,RACNE,RADTE,RAINT,RAMDV
 N RAONLINE,ZTQUEUED,RAOR,RASN,RASTI,RAPRTSET,LOCKDATA
 N DXCODE,MAGRET,REPLY,UPDFLAG,RADATA,RIST,MAGPSET,RACNILST,ACNLST
 S UPDFLAG=$P(DATA,U),RADFN=$P(DATA,U,2),RADTI=$P(DATA,U,3),RACNI=$P(DATA,U,4),RARPT=$P(DATA,U,5),DXCODE=$P(DATA,U,6)
 S REPLY="0^4~Closing case with"_$S(UPDFLAG:"",1:" NO")_" Update"
 S RAPRTSET=0
 I RADFN,RADTI,RACNI
 E  S REPLY="0^4~Request Contains Invalid Case Pointer ("_RARPT_")" G STATUSZ
 D GETEXAM2^MAGJUTL1(RADFN,RADTI,RACNI,0,.MAGRET)
 I 'MAGRET S REPLY="0^4~Current Case Not Accessible for Updating" G STATUSZ
   ; 1  RADFN   RADTI    RACNI   RANME   RASSN    <--Contents of RADATA,
   ; 6  RADATE  RADTE    RACN    RAPRC   RARPT         from GETEXAM
   ;11  RAST    DAYCASE  RAELOC  RASTP   RASTORD
   ;16  RADTPRT
 S RADATA=$G(^TMP($J,"MAGRAEX",1,1))
 S RAEXT=$P(RADATA,U,12),RACNE=$P(RAEXT,"-",2),RADTE=$P(RADATA,U,7)
 S RAINT=RADTI_"-"_RACNI
 D CLOSE(.X,RADFN_U_RADTI_U_RACNI_U_U_1,.LOCKDATA) ; unlock the case
 I 'X S REPLY=X G STATUSZ  ; proceed only if case was locked by this user
 I 'UPDFLAG S REPLY="0^1~Case #"_RAEXT_" Closed; No Status Update performed" G STATUSZ
 S RIST=$P(X,U,2) ; CLOSE reports back the type of radiologist
 ; now we know this user had locked the case, & wants to do Status update
 D EN2^RAUTL20(.MAGPSET)  ; get info re rad PrintSet
 ;
 ; IF exam is not "Examined", and not "Cancelled" and past "Waiting"
 ;    then assume it has already been updated via another pathway,
 ;    either as printset member (via code at tag PRTSET, below),
 ;    or from a voice-dictation or terminal session by the radiologist
 ;    For these cases, no warning msg is sent
 ; Else, update not allowed, so give warning msg
 ; Note that when the Exam was OPENed, it must have had status "Examined"
 I '$D(^RA(72,"AVC","E",$P(RADATA,U,11))) D  G STATUSX:(+$P(REPLY,U,2)=1),STATUSZ  ; Current Status MUST be "Examined" Category
 . I $P(RADATA,U,15)>2 D  ; assume update has otherwise been done
 .. S RACNILST=RACNI,RASTI=$P(RADATA,U,11) ; need for code at tag statusx
 .. I RAPRTSET S REPLY="0^1~Printset Exams with Case #"_RAEXT_" have been updated"
 .. E  S REPLY="0^1~No Update done for Case #"_RAEXT_"--current status is "_$P(RADATA,U,14)
 . E  S REPLY="0^3~No Update Allowed for Case #"_RAEXT_"--current status is "_$P(RADATA,U,14)
 ;
 ; now ready to update exam status
 S RAMDV=$P(^RADPT(RADFN,"DT",RADTI,0),U,3)
 S RAMDV=$TR(^RA(79,RAMDV,.1),"YyNn","1100")
 ;
 ; Update interpreting radiologist field in Rad file
 I RIST D  I RACNILST="" G STATUSZ
 . N SAVRACNI S RACNILST=""
PRTSET . ;  if exam is part of Rad Print-Set, then update all exams of printset
 . I RAPRTSET D
 .. S ACNLST="",SAVRACNI=RACNI,X=0
 .. F I=0:1 S X=$O(MAGPSET(X)) Q:'X  S RACNILST=RACNILST_$S(I:U,1:"")_X S:RACNE'=+MAGPSET(X) ACNLST=ACNLST_", "_"-"_+MAGPSET(X)
 . E  S RACNILST=RACNI
 . F I=1:1:$L(RACNILST,U) S RACNI=$P(RACNILST,U,I) I RACNI D  I RACNILST="" Q
 .. S DA(2)=RADFN,DA(1)=RADTI,DA=RACNI
 .. D STUFPHY^RARIC1(DUZ,RIST,.RTN)
 .. I 'RTN S REPLY="0^4~Unable to update Interpreting Radiologist: "_RTN_"." S RACNILST=""
 . I RAPRTSET S RACNI=SAVRACNI
 S RAONLINE=1,ZTQUEUED=1 D UP1^RAUTL1   ; Suppress msgs, do Status update
 ;<*> K RAONLINE,ZTQUEUED D UP1^RAUTL1 ; <*> Testing Only: ENABLE msgs
 I RAOR<0 S REPLY="0^3~Exam Status for Case #"_RAEXT_" CANNOT be updated; current status remains: "_$S($G(RASN)]"":RASN,1:"Unknown")
 I  G STATUSZ
 ;
 S REPLY="0^1~For Case #"_$S($G(ACNLST)]"":"s ",1:"")_RAEXT_$S(RAPRTSET:ACNLST,1:"")_", Exam Status updated to "_RASN
 ;
STATUSX ; Newly Interpreted exam:
 ; Log the Interpreted event
 D LOG^MAGJUTL3("VR-INT",RADFN,$P(LOCKDATA,U,5),$P(LOCKDATA,U,6),$P(LOCKDATA,U,7))
 ; Update Recent Exams List
 G STATUSZ:'$P(^MAG(2006.69,1,0),U,8)  ; no bkgnd compile enabled
 L +^XTMP("MAGJ2","RECENT"):10
 E  G STATUSZ
 N INDX F I=1:1:$L(RACNILST,U) S RACNI=$P(RACNILST,U,I) I RACNI D
 . S INDX=+$G(^XTMP("MAGJ2","RECENT",0))+1,$P(^(0),U)=INDX,^(INDX)=RADFN_U_RADTI_U_RACNI_U_RASTI
 L -^XTMP("MAGJ2","RECENT")
STATUSZ ;
 S MAGGRY(0)=REPLY
 K ^TMP($J,"MAGRAEX"),^("RAE1")
 Q
 ;
CLOSE(MAGGRY,DATA,LOCKDATA) ; Close/unlock a case
 ; DATA    = DFN ^ DTI ^ CNI ^ RPT ^ UPDFLAG
 ;
 ;       RPT = ptr to Rad Exam Report file
 ;      DFN,DTI,CNI = pointers to Rad Patient File for the exam
 ;   UPDFLAG = 1/0 -- 1 to indicate CLOSE was called from subroutine
 ;                    STATUS, above (which has already called GETEXAM)
 ;    MAGGRY = return results of the Close in @MAGGRY
 ; This subroutine may be called directly (to close a case without
 ; doing a status update), or is called from tag STATUS, above, when
 ; also doing a status update
 ;
 N $ETRAP,$ESTACK S $ETRAP="D ERR^MAGJUPD1"
 N RPT,DFN,DTI,CNI,MAGRET,REPLY,RARPT,UPDFLAG,RIST,DAYCASE,NLOCKS
 S DFN=$P(DATA,U),DTI=$P(DATA,U,2),CNI=$P(DATA,U,3),RPT=$P(DATA,U,4),UPDFLAG=$P(DATA,U,5)
 S LOCKDATA=""
 I $P($G(^MAG(2006.69,1,0)),U,4)
 E  S REPLY=$S(UPDFLAG:"0^3~Updates not allowed at this site--no action taken",1:"") G CLOSEZ   ;   Status Update NOT Enabled
 S RIST=+MAGJOB("USER",1) I RIST
 E  S REPLY=$S(UPDFLAG:"0^3~Update allowed only by a radiologist--no action taken",1:"") G CLOSEZ  ; need only unlock a radiologist
 I DFN,DTI,CNI
 E  S REPLY="0^4~Request Contains Invalid Case Pointer ("_RPT_")--no action taken" G CLOSEZ
 ;
 I 'UPDFLAG N RADATA D  I 'MAGRET G CLOSEZ
 . D GETEXAM2^MAGJUTL1(DFN,DTI,CNI,0,.MAGRET)
 . I 'MAGRET S REPLY="0^4~No Current Case accessible to close--no action taken"
 . E  S RADATA=$G(^TMP($J,"MAGRAEX",1,1))
 S RARPT=$P(RADATA,U,10),DAYCASE=$P(RADATA,U,12)
 I RARPT,DAYCASE
 E  S REPLY="0^4~Current Case not accessible to close--no action taken" G CLOSEZ
 S LOCKDATA=$G(^XTMP("MAGJ","LOCK",RARPT))
 I DUZ'=+LOCKDATA S X=+LOCKDATA D  S LOCKDATA="" G CLOSEZ
 . I UPDFLAG S REPLY="0^3~Case #"_DAYCASE_$S(X:" locked by "_$$USERINF^MAGJUTL3(X,.01),1:" not locked by "_$P(MAGJOB("USER",1),U,2))_"--No Status update performed"
 . E  S REPLY="0^1~ "  ; case wasn't opened by this R'ist; nothing to do
 S NLOCKS=+$G(^XTMP("MAGJ","LOCK",RARPT,DAYCASE))
 I NLOCKS D  ; w/ incremental lock, is possible to have >1 lock applied
 . K ^XTMP("MAGJ","LOCK",RARPT,DAYCASE)
 . I $D(^XTMP("MAGJ","LOCK",RARPT))=1 K ^XTMP("MAGJ","LOCK",RARPT)
 . F I=1:1:NLOCKS L -^XTMP("MAGJ","LOCK",RARPT)
 I UPDFLAG,NLOCKS S REPLY=1_U_RIST
 E  S REPLY="0^1~Case #"_DAYCASE_" Unlocked--No Status Update performed."
CLOSEZ S MAGGRY=REPLY
 Q
END Q  ;
