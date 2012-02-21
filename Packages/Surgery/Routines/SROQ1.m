SROQ1 ;B'HAM ISC/ADM - QUARTERLY REPORT (CONTINUED) ; [ 07/20/04  11:43 AM ]
 ;;3.0; Surgery ;**38,62,70,50,95,123,126,129**;24 Jun 93
 ;** NOTICE: This routine is part of an implementation of a nationally
 ;**         controlled procedure. Local modifications to this routine
 ;**         are prohibited.
 ;
 Q:SRSOUT  U IO S (SRHDR,SRPAGE)=0 D HDR^SROQ0 Q:SRSOUT
TOT W !!,?35,"Total Cases",?55,"% of Total",!,?35,"-----------",?55,"----------"
 W !,?5,"Surgical Cases",?37,$J(SRCASES,6) W:SRCASES ?57,"100.0" S SRALL=SRCASES I 'SRALL S SRALL=1
 W !,?5,"Major Procedures",?37,$J(SRMAJOR,6),?57,$J(((SRMAJOR/SRALL)*100),5,1) S SRMAJ=SRMAJOR I 'SRMAJOR S SRMAJ=1
ASA F I=1:1:6 W !,?9,"ASA Class ("_I_")",?37,$J(SRASA(I),6),?57,$J(((SRASA(I)/SRMAJ)*100),5,1)
 I SRASA(7) W !,?9,"ASA Class (Not Entered)",?37,$J(SRASA(7),6),?57,$J(((SRASA(7)/SRMAJ)*100),5,1)
 W !,?5,"Postoperative Deaths",?37,$J(SRMORT,6),?57,$J(((SRMORT/SRALL)*100),5,1),!,?9,"Ambulatory: "_SROPD
 W !,?5,"Postoperative Occurrences",?37,$J(SRCOMP,6),?57,$J(((SRCOMP/SRALL)*100),5,1)
 W !,?5,"Ambulatory Procedures",?37,$J((SRCASES-SRINPAT),6),?57,$J((((SRCASES-SRINPAT)/SRALL)*100),5,1)
 W !,?9,"Admitted Within 14 Days: "_SRADMT
 W !,?9,"Invasive Diagnostic: "_SRINV("O")
 W !,?5,"Inpatient Procedures",?37,$J(SRINPAT,6),?57,$J(((SRINPAT/SRALL)*100),5,1)
 W !,?5,"Emergency Procedures",?37,$J(SREMERG,6),?57,$J(((SREMERG/SRALL)*100),5,1)
 W !,?5,"Age>60 Years",?37,$J(SR60,6),?57,$J(((SR60/SRALL)*100),5,1)
SP D:$E(IOST,1,2)="C-" HDR^SROQ0 Q:SRSOUT  W:$E(IOST,1,2)'="C-" !
 W !!,?30,"SPECIALTY PROCEDURES",!,?30,"--------------------",!,?66,"---DEATHS---"
 W !,?27,"PATIENTS   CASES    MAJOR    MINOR     TOTAL    %"
 W !,?27,"--------   -----    -----    -----     -----   ----"
SRSS ; print data for each specialty
 S SRPTF=50,SRSP="GENERAL" D SPOUT
 S SRPTF=51,SRSP="GYNECOLOGY" D SPOUT
 S SRPTF=52,SRSP="NEUROSURGERY" D SPOUT
 S SRPTF=53,SRSP="OPHTHALMOLOGY" D SPOUT
 S SRPTF=54,SRSP="ORTHOPEDICS" D SPOUT
 S SRPTF=55,SRSP="OTORHINOLARYNGOLOGY" D SPOUT
 S SRPTF=56,SRSP="PLASTIC SURGERY" D SPOUT
 S SRPTF=57,SRSP="PROCTOLOGY" D SPOUT
 S SRPTF=58,SRSP="THORACIC SURGERY" D SPOUT
 S SRPTF=59,SRSP="UROLOGY" D SPOUT
 S SRPTF=60,SRSP="ORAL SURGERY" D SPOUT
 S SRPTF=61,SRSP="PODIATRY" D SPOUT
 S SRPTF=62,SRSP="PERIPHERAL VASCULAR" D SPOUT
 S SRPTF=500,SRSP="CARDIAC SURGERY" D SPOUT
 S SRPTF=501,SRSP="TRANSPLANTATION" D SPOUT
 S SRPTF=502,SRSP="ANESTHESIOLOGY" D SPOUT
 I +^TMP("SRSS",$J,"ZZ") S SRPTF="ZZ",SRSP="SPECIALTY NOT ENTERED" D SPOUT
RES ; resident supervision
 I $E(IOST,1,2)="C-" D HDR^SROQ0 Q:SRSOUT
 W !!!,?24,"LEVEL OF RESIDENT SUPERVISION (%)",!,?24,"---------------------------------",!,?42,"MAJOR     MINOR"
 S SRIX=SRCASES-SRMAJOR,SRMAJ=SRMAJOR S:'SRIX SRIX=1 S:'SRMAJ SRMAJ=1
 S I=0 F  S I=$O(SRATT("J",I)) Q:'I  D
 .S SRL=$S(I=9:"A",I=10:"B",I=11:"C",I=12:"D",I=13:"E",I=14:"F",I=1:"0 (Old)",I=2:"1 (Old)",I=3:"2 (Old)",I=4:"3 (Old)",I=5:"0",I=6:"1",I=7:"2",I=8:"3",1:"Not Entered")
 .W !,?24,"Level ",SRL,?42,$J(((SRATT("J",I)/SRMAJ)*100),5,1),?52,$J(((SRATT("N",I)/SRIX)*100),5,1)
NDEX ; print data for index procedures
 D HDR^SROQ0 Q:SRSOUT
 W !!,?32,"INDEX PROCEDURES",!,?32,"----------------"
 W !,?54,"CASES WITH",!,?30,"CASES        DEATHS     OCCURRENCES"
 W !,?30,"-----        -------    -----------"
 F J=1:1:12 D IX
 D ^SROQ1A
ENSURE ; ensuring correct surgery compliance
 D HDR^SROQ0 Q:SRSOUT
 W !!,?17,"ENSURING CORRECT SURGERY - COMPLIANCE SUMMARY",!,?17,"---------------------------------------------"
 W !!,?42,"CASES    % OF TOTAL",!,?42,"-----    ----------"
 W !,?18,"TOTAL CASES PERFORMED:"_$J(SRCASES,6) W:SRCASES ?53,"100.0"
 W !!,?22,"TIME OUT VERIFIED",!,?36,"YES:"_$J(SRTOV,6) W:SRCASES ?53,$J(((SRTOV/SRCASES)*100),5,1)
 W !,?37,"NO:"_$J(SRTONO,6) W:SRCASES ?53,$J(((SRTONO/SRCASES)*100),5,1)
 W !,?28,"NOT ENTERED:"_$J(SRTONE,6) W:SRCASES ?53,$J(((SRTONE/SRCASES)*100),5,1)
 W !!,?9,"PREOPERATIVE IMAGING CONFIRMED",!,?36,"YES:"_$J(SRICY,6) W:SRCASES ?53,$J(((SRICY/SRCASES)*100),5,1)
 W !,?19,"IMAGING NOT REQUIRED:"_$J(SRICNR,6) W:SRCASES ?53,$J(((SRICNR/SRCASES)*100),5,1)
 W !,?37,"NO:"_$J(SRICNO,6) W:SRCASES ?53,$J(((SRICNO/SRCASES)*100),5,1)
 W !,?28,"NOT ENTERED:"_$J(SRICNE,6) W:SRCASES ?53,$J(((SRICNE/SRCASES)*100),5,1)
 I $E(IOST,1,2)="C-" D HDR^SROQ0 Q:SRSOUT  W !,?17,"ENSURING CORRECT SURGERY - COMPLIANCE SUMMARY (Continued)"
 W !!,?8,"MARK ON SURGICAL SITE CONFIRMED",!,?36,"YES:"_$J(SRSCY,6) W:SRCASES ?53,$J(((SRSCY/SRCASES)*100),5,1)
 W !,?19,"MARKING NOT REQUIRED:"_$J(SRSCNR,6) W:SRCASES ?53,$J(((SRSCNR/SRCASES)*100),5,1)
 W !,?37,"NO:"_$J(SRSCNO,6) W:SRCASES ?53,$J(((SRSCNO/SRCASES)*100),5,1)
 W !,?28,"NOT ENTERED:"_$J(SRSCNE,6) W:SRCASES ?53,$J(((SRSCNE/SRCASES)*100),5,1)
 W !!,?20,"OVERALL COMPLIANCE FOR THIS DATE RANGE",!,?20,"--------------------------------------"
 W !,?34,"TIME OUT VERIFIED: " W:SRCASES $J(((SRTOV/SRCASES)*100),5,1),"%"
 W !,?21,"PREOPERATIVE IMAGING CONFIRMED: " W:SRCASES $J((((SRICY+SRICNR)/SRCASES)*100),5,1),"%"
 W !,?20,"MARK ON SURGICAL SITE CONFIRMED: " W:SRCASES $J((((SRSCY+SRSCNR)/SRCASES)*100),5,1),"%"
 Q
IX ; break out index procedure data from ^TMP
 F K=1:1:3 S SRP(K)=$P(^TMP("SRPROC",$J,J),"^",K)
 D IXOUT^SROQ0A D
 .I SROP["," W:J=7 !,?5,$P(SROP,",") S SROP=$P(SROP,",",2)
 .W !,?5,SROP,?29,$J(SRP(1),6),?42,$J(SRP(3),6),?55,$J(SRP(2),6)
 Q
SPOUT ; break out data for each specialty from ^TMP
 F K=1:1:5 S SRP(K)=$P(^TMP("SRSS",$J,SRPTF),"^",K)
 I SRPTF="ZZ" S SRPTF=""
 W !,$J(SRPTF,3),?6,SRSP,?27,$J(SRP(1),6),?37,$J(SRP(2),6),?46,$J(SRP(3),6),?55,$J(SRP(4),6),?64,$J(SRP(5),6),?73,$J(((SRP(5)/$S(SRP(2):SRP(2),1:1))*100),5,1)
 Q
