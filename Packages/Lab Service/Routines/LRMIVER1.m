LRMIVER1 ;SLC/CJS/BA- MICRO CHART COPY APPROVAL CONT. ;2/19/91  11:01 ;
 ;;5.2;LAB SERVICE;**1030**;NOV 01, 1997
 ;;5.2;LAB SERVICE;**295**;Sep 27, 1994;Build 5
 ;from LRMIVER
APPROVE I '$O(^LRO(68,"AVS",LRAA,0)) W !,"No data." Q
 ; F I=0:0 W !!,"Do you wish to review the data as the (W)ards will see it, as the (L)ab",!,"will see it, or (N)ot review the data?  N// " R X:DTIME S:'$T X=U S:'$L(X) X="N" Q:X[U!("WLN"[X&($L(X)=1))  D INFO^LRMINEW
 F I=0:0 W !!,"Do you wish to review the data as the (W)ards will see it,",!,?31,"as the (L)ab will see it, or",!?38,"(N)ot review the data?  N// " R X:DTIME S:'$T X=U S:'$L(X) X="W" Q:X[U!("WLN"[X&($L(X)=1))  D INFO^LRMINEW  ; LR*5.2*1030
 Q:X[U  I X="N" D ACCEPT Q
 ; S:X="W" LRWRDVEW="" F I=0:0 W !,"Do you want to queue the data to print and approve it later" S %=1 D YN^DICN Q:%  W !,"Answer 'Y'es or 'N'o"
 S:X="W" LRWRDVEW="" F I=0:0 W !,"Do you want to queue the data to print and approve it later" S %=2 D YN^DICN Q:%  W !,"Answer 'Y'es or 'N'o"  ; IHS/OIT/MKK - LR*5.2*1030
 Q:%<1  S ZTRTN="DQ^LRMIVER1" I %=1 S %ZIS="QM",%ZIS("B")="",IOP="Q"
 D IO^LRWU
 Q
DQ S:$D(ZTQUEUED) ZTREQ="@" U IO
 S LREND=0,LRSB=0 K ^TMP($J) S LRAD=0 F I=0:0 S LRAD=+$O(^LRO(68,"AVS",LRAA,LRAD)) Q:LRAD<1  D SORT Q:LREND
 S LRONESPC="",LRONETST="" D PRINT
 Q
SORT S LRAN=0 F I=0:0 S LRAN=+$O(^LRO(68,"AVS",LRAA,LRAD,LRAN)) Q:LRAN<1  D S1
 Q
S1 S LRDFN=+^LRO(68,"AVS",LRAA,LRAD,LRAN),LRIDT=$P(^(LRAN),U,2)
 ; I $D(^LR(LRDFN,"MI",LRIDT,0)) S LRVLOC=$S($L($P(^(0),U,8)):$P(^(0),U,8),1:0),^TMP($J,LRVLOC,LRDFN,LRIDT)=^(0)
 ; S ^TMP($J,LRVLOC,LRDFN,LRIDT,1)=LRAD
 ; ----- BEGIN IHS/OIT/MKK - LR*5.2*1030
 ;       Sort by LRAN
 I $D(^LR(LRDFN,"MI",LRIDT,0)) S LRVLOC=$S($L($P(^(0),U,8)):$P(^(0),U,8),1:0),^TMP($J,LRAN,LRDFN,LRIDT)=^(0)
 S ^TMP($J,LRAN,LRDFN,LRIDT,1)=LRAD
 ; ----- END IHS/OIT/MKK - LR*5.2*1030
 Q
PRINT ; S LRVLOC="" F LRLCNT=0:0 S LRVLOC=$O(^TMP($J,LRVLOC)) Q:LRVLOC=""  S LRLTR=$E(LRVLOC,1,4) W @IOF D ^LRLTR:$E(IOST,1,2)'="C-",P1 Q:LREND
 S LRAN="" F LRLCNT=0:0 S LRAN=$O(^TMP($J,LRAN)) Q:LRAN=""  W @IOF D ^LRLTR:$E(IOST,1,2)'="C-",P1 Q:LREND    ; IHS/OIT/MKK - LR*5.2*1030 - LRAN Sort
 Q
P1 ; S LRDFN=0 F I=0:0 S LRDFN=+$O(^TMP($J,LRVLOC,LRDFN)) Q:LRDFN<1  D P2 Q:LREND
 S LRDFN=0 F I=0:0 S LRDFN=+$O(^TMP($J,LRAN,LRDFN)) Q:LRDFN<1  D P2 Q:LREND    ; IHS/OIT/MKK - LR*5.2*1030 - LRAN Sort
 Q
P2 ; S LRIDT=0 F I=0:0 S LRIDT=+$O(^TMP($J,LRVLOC,LRDFN,LRIDT)) Q:LRIDT<1  D P3 Q:LREND
 S LRIDT=0 F I=0:0 S LRIDT=+$O(^TMP($J,LRAN,LRDFN,LRIDT)) Q:LRIDT<1  D P3 Q:LREND   ; IHS/OIT/MKK - LR*5.2*1030 - LRAN Sort
 Q
P3 ; S LRWLSAVE=LRAA,LRLLT=^TMP($J,LRVLOC,LRDFN,LRIDT),LRACC=$P(LRLLT,U,6),LRAD=$E(LRLLT)_$P(LRACC," ",2)_"0000",X=$P(LRACC," "),DIC=68,DIC(0)="M"
 ; D ^DIC S LRAA=+Y,LRAN=$P(LRACC," ",3),LRCMNT=$S($D(^LR(LRDFN,"MI",LRIDT,99)):^(99),1:""),LRPG=0 D EN^LRMIPSZ1 S LRAA=LRWLSAVE Q:LREND
 ; ----- BEGIN IHS/OIT/MKK - LR*5.2*1030
 ;       LRAN Sort -- and Don't reset LRAN after D ^DIC call
 S LRWLSAVE=LRAA,LRLLT=^TMP($J,LRAN,LRDFN,LRIDT),LRACC=$P(LRLLT,U,6),LRAD=$E(LRLLT)_$P(LRACC," ",2)_"0000",X=$P(LRACC," "),DIC=68,DIC(0)="M"
 D ^DIC S LRAA=+Y,LRCMNT=$S($D(^LR(LRDFN,"MI",LRIDT,99)):^(99),1:""),LRPG=0 D EN^LRMIPSZ1 S LRAA=LRWLSAVE Q:LREND
 ; ----- END IHS/OIT/MKK - LR*5.2*1030
 Q
ACCEPT W !!,"Indicate those you wish to exclude from verification." D LRAN^LRMIUT
 S LRAN=0 F I=0:0 S LRAN=+$O(LRAN(LRAN)) Q:LRAN<1  S LRAD=0 F I=0:0 S LRAD=+$O(^LRO(68,"AVS",LRAA,LRAD)) Q:LRAD<1  K ^LRO(68,"AVS",LRAA,LRAD,LRAN)
 F I=0:0 W !,"Ready to approve" S %=2 D YN^DICN Q:%  W !,"Answer 'Y'es or 'N'o"
 Q:%'=1  W !
 S LRAD=0 F I=0:0 S LRAD=+$O(^LRO(68,"AVS",LRAA,LRAD)) Q:LRAD<1  D LRAD
 K LRWRDVEW,LRAD,LRAN,LRTK,Z
 Q
LRAD S LRAN=0 F I=0:0 S LRAN=+$O(^LRO(68,"AVS",LRAA,LRAD,LRAN)) Q:LRAN<1  D STUFF
 Q
STUFF S LRDFN=+^LRO(68,"AVS",LRAA,LRAD,LRAN),LRIDT=$P(^(LRAN),U,2)
 ; D UPDATE^LRPXRM(LRDFN,"MI",LRIDT)   ; IHS/OIT/MKK - LR*5.2*1030 - RPMS Does NOT use Clinical Reminders
 I $D(^LRO(68,LRAA,1,LRAD,1,LRAN,0)) S LRODT=$P(^(0),U,4),LRSN=$P(^(0),U,5),LRLLOC=$P(^(0),U,7),DFN=$P(^LR(LRDFN,0),U,3),LRDPF=$P(^(0),U,2),LRCDT=9999999-LRIDT D PT^LRX S Y=DT D VT^LRMIUT1
 S ^LR(LRDFN,"MI",LRIDT,0)=$P(^LR(LRDFN,"MI",LRIDT,0),U,1,2)_U_LRNT_U_DUZ_U_$P(^(0),U,5,99)
 S LRSET=1,II=0 F I=0:0 S II=+$O(^LRO(68,LRAA,1,LRAD,1,LRAN,4,II)) Q:I<1  I '$L($P(^(II,0),U,5)) S LRSET=0
 S:LRSET $P(^LRO(68,LRAA,1,LRAD,1,LRAN,3),U,4)=LRNT W "."
 F II=1,5,8,11,16 I $D(^LR(LRDFN,"MI",LRIDT,II)),$P(^(II),U) K ^LRO(68,LRAA,1,LRAD,"AC",II,LRAN)
 ; ----- BEGIN IHS/OIT/MKK - LR*5.2*1030
 ;       Per appendix A of RPMS Lab E-Sig Enhancement V 5.2 Technical manual
 I $$ADDON^BLRUTIL("LR*5.2*1013","BLRALAF",DUZ(2)) D ^BLRALAF
 ; ----- END IHS/OIT/MKK - LR*5.2*1030
 Q
