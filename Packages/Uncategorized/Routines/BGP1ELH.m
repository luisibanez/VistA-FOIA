BGP1ELH ; IHS/CMI/LAB - cover page for ELDER 25 Jun 2010 10:20 AM ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
 ;
 I $G(BGPAREAA) D AREACP Q
 ;W:$D(IOF) @IOF
 W !!,$$CTR("Cover Page",80)
 W !!,$$CTR("*** IHS 2011 Elder Care Report ***",80)
 W !,$$CTR($$RPTVER^BGP1BAN,80)
 W !,$$CTR("Date Report Run: "_$$FMTE^XLFDT(DT),80)
 W !,$$CTR("Site where Run: "_$P(^DIC(4,DUZ(2),0),U),80)
 W !,$$CTR("Report Generated by: "_$$USR,80)
 S X="Report Period:  "_$$FMTE^XLFDT(BGPBD)_" to "_$$FMTE^XLFDT(BGPED) W !,$$CTR(X,80)
 S X="Previous Year Period:  "_$$FMTE^XLFDT(BGPPBD)_" to "_$$FMTE^XLFDT(BGPPED) W !,$$CTR(X,80)
 S X="Baseline Period:  "_$$FMTE^XLFDT(BGPBBD)_" to "_$$FMTE^XLFDT(BGPBED) W !,$$CTR(X,80)
 I BGPZZ="A" W !!,"Measures: Elder Care Performance Measures"
 I BGPZZ="S" W !!,"Measures: Selected Elder Care Performance Measures (User Defined)"
 W !!,"Population: ",$S(BGPBEN=1:"AI/AN Only (Classification 01)",BGPBEN=2:"non AI/AN Only (Classification NOT 01)",BGPBEN=3:"All (Both AI/AN and non AI/AN)",1:"")
 D ENDTIME
 D ELDERHDR
 I $G(BGPEXPT) W !!,"A file will be created called BG11",$P(^AUTTLOC(DUZ(2),0),U,10)_".EL"_BGPRPT,".",!,"It will reside in the public/export directory.",!,"This file should be sent to your Area Office.",!
 I BGPROT'="P",'$D(BGPGUI) W !!,"A delimited output file called ",BGPDELF,!,"has been placed in the "_$$GETDEDIR^BGP1UTL2()_" directory for your use in Excel or some",!,"other software package.",!,"See your site manager to access this file.",!
 I $G(BGPALLPT) W !!,"All Communities Included.",!
 I '$G(BGPALLPT),'$G(BGPSEAT) W !!?10,"Community Taxonomy Name: ",$P(^ATXAX(BGPTAXI,0),U)
 I '$G(BGPALLPT),'$G(BGPSEAT) W !!?10,"The following communities are included in this report:",! D
 .S BGPZZ="",N=0,Y="" F  S BGPZZ=$O(BGPTAX(BGPZZ)) Q:BGPZZ=""  S N=N+1,Y=Y_$S(N=1:"",1:";")_BGPZZ
 .S BGPZZ=0,C=0 F BGPZZ=1:3:N D
 ..I $Y>(BGPIOSL-3) D EOP
 ..W !?10,$E($P(Y,";",BGPZZ),1,20),?30,$E($P(Y,";",(BGPZZ+1)),1,20),?60,$E($P(Y,";",(BGPZZ+2)),1,20)
 ..Q
 I $G(BGPMFITI) W !!?10,"MFI Visit Location Taxonomy Name: ",$P(^ATXAX(BGPMFITI,0),U)
 I $G(BGPMFITI) W !!?10,"The following locations are used for patient visits in this report:",! D
 .S BGPZZ="",N=0,Y="" F  S BGPZZ=$O(^ATXAX(BGPMFITI,21,"B",BGPZZ)) Q:BGPZZ=""  S N=N+1,Y=Y_$S(N=1:"",1:";")_$P($G(^DIC(4,BGPZZ,0)),U)
 .S BGPZZ=0,C=0 F BGPZZ=1:3:N D
 ..I $Y>(BGPIOSL-3) D EOP
 ..W !?10,$E($P(Y,";",BGPZZ),1,20),?30,$E($P(Y,";",(BGPZZ+1)),1,20),?60,$E($P(Y,";",(BGPZZ+2)),1,20)
 ..Q
 K BGPX,BGPQUIT
 Q
ELDERHDR ;
 W !
 I $G(BGPAREAA) D ELDHDRA Q
 S BGPNODEP=$S(BGPCHSO:26,1:22)
 S BGPNODEP=$S(BGPURBAN:52,1:BGPNODEP)
 S BGPX=$O(^BGPCTRL("B",2011,0))
 S BGPY=0 F  S BGPY=$O(^BGPCTRL(BGPX,BGPNODEP,BGPY)) Q:BGPY'=+BGPY  D
 .I $Y>(BGPIOSL-2) D EOP W:$D(IOF) @IOF
 .W !,^BGPCTRL(BGPX,BGPNODEP,BGPY,0)
 .Q
 Q
ENDTIME ;
 I $D(BGPET) S BGPTS=(86400*($P(BGPET,",")-$P(BGPBT,",")))+($P(BGPET,",",2)-$P(BGPBT,",",2)),BGPHR=$P(BGPTS/3600,".") S:BGPHR="" BGPHR=0 D
 .S BGPTS=BGPTS-(BGPHR*3600),BGPM=$P(BGPTS/60,".") S:BGPM="" BGPM=0 S BGPTS=BGPTS-(BGPM*60),BGPS=BGPTS W !!,"RUN TIME (H.M.S): ",BGPHR,".",BGPM,".",BGPS
 Q
AREACP ;EP - area cover page
 ;
 ;W:$D(IOF) @IOF
 W !!,$$CTR("Cover Page",80)
 W !!,$$CTR("*** IHS 2011 Elder Care Report ***",80)
 W !,$$CTR("AREA AGGREGATE",80)
 W !,$$CTR($$RPTVER^BGP1BAN,80)
 W !,$$CTR("Date Report Run:  "_$$FMTE^XLFDT(DT),80)
 W !,$$CTR("Site where Run:  "_$$VAL^XBDIQ1(9999999.06,DUZ(2),.04))
 W !,$$CTR("Report Generated by:  "_$$USR,80)
 S X="Reporting Period:  "_$$FMTE^XLFDT(BGPBD)_" to "_$$FMTE^XLFDT(BGPED) W !,$$CTR(X,80)
 S X="Previous Year Period:  "_$$FMTE^XLFDT(BGPPBD)_" to "_$$FMTE^XLFDT(BGPPED) W !,$$CTR(X,80)
 S X="Baseline Period:  "_$$FMTE^XLFDT(BGPBBD)_" to "_$$FMTE^XLFDT(BGPBED) W !,$$CTR(X,80)
 W !!,"Measures: Elder Care Performance Measures"
 W !,"Population: ",$S(BGPBEN=1:"AI/AN Only (Classification 01)",BGPBEN=2:"non AI/AN Only (Classification NOT 01)",BGPBEN=3:"All (Both AI/AN and non AI/AN)",1:"")
 D ENDTIME
 S BGPCHSO="",X=0 F  S X=$O(BGPSUL(X)) Q:X'=+X  I $P(^BGPELDCB(X,0),U,17) S BGPCHSO=1
 S BGPCHSN="",X=0 F  S X=$O(BGPSUL(X)) Q:X'=+X  I '$P(^BGPELDCB(X,0),U,17) S BGPCHSN=1
 S BGPURBO="",X=0 F  S X=$O(BGPSUL(X)) Q:X'=+X  I $P(^BGPELDCB(X,0),U,19) S BGPURBO=1
 S BGPURBN="",X=0 F  S X=$O(BGPSUL(X)) Q:X'=+X  I '$P(^BGPELDCB(X,0),U,19) S BGPURBN=1
 D ELDERHDR
 ;I $G(BGPEXPT) W !!,"A file will be created called BG11",$P(^AUTTLOC(DUZ(2),0),U,10)_".EL"_BGPRPT,".",!,"It will reside in the public/export directory.",!,"This file should be sent to your Area Office.",!
 I BGPROT'="P",'$D(BGPGUI) W !!,"A delimited output file called ",BGPDELF,!,"has been placed in the "_$$GETDEDIR^BGP1UTL2()_" directory for your use in Excel or some",!,"other software package.",!,"See your site manager to access this file.",!
 W !!?1,"Report includes data from the following facilities:"
 NEW BGPX
 S BGPX="",BGPC=0 F  S BGPX=$O(BGPSUL(BGPX)) Q:BGPX=""  D
 .S BGPC=BGPC+1
 .S X=$P(^BGPELDCB(BGPX,0),U,9),X=$O(^AUTTLOC("C",X,0)) S X=$S(X:$P(^DIC(4,X,0),U),1:"?????")
 .W !?3,BGPC,".  ",$S($P(^BGPELDCB(BGPX,0),U,17):"*",$P(^BGPELDCB(BGPX,0),U,19):"**",1:""),X
 W !!?1,"The following communities are included in this report:"
 NEW BGPX
 S BGPX="",BGPC=0 F  S BGPX=$O(BGPSUL(BGPX)) Q:BGPX=""  D
 .S BGPC=BGPC+1
 .S X=$P(^BGPELDCB(BGPX,0),U,9),X=$O(^AUTTLOC("C",X,0)) S X=$S(X:$P(^DIC(4,X,0),U),1:"?????")
 .W !!?3,BGPC,".  ",$S($P(^BGPELDCB(BGPX,0),U,17):"*",1:""),X
 .;W !?5,"Communities: " 
 .W !?3,"Community Taxonomy Name: ",$P(^BGPELDCB(BGPX,0),U,18)
 .;W !?5,"Communities: " 
 .S BGPXX=0,BGPXN=0,BGPXY="" F  S BGPXX=$O(^BGPELDCB(BGPX,9999,BGPXX)) Q:BGPXX'=+BGPXX  S BGPXN=BGPXN+1,BGPXY=BGPXY_$S(BGPXN=1:"",1:";")_$P(^BGPELDCB(BGPX,9999,BGPXX,0),U)
 .S BGPX1=0,C=0 F BGPX1=1:3:BGPXN D
 ..W !?10,$E($P(BGPXY,";",BGPX1),1,20),?30,$E($P(BGPXY,";",(BGPX1+1)),1,20),?60,$E($P(BGPXY,";",(BGPX1+2)),1,20)
 .I $O(^BGPELDCB(BGPX,1111,0)) D
 ..W !!?5,"MFI Visit Locations: " S BGPXX=0,BGPXN=0,BGPXY="" F  S BGPXX=$O(^BGPELDCB(BGPX,1111,BGPXX)) Q:BGPXX'=+BGPXX  S BGPXN=BGPXN+1,BGPXY=BGPXY_$S(BGPXN=1:"",1:";")_$P(^BGPELDCB(BGPX,1111,BGPXX,0),U)
 ..S BGPX1=0,C=0 F BGPX1=1:3:BGPXN W !?10,$E($P(BGPXY,";",BGPX1),1,18),?30,$E($P(BGPXY,";",(BGPX1+1)),1,20),?60,$E($P(BGPXY,";",(BGPX1+2)),1,18)
 .Q
 I BGPCHSO D
 .;S X=" " D W^BGP1DP(X,0,1,BGPPTYPE)
 .W !,"* CHS-only site.  Uses Active Clinical CHS Population definition vs. Active Clinical." ;D W^BGP1DP(X,0,1,BGPPTYPE)
 I BGPURBO D
 .;S X=" " D W^BGP1DP(X,0,1,BGPPTYPE)
 .W !,"**Urban Outreach & Referral-only site.  Uses Active Clinical Behavioral Health",!,"Population definition vs. Active Clinical." ;D W^BGP1DP(X,0,1,BGPPTYPE)
 W ! ;S X=" " D W^BGP1DP(X,0,1,BGPPTYPE)
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
 ;;
ELDHDRA ;EP
 W !
 S BGPX=$O(^BGPCTRL("B",2011,0))
 S BGPNODEP=89 D 2
 ;D W^BGP1DP("",0,1,BGPPTYPE)
 I BGPCHSO S BGPTEXT="CHS" F BGPJ1=1:1 S BGPX=$T(@BGPTEXT+BGPJ1) Q:$P(BGPX,";;",2)="QUIT"  D
 .S BGPT=$P(BGPX,";;",2)
 .I BGPPTYPE="P",$Y>(BGPIOSL-2) D EOP
 .W !,BGPT
 I BGPURBO S BGPTEXT="URB" F BGPJ1=1:1 S BGPX=$T(@BGPTEXT+BGPJ1) Q:$P(BGPX,";;",2)="QUIT"  D
 .S BGPT=$P(BGPX,";;",2)
 .I BGPPTYPE="P",$Y>(BGPIOSL-2) D EOP
 .W !,BGPT
 S BGPTEXT="UP" F BGPJ1=1:1 S BGPX=$T(@BGPTEXT+BGPJ1) Q:$P(BGPX,";;",2)="QUIT"  D
 .S BGPT=$P(BGPX,";;",2)
 .I BGPPTYPE="P",$Y>(BGPIOSL-2) D EOP
 .W !,BGPT
 Q
2 S BGPY=0 F  S BGPY=$O(^BGPCTRL(BGPX,BGPNODEP,BGPY)) Q:BGPY'=+BGPY  D
 .I BGPPTYPE="P",$Y>(BGPIOSL-2) D EOP
 .W !,^BGPCTRL(BGPX,BGPNODEP,BGPY,0)
 .Q
 Q
 ;
CHS ;;
 ;;
 ;;ACTIVE CLINICAL CHS POPULATION:
 ;;1. Must reside in a community specified in the community taxonomy used for
 ;;this report.
 ;;2. Must be alive on the last day of the Report period.
 ;;3. User defines: a) Indian/Alaska Natives Only - based on Classification
 ;;of 01; b) Non AI/AN (not 01); or c) Both.
 ;;4. Must have 2 CHS visits in the 3 years prior to the end of the Report period.
 ;;QUIT
 ;;
URB ;;
 ;;
 ;;ACTIVE BEHAVIORAL HEALTH URBAN OUTREACH & REFERRAL POPULATION:
 ;;1. Must reside in a community specified in the community taxonomy used for
 ;;this report.
 ;;2. Must be alive on the last day of the Report period.
 ;;3. User defines: a) Indian/Alaska Natives Only - based on Classification
 ;;of 01; b) Non AI/AN (not 01); or c) Both.
 ;;4. Must have 2 visits to behavioral health or case management clinics in the
 ;;3 years prior to the end of the Report period.
 ;;QUIT
 ;;
UP ;;
 ;;
 ;;USER POPULATION:
 ;;1. Definitions 1-3 above.
 ;;2. Must have been seen at least once in the 3 years prior to the end of
 ;;the Report period, regardless of the clinic type.
 ;;
 ;;QUIT
 ;;
