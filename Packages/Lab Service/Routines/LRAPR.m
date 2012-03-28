LRAPR ;AVAMC/REG/WTY- ANAT RELEASE REPORTS ;9/22/00 [ 04/11/2003  11:39 AM ]
 ;;5.2T9;LR;**1002,1018**;Nov 17, 2004
 ;;5.2;LAB SERVICE;**72,248**;Sep 27, 1994
 ;
 ;Reference to ^%DT supported by IA #10003
 ;Reference to ^DIC supported by IA #10006
 ;
 W !!?27,"RELEASE PATHOLOGY REPORTS",!!
 D A G:'$D(LRSS) END
 I LRCAPA D  G:'$D(X) END
 .S X=$S(LRSS="CY":"CYTOLOGY REPORTING",LRSS="SP":"SURGICAL PATH REPORTING",1:"")
 .D:X]"" X^LRUWK
 G:LRSS="AU" B
 S LRSOP="Z"
 S DR="S A=^LR(LRDFN,LRSS,LRI,0),LRZ=$P(A,U,3),LRZ(1)=$P(A,U,13),"
 S DR=DR_"LRZ(2)=$P(A,U,11);"
 S DR=DR_"I 'LRZ W $C(7),!,""No date report completed.   "
 S DR=DR_"Cannot release."" S Y=0;I LRZ(2) W $C(7),!,""Report """
 S DR=DR_" W:LRZ(2)=1 ""has already been "" W ""released "" S Y=LRZ(2) "
 S DR=DR_"D DD^%DT W:LRZ(2)>1 Y W:LRZ(1)'="""" "" by """
 S DR=DR_"_$P($G(^VA(200,LRZ(1),0)),U) S Y=0;"
 S DR=DR_"S DIR(0)=""YA"",DIR(""A"")=""Release report? """
 S DR=DR_",DIR(""B"")=""NO"" D ^DIR K:Y Y S:$D(Y) Y=0;"
 S DR=DR_".11////^D NOW^%DTC S X=%;.13////^S X=DUZ;"
 S DR=DR_"W !!,""Report released..."""
 D ^LRAPDA G END
 ;
B S LRSOP="Z"
 S DR="S A=^LR(LRDFN,""AU""),LRZ(1)=$P(A,U,16),LRZ(2)=$P(A,U,15);"
 S DR=DR_"I LRZ(2) W $C(7),!,""Report """
 S DR=DR_" W:LRZ(2)=1 ""has already been "" W ""released "" S Y=LRZ(2) "
 S DR=DR_"D DD^%DT W:LRZ(2)>1 Y W:LRZ(1)'="""" "" by """
 S DR=DR_"_$P($G(^VA(200,LRZ(1),0)),U) K Y;"
 S DR=DR_"W ! S DIR(0)=""YA"",DIR(""B"")=""NO"" "
 S DR=DR_"S:LRZ(2) DIR(""A"")=""Unrelease report? "" "
 S DR=DR_"S:'LRZ(2) DIR(""A"")=""Release report? "" D ^DIR "
 S DR=DR_"K:Y Y S:$D(Y) Y=0;D NOW^%DTC S RDTE=%;"
 S DR=DR_"14.7////^S X=$S(LRZ(2):""@"",1:RDTE);"
 S DR=DR_"14.8////^S X=$S(LRZ(2):""@"",1:DUZ);"
 S DR=DR_"W !!,""Report "" W:LRZ(2) ""un"" W ""released..."";K RDTE"
 D ^LRAPDA
 G END
EN W !!?20,"RELEASE SUPPLEMENTARY PATHOLOGY REPORTS" D C G:'$D(LRSS) END
 W !!,"Data entry for ",LRH(0)," "
 S %=1 D YN^LRU G:%<1 END
 I %=2 D  G:Y<1 END
 .S %DT="AE",%DT(0)="-N",%DT("A")="Enter YEAR: " D ^%DT K %DT
 .Q:Y<1  S LRAD=$E(Y,1,3)_"0000",LRH(0)=$E(Y,1,3)+1700
 I '$D(^LRO(68,LRAA,1,LRAD,0)) D  Q
 .W $C(7),!!,"NO ",LRAA(1)," ACCESIONS IN FILE FOR ",LRH(0),!!
W K X,Y,LR("CK") R !!,"Select Accession Number/Pt name: ",LRAN:DTIME
 G:LRAN=""!(LRAN[U) END
 I LRAN'?1N.N D PNAME^LRAPDA G:LRAN<1 W D DIE G W
 D REST G W
REST W "  for ",LRH(0) I '$D(^LRO(68,LRAA,1,LRAD,1,LRAN,0)) W $C(7),!!,"Accession # ",LRAN," for ",LRH(0)," not in ACCESSION file",!! Q
 S X=^LRO(68,LRAA,1,LRAD,1,LRAN,0),LRLLOC=$P(X,"^",7),LRDFN=+X Q:'$D(^LR(LRDFN,0))  S X=^(0) D ^LRUP
 ;W !,LRP,"  ID: ",SSN
 ;----- BEGIN IHS MODIFICATIONS LR*5.2*1018
 W !,LRP,"  ID: ",HRCN  ;IHS/ANMC/CLS 11/1/95
 ;----- END IHS MODIFICATIONS
 S LRI=$P(^LRO(68,LRAA,1,LRAD,1,LRAN,3),"^",5) W !,"Specimen(s):" F X=0:X S X=$O(^LR(LRDFN,LRSS,LRI,.1,X)) Q:'X  I $D(^(X,0)),$L(^(0)) W !,^(0)
DIE S DIC("B")="" F X=0:0 S X=$O(^LR(LRDFN,LRSS,LRI,1.2,X)) Q:'X  I '$P(^(X,0),"^",2) S DIC("B")=+^(0) Q
 I 'DIC("B") W $C(7),!!,"No supplementary report to release." Q
 W ! S DIC="^LR(LRDFN,LRSS,LRI,1.2,",DIC("A")="Select SUPPLEMENTARY REPORT DATE: ",DIC("S")="I '$P(^(0),U,2)",DIC(0)="AEQM" D ^DIC K DIC Q:Y<1  S DA=+Y
 W !,"RELEASE SUPPLEMENTARY REPORT " S %=2 D YN^LRU I %=1 S $P(^LR(LRDFN,LRSS,LRI,1.2,DA,0),U,2)=1
 Q
 ;
A D ^LRAP G:'$D(Y) END
 Q
C S LRDICS="SPCYEM" D ^LRAP G:'$D(Y) END
 Q
S ;from LRAPDA
 S LRK=$P(^LR(LRDFN,LRSS,LRI,0),"^",11) Q:'LRK  S:'$D(^LRO(68,LRAA,1,LRAD,1,LRAN,4,0)) ^(0)="^68.04PA^^"
 Q:$D(^LRO(68,LRAA,1,LRAD,1,LRAN,4,LRT,0))  S ^(0)=LRT_"^50^^"_DUZ_"^"_LRK,X=^LRO(68,LRAA,1,LRAD,1,LRAN,4,0),^(0)=$P(X,"^",1,2)_"^"_LRT_"^"_($P(X,"^",4)+1)
 S:'$D(^LRO(68,LRAA,1,LRAD,1,LRAN,4,LRT,1,0)) ^(0)="^68.14P^^"
 F C=0:0 S C=$O(LRT(C)) Q:'C  D CAP
 S ^LRO(68,"AA",LRAA_"|"_LRAD_"|"_LRAN_"|"_LRT)="" Q
 ;
CAP S ^LRO(68,LRAA,1,LRAD,1,LRAN,4,LRT,1,C,0)=C_"^1^0^0^^"_LRK_"^"_DUZ_"^"_DUZ(2)_"^"_LRAA_"^"_LRAA_"^"_LRAA,X=^LRO(68,LRAA,1,LRAD,1,LRAN,4,LRT,1,0),^(0)=$P(X,"^",1,2)_"^"_C_"^"_($P(X,"^",4)+1) Q
 ;
END D V^LRU Q
