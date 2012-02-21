MAGDLB12 ;WOIFO/LB,MLH - Routine to fix failed DICOM entries  ; 01/30/2004  17:14
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
 Q
LOOP ;
 N ANS,ANSR,CASENO,COMNT1,DATA,DATA1,DATA2,DATE,FILE,FIRST,FIRSTS
 N MACHID,MAGDY,MAGDIEN,MAGIEN,MAGTYPE,MSG,START,STOP
 N MOD,MODEL,NEWCAS,NEWDFN,NEWDTI,NEWDTIM,NEWMUL,NEWNME,NEWPIEN,NEWPROC
 N NEWSSN,OK,OOUT,OUT,PAT,PID,PP,PREV,PREVS,REASON,SITE,STUDYUID,WHY,MAGFIX
 N KFIXALL ; -- does user hold MAGDFIX ALL security key?
 ;
 S KFIXALL=$$SECKEY()
 S (OOUT,OUT,PREV,FIRST)=0
 S SITE=""
 F  S SITE=$O(^MAGD(2006.575,"F",SITE)) Q:'SITE  D
 . ; if gateway site isn't the user's site, bail unless the user holds
 . ; the MAGDFIX ALL security key
 . I SITE'=DUZ(2),'KFIXALL Q
 . S SUID=0
 . F  S SUID=$O(^MAGD(2006.575,"F",SITE,SUID)) Q:SUID=""!(OOUT)  D
 . . S MAGIEN=$O(^MAGD(2006.575,"F",SITE,SUID,0)) Q:'MAGIEN
 . . ; if image isn't on file, clean up xrefs
 . . I '$D(^MAGD(2006.575,MAGIEN,0)) D  Q
 . . . K ^MAGD(2006.575,"F",SITE,SUID,MAGIEN),^MAGD(2006.575,MAGIEN,0)
 . . . Q
 . . ; if gateway site isn't the user's site, bail unless the user holds
 . . ; the MAGDFIX ALL security key
 . . I $P($G(^MAGD(2006.575,MAGIEN,1)),U,5)'=DUZ(2),'KFIXALL Q
 . . ;Only process Radiology images...medicine images done by other rtns.
 . . S MAGTYPE=$P($G(^MAGD(2006.575,MAGIEN,"TYPE")),"^") I MAGTYPE'["RAD" Q
 . . I $D(^MAGD(2006.575,MAGIEN,"FIXD")),$P(^MAGD(2006.575,MAGIEN,"FIXD"),"^") Q
 . . I 'FIRST S PREV=MAGIEN,PREVS=SUID,FIRST=MAGIEN
 . . D SET^MAGDLB1
 . . Q
 . Q
 Q
SITE ;
 N CNT,KFIXALL,RESULT,SITES
 S (CNT,SITE)=0 F  S SITE=$O(^MAGD(2006.575,"F",SITE)) Q:'SITE  D
 . Q:'$$FIND1^DIC(4,"","","`"_SITE)
 . S CNT=CNT+1,SITES(CNT)=SITE
 . Q
 Q:'CNT
LOOK ;
 S KFIXALL=$$SECKEY I '$$MDIV S KFIXALL=1
 ; If not multi-division set the KFIXALL - site should be able to correcty any entry
 I KFIXALL D FIX(.SITES,CNT) Q
 I $D(DUZ(2)) D  Q
 . S SITE=DUZ(2)
 . I '$D(^MAGD(2006.575,"F",SITE)) W !,"No entries for division "_$$GET1^DIQ(4,+SITE,".01","E")
 . Q
 D LKUSR(.RESULT,DUZ)
 I '$D(RESULT(0)) Q
 I $P(RESULT(0),"^")=0 W !,$P(RESULT,"^",2) Q
SITE1 ;
 N EN,II,NSITE,MAGSITE,X
 S (CNT,SITE)=0
 S X=0 F  S X=$O(SITES(X)) Q:'X  S II=$G(SITES(X)) I II S NSITE(II)=""
 S II=0
 F  S II=$O(RESULT(II)) Q:'II  S EN=$G(RESULT(II)) I $D(NSITE(EN)) S CNT=CNT+1,MAGSITE(CNT)=EN
 I 'CNT Q  ;no matches
 I CNT=1 S SITE=$G(MAGSITE(1)) Q
 D FIX(.MAGSITE,CNT)
 Q
 ;
FIX(SITES,CNT) ;Fix the entries for the user's division entries.        
 ; Multiple divisions have images to be corrected and user has appropirate security key.
 N DIR,I,Y,X
 I 'CNT Q
 I CNT=1 S SITE=$G(SITES(CNT)) Q
 S I=0 F  S I=$O(SITES(I)) Q:'I  D
 . W !,I,") ",$G(SITES(I)),"  ",$$GET1^DIQ(4,+$G(SITES(I)),".01","E")
 . Q
FIXE ;
 S DIR(0)="N:1:"_CNT
 S DIR("A",1)="There are images to be corrected for multiple divisions."
 S DIR("A")="Select by number (1-"_CNT_")"
 D ^DIR
 Q:'+Y
 I +Y>CNT W " ??" G FIXE
 S SITE=$G(SITES(+Y))
 Q
 ;
SECKEY() ;
 N MAGKY,MAGRSLT
 I '$D(DUZ) Q 0
 S MAGKY("MAGDFIX ALL")="MAGDFIX ALL"
 D OWNSKEY^XUSRB(.MAGRSLT,.MAGKY)
 I +$G(MAGRSLT("MAGDFIX ALL")) Q 1
 Q 0
MDIV() ;Multi-divisional flag
 N CNT,I
 S (CNT,I)=0
 F  S I=$O(^MAG(2006.1,I)) Q:'I  S CNT=CNT+1
 I CNT>1 Q 1
 Q 0
LKUSR(RESULT,USER) ;
 ;RETURNS: 0^Message for failure
 ;         IENs for Institution file entry^
 ; If the user has more than one division and more than one match in the Imaging Site
 ; Parameter file, then it returns the 1st matching division entry in the New Person file.
 I $D(DUZ(2)) S RESULT(0)="1^Number of entries",RESULT(DUZ(2))=DUZ(2) Q
 N MAGARRAY,CNT,MAGERR,MAGOUT,MAGDV,MAGX
 S RESULT(0)="0^Your division entry is not part of the Imaging Site Parameter."
 D GETS^DIQ(200,USER,"16*","I","MAGOUT")
 ;MAGOUT(200.02,"institution entry,duz,",.01,"I")=institution entry
 I $D(MAGOUT)=0 Q
 S MAGX="",CNT=0
 F  S MAGX=$O(MAGOUT(200.02,MAGX)) Q:MAGX=""  D
 . S MAGDV=$P(MAGX,",") I $D(^MAG(2006.1,"B",MAGDV)) S CNT=CNT+1,MAGARRAY(CNT)=MAGDV
 . Q
 I 'CNT Q
 S CNT=0
 S X=0 F  S X=$O(MAGARRAY(X)) Q:'X  S CNT=CNT+1,RESULT(X)=$P(MAGARRAY(X),"^")
 S RESULT(0)=CNT_"^Number of entries"
 ; Get the 1st institution, the calling routine should check for keys.
 Q
