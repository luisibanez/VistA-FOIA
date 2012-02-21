MAGJEX1 ;WIRMFO/JHC VistARad RPC calls ; 29 Jul 2003  9:56 AM
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
 ; Entry Points:
 ;   OPENCASE--Open Exam
 ;
ERR N ERR S ERR=$$EC^%ZOSV S @MAGGRY@(0)="0^4~"_ERR
 D @^%ZOSF("ERRTN")
 Q:$Q 1  Q
 ;
OPENCASE(MAGGRY,DATA) ; RPC Call: MAGJ RADCASEIMAGES
 ; MAGGRY holds $NA reference to ^TMP for Broker return message;
 ;   all ref's to MAGGRY use subscript indirection
 ; input in DATA:
 ; OPEN_FLAG^RADFN^RADTI^RACNI^RARPT^SERDISA^STK/LAY^USETGA
 ; OPEN_FLAG = 1/0 - 1: OPEN the case for update; else, view-only
 ; RADFN^RADTI^RACNI specify case of interest
 ; SERDISA = 1/0 - Disable Mult Series processing if true
 ; STK/LAY = 1/0 - 1:Open in Stack; 0:Open in Layout
 ; USETGA  = 1/0 - 1:Open .TGA file; 0:Open .BIG file
 ;
 N $ETRAP,$ESTACK S $ETRAP="D ERR^MAGJEX1"
 N RARPT,RADFN,RADTI,RACNI,RADIV
 N DAYCASE,CURCASE,REPLY,CT,MAGS,STARTNOD,LOCKED,DATAOUT,RADATA,RIST,MDL
 N IMAG,MAGXX,MAGFILE,MAGFILE1,MAGFILE2,MAGFILE3,MAGLST,MAGOBJT,MODALITY
 N SERDISA,MAGSTRT,MAGEND,SERLBL,SERBRK,SERLIM,NSERIES,ALTPATH,CURPATHS
 N MIXEDUP,VIEWOK,STKLAY,USETGA,OPENCNT,USELORES,IMGST,REMOTE
 S DIQUIET=1 D DT^DICRW
 S CT=0,MODALITY="",DATAOUT="",DAYCASE="",MAGLST="MAGJOPENCASE",ALTPATH="",MIXEDUP=0,VIEWOK=1,OPENCNT=1
 ;
 ; <*> Next line assumes only 1 exam at a time--remove to
 ; implement more complex msgs (e.g., >1 case per call)
 K MAGGRY S MAGGRY=$NA(^TMP($J,MAGLST)),STARTNOD=0 K @MAGGRY  ; assign MAGGRY value
 ; S STARTNOD=$G(@MAGGRY@(0))+1 ; <*> enable this line if remove above
 ; I STARTNOD=1 K @MAGGRY       ;  ditto
 ;
 S CURCASE=$P(DATA,U),RARPT=+$P(DATA,U,5),SERDISA=+$P(DATA,U,6)
 S STKLAY=+$P(DATA,U,7),USETGA=+$P(DATA,U,8)
 S RADFN=$P(DATA,U,2),RADTI=$P(DATA,U,3),RACNI=$P(DATA,U,4)
 I RADFN,RADTI,RACNI D GETEXAM2^MAGJUTL1(RADFN,RADTI,RACNI,"",.X)
 I 'X S REPLY="4~Request Contains Invalid Case Pointer ("_RADFN_U_RADTI_U_RACNI_U_RARPT_")." G OPENCASZ
 S RADATA=$G(^TMP($J,"MAGRAEX",1,1))
 S RADIV=$P($G(^TMP($J,"MAGRAEX",1,2)),U,5) K ^TMP($J,"MAGRAEX")
 S RARPT=+$P(RADATA,U,10),DAYCASE=$P(RADATA,U,12)
 I 'RARPT!'$D(^RARPT(RARPT,2005)) S REPLY="4~This exam has no images associated with it." G OPENCASZ
 D CKINTEG^MAGJLST1(.X,RADFN,RADTI,RACNI,RARPT,RADATA)
 I X]"" S MIXEDUP=1,MIXEDUP("REPLY")=X ; DB corruption
 S REPLY="4~Attempting to open/display case #"_DAYCASE
 S IMGST=$$JBFETCH^MAGJUTL2(RARPT,.MAGS,USETGA)  ; open only if NOT on JB
 I +IMGST D  G OPENCASZ
 . I $D(MAGS("OFFLN")) N T,TT S T="",TT="" D
 .. F  S T=$O(MAGS("OFFLN",T)) Q:T=""  S TT=TT_$S(TT="":"",1:", ")_T
 .. S REPLY="2~Case #"_DAYCASE_"--Images for this exam are stored OFF-LINE.  To view these images, contact your Imaging Coordinator, and request mounting of the following platters: "_TT
 . E  S REPLY="2~Case #"_DAYCASE_"--"_+IMGST_" Images have been requested from Jukebox; try again later."
 I '$P(IMGST,U,2) S REPLY="2~No Images exist for Case #"_DAYCASE_"." G OPENCASZ
 S USELORES=+$P(IMGST,U,3)_U_$P(IMGST,U,2)
 ; set up series info
 I STKLAY,SERDISA S STKLAY=3 ; disable series in Stacker
 N SERHI S SERHI=$G(MAGS("SER",0))
 K SERBRK
 I SERHI>1,$P($G(^MAG(2006.69,1,0)),U,12) D  ;  Process for mult. Series
 . Q:SERDISA  ; user disabled from w/s
 . Q:STKLAY  ; <*> Don't do this for Stacker
 . N SERCT,SERSTR I '$D(SERLIM) S SERLIM=5 ; min size for a series
 . S SERSTR="",SERCT=0,SERBRK(0)=0
 . ; step 1: roll up "small" series at the bottom to next higher ones
 . F  Q:(MAGS("SER",SERHI)'<SERLIM)!(SERHI=1)  D
 .. S X=MAGS("SER",SERHI),Y=MAGS("SER",SERHI-1),Y=Y+X_U_$P(Y,U,2)_", "_$P(X,U,2)
 .. S SERHI=SERHI-1,MAGS("SER",SERHI)=Y
 . I SERHI<2 K SERBRK Q  ; no "real" series to enumerate
 . ; step 2: from top, fold "small" series into next lower ones
 . F I=1:1:SERHI S X=MAGS("SER",I),SERCT=SERCT+X D
 .. I +X'<SERLIM S SERBRK(SERCT)=SERSTR_$S(SERSTR="":"",1:", ")_$P(X,U,2),SERSTR="",SERBRK(0)=SERBRK(0)+1
 .. E  S SERSTR=SERSTR_$S(SERSTR="":"",1:", ")_$P(X,U,2)
 . I '$D(SERBRK(SERCT)) S SERBRK(SERCT)=SERSTR,SERBRK(0)=SERBRK(0)+1
 . I SERBRK(SERCT)<2 K SERBRK  ; only one "series" resulted
 I $D(SERBRK) S SERBRK=0,NSERIES=SERBRK(0) D
 . F  S MAGSTRT=SERBRK+1,SERBRK=$O(SERBRK(SERBRK)) Q:'SERBRK  S MAGEND=SERBRK,SERLBL="*S^Series "_SERBRK(SERBRK) D IMGLOOP^MAGJEX1B
 E  S MAGSTRT=1,MAGEND=MAGS,NSERIES=1 D IMGLOOP^MAGJEX1B
 S REPLY="0~Images for Case #"_DAYCASE
 ;
OPENCASZ I 'CT,(REPLY["Attempting") S REPLY="4~Unable to retrieve images for Case #"_DAYCASE_"."
 ;
 ; Contents of successful reply = 4 pipe ("|") pieces:
 ;1: # nodes below ^ Reply Msg Type ~ Reply Msg display text
 ;2: Exam ID String (= radfn^radti^racni^rarpt)
 ;3: Pt Name ^ CASE # ^ # Images ^ Proc. Name ^ Exam Date ^ Time ^
 ; modality ^ SSN ^ Stack/Layout ^ LOCKED? (1/0) [^ if only 1 series]
 ;4: Is Radiologist? ^ # Series ^ Alt_Path Flag ^ Opened Exam Count?
 ;
 S LOCKED=0
 I MIXEDUP D
 . S VIEWOK=$S($D(MAGJOB("KEYS","MAGJ SEE BAD IMAGES")):1,1:0)
 . I MIXEDUP>1 D
 .. S XPTS="",XDFN=0 F IMIX=0:1 S XDFN=$O(MIXEDUP(XDFN)) Q:'XDFN  S XPTS=XPTS_$S(IMIX:" and ",1:" ")_$$PNAM(XDFN)
 .. S XPTS=$S(IMIX=1:" ",1:"s ")_XPTS
 .. S REPLY=(7-VIEWOK)_"~This exam is registered for "_$$PNAM(RADFN)_"; however, it is linked to images for patient"_XPTS_".  This is a serious problem--immediately report it to Radiology management and Imaging support staff!"
 . E  S REPLY=(7-VIEWOK)_"~"_MIXEDUP("REPLY")
 . I CURCASE S REPLY=REPLY_"  The exam is NOT Locked." S CURCASE=0
 I CT D
 . I CURCASE,$G(MAGJOB("CONSOLIDATED")),(RADIV'=DUZ(2)) D  S CURCASE=0
 .. S REPLY="5~Exam is for Station #"_$$STATN(RADIV)_"; you are logged on to #"_$$STATN(DUZ(2))_".  Exam is NOT Locked."
 . S RIST=$S(+MAGJOB("USER",1):1,1:0)
 . I CURCASE,RIST,'USELORES D LOCK  ; lock only for Current Case for Radiologist
 . S DATAOUT=$P(RADATA,U,4)_U_DAYCASE_U_$P(RADATA,U,9)
 . S X=$P(RADATA,U,6),T=$L(X,"  "),X=$P(X,"  ",1,T-1)_U_$P(X,"  ",T)
 . S DATAOUT=DATAOUT_U_X
 . S DATAOUT=DATAOUT_U_MODALITY_U_$P(RADATA,U,5)_U_STKLAY_U_LOCKED_$S(NSERIES>1:"",1:U)
 . S DATAOUT=DATAOUT_"|"_RIST_U_NSERIES_U_ALTPATH_U_OPENCNT
 . I USELORES D
 .. I +USELORES=+$P(USELORES,U,2) S X="All"
 .. E  S X=+USELORES_" of "_+$P(USELORES,U,2)
 .. I $E(REPLY,1,8)="0~Images" S REPLY="3~"
 .. E  S REPLY=REPLY_"  --  "
 .. S REPLY=REPLY_"Note: "_X_" images for Case #"_DAYCASE_" are REDUCED RESOLUTION images, using parameters set by your site Imaging Manager; to view full-resolution images, disable the Reduced Resolution option setting. Exam NOT Locked."
 S @MAGGRY@(STARTNOD)=CT_U_REPLY_"|"_RADFN_U_RADTI_U_RACNI_U_RARPT_"|"_DATAOUT
 ; if mixedup & not have keys to see images, delete image refs
 ;   & send only reply msg
 I MIXEDUP,('VIEWOK) S CT=0 K @MAGGRY S @MAGGRY@(0)=CT_U_REPLY
 E  S $P(@MAGGRY@(0),U)=CT+STARTNOD
 ; Image access log
 I CT D
 . I MAGJOB("ALTPATH") S REMOTE=$P(MAGJOB("ALTPATH"),U,2)
 . E  S REMOTE=0
 . D LOG^MAGJUTL3("VR-VW",RADFN,+$P(MAGS(1),U,4),+MAGS,REMOTE)
 . ; for locked exam, save data needed to log Interpreted event
 . I LOCKED S X=^XTMP("MAGJ","LOCK",RARPT)_U_RADFN_U_+$P(MAGS(1),U,4)_U_+MAGS_U_REMOTE,^(RARPT)=X
 Q
 ;
 ;
PNAM(X) ; return pt name for input DFN
 I X S X=$G(^DPT(+X,0)) I X]"" S X=$P(X,U)
 E  S X="UNKNOWN"
 Q X
 ;
STATN(X) ; get station #, else return input value
 N T
 I X]"" D GETS^DIQ(4,X,99,"","T") S T=$G(T(4,X_",",99,"E")) I T]"" S X=T
 Q X
 ;
LOCK ; A radiologist may lock multiple cases at a time. Each case
 ;   must have Exam Status ~= Examined, AND not be already locked
 ; NOTE: locking only ONE exam in a Printset
 ;  effectively locks ALL Printset exams
 I '$P($G(^MAG(2006.69,1,0)),U,4) Q  ;  Status Updates not enabled
 S X=$P(^RADPT(RADFN,"DT",RADTI,"P",RACNI,0),U,3)
 I '$D(^RA(72,"AVC","E",X)) S REPLY="5~For Case #"_DAYCASE_", current Status is "_$P(^RA(72,X,0),U)_"; Status Update will NOT be allowed." Q
 L +^XTMP("MAGJ","LOCK",RARPT):0
 I  S LOCKED=1 D
 . S X=$G(^XTMP("MAGJ","LOCK",RARPT)) I X]"",($P(X,U)'=DUZ) D
 .. S X=$S(+X:$$USERINF^MAGJUTL3(+X,1),1:"Unknown")
 .. S REPLY="3~Case #"_DAYCASE_" was previously locked by "_X_".  The lock is now assigned to you."
 . E  S REPLY="1~#"_DAYCASE_" ("_$P(RADATA,U,4)_") locked for update by "_$P(MAGJOB("USER",1),U,3)
 . S ^XTMP("MAGJ","LOCK",RARPT)=DUZ_U_$J_U_$H
 . S X=+$G(^XTMP("MAGJ","LOCK",RARPT,DAYCASE))+1,^(DAYCASE)=X_U_$J_U_$H
 ; above line counts # of locks, to account for mult open of same exam
 ; --needed to manage UN-Locks when close the exams
 E  S X=$P($G(^XTMP("MAGJ","LOCK",RARPT)),U) D
 . I DUZ'=X S X=$S(+X:$$USERINF^MAGJUTL3(+X,.01),1:"Unknown"),REPLY="5~Case #"_DAYCASE_" is Locked by "_$P(X,",",2)_" "_$P(X,",")_"; Status Update will NOT be allowed."
 . E  S REPLY="3~Case #"_DAYCASE_" is already locked by you, perhaps at another workstation."  ; will not cause a problem on either end
 Q
 ;
END ;
