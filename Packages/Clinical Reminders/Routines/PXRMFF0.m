PXRMFF0 ;SLC/PKR - Clinical Reminders function finding routines. ;09/01/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;============================================
COUNT(LIST,FIEVAL,COUNT) ;
 N IND,JND,KND
 S COUNT=0
 F IND=1:1:LIST(0) D
 . S JND=LIST(IND),KND=0
 . F  S KND=+$O(FIEVAL(JND,KND)) Q:KND=0  D
 .. I FIEVAL(JND,KND) S COUNT=COUNT+1
 Q
 ;
 ;===========================================
DUR(LIST,FIEVAL,DUR) ;
 N EDT,IND,JND,KND,SDT
 F IND=1:1:LIST(0) D
 . S JND=LIST(IND)
 . I FIEVAL(JND)=0 S (EDT,SDT)=0 Q
 .;Check for finding with start and stop date.
 . S SDT=+$G(FIEVAL(JND,"START DATE"))
 . S EDT=+$G(FIEVAL(JND,"STOP DATE"))
 . I +SDT=0,+EDT=0 D
 ..;Get start and stop for multiple occurrences.
 .. S KND=$O(FIEVAL(JND,"A"),-1)
 .. S EDT=$S(KND="":0,1:$G(FIEVAL(JND,KND,"DATE")))
 .. S KND=+$O(FIEVAL(JND,""))
 .. S SDT=$S(KND=0:0,1:$G(FIEVAL(JND,KND,"DATE")))
 ;Return the duration in days.
 S DUR=$$FMDIFF^XLFDT(EDT,SDT)
 I DUR<0 S DUR=-DUR
 Q
 ;
 ;============================================
FND(LIST,FIEVAL,LV) ;Given a regular finding return its true/false value.
 S LV=FIEVAL(LIST(1))
 Q
 ;
 ;============================================
MAXDATE(LIST,FIEVAL,MAXDATE) ;Given a list of findings return the maximum
 ;date. This will be the newest date.
 N DATE,IND
 S MAXDATE=0
 F IND=1:1:LIST(0) D
 . S DATE=$G(FIEVAL(LIST(IND),"DATE"))
 . I DATE>MAXDATE S MAXDATE=DATE
 Q
 ;
 ;============================================
MINDATE(LIST,FIEVAL,MINDATE) ;Given a list of findings return the minimum
 ;date. This will be the oldest non-null or zero date.
 N DATE,IND
 S MINDATE=9991231
 F IND=1:1:LIST(0) D
 . S DATE=$G(FIEVAL(LIST(IND),"DATE"))
 . I DATE<MINDATE S MINDATE=DATE
 I MINDATE=9991231 S MINDATE=0
 Q
 ;
 ;============================================
MRD(LIST,FIEVAL,MRD) ;Given a list of findings return the most recent
 ;finding date from the list.
 N DATE,IND
 S MRD=0
 F IND=1:1:LIST(0) D
 . S DATE=$G(FIEVAL(LIST(IND),"DATE"))
 . I DATE>MRD S MRD=DATE
 Q
 ;
