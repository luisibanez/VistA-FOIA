BGP9EOH ; IHS/CMI/LAB - cover page for ELDER 02 Jul 2008 9:27 AM ; 
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
 ;
 I $G(BGPAREAA) D AREACP Q
 I BGPPTYPE="P" W:$D(IOF) @IOF
 D W("Cover Page",1,2,BGPPTYPE)
 D W("*** IHS 2009 Executive Order Quality Transparency Measures Report ***",1,2,BGPPTYPE)
 D W($$RPTVER^BGP9BAN,1,2,BGPPTYPE)
 D W("Date Report Run: "_$$FMTE^XLFDT(DT),1,1,BGPPTYPE)
 D W("Site where Run: "_$P(^DIC(4,DUZ(2),0),U),1,1,BGPPTYPE)
 D W("Report Generated by: "_$$USR,1,1,BGPPTYPE)
 S X="Report Period:  "_$$FMTE^XLFDT(BGPBD)_" to "_$$FMTE^XLFDT(BGPED) D W(X,1,1,BGPPTYPE)
 S X="Previous Year Period:  "_$$FMTE^XLFDT(BGPPBD)_" to "_$$FMTE^XLFDT(BGPPED) D W(X,1,1,BGPPTYPE)
 S X="Baseline Period:  "_$$FMTE^XLFDT(BGPBBD)_" to "_$$FMTE^XLFDT(BGPBED) D W(X,1,1,BGPPTYPE)
 I BGPINDZ="A" D W("Measures: Key Clinical Denominators and Numerators for Executive",0,2,BGPPTYPE)
 I BGPINDZ="A" D W("Order 13410 Quality Transparency Reporting",0,1,BGPPTYPE)
 I BGPINDZ="S" D W("Measures: Selected Key Clinical Denominators and Numerators for Executive",0,2,BGPPTYPE)
 I BGPINDZ="S" D W("Order 13410 Quality Transparency Reporting (User Defined)",0,1,BGPPTYPE)
 S X="Population: "_$S(BGPBEN=1:"AI/AN Only (Classification 01)",BGPBEN=2:"non AI/AN Only (Classification NOT 01)",BGPBEN=3:"All (Both AI/AN and non AI/AN)",1:"") D W(X,0,1,BGPPTYPE)
 D ENDTIME
 D EOHDR
 I $G(BGPEXPT) D
 .D W("A file will be created called BG09"_$P(^AUTTLOC(DUZ(2),0),U,10)_".EO"_BGPRPT_".",0,2,BGPPTYPE)
 .D W("It will reside in the public/export directory.",0,1,BGPPTYPE)
 .D W("This file should be sent to your Area Office.",0,1,BGPPTYPE)
 .;D W("",0,1,BGPPTYPE)
 I BGPROT'="P",'$D(BGPGUI),BGPDELT="F" D W("A delimited output file called "_BGPDELF,0,2,BGPPTYPE) D
 .D W("has been placed in the public directory for your use in Excel or some",0,1,BGPPTYPE)
 .D W("other software package.",0,1,BGPPTYPE)
 .D W("See your site manager to access this file.",0,1,BGPPTYPE)
 .D W("",0,1,BGPPTYPE)
 D W("Community Taxonomy Name: "_$P(^ATXAX(BGPTAXI,0),U),0,2,BGPPTYPE,1,10)
 D W("The following communities are included in this report:",0,1,BGPPTYPE,1,10) D
 .S BGPZZ="",N=0,Y="" F  S BGPZZ=$O(BGPTAX(BGPZZ)) Q:BGPZZ=""  S N=N+1,Y=Y_$S(N=1:"",1:";")_BGPZZ
 .S BGPZZ=0,C=0 F BGPZZ=1:3:N D
 ..D W($E($P(Y,";",BGPZZ),1,20),0,1,BGPPTYPE,1,10)
 ..D W($E($P(Y,";",(BGPZZ+1)),1,20),0,0,BGPPTYPE,2,30)
 ..D W($E($P(Y,";",(BGPZZ+2)),1,20),0,0,BGPPTYPE,3,60)
 ..Q
 D W("",0,1,BGPPTYPE)
 I $G(BGPMFITI) D W("MFI Visit Location Taxonomy Name: "_$P(^ATXAX(BGPMFITI,0),U),0,1,BGPPTYPE,1,10)
 I $G(BGPMFITI) D W("The following locations are used for patient visits in this report:",0,2,BGPPTYPE,1,10) D
 .S BGPZZ="",N=0,Y="" F  S BGPZZ=$O(^ATXAX(BGPMFITI,21,"B",BGPZZ)) Q:BGPZZ=""  S N=N+1,Y=Y_$S(N=1:"",1:";")_$P($G(^DIC(4,BGPZZ,0)),U)
 .S BGPZZ=0,C=0 F BGPZZ=1:3:N D
 ..D W($E($P(Y,";",BGPZZ),1,20),0,1,BGPPTYPE,1,10)
 ..D W($E($P(Y,";",(BGPZZ+1)),1,20),0,0,BGPPTYPE,2,30)
 ..D W($E($P(Y,";",(BGPZZ+2)),1,20),0,0,BGPPTYPE,3,60)
 ..Q
 K BGPX,BGPQUIT
 Q
EOHDR ;
 D W("",0,1,BGPPTYPE)  ;LORI UPDATE NODE WHEN GET AREA HEADER FOR EO REPORT
ONMHDR ;
 I BGPCHSO G ONMHDRC
 S BGPTEXT="ONH1" F BGPJ1=1:1 S BGPX=$T(@BGPTEXT+BGPJ1) Q:$P(BGPX,";;",2)="QUIT"  D
 .S BGPT=$P(BGPX,";;",2)
 .D W(BGPT,0,1,BGPPTYPE)
 I BGPRTC="U" D
 .D W("3. User defines population: a) Indian/Alaska Natives Only - based on",0,1,BGPPTYPE)
 .D W("Classification of 01; b) Non AI/AN (not 01); or c) Both.",0,1,BGPPTYPE)
 I BGPRTC="H" D
 .D W("3. Indian/Alaska Natives Only - based on Classification of 01.",0,1,BGPPTYPE)
 S BGPTEXT="ONH2" F BGPJ1=1:1 S BGPX=$T(@BGPTEXT+BGPJ1) Q:$P(BGPX,";;",2)="QUIT"  D
 .S BGPT=$P(BGPX,";;",2)
 .D W(BGPT,0,1,BGPPTYPE)
 D W(" ",0,1,BGPPTYPE)
 Q
ONMHDRC ;
 S BGPTEXT="ONH1" F BGPJ1=1:1 S BGPX=$T(@BGPTEXT+BGPJ1) Q:$P(BGPX,";;",2)="QUIT"  D
 .S BGPT=$P(BGPX,";;",2)
 .D W(BGPT,0,1,BGPPTYPE)
 I BGPRTC="U" D
 .D W("3. User defines population: a) Indian/Alaska Natives Only - based on",0,1,BGPPTYPE)
 .D W("Classification of 01; b) Non AI/AN (not 01); or c) Both.",0,1,BGPPTYPE)
 I BGPRTC="H" D
 .D W("3. Indian/Alaska Natives Only - based on Classification of 01.",0,1,BGPPTYPE)
 S BGPTEXT="ONH2C" F BGPJ1=1:1 S BGPX=$T(@BGPTEXT+BGPJ1) Q:$P(BGPX,";;",2)="QUIT"  D
 .S BGPT=$P(BGPX,";;",2)
 .D W(BGPT,0,1,BGPPTYPE)
 D W(" ",0,1,BGPPTYPE)
 Q
 ;I $G(BGPAREAA) S BGPNODEP=$S(BGPCHSO&('BGPCHSN):66,(BGPCHSO+BGPCHSN)=2:67,1:66)
 ;I '$G(BGPAREAA) S BGPNODEP=$S(BGPCHSO:64,1:59)
 ;S BGPX=$O(^BGPCTRL("B",2009,0))
 ;S BGPY=0 F  S BGPY=$O(^BGPCTRL(BGPX,BGPNODEP,BGPY)) Q:BGPY'=+BGPY  D
 ;.D W(^BGPCTRL(BGPX,BGPNODEP,BGPY,0),0,1,BGPPTYPE)
 ;.Q
 ;Q
ENDTIME ;
 I $D(BGPET) S BGPTS=(86400*($P(BGPET,",")-$P(BGPBT,",")))+($P(BGPET,",",2)-$P(BGPBT,",",2)),BGPHR=$P(BGPTS/3600,".") S:BGPHR="" BGPHR=0 D
 .S BGPTS=BGPTS-(BGPHR*3600),BGPM=$P(BGPTS/60,".") S:BGPM="" BGPM=0 S BGPTS=BGPTS-(BGPM*60),BGPS=BGPTS D W("RUN TIME (H.M.S): "_BGPHR_"."_BGPM_"."_BGPS,0,2,BGPPTYPE)
 Q
AREACP ;EP - area cover page
 ;
 I BGPPTYPE="P" W:$D(IOF) @IOF
 D W("Cover Page",1,2,BGPPTYPE)
 D W("*** IHS 2009 EXECUTIVE ORDER QUALITY TRANSPARENCY MEASURES REPORT ***",1,2,BGPPTYPE)
 D W("AREA AGGREGATE",1,2,BGPPTYPE)
 D W($$RPTVER^BGP9BAN,1,2,BGPPTYPE)
 D W("Date Report Run: "_$$FMTE^XLFDT(DT),1,1,BGPPTYPE)
 D W("Site where Run: "_$P(^DIC(4,DUZ(2),0),U),1,1,BGPPTYPE)
 D W("Report Generated by: "_$$USR,1,1,BGPPTYPE)
 S X="Report Period:  "_$$FMTE^XLFDT(BGPBD)_" to "_$$FMTE^XLFDT(BGPED) D W(X,1,1,BGPPTYPE)
 S X="Previous Year Period:  "_$$FMTE^XLFDT(BGPPBD)_" to "_$$FMTE^XLFDT(BGPPED) D W(X,1,1,BGPPTYPE)
 S X="Baseline Period:  "_$$FMTE^XLFDT(BGPBBD)_" to "_$$FMTE^XLFDT(BGPBED) D W(X,1,1,BGPPTYPE)
 D W("Measures: Key Clinical Denominators and Numerators for Executive",0,2,BGPPTYPE)
 D W("Order 13410 Quality Transparency Reporting",0,1,BGPPTYPE)
 D W("Population: "_$S(BGPBEN=1:"AI/AN Only (Classification 01)",BGPBEN=2:"non AI/AN Only (Classification NOT 01)",BGPBEN=3:"All (Both AI/AN and non AI/AN)",1:""),0,2,BGPPTYPE)
 ;
 D ENDTIME
 S BGPCHSO="",X=0 F  S X=$O(BGPSUL(X)) Q:X'=+X  I $P(^BGPEOCN(X,0),U,17) S BGPCHSO=1
 S BGPCHSN="",X=0 F  S X=$O(BGPSUL(X)) Q:X'=+X  I '$P(^BGPEOCN(X,0),U,17) S BGPCHSN=1
 D EOHDR
 I BGPROT'="P",'$D(BGPGUI) D W("A delimited output file called "_BGPDELF,0,2,BGPPTYPE) D
 .D W("has been placed in the public directory for your use in Excel or some",0,1,BGPPTYPE)
 .D W("other software package.",0,1,BGPPTYPE)
 .D W("See your site manager to access this file.",0,1,BGPPTYPE)
 .D W("",0,1,BGPPTYPE)
 ;
 D W("EO National Measures filenames: ",0,1,BGPPTYPE),W(BGPFGNT1,15,1,BGPPTYPE)
 D W("Report includes data from the following facilities:",0,2,BGPPTYPE)
 NEW BGPX
 S BGPX="",BGPC=0 F  S BGPX=$O(BGPSUL(BGPX)) Q:BGPX=""  D
 .S X=$P(^BGPEOCN(BGPX,0),U,9),X=$O(^AUTTLOC("C",X,0)) S X=$S(X:$P(^DIC(4,X,0),U),1:"?????")
 .S BGPC=BGPC+1,X=BGPC_".  "_$S($P(^BGPEOCN(BGPX,0),U,17):"*",1:"")_X D W(X,0,1,BGPPTYPE,1,3)
 .Q
 S X=" " D W(X,0,1,BGPPTYPE)
 S X="The following communities are included in this report:" D W(X,0,1,BGPPTYPE,1,1)
 S BGPX="",BGPC=0 F  S BGPX=$O(BGPSUL(BGPX)) Q:BGPX=""  D
 .S X=$P(^BGPEOCN(BGPX,0),U,9),X=$O(^AUTTLOC("C",X,0)) S X=$S(X:$P(^DIC(4,X,0),U),1:"?????")
 .S BGPC=BGPC+1,X=BGPC_".  "_$S($P(^BGPEOCN(BGPX,0),U,17):"*",1:"")_X D W(X,0,1,BGPPTYPE,1,3)
 .;S X="Communities: " D W(X,0,1,BGPPTYPE,1,5)
 .S X="Community Taxonomy Name: "_$P(^BGPEOCN(BGPX,0),U,18) D W(X,0,1,BGPPTYPE,1,5)
 .S BGPXX=0,BGPXN=0,BGPXY="" F  S BGPXX=$O(^BGPEOCN(BGPX,9999,BGPXX)) Q:BGPXX'=+BGPXX  S BGPXN=BGPXN+1,BGPXY=BGPXY_$S(BGPXN=1:"",1:";")_$P(^BGPEOCN(BGPX,9999,BGPXX,0),U)
 .S BGPX1=0,C=0 F BGPX1=1:3:BGPXN D
 ..D W($E($P(BGPXY,";",BGPX1),1,20),0,1,BGPPTYPE,1,10)
 ..D W($E($P(BGPXY,";",(BGPX1+1)),1,20),0,0,BGPPTYPE,2,30)
 ..D W($E($P(BGPXY,";",(BGPX1+2)),1,20),0,0,BGPPTYPE,3,60)
 ..Q
 .I $O(^BGPEOCN(BGPX,1111,0)) D
 ..D W("MFI Visit Locations: ",0,2,BGPPTYPE,1,5) S BGPXX=0,BGPXN=0,BGPXY="" F  S BGPXX=$O(^BGPEOCN(BGPX,1111,BGPXX)) Q:BGPXX'=+BGPXX  S BGPXN=BGPXN+1,BGPXY=BGPXY_$S(BGPXN=1:"",1:";")_$P(^BGPEOCN(BGPX,1111,BGPXX,0),U)
 ..S BGPX1=0,C=0 F BGPX1=1:3:BGPXN D
 ...D W($E($P(BGPXY,";",BGPX1),1,20),0,1,BGPPTYPE,1,10)
 ...D W($E($P(BGPXY,";",(BGPX1+1)),1,20),0,0,BGPPTYPE,2,30)
 ...D W($E($P(BGPXY,";",(BGPX1+2)),1,20),0,0,BGPPTYPE,3,60)
 ..Q
 .Q
 D W(" ",0,1,BGPPTYPE)
 I BGPCHSO D
 .S X=" " D W(X,0,1,BGPPTYPE)
 .S X="* CHS-only site.  Uses Active Clinical CHS Population definition vs. Active Clinical." D W(X,0,1,BGPPTYPE)
 S X=" " D W(X,0,1,BGPPTYPE)
 K BGPX,BGPQUIT
 Q
CTR(X,Y) ;EP - Center X in a field Y wide.
 Q $J("",$S($D(Y):Y,1:IOM)-$L(X)\2)_X
 ;----------
EOP ;EP - End of page.
 Q:$E(IOST)'="C"
 Q:$D(ZTQUEUED)!'(IOT["TRM")!$D(IO("S"))
 NEW DIR
 K DIRUT,DFOUT,DLOUT,DTOUT,DUOUT
 S DIR(0)="E",DIR("A")="Press enter to continue" D ^DIR
 Q
 ;----------
USR() ;EP - Return name of current user from ^VA(200.
 Q $S($G(DUZ):$S($D(^VA(200,DUZ,0)):$P(^(0),U),1:"UNKNOWN"),1:"DUZ UNDEFINED OR 0")
 ;----------
 ;;
W(V,C,F,M,P,T) ;EP
 I $G(F)="" S F=1
 I $G(C)="" S C=0
 I $G(P)="" S P=1
 I $G(T)="" S T=0
 I M="P" D  Q
 .I $Y>(BGPIOSL-2) D EOP W:$D(IOF) @IOF
 .NEW X
 .F X=1:1:F W !
 .I C W $$CTR(V,80)
 .I 'C W ?T,V
 ;set up array
 I '$G(F) S F=0
 NEW %Z
 S Z=""
 S %=$P(^TMP($J,"BGPDEL",0),U)
 F Z=1:1:F S %=%+1 S ^TMP($J,"BGPDEL",%)=""
 S $P(^TMP($J,"BGPDEL",0),U)=%
 I '$D(^TMP($J,"BGPDEL",%)) S ^TMP($J,"BGPDEL",%)=""
 S $P(^TMP($J,"BGPDEL",%),U,P)=V
 Q
ONH1 ;;
 ;;Denominator Definitions used in this Report:
 ;;
 ;;ACTIVE CLINICAL POPULATION:
 ;;1. Must reside in a community specified in the community taxonomy used for
 ;;this report.
 ;;2. Must be alive on the last day of the Report period.
 ;;QUIT
 ;
ONH2 ;;
 ;;4. Must have 2 visits to medical clinics in the 3 years prior to the end
 ;;of the Report period. At least one visit must include: 01 General,
 ;;06 Diabetic, 10 GYN, 12 Immunization, 13 Internal Med, 20 Pediatrics, 24
 ;;Well Child, 28 Family Practice, 57 EPSDT, 70 Women's Health, 80 Urgent, 89
 ;;Evening.  See User Manual for complete description of medical clinics.
 ;;
 ;;USER POPULATION:
 ;;1. Definitions 1-3 above.
 ;;2. Must have been seen at least once in the 3 years prior to the end of
 ;;the Report period, regardless of the clinic type.
 ;;
 ;;See last pages of this report for Performance Summary.
 ;;QUIT
 ;;
ONH2C ;;
 ;;4. Must have 2 CHS visits in the 3 years prior to the end of the Report period.
 ;;
 ;;USER POPULATION:
 ;;1. Definitions 1-3 above.
 ;;2. Must have been seen at least once in the 3 years prior to the end of
 ;;the Report period, regardless of the clinic type.
 ;;
 ;;See last pages of this report for Performance Summary.
 ;;QUIT
 ;;
