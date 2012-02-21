PXRMSTAT ; SLC/PKR - Routines for dealing with status. ;01/06/2005
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;===============================================
GETSTATI(FILENUM,FINDPA,STATUSA) ;Return the list of statuses to search
 ;for in the array STATUSA. STATUSA(0) will contain the number found.
 N IND,NUM
 K STATUSA
 S (IND,NUM)=0
 ;Do problem list first because it is a special case, do the rest in
 ;numerical order.
 I FILENUM=9000011 D  Q
 . N STAT
 . F  S IND=+$O(FINDPA(5,IND)) Q:IND=0  D
 .. S STAT=$S(FINDPA(5,IND)="ACTIVE":"A",FINDPA(5,IND)="INACTIVE":"I",1:"")
 .. I STAT'="" S NUM=NUM+1,STATUSA(NUM)=STAT
 . I NUM>0 S STATUSA(0)=NUM
 . I NUM=0 S STATUSA(0)=1,STATUSA(1)="A"
 .;If the status multiple is not defined check USE INACTIVE PROBLEMS
 . I '$D(FINDPA(5)),$P($G(FINDPA(0)),U,9) S STATUSA(0)=2,STATUSA(2)="I"
 ;
 ;See if a status list is defined.
 F  S IND=+$O(FINDPA(5,IND)) Q:IND=0  D
 . S NUM=NUM+1,STATUSA(NUM)=FINDPA(5,IND)
 I NUM>0 S STATUSA(0)=NUM Q
 ;
 ;If not list is defined set the default statuses.
 I FILENUM=52 D  Q
 . S STATUSA(0)=2,STATUSA(1)="ACTIVE",STATUSA(2)="SUSPENDED"
 ;
 I FILENUM=55 D  Q
 . S STATUSA(0)=1,STATUSA(1)="ACTIVE"
 ;
 I FILENUM=70 D  Q
 .  S STATUSA(0)=1,STATUSA(1)="COMPLETE"
 ;
 I FILENUM=100 D  Q
 .  S STATUSA(0)=2,STATUSA(1)="ACTIVE",STATUSA(2)="PENDING"
 Q
 ;
