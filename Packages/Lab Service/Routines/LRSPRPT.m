LRSPRPT ;AVAMC/REG/WTY - CY/EM/SP PATIENT RPT ;11/2/00 [ 04/14/2003  1:40 PM ]
 ;;5.2;LR;**1002,1018,1019**;MAR 25, 2005
 ;;5.2;LAB SERVICE;**1,72,248**;Sep 27, 1994
 ;
 ;Reference to ^VA(200 supported by IA #10060
 ;Reference to ^DIWP suppported by IA #10011
 ;Reference to ^DIWW suppported by IA #10029
 ;Reference to EN^DDIOL supported by IA #10142
 ;
 W !!?20,LRO(68)," FINAL PATIENT REPORTS"
 K LRSAV,LRAP,LRS(99)
 D EN2^LRUA
 G END^LRSPRPT1:LRAPX=2,SGL:LRAPX=3,CH:LRAPX=4
GETP D EN1^LRUPS Q:LRAN=-1
 G:$D(^LRO(69.2,LRAA,2,LRAN,0)) GETP
 L +^LRO(69.2,LRAA,2):5  I '$T D  G GETP
 .S MSG(1)="The final reports queue is in use by another person.  "
 .S MSG(1,"F")="!!"
 .S MSG(2)="You will need to add this accession to the queue later."
 .D EN^DDIOL(.MSG) K MSG
 S ^LRO(69.2,LRAA,2,LRAN,0)=LRDFN_"^"_LRI
 S X=^LRO(69.2,LRAA,2,0),^(0)=$P(X,"^",1,2)_"^"_LRAN_"^"_($P(X,"^",4)+1)
 L -^LRO(69.2,LRAA,2)
 G GETP
CH S LRAPX(1)=2 D EN^LRSPRPT2 Q:%<1  W !!,"Save final report list for reprinting " S %=2 D YN^LRU S:%=1 LRSAV=1
DEV ;from LRAPMOD
 S ZTRTN="QUE^LRSPRPT" D BEG^LRUTL G:POP!($D(ZTSK)) END
QUE U IO S LR(.21)=+$G(^LRO(69.2,LRAA,.2)),LR("DIWF")="W"
 S LRA=$S($D(^LRO(69.2,LRAA,0)):$P(^(0),U,9),1:1) S:LRA="" LRA=1
 D L^LRU,S^LRU,L1^LRU,SET^LRUA
 I $D(LRAP) S LRDFN=$P(LRAP,"^"),LRI=$P(LRAP,"^",2) D EN G LST
 F LRAN=0:0 S LRAN=$O(^LRO(69.2,LRAA,2,LRAN)) Q:'LRAN!(LR("Q"))  D
 .S X=^(LRAN,0),LRDFN=+X,LRI=$P(X,"^",2) D EN
LST K LRRMD,LRPMD,LRAP
 K:'$D(LRSAV) ^LRO(69.2,LRAA,2)
 S ^LRO(69.2,LRAA,2,0)="^69.23A^^0"
 I '$D(LR("Q")),$D(LR("F")),IOST?1"C".E D M^LRU W @IOF
 W:IOST'?1"C".E&($E(IOST,1,2)'="P-"!($D(LR("FORM")))) @IOF
 K LRSAV,LRV,LRW,LRZ
 D END^LRUTL,END
 Q
W W !,LR("%") Q
F D E S A=0 F LRZ=0:1 S A=$O(^LR(LRDFN,LRSS,LRI,LRV,A)) Q:'A!(LR("Q"))  D:$Y>(IOSL-13) F^LRAPF,^LRAPF Q:LR("Q")  S X=^LR(LRDFN,LRSS,LRI,LRV,A,0) D:X["|TOP|" TOP D ^DIWP
 Q:LR("Q")  D:LRZ ^DIWW Q
E K ^UTILITY($J)
 S DIWR=IOM-5,DIWL=5,DIWF=LR("DIWF")
 Q
 ;
EN ;from LRSPT
 S LR(.21)=+$G(^LRO(69.2,+$G(LRAA),.2))
 ;----- BEGIN IHS MODIFICATIONS LR*5.2*1019 -- Next line was not commented out
 ; K LRO Q:'$D(^LR(LRDFN,LRSS,LRI,0))  S LRQ=0 D ^LRUA,^LRAPF Q:LR("Q")  S LR("F")=1 W !,"Submitted by: ",LRW(5),?44,"Date obtained: ",LRTK D:LRA W
 ;----- END IHS MODIFICATIONS LR*5.2*1019
 ;----- BEGIN IHS MODIFICATIONS LR*5.2*1018
 K LRO Q:'$D(^LR(LRDFN,LRSS,LRI,0))  S LRQ=0 D ^LRUA,^LRAPF Q:LR("Q")  S LR("F")=1 W !,"Submitted by: ",LRW(5),?44,"Date obtained: ",LRTK D D D:LRA W  ;IHS/ANMC/CLS 08/18/96
 ;----- END IHS MODIFICATIONS
 W !,"Specimen (Received ",LRTK(1),"):" S LRV=.1 D A Q:LR("Q")
 D:LRA W W !,"Brief Clinical History:" S LRV=.2 D F Q:LR("Q")
 D:LRA W W !,"Preoperative Diagnosis:" S LRV=.3 D F Q:LR("Q")
 D:LRA W W !,"Operative Findings:" S LRV=.4 D F Q:LR("Q")
 D:LRA W W !,"Postoperative Diagnosis:" S LRV=.5 D F Q:LR("Q")
 W !?27,"Surgeon/physician: ",LRMD W:LRA !,LR("%1")
 D P^LRAPF D:LRA W
 W:LRRC="" !?20,"**** REPORT INCOMPLETE ****",!
 W ! W:LRRMD]"" ?31,$S(LRSS="SP":"Pathology Resident: ",LRSS="CY":"Screened by: ",LRSS="EM":"Prepared by: ",1:" "),LRRMD
 I $O(^LR(LRDFN,LRSS,LRI,1.3,0)) D:$Y>(IOSL-13) F^LRAPF,^LRAPF Q:LR("Q")  W !,LR(69.2,.13) I $P($G(^LR(LRDFN,LRSS,LRI,6,0)),U,4) S LR(0)=6 D ^LRSPRPTM
 S LRV=1.3 D F Q:LR("Q")
 I $O(^LR(LRDFN,LRSS,LRI,1,0)) D:$Y>(IOSL-13) F^LRAPF,^LRAPF Q:LR("Q")  W !,LR(69.2,.03) I $P($G(^LR(LRDFN,LRSS,LRI,7,0)),U,4) S LR(0)=7 D ^LRSPRPTM
 S LRV=1 D F Q:LR("Q")
 I $O(^LR(LRDFN,LRSS,LRI,1.1,0)) D:$Y>(IOSL-13) F^LRAPF,^LRAPF Q:LR("Q")  W !,LR(69.2,.04) I $P($G(^LR(LRDFN,LRSS,LRI,4,0)),"^",4) S LR(0)=4 D ^LRSPRPTM Q:LR("Q")
 S LRV=1.1 D F Q:LR("Q")
 I $O(^LR(LRDFN,LRSS,LRI,1.4,0)) D:$Y>(IOSL-13) F^LRAPF,^LRAPF Q:LR("Q")  W !,LR(69.2,.14) I $P($G(^LR(LRDFN,LRSS,LRI,5,0)),U,4) S LR(0)=5 D ^LRSPRPTM
 S LRV=1.4 D F Q:LR("Q")
 ;Supplementary Report
 I $O(^LR(LRDFN,LRSS,LRI,1.2,0)) D:LR(.21) F^LRAPF,^LRAPF Q:LR("Q")  D
 .D:$Y>(IOSL-13) F^LRAPF,^LRAPF Q:LR("Q")
 .W !,"Supplementary Report:"
 .F LRV=0:0 S LRV=$O(^LR(LRDFN,LRSS,LRI,1.2,LRV)) Q:'LRV!(LR("Q"))  D
 ..S X=^(LRV,0) D S
 D ^LRSPRPT1 Q:LR("Q")
 S LRO=1 D F^LRAPF
 Q
 ;----- BEGIN IHS MODIFICATIONS LR*5.2*1018
D ;comments 
 I LRSS'="AU" S LRC1=1 F Z=0:0 S Z=$O(^LR(LRDFN,LRSS,LRI,99,Z)) Q:'Z  W ! W:LRC1 "Comment: " W ?10,^LR(LRDFN,LRSS,LRI,99,Z,0)  ;IHS/ANMC/CLS 08/18/96
 Q  ;IHS/ANMC/CLS 08/18/96
 ;----- END IHS MODIFICATIONS
S S Y=+X,X=$P(X,U,2) D D^LRU
 W !?3,"Date: ",Y
 I $D(LR("R")),'X W " not verified" Q
 D:$Y>(IOSL-13) F^LRAPF,^LRAPF Q:LR("Q")
 D:$P($G(^LR(LRDFN,LRSS,LRI,1.2,LRV,2,0)),U,4) SUPA
 D E S B=0
 F LRZ=0:1 S B=$O(^LR(LRDFN,LRSS,LRI,1.2,LRV,1,B)) Q:'B!(LR("Q"))  D
 .D:$Y>(IOSL-14) F^LRAPF,^LRAPF Q:LR("Q")
 .S DIWF="W"
 .S X=^LR(LRDFN,LRSS,LRI,1.2,LRV,1,B,0) D ^DIWP Q:LR("Q")
 Q:LR("Q")
 D:LRZ ^DIWW
 Q
SGL S LRAPX(1)="" D EN1^LRUPS Q:LRAN=-1  I '$P(^LR(LRDFN,LRSS,LRI,0),"^",11) W $C(7)," Sorry, report not verified.",! G SGL
 S LRAP=LRDFN_"^"_LRI,LRSAV=1 D EN2^LRUA W !!,"Print SNOMED &/or ICD codes on report " S %=2 D YN^LRU Q:%<1  I %=1 S LRS(99)=1
 G DEV
A F A=0:0 S A=$O(^LR(LRDFN,LRSS,LRI,LRV,A)) Q:'A!(LR("Q"))  D:$Y>(IOSL-13) F^LRAPF,^LRAPF Q:LR("Q")  W !,$P(^LR(LRDFN,LRSS,LRI,LRV,A,0),"^")
 Q
TOP S Z=$P(X,"|TOP|",1)_$P(X,"|TOP|",2) D F^LRAPF,^LRAPF S X=Z
 Q
SUPA ;Print supplementary report audit information
 W !?28,"*** MODIFIED REPORT ***",!,"(Last modified: "
 S B=0 F A=0:0 S A=$O(^LR(LRDFN,LRSS,LRI,1.2,LRV,2,A)) Q:'A!(LR("Q"))  D
 .S B=A
 Q:LR("Q")
 Q:'$D(^LR(LRDFN,LRSS,LRI,1.2,LRV,2,B,0))  S A=^(0)
 S Y=+A,A=$P(A,"^",2),A=$S($D(^VA(200,A,0)):$P(^(0),"^"),1:A)
 D D^LRU W Y," typed by ",A,")"
 D:$D(LRQ(9)) SUPM
 Q
SUPM ;Print previous versions of supplementary reports
 ;This is used by menu option 'Print path modifications [LRAPMOD]'
 ;
 F A=0:0 S A=$O(^LR(LRDFN,LRSS,LRI,1.2,LRV,2,A)) Q:'A!(LR("Q"))  D
 .S LRT=^LR(LRDFN,LRSS,LRI,1.2,LRV,2,A,0)
 .D:$Y>(IOSL-13) F^LRAPF,^LRAPF Q:LR("Q")
 .S Y=+LRT,X=$P(LRT,"^",2),X=$S($D(^VA(200,X,0)):$P(^(0),"^"),1:X)
 .D D^LRU W !,"Date modified:",Y," typed by ",X
 .K ^UTILITY($J)
 .S DIWR=IOM-5,DIWL=5,DIWF="W"
 .S B=0
 .F LRZ=0:1 S B=$O(^LR(LRDFN,LRSS,LRI,1.2,LRV,2,A,1,B)) Q:'B!(LR("Q"))  D
 ..S LRT=^LR(LRDFN,LRSS,LRI,1.2,LRV,2,A,1,B,0)
 ..D:$Y>(IOSL-13) F^LRAPF,^LRAPF Q:LR("Q")
 ..S X=LRT D ^DIWP
 .Q:LR("Q")  D:LRZ ^DIWW
 Q:LR("Q")
 W !?13,"==========Text below appears on final report=========="
 Q
END ;
 D V^LRU
 Q
