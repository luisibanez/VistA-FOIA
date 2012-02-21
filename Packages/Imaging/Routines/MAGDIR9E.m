MAGDIR9E ;WOIFO/PMK - Read a DICOM image file ; 07 Nov 2003  3:16 PM
 ;;3.0;IMAGING;**11**;14-April-2004
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
 ;
 ; M2MB server
 ;
 ; This routine creates the group entry in ^MAG(2005) and links it
 ; to the consult/procedure request in GMRC.
 ;
 ;     XXXX                                         XXX       X
 ;    XX  XX                                         XX      XX
 ;   XX         XXXX    XX XXX  XXXXXXX  XX  XXX     XX     XXXXX
 ;   XX        XX  XX   XXX XX  XX       XX  XX      XX      XX
 ;   XX    X   XX  XX   XX  XX  XXXXXXX  XX  XX      XX      XX
 ;    XX  XX   XX  XX   XX  XX       XX  XX  XX      XX      XX XX
 ;     XXXX     XXXX    XX  XX  XXXXXXX   XXX XX    XXXX      XXX
 ;
 ;
GROUP() ; entry point from ^MAGDIR8 for consult/procedure groups
 N ACQDEVP ;-- pointer to acquisition device file (#2006.04)
 N DA ;------- fileman variable
 N ERRCODE ;-- error trap code
 N GROUP ;---- array to pass group data to ^MAGGTIA
 N MAGGPP ;--- pointer to group in DICOM GMRC TEMP LIST ^MAG(20006.5839)
 N P ;-------- scratch variable (pointer to ACQUISITION DEVICE file)
 N SERVICE ;-- service performing the consult/procedure - ^GMR(123.5)
 N SOPCLASS ;- SOP class to check for intra-oral dental images
 N SOPNAME ;-- SOP name to check for intra-oral dental images
 N TIUIEN ;--- TIU file 8925 IEN value
 ;
 S ERRCODE=""
 ;
 I STUDYDAT,STUDYTIM D  ; get study date/time from image header
 . S DATETIME=(STUDYDAT_"."_STUDYTIM)-17000000 ; FileMan date.time fmt
 . Q
 E  D  ; use current date/time
 . N %,%H,%I,X
 . D NOW^%DTC S DATETIME=%
 . Q
 ;
 ; get the acquisition device pointer (file 2005, field 107)
 S ACQDEVP=$$ACQDEV^MAGDFCNV(MFGR,MODEL,INSTLOC)
 S FILEDATA("ACQUISITION DEVICE")=ACQDEVP
 ;
 S MAGGP="" ; initialize pointer to the image group
 ;
 ; check if there already is a TIU note attached to this request
 ;
 S TIUIEN=$$TIULAST^MAGDGMRC(GMRCIEN)
 I TIUIEN D  Q:ERRCODE ERRCODE ; there is TIU note already
 . ; double check TIU note DFN to make sure that it matches
 . N HIT ; scratch variable used in finding corresponding image group
 . N TIUDFN ; DFN value from ^TIU for double checking
 . N TIUXDIEN ; TIU External Data File IEN
 . S TIUDFN=$P($G(^TIU(8925,TIUIEN,0)),"^",2)
 . I TIUDFN'=DFN D  Q  ; fatal error
 . . D TIUMISS^MAGDIRVE($T(+0),DFN,TIUIEN,TIUDFN)
 . . S ERRCODE=-501
 . . Q
 . ;
 . S FILEDATA("PARENT FILE")=8925 ; TIU file
 . S FILEDATA("PARENT IEN")=TIUIEN
 . ;
 . ; is there an entry in TIU External Data File for this note
 . S (HIT,TIUXDIEN)=0
 . F  S TIUXDIEN=$O(^TIU(8925.91,"B",TIUIEN,TIUXDIEN)) Q:'TIUXDIEN  D  Q:HIT  Q:ERRCODE
 . . ; there is a TIU External Data File
 . . ; does the TIU External Data File entry pointing to an image group?
 . . S MAGGP=$$GET1^DIQ(8925.91,TIUXDIEN,.02,"I")
 . . I MAGGP D  ; there is an image group for this TIU note
 . . . ; double check image group entry DFN 
 . . . N GROUPDFN ; DFN value from image group entry for double checking
 . . . S GROUPDFN=$P($G(^MAG(2005,MAGGP,0)),"^",7)
 . . . I GROUPDFN'=DFN D  ; fatal error
 . . . . D MISMATCH^MAGDIRVE($T(+0),DFN,MAGGP)
 . . . . S ERRCODE=-502
 . . . . Q
 . . . E  I $P($G(^MAG(2005,MAGGP,0)),"^",6)'=11 D  ; wrong type
 . . . . S MAGGP="" ; wrong object type - skip this image group
 . . . . Q
 . . . E  S P=$P($G(^MAG(2005,MAGGP,100)),"^",4) I P,P'=ACQDEVP D  ; wrong device
 . . . . S MAGGP="" ; wrong acquisition device - skip this image group
 . . . . Q
 . . . E  D  ; add the new image to this existing image group
 . . . . N MAG2 ; data value for getting parent file attributes
 . . . . S HIT=1,MAG2=$G(^MAG(2005,MAGGP,2))
 . . . . S FILEDATA("PARENT FILE")=$P(MAG2,"^",6)
 . . . . S FILEDATA("PARENT IEN")=$P(MAG2,"^",7)
 . . . . S FILEDATA("PARENT FILE PTR")=$P(MAG2,"^",8)
 . . . . I FILEDATA("PARENT IEN")'=TIUIEN D  ; fatal error
 . . . . . D TIUMISS2^MAGDIRVE($T(+0),TIUIEN,FILEDATA("PARENT IEN"),TIUXDIEN,MAGGP)
 . . . . . S ERRCODE=-503
 . . . . . Q
 . . . . Q
 . . . Q
 . . Q
 . Q
 ;
 ; need a temporary association for the consult/procedure request
 ;
 E  D  Q:ERRCODE ERRCODE ; check if there is a temporary association
 . ;
 . ; Note: this algorithm creates multiple groups for a study,
 . ;       for instance a GI fluoroscopy + color images
 . ;
 . S MAGGPP=""
 . F  S MAGGPP=$O(^MAG(2006.5839,"C",123,GMRCIEN,MAGGPP)) Q:'MAGGPP  D  Q:ERRCODE
 . . N GROUPDFN ; DFN value from image group entry for double checking
 . . S MAGGP=$P(^MAG(2006.5839,MAGGPP,0),"^",3)
 . . ; double check image group entry DFN in existing 2005 group node
 . . S GROUPDFN=$P($G(^MAG(2005,MAGGP,0)),"^",7)
 . . I GROUPDFN'=DFN D  ; fatal error
 . . . D MISMATCH^MAGDIRVE($T(+0),DFN,MAGGP)
 . . . S MAGGP="" ; bad group
 . . . S ERRCODE=-504
 . . . Q
 . . E  S P=$P($G(^MAG(2005,MAGGP,100)),"^",4) I P,P'=ACQDEVP D  ; wrong device
 . . . S MAGGP="" ; wrong acquisition device - skip this image group
 . . . Q
 . . E  D  ; add the new image to this existing image group
 . . . N MAG2 ; data value for getting parent file attributes
 . . . S MAG2=$G(^MAG(2005,MAGGP,2))
 . . . S FILEDATA("PARENT FILE")=$P(MAG2,"^",6)
 . . . S FILEDATA("PARENT IEN")=$P(MAG2,"^",7)
 . . . S FILEDATA("PARENT FILE PTR")=$P(MAG2,"^",8) ; should be null
 . . . I FILEDATA("PARENT FILE")'=2006.5839 D  ; fatal error
 . . . . D TMPMISS^MAGDIRVE($T(+0),FILEDATA("PARENT FILE"),MAGGP)
 . . . . S ERRCODE=-505
 . . . . Q
 . . . Q
 . . Q
 . ;
 . I 'MAGGP  D  ; no group exists yet create a temporary association
 . . S FILEDATA("PARENT FILE")=2006.5839 ; GMRC file
 . . S FILEDATA("PARENT IEN")=GMRCIEN
 . . Q
 . Q
 ;
 S FILEDATA("MODALITY")=MODALITY
 S FILEDATA("PACKAGE")="CONS"
 ;
 ; lookup study in ^GMR(123) and get FILEDATA variables
 S SERVICE=$$GET1^DIQ(123,GMRCIEN,1,"I")
 I SERVICE D
 . N P200584,X,Y
 . I $D(^MAG(2006.5831,SERVICE,0)) D
 . . S P200584=$P(^MAG(2006.5831,SERVICE,0),"^",2)
 . . S X=$$FIELD43^MAGXMA(MODALITY,P200584,.Y)
 . . S FILEDATA("PROC/EVENT")=$S(X=0:Y,1:"")
 . . S FILEDATA("SPEC/SUBSPEC")=P200584
 . . Q
 . E  D  ; service was removed from ^MAG(2006.5831)
 . . S FILEDATA("PROC/EVENT")=""
 . . S FILEDATA("SPEC/SUBSPEC")=""
 . . Q
 . Q
 E  D
 . S FILEDATA("PROC/EVENT")=""
 . S FILEDATA("SPEC/SUBSPEC")=""
 . Q
 ;
 ; if the 2005 group node does not yet exist, create it
 ;
 I 'MAGGP D  Q:ERRCODE ERRCODE ; create the imaging group
 . K GROUP
 . S GROUP(1)=".01^"_PNAMEVAH_"  "_DCMPID_"  "_PROCDESC
 . S GROUP(2)="3^11" ; Object Type -- XRAY Group
 . S GROUP(3)="5^"_DFN
 . S GROUP(4)="6^CON/PROC"
 . S GROUP(5)="2005.04^0"
 . S GROUP(6)="10^"_PROCDESC
 . S GROUP(7)="15^"_DATETIME
 . S GROUP(8)="16^"_FILEDATA("PARENT FILE")
 . S GROUP(9)="17^"_FILEDATA("PARENT IEN")
 . S GROUP(10)="60^"_STUDYUID
 . ; S GROUP(11)="61^"_FILEDATA("RAD REPORT")
 . ; S GROUP(12)="62^"_FILEDATA("RAD PROC PTR")
 . S GROUP(13)=".05^"_INSTLOC
 . S GROUP(14)="40^"_FILEDATA("PACKAGE")
 . S GROUP(15)="41^"_$O(^MAG(2005.82,"B","CLIN",""))
 . S GROUP(16)="42^"_FILEDATA("TYPE")
 . S GROUP(17)="43^"_FILEDATA("PROC/EVENT")
 . S GROUP(18)="44^"_FILEDATA("SPEC/SUBSPEC")
 . S GROUP(19)="107^"_FILEDATA("ACQUISITION DEVICE")
 . ;
 . D ADD^MAGGTIA(.RETURN,.GROUP)
 . ;
 . S MAGGP=+RETURN
 . I 'MAGGP D  Q  ; fatal error
 . . K MSG
 . . S MSG(1)="IMAGE GROUP CREATION ERROR:"
 . . S MSG(2)=$P(RETURN,"^",2,999)
 . . D BADERROR^MAGDIRVE($T(+0),"DICOM IMAGE PROCESSING ERROR",.MSG)
 . . S ERRCODE=-506
 . . Q
 . ;
 . I MAGGP<LASTIMG D  Q  ; fatal
 . . D GROUPPTR^MAGDIRVE($T(+0),MAGGP,LASTIMG)
 . . S ERRCODE=-507
 . . Q
 . ;
 . I FILEDATA("PARENT FILE")=8925 D  Q:ERRCODE  ; fix for ^TIU
 . . S ERRCODE=$$TIUXLINK
 . . Q
 . E  I FILEDATA("PARENT FILE")=2006.5839 D  ; fix for ^GMR
 . . L +^MAG(2006.5839)
 . . I '$D(^MAG(2006.5839,0)) D
 . . . S ^MAG(2006.5839,0)="DICOM GMRC TEMP LIST^^0^0"
 . . . Q
 . . S D0=$P(^MAG(2006.5839,0),"^",3)+1
 . . S $P(^MAG(2006.5839,0),"^",3)=D0,$P(^(0),"^",4)=$P(^(0),"^",4)+1
 . . L -^MAG(2006.5839)
 . . S ^MAG(2006.5839,D0,0)="123^"_GMRCIEN_"^"_MAGGP
 . . S ^MAG(2006.5839,"C",123,GMRCIEN,D0)=""
 . . Q
 . Q
 ;
 ; check for intra-oral x-ray images & get tooth number(s)
 I IMAGNAME'="" S FILEDATA("SHORT DESCRIPTION")=IMAGNAME
 Q 0
 ;
TIUXLINK() ; create the cross-linkages to TIU EXTERNAL DATA LINK file
 N TIUXDIEN
 D PUTIMAGE^TIUSRVPL(.TIUXDIEN,TIUIEN,MAGGP)
 I TIUXDIEN D
 . S FILEDATA("PARENT FILE PTR")=TIUXDIEN
 . S $P(^MAG(2005,MAGGP,2),"^",8)=TIUXDIEN
 . Q
 E  D  Q ERRCODE ; fatal error
 . K MSG
 . S MSG(1)="ERROR ASSOCIATING WITH TIU EXTERNAL DATA LINK (file 8925.91):"
 . S MSG(2)=$P(TIUXDIEN,"^",2,999)
 . D BADERROR^MAGDIRVE($T(+0),"DICOM IMAGE PROCESSING ERROR",.MSG)
 . S ERRCODE=-508
 . Q
 Q 0
