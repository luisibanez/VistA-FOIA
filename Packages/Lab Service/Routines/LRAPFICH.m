LRAPFICH ;AVAMC/REG/WTY - MICROFICH PATH REPORTS ;9/22/00
 ;;5.2T9;LR;**72,173,248,1018**;Nov 17, 2004
 ;
 ;Reference to ^%DT supported by IA #10003
 ;Reference to ^%ZIS supported by IA #10086
 ;Reference to HOME^%ZIS supported by IA #10086
 ;Reference to ^%ZTLOAD supported by IA #10063
 ;
 D END ;Final path reports by accession number
 W ! S LRDICS="SPCYEM" D ^LRAP G:'$D(Y) END
 S %DT("A")="Select Accession YEAR: ",%DT="AEQ" D ^%DT K %DT G:Y<1 END S LR("Y")=$E(Y,1,3)
A R !,"Start with accession #: ",X:DTIME G:X[U!(X="") END I X'?1N.N W $C(7),!,"Enter a number." G A
 S LR("B")=X
B R !,"Go      to accession #: ",X:DTIME G:X[U!(X="") END I X'?1N.N W $C(7),!,"Enter a number." G B
 S LR("E")=X I LR("E")<LR("B") S X=LR("B"),LR("B")=LR("E"),LR("E")=X
 S LR("B")=LR("B")-1
 D SETUP G:POP!($D(ZTSK)) END
QUE U IO S LR("DIWF")="W",(LR,LR("A"),LR(1),LR(2),LR(3))=0,(LRA,LRQ(3),LRS(99))=1 D L^LRU,S^LRU,XR^LRU,L1^LRU,EN2^LRUA,SET^LRUA
 F LRAN=LR("B"):0 S LRAN=$O(^LR(LRXREF,LR("Y"),LRABV,LRAN)) Q:'LRAN!(LRAN>LR("E"))!(LR("Q"))  S LRDFN=$O(^LR(LRXREF,LR("Y"),LRABV,LRAN,0)),LRI=$O(^(LRDFN,0)) D EN^LRSPRPT
 D:$D(LR("F"))&(IOST?1"C".E)&('LR("Q")) M^LRU
 D END^LRUTL,END Q
 ;
SETUP ;
 K IOP,ZTSK,%ZIS S %ZIS="Q" D ^%ZIS Q:POP!(IO(0)=IO)&('$D(IOCPU))
 I $D(IO("Q")) D
 .S ZTRTN="QUE^LRAPFICH",ZTIO=ION
 .S ZTDESC="Final path reports by accession #",ZTSAVE("*")="",ZTREQ="@"
 .D ^%ZTLOAD W:$D(ZTSK) !,"Report Queued to device ",ION K ZTIO
 .D HOME^%ZIS K ZTREQ,IO("Q")
 Q
END D V^LRU
 Q
