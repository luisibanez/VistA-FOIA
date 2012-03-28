BGP3DPH ; IHS/CMI/LAB - AREA REPORT HEADER ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
 ;HEADERS FOR REPORTS
CALC(N,O) ;ENTRY POINT
 NEW Z
 ;I O=0!(N=0)!(O="")!(N="") Q "**"
 ;NEW X,X2,X3
 ;S X=N,X2=1,X3=0 D COMMA^%DTC S N=X
 ;S X=O,X2=1,X3=0 D COMMA^%DTC S O=X
 ;I +O=0 Q "**"
 ;S Z=(((N-O)/O)*100),Z=$FN(Z,"+,",1)
 S Z=N-O,Z=$FN(Z,"+,",1)
 Q Z
C(X,X2,X3) ;
 D COMMA^%DTC
 Q X
H2 ;EP
 S BGPX="",BGPX=$$C(BGPCYN,0,8),$E(BGPX,9)=$J(BGPCYP,5,1),$E(BGPX,16)=$$C(BGPPRN,0,8),$E(BGPX,24)=$J(BGPPRP,5,1),$E(BGPX,32)=$J($$CALC(BGPCYP,BGPPRP),6),$E(BGPX,39)=$$C(BGPBLN,0,8),$E(BGPX,47)=$J(BGPBLP,5,1)
 S $E(BGPX,55)=$J($$CALC(BGPCYP,BGPBLP),6)
 W ?20,BGPX
 Q
H6 ;EP
 W !,"Age specific Exercise Education Provided",!!,$$CTR(BGPHD1,80),!
 W !?40,"Age Distribution"
 W !?25,"0-9",?30,"10-19",?37,"20-24",?44,"25-34",?51,"35-44",?58,"45-54",?65,"55-64",?72,">64 yrs",!
 Q
H3 ;EP
 W !!,$$CTR(BGPHD1,80)
 W !?40,"Age Distribution"
 W !?25,"<15",?30,"15-19",?37,"20-24",?44,"25-34",?51,"35-44",?58,"45-54",?65,"55-64",?72,">64 yrs",!
 Q
H5 ;
 W !,"Age specific Tobacco Use Prevalence",!,$$CTR(BGPHD1,80)
 W !?40,"Age Distribution"
 W !?25,"0-9",?30,"10-19",?37,"20-24",?44,"25-34",?51,"35-44",?58,"45-54",?65,"55-64",?72,">64 yrs"
 Q
H1 ;EP
 W !!?21,"REPORT",?31,"%",?35,"PREV YR",?46,"%",?49,"CHG from",?59,"BASE",?69,"%",?72,"CHG from"
 W !?21,"PERIOD",?35,"PERIOD",?49,"PREV YR %",?59,"PERIOD",?72,"BASE %"
 Q
HEADER ;EP
 G:'BGPGPG HEADER1
 K DIR I $E(IOST)="C",IO=IO(0),'$D(ZTQUEUED) W ! S DIR(0)="EO" D ^DIR K DIR I Y=0!(Y="^")!($D(DTOUT)) S BGPQUIT=1 Q
HEADER1 ;
 W:$D(IOF) @IOF S BGPGPG=BGPGPG+1
 W $P(^VA(200,DUZ,0),U,2),?35,$$FMTE^XLFDT(DT),?70,"Page ",BGPGPG,!
 W:BGPRTYPE=4 $$CTR("*** IHS FY03 Local Clinical Performance Indicator Report ***",80),!
 W:BGPRTYPE=1 $$CTR("*** IHS FY03 GPRA Clinical Performance Indicators ***",80),!
 W:BGPRTYPE=2 $$CTR("*** IHS FY03 Annual Area Clinical Performance Indicators ***",80),!
 I $G(BGPAREAA) W $S(BGPSUCNT=1:$$CTR(BGPSUNM,80),1:$$CTR("AREA AGGREGATE",80)),!
 I '$G(BGPAREAA) W $$CTR($P(^DIC(4,DUZ(2),0),U),80),!
 S X="Report Period: "_$$FMTE^XLFDT(BGPBD)_" to "_$$FMTE^XLFDT(BGPED) W $$CTR(X,80),!
 S X="Previous Year Period:  "_$$FMTE^XLFDT(BGPPBD)_" to "_$$FMTE^XLFDT(BGPPED) W $$CTR(X,80),!
 S X="Baseline Period:  "_$$FMTE^XLFDT(BGPBBD)_" to "_$$FMTE^XLFDT(BGPBED) W $$CTR(X,80),!
 W $TR($J("",80)," ","-")
 Q
AREACP ;EP - area cover page
 ;
 S BGPGPG=0 D HEADER^BGPDPH
 W !!?1,"Report includes the following facility data:"
 NEW BGPX
 S BGPX="" F  S BGPX=$O(BGPSUL(BGPX)) Q:BGPX=""  D
 .I $Y>(IOSL-5) D EOP W:$D(IOF) @IOF
 .S X=$P(^BGPGPDC(BGPX,0),U,5),X=$O(^AUTTLOC("C",X,0)) S X=$S(X:$P(^DIC(4,X,0),U),1:"?????")
 .W !?3,X
 .W !?5,"Communities: " S X=0,N=0,Y="" F  S X=$O(^BGPGPDC(BGPX,28,X)) Q:X'=+X  S N=N+1,Y=Y_$S(N=1:"",1:";")_$P(^BGPGPDC(BGPX,28,X,0),U)
 .S X=0,C=0 F X=1:3:N W !?10,$E($P(Y,";",X),1,20),?30,$E($P(Y,";",(X+1)),1,20),?60,$E($P(Y,";",(X+2)),1,20)
 .Q
 K BGPX,BGPQUIT
 Q
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
