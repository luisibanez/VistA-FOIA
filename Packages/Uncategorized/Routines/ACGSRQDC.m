ACGSRQDC ;IHS/OIRM/DSD/THL,AEF - CHECK REQUIRED FIELDS FOR DATA; [ 03/27/2000   2:22 PM ]
 ;;2.0t1;CONTRACT INFORMATION SYSTEM;;FEB 16, 2000
 ;;CHECK TO ENSURE THAT ALL REQUIRED FIELDS OF DATA ARE ENTERED
EN D EN1
EXIT K ACG,ACGC,ACGCNT,ACGX,ACGRDA,ACGO,ACG1,^TMP("ACGC",$J),ACGQUIT,ACG2,ACG5,ACGF,ACGCNTX
 Q
EN1 K ACGQUIT,^TMP("ACGC")
 W !!,"The following procedure will check all contract actions for missing data.",!,"This could take several minutes."
 S DIR(0)="YO",DIR("A")="Sure you want to continue",DIR("B")="NO"
 D DIR^ACGSDIC
 Q:Y'=1
 D CHK^ACGSRQD1
 Q
CHK ;EP
 I '$D(ZTQUEUED) W !,"DATA INTEGRITY CHECK IN PROGRESS.  DO NOT INTERRUPT."
 S (ACGO,ACGCNT)=0
 F  S ACGO=$O(^ACGS("C",ACGO)) Q:'ACGO  D:$P(^ACGS(ACGO,"IHS"),U,22)=1
 .S ACGRDA=0
 .F  S ACGRDA=$O(^ACGS("C",ACGO,ACGRDA)) Q:'ACGRDA  I $D(^ACGS(ACGRDA,0)),$D(^("DT")),$D(^("DT1")),$D(^("DT2")) D
 ..I '$D(^ACGS(ACGRDA,0)) K ^ACGS("C",ACGO,ACGRDA) Q
 ..S ACG1=$S($P(^ACGS(ACGRDA,"DT"),U):$P(^ACGTPA($P(^ACGS(ACGRDA,"DT"),U),0),U),1:"D"),ACG5=$P(^ACGS(ACGRDA,"DT"),U,5),ACG2=$P(^("DT"),U,2)
 ..I ACG5'="",ACG2 D @ACG1
 I '$D(^TMP("ACGC",$J)) W !!,"DATA INTEGRITY CHECK PASSED WITHOUT ERRORS"
 Q
A ;EP
D ;EP
I ;EP
 F ACG=1,2,4,5,12,16,17,19,20,21 I $P(^ACGS(ACGRDA,"DT"),U,ACG)="" S ACGCNTX="",^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 F ACG=22,23,25,27,28,29,32 S ACGX=ACG-21 I $P(^ACGS(ACGRDA,"DT1"),U,ACGX)="" S ACGCNTX="",^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 F ACG=37,45,51,53 S ACGX=ACG-35 I $P(^ACGS(ACGRDA,"DT2"),U,ACGX)="" S:ACG'=37 ^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA I ACG=37,$P(^ACGS(ACGRDA,"DT1"),U,5)'="",$P(^("DT1"),U,5)'=0 S ^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 I $D(ACGCNTX) S ACGCNT=ACGCNT+1 K ACGCNTX
 Q
C ;EP
M ;EP
R ;EP
 F ACG=1,2,4,5,12,17,19,20 I $P(^ACGS(ACGRDA,"DT"),U,ACG)="" S ACGCNTX="",^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 F ACG=22,27,28 S ACGX=ACG-21 I $P(^ACGS(ACGRDA,"DT1"),U,ACGX)="" S ACGCNTX="",^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 F ACG=37,45,51,53 S ACGX=ACG-35 I $P(^ACGS(ACGRDA,"DT2"),U,ACGX)="" S:ACG'=37 ^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA I ACG=37,$P(^ACGS(ACGRDA,"DT1"),U,5)'="",$P(^("DT1"),U,5)'=0 S ^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 I $D(ACGCNTX) S ACGCNT=ACGCNT+1 K ACGCNTX
 Q
Q ;EP
 F ACG=1,2,4,5,12,17:1:19,20 I $P(^ACGS(ACGRDA,"DT"),U,ACG)="" S ACGCNTX="",^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 F ACG=22,27,28 S ACGX=ACG-21 I $P(^ACGS(ACGRDA,"DT1"),U,ACGX)="" S ACGCNTX="",^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 F ACG=45,51,53 S ACGX=ACG-35 S:$P(^ACGS(ACGRDA,"DT2"),U,ACGX)="" ^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 I $D(ACGCNTX) S ACGCNT=ACGCNT+1 K ACGCNTX
 Q
G ;EP
N ;EP
 F ACG=1,2,4,5,12,17,19,20 I $P(^ACGS(ACGRDA,"DT"),U,ACG)="" S ACGCNTX="",^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 F ACG=22,27,28 S ACGX=ACG-21 I $P(^ACGS(ACGRDA,"DT1"),U,ACGX)="" S ACGCNTX="",^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 F ACG=45,51,53 S ACGX=ACG-35 S:$P(^ACGS(ACGRDA,"DT2"),U,ACGX)="" ^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 I $D(ACGCNTX) S ACGCNT=ACGCNT+1 K ACGCNTX
 Q
B ;EP
 F ACG=1,2,4,5,12,13,17:1:20 I $P(^ACGS(ACGRDA,"DT"),U,ACG)="" S ACGCNTX="",^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 F ACG=30 S ACGX=ACG-21 S:$P(^ACGS(ACGRDA,"DT1"),U,ACGX)="" ^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 I $D(ACGCNTX) S ACGCNT=ACGCNT+1 K ACGCNTX
 Q
O ;EP
 F ACG=1,2,4,5,12,17,19,20 I P(^ACGS(ACGRDA,"DT"),U,ACG)="" S ACGCNTX="",^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 F ACG=22,27,28 S ACGX=ACG-21 I $P(^ACGS(ACGRDA,"DT1"),U,ACGX)="" S ACGCNTX="",^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 I $D(ACGCNTX) S ACGCNT=ACGCNT+1 K ACGCNTX
 Q
P ;EP
 F ACG=1,2,4,5,12,13,15:1:19 I $P(^ACGS(ACGRDA,"DT"),U,ACG)="" S ACGCNTX="",^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 F ACG=22,27:1:31 S ACGX=ACG-21 I $P(^ACGS(ACGRDA,"DT1"),U,ACGX)="" S ACGCNTX="",^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 F ACG=45,51,53 S ACGX=ACG-35 S:$P(^ACGS(ACGRDA,"DT2"),U,ACGX)="" ^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 I $D(ACGCNTX) S ACGCNT=ACGCNT+1 K ACGCNTX
 Q
T ;EP
U ;EP
 F ACG=1,2,4,5,12,13,17,19,20 I $P(^ACGS(ACGRDA,"DT"),U,ACG)="" S ACGCNTX="",^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 F ACG=45,51,53 S ACGX=ACG-35 S:$P(^ACGS(ACGRDA,"DT2"),U,ACGX)="" ^TMP("ACGC",$J,ACG2,ACG5,ACG)=ACGRDA
 I $D(ACGCNTX) S ACGCNT=ACGCNT+1 K ACGCNTX
 Q
DIR D ^DIR S:$D(DIRUT) ACGQUIT="" K DIR,DIRUT,DUOUT,DTOUT Q
 ;
