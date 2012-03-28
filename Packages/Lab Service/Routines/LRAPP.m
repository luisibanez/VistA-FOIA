LRAPP ; IHS/DIR/AAB - AP PRINT 8/13/95 21:29 ;
 ;;5.2;LR;**1002**;JUN 01, 1998
 ;;5.2;LAB SERVICE;**72**;Sep 27, 1994
 D @LRAPX(0),END Q
 ;
P D A G:'$D(Y) END S LRAPX=4 G LRAPP ;print all on queue
D D A G:'$D(Y) END S LRAPX=2 G LRAPP ;delete print queue
S D A G:'$D(Y) END S LRAPX=3 G LRAPP ;print single report
N D A G:'$D(Y) END S LRAPX=1 G LRAPP ;add pt to print queue
T D ^LRAP G:'$D(Y) END D ^LRUPAD,END Q  ;AP accessions by date
B D ^LRAP G:'$D(Y) END D ^LRUPA,END Q  ;AP accessions by number
 ;
A W ! D ^LRAP G:'$D(Y) END I LRSS="AU" D PS Q
C W !!?16,"1. Preliminary reports",!?16,"2. Final",?31,"reports" R !,"Select 1 or 2 : ",X:DTIME G:X=""!(X[U) END I X<1!(X>2) W $C(7),!!,"Enter '1' for preliminary reports or '2' for final reports" G C
 S LRAPX(0)=$S(X=1:"^LRSPT",1:"^LRSPRPT") Q
 ;
PS W !!?15,"1. Autopsy protocols",!?15,"2. Autopsy supplementary reports",!,"Select 1 or 2: " R X:DTIME G:X=""!(X[U) END I X<1!(X>2) W $C(7),!!,"Enter '1' for autopsy protocols or '2' for autopsy supplementary reports" G PS
 S LRAPX(0)=$S(X=1:"^LRAURPT",1:"^LRAPAUSR") Q
 ;
END D V^LRU Q
