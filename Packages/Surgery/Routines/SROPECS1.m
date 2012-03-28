SROPECS1 ;BIR/ADM-Ensuring Correct Surgery Compliance Report, continued ; [ 07/03/03  2:10 PM ]
 ;;3.0; Surgery ;**120**;24 Jun 9
 S (SRHDRL,SRNEW)=0 I SRFLG'=1 S SRHDRL=1 D HDR,TMP
 I 'SRSOUT,SRFLG'=2 D SUM
 Q
TMP ; print cases stored in ^TMP
 I SRORD S SRSS="" D NONE F  S SRSS=$O(^TMP("SRLIST",$J,SRSS)) Q:SRSS=""!SRSOUT  D NEWSP D
 .S SRSDT="" F  S SRSDT=$O(^TMP("SRLIST",$J,SRSS,SRSDT)) Q:'SRSDT!SRSOUT  S SRTN=0 F  S SRTN=$O(^TMP("SRLIST",$J,SRSS,SRSDT,SRTN)) Q:'SRTN!SRSOUT  D
 ..S SRC=^TMP("SRLIST",$J,SRSS,SRSDT,SRTN),DFN=$P(SRC,"^"),SR71=$P(SRC,"^",2),SR72=$P(SRC,"^",3) D CASE
 I 'SRORD S SRSDT="" D NONE F  S SRSDT=$O(^TMP("SRLIST",$J,SRSDT)) Q:'SRSDT!SRSOUT  S SRTN=0 F  S SRTN=$O(^TMP("SRLIST",$J,SRSDT,SRTN)) Q:'SRTN!SRSOUT  D
 .S SRC=^TMP("SRLIST",$J,SRSDT,SRTN),DFN=$P(SRC,"^"),SR71=$P(SRC,"^",2),SR72=$P(SRC,"^",3),SRSS=$P(SRC,"^",4)
 .S SRSPEC=SRSS D CASE
 Q
NEWSP S SRSPEC=SRSS,SRNEW=1 I $E(SRSS,1,2)="ZZ" S SRSPEC=$E(SRSS,3,50)
 I $Y+9>IOSL D PAGE Q
SPNAME W !,">>> SPECIALTY: "_SRSPEC_$S('SRNEW:" (continued)",1:"")," <<<",!
 S SRNEW=0
 Q
NONE ; no cases to list
 I SRORD,$O(^TMP("SRLIST",$J,SRSS))="" D ZERO Q
 I 'SRORD,$O(^TMP("SRLIST",$J,SRSDT))="" D ZERO Q
 Q
ZERO W !,"NO NON-COMPLIANT SURGICAL CASES WERE FOUND FOR THIS DATE RANGE."
 Q
SUM ; print summary
 S SRTAG="COMPLIANCE SUMMARY",SRHDRL=0 D PAGE
 W !,?24,"CASES    % OF TOTAL",!,?24,"-----    ----------"
 W !,"TOTAL CASES PERFORMED:"_$J(SRTOT,6),?35,"100.0"
 W !!," TIME OUT VERIFIED",!,?18,"YES:"_$J(SRTOV,6) W:SRTOT ?35,$J(((SRTOV/SRTOT)*100),5,1)
 W !,?19,"NO:"_$J(SRTONO,6) W:SRTOT ?35,$J(((SRTONO/SRTOT)*100),5,1)
 W !,?10,"NOT ENTERED:"_$J(SRTONE,6) W:SRTOT ?35,$J(((SRTONE/SRTOT)*100),5,1)
 W !!," IMAGING CONFIRMED",!,?18,"YES:"_$J(SRICY,6) W:SRTOT ?35,$J(((SRICY/SRTOT)*100),5,1)
 W !,?19,"NO:"_$J(SRICNO,6) W:SRTOT ?35,$J(((SRICNO/SRTOT)*100),5,1)
 W !,?7,"NOT APPLICABLE:"_$J(SRICNA,6) W:SRTOT ?35,$J(((SRICNA/SRTOT)*100),5,1)
 W !,?10,"NOT ENTERED:"_$J(SRICNE,6) W:SRTOT ?35,$J(((SRICNE/SRTOT)*100),5,1)
 W !!,"OVERALL COMPLIANCE FOR THIS DATE RANGE",!,"--------------------------------------"
 W !," TIME OUT VERIFIED: " W:SRTOT $J(((SRTOV/SRTOT)*100),5,1),"%"
 W !," IMAGING CONFIRMED: " W:SRTOT $J((((SRICY+SRICNA)/SRTOT)*100),5,1),"%"
 Q
DEM ; get patient demographic information
 D DEM^VADPT S SRSNM=VADM(1),SRSSN=VA("PID")
 S Y=SRSDT X ^DD("DD") S SRSDATE=Y,X1=$E(SRSDT,1,7),X2=$P(VADM(3),"^"),SRAGE=$E(X1,1,3)-$E(X2,1,3)-($E(X1,4,7)<$E(X2,4,7))
 S Y=$P($G(^SRF(SRTN,.1)),"^",13),C=$P(^DD(130,.164,0),"^",2) D:Y'="" Y^DIQ S SRATT=$S(Y'="":$E(Y,1,29),1:"<NOT ENTERED>")
 S SRCIRC="",Y=$O(^SRF(SRTN,19,0)) S:Y SRCIRC=$P($G(^SRF(SRTN,19,Y,0)),"^")
 S Y=SRCIRC,C=$P(^DD(130.28,.01,0),"^",2) D:Y'="" Y^DIQ S SRCIRC=$S(Y'="":$E(Y,1,29),1:"<NOT ENTERED>")
PROC ; get principal procedure
 K SRPROC S X=$P(^SRF(SRTN,"OP"),"^") I $L(X)<49 S SRPROC(1)=X
 I $L(X)>48 S K=1 F  D  I $L(X)<49 S SRPROC(K)=X Q
 .F I=0:1:47 S J=48-I,Y=$E(X,J) I Y=" " S SRPROC(K)=$E(X,1,J-1),X=$E(X,J+1,$L(X)) S K=K+1 Q
 Q
CASE ; print case info
 D DEM D:$Y+6>IOSL PAGE Q:SRSOUT
 I $E(SRSS,1,2)="ZZ" S SRSPEC=$E(SRSS,3,40)
 W !,SRSDATE,?32,SRATT,?62,$S(SR71="Y":"YES",SR71="N":"NO",1:"<NOT ENTERED>")
 W !,SRSNM,?32,SRCIRC,?62,$S(SR72="Y":"YES",SR72="N":"NO",SR72="NA":"NOT APPLICABLE",1:"<NOT ENTERED>")
 W !,SRSSN_"  ("_SRAGE_")",?21,SRTN,?32,SRPROC(1)
 I 'SRORD W !,"("_$E(SRSPEC,1,28)_")" W:$D(SRPROC(2)) ?32,SRPROC(2)
 I SRORD W:$D(SRPROC(2)) !,?32,SRPROC(2)
 W:$D(SRPROC(3)) !,?32,SRPROC(3) W:$D(SRPROC(4)) !,?32,SRPROC(4)
 W ! F I=1:1:80 W "-"
 Q
PAGE I $E(IOST)="P"!SRHDR G HDR
 W ! K DIR S DIR(0)="E" D ^DIR K DIR I $D(DTOUT)!$D(DUOUT) S SRSOUT=1 Q
HDR ; print heading
 I $D(ZTQUEUED) D ^SROSTOP I SRHALT S SRSOUT=1 Q
 S SRTITLE=SRRPT_" - "_SRTAG
 W:$Y @IOF W:$E(IOST)="P" !,?(80-$L(SRINST)\2),SRINST W !,?(80-$L(SRTITLE)\2),SRTITLE,?70,$J("PAGE "_SRPAGE,9),!,?(80-$L(SRFRTO)\2),SRFRTO W:$E(IOST)="P" !,?(80-$L(SRPRINT)\2),SRPRINT
 I SRHDRL D
 .W !!,"DATE OF OPERATION",?32,"ATTENDING SURGEON",?62,"TIME OUT VERIFIED"
 .W !,"PATIENT NAME",?32,"CIRCULATING NURSE",?62,"IMAGING CONFIRMED"
 .W !,"PATIENT ID  (AGE)",?21,"CASE #",?32,"PRINCIPAL PROCEDURE"
 S SRPAGE=SRPAGE+1 W ! F I=1:1:80 W "="
 I 'SRHDR,SRHDRL,SRORD D SPNAME
 S SRHDR=0
 Q
