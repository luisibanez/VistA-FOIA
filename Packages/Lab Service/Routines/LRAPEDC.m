LRAPEDC ; IHS/DIR/AAB - EDIT ANATOMIC PATH COMMENTS 8/12/95 07:51 ;
 ;;5.2;LR;**1002**;JUN 01, 1998
 ;;5.2;LAB SERVICE;**72**;Sep 27, 1994
 S LRDICS="SPCYEM" D ^LRAP Q:'$D(Y)  D XR^LRU
ASK W !?14,"1. Enter/edit specimen comment(s)",!?14,"2. Enter/edit delayed report comment(s)" R !,"CHOOSE (1-2): ",X:DTIME G:X=""!(X[U) END I X'=1&(X'=2) W $C(7),!,"Must select either a '1' or a '2'" G ASK
 S DR=$S(X=1:.99,1:.97),LR("C")=$S(X=1:"specimen",1:"delayed report")
 W !!,"EDIT ",LRO(68)," ",LR("C")," comments for ",LRH(0)," " S %=1 D YN^LRU G:%<1 END
 I %=2 S %DT="AE",%DT(0)="-N",%DT("A")="Enter YEAR: " D ^%DT K %DT G:Y<1 END S LRAD=$E(Y,1,3)_"0000",Y=LRAD D D^LRU S LRH(0)=Y
 S LRC=$E(LRAD,1,3)
G W !!,"Enter ",LRO(68)," Accession #: " R LRAN:DTIME G:LRAN=""!(LRAN[U) END I LRAN'?1N.N W $C(7)," ENTER NUMBERS ONLY" G G
 D EDIT G G
EDIT S LRDFN=$O(^LR(LRXREF,LRC,LRABV,LRAN,0)) I 'LRDFN W $C(7),"  Not in file" Q
 I '$D(^LR(LRDFN,0)) K ^LR(LRXREF,LRC,LRABV,LRAN,LRDFN) Q
 ;S X=^LR(LRDFN,0) D ^LRUP W !,LRP," ID: ",SSN," OK " S %=1 D YN^LRU Q:%'=1
 S X=^LR(LRDFN,0) D ^LRUP W !,LRP," ID: ",HRCN," DOB: ",DOB," OK " S %=1 D YN^LRU Q:%'=1  ;IHS/ANMC/CLS 11/1/95
 S LRI=+$O(^LR(LRXREF,LRC,LRABV,LRAN,LRDFN,0)) I '$D(^LR(LRDFN,LRSS,LRI,0)) W $C(7),!,"Entry in x-ref but not in file ! X-ref deleted." K ^LR(LRXREF,LRC,LRABV,LRAN,LRDFN,LRI) Q
 S X=^LR(LRDFN,LRSS,LRI,0) I $P($P(X,"^",6)," ")'=LRABV Q
 S LRD=$P(X,"^",10),DA=LRI,DA(1)=LRDFN,DIE="^LR(LRDFN,LRSS,",(LRB,Y)=+X D D^LRU W !,"Specimen date: ",Y
 D ^DIE Q
 ;
END D V^LRU Q
