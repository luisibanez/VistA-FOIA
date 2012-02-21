MAGBAPIP ;WOIFO/MLH - Background Processor API to build queues - Modules for place
 ;;3.0;IMAGING;**1,7,8**;Sep 15, 2004
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
DUZ2PLC(WARN) ; Moved from MAGGTU3 v2.5 - DBI - SEB Patch 4
 ; Extrinsic : Always returns a PLACE /gek 8/2003
 ; WARN          : message about where the PLACE was derived from.  /gek 8/2003
 ; Compute the Users Institution for older versions of Imaging Display workstation.
 ; This is called when : 
 ;               DUZ(2) doesn' exist, 
 ;               Or Can't resolve DUZ(2) into site param entry
 N MAGINST,DIVDTA,PLACE
 S MAGINST=0
 D GETS^DIQ(200,DUZ,"16*","I","DIVDTA") ; look up Division field
 ;                                 ? Any division data on file for this user
 I $D(DIVDTA) D  ; yes, use it
 . S MAGINST=@$Q(DIVDTA),WARN="Using first Division of New Person File."
 . Q
 E  D  ;                   no, use default site param?
 . S MAGINST=$$KSP^XUPARAM("INST"),WARN="Using Kernel Site Param default entry." Q
 . Q
 S PLACE=$$GETPLACE^MAGBAPI(+$$PLACE^MAGBAPI(MAGINST))
 I 'PLACE S PLACE=$O(^MAG(2006.1,0)),WARN="Using First Site Param entry."
 Q PLACE
 ;
DA2PLC(MAGDA,TYPE) ; Moved from MAGGTU7 v2.5 - DBI - SEB Patch 4
 ; TYPE :        Possible values "A" Abstract, "F" Full Res or "B" Big File
 ; (defaults to "F" if null)
 ; Resolve current place of image using NetWork Location pointer.
 ; 
 N MAGREF,MAG0,FBIG
 I '$G(MAGDA) Q 0
 S MAG0=^MAG(2005,MAGDA,0)
 ;I '$D(TYPE) S TYPE="F" /gek 8/2003  mod for efficiency (from ed)
 S TYPE=$E($G(TYPE)_"F",1)
 I "AF"[TYPE D
 . S MAGREF=$S(TYPE="A":+$P(MAG0,"^",4),1:+$P(MAG0,"^",3))
 . I MAGREF=0 S MAGJB=1,MAGREF=+$P(MAG0,"^",5) ; get file from jukebox
 I "B"[TYPE D
 . S FBIG=$G(^MAG(2005,MAGDA,"FBIG"))
 . S MAGREF=+$P(FBIG,"^") ; get file from magnetic disk, if possible
 . I MAGREF=0 S MAGREF=+$P(FBIG,"^",2) ; get file from jukebox
 I 'MAGREF Q 0
 I '$D(^MAG(2005.2,MAGREF,0)) Q 0
 Q $$GETPLACE^MAGBAPI(+$$GET1^DIQ(2005.2,MAGREF,.04,"I"))
