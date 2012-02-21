MAGJLS2B ;WIRMFO/JHC VistARad RPC calls ; 29 Jul 2003  9:59 AM
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
 ; Subroutines for fetching Exam Info for Radiology Workstation
 ;
PARAMS(X) ; Initialize some variables used for Exam Lists
 N LASTEDIT
 S LSTID=+$O(^MAG(2006.631,"C",X,""))
 I 'LSTID S LSTID="Invalid List ID" Q  ;
 S X=^MAG(2006.631,LSTID,0)
 I '$P(X,U,6) S LSTID="LIST NOT ENABLED" Q  ;
 S LSTTL=$P(X,U),LSTREQ=$P(X,U,3),LSTPARAM=LSTREQ_U_$P(X,U,4),LASTEDIT=$P(X,U,5)
 S LSTTL=$S(LSTREQ="U":"UNREAD",LSTREQ="R":"RECENT",LSTREQ="A":"ACTIVE",LSTREQ="P":"PENDING",LSTREQ="N":"NEWLY INTERP",1:"")_" EXAMS: "_LSTTL
 I $P(LSTPARAM,U,2)="" S $P(LSTPARAM,U,2)="ALL" ; dflt All ImagingTypes
 S X=$G(^MAG(2006.69,1,0)),BKGND=+$P(X,U,8),DELTA=+$P(X,U,$S(LSTREQ="U":9,1:13))*60
 I BKGND,'DELTA S DELTA=360 ;dflt Unread List compile cycle time secs
 S LSTNAM="LS"_LSTID
 I BKGND S LSTNAM=$S(LSTREQ="U":"LS9991",LSTREQ="R":"LS9992",LSTREQ="N":"LS9995",1:LSTNAM) ; hard-code for "Master" list Bkgnd compile
 Q
 ;
SETVARS(LSTID) ; build output control variables
 D LSTVAR(LSTID),SRTVAR(LSTID),SELVAR(LSTID)
 Q
 ;
LSTVAR(LSTID) ; build output columns string
 S MDLVAR=^MAG(2006.631,LSTID,"DEF",1),LSTHDR=^(.5)
 N I,XX,SC,XOUT,XOUT2
 S SC=";",XOUT="",XOUT2=""
 F I=1:1:$L(MDLVAR,U) S XX=$P(MDLVAR,U,I) D
 . I +XX=12 I '$G(SNDREMOT) Q  ; exclude RC ind
 . I +XX=23 I '$G(SHOWPLAC) Q  ; exclude PLACE
 . S XOUT=XOUT_$S(XOUT="":"",1:U)_XX
 . S XOUT2=XOUT2_$S(XOUT2="":"",1:U)_$P(LSTHDR,U,I)
 S MDLVAR=XOUT,LSTHDR=XOUT2
 Q
SRTVAR(LSTID) ; build sort-variables indirect string in SORTSS
 ;  this string is referenced indirectly when compiling output list (see tag LSTOUT)
 S MDSVAR=^MAG(2006.631,LSTID,"DEF",2)
 N I,XX,XOUT,HAVEONE
 S SORTSS="",XOUT="",HAVEONE=0
 F I=1:1:$L(MDSVAR,U) S XX=$P(MDSVAR,U,I) D
 . I +XX=12 Q:'$G(SNDREMOT)   ; exclude RC ind
 . I +XX=23 I '$G(SHOWPLAC) Q  ; exclude PLACE
 . I 'HAVEONE S HAVEONE=(+XX=1)  ; 1 = Case #
 . S XOUT=XOUT_$S(XOUT="":"",1:U)_XX
 . S XX=$S(XX?1N.N1"-":"-",1:"")_"MD("_+XX_")"
 . S SORTSS=SORTSS_","_XX
 I 'HAVEONE S SORTSS=SORTSS_",MD(1)",XOUT=XOUT_U_1  ; guarantee unique entry each exam
 I $E(SORTSS)="," S SORTSS=$E(SORTSS,2,999)
 S MDSVAR=XOUT
 Q
 ;
SELVAR(LSTID) ; build selection logic executes, ret in DIS array
 N CX,DC,DCX,DL,DLX,EXP,I,IDL,SELVAR,SELVAR2,SS
 S SS=0 F  S SS=$O(^MAG(2006.631,LSTID,"DEF",3,SS)) Q:'SS  S DC(SS)=^(SS)
 S SS=0 F I=1:1 S SS=$O(^MAG(2006.631,LSTID,"DEF",4,SS)) Q:'SS  S DL(I)=^(SS)
 ;  DL(5)="^2^3'^" <DLX     CX=3'    DC(2)="1^>44" <DCX
 K DIS,MDCVAR S DIS(0)=0
 F IDL=1:1 S DLX=$G(DL(IDL)) Q:DLX=""  S DIS(0)=DIS(0)+1,DIS(DIS(0))="" D
 . F I=2:1:$L(DLX,U)-1 S CX=$P(DLX,U,I) S DCX=DC(+CX) D
 .. S EXP="(MD("_+DCX_")"_$P(DCX,U,2)_")"
 .. S EXP="I "_$S(CX["'":"'",1:"")_EXP
 .. S DIS(DIS(0))=DIS(DIS(0))_" "_EXP
 .. S MDCVAR(+DCX)=""
 Q
 ;
CHKLOCK(RARPT) ; If exam is locked, return initials of locking user
 ; Also return truth flag for locking user = logon user
 N X S X="" I RARPT D
 . L +^XTMP("MAGJ","LOCK",RARPT):0 I  D
 .. S X=$G(^XTMP("MAGJ","LOCK",RARPT)) I X]"" S X=$P(X,U)_U_($P(X,U)=DUZ)
 .. L -^XTMP("MAGJ","LOCK",RARPT)
 . E  S X=$P($G(^XTMP("MAGJ","LOCK",RARPT)),U)_U_0
 I X]"" S $P(X,U)=$S(+X:$$USERINF^MAGJUTL3(+X,1),1:"Unknown")
 Q X
 ;
SHOWPLAC(X) ; return list of places to show: all defined places NOT equal to
 ; the user's logon place
 N IEN,SHOWPLAC S SHOWPLAC=""
 S IEN=0 F  S IEN=$O(^MAG(2006.1,IEN)) Q:'IEN  I IEN'=+MAGJOB("SITEP") S X=$P(^(IEN,0),U,9) I X]"" S SHOWPLAC=SHOWPLAC_","_X
 I SHOWPLAC]"" S SHOWPLAC=1_U_SHOWPLAC_"," ; 1 for logical true
 Q SHOWPLAC
 ;
LSTOUT(MAGGRY,LSTID,MAGLST,LSTAGE) ; Build output list, w/ sort & selection
 ;  Input: LSTID=List def'n
 ;         MAGLST=Indirect global ref for input records; all reads use subscript indirection
 ;       the nodes in @MAGLST contain:
 ;       
 ;  Node1=DFN ^ DTI ^ CNI ^ PtName ^ SSN ^ Img Date/Time(?) ^ Exam Date ^ Acn# ^ Proc ^ RARPT
 ;        ^ Status IEN ^ DAYCASE ^ Img Loc'n ^ Status Text ^ Status Order ^ RADTPRT ^ CPT Code ^ ImgTypABB
 ;  Node2=REQLOCA ^ REQLOCName ^ Interp Rad'ist ^ Complication ind. ^ Division ^ Site ^ Rist Is Me?
 ;        ^ Proc. Mod._U_REQLOCType
 ;
 ; Output: MAGGRY=Indirect ref to output file
 ; 
 N DIS,MDCVAR,SNDREMOT,ILST,IMD,MAGRACNT
 N RARPT,RAST,RADFN,RACNI,RADTI,T,WHOLOCK,XX,MYLOCK,DAYCASE,MODALITY
 N OUT,QX,SORT,SORTSS,LSTHDR,MD,MDLVAR,MDSVAR,REMONLY,REMOTCAS,SHOWPLAC,SORTLEN
 S LSTAGE=$G(LSTAGE)
 ;<*> DIVSCRN= { "": n/a; DIV: This DIV Only, or List of OK DIVs }
 ;                               ,DIV1,DIV2,
 ;     ??? H2 determine case for divscrn=0 ?
 I '$G(MAGJOB("CONSOLIDATED")) S DIVSCRN=""
 E  S DIVSCRN=","_DUZ(2)_","
 ;      Show any Place (Site Code) that is NOT the Login Place
 S SHOWPLAC=$$SHOWPLAC("")
 S X=^MAG(2006.69,1,0)
 S REMONLY=$G(MAGJOB("REMOTE"))&+$P(X,U,10) ;only show remote cache?
 S SNDREMOT=+$P(X,U,11) ; Site routes images remotely?
 D SETVARS(LSTID)
 S MAGRACNT=0
 S SORT="^TMP("_$J_",""MAGJSORT""",SORTLEN=$L(SORT) K ^TMP($J,"MAGJSORT")
 K ^TMP($J,"RET") S ^TMP($J,"RET",0)="0^4~Getting Exam List"
 S X=$G(@MAGLST@(0,1)) I +X<1 D  G LSTOUTZ  ; No exams to list!
 . I X="" S ^TMP($J,"RET",0)="0^4~Problem with Exams List Compile"
 . E  S ^TMP($J,"RET",0)=X
 ; <*>On the OUTPUT side, may want to package global nodes w/ a structure
 ;  that Delphi side "likes"--perhaps a tag for each output line, so that
 ;  if need to break lines up, they can be re-assembled: var OUT below
 ;
 F ILST=1:1 Q:'$D(@MAGLST@(ILST))  S XX=^(ILST,1),XX2=^(2) K MD D  ; node contents described above
 . S XX=XX_U_$P(XX2,"|"),$P(XX2,"|")="" ;<*> string could get long ...
 . ; Execute Selection logic:
 . S X=0 F  S X=$O(MDCVAR(X)) Q:'X  S MD(X)=$P(XX,U,X) ; load needed data
 . I 1 F I=1:1:$G(DIS(0)) X DIS(I) I  Q  ; quit loop if search logic True
 . E  Q  ; failed selection criteria--skip this record
 . S RAST=$P(XX,U,16)
 . S T=$P(XX2,"|",2),RADFN=$P(T,U),RADTI=$P(T,U,2),RACNI=$P(T,U,3),RARPT=$P(T,U,4)
 . I LSTREQ="U",'$D(^RADPT("AS",RAST,RADFN,RADTI,RACNI)) Q  ; No longer Unread Status!
 . I LSTREQ="U",(DIVSCRN]"") S RADIV=","_$P(XX,U,22)_"," I '(DIVSCRN[RADIV) Q  ; Screen Unread exams for DIVision
 . S REMOTCAS=$P(XX,U,12)
 . I REMONLY,'REMOTCAS Q  ; don't show if not the remote reading site
 . I REMONLY,REMOTCAS D  I 'T Q
 . . F I=1:1:$L(REMOTCAS,",")+1 S T=$P(REMOTCAS,",",I) I T,$D(MAGJOB("LOC",T)) Q
 . ; set up sort values, creating sort index w/ indirect reference to sort global
 . F I=1:1:$L(MDSVAR,U) S X=+$P(MDSVAR,U,I) S MD(X)=$P(XX,U,X) I MD(X)="" S MD(X)="~"
 . S @(SORT_","_SORTSS_")")=ILST_U_RARPT
 . S MAGRACNT=MAGRACNT+1
 I 'MAGRACNT S ^TMP($J,"RET",0)="0^2~No Exams Found"
 E  D  ; generate output file
 . S @(SORT_","_-9999999999_")")=0,QX=SORT_")" ; define $Query var.; initialize beginning w/ dummy entry
 . ; proceed thru sort index until the string contained in SORT is not present
 . ; fetch data using indirect references to the stored data
 . F ILST=0:1 S QX=$Q(@QX) Q:($E(QX,1,SORTLEN))'=SORT  S XX=@MAGLST@(+(@QX),1),XX2=^(2),OUT="" D
 .. I 'ILST D  Q       ; Header string
 ... S T="" I LSTAGE?1N.N S T=LSTAGE\60 S T=" (List age: "_$S(T:T_" min, ",1:"")_(LSTAGE#60)_" sec)"
 ... I +$P(XX,U,2)=1 S $P(XX,"~",2)=LSTTL_T  ; List Title
 ... S ^TMP($J,"RET",0)=XX
 .. S XX=XX_U_$P(XX2,"|"),$P(XX2,"|")=""
 .. S RARPT=$P(@QX,U,2)
 .. S T=$$CHKLOCK(RARPT),WHOLOCK=$P(T,U),MYLOCK=$P(T,U,2)
 .. S $P(XX,U,2)=WHOLOCK
 .. S MODALITY=$P(XX,U,15)
 .. F IMD=1:1:$L(MDLVAR,U) S X=$P(MDLVAR,U,IMD),MD=$P(XX,U,+X) D
 ... I +X=12,(MD]""),SNDREMOT D
 .... ; if site routes images remotely, display Remote Cache indicator
 .... N I,T I $G(MAGJOB("REMOTE")) D  Q  ; user is at a remote site
 ..... F I=1:1:$L(MD,",")+1 S T=$P(MD,",",I) I T,$D(MAGJOB("LOC",T)) Q
 ..... I T S MD=$P($G(^MAG(2005.2,T,3)),U,5)
 ..... E  S MD=""  ; user not at the site that got this exam's images
 .... E  N T S T="" D  Q  ; user is at sending site
 ..... F I=1:1:$L(MD,",") S T=T_$S(T="":"",1:",")_$P($G(^MAG(2005.2,$P(MD,",",I),3)),U,5)
 ..... S MD=T
 ... I +X=23,(MD]""),SHOWPLAC D
 .... I SHOWPLAC'[(","_MD_",") S MD=""  ; Don't show user's local place
 ... I +X=22,(MD]"") D
 .... I DIVSCRN[(","_MD_",")!(DIVSCRN="") S MD=""  ; Don't show user's local Division
 ... I X[";" S T=+$P(X,";",2) I T S MD=$E(MD,1,T)  ; truncate output col
 ... S $P(OUT,U,IMD)=MD
 .. S $P(OUT,U,IMD+1)="",OUT=U_OUT,OUT=OUT_"|"_$P(XX2,"|",2,9)
 .. I WHOLOCK]"" S T=$P(OUT,"|",4),$P(T,U,2)=WHOLOCK,$P(T,U,3)=MYLOCK,$P(OUT,"|",4)=T ; pass lock info to Server
 .. S T=$P(OUT,"|",4),$P(T,U,4)=MODALITY,$P(OUT,"|",4)=T
 .. S ^TMP($J,"RET",ILST+1)=OUT
 . S ^TMP($J,"RET",1)=U_LSTHDR
 . S $P(^TMP($J,"RET",0),U)=MAGRACNT
LSTOUTZ K MAGGRY,^TMP($J,"MAGJSORT") S MAGGRY=$NA(^TMP($J,"RET"))
 Q
 ;
END Q  ;
 ;
