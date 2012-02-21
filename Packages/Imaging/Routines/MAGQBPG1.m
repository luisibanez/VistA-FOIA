MAGQBPG1 ;WOIFO/RMP - REMOTE Task SERVER Program [ 11/08/2001 17:18 ]
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
ENTRY(RESULT,WSTAT,PROCESS) ;RPC[MAGQ JBS]
 N X,SYSIEN,SYSNAME,ZNODE,NODE,INDX,CNT,PROC,%,QPTR,QCNT,SHARE,PLACE
 D NOW^%DTC
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP")
 S (SYSIEN,CNT)=0,SYSNAME="",U="^",PLACE=$$PLACE^MAGBAPI(+$G(DUZ(2)))
 S SYSIEN=$O(^MAG(2006.8,"C",WSTAT,"")) ;TRUE WORKSTATION NAME
 I 'SYSIEN S SYSIEN=$O(^MAG(2006.8,"C",$$UPPER^MAGQE4(WSTAT),""))
 I 'SYSIEN D  ;ATTEMPT TO FIND A MATCH FROM LOCAL NAME
 . N TRY
 . F TRY=1:1:$L(WSTAT,".") D  Q:SYSIEN?1N.N
 . . S SYSIEN=$O(^MAG(2006.8,"C",$P(WSTAT,".",TRY),""))
 . . I 'SYSIEN S SYSIEN=$O(^MAG(2006.8,"C",$$UPPER^MAGQE4($P(WSTAT,".",TRY)),""))
 I SYSIEN="" D  Q
 . S RESULT(0)="-1^This workstation is not currently setup as a Background Processor."
 . Q
 S NODE=^MAG(2006.8,SYSIEN,0)
 S SYSNAME=$P(NODE,U)
 I SYSNAME="" D  Q
 . S RESULT(0)="-1^This workstation is not currently setup as a Background Processor."
 . Q
 S RESULT(0)="0^BP List^PID: "_$$BASE^XLFUTL($J,10,16)_U_SYSNAME_U_WSTAT_U_$P(^MAG(2006.1,PLACE,0),U,2)
 S (X,CNT)=0
 F  S X=$O(^MAG(2005.2,X)) Q:X'?1N.N  S ZNODE=^(X,0) D
 . Q:'$P(ZNODE,U,6)  ;1=on-line
 . Q:$E($P(ZNODE,U,2),1,2)'="\\"
 . Q:(($P(ZNODE,U,7)'["WORM")&($P(ZNODE,U,7)'="RW"))
 . S CNT=CNT+1,SHARE=$P(ZNODE,U,2)
 . I $E(SHARE,$L(SHARE))="\" S SHARE=$E(SHARE,1,$L(SHARE)-1)
 . S RESULT(CNT)=X_U_SHARE_U_$P(ZNODE,U,8)
 Q
JBPTR(RESULT,FILE) ; RPC [MAGQ JBPTR]
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP")
 N IEN,SITEID
 S SITEID=$$UPPER^MAGQE4($P(^MAG(2006.1,$$PLACE^MAGBAPI(+$G(DUZ(2))),0),U,2))
 S IEN=$P(+$P(FILE,SITEID,2),".")
 S RESULT=$$JBPTR^MAGQBPRG(IEN,$$FTYPE^MAGQBPRG($P(FILE,".",2)))
 Q
SHR(RESULT) ; RPC[MAGQ SHARES]
 N TMP,INDX,DATA,CNT,SHARE,CWL,VALUE ;CWL=CURRENT WRITE LOCATION
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP")
 S (CNT,INDX)=0,U="^"
 S CWL=$$CWL^MAGBAPI($$PLACE^MAGBAPI(+$G(DUZ(2))))
 F  S INDX=$O(^MAG(2005.2,INDX)) Q:INDX'?1N.N  D
 . S DATA=$G(^MAG(2005.2,INDX,0))
 . Q:$P(DATA,U,6,7)'["1^MAG"
 . Q:$P(DATA,U,9)="1"  ;ROUTING SHARE
 . Q:$P(DATA,U,2)[":"
 . S SHARE=$P(DATA,U,2)
 . Q:$E(SHARE,1,2)'="\\"
 . I $E(SHARE,$L(SHARE))="\" S SHARE=$E(SHARE,1,$L(SHARE)-1)
 . S SHARE=SHARE_U_$P(DATA,U,8)
 . Q:$D(TMP(SHARE))
 . S TMP(SHARE)=INDX
 S INDX=""
 F  S INDX=$O(TMP(INDX)) Q:INDX=""  D
 . S RESULT(CNT)=TMP(INDX)_U_INDX,CNT=CNT+1
 . S ^TMP("MAGQBP",$J,"SHRLST",CNT-1)=TMP(INDX)_U_INDX
 K TMP
 Q
CNP2(RESULT,IEN,START,STOP) ;RPC [MAGQ JBSCN]
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP")
 N FNAME,PIECE,ZNODE,NODE2,BNODE,BNAME,PTR,HASH,TEMP,ORDER,RDATE,PLACE,OFFLINE
 S RESULT="",PLACE=$$PLACE^MAGBAPI(+$G(DUZ(2))),OFFLINE=0
 S:START="" START=$O(^MAG(2005,0)) S:STOP="" STOP=$O(^MAG(2005,"A"),-1)
 S ORDER=$S(START>STOP:"R",1:"F")
 I (IEN'?1N.N)!IEN=0 D  I IEN="" S RESULT=0 Q
 . I START=0 S IEN=START Q
 . S IEN=$S(ORDER="F":$O(^MAG(2005,START),-1),1:$O(^MAG(2005,START)))
 . Q
 S IEN=+IEN
 F  S IEN=$S(ORDER="F":$O(^MAG(2005,IEN)),1:$O(^MAG(2005,IEN),-1)) D  Q:(('OFFLINE)!('IEN))
 . S ZNODE=$G(^MAG(2005,IEN,0))
 . Q:($P(ZNODE,U,2)="")  ; Only check the offline status of image files
 . S OFFLINE=$$IMOFFLN^MAGFILEB($P(ZNODE,U,2))
 . Q
 I $S('IEN:1,((ORDER="F")&(IEN>STOP)):1,((ORDER="R")&(IEN<STOP)):1,1:0) D  Q
 . S RESULT=0
 . Q
 S FNAME=$P(ZNODE,U,2)
 S $P(RESULT,U)=IEN
 S $P(RESULT,U,19)=$P($P($G(^MAG(2005,IEN,2)),U),".")
 I $P(ZNODE,U,2)'="" D  ;NON-GROUP PARENT
 . S BNODE=$G(^MAG(2005,IEN,"FBIG"))
 . S:$P(ZNODE,U,5)?1N.N $P(RESULT,U,3)=$P(ZNODE,U,5)
 . I $P(ZNODE,U,5)?1N.N S $P(RESULT,U,3)=$P(ZNODE,U,5)
 . E  D  ;SET JBPTR TO THE CURRENT JB WRITE LOCATION
 . . S TEMP=$P(^MAG(2006.1,PLACE,1),U,6)
 . . S $P(RESULT,U,3)=$P(^MAGQUEUE(2006.032,TEMP,0),U,3)
 . . Q
 . S:$P(BNODE,U,2)?1N.N $P(RESULT,U,4)=$P(BNODE,U,2)
 . S:$P(ZNODE,U,3)?1N.N $P(RESULT,U,5)=$P(ZNODE,U,3)
 . S:$P(ZNODE,U,4)?1N.N $P(RESULT,U,6)=$P(ZNODE,U,4)
 . S:$P(BNODE,U)?1N.N $P(RESULT,U,7)=$P(BNODE,U)
 . S $P(RESULT,U,8)=$$CWL^MAGBAPI(PLACE)
 . S $P(RESULT,U,2)=FNAME
 . Q
 S $P(RESULT,U,12,17)=$$CHKIMG^MAGQBUT2(IEN)
 Q
JPUD(RESULT,JPTR,EXT,IEN) ; RPC[MAGQ JPUD]
 N TYPE,PIECE,NODE
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP"),RESULT="0"
 S TYPE=$$FTYPE^MAGQBPRG(EXT)
 S PIECE=$S(TYPE="BIG":2,1:5)
 S NODE=$S(TYPE="BIG":"FBIG",1:0)
 I PIECE=0 D ELOG^MAGQBPRG(FN,FP) Q
 S:JPTR="0" JPTR=""
 I 'JPTR,$D(^MAGQUEUE(2006.033,"B",$P($G(^MAG(2005,IEN,0)),U,2))) D  Q
 . S RESULT=0 Q  ;Don't clear the JB pointer if image is on an Off-line Platter
 S:$D(^MAG(2005,IEN,NODE)) $P(^MAG(2005,IEN,NODE),U,PIECE)=JPTR
 S:$D(^MAG(2005.1,IEN,NODE)) $P(^MAG(2005.1,IEN,NODE),U,PIECE)=JPTR
 S RESULT="1"
 Q
VCUD(RESULT,VCPTR,EXT,IEN) ; RPC[MAGQ VCUD]
 N TYPE,PIECE,NODE
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP"),RESULT="0"
 S TYPE=$$FTYPE^MAGQBPRG(EXT)
 S PIECE=$S(TYPE="BIG":1,TYPE="ABS":4,1:3)
 S NODE=$S(TYPE="BIG":"FBIG",1:0)
 I PIECE=0 D ELOG^MAGQBPRG(FN,FP) Q
 S:VCPTR="0" VCPTR=""
 S:$D(^MAG(2005,IEN,NODE)) $P(^MAG(2005,IEN,NODE),U,PIECE)=VCPTR
 S:$D(^MAG(2005.1,IEN,NODE)) $P(^MAG(2005.1,IEN,NODE),U,PIECE)=VCPTR
 S RESULT="1"
 Q
DFNIQ(RESULT,INPUT,SEND) ;
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP")
 N LOC,CNT
 S U="^"
 S CNT=+$O(^TMP($J,"MAGQDFN",""),-1)
 I CNT<2 D
 . D NOW^%DTC S Y=% D DD^%DT
 . S LOC=$$KSP^XUPARAM("WHERE")
 . S ^TMP($J,"MAGQDFN",1)="            SITE: "_LOC
 . S ^TMP($J,"MAGQDFN",2)="            DATE: "_Y_" "_$G(^XMB("TIMEZONE"))
 . S CNT=2
 . Q
 I SEND="1" D
 . S XMSUB=INPUT
 . N XMY,XMTEXT
 . S XMTEXT="^TMP($J,""MAGQDFN"","
 . S XMY("G.MAG SERVER")=""
 . S:$G(DUZ) XMY(DUZ)=""
 . D ^XMD
 . K ^TMP($J,"MAGQDFN")
 . Q
 E  S CNT=CNT+1,^TMP($J,"MAGQDFN",CNT)=INPUT
 S RESULT="1"
 Q
MOVE(RESULT,FNAM) ;[MAGQ MOVE]
 S X="ERR^MAGQBTM",@^%ZOSF("TRAP")
 N IEN,FTYPE,NMSPC,SITEID,EXT,ALT,J
 S NMSPC=$TR($P(FNAM,"."),"0123456789","")
 S SITEID=$$INIS^MAGQBPG2($$PLACE^MAGBAPI(+DUZ(2)))
 I SITEID'[(","_NMSPC_",") D  Q
 . S RESULT="0^Invalid Imaging Namespace"
 S IEN=$P(+$P(FNAM,NMSPC,2),".") ;NON-CONSOLIDATED VERS.
 ;S IEN=$O(^MAG(2005,"F",$P(FNAM,"."),"")) ;CONSOLIDATED VERS.
 I IEN'?1N.N!('$D(^MAG(2005,IEN,0))) D  Q
 . S RESULT="0^No matching 2005 entry"
 S EXT=$P(FNAM,".",2)
 I $P($G(^MAG(2005,IEN,0)),U,2)[FNAM S RESULT=IEN_U_"FULL"
 E  D
 . S FTYPE=$$FTYPE^MAGQBPRG(EXT)
 . I FTYPE="FULL" D  Q
 . . D FTYPE^MAGQBUT(.ALT)
 . . S J=""
 . . F  S J=$O(ALT(J)) Q:J'?1N.N  S:ALT(J)[EXT FTYPE="ALT"
 . . I FTYPE["ALT" S RESULT=IEN_U_FTYPE
 . . E  S RESULT="0^Invalid File Extension"
 . E  S RESULT=IEN_U_FTYPE
 Q
 ;
