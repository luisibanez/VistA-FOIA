LROC ; IHS/DIR/AAB - ORDER LIST CLEAN-UP 8/11/97 ;  [ 07/22/2002  1:28 PM ]
 ;;5.2T9;LR;**1003,1013,1018**;Nov 17, 2004
 ;;5.2;LAB SERVICE;**121**;Sep 27, 1994
 ; Modified slc/jer to include set/kill for "D" cross-reference
 D ^LROCM W !!,?5,"Do you wish to Purge old Orders and Accessions " S %=2 D YN^DICN Q:%'=1
 S U="^",%DT="",X="T-"_$S($P(^LAB(69.9,1,0),U,9):$P(^(0),U,9),1:7) D ^%DT S LRSAVE=Y,LRAA=0
L1 S LRAA=$O(^LRO(68,LRAA)) G L3:LRAA<1 I $P(^LRO(68,LRAA,0),U,3)'="D" W !," USE FILE MANAGER TO CLEAR ",$P(^(0),U) G L1
 S DA=0 ; W !,"CLEAR ",$P(^LRO(68,LRAA,0),U)," ACCESSIONS? N//" R X G L1:X'["Y"
L2 S LRDAL=DA,DA=$O(^LRO(68,LRAA,1,DA)) G L1:LRSAVE<DA,L2:LRDAL=0,L1:LRDAL<1 K ^LRO(68,LRAA,1,LRDAL) G L2
L3 S ZTRTN="DQ^LROC",ZTDESC="Purge old orders and accessions",ZTIO="",ZTSAVE("LR*")="" D ^%ZTLOAD K ZTSK,ZTRTN,ZTDESC,ZTIO,ZTSAVE,LRDAL Q
DQ S I=0 F  S I=$O(^LRO(69,"C",I)) Q:I<1  S J=0 F  S J=$O(^LRO(69,"C",I,J)) Q:J>LRSAVE!(J<1)  K ^(J)
 S I=0 F  S I=$O(^LRO(69,"D",I)) Q:I<1  S J=0 F  S J=$O(^LRO(69,"D",I,J)) Q:J>LRSAVE!(J<1)  K ^(J)
 S DA=1 D ^LROC1 S DA=1
L4 S LRDAL=DA,DA=$O(^LRO(69,DA)) G L5:LRSAVE<DA,L4:LRDAL=1
 S ^(0)=$P(^LRO(69,0),U,1,2)_U_DA_U_($P(^(0),U,4)-1) S:DA<1 ^(0)=$P(^(0),U,1,2)
 I LRDAL'["0000" D
 . N LRSN
 . S LRSN=0 F  S LRSN=$O(^LRO(69,LRDAL,1,LRSN)) Q:LRSN<1  D NEW^LR7OB1(LRDAL,LRSN,"Z@") ;Call OE/RR
 . K ^LRO(69,LRDAL),^LRO(69,"B",LRDAL,LRDAL)
 Q:DA<1  G L4
L5 Q
 S LRSAVE=9999999-LRSAVE S I=1 F  S I=$O(^LAB(62.4,I)) Q:I<1  S LRLOST=$P(^(I,0),U,5) D L6:LRLOST
 W ! W:$E(IOST,1,2)="P-" @IOF D ^%ZISC Q
L6 S LRIDT=LRSAVE S LRIDT=LRIDT F  S LRIDT=$O(^LR(LRLOST,"CH",LRIDT)) Q:LRIDT<LRSAVE  K ^LR(LRLOST,"CH",LRIDT)
 Q
CENDEL W !,"STARTING CENTRAL ENTRY #: " R LRSTA:DTIME S LRSTA=LRSTA-1
 S U="^" W !,"ENDING CENTRAL ENTRY #: " R LRFIN:DTIME
 W !,"ARE YOU SURE? N//" D % Q:%'["Y"
 S ZTRTN="REENTRY^LROC",ZTIO="",ZTSAVE("L*")="" D ^%ZTLOAD K IO("Q"),ZTSK,ZTRTN,ZTIO,ZTSAVE
 K %H,%ZA,%ZB,%ZC,DA,I,J,LRAA,LRAN,LRDFN,LRDTM,LRDTN,LRFIN,LRIDT,LRIOZERO,LRLOST,LROCN,LROID,LRORD,LROSN,LRSAVE,LRSN,LRSS,LRSTA,POP,Z
 Q
REENTRY ;
 S LRORD=LRSTA F  S LRORD=$O(^LRO(69,"C",LRORD)) Q:LRORD<1!(LRORD>LRFIN)  D FDAT
 Q
FDAT S LRDTN=0 F  S LRDTN=$O(^LRO(69,"C",LRORD,LRDTN)) Q:LRDTN<1  D ZAP
 Q
ZAP ;
 S LRSN=0 F  S LRSN=$O(^LRO(69,"C",+LRORD,LRDTN,LRSN)) Q:LRSN<1  D
 . D OR ;OE/RR 2.5
 . D NEW^LR7OB1(LRDTN,LRSN,"Z@") ;Call OE/RR
 . K ^LRO(69,"C",+LRORD,LRDTN,LRSN) Q:'$D(^LRO(69,LRDTN,1,LRSN,0))  S LRDFN=+^(0)
 . K ^LRO(69,LRDTN,1,LRSN),^LRO(69,LRDTN,1,"AA",LRDFN,LRSN),^LRO(69,"D",LRDFN,LRDTN,LRSN)
 S LRAA=0 F  S LRAA=$O(^LRO(68,LRAA)) Q:LRAA<1  D:$P(^(LRAA,0),U,10)="Y" LRORD
 Q
LRORD S LRAN=$O(^LRO(68,LRAA,1,LRDTN,1,"D",LRORD,0)) Q:LRAN<1
 Q:'$D(^LRO(68,LRAA,1,LRDTN,1,LRAN,0))
 S LRSS=$P(^LRO(68,LRAA,0),"^",2)
 S LRDFN=+^LRO(68,LRAA,1,LRDTN,1,LRAN,0) G:'$D(^(3)) SKPLR S LRDTM=+^LRO(68,LRAA,1,LRDTN,1,LRAN,3) G:'LRDTM SKPLR S LRIDT=9999999-LRDTM
 I $D(^LR(LRDFN,LRSS,LRIDT,0)),$P(^(0),U,3) Q
 K ^LR(LRDFN,LRSS,LRIDT)
SKPLR S X=^LRO(68,LRAA,1,LRDTN,1,LRAN,0),LROSN=$P(X,U,5),LROID=$P(X,U,6),LROCN=$S($D(^(.1)):$P(^(.1),U),1:"")
 K:$L(LROID) ^LRO(68,LRAA,1,LRDTN,1,"C",LROID,LRAN) K:$L(LROCN) ^LRO(68,LRAA,1,LRDTN,1,"D",LROCN,LRAN) K ^LRO(68,LRAA,1,LRDTN,1,LRAN)
 W "." Q
% R %:DTIME Q:%=""!(%["N")!(%["Y")  W !,"Answer 'Y' or 'N': " G %
 Q
OR ;Purge OE/RR entries
 I $$VER^LR7OU1>2.5 Q  ;OE/RR 2.5
 Q:'$D(^LRO(69,LRODT,1,LRSN,2))
 ;BEGIN IHS MODIFCATIONS LR*5.2*1018
 ;RESTORED LINE BELOW
 S LRTT=0 F N=0:0 S LRTT=$O(^LRO(69,LRODT,1,LRSN,2,LRTT)) Q:LRTT<1  I $D(^(LRTT,0)),$P(^(0),"^",7) S ORIFN=$P(^(0),"^",7),ORSTS="K" D ST^ORX
 ;BEGIN IHS MODIFICATIONS LR*5.2*1018
 ;TAKE OUT CALL TO DUMMY ROUTINE
 ;S LRTT=0 F N=0:0 S LRTT=$O(^LRO(69,LRODT,1,LRSN,2,LRTT)) Q:LRTT<1  I $D(^(LRTT,0)),$P(^(0),"^",7) S ORIFN=$P(^(0),"^",7),ORSTS="K" ;IHS/DIR TUC/AAB 06/15/98
 ;END IHS MODIFICATIONS
 Q
