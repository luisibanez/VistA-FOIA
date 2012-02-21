MAGDFCNV ;WOIFO/PMK - Read HL7 and generate DICOM ; 11/03/2003  15:30
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
 ; This routine needs to be on both the Gateway and on the VistA HIS.
 ;
 ; The M-to-M Broker Gateway can't use $$CONSOLID^MAGBAPI since is
 ; doesn't have DDP.
 ; 
 ; Note: The ^MAGOSFIL routine can never be on the VistA HIS. 
 ;
 ;
CONSOLID() ; check if this is a consolidated site or not
 ; return 0 = non-consolidated (normal) site
 ; return 1 = consolidated site
 ;
 ; code for the main VistA HIS
 Q $GET(^MAG(2006.1,"CONSOLIDATED"))="YES"
 ;
ACQDEV(MFGR,MODEL,SITE) ; get pointer to the Acquisition Device file
 N ACQDEV ;--- name of acquisition device
 N ACQDEVP ;-- pointer to acquisition device file (#2006.04)
 ;
 S ACQDEV=$$UP^MAGDFCNV(MFGR_" ("_MODEL_")")
 S ACQDEVP=$O(^MAG(2006.04,"B",ACQDEV,""))
 I 'ACQDEVP D  ; create the entry
 . L +^MAG(2006.04,0):1E9 ; serialize name generation code
 . I '$D(^MAG(2006.04,0)) S ^(0)="ACQUISITION DEVICE^2006.04^^"
 . S ACQDEVP=$P(^MAG(2006.04,0),"^",3)+1
 . S ^MAG(2006.04,ACQDEVP,0)=ACQDEV_"^"_SITE_"^" ; 3rd piece is null
 . S ^MAG(2006.04,"B",ACQDEV,ACQDEVP)=""
 . S $P(^MAG(2006.04,0),"^",3)=ACQDEVP
 . S $P(^MAG(2006.04,0),"^",4)=ACQDEVP
 . L -^MAG(2006.04,0) ; clear the serial name generation code
 Q ACQDEVP
 ;
UP(X) ; special UPPER CASE function -- removes redundant blanks as well
 F  Q:X'["  "  S $E(X,$F(X,"  ")-1)=""  ; remove redundant blank
 I $E(X)=" " S $E(X)=""  ; remove leading blank
 I $E(X,$L(X))=" " S $E(X,$L(X))=""  ; remove trailing blank
 Q $TR(X,"abcdefghijklmnopqrstuvwxyz^|","ABCDEFGHIJKLMNOPQRSTUVWXYZ~~")
