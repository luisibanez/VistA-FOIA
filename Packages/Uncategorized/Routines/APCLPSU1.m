APCLPSU1 ; IHS/CMI/LAB - Suicide Form data element tally ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;
 ;
START ;
 W:$D(IOF) @IOF
 D EOJ
 W:$D(IOF) @IOF
 W !!,"IHS Aggregated Data from Suicide Reporting Forms"
 W !!,"This report will tally the data items specific to the Suicide Reporting form ",!,"for a date range and community specified by the user.",!
 W !
GETDATES ;
BD ;
 S DIR(0)="D^::EP",DIR("A")="Enter Beginning Date of Suicide Act",DIR("?")="Enter the beginning date of suicide act for the search." D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 G:$D(DIRUT) EOJ
 S APCLBD=Y
ED ;
 S DIR(0)="DA^::EP",DIR("A")="Enter Ending Date of Suicide Act:  " D ^DIR K DIR,DA S:$D(DUOUT) DIRUT=1
 G:$D(DIRUT) EOJ
 I Y<APCLBD W !,"Ending date must be greater than or equal to beginning date!" G ED
 S APCLED=Y
 S X1=APCLBD,X2=-1 D C^%DTC S APCLSD=X
COMM ;
 K APCLCOMM
 S DIR(0)="S^O:One particular Community;A:All Communities",DIR("A")="Report on Suicide Forms for Suicide Acts that occurred in",DIR("B")="O" K DA D ^DIR K DIR
 G:$D(DIRUT) GETDATES
 I Y="A" W !!,"All communities will be included in the report.",! G ZIS
 I Y="O" D  G:'$D(APCLCOMM) COMM G:$D(APCLCOMM) ZIS I 1
 .S DIC="^AUTTCOM(",DIC(0)="AEMQ",DIC("A")="Which COMMUNITY: " D ^DIC K DIC
 .Q:Y=-1
 .S APCLCOMM(+Y)=""
 S X="COMMUNITY",DIC="^AMQQ(5,",DIC(0)="FM",DIC("S")="I $P(^(0),U,14)" D ^DIC K DIC,DA I Y=-1 W "OOPS - QMAN NOT CURRENT - QUITTING" G GETDATES
 D PEP^AMQQGTX0(+Y,"APCLCOMM(")
 I '$D(APCLCOMM) G COMM
 I $D(APCLCOMM("*")) K APCLCOMM
ZIS ;
DEMO ;
 D DEMOCHK^APCLUTL(.APCLDEMO)
 I APCLDEMO=-1 G COMM
 S DIR(0)="S^P:PRINT Output;B:BROWSE Output on Screen",DIR("A")="Do you wish to ",DIR("B")="P" K DA D ^DIR K DIR
 I $D(DIRUT) G EOJ
 I $G(Y)="B" D BROWSE,EOJ Q
 W !! S XBRP="PRINT^APCLPSU1",XBRC="PROC^APCLPSU1",XBNS="APCL",XBRX="EOJ^APCLPSU1"
 D ^XBDBQUE
 D EOJ
 Q
BROWSE ;
 S XBRP="VIEWR^XBLM(""PRINT^APCLPSU1"")"
 S XBNS="APCL",XBRC="PROC^APCLPSU1",XBRX="EOJ^APCLPSU1",XBIOP=0 D ^XBDBQUE
 Q
 ;
PAUSE ; 
 S DIR(0)="E",DIR("A")="Press return to continue or '^' to quit" D ^DIR K DIR,DA
 S:$D(DIRUT) APCLQUIT=1
 W:$D(IOF) @IOF
 Q
EOJ ;
 D EN^XBVK("APCL")
 K L,M,S,T,X,X1,X2,Y,Z,B
 D KILL^AUPNPAT
 D ^XBFMK
 Q
PROC ;EP
 S APCLJ=$J,APCLH=$H
 K ^XTMP("APCLPSU1",APCLJ,APCLH)
 D XTMP("APCLPSU1","APCL - SUICIDE")
V ; Run by visit date
 K APCLTOT,APCLIA,APCLCS S APCLTOT=0,APCLIA=0,APCLCS=0
 F  S APCLSD=$O(^AMHPSUIC("AD",APCLSD)) Q:APCLSD=""!((APCLSD\1)>APCLED)  D V1
 Q
 ;
V1 ;
 S APCLVDFN="" F  S APCLVDFN=$O(^AMHPSUIC("AD",APCLSD,APCLVDFN)) Q:APCLVDFN'=+APCLVDFN  D
 .Q:$$DEMO^APCLUTL($P(^AMHPSUIC(APCLVDFN,0),U,4),$G(APCLDEMO))
 .S APCLTOT=APCLTOT+1
 .S APCLSUC=$P(^AMHPSUIC(APCLVDFN,0),U,7) I APCLSUC,$D(APCLCOMM),'$D(APCLCOMM(APCLSUC)) Q
 .S A=$$VAL^XBDIQ1(9002011.65,APCLVDFN,.043)
 .S APCLAGEG=$S(A<0:" 0-0",A>0&(A<5):"1-4",A>4&(A<15):"5-14",A>14&(A<20):"15-19",A>19&(A<25):"20-24",A>24&(A<45):"25-44",A>44&(A<65):"45-64",A>64&(A<199):"65-125",1:"OTHER")
 .S APCLTOT(APCLAGEG)=$G(APCLTOT(APCLAGEG))+1
 .;tally each date element
 .S APCLC=0 F APCLX=.13,.032,.03,.041,.05,.044,.045,.08,.11 D
 ..S APCLC=APCLC+1
 ..S X=$$VAL^XBDIQ1(9002011.65,APCLVDFN,APCLX),Y=$$VALI^XBDIQ1(9002011.65,APCLVDFN,APCLX) I Y="" S Y=X
 ..S:Y="" Y="ZZZZZ" S:X="" X="DATA NOT ENTERED" S ^(X)=$S($D(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","AGE",APCLAGEG,APCLC,Y,X)):^(X)+1,1:1),^(X)=$S($D(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","TOTAL",APCLC,Y,X)):^(X)+1,1:1)
 .;method 10
 .S APCLC=10 S Z=0 F  S Z=$O(^AMHPSUIC(APCLVDFN,11,Z)) Q:Z'=+Z  D
 ..S Y=$P(^AMHPSUIC(APCLVDFN,11,Z,0),U),X=$$EXTSET^XBFUNC(9002011.6511,.01,Y)
 ..S:Y="" Y="ZZZZZ" S:X="" X="DATA NOT ENTERED" S ^(X)=$S($D(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","AGE",APCLAGEG,APCLC,Y,X)):^(X)+1,1:1),^(X)=$S($D(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","TOTAL",APCLC,Y,X)):^(X)+1,1:1)
 .S APCLC=11,X=$$VAL^XBDIQ1(9002011.65,APCLVDFN,.14),Y=$$VALI^XBDIQ1(9002011.65,APCLVDFN,.14)
 .S:Y="" Y="ZZZZZ" S:X="" X="DATA NOT ENTERED" S ^(X)=$S($D(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","AGE",APCLAGEG,APCLC,Y,X)):^(X)+1,1:1),^(X)=$S($D(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","TOTAL",APCLC,Y,X)):^(X)+1,1:1)
 .;sub use 12
 .S APCLC=12 S Y=$P(^AMHPSUIC(APCLVDFN,0),U,26),X=$$EXTSET^XBFUNC(9002011.65,.26,Y)
 .S:Y="" Y="ZZZZZ" S:X="" X="DATA NOT ENTERED" S ^(X)=$S($D(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","AGE",APCLAGEG,APCLC,Y,X)):^(X)+1,1:1),^(X)=$S($D(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","TOTAL",APCLC,Y,X)):^(X)+1,1:1)
 .S APCLC=13,X=$$VAL^XBDIQ1(9002011.65,APCLVDFN,.15),Y=$$VALI^XBDIQ1(9002011.65,APCLVDFN,.15)
 .S:Y="" Y="ZZZZZ" S:X="" X="DATA NOT ENTERED" S ^(X)=$S($D(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","AGE",APCLAGEG,APCLC,Y,X)):^(X)+1,1:1),^(X)=$S($D(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","TOTAL",APCLC,Y,X)):^(X)+1,1:1)
 .;cont fact 15
 .S APCLC=16 S Z=0 F  S Z=$O(^AMHPSUIC(APCLVDFN,13,Z)) Q:Z'=+Z  D
 ..S Y=$P(^AMHPSUIC(APCLVDFN,13,Z,0),U),Y=$P(^AMHTSCF(Y,0),U,2),X=$P(^AMHTSCF(Y,0),U,1)
 ..S:Y="" Y="ZZZZZ" S:X="" X="DATA NOT ENTERED" S ^(X)=$S($D(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","AGE",APCLAGEG,APCLC,Y,X)):^(X)+1,1:1),^(X)=$S($D(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","TOTAL",APCLC,Y,X)):^(X)+1,1:1)
 .S APCLC=15 S X=$$VAL^XBDIQ1(9002011.65,APCLVDFN,.25),Y=$$VALI^XBDIQ1(9002011.65,APCLVDFN,.25) D
 ..S:Y="" Y="ZZZZZ" S:X="" X="DATA NOT ENTERED" S ^(X)=$S($D(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","AGE",APCLAGEG,APCLC,Y,X)):^(X)+1,1:1),^(X)=$S($D(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","TOTAL",APCLC,Y,X)):^(X)+1,1:1)
 .S APCLC=14 S X=$$VAL^XBDIQ1(9002011.65,APCLVDFN,.24),Y=$$VALI^XBDIQ1(9002011.65,APCLVDFN,.24) D
 ..S:Y="" Y="ZZZZZ" S:X="" X="DATA NOT ENTERED" S ^(X)=$S($D(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","AGE",APCLAGEG,APCLC,Y,X)):^(X)+1,1:1),^(X)=$S($D(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","TOTAL",APCLC,Y,X)):^(X)+1,1:1)
 .Q
 Q
PRINT ;EP called from xbdbque
 S APCLPG=0
 K APCLQUIT
 I 'APCLTOT D HEAD W !!,"No Suicide Forms to Report"  G DONE
 S APCLAGEG="" F  S APCLAGEG=$O(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","AGE",APCLAGEG)) Q:APCLAGEG=""!($D(APCLQUIT))  D
 .D HEAD Q:$D(APCLQUIT)
 .W !,"Age Range: ",APCLAGEG," years",?30,"Total # of Suicide Forms: ",APCLTOT(APCLAGEG),!?63,"REPORT TOTALS"
 .S APCLV="" F  S APCLV=$O(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","AGE",APCLAGEG,APCLV)) Q:APCLV=""!($D(APCLQUIT))  D
 ..I $Y>(IOSL-6) D HEAD Q:$D(APCLQUIT)
 ..S APCLL=$P($T(@APCLV),";;",2) W !?1,$$LBLK(APCLL,28)
 ..S APCLY="" F  S APCLY=$O(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","AGE",APCLAGEG,APCLV,APCLY)) Q:APCLY=""!($D(APCLQUIT))  D
 ...S APCLX="" S APCLX=$O(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","AGE",APCLAGEG,APCLV,APCLY,APCLX)) Q:APCLX=""!($D(APCLQUIT))  D
 ....S X=^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","AGE",APCLAGEG,APCLV,APCLY,APCLX)
 ....W ?31,$E(APCLX,1,30),?63,$J(X,4) S T=APCLTOT(APCLAGEG) W ?72,$J(((X/T)*100),3,0)_"%",!
 ..Q
 .Q
 I $D(APCLQUIT) G DONE
 D HEAD Q:$D(APCLQUIT)
 W !,"Age Range: ","ALL AGES",?30,"Total # of Suicide Forms: ",APCLTOT,!?63,"REPORT TOTALS"
 S APCLV="" F  S APCLV=$O(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","TOTAL",APCLV)) Q:APCLV=""!($D(APCLQUIT))  D
 .I $Y>(IOSL-6) D HEAD Q:$D(APCLQUIT)
 .S APCLL=$P($T(@APCLV),";;",2) W !?1,$$LBLK(APCLL,28)
 .S APCLY="" F  S APCLY=$O(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","TOTAL",APCLV,APCLY)) Q:APCLY=""!($D(APCLQUIT))  D
 ..S APCLX="" S APCLX=$O(^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","TOTAL",APCLV,APCLY,APCLX)) Q:APCLX=""!($D(APCLQUIT))  D
 ...S X=^XTMP("APCLPSU1",APCLJ,APCLH,"TALLY","TOTAL",APCLV,APCLY,APCLX)
 ...W ?31,$E(APCLX,1,30),?63,$J(X,4) W ?72,$J(((X/APCLTOT)*100),3,0)_"%",!
 ..Q
 .Q
DONE ;
 I $E(IOST)="C",IO=IO(0) S DIR(0)="EO",DIR("A")="End of report.  PRESS RETURN" D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 K ^XTMP("APCLPSU1",APCLJ,APCLH)
 Q
HEAD ;EP
 G:'APCLPG HEAD1
 K DIR I $E(IOST)="C",IO=IO(0) W ! S DIR(0)="EO" D ^DIR K DIR I Y=0!(Y="^")!($D(DTOUT)) S APCLQUIT="" Q
HEAD1 ;
 W:$D(IOF) @IOF S APCLPG=APCLPG+1
 W !,$$LOC,?35,$$FMTE^XLFDT(DT),?70,"Page ",APCLPG,!
 S X="***** AGGREGATED DATA FROM SUICIDE REPORTING FORMS *****" W !,?((80-$L(X))/2),X,!
 S X="Act Occurred: "_$$FMTE^XLFDT(APCLBD)_" - "_$$FMTE^XLFDT(APCLED) W $$CTR(X),!
 S X="Community where Act Occurred: "_$S($D(APCLCOMM):$P(^AUTTCOM($O(APCLCOMM(0)),0),U),1:"ALL Communities") W $$CTR(X),!
 W $TR($J("",80)," ","-"),!
 Q
LBLK(V,L) ;left blank fill
 NEW %,I
 S %=$L(V),Z=L-% F I=1:1:Z S V=" "_V
 Q V
RBLK(V,L) ;EP right blank fill
 NEW %,I
 S %=$L(V),Z=L-% F I=1:1:Z S V=V_" "
 Q V
CTR(X,Y) ;EP - Center X in a field Y wide.
 Q $J("",$S($D(Y):Y,1:IOM)-$L(X)\2)_X
 ;----------
EOP ;EP - End of page.
 Q:$E(IOST)'="C"
 Q:$D(ZTQUEUED)!'(IOT="TRM")!$D(IO("S"))
 NEW DIR
 K DIRUT,DFOUT,DLOUT,DTOUT,DUOUT
 S DIR(0)="E" D ^DIR
 Q
 ;----------
USR() ;EP - Return name of current user from ^VA(200.
 Q $S($G(DUZ):$S($D(^VA(200,DUZ,0)):$P(^(0),U),1:"UNKNOWN"),1:"DUZ UNDEFINED OR 0")
 ;----------
LOC() ;EP - Return location name from file 4 based on DUZ(2).
 Q $S($G(DUZ(2)):$S($D(^DIC(4,DUZ(2),0)):$P(^(0),U),1:"UNKNOWN"),1:"DUZ(2) UNDEFINED OR 0")
 ;----------
XTMP(N,D) ;EP - set xtmp 0 node
 Q:$G(N)=""
 S ^XTMP(N,0)=$$FMADD^XLFDT(DT,14)_"^"_DT_"^"_$G(D)
 Q
 ;
LABEL ;
1 ;;Self Destructive Act:
2 ;;Event logged by Discipline:
3 ;;Event logged by Provider:
4 ;;Sex:
5 ;;Employed:
6 ;;Tribe of Enrollment:
7 ;;Community of Residence:
8 ;;Relationship:
9 ;;Education:
10 ;;Method:
11 ;;Previous Attempts:
12 ;;Substance Use Involved:
13 ;;Location of Act:
14 ;;Lethality:
15 ;;Disposition:
16 ;;Contributing Factors: