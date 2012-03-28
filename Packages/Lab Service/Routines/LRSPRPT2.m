LRSPRPT2 ; IHS/DIR/AAB - SURG PATH PRINT SNOMED 9/29/95 12:12 ;
 ;;5.2;LR;**1002**;JUN 01, 1998
 ;;5.2;LAB SERVICE;**72**;Sep 27, 1994
 D:$Y>(IOSL-13) F Q:LR("Q")  I $D(^LR(LRDFN,LRSS,LRI,2,A)) W !,"SNOMED code(s):"
 F A=0:0 S A=$O(^LR(LRDFN,LRSS,LRI,2,A)) Q:'A!(LR("Q"))  S T=+^(A,0),T=^LAB(61,T,0) D:$Y>(IOSL-12) F Q:LR("Q")  W !,"T-",$P(T,"^",2),": " S X=$P(T,"^") D:LR(69.2,.05) C^LRUA W X D M
 Q
M F B=0:0 S B=$O(^LR(LRDFN,LRSS,LRI,2,A,2,B)) Q:'B!(LR("Q"))  S M=+^(B,0),M=^LAB(61.1,M,0) D:$Y>(IOSL-12) F Q:LR("Q")  W !?5,"M-",$P(M,"^",2),": " S X=$P(M,"^") D:LR(69.2,.05) C^LRUA W X D E
D Q:LR("Q")  F B=1.4,3.3,4.5 F C=0:0 S C=$O(^LR(LRDFN,LRSS,LRI,2,A,$P(B,"."),C)) Q:'C!(LR("Q"))  S X=^(C,0) D A
 Q
A S M=+X,M(2)=$P(X,"^",2),E="61."_$P(B,".",2),M=^LAB(E,M,0) D:$Y>(IOSL-12) F Q:LR("Q")  W !?5,$S(B=1.4:"D-",B=3.3:"F-",B=4.5:"P-",1:""),$P(M,"^",2),?12,": " S X=$P(M,"^") D:LR(69.2,.05) C^LRUA W X I B=4.5,M(2)]"" D W
 Q
E F C=0:0 S C=$O(^LR(LRDFN,LRSS,LRI,2,A,2,B,1,C)) Q:'C!(LR("Q"))  S E=+^(C,0),E=^LAB(61.2,E,0) D:$Y>(IOSL-12) F Q:LR("Q")  W !?10,"E-",$P(E,"^",2),": " S X=$P(E,"^") D:LR(69.2,.05) C^LRUA W X
 Q
F D F^LRAPF,^LRAPF Q
 ;
W W " (",$S(M(2)=0:"negative",M(2)=1:"positive",1:"?"),")" Q
 ;
EN ; from LRSPRPT,LRSPT
 Q:'LRAPX(1)  W !!,"Add/Delete reports to/from print queue for ",LRH(0)," " S %=2 D YN^LRU I %=1 D AD
 I '$O(^LRO(69.2,LRAA,LRAPX(1),0)) W $C(7),!!,"NO ",$S(LRAPX(1)=2:"FINAL",1:"PRELIMINARY")," REPORTS CURRRENTLY ON THE PRINT QUEUE" S %=0 Q
 I LRAPX(1)=2 W !!,"Print SNOMED &/or ICD codes on final report(s) " S %=2 D YN^LRU Q:%<1  I %=1 S LRS(99)=1
 Q
AD D XR^LRU S LRY=$E(LRAD,1,3),LRY(1)=LRY+1700 I '$O(^LR(LRXREF,LRY,LRABV,0)) W $C(7),!,"No accessions for ",LRY(1) Q
ACC W !!,"Select ",LRO(68)," accession number: " R X:DTIME Q:X=""!(X[U)  I +X'=X W $C(7),!,"Enter NUMBERS only." G ACC
 I '$O(^LR(LRXREF,LRY,LRABV,X,0)) W $C(7),!,"Accession number doesn't exist for ",LRY(1) G ACC
 ;S LRDFN=$O(^LR(LRXREF,LRY,LRABV,X,0)),LRI=$O(^(LRDFN,0)),LRAN=X,X=^LR(LRDFN,0) D ^LRUP W !,LRP,"  ID: ",SSN
 S LRDFN=$O(^LR(LRXREF,LRY,LRABV,X,0)),LRI=$O(^(LRDFN,0)),LRAN=X,X=^LR(LRDFN,0) D ^LRUP W !,LRP,"  ID: ",HRCN  ;IHS/ANMC/CLS 08/18/96
 I $D(^LRO(69.2,LRAA,LRAPX(1),LRAN,0)) D DEL G ACC
 I LRAPX(1)=2,'$P(^LR(LRDFN,LRSS,LRI,0),"^",3) W $C(7),!,LRO(68)," Accession ",LRAN," for ",LRH(0),!,"does not have a complete date." G ACC
 W !!,"Add ",LRO(68)," accession ",LRAN," for ",LRY(1)," to",!,$S(LRAPX(1)=2:"final",1:"preliminary")," rpt print queue " S %=2 D YN^LRU D:%=1 ADD G ACC
 ;
DEL W !!,"Delete ",LRO(68)," accession ",LRAN," for ",LRY(1),!,"from ",$S(LRAPX(1)=2:"final",1:"preliminary")," rpt print queue " S %=2 D YN^LRU Q:%'=1
 K ^LRO(69.2,LRAA,LRAPX(1),LRAN) L +^LRO(69.2,LRAA,LRAPX(1)) S X=^LRO(69.2,LRAA,LRAPX(1),0),X(1)=$O(^(0)),^(0)=$P(X,"^",1,2)_"^"_X(1)_"^"_($P(X,"^",4)-1) L -^LRO(69.2,LRAA,LRAPX(1)) Q
 ;
ADD S ^LRO(69.2,LRAA,LRAPX(1),LRAN,0)=LRDFN_"^"_LRI_"^"_LRH(0) L +^LRO(69.2,LRAA,LRAPX(1)) S X=^LRO(69.2,LRAA,LRAPX(1),0),^(0)=$P(X,"^",1,2)_"^"_LRAN_"^"_($P(X,"^",4)+1) L -^LRO(69.2,LRAA,LRAPX(1)) Q
