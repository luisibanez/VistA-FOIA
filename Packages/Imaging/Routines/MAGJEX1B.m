MAGJEX1B ;WIRMFO/JHC Rad. Workstation RPC calls ; 29 Jul 2003  9:58 AM
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
 ; Subroutines for fetch exam images, etc.
 ;
IMGLOOP ; get data for all the images
 ; This subroutine is called from MAGJEX1
 ;       MAGGRY holds $NA reference to ^TMP where Broker return message is assembled;
 ;   all references to MAGGRY use subscript indirection  
 N DFN
 I '$D(MAGJOB("ALTPATH")) S MAGJOB("ALTPATH")=0 ; facilitates testing
 F IMAG=MAGSTRT:1:MAGEND S MAGIEN=$P(MAGS(IMAG),U,4) D
 . S DFN=$P(MAGS(IMAG),U,8) I DFN=RADFN S MIXEDUP(RADFN)=""  ;ok
 . E  S:'DFN DFN=0 S MIXEDUP=MIXEDUP+2,MIXEDUP(DFN)="" ; database corruption
 . S MDL=$P(MAGS(IMAG),U,3)
 . I MDL="DR" S MDL="CR"  ; for now, hard code cx of non-standard code
 . I $G(SERBRK),(SERLBL]"") D    ; mark Begin of series
 .. S CT=CT+1,@MAGGRY@(CT+STARTNOD)=SERLBL,SERLBL=""
 . S MAGXX=MAGIEN D
 .. I 'USETGA,($P(MAGS(IMAG),U,2)["BIG") D BIG^MAGFILEB Q
 .. E  D VST^MAGFILEB         ; default is to get .TGA file
 . I MAGJOB("ALTPATH") S X=$P(MAGS(IMAG),U,6) I X D
 .. F I=1:1:$L(X,",") S T=$P(X,",",I) S:T CURPATHS(T)=""
 . S CT=CT+1,@MAGGRY@(CT+STARTNOD)="B2^"_MAGIEN_U_MAGFILE2
 . I MODALITY="" D
 .. N T S T=$P("1dummy1^CT^CR^MR^US^AS^CD^CS^DG^EC^FA^LP^MA^PT^ST^XA^NM^OT^BI^CP^DD^DM^ES^FS^LS^MS^RG^TG^RF^RTIMAGE^RTSTRUCT^HC^RTDOSE^RTPLAN^RTRECORD^DX^MG^IO^PX",U_MDL_U,1)
 .. S MODALITY=$L(T,U)
 .. I MODALITY>38 S MODALITY=9999  ; 38=TOTAL # modalities defined; else 9999
 .. I STKLAY S OPENCNT=0 ; no limit on WS for # of exams open in StackVwr
 ;
 I 'MAGJOB("ALTPATH") S ALTPATH=-1
 E  D
 . S T=0 F  S T=$O(CURPATHS(T)) Q:'T  I $D(MAGJOB("LOC",T)) Q
 . S ALTPATH=$S('T:0,1:1)
 . I ALTPATH=$P(MAGJOB("ALTPATH"),U,2) S ALTPATH=-1
 . E  S $P(MAGJOB("ALTPATH"),U,2)=ALTPATH
 Q  ; img loop
 ;
END ;
