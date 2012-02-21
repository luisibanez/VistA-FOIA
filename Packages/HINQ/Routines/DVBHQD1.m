DVBHQD1 ;ISC-ALBANY/PKE/PHH- HINQ receiver ; 3/23/06 7:52am
 ;;4.0;HINQ;**3,12,16,22,23,32,34,40,46,49,57**; 03/25/92 
 ;
 S:'$D(DTIME) DTIME=300 S DVBTIME=DTIME
EN S:$G(IO(0))="" IO(0)=$I S (C,DVBTSK,DVBABORT)=0,DVBXM=1,DTIME=30 U IO(0)
 ;
SEL S (DVBRTC,DVBTRY)=1,DVBNRT="Y"
 R !!," Select Input: (P)atient File, or (D)irect  P//",X:DTIME I '$T!(X["^") G HINQ
 I "Pp"[$E(X) S DVBPRGM="TM^DVBHIQD" G ASK
 I "Dd"[$E(X_1) S DVBPRGM="EN^DVBHQDE" G ASK
 I X["?" D HP^DVBHQAT G SEL
 G SEL
ASK S:$G(IO(0))="" IO(0)=$I W ! S Y=0,DVBIO=IO D @DVBPRGM
ASK1 I Y'<0,$D(DVBP),$L(DVBP)=4 S IO=DVBIO D STUFF^DVBHQAT:$D(DFN),MES
 I $D(DVBMISS) K DVBMISS D:DVBTRY>3 RETRY^DVBHQD2 G:DVBNRT="N" LOAD2^DVBHQD2 I DVBTRY<4&(DVBRTC<4) S DVBTRY=DVBTRY+1 U IO(0) W ?35,"Retrying Request." G ASK1
 S IO=DVBIO U IO(0) K DVBP S DVBABORT=0
 I '$D(Y) G ASK
 I Y>0 G ASK
 ;
HINQ U IO(0) W !!,"Do you wish to continue" S %=2 D YN^DICN G:'% HINQ I %=1 W ! G EN
EX S DTIME=$S($D(DVBTIME):DVBTIME,1:300)
 Q
MES ;
 S:$G(IO(0))="" IO(0)=$I S E=$L(DVBZ) I '$D(DVBDXX),($E(DVBZ,E-7,E-4)'=DVBNUM) S DVBZ=$E(DVBZ,1,E-4)_DVBNUM_$E(DVBZ,E-3,999)
 K E H 1 S DVBEND="NNNN" S:'$D(DVBXM) DVBXM=0 S:'$D(C) C=0
 ;
TOTIMS S TRY=0,CN=$F(DVBZ,"/CN",24),DVBZ0=DVBZ
 I $S('$D(DFN):1,DFN:0,1:1) S CN=0 D SEND^DVBHQD2,KTO^DVBHQD2 Q
 I 'CN D CNLKUP^DVBHQAT
 DO  D SEND^DVBHQD2 I TRY DO  I TRY H 1 D SEND^DVBHQD2
 .I CN,'TRY S DVBZ0=$E(DVBZ,1,23)_$E(DVBZ,24,CN-3)_$E(DVBZ,CN+9,999) Q
 .I CN,TRY S DVBZ1=$E(DVBZ,1,23)_$E(DVBZ,CN-2,999) Q
 .I 'CN S DVBZ0=DVBZ,TRY=0 Q
 I $D(DVBMISS)&($D(DVBPRGM)) I (DVBPRGM["TM") K DVBMISS D:DVBTRY>3 RETRY^DVBHQD2 G:DVBNRT="N" LOAD^DVBHQD2 I DVBTRY<4&(DVBRTC<4) S DVBTRY=DVBTRY+1 U IO(0) W ?35,"Retrying Request." G MES
 G KTO^DVBHQD2
 ;
 ;z1 is first x(),z9 is last x()
OK ;I 'DVBTSK DO
 ;. U IO(0) W !!?3 S Z1=0 F  S Z1=$O(X(Z1)) Q:'Z1  S LX=$G(LX)+$L(X(Z1)) W Z1," ",$L(X(Z1)),"   "
 ;. W !?9,LX,! K LX H 3 U IO
 S:$G(IO(0))="" IO(0)=$I S Z1=$O(X(0)) F  Q:$E(X(Z1))'=$C(10)  S X(Z1)=$E(X(Z1),2,999)
 I $G(X(Z1))["HINQ" S X(Z1)="HINQ"_$P(X(Z1),"HINQ",2)
 E  K X(Z1) DO
 . S Z1=$O(X(0)) I Z1="" S Z1=0,X(0)=""
 . I $G(X(Z1))["HINQ" S X(Z1)="HINQ"_$P(X(Z1),"HINQ",2)
 I $L(X(Z1))>25 S DVBLEN=+$E(X(Z1),22,25)
 I $L(X(Z1))'>25 D
 . I $D(X(Z1+1)) DO
 . . S DVBLEN=+$E($E(X(Z1),1,99)_$E(X(Z1+1),1,30),22,25)
 . I '$D(X(Z1+1)) D
 . . S DVBLEN=$L(X(Z1)) ;DVB*4*49 - error response may be < 25 chars
 I '$D(DVBLEN) S DVBABORT=DVBABORT+1 U IO(0) W:'DVBTSK !,"Missing string" U IO Q
 ;
 I $D(F3) S DVBLEN=DVBLEN-F3 K F3
 I "456789ABCDUVWNMXYZ"'[$E(X(Z1),5) S DVBLEN=DVBLEN-2
 ;
 S (Z,Z9,F2)=0 F  S Z=$O(X(Z)) Q:'Z  S Z9=Z,F2=F2+$L(X(Z))
 ;
 I DVBLEN'=F2,X(Z9)[$C(10) S DVBABORT=DVBABORT+1 U IO(0) W:'DVBTSK !,"Missing character" S DVBMISS="" Q
 I $E(X(Z1),5)'=2 S F2=F2+1
 ;
 I DVBLEN'=F2-1,X(Z9)'[$C(10),$S('$D(X(Z9-1)):1,1:$S(X(Z9-1)'[$C(10):1,1:0)) S DVBABORT=DVBABORT+1 U IO(0) W:'DVBTSK !,"Missing character" S DVBMISS="" Q
 ;trim,e will pack back to x(1)
 I Z9 S:$D(X) DVBSOX=X D TRIM,E^DVBHQAT S:$D(DVBSOX) X=DVBSOX K DVBSOX I $E(X(1),1,4)["HINQ","AXY69"'[$E($E(X(1),5)_1) D ALLM Q
 ;
 S DVBABORT=DVBABORT+1 Q:$E(X(1),1,4)'="HINQ"
 I $E(X(1),5)="A" U IO(0) W:'DVBTSK !,"VBA File not Available" U IO H 2 D ALL QUIT
 ;
 I DVBTSK,"69XY"[$E($E(X(1),5)_1) S DVBBADP="" D ALL QUIT
 I 'Z9 Q
 ;
ALL I 'DVBXM,$D(DFN),+DFN K:C ^TMP("DVBHINQ",$J,DFN) S Z=0 F  S Z=$O(X(Z)) Q:'Z  S ^TMP("DVBHINQ",$J,DFN,Z)=X(Z)
 E  I DVBXM D RS,RECMAL^DVBHQD2,A^DVBHIQR,IALERT^DVBHT2,EN^DVBHIQM H 1 D WRT K DVBTX Q
 I DVBABORT=3!($D(DVBBADP)) S DFN=0
 Q
 ; do all if no error or retrying
ALLM I "BC"'[$E($E(X(1),5)_1) D ALL Q
 I CN,'TRY S TRY=1 D:DVBXM DCN Q
 I 'CN D ALL Q
 S X(1)=X(1)_"[TRY]1" D ALL Q
 ;
DCN S:$G(IO(0))="" IO(0)=$I U IO(0) W !,"..Name, SSN didn't work ....retrying using Claim Number",! U IO Q
 ;
RS Q:'$D(DFN)  Q:'DFN  Q:'$D(^DVB(395.5,DFN,0))  S DVBDFN=DFN,DVBCS=0
 F DVBSZ=0:0 S DVBSZ=$O(X(DVBSZ)) D SC^DVBHQST Q:'DVBSZ  D ST^DVBHQDB
 K DVBSZ,DVBDFN Q
 ;
TRIM Q:F1=999
 I '$D(F1) S F1=$F(X(Z9),DVBEND)
 I $E(X(Z9),F1-F4)=$C(10) S F1=F1-1
 S X(Z9)=$E(X(Z9),1,F1-F4)
 K F1 Q
 ;
WRT S:$G(IO(0))="" IO(0)=$I S DVBJIO=IO(0)
WRT1 S:$G(DVBJIO)="" DVBJIO=$I S:'$D(DVBIOSL) DVBIOSL=IOSL S:'$D(DVBIOST) DVBIOST=IOST S:'$D(DVBIOF) DVBIOF=IOF
 S X="" U DVBJIO W !!! D CODE^DVBHQUS W !! S Y0=$Y F Z=0:0 S Z=$O(^TMP($J,Z)) Q:'Z  I $D(^(Z,0)) W ^(0),! D:$Y-Y0>(DVBIOSL-4) SROLL^DVBHQD2 Q:X="^"  D:$Y<Y0 ABS^DVBHQD2
 Q:X="^"  K DVBJIO D SROLL^DVBHQD2 Q
 ;
CH S F1=0
 I X(W)=$C(10)_"NNNN" K X(W) S F1=999 Q
 I $L(X(W))>4!($L(X(W))<1) Q
 F A=$L(X(W)):-1:1 Q:$E(X(W),A)'="N"
 I A=1,$E(X(W),A)="N" S F1=$L(X(W-1))+1,F3=$L(X(W)),F4=5-$L(X(W)) K X(W)
 Q
