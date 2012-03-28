AMHRPSP ; IHS/CMI/LAB - ;
 ;;4.0;IHS BEHAVIORAL HEALTH;;MAY 14, 2010
 ;
PRINT ;EP ;PRINT RECORD BY AGE/SEX
 S AMHR132S="",$P(AMHR132S,"-",132)=""
 D NOW^%DTC S Y=X D DD^%DT S AMHRDT=Y
 S AMHRPG=0,AMHSORT="",AMHRSEX=""
 K AMHQUIT
 I '$D(^XTMP("AMHRPS",AMHJOB,AMHBTH,"AGE")) D HEAD W !!,"No data to report.",! G DONE
 F  S AMHRSEX=$O(^XTMP("AMHRPS",AMHJOB,AMHBTH,"AGE",AMHRSEX)) Q:AMHRSEX=""!($D(AMHQUIT))  D SORT
DONE ;
 D DONE^AMHLEIN,^AMHEKL
 K ^XTMP("AMHRPS",AMHJOB,AMHBTH)
 Q
SORT ;
 I AMHRSEX="B" D HEAD Q:$D(AMHQUIT)  G SORT1
 I $Y>(IOSL-8) D HEAD Q:$D(AMHQUIT)  G SORT1
 W !! D HEAD2
SORT1 S AMHSORT=""
 F  S AMHSORT=$O(^XTMP("AMHRPS",AMHJOB,AMHBTH,"AGE",AMHRSEX,AMHSORT)) Q:AMHSORT=""!($D(AMHQUIT))  D
 .I $Y>(IOSL-5) D HEAD Q:$D(AMHQUIT)
 .S AMHSORTP=$O(^AMHPROB("B",AMHSORT,"")),AMHSORTP=AMHSORT_" - "_$P(^AMHPROB(AMHSORTP,0),U,2)
 .W !,$E(AMHSORTP,1,30) S AMHRSRT2=$O(^XTMP("AMHRAGS",AMHJOB,AMHBTH,"AGE",AMHRSEX,AMHSORT,"")) W ?32,$E(AMHRSRT2,1,9)
 .N I,J,K S J=39 F I=1:1:$L(AMHRBIN,";") S K=$S($D(^XTMP("AMHRPS",AMHJOB,AMHBTH,"AGE",AMHRSEX,AMHSORT,I)):^(I),1:".") W ?J,$J(K,6) S J=J+9
 .W ?J,$J(^XTMP("AMHRPS",AMHJOB,AMHBTH,"TOTAL SORT",AMHRSEX,AMHSORT),6)
 .Q
 Q:$D(AMHQUIT)
 I $Y>(IOSL-5) D HEAD Q:$D(AMHQUIT)
 S T=0 W !,"TOTAL:" S J=39 F I=1:1:$L(AMHRBIN,";") S K=$S($D(^XTMP("AMHRPS",AMHJOB,AMHBTH,"TOTAL",AMHRSEX,I)):^(I),1:".") W ?J,$J(K,6) S J=J+9,T=T+K
 W ?J,$J(T,6)
 Q
HEAD I 'AMHRPG G HEAD1
 I $E(IOST)="C",IO=IO(0) W ! S DIR(0)="EO" D ^DIR K DIR I Y=0!(Y="^")!($D(DTOUT)) S AMHQUIT="" Q
HEAD1 ;
 W:$D(IOF) @IOF S AMHRPG=AMHRPG+1
 W ?50,"BEHAVIORAL HEALTH",?100,AMHRDT,?123,"Page",AMHRPG,!
 S AMHRLENG=15+$L(AMHTITLE) W ?((132-AMHRLENG)/2),AMHTITLE," BY AGE AND SEX",!
 W ?46,"VISIT DATES:  ",AMHBDD,"  TO  ",AMHEDD,!
HEAD2 W !?61,"SEX: ",$S(AMHRSEX="M":"MALE",AMHRSEX="F":"FEMALE",1:"BOTH")
 W !,"PROB CODE NARRATIVE" S J=41 F I=1:1:$L(AMHRBIN,";") S K=$P(AMHRBIN,";",I) Q:K=""  W ?J,K S J=J+9
 W ?J,"TOTAL"
 W !,AMHR132S
 Q
 ;
LIST ;
 S %=AMHRBIN
 F I=1:1 S X=$P(%,";",I) Q:X=""  W !,$P(X,"-")," - ",$P(X,"-",2)
 W !
 Q
 ;
SETBIN ;
 S AMHRBIN="0-0;1-4;5-14;15-19;20-24;25-44;45-64;65-125"
 Q
