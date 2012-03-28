LRAPT2 ;AVAMC/REG/WTY - AUTOPSY PRT ;9/22/00
 ;;5.2T9;LR;**1,248,1018**;Nov 17, 2004
 ;
 ;Reference to ^VA(200 supported by IA #10060
 ;Reference to ^DD(63 supported by IA #999
 ;Reference to ^DIWP supported by IA #10011
 ;Reference to ^DIWW supported by IA #10029
 ;
 D FF S LR("F")=1 Q:LR("Q")
 I '$D(LRD("V")),'$P(^LR(LRDFN,"AU"),U,15) D  Q
 .W !!,"Report not verified."
 S O(2)=^LR(LRDFN,"AU"),X=$P(O(2),"^",8)_":"
 S LRLLOC=$P($P(LRAU("L"),X,2),";"),X=$P(O(2),"^",11)_":"
 S LRAU(3)=$P($P(LRAU("T"),X,2),";")
 S DA=LRDFN D D^LRAUAW S Y=LR(63,12) D D^LRU
 W !,"Acc #: ",$P(O(2),"^",6),?32,"AUTOPSY DATA"
 W ?52,"Age: ",$J($P(O(2),"^",9),3)
 W !,"Date/time Died",?52,"Date/time of Autopsy"
 W !,Y,?32,$E(LRAU(3),1,18)
 S Y=+O(2) D D^LRU W:Y'[1700 ?52,Y
 W ! S TAB=0 F X(1)=7,10 D
 .S Y=$P(O(2),"^",X(1)) Q:Y=""
 .S:$D(^VA(200,Y,0)) Y=$P(^(0),"^")
 .S:X(1)=10 Y=$E(Y,1,19),TAB=52
 .W ?TAB,$S(X(1)=7:"Resident: ",1:"Senior: "),Y
 K TAB
 I '$D(LRD("V")),$D(LR("AU1")),'$P(^LR(LRDFN,"AU"),U,15) D  Q
 .W !!,"Report not verified."
 W ! D EN
 D ^LRAPT3
 S A=0 F F=0:1 S A=$O(^LR(LRDFN,"AY",A)) Q:'A!(LR("Q"))  D
 .D:'F HD S (T(3),T)=+^(A,0),T=^LAB(61,T,0),T(8)=$P(T,"^",2)
 .D:$Y>(IOSL-6) FF,HD
 .W !,"T-",T(8),": " S T(4)=61,X=$P(T,"^")
 .D:$G(LRS(5)) C^LRUA
 .W X D EN^LRSPRPT1,M
 Q:LR("Q")!($D(LR("W")))
 W !
 I '$D(LRAURPT),$D(^LR(LRDFN,81)) W !,LRAU(1) S LRE=81 D  Q:LR("Q")
 .D F D:$Y>(IOSL-6) FF
 I '$D(LRAURPT),$D(^LR(LRDFN,82)) W !,LRAU(2) S LRE=82 D  Q:LR("Q")
 .D F D:$Y>(IOSL-6) FF
 Q
F D EE
 S A=0 F LRZ=0:1 S A=$O(^LR(LRDFN,LRE,A)) Q:'A!(LR("Q"))  D
 .S X=^LR(LRDFN,LRE,A,0) D ^DIWP
 Q:LR("Q")  D:LRZ ^DIWW Q
EE K ^UTILITY($J) S DIWR=IOM-5,DIWL=5,DIWF="W" Q
M F B=0:0 S B=$O(^LR(LRDFN,"AY",A,2,B)) Q:'B!(LR("Q"))  S (T(3),M)=+^(B,0),M=^LAB(61.1,M,0) D:$Y>(IOSL-6) FF,HD Q:LR("Q")  W !?5,"M-",$P(M,"^",2),": " S T(4)=61.1,X=$P(M,"^") D:$G(LRS(5)) C^LRUA W X D EN^LRSPRPT1,E
 F B=1.4,3.3,4.5 F C=0:0 S C=$O(^LR(LRDFN,"AY",A,$P(B,"."),C)) Q:'C!(LR("Q"))  S (T(3),M)=+^(C,0) D A
 Q
A S (E,T(4))="61."_$P(B,".",2),M=^LAB(E,M,0) D:$Y>(IOSL-6) FF,HD Q:LR("Q")  W !?5,$S(B=1.4:"D-",B=3.3:"F-",B=4.5:"P-",1:""),$P(M,"^",2),?12,": " S X=$P(M,"^") D:$G(LRS(5)) C^LRUA W X D EN^LRSPRPT1 Q
 ;
E F C=0:0 S C=$O(^LR(LRDFN,"AY",A,2,B,1,C)) Q:'C!(LR("Q"))  S (T(3),E)=+^(C,0),E=^LAB(61.2,E,0) D:$Y>(IOSL-6) FF,HD Q:LR("Q")  W !?10,"E-",$P(E,"^",2),": " S T(4)=61.2,X=$P(E,"^") D:$G(LRS(5)) C^LRUA W X
 D EN^LRSPRPT1 Q
HD Q:LR("Q")  W !!,"SNOMED code(s):" Q
EN ;from LRAPPF1
 K B
 I $D(^LR(LRDFN,"AW")) D
 .S X=^LR(LRDFN,"AW"),B(9)=$P(X,"^",9),B(1)=$P(X,"^",11,99)
 .W !,"Rt--Lung--Lt  Liver Spleen  Rt--Kidney--Lt  Brain  Body "
 .W "Wt(lb)    Ht(in)"
 I $D(B) D
 .W !,$J($P(X,"^",3),4),?8,$J($P(X,"^",4),4),?14,$J($P(X,"^",5),5)
 .W ?21,$J($P(X,"^",6),5),?28,$J($P(X,"^",7),4),?38,$J($P(X,"^",8),4)
 .W ?45,$J($P(X,"^",10),4),?55,$P(X,"^",2),?68,$P(X,"^")
 W !! W:$D(B) "Heart(gm)"
 I $D(^LR(LRDFN,"AV")) D
 .S X=^LR(LRDFN,"AV"),B(2)=$P(X,"^",7,99)
 .W ?12,"TV(cm)  PV(cm)  MV(cm)  AV(cm)  RV(cm)  LV(cm)"
 W ! W:$D(B(9)) $J(B(9),5)
 I $D(B(2)) D
 .W ?12,$J($P(X,"^"),4),?20,$J($P(X,"^",2),4),?28,$J($P(X,"^",3),4)
 .W ?36,$J($P(X,"^",4),4),?44,$J($P(X,"^",5),4),?52,$J($P(X,"^",6),4)
 .W !!,"Cavities(ml): Rt--Pleural--Lt  Pericardial  Peritoneal"
 .W !?14,$J($P(B(2),"^",2),4),?25,$J($P(B(2),"^"),4)
 .W ?33,$J($P(B(2),"^",3),4),?45,$J($P(B(2),"^",4),4)
 S DIC="^DD(63,",DIC(0)="Z"
 I $D(B(1)) F B=1:1:8 D
 .I $P(B(1),"^",B) S X="25."_B D
 ..D ^DIC Q:Y='1
 ..W !,Y(0,0)_": ",$P(B(1),"^",B)
 I $D(^LR(LRDFN,"AWI")) D
 .S Z=^LR(LRDFN,"AWI") F B=1:1:5 D
 ..I $P(Z,"^",B) S X=$S(B=1:25.9,1:25.9_(B-1)) D
 ...D ^DIC Q:Y=-1
 ...W !,Y(0,0),": ",$P(Z,"^",B)
 K DIC,X,Y,Z
 Q
FF D H1^LRAPT Q
