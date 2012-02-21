MAGQBUT ;WOIFO/RMP - Imaging Background Processor Utilities [ 03/25/2001 11:20 ]
 ;;3.0;IMAGING;**7,8,48**;Jan 11, 2005
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
FTYPE(RESULT) ;
 ; RPC[MAGQ FTYPE]
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP")
 N MAX,INDX,PLACE
 S PLACE=$$PLACE^MAGBAPI(+$G(DUZ(2)))
 S U="^",MAX=$P(^MAG(2006.1,PLACE,2,0),U,4),INDX=0
 Q:+MAX<1
 F  S INDX=$O(^MAG(2006.1,PLACE,2,INDX)) Q:INDX'?1N.N  D  Q:INDX=MAX
 . S RESULT(INDX-1)=$G(^MAG(2006.1,PLACE,2,INDX,0))
 Q
CHGSERV(RESULT) ;
 ; RPC[MAGQ FS CHNGE]
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP")
 N SPACE,DATA,IEN,SIZE,CWL,MIN,CNT,TNODE,TINT,NOW,TLTIME,TOD,PLACE,TS,AUTON
 S U="^",(INDX,SPACE,SIZE,CNT)=0,(RESULT,IEN)=""
 S PLACE=$$PLACE^MAGBAPI(+$G(DUZ(2)))
 S MIN=$$SPARM
 S CWL=$$CWL^MAGBAPI(PLACE)
 S DATA=$S(CWL?1N.N:$G(^MAG(2005.2,CWL,0)),1:0)
 ;Check for scheduled purge
 S AUTON=$G(^MAG(2006.1,PLACE,5))
 I $P(AUTON,U,3) D
 . N T1,T2
 . S T1="0000",T2=$P(AUTON,U,5),T1=$E(T1,1,($L(T1)-$L(T2)))_T2
 . I ($$FMADD^XLFDT($$NOW^XLFDT,-$P(AUTON,U,4),"","",""))>($P(AUTON,U,6)_"."_T1) D
 . . S $P(RESULT,U,4)="PURGE"
 . . S $P(^MAG(2006.1,PLACE,5),U,6)=$P($$NOW^XLFDT,".")
 . . Q
 . Q
 I $P($G(^MAG(2006.1,PLACE,1)),U,10) D  Q  ;Cache balancing off
 . I $$MAXSP(CWL,SPACE,SIZE,DATA,MIN) S $P(RESULT,U)=1 Q
 . D FSP(MIN,.SPACE,.SIZE,.IEN,.TS)
 . I IEN D SCWL(IEN) S $P(RESULT,U)=1 ;Advance current write location
 . E  D
 . . S $P(RESULT,U)=0
 . . S $P(RESULT,U,2,3)=$P(^MAG(2005.2,$P(^MAG(2006.1,PLACE,0),U,3),0),U,1,2)
 . . S:$P($G(^MAG(2006.1,PLACE,5)),U) $P(RESULT,U,4)="PURGE"
 . . D TMESS
 . . Q
 . Q
 D FSP(MIN,.SPACE,.SIZE,.IEN,.TS)
 ; SET THE CURRENT WRITE LOCATION = IEN HERE
 I IEN D SCWL(IEN)  ;NEED TO PARAMETER DRIVE THIS PROCESS !!!!!
 I SIZE>0,(((SPACE/SIZE)*100)>MIN) S $P(RESULT,U)=1 Q
 S $P(RESULT,U)=0
 S $P(RESULT,U,2,3)=$P(^MAG(2005.2,$P(^MAG(2006.1,PLACE,0),U,3),0),U,1,2)
 S:$P($G(^MAG(2006.1,PLACE,5)),U) $P(RESULT,U,4)="PURGE"
 D TMESS
 Q
TMESS ;Trigger a message
 N TN S TN=^MAG(2006.1,PLACE,3)
 Q:$$FMADD^XLFDT($P(TN,"^",11),"",$P(TN,"^",7),"","")>$$NOW^XLFDT
 D ICCL^MAGQBUT1(CNT_U_TS_U_SPACE_U_$P($G(^MAG(2006.1,PLACE,5)),U),$P(TN,"^",7)_" hours.")
 Q
TPURGE ; 
 S $P(RESULT,U,2,3)=$P(^MAG(2005.2,$P(^MAG(2006.1,PLACE,0),U,3),0),1,2)
 S TNODE=^MAG(2006.1,PLACE,3)
 S TINT=$P(TNODE,"^",8) I "^W^D^"[("^"_TINT_"^") D  ;CONDITIONAL PURGE
 . S NOW=$$NOW^XLFDT,TOD=$P(TNODE,"^",9)
 . Q:NOW<$$FMADD^XLFDT($P(NOW,"."),"",TOD,"","")
 . S TLTIME=$P(TNODE,"^",10)
 . I NOW>$$FMADD^XLFDT(TLTIME,$S(TINT="D":1,TINT="W":7),"","","") D
 . . S $P(RESULT,"^",4)="PURGE"
 Q
MAXSP(IEN,FS,SZ,NODE,MIN) ;
 N SPACE,SIZE
 S SPACE=+$P(NODE,U,5),SIZE=+$P(NODE,U,3)
 I SIZE>0,(((SPACE/SIZE)*100)>MIN),SPACE>FS D  Q 1
 . S FS=SPACE,SZ=SIZE
 Q 0
HFIND(SHARE,IEN) ;HASHED SHARE AT THE SAME LOCATION
 N INDEX,NODE,RESULT
 S INDEX=0,RESULT=""
 F  S INDEX=$O(^MAG(2005.2,"AC",SHARE,INDEX)) Q:INDEX'?1N.N  D
 . Q:INDEX=IEN
 . I $P(^MAG(2005.2,INDEX,0),"^",8)="Y" S RESULT=1
 Q RESULT
SPARM() ;Site Parameter for PERCENT server space to be held in reserve
 N VALUE
 S VALUE=$P($G(^MAG(2006.1,$$PLACE^MAGBAPI(+$G(DUZ(2))),1)),U,8)
 Q $S(VALUE>0:VALUE,1:5)
SCWL(IEN) ;
 S ^MAG(2006.1,PLACE,"ARITE")=IEN,$P(^MAG(2006.1,PLACE,0),U,3)=IEN
 S ^MAG(2006.1,PLACE,"APXWRITE")=IEN,$P(^MAG(2006.1,PLACE,"PACS"),U,3)=IEN
 Q
FSP(MIN,SPACE,SIZE,IEN,TOTAL) ; Find Space
 N INDX,DATA S (TOTAL,INDX)=0
 F  S INDX=$O(^MAG(2005.2,INDX)) Q:INDX'?1N.N  D
 . S DATA=$G(^MAG(2005.2,INDX,0))
 . Q:$P(DATA,U,6,7)'["1^MAG"
 . Q:$P(DATA,U,9)="1"  ;ROUTING SHARE
 . I $P(DATA,U,8)'="Y",$$HFIND($P(DATA,"^",2),INDX) Q
 . Q:$P(DATA,U,2)[":"
 . Q:$E($P(DATA,U,2),1,2)'="\\"
 . S TOTAL=TOTAL+(+$P(DATA,U,5))
 . S CNT=CNT+1
 . I $$MAXSP(INDX,.SPACE,.SIZE,DATA,MIN) S IEN=INDX
 Q
BUTERR ;Background Processor Utility Error trap
 D @^%ZOSF("ERRTN")
 Q
SLAD(RESULT) ;SITE LAST ACCESS DATE(DEFAULT TO 180)
 N PLACE
 S PLACE=$$PLACE^MAGBAPI(+$G(DUZ(2)))
 S RESULT=$S(+$P(^MAG(2006.1,PLACE,1),"^",2):+$P(^MAG(2006.1,PLACE,1),"^",2),1:180)
 Q
DQUE(QIEN) ;
 N ZNODE,TYPE,MAGIEN,QREC,TREC
 S U="^"
 S ZNODE=$G(^MAGQUEUE(2006.03,QIEN,0))
 S TYPE=$P(ZNODE,U)
 I TYPE="" D DBQ(QIEN) Q
 S QREC=$O(^MAGQUEUE(2006.031,"B",TYPE,""))
 I QREC,$P($G(^MAGQUEUE(2006.031,QREC,0)),U,2)=QIEN D
 . S TREC=+$O(^MAGQUEUE(2006.03,"B",TYPE,QIEN),-1)  ;'DELETE LPROC YET
 . S $P(^MAGQUEUE(2006.031,QREC,0),U,2)=TREC
 . Q
 K ^MAGQUEUE(2006.03,"B",$P(ZNODE,U),QIEN)
 K ^MAGQUEUE(2006.03,QIEN,0)
 I $P(ZNODE,U,5)]"" D
 . K ^MAGQUEUE(2006.03,"C",TYPE,$E($P(ZNODE,U,5),1,30),QIEN)
 L +^MAGQUEUE(2006.03,0)
 S $P(^MAGQUEUE(2006.03,0),"^",4)=$P(^MAGQUEUE(2006.03,0),"^",4)-1
 L -^MAGQUEUE(2006.03,0)
 Q:TYPE="DELETE"
 S MAGIEN=$P(ZNODE,U,7)
 Q:MAGIEN'?1N.N
 I TYPE="JUKEBOX" D  Q
 . K ^MAGQUEUE(2006.03,"JX",MAGIEN,QIEN)
 I "^JBTOHD^PREFET^"[("^"_TYPE_"^") D  Q
 . Q:'$P(ZNODE,U,8)
 . K ^MAGQUEUE(2006.03,"JD",MAGIEN,$P(ZNODE,U,8),QIEN)
 Q
DQUE1(RESULT,QIEN) ;[MAGQB QUEDEL]
 D DQUE(QIEN)
 Q
DBQ(QIEN) ;
 N INDX
 F INDX="DELETE","ABSTRACT","JUKEBOX","JBTOHD","PREFET","IMPORT" D
 . K ^MAGQUEUE(2006.03,"B",INDX,QIEN)
 K ^MAGQUEUE(2006.03,QIEN,0)
 Q
JBQUE(RESULT,QIEN) ; RPC[MAGQBP JBQUE]
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP")
 S RESULT=$$JUKEBOX^MAGBAPI(QIEN)
 Q
POSTI ;
 D INI^MAGUSIT
 N DIC,X,DA,Y,NODE1,NODE3,PLACE
 S PLACE=$$PLACE^MAGBAPI(+$G(DUZ(2)))
 S DIC="^MAG(2006.1,"_PLACE_",2,",DIC(0)="XL",X="TXT",DLAYGO="2006.112"
 S DA(1)=PLACE,DIC("P")="2006.112"
 D ^DIC
 ;File retention parameters defaults 45 - non abs /120 abs
 ;autowrite location update defaulted to ON
 S (DIE,DIC,DLAYGO)=2006.1,DA=PLACE,DIC(0)="XL"
 S NODE1=$G(^MAG(2006.1,1,1)),NODE3=$G(^MAG(2006.1,PLACE,3)),DR=""
 S KEYS=$G(^MAG(2006.1,PLACE,"KEYS"))
 S DR=$S(($P(NODE1,"^",2)'?1N.N):"8///45",1:DR)
 I ($P(NODE1,"^",5)'?1N.N) S DR=DR_$S((DR["/"):";",1:"")_"9///45"
 I ($P(NODE1,"^",10)'?1N.N) S DR=DR_$S((DR["/"):";",1:"")_"20///1"
 I ($P(NODE3,"^",1)'?1N.N) S DR=DR_$S((DR["/"):";",1:"")_"21///45"
 I ($P(NODE3,"^",2)'?1N.N) S DR=DR_$S((DR["/"):";",1:"")_"22///45"
 I ($P(NODE3,"^",3)'?1N.N) S DR=DR_$S((DR["/"):";",1:"")_"23///120"
 I ($P(NODE3,"^",4)'?1N.N) S DR=DR_$S((DR["/"):";",1:"")_"24///120"
 I ($P(NODE3,"^",5)'?1N.N) S DR=DR_$S((DR["/"):";",1:"")_"102///10"
 I ($P(NODE3,"^",6)'?1N.N) S DR=DR_$S((DR["/"):";",1:"")_"103///15"
 I ($P(NODE3,"^",7)'?1N.N) S DR=DR_$S((DR["/"):";",1:"")_"11.5///6"
 S DR=DR_$S((DR["/"):";",1:"")_"11.6///D"
 I ($P(NODE3,"^",9)'?1N.N) S DR=DR_$S((DR["/"):";",1:"")_"11.7///4"
 I ($P(NODE3,"^",10)'?1N.E) D
 . S DR=DR_$S((DR["/"):";",1:"")_"11.8///"_$$NOW^XLFDT
 I ($P(NODE3,"^",11)'?1N.E) D
 . S DR=DR_$S((DR["/"):";",1:"")_"11.9///"_$$NOW^XLFDT
 I ($P(KEYS,"^",2)'?1N.N) S DR=DR_$S((DR["/"):";",1:"")_"121///60"
 I ($P(KEYS,"^",3)'?1N.N) S DR=DR_$S((DR["/"):";",1:"")_"122///90"
 D ^DIE
 ; Enable the Imaging Health Summary component
 I $D(^GMT(142.1,235)) D
 . S (DIE,DIC)=142.1,DA=235
 . S DR="5///@;8///@"
 . D ^DIE
 K DIE,DIC,DA,Y,X,DLAYGO
 ; ESTABLISH LOCAL MAIL GROUP
 D MMGRP^MAGQAI
 D SILENT^MAGDROUT
 Q
X1 ; CLEANUP OLD FAILED JUKEBOX AND JBTOHD QUEUE ENTRYS
 S DIR(0)="Y",DIR("B")="YES"
 S DIR("?")="This activity removes already processed queues which precede the current queue pointer.  These queues are not necessary for file recovery.The current BP software will recover files during purge or by the verify."
 S DIR("A")="Do you wish to remove old processed Background Processor Queues" D
 . D ^DIR Q:($D(DIRUT)!(Y'="1"))
 . F PC="JUKEBOX","JBTOHD","PREFET","IMPORT" D FOQUE(PC)
 ; REINDEX FIELD 4 (COMPLETION STATUS) IN FILE 2006.03 (QUEUE)
 K ^MAGQUEUE(2006.03,"C")
 S DIK="^MAGQUEUE(2006.03,",DIK(1)="4^C"
 D ENALL^DIK K DIK
 Q
FOQUE(PROC) ;PASS A BP PROCESS TO DELETE OLD FAILED QUEUES
 N XX,JXMAX,JHMAX,QIEN
 S QIEN=$O(^MAGQUEUE(2006.031,"B",PROC,""))
 I QIEN?1N.N D
 . S JXMAX=$P($G(^MAGQUEUE(2006.031,QIEN,0)),"^",2)
 . Q:JXMAX'?1N.N 
 . S JXMAX=$O(^MAGQUEUE(2006.03,"B",PROC,JXMAX),-1)
 . Q:JXMAX'?1N.N
 . S XX=0
 . F  S XX=$O(^MAGQUEUE(2006.03,"B",PROC,XX)) Q:XX>(JXMAX-1)  D
 . . I $P($G(^MAGQUEUE(2006.03,XX,0)),"^",5)'="" D DQUE(XX)
