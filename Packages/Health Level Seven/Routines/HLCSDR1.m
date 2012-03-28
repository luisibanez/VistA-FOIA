HLCSDR1 ;ALB/RJS - HYBRID LOWER LAYER PROTOCOL 2.2 - 9/13/94 ;08/22/2001  10:16 [ 04/02/2003   8:37 AM ]
 ;;1.6;HEALTH LEVEL SEVEN;**1004**;APR 1, 2003
 ;;1.6;HEALTH LEVEL SEVEN;**2,22,27,30,34,62**;Oct 13, 1995
 ;THIS ROUTINE CONTAINS IHS MODIFICATIONS BY IHS/TUC/DLR 3/31/97
 ;
 ;This is an implemetation of the HL7 Hybrid Low Layer Protocol
 ;
START(HLDP,HLRETPRM,HLDREAD,HLDWRITE,HLDSTRT,HLDEND,HLDVER,HLDBSIZE) ;
 N HLIND0,HLIND1,HLTRANS,HLCHK,HLACKBLK,HLDOUT0,HLDOUT1,X,HLRETRY
 N HLNXST,HLLINE,HLNAK,HLTVV,HLWFLG,HLC1,HLC2
 ;S X=10 X ^%ZOSF("PRIORITY")
 ; above line commented-out patch 27, sys mgr will set as needed
 S HLWFLG=1
 ;
1 ; Look to see if there is anything to read in
 I $D(HLTRACE) S HLNXST=1 D TRACE^HLCSDR2
 D:$P(^HLCS(870,HLDP,0),U,5)'="IDLE" MONITOR^HLCSDR2("IDLE",5,HLDP)
 S X=$$READ^HLCSUTL(HLDREAD,HLDBSIZE,.HLTRANS) D TRANS^HLCSDR2(X,.HLTRANS),INITIZE^HLCSDR2
 I HLTRANS="VT" G TVV
 I HLTRANS'="TIMEOUT" G 1
 ;----- BEGIN IHS MODIFICATION
 ;IHS/TUC/DLR 3/31/97 - halt on timeout
 ;LINE IS COMMENTED OUT AND REPLACED BY NEW LINE
 ;I 'HLWFLG D PUSH^HLCSQUE(HLDOUT0,HLDOUT1),MONITOR^HLCSDR2("P",2,HLDOUT0,HLDOUT1,"OUT"),MONITOR^HLCSDR2("TIMEOUT",5,HLDP)
 I 'HLWFLG D PUSH^HLCSQUE(HLDOUT0,HLDOUT1),MONITOR^HLCSDR2("P",2,HLDOUT0,HLDOUT1,"OUT"),MONITOR^HLCSDR2("TIMEOUT",5,HLDP) Q
 ;----- END IHS MODIFICATION
 G 14
 ;
TVV ;Read in tvv
 ;----- BEGIN IHS MODIFICATION
 ;IHS/TUC/DLR 3/31/07 - reset wait flag
 ;NEW LINE ADDED
 S HLWFLG=1
 ;----- END IHS MODIFICATION
 I $D(HLTRACE) S HLNXST="TVV" D TRACE^HLCSDR2
 D MONITOR^HLCSDR2("READING",5,HLDP)
 S X=$$READ^HLCSUTL(HLDREAD,HLDBSIZE,.HLTRANS) D TRANS^HLCSDR2(X,.HLTRANS)
 I $L(X)'=3!(HLTRANS'="CR") G 1
 S HLNAK=$E(X),HLTVV=X,X=$C(HLDSTRT)_X_$C(13) D CHKSUM^HLCSDR2
 I HLNAK="D" D  G:HLIND0'<0 2 D MONITOR^HLCSDR2(100,19,HLDP) G EXIT
 . S HLIND0=$$ENQUEUE^HLCSQUE(HLDP,"IN"),HLIND1=$P(HLIND0,U,2),HLIND0=+HLIND0
 . D MONITOR^HLCSDR2(HLTVV,4,HLDP,HLIND1,"IN")
 I HLNAK="N" S X=HLTVV K ^TMP("HLCSDR1",$J,HLDP) D SETNODE2^HLCSDR2 G 9
 S HLTRANS="G" D MONITOR^HLCSDR2(105,19,HLDP) G 5
 ;
2 ; Read in message
 I $D(HLTRACE) S HLNXST=2 D TRACE^HLCSDR2
 D MONITOR^HLCSDR2("READING",5,HLDP)
 S X=$$READ^HLCSUTL(HLDREAD,HLDBSIZE,.HLTRANS) D TRANS^HLCSDR2(X,.HLTRANS)
 I HLTRANS="CR" D SETNODE^HLCSDR2(HLIND0,HLIND1,HLTRANS) S X=X_$C(13) D CHKSUM^HLCSDR2 G 2
 I HLTRANS="LONGLINE" D SETNODE^HLCSDR2(HLIND0,HLIND1,HLTRANS),CHKSUM^HLCSDR2 G 2
 I HLTRANS="TIMEOUT" S HLTRANS="G" D MONITOR^HLCSDR2(106,19,HLDP) G 5
 I HLTRANS="FS" G 3
 G 2
 ;
3 ; Check for Validity of data
 I $D(HLTRACE) S HLNXST=3 D TRACE^HLCSDR2
 D MONITOR^HLCSDR2("VALIDATE",5,HLDP)
 S HLCHK=$E(X,$L(X)-7,$L(X)),X=$E(X,1,$L(X)-8)
 S HLTRANS=$$VALID1^HLCSDR2("INCOMING MESSAGE",HLCHK,HLIND0,HLIND1)
 I HLTRANS="VALID" G 4
 D MONITOR^HLCSDR2(107,19,HLDP) G 5
 ;
4 ; Valid message.
 I $D(HLTRACE) S HLNXST=4 D TRACE^HLCSDR2
 D MONITOR^HLCSDR2("DONE",5,HLDP),MONITOR^HLCSDR2("A",3,HLDP,HLIND1,"IN"),MONITOR^HLCSDR2("P",2,HLDP,HLIND1,"IN")
 D INITIZE^HLCSDR2 G 6
 ;
5 ; Send NAK When This State is Reached
 I $D(HLTRACE) S HLNXST=5 D TRACE^HLCSDR2
 D MONITOR^HLCSDR2("NAK",5,HLDP),MONITOR^HLCSDR2(HLTRANS,3,HLDP,HLIND1,"IN"),MONITOR^HLCSDR2("P",2,HLDP,HLIND1,"IN")
 D NAK^HLCSDR2(HLTRANS)
 D INITIZE^HLCSDR2 G 1
 ;
6 ;Check "OUT" queue
 I $D(HLTRACE) S HLNXST=6 D TRACE^HLCSDR2
 S HLDOUT0=$$DEQUEUE^HLCSQUE(HLDP,"OUT")
 I +HLDOUT0<0 G 1
 S HLDOUT1=$P(HLDOUT0,U,2),HLDOUT0=+HLDOUT0,HLRETRY=-1 G 7
 ;
7 ; Send Data to other Application
 I HLRETRY=HLRETPRM D MONITOR^HLCSDR2(103,19,HLDP),MONITOR^HLCSDR2("G",3,HLDP,HLDOUT1,"OUT"),MONITOR^HLCSDR2("D",2,HLDP,HLDOUT1,"OUT") G 14
 I $D(HLTRACE) S HLNXST=7 D TRACE^HLCSDR2
 D MONITOR^HLCSDR2("WRITING",5,HLDP)
 D WRITE^HLCSDR2(HLDOUT0,HLDOUT1)
 ; set message status to 'done'
 D MONITOR^HLCSDR2("D",2,HLDP,HLDOUT1,"OUT") G 1
 ;
9 ; Read in Neg Acknowledgement message
 I $D(HLTRACE) S HLNXST=9 D TRACE^HLCSDR2
 S X=$$READ^HLCSUTL(HLDWRITE,HLDBSIZE,.HLTRANS) D TRANS^HLCSDR2(X,.HLTRANS),MONITOR^HLCSDR2("READ ACK",5,HLDP)
 I HLTRANS="CR" D SETNODE2^HLCSDR2 S X=X_$C(13) D CHKSUM^HLCSDR2 G 9
 I HLTRANS="FS" G 10
 I HLTRANS="LONGLINE" D SETNODE2^HLCSDR2,CHKSUM^HLCSDR2
 S HLRETRY=HLRETRY+1 D MONITOR^HLCSDR2("P",2,HLDP,HLDOUT1,"OUT") G 7
 ;
10 ; Check Validity of Neg Acknowledgement
 I $D(HLTRACE) S HLNXST=10 D TRACE^HLCSDR2
 D MONITOR^HLCSDR2("VALIDATE NACK",5,HLDP)
 S HLCHK=$E(X,$L(X)-7,$L(X)),X=$E(X,1,$L(X)-8)
 S HLTRANS=$$VALID1^HLCSDR2("LLP-NACK",HLCHK)
 I HLTRANS="VALID" G 12
 S HLRETRY=HLRETRY+1 D MONITOR^HLCSDR2("P",2,HLDP,HLDOUT1,"OUT") G 7
 ;
12 ; Process Negative Acknowlegement
 I $D(HLTRACE) S HLNXST=12 D TRACE^HLCSDR2
 S HLACKBLK=$E(^TMP("HLCSDR1",$J,HLDP,2))
 D MONITOR^HLCSDR2($S("^B^C^X^"[(U_HLACKBLK_U):HLACKBLK,1:"G"),3,HLDP,HLDOUT1,"OUT")
 S HLRETRY=HLRETRY+1 D MONITOR^HLCSDR2("P",2,HLDP,HLDOUT1,"OUT") G 7
 ;
14 ; Make sure we should still be running
 I $D(HLTRACE) S HLNXST=14 D TRACE^HLCSDR2
 I $P($G(^HLCS(870,HLDP,0)),U,15)=1 G EXIT ; Shutdown receiver
 I $D(HLTRACE) U IO(0) W !,"Type Q to Quit: " R X:1 I "^Q^q^"[(U_X_U) S $P(^HLCS(870,HLDP,0),U,15)=1 G EXIT ; Shutdown receiver
 G 6
 ;
EXIT ;
 D MONITOR^HLCSDR2("SHUTDOWN",5,HLDP)
 Q
