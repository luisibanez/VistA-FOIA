LRAURPT ;AVAMC/REG/WTY - AUTOPSY RPT ;9/22/00 [ 04/11/2003  12:08 PM ]
 ;;5.2T9;LR;**1002,1003,1018**;Nov 17, 2004
 ;;5.2;LAB SERVICE;**1,72,173,248**;Sep 27, 1994
 ;
 ;Reference to ^DD(63 supported by IA #10155
 ;Reference to EN^DDIOL supported by IA #10142
 ;Reference to UPDATE^DIE supported by IA #2053
 ;Reference to ^DIK supported by IA #10013
 ;Reference to ^DIWP suppported by IA #10011
 ;Reference to ^DIWW suppported by IA #10029
 ;Reference to Y^DIQ suppported by IA #10004
 ;
 W !!,LRO(68)," Autopsy Protocols" D XR^LRU,EN2^LRUA S LRD("V")=""
 G END:LRAPX=2,SGL:LRAPX=3,CH:LRAPX=4
 L +^LRO(69.2,LRAA,2):5 I '$T D EN^DDIOL("Someone else is building a print queue for this Accession Area","","$C(7),!!") Q
GETP ;Add a patient to the report queue
 W ! S X="" D ^LRUPS G GETP:LRAN["?" I LRAN=-1 L -^LRO(69.2,LRAA,2) Q
 G:$D(^LRO(69.2,LRAA,2,LRAN,0)) GETP
 S FDAIEN(2)=LRAN
 S FDA(2,69.23,"+2,"_+LRAA_",",.01)=LRDFN
 D UPDATE^DIE("","FDA(2)","FDAIEN") K FDAIEN G GETP
CH I '$O(^LRO(69.2,LRAA,2,0)) W $C(7),!!,"No AUTOPSY PROTOCOLS currently on the print queue.",!! Q
SPC R !,"(D)ouble or (S)ingle spacing of report(s): ",X:DTIME Q:X=""!(X[U)  I $E(X)'="D"&($E(X)'="S") W $C(7),!,"Enter 'S' for single or 'D' for double spacing of reports" G SPC
 S LRS=$S(X="D":"D",1:"")_"W" W !!,"Print weights, measures and coding (if present): " S %=1 D YN^LRU Q:%<1  S:%=1 LRD=1
 Q:LRAPX=3  W !!,"Save protocol list for reprinting " S %=2 D YN^LRU S:%=1 LRSAV=1
DEV S ZTRTN="QUE^LRAURPT" D BEG^LRUTL Q:POP!($D(ZTSK))
QUE U IO D L^LRU,S^LRU,EN^LRUA
 S LR(.21)=+$G(^LRO(69.2,LRAA,.2)),(LRS(5),LRAURPT)=1
 I $D(LRAP) S LRDFN=LRAP D EN K LRAP G LST
 F LRAN=0:0 S LRAN=$O(^LRO(69.2,LRAA,2,LRAN)) Q:'LRAN!(LR("Q"))  S LRDFN=+^(LRAN,0) D EN
LST K:'$D(LRSAV) ^LRO(69.2,LRAA,2) K LRAURPT
 S:'$D(^LRO(69.2,LRAA,2,0)) ^(0)="^69.23A^0^0"
 I $D(LR("F")),IOST?1"C".E D:'LR("Q") M^LRU W @IOF
 W:IOST'?1"C".E&($E(IOST,1,2)'="P-"!($D(LR("FORM")))) @IOF
 K LRSAV D K^LRU
 D:'$D(LR("AU1")) END^LRUTL
 Q
W W !,LR("%") Q
F D E S A=0 F LRZ=0:1 S A=$O(^LR(LRDFN,LRV,A)) Q:'A!(LR("Q"))  D:$Y>(IOSL-10) FT,H Q:LR("Q")  S X=^LR(LRDFN,LRV,A,0) D:X["|TOP|" TOP D ^DIWP
 Q:LR("Q")  D:LRZ ^DIWW Q
E K ^UTILITY($J) S DIWR=IOM-5,DIWL=5,DIWF=LRS
 Q
 ;
EN S LRQ=0,X=^LR(LRDFN,0) D ^LRUP
 I '$D(^LR(LRDFN,"AU")) L +^LRO(69.2,LRAA,2,LRAN):5 Q:'$T  D  Q
 .S DIK="^LRO(69.2,LRAA,2,",DA=LRAN,DA(1)=0
 .D ^DIK K DA,DIK
 .L -^LRO(69.2,LRAA,2,LRAN)
 S X=^LR(LRDFN,"AU"),LRAC=$P(X,"^",6),LRM(2)=$P(X,"^",7)
 S LRM(1)=$P(X,"^",12),LRW(9)=$P(X,"^",13),LRM(3)=$P(X,"^",10)
 S Y=$P(X,"^"),LRH(2)=$E(Y,2,3) D D^LRU
 S LRH(1)=Y,Y=$P(X,"^",3) D D^LRU
 S LRH(3)=Y,Y=$P(X,"^",17) D D^LRU S LRH(17)=Y
 S LRLLOC=$P(X,"^",5),AGE=$P(X,"^",9)
 S Y=$P(X,"^",8),C=$P(^DD(63,14.5,0),U,3)
 D Y^DIQ S LRSVC=Y
 S Y=$P(X,"^",11),C=$P(^DD(63,13.7,0),U,3)
 D Y^DIQ S LRS(3)=Y
 S DA=LRDFN D D^LRAUAW S Y=LR(63,12) D D^LRU S LRH=Y,X=LRM(1)
 D:X D^LRUA S LRM(1)=X,X=LRM(2)
 D:X D^LRUA S LRM(2)=X,X=LRM(3)
 D:X D^LRUA S LRM(3)=X
 D H Q:LR("Q")  S LR("F")=1
 W:LRH(1)="" !?20,"**** REPORT INCOMPLETE ****",!
 W !!,LRAU(1),! S LRV=81 D F
 D:$Y>(IOSL-12) FT,H Q:LR("Q")  W !!,LR("%")
 W !,LRAU(2),! S LRV=82 D F
 I $O(^LR(LRDFN,84,0)),LR(.21) D FT,H Q:LR("Q")
 F LRA=0:0 S LRA=$O(^LR(LRDFN,84,LRA)) Q:'LRA!(LR("Q"))  D
 .S LRB=^LR(LRDFN,84,LRA,0) D:$Y>(IOSL-12) FT,H Q:LR("Q")
 .W !!,"SUPPLEMENTARY REPORT DATE: "
 .S Y=LRB D D^LRU W Y
 .D:$P($G(^LR(LRDFN,84,LRA,2,0)),U,4) SUPA^LRAPAUSR
 .D WRT
 Q:LR("Q")  D FT Q:LR("Q")  D:$G(LRD) ^LRAPT2,FT
 Q
WRT D E S LRC=0
 F LRZ=0:1 S LRC=$O(^LR(LRDFN,84,LRA,1,LRC)) Q:'LRC!(LR("Q"))  D
 .D:$Y>(IOSL-10) FT,H Q:LR("Q")
 .S X=^LR(LRDFN,84,LRA,1,LRC,0) D:X["|TOP|" TOP D ^DIWP
 Q:LR("Q")  D:LRZ ^DIWW Q
H Q:LR("Q")
 I $D(LR("F")),IOST?1"C".E D M^LRU Q:LR("Q")
 S LRQ=LRQ+1
 W:($D(LR("F"))) @IOF
 W !! D W
 W !?5,"CLINICAL RECORD |",?40,"AUTOPSY PROTOCOL",?73,"Pg ",LRQ
 W !,LR("%")
 W !,"Date died: ",LRH,?40,"| Autopsy date: ",LRH(1)
 W !,"Resident: ",LRM(2),?40,"| ",LRS(3)
 W ?56,"Autopsy No. ",$S(LRQ(8)]"":LRQ(8)_LRH(2)_" "_LRAC,1:LRAC)
 W !,LR("%")
 Q
FT F X=1:1 Q:$Y>(IOSL-12)  W !
 D W W !
 W:LRH(3)=""&(LRH(17)]"") ?55,"| Provisional Anatomic Dx"
 W !,"Pathologist: ",LRM(3),?52,LRW(9),?55,"| Date "
 W $E($S(LRH(3)]"":LRH(3),1:LRH(17)),1,12)
 D W W !,LRQ(1),?IOM-17,"AUTOPSY PROTOCOL"
 ;W !,"Patient: ",$E(LRP,1,30),?43,SSN,?56,"SEX:",SEX,?63,"DOB:",DOB
 ;W !,$E(LRLLOC,1,22),?23,"Physician: ",$E(LRM(1),1,28)
 ;W ?63,"AGE AT DEATH:",$J(AGE,3)
 ;----- BEGIN IHS MODIFICATIONS LR*5.2*1018
 W !,$E(LRP,1,30),?31,HRCN,?49,"SEX:",SEX,?55,"DOB:",DOB,!,LRLLOC,?31,LRM(1),?55,"AGE AT DEATH: ",AGE  ;IHS/DIR TUC/AAB 5/4/98
 ;----- END IHS MODIFICATIONS
 Q
SGL K LRD("V") S X="" D ^LRUPS G:LRAN="?" SGL Q:LRAN=-1
 I $D(LR("AU1")),'$P(^LR(LRDFN,"AU"),U,15) D  Q
 .W $C(7),!!,"Report not verified." S LR("AU1")=2
 I $D(LR("AU1")) S LRS="W",LRD=1
 E  D SPC Q:X=""!(X[U)
 S LRAP=LRDFN,LRSAV=1 D EN2^LRUA G DEV
END W $C(7),!!,"OK to delete the AUTOPSY PROTOCOL list " S %=2 D YN^LRU I %=1 K ^LRO(69.2,LRAA,2) S ^LRO(69.2,LRAA,2,0)="^69.23A^0^0" W $C(7),!,"LIST DELETED !",! Q
 W !!,"OK, LET'S FORGET IT.",! Q
TOP S Z=$P(X,"|TOP|",1)_$P(X,"|TOP|",2) D FT,H S X=Z Q
