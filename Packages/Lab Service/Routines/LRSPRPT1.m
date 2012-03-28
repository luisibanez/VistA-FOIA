LRSPRPT1 ; IHS/DIR/FJE - SURG PATH RPT PRINT CONT. 7/15/93 15:19 ;
 ;;5.2;LR;;NOV 01, 1997
 ;
 ;;5.2;LAB SERVICE;**1**;Sep 27, 1994
 F A=0:0 S A=+$O(^LR(LRDFN,LRSS,LRI,2,A)) Q:'A!(LR("Q"))  S T=+^(A,0),X=$S($D(^LAB(61,T,0)):^(0),1:""),T(1)=$P(X,"^"),T(8)=$P(X,"^",2) D SP,T
 Q:LR("Q")  D:$D(LRS(99)) ^LRSPRPT2 Q:LR("Q")
 I $D(LRS(99)) W ! F A=0:0 S A=$O(^LR(LRDFN,LRSS,LRI,3,A)) Q:'A!(LR("Q"))  D:$Y>(IOSL-12) F Q:LR("Q")  S X=+^LR(LRDFN,LRSS,LRI,3,A,0),X=^ICD9(X,0),X(9)=$P(X,"^"),X=$P(X,"^",3) W !,"ICD code: ",X(9),?20 D:LR(69.2,.05) C^LRUA W X
 Q
SP F C=0:0 S C=$O(^LR(LRDFN,LRSS,LRI,2,A,5,C)) Q:'C!(LR("Q"))  S T(3)=^(C,0),Y=$P(T(3),"^",2),E=$P(T(3),"^",3),T(4)=$P(T(3),"^")_":",T(4)=$P($P(LR(LRSS),T(4),2),";",1) D D^LRU S T(2)=Y D:$Y>(IOSL-12) F Q:LR("Q")  D WP
 Q
WP W !!,T(4)," ",E," Date: ",T(2)," ",!,T(1),! D E S B=0 F LRZ=0:1 S B=$O(^LR(LRDFN,LRSS,LRI,2,A,5,C,1,B)) Q:'B!(LR("Q"))  D:$Y>(IOSL-12) F Q:LR("Q")  S X=^LR(LRDFN,LRSS,LRI,2,A,5,C,1,B,0) D ^DIWP
 Q:LR("Q")  D:LRZ ^DIWW Q
E K ^UTILITY($J) S DIWR=IOM-10,DIWL=10,DIWF="W" Q
 ;
T S T(3)=T,T(4)=61 D EN
 F M=0:0 S M=$O(^LR(LRDFN,LRSS,LRI,2,A,2,M)) Q:'M!(LR("Q"))  S T(3)=+^(M,0),T(4)=61.1 D EN F N=0:0 S N=$O(^LR(LRDFN,LRSS,LRI,2,A,2,M,1,N)) Q:'N!(LR("Q"))  S T(3)=+^(N,0),T(4)=61.2 D EN
 Q:LR("Q")  F M=0:0 S M=$O(^LR(LRDFN,LRSS,LRI,2,A,1,M)) Q:'M!(LR("Q"))  S T(3)=+^(M,0),T(4)=61.4 D EN
 Q:LR("Q")  F M=0:0 S M=$O(^LR(LRDFN,LRSS,LRI,2,A,3,M)) Q:'M!(LR("Q"))  S T(3)=+^(M,0),T(4)=61.3 D EN
 Q
EN ;also from LRAPT2
 F C(1)=0:0 S C(1)=$O(^LAB(T(4),T(3),"JR",C(1))) Q:'C(1)!(LR("Q"))  I $P(^(C(1),0),"^",7) S T(9)=^(0),T(5)=1 D L
 Q
L S X=$O(^LAB(T(4),T(3),"JR",C(1),1,0)) I X K T(5) F X=0:0 S X=$O(^LAB(T(4),T(3),"JR",C(1),1,X)) Q:'X  S Y=$P(^(X,0),"^") I Y=$E(T(8),1,$L(Y)) S T(5)=1 Q
 Q:'$D(T(5))  D:$Y>(IOSL-12) F Q:LR("Q")
 W !!,"Reference: ",!,$P(T(9),"^"),!,$P(T(9),"^",2),! W:$P(T(9),"^",3) $P(^LAB(95,$P(T(9),"^",3),0),"^"),"  vol.",$P(T(9),"^",4)," pg.",$P(T(9),"^",5) S Y=$P(T(9),"^",6) D D^LRU W "  Date: ",Y Q
F D F^LRAPF,^LRAPF Q
END W $C(7),!!,"OK TO DELETE THE ",LRAA(1)," FINAL REPORT LIST" S %=2 D YN^LRU I %=1 K ^LRO(69.2,LRAA,2) S ^LRO(69.2,LRAA,2,0)="^69.23A^0^0" W $C(7),!,"LIST DELETED !" Q
 W !!,"FINE, LET'S FORGET IT",! Q
