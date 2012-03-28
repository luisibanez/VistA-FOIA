LRSPT ;AVAMC/REG/WTY - AP PRELIMINARY REPORTS ;9/22/00
 ;;5.2T9;LR;**1018**;Nov 17, 2004
 ;;5.2;LAB SERVICE;**1,72,248**;Sep 27, 1994
 ;
 ;Reference to ^%DT supported by IA #10003
 ;Reference to ^DPT supported by IA #918
 ;Reference to ^DIWP suppported by IA #10011
 ;Reference to ^DIWW suppported by IA #10029
 ;Reference to EN^DDIOL supported by IA #10142
 ;
 S X="T",%DT="" D ^%DT,D^LRU S LRTOD=Y D EN2^LRUA
 W !!,"Preliminary reports for ",LRO(68)
 G END:LRAPX=2,SGL:LRAPX=3,CH:LRAPX=4
GETP D EN1^LRUPS Q:LRAN=-1
 G:$D(^LRO(69.2,LRAA,1,LRAN,0)) GETP
 L +^LRO(69.2,LRAA,1):5  I '$T D  G GETP
 .S MSG(1)="The preliminary reports queue is in use by another person.  "
 .S MSG(1,"F")="!!"
 .S MSG(2)="You will need to add this accession to the queue later."
 .D EN^DDIOL(.MSG) K MSG
 S ^LRO(69.2,LRAA,1,LRAN,0)=LRDFN_"^"_LRI
 S X=^LRO(69.2,LRAA,1,0),^(0)=$P(X,"^",1,2)_"^"_LRAN_"^"_($P(X,"^",4)+1)
 L -^LRO(69.2,LRAA,1)
 G GETP
CH S LRAPX(1)=1 D EN^LRSPRPT2 Q:%<1  W !!,"Save preliminary reports for reprinting " S %=2 D YN^LRU S:%=1 LRSAV=1
DEV S ZTRTN="QUE^LRSPT" D BEG^LRUTL Q:POP!($D(ZTSK))
QUE U IO D L^LRU,L1^LRU,S^LRU,SET^LRUA S LRS(5)=1,LRQ(2)=1,LRA=$S($D(^LRO(69.2,LRAA,0)):$P(^(0),U,9),1:1) S:LRA="" LRA=1
 S LR("DIWF")=$S($P(^LRO(69.2,LRAA,0),"^",6)="D":"D",1:"")_"W" I $D(LRAP) S LRDFN=$P(LRAP,"^"),LRI=$P(LRAP,"^",2) D D G K
 F LRAN=0:0 S LRAN=$O(^LRO(69.2,LRAA,1,LRAN)) Q:'LRAN!(LR("Q"))  S X=^(LRAN,0),LRDFN=+X,LRI=$P(X,"^",2) D D
K K:'$D(LRSAV) ^LRO(69.2,LRAA,1) K P,S,LRAN
 S ^LRO(69.2,LRAA,1,0)="^69.21A^^"
 I $D(LR("F")),IOST?1"C".E D M^LRU
 K LRSAV D END^LRUTL
 Q
D K ^UTILITY($J) I '$D(^LR(LRDFN,0)) K ^LRO(69.2,LRAA,1,LRAN) Q
 D EN^LRSPRPT Q:LR("Q")
 I $P($G(^LR(LRDFN,0)),"^",2)=2 D  Q:LR("Q")
 .I IOST?1"C".E D  K LRPOW Q:LR("Q")
 ..S LRPOW=0
 ..I $D(^DPT(DFN,.52)) S:$P(^(.52),U,5)="Y" LRPOW=1
 ..I $D(^DPT(DFN,.322)) S:$P($G(^(.322)),"^",10)="Y" LRPOW=1
 ..D:LRPOW M^LRU Q:LR("Q")
 .D ^LRAPPOW
 G:'$D(^LR(LRDFN,"SP",0))&('$D(^LR(LRDFN,"CY",0)))&('$D(^LR(LRDFN,"EM",0))) AU
 D ^LRAPT1 Q:LR("Q")
AU I $D(^LR(LRDFN,"AU")),$L($P(^LR(LRDFN,"AU"),"^")) D ^LRAPT2 Q:LR("Q")
 K ^UTILITY($J) S DIWR=IOM-5,DIWF="W",LR("A")=0
 W ! F LRZ=0:1 S LR("A")=$O(^LRO(69.2,LRAA,10,LR("A"))) Q:'LR("A")  D:$Y>(IOSL-6) H S X=^LRO(69.2,LRAA,10,LR("A"),0) D ^DIWP
 D:LRZ ^DIWW Q
H ;from LRAPPF1
 D F^LRU W !,"ANATOMIC PATHOLOGY",!,LR("%") Q
END W $C(7),!!,"OK TO DELETE THE ",LRO(68)," PRELIMINARY REPORT LIST" S %=2 D YN^LRU I %=1 K ^LRO(69.2,LRAA,1) S ^LRO(69.2,LRAA,1,0)="^69.21A^0^0" W $C(7),!,"LIST DELETED !" Q
 W !!,"FINE, LET'S FORGET IT",! Q
 ;
SGL D EN1^LRUPS Q:LRAN=-1  S LRAP=LRDFN_"^"_LRI,LRSAV=1 D EN2^LRUA G DEV
