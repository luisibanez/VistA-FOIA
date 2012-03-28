AMHRL0 ; IHS/CMI/LAB - TUCSON-OHPRD/LAB - SCREEN LOGIC ;
 ;;4.0;IHS BEHAVIORAL HEALTH;;MAY 14, 2010
 ;
 ;
SELECT ;EP
 S AMHANS=Y,AMHC="" F AMHI=1:1 S AMHC=$P(AMHANS,",",AMHI) Q:AMHC=""  S AMHCRIT=AMHSEL(AMHC) D
 .S AMHTEXT=$P(^AMHSORT(AMHCRIT,0),U)
 .S AMHRAR=$P(^AMHSORT(AMHCRIT,0),U,6) K ^AMHTRPT(AMHRPT,11,AMHCRIT),^AMHTRPT(AMHRPT,11,"B",AMHCRIT)
 .W !!,AMHC,")  ",AMHTEXT," Selection."
 .I $P(^AMHSORT(AMHCRIT,0),U,2)]"" S AMHCNT=0,^AMHTRPT(AMHRPT,11,0)="^9002013.81101PA^0^0" D @$P(^AMHSORT(AMHCRIT,0),U,2) S DIK="^AMHTRPT(",DA=AMHRPT D IX1^DIK
 .I $P(^AMHSORT(AMHCRIT,0),U,13) S AMHRDTR=1
 .Q
 Q
PSELECT ;EP
 S AMHANS=Y,AMHC="" F AMHI=1:1 S AMHC=$P(AMHANS,",",AMHI) Q:AMHC=""  S AMHCRIT=AMHSEL(AMHC),AMHPCNT=AMHPCNT+1 D
 .S DIR(0)="N^2:80:0",DIR("A")="Enter Column width for "_$P(^AMHSORT(AMHCRIT,0),U)_" (suggested: "_$P(^AMHSORT(AMHCRIT,0),U,7)_")",DIR("B")=$P(^(0),U,7) D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 .I $D(DIRUT) S Y=$P(^AMHSORT(AMHCRIT,0),U,7)
 .S ^AMHTRPT(AMHRPT,12,0)="^9002013.81102PA^1^1"
 .I $D(^AMHTRPT(AMHRPT,12,"B",AMHCRIT)) S X=$O(^AMHTRPT(AMHRPT,12,"B",AMHCRIT,"")),AMHTCW=AMHTCW-$P(^AMHTRPT(AMHRPT,12,X,0),U,2)-2,^AMHTRPT(AMHRPT,12,X,0)=AMHCRIT_U_Y D  Q
 ..Q
 .S ^AMHTRPT(AMHRPT,12,AMHPCNT,0)=AMHCRIT_U_Y,^AMHTRPT(AMHRPT,12,"B",AMHCRIT,AMHPCNT)="",AMHTCW=AMHTCW+Y+2
 .W !!?15,"Total Report width (including column margins - 2 spaces):   ",AMHTCW
 .Q
 Q
Q ;EP
 K DIC,DIR
 K ^XTMP("AMHRL",$J,"QMAN"),^UTILITY("AMQQ TAX",$J)
 K DIC,X,Y,DD S X=$P(^AMHSORT(AMHCRIT,0),U,3),DIC="^AMQQ(5,",DIC(0)="EQXM",DIC("S")="I $P(^(0),U,14)" D ^DIC K DIC,DA,DINUM,DICR I Y=-1 W "OOPS - QMAN NOT CURRENT - QUITTING" Q
 S AMHQMAN=+Y
 D PEP^AMQQGTX0(AMHQMAN,"^XTMP(""AMHRL"",$J,""QMAN"",")
 I '$D(^XTMP("AMHRL",$J,"QMAN")) W !!,$C(7),"** No ",$P(^AMHSORT(AMHCRIT,0),U)," selected, all will be included." Q
 I $D(^XTMP("AMHRL",$J,"QMAN","*")) K ^XTMP("AMHRL",$J,"QMAN")
 S ^AMHTRPT(AMHRPT,11,AMHCRIT,0)=AMHCRIT,^AMHTRPT(AMHRPT,11,"B",AMHCRIT,AMHCRIT)=""
 S X="",Y=0 F  S X=$O(^XTMP("AMHRL",$J,"QMAN",X)) Q:X=""  S Y=Y+1,^AMHTRPT(AMHRPT,11,AMHCRIT,11,Y,0)=X,^AMHTRPT(AMHRPT,11,AMHCRIT,11,"B",X,Y)="",^AMHTRPT(AMHRPT,11,AMHCRIT,11,0)="^9002013.8110101A^"_Y_"^"_Y
 K X,Y,Z,AMHQMAN,V
 K ^XTMP("AMHRL",$J,"QMAN")
 Q
R ;EP
 K DIR,DIRUT,DUOUT,DTOUT,DA
 S DIR(0)=$P(^AMHSORT(AMHCRIT,0),U,4)_"O",DIR("A")="ENTER "_$P(^(0),U) D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 Q:$D(DIRUT)
 I Y="" Q
 I Y=-1 Q
 S ^AMHTRPT(AMHRPT,11,AMHCRIT,0)=AMHCRIT,^AMHTRPT(AMHRPT,11,"B",AMHCRIT,AMHCRIT)=""
 S AMHCNT=AMHCNT+1,^AMHTRPT(AMHRPT,11,AMHCRIT,11,AMHCNT,0)=$P(Y,U),^AMHTRPT(AMHRPT,11,AMHCRIT,11,"B",$P(Y,U),AMHCNT)="",^AMHTRPT(AMHRPT,11,AMHCRIT,11,0)="^9002013.8110101A^"_AMHCNT_"^"_AMHCNT
 G R
 Q
D ;DATE RANGE
BD ;get beginning date
 W ! S DIR(0)="D^::EP",DIR("A")="Enter beginning "_AMHTEXT_" for Search" D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 I $D(DIRUT) Q
 S AMHGDB=Y
ED ;get ending date
 W ! S DIR(0)="D^"_AMHGDB_"::EP",DIR("A")="Enter ending "_AMHTEXT_" for Search" S Y=AMHGDB D DD^%DT D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 I $D(DIRUT) G BD
 S AMHGDE=Y
 S X1=AMHGDB,X2=-1 D C^%DTC S AMHGDS=X
 ;
 S ^AMHTRPT(AMHRPT,11,AMHCRIT,0)=AMHCRIT,^AMHTRPT(AMHRPT,11,"B",AMHCRIT,AMHCRIT)=""
 S AMHCNT=0,^AMHTRPT(AMHRPT,11,AMHCRIT,11,AMHCNT,0)="^9002013.8110101A^1^1" S AMHCNT=AMHCNT+1,^AMHTRPT(AMHRPT,11,AMHCRIT,11,1,0)=AMHGDB_U_AMHGDE,^AMHTRPT(AMHRPT,11,AMHCRIT,11,"B",AMHGDB,AMHCNT)=""
 Q
N ;
 K Y
 K ^AMHTRPT(AMHRPT,11,AMHCRIT),^AMHTRPT(AMHRPT,11,"B",AMHCRIT)
 S DIR(0)="FO^1:7",DIR("A")="Enter a Range of numbers (e.g. 5-12,1-1)" D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 Q:$D(DIRUT)
 I Y="" W !!,"No numeric range entered.  All numerics will be included." Q
 I Y'?1.3N1"-"1.3N W !!,$C(7),$C(7),"Enter a numeric range in the format nnn-nnn.  E.g. 0-5, 0-99, 5-20." G N
 S ^AMHTRPT(AMHRPT,11,AMHCRIT,0)=AMHCRIT,^AMHTRPT(AMHRPT,11,"B",AMHCRIT,AMHCRIT)=""
 S AMHCNT=0,^AMHTRPT(AMHRPT,11,AMHCRIT,11,0)="^9002013.8110101A^1^1" F X=$P(Y,"-"):.1:$P(Y,"-",2) S AMHCNT=AMHCNT+1,^AMHTRPT(AMHRPT,11,AMHCRIT,11,AMHCNT,0)=X,^AMHTRPT(AMHRPT,11,AMHCRIT,11,"B",X,AMHCNT)=""  I AMHCNT>99999 W AMHBOMB
 S $P(^AMHTRPT(AMHRPT,11,AMHCRIT,11,1,0),U,2)=$P(Y,"-",2)
 Q
F ;FREE TEXT RANGE
 K ^AMHTRPT(AMHRPT,11,AMHCRIT),^AMHTRPT(AMHRPT,11,"B",AMHCRIT)
 S DIR(0)="FO^1:20",DIR("A")="Enter a Range of Characters for Search (e.g. A:B) " D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 I Y="" W !!,"No range entered.  All ",AMHTEXT,"  will be included." Q
 I Y'?1.ANP1":"1.ANP W !!,$C(7),$C(7),"Enter an free text range in the format AAA:AAA.  E.g. 94-01:94-200, CA:CZ, A:Z." G F
 S ^AMHTRPT(AMHRPT,11,AMHCRIT,0)=AMHCRIT,^AMHTRPT(AMHRPT,11,"B",AMHCRIT,AMHCRIT)=""
 S AMHCNT=0,^AMHTRPT(AMHRPT,11,AMHCRIT,11,AMHCNT,0)="^9002013.8110101A^1^1" S AMHCNT=AMHCNT+1,^AMHTRPT(AMHRPT,11,AMHCRIT,11,1,0)=$P(X,":")_U_$P(X,":",2),^AMHTRPT(AMHRPT,11,AMHCRIT,11,"B",$P(X,":"),AMHCNT)=""
 Q
Y ;
 D Y^AMHRL01
 Q
SPECIAL ;
 D SPECIAL^AMHRL01
 Q
