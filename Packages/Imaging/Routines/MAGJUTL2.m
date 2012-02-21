MAGJUTL2 ;WIRMFO/JHC VistRad subroutines for RPC calls[ 2/21/97  10:53 AM ] ; 22 Mar 2001  2:24 PM
 ;;3.0;IMAGING;;Mar 01, 2002
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
IMGINFO(RARPT,RET) ; Fetch info from Image File for input RARPT:
 ; Input: RARPT: Rad Report pointer
 ;        RET: see below
 ; RET contents delimited by ^:
 ;       CT = # of images for case
 ;      ONL = Image Storage status (Y=On Magnetic disk, N=Jukebox
 ;             "n/a"  for not available, e.g., film only)
 ;        note -- if last image in group is Online, considers ALL online
 ;    MAGDT = Date/Time of Image Capture
 ;   REMOTE = 1/0 to Indicate images were remotely cached
 ;  MODALITY= Modality abbrev
 ;    PLACE = Image storage PLace (ptr to 2006.1 entry)
 ;
 N IRPT,MAGIEN,MAGIEN2,ONLCHK,NETLOC
 N CT,ONL,MAGDT,REMOTE,MODALITY,PLACE
 S CT="",ONL="",MAGDT="",RET="",REMOTE="",MODALITY="",PLACE="" ; init return vars
 G IMGINFQ:'RARPT G IMGINFQ:'$D(^RARPT(RARPT,2005,0))
 S IRPT=0 F  S IRPT=$O(^RARPT(RARPT,2005,IRPT)) Q:'IRPT  S MAGIEN=$P(^(IRPT,0),U) D
 . Q:'$D(^MAG(2005,MAGIEN,0))  I MAGDT="" S MAGDT=$P($G(^(2)),U)
 . I $O(^MAG(2005,MAGIEN,1,0)) S CT=CT+$P(^(0),U,4),Y=$P(^(0),U,3),MAGIEN2=$P($G(^(Y,0)),U) S:(MAGIEN2]"") ONLCHK=$$ONLCHK(MAGIEN2),REMOTE=$$REMOTE(MAGIEN2) ; last image in group
 . E  S CT=CT+1,ONLCHK=$$ONLCHK(MAGIEN),REMOTE=$$REMOTE(MAGIEN)
 . S ONL=$S(ONL="":+ONLCHK,+ONL:+ONLCHK,1:0) ; NOT Online if ANY img is 0
 . I MODALITY="" S MODALITY=$P(ONLCHK,U,3)
 . I PLACE="" S PLACE=$P(ONLCHK,U,4)
IMGINFQ S ONL=$S(+ONL:"Y",ONL="":"n/a",1:"N")
 S RET=CT_U_ONL_U_MAGDT_U_REMOTE_U_MODALITY_U_PLACE
 Q
 ;
ONLCHK(MAGIEN,USETGA) ;
 ; Input: MAGIEN: Image pointer
 ;        USETGA: 1/0 -- if 1, forces return of TGA (not .big) file
 ;Return:
 ;   - T/F for Full-Res image on Mag. Disk that is Online
 ;   - File type (BIG/FULL)
 ;   - Modality
 ;   - Place
 ;   - DFN
 ;   - File Name IFF this image is stored Off-Line (else null)
 ;   - USETGA as calculated in the logic below
 ;   USETGA is set to False (0) if a low-resolution image (TGA) is
 ;     requested, but none exists; calling routine would call by ref.
 ;
 N BIG,X,NOD,MAG0,MODALITY,RET,PLACE,DFN,FILNAM
 S USETGA=+$G(USETGA) ; Defaults to Full-Resolution image if not defined
 S RET="",MODALITY="",PLACE=""
 S MAG0=^MAG(2005,MAGIEN,0),BIG=$D(^("FBIG")),NOD=$S(BIG:^("FBIG"),1:MAG0)
 I USETGA D
 . I 'BIG S USETGA=0 ; reply no low-res image available
 . I BIG S NOD=MAG0,BIG=0 ; enable correct logic inside this subroutine
 S MODALITY=$P(MAG0,U,8),DFN=$P(MAG0,U,7)
 I BIG S X=+$P(NOD,U)  ; $p 1 is Magnetic Disk/Volume (.big)
 E  S X=+$P(NOD,U,3)   ; $p 3 is Magnetic Disk/Volume (.tga)
 I X D
 . I '$D(NETLOC(X)) S NETLOC(X)=+$P(^MAG(2005.2,X,0),U,6)_U_$P(^(0),U,10)
 . S RET=+NETLOC(X),PLACE=$P(NETLOC(X),U,2) ; NETLOC is global to this subrtn
 . S FILNAM=""
 E  S RET=0,FILNAM=$P(MAG0,U,2),T=$P(MAG0,U,5) I T S PLACE=$P(^MAG(2005.2,T,0),U,10)
 S RET=RET_U_$S(BIG:"BIG",1:"FULL")_U_MODALITY_U_PLACE_U_DFN_U_FILNAM_U_USETGA
 Q RET
 ;
REMOTE(MAGIEN) ;Return list of remote  Cache Locations
 ;  else, return "" if none
 N RET,LOC
 S RET=""
 I $D(^MAG(2005,MAGIEN,4,"LOC")) S LOC=0 D
 . F  S LOC=$O(^MAG(2005,MAGIEN,4,"LOC",LOC)) Q:'LOC  S RET=RET_$S(RET="":"",1:",")_LOC
 Q RET
 ;
IMGINF2(RARPT,RET,USETGA) ; Fetch info from Image File for input RARPT:
 ; Input: RARPT: Rad Report pointer
 ;        RET: see below
 ;        USETGA: 1/0 -- if 1, forces return of TGA (not .big) file
 ; RET holds array of return values:
 ;   RET = # Images stored for the case
 ;   RET(1:n) = 1/0 ^ FULL/BIG ^ Mod ^ ien ^ Series ^ Routed-to Locations ^ PLACE ^ DFN ^ FileName (if OffLine)
 ;             (1=Image is on Magnetic Disk)
 ; * This subroutine may be called by other VistARad routines
 ;
 N BIG,IMG,MAGIEN,MAGIEN2,MAGPTR,MAGINDX,MAGREF,NETLOC,SERIES,SERCT,SERPREV
 K RET S RET=0,SERCT=0,SERPREV=""
 S USETGA=+$G(USETGA) ; Defaults to Full-Resolution image if not defined
 G IMGINF2Q:'RARPT S IMG=0
 S MAGINDX="ADCM"  ; maybe others will exist in the future
 F  S IMG=$O(^RARPT(RARPT,2005,IMG)) Q:'IMG  S MAGIEN=$P(^(IMG,0),U) D
 . S MAGREF=$NA(^MAG(2005,MAGIEN,1,MAGINDX))
 . I '$D(@MAGREF) D  ; use group multiple structure
 .. Q:'$D(^MAG(2005,MAGIEN,0))  S MAGPTR=0
 .. I '$O(^MAG(2005,MAGIEN,1,MAGPTR)) S T=$$ONLCHK(MAGIEN,USETGA),RET=RET+1,RET(RET)=$P(T,U,1,3)_U_MAGIEN_U_U_$$REMOTE(MAGIEN)_U_$P(T,U,4,7) Q
 .. E  F  S MAGPTR=$O(^MAG(2005,MAGIEN,1,MAGPTR)) Q:'MAGPTR  S MAGIEN2=$P(^(MAGPTR,0),U),T=$$ONLCHK(MAGIEN2,USETGA),RET=RET+1,RET(RET)=$P(T,U,1,3)_U_MAGIEN2_U_U_$$REMOTE(MAGIEN2)_U_$P(T,U,4,7)
 . E  I $D(@MAGREF) D   ; use exam index, e.g., "ADCM"
 .. F  S MAGREF=$Q(@MAGREF) Q:($P(MAGREF,",",4)'=(""""_MAGINDX_""""))  D
 ... S X=$L(MAGREF,","),MAGIEN2=$P(MAGREF,",",X-1),SERIES=$P(MAGREF,",",5)
 ... S T=$$ONLCHK(MAGIEN2,USETGA),RET=RET+1,RET(RET)=$P(T,U,1,3)_U_MAGIEN2_U_SERIES_U_$$REMOTE(MAGIEN2)_U_$P(T,U,4,7)
 ... I SERIES'=SERPREV S SERCT=SERCT+1,$P(RET("SER",SERCT),U,2)=SERIES,SERPREV=SERIES,RET("SER",0)=SERCT
 ... S $P(RET("SER",SERCT),U)=RET("SER",SERCT)+1
IMGINF2Q ;
 Q
 ;
JBFETCH(RARPT,MAGS,USETGA) ; fetch this case's images from Jukebox, if necessary
 ; Input: RARPT: Rad Report pointer
 ;        MAGS: see below
 ;        USETGA: 1/0 -- if 1, forces return of TGA (not .big) file
 ; This is a function that returns a string containing:
 ;   # Images fetched from JB ^ Total # Images for Case ^ # Low Res Imgs
 ; The MAGS array will be returned to the calling
 ; routine if MAGS is provided as an input parameter
 ;   MAGS is populated by call to IMGINF2.
 ;   IF any images are stored OffLine, then this node is set here:
 ;     MAGS("OFFLN",JBOFFLN)=""  JBOFFLN = Platter ID from file 2006.033
 ;
 ; * This function may be called by other VistARad routines
 ;
 N MAGIEN,FETCH,IMAG,FILNAM,JBOFFLN,LORESCT
 S USETGA=+$G(USETGA) ; Defaults to Full-Resolution image if not defined
 S FETCH=0,LORESCT=0
 D IMGINF2(RARPT,.MAGS,USETGA)
 I MAGS F IMAG=1:1:MAGS S X=MAGS(IMAG) D
 . I USETGA S LORESCT=LORESCT+$P(X,U,10)
 . I '+X D  ; Call params below depend on Consolidated Site status
 .. S FILNAM=$P(X,U,9)
 .. I FILNAM]"",$D(^MAGQUEUE(2006.033,"B",FILNAM)) S T=$O(^(FILNAM,"")) S JBOFFLN=$P($G(^MAGQUEUE(2006.033,T,0)),U,2) S FETCH=FETCH+1,MAGS("OFFLN",JBOFFLN)="" Q  ; OffLine Image
 .. I '$G(MAGJOB("CONSOLIDATED")) S X=$$JBTOHD^MAGBAPI($P(X,U,4)_"^"_$P(X,U,2)),FETCH=FETCH+1 ; pre-consolidation vs
 .. E  S X=$$JBTOHD^MAGBAPI($P(X,U,4)_"^"_$P(X,U,2),$P(X,U,7)),FETCH=FETCH+1
 Q FETCH_U_MAGS_U_LORESCT
 ;
END Q  ;
