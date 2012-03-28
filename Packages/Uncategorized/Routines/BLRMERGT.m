BLRMERGT ; IHS/ISD/EDE - MANUAL PROCESS MERGE BLRMERG  [ 12/21/1998  3:56 PM ]
 ;;5.2;BLR;**1005**;DEC 14, 1998
 ;
 ; ****** save the following, then restore for next test *****
 ; Save gbls DPT, AUPN*, LR, LRO(68, LRO(69, LRO(69.2
 ;
START ;
 S DIC=2,DIC(0)="AQEM",DIC("A")="Select Patient to be PURGED:  " D ^DIC Q:+Y<1  S BLRP1=+Y
 I '$D(^DPT(+Y,"LR")) W !,"This patient has no lab data to purge.  ",!! G START
 S DIC=2,DIC(0)="AQEM",DIC("A")="Select Patient to RECEIVE lab data:  " D ^DIC Q:+Y<1  S BLRP2=+Y
OK W !,"Is everything OK" S %=2 D YN^DICN Q:%<0  W:%=0 !,"Answer NO if you are unsure, or '^' to quit.",! G:%=0 OK
 I %=2 G START
 W !!,"This will take about one minute..."
 S XDRMRG("FR")=BLRP1,XDRMRG("TO")=BLRP2
 K ^TMP("XDRMRGFR",$J)
 K ^TMP("XDRMRGTO",$J)
 S ^TMP("XDRMRGFR",$J,XDRMRG("FR"),"LR")=^DPT(BLRP1,"LR")
 S:$D(^DPT(P2,"LR")) ^TMP("XDRMRGTO",$J,XDRMRG("TO"),"LR")=^DPT(BLRP2,"LR")
 D ^BLRMERG
 W !!,"Done..." H 2
 Q
TEST ;
 D SETDPT
 S XDRMRG("FR")=222
 S XDRMRG("TO")=333
 S ^TMP("XDRMRGFR",$J,XDRMRG("FR"),"LR")=^DPT(222,"LR")
 S ^TMP("XDRMRGTO",$J,XDRMRG("TO"),"LR")=^DPT(333,"LR")
 D ^BLRMERG
 Q
 ;
SETDPT ; SET ^DPT "LR" NODES
 S ^DPT(222,"LR")=8
 ;S ^DPT(222,"LR")=10
 S ^DPT(333,"LR")=9
 Q
