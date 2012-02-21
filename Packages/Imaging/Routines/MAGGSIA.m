MAGGSIA ;WOIFO/GEK - Imaging RPC Broker calls. Add/Modify Image entry ; [ 12/27/2000 10:49 ]
 ;;3.0;IMAGING;**7,21,8**;Sep 15, 2004
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
 ;**** CALLING ROUTINE is responsible for RENAMING THE IMAGE FILE
 ;**** on DISK TO THE NEW FILE NAME RETURNED BY THIS CALL.
 ;
ADD(MAGRY,MAGARRAY) ; RPC [MAG4 ADD IMAGE]
 ; Calls UPDATE^DIE to Add an Image File entry
 ;  Called from Import API Delphi component and ImportX (Active X) control.
 ;  Parameters : 
 ;    MAGARRAY -  array of field numbers and their entries
 ;             i.e. MAGARRAY(1)=".5^38"  field# .5   data is 38
 ;    If Long Description is included in array (field 11), we create a new
 ;      array to hold the text, and pass that to UPDATE^DIE
 ;    If this entry is an Image Group
 ;      i.e. MAGARRAY(n)="2005.04^344"
 ;      (the field 2005.04 is the OBJECT GROUP MULTIPLE)
 ;      ( 344 is the pointer to the Image File Entry that will be added
 ;      ( as a member of this new/existing Group)
 ;
 ;  Return Variable
 ;
 ;    MAGRY(0) - Array
 ;      Successful   MAGRY(0) = IEN^FILE NAME (with full path)
 ;      UNsuccessful MAGRY(0) = 0^Error desc
 ;                   MAGRY(0)(1..n) = Errors and warnings. 
 ;
 ;    CALLING ROUTINE is responsible for RENAMING THE IMAGE FILE on DISK
 ;      TO THE NEW FILE NAME RETURNED BY THIS CALL.
 ;      Changed to include hierarchial directory hash  - PMK 04/23/98
 ;----------------------------------------------------------------
 N MAGGFDA,MAGGDRV,MAGGRP,MAGCHLD,GRPCT,MAGGDA,MAGGFNM
 N MAGGWP,MAGERR,MAGREF,MAGDHASH,MAGTEMP,MAGACT,MAGGIEN,MAGGXE
 N GIEN,DIEN,NEWIEN ;3.0
 N I,J,X,Y,Z,WPCT
 ;
 N $ETRAP,$ESTACK S $ETRAP="D ERRA^MAGGSERR"
 I ($D(MAGARRAY)<10) S MAGRY(0)="0^No input data, Operation CANCELED" Q
 ;
 S MAGRY(0)="0^Creating VistA Image Entry..."
 S MAGERR="",MAGGRP=0,GRPCT=1,WPCT=0
 ;  Validate the Data, and Action codes in the Input Array
 D VAL^MAGGSIV(.MAGRY,.MAGARRAY) I 'MAGRY(0) Q
 ;
 ;  Make the FileMan FDA array and the Imaging Action array.
 D MAKEFDA^MAGGSIU2(.MAGGFDA,.MAGARRAY,.MAGACT,.MAGCHLD,.MAGGRP,.MAGGWP)
 I '$D(MAGGFDA(2005,"+1,")) S MAGRY(0)="0^No data to file.  Operation CANCELED." Q
 ;
 ;  Check on some possible problems: required fields, create default values etc.
 D PRE^MAGGSIA1(.MAGERR,.MAGGFDA,MAGGRP,.MAGGDRV,.MAGREF) I $L(MAGERR) S MAGRY(0)=MAGERR Q
 ; Locking Patch 8. Get latest Image IEN and Deleted IEN take the greater of the two.
 S GIEN=$O(^MAG(2005," "),-1)+1
 S DIEN=$O(^MAG(2005.1," "),-1)+1
 S NEWIEN=$S(GIEN>DIEN:GIEN,1:DIEN)
LOCK L +^MAG(2005,NEWIEN):0 E  S NEWIEN=NEWIEN+1 G LOCK ; lock it, or get next
 I $D(^MAG(2005,NEWIEN)) L -^MAG(2005,NEWIEN) S NEWIEN=NEWIEN+1 G LOCK ; if it exists, get next
 S MAGGIEN(1)=NEWIEN
 D UPDATE^DIE("S","MAGGFDA","MAGGIEN","MAGGXE")
 ;
 ;  ERROR: QUIT
 I '$G(MAGGIEN(1)) D  S MAGRY(0)=MAGERR Q
 . S MAGERR="0^ERROR Creating new Image File Entry "
 . I $D(DIERR) D RTRNERR^MAGGSIU1(.MAGERR)
 . D CLEAN
 ;
 S MAGGDA=MAGGIEN(1)
 ;
 D ACTION^MAGGTAU("CAP^"_MAGGFDA(2005,"+1,",5)_"^"_MAGGDA)
 ;
 ; IF a group, UpDate the GROUP PARENT in each Group Object and QUIT
 ;  The Return (MAGRY(0)) will be IEN with NO Filename. Groups don't get Filename
 I MAGGRP D  Q
 . D UPDCHLD^MAGGSIM(.MAGCHLD,MAGGDA)
 . S MAGRY(0)=MAGGDA_U
 . D CLEAN
 . Q
 ; ENTRY in Image File has been made, if any errors from here on
 ;  then we have to delete the image entry.
 ; New Index Field Check.  If this entry doesn't have the Index fields introduced
 ;   in 3.0.8 then we use the Patch 17 conversion API call to generate default values.
 ;-This is being deferred to a later patch.
 ;-I '$D(^MAG(2005,MAGGDA,40)) D
 ;-. D ONE^MAGSCNVI(MAGGDA)
 ;-. D ACTION^MAGGTAU("DFTINDX^"_MAGGFDA(2005,"+1,",5)_"^"_MAGGDA)
 ;
 ; Now generate the Image FileName. This is passed back to the calling app, 
 ;  and the calling app is responsible for renaming/copying the Image File to
 ;  this new name. 
 I $D(MAGGFDA(2005,"+1,",1)) S MAGGFNM=MAGGFDA(2005,"+1,",1)
 E  D  I $L(MAGERR) S MAGRY(0)=MAGERR Q
 . N MAGXFDA
 . S X=$$DA2NAME^MAGGTU1(MAGGDA,$G(MAGACT("EXT"))) I 'X D  Q
 . . S MAGERR=X
 . . D KILLENT^MAGGSIU1(MAGGDA)
 . . D CLEAN
 . ;
 . S MAGGFNM=$P(X,U,2),Y=MAGGDA_","
 . S MAGXFDA(2005,Y,1)=MAGGFNM
 . D UPDATE^DIE("","MAGXFDA","","MAGGXE")
 . ;   in case of an error
 . I $D(DIERR) D  Q
 . . D RTRNERR^MAGGSIU1(.MAGERR,.MAGGXE)
 . . D KILLENT^MAGGSIU1(MAGGDA)
 . . D CLEAN
 ;
 ;
 ;
 ;  IF This image is a member of a Group, Update the Group Entry with new child.
 S X=$G(MAGGFDA(2005,"+1,",14)) I +X D  I $L(MAGERR) Q
 . D UPDPAR^MAGGSIM(.MAGERR,X,.MAGACT,MAGGDA)
 . I $L(MAGERR) S MAGRY(0)=MAGERR D CLEAN
 ;
 ;** ABS and JB image queues AREN'T SET WHEN ADDING AN IMAGE. 
 ;** RPC =-> 'MAG ABSJB' after abstract is/isn't created on the workstation
 ;
 ;  The Return is:  IEN ^ DRIVE:DIR ^ FILE.EXT [^ DRIVE:DIR ^ FILE.BIG]
 ;   i.e  487^C:\IMAGE\^DC000487.TIF
 ;  The calling routine is responsible for renaming/naming the file
 ;   to the returned DRIVE:\DIR\FILENAME.EXT
 ;
 ; Modified 4/23/98 to include hierarchial directory structure -- PMK
 S MAGDHASH=$$DIRHASH^MAGFILEB(MAGGFNM,MAGREF)
 ; For now, BIG files are in same directory as FullRes (or PACS) file
 S MAGRY(0)=MAGGDA_U_MAGGDRV_MAGDHASH_U_MAGGFNM
 ; If BIG file also, add it's Drive, Hash, Filename to end of Return string.
 I $G(MAGACT("BIG")) D
 . S X=$P(MAGGFNM,".",1)_".BIG"
 . S MAGRY(0)=MAGRY(0)_U_MAGGDRV_MAGDHASH_U_X
 ;
CLEAN ; Called as tag
 D CLEAN^DILF
 L -^MAG(2005,NEWIEN)
 Q
