LRAPD ; IHS/DIR/AAB - AP DATA ENTRY 13:30 ; [ 5/1/96 ]
 ;;5.2;LR;**1002**;JUN 01, 1998
 ;;5.2;LAB SERVICE;**72,91**;Sep 27, 1994
 S:'$D(LRSOP) LRSOP="" I LRCAPA D @(LRSS_"^LRAPSWK") G:'$D(X) END ;S LRW("S")=LRT  ;Allows +SP SPECIMENS to increment using option LRAPDGD/cym
 S LRD(1)=LRD,LRD=LRD_LRSS_"^LRAPD1",LR("TR")="" D @LRD,END Q
 ;
A ;also from LRAPOLD,LRAPM,LRAPQAMR,LRAPQAT
 S LRDICS="SPCYEM" D ^LRAP Q:'$D(Y)  S LRV=$P($G(^LRO(69.2,LRAA,0)),U,10)
 S X=$G(^LAB(69.9,1,11)) S LR("FS")=+X,LR("DX")=$S(LRSS="SP":$P(X,U,2),LRSS="CY":$P(X,U,3),LRSS="EM":$P(X,U,4),1:0) Q
 ;
R S Y=$S('X:0,'$D(^LAB(61.5,X,0)):0,'$P(^LAB(61.5,X,0),U,3):0,1:.02) Q
T S LR(8)=$S('X:0,'$D(^LAB(61,X,0)):0,1:$P(^LAB(61,X,0),U,4)) Q
EN D A G:'$D(Y) END S LRD="" G LRAPD ;gross description/clinical hx
EN1 D A G:'$D(Y) END S LRD="M" G LRAPD ;gross review/micro description
EN2 D A G:'$D(Y) END S LRD="B" G LRAPD ;micro description/SNOMED coding
EN3 ;micro description/ICD9CM coding
 D A G:'$D(Y) END I '$O(^ICD0(0)) W $C(7),!!,"No entries in the ICD DIAGNOSIS File (#80)." Q
 S LRD="A" G LRAPD
EN4 D A G:'$D(Y) END S LRD="S" G LRAPD ;supplementary report
EN5 D A G:'$D(Y) END S LRD="P" G LRAPD ;special studies
 ;
END D V^LRU Q
