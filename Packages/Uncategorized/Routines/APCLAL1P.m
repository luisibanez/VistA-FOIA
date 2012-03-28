APCLAL1P ; IHS/CMI/LAB - list refusals ; 
 ;;2.0;IHS PCC SUITE;**2**;MAY 14, 2009
 ;
 ;
PRINT ;EP - called from xbdbque
 D PRINT1
 D DONE
 Q
PRINT1 ;
 S APCRPG=0 K APCRQUIT
 K APCRLSTP
 I '$D(^XTMP("APCLAL1",APCRJ,APCRH)) D HEADER W !!,"No data to report.",! G DONE
 D HEADER
 S APCRTOT=$$TOT
 W !,"     Total Number of Patients screened",?40,$J($$COM(APCRTOT,0),8)
 D RES
 Q:$$END
 D GENDER
 Q:$$END
 D AGE
 Q:$$END
 D PRVSC
 Q:$$END
 D PRVV
 Q:$$END
 D DESPRV
 Q:$$END
 D CLINIC
 Q:$$END
 D DATE
 Q:$$END
 D MH
 Q:$$END
 D SS
 Q:$$END
 D CD
 Q:$$END
 K ^TMP($J)
 I APCRLIST D LIST
 Q
RES ;
 Q:'$D(APCRTALL(1))
 ;TALLY BY RESULT FIRST
 K APCRRES S X=0 F  S X=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)) Q:X'=+X  D
 .S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)  ;S D=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,""),-1) S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,D)
 .S R=$P(APCRY,U,2) S R=$P(R,";")_"  "_$P(R,";",2) S:R="" R="NO RESULT RECORDED" S APCRRES(R)=$G(APCRRES(R))+1
 W !
 W !,"                              By Result",!
 S APCRX="" F  S APCRX=$O(APCRRES(APCRX)) Q:APCRX=""!($D(APCRQUIT))  D
 .S Y=$L(APCRX),Y=38-Y W !?Y,APCRX,?40,$J($$COM($G(APCRRES(APCRX)),0),8),?55,$$PER(APCRRES(APCRX),APCRTOT) K APCRRES(APCRX)
 Q
GENDER ;
 Q:'$D(APCRTALL(2))
 ;TALLY BY GENDER OF PATIENT
 K APCRRES S X=0 F  S X=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)) Q:X'=+X  D
 .S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)  ;S D=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,""),-1) S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,D)
 .S R=$P(APCRY,U,3) S APCRRES(R)=$G(APCRRES(R))+1
 W !
 W !,"                              By Gender",!
 S APCRX="" F  S APCRX=$O(APCRRES(APCRX)) Q:APCRX=""!($D(APCRQUIT))  D
 .Q:$$END
 .S Y=$L(APCRX),Y=38-Y W !?Y,APCRX,?40,$J($$COM($G(APCRRES(APCRX)),0),8),?55,$$PER(APCRRES(APCRX),APCRTOT) K APCRRES(APCRX)
 .Q
 Q
AGE ;
 Q:'$D(APCRTALL(3))
 ;TALLY BY age OF PATIENT
 K APCRRES S X=0 F  S X=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)) Q:X'=+X  D
 .S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)  ;S D=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,""),-1) S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,D)
 .S R=$P(APCRY,U,4) S APCRRES(R)=$G(APCRRES(R))+1
 W !
 W !,"                                By Age",!
 S APCRX="" F  S APCRX=$O(APCRRES(APCRX)) Q:APCRX=""!($D(APCRQUIT))  D
 .Q:$$END
 .S Y=$L(APCRX_" yrs"),Y=38-Y W !?Y,APCRX," yrs",?40,$J($$COM($G(APCRRES(APCRX)),0),8),?55,$$PER(APCRRES(APCRX),APCRTOT) K APCRRES(APCRX)
 Q
PRVSC ;
 Q:'$D(APCRTALL(4))
 ;TALLY BY PRIMARY provider OF service
 K APCRRES S X=0 F  S X=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)) Q:X'=+X  D
 .S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)  ;S D=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,""),-1) S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,D)
 .S R=$P(APCRY,U,5) S:R="" R="UNKNOWN" S APCRRES(R)=$G(APCRRES(R))+1
 W !
 W !,"              By Provider who screened",!
 S APCRX="" F  S APCRX=$O(APCRRES(APCRX)) Q:APCRX=""!($D(APCRQUIT))  D
 .Q:$$END
 .S Y=$L(APCRX),Y=38-Y W !?Y,APCRX,?40,$J($$COM($G(APCRRES(APCRX)),0),8),?55,$$PER(APCRRES(APCRX),APCRTOT) K APCRRES(APCRX)
 Q
PRVV ;
 Q:'$D(APCRTALL(7))
 K APCRRES S X=0 F  S X=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)) Q:X'=+X  D
 .S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)  ;S D=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,""),-1) S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,D)
 .S R=$P(APCRY,U,7) S:R="" R="UNKNOWN" S APCRRES(R)=$G(APCRRES(R))+1
 W !
 W !,"           By Primary Provider of Visit",!
 S APCRX="" F  S APCRX=$O(APCRRES(APCRX)) Q:APCRX=""!($D(APCRQUIT))  D
 .Q:$$END
 .S Y=$L(APCRX),Y=38-Y W !?Y,APCRX,?40,$J($$COM($G(APCRRES(APCRX)),0),8),?55,$$PER(APCRRES(APCRX),APCRTOT) K APCRRES(APCRX)
 Q
DESPRV ;
 Q:'$D(APCRTALL(11))
 K APCRRES S X=0 F  S X=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)) Q:X'=+X  D
 .S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)  ;S D=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,""),-1) S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,D)
 .S R=$P(APCRY,U,11) S:R="" R="UNKNOWN" S APCRRES(R)=$G(APCRRES(R))+1
 W !
 W !,"     By Designated Primary Care Provider",!
 S APCRX="" F  S APCRX=$O(APCRRES(APCRX)) Q:APCRX=""!($D(APCRQUIT))  D
 .Q:$$END
 .S Y=$L(APCRX),Y=38-Y W !?Y,APCRX,?40,$J($$COM($G(APCRRES(APCRX)),0),8),?55,$$PER(APCRRES(APCRX),APCRTOT) K APCRRES(APCRX)
 Q
MH ;
 Q:'$D(APCRTALL(8))
 K APCRRES S X=0 F  S X=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)) Q:X'=+X  D
 .S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)  ;S D=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,""),-1) S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,D)
 .S R=$P(APCRY,U,8) S:R="" R="UNKNOWN" S APCRRES(R)=$G(APCRRES(R))+1
 W !
 W !,"     By Designated Mental Health Provider",!
 S APCRX="" F  S APCRX=$O(APCRRES(APCRX)) Q:APCRX=""!($D(APCRQUIT))  D
 .Q:$$END
 .S Y=$L(APCRX),Y=38-Y W !?Y,APCRX,?40,$J($$COM($G(APCRRES(APCRX)),0),8),?55,$$PER(APCRRES(APCRX),APCRTOT) K APCRRES(APCRX)
 Q
SS ;
 Q:'$D(APCRTALL(9))
 K APCRRES S X=0 F  S X=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)) Q:X'=+X  D
 .S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)  ;S D=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,""),-1) S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,D)
 .S R=$P(APCRY,U,9) S:R="" R="UNKNOWN" S APCRRES(R)=$G(APCRRES(R))+1
 W !
 W !,"    By Designated Social Services Provider",!
 S APCRX="" F  S APCRX=$O(APCRRES(APCRX)) Q:APCRX=""!($D(APCRQUIT))  D
 .Q:$$END
 .S Y=$L(APCRX),Y=38-Y W !?Y,APCRX,?40,$J($$COM($G(APCRRES(APCRX)),0),8),?55,$$PER(APCRRES(APCRX),APCRTOT) K APCRRES(APCRX)
 Q
CD ;
 Q:'$D(APCRTALL(10))
 K APCRRES S X=0 F  S X=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)) Q:X'=+X  D
 .S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)  ;S D=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,""),-1) S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,D)
 .S R=$P(APCRY,U,10) S:R="" R="UNKNOWN" S APCRRES(R)=$G(APCRRES(R))+1
 W !
 W !,"     By Designated A/SA Provider",!
 S APCRX="" F  S APCRX=$O(APCRRES(APCRX)) Q:APCRX=""!($D(APCRQUIT))  D
 .Q:$$END
 .S Y=$L(APCRX),Y=38-Y W !?Y,APCRX,?40,$J($$COM($G(APCRRES(APCRX)),0),8),?55,$$PER(APCRRES(APCRX),APCRTOT) K APCRRES(APCRX)
 Q
CLINIC ;
 Q:'$D(APCRTALL(5))
 ;TALLY BY clinic
 K APCRRES S X=0 F  S X=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)) Q:X'=+X  D
 .S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)  ;S D=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,""),-1) S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,D)
 .S R=$P(APCRY,U,6) S:R="" R="UNKNOWN" S APCRRES(R)=$G(APCRRES(R))+1
 W !
 W !,"                              By Clinic",!
 S APCRX="" F  S APCRX=$O(APCRRES(APCRX)) Q:APCRX=""!($D(APCRQUIT))  D
 .Q:$$END
 .S Y=$L(APCRX),Y=38-Y W !?Y,APCRX,?40,$J($$COM($G(APCRRES(APCRX)),0),8),?55,$$PER(APCRRES(APCRX),APCRTOT) K APCRRES(APCRX)
 Q
DATE ;
 Q:'$D(APCRTALL(6))
 ;TALLY BY date OF service
 K ^TMP($J) S X=0 F  S X=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)) Q:X'=+X  D
 .S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)  ;S D=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,""),-1) S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X,D)
 .S R=$P(APCRY,U,1) S ^TMP($J,R)=$G(^TMP($J,R))+1
 W !
 W !,"                               By Date",!
 S APCRX="" F  S APCRX=$O(^TMP($J,APCRX)) Q:APCRX=""!($D(APCRQUIT))  D
 .Q:$$END
 .S Y=$L($$FMTE^XLFDT(APCRX)),Y=38-Y W !?Y,$$FMTE^XLFDT(APCRX),?40,$J($$COM($G(^TMP($J,APCRX)),0),8),?55,$$PER(^TMP($J,APCRX),APCRTOT) K ^TMP($J,APCRX)
 Q
 ;
PER(N,D) ;return % of n/d
 I 'D Q "0%"
 NEW Z
 S Z=N/D,Z=Z*100,Z=$J(Z,5,1)
 Q $$STRIP^XLFSTR(Z," ")_"%"
COM(X,X2,X3) ;
 D COMMA^%DTC
 Q $$STRIP^XLFSTR(X," ")
END() ;
 I $Y<(IOSL-3) Q 0
 D HEADER
 I $D(APCRQUIT) Q 1
 Q 0
ENDL() ;
 I $Y<(IOSL-8) Q 0
 D HEADER
 I $D(APCRQUIT) Q 1
 Q 0
TOT() ;
 NEW C,X
 S C=0
 S X=0 F  S X=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",X)) Q:X'=+X  S C=C+1
 Q C
HEADER ;EP
 G:'APCRPG HEADER1
 K DIR I $E(IOST)="C",IO=IO(0) W ! S DIR(0)="EO" D ^DIR K DIR I Y=0!(Y="^")!($D(DTOUT)) S APCRQUIT="" Q
HEADER1 ;
 W:$D(IOF) @IOF S APCRPG=APCRPG+1
 W !?3,$P(^VA(200,DUZ,0),U,2),?35,$$FMTE^XLFDT(DT),?70,"Page ",APCRPG,!
 W !,$$CTR("***  ALCOHOL SCREENING PATIENT TALLY"_$S(APCRLIST:" AND PATIENT LISTING",1:"")_"  ***",80),!
 S X="Screening Dates: "_$$FMTE^XLFDT(APCRBD)_" to "_$$FMTE^XLFDT(APCRED) W $$CTR(X,80),!
 I APCLEXBH S X="This report includes data from the Behavioral Health Clinics" W $$CTR(X,80),!
 I 'APCLEXBH S X="This report excludes data from the Behavioral Health Clinics" W $$CTR(X,80),!
 I $G(APCRLSTP) W !?35,"DATE",!,"PATIENT NAME",?22,"HRN",?29,"AGE",?35,"SCREENED",?55,"CLINIC"
 W !,$TR($J("",80)," ","-")
 I '$G(APCRLSTP) W !?46,"#",?53,"% of patients"
 Q
DONE ;
 K ^TMP($J)
 K ^XTMP("APCLAL1",APCRJ,APCRH)
 D EOP
 Q
CTR(X,Y) ;EP - Center X in a field Y wide.
 Q $J("",$S($D(Y):Y,1:IOM)-$L(X)\2)_X
 ;----------
EOP ;EP - End of page.
 Q:$E(IOST)'="C"
 Q:IO'=IO(0)
 Q:$D(ZTQUEUED)!'(IOT="TRM")!$D(IO("S"))
 NEW DIR
 K DIRUT,DFOUT,DLOUT,DTOUT,DUOUT
 W !
 S DIR("A")="End of Report.  Press Enter",DIR(0)="E" D ^DIR
 Q
 ;----------
USR() ;EP - Return name of current user from ^VA(200.
 Q $S($G(DUZ):$S($D(^VA(200,DUZ,0)):$P(^(0),U),1:"UNKNOWN"),1:"DUZ UNDEFINED OR 0")
 ;----------
LOC() ;EP - Return location name from file 4 based on DUZ(2).
 Q $S($G(DUZ(2)):$S($D(^DIC(4,DUZ(2),0)):$P(^(0),U),1:"UNKNOWN"),1:"DUZ(2) UNDEFINED OR 0")
 ;----------
LIST ;EP - called from xbdbque
 S APCRPG=0 K APCRQUIT
 S APCRLSTP=1
 D HEADER
 K ^TMP($J)
 ;resort by sort item
 S DFN=0 F  S DFN=$O(^XTMP("APCLAL1",APCRJ,APCRH,"PTS",DFN)) Q:DFN'=+DFN  S APCRY=^XTMP("APCLAL1",APCRJ,APCRH,"PTS",DFN) D
 .D @APCRSORT
 .I APCRSORV="" S APCRSORV="--"
 .S ^TMP($J,"PTS",APCRSORV,DFN)=APCRY
 .Q
 S APCRSORV="" F  S APCRSORV=$O(^TMP($J,"PTS",APCRSORV)) Q:APCRSORV=""!($D(APCRQUIT))  D
 .S DFN=0 F  S DFN=$O(^TMP($J,"PTS",APCRSORV,DFN)) Q:DFN'=+DFN!($D(APCRQUIT))  D
 ..Q:$$ENDL
 ..S APCRY=^TMP($J,"PTS",APCRSORV,DFN)
 ..W !!,$E($P(^DPT(DFN,0),U),1,20),?22,$$HRN^AUPNPAT(DFN,DUZ(2)),?29,$P(APCRY,U,4),?33,$P(^DPT(DFN,0),U,2),?35,$$DT($P(APCRY,U,1)),?55,$E($P(APCRY,U,6),1,20)
 ..W !?3,"Type/Result: ",$P($P(APCRY,U,2),";")_"  "_$P($P(APCRY,U,2),";",2)
 ..I $P(APCRY,U,12)]"" W !?3,"Comment: ",$P(APCRY,U,12)
 ..I $P(APCRY,U,20)="PCC" S APCRV=$P(APCRY,U,14) I APCRV,$D(^AUPNVPOV("AD",APCRV)) D
 ...S APCRC=0 W !?3,"DXs: "
 ...S APCRX=0 F  S APCRX=$O(^AUPNVPOV("AD",APCRV,APCRX)) Q:APCRX'=+APCRX!($D(APCRQUIT))  D
 ....S APCRC=APCRC+1
 ....W:APCRC'=1 ! W ?8,$$VAL^XBDIQ1(9000010.07,APCRX,.01),?17,$E($$VAL^XBDIQ1(9000010.07,APCRX,.04),1,60)
 ..I $P(APCRY,U,20)="BH" S APCRV=$P(APCRY,U,15) I APCRV,$D(^AMHRPRO("AD",APCRV)) D
 ...S APCRC=0 W !?3,"DXs: "
 ...S APCRX=0 F  S APCRX=$O(^AMHRPRO("AD",APCRV,APCRX)) Q:APCRX'=+APCRX!($D(APCRQUIT))  D
 ....S APCRC=APCRC+1
 ....W:APCRC'=1 ! W ?8,$$VAL^XBDIQ1(9002011.01,APCRX,.01),?17,$E($$VAL^XBDIQ1(9002011.01,APCRX,.04),1,60)
 ..W !?3,"Primary Provider on Visit: ",?31,$P(APCRY,U,7)
 ..W !?3,"    Provider who screened: ",?31,$P(APCRY,U,5)
 ..I 'APCRDP W ! Q
 ..K APCRX S X=$$VAL^XBDIQ1(9002011.55,DFN,.02) I X]"" S APCRX("MENTAL HEALTH")=X
 ..S X=$$VAL^XBDIQ1(9002011.55,DFN,.03) I X]"" S APCRX("SOCIAL SERVICES")=X
 ..S X=$$VAL^XBDIQ1(9002011.55,DFN,.04) I X]"" S APCRX("CHEMICAL DEPENDENCY")=X
 ..S X=$$VAL^XBDIQ1(9000001,DFN,.14) I X]"" S APCRX("DESIGNATED PRIMARY PROVIDER")=X
 ..S APCRXX=0 F  S APCRXX=$O(^BDPRECN("C",DFN,APCRXX)) Q:APCRXX'=+APCRXX  D
 ...S A=$$VAL^XBDIQ1(90360.1,APCRXX,.01) I '$D(APCRX(A)) S APCRX(A)=$$VAL^XBDIQ1(90360.1,APCRXX,.03)
 ..Q:'$D(APCRX)
 ..W !?3,"     Designated Providers: "
 ..S APCRX="",APCRC=0 F  S APCRX=$O(APCRX(APCRX)) Q:APCRX=""!($D(APCRQUIT))  D
 ...Q:$$END
 ...S APCRC=APCRC+1
 ...W:APCRC'=1 ! W ?31,$S(APCRX="DESIGNATED PRIMARY PROVIDER":"PRIMARY CARE",1:APCRX),": ",APCRX(APCRX)
 Q
H ;
 S APCRSORV=$$HRN^AUPNPAT(DFN,DUZ(2))
 Q
N ;
 S APCRSORV=$P(^DPT(DFN,0),U)
 Q
P ;
 S APCRSORV=$P(APCRY,U,5)
 Q
R ;
 S APCRSORV=$P($P(APCRY,U,2),";")_"  "_$P($P(APCRY,U,2),";",2)
 Q
D ;
 S APCRSORV=$P(APCRY,U,1)
 Q
A S APCRSORV=$P(APCRY,U,4)
 Q
G ;
 S APCRSORV=$P(APCRY,U,3)
 Q
C ;
 S APCRSORV=$P(APCRY,U,6)
 Q
T ;
 S %=$$HRN^AUPNPAT(DFN,DUZ(2))
 S %=%+10000000,%=$E(%,7,8)_"-"_+$E(%,2,8)
 S APCRSORV=%
 Q
DT(D) ;EP
 I D="" Q ""
 Q $E(D,4,5)_"/"_$E(D,6,7)_"/"_$E(D,2,3)
 ;
