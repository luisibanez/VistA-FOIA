LRAPT3 ; IHS/DIR/FJE - AUTOPSY RPT PRINT COND(1)'T 9/13/89 13:46 ;
 ;;5.2;LR;;NOV 01, 1997
 ;
 ;;5.2;LAB SERVICE;**1**;Sep 27, 1994
 F A=0:0 S A=$O(^LR(LRDFN,"AY",A)) Q:'A!(LR("Q"))  S C=0 F F=0:1 S C=$O(^LR(LRDFN,"AY",A,5,C)) Q:'C!(LR("Q"))  S X=^(C,0),T=+^LR(LRDFN,"AY",A,0),T(1)=$S($D(^LAB(61,T,0)):$P(^(0),"^"),1:"") D SP
 Q:LR("Q")  W ! F A=0:0 S A=$O(^LR(LRDFN,80,A)) Q:'A!(LR("Q"))  D:$Y>(IOSL-6) FF Q:LR("Q")  S X=+^LR(LRDFN,80,A,0),X=^ICD9(X,0) W !,"ICD code: ",$P(X,"^"),?20 S X=$P(X,"^",3) D:LRS(5) C^LRUA W X
 Q
SP S Y=$P(X,"^",2),E=$P(X,"^",3),X=$P(X,"^")_":",A1=$P($P(LRAU("S"),X,2),";",1) D D^LRU S T(2)=Y D:$Y>(IOSL-6) FF Q:LR("Q")
 W:'F !!,T(1) W !,A1," ",E," Date: ",T(2) D E S B=0 F LRZ=0:1 S B=$O(^LR(LRDFN,"AY",A,5,C,1,B)) Q:'B!(LR("Q"))  D:$Y>(IOSL-6) FF Q:LR("Q")  S X=^LR(LRDFN,"AY",A,5,C,1,B,0) D ^DIWP
 Q:LR("Q")  D:LRZ ^DIWW Q
E K ^UTILITY($J) S DIWR=IOM-10,DIWL=10,DIWF="W" Q
 ;
FF D H^LRAPT Q
