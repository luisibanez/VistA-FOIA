XQH5 ;SEA/AMF,JLI - HELP FRAME LISTER (CONTIN. XQH4) ;1/22/93  11:04 ; [ 04/02/2003   8:29 AM ]
 ;;8.0;KERNEL;**1002,1003,1004,1005,1007**;APR 1, 2003
 ;;8.0;KERNEL;;Jul 10, 1995
LIST ;
 U IO
 S XQHDR=$P(^TMP($J,"XQM","TOC",1),U,2),XQJ=^DIC(9.2,XQHDR,0),XQHDR=$P(XQJ,U,2) S:XQFMT=1 XQHDR=XQHDR_" ["_$P(XQJ,U,1)_"]"
 S XQPG=0,XQPG(0)="" D HDR S (XQTB,XQTB(0))=0,XQJ=1 F XQI=1:1 Q:'$D(^TMP($J,"XQM","TOC",XQI))!XQUI  D TOC
 I 'XQUI F XQPG=1:1 Q:'$D(^TMP($J,"XQM","PG",XQPG))  S XQPG(0)="" D NWPG Q:XQUI  S XQHY=^(XQPG) D TEXT I XQFMT>-1 D:'XQUI KEYW
 Q
TOC D:$Y+4>IOSL NWPG Q:XQUI  S XQSTR=^TMP($J,"XQM","TOC",XQI) S XQK=+XQSTR-XQJ,X=+XQSTR-1 S:X<0 X=0 S:XQK<0 XQTB=XQTB(X) S:XQK>0 XQTB=XQTB+(X*2),XQTB(X)=XQTB
 S XQJ=+XQSTR I XQK<0 F XQN=1:1:-XQK K XQJ(XQJ+XQN)
 S XQJ(XQJ)=$S('$D(XQJ(XQJ)):1,1:XQJ(XQJ)+1) W ! F XQN=1:1:XQJ-1 W XQJ(XQN),"."
 W $S(XQJ>0:XQJ(XQJ),1:" ")," " S XQII=$S($X<20:20,1:$X),XQN=^DIC(9.2,$P(XQSTR,U,2),0)
 S XQIJ=$P(XQN,U,2),XQIL=IOM-6-XQII,XQIJ=$S($L(XQIJ)'>XQIL:XQIJ,1:$E(XQIJ,1,XQIL)) W:$X<20 ?20 W XQIJ," ",$E(XQDOT,1,XQIL-$L(XQIJ)),?(IOM-4),$J(^TMP($J,"XQM",$P(XQSTR,U,2)),3) W:XQFMT=1 !?XQII,"  [",$P(XQN,U,1),"]" W !
 Q
TEXT ;
 S XQI=^DIC(9.2,XQHY,0),XQI=$P(XQI,U,2)_$S((XQFMT>0):" ["_$P(XQI,U,1)_"]",1:"") W !?(80-$L(XQI)\2),XQI,!?(80-$L(XQI)\2),$E(XQDSH,1,$L(XQI)),!
 S XQX=.002,XQPG(0)="a" F XQI=1:1 S XQX=$O(^DIC(9.2,XQHY,1,XQX)) Q:XQX=""  D:($Y+4)>IOSL NWPG Q:XQUI  W !,^(XQX,0)
 W ! Q
KEYW ;
 Q:'$D(^DIC(9.2,XQHY,2))  Q:'$P(^(2,0),U,3)  S XQS=0
 I $E(IOST,1)="C" S XQPG(0)="b" D NWPG Q:XQUI
 W !!,$E(XQDSH,1,79),!
 K XQKW S XQK=0 F XQJ=1:1 S XQK=$O(^DIC(9.2,XQHY,1,XQK)) Q:XQK=""  S XQJ=^(XQK,0) F XQL=1:1 S XQKW=$P($P(XQJ,"]",XQL),"[",2) Q:'$L(XQKW)  S XQKW(XQKW)=""
 W !!,"KEYWORD",?34,"RELATED FRAME" W ?75,"PAGE",!,$E(XQDSH,1,7),?34,$E(XQDSH,1,13) W ?75,$E(XQDSH,1,4) W !
 S XQJ=0 F XQK=1:1 S XQJ=$O(^DIC(9.2,XQHY,2,XQJ)) Q:XQJ'=+XQJ  S XQL=^(XQJ,0) D KEYW1
 S XQJ=0 F XQK=1:1 S XQJ=$O(XQKW(XQJ)) Q:XQJ'>0  W !,XQJ," **" S XQS=1
 I XQS W !!?3,"*  - KEYWORD MISSING FROM TEXT",!?3,"** - RELATED FRAME MISSING FROM LIST"
 Q
KEYW1 S XQKW=$P(XQL,U,1),XQL=$P(XQL,U,2) W !,XQKW
 W:'$D(XQKW(XQKW)) " *" S:'$D(XQKW(XQKW)) XQS=1 K XQKW(XQKW) I $L(XQL),$D(^DIC(9.2,XQL)) S XQK=^(XQL,0) W ?34,$P(XQK,U,2) W:XQFMT !?34,"[",$P(XQK,U,1),"]" W ?76,+^TMP($J,"XQM",XQL)
 Q
NWPG ;
 S:XQPG<1 XQPG=XQPG-1 I $E(IOST,1)="C" D CON S XQUI=(X="^") Q:XQUI
 D HDR Q
CON ;
 W !,"Press return to continue or '^' to escape " R X:DTIME S:'$T X=U
 Q
HDR ;
 W @IOF
 S Y=$P($H,",",2)\60,Y=(Y#60/100+(Y\60)/100+DT) D DT^DIO2
 W ?30,"HELP FRAME LISTING",?71 W $S(XQPG>0:"PAGE "_XQPG_XQPG(0),1:"    "_$E(XQRN,-XQPG*4+1,-XQPG*4+4)) W !!?(80-$L(XQHDR)\2),XQHDR,!
 I XQPG<1 W !?30,"TABLE OF CONTENTS",!?30,$E(XQDSH,1,17),!?75,"PAGE",!
 Q
