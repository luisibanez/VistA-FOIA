MAGJUTL3 ;WIRMFO/JHC VistRad subroutines for RPC calls ; 29 Jul 2003  10:03 AM
 ;;3.0;IMAGING;**16,9,22**;Jul 29, 2003
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
 ;Entry points:
 ;  LISTINF -- send Custom Exam List data to Server
 ;  LOGOFF -- update session file at logoff
 ;  CACHEQ -- At logon, assorted initializations and sets up assorted data for the session
 ;  PINF1 -- Patient info returned to W/S
 ;  LOG -- Update image access logs
 ;
LISTINF(MAGGRY) ; RPC: MAGJ CUSTOM LISTS
 ;  send Exam List data to Server
 ; Return Info in ^TMP($J,"MAGJLSTINF",0:N) (@MAGGRY)
 ;     0)= # Entries below (0:n)
 ;   1:n)= Button Label^List #^Button Hints text^List Type
 ;
 ; MAGGRY holds $NA reference to ^TMP where Broker return message is assembled;
 ;   all references to MAGGRY use subscript indirection
 ;
 ; variable GLB holds $NA reference to ^MAG(2006.631), Custom List file
 ;   all references to GLB use subscript indirection to fetch data from this file
 ;
 N D0,GLB,INF,MAGLST,NAM,T
 S MAGLST="MAGJLSTINF"
 K MAGGRY S MAGGRY=$NA(^TMP($J,MAGLST)) K @MAGGRY S @MAGGRY@(0)=0
 S GLB=$NA(^MAG(2006.631)),NAM=""
 F  S NAM=$O(@GLB@("B",NAM)) Q:NAM=""  S D0="" D
 . S D0=$O(@GLB@("B",NAM,D0)) Q:'D0  D
 . . S X=$G(@GLB@(D0,0)) Q:($P(X,U,2)>9000)!'$P(X,U,6)  ; List Active & User-defined
 . . S INF="" F I=1:1 S T=$P("7^2^1^3",U,I) Q:T=""  S Y=$P(X,U,T) Q:Y=""  S $P(INF,U,I)=Y
 . . Q:T'=""  ; req'd fields not all there
 . . S T=@MAGGRY@(0)+1,^(0)=T,^(T)=INF ; add this list entry to reply message
 Q
 ;
LOG(ACTION,RADFN,MAGIEN,NIMGS,REMOTE) ; Log exam access
 N PTCT,TXT
 I ACTION="" S ACTION="UNKNOWN"  ; Should never happen
 S PTCT=RADFN'=$G(MAGJOB("LASTPT",ACTION))
 I PTCT S MAGJOB("LASTPT",ACTION)=RADFN
 S TXT=ACTION_U_RADFN_U_MAGIEN_U_U_U_NIMGS
 S TXT=TXT_U_PTCT_U_$S(+MAGJOB("USER",1):1,1:0)_U_REMOTE
 ; Session Log
 D ACTION^MAGGTAU(TXT,1)
 ; Mag Log
 I REMOTE S ACTION=ACTION_"/REM"
 D ENTRY^MAGLOG(ACTION,+DUZ,MAGIEN,"VRAD:"_MAGJOB("VRVERSION"),RADFN,NIMGS)
 Q
 ;
LOGOFF(MAGRY,DATA) ; RPC: MAGJ LOGOFF -- Call when session is over.
 ; update session file with logoff time & mark the session entry closed
 ;
 D LOGOFF^MAGGTAU(.MAGRY)
 Q
 ;
CACHEQ(MAGGRY,DATA) ; RPC: MAGJ CACHELOCATION
 ; logon initializations for the session
 ; Query host for Local Cache paths for Remote Reading
 ; input in DATA: WSLOC
 ;  - WSLOC   = Workstation Location
 ;  - VRADVER = VistaRad Client Version
 ;  - OSVER   = Client OS Version
 ; Return Info in ^TMP($J,"MAGJCACHE",0:N) (@MAGGRY)
 ;     0)= # Entries below (0:n)
 ;   1:n)= PhysName^Subdirectory^HashFlag^Username^Password
 ;
 ; MAGGRY holds $NA reference to ^TMP where Broker return message is assembled
 ;   references to MAGGRY use subscript indirection
 ;   
 ; Also builds local array:
 ;    MAGJOB("LOC",NetworkLocnIEN)=Site Abbreviation
 ;    MAGJOB("REMOTE")=1/0  (T/F for "User is reading at Remote Loc'n")
 ;    MAGJOB("WSLOC")=Workstation_Location String
 ;    MAGJOB("WSLOCTYP")=Workstation_Location Type
 ;    MAGJOB("WSNAME")=Workstation ID
 ;    MAGJOB("VRVERSION")=VRAD Version
 ;    MAGJOB("OSVER")=O/S Version
 ;    MAGJOB("ALTPATH")=1/0 ^ 1/0 (T/F Alternate Paths are defined 
 ;               ^ Alt Paths are Enabled/Disabled for most recent exam)
 ;
 S X="ERR^MAGJEX1",@^%ZOSF("TRAP")
 ;
 N I,MAGLST,REPLY,TMP,WSLOC,XX,VRADVER,OSVER
 S DIQUIET=1 D DT^DICRW
 S REPLY=0,MAGLST="MAGJCACHE"
 K MAGGRY S MAGGRY=$NA(^TMP($J,MAGLST)) K @MAGGRY
 S WSLOC=$P(DATA,U),VRADVER=$P(DATA,U,2),OSVER=$P(DATA,U,3)
 S MAGJOB("OSVER")=$S(OSVER]"":OSVER,1:"UNK")
 S MAGJOB("VRVERSION")=$S(VRADVER]"":VRADVER,1:"UNK")
 S X=$P($G(IO("CLNM")),".")
 S MAGJOB("WSNAME")=$S(X]"":X,1:"VistaradWS")
 ;
 ; Since this function is executed at user Login, use the opportunity to
 ; initialize various things
 ;
 D REMLOCK
 D MAGJOB ; Inits magjob array
 S MAGJOB("WSLOCTYP")=$S(+MAGJOB("USER",1):"RAD",1:"Non-Rad")
 I '$D(MAGJOB("WRKSIEN")) D
 . S X=MAGJOB("WSNAME")_"^^^"_MAGJOB("WSLOCTYP")_U_U_U_U_1_U_MAGJOB("OSVER")_U_MAGJOB("VRVERSION")
 . D UPD^MAGGTAU(.Y,X)
 ;
 ; get cache location info
 S MAGJOB("WSLOC")=WSLOC,MAGJOB("REMOTE")=0,MAGJOB("ALTPATH")="0^0"
 I WSLOC]"" D
 . S X=$P($G(^MAG(2006.1,+MAGJOB("SITEP"),0)),U,9)
 . I X]"",(X'=WSLOC) S MAGJOB("REMOTE")=1
 . E  Q
 . D LIST^MAGBRTLD(WSLOC,.TMP)
 . I TMP S REPLY=TMP,MAGJOB("ALTPATH")="1^1" F I=1:1:TMP D
 . . S XX=$P(TMP(I),U,1,5),X=$P(XX,U,3),$P(XX,U,3)=$S(X="Y":1,1:0)
 . . S X=$P(XX,U,4),$P(XX,U,4)=$P(XX,U,5),$P(XX,U,5)=X
 . . S @MAGGRY@(I)=XX,MAGJOB("LOC",$P(TMP(I),U,7))=$P(TMP(I),U,6)
 S @MAGGRY@(0)=REPLY
CACHEQZ Q
 ;
REMLOCK ;  Remove dangling exam locks:
 S RARPT=""
 F  S RARPT=$O(^XTMP("MAGJ","LOCK",RARPT)) Q:'RARPT  D
 . L +^XTMP("MAGJ","LOCK",RARPT):0 I  D  ; found one (maybe)
 . . S X=$G(^XTMP("MAGJ","LOCK",RARPT))
 . . I +X=DUZ,($P(X,U,2)=$J)         ; leave this job's locks alone
 . . E  K ^XTMP("MAGJ","LOCK",RARPT) ; get rid of this one
 . . L -^XTMP("MAGJ","LOCK",RARPT)
 N TS S TS="" F I=2,0 S %H=$H+I D YMD^%DTC S TS=TS_$S(TS="":"",1:U)_X
 S ^XTMP("MAGJ",0)=TS_U_"VistaRad Locks"
 Q
 ;
MAGJOB ; Initialize general magjob array entries
 ;    MAGJOB("SITEP")=IEN to active Site Parameter
 ;    MAGJOB("CONSOLIDATED")=1/0
 ;    MAGJOB( "KEYS", security_keys ) = ""
 ;    MAGJOB( "USER", 1 ) = RIST_Type ^ NAME ^ INITIALS
 N T,RIST
 D USERKEYS
 N MAGSPEC D FIELD^DID(2006.1,.01,"","SPECIFIER","MAGSPEC")
 S MAGJOB("CONSOLIDATED")=MAGSPEC("SPECIFIER")["P"
 S MAGJOB("SITEP")=$$IMGSIT^MAGJUTL1(DUZ(2))   ; Determine Site Param ien
 I 'MAGJOB("SITEP") S X=$O(^MAG(2006.1,0)) S MAGJOB("SITEP")=X_U_$P(^(X,0),U,9)  ; Default to 1st
 ;
 S RIST="" F X="S","R" I $D(^VA(200,"ARC",X,DUZ)) S RIST=X Q
 S RIST=$S(RIST="S":15,RIST="R":12,1:0) ; Staff/Resident/Non rist
 S MAGJOB("USER",1)=RIST_U_$$USERINF(+DUZ,".01;1")
 Q
 ;
USERINF(DUZ,FLDS) ; get data from user file; return ^-delimited result string
 I FLDS=""!'DUZ Q ""
 N I,RSL,T S RSL=""
 D GETS^DIQ(200,+DUZ,FLDS,"E","T")
 S T=+DUZ_","
 F I=1:1:$L(FLDS,";") S RSL=RSL_$S(RSL="":"",1:U)_T(200,T,$P(FLDS,";",I),"E")
 Q RSL
 ;
USERKEYS ; Store VistaRad Security Keys in MagJob array
 ;
 N I,X,Y
 N MAGKS ; list of keys to send to XUS KEY CHECK
 N MAGKG ; list returned from XUS KEY CHECK
 K MAGJOB("KEYS")
 S X="MAGJ",I=0
 F  S X=$O(^XUSEC(X)) Q:$E(X,1,4)'="MAGJ"  D
 . S I=I+1,MAGKS(I)=X
 I '$D(MAGKS) Q
 D OWNSKEY^XUSRB(.MAGKG,.MAGKS)
 S I=0 F  S I=$O(MAGKG(I)) Q:'I  I MAGKG(I) S MAGJOB("KEYS",MAGKS(I))=""
 Q
 ;
 Q
PINF1(MAGRY,MAGDFN) ;RPC Call MAGJ PT INFO -- Return patient info.
 ; Code borrowed from MAGGTCP
 D INFO^MAGGTPT1(.MAGRY,MAGDFN_"^1") ; 1=Don't log to session file
 Q
 ;
END Q  ;
