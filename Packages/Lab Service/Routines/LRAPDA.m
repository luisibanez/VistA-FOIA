LRAPDA ;AVAMC/REG/WTY - ANATOMIC PATH DATA ENTRY ;9/25/00 [ 04/11/2003  10:08 AM ]
 ;;5.2T9;LR;**1002,1003,1018**;Nov 17, 2004
 ;;5.2;LAB SERVICE;**72,73,91,121,248**;Sep 27, 1994
 ;
 ;Reference to ^%DT supported by IA #10003
 ;Reference to ^DIE supported by IA #10018
 ;Reference to ^VA(200 supported by IA #10060
 ;Reference to EN^DDIOL supported by IA #10142
 ;
 W !?20,LRO(68)," (",LRABV,")",!
 S:'$D(LRSOP) LRSOP=1 S:'$D(LRD(1)) LRD(1)="0"
 S:'$D(^LRO(69.2,LRAA,2,0)) ^(0)="^69.23A^0^0"
SEL K LR(1)
 I $D(LR(2)) D  G:%<1 END S:%=1 LR(1)=1
 .W !!,"Enter Etiology, Function, Procedure & Disease "
 .S %=2 D YN^LRU
AK ;from LRAPD1
 N CORRECT
 S:'$D(LRSFLG) LRSFLG=""
 W !!,"Data entry for ",LRH(0)," "
 S %=1 D YN^LRU G:%<1 END
 I %=2 D  G:Y<1 END S LRAD=$E(Y,1,3)_"0000",LRH(0)=$E(Y,1,3)+1700
 .S %DT="AE",%DT(0)="-N",%DT("A")="Enter YEAR: " D ^%DT K %DT
 I '$O(^LRO(68,LRAA,1,LRAD,1,0)) D  Q
 .W $C(7),!!,"NO ",LRO(68)," ACCESSIONS IN FILE FOR ",LRH(0),!!
W K X,Y,LR("CK")
 R !!,"Select Accession Number/Pt name: ",LRAN:DTIME
 G:LRAN=""!(LRAN[U) END
 I LRAN["?" D  G W
 .W !!,"Enter the year ",LRH(0)," ",LRO(68)," accession number to be "
 .W "updated"
 .W !,"or locate the accession by entering the patient name."
 I LRAN'?1N.N D PNAME G:LRAN<1 W D OE1^LR7OB63D,DIE,OERR^LR7OB63D G W
 D OE1^LR7OB63D,REST S:$D(DR(1))#2 DR=DR(1) D OERR^LR7OB63D G W
REST W "  for ",LRH(0)
 I '$D(^LRO(68,LRAA,1,LRAD,1,LRAN,0)) D  Q
 .W $C(7),!!,"Accession # ",LRAN," for ",LRH(0)," not in ",LRO(68),!!
 S X=^LRO(68,LRAA,1,LRAD,1,LRAN,0),LRLLOC=$P(X,"^",7),LRDFN=+X
 Q:'$D(^LR(LRDFN,0))  S X=^(0) D ^LRUP
 ;W !,LRP,"  ID: ",SSN
 ;----- BEGIN IHS MODIFICATIONS LR*5.2*1018
 W !,LRP,"  ID: ",HRCN  ;IHS/ANMC/CLS 08/18/96
 ;----- END IHS MODIFICATIONS
 S LRI=+$P($G(^LRO(68,LRAA,1,LRAD,1,LRAN,3)),"^",5)
 I LRSS'="AU",'$D(^LR(LRDFN,LRSS,LRI,0)) D  Q
 .W $C(7),!,"Inverse date missing or incorrect in Accession Area file "
 .W "for",!,LRO(68),"  Year: ",$E(LRAD,2,3),"  Accession: ",LRAN
 I "SPCYEM"[LRSS,$O(^LR(LRDFN,LRSS,LRI,.1,0)) D
 .W !,"Specimen(s):"
 .F X=0:0 S X=$O(^LR(LRDFN,LRSS,LRI,.1,X)) Q:'X  D
 ..W !,$P($G(^(X,0)),"^")
DIE I LRSS="AU" D AUE Q
 S X=^LR(LRDFN,LRSS,LRI,0)
 I LRSOP="A"!(LRSOP="G")!(LRSOP="B")!(LRSOP="M")&($P(X,"^",11)!($P(X,"^",15))) D  Q
 .W $C(7),!!,"Report verified.  Cannot edit with this option !"
 W ! S LRA=^LR(LRDFN,LRSS,LRI,0),LRRC=$P(LRA,"^",10)
 I LRCAPA,"SPCYEM"[LRSS D C^LRAPSWK
 S DIE="^LR(LRDFN,LRSS,",DA=LRI,DA(1)=LRDFN D CK^LRU Q:$D(LR("CK"))
 I LRSS="SP",LRSOP="B",$O(^LR(LRDFN,LRSS,LRI,1.3,0)) D
 .W $C(7),!!,"This accession has a FROZEN SECTION report."
 .W !,"Be sure 'FROZEN SECTION' is entered as a SNOMED code in the "
 .W "PROCEDURE field"
 .W !,"for the appropriate organ or tissue.",!!
 L +^LR(LRDFN,LRSS,DA):5 I '$T D  Q
 .S MSG="This record is locked by another user.  "
 .S MSG=MSG_"Please wait and try again."
 .D EN^DDIOL(MSG,"","!!") K MSG
 D ^DIE
 D:LRSFLG="S"&('$D(Y)) ^LRAPDSR D FRE^LRU
 L -^LR(LRDFN,LRSS,DA)
 I LRSOP="Z","CYSP"[LRSS,LRCAPA D S^LRAPR Q
 I LRCAPA,"SPCYEM"[LRSS,LRD(1)'="","MBA"[LRD(1) D C1^LRAPSWK
 I LRCAPA,"SPCYEM"[LRSS,LRSOP="G" D C1^LRAPSWK
 S X=$P(^LR(LRDFN,LRSS,LRI,0),"^",4)
 I X,$D(^VA(200,X,0)) S LR("TR")=$P(^(0),"^")
 I "CYEMSP"[LRSS,$D(LR(6)),LRSOP="G" Q:$D(^LRO(69.2,LRAA,1,LRAN,0))  D  Q
 .L +^LRO(69.2,LRAA,1):5 I '$T D  Q
 ..S MSG(1)="The preliminary reports queue is in use by another person."
 ..S MSG(1,"F")="!!"
 ..S MSG(2)="  You will need to add this accession to the queue later."
 ..D EN^DDIOL(.MSG) K MSG
 .S ^LRO(69.2,LRAA,1,LRAN,0)=LRDFN_"^"_LRI_"^"_LRH(0)
 .S X=^LRO(69.2,LRAA,1,0),^(0)=$P(X,"^",1,2)_"^"_LRAN_"^"_($P(X,"^",4)+1)
 .L -^LRO(69.2,LRAA,1)
 I "CYEMSP"[LRSS,$D(LR(7)),'$D(^LRO(69.2,LRAA,2,LRAN,0)) D
 .L +^LRO(69.2,LRAA,2):5 I '$T D  Q
 ..S MSG(1)="The final reports queue is in use by another person.  "
 ..S MSG(1,"F")="!!"
 ..S MSG(2)="You will need to add this accession to the queue later."
 ..D EN^DDIOL(.MSG) K MSG
 .S ^LRO(69.2,LRAA,2,LRAN,0)=LRDFN_"^"_LRI_"^"_LRH(0)
 .S X=^LRO(69.2,LRAA,2,0),^(0)=$P(X,"^",1,2)_"^"_LRAN_"^"_($P(X,"^",4)+1)
 .L -^LRO(69.2,LRAA,2)
 D:LRSOP="M"!(LRSOP="B") EN^LRSPGD
 Q
NM I X'["@"!(X["@"&(Y(Z)="")) D  Q
 .W $C(7),!?4,"ENTER WHOLE NUMBERS ONLY",! K X
 I Y(Z)'="" W $C(7),?40,"OK TO DELETE" S %=2 D YN^LRU I %'=1 K X Q
 S Y(Z)="" Q
 ;
AUE W !
 ;Not all of the autopsy fields are within the AU subscript.
 ;Therefore, we must lock the entire LRDFN.
 L +^LR(LRDFN):5 I '$T D  Q
 .S MSG="This record is locked by another user.  "
 .S MSG=MSG_"Please wait and try again."
 .D EN^DDIOL(MSG,"","!!") K MSG
 I LRSFLG'="S" D
 .S DIE="^LR(",DA=LRDFN
 .D ^DIE
 D:LRSFLG="S" ^LRAPDSR
 L -^LR(LRDFN)
 D:"BAP"[LRSOP AU
 D:LRSOP="R" R
 Q
AU I '$D(^LRO(69.2,LRAA,2,LRAN,0)) D
 .L +^LRO(69.2,LRAA,2):5 I '$T D  Q
 ..S MSG(1)="The final reports queue is in use by another person.  "
 ..S MSG(1,"F")="!!"
 ..S MSG(2)="You will need to add this accession to the queue later."
 ..D EN^DDIOL(.MSG) K MSG
 .S ^LRO(69.2,LRAA,2,LRAN,0)=LRDFN
 .S X=^LRO(69.2,LRAA,2,0),^(0)=$P(X,"^",1,2)_"^"_LRAN_"^"_($P(X,"^",4)+1)
 .L -^LRO(69.2,LRAA,2)
 D AU^LRSPGD
 Q
R I '$D(^LRO(69.2,LRAA,3,LRAN,0)) D
 .L +^LRO(69.2,LRAA,3):5 I '$T D  Q
 ..S MSG(1)="The interim reports queue is in use by another person.  "
 ..S MSG(1,"F")="!!"
 ..S MSG(2)="You will need to add this accession to the queue later."
 ..D EN^DDIOL(.MSG) K MSG
 .S ^LRO(69.2,LRAA,3,LRAN,0)=LRDFN
 .S X=^LRO(69.2,LRAA,3,0),^(0)=$P(X,"^",1,2)_"^"_LRAN_"^"_($P(X,"^",4)+1)
 .L -^LRO(69.2,LRAA,3)
 Q
PNAME ;Patient Name Lookup
 N LRPFLG            ;LRPFLG tells LRUPS to limit accessions to 
 S X=LRAN,LRPFLG=1   ;the chosen year.
 K LRAN,DIC,VADM,VAIN,VA
 S DFN=-1,DIC(0)="EQM",(LRX,LRDPF)=""
 D:'$D(LRLABKY) LABKEY^LRPARAM
 D DPA1^LRDPA
 I DFN=-1 S LRAN=-1 Q
 D I^LRUPS
 Q
 ;
END K LRSFLG
 D V^LRU
 Q
