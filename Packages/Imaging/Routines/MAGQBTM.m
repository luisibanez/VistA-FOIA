MAGQBTM ;WOIFO/RMP - REMOTE Task SERVER Program [ 03/25/2001 11:20 ]
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
 ;
ENTRY(RESULT,WSTAT,PROCESS) ;
 ; RPC[MAGQ ABP]
 N X,SYSIEN,SYSNAME,NODE,INDX,CNT,PROC,%,QPTR,QCNT,VERS,EXEDATE,WSOS
 D NOW^%DTC
 ; Initialize error trap
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP")
 S (SYSIEN,CNT)=0,SYSNAME=""
 S $P(RESULT(0),U,6)=$D(^XUSEC("MAG SYSTEM",DUZ))
 Q:'$P(RESULT(0),U,6)
 S VERS=$P(WSTAT,U,2),EXEDATE=$P(WSTAT,U,3),WSOS=$P(WSTAT,U,4)
 S WSTAT=$P(WSTAT,U)
 S SYSIEN=$O(^MAG(2006.8,"C",WSTAT,"")) ; True workstation name
 I 'SYSIEN S SYSIEN=$O(^MAG(2006.8,"C",$$UPPER^MAGQE4(WSTAT),""))
 I 'SYSIEN D  ; Attempt to find a match from local name
 . N TRY
 . F TRY=1:1:$L(WSTAT,".") D  Q:SYSIEN?1.N
 . . S SYSIEN=$O(^MAG(2006.8,"C",$P(WSTAT,".",TRY),""))
 . . I 'SYSIEN S SYSIEN=$O(^MAG(2006.8,"C",$$UPPER^MAGQE4($P(WSTAT,".",TRY)),""))
 . . Q
 . Q
 ;
 Q:SYSIEN=""
 S $P(^MAG(2006.8,SYSIEN,1),U,2)=VERS
 S $P(^MAG(2006.8,SYSIEN,1),U,3)=EXEDATE
 S $P(^MAG(2006.8,SYSIEN,1),U,4)=WSOS
 S VERS=$P(VERS,".",1,2)_"P"_$P(VERS,".",3)
 Q:'$$VOK^MAGQBUT4(VERS)
 S ^TMP("MAGQN",$J,0)=SYSIEN_"^"_WSTAT
 S NODE=^MAG(2006.8,SYSIEN,0)
 S SYSNAME=$P(NODE,U)
 I SYSNAME="" D  Q
 . S $P(RESULT(0),U,1,2)="-1^No Background Processor parameters on system"
 I $P(NODE,U,12)'=1 D  Q
 . S $P(RESULT(0),U,1,2)="-1^Not assigned as a Background Processor"
 F PROC="ABSTRACT","JUKEBOX","JBTOHD","DELETE","PREFET","GCC","IMPORT" D
 . N FNUM,PIECE
 . S FNUM=$$FNUM(PROC)
 . S PIECE=$$GET1^DID(2006.8,FNUM,"","GLOBAL SUBSCRIPT LOCATION")
 . S PIECE=$P(PIECE,";",2)
 . I $P(NODE,U,PIECE)="1" D
 . . N QCNT,QPTR
 . . D ADD^MAGBAPI(0,PROC)
 . . S QPTR=$O(^MAGQUEUE(2006.031,"B",PROC,""))
 . . S QCNT=$P($G(^MAGQUEUE(2006.031,+QPTR,0)),U,3)
 . . S CNT=CNT+1
 . . S RESULT(CNT)=PROC_U_QCNT
 . . Q
 . Q
 S $P(RESULT(0),U,1,5)="0^BP List^PID: "_$$BASE^XLFUTL($J,10,16)_"^"_SYSNAME_U_WSTAT
 Q
 ;
FNUM(PROCESS) ;
 Q:PROC="ABSTRACT" 12
 Q:PROC="JUKEBOX" 13
 Q:PROC="JBTOHD" 14
 Q:PROC="PREFET" 15
 Q:PROC="IMPORT" 16
 Q:PROC="GCC" 17
 Q:PROC="DELETE" 20
 Q 0
 ;
GETQUE(RESULT,ACTION) ;
 ; RPC[MAGQ GET]
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP")
 D @(ACTION_"(.RESULT)")
 I +RESULT<0 D
 . D NOW^%DTC
 . D QSTAT($P(RESULT,U,2),$P(RESULT,U,3),ACTION)
 . D QPTER(ACTION,$P(RESULT,U,2))
 . Q
 Q
 ;
ABSTRACT(RESULT) ;
 D DEQUEUE("ABSTRACT",.RESULT)
 Q
 ;
JUKEBOX(RESULT) ;
 D DEQUEUE("JUKEBOX",.RESULT)
 Q
 ;
JBTOHD(RESULT) ;
 D DEQUEUE("JBTOHD",.RESULT)
 Q
 ;
GCC(RESULT) ;
 D DEQUEUE("GCC",.RESULT)
 Q
 ;
DELETE(RESULT) ;
 D DEQUEUE("DELETE",.RESULT)
 Q
 ;
PREFET(RESULT) ;
 D DEQUEUE("PREFET",.RESULT)
 Q
 ;
IMPORT(RESULT) ;
 D DEQUEUE("IMPORT",.RESULT)
 Q
 ;
DEQUEUE(QUE,RESULT) ;
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP")
 N QPTR,QPTR2,ROU,MAGIEN,ZNODE,MSG,IMQUE
 S QPTR2=$O(^MAGQUEUE(2006.031,"B",QUE,""))
 S QPTR=$S(QPTR2:$P(^MAGQUEUE(2006.031,QPTR2,0),U,2),1:"")
 S QPTR=$O(^MAGQUEUE(2006.03,"B",QUE,QPTR))
 I QPTR="" D  Q
 . S RESULT="0"_U_QPTR2_U_"No "_QUE_" "_QPTR2_" to process."
 . Q
 D QSTAT(QPTR,QUE_" in progress.",QUE)
 S ZNODE=$G(^MAGQUEUE(2006.03,QPTR,0))
 I ZNODE="" S RESULT=-101_U_QPTR_U_"Queue Record does not exist" Q
 I QUE="IMPORT" D ENTRY^MAGQBIM(QPTR,QUE,QPTR2,ZNODE,.RESULT) Q
 S MAGIEN=$P(ZNODE,"^",7)
 I QUE'="DELETE",(('(+MAGIEN))!('$D(^MAG(2005,+MAGIEN,0)))!($P(ZNODE,U)'=QUE)) D  Q
 . I $D(^MAG(2005.1,+MAGIEN,0)) D
 . . S MSG="Image Record Deleted and in archive file."
 . . Q
 . E  S MSG="No valid image file number to process."
 . S RESULT=-101_U_QPTR_U_MSG
 . Q
 S ROU=$$RESET(QUE)
 I ROU="" S RESULT="-1"_U_QPTR_U_QUE_" Is an inactive process" Q
 D @("ENTRY^"_ROU_"(.RESULT,QPTR)")
 Q
 ;
QSTAT(QPTR,MESSAGE,ACTION) ;
 Q:QPTR=""
 Q:'$D(^MAGQUEUE(2006.03,QPTR,0))
 D NOW^%DTC
 I $P($G(^MAGQUEUE(2006.03,QPTR,0)),U,5)]"" D
 . K ^MAGQUEUE(2006.03,"C",$E($P(^MAGQUEUE(2006.03,QPTR,0),U),1,30),$E($P(^MAGQUEUE(2006.03,QPTR,0),U,5),1,30),QPTR)
 . Q
 S ^MAGQUEUE(2006.03,"C",$E($P(^MAGQUEUE(2006.03,QPTR,0),U),1,30),$E(MESSAGE,1,30),QPTR)=""
 S $P(^MAGQUEUE(2006.03,QPTR,0),U,5,6)=$P(MESSAGE,U)_U_%
 I ACTION["IMPORT" D STAT^MAGQBIM(QPTR,%,MESSAGE)
 Q
 ;
QPTER(QUEUE,QPTR) ;
 N QREC,PREV,PNODE
 S QREC=$O(^MAGQUEUE(2006.031,"B",QUEUE,""))
 S PREV=$S(QREC:$P(^MAGQUEUE(2006.031,QREC,0),U,2),1:"")
 I PREV'="" D  Q
 . I QPTR=$O(^MAGQUEUE(2006.03,"B",QUEUE,PREV)) D
 . . L +^MAGQUEUE(2006.031)
 . . D ADD^MAGBAPI(-1,QUEUE)
 . . S $P(^MAGQUEUE(2006.031,QREC,0),U,2)=QPTR
 . . L -^MAGQUEUE(2006.031)
 . . S PNODE=$G(^MAGQUEUE(2006.03,PREV,0))
 . . I +$P(PNODE,"^",5)>0 D DQUE^MAGQBUT(PREV)
 . . Q
 . Q
 D ADD^MAGBAPI(0,QUEUE)
 Q
 ;
RESET(QUEUE) ; Set Routine parameter
 Q:QUEUE="ABSTRACT" "MAGQBAB"
 Q:QUEUE="JUKEBOX" "MAGQBJB"
 Q:QUEUE="JBTOHD" "MAGQBJH"
 Q:QUEUE="DELETE" "MAGQBD"
 Q:QUEUE="PREFET" "MAGQBJH"
 Q:QUEUE="IMPORT" "MAGQBIM"
 Q:QUEUE="GCC" "MAGQBGCC"
 Q ""
 ;
RQCNT ;
 N QIEN,QPTR,QNAM
 L +^MAGQUEUE(2006.031)
 S QNAM=""
 F  S QNAM=$O(^MAGQUEUE(2006.031,"B",QNAM)) Q:QNAM=""  D
 . S QIEN=$O(^MAGQUEUE(2006.031,"B",QNAM,"")) Q:QIEN'?1.N
 . S QPTR=+$P(^MAGQUEUE(2006.031,QIEN,0),U,2)
 . S $P(^MAGQUEUE(2006.031,QIEN,0),U,3)=""
 . D ADD^MAGBAPI(0,QNAM)
 . S $P(^MAGQUEUE(2006.031,QIEN,0),U,2)=QPTR
 . Q
 L -^MAGQUEUE(2006.031)
 Q
 ;
QUPDTE(RESULT,QPTR,UPDATE) ;
 ; RPC[MAGQ QUD]
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP")
 N NODE,STAT,TYPE,VPTR,MPTR,IEN,IDFN,MSG
 S NODE=$G(^MAGQUEUE(2006.03,QPTR,0))
 S RESULT="1^QUEUE UPDATE COMPLETE"
 S STAT=$P(UPDATE,U)
 S TYPE=$P(NODE,U)
 S MSG=$S($P(UPDATE,U,2)="":TYPE_" Process Error",1:$P(UPDATE,U,2))
 I TYPE="" D QRUPT(QPTR,.RESULT,NODE) Q
 D QSTAT(QPTR,$S(STAT<0:MSG,1:STAT),TYPE)
 D QPTER(TYPE,QPTR)
 I STAT<0 Q
 I "^DELETE^"[("^"_TYPE_"^") D DQUE^MAGQBUT(QPTR) Q
 S VPTR=$P(UPDATE,U,3)
 I VPTR?1.N D
 . S MPTR=$P(NODE,U,7)
 . I "^ABSTRACT^"[("^"_TYPE_"^") D  Q
 . . S $P(^MAG(2005,MPTR,0),U,4)=VPTR
 . . S X=$$JUKEBOX^MAGBAPI(MPTR)
 . . D DQUE^MAGQBUT(QPTR)
 . . Q
 . I ("^JBTOHD^"[("^"_TYPE_"^"))!("^PREFET^"[("^"_TYPE_"^")) D  Q
 . . I "^FULL^"[$P(NODE,U,8) S $P(^MAG(2005,MPTR,0),U,3)=VPTR
 . . I "^ABSTRACT^"[$P(NODE,U,8) S $P(^MAG(2005,MPTR,0),U,4)=VPTR
 . . I "^BIG^"[$P(NODE,U,8) S $P(^MAG(2005,MPTR,"FBIG"),U)=VPTR
 . . D DQUE^MAGQBUT(QPTR)
 . . Q
 . I "^JUKEBOX^"[("^"_TYPE_"^") D  Q 
 . . I $P(UPDATE,U,2)["BIG" D  Q
 . . . S:$D(^MAG(2005,MPTR)) $P(^MAG(2005,MPTR,"FBIG"),U,2)=VPTR
 . . . S:$D(^MAG(2005.1,MPTR)) $P(^MAG(2005.1,MPTR,"FBIG"),U,2)=VPTR
 . . E  D
 . . S:$D(^MAG(2005,MPTR)) $P(^MAG(2005,MPTR,0),U,5)=VPTR
 . . S:$D(^MAG(2005.1,MPTR)) $P(^MAG(2005.1,MPTR,0),U,5)=VPTR
 . . D DQUE^MAGQBUT(QPTR)
 . . Q
 . I "^GCC^"[("^"_TYPE_"^") D  Q
 . . D NOW^%DTC
 . . S FDA(2005.01,"+1,"_MPTR_",",.01)=VPTR
 . . S FDA(2005.01,"+1,"_MPTR_",",1)=%
 . . S FDA(2005.01,"+1,"_MPTR_",",2)=$P($$TRIM^MAGQST($P(UPDATE,U,2))," ")
 . . D UPDATE^DIE("U","FDA","","MAGIMP")
 . . S IDFN=$P(^MAG(2005,MPTR,0),U,7)
 . . D ENTRY^MAGLOG("EXPORT->"_$P($G(^MAG(2005.2,VPTR,0)),U,2),$P(NODE,U,2),MPTR,"Document Imaging",IDFN,0)
 . . Q
 . Q
 Q
 ;
QRUPT(PTR,RESULT,NODE) ; Delete corrupt 2006.03 entry/update next queue ptr prn
 N %,TYPE,DONE,QIEN,MSG
 D NOW^%DTC
 I $D(^MAG(2005.1,PTR)) D
 . S MSG="Image Record Deleted and in archive file: "
 . Q
 E  S MSG="Queue record corrupted: "
 S RESULT="-1^"_PTR_"^"_MSG_NODE
 D QSTAT(PTR,"QUEUE RECORD CORRUPTED","DON'T KNOW")
 S ^TMP("MAGQ",$J,"QRUPT",PTR,%)=RESULT_U_NODE
 S (TYPE,DONE)=""
 F  S TYPE=$O(^MAGQUEUE(2006.031,"B",TYPE)) Q:TYPE=""  D  Q:DONE
 . I $D(^MAGQUEUE(2006.03,"B",TYPE,PTR)) D 
 . . S $P(^MAGQUEUE(2006.03,PTR,0),U)=TYPE,DONE=1
 . . Q
 . Q
 I 'DONE ;K ^MAGQUEUE(2006.03,PTR,0)
 Q
 ;
REQUE(RESULT,QPTR) ;
 ; RPC[MAGQ REQ]
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP")
 N PROC,NODE,INDX,PARAM,OPDUZ,STATUS,TRACKID
 S INDX=$$TRIM^MAGQST(QPTR),TRACKID=0
 S NODE=$G(^MAGQUEUE(2006.03,INDX,0))
 Q:NODE=""
 S PROC=$P(NODE,U),STATUS=$P(NODE,U,5)
 I PROC'="IMPORT" D
 . D RQP(PROC,NODE,.PARAM)
 . S @("RESULT=$$"_PROC_"^MAGBAPI(PARAM)")
 . Q
 E  D
 . S $P(PARAM,U,3)=+$P(NODE,U,9)+1
 . S $P(PARAM,U,4)=$S($P(NODE,U,11)?1N.N:$P(NODE,U,11),1:QPTR)
 . D TIDL^MAGQBIM($S($P(NODE,U,11)?1N.N:$P(NODE,U,11),1:QPTR),PROC,.TRACKID)
 . Q:TRACKID=0
 . S @("RESULT=$$"_PROC_"^MAGBAPI(PARAM,$P(NODE,U,10),TRACKID)")
 I RESULT?1.N,STATUS'="" D
 . S $P(^MAGQUEUE(2006.03,RESULT,0),U,5)=STATUS
 . S ^MAGQUEUE(2006.03,"C",PROC,$E(STATUS,1,30),RESULT)=""
 . Q
 Q:((PROC="IMPORT")&(TRACKID=0))
 D DQUE^MAGQBUT(INDX)
 Q
 ;
RQP(P,N,PAR) ;
 N P1,P2,P3,P4
 I ("^JBTOHD^PREFET^")[P S P1=$P(N,U,7),P2=$P(N,U,8),P3=+$P(N,U,9)+1,PAR=P1_U_P2_U_P3 Q
 I P["DELETE" S P1=$P(N,U,10)_"^^",P2=+$P(N,U,9)+1,PAR=P1_P2 Q
 I P["GCC" D  Q
 . S P1=$P(N,U,7),P2=$P(N,U,10),P3=$P(N,U,11),P4=$P(N,U,9)+1,PAR=P1_U_P2_U_P3_U_P4 Q
 S P1=$P(N,U,7)_"^^",P2=+$P(N,U,9)+1,PAR=P1_P2 ;JUKEBOX + ABSTRACT
 Q
ERR ;
 N ERRXX
 S ERRXX=$$EC^%ZOSV
 D ^%ZTER
 D ^XUSCLEAN
 Q
 ;
