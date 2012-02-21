MAGBAPI ;WOIFO/PMK,RMP,SEB,MLH - Background Processor API to build queues ; 08/26/2003  07:04
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
 ; The API returns the entry's queue pointer
 ;
ABSTRACT(INPUT,PLACE) ; Entry point to create an image abstract
 ; input = image pointer
 S PLACE=$$GETPLACE($G(PLACE)) Q:'PLACE 0 ; DBI - SEB Patch 4
 Q $$QUEUE("ABSTRACT",INPUT,PLACE)
 ;
GCC(INPUT,PLACE) ; Entry point to create an Document Imaging Export Copy
 ; input = image pointer(^Second Piece Optional Location specified^3rd optional extension(s) specifier)
 S PLACE=$$GETPLACE($G(PLACE)) Q:'PLACE 0 ; DBI - SEB Patch 4
 Q $$QUEUE("GCC",$P(INPUT,"^")_"^^"_$P(INPUT,"^",4)_"^"_$P(INPUT,"^",2,3),PLACE)
 ;       
JUKEBOX(INPUT,PLACE) ; Entry point to copy an image file and abstract to the Jukebox
 ; input = image pointer
 N NEXT,CONS
 S PLACE=$$GETPLACE($G(PLACE)) Q:'PLACE 0 ; DBI - SEB Patch 4
 S CONS=$$CONSOLID()
 I CONS S NEXT=$O(^MAGQUEUE(2006.03,"E",PLACE,$P(INPUT,"^"),$$NEXTQ("JUKEBOX",PLACE)))
 E  S NEXT=$O(^MAGQUEUE(2006.03,"JX",$P(INPUT,"^"),$$NEXTQ("JUKEBOX")))
 Q:NEXT?1N.N NEXT
 S NEXT=$$QUEUE("JUKEBOX",INPUT,PLACE)
 I CONS S ^MAGQUEUE(2006.03,"E",PLACE,$P(INPUT,"^"),NEXT)=""
 E  S ^MAGQUEUE(2006.03,"JX",$P(INPUT,"^"),NEXT)=""
 Q NEXT
 ;
DELETE(INPUT,PLACE) ; Entry point to delete a file (literally from anywhere)
 ; input = full path of file to delete
 S PLACE=$$GETPLACE($G(PLACE)) Q:'PLACE 0 ; DBI - SEB Patch 4
 I $$CONSOLID() Q $$QUEUE("DELETE","^^^"_INPUT,PLACE) ;SETS 10TH PIECE
 Q $$QUEUE("DELETE","^^"_+$P(INPUT,"^",3)_U_$P(INPUT,"^")) ;SETS 10TH PIECE
 ;
IMPORT(INPUT,CALLBACK,TRACKID,PLACE) ; Entry point to import a file
 ; input = Image Parameter Array
 ; Callback = the process called with the results of the import activity
 N QUEIEN,INDX,FDA,DINUM,%,MS1,CT,REQUE
 S PLACE=$$GETPLACE($G(PLACE)) Q:'PLACE "0^Missing PLACE parameter" ; DBI - SEB Patch 4
 S REQUE=$S($P($G(INPUT),"^",3)'?1N.N:0,1:1)
 I REQUE=0 Q:($O(^MAG(2006.041,"C",TRACKID,""))?1N.N) "0^Duplicate Tracking ID"
 S QUEIEN=$$QUEUE("IMPORT","^^"_$P($G(INPUT),"^",3)_U_$TR(CALLBACK,"^","|")_U_$P($G(INPUT),"^",4),PLACE)
 I REQUE=0 D
 . S $P(^MAGQUEUE(2006.03,QUEIEN,0),"^",11)=QUEIEN
 . S (DINUM,X)=QUEIEN,DIC="^MAG(2006.034,",DLAYGO="2006.034",DIC(0)="L"
 . D FILE^DICN
 . K DIC
 . S CT=0
 . D CONV^MAGQBUT4(.INPUT,.CT)
 . D MRGMULT^MAGQBUT4(.INPUT,"^MAG(2006.034,"_QUEIEN_",1,","2006.341A",CT)
 D NOW^%DTC
 K DIE,FDA
 S FDA(2006.041,"+1,",.01)=$S(REQUE=0:QUEIEN,1:$P($G(INPUT),"^",4))
 S FDA(2006.041,"+1,",.02)=TRACKID
 S FDA(2006.041,"+1,",1)=$S(REQUE=0:"QUEUING",1:"REQUEUING")
 S FDA(2006.041,"+1,",2)=%
 D UPDATE^DIE("U","FDA","","MAGIMP")
 Q $S($D(DIERR):"0^"_MAGIMP("DIERR",1,"TEXT",1),1:QUEIEN)
 ;
JBTOHD(INPUT,PLACE) ; Entry point to copy an image from the Jukebox to the Hard Disk
 ; input = image pointer ^ FULL or ABSTRACT or BIG
 N NEXT,IEN,JDTYPE,CONS
 S PLACE=$$GETPLACE($G(PLACE)) Q:'PLACE 0 ; DBI - SEB Patch 4
 S IEN=$P(INPUT,"^"),JDTYPE=$P(INPUT,"^",2)
 S CONS=$$CONSOLID()
 I CONS S NEXT=$O(^MAGQUEUE(2006.03,"F",PLACE,IEN,JDTYPE,$$NEXTQ("JBTOHD",PLACE)))
 E  S NEXT=$O(^MAGQUEUE(2006.03,"JD",IEN,JDTYPE,$$NEXTQ("JBTOHD")))
 Q:NEXT?1N.N NEXT
 S NEXT=$$QUEUE("JBTOHD",INPUT,PLACE)
 I CONS S ^MAGQUEUE(2006.03,"F",PLACE,$P(INPUT,"^"),$P(INPUT,"^",2),NEXT)=""
 E  S ^MAGQUEUE(2006.03,"JD",$P(INPUT,"^"),$P(INPUT,"^",2),NEXT)=""
 Q NEXT
 ;
PREFET(INPUT,PLACE) ;
 ; input = image pointer ^ FULL or ABSTRACT or BIG
 N NEXT,IEN,JDTYPE,CONS
 S PLACE=$$GETPLACE($G(PLACE)) Q:'PLACE 0 ; DBI - SEB Patch 4
 S CONS=$$CONSOLID()
 S IEN=$P(INPUT,"^"),JDTYPE=$P(INPUT,"^",2)
 I CONS S NEXT=$O(^MAGQUEUE(2006.03,"F",PLACE,IEN,JDTYPE,$$NEXTQ("PREFET",PLACE)))
 E  S NEXT=$O(^MAGQUEUE(2006.03,"JD",IEN,JDTYPE,$$NEXTQ("PREFET")))
 Q:NEXT?1N.N NEXT
 S NEXT=$$QUEUE("PREFET",INPUT,PLACE)
 I CONS S ^MAGQUEUE(2006.03,"F",PLACE,$P(INPUT,"^"),$P(INPUT,"^",2),NEXT)=""
 E  S ^MAGQUEUE(2006.03,"JD",$P(INPUT,"^"),$P(INPUT,"^",2),NEXT)=""
 Q NEXT
 ;
EVAL(IMAGE,PLACE) ; Entry point for before rules are evaluated
 S PLACE=$$GETPLACE($G(PLACE)) Q:'PLACE 0 ; DBI - SEB Patch 4
 Q $$QUEUE("EVAL",IMAGE,PLACE)
 ;
NEXTQ(TYPE,PLACE) ;
 N X
 S PLACE=$$GETPLACE($G(PLACE)) Q:'PLACE 0 ; DBI - SEB Patch 4
 I $$CONSOLID() S X=$O(^MAGQUEUE(2006.031,"C",PLACE,TYPE,""))
 E  S X=$O(^MAGQUEUE(2006.031,"B",TYPE,""))
 Q $S('X:X,1:$P(^MAGQUEUE(2006.031,X,0),"^",2))
 ;
QUEUE(Q,INPUT,PLACE) ; Stuff the entry (header + INPUT) into the appropriate queue (Q)
 N %,%H,%I,QPTR,QTR,X,Y
 S U="^"
 S PLACE=$$GETPLACE($G(PLACE)) Q:'PLACE 0 ; DBI - SEB Patch 4
 ; increment the QPTR
 ;
 L +^MAGQUEUE(2006.03,0)
 S X=^MAGQUEUE(2006.03,0)
 S QPTR=$O(^MAGQUEUE(2006.03," "),-1)+1
 S $P(X,"^",3)=QPTR,$P(X,"^",4)=$P(X,"^",4)+1 ; #entries
 S ^MAGQUEUE(2006.03,0)=X
 ;
 ; add user, system id, date & time, and completion pieces to each entry
 D NOW^%DTC
 ; stuff the entry and "B" cross reference
 S ^MAGQUEUE(2006.03,QPTR,0)=Q_"^"_$G(DUZ)_"^"_^%ZOSF("VOL")_"^"_%_"^^^"_INPUT
 I $$CONSOLID() S ^MAGQUEUE(2006.03,"C",PLACE,Q,QPTR)="",$P(^MAGQUEUE(2006.03,QPTR,0),"^",12)=PLACE
 E  S ^MAGQUEUE(2006.03,"B",Q,QPTR)=""
 L -^MAGQUEUE(2006.03,0)
 D ADD(1,Q,PLACE)
 Q QPTR ; return pointer to the entry in the queue
 ;
ADD(N,QUEUE,PLACE) ; Ensure that the counter has a valid numeric value
 ; and increment it by N (N will be 0 if just validating...)
 ; QUEUE = Name of queue in 2006.03
 ;
 ; The counters in 2006.031 look like
 ;   ^MAGQUEUE(2006.031,D0,0) = Name ^ Next ^ Count
 ;     where Next is the IEN in 2006.03 of the next entry to be
 ;                processed by a 'background processor'
 ;       and Count is the number of entries for this queue
 ;
 N CNT,D0,I,X,CONS
 S PLACE=$$GETPLACE($G(PLACE)) Q:'PLACE 0 ; DBI - SEB Patch 4
 S CONS=$$CONSOLID()
 ;
 I CONS S D0=$O(^MAGQUEUE(2006.031,"C",PLACE,QUEUE,""))
 E  S D0=$O(^MAGQUEUE(2006.031,"B",QUEUE,""))
 D:'D0
 . L +^MAGQUEUE(2006.031)
 . S D0=$O(^MAGQUEUE(2006.031," "),-1)+1
 . S ^MAGQUEUE(2006.031,D0,0)=QUEUE_"^0"
 . I CONS=0 S ^MAGQUEUE(2006.031,"B",QUEUE,D0)=""
 . E  S ^MAGQUEUE(2006.031,"C",PLACE,QUEUE,D0)=""
 . S X="IMAGE BACKGROUND QUEUE POINTER^2006.031^"_D0_"^"_D0
 . S ^MAGQUEUE(2006.031,0)=X
 . L -^MAGQUEUE(2006.031)
 . Q
 L +^MAGQUEUE(2006.031,D0)
 S X=^MAGQUEUE(2006.031,D0,0),CNT=$P(X,"^",3)
 I CNT?1.N S CNT=CNT+N
 E  D
 . S I=$P(X,"^",2),CNT=0
 . I CONS F  S I=$O(^MAGQUEUE(2006.03,"C",PLACE,QUEUE,I)) Q:I'?1N.N  S CNT=CNT+1
 . E  F  S I=$O(^MAGQUEUE(2006.03,"B",QUEUE,I)) Q:I'?1N.N  S CNT=CNT+1
 . Q
 I CONS S $P(X,"^",4)=PLACE
 S $P(X,"^",3)=CNT,^MAGQUEUE(2006.031,D0,0)=X
 L -^MAGQUEUE(2006.031,D0)
 Q
 ;
CWL(PLACE) ;Current Write Location
 S PLACE=$$GETPLACE($G(PLACE)) Q:'PLACE 0 ; DBI - SEB Patch 4
 Q $P($G(^MAG(2006.1,PLACE,0)),"^",3)
 ;
PLACE(IEN) ; DBI - SEB Patch 4
 Q $$GETPLACE(+$O(^MAG(2006.1,"B",IEN,"")))
 ;
CWP(PLACE) ;Current Write Platter
 N JBPTR
 S PLACE=$$GETPLACE($G(PLACE)) Q:'PLACE 0 ; DBI - SEB Patch 4
 S JBPTR=$$JBPTR(PLACE) Q:'JBPTR 0
 Q $P($G(^MAGQUEUE(2006.032,JBPTR,0)),"^",3)
 ;
JBPTR(PLACE) ;Current JukeBox Pointer
 S PLACE=$$GETPLACE($G(PLACE)) Q:'PLACE 0 ; DBI - SEB Patch 4
 Q $P($G(^MAG(2006.1,PLACE,1)),"^",6)
 ;
GETPLACE(PLACE) ; Validate place
 S PLACE=+$S($$CONSOLID():$G(PLACE),1:$O(^MAG(2006.1,0)))
 I PLACE,$P($G(^MAG(2006.1,PLACE,0)),"^",1)="" S PLACE=0
 I 'PLACE D:$G(^MAG(2006.1,"WARNING","MAGBAPI"))+1<$$NOW^XLFDT
 . N I,MSG,S,T
 . S MSG="Application process failure"
 . S I=1,MSG(I)="Cannot determine 'place' (location, division, institution) for image."
 . S T=$J("At",11) F S=$ST-1:-1:0 D
 . . S I=I+1,MSG(I)=T_": "_$ST(S,"PLACE")_" = "_$ST(S,"MCODE"),T="Called From"
 . . Q
 . S:$G(DUZ) I=I+1,MSG(I)="The USER was: "_$$GET1^DIQ(200,DUZ,".01","E")
 . S I=I+1,MSG(I)="This fault may result in the failure to archive or process images."
 . S I=I+1,MSG(I)="Please log a NOIS-call."
 . S ^MAG(2006.1,"WARNING","MAGBAPI")=$$NOW^XLFDT
 . S I="" F  S I=$O(MSG(I)) Q:I=""  D DFNIQ^MAGQBPG1("",MSG(I),0)
 . D DFNIQ^MAGQBPG1("",MSG,1)
 . Q
 Q PLACE
 ;
CONSOLID() ;
 Q $GET(^MAG(2006.1,"CONSOLIDATED"))="YES"
 ;
CONRPC(RESULT) ;[MAGG CONS]
 S RESULT=$$CONSOLID^MAGBAPI()
 Q
PLACER(RESULT) ;[MAGG PLACE]
 S RESULT=$$PLACE^MAGBAPI(+$G(DUZ(2)))
 Q
 ;
