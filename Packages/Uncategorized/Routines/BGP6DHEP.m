BGP6DHEP ; IHS/CMI/LAB - IHS HEDIS print ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
 ;
PRINT ;
 K ^TMP($J)
 S BGPIOSL=$S($G(BGPGUI):55,1:IOSL)
 I BGPROT="D" G DEL
 D ^BGP6HEH
 S BGPGPG=0
 S BGPQUIT=""
 D PRINT1
 K ^TMP($J)
 I BGPROT="P" K ^XTMP("BGP6D",BGPJ,BGPH),^TMP($J) Q
 ;
DEL ;create delimited output file
 I '$D(BGPGUI) D ^%ZISC ;close printer device
 K ^TMP($J)
 D ^BGP6HEL ;create ^tmp of delimited report
 K ^XTMP("BGP6D",BGPJ,BGPH)
 K ^TMP($J)
 Q
 ;
PRINT1 ;EP
 S BGPIC=0 F  S BGPIC=$O(BGPIND(BGPIC)) Q:BGPIC=""!(BGPQUIT)  D
 .D HEADER^BGP6DPH ;header for all measures
 .I $Y>(BGPIOSL-3) D HEADER^BGP6DPH Q:BGPQUIT
 .W !,$P(^BGPHEIS(BGPIC,0),U,3),!
 .I $Y>(BGPIOSL-3) D HEADER^BGP6DPH Q:BGPQUIT
 .W !,"Denominator(s):"
 .S BGPX=0 F  S BGPX=$O(^BGPHEIS(BGPIC,61,"B",BGPX)) Q:BGPX'=+BGPX!(BGPQUIT)  D
 ..S BGPY=0 F  S BGPY=$O(^BGPHEIS(BGPIC,61,"B",BGPX,BGPY)) Q:BGPY'=+BGPY!(BGPQUIT)  D
 ...I $P(^BGPHEIS(BGPIC,61,BGPY,0),U,2)'[BGPRTYPE Q  ;not a denom def for this report
 ...S BGPZ=0 F  S BGPZ=$O(^BGPHEIS(BGPIC,61,BGPY,1,BGPZ)) Q:BGPZ'=+BGPZ!(BGPQUIT)  D
 ....I $Y>(BGPIOSL-3) D HEADER^BGP6DPH Q:BGPQUIT
 ....W !,^BGPHEIS(BGPIC,61,BGPY,1,BGPZ,0)
 ....Q
 ...;W !
 ...Q
 ..Q
 .I $Y>(BGPIOSL-3) D HEADER^BGP6DPH Q:BGPQUIT
 .W !!,"Numerator(s):"
 .S BGPX=0 F  S BGPX=$O(^BGPHEIS(BGPIC,62,"B",BGPX)) Q:BGPX'=+BGPX!(BGPQUIT)  D
 ..S BGPY=0 F  S BGPY=$O(^BGPHEIS(BGPIC,62,"B",BGPX,BGPY)) Q:BGPY'=+BGPY!(BGPQUIT)  D
 ...I $P(^BGPHEIS(BGPIC,62,BGPY,0),U,2)'[BGPRTYPE Q  ;not a denom def for this report
 ...S BGPZ=0 F  S BGPZ=$O(^BGPHEIS(BGPIC,62,BGPY,1,BGPZ)) Q:BGPZ'=+BGPZ!(BGPQUIT)  D
 ....I $Y>(BGPIOSL-3) D HEADER^BGP6DPH Q:BGPQUIT
 ....W !,^BGPHEIS(BGPIC,62,BGPY,1,BGPZ,0)
 ....Q
 ...;W !
 ...Q
 ..Q
 .W ! S BGPX=0 F  S BGPX=$O(^BGPHEIS(BGPIC,11,BGPX)) Q:BGPX'=+BGPX  D
 ..I $Y>(BGPIOSL-3) D HEADER^BGP6DPH Q:BGPQUIT
 ..W !,^BGPHEIS(BGPIC,11,BGPX,0)
 .W ! S BGPX=0 F  S BGPX=$O(^BGPHEIS(BGPIC,51,BGPX)) Q:BGPX'=+BGPX  D
 ..I $Y>(BGPIOSL-3) D HEADER^BGP6DPH Q:BGPQUIT
 ..W !,^BGPHEIS(BGPIC,51,BGPX,0)
 .W ! S BGPX=0 F  S BGPX=$O(^BGPHEIS(BGPIC,52,BGPX)) Q:BGPX'=+BGPX  D
 ..I $Y>(BGPIOSL-3) D HEADER^BGP6DPH Q:BGPQUIT
 ..W !,^BGPHEIS(BGPIC,52,BGPX,0)
 .X ^BGPHEIS(BGPIC,3)
 ;
 ;D ^BGP6DSP
 D ^BGP6HES
 D EXIT
 Q
EXIT ;
 I $E(IOST)="C",IO=IO(0),'$D(ZTQUEUED) W ! S DIR(0)="EO",DIR("A")="End of report.  Press ENTER" D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 Q
C(X,X2,X3) ;
 D COMMA^%DTC
 Q X
