MAGGNTI ;WOIFO/GEK - Imaging interface to TIU RPC Calls etc. ; 04 Apr 2002  2:37 PM
 ;;3.0;IMAGING;**10,8**;Sep 15, 2004
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
FILE(MAGRY,MAGDA,TIUDA) ;RPC [MAG3 TIU IMAGE]
 ; Call to file TIU and Imaging Pointers
 ; TIU API to add image to TIU
 I $P(^TIU(8925,TIUDA,0),U,2)'=$P(^MAG(2005,MAGDA,0),U,7) S MAGRY="0^Patient Mismatch." Q
 D PUTIMAGE^TIUSRVPL(.MAGRY,TIUDA,MAGDA) ;
 I 'MAGRY Q
 ; Now SET the Parent fields in the Image File
 S $P(^MAG(2005,MAGDA,2),U,6,8)=8925_U_TIUDA_U_+MAGRY
 ; DONE.
 S MAGRY="1^Image pointer filed successfully"
 Q
DATA(MAGRY,TIUDA) ;RPC [MAG3 TIU DATA FROM DA]
 ; Call to get TIU data from the TIUDA
 ; Return =     TIUDA^Document Type ^Document Date^DFN
 ;
 S MAGRY=TIUDA_U_$$GET1^DIQ(8925,TIUDA,".01","E")_U_$$GET1^DIQ(8925,TIUDA,"1201","I")_U_$$GET1^DIQ(8925,TIUDA,".02","I")
 Q
IMAGES(MAGRY,TIUDA) ;RPC [MAG3 CPRS TIU NOTE]
 ; Call to get all images for a given TIU DA
 ; We first get all Image IEN's breaking groups into seperate images
 ; Then get Image Info for each one.
 ; MAGRY    -     Return array of Image Data entries
 ; MAGRY(0)    is   1 ^ message  if successful
 ;                  0 ^ Error message if error;
 ; TIUDA  is IEN in ^TIU(8925
 ;
 ; Call TIU API to get list of Image IEN's
 N MAGARR,CT,TCT K ^TMP("MAGGX",$J)
 N DA,MAGQI,MAGNCHK,MAGXX,MAGRSLT
 N TIUDFN,MAGQUIT ; MAGQI 8/22/01
 ; MAGFILE is returned from MAGGTII
 ; 
 S MAGQUIT=0 ; MAGQI 8/22/01
 S TIUDFN=$P($G(^TIU(8925,TIUDA,0)),U,2) ;MAGQI 8/22/01
 I 'TIUDFN S MAGRY(0)="0^Invalid Patient DFN for Note ID: '"_TIUDA_"'"
 D GETILST^TIUSRVPL(.MAGARR,TIUDA)
 S CT=0,TCT=0
 ; Now get all images for all groups and single images.
 S I="" F  S I=$O(MAGARR(I)) Q:'I  S DA=MAGARR(I) D  ;Q:MAGQUIT
 . S Z=$$ISDELIMG(DA) I Z S TCT=TCT+1,MAGRY(TCT)="B2^"_Z Q
 . ; Check that array of images from selected TIUDA have 
 . ;     same patient's and valid backward pointers
 . I $P($G(^MAG(2005,DA,0)),U,7)'=TIUDFN S MAGQUIT=1,MAGNCHK="Patient Mismatch. TIU: "_TIUDA
 . I $P($G(^MAG(2005,DA,2)),U,7)'=TIUDA S MAGQUIT=1,MAGNCHK="Pointer Mismatch. TIU: "_TIUDA
 . I MAGQUIT S MAGXX=DA D INFO^MAGGTII D  Q
 . . ; remove the Abstract and Image File Names  ; 2/14/03 p8t14  remove c:\program files.  with   .\bmp\
 . . S $P(MAGFILE,U,2,3)="-1~Questionable Data Integrity^.\bmp\imageQA.bmp"
 . . ;this stops Delphi App from changing Abstract BMP to OFFLINE IMAGE
 . . S $P(MAGFILE,U,6)=$S(($P(MAGFILE,U,6)'=11):"99",1:11)
 . . S $P(MAGFILE,U,10)="M"
 . . ;Send the error message
 . . S $P(MAGFILE,U,17)=MAGNCHK
 . . S TCT=TCT+1,MAGRY(TCT)="B2^"_MAGFILE
 . ;
 . I $O(^MAG(2005,DA,1,0)) D  Q
 . . ; Integrity check, if group is questionable, add it's ien to list, not it's 
 . . ;   children.  Later when list is looped through, it's INFO^MAGGTII will be in 
 . . ;   list.  Have to do this to allow other images in list from TIU to be processed.
 . . D CHK^MAGGSQI(.MAGQI,DA) I 'MAGQI(0) S CT=CT+1,^TMP("MAGGX",$J,CT)=DA Q
 . . S J=0 ; the following line needs to take only the first piece of the node - PMK 4/4/02
 . . F  S J=$O(^MAG(2005,DA,1,J)) Q:'J  S CT=CT+1,^TMP("MAGGX",$J,CT)=$P(^(J,0),"^")
 . S CT=CT+1
 . S ^TMP("MAGGX",$J,CT)=DA
 ; Now get image info for each image
 ;
 S Z=""
 S MAGQUIET=1
 F  S Z=$O(^TMP("MAGGX",$J,Z)) Q:Z=""  D
 . S TCT=TCT+1,MAGXX=^TMP("MAGGX",$J,Z)
 . ;GEK 8/24/00 Stoping the Invalid Image IEN's and Deleted Images
 . I '$D(^MAG(2005,MAGXX)) D  Q
 . . D INVALID^MAGGTIG(MAGXX,.MAGRSLT) S MAGRY(CT)=MAGRSLT
 . D INFO^MAGGTII
 . S MAGRY(TCT)="B2^"_MAGFILE
 K MAGQUIET
 S MAGRY(0)=TCT_"^"_TCT_" Images for the selected TIU NOTE"
 ; PUT THE Image IEN of the last image into the group ien field.
 Q:'TCT
 S $P(MAGRY(0),U,3)=TIUDA
 K MAGRSLT
 D DATA(.MAGRSLT,TIUDA)
 S $P(MAGRY(0),U,4)=$$GET1^DIQ(8925,TIUDA,".02","E")_"  "_$P(MAGRSLT,U,2)_"  "_$$FMTE^XLFDT($P(MAGRSLT,U,3),"8")
 ;
 S $P(MAGRY(0),U,5)=$S($P($G(MAGFILE),U):$P(MAGFILE,U),1:MAGXX)
 Q
 ;. S Z=ISDELIMG(DA) I Z S TCT=TCT+1,MAGRY(TCT)="B2^"_$P(Z,U,2) Q
ISDELIMG(MAGIEN) ; Is this a deleted Image.
 N MAGDEL,MAGIMG,MAGR,Z,MAGT
 S MAGDEL=$D(^MAG(2005.1,MAGIEN))
 S MAGIMG=$D(^MAG(2005,MAGIEN))
 I MAGIMG,'MAGDEL S MAGR="0^Valid Image"
 I 'MAGIMG,MAGDEL S MAGR="1^Deleted Image",MAGT=66
 I 'MAGIMG,'MAGDEL S MAGR="1^Invalid Image pointer",MAGT=67
 I MAGIMG,MAGDEL S MAGR="0^Image IEN exists, and is Deleted !"
 I 'MAGR Q MAGR
 S MAGR=$P(MAGR,U,2)
 S $P(Z,U,1,4)=MAGIEN_"^-1~"_MAGR_"^-1~"_MAGR_"^"_MAGR
 S $P(Z,U,6)=MAGT
 ;this stops Delphi App from changing Abstract BMP to OFFLINE IMAGE
 S $P(Z,U,10)="M"
 ;Send the error message
 S $P(Z,U,17)=$P(MAGR,U,2)
 Q Z
