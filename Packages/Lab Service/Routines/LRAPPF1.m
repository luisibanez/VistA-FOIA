LRAPPF1 ; IHS/DIR/AAB - ANAT PATH FILE PRINT BY PT 2/9/98 22:09 ; [ 07/08/1998 4:09 PM ]
 ;;5.2;LR;**1002,1003,1006**;SEP 01, 1998
 ;
 ;;5.2;LAB SERVICE;**72,173,201**;Sep 27, 1994
 F F=0:0 S F=$O(^TMP($J,F)) Q:'F!(LR("Q"))  S F(1)=$P(^DIC(F,0),"^"),F(2)=^DIC(F,0,"GL") K LR("F") D H S LR("F")=1 D W
 Q:LR("Q")  D ^LRAPPF2 Q
W S W=0 F LRB=0:0 S W=$O(^TMP($J,F,W)) Q:W=""!(LR("Q"))  D LR
 Q
LR F LRDFN=0:0 S LRDFN=$O(^TMP($J,F,W,LRDFN)) Q:'LRDFN!(LR("Q"))  D NM
 Q
NM ;S X=^LR(LRDFN,0),LRDPF=$P(X,U,2),N=$P(X,"^",3),N=@(F(2)_N_",0)"),LRP=$P(N,"^"),SSN=$P(N,"^",9),Y=$P(N,"^",3) D D^LRU,SSN^LRU S DOB=$S(Y'[1700:Y,1:"") D:$Y>(IOSL-4) H Q:LR("Q")  W !!,LRP,?31,SSN W:$L(DOB) ?51,"BORN: ",DOB
 S X=^LR(LRDFN,0),LRDPF=$P(X,U,2),(DFN,N)=$P(X,"^",3),N=@(F(2)_N_",0)"),LRP=$P(N,"^"),SSN=$P(N,"^",9),Y=$P(N,"^",3) D D^LRU,SSN^LRU S DOB=$S(Y'[1700:Y,1:"") D:$Y>(IOSL-4) H Q:LR("Q")  ;IHS/DIR TUC/AAB 5/4/98
 W !!,LRP,?31,HRCN W:$L(DOB) ?51,"BORN: ",DOB  ;IHS/DIR TUC/AAB 5/4/98
 F LRI=0:0 S LRI=$O(^TMP($J,F,W,LRDFN,LRI)) Q:'LRI!(LR("Q"))  D @($S("CYEMSP"[LRSS:"EN",1:"AUT"))
 Q
AUT D:$Y>(IOSL-12) H1 Q:LR("Q")  S X=^LR(LRDFN,"AU"),N=$P(X,"^",6),Y=+X D D^LRU S LRH(3)=Y,DA=LRDFN D D^LRAUAW S Y=LR(63,12) D D^LRU S E=Y,H(2)=$E(H(1),1,3)
 W !,"AUTOPSY #: ",N," AUTOPSY DATE: ",LRH(3),?51,"DIED: ",E
 D EN^LRAPT2
 F X=0:0 S X=$O(^LR(LRDFN,"AY",X)) Q:'X!(LR("Q"))  S Y=+^(X,0),Y=$S($D(^LAB(61,Y,0)):$P(^(0),"^"),1:Y) W !,Y D AM
 Q
AM F M=0:0 S M=$O(^LR(LRDFN,"AY",X,2,M)) Q:'M!(LR("Q"))  S Y=+^(M,0),Y=$S($D(^LAB(61.1,Y,0)):$P(^(0),"^"),1:Y) W !?5,Y
 Q
 ;
EN ;from LRAPT1,LRAPQACN
 S X=^LR(LRDFN,S,LRI,0),LR("PATH")=$P(X,U,2),N=$P(X,U,6),N(11)=$P(X,U,11),X=$P(X,U,10),X=$P(X,"."),LRH(3)=$$Y2K^LRX(X),H(2)=$E(X,1,3)
 I LR("PATH")]"" S LR("PATH")=$$EXTERNAL^DILFD(LRSF,.02,"",LR("PATH"),LR("PATH"))
 S:N="" N="?" S:'H(2) H(2)="?" D:$Y>(IOSL-4) H1 Q:LR("Q")
 W !?2,"Organ/tissue:",?17,"Date rec'd: ",LRH(3),?43,"Acc #:",N,?64,$E(LR("PATH"),1,12)
 I 'N(11) W !?5,"Report not verified." Q
 F O=0:0 S O=$O(^LR(LRDFN,S,LRI,2,O)) Q:'O!(LR("Q"))  D:$Y>(IOSL-4) H2 Q:LR("Q")  S X=^LR(LRDFN,S,LRI,2,O,0),W(3)=$P(X,"^",3),O(6)=$P(^LAB(61,+X,0),"^") W !?5,O(6) W:W(3) " ",W(3)," gm" D L
 I $D(LRQ(3)) F B=0:0 S B=$O(^LR(LRDFN,S,LRI,99,B)) Q:'B!(LR("Q"))  W !?5,$E(^(B,0),1,74)
 Q
L F B=0:0 S B=$O(^LR(LRDFN,S,LRI,2,O,3,B)) Q:'B!(LR("Q"))  S B(1)=+^(B,0) D:$Y>(IOSL-4) H3 Q:LR("Q")  W !?10,$P(^LAB(61.3,B(1),0),"^")
 F B=0:0 S B=$O(^LR(LRDFN,S,LRI,2,O,4,B)) Q:'B!(LR("Q"))  S X=^(B,0),B(1)=+X,B(2)=$P(X,"^",2) D:$Y>(IOSL-4) H3 Q:LR("Q")  W !?10,$P(^LAB(61.5,B(1),0),"^") W:B(2)]"" " (",$S(B(2)=0:"Negative",B(2)=1:"Positive",1:"?"),")"
 F B=0:0 S B=$O(^LR(LRDFN,S,LRI,2,O,1,B)) Q:'B!(LR("Q"))  S B(1)=+^(B,0) D:$Y>(IOSL-4) H3 Q:LR("Q")  W !?10,$P(^LAB(61.4,B(1),0),"^")
 F M=0:0 S M=$O(^LR(LRDFN,S,LRI,2,O,2,M)) Q:'M!(LR("Q"))  S M(1)=+^(M,0) D:$Y>(IOSL-4) H3 Q:LR("Q")  W !?10,$P(^LAB(61.1,M(1),0),"^") D E
 F E=0:0 S E=$O(^LR(LRDFN,S,LRI,2,O,5,E)) Q:'E!(LR("Q"))  S E(1)=^(E,0) D A
 Q
A S Y=$P(E(1),"^",2),E(3)=$P(E(1),"^",3),E(4)=$P(E(1),"^")_":",E(4)=$P($P(LR(S),E(4),2),";") D D^LRU S E(2)=Y D D^LRU D:$Y>(IOSL-12) H3 Q:LR("Q")  W !?5,E(4)," ",E(3)," Date: ",E(2) Q
 ;
E F E=0:0 S E=$O(^LR(LRDFN,S,LRI,2,O,2,M,1,E)) Q:'E!(LR("Q"))  W !?12,$P(^LAB(61.2,+^(E,0),0),"^")
 Q
H I $D(LR("F")),IOST?1"C".E D M^LRU Q:LR("Q")
 Q:$A(IOST)'=80  I $D(LRQ(2)) D H^LRSPT Q
 I $D(LRQ(9)) D H^LRAPT1 Q
 D F^LRU W !,LRO(68)," " W:F(2)'="^DPT(" !,"Demographic data in ",F(1)," file."
 W !,"Entries listed by PATIENT (From: ",LRSTR," to: ",LRLST,")",!,"Name",?31,"Identifier"
 W !,LR("%") Q
H1 ;Q:$A(IOST)'=80  D H W:'$D(LRQ(9)) !,LRP,?30,SSN,?42,DOB Q
 Q:$A(IOST)'=80  D H W:'$D(LRQ(9)) !,LRP,?30,HRCN,?42,DOB Q  ;IHS/DIR TUC/AAB 5/4/98
H2 Q:$A(IOST)'=80  D H1 W !?5,"Organ/tissue:",?25,"Date received: ",LRH(3),?51,"Acc #:",N Q
H3 Q:$A(IOST)'=80  D H2 W !?5,O(6) W:W(3) " ",W(3)," gm" Q
