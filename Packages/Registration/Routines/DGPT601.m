DGPT601 ;ALB/MTC - Process 601 transmission ; 17 NOV 92
 ;;5.3;Registration;**64,164**;Aug 13, 1993
 ;
 ;
EN ; Process 601 transmission
 N ERROR
 K DGPTPAR
 S DGPTSTR=^TMP("AEDIT",$J,NODE,SEQ),DGPTEDFL=0,DGPTERP=7
 S:$E(DGPTSTR,37,40)="2400" DGPTSTR=$E(DGPTSTR,1,36)_"2359"_$E(DGPTSTR,41,125)
SET ;
 S DGPTPSC=$E(DGPTSTR,41,42),DGPTPDY=$E(DGPTSTR,43),DGPTPNT=$E(DGPTSTR,44,46),DGPTPC1=$E(DGPTSTR,47,53),DGPTPC2=$E(DGPTSTR,54,60),DGPTPC3=$E(DGPTSTR,61,67),DGPTPC4=$E(DGPTSTR,68,74),DGPTPC5=$E(DGPTSTR,75,81)
 S DGPTPDT=$E(DGPTSTR,31,40)
DATE ;
 S (X,DGPTPDTS)=$$FMDT^DGPT101($E(DGPTPDT,1,6))_"."_$E(DGPTPDT,7,10),%DT="XT" D ^%DT I Y<0 S DGPTERC=601 D ERR G:DGPTEDFL EXIT G TSPEC
 D DD^%DT S DGPTPDT=$E(Y,5,6)_"-"_$E(Y,1,3)_"-"_$E(Y,9,12)_" "_$S($P(Y,"@",2)]"":$E($P(Y,"@",2),1,5),1:"00:00")
 I DGPTPDT'?1.2N1"-"3U1"-"4N1" "2N1":"2N S DGPTERC=601 D ERR G:DGPTEDFL EXIT
 S X1=DGPTDDS,X2=DGPTPDTS D ^%DTC I (X<0)!(%Y<0) S DGPTERC=640 D ERR G:DGPTEDFL EXIT
 S X1=DGPTPDTS,X2=DGPTDTS D ^%DTC I (X<0)!(%Y<0) S DGPTERC=637 D ERR G:DGPTEDFL EXIT
 ;
TSPEC ;
 I DGPTPSC'?2N S DGPTERC=602 D ERR G:DGPTEDFL EXIT
 S DGPTSP1=$E(DGPTPSC,1),DGPTSP2=$E(DGPTPSC,2),DGPTERC=0
 D CHECK^DGPTAE02 I DGPTERC S DGPTERC=602 D ERR G:DGPTEDFL EXIT G DIAL
 ;-- Active treating specialty edit check
 I $E(DGPTPSC,1)=0!($E(DGPTPSC,1)=" ") S DGPTPSC=$E(DGPTPSC,2)
 ;-- If not active treat spec, set 601 flag to print error msg during
 ;-- PTF close-out error display at WRER^DGPTAEE
 I '$$ACTIVE^DGACT(42.4,DGPTPSC,DGPTPDTS) S DGPTERC=602,DGPTSER(DGPTPDTS_601)=1 D ERR G:DGPTEDFL EXIT
DIAL ;
 I DGPTPDY'=" " D DIALE I DGPTERC G EXIT
OPS ;
 S DGPTERC=0 D ^DGPT60PR G:DGPTEDFL EXIT
 ;
OPDUP ;--check for duplicate procedure codes
 I ((DGPTPDY=" ")&(DGPTPNT="   "))&(+$E(DGPTSTR,47,81)=0) S DGPTERC="605Z" D ERR G EXIT
 F DGPTL4=1:1:5 I +@("DGPTPC"_DGPTL4)'=0 S DGPTPAR(+@("DGPTPC"_DGPTL4),DGPTL4)=""
 S DGPTPAR1=0 F DGPTL4=1:1:5 S DGPTPAR1=$O(DGPTPAR(DGPTPAR1)) Q:DGPTPAR1=""  S DGPTPRA2=$O(DGPTPAR(DGPTPAR1,0)) I DGPTPRA2'="" S DGPTPRA3=$O(DGPTPAR(DGPTPAR1,DGPTPRA2)) I DGPTPRA3'="" S DGPTERC=657 D ERR G:DGPTEDFL EXIT
 K DGPTPAR
GOOD ;
 W:'$D(ERROR) "."
 ;
EXIT ;
 K DGPTERC,DGPTL3,DGPTL4,DGPTOP,DGPTOP1,DGPTP1,DGPTP2,DGPTPAR1,DGPTPC1,DGPTPC2,DGPTPC3,DGPTPC4,DGPTPC5,DGPTPDT,DGPTPDTS,DGPTPDY,DGPTPFL,DGPTPNT,DGPTPP,DGPTPRA2,DGPTPRA3,DGPTPSC,DGPTSTR,X,X1,X2,Y
 K DGPTXX
 Q
ERR ;
 D WRTERR^DGPTAE(DGPTERC,NODE,SEQ)
 S ERROR=1
 Q
DIALE ;
 I "12345678"'[DGPTPDY S DGPTERC=603 D ERR G:DGPTEDFL EXIT
 I DGPTPNT="   "!(+DGPTPNT'>0) S DGPTERC=604 D ERR G:DGPTEDFL EXIT
 Q
 ;
