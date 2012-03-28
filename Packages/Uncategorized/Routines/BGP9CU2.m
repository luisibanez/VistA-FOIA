BGP9CU2 ; IHS/CMI/LAB - calc CMS measures 26 Sep 2004 11:28 AM 04 May 2008 2:38 PM ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
ALLDXS(P,BDATE,EDATE,BGPY,BGPC,TAX) ;EP
 NEW X,Y,I,T,V,BGPG
 K BGPG
 I $G(BGPC)="" S BGPC=0
 S X=P_"^ALL DX ["_TAX_";DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,"BGPG(")
 S X=0 F  S X=$O(BGPG(X)) Q:X'=+X  D
 .S BGPC=BGPC+1,BGPY(BGPC)="POV:  "_$$DATE^BGP9UTL($P(BGPG(X),U,1))_" ["_$P(BGPG(X),U,2)_"]  "_$$VAL^XBDIQ1(9000010.07,+$P(BGPG(X),U,4),.04)
 .Q
 Q
SMOKER(P,BDATE,EDATE,BGPY) ;EP
 NEW BGPC,BGPDENT,BGPDX,BGPTOB
 K BGPY S BGPC=0
 NEW BGPTOB,BGPDX,BGPDENT
 S BGPTOB=$$TOBACCO^BGP9D7(P,BDATE,EDATE)
 I BGPTOB["CURRENT SMOKER"!(BGPTOB="CESSATION-SMOKER") S BGPC=BGPC+1,BGPY(BGPC)="Yes, Health Factor: "_$P(BGPTOB,U)_" on "_$P(BGPTOB,U,2)
 S BGPDX=$$DX^BGP9D7(P,BDATE,EDATE)
 I BGPDX]"",$P(BGPDX,U)'="305.13",$P(BGPDX,U)'="V15.82" S BGPC=BGPC+1,BGPY(BGPC)="Yes, Diagnosis: "_$P(BGPDX,U)_" on "_$$DATE^BGP9UTL($P(BGPDX,U,2))
 S BGPDENT=$$DENT^BGP9D7(P,BDATE,EDATE)
 I BGPDENT]"" S BGPC=BGPC+1,BGPY(BGPC)="Yes, "_$P(BGPDENT,U)_" on "_$$DATE^BGP9UTL($P(BGPDENT,U,2))
 S BGPCPT=$$CPTSM^BGP9D7(P,BDATE,EDATE)
 I BGPCPT]"",$P(BGPCPT,U,1)'="1036F" S BGPC=BGPC+1,BGPY(BGPC)="Yes, CPT "_$P(BGPCPT,U,1)_" on "_$$DATE^BGP9UTL($P(BGPCPT,U,2))
 Q
CESS(P,BDATE,EDATE,BGPY,BGPC) ;EP
 NEW BGPALLED,Y,E,X,T,A,B,Z,G
 S BGPC=$G(BGPC)
 K BGPALLED
 S Y="BGPALLED("
 S X=P_"^ALL EDUC;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 I $D(BGPALLED(1)) S %="" D
 .S (X,D)=0,T="" F  S X=$O(BGPALLED(X)) Q:X'=+X  D
 ..S T=$P(^AUPNVPED(+$P(BGPALLED(X),U,4),0),U)
 ..Q:'T
 ..Q:'$D(^AUTTEDT(T,0))
 ..S T=$P(^AUTTEDT(T,0),U,2)
 ..I $P(T,"-")="TO" S BGPC=BGPC+1,BGPY(BGPC)=$P(BGPALLED(X),U)_U_T Q
 ..I $P(T,"-",2)="TO" S BGPC=BGPC+1,BGPY(BGPC)=$P(BGPALLED(X),U)_U_T Q
 ..I $P(T,"-",2)="SHS" S BGPC=BGPC+1,BGPY(BGPC)=$P(BGPALLED(X),U)_U_T Q
 ..I $P(T,"-",1)["305.1"!($P(T,"-")="649.00")!($P(T,"-")="649.01")!($P(T,"-")="649.02")!($P(T,"-")="649.03")!($P(T,"-")="649.04")!($P(T,"-")="V15.82"),$P(BGPLPED,U)<$P(BGPALLED(X),U) S %=$P(BGPALLED(X),U)_U_T Q
 K ^TMP($J,"A")
 S A="^TMP($J,""A"",",B=P_"^ALL VISITS;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(B,A)
 S X=0,G="" F  S X=$O(^TMP($J,"A",X)) Q:X'=+X  S V=$P(^TMP($J,"A",X),U,5) D
 .Q:'$D(^AUPNVSIT(V,0))
 .Q:'$P(^AUPNVSIT(V,0),U,9)
 .Q:$P(^AUPNVSIT(V,0),U,11)
 .S B=$$CLINIC^APCLV(V,"C")
 .I B=94 S BGPC=BGPC+1,BGPY(BGPC)=$P($P(^AUPNVSIT(V,0),U),".")_U_"CL 94"
 .S Z=0 F  S Z=$O(^AUPNVDEN("AD",V,Z)) Q:Z'=+Z  S B=$P($G(^AUPNVDEN(Z,0)),U) I B S B=$P($G(^AUTTADA(B,0)),U) I B=1320 S BGPC=BGPC+1,BGPY(BGPC)=$P($P(^AUPNVSIT(V,0),U),".")_U_"ADA 1320"
 .Q
 S G=$$CPTI^BGP9DU(P,BDATE,EDATE,+$$CODEN^ICPTCOD("G0375")) I G S BGPC=BGPC+1,BGPY(BGPC)=$P(G,U,2)_U_"CPT G0375"
 S G=$$CPTI^BGP9DU(P,BDATE,EDATE,+$$CODEN^ICPTCOD("G0376")) I G S BGPC=BGPC+1,BGPY(BGPC)=$P(G,U,2)_U_"CPT G0376"
 S G=$$CPTI^BGP9DU(P,BDATE,EDATE,+$$CODEN^ICPTCOD("4000F")) I G S BGPC=BGPC+1,BGPY(BGPC)=$P(G,U,2)_U_"CPT 4000F"
 S G=$$TRANI^BGP9DU(P,BDATE,EDATE,+$$CODEN^ICPTCOD("G0375")) I G S BGPC=BGPC+1,BGPY(BGPC)=$P(G,U,2)_U_"TRAN G0375"
 S G=$$TRANI^BGP9DU(P,BDATE,EDATE,+$$CODEN^ICPTCOD("G0376")) I G S BGPC=BGPC+1,BGPY(BGPC)=$P(G,U,2)_U_"TRAN G0376"
 S G=$$TRANI^BGP9DU(P,BDATE,EDATE,+$$CODEN^ICPTCOD("4000F")) I G S BGPC=BGPC+1,BGPY(BGPC)=$P(G,U,2)_U_"TRAN 4000F"
 ;now check all refusals of these education topics
 S G="",X=0 F  S X=$O(^AUPNPREF("AA",P,9999999.09,X)) Q:X=""!(G]"")  D
 .S D=0 F  S D=$O(^AUPNPREF("AA",P,9999999.09,X,D)) Q:D=""!(G]"")  D
 ..S I=0 F  S I=$O(^AUPNPREF("AA",P,9999999.09,X,D,I)) Q:I'=+I!(G]"")  D
 ...S Z=$P($G(^AUPNPREF(I,0)),U,3)
 ...Q:Z=""
 ...I Z<BDATE Q
 ...I Z>EDATE Q
 ...S Y=$P($G(^AUTTEDT(X,0)),U,2)
 ...I $P(Y,"-")="TO"!($P(Y,"-",2)="TO")!($P(Y,"-",2)="SHS")!($P(Y,"-",1)["305.1")!($P(Y,"-")="649.00")!($P(Y,"-")="649.01")!($P(Y,"-")="649.02")!($P(Y,"-")="649.03")!($P(Y,"-")="649.04") S BGPC=BGPC+1,BGPY(BGPC)=Z_U_"ref "_Y
 Q
 ;
CESSMEDS(P,BDATE,EDATE,BGPY) ;EP
 NEW BGPMEDS1,T,X,G,M,E,V,Z,BGPC,T1
 S BGPC=0
 K BGPMEDS1,M
 D GETMEDS^BGP9UTL2(P,BDATE,EDATE,,,,,.BGPMEDS1)
 S T=$O(^ATXAX("B","BGP CMS SMOKING CESSATION MEDS",0))
 S T1=$O(^ATXAX("B","BGP CMS SMOKING CESSATION NDC",0))
 S (X,G,M,E)=0,D="" F  S X=$O(BGPMEDS1(X)) Q:X'=+X  S V=$P(BGPMEDS1(X),U,5),Y=+$P(BGPMEDS1(X),U,4) D
 .Q:'$D(^AUPNVSIT(V,0))
 .S Z=$P($G(^AUPNVMED(Y,0)),U) ;get drug ien
 .Q:'Z
 .S N=$P($G(^PSDRUG(Z,0)),U)
 .I $D(^ATXAX(T,21,"B",Z))!(N["NICOTINE PATCH")!(N["NICOTINE POLACRILEX")!(N["NICOTINE INHALER")!(N["NICOTINE NASAL SPRAY") D
 ..S M((9999999-$P($P(^AUPNVSIT(V,0),U),".")),Y)=$P($P(^AUPNVSIT(V,0),U),".")_U_"CESSATION MED - "_N
 .S C=$P($G(^PSDRUG(Z,2)),U,4)
 .I C]"",$D(^ATXAX(T1,21,"B",C)) S M((9999999-$P($P(^AUPNVSIT(V,0),U),".")),Y)=$P($P(^AUPNVSIT(V,0),U),".")_U_"CESSATION MED - "_N
 S X=0,Y=0 F  S X=$O(M(X)) Q:X'=+X  S Y=0 F  S Y=$O(M(X,Y)) Q:Y'=+Y  D
 .S BGPC=BGPC+1,BGPY(BGPC)=M(X,Y)
 S G=$$CPTI^BGP9DU(P,BDATE,EDATE,+$$CODEN^ICPTCOD("4001F")) I G S BGPC=BGPC+1,BGPY(BGPC)=$P(G,U,2)_U_"CPT 4001F"
 S G=$$TRANI^BGP9DU(P,BDATE,EDATE,+$$CODEN^ICPTCOD("4001F")) I G S BGPC=BGPC+1,BGPY(BGPC)=$P(G,U,2)_U_"TRAN 4001F"
 Q
 ;
BETAALEG(P,BDATE,EDATE) ;EP
 NEW ED,BD,BGPG,G,X,Y,Z,N
 S G=""
 I $G(BDATE)="" S BDATE=$$DOB^AUPNPAT(P)
 K BGPG S Y="BGPG(",X=P_"^ALL DX [BGP ASA ALLERGY 995.0-995.3;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 S X=0 F  S X=$O(BGPG(X)) Q:X'=+X  S Y=+$P(BGPG(X),U,4) D
 .S N=$$VAL^XBDIQ1(9000010.07,Y,.04) S N=$$UP^XLFSTR(N)
 .I N["BETA BLOCK"!(N["BBLOCK")!(N["B BLOCK") S G=1_U_"POV:  "_$$DATE^BGP9UTL($P(BGPG(X),U))_"  ["_$P(BGPG(X),U,2)_"]  "_N
 .S Z=$P(^AUPNVPOV(Y,0),U,9) I Z]"",$P($$ICDDX^ICDCODE(Z),U,2)="E942.0" S G=1_U_"POV:  "_$$DATE^BGP9UTL($P(BGPG(X),U))_"  ["_$P(BGPG(X),U,2)_" + E942.0]  "_N
 .Q
 I G Q G
 K BGPG S Y="BGPG(",X=P_"^ALL DX V14.8;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 S X=0 F  S X=$O(BGPG(X)) Q:X'=+X  S Y=+$P(BGPG(X),U,4) D
 .S N=$$VAL^XBDIQ1(9000010.07,Y,.04),N=$$UP^XLFSTR(N)
 .I N["BETA BLOCK"!(N["BBLOCK")!(N["B BLOCK") S G=1_U_"POV:  "_$$DATE^BGP9UTL($P(BGPG(X),U))_"  ["_$P(BGPG(X),U,2)_"]  "_N
 I G Q G
 S T="",T=$O(^ATXAX("B","BGP ASA ALLERGY 995.0-995.3",0))
 S X=0 F  S X=$O(^AUPNPROB("AC",P,X)) Q:X'=+X  D
 .S I=$P($G(^AUPNPROB(X,0)),U),Y=$P($$ICDDX^ICDCODE(I),U,2)
 .S N=$$VAL^XBDIQ1(9000011,X,.05),N=$$UP^XLFSTR(N)
 .Q:$P(^AUPNPROB(X,0),U,8)<BDATE
 .Q:$P(^AUPNPROB(X,0),U,8)>EDATE  ;added after discharge date
 .I Y="V14.8"!($$ICD^ATXCHK(I,T,9)),N["BETA BLOCK"!(N["BBLOCK")!(N["B BLOCK") S G=1_U_"PROBLEM LIST:  "_$$DATE^BGP9UTL($P(^AUPNPROB(X,0),U,8))_"  ["_Y_"]  "_N
 .Q
 I G Q G
 S X=0 F  S X=$O(^GMR(120.8,"B",P,X)) Q:X'=+X  D
 .Q:$P($P($G(^GMR(120.8,X,0)),U,4),".")<BDATE
 .Q:$P($P($G(^GMR(120.8,X,0)),U,4),".")>EDATE  ;entered after discharge date
 .S N=$P($G(^GMR(120.8,X,0)),U,2),N=$$UP^XLFSTR(N)
 .I N["BETA BLOCK"!(N["BBLOCK")!(N["B BLOCK") S G=1_U_"ALLERGY TRACKING:  "_$$DATE^BGP9UTL($P(^GMR(120.8,X,0),U,4))_"  "_N
 Q G
 ;
BETARX(P,BDATE,EDATE,EXP,BGPY) ;EP
 ;get active warfarin rx before date of adm
 NEW BGPC,X,Y,Z,E
 S BGPC=0
 K BGPY
 D GETMEDS^BGP9CU(P,BDATE,EDATE,"BGP CMS BETA BLOCKER MEDS","BGP CMS BETA BLOCKER NDC","BGP CMS BETA BLOCKER CLASS",EXP,EDATE,"",0)
 Q
 ;
PACE(P,BDATE,EDATE) ;EP
 NEW G
 S G=$$LASTDX^BGP9UTL1(P,"BGP CMS PACEMAKER DXS",BDATE,EDATE)
 I G Q 1_U_$$DATE^BGP9UTL($P(G,U,3))_" ["_$P(G,U,2)_"] "_$$VAL^XBDIQ1(9000010.07,$P(G,U,5),.04)
 S G=$$LASTPRC^BGP9UTL1(P,"BGP CMS PACEMAKER PROCS",BDATE,EDATE)
 I G Q 1_U_$$DATE^BGP9UTL($P(G,U,3))_" ["_$P(G,U,2)_"] "_$$VAL^XBDIQ1(9000010.08,$P(G,U,5),.04)
 S G=$$CPT^BGP9DU(P,BDATE,EDATE,$O(^ATXAX("B","BGP CMS PACEMAKER CPTS",0)),6)
 I G Q 1_U_$$DATE^BGP9UTL($P(G,U,2))_" ["_$P(G,U,3)_"]"
 Q ""
 ;
ST1(P,BDATE,EDATE,BGPY) ;EP
 K BGPY S BGPC=0
 K BGPG
 S Y="BGPG("
 S X=P_"^ALL DX [BGP ST ELEVATION DX;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 S X=0 F  S X=$O(BGPG(X)) Q:X'=+X  S BGPC=BGPC+1,BGPY(BGPC)=$$DATE^BGP9UTL($P(BGPG(X),U))_" "_$P(BGPG(X),U,2)_" "_$$VAL^XBDIQ1(9000010.07,+$P(BGPG(X),U,4),.04)
 K BGPG
 Q
LBBBDX(P,BDATE,EDATE) ;EP
 Q $$LASTDXI^BGP9UTL1(P,"426.3",BDATE,EDATE)
 ;
LBBBPROC(P,BDATE,EDATE,BGPY) ;EP
 NEW Y,X,BGPG,BGPC
 S BGPC=0
 K BGPY
 S Y="BGPG("
 S X=$$LASTPRC^BGP9UTL1(P,"BGP LBBB ON ECG PROC",BDATE,EDATE)
 I X]"" S BGPC=BGPC+1,BGPY(BGPC)="Procedure: "_$$DATE^BGP9UTL($P(X,U,3))_" "_$P(X,U,2)_" "_$$VAL^XBDIQ1(9000010.08,$P(X,U,4),.04)
 K BGPG
 ;now check for CPT codes
 S X=$$CPT^BGP9DU(P,BDATE,EDATE,$O(^ATXAX("B","BGP LBBB ON ECG CPT",0)),6)
 I X]"" S BGPC=BGPC+1,BGPY(BGPC)="CPT: "_$$DATE^BGP9UTL($P(X,U,2))_" "_$P(X,U,3)
 S X=$$TRAN^BGP9DU(P,BDATE,EDATE,$O(^ATXAX("B","BGP LBBB ON ECG CPT",0)),6)
 I X]"" S BGPC=BGPC+1,BGPY(BGPC)="TRAN CODE CPT: "_$$DATE^BGP9UTL($P(X,U,2))_" "_$P(X,U,3)
 Q
LBBB1(P,BDATE,EDATE,BGPY) ;EP
 K BGPY S BGPC=0
 K BGPG
 S Y="BGPG("
 S X=P_"^ALL DX 426.3;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 I '$D(BGPG) Q
 S BGPC=BGPC+1,BGPY(BGPC)=$$DATE^BGP9UTL($P(BGPG(1),U))_" "_$P(BGPG(1),U,2)_" "_$$VAL^XBDIQ1(9000010.07,+$P(BGPG(1),U,4),.04)
 K BGPG
 S Y="BGPG("
 S X=$$LASTPRC^BGP9UTL1(P,"BGP LBBB ON ECG PROC",BDATE,EDATE)
 I X]"" S BGPC=BGPC+1,BGPY(BGPC)="Procedure: "_$$DATE^BGP9UTL($P(X,U,3))_" "_$P(X,U,2)_" "_$$VAL^XBDIQ1(9000010.08,$P(X,U,4),.04)
 K BGPG
 ;now check for CPT codes
 S X=$$CPT^BGP9DU(P,BDATE,EDATE,$O(^ATXAX("B","BGP LBBB ON ECG CPT",0)),6)
 I X]"" S BGPC=BGPC+1,BGPY(BGPC)="CPT: "_$$DATE^BGP9UTL($P(X,U,2))_" "_$P(X,U,3)
 S X=$$TRAN^BGP9DU(P,BDATE,EDATE,$O(^ATXAX("B","BGP LBBB ON ECG CPT",0)),6)
 I X]"" S BGPC=BGPC+1,BGPY(BGPC)="TRAN CODE CPT: "_$$DATE^BGP9UTL($P(X,U,2))_" "_$P(X,U,3)
 Q
TA1(P,BGPA,BGPD,BGPY) ;EP
 ;get last TA rx before date of adm
 NEW BGPG,BGPC,X,Y,Z,E,BD,ED,G,D
 S BGPC=0 K BGPY
 S ED=$$FMADD^XLFDT(BGPA,-1)
 S BD=$$FMADD^XLFDT(BGPA,-365)
 D GETMEDS^BGP9CU(P,BD,ED,"BGP CMS THROMBOLYTIC MEDS","","BGP THROMBOLYTIC AGENT CLASS")
 S BD=BGPA
 S ED=$$FMADD^XLFDT(BGPD,30)
 D GETMEDS^BGP9CU(P,BD,ED,"BGP CMS THROMBOLYTIC MEDS","","BGP THROMBOLYTIC AGENT CLASS")
 K BGPG
 Q
 ;
TARX(P,BDATE,EDATE,EXP,ADM,BGPY) ;EP
 ;get active T.A. rx before date of adm
 NEW BGPC,X,Y,Z,E
 S BGPC=0
 K BGPY
 D GETMEDS^BGP9CU(P,BDATE,EDATE,"BGP CMS THROMBOLYTIC MEDS","","BGP THROMBOLYTIC AGENTS CLASS",EXP,ADM,"",0)
 Q
 ;
PNEUVAX(P,BDATE,EDATE,BGPDD,BGPY) ;EP
 NEW BGPG,BGPX,BGPC,X,Y,Z,A,B,C,R,C1,V
 S BGPC=0
 S X=0 F  S X=$O(^AUPNVIMM("AC",P,X)) Q:X'=+X  D
 .S Y=$P($G(^AUPNVIMM(X,0)),U)
 .Q:'Y
 .S C=$P($G(^AUTTIMM(Y,0)),U,3)
 .I C'=33,C'=100,C'=109 Q
 .S V=$P(^AUPNVIMM(X,0),U,3)
 .S D=$P($P($G(^AUPNVSIT(V,0)),U),".")
 .Q:D<BDATE
 .Q:D>EDATE
 .S BGPC=BGPC+1,BGPY(BGPC)="Immunization CVX: "_C_"  "_$$DATE^BGP9UTL($P($P(^AUPNVSIT($P(^AUPNVIMM(X,0),U,3),0),U),"."))
 K BGPG S %=P_"^ALL PROCEDURE 99.55;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BGPG(")
 S X=0 F  S X=$O(BGPG(X)) Q:X'=+X  S Y=+$P(BGPG(X),U,4) D
 .Q:'$D(^AUPNVPRC(Y,0))
 .S Y=$P(^AUPNVPRC(Y,0),U,1)
 .Q:'Y
 .S D=$P(BGPG(X),U)
 .S BGPC=BGPC+1,BGPY(BGPC)="Procedure 99.55:   "_$$DATE^BGP9UTL(D)
 .Q
 K BGPG S %=P_"^ALL DX V03.82;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BGPG(")
 S X=0 F  S X=$O(BGPG(X)) Q:X'=+X  S Y=+$P(BGPG(X),U,4) D
 .Q:'$D(^AUPNVPOV(Y,0))
 .S Y=$P(^AUPNVPOV(Y,0),U,1)
 .Q:'Y
 .S D=$P(BGPG(X),U)
 .S BGPC=BGPC+1,BGPY(BGPC)="Diagnosis V03.82:  "_$$DATE^BGP9UTL(D)
 .Q
 K BGPG S %=P_"^ALL DX V06.6;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BGPG(")
 S X=0 F  S X=$O(BGPG(X)) Q:X'=+X  S Y=+$P(BGPG(X),U,4) D
 .Q:'$D(^AUPNVPOV(Y,0))
 .S Y=$P(^AUPNVPOV(Y,0),U,1)
 .Q:'Y
 .S D=$P(BGPG(X),U)
 .S BGPC=BGPC+1,BGPY(BGPC)="Diagnosis V06.06:  "_$$DATE^BGP9UTL(D)
 .Q
 ;now check for cpts
 S X=0 F  S X=$O(^AUPNVCPT("AC",P,X)) Q:X'=+X  D
 .Q:'$D(^AUPNVCPT(X,0))
 .S C1=$$VAL^XBDIQ1(9000010.18,X,.01)
 .;I C1'=90732,C1'=90669,C1'="G8115",C1'="G0009" Q
 .I '$$ICD^ATXCHK($P(^AUPNVCPT(X,0),U),$O(^ATXAX("B","BGP PNEUMO IZ CPTS",0)),1) Q
 .S V=$P(^AUPNVCPT(X,0),U,3)
 .S D=$P($P($G(^AUPNVSIT(V,0)),U),".")
 .Q:D<BDATE
 .Q:D>EDATE
 .S BGPC=BGPC+1,BGPY(BGPC)="CPT: "_C1_"  "_$$DATE^BGP9UTL(D)
 .Q
 ;tran codes
 S X=0 F  S X=$O(^AUPNVTC("AC",P,X)) Q:X'=+X  D
 .Q:'$D(^AUPNVTC(X,0))
 .S C1=$$VAL^XBDIQ1(9000010.33,X,.07)
 .I '$$ICD^ATXCHK($P(^AUPNVTC(X,0),U,7),$O(^ATXAX("B","BGP PNEUMO IZ CPTS",0)),1) Q
 .;I C1'=90732,C1'=90669,C1'="G8115",C1'="G0009" Q
 .S D=$P(^AUPNVTC(X,0),U,3)
 .S D=$P($P($G(^AUPNVSIT(D,0)),U),".")
 .Q:D<BDATE
 .Q:D>EDATE
 .S BGPC=BGPC+1,BGPY(BGPC)="Tran code: "_C1_"  "_$$DATE^BGP9UTL(D)
 .Q
 ;refusals?
 K BGPI F X=33,100,109 S Y=$O(^AUTTIMM("C",X,0)) I Y S BGPI(Y)=""
 S X=0 F  S X=$O(^AUPNPREF("AA",P,9999999.14,X)) Q:X'=+X  D
 .Q:'$D(BGPI(X))
 .S D=0 F  S D=$O(^AUPNPREF("AA",P,9999999.14,X,D)) Q:D'=+D  D
 ..S I=0 F  S I=$O(^AUPNPREF("AA",P,9999999.14,X,D,I)) Q:I'=+I  D
 ...Q:"NR"'[$P(^AUPNPREF(I,0),U,7)
 ...Q:D>(9999999-BDATE)
 ...Q:D<(9999999-EDATE)
 ...S BGPC=BGPC+1
 ...S BGPY(BGPC)="REFUSAL: "_$$VAL^XBDIQ1(9000022,I,.07)_" - "_$$VAL^XBDIQ1(9000022,I,.04)_"  "_$$DATE^BGP9UTL($P(^AUPNPREF(I,0),U,3))_"  "_$$VAL^XBDIQ1(9000022,X,1101)
 ..Q
 .Q
 S (X,G)=0,Y=$O(^AUTTIMM("C",33,0)) F  S X=$O(^BIPC("AC",P,Y,X)) Q:X'=+X  D
 .S R=$P(^BIPC(X,0),U,3)
 .Q:R=""
 .Q:'$D(^BICONT(R,0))
 .Q:$P(^BICONT(R,0),U,1)'["Refusal"
 .S D=$P(^BIPC(X,0),U,4)
 .Q:D=""
 .Q:D<BDATE
 .Q:D>EDATE
 .S BGPC=BGPC+1,BGPY(BGPC)="REFUSAL: Immunization Package CVX 33 "_$$DATE^BGP9UTL(D)
 S (X,G)=0,Y=$O(^AUTTIMM("C",100,0)) I Y F  S X=$O(^BIPC("AC",P,Y,X)) Q:X'=+X  D
 .S R=$P(^BIPC(X,0),U,3)
 .Q:R=""
 .Q:'$D(^BICONT(R,0))
 .Q:$P(^BICONT(R,0),U,1)'["Refusal"
 .S D=$P(^BIPC(X,0),U,4)
 .Q:D=""
 .Q:D<BDATE
 .Q:D>EDATE
 .S BGPC=BGPC+1,BGPY(BGPC)="REFUSAL: Immunization Package CVX 100 "_$$DATE^BGP9UTL(D)
 S (X,G)=0,Y=$O(^AUTTIMM("C",109,0)) I Y F  S X=$O(^BIPC("AC",P,Y,X)) Q:X'=+X  D
 .S R=$P(^BIPC(X,0),U,3)
 .Q:R=""
 .Q:'$D(^BICONT(R,0))
 .Q:$P(^BICONT(R,0),U,1)'["Refusal"
 .S D=$P(^BIPC(X,0),U,4)
 .Q:D=""
 .Q:D<BDATE
 .Q:D>EDATE
 .S BGPC=BGPC+1,BGPY(BGPC)="REFUSAL: Immunization Package CVX 109 "_$$DATE^BGP9UTL(D)
 F BGPZ=33,100,109 S X=$$ANCONT^BGP9D31(P,BGPZ,EDATE) I X]"" S BGPC=BGPC+1,BGPY(BGPC)=$P(X,U,2)_" "_$$DATE^BGP9UTL($P(X,U,1))
 ;now check for bone marrow contraindication
 S X=$$LASTPRC^BGP9UTL1(P,"BGP CMS BONE MARROW PROC",$$FMADD^XLFDT(BGPDD,-365),BGPDD)
 I X S BGPC=BGPC+1,BGPY(BGPC)="Bone Marrow Contraindication: ["_$P(X,U,2)_"] "_$$DATE^BGP9UTL($P(X,U,3))
 S X=$$CPT^BGP9DU(P,$$FMADD^XLFDT(BGPDD,-365),BGPDD,$O(^ATXAX("B","BGP CMS BONE MARROW CPT",0)),6)
 I X S BGPC=BGPC+1,BGPY(BGPC)="Bone Marrow Contraindication: ["_$P(X,U,3)_"] "_$$DATE^BGP9UTL($P(X,U,2))
 Q
