BGP1D721 ; IHS/CMI/LAB - measure AHR.A ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
 ;
IAHRA ;EP
 S (BGPN1,BGPN2,BGPN3,BGPN4,BGPN5,BGPN6,BGPN7,BGPN8,BGPN9,BGPN10,BGPN11,BGPN12,BGPN13,BGPN14,BGPN15,BGPN16,BGPN17,BGPD1,BGPD2,BGPD3,BGPD4,BGPD5,BGPD6,BGPD7,BGPD8,BGPD9)=0
 S BGPVALUE=""
 I BGPAGEB<22 S BGPSTOP=1 Q
 I 'BGPACTCL S BGPSTOP=1 Q  ;must be active clinical
 S BGPIHD=$$IHD(DFN,BGPBDATE,BGPEDATE)
 I 'BGPIHD S BGPSTOP=1 Q  ;no IHD
 S BGPD1=1
 I BGPDMD2 S BGPD3=1
 I 'BGPDMD2 S BGPD2=1
 K BGPBETA
 S BGPBETA("RX")=$$BETA(DFN,BGPBDATE,BGPEDATE,179)  ;get 1_U_# days
 I BGPBETA("RX") S BGPN2=1  ;pt has 180 days of beta blocker
 I 'BGPN2 S BGPBETA("REF")=$$BETAREF(DFN,BGPBDATE,BGPEDATE) I BGPBETA("REF") S BGPN3=1
 I 'BGPN2 S BGPBETA("CONTRA")=$$BETACONT(DFN,$$DOB^AUPNPAT(DFN),BGPEDATE,BGPBDATE,BGPEDATE) I BGPBETA("CONTRA") S BGPN4=1 ;beta contraindication
 I 'BGPN2 S BGPBETA("ADR")=$$BETAALG1^BGP1D72(DFN,BGPEDATE) I BGPBETA("ADR") S BGPN4=1
 I (BGPN2+BGPN4) S BGPN1=1
 K BGPASA
 S BGPASA("RX")=$$ASA(DFN,BGPBDATE,BGPEDATE,179)  ;get 1_U_# days
 I BGPASA("RX") S BGPN6=1  ;pt has 180 days of beta blocker
 I 'BGPN6 S BGPASA("REF")=$$ASAREF(DFN,BGPBDATE,BGPEDATE) I BGPASA("REF") S BGPN7=1
 I 'BGPN6 S BGPASA("CONTRA")=$$ASACONTR(DFN,BGPBDATE,BGPEDATE,179) I BGPASA("CONTRA") S BGPN8=1 ;beta contraindication
 I 'BGPN6 S BGPASA("ADR")=$$ASAALLEG(DFN,BGPEDATE) I BGPASA("ADR") S BGPN8=1
 I (BGPN6+BGPN8) S BGPN5=1
 K BGPACE
 S BGPACE("RX")=$$ACERX^BGP1D722(DFN,BGPBDATE,BGPEDATE,179)  ;get 1_U_# days
 I BGPACE("RX") S BGPN10=1  ;pt has 180 days of ACE
 I 'BGPN10 S BGPACE("REF")=$$ACEREF^BGP1D722(DFN,BGPBDATE,BGPEDATE) I BGPACE("REF") S BGPN11=1
 I 'BGPN10 S BGPACE("CONTRA")=$$ACECONT^BGP1D722(DFN,$$DOB^AUPNPAT(DFN),BGPEDATE,BGPBDATE,BGPEDATE,BGPBDATE) I BGPACE("CONTRA") S BGPN12=1 ;beta contraindication
 I 'BGPN10 S BGPACE("ADR")=$$ACEALG^BGP1D722(DFN,$$DOB^AUPNPAT(DFN),BGPEDATE) I BGPACE("ADR") S BGPN12=1
 I (BGPN10+BGPN12) S BGPN9=1
 K BGPSTAT
 S BGPSTAT("RX")=$$STATRX^BGP1D722(DFN,BGPBDATE,BGPEDATE,179)  ;get 1_U_# days
 I BGPSTAT("RX") S BGPN14=1  ;pt has 180 days of STAT
 I 'BGPN14 S BGPSTAT("REF")=$$STATREF^BGP1D722(DFN,BGPBDATE,BGPEDATE) I BGPSTAT("REF") S BGPN15=1
 I 'BGPN14 S BGPSTAT("CONTRA")=$$STATCON^BGP1D722(DFN,BGPBDATE,BGPEDATE,BGPBDATE,BGPEDATE) I BGPSTAT("CONTRA") S BGPN16=1 ;beta contraindication
 I 'BGPN14 S BGPSTAT("ADR")=$$STATALG^BGP1D722(DFN,$$DOB^AUPNPAT(DFN),BGPEDATE,BGPBDATE,BGPEDATE) I BGPSTAT("ADR") S BGPN16=1
 I (BGPN14+BGPN16) S BGPN13=1
 I BGPN1,BGPN5,BGPN9,BGPN13 S BGPN17=1
 S BGPVALUE="IHD"_$S(BGPD3:";AD",1:"")_"|||"
 S BGPVALUE=BGPVALUE_$S(BGPN17:"ALL MEDS; ",1:"")
 I BGPN2!(BGPN3)!(BGPN4) S BGPVALUE=BGPVALUE_$S($P(BGPVALUE,"|||",2)]"":" ",1:"") S BGPVALUE=BGPVALUE_"BETA: " F X="RX","REF","CONTRA","ADR" I $P($G(BGPBETA(X)),U,1),$P($G(BGPBETA(X)),U,2)]"" D
 .S BGPVALUE=BGPVALUE_$P(BGPBETA(X),U,2)_$S($P(BGPBETA(X),U,3)]"":" "_$P(BGPBETA(X),U,3),1:"")
 I BGPN6!(BGPN7)!(BGPN8) S BGPVALUE=BGPVALUE_$S($P(BGPVALUE,"|||",2)]"":"; ",1:"") S BGPVALUE=BGPVALUE_"ASA: " F X="RX","REF","CONTRA","ADR" I $P($G(BGPASA(X)),U,1),$P($G(BGPASA(X)),U,2)]"" D
 .S BGPVALUE=BGPVALUE_$P(BGPASA(X),U,2)_$S($P(BGPASA(X),U,3)]"":" "_$P(BGPASA(X),U,3),1:"")
 I BGPN10!(BGPN11)!(BGPN12) S BGPVALUE=BGPVALUE_$S($P(BGPVALUE,"|||",2)]"":"; ",1:"") S BGPVALUE=BGPVALUE_"ACEI/ARB: " F X="RX","REF","CONTRA","ADR" I $P($G(BGPACE(X)),U,1),$P($G(BGPACE(X)),U,2)]"" D
 .S BGPVALUE=BGPVALUE_$P(BGPACE(X),U,2)_$S($P(BGPACE(X),U,3)]"":" "_$P(BGPACE(X),U,3),1:"")
 I BGPN14!(BGPN15)!(BGPN16) S BGPVALUE=BGPVALUE_$S($P(BGPVALUE,"|||",2)]"":"; ",1:"") S BGPVALUE=BGPVALUE_"STATIN: " F X="RX","REF","CONTRA","ADR" I $P($G(BGPSTAT(X)),U,1),$P($G(BGPSTAT(X)),U,2)]"" D
 .S BGPVALUE=BGPVALUE_$P(BGPSTAT(X),U,2)_$S($P(BGPSTAT(X),U,3)]"":" "_$P(BGPSTAT(X),U,3),1:"")
 K ^TMP($J)
 Q
IHD(P,BDATE,EDATE) ;EP
 ;first dx prior to report period
 ;at least 2 visits during report period
 ;at least 2 ihd dxs ever
 I '$$V2^BGP1D1(P,BDATE,EDATE) Q ""  ;not 2 visits during report period
 K ^TMP($J)
 I '$$FIRSTIHD(P,EDATE) Q ""  ;first dx not prior to report period
 I '$$V2IHD(P,$$DOB^AUPNPAT(P),EDATE) Q ""  ;at least 2 IHD dxs ever
 Q 1
FIRSTIHD(P,EDATE) ;EP
 I $G(P)="" Q ""
 NEW BGPG,Y,X,E
 K BGPG
 S Y="BGPG("
 S X=P_"^FIRST DX [BGP IHD DXS" S E=$$START1^APCLDF(X,Y)
 I '$D(BGPG(1)) Q ""
 S X=$$FMDIFF^XLFDT(EDATE,$P(BGPG(1),U))
 Q $S(X>365:1,1:"")
 ;
V2IHD(P,BDATE,EDATE) ;EP
 I '$G(P) Q ""
 I '$D(^AUPNVSIT("AC",P)) Q ""
 NEW A,B,E,T,X,G,V,Y,%,G
 K ^TMP($J,"A")
 S A="^TMP($J,""A"",",B=P_"^ALL VISITS;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(B,A)
 I '$D(^TMP($J,"A",1)) Q ""
 S T=$O(^ATXAX("B","BGP IHD DXS",0))
 I 'T Q ""
 S (X,G)=0 F  S X=$O(^TMP($J,"A",X)) Q:X'=+X!(G>2)  S V=$P(^TMP($J,"A",X),U,5) D
 .Q:'$D(^AUPNVSIT(V,0))
 .Q:'$P(^AUPNVSIT(V,0),U,9)
 .Q:$P(^AUPNVSIT(V,0),U,11)
 .Q:"SAHO"'[$P(^AUPNVSIT(V,0),U,7)
 .Q:"V"[$P(^AUPNVSIT(V,0),U,3)
 .Q:$P(^AUPNVSIT(V,0),U,6)=""
 .I $G(BGPMFITI),'$D(^ATXAX(BGPMFITI,21,"B",$P(^AUPNVSIT(V,0),U,6))) Q
 .S (D,Y)=0 F  S Y=$O(^AUPNVPOV("AD",V,Y)) Q:Y'=+Y!(D)  I $D(^AUPNVPOV(Y,0)) S %=$P(^AUPNVPOV(Y,0),U) I $$ICD^ATXCHK(%,T,9) S D=1
 .Q:'D
 .S G=G+1
 .Q
 K ^TMP($J,"A")
 Q $S(G<2:"",1:1)
 ;
BETA(P,BDATE,EDATE,BGPNDAYS) ;EP
 NEW BGPMEDS1,K,R,T,T1,X,Y,G,D,N,J,V,S
 K BGPMEDS1
 S K=0,R=""
 D GETMEDS^BGP1UTL2(P,BDATE,EDATE,,,,,.BGPMEDS1)
 I '$D(BGPMEDS1) Q ""
 S T=$O(^ATXAX("B","BGP HEDIS BETA BLOCKER MEDS",0))
 S T1=$O(^ATXAX("B","BGP HEDIS BETA BLOCKER NDC",0))
 S X=0 F  S X=$O(BGPMEDS1(X)) Q:X'=+X  S Y=+$P(BGPMEDS1(X),U,4) D
 .Q:'$D(^AUPNVMED(Y,0))
 .Q:$$UP^XLFSTR($P($G(^AUPNVMED(Y,11)),U))["RETURNED TO STOCK"
 .S G=0
 .S D=$P(^AUPNVMED(Y,0),U)
 .I T,$D(^ATXAX(T,21,"B",D)) S G=1 G BETA1
 .S N=$P($G(^PSDRUG(D,2)),U,4)
 .I N]"",T1,$D(^ATXAX(T1,21,"B",N)) S G=1
 .Q:'G
BETA1 .;
 .S J=$P(^AUPNVMED(Y,0),U,8)
 .S V=$P(^AUPNVMED(Y,0),U,3)
 .Q:'V
 .Q:'$D(^AUPNVSIT(V,0))
 .S S=$$DAYS^BGP1D82(Y,V,EDATE)
 .S K=S+K  ;TOTAL DAYS SUPPLY
 .I R]"" S R=R_";"
 .S R=R_$$DATE^BGP1UTL($P($P(^AUPNVSIT(V,0),U),"."))_"("_S_")"
 I K>BGPNDAYS Q 1_U_R_" "_"("_K_" TOTAL DAYS)"
BETAPRIO ;now add in any before BEG DATE
 K BGPMEDS1
 D GETMEDS^BGP1UTL2(P,$$FMADD^XLFDT(BDATE,-365),BDATE,,,,,.BGPMEDS1)
 I '$D(BGPMEDS1) Q ""
 S X=0 F  S X=$O(BGPMEDS1(X)) Q:X'=+X  S Y=+$P(BGPMEDS1(X),U,4) D
 .Q:'$D(^AUPNVMED(Y,0))
 .Q:$$UP^XLFSTR($P($G(^AUPNVMED(Y,11)),U))["RETURNED TO STOCK"
 .S G=0
 .S D=$P(^AUPNVMED(Y,0),U)
 .I T,$D(^ATXAX(T,21,"B",D)) S G=1 G BETA2
 .S N=$P($G(^PSDRUG(D,2)),U,4)
 .I N]"",T1,$D(^ATXAX(T1,21,"B",N)) S G=1
 .Q:'G
BETA2 .;
 .S J=$P(^AUPNVMED(Y,0),U,8)
 .S V=$P(^AUPNVMED(Y,0),U,3)
 .Q:'V
 .Q:'$D(^AUPNVSIT(V,0))
 .Q:J]""  ;don't use if discontinued
 .S D=$$FMDIFF^XLFDT(BDATE,$P($P(^AUPNVSIT(V,0),U),"."))
 .S S=$P(^AUPNVMED(Y,0),U,7)
 .S S=S-D
 .S:S<0 S=0
 .S K=S+K
 .I R]"" S R=R_";"
 .S R=R_$$DATE^BGP1UTL($P($P(^AUPNVSIT(V,0),U),"."))_"("_S_")"
 I K>BGPNDAYS Q 1_U_R_" "_"("_K_" TOTAL DAYS)"
 Q 0_U_R_" "_"("_K_" TOTAL DAYS)"
 ;
BETAREF(P,BDATE,EDATE) ;EP
 NEW T,X,G,D,Y,N
 S T=$O(^ATXAX("B","BGP HEDIS BETA BLOCKER MEDS",0))
 S X=0,G="" F  S X=$O(^AUPNPREF("AA",P,50,X)) Q:X'=+X!(G)  D
 .Q:'$D(^ATXAX(T,21,"B",X))  ;not a Beta Blocker
 .S D=0 F  S D=$O(^AUPNPREF("AA",P,50,X,D)) Q:D'=+D!(G)  D
 ..S Y=9999999-D I Y<BDATE Q
 ..I Y>EDATE Q  ;documented after edate
 ..S N=0 F  S N=$O(^AUPNPREF("AA",P,50,X,D,N)) Q:N'=+N!(G)  D
 ...Q:$P($G(^AUPNPREF(N,0)),U,7)'="R"
 ...S G=1_U_$$DATE^BGP1UTL(Y)_U_"Refused "_$P(^PSDRUG(X,0),U,1)
 ..Q
 .Q
 Q G
BETACONT(P,BDATE,EDATE,NMIBD,NMIED) ;EP - BETA BLOCKER CONTRAINDICATION
 G BETACONT^BGP1D724
ASA(P,BDATE,EDATE,BGPNDAYS) ;EP
 K BGPMEDS1
 S K=0,R=""
 D GETMEDS^BGP1UTL2(P,BDATE,EDATE,,,,,.BGPMEDS1)
 I '$D(BGPMEDS1) Q ""
 S T=$O(^ATXAX("B","DM AUDIT ASPIRIN DRUGS",0))
 S T1=$O(^ATXAX("B","BGP ANTI-PLATELET DRUGS",0))
 S T2=$O(^ATXAX("B","BGP CMS ANTI-PLATELET CLASS",0))
 S X=0 F  S X=$O(BGPMEDS1(X)) Q:X'=+X  S Y=+$P(BGPMEDS1(X),U,4) D
 .Q:'$D(^AUPNVMED(Y,0))
 .Q:$$UP^XLFSTR($P($G(^AUPNVMED(Y,11)),U))["RETURNED TO STOCK"
 .S G=0
 .S D=$P(^AUPNVMED(Y,0),U)
 .I T,$D(^ATXAX(T,21,"B",D)) S G=1 G ASA1
 .S N=$P($G(^PSDRUG(D,2)),U,4)
 .I N]"",T1,$D(^ATXAX(T1,21,"B",N)) S G=1 G ASA1
 .S C=$P($G(^PSDRUG(D,0)),U,2)
 .I C]"",T2,$D(^ATXAX(T2,21,"B",C)) S G=1
 .Q:'G
ASA1 .;
 .S J=$P(^AUPNVMED(Y,0),U,8)
 .S V=$P(^AUPNVMED(Y,0),U,3)
 .Q:'V
 .Q:'$D(^AUPNVSIT(V,0))
 .S S=$$DAYS^BGP1D82(Y,V,EDATE)
 .S K=S+K
 .I R]"" S R=R_";"
 .S R=R_$$DATE^BGP1UTL($P($P(^AUPNVSIT(V,0),U),"."))_"("_S_")"
 I K>BGPNDAYS Q 1_U_R_" "_"("_K_" TOTAL DAYS)"
ASAPRIO ;now add in any before BEG DATE
 K BGPMEDS1
 D GETMEDS^BGP1UTL2(P,$$FMADD^XLFDT(BDATE,-365),BDATE,,,,,.BGPMEDS1)
 I '$D(BGPMEDS1) Q ""
 S X=0 F  S X=$O(BGPMEDS1(X)) Q:X'=+X  S Y=+$P(BGPMEDS1(X),U,4) D
 .Q:'$D(^AUPNVMED(Y,0))
 .Q:$$UP^XLFSTR($P($G(^AUPNVMED(Y,11)),U))["RETURNED TO STOCK"
 .S G=0
 .S D=$P(^AUPNVMED(Y,0),U)
 .I T,$D(^ATXAX(T,21,"B",D)) S G=1 G ASA2
 .S N=$P($G(^PSDRUG(D,2)),U,4)
 .I N]"",T1,$D(^ATXAX(T1,21,"B",N)) S G=1 G ASA2
 .S C=$P($G(^PSDRUG(D,0)),U,2)
 .I C]"",T2,$D(^ATXAX(T2,21,"B",C)) S G=1
 .Q:'G
ASA2 .;
 .S J=$P(^AUPNVMED(Y,0),U,8)
 .S V=$P(^AUPNVMED(Y,0),U,3)
 .Q:'V
 .Q:'$D(^AUPNVSIT(V,0))
 .Q:J]""  ;don't use if discontinued
 .S D=$$FMDIFF^XLFDT(BDATE,$P($P(^AUPNVSIT(V,0),U),"."))
 .S S=$P(^AUPNVMED(Y,0),U,7)
 .S S=S-D  ;subtract the number of days used
 .I S<0 S S=0
 .S K=S+K  ;TOTAL DAYS SUPPLY
 .I R]"" S R=R_";"
 .S R=R_$$DATE^BGP1UTL($P($P(^AUPNVSIT(V,0),U),"."))_"("_S_")"
 I K>BGPNDAYS Q 1_U_R_" "_"("_K_" TOTAL DAYS)"
 Q 0_U_R_" "_"("_K_" TOTAL DAYS)"
 ;
ASAREF(P,BDATE,EDATE) ;EP
 ;did patient have a refusal
 S T=$O(^ATXAX("B","DM AUDIT ASPIRIN DRUGS",0))
 S X=0,G="" F  S X=$O(^AUPNPREF("AA",P,50,X)) Q:X'=+X!(G)  D
 .Q:'$D(^ATXAX(T,21,"B",X))
 .S D=0 F  S D=$O(^AUPNPREF("AA",P,50,X,D)) Q:D'=+D!(G)  D
 ..S Y=9999999-D I Y<BDATE Q
 ..I Y>EDATE Q
 ..S N=0 F  S N=$O(^AUPNPREF("AA",P,50,X,D,N)) Q:N'=+N!(G)  D
 ...Q:$P($G(^AUPNPREF(N,0)),U,7)'="R"
 ...S G=1_U_$$DATE^BGP1UTL(Y)_" Refused "_$P(^PSDRUG(X,0),U,1)
 ..Q
 .Q
 I G Q G
 S T=$O(^ATXAX("B","BGP ANTI-PLATELET DRUGS",0))
 S X=0,G="" F  S X=$O(^AUPNPREF("AA",P,50,X)) Q:X'=+X!(G)  D
 .Q:'$D(^ATXAX(T,21,"B",X))
 .S D=0 F  S D=$O(^AUPNPREF("AA",P,50,X,D)) Q:D'=+D!(G)  D
 ..S Y=9999999-D I Y<BDATE Q
 ..I Y>EDATE Q
 ..S N=0 F  S N=$O(^AUPNPREF("AA",P,50,X,D,N)) Q:N'=+N!(G)  D
 ...Q:$P($G(^AUPNPREF(N,0)),U,7)'="R"
 ...S G=1_U_$$DATE^BGP1UTL(Y)_" Refused "_$P(^PSDRUG(X,0),U,1)
 ..Q
 .Q
 Q G
ASACONTR(P,BDATE,EDATE,BGPNDAYS) ;does patient have an aspirin allergy
 K BGPMEDS1
 S K=0,R=""
 D GETMEDS^BGP1UTL2(P,BDATE,EDATE,,,,,.BGPMEDS1)
 I '$D(BGPMEDS1) G ASAC2
 S T=$O(^ATXAX("B","BGP CMS WARFARIN MEDS",0))
 S X=0 F  S X=$O(BGPMEDS1(X)) Q:X'=+X  S Y=+$P(BGPMEDS1(X),U,4) D
 .Q:'$D(^AUPNVMED(Y,0))
 .Q:$$UP^XLFSTR($P($G(^AUPNVMED(Y,11)),U))["RETURNED TO STOCK"
 .S G=0
 .S D=$P(^AUPNVMED(Y,0),U)
 .I T,$D(^ATXAX(T,21,"B",D)) S G=1 G WAR1
 .S N=$P($G(^PSDRUG(D,0)),U,1)
 .I N["WARFARIN" S G=1 G WAR1
 .Q:'G
WAR1 .;
 .S J=$P(^AUPNVMED(Y,0),U,8)
 .S V=$P(^AUPNVMED(Y,0),U,3)
 .Q:'V
 .Q:'$D(^AUPNVSIT(V,0))
 .S S=$$DAYS^BGP1D82(Y,V,EDATE)
 .S K=S+K
 .I R]"" S R=R_";"
 .S R=R_$$DATE^BGP1UTL($P($P(^AUPNVSIT(V,0),U),"."))_"("_S_")"
 I K>BGPNDAYS Q 1_U_" aspirin contra total days WARFARIN: "_K
WARPRIO ;now add in any before BEG DATE
 K BGPMEDS1
 D GETMEDS^BGP1UTL2(P,$$FMADD^XLFDT(BDATE,-365),BDATE,,,,,.BGPMEDS1)
 I '$D(BGPMEDS1) G ASAC2
 S X=0 F  S X=$O(BGPMEDS1(X)) Q:X'=+X  S Y=+$P(BGPMEDS1(X),U,4) D
 .Q:'$D(^AUPNVMED(Y,0))
 .Q:$$UP^XLFSTR($P($G(^AUPNVMED(Y,11)),U))["RETURNED TO STOCK"
 .S G=0
 .S D=$P(^AUPNVMED(Y,0),U)
 .I T,$D(^ATXAX(T,21,"B",D)) S G=1 G WAR2
 .S N=$P($G(^PSDRUG(D,0)),U,1)
 .I N["WARFARIN" S G=1 G WAR2
 .Q:'G
WAR2 .;
 .S J=$P(^AUPNVMED(Y,0),U,8)
 .S V=$P(^AUPNVMED(Y,0),U,3)
 .Q:'V
 .Q:'$D(^AUPNVSIT(V,0))
 .;S IS DAYS SUPPLY, J IS DATE DISCONTINUED
 .Q:J]""
 .S D=$$FMDIFF^XLFDT(EDATE,$P($P(^AUPNVSIT(V,0),U),"."))
 .S S=$P(^AUPNVMED(Y,0),U,7)
 .S S=S-D  ;subtract the number of days used
 .I S<0 S S=0
 .S K=S+K  ;TOTAL DAYS SUPPLY
 .I R]"" S R=R_";"
 .S R=R_$$DATE^BGP1UTL($P($P(^AUPNVSIT(V,0),U),"."))_"("_S_")"
 I K>BGPNDAYS Q 1_U_"asp contra total days WARFARIN: "_K
ASAC2 ;now check for dx 459
 K BGPG S BGPG=$$LASTDXI^BGP1UTL1(P,"459.0",$$DOB^AUPNPAT(P),EDATE)
 I BGPG Q 1_U_"asa contra 459.0 "_$$DATE^BGP1UTL($P(BGPG,U,3))
 ;
 ;nmi in refusal file for aspirin
 S BGPG=""
 S T=$O(^ATXAX("B","DM AUDIT ASPIRIN DRUGS",0))
 S X=0 F  S X=$O(^AUPNPREF("AA",P,50,X)) Q:X'=+X  D
 .Q:'$D(^ATXAX(T,21,"B",X))  ;not an aspirin
 .S D=0 F  S D=$O(^AUPNPREF("AA",P,50,X,D)) Q:D'=+D  D
 ..I (9999999-D)<BDATE Q  ;before report period
 ..I (9999999-D)>EDATE Q  ;documented after report period
 ..S N=0 F  S N=$O(^AUPNPREF("AA",P,50,X,D,N)) Q:N'=+N  D
 ...Q:$P($G(^AUPNPREF(N,0)),U,7)'="N"
 ...S BGPG=1_U_"asa contra NMI Aspirin:  "_$$VAL^XBDIQ1(9000022,N,.04)_" "_$$DATE^BGP1UTL($P(^AUPNPREF(N,0),U,3))_" "_$$VAL^XBDIQ1(9000022,X,1101)
 ..Q
 .Q
 I BGPG Q BGPG
 S X=$$CPTI^BGP1DU(P,BDATE,EDATE,+$$CODEN^ICPTCOD("G8008"))
 I X Q 1_U_"asa contra CPT code G8008: "_$$DATE^BGP1UTL($P(X,U,2))
 S X=$$TRANI^BGP1DU(P,BDATE,EDATE,+$$CODEN^ICPTCOD("G8008"))
 I X Q 1_U_"asa contra Tran Code G8008: "_$$DATE^BGP1UTL($P(X,U,2))
 Q ""
ASAALLEG(P,EDATE) ;EP
 K BGPG
 S X=$$ASAALLEG^BGP1CU1(P,$$DOB^AUPNPAT(P),EDATE)
 I 'X Q 0
 S $P(X,U,2)="ADR "_$P(X,U,2)
 Q X
