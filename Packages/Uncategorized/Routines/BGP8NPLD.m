BGP8NPLD ; IHS/CMI/LAB - IHS gpra print ; 30 Jun 2008  5:59 PM
 ;;8.0;IHS CLINICAL REPORTING;**2**;MAR 12, 2008
 ;
NPL ;
 Q:$G(BGPAREAA)
 ;S X=" " D S(X,1,1) D S(X,1,1) D S(X,1,1) S X="PATIENT LISTS" D S(X,1,1) S X=" " D S(X,1,1)
 S BGPINDN=0 F  S BGPINDN=$O(^XTMP("BGP8DNP",BGPJ,BGPH,"LIST",BGPINDN)) Q:BGPINDN'=+BGPINDN  D NPL1
 Q
NPL1 ;EP
 Q:$G(BGPAREAA)
 S BGPO=0 F  S BGPO=$O(^XTMP("BGP8DNP",BGPJ,BGPH,"LIST",BGPINDN,BGPO)) Q:BGPO'=+BGPO  D NPL11
 Q
NPL11 ;
 S BGPL=0 F  S BGPL=$O(^XTMP("BGP8DNP",BGPJ,BGPH,"LIST",BGPINDN,BGPO,BGPL)) Q:BGPL'=+BGPL  D
 .S BGPCOUNT=0,BGPPCNT=0
 .D HEADER
 .S BGPCNT=BGPINDL(BGPINDN,BGPL)
 .I BGPCNT<11!(BGPLIST'="R") S BGPCNT=1 G GO
 .I BGPCNT<100 S BGPCNT=BGPCNT\10 G GO
 .S BGPCNT=10
GO .;
 .S X=$P(^BGPINDE(BGPINDN,0),U,3) D S(X,1,1)
 .;S X=" " D S(X,1,1)
 .G NEXT
 .S X="Denominator(s):" D S(X,1,1)
 .S BGPX=0 F  S BGPX=$O(^BGPINDE(BGPINDN,61,"B",BGPX)) Q:BGPX'=+BGPX  D
 ..S BGPY=0 F  S BGPY=$O(^BGPINDE(BGPINDN,61,"B",BGPX,BGPY)) Q:BGPY'=+BGPY  D
 ...;I $P(^BGPINDE(BGPINDN,61,BGPY,0),U,2)'[BGPRTYPE Q  ;not a denom def for this report
 ...I '$D(^BGPINDE(BGPINDN,61,BGPY,11,"B",BGPRTYPE)) Q  ;not this report type
 ...S BGPZ=0 F  S BGPZ=$O(^BGPINDE(BGPINDN,61,BGPY,1,BGPZ)) Q:BGPZ'=+BGPZ  D
 ....S Y=^BGPINDE(BGPINDN,61,BGPY,1,BGPZ,0) D S(Y,1,1)
 ....Q
 ...Q
 ..Q
 .S X=" " D S(X,1,1)
 .S X="Numerator(s):" D S(X,1,1)
 .S BGPX=0 F  S BGPX=$O(^BGPINDE(BGPINDN,62,"B",BGPX)) Q:BGPX'=+BGPX  D
 ..S BGPY=0 F  S BGPY=$O(^BGPINDE(BGPINDN,62,"B",BGPX,BGPY)) Q:BGPY'=+BGPY  D
 ...;I $P(^BGPINDE(BGPINDN,62,BGPY,0),U,2)'[BGPRTYPE Q  ;not a denom def for this report
 ...I '$D(^BGPINDE(BGPINDN,62,BGPY,11,"B",BGPRTYPE)) Q  ;not this report type
 ...S BGPZ=0 F  S BGPZ=$O(^BGPINDE(BGPINDN,62,BGPY,1,BGPZ)) Q:BGPZ'=+BGPZ  D
 ....S X=^BGPINDE(BGPINDN,62,BGPY,1,BGPZ,0) D S(X,1,1)
 ....Q
 ...Q
 ..Q
 .S X=" " D S(X,1,1)
 .S BGPNODE=11 I BGPRTYPE=1,$O(^BGPINDE(BGPINDN,54,0)) S BGPNODE=54
 .S X="Logic" D S(X,1,1)
 .S BGPX=0 F  S BGPX=$O(^BGPINDE(BGPINDN,BGPNODE,BGPX)) Q:BGPX'=+BGPX  D
 ..S X=^BGPINDE(BGPINDN,BGPNODE,BGPX,0) D S(X,1,1)
 .S X=" " D S(X,1,1) S X="Performance Measure Description" D S(X,1,1) S BGPX=0 F  S BGPX=$O(^BGPINDE(BGPINDN,51,BGPX)) Q:BGPX'=+BGPX  D
 ..S X=^BGPINDE(BGPINDN,51,BGPX,0) D S(X,1,1)
 .I $O(^BGPINDE(BGPINDN,52,0)) S X=" " D S(X,1,1) S X="Past Performance and/or Target" D S(X,1,1) S BGPX=0 F  S BGPX=$O(^BGPINDE(BGPINDN,52,BGPX)) Q:BGPX'=+BGPX  D
 ..S X=^BGPINDE(BGPINDN,52,BGPX,0) D S(X,1,1)
 .I $O(^BGPINDE(BGPINDN,55,0)) S X=" " D S(X,1,1) S X="Source" D S(X,1,1) S BGPX=0 F  S BGPX=$O(^BGPINDE(BGPINDN,55,BGPX)) Q:BGPX'=+BGPX  D
 ..S X=^BGPINDE(BGPINDN,55,BGPX,0) D S(X,1,1)
 .S X=" " D S(X,1,1)
NEXT .;
 .S BGPX=0 F  S BGPX=$O(^BGPNPLE(BGPL,11,BGPX)) Q:BGPX'=+BGPX  D
 ..S X=^BGPNPLE(BGPL,11,BGPX,0) D S(X,1,1)
 .D H1
 .S BGPCOM="" F  S BGPCOM=$O(^XTMP("BGP8DNP",BGPJ,BGPH,"LIST",BGPINDN,BGPO,BGPL,BGPCOM)) Q:BGPCOM=""  D
 ..S BGPSEX="" F  S BGPSEX=$O(^XTMP("BGP8DNP",BGPJ,BGPH,"LIST",BGPINDN,BGPO,BGPL,BGPCOM,BGPSEX)) Q:BGPSEX=""  D
 ...S BGPAGE="" F  S BGPAGE=$O(^XTMP("BGP8DNP",BGPJ,BGPH,"LIST",BGPINDN,BGPO,BGPL,BGPCOM,BGPSEX,BGPAGE)) Q:BGPAGE=""  D
 ....S DFN=0 F  S DFN=$O(^XTMP("BGP8DNP",BGPJ,BGPH,"LIST",BGPINDN,BGPO,BGPL,BGPCOM,BGPSEX,BGPAGE,DFN)) Q:DFN'=+DFN  S BGPCOUNT=BGPCOUNT+1 D PRINTL
 ....Q
 ...Q
 ..Q
 .S X=" " D S(X,1,1) S X="  " D S(X,1,1)
 .S X=" " D S(X,1,1) S X="  " D S(X,1,1)
 .S X="Total # of patients on list: "_+$G(BGPPCNT) D S(X,1,1)
 Q
PRINTL ;print one line
 Q:(BGPCOUNT#BGPCNT)
 S BGPPCNT=BGPPCNT+1
 S X=$E($P(^DPT(DFN,0),U),1,22) D S(X,1,1) S X=$$HRN^AUPNPAT(DFN,DUZ(2)) D S(X,,2) S X=$E(BGPCOM,1,14) D S(X,,3) S X=BGPSEX D S(X,,4) S X=BGPAGE D S(X,,5)
 S X=$P(^XTMP("BGP8DNP",BGPJ,BGPH,"LIST",BGPINDN,BGPO,BGPL,BGPCOM,BGPSEX,BGPAGE,DFN),"|||",1) D S(X,,6)
 S X=$P(^XTMP("BGP8DNP",BGPJ,BGPH,"LIST",BGPINDN,BGPO,BGPL,BGPCOM,BGPSEX,BGPAGE,DFN),"|||",2) D S(X,,7)
 Q
 ;
HEADER ;EP
 S X="**** CONFIDENTIAL PATIENT INFORMATION, COVERED BY THE PRIVACY ACT *****" D S(X,1,1)
 I BGPRTYPE=1 S X="***  IHS 2008 GPRA Performance Patient List  ***" D S(X,1,1)
 I BGPRTYPE=7 S X="***  IHS 2008 Other National Measures Patient List  ***" D S(X,1,1)
 S X=$$RPTVER^BGP8BAN D S(X,1,1)
 S X=$P(^DIC(4,DUZ(2),0),U) D S(X,1,1)
 S X="Report Period: "_$$FMTE^XLFDT(BGPBD)_" to "_$$FMTE^XLFDT(BGPED) D S(X,1,1)
 S X=$S(BGPLIST="A":"All Patients",BGPLIST="R":"Random Patient List",1:"Patient List by Provider: "_BGPLPROV) D S(X,1,1)
 S X=$TR($J("",80)," ","-") D S(X,1,1)
 Q
H1 ;
 S X=" " D S(X,1,1) S X="UP=User Pop; AC=Active Clinical; AD=Active Diabetic;" D S(X,1,1) S X="AAD=Active Adult Diabetic; PREG=Pregnant Female;" D S(X,1,1) S X="IMM=Active IMM Pkg Pt; IHD=Active Ischemic Heart Disease" D S(X,1,1)
 S X=" " D S(X,1,1)
 S X="PATIENT NAME" D S(X,1,1) S X="HRN" D S(X,,2) S X="COMMUNITY" D S(X,,3) S X="SEX" D S(X,,4) S X="AGE" D S(X,,5) S X="DENOMINATOR" D S(X,,6) S X="NUMERATOR" D S(X,,7)
 S X=$TR($J("",80)," ","-") D S(X,1,1)
 Q
S(Y,F,P) ;EP - set up array
 I '$G(F) S F=0
 S %=$P(^TMP($J,"BGPDEL",0),U)+F,$P(^TMP($J,"BGPDEL",0),U)=%
 I '$D(^TMP($J,"BGPDEL",%)) S ^TMP($J,"BGPDEL",%)=""
 S $P(^TMP($J,"BGPDEL",%),U,P)=Y
 Q
CTR(X,Y) ;EP - Center X in a field Y wide.
 Q $J("",$S($D(Y):Y,1:IOM)-$L(X)\2)_X
 ;----------
USR() ;EP - Return name of current user from ^VA(200.
 Q $S($G(DUZ):$S($D(^VA(200,DUZ,0)):$P(^(0),U),1:"UNKNOWN"),1:"DUZ UNDEFINED OR 0")
 ;----------
LOC() ;EP - Return location name from file 4 based on DUZ(2).
 Q $S($G(DUZ(2)):$S($D(^DIC(4,DUZ(2),0)):$P(^(0),U),1:"UNKNOWN"),1:"DUZ(2) UNDEFINED OR 0")
 ;----------
