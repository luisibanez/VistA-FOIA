MAGGTII ;WOIFO/GEK - RETURN IMAGE INFO ; [ 11/08/2001 17:18 ]
 ;;3.0;IMAGING;**8,48,63**;Apr 11, 2005
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
 ; CALL WITH MAGXX=IEN of IMAGE FILE (2005)
 ; RETURNS MAGFILE='^' delimited string of Image information.
 ; 
 ; 
INFO ;Get info for an Image File entry
 ; We assume that MAGXX exists and is the Image File entry
 ; We return a '^' delimited string for the Image entry.
 ; $P(1^2^3)   IEN^Image FullPath and name^Abstract FullPath and Name
 ; $P(4)       SHORT DESCRIPTION field and desc of offline JukeBox
 ; $P(5)       PROCEDURE/ EXAM DATE/TIME field
 ; $P(6)       OBJECT TYPE
 ; $P(7)       PROCEDURE field
 ; $P(8)       display date
 ; $P(9)       to return the PARENT DATA FILE image pointer
 ; $p(10)      return the ABSTYPE  'M' magnetic 'W' worm  'O' offline
 ; $p(11)      is  'A' accessible   'O' offline
 ; $p(12^13)   Dicom Series Number  $p(12) and   Image Number  $p(13)
 ; $p(14)      is count of images in group, 1 if single image.
 ; VISN15
 ; $p(15^16)   SiteParameter IEN ^ SiteParameter CODE
 ; $P(17)      is err description of Integrity Check
 ; $P(18)      Image BIGPath and name             //Patch 5
 ; $P(19^20)   Patient DFN  ^ Patient Name; // Patch 3.8
 ; $P(21)          Image Class: Clin,Admin,Clin/Admin,Admin/Clin
 ;
 N FILETYPE,MAGPREF,MAGJBCP,GRPTYPE,GRPIEN,ABSTYPE,MAGTYPE,MAGJBOL
 N MAGOFFLN,FULLTYPE,MAGOBJT,MAGQI,X
 N ABSFILE,FULLFILE,BIGFILE,PATCH,MDFN,FNL,PLC,PLCODE
 N MAGN0,MAGN2,MAGN40
 ;    set the Variables for the Global Nodes of the Image Entry
 S MAGN0=$G(^MAG(2005,MAGXX,0)),MDFN=$P(MAGN0,"^",7) ; P48T1 MDFN
 S MAGN2=$G(^MAG(2005,MAGXX,2))
 S MAGN40=$G(^MAG(2005,MAGXX,40))
 ; P48T1 Set Name in Variable, Call $$GET 1 time not 2000
 I '$D(MAGJOB("PTNM",MDFN)) S MAGJOB("PTNM",MDFN)=$$GET1^DIQ(2,MDFN_",",.01)
 I '$D(MAGJOB("NETPLC")) D NETPLCS^MAGGTU6
 ;  Object Type
 S MAGOBJT=$P(MAGN0,"^",6)
 ; if this is a group, change MAGXX to first image in group to get
 ;  that abstract to use for the group abstract
 I MAGOBJT=11!(MAGOBJT=16) S GRPTYPE=MAGOBJT D
 . S X=$O(^MAG(2005,MAGXX,1,0))
 . ; next line to account for group of NO images for whatever reason.
 . ;  we change Object Type to XRAY (3)  or STILL IMAGE (1)
 . I 'X S MAGOBJT=$S(MAGOBJT=11:3,MAGOBJT=16:1,1:1) K GRPTYPE Q
 . S X=^MAG(2005,MAGXX,1,X,0)
 . ;  keep the Real IEN, so we can change back later
 . S GRPIEN=MAGXX,MAGXX=+X
 . Q
 S MAGJBCP=0 ; Don't Queue a copy from JukeBox.
 ;  The call to FINDFILE returns:
 ; MAGFILE1=LA100066.ABS   filename
 ;          if no Network Location pointer or INVALID Pointer
 ;          then MAGFILE1=-1~NO NETWORK LOCATION POINTER  
 ;          or -1~INVALID NETWORK LOCATION POINTER
 ; MAGFILE1(.01)=ONE,PATIENT   111223333 image desc
 ; MAGJBOL=    desc of Offline server
 ; MAGOFFLN=    if JB is offline
 ; MAGPREF=C:\TEMP\LA\10\00\  path
 ; MAGTYPE=MAG    MAG or WORM
 ;
 ;   first get Full Path and File Name of the Abstract
 S FILETYPE="ABSTRACT" K MAGFILE1("ERROR")
 S MAGPREF="" D FINDFILE^MAGFILEB
 S MAGFILE1=$TR(MAGFILE1,"^","~") ; MAGFILE1 has '^' in it if errors
 I $D(MAGFILE1("ERROR")) S MAGFILE1=MAGFILE1("ERROR")
 S ABSTYPE=$E(MAGTYPE,1) I MAGOFFLN S ABSTYPE="O"
 ;   Here we must test for +MAGFILE1 = -1  which means we don't have
 ;   any entry in the Image File for the Abstract Network Location 
 ;   pointer.
 S MAGPREF=$G(MAGPREF)
 S ABSFILE=MAGPREF_MAGFILE1
 ;
 ;    now lets get the Full Path and file name FULL RES image.
 S FULLTYPE="A" ; Accessible
 S FILETYPE="FULL" K MAGFILE1("ERROR")
 S MAGPREF="" D FINDFILE^MAGFILEB
 S MAGFILE1=$TR(MAGFILE1,"^","~") ; MAGFILE1 has '^' in it if errors
 I $D(MAGFILE1("ERROR")) S MAGFILE1=MAGFILE1("ERROR")
 I MAGOFFLN S FULLTYPE="O" ; Offline
 ;  here we have to do the same test as above. for bad data.
 S MAGPREF=$G(MAGPREF)
 S FULLFILE=MAGPREF_MAGFILE1
 ;
 ;    now lets get the Full Path and file name for BIG image.
 S FILETYPE="BIG" K MAGFILE1("ERROR")
 S MAGPREF="" D FINDFILE^MAGFILEB
 S MAGFILE1=$TR(MAGFILE1,"^","~") ; MAGFILE1 has '^' in it if errors
 I $D(MAGFILE1("ERROR")) S MAGFILE1=MAGFILE1("ERROR")
 S MAGPREF=$G(MAGPREF)
 S BIGFILE=$S($E(MAGFILE1,1,2)="-1":"",1:MAGPREF_MAGFILE1)
 ;
 K MAGFILE1 ; Cleanup
 ; Site and Site Code are in Entry of first Image in Group
 ; so we need to set here, before MAGXX is changed back.
 S X=$G(^MAG(2005,MAGXX,0))
 S FNL=$S(+$P(X,"^",3):$P(X,"^",3),1:+$P(X,"^",5))
 S PLC=$P($G(MAGJOB("NETPLC",FNL)),"^",1)
 S PLCODE=$P($G(MAGJOB("NETPLC",FNL)),"^",2)
 ;   if we were using first image of a group, reset the Real IEN 
 I $G(GRPIEN) S MAGXX=GRPIEN
 ;
 ;   we have to change the OBJECT TYPE variable back to real value
 ;   MAGOBJT might have been changed if we had Group of no images.
 ;   but we need to keep it changed, because Delphi window checks this
 ;   entry to determine which window to open.
 ;   i.e. Group window, Single image window, 
 S MAGOBJT=$P(MAGN0,U,6)
 ;
 ; now start building the return string
 ;
 S PATCH=$P($G(MAGJOB("VERSION")),".",3) ; //'="3.0.8")
 K MAGFILE
 S $P(MAGFILE,U,25)="" ; We put extra '^^^' on end of String to stop error in Delphi.
 ;
 ; $P(1^2^3) IEN^Image FullPath and name^Abstract FullPath and Name 
 S $P(MAGFILE,U,1,3)=MAGXX_U_FULLFILE_U_ABSFILE
 S $P(MAGFILE,U,18)=BIGFILE
 ;
 ; now set $P(4) SHORT DESCRIPTION field and desc of offline JukeBox
 S $P(MAGFILE,U,4)=$P(MAGN2,U,4)_$G(MAGJBOL)
 ;
 ; now set $P(5)PROCEDURE/ EXAM DATE/TIME field
 S $P(MAGFILE,U,5)=$P(MAGN2,U,5)
 ;
 ; now set $P(6) OBJECT TYPE
 S $P(MAGFILE,U,6)=MAGOBJT
 ;
 ; now set $P(7) PROCEDURE field
 S $P(MAGFILE,U,7)=$P(MAGN0,U,8)
 ;
 ; now we're making a DATE to display and will use it for a sort in  
 ;  the delphi TStringGrid so we display mm/dd/yyyy
 ; now set $P(8) display date
 S X=$P($P(MAGN2,"^",5),".",1)
 I X'="" S X=$E(X,4,5)_"/"_$E(X,6,7)_"/"_($E(X,1,3)+1700)
 S $P(MAGFILE,U,8)=X
 ;
 ; now return the PARENT DATA FILE image pointer
 S $P(MAGFILE,U,9)=$P(MAGN2,U,8)
 ;
 ; now return the ABSTYPE ( this is 'M' or 'W' or 'O' )
 ; 'M' magnetic 'W' worm  'O' offline
 S $P(MAGFILE,U,10)=ABSTYPE
 ;
 ; now return the code to show if full res image is offline 'A' or 'O'
 ; 'A' accessible   'O' offline
 S $P(MAGFILE,U,11)=FULLTYPE
 ;
 ;  2/1/99 Dicom Series number and Dicom Image Number  
 ;    $p(12) and $p(13)
 ;
 ; lets add the count of images , if this is a group
 S X=+$P($G(^MAG(2005,MAGXX,1,0)),U,4),$P(MAGFILE,U,14)=$S(X:X,1:1)
 ;
 ; $p(15^16 ) are SiteIEN and SiteCode Consolidation - DBI
 ; We use SiteIEN and SiteCODE from above 
 S $P(MAGFILE,"^",15)=PLC
 S $P(MAGFILE,"^",16)=PLCODE
 ;
 ; $p(17)           8/22/01 GEK Mod for integrity check.
 I '$G(MAGNOCHK) D CHK^MAGGSQI(.MAGQI,MAGXX) I 'MAGQI(0) D
 . ; remove the Abstract and Image File Names ; 2/14/03 remove c:\program files... with .\bmp\
 . S $P(MAGFILE,U,2,3)="-1~Questionable Data Integrity^.\bmp\imageQA.bmp"
 . ;this stops Delphi App from changing Abstract BMP to OFFLINE IMAGE
 . S $P(MAGFILE,U,6)=$S(($P(MAGFILE,U,6)'=11):"99",1:11)
 . S $P(MAGFILE,U,10)="M"
 . ;Send the error message
 . S $P(MAGFILE,U,17)=$P(MAGQI(0),U,2)
 ; $p(18) is BIGFile Full name and path. ( set above)
 ; Patches prior to 8, only had 17 pieces of data. this will speed up their listings.
 ; Patch 8 had New M rtn MAGSIXG1, if it doesn't exist, this is PRE - 8.
 I '$L($T(PGI^MAGSIXG1)) Q
 S $P(MAGFILE,U,19)=$P(MAGN0,U,7)                         ; DFN
 ; P48T1 The change to speed up access to large groups left out patient name.
 ;S $P(MAGFILE,U,20)=$$GET1^DIQ(2,$P(MAGN0,U,7)_",",.01)   ; Patient Name
 S $P(MAGFILE,U,20)=MAGJOB("PTNM",MDFN)
 S $P(MAGFILE,U,21)=$S(+$P(MAGN40,U,2):$P(^MAG(2005.82,$P(MAGN40,U,2),0),U),1:"")
 ; Stop displaying a Group of 1 as a Group, so here we'll change Object type
 ;  to that of the '1ST' image in the group of 1.
 I $P($G(^MAG(2005,MAGXX,1,0)),U,4)=1 D
 . S X=$O(^MAG(2005,MAGXX,1,0))
 . S X=+^MAG(2005,MAGXX,1,X,0)
 . S $P(MAGFILE,U,6)=$P(^MAG(2005,X,0),U,6) ; OBJECT TYPE OF 1ST IMAGE IN GROUP
 . S $P(MAGFILE,U,1)=X
 . ; Need Site and Site code of 
 Q
