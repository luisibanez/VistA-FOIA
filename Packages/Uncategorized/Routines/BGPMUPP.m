BGPMUPP ; IHS/MSC/MGH - Meaningful Use Print Jul 2009 6:26 AM ;31-Jan-2011 16:06;MGH
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 ;
 ;
PRINT ;
 K ^TMP($J)
 K BGPDELIM
 S BGPIOSL=$S($G(BGPGUI):55,1:$G(IOSL))
 S BGPQUIT=""
 S ^TMP($J,"BGPDEL",0)=0
 I $G(BGPAREAA) D SETEXCEL
 S BGPIFTR=""
 I BGPROT="X" D XML Q
 I BGPROT="D" D DEL Q
 E  D
 .S BGPPTYPE="P"
 .S BGPQHDR=0
 .;I BGPQHDR D EXIT Q
 .S BGPGPG=0
 .S BGPQUIT=""
 .D PRINT1
 K ^TMP($J)
 D EXIT
 Q
 ;
DEL ;create delimited output file
 I '$D(BGPGUI) D ^%ZISC ;close printer device
 I BGPDELT="F" D
 .S Y="A delimited output file called "_BGPDELF_".txt has been placed in" D W(Y,0,2,"P")
 .S Y="the public directory for your use in Excel or some other software package.  See" D W(Y,0,1,"P")
 .S Y="your site manager to access this file." D W(Y,0,1,"P")
 K ^TMP($J)
 S ^TMP($J,"BGPDEL",0)=0
 S BGPQHDR=0
 S BGPPTYPE="D"
 S BGPGPG=0
 S BGPQUIT=""
 D PRINT1^BGPMUDEL
 D SAVEDEL^BGPMUDEL
 S BGPIFTR=1
 K ^TMP($J)
 Q
XML ;create XML output files
 I '$D(BGPGUI) D ^%ZISC ;close printer device
 K ^TMP($J)
 S ^TMP($J,"BGPXML",0)=0
 S BGPQHDR=0
 S BGPPTYPE="X"
 S BGPQUIT=""
 D PRINT1^BGPMUXML
 D SAVEXML^BGPMUXML
 S BGPIFTR=1
 K ^TMP($J)
 Q
 ;V=text, C=centered, F=#of CR/LF before, M="P"(print),"D"(delim), P=tmp global piece, T=tab pos
W(V,C,F,M,P,T) ;EP
 I $G(F)="" S F=1
 I $G(C)="" S C=0
 I $G(P)="" S P=1
 I $G(T)="" S T=0
 I M="P" D  Q
 .;I $Y>(BGPIOSL-2) D EOP W:$D(IOF) @IOF
 .NEW X
 .F X=1:1:F W !
 .I C W $$CJ^XLFSTR(V,80)
 .I 'C W ?T,V
 ;set up array
 I '$G(F) S F=0
 NEW %,Z
 S Z=""
 S %=$P($G(^TMP($J,"BGPDEL",0)),U)
 F Z=1:1:F S %=%+1 S ^TMP($J,"BGPDEL",%)=""
 S $P(^TMP($J,"BGPDEL",0),U)=%
 I '$D(^TMP($J,"BGPDEL",%)) S ^TMP($J,"BGPDEL",%)=""
 S $P(^TMP($J,"BGPDEL",%),U,P)=V
 Q
 ;
WTITLE(I) ;EP - write title line
 NEW T,X,Y,S
 S T=$P(^BGPMUIND(BGPMUYF,I,0),U,3)
 I BGPPTYPE="P",$L(T)<81 D W(T,0,1,BGPPTYPE) Q
 I BGPPTYPE="D" D W(T,0,1,BGPPTYPE),W("",0,1,BGPPTYPE) Q
 S X=$E(T,1,80)
 S S=""
 F Y=80:-1:1 Q:S  S I=$E(X,Y) I I=" " S S=Y
 D W^BGPMUPP($E(T,1,S),0,1,BGPPTYPE)  ;W !,$E(T,1,S)
 D W^BGPMUPP($E(T,(S+1),$L(T)),0,1,BGPPTYPE)
 Q
ANYDEV() ;
 NEW X,G,Y
 S G=0
 S X=0 F  S X=$O(BGPINDL(X)) Q:X'=+X  S Y=0 F  S Y=$O(BGPINDL(X,Y)) Q:Y'=+Y  I $P(^BGPNPLT(Y,0),U,7)=9 S G=1
 Q G
ALLDEV() ;
 NEW X,G,Y
 S G=1
 S X=0 F  S X=$O(BGPINDL(X)) Q:X'=+X  S Y=0 F  S Y=$O(BGPINDL(X,Y)) Q:Y'=+Y  I $P(^BGPNPLT(Y,0),U,7)=1 S G=0
 Q G
PRINT1 ;EP
 N BGPDEVOR,BGPIC,BGPGDEV
 D COVERPG
 S BGPGDEV=1
 S BGPDEVOR=0 F  S BGPDEVOR=$O(^BGPMUIND(BGPMUYF,"ADO",BGPDEVOR)) Q:BGPDEVOR'=+BGPDEVOR!(BGPQUIT)  D
 .S BGPIC=$O(^BGPMUIND(BGPMUYF,"ADO",BGPDEVOR,0)) Q:BGPIC=""
 .I $D(BGPIND(BGPIC)) D PRINT2
 .Q:BGPQUIT
 K BGPGDEV
 Q:BGPQUIT
PRINTSUM ; Print summary page of all measure calculations
 N BGPPSUM
 S BGPPSUM=1
 D ^BGPMUPPS
 Q
COVERPG ;
 S Y="Cover Page" D W(Y,1,0,BGPPTYPE)
 S Y="*** IHS Stage 1 Meaningful Use ***" D W(Y,1,2,BGPPTYPE)
 S Y="*** "_$S($G(BGPMUT)'="H":"Professional (EP)",1:"Hospital")_" Clinical Quality Measures Report ***" D W(Y,1,1,BGPPTYPE)
 S Y="CRS 2011, Version 11.0 Patch 3" D W(Y,1,2,BGPPTYPE)
 S Y="Date Report Run: "_$$FMTE^XLFDT(DT) D W(Y,1,1,BGPPTYPE)
 S Y="Site where Run: "_$P(^DIC(4,DUZ(2),0),U) D W(Y,1,1,BGPPTYPE)
 S Y="Report Generated by: "_$P($G(^VA(200,DUZ,0)),U,1) D W(Y,1,1,BGPPTYPE)
 S Y="Report Period: "_$$FMTE^XLFDT(BGPBD)_" to "_$$FMTE^XLFDT(BGPED) D W(Y,1,1,BGPPTYPE)
 S Y="Previous Period: "_$$FMTE^XLFDT(BGPPBD)_" to "_$$FMTE^XLFDT(BGPPED) D W(Y,1,1,BGPPTYPE)
 S Y="Baseline Period: "_$$FMTE^XLFDT(BGPBBD)_" to "_$$FMTE^XLFDT(BGPBED) D W(Y,1,1,BGPPTYPE)
 I $G(BGPMUT)'="H" S Y="Measures: Stage 1 Meaningful Use Eligible Professional (EP) "_$S(BGPINDT="C":"Core Measures",BGPINDT="A":"Alternate Core",BGPINDT="M":"Menu-Set Measures",1:"Selected Measures") D W(Y,0,2,BGPPTYPE)
 I $G(BGPMUT)="H" D
 .S Y="Measures: Stage 1 Meaningful Use Eligible Hospital (EH) and" D W(Y,0,2,BGPPTYPE)
 .S Y="Critical Access Hospital (CAH) Clinical Quality Measures" D W(Y,0,1,BGPPTYPE)
 ;I $G(BGPMUT)="H" S Y="Measures: Stage 1 Meaningful Use Eligible Hospital "_$S(BGPINDT="S":"Selected Measures",1:"Measures") D W(Y,0,2,BGPPTYPE)
 ;I BGPINDT="A" S Y="Measures" D W(Y,0,1,BGPPTYPE)
 ;S Y="Population: "_$S(BGPBEN=1:"Indian/Alaskan Native (Classification 01)",BGPBEN=2:"Not Indian Alaskan/Native (Not Classification 01)",1:"All patients") D W(Y,0,2,BGPPTYPE)
 I $G(BGPMUT)'="H" D
 .S Y="Eligible Professional (EP): "_$P(^VA(200,BGPPROV,0),U) D W(Y,0,2,BGPPTYPE)
 I $G(BGPMUT)="H" D
 .S Y="Population: "_$S(BGPBEN=1:"AI/AN Only",BGPBEN=2:"Non-AI/AN",BGPBEN=3:"All Patients",1:"")
 .D W(Y,0,2,BGPPTYPE)
 .S Y="Eligible Hospital: "_$$LOC^BGPMUEH()_", "_$$GET1^DIQ(4,DUZ(2)_",",1.03)_", "_$$GET1^DIQ(4,DUZ(2)_",",.02)
 .D W(Y,0,2,BGPPTYPE)
 D ENDTIME
 I $G(BGPMUT)'="H" D
 .S Y="Warning:  The Meaningful Use reports do not verify that the EP selected for" D W(Y,0,2,BGPPTYPE)
 .S Y="the reports meets the CMS EHR Incentive Program eligibility criteria.  The" D W(Y,0,1,BGPPTYPE)
 .S Y="EP must make that determination." D W(Y,0,1,BGPPTYPE)
 ;
 I $G(BGPMUT)'="H" D
 .S Y="This report includes the EP "_$S(BGPINDT="C":"core",BGPINDT="A":"alternate",BGPINDT="M":"menu set",1:"selected")_" clinical performance measures for" D W(Y,0,2,BGPPTYPE)
 .S Y="Stage 1 Meaningful Use." D W(Y,0,1,BGPPTYPE)
 I $G(BGPMUT)="H" D
 .S Y="This report includes the eligible hospital and critical access hospital" D W(Y,0,2,BGPPTYPE)
 .S Y="clinical quality performance measures for Stage 1 Meaningful Use." D W(Y,0,1,BGPPTYPE)
 ;
 I $G(BGPMUT)'="H" D
 .S Y="For the first Meaningful Use payment year, the reporting period is any" D W(Y,0,2,BGPPTYPE)
 .S Y="consecutive 90-days during a calendar year (Jan 1- Dec 31).  For all" D W(Y,0,1,BGPPTYPE)
 .S Y="subsequent years, the reporting period is the entire calendar year." D W(Y,0,1,BGPPTYPE)
 I $G(BGPMUT)="H" D
 .S Y="For the first Meaningful Use payment year, the reporting period is any" D W(Y,0,2,BGPPTYPE)
 .S Y="consecutive 90-days during a federal fiscal year (Oct 1 - Sep 30).  For all" D W(Y,0,1,BGPPTYPE)
 .S Y="subsequent years, the reporting period is the entire federal fiscal year." D W(Y,0,1,BGPPTYPE)
 ;
 S Y="The report will provide a description of the measure, and explanations for" D W(Y,0,2,BGPPTYPE)
 S Y="the denominator(s), numerator(s) and exclusions (if applicable)" D W(Y,0,1,BGPPTYPE)
 S Y="and the measure logic." D W(Y,0,1,BGPPTYPE)
 S Y="The measure results are contained in tabular form with the following column" D W(Y,0,2,BGPPTYPE)
 S Y="headings:" D W(Y,0,1,BGPPTYPE)
 S Y="REPORT %  PREV YR %    CHG FROM  BASE %  CHG" D W(Y,0,2,BGPPTYPE,,30)
 S Y="PERIOD    PERIOD       PREV YR   YR      BASE %" D W(Y,0,1,BGPPTYPE,,30)
 I $G(BGPMUT)'="H" D
 .S Y="When a report is run for a 90-day period, the PREV YR PERIOD is the same 90-day" D W(Y,0,2,BGPPTYPE)
 .S Y="period for the previous calendar year and the BASE YR is the same 90-day period" D W(Y,0,1,BGPPTYPE)
 .S Y="for the base calendar year selected.  For example, a report run with Apr 1, 2010" D W(Y,0,1,BGPPTYPE)
 .S Y="through Jun 30, 2010 as the REPORT PERIOD and a base year of 2008 will include" D W(Y,0,1,BGPPTYPE)
 .S Y="data from Apr 1, 2009 through Jun 30, 2009 in the PREV YR PERIOD and Apr 1, 2008" D W(Y,0,1,BGPPTYPE)
 .S Y="through Jun 30, 2008 in the BASE YR." D W(Y,0,1,BGPPTYPE)
 I $G(BGPMUT)="H" D
 .S Y="When a report is run for a 90-day period, the PREV YR PERIOD is the same 90-day" D W(Y,0,2,BGPPTYPE)
 .S Y="period for the previous fiscal year and the BASE YR is the same 90-day" D W(Y,0,1,BGPPTYPE)
 .S Y="period for the base fiscal year selected.  For example, a report run" D W(Y,0,1,BGPPTYPE)
 .S Y="with Apr 1, 2010 through Jun 30, 2010 as the REPORT PERIOD and a base year of" D W(Y,0,1,BGPPTYPE)
 .S Y="2008 will include data from Apr 1, 2009 through Jun 30, 2009 in the PREV YR" D W(Y,0,1,BGPPTYPE)
 .S Y="PERIOD and Apr 1, 2008 through Jun 30, 2008 in the BASE YR." D W(Y,0,1,BGPPTYPE)
 I BGPDELT="F" D
 .S Y="A delimited output file called "_BGPDELF_".txt has been placed in" D W(Y,0,2,BGPPTYPE)
 .S Y="the public directory for your use in Excel or some other software package.  See" D W(Y,0,1,BGPPTYPE)
 .S Y="your site manager to access this file." D W(Y,0,1,BGPPTYPE)
 Q
ENDTIME ;
 I $D(BGPET) S BGPTS=(86400*($P(BGPET,",")-$P(BGPBT,",")))+($P(BGPET,",",2)-$P(BGPBT,",",2)),BGPHR=$P(BGPTS/3600,".") S:BGPHR="" BGPHR=0 D
 .S BGPTS=BGPTS-(BGPHR*3600),BGPM=$P(BGPTS/60,".") S:BGPM="" BGPM=0 S BGPTS=BGPTS-(BGPM*60),BGPS=BGPTS S X="RUN TIME (H.M.S): "_BGPHR_"."_BGPM_"."_BGPS D W(X,0,2,BGPPTYPE)
 Q
WP ;
 K ^UTILITY($J,"W")
 S BGPZ=0,BGPLCNT=0
 S DIWL=1,DIWR=80,DIWF="",BGPZ=0 F  S BGPZ=$O(^BGPMUIND(BGPMUYF,BGPIC,BGPNODE,BGPY,1,BGPZ)) Q:BGPZ'=+BGPZ  D
 .S BGPLCNT=BGPLCNT+1
 .S X=^BGPMUIND(BGPMUYF,BGPIC,BGPNODE,BGPY,1,BGPZ,0) S:BGPLCNT=1 X=" - "_X D ^DIWP
 .Q
WPS ;
 S Z=0 F  S Z=$O(^UTILITY($J,"W",DIWL,Z)) Q:Z'=+Z  D
 .I BGPPTYPE="P",$Y>(BGPIOSL-3) D HEADER^BGPMUPH Q:BGPQUIT
 .D W^BGPMUPP(^UTILITY($J,"W",DIWL,Z,0),0,1,BGPPTYPE)
 K DIWL,DIWR,DIWF,Z
 K ^UTIBLITY($J,"W"),X
 Q
PRINT2 ;
 ;K DIR I $E(IOST)="C",IO=IO(0),'$D(ZTQUEUED) W ! S DIR(0)="EO" D ^DIR K DIR I Y=0!(Y="^")!($D(DTOUT)) S BGPQUIT=1
 D HEADER1^BGPMUPH ;header for all measures
 ;I BGPPTYPE="P",$Y>(BGPIOSL-3) D HEADER^BGPMUPH Q:BGPQUIT
 D WTITLE(BGPIC)
 ;W !,$P(^BGPMUIND(BGPMUYF,BGPIC,0),U,3),!
 I BGPPTYPE="P",$Y>(BGPIOSL-3) D HEADER^BGPMUPH Q:BGPQUIT
 ;Print out the description node if there is data in it
 S BGPNODE=12 D PRINTN(BGPNODE,"Measure Summary:")
 ;Print out the population node if there is data in it
 S BGPNODE=13 D PRINTN(BGPNODE,"Population:")
 W !!
 W "Logic:"
 ;Print out the denominator node if there is data in it
 S BGPNODE=14 D PRINTN(BGPNODE,"Denominator Logic:",,1)
 ;The order for the next two sections is different between EP and Hosp
 I $G(BGPMUT)'="H" D
 .;Print out the numerator node if there is data in it
 .S BGPNODE=15 D PRINTN(BGPNODE,"Numerator Logic:",,1)
 .;Print ou the logic node if there is data in it
 .S BGPNODE=16 D PRINTN(BGPNODE,"Exclusion Logic:",,1)
 I $G(BGPMUT)="H" D
 .;Print ou the logic node if there is data in it
 .S BGPNODE=16 D PRINTN(BGPNODE,"Denominator Exclusion Logic:",,1)
 .;Print out the numerator node if there is data in it
 .S BGPNODE=15 D PRINTN(BGPNODE,"Numerator Logic:",,1)
 ;Print out the Performance node if there is data in it
 S BGPNODE=17 D PRINTN(BGPNODE,"Performance:")
 ;Print out the source node if there is data in it
 S BGPNODE=18 D PRINTN(BGPNODE,"Measure Source: ",1)
CALC I BGPPTYPE="P" X ^BGPMUIND(BGPMUYF,BGPIC,3) D W^BGPMUPP("",0,1,BGPPTYPE)
 I BGPPTYPE="D" X ^BGPMUIND(BGPMUYF,BGPIC,4) D W^BGPMUPP("",0,1,BGPPTYPE)
 Q
PRINTN(BGPNODE,TXT,SLF,XLF) ;Print out a node - SLF = print on same line as header, XLF = Xtra line feed after header
 I $O(^BGPMUIND(BGPMUYF,BGPIC,BGPNODE,0)) D
 .D W^BGPMUPP(TXT,0,2,BGPPTYPE)
 .I $G(XLF) S X="" D W^BGPMUPP(X,0,1,BGPPTYPE)
 .S BGPY=0 F  S BGPY=$O(^BGPMUIND(BGPMUYF,BGPIC,BGPNODE,BGPY)) Q:BGPY'=+BGPY!(BGPQUIT)  D
 ..I BGPPTYPE="P",$Y>(BGPIOSL-4),'$G(SLF) D HEADER^BGPMUPH Q:BGPQUIT
 ..D W^BGPMUPP(^BGPMUIND(BGPMUYF,BGPIC,BGPNODE,BGPY,0),0,$S($G(SLF):0,1:1),BGPPTYPE)
 Q
SETEXCEL ;EP
 I $G(BGPAREAA) D  Q
 .S X=0 F  S X=$O(BGPSUL(X)) Q:X'=+X  D
 ..S N=^BGPGPDCT(X,0)
 ..S (D,L)=""
 ..S L=$P(N,U,9) I L S L=$O(^AUTTLOC("C",L,0)) I L S D=$P($G(^AUTTLOC(L,1)),U,3),L=$S(L:$P(^DIC(4,L,0),U),1:"?????")
 ..S BGPEI(X)=L_U_$P(N,U,9)_U_D_U_$$DATE^BGP0UTL($P(N,U,13)) S P=5 F Y=1:1:6 S $P(BGPEI(X),U,P)=$$DATE^BGP0UTL($P(N,U,Y)),P=P+1
 ..S BGPEI2(X)=L_U_$P(N,U,9)_U_D_U_$$DATE^BGP0UTL($P(N,U,13)) S P=5 F Y=1:1:6 S $P(BGPEI2(X),U,P)=$$DATE^BGP0UTL($P(N,U,Y)),P=P+1
 ..S BGPEIDV1(X)=L_U_$P(N,U,9)_U_D_U_$$DATE^BGP0UTL($P(N,U,13)) S P=5 F Y=1:1:6 S $P(BGPEIDV1(X),U,P)=$$DATE^BGP0UTL($P(N,U,Y)),P=P+1
 ..S BGPEIDV2(X)=L_U_$P(N,U,9)_U_D_U_$$DATE^BGP0UTL($P(N,U,13)) S P=5 F Y=1:1:6 S $P(BGPEIDV2(X),U,P)=$$DATE^BGP0UTL($P(N,U,Y)),P=P+1
 ..S BGPONN1(X)=L_U_$P(N,U,9)_U_D_U_$$DATE^BGP0UTL($P(N,U,13)) S P=5 F Y=1:1:6 S $P(BGPONN1(X),U,P)=$$DATE^BGP0UTL($P(N,U,Y)),P=P+1
 ..S BGPONN2(X)=L_U_$P(N,U,9)_U_D_U_$$DATE^BGP0UTL($P(N,U,13)) S P=5 F Y=1:1:6 S $P(BGPONN2(X),U,P)=$$DATE^BGP0UTL($P(N,U,Y)),P=P+1
 ..;S BGPONN3(X)=L_U_$P(N,U,9)_U_D_U_$$DATE^BGP0UTL($P(N,U,13)) S P=5 F Y=1:1:6 S $P(BGPONN3(X),U,P)=$$DATE^BGP0UTL($P(N,U,Y)),P=P+1
 ..Q
 .Q
 ;S X=BGPRPT
 ;S N=^BGPGPDCT(X,0)
 ;S L=$P(N,U,9),L=$O(^AUTTLOC("C",L,0)) S D=$P($G(^AUTTLOC(L,1)),U,3),L=$S(L:$P(^DIC(4,L,0),U),1:"?????")
 ;S BGPEI(X)=L_U_$P(N,U,9)_U_D_U_$$DATE^BGP0UTL($P(N,U,13)) S P=5 F Y=1:1:6 S $P(BGPEI(X),U,P)=$$DATE^BGP0UTL($P(N,U,Y)),P=P+1
 Q
EXIT ;
 Q:BGPPTYPE'="P"
 I $E(IOST)="C",IO=IO(0),'$D(ZTQUEUED) W ! S DIR(0)="EO",DIR("A")="End of report.  Press ENTER" D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 Q
ISED(BGPMUYF,BGPIC) ; Determine if measure is an ED measure (for special headings)
 N BGPTITLE
 S BGPTITLE=$P(^BGPMUIND(BGPMUYF,BGPIC,0),U,3)
 Q ($E(BGPTITLE,1,2)="ED")
 Q
C(X,X2,X3) ;
 D COMMA^%DTC
 Q X
