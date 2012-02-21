MAGDLB6 ;WOIFO/LB,MLH - DICOM file utilities ; 01/30/2004  17:11
 ;;3.0;IMAGING;**21,10,11**;14-April-2004
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
XREF ;set xref for field 9 - study uid
 N ORIG,PREX,PREDA
 N GWLOC ; -- site number of DICOM Gateway
 S PREX=X
 S GWLOC=$P(^MAGD(2006.575,DA,1),"^",5)
 Q:'GWLOC
 I '$D(^MAGD(2006.575,"F",GWLOC,X)) D  Q
 . S ^MAGD(2006.575,"F",GWLOC,X,DA)=""
 . Q
 S ORIG=$O(^MAGD(2006.575,"F",GWLOC,X,0))
 Q:'$D(^MAGD(2006.575,ORIG,0))   ;NO LONGER AN ENTRY
 S PREDA=DA D ADD
 S DA=PREDA,X=PREX
 Q
ADD ;
 N DA,DIE,DIC,DD,D0,X,Y
 S DIC="^MAGD(2006.575,"_ORIG_",""RLATE"","
 S DIC(0)="L"
 S DA(1)=ORIG,X=PREDA
 K DD D FILE^DICN
 I Y=-1 D EN^DDIOL("NOT FILED","","!")
 Q
FIXRF ;set xref for field 16 - fixed flag  - will incorporate the machine id
 ;machine id is for multiple machines being used processing images from
 ;xray modalities
 Q:'DA
 N MACH,STUDY,GWLOC
 S MACH=$P(^MAGD(2006.575,DA,1),"^",4)   ;Machine ID
 S GWLOC=$P(^MAGD(2006.575,DA,1),"^",5)  ;Place where gateway is located
 S STUDY=$G(^MAGD(2006.575,DA,"ASUID"))
 Q:'$L(STUDY)      ;
 I '$D(^MAGD(2006.575,"F",GWLOC,STUDY,DA)) Q     ;Only unique study set this xref
 S ^MAGD(2006.575,"AFX",GWLOC,MACH,DA)=""
 Q
FIXRFK ; kill xref for field 16 - fixed flag
 N GWLOC ; -- gateway location
 N MACH ; ----- machine ID (for multiple machines)
 S GWLOC=$P($G(^MAGD(2006.575,DA,1)),"^",5)
 S MACH=$P($G(^MAGD(2006.575,DA,1)),"^",4)
 I GWLOC]"",MACH]"" K ^MAGD(2006.575,"AFX",GWLOC,MACH,DA)
 Q
XREFK ;
 Q:'DA
 N GWLOC,SUID
 S GWLOC=$P(^MAGD(2006.575,DA,1),"^",5)
 Q:'GWLOC
 S SUID=$P(^MAGD(2006.575,DA,"ASUID"),"^")
 K ^MAGD(2006.575,"F",GWLOC,SUID,DA)
