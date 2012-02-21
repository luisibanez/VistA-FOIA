MAGGSIU2 ;WOIFO/GEK - Utilities for Image Add/Modify ; [ 12/27/2000 10:49 ]
 ;;3.0;IMAGING;**7,8**;Sep 15, 2004
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
MAKEFDA(MAGGFDA,MAGARRAY,MAGACT,MAGCHLD,MAGGRP,MAGGWP) ;
 ;  Create the FileMan FDA Array
 ;  Create Imaging Action Codes Array (for Pre and Post processing)
 N MAGGFLD,MAGGDAT,GRPCT,WPCT,Z
 S Z="" F  S Z=$O(MAGARRAY(Z)) Q:Z=""  D  I $L(MAGERR) Q
 . S MAGGFLD=$P(MAGARRAY(Z),U,1),MAGGDAT=$P(MAGARRAY(Z),U,2,99)
 . ;  If this entry is one of the action codes, store it in the action array.
 . I $$ACTCODE^MAGGSIV(MAGGFLD) S MAGACT(MAGGFLD)=MAGGDAT Q
 . ;
 . ; If we are Creating a Group Entry, add any Images that are to be members of this group.
 . I MAGGFLD=2005.04 D  Q
 . . S MAGGRP=1
 . . I '+MAGGDAT Q  ; making a group entry, with no group entries yet. This is OK.
 . . S MAGCHLD(MAGGDAT)=""
 . . S GRPCT=GRPCT+1
 . . S MAGGFDA(2005.04,"+"_GRPCT_",+1,",.01)=MAGGDAT
 . ;
 . ; if we are getting a WP for Long Desc, set array to pass.
 . I MAGGFLD=11 D  ; this is one line of the WP Long Desc field.
 . . S WPCT=WPCT+1,MAGGWP(WPCT)=MAGGDAT
 . . S MAGGFDA(2005,"+1,",11)="MAGGWP"
 . ;  Set the Node for the UPDATE^DIC Call.
 . S MAGGFDA(2005,"+1,",MAGGFLD)=MAGGDAT
 . Q
 ; Patch 8.  Special processing for field 107 (ACQUISITION DEVICE)
 ;  We'll change any MAGGFDA(2005,"+1,",107) to MAGACT("ACQD")
 ;  This way the PRE processing of the array will check and create a new
 ;  ACQUISITION DEVICE file entry, if needed. 
 I $D(MAGACT("107")) S MAGACT("ACQD")=MAGACT("107") K MAGACT("107")
 I $D(MAGGFDA(2005,"+1,",107)) S MAGACT("ACQD")=MAGGFDA(2005,"+1,",107) K MAGGFDA(2005,"+1,",107)
 Q
