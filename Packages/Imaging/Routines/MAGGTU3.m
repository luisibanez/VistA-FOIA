MAGGTU3 ;WOIFO/GEK - Silent calls for Imaging ; [ 06/20/2001 08:57 ]
 ;;3.0;IMAGING;**7,8,48,45**;Sep 12, 2005
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
IMAGEINF(MAGRY,IEN,NOCHK) ;RPC [MAGG IMAGE INFO] Call to return information for 1 image;
 ; IEN   =       Image IEN ^MAG(2005,IEN
 ; NOCHK =   If Flag = 1, then do not run QA check on this image.
 ; 
 N MAGFILE,Y,Z,MAGNOCHK
 I '$D(^MAG(2005,IEN)) D  Q
 . I $D(^MAG(2005.1,IEN)) S MAGRY(0)="0^Image : """_$P($G(^MAG(2005.1,IEN,2)),U,4)_""" has been deleted." Q
 . S MAGRY(0)="0^INVALID Image number "_IEN
 . Q
 ; MAGGTII queries the variable MAGNOCHK to run QA check or not.
 S MAGNOCHK=+$G(NOCHK)
 S MAGXX=IEN D INFO^MAGGTII ; this'll give us the  MAGFILE variable
 S Z=$P(^MAG(2005,IEN,0),U,7)
 I '$D(^DPT(Z)) S Z="1^Invalid patient pointer"
 E  S Z=Z_U_$P(^DPT(Z,0),U)
 S MAGRY(0)="1^"_MAGFILE
 S MAGRY(1)=Z ; dfn^name
 Q
USERINF2(MAGRY,MAGWRKID) ;RPC [MAGGUSER2] Return user info.
 ; MAGRY(1) = DUZ ^ FULL NAME  ^ INITIALS
 ; MAGRY(2) = Network UserName ^ PassWord.
 ; MAGRY(3) = MUSE Site number. ( default = 1)
 ; Node 4 is data from IMAGING SITE PARAMATERS File #2006.1 and INSTITUTION File #4
 ; MAGRY(4)= IEN  ^ SITE CODE ^ DUZ(2) ^ INSTITUTION NAME (.01) ^ $$CONSOLID ^ STATION NUMBER (99)
 ; MAGRY(5) = +<CP Version>|0 ^ Version of CP installed on Server
 ; MAGRY(6) = Warning message if we can't resolve which Site Parameter entry to use.
 ; MAGRY(7) = Warning message  <reserved for future>
 ; MAGRY(8) = 1|0  1 = Production account    0 = Test Account (or couldn't determine) ;Patch 41
 ; MAGRY(9) = Vista Site Service PHYSICAL REFERENCE from Network Location File.
 ; 
 N J,K,Y,MAGPLC,MAGWARN,MAGWARN1,VSRV,PHYREF ; DBI - SEB 9/20/2002
 S MAGPLC=0
 I $D(DUZ(2)) S MAGPLC=+$$PLACE^MAGBAPI(DUZ(2)) ; DBI - SEB 9/20/2002
 ;
 ; SET THE PARTITION VARIABLE MAGSYS   i.e.'IGK_Garrett's Desk'
 S MAGSYS=$G(MAGWRKID,"")
 I +$G(DUZ)=0 S MAGRY(0)="0^DUZ Undefined, Null or Zero" Q
 I 'MAGPLC D
 . S MAGWARN="Can't resolve Site Param, DUZ(2): "_$S($D(DUZ(2)):DUZ(2),1:"NULL")_" DUZ: "_DUZ
 . S MAGPLC=$$DUZ2PLC^MAGBAPIP(.MAGWARN1) ; DBI - SEB 9/20/2002
 . Q
 S MAGRY(0)="1^"
 ;          DUZ     FULL NAME                INITIALS
 S MAGRY(1)=DUZ_U_$$GET1^DIQ(200,DUZ_",",.01)_U_$$GET1^DIQ(200,DUZ_",",1)
 ; NOW NET STUFF
 I 'MAGPLC Q 
 ; Get info from IMAGING SITE PARAMETERS File
 ; get the Network UserName and PassWord.
 S MAGRY(2)=$P($G(^MAG(2006.1,MAGPLC,"NET")),U,1,2)
 ; get the default MUSE Site number.
 S MAGRY(3)=+$P($G(^MAG(2006.1,MAGPLC,"USERPREF")),U,2)
 ; default to 1 if nothing is entered in Site Parameters File
 I MAGRY(3)=0 S MAGRY(3)=1
 ; This SITEIEN^SITECODE^USER INSTITUTION IEN^INSTITUTION NAME^CONSOLIDATED
 ;  is  used by Display to determine location of Workstation
 ;  and used by Capture to determine the Write Location.
 S MAGRY(4)=MAGPLC_U_$$GET1^DIQ(2006.1,MAGPLC,.09)_U_$G(DUZ(2))_U_$$GET1^DIQ(2006.1,MAGPLC,.01,"E")
 S MAGRY(4)=MAGRY(4)_U_$$CONSOLID^MAGBAPI_U_$$GET1^DIQ(4,DUZ(2),99,"E")
 ; is CP installed at this site, the Front End will hide options
 ;  related to CP if not installed.
 S X=$$VERSION^XPDUTL("CLINICAL PROCEDURES")
 S MAGRY(5)=+X_U_X
 S MAGRY(6)=$G(MAGWARN)
 S MAGRY(7)=$G(MAGWARN1)
 S MAGRY(8)=$S($L($T(PROD^XUPROD)):+$$PROD^XUPROD,1:0)
 S VSRV=$P($G(^MAG(2006.1,MAGPLC,"NET")),"^",5)
 I VSRV I +$P($G(^MAG(2005.2,VSRV,0)),"^",6) S PHYREF=$P($G(^MAG(2005.2,VSRV,0)),"^",2)
 S MAGRY(9)=$G(PHYREF)
 Q
 ;
CATEGORY(MAGRY) ; RPC [MAGGDESCCAT] Call to return Mag Descriptive Categories in array
 ; for listing in a list box.
 N I,K,CT,Y
 S I=0,CT=0
 I '$D(^MAG(2005.81)) D  Q
 . S MAGRY(0)="0^ERROR Mag Descriptive Category File doesn't exist"
 F  S I=$O(^MAG(2005.81,"B",I)) Q:I=""  D
 . ;S K=$O(^MAG(2005.81,"B",I,"")),CT=CT+1,MAGRY(CT)=I_U_K
 . ;Next line adds ADMIN, CLIN 3rd piece of the data returned
 . S K=$O(^MAG(2005.81,"B",I,"")),CT=CT+1
 . S MAGRY(CT)=I_U_K_U_$P(^MAG(2005.81,K,0),U,2)
 S MAGRY(0)=CT_"^Categories on file"
 Q
USERKEYS(MAGK) ; RPC [MAGGUSERKEYS]
 ; Call to return an array of IMAGING Security Keys
 ; to use on the workstation to limit capture ability
 ; and to limit functionality on Display application.
 ;
 N Y
 N MAGKS ; list of keys to send to XUS KEY CHECK
 N MAGKG ; list returned from XUS KEY CHECK
 N I,J,MAGMED,MAGKEY,MAGPLC
 K MAGK
 S MAGPLC=+$$PLACE^MAGBAPI(DUZ(2)) ; DBI - SEB 9/20/2002
 S MAGKEY=+$P($G(^MAG(2006.1,MAGPLC,"KEYS")),U)
 I 'MAGKEY S MAGK(0)="CAPTURE KEYS OFF"
 E  S MAGK(0)="CAPTURE KEYS ON"
 N X S X="MAG",I=0
 F  S X=$O(^XUSEC(X)) Q:$E(X,1,3)'="MAG"  D
 . S I=I+1,MAGKS(I)=X
 D OWNSKEY^XUSRB(.MAGKG,.MAGKS)
 S I=0,J=0,MAGMED=0
 F  S I=$O(MAGKG(I)) Q:I=""  D
 . Q:MAGKG(I)=0
 . S J=J+1,MAGK(J)=MAGKS(I)
 . I MAGKS(I)["MAGCAP MED" S MAGMED=1
 I MAGMED S J=J+1,MAGK(J)="MAGCAP MED"
 Q
MAIL(MAGRY,MAGFILE,MAGIEN) ;RPC [MAGG OFFLINE IMAGE ACCESSED]
 ;   called when a user tries to access an image that in offline as
 ;   determined by Stuarts file
 ;       ^MAGQUEUE(2006.033,0) = OFFLINE IMAGES
 ;   User must edit the MAGQUEUE file by hand to say if images are
 ;   OFFLINE.
 ;
 N FILEREF,PLATTER,A
 S MAGRY="0^Error : logging access to Off-Line Image"
 N $ETRAP,$ESTACK S $ETRAP="D ERR^MAGGTERR"
 S FILEREF=$$UP^XLFSTR($P(MAGFILE,"\",$L(MAGFILE,"\")))
 S PLATTER=$O(^MAGQUEUE(2006.033,"B",FILEREF,""))
 S PLATTER=$P(^MAGQUEUE(2006.033,PLATTER,0),U,2)
 I MAGFILE[".ABS" Q
 N XMDUZ,XMSUB,XMTEXT,XMY
 S XMDUZ=$S($D(DUZ):DUZ,1:.5)
 S XMSUB="Offline Image Request"
 S XMTEXT="A("
 S A(1)="Patient   : "_$P(^DPT($P($G(^MAG(2005,+MAGIEN,0)),U,7),0),U,1)
 S A(2)="FileName  : "_MAGFILE_"  "_MAGIEN
 S A(3)="Desc      : "_$P($G(^MAG(2005,MAGIEN,2)),U,4)
 S A(4)="Procedure : "_$P($G(^MAG(2005,MAGIEN,0)),U,8)
 S A(5)="Platter   : "_PLATTER
 S A(6)="User      : "_$$GET1^DIQ(200,DUZ_",",.01)_"("_$G(DUZ)_")"
 S XMY("G.OFFLINE IMAGE TRACKERS")="" D ^XMD
 S MAGRY="1^Message sent :  Offline Image Accessed"
 Q
LOGERROR(MAGRY,TEXT) ;RPC [MAGG LOG ERROR TEXT]
 ; Call to stuff error information from Delphi app into the Session file.
 Q:($P($G(MAGJOB("VERSION")),".",1,2))<"3.0"
 D LOGERR^MAGGTERR("---- New Error ----")
 S I="" F  S I=$O(TEXT(I)) Q:I=""  D LOGERR^MAGGTERR(TEXT(I))
 S MAGRY="1^Error text saved to Session file"
 Q
RSLVABS(MAGIEN,FILENAME) ;Resolve Abstract into the Default Bitmap 
 ; Return the default bitmap, If the image file extension resolves into a default bitmap
 ; MAGIEN        : Image internal entry number
 ; FILENAME      : ""  or Relative Path and Default Bitmap. ie ('.\BMP\magavi.bmp')
 N FTIEN,EXT ; 
 S FILENAME=""
 I '$D(^MAG(2005.021)) Q  ; IMAGE FILE TYPES doesn't exist on this system.
 S EXT=$P($P(^MAG(2005,MAGIEN,0),"^",2),".",2) ; image file extension   JPG, TGA, etc.
 Q:EXT=""  ;
 S FTIEN=$O(^MAG(2005.021,"B",EXT,""))
 Q:'FTIEN  ; No extension in IMAGE FILE TYPES file.
 ; gek P8, get rid of dependency on "c:\program files"
 I '+$P(^MAG(2005.021,FTIEN,0),"^",5) S FILENAME=".\BMP\"_$P(^MAG(2005.021,FTIEN,0),"^",4)
 Q
GETINFO(MAGRY,IEN) ; RPC [MAG4 GET IMAGE INFO]
 ; Call (3.0p8) to get information on 1 image
 N Y,J,JI,I,CT,IENC,FLAGS,SNGRP,Z,M40,T
 S I=0,CT=0
 S MAGRY(CT)="Image ID#:      "_IEN
 I $D(^MAG(2005.1,IEN)) D  Q
 . S CT=CT+1,MAGRY(CT)="    STATUS:  "_"HAS BEEN DELETED. !!"
 . S CT=CT+1,MAGRY(CT)="Deleted By: "_$$GET1^DIQ(2005.1,IEN,30,"E")
 . S CT=CT+1,MAGRY(CT)="    Reason: "_$$GET1^DIQ(2005.1,IEN,30.2,"E")
 . S CT=CT+1,MAGRY(CT)="      Date: "_$$GET1^DIQ(2005.1,IEN,30.1,"E")
 . Q
 S M40=$G(^MAG(2005,IEN,40)),T=$P(M40,"^",3)
 S Z=$P($G(^MAG(2005,IEN,0)),"^",10) I Z D
 . S CT=CT+1,MAGRY(CT)=" is in Group#: "_Z_"  ("_+$P(^MAG(2005,Z,1,0),"^",4)_" images)"
 . Q
 S SNGRP="FLDS"
 I (+$O(^MAG(2005,IEN,1,0)))!($P(^MAG(2005,IEN,0),"^",6)=11)!($P(^MAG(2005,IEN,0),"^",6)=16) D
 . S CT=CT+1,MAGRY(CT)=$P(^MAG(2005,IEN,0),"^",8)_" Group of "_+$P($G(^MAG(2005,IEN,1,0)),U,4)
 . S SNGRP="FLDG"
 . Q
 N MAGOUT,MAGERR,MAGVAL
 S IENC=IEN_","
 S FLAGS="EN"
 S I=-1
 F  S I=I+1,Z=$T(@SNGRP+I) Q:$P(Z,";",3)="end"  D
 . S J=$P(Z,";",4),JI=J_";"
 . K MAGOUT
 . S CT=CT+1,MAGRY(CT)=$P(Z,";",3)
 . I J=41 D  Q  ; Need to compute the Class.  Class field in Image File is wrong.
 . . S MAGVAL=$S('T:"",'$D(^MAG(2005.83,T,0)):"",1:$P(^MAG(2005.82,$P(^MAG(2005.83,T,0),"^",2),0),"^",1))
 . . S MAGRY(CT)=MAGRY(CT)_" "_MAGVAL
 . . Q
 . D GETS^DIQ(2005,IEN,JI,FLAGS,"MAGOUT","MAGERR")
 . ; Get Extension from FileRef
 . I J=1 S MAGVAL=$P($G(MAGOUT(2005,IENC,J,"E")),".",2)
 . E  S MAGVAL=$G(MAGOUT(2005,IENC,J,"E"))
 . S MAGRY(CT)=MAGRY(CT)_" "_MAGVAL
 Q
FLDS ;;Format:       ;3;;
 ;;Extension:    ;1;;
FLDG ;;Patient:      ;5;;
 ;;Desc:         ;10;;
 ;;Procedure:    ;6;;
 ;;     Date:    ;15;;
 ;;Class:        ;41;;
 ;;Package:      ;40;;
 ;;Type:         ;42;;
 ;;Proc/Event:   ;43;;
 ;;Spec/SubSpec: ;44;;
 ;;Origin:       ;45;;
 ;;Captured on:  ;7;;
 ;;         by:  ;8;;
 ;;end;;
