LRAPMOD ;AVAMC/REG/WTY - PRINT PATH MICRO MODIFICATIONS ;9/22/00
 ;;5.2T9;LR;**72,248,1018**;Nov 17, 2004
 ;
 ;Reference to ^%DT supported by IA #10003
 ;
 S LRDICS="AUSPCYEM" D ^LRAP G:'$D(Y) END
 W !!?15,LRO(68),!!?15,"Print pathology report modifications",!!
GETP D EN2^LRUA,EN1^LRUPS
 G:LRAN["?" GETP
 I LRAN=-1 D END Q
 S FLGMOD=1
 I LRSS'="AU" D
 .S:($D(^LR(LRDFN,LRSS,LRI,4))!($D(^(5)))!($D(^(6)))!($D(^(7)))) FLGMOD=0
 I FLGMOD D  K LRFILE
 .S LRFILE=$S(LRSS="AU":"^LR(LRDFN,84",1:"^LR(LRDFN,LRSS,LRI,1.2")
 .I $D(@(LRFILE_")")) D
 ..F A=0:0 S A=$O(@(LRFILE_",A)")) Q:'A!('FLGMOD)  D
 ...S:$D(@(LRFILE_",A,2)")) FLGMOD=0
 I FLGMOD W $C(7),!!?5,"No modifications to print." G END
 K FLGMOD
 S (LRQ(9),LRSAV)=1,LRAP=LRDFN
 I LRSS'="AU" D  G DEV^LRSPRPT
 .S LRAP=LRAP_"^"_LRI,LRS(99)=1
 S X="T",%DT="" D ^%DT,D^LRU S LRH(3)=Y,LRFLG=1
 G DEV^LRAPAUSR
END ;
 D V^LRU
 Q
