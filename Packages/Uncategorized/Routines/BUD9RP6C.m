BUD9RP6C ; IHS/CMI/LAB - UDS REPORT PROCESSOR 01 Dec 2009 3:10 PM 30 Dec 2009 7:19 PM ;
 ;;5.0;IHS/RPMS UNIFORM DATA SYSTEM;;JAN 18, 2011;Build 12
 ;
 ;
GETIMMS(P,BDATE,EDATE,C,BUDX) ;EP
 K BUDX
 NEW X,Y,I,Z,V
 S X=0 F  S X=$O(^AUPNVIMM("AC",P,X)) Q:X'=+X  D
 .Q:'$D(^AUPNVIMM(X,0))  ;happens
 .S Y=$P(^AUPNVIMM(X,0),U)
 .Q:'Y  ;happens too
 .S I=$P($G(^AUTTIMM(Y,0)),U,3)  ;get HL7/CVX code
 .F Z=1:1:$L(C,U) I I=$P(C,U,Z) S V=$P(^AUPNVIMM(X,0),U,3) I V S D=$P($P($G(^AUPNVSIT(V,0)),U),".") I D]"",D'>EDATE,D'<BDATE S BUDX(D)="CVX: "_I_" on "_$$DATE^BUD9UTL1(D)
 .Q
 Q
 ;
IMM ;EP - IMM
 ;must have DOB between in the year - 2
 S BUD2YRB=($E(BUDBD,1,3)-2)_"0101"
 S BUD2YRE=($E(BUDED,1,3)-2)_"1231"
 S BUDDOB=$P(^DPT(DFN,0),U,3)
 Q:BUDDOB<BUD2YRB
 Q:BUDDOB>BUD2YRE
 S BUD2ND=$E(BUDDOB,1,3)+2_$E(BUDDOB,4,7)
 S BUD1ST=$E(BUDDOB,1,3)+1_$E(BUDDOB,4,7)
 ;
 Q:BUDMEDV<1  ;didn't have at least 1 medical visit
 S BUDVBBD=$$VBBD^BUD9RP6D(DFN,BUDDOB,$$FMADD^XLFDT(BUD2ND,-1)) I 'BUDVBBD Q   ;no visit before 2nd bd
 S BUDSECTC("PTS")=$G(BUDSECTC("PTS"))+1
 S BUD42D=$$FMADD^XLFDT(BUDDOB,42)
 S (BUDNDTP,BUDNIPV,BUDNMMR,BUDNHEP,BUDNHIB,BUDNVAR,BUDNPNEU)=""
 S BUDNDTP=$$DTAP^BUD9RP6X(DFN,BUD42D,BUD2ND)
 S BUDNIPV=$$IPV(DFN,BUD42D,BUD2ND)
 S BUDNMMR=$$MMR(DFN,BUDDOB,BUD2ND)
 S BUDNHEP=$$HEP^BUD9RP6Y(DFN,BUDDOB,BUD2ND)
 S BUDNHIB=$$HIB^BUD9RP6Y(DFN,BUD42D,BUD2ND)
 S BUDNVAR=$$VAR^BUD9RP6Y(DFN,BUD1ST,BUD2ND)
 S BUDNPNEU=$$PNEU^BUD9RP6Y(DFN,BUDDOB,BUD2ND)
 I BUDNDTP]"",BUDNIPV]"",BUDNMMR]"",BUDNHEP]"",BUDNHIB]"",BUDNVAR]"",BUDNPNEU]"" S BUDSECTC("IMM")=$G(BUDSECTC("IMM"))+1 D  Q
 .I $G(BUDIMM1L) D
 ..S ^XTMP("BUD9RP6B",BUDJ,BUDH,"IMM1",$P(^DPT(DFN,0),U),BUDCOM,DFN)=BUDNDTP_U_BUDNIPV_U_BUDNMMR_U_BUDNHEP_U_BUDNHIB_U_BUDNVAR_U_BUDNPNEU_"|||"_BUDVBBD_U_BUDMEDVI
 ..Q
 I $G(BUDIMM2L) D
 .S V=$S(BUDNDTP]"":"",1:"4 dtp")_$S(BUDNIPV]"":"",1:";3 IPV")_$S(BUDNMMR]"":"",1:";1 MMR")_$S(BUDNHEP]"":"",1:";3 HEP")_$S(BUDNHIB]"":"",1:";3 HIB")_$S(BUDNVAR]"":"",1:";VARI")_$S(BUDNPNEU]"":"",1:";4 PNEUMO")
 .S ^XTMP("BUD9RP6B",BUDJ,BUDH,"IMM2",$P(^DPT(DFN,0),U),BUDCOM,DFN)=V
 Q
 ;
ANAREACT(I) ;EP
 NEW X,Y,R
 S X=0,Y=0 F  S X=$O(^GMR(120.8,I,10,X)) Q:X'=+X  D
 .S R=$P($G(^GMR(120.8,I,10,X,0)),U)
 .Q:R=""
 .S R=$P($G(^GMRD(120.83,R,0)),U)
 .I R'="ANAPHYLAXIS" Q
 .S Y=1
 .Q
 Q Y
 ;
ANCONT(P,C,ED) ;EP - ANALPHYLAXIS CONTRA
 NEW X
 S X=0,G="",Y=$O(^AUTTIMM("C",C,0)) I Y F  S X=$O(^BIPC("AC",P,Y,X)) Q:X'=+X!(G)  D
 .S R=$P(^BIPC(X,0),U,3)
 .Q:R=""
 .Q:'$D(^BICONT(R,0))
 .S D=$P(^BIPC(X,0),U,4)
 .Q:D=""
 .;Q:$P(^BIPC(X,0),U,4)<BD
 .Q:$P(^BIPC(X,0),U,4)>ED
 .I $P(^BICONT(R,0),U,1)="Anaphylaxis" S G=D_U_"Anaphylaxis"
 Q G
 ;
ANNECONT(P,C,ED) ;EP - ANALPHYLAXIS/NEOMYCIN CONTRA
 NEW X
 S X=0,G="",Y=$O(^AUTTIMM("C",C,0)) I Y F  S X=$O(^BIPC("AC",P,Y,X)) Q:X'=+X!(G)  D
 .S R=$P(^BIPC(X,0),U,3)
 .Q:R=""
 .Q:'$D(^BICONT(R,0))
 .S D=$P(^BIPC(X,0),U,4)
 .Q:D=""
 .;Q:$P(^BIPC(X,0),U,4)<BD
 .Q:$P(^BIPC(X,0),U,4)>ED
 .I $P(^BICONT(R,0),U,1)="Anaphylaxis" S G=D_U_"Anaphylaxis"
 .I $P(^BICONT(R,0),U,1)="Neomycin Allergy" S G=D_U_"Neomycin Allergy"
 Q G
 ;
MMRCONT(P,C,ED) ;EP - ANALPHYLAXIS/NEOMYCIN/IMMUNE CONTRA
 NEW X
 S X=0,G="",Y=$O(^AUTTIMM("C",C,0)) I Y F  S X=$O(^BIPC("AC",P,Y,X)) Q:X'=+X!(G)  D
 .S R=$P(^BIPC(X,0),U,3)
 .Q:R=""
 .Q:'$D(^BICONT(R,0))
 .S D=$P(^BIPC(X,0),U,4)
 .Q:D=""
 .;Q:$P(^BIPC(X,0),U,4)<BD
 .Q:$P(^BIPC(X,0),U,4)>ED
 .I $P(^BICONT(R,0),U,1)="Anaphylaxis" S G=D_U_"Anaphylaxis"
 .I $P(^BICONT(R,0),U,1)="Neomycin Allergy" S G=D_U_"Neomycin Allergy"
 .I $P(^BICONT(R,0),U,1)="Immune Deficiency" S G=D_U_"Immune Deficiency"
 .I $P(^BICONT(R,0),U,1)["Immune Deficient" S G=D_U_"Immune Deficient"
 Q G
 ;
IPV(P,BDATE,EDATE) ;EP
 ;check for a contraindication from DOB to 2nd birthday
 NEW X,G,N,BUDG,BUDX,BUDC,BUDOPV,BUDAPOV,C,BD,ED,V,Y,E
IPVCONT ;check allergy tracking
 S G=""
 S X=0 F  S X=$O(^GMR(120.8,"B",P,X)) Q:X'=+X!(G)  D
 .Q:$P($P($G(^GMR(120.8,X,0)),U,4),".")>EDATE  ;entered after 2ND birthday
 .S N=$P($G(^GMR(120.8,X,0)),U,2),N=$$UP^XLFSTR(N)
 .Q:'$$ANAREACT(X)  ;quit if anaphylactic is not a reaction/sign/symptom
 .I N["STREPTOMYCIN"!(N["POLYMYXIN B")!(N["NEOMYCIN") S G="IPV Contraindiction: "_$$DATE^BUD9UTL1($P($P($G(^GMR(120.8,X,0)),U,4),"."))_"  Allergy Tracking: "_N
 I G]"" Q G
 ;now check immunization package
 F BUDZ=10,110,120,130 S X=$$ANNECONT(P,BUDZ,EDATE) Q:X]""
 I X]"" Q "IPV Contraindication IM package: "_$$DATE^BUD9UTL1($P(X,U))_" "_$P(X,U,2)
 ;now check for evidence of disease
IPVEVID ;
 K BUDG S %=P_"^LAST DX [BUD IPV EVID DISEASE;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BUDG(")
 I $D(BUDG(1)) Q "IPV Evidence: "_$P(BUDG(1),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U))
 ;S X=$$PLTAX^BUD9DU(P,"BUD IPV EVID DISEASE") I X Q "IPV Evidence: Problem List "_$P(X,U,2)
 ;now get imms and see if there are 3
 K BUDC,BUDG,BUDX
 K BUDOPV,BUDAPOV
IPVIMM ;get all immunizations
 S C="10^110^120^130"
 K BUDX D GETIMMS(P,BDATE,EDATE,C,.BUDX)
 ;now get cpt codes
 S X=0 F  S X=$O(BUDX(X)) Q:X'=+X  S BUDOPV(X)=BUDX(X),BUDAPOV(X)=BUDX(X)
 ;now get cpts
 S ED=9999999-EDATE,BD=9999999-BDATE,G=0
 F  S ED=$O(^AUPNVSIT("AA",P,ED)) Q:ED=""!($P(ED,".")>BD)  D
 .S V=0 F  S V=$O(^AUPNVSIT("AA",P,ED,V)) Q:V'=+V  D
 ..Q:'$D(^AUPNVSIT(V,0))
 ..S X=0 F  S X=$O(^AUPNVCPT("AD",V,X)) Q:X'=+X  D
 ...S Y=$P(^AUPNVCPT(X,0),U),Y=$P($$CPT^ICPTCOD(Y),U,2) D
 ....I Y=90698!(Y=90713)!(Y=90723) S BUDOPV(9999999-$P(ED,"."))="CPT: "_Y_" on "_$$DATE^BUD9UTL1((9999999-$P(ED,"."))),BUDAPOV(9999999-$P(ED,"."))="CPT: "_Y_" on "_$$DATE^BUD9UTL1((9999999-$P(ED,".")))
 ..S X=0 F  S X=$O(^AUPNVTC("AD",V,X)) Q:X'=+X  D
 ...S Y=$P(^AUPNVTC(X,0),U,7) Q:'Y  S Y=$P($$CPT^ICPTCOD(Y),U,2) D
 ....I Y=90698!(Y=90713)!(Y=90723) S BUDOPV(9999999-$P(ED,"."))="CPT: "_Y_" on "_$$DATE^BUD9UTL1((9999999-$P(ED,"."))),BUDAPOV(9999999-$P(ED,"."))="CPT: "_Y_" on "_$$DATE^BUD9UTL1((9999999-$P(ED,".")))
 ;now check to see if they are all spaced 10 days apart, if not, kill off the odd ones
 S (X,Y)="",C=0 F  S X=$O(BUDOPV(X)) Q:X'=+X  S C=C+1 D
 .I C=1 S Y=X Q
 .I $$FMDIFF^XLFDT(X,Y)<11 K BUDOPV(X) Q
 .S Y=X
 ;now count them and see if there are 4 of them
 S BUDOPV=0,X=0 F  S X=$O(BUDOPV(X)) Q:X'=+X  S BUDOPV=BUDOPV+1
 I BUDOPV>2 S Y="IPV: total #: "_BUDOPV,X="" F  S X=$O(BUDOPV(X)) Q:X'=+X  S Y=Y_"  "_BUDOPV(X)
 I BUDOPV>2 Q Y
 ;now get povs
 K BUDPOV M BUDPOV=BUDAPOV
 ;K BUDG S %=P_"^ALL DX V06.3;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BUDG(")
 ;I $D(BUDG(1)) S X=0 F  S X=$O(BUDG(X)) Q:X'=+X  S BUDOPV($P(BUDG(X),U))="POV: "_$P(BUDG(X),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U,1)),BUDAOPV($P(BUDG(X),U))="POV: "_$P(BUDG(X),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U,1))
 ;K BUDG S %=P_"^ALL DX V04.0;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BUDG(")
 I $D(BUDG(1)) S X=0 F  S X=$O(BUDG(X)) Q:X'=+X  S BUDOPV($P(BUDG(X),U))="POV: "_$P(BUDG(X),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U,1)),BUDAOPV($P(BUDG(X),U))="POV: "_$P(BUDG(X),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U,1))
 K BUDG S %=P_"^ALL PROCEDURE 99.41;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BUDG(")
 I $D(BUDG(1)) S X=0 F  S X=$O(BUDG(X)) Q:X'=+X  S BUDOPV($P(BUDG(X),U))="Procedure: "_$P(BUDG(X),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U,1)),BUDAPOV($P(BUDG(X),U))="Procedure: "_$P(BUDG(X),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U,1))
 ;now check to see if they are all spaced 10 days apart, if not, kill off the odd ones
 S (X,Y)="",C=0 F  S X=$O(BUDOPV(X)) Q:X'=+X  S C=C+1 D
 .I C=1 S Y=X Q
 .I $$FMDIFF^XLFDT(X,Y)<11 K BUDOPV(X) Q
 .S Y=X
 ;now count them and see if there are 4 of them
 S BUDOPV=0,X=0 F  S X=$O(BUDOPV(X)) Q:X'=+X  S BUDOPV=BUDOPV+1
 I BUDOPV>2 S Y="IPV: total #: "_BUDOPV,X="" F  S X=$O(BUDOPV(X)) Q:X'=+X  S Y=Y_"  "_BUDOPV(X)
 I BUDOPV>2 Q Y
 Q ""
 ;
MMR(P,BDATE,EDATE) ;EP
 ;first check for contraindications
 ;dx first
MMRC ;
 NEW BUDG,%,X,BUDZ,BUDC,BUDX,G,N
 K BUDG S %=P_"^LAST DX [BGP MMR CONTRAINDICATIONS;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BUDG(")
 I $D(BUDG(1)) Q "MMR CONTRA DX: "_$P(BUDG(1),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U))
 S X=$$PLTAX^BUD9DU(P,"BGP MMR CONTRAINDICATIONS") I X Q "MMR CONTRA DX: "_$P(X,U,2)_" on Problem List"
 S G=""
 S X=0 F  S X=$O(^GMR(120.8,"B",P,X)) Q:X'=+X!(G)  D
 .Q:$P($P($G(^GMR(120.8,X,0)),U,4),".")>EDATE  ;entered after 2ND birthday
 .S N=$P($G(^GMR(120.8,X,0)),U,2),N=$$UP^XLFSTR(N)
 .Q:'$$ANAREACT(X)  ;quit if anaphylactic is not a reaction/sign/symptom
 .I N["NEOMYCIN" S G="MMR Contraindiction: "_$$DATE^BUD9UTL1($P($P($G(^GMR(120.8,X,0)),U,4),"."))_"  Allergy Tracking: "_N
 I G]"" Q G
 F BUDZ=3,94,4,38,5,7,6 S X=$$MMRCONT(P,BUDZ,EDATE) Q:X]""
 I X]"" Q "MMR Contraindication: "_$P(X,U,2)_" on "_$$DATE^BUD9UTL1($P(X,U,1))_" Immunization Package"
MMREVID ;
 ;any evidence of MMR?
 K BUDG S %=P_"^LAST DX [BGP MEASLES EVIDENCE;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BUDG(")
 I $D(BUDG(1)) Q "MMR Evidence: "_$P(BUDG(1),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U))
 ;S BUDMEAS=1,BUDVALUE=BUDVALUE_" MEASLES EVIDENCE DX: "_$P(BUDG(1),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U,1))
 ;
 S X=$$PLTAX^BUD9DU(P,"BGP MEASLES EVIDENCE")
 I X Q "MMR Evidence: "_$P(X,U,2)_" on "_$$DATE^BUD9UTL1($P(X,U,1))_" problem list"  ;S BUDMEAS=1,BUDVALUE=BUDVALUE_" MEASLES EVIDENCE PROB LIST: "_$P(X,U,2)
 ;no codes for MMR, only individual
MMRI ;
 K BUDC,BUDG,BUDX
 K ^TMP($J,"CPT")
 S (BUDMMR,BUDMUMPS,BUDRUB,BUDMEAS)=""  ;set to null for all
 ;first gather up all cpt codes that relate in any way to dtap and store in ^TMP
 S ED=9999999-EDATE,BD=9999999-BDATE,G=0
 F  S ED=$O(^AUPNVSIT("AA",P,ED)) Q:ED=""!($P(ED,".")>BD)  D
 .S V=0 F  S V=$O(^AUPNVSIT("AA",P,ED,V)) Q:V'=+V  D
 ..Q:'$D(^AUPNVSIT(V,0))
 ..Q:'$D(^AUPNVCPT("AD",V))
 ..S X=0 F  S X=$O(^AUPNVCPT("AD",V,X)) Q:X'=+X  D
 ...S Y=$P(^AUPNVCPT(X,0),U),Y=$P($$CPT^ICPTCOD(Y),U,2) I Y=+Y,$T(@Y)]"" S ^TMP($J,"CPT",9999999-$P(ED,"."),Y)=""
 ;get all immunizations
 S C="3^94"
 K BUDX D GETIMMS(P,BDATE,EDATE,C,.BUDX)  ;before 2nd birthday
 I $D(BUDX) S D=$O(BUDX(0)) Q "MMR "_BUDX(D)  ;HAD 1 MMR
 S D=0 F  S D=$O(^TMP($J,"CPT",D)) Q:D'=+D  S Y="" F  S Y=$O(^TMP($J,"CPT",D,Y)) Q:Y=""  D
 .I Y=90707!(Y=90710) S BUDMMR="CPT: "_Y_" on "_$$DATE^BUD9UTL1(D)
 I BUDMMR]"" Q "MMR "_BUDMMR
 ;
 ;K BUDG S %=P_"^ALL DX V06.4;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BUDG(")
 ;I $D(BUDG(1)) Q "MMR DX: "_$P(BUDG(1),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U))
 K BUDG S %=P_"^ALL PROCEDURE 99.45;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BUDG(")
 I $D(BUDG(1)) Q "MMR PROCEDURE: "_$P(BUDG(1),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U))
 ;now check individuals
MR ;see if one M/R, Mumps or R/M
 S BUDVALUE=""
 ;S C=4
 ;K BUDX D GETIMMS(P,BDATE,EDATE,C,.BUDX)
 ;I $D(BUDX) S BUDMEAS=1,BUDRUB=1,BUDVALUE="MEASLES/RUBELLA " S D=$O(BUDX(0)) S BUDVALUE=BUDVALUE_BUDX(D)
 ;I 'BUDMEAS!('BUDRUB) S D=0 F  S D=$O(^TMP($J,"CPT",D)) Q:D'=+D  S Y="" F  S Y=$O(^TMP($J,"CPT",D,Y)) Q:Y=""  D
 ;.I Y=90708 S BUDMEAS=1,BUDRUB=1,BUDVALUE=BUDVALUE_" MEASLES/RUBELLA CPT: "_Y_" on "_$$DATE^BUD9UTL1(D)
RM ;
 ;S C=38
 ;D GETIMMS(P,BDATE,EDATE,C,.BUDX)
 ;I $D(BUDX) S BUDRUB=1,BUDMUMPS=1 S D=$O(BUDX(0)) S BUDVALUE=BUDVALUE_" RUBELLA/MUMPS "_BUDX(D)
 ;S D=0 F  S D=$O(^TMP($J,"CPT",D)) Q:D'=+D  S Y="" F  S Y=$O(^TMP($J,"CPT",D,Y)) Q:Y=""  D
 ;.I Y=90709 S BUDMUMPS=1,BUDRUB=1,BUDVALUE=BUDVALUE_" RUBELLA/MUMPS CPT "_Y_" on "_$$DATE^BUD9UTL1(D)
ME S C=5
 K BUDX D GETIMMS(P,BDATE,EDATE,C,.BUDX)
 I $D(BUDX) S BUDMEAS=1 S D=$O(BUDX(0)) S BUDVALUE=BUDVALUE_" MEASLES "_BUDX(D)
 S D=0 F  S D=$O(^TMP($J,"CPT",D)) Q:D'=+D  S Y="" F  S Y=$O(^TMP($J,"CPT",D,Y)) Q:Y=""  D
 .I Y=90705!(Y=90708) S BUDMEAS=1,BUDVALUE=BUDVALUE_" MEASLES CPT "_Y_" on "_$$DATE^BUD9UTL1(D)
 ;K BUDG S %=P_"^ALL DX V04.2;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BUDG(")
 ;I $D(BUDG(1)) S BUDMEAS=1,BUDVALUE=BUDVALUE_" MEASLES DX: "_$P(BUDG(1),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U,1))
 K BUDG S %=P_"^ALL PROCEDURE 99.45;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BUDG(")
 I $D(BUDG(1)) S BUDMEAS=1,BUDVALUE=BUDVALUE_" MEASLES PROCEDURE: "_$P(BUDG(1),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U,1))
 I BUDMEAS="" K BUDG S %=P_"^LAST DX [BGP MEASLES EVIDENCE;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BUDG(") I $D(BUDG(1)) S BUDMEAS=1,BUDVALUE=BUDVALUE_" MEASLES EVIDENCE DX: "_$P(BUDG(1),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U,1))
 I BUDMEAS="" S X=$$PLTAX^BUD9DU(P,"BGP MEASLES EVIDENCE") I X S BUDMEAS=1,BUDVALUE=BUDVALUE_" MEASLES EVIDENCE PROB LIST: "_$P(X,U,2)
 I BUDMEAS,BUDMUMPS,BUDRUB Q BUDVALUE
MU S C=7
 D GETIMMS(P,BDATE,EDATE,C,.BUDX)
 I $D(BUDX) S BUDMUMPS=1 S D=$O(BUDX(0)) S BUDVALUE=BUDVALUE_" MUMPS "_BUDX(D)
 S D=0 F  S D=$O(^TMP($J,"CPT",D)) Q:D'=+D  S Y="" F  S Y=$O(^TMP($J,"CPT",D,Y)) Q:Y=""  D
 .I Y=90704!(Y=90710) S BUDMU=1,BUDVALUE=BUDVALUE_" MUMPS CPT "_Y_" on "_$$DATE^BUD9UTL1(D)
 ;K BUDG S %=P_"^ALL DX V04.6;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BUDG(")
 ;I $D(BUDG(1)) S BUDMEAS=1,BUDVALUE=BUDVALUE_" MUMPS DX: "_$P(BUDG(1),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U,1))
 K BUDG S %=P_"^ALL PROCEDURE 99.46;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BUDG(")
 I $D(BUDG(1)) S BUDMEAS=1,BUDVALUE=BUDVALUE_" MUMPS PROCEDURE: "_$P(BUDG(1),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U,1))
 I BUDMEAS="" K BUDG S %=P_"^LAST DX [BGP MUMPS EVIDENCE;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BUDG(") I $D(BUDG(1)) S BUDMEAS=1,BUDVALUE=BUDVALUE_" MUMPS EVIDENCE DX: "_$P(BUDG(1),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U,1))
 I BUDMEAS="" S X=$$PLTAX^BUD9DU(P,"BGP MUMPS EVIDENCE") I X S BUDMEAS=1,BUDVALUE=BUDVALUE_" MUMPS EVIDENCE PROB LIST: "_$P(X,U,2)
 I BUDMEAS,BUDMUMPS,BUDRUB Q BUDVALUE
RUB S C=6
 D GETIMMS(P,BDATE,EDATE,C,.BUDX)
 I $D(BUDX) S BUDRUB=1,D=$O(BUDX(0)) S BUDVALUE=BUDVALUE_" RUBELLA "_BUDX(D)
 S D=0 F  S D=$O(^TMP($J,"CPT",D)) Q:D'=+D  S Y="" F  S Y=$O(^TMP($J,"CPT",D,Y)) Q:Y=""  D
 .I Y=90706!(Y=90707)!(Y=90708)!(Y=90710) S BUDRUB=1,BUDVALUE=BUDVALUE_" RUBELLA CPT "_Y_" on "_$$DATE^BUD9UTL1(D)
 K BUDG S %=P_"^ALL PROCEDURE 99.47;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BUDG(")
 I $D(BUDG(1)) S BUDMEAS=1,BUDVALUE=BUDVALUE_" RUBELLA PROCEDURE: "_$P(BUDG(1),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U,1))
 I BUDMEAS="" K BUDG S %=P_"^LAST DX [BGP RUBELLA EVIDENCE;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BUDG(") I $D(BUDG(1)) S BUDMEAS=1,BUDVALUE=BUDVALUE_" RUBELLA EVIDENCE DX: "_$P(BUDG(1),U,2)_" on "_$$DATE^BUD9UTL1($P(BUDG(1),U,1))
 I BUDMEAS="" S X=$$PLTAX^BUD9DU(P,"BGP RUBELLA EVIDENCE") I X S BUDMEAS=1,BUDVALUE=BUDVALUE_" RUBELLA EVIDENCE PROB LIST: "_$P(X,U,2)
 I BUDMEAS,BUDMUMPS,BUDRUB Q BUDVALUE
 Q ""
 ;
90707 ;;
90710 ;;
90708 ;;
90705 ;;
90704 ;;
90706 ;; 
