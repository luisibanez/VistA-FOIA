BGP8DELP ; IHS/CMI/LAB - IHS HEDIS print ;
 ;;8.0;IHS CLINICAL REPORTING;**2**;MAR 12, 2008
 ;
 ;
PRINT ;
 K ^TMP($J)
 S BGPIOSL=$S($G(BGPGUI):55,1:IOSL)
 I BGPROT="D" G DEL
 D ^BGP8ELH
 S BGPGPG=0
 S BGPQUIT=""
 D PRINT1
 K ^TMP($J)
 I BGPROT="P" K ^XTMP("BGP8D",BGPJ,BGPH),^TMP($J) Q
 ;
DEL ;create delimited output file
 D ^%ZISC ;close printer device
 K ^TMP($J)
 D ^BGP8ELL ;create ^tmp of delimited report
 K ^XTMP("BGP8D",BGPJ,BGPH)
 K ^TMP($J)
 Q
 ;
PRINT1 ;EP
 S BGPIC=0 F  S BGPIC=$O(BGPIND(BGPIC)) Q:BGPIC=""!(BGPQUIT)  D
 .D HEADER^BGP8DPH ;header for all measures
 .I $Y>(BGPIOSL-3) D HEADER^BGP8DPH Q:BGPQUIT
 .W !,$P(^BGPELIE(BGPIC,0),U,3),!
 .I $Y>(BGPIOSL-3) D HEADER^BGP8DPH Q:BGPQUIT
 .W !,"Denominator(s):"
 .S BGPX=0 F  S BGPX=$O(^BGPELIE(BGPIC,61,"B",BGPX)) Q:BGPX'=+BGPX!(BGPQUIT)  D
 ..S BGPY=0 F  S BGPY=$O(^BGPELIE(BGPIC,61,"B",BGPX,BGPY)) Q:BGPY'=+BGPY!(BGPQUIT)  D
 ...S BGPZ=0 F  S BGPZ=$O(^BGPELIE(BGPIC,61,BGPY,1,BGPZ)) Q:BGPZ'=+BGPZ!(BGPQUIT)  D
 ....I $Y>(BGPIOSL-3) D HEADER^BGP8DPH Q:BGPQUIT
 ....W !,^BGPELIE(BGPIC,61,BGPY,1,BGPZ,0)
 ....Q
 ...;W !
 ...Q
 ..Q
 .I $Y>(BGPIOSL-3) D HEADER^BGP8DPH Q:BGPQUIT
 .W !!,"Numerator(s):"
 .S BGPX=0 F  S BGPX=$O(^BGPELIE(BGPIC,62,"B",BGPX)) Q:BGPX'=+BGPX!(BGPQUIT)  D
 ..S BGPY=0 F  S BGPY=$O(^BGPELIE(BGPIC,62,"B",BGPX,BGPY)) Q:BGPY'=+BGPY!(BGPQUIT)  D
 ...S BGPZ=0 F  S BGPZ=$O(^BGPELIE(BGPIC,62,BGPY,1,BGPZ)) Q:BGPZ'=+BGPZ!(BGPQUIT)  D
 ....I $Y>(BGPIOSL-3) D HEADER^BGP8DPH Q:BGPQUIT
 ....W !,^BGPELIE(BGPIC,62,BGPY,1,BGPZ,0)
 ....Q
 ...Q
 ..Q
 .I $O(^BGPELIE(BGPIC,11,0)) W !,"Logic",! S BGPX=0 F  S BGPX=$O(^BGPELIE(BGPIC,11,BGPX)) Q:BGPX'=+BGPX  D
 ..I $Y>(BGPIOSL-3) D HEADER^BGP8DPH Q:BGPQUIT
 ..W !,^BGPELIE(BGPIC,11,BGPX,0)
 .I $O(^BGPELIE(BGPIC,51,0)) W !,"Performance Measure Description",! S BGPX=0 F  S BGPX=$O(^BGPELIE(BGPIC,51,BGPX)) Q:BGPX'=+BGPX  D
 ..I $Y>(BGPIOSL-3) D HEADER^BGP8DPH Q:BGPQUIT
 ..W !,^BGPELIE(BGPIC,51,BGPX,0)
 .I $O(^BGPELIE(BGPIC,52,0)) W !,"Past Performance and/or Target",! S BGPX=0 F  S BGPX=$O(^BGPELIE(BGPIC,52,BGPX)) Q:BGPX'=+BGPX  D
 ..I $Y>(BGPIOSL-3) D HEADER^BGP8DPH Q:BGPQUIT
 ..W !,^BGPELIE(BGPIC,52,BGPX,0)
 .X ^BGPELIE(BGPIC,3)
 ;
 D ^BGP8ELS
 D EXIT
 Q
EXIT ;
 I $E(IOST)="C",IO=IO(0),'$D(ZTQUEUED) W ! S DIR(0)="EO",DIR("A")="End of report.  Press ENTER" D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 Q
C(X,X2,X3) ;
 D COMMA^%DTC
 Q X
