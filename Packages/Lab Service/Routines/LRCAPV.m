LRCAPV ;DALOI/FHS - DETERMINE WKLD CODE AND STUFF INTO 68 ;2/19/91  11:45
 ;;5.2T9;LR;**1018**;Nov 17, 2004
 ;;5.2;LAB SERVICE;**232**;Sep 27, 1994
EN ;from LRVER4,LRVR4,LRMIEDZ,LRMIV,LROE,LRVER
 K LRCSQ,LRCSQQ S LREND=0 Q:'$P(LRPARAM,U,14)!('$D(LRAA))  Q:'$P($G(^LRO(68,+LRAA,0)),U,16)  S LRCSQQ=+$P(^(0),U,20)
 I $D(LRCDEF),$D(LRCDEF0) W !!?7,"Currently you are using ( ",$P(LRCDEF0,U)_" )  Suffix ["_$P(LRCDEF0,U,2)_"]"
 W !! K DIC S:$G(LRLL) DIC("B")=$S($G(^LRO(68.2,+LRLL,"SUF")):$P(^(0),U),1:"")
 S LREND=0,DIC="^LRO(68.2,",DIC(0)="AQEM",DIC("A")="Work Load Area: ",DIC("S")="I $D(^(""SUF"")),+^(""SUF"")" D ^DIC S:Y<1 LREND=1 K DIC
EN1 Q:$G(LREND)
 N LRSUFIEN,I
 S LRSUF0=^LRO(68.2,+Y,"SUF") D
 . S LRSUFIEN=$O(^LAB(64.2,"C",$P(LRSUF0,U,3)_" ",0))
 . Q:'LRSUFIEN  S $P(LRUSUFO,U)=LRSUFIEN
 S LRCDEF0=$S($D(^LAB(64.2,+LRSUF0,0)):$P(^(0),U,1,18),1:0) S:LRCDEF0=0 LREND=1 G:$G(LREND) STOP S LRCDEF0(1)=$P(^(0),U,19),LRCDEF=$P($P(LRCDEF0,U,2),".",2)
 S I=0 F  S I=$O(^LRO(68.2,+Y,4,I)) Q:I<.5  S LRCDEF(I)=""
 I '$P(LRSUF0,U,7) S $P(LRSUF0,U,7)=+LRAA,LRLD=$S($L($P($G(^LRO(68,LRAA,0)),U,19)):$P($G(^LRO(68,LRAA,0)),U,19),1:"CP"),LRCSQQ=+$P(^(0),U,20) K DIC
 S:'$P(LRSUF0,U,8) $P(LRSUFO,U,8)=+LRAA
 S LRCAPMS=$P(LRSUF0,U,7)_U_$S($P(LRSUF0,U,8):$P(LRSUF0,U,8),1:$P(LRSUF0,U,7)),LRCAPWA=$S($P(LRSUF0,U,9):$P(LRSUF0,U,9),1:$P(LRSUF0,U,8)),LRCAPMS=LRCAPMS_U_LRCAPWA
 I $G(LRCSQQ) S LRCSQ=$H,^XTMP("LRCAP",LRCSQ,DUZ)=""
 Q
AUTO ;from  LRVR
 Q:'$P(LRPARAM,U,14)!('$P($G(^LRO(68,+LRAA,0)),U,16))  S LRX=$G(^LRO(68,LRAA,0)),LRLD=$S($L($P(LRX,U,19)):$P(LRX,U,19),1:"CP") K LRX
 I $D(^LRO(68.2,LRLL,"SUF")),+^("SUF") S LRCDEF0=^("SUF"),LRP=+LRCDEF0,LRCDEF0=$S($D(^LAB(64.2,LRP,0)):^(0),1:0) I LRCDEF0 S LRCDEF=$P(LRCDEF0,U,2),LRCDEF0(1)=$P(^(0),U,19)
 G EN
 Q
STD ;from LRVER,LRVER4,LRVR,LRVR4,LRVRW,LAMIAUTO,LRMIEDZ
 I $G(LRCSQ),'$O(^XTMP("LRCAP",LRCSQ,DUZ,0)) K ^XTMP("LRCAP",LRCSQ) G STDQ
 G:'$G(LRCSQ) STDQ
 S LRCSQQ=+$P($G(^LRO(68,+$G(LRAA),0)),U,20) I 'LRCSQQ,$G(LRCSQ) K ^XTMP("LRCAP",LRCSQ) G STDQ
 I '$P($G(LRPARAM),U,14) K:$G(LRCSQ) ^XTMP("LRCAP",LRCSQ) G STDQ
 W !!?10,"Wish to enter STD/QC/REPS " S %=2 D YN^DICN G:%=0 STD I %'=1 G STDQ
 S (LRREP,LRQC,LRSTD)=0
ST R !!?10,"Number of standards this run ",LRSTD:DTIME G:'$T!(LRSTD="^") SQR G:$G(LRSTD)="^QC" @("QC") G:$G(LRSTD)="^REP" @("REP") I $G(LRSTD)'=0,$G(LRSTD)'="",'+$G(LRSTD) D MSG G ST
QC R !!?10,"Number of QC this Run ",LRQC:DTIME G:'$T!($G(LRQC)="^") SQR G:$G(LRQC)="^STD" @("ST") G:$G(LRQC)="^REP" @("REP") I $G(LRQC)'=0,$G(LRQC)'="",'+$G(LRQC) D MSG G QC
REP R !!,?10,"Number of Repeats ",LRREP:DTIME G:'$T!($G(LRREP)="^") SQR G:$G(LRREP)="^QC" @("QC") G:$G(LRREP)="^STD" @("ST") I LRREP'=0,LRREP'="",'+LRREP D MSG G REP
SQR K LRTAGE,LRSUF0 I 'LRSTD&('LRQC)&('LRREP) G STDQ
 S LRDUZ=DUZ,ZTSAVE("LRDUZ")="",ZTSAVE("LRSTD")="",ZTSAVE("LRQC")="",ZTSAVE("DT")="",ZTSAVE("LRREP")="",ZTSAVE("LRCSQ")="",ZTSAVE("U")="",^XTMP("LRCAP",LRCSQ,DUZ)=LRSTD_"STD^"_LRQC_"QC^"_LRREP_"REPS^"
 S ZTRTN="QC^LRCAPPH",ZTIO="",ZTDTH=$H,ZTDESC="TALLY LAB QC/STD/REPS " D ^%ZTLOAD
SQR1 S ZTRTN="LRCAPV2",ZTDTH=$H,ZTDESC="LAB WORKLOAD PROGRAM",ZTIO="" D ^%ZTLOAD
 K LRCSQ,LRCSQQ,LRSTD,LRQC,LRREP,LRDUZ
 Q
STDQ K:$D(LRCSQ) ^XTMP("LRCAP",LRCSQ,DUZ) K LRCSQ,LRCSQQ
ANN I $P($G(LRPARAM),U,14) S ZTIO="",ZTRTN="LRCAPV2",ZTDTH=$H,ZTDESC="LAB WORKLOAD PROGRAM" D ^%ZTLOAD
 K LRCSQ,LRCSQQ,LRSTD,LRQC,LRREP Q
CON ;
 N J
 S J=0 F  S J=$O(^LAB(60,+X,2,J)) Q:J<1  I $D(^(J,0)) S NODE=+^(0) I '$D(LRTEST(NODE)) S LRTEST(NODE)="",LRNT(LRNT)=NODE S:'$O(^LAB(60,NODE,2,0)) LRNT=LRNT+1
 Q
ENCON ;
 N I
 I '$O(^LAB(60,+X,2,0)) S LRNT=1 Q
 K LRTEST,LRNT S LRNT=0 D CON S I=0 F  S I=$O(LRNT(I)) Q:I=""  S X=LRNT(I) D CON
 Q
MSG W !!?10,"Enter a Number - Press Return or '^' to Stop " Q
STOP ;
 S LREND=1 K LRCDEF,LRCDEF0,DIC,LRSUF0,LRCDEF,LRCDEF0X,LRLD,LRCAPMS,LRCAPWA,LRCSQ
 Q
