LRAPLG ; IHS/DIR/AAB - AP LOG-IN 2/20/98 14:36 ; [ 07/08/1998 3:55 PM ]
 ;;5.2;LR;**1002,1006**;SEP 01, 1998
 ;
 ;;5.2;LAB SERVICE;**72,201**;Sep 27, 1994
 D ^LRAP Q:'$D(Y)  S LR("L")=LRSS_"^LRAP" I LRCAPA,"AUSP"[LRSS S X=$S(LRSS="SP":"H & E STAIN",1:"AUTOPSY H & E") D X^LRUWK G:'$D(X) END S LRW("H&E")=LRT K LRT
 I LRCAPA,LRSS="EM" S X="THICK SECTION EM" D X^LRUWK G:'$D(X) END S X=11 D SET S LRW("SS")=LRT_U_X S X="GRID EM" D X^LRUWK G:'$D(X) END S X=12 D SET S LRW("G")=LRT_U_X K LRT
 I LRCAPA D @(LRSS_"^LRAPSWK") G:'$D(X) END
 D:"SPEMCY"[LRSS A^LRAPWU W !!,"Log-In for ",LRH(0)," " S %=1 D YN^LRU Q:%<1  S LRAA(3)=1 D XR^LRU
 I %=2 S %DT="AE",%DT(0)="-N",%DT("A")="Enter YEAR: " D ^%DT K %DT Q:Y<1  S LRAD=$E(Y,1,3)_"0000",Y=LRAD D D^LRU S LRH(0)=Y
 S LRH(2)=$E(LRAD,1,3),LRWHN=$E(LRAD,2,3)
 S:'$D(^LRO(68,LRAA,1,0)) ^(0)="^68.01DA^^0"
 S:'$D(^LRO(68,LRAA,1,LRAD,0)) ^(0)=LRAD,^LRO(68,LRAA,1,0)=$P(^LRO(68,LRAA,1,0),"^",1,2)_"^"_LRAD_"^"_($P(^(0),"^",4)+1)
 S:'$D(^LRO(68,LRAA,1,LRAD,1,0)) ^(0)="^68.02PA^^"
 S %DT="",X="T-4" D ^%DT S LRDTI=9999999-Y
GETP W ! S LRSIT="",LRDPAF=1 K DIC D ^LRDPA G:LRDFN<1 END I LRSS="SP" F X=0:0 S X=$O(^LR(LRDFN,LRSS,X)) Q:'X!(X>LRDTI)  S Y=^(X,0) W $C(7),!?6,"Accession number assigned for ",$$FMTE^XLFDT(Y,"D")," is: ",$P(Y,"^",6)
 I LRSS="SP" S X="SROSPLG" X ^%ZOSF("TEST") I $T D ^SROSPLG
 D ADD G GETP
ADD I LRSS="AU",'$D(LREXP) W $C(7),!!,"NO DATE DIED ENTERED IN ",LRFNAM," FILE",! Q:+LRDPF=2  S DIE=+LRDPF,DA=DFN,DR=.351 D ^DIE Q:$D(Y)  S LREXP=X
 ;I LRSS="AU",$D(^LR(LRDFN,"AU")),$P(^("AU"),U,6) S Y=^("AU"),X=+$P(Y,U,6),Y(1)=$E(Y,1,3)_"0000" W !,"Yr:",1700+$E(Y,1,3)," Acc#:",X," IN LAB FILE FOR ",$P(@(LRPF_DFN_",0)"),U)," SSN:",$P(^(0),U,9) D CK Q
 I LRSS="AU",$D(^LR(LRDFN,"AU")),$P(^("AU"),U,6) S Y=^("AU"),X=+$P(Y,U,6),Y(1)=$E(Y,1,3)_"0000" W !,"Yr:",1700+$E(Y,1,3)," Acc#:",X," IN LAB FILE FOR ",$P(@(LRPF_DFN_",0)"),U)," HRCN:",HRCN D CK Q  ;IHS/ANMC/CLS 11/1/95
 D:LRPF="^DPT(" ^LRAPPOW ; for AFIP studies
 D ^LRAPLG1 K LRMD,DIC,DIE,DR Q
CK I +$G(^LRO(68,LRAA,1,Y(1),1,X,0))=LRDFN W $C(7),!!?20,"Also in accession file" Q
 W !,"Enter in Accession File " S %=2 D YN^LRU D:%=1 ^LRAPLG2 Q
SET S X=$P($G(^LRO(69.2,LRAA,0)),"^",X) S:'X X=1 Q
END D V^LRU Q
