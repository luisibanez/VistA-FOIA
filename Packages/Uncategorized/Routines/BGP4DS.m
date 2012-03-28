BGP4DS ; IHS/CMI/LAB - IHS gpra print ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 Q:$G(BGPAREAA)
 Q:'$D(BGPLIST)
 S BGPQUIT="",BGPGPG=0
 S BGPL=0 F  S BGPL=$O(^XTMP("BGP4D",BGPJ,BGPH,"LIST",BGPL)) Q:BGPL'=+BGPL!(BGPQUIT)  D
 .S BGPCOUNT=0
 .D HEADER Q:BGPQUIT
 .S BGPCNT=BGPLIST(BGPL)
 .I BGPCNT<11!(BGPLIST'="R") S BGPCNT=1 G GO
 .I BGPCNT<100 S BGPCNT=BGPCNT\10 G GO
 .S BGPCNT=10
GO .;
 .W !,$P(^BGPINDF(BGPL,0),U,3),!
 .W !,"Denominator(s):"
 .S BGPX=0 F  S BGPX=$O(^BGPINDF(BGPL,61,"B",BGPX)) Q:BGPX'=+BGPX!(BGPQUIT)  D
 ..S BGPY=0 F  S BGPY=$O(^BGPINDF(BGPL,61,"B",BGPX,BGPY)) Q:BGPY'=+BGPY!(BGPQUIT)  D
 ...I $P(^BGPINDF(BGPL,61,BGPY,0),U,2)'[BGPRTYPE Q  ;not a denom def for this report
 ...S BGPZ=0 F  S BGPZ=$O(^BGPINDF(BGPL,61,BGPY,1,BGPZ)) Q:BGPZ'=+BGPZ!(BGPQUIT)  D
 ....I $Y>(IOSL-3) D HEADER^BGP4DPH Q:BGPQUIT
 ....W !,^BGPINDF(BGPL,61,BGPY,1,BGPZ,0)
 ....Q
 ...;W !
 ...Q
 ..Q
 .I $Y>(IOSL-3) D HEADER^BGP4DPH Q:BGPQUIT
 .W !!,"Numerator(s):"
 .S BGPX=0 F  S BGPX=$O(^BGPINDF(BGPL,62,"B",BGPX)) Q:BGPX'=+BGPX!(BGPQUIT)  D
 ..S BGPY=0 F  S BGPY=$O(^BGPINDF(BGPL,62,"B",BGPX,BGPY)) Q:BGPY'=+BGPY!(BGPQUIT)  D
 ...I $P(^BGPINDF(BGPL,62,BGPY,0),U,2)'[BGPRTYPE Q  ;not a denom def for this report
 ...S BGPZ=0 F  S BGPZ=$O(^BGPINDF(BGPL,62,BGPY,1,BGPZ)) Q:BGPZ'=+BGPZ!(BGPQUIT)  D
 ....I $Y>(IOSL-3) D HEADER^BGP4DPH Q:BGPQUIT
 ....W !,^BGPINDF(BGPL,62,BGPY,1,BGPZ,0)
 ....Q
 ...;W !
 ...Q
 ..Q
 .W ! S BGPX=0 F  S BGPX=$O(^BGPINDF(BGPL,11,BGPX)) Q:BGPX'=+BGPX  D
 ..I $Y>(IOSL-3) D HEADER^BGP4DPH Q:BGPQUIT
 ..W !,^BGPINDF(BGPL,11,BGPX,0)
 .W ! S BGPX=0 F  S BGPX=$O(^BGPINDF(BGPL,51,BGPX)) Q:BGPX'=+BGPX  D
 ..I $Y>(IOSL-3) D HEADER^BGP4DPH Q:BGPQUIT
 ..W !,^BGPINDF(BGPL,51,BGPX,0)
 .W ! S BGPX=0 F  S BGPX=$O(^BGPINDF(BGPL,52,BGPX)) Q:BGPX'=+BGPX  D
 ..I $Y>(IOSL-3) D HEADER^BGP4DPH Q:BGPQUIT
 ..W !,^BGPINDF(BGPL,52,BGPX,0)
 .W !!,$P(^BGPINDF(BGPL,0),U,5),!
 .D H1
 .S BGPCOM="" F  S BGPCOM=$O(^XTMP("BGP4D",BGPJ,BGPH,"LIST",BGPL,BGPCOM)) Q:BGPCOM=""!(BGPQUIT)  D
 ..S BGPSEX="" F  S BGPSEX=$O(^XTMP("BGP4D",BGPJ,BGPH,"LIST",BGPL,BGPCOM,BGPSEX)) Q:BGPSEX=""!(BGPQUIT)  D
 ...S BGPAGE="" F  S BGPAGE=$O(^XTMP("BGP4D",BGPJ,BGPH,"LIST",BGPL,BGPCOM,BGPSEX,BGPAGE)) Q:BGPAGE=""!(BGPQUIT)  D
 ....S DFN=0 F  S DFN=$O(^XTMP("BGP4D",BGPJ,BGPH,"LIST",BGPL,BGPCOM,BGPSEX,BGPAGE,DFN)) Q:DFN'=+DFN!(BGPQUIT)  S BGPCOUNT=BGPCOUNT+1 D PRINTL
 ....Q
 ...Q
 ..Q
 Q
PRINTL ;print one line
 Q:(BGPCOUNT#BGPCNT)
 I $Y>(IOSL-3) D HEADER Q:BGPQUIT  D
 .S X=0 F  S X=$O(^BGPINDF(BGPL,72,X)) Q:X'=+X  W !,^BGPINDF(BGPL,72,X,0)
 .D H1
 W !,$E($P(^DPT(DFN,0),U),1,22),?24,$$HRN^AUPNPAT(DFN,DUZ(2)),?31,$E(BGPCOM,1,14),?46,BGPSEX,?50,BGPAGE,?54,^XTMP("BGP4D",BGPJ,BGPH,"LIST",BGPL,BGPCOM,BGPSEX,BGPAGE,DFN)
 Q
 ;
HEADER ;EP
 G:'BGPGPG HEADER1
 K DIR I $E(IOST)="C",IO=IO(0),'$D(ZTQUEUED) W ! S DIR(0)="EO" D ^DIR K DIR I Y=0!(Y="^")!($D(DTOUT)) S BGPQUIT=1 Q
HEADER1 ;
 W:$D(IOF) @IOF S BGPGPG=BGPGPG+1
 W !,"***** CONFIDENTIAL PATIENT INFORMATION, COVERED BY THE PRIVACY ACT *****"
 W !?3,$P(^VA(200,DUZ,0),U,2),?35,$$FMTE^XLFDT(DT),?70,"Page ",BGPGPG,!
 W !,$$CTR("***  IHS FY04 Clinical Performance Indicator Patient List  ***",80),!
 W $$CTR($P(^DIC(4,DUZ(2),0),U),80),!
 S X="Reporting Period: "_$$FMTE^XLFDT(BGPBD)_" to "_$$FMTE^XLFDT(BGPED) W $$CTR(X,80),!
 W $$CTR($S(BGPLIST="A":"Entire Patient List",BGPLIST="R":"Random Patient List",1:"Patient List by Provider: "_BGPLPROV),80),!
 W !,$TR($J("",80)," ","-")
 Q
H1 ;
 W !,"UP=User Pop; AC=Active Clinical; AD=Active Diabetic; AAD=Active Adult Diabetic",!
 W !,"PATIENT NAME",?24,"HRN",?31,"COMMUNITY",?45,"SEX",?49,"AGE",?55,"VALUE"
 W !,$TR($J("",80)," ","-")
 Q
CTR(X,Y) ;EP - Center X in a field Y wide.
 Q $J("",$S($D(Y):Y,1:IOM)-$L(X)\2)_X
 ;----------
USR() ;EP - Return name of current user from ^VA(200.
 Q $S($G(DUZ):$S($D(^VA(200,DUZ,0)):$P(^(0),U),1:"UNKNOWN"),1:"DUZ UNDEFINED OR 0")
 ;----------
LOC() ;EP - Return location name from file 4 based on DUZ(2).
 Q $S($G(DUZ(2)):$S($D(^DIC(4,DUZ(2),0)):$P(^(0),U),1:"UNKNOWN"),1:"DUZ(2) UNDEFINED OR 0")
 ;----------
