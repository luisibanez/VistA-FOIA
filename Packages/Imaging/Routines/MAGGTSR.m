MAGGTSR ;WOIFO/GEK - SURGERY CASE LIST ; [ 06/20/2001 08:57 ]
 ;;3.0;IMAGING;**8**;Sep 15, 2004
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
GET(MAGRY,MAGDFN) ;RPC [MAGGSUR GET]
 ; Call to get list of Patient Surgery procedures
 ; MAGDFN is Patient DFN
 ;
 IF $$NEWERR^%ZTER N $ETRAP,$ESTACK S $ETRAP="D ERRA^MAGGTERR"
 E  S X="ERRA^MAGGTERR",@^%ZOSF("TRAP")
 N Y,DFN,MAGNAME
 S MAGNAME=$P($G(^DPT(MAGDFN,0)),U)
 I MAGNAME="" S MAGGRY(0)="0^INVALID Patient ID" Q
 D GET^SROGTSR(.MAGRY,MAGDFN)
 I 'MAGRY(0) S MAGRY(0)=MAGRY(0)_" for "_MAGNAME Q
 ; Here we are changing the data returned in the array, from SROGTSR
 ; , it will now also return the count of images associated with the 
 ; surgery report.  This is in advance of the change for Display, to 
 ; list the patient's surgery reports, like we list radiology reports.
 ;
 I (+$G(MAGJOB("VERSION"))<2.5) Q
 S MAGRY(1)=$P(MAGRY(1),U,1,3)_"^Images"
 S I=1 F  S I=$O(MAGRY(I)) Q:'I  D
 . S MAGRY(I)=$P(MAGRY(I),U,1,3)_U_$P(MAGRY(I),U,6)_U_$C(124)_$P(MAGRY(I),U,4,5)_U
 Q
IMAGE(MAGRY,DATA) ;
 ;  Called with the IEN of the Surgery package ^SRF(170,x
 ;  We'll return a list of images.
 N SRFIEN,MAGIEN
 S SRFIEN=+DATA
 I '$D(^SRF(SRFIEN)) S MAGRY(0)="0^INVALID Surgery File entry" Q
 I '$O(^SRF(SRFIEN,2005,0)) S MAGRY(0)="0^No Images for this Operation." Q
 D GETLIST
 Q
GETLIST ; called from other points in this routine, when SRFIEN is defined
 ; and returns a list in MAGRY(1..n)
 ; We'll make a tmp list of just the image IEN's
 ;  splitting groups into individual image entries.
 K ^TMP("MAGGX",$J)
 S I=0,CT=1 F  S I=$O(^SRF(SRFIEN,2005,I)) Q:'I  D
 . S MAGIEN=$P(^SRF(SRFIEN,2005,I,0),U,1)
 . Q:'$D(^MAG(2005,MAGIEN,0))
 . I '$O(^MAG(2005,MAGIEN,1,0)) S ^TMP("MAGGX",$J,MAGIEN)=""
 . E  S Z=0 F  S Z=$O(^MAG(2005,MAGIEN,1,Z)) Q:Z=""  S ^TMP("MAGGX",$J,$P(^MAG(2005,MAGIEN,1,Z,0),U,1))=""
 I '$D(^TMP("MAGGX",$J)) S MAGRY(0)="0^Surgery File Entry "_SRFIEN_": has INVALID Image Pointers" Q
 S Z="",CT=0
 S MAGQUIET=1
 F  S Z=$O(^TMP("MAGGX",$J,Z)) Q:Z=""  D
 . S CT=CT+1,MAGXX=Z D INFO^MAGGTII
 . S MAGRY(CT)="B2^"_MAGFILE
 K MAGQUIET
 S MAGRY(0)=CT_"^Images for the selected Surgery File entry"
 K ^TMP("MAGGX")
 Q
