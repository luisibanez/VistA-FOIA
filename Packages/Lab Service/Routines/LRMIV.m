LRMIV ; IHS/DIR/FJE - MICROBIOLOGY VERIFY AUTO INST ROUTINE 4/24/89 14:41 ;
 ;;5.2;LR;**1013**;JUL 15, 2002
 ;
 ;;5.2;LAB SERVICE;;Sep 27, 1994
 ;from LRVR and option LRMIV
BEGIN S LREND=0,LRACC="",LRSS="MI" D ^LRPARAM,DATE
END ;from LRFAST,LRVER
 K %,A6,AGE,C,D,D0,D1,DA,DFN,DIC,DIE,DLAYGO,DOB,DTOUT,DUOUT,DX,I,II,J,K,LRAA,LRACC,LRAD,LRANOK,LRBUG,LRCAPOK,LRCDT,LRDFN,LRDPF,LREAL,LREND,LRFIFO,LRI,LRIDT,LRLLOC,LRMIDEF,LRMIOTH,LRNB,LRODA,LRODIE
 ;K LRODT,LRPTP,LRSAME,LRSB,LRSCREEN,LRSN,LRSPEC,LRSS,LRTEC,LRTS,LRTX,LRUNDO,LRWRD,N,PNM,POP,S,SEX,SSN,X,Y,Z
 K LRODT,LRPTP,LRSAME,LRSB,LRSCREEN,LRSN,LRSPEC,LRSS,LRTEC,LRTS,LRTX,LRUNDO,LRWRD,N,PNM,POP,S,SEX,SSN,HRCN,X,Y,Z  ;IHS/ANMC/CLS 08/18/96
 Q
DATE I '$D(LRLABKY) W !,$C(7),"YOU DO NOT HAVE VERIFY KEY.  CANNOT VERIFY",! Q
 S DIC="^LRO(68.2,",DIC(0)="AEMQZ" D ^DIC Q:Y'>0  S LRLL=+Y
 D ^LRMIU4 Q:LRAA<1  I $P(LRPARAM,U,14),$P($G(^LRO(68,LRAA,0)),U,16) D ^LRCAPV
 S DIC=60,DIC("S")="I $P(^(0),U,4)=""MI""",DIC(0)="AEMOQ",DIC("A")="Select TEST/PROCEDURE: " D ^DIC K DIC Q:$D(DUOUT)  S LRPTP=+Y
 I Y<1 W !,"None Preselected",!,"Accession # ",LRAN
 S (LRDFN,LRSS,LRIDT)=0 ;Added to prevent <UNDEF> in LRCAP if no accession selected
 S LRMIDEF=$P(^LAB(69.9,1,1),U,10),LRMIOTH=$P(^(1),U,11) D ^LRMIV1
 Q
UNDO ;from LRMIV2
 ;W:'$P(^LR(LRDFN,"MI",LRIDT,0),U,9) !,"Report is changed to 'AMENDED'",!
 S $P(^LR(LRDFN,"MI",LRIDT,0),U,9)=1,$P(^(0),U,3,4)=U,$P(^LRO(68,LRAA,1,LRAD,1,LRAN,3),U,4)="",$P(^LRO(68,LRAA,1,LRAD,1,+LRAN,4,LRTS,0),U,4,5)=DUZ_U_DT,^LRO(68,LRAA,1,LRAD,1,"AD",DT,+LRAN)="",^LRO(68,LRAA,1,LRAD,1,"AC",DT,+LRAN)=""
 Q
