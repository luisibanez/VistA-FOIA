BGP7CP ; IHS/CMI/LAB - IHS gpra print ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
 ;
PRINT ;
 K ^TMP($J)
 S BGPIOSL=$S($G(BGPGUI):55,1:IOSL)
 S BGPGPG=0
 S BGPQUIT=""
 D HEADER
 I BGPQUIT G END
 D PRINT1
END ;
 K ^XTMP("BGP7C1",BGPJ,BGPH)
 K ^TMP($J)
 D EXIT
 Q
 ;
PRINT1 ;EP
 S BGPORDER=0 F  S BGPORDER=$O(^XTMP("BGP7C1",BGPJ,BGPH,BGPORDER)) Q:BGPORDER'=+BGPORDER!(BGPQUIT)  D
 .S BGPIND=0 S BGPIND=$O(^XTMP("BGP7C1",BGPJ,BGPH,BGPORDER,BGPIND))  D
 ..D HDR Q:BGPQUIT
 ..W !,$P(^BGPCMSIA(BGPIND,0),U,3),!
 ..I $Y>(BGPIOSL-3) D HDR Q:BGPQUIT
 ..D HDR1
 ..Q:BGPQUIT
 ..D LIST1
 Q
HDR1 ;
 S BGPX=0 F  S BGPX=$O(^BGPCMSIA(BGPIND,51,BGPX)) Q:BGPX'=+BGPX!(BGPQUIT)  D
 .I $Y>(BGPIOSL-3) D HDR Q:BGPQUIT  W !,$P(^BGPCMSIA(BGPIND,0),U,3)," (con't)",!
 .W !,^BGPCMSIA(BGPIND,51,BGPX,0)
 Q
LIST1 ;DISPLAY LIST 1
 K BGPL2
 D HDR Q:BGPQUIT  ;W !,$P(^BGPCMSIA(BGPIND,0),U,3)," (con't)",!
 S BGPL1P1=0 D L1H S BGPL1P1=1
 Q:BGPQUIT
 D LIST11
 I $Y>(BGPIOSL-4) D HDR Q:BGPQUIT  D L1H
 W !!,"TOTAL VISITS: ",$G(BGPCOUNT("L1",BGPIND))
 W !!,"TOTAL VISITS THAT WILL BE EXCLUDED: ",($G(BGPCOUNT("L1",BGPIND))-$G(BGPCOUNT("L2",BGPIND)))
 Q:BGPQUIT
LIST2 ;display list 2
 S BGPL2=1
 D HDR K BGPL2P1 Q:BGPQUIT  W !,$P(^BGPCMSIA(BGPIND,0),U,3)," (con't)",!
 S BGPX=0 F  S BGPX=$O(^BGPCMSIA(BGPIND,52,BGPX)) Q:BGPX'=+BGPX!(BGPQUIT)  D
 .I $Y>(BGPIOSL-2) D HDR Q:BGPQUIT  W !,$P(^BGPCMSIA(BGPIND,0),U,3)," (con't)",!
 .W !,^BGPCMSIA(BGPIND,52,BGPX,0)
 .Q
 S BGPL2P1=1 D HDR K BGPL2P1 Q:BGPQUIT  W !,$P(^BGPCMSIA(BGPIND,0),U,3)," (con't)",!
 D L2H
 Q:BGPQUIT
 D LIST12
 I $Y>(BGPIOSL-3) D HDR Q:BGPQUIT  W !,$P(^BGPCMSIA(BGPIND,0),U,3)," (con't)",! D L2H
 W !!,"TOTAL VISITS: ",$G(BGPCOUNT("L2",BGPIND))
 Q
LIST11 ;
 S BGPNAME="" F  S BGPNAME=$O(^XTMP("BGP7C1",BGPJ,BGPH,BGPORDER,BGPIND,"LIST 1",BGPNAME)) Q:BGPNAME=""!(BGPQUIT)  D
 .S DFN=0 F  S DFN=$O(^XTMP("BGP7C1",BGPJ,BGPH,BGPORDER,BGPIND,"LIST 1",BGPNAME,DFN)) Q:DFN'=+DFN  D
 ..S BGPVSIT=0 F  S BGPVSIT=$O(^XTMP("BGP7C1",BGPJ,BGPH,BGPORDER,BGPIND,"LIST 1",BGPNAME,DFN,BGPVSIT)) Q:BGPVSIT'=+BGPVSIT!(BGPQUIT)  D
 ...S BGPVAL=^XTMP("BGP7C1",BGPJ,BGPH,BGPORDER,BGPIND,"LIST 1",BGPNAME,DFN,BGPVSIT)
 ...I $Y>(BGPIOSL-3) D HDR Q:BGPQUIT  S BGPL1P1=1 D L1H
 ...W !,$E($P(BGPVAL,U,1),1,23),?25,$P(BGPVAL,U,2),?33,$P(BGPVAL,U,3),?36,$P(BGPVAL,U,4),?40,$P(BGPVAL,U,5),?60,$P(BGPVAL,U,8)
 ...;I $$DOD^AUPNPAT(DFN)]"" W !!?2,"Date of Death: ",$$DOD^AUPNPAT(DFN,"E")
 ...W !?2,"DISCHARGE TYPE: ",$P(BGPVAL,U,7)
 ...W !?2,"DX: ",$P(BGPVAL,U,6)
 ...I $P(BGPVAL,U,12)]"" W !?2,$P(BGPVAL,U,12)
 Q
LIST12 ;
 S BGPNAME="" F  S BGPNAME=$O(^XTMP("BGP7C1",BGPJ,BGPH,BGPORDER,BGPIND,"LIST 2",BGPNAME)) Q:BGPNAME=""!(BGPQUIT)  D
 .S DFN=0 F  S DFN=$O(^XTMP("BGP7C1",BGPJ,BGPH,BGPORDER,BGPIND,"LIST 2",BGPNAME,DFN)) Q:DFN'=+DFN  D
 ..S BGPVSIT=0 F  S BGPVSIT=$O(^XTMP("BGP7C1",BGPJ,BGPH,BGPORDER,BGPIND,"LIST 2",BGPNAME,DFN,BGPVSIT)) Q:BGPVSIT'=+BGPVSIT!(BGPQUIT)  D
 ...S BGPVAL=^XTMP("BGP7C1",BGPJ,BGPH,BGPORDER,BGPIND,"LIST 2",BGPNAME,DFN,BGPVSIT)
 ...I $Y>(BGPIOSL-3) D HDR Q:BGPQUIT  W !,$P(^BGPCMSIA(BGPIND,0),U,3)," (con't)",! D L2H
 ...W !!,$E($P(BGPVAL,U,1),1,23),?25,$P(BGPVAL,U,2),?33,$P(BGPVAL,U,3),?36,$P(BGPVAL,U,4),?40,$P(BGPVAL,U,5),?60,$P(BGPVAL,U,8)
 ...I $$DOD^AUPNPAT(DFN)]"" W !?2,"Date of Death: ",$$DOD^AUPNPAT(DFN,"E")
 ...W !?3,"DISCHARGE TYPE: ",$P(BGPVAL,U,7),!?3,$P(BGPVAL,U,6)
 ...S BGPY=0 F  S BGPY=$O(^XTMP("BGP7C1",BGPJ,BGPH,BGPORDER,BGPIND,"LIST 2",BGPNAME,DFN,BGPVSIT,BGPY)) Q:BGPY'=+BGPY!(BGPQUIT)  D LIST13
 Q
LIST13 ;
 S BGPT=$O(^XTMP("BGP7C1",BGPJ,BGPH,BGPORDER,BGPIND,"LIST 2",BGPNAME,DFN,BGPVSIT,BGPY,""))
 I $Y>(BGPIOSL-5) D HDR Q:BGPQUIT  W !,$P(^BGPCMSIA(BGPIND,0),U,3)," (con't)",! D L2H
 W !?1,BGPT,"  ",^XTMP("BGP7C1",BGPJ,BGPH,BGPORDER,BGPIND,"LIST 2",BGPNAME,DFN,BGPVSIT,BGPY,BGPT)
 S BGPC=0 F  S BGPC=$O(^XTMP("BGP7C1",BGPJ,BGPH,BGPORDER,BGPIND,"LIST 2",BGPNAME,DFN,BGPVSIT,BGPY,BGPT,BGPC)) Q:BGPC'=+BGPC!(BGPQUIT)  D
 .I $Y>(BGPIOSL-3) D HDR Q:BGPQUIT   W !,$P(^BGPCMSIA(BGPIND,0),U,3)," (con't)",! D L2H
 .S X=^XTMP("BGP7C1",BGPJ,BGPH,BGPORDER,BGPIND,"LIST 2",BGPNAME,DFN,BGPVSIT,BGPY,BGPT,BGPC)
 .I X["qty: " W !?3,$P(X,"qty: ",1),!?3,"qty: ",$P(X,"qty: ",2) Q
 .W !?3,^XTMP("BGP7C1",BGPJ,BGPH,BGPORDER,BGPIND,"LIST 2",BGPNAME,DFN,BGPVSIT,BGPY,BGPT,BGPC)
 Q
L1H ;list one header
 S BGPX=0 F  S BGPX=$O(^BGPCMSIA(BGPIND,55,BGPX)) Q:BGPX'=+BGPX!(BGPQUIT)  D
 .I $Y>(BGPIOSL-2) D HDR Q:BGPQUIT
 .W !,^BGPCMSIA(BGPIND,55,BGPX,0)
 .Q
 I 'BGPL1P1 W ! S BGPX=0 F  S BGPX=$O(^BGPCMSIA(BGPIND,54,BGPX)) Q:BGPX'=+BGPX!(BGPQUIT)  D
 .I $Y>(BGPIOSL-2) D HDR Q:BGPQUIT
 .W !,^BGPCMSIA(BGPIND,54,BGPX,0)
 .Q
 W !,$TR($J("",80)," ","-")
 W !,"PATIENT NAME",?25,"HRN",?32,"SEX",?36,"AGE",?40,"HOSP DATES",?60,"ADMISSION TYPE"
 W !,$TR($J("",80)," ","-")
 W !,"* Visits will be excluded from Visit List that has RPMS exclusion",!,"logic applied."
 Q
L2H ;
 W !,$$CTR("PATIENT LIST",80)
 I BGPIND=1 D
 .W !,$$CTR("ALL PATIENTS DISCHARGED WITH AMI DX WHO WERE NOT",80)
 .W !,$$CTR("EXCLUDED BASED ON RPMS LOGIC, W/RELATED RPMS DATA",80)
 I BGPIND=2 D
 .W !,$$CTR("ALL PATIENTS DISCHARGED WITH HEART FAILURE DX WHO WERE NOT",80)
 .W !,$$CTR("EXCLUDED BASED ON RPMS LOGIC, W/RELATED RPMS DATA",80)
 I BGPIND=3 D
 .W !,$$CTR("ALL PATIENTS DISCHARGED WITH PNEUMONIA DX WHO WERE NOT",80)
 .W !,$$CTR("EXCLUDED BASED ON RPMS LOGIC, W/RELATED RPMS DATA",80)
 W !,$$CTR("PLEASE NOTE:  The patient's chart should be reviewed",80)
 W !,$$CTR("to identify other data not listed here.",80)
 W !,$TR($J("",80)," ","-")
 W !,"PATIENT NAME",?25,"HRN",?32,"SEX",?36,"AGE",?40,"HOSP DATES",?60,"ADMISSION TYPE"
 W !,$TR($J("",80)," ","-")
 Q
HDR ;
 G:'BGPGPG HEADER1
 K DIR I $E(IOST)="C",IO=IO(0),'$D(ZTQUEUED) W ! S DIR(0)="EO" D ^DIR K DIR I Y=0!(Y="^")!($D(DTOUT)) S BGPQUIT=1 Q
HEADER1 ;
 W:$D(IOF) @IOF S BGPGPG=BGPGPG+1
 I $G(BGPGUI) W "ZZZZZZZ",!  ;maw
 W $P(^VA(200,DUZ,0),U,2),?35,$$FMTE^XLFDT(DT),?70,"Page ",BGPGPG,!
 W $$CTR("*** IHS 2007 CMS Hospital Quality Reporting Initiative ***",80)
 W !,$$CTR("Hospital: "_$P(^DIC(4,BGPHOSP,0),U),80)
 S X="Report Period:  "_$$FMTE^XLFDT(BGPBD)_" to "_$$FMTE^XLFDT(BGPED) W !,$$CTR(X,80)
 W !,$TR($J("",80)," ","-")
 Q
EXIT ;
 I $E(IOST)="C",IO=IO(0),'$D(ZTQUEUED) W ! S DIR(0)="EO",DIR("A")="End of report.  Press ENTER" D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 Q
C(X,X2,X3) ;
 D COMMA^%DTC
 Q X
HEADER ;
 W:$D(IOF) @IOF
 W $$CTR("Cover Page",80)
 W !,$$CTR("*** IHS 2007 CMS Hospital Quality Reporting Initiative ***",80)
 W !,$$CTR("CRS 2007, Version 7.0",80)
 W !,$$CTR("Date Report Run: "_$$FMTE^XLFDT(DT),80)
 W !,$$CTR("Hospital: "_$P(^DIC(4,BGPHOSP,0),U),80)
 W !,$$CTR("Report Generated by: "_$$USR,80)
 S X="Report Period:  "_$$FMTE^XLFDT(BGPBD)_" to "_$$FMTE^XLFDT(BGPED) W !,$$CTR(X,80)
 D ENDTIME
 W !
 S BGPX=$O(^BGPCTRL("B",2007,0))
 S BGPY=0 F  S BGPY=$O(^BGPCTRL(BGPX,21,BGPY)) Q:BGPY'=+BGPY!(BGPQUIT)  D
 .I $Y>(BGPIOSL-1) D HDR Q:$D(BGPQUIT)
 .W !,^BGPCTRL(BGPX,21,BGPY,0)
 .Q
 K BGPX
 Q
ENDTIME ;
 I $D(BGPET) S BGPTS=(86400*($P(BGPET,",")-$P(BGPBT,",")))+($P(BGPET,",",2)-$P(BGPBT,",",2)),BGPHR=$P(BGPTS/3600,".") S:BGPHR="" BGPHR=0 D
 .S BGPTS=BGPTS-(BGPHR*3600),BGPM=$P(BGPTS/60,".") S:BGPM="" BGPM=0 S BGPTS=BGPTS-(BGPM*60),BGPS=BGPTS S X="RUN TIME (H.M.S): "_BGPHR_"."_BGPM_"."_BGPS W !,$$CTR(X,80)
 Q
CTR(X,Y) ;EP - Center X in a field Y wide.
 Q $J("",$S($D(Y):Y,1:80)-$L(X)\2)_X
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
