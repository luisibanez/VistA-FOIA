MAGQBJB ;WOIFO/PMK/RMP - Get an image file to copy to the JukeBoX [ 06/20/2001 08:57 ]
 ;;3.0;IMAGING;**8**;Sep 15, 2004
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
ENTRY(RESULT,QPTR) ; entry point from ^MAGQBTM
 ; RESULT=STATUS^IMAGE PTR^FROM FILE^TO FILE^VOLUME NAME^
 ;   JUKEBOX DEVICE^QUEUE PTR^JUKEBOX-NETWORK LOC PTR^QSN
 ; QSN=QUEUE SEQUENCE NUMBER
 N CWP,IMGPTR,L,JBDEVICE,FILENAME,FILE,X,JBPTR,SUBDIR
 N MAGFILE,MAGXX,MAGSTORE,MAGFILE2,PERCENT,SIZERTN,MAGDEV
 N TOFILE,TOTAL,QNODE,QSN,ZNODE,BNODE,FULL,ABS,BIG,MSG
 S U="^",QNODE=$G(^MAGQUEUE(2006.03,QPTR,0)),(ZNODE,FULL,ABS,BIG)=""
 S IMGPTR=$P(QNODE,U,7),QSN=+$P(QNODE,U,9)
 K ^MAGQUEUE(2006.03,"JX",IMGPTR,QPTR)
 I $D(^MAG(2005,IMGPTR,0)) D
 . S ZNODE=$G(^MAG(2005,IMGPTR,0))
 . S BNODE=$G(^MAG(2005,IMGPTR,"FBIG"))
 . Q
 E  I $D(^MAG(2005.1,IMGPTR,0)) D
 . S ZNODE=$G(^MAG(2005.1,IMGPTR,0))
 . S BNODE=$G(^MAG(2005.1,IMGPTR,"FBIG"))
 . Q
 I ZNODE="" D  Q  ;RESULT ;!!!!
 . S RESULT="-101^"_QPTR_"^MAG Global Node #"_IMGPTR_" not present"
 S FILE=$P(ZNODE,U,2)
 I FILE="" D  Q  ;RESULT ;!!!
 . I +$P($G(^MAG(2005,IMGPTR,1,0)),U,4)>0 D
 . . S MSG="Image group parent"
 . E  S MSG="Does not have an image file specified"
 . S RESULT="-5"_U_QPTR_U_MSG
 I $P(ZNODE,U,3)?1N.N,$P(ZNODE,U,5)="" D
 . S MAGDEV=$P(^MAG(2005.2,$P(ZNODE,U,3),0),U,2)
 . S FULL=MAGDEV_$$DIRHASH^MAGFILEB(FILE,$P(ZNODE,U,3))_FILE
 I $P(ZNODE,U,4)?1N.N D
 . S MAGDEV=$P(^MAG(2005.2,$P(ZNODE,U,4),0),U,2)
 . S ABS=MAGDEV_$$DIRHASH^MAGFILEB(FILE,$P(ZNODE,U,4))
 . S ABS=ABS_$P(FILE,".")_".ABS"
 I $P(BNODE,U)?1N.N,$P(BNODE,U,2)="" D
 . S MAGDEV=$P(^MAG(2005.2,$P(BNODE,U),0),U,2)
 . S BIG=MAGDEV_$$DIRHASH^MAGFILEB(FILE,$P(BNODE,U))
 . S BIG=BIG_$P(FILE,".")_".BIG"
 I FULL="",BIG="",ABS="" D  Q
 . S MSG=$S(('$P(BNODE,U))&('$P(ZNODE,U,4))&('$P(ZNODE,U,4)):"No Vista Cache Source",1:"")
 . S MSG=$S((('MSG)&($P(BNODE,U,2)!$P(ZNODE,U,5))):"Source file is already archived",1:MSG)
 . S MSG=$S('MSG:"No Network location OR already on WORM",1:MSG)
 . S RESULT="-11^"_QPTR_"^"_MSG
 S CWP=$$CWP^MAGBAPI($$PLACE^MAGBAPI(+$G(DUZ(2))))
 I $P(^MAG(2005.2,CWP,0),"^",6)'="1" D  Q
 . S RESULT="-4"_U_IMGPTR_U_"Jukebox Network Location is set Off-Line"
 S JBPTR=$$JBPTR^MAGBAPI($$PLACE^MAGBAPI(+$G(DUZ(2))))
 S JBDEVICE=$$JBDEV(JBPTR)
 K MAGFILE1
 S TOFILE=$$WPATH(FILE,CWP)_FILE
 S RESULT="1^"_IMGPTR_U_FULL_U_TOFILE_U
 S RESULT=RESULT_$$VOLNM(JBPTR)_U_JBDEVICE_U_QPTR_U_CWP_U_QSN_U_ABS_U_BIG
 Q  ;RESULT ;!!!
JBLPT(JBPTR) ; Jukebox Ptr to Network Location File
 Q $P(^MAGQUEUE(2006.032,JBPTR,0),U,3)
WPATH(FILE,CWP) ; Write path of Current Write Platter (CWP)
 Q $P(^MAG(2005.2,CWP,0),"^",2)_$$DIRHASH^MAGFILEB(FILE,CWP)
VOLNM(JBPTR) ; Volume name of JBDEVICE
 Q $P($G(^MAGQUEUE(2006.032,JBPTR,0)),"^",9)
JBDEV(JBPTR) ; Jukebox Device (drive spec)
 Q $P($G(^MAGQUEUE(2006.032,JBPTR,0)),"^",2)
