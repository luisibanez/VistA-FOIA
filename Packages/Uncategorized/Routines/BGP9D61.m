BGP9D61 ; IHS/CMI/LAB - measure 31 01 Jul 2008 7:47 PM ; 
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
I17 ;EP
 S (BGPN1,BGPN2,BGPN3,BGPN4,BGPN5,BGPN6,BGPN7,BGPD1,BGPD2,BGPD3,BGPD4,BGPD5,BGPD6,BGPD7,BGPD8,BGPD9)=0
 I BGPAGEB<51 S BGPSTOP=1 Q
 I BGPAGEB>80 S BGPSTOP=1 Q
 I $$CRC(DFN,BGPEDATE) S BGPSTOP=1 Q  ;has colorectal cancer
 I BGPACTUP S BGPD1=1
 I BGPACTCL S BGPD2=1
 I 'BGPD1 S BGPSTOP=1 Q  ;need to be at least in user pop
CRCP ;EP - called from elder
 S BGPFOB=$$FOB(DFN,BGPBDATE,BGPEDATE)
 I BGPFOB]"" S BGPN3=1,BGPN1=1
 S BGPOTH=""
 I BGPN1=0 S BGPOTH=$$IBH(DFN,BGPEDATE)
 I BGPOTH]"" S BGPN1=1
 S BGPSIG=$$SIG(DFN,BGPEDATE)
 S BGPCOLO=$$COLO(DFN,BGPEDATE)
 S BGPBE=$$BE(DFN,BGPEDATE)
 I BGPSIG]""!(BGPBE]"")!(BGPCOLO]"") S BGPN4=1
 I BGPSIG]""!(BGPCOLO]"") S BGPN5=1
 I BGPSIG]""&(BGPBE]"")!(BGPCOLO]"") S BGPN6=1
 S BGPREF="" I 'BGPN1 S BGPREF=$$REF(DFN,$$FMADD^XLFDT(BGPEDATE,-365),BGPEDATE) I BGPREF S BGPN1=1,BGPN2=1
 I BGPN1,'BGPN2 S BGPN7=1
 S BGPVALUE=""
 I BGPFOB]"" S BGPVALUE="FOB: "_$P(BGPFOB,U)_":"_$$DATE^BGP9UTL($P(BGPFOB,U,2))_" "
 ;I BGPOTH]"" S BGPVALUE=BGPVALUE_$P(BGPOTH,U)_":"_$P(BGPOTH,U,2)_" "
 I BGPREF]"" S BGPVALUE=BGPVALUE_$P(BGPREF,U,3)_":"_$$DATE^BGP9UTL($P(BGPREF,U,2))
 I BGPSIG]"" S BGPVALUE=BGPVALUE_"SIG: "_$P(BGPSIG,U)_":"_$P(BGPSIG,U,2)_" "
 I BGPCOLO]"" S BGPVALUE=BGPVALUE_"COLO: "_$P(BGPCOLO,U)_":"_$P(BGPCOLO,U,2)_" "
 I BGPBE]"" S BGPVALUE=BGPVALUE_"BE: "_$P(BGPBE,U)_":"_$P(BGPBE,U,2)_" "
 S BGPDV=$S(BGPD1:"UP",1:"")_$S(BGPD2:",AC",1:"")
 S BGPVALUE=BGPDV_"|||"_BGPVALUE
 K X,Y,Z,%,A,B,C,D,E,H,BDATE,EDATE,P
 Q
IBH(P,EDATE) ;EP
 NEW VALUE
 S VALUE=""
 S VALUE=$$SIG(P,EDATE)
 I VALUE]"" Q VALUE
 S VALUE=$$BE(P,EDATE)
 I VALUE]"" Q VALUE
 S VALUE=$$COLO(P,EDATE)
 I VALUE]"" Q VALUE
 Q ""
CRC(P,EDATE) ;EP
 K BGPG
 S Y="BGPG("
 S X=P_"^LAST DX [BGP COLORECTAL CANCER DXS;DURING "_$$FMTE^XLFDT($$DOB^AUPNPAT(P))_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 I $D(BGPG(1)) Q 1  ;has a dx
 S T=$O(^ATXAX("B","BGP COLORECTAL CANCER CPTS",0))
 I T D  I X]"" Q 1
 .S X=$$CPT^BGP9DU(P,$$DOB^AUPNPAT(P),EDATE,T,5) I X]"" Q
 .S X=$$TRAN^BGP9DU(P,$$DOB^AUPNPAT(P),EDATE,T,5)
 S BGPG=$$LASTPRC^BGP9UTL1(P,"BGP TOTAL COLECTOMY PROCS",$$DOB^AUPNPAT(P),EDATE)
 I BGPG Q 1
 S T=$O(^ATXAX("B","BGP TOTAL COLECTOMY CPTS",0))
 I T D  I X]"" Q 1
 .S X=$$CPT^BGP9DU(P,$$DOB^AUPNPAT(P),EDATE,T,5) I X]"" Q
 .S X=$$TRAN^BGP9DU(P,$$DOB^AUPNPAT(P),EDATE,T,5)
 Q 0
SIG(P,EDATE,BDATE) ;EP
 NEW BGPLSIG
 S BGPLSIG=""
 I $G(BDATE)="" S BDATE=$$FMADD^XLFDT(EDATE,5*(-365))
 ;S BGPG=$$LASTPRCI^BGP9UTL1(P,"45.24",BDATE,EDATE)
 S BGPG=$$LASTPRC^BGP9UTL1(P,"BGP SIG PROCS",BDATE,EDATE)
 I $P(BGPG,U)=1 S BGPLSIG="SIG "_$P(BGPG,U,2)_"^"_$$DATE^BGP9UTL($P(BGPG,U,3))_U_$P(BGPG,U,3)
 ;
 S T=$O(^ATXAX("B","BGP SIG CPTS",0))
 I T D  I X]"",$P(BGPLSIG,U,3)<$P(X,U,1) S BGPLSIG="CPT SIG "_$P(X,U,2)_U_$$DATE^BGP9UTL($P(X,U,1))_U_$P(X,U,1)
 .S X=$$CPT^BGP9DU(P,BDATE,EDATE,T,5) I X]"" Q
 .S X=$$TRAN^BGP9DU(P,BDATE,EDATE,T,5)
 Q BGPLSIG
COLO(P,EDATE,BDATE) ;EP
 K BGPG
 S BGPLCOLO=""
 I $G(BDATE)="" S BDATE=$$FMADD^XLFDT(EDATE,10*(-365))
 S BGPG=$$LASTPRC^BGP9UTL1(P,"BGP COLO PROCS",BDATE,EDATE)
 I $P(BGPG,U)=1 S BGPLCOLO="COLO "_$P(BGPG,U,2)_"^"_$$DATE^BGP9UTL($P(BGPG,U,3))_U_$P(BGPG,U,3)
 ;K BGPG S %=P_"^LAST PROCEDURE 45.22;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,"BGPG(")
 ;I $D(BGPG(1)) Q "COLO 45.22"_"^"_$$DATE^BGP9UTL($P(BGPG(1),U))
 ;S BGPG=$$LASTPRCI^BGP9UTL1(P,"45.22",BDATE,EDATE)
 ;I $P(BGPG,U)=1 S BGPLCOLO="COLO 45.22"_"^"_$$DATE^BGP9UTL($P(BGPG,U,3))_U_$P(BGPG,U,3)
 ;S BGPG=$$LASTPRCI^BGP9UTL1(P,"45.23",BDATE,EDATE)
 ;I $P(BGPG,U)=1,$P(BGPLCOLO,U,3)<$P(BGPG,U,3) S BGPLCOLO="COLO 45.23"_"^"_$$DATE^BGP9UTL($P(BGPG,U,3))_U_$P(BGPG,U,3)
 ;S BGPG=$$LASTPRCI^BGP9UTL1(P,"45.25",BDATE,EDATE)
 ;I $P(BGPG,U)=1,$P(BGPLCOLO,U,3)<$P(BGPG,U,3) S BGPLCOLO="COLO 45.25"_"^"_$$DATE^BGP9UTL($P(BGPG,U,3))_U_$P(BGPG,U,3)
 ;S BGPG=$$LASTPRCI^BGP9UTL1(P,"45.43",BDATE,EDATE)
 ;I $P(BGPG,U)=1,$P(BGPLCOLO,U,3)<$P(BGPG,U,3) S BGPLCOLO="COLO 45.43"_"^"_$$DATE^BGP9UTL($P(BGPG,U,3))_U_$P(BGPG,U,3)
 ;S BGPG=$$LASTPRCI^BGP9UTL1(P,"45.42",BDATE,EDATE)
 ;I $P(BGPG,U)=1,$P(BGPLCOLO,U,3)<$P(BGPG,U,3) S BGPLCOLO="COLO 45.42"_"^"_$$DATE^BGP9UTL($P(BGPG,U,3))_U_$P(BGPG,U,3)
 S %=P_"^LAST DIAGNOSIS [BGP COLO DXS;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)),$P(BGPLCOLO,U,3)<$P(BGPG(1),U,1) S BGPLCOLO="COLO DX V76.51"_"^"_$$DATE^BGP9UTL($P(BGPG(1),U))
 S T=$O(^ATXAX("B","BGP COLO CPTS",0))
 I T D  I X]"",$P(BGPLCOLO,U,3)<$P(X,U,1) S BGPLCOLO="CPT COLO "_$P(X,U,2)_U_$$DATE^BGP9UTL($P(X,U,1))_U_$P(X,U,1)
 .S X=$$CPT^BGP9DU(P,BDATE,EDATE,T,5) I X]"" Q
 .S X=$$TRAN^BGP9DU(P,BDATE,EDATE,T,5)
 Q BGPLCOLO
FOB(P,BDATE,EDATE) ;EP
 I $G(BDATE)="" S BDATE=$$FMADD^XLFDT(EDATE,2*(-365))
 S BGPC="",BGPLFOB=""
 S T=$O(^ATXAX("B","BGP FOBT LOINC CODES",0))
 S BGPLT=$O(^ATXLAB("B","BGP GPRA FOB TESTS",0))
 S B=9999999-BDATE,E=9999999-EDATE S D=E-1 F  S D=$O(^AUPNVLAB("AE",P,D)) Q:D'=+D!(D>B)!(BGPC]"")  D
 .S L=0 F  S L=$O(^AUPNVLAB("AE",P,D,L)) Q:L'=+L!(BGPC]"")  D
 ..S X=0 F  S X=$O(^AUPNVLAB("AE",P,D,L,X)) Q:X'=+X!(BGPC]"")  D
 ...Q:'$D(^AUPNVLAB(X,0))
 ...I BGPLT,$P(^AUPNVLAB(X,0),U),$D(^ATXLAB(BGPLT,21,"B",$P(^AUPNVLAB(X,0),U))) S BGPC="V LAB"_U_(9999999-D) Q
 ...Q:'T
 ...S J=$P($G(^AUPNVLAB(X,11)),U,13) Q:J=""
 ...Q:'$$LOINC(J,T)
 ...S BGPC="LOINC"_U_(9999999-D) Q
 ...Q
 S BGPLFOB=BGPC
 S T=$O(^ATXAX("B","BGP FOBT CPTS",0))
 I T D  I X]"",$P(BGPLFOB,U,2)<$P(X,U,1) S BGPLFOB="CPT "_$P(X,"^",2)_"^"_$P(X,U,1)
 .S X=$$CPT^BGP9DU(P,BDATE,EDATE,T,5) I X]"" Q
 ;S E=+$$CODEN^ICPTCOD(82270) I E S %=$$CPTI^BGP9DU(P,BDATE,EDATE,E) I $P(%,U,1)=1,$P(BGPLFOB,U,2)<$P(%,U,2) S BGPLFOB="CPT 82270"_"^"_$P(%,U,2)
 ;S E=+$$CODEN^ICPTCOD(82274) I E S %=$$CPTI^BGP9DU(P,BDATE,EDATE,E) I $P(%,U,1)=1,$P(BGPLFOB,U,2)<$P(%,U,2) S BGPLFOB="CPT 82274"_"^"_$P(%,U,2)
 ;S E=+$$CODEN^ICPTCOD(89205) I E S %=$$CPTI^BGP9DU(P,BDATE,EDATE,E) I $P(%,U,1)=1,$P(BGPLFOB,U,2)<$P(%,U,2) S BGPLFOB="CPT 89205"_"^"_$P(%,U,2)
 ;S E=+$$CODEN^ICPTCOD("G0107") I E S %=$$CPTI^BGP9DU(P,BDATE,EDATE,E) I $P(%,U,1)=1,$P(BGPLFOB,U,2)<$P(%,U,2) S BGPLFOB="CPT G0107"_"^"_$P(%,U,2)
 ;S E=+$$CODEN^ICPTCOD("G0328") I E S %=$$CPTI^BGP9DU(P,BDATE,EDATE,E) I $P(%,U,1)=1,$P(BGPLFOB,U,2)<$P(%,U,2) S BGPLFOB="CPT G0328"_"^"_$P(%,U,2)
 ;S E=+$$CODEN^ICPTCOD("G0394") I E S %=$$CPTI^BGP9DU(P,BDATE,EDATE,E) I $P(%,U,1)=1,$P(BGPLFOB,U,2)<$P(%,U,2) S BGPLFOB="CPT G0394"_"^"_$P(%,U,2)
 ;tran
 ;S E=+$$CODEN^ICPTCOD(82270) I E S %=$$TRANI^BGP9DU(P,BDATE,EDATE,E) I $P(%,U,1)=1,$P(BGPLFOB,U,2)<$P(%,U,2) S BGPLFOB="TRAN 82270"_"^"_$P(%,U,2)
 ;S E=+$$CODEN^ICPTCOD(82274) I E S %=$$TRANI^BGP9DU(P,BDATE,EDATE,E) I $P(%,U,1)=1,$P(BGPLFOB,U,2)<$P(%,U,2) S BGPLFOB="TRAN 82274"_"^"_$P(%,U,2)
 ;S E=+$$CODEN^ICPTCOD(89205) I E S %=$$TRANI^BGP9DU(P,BDATE,EDATE,E) I $P(%,U,1)=1,$P(BGPLFOB,U,2)<$P(%,U,2) S BGPLFOB="TRAN 89205"_"^"_$P(%,U,2)
 ;S E=+$$CODEN^ICPTCOD("G0107") I E S %=$$TRANI^BGP9DU(P,BDATE,EDATE,E) I $P(%,U,1)=1,$P(BGPLFOB,U,2)<$P(%,U,2) S BGPLFOB="TRAN G0107"_"^"_$P(%,U,2)
 ;S E=+$$CODEN^ICPTCOD("G0328") I E S %=$$TRANI^BGP9DU(P,BDATE,EDATE,E) I $P(%,U,1)=1,$P(BGPLFOB,U,2)<$P(%,U,2) S BGPLFOB="TRAN G0328"_"^"_$P(%,U,2)
 ;S E=+$$CODEN^ICPTCOD("G0394") I E S %=$$TRANI^BGP9DU(P,BDATE,EDATE,E) I $P(%,U,1)=1,$P(BGPLFOB,U,2)<$P(%,U,2) S BGPLFOB="TRAN G0394"_"^"_$P(%,U,2)
 ;S E=$$LASTDXI^BGP9UTL1(P,"V76.51",BDATE,EDATE) I $P(E,U,1)=1,$P(BGPLFOB,U,2)<$P(E,U,3) S BGPLFOB="POV V76.51^"_$P(E,U,3)
 Q BGPLFOB
BE(P,EDATE,BDATE) ;EP
 I $G(BDATE)="" S BDATE=$$FMADD^XLFDT(EDATE,5*(-365))
 S BGPLBE=""
 S T=$O(^ATXAX("B","BGP BE CPTS",0))
 I T D  I X]"" S BGPLBE="CPT BE "_$P(X,U,2)_U_$$DATE^BGP9UTL($P(X,U,1))_U_$P(X,U,1)
 .S X=$$CPT^BGP9DU(P,BDATE,EDATE,T,5) I X]"" Q
 .S X=$$TRAN^BGP9DU(P,BDATE,EDATE,T,5)
 .Q
 S T=$O(^ATXAX("B","BGP BE CPTS",0))
 I T D  I X]"",$P(BGPLBE,U,3)<X Q "RAD BE"_U_$$DATE^BGP9UTL(X)_U_X
 .S X=$$RAD^BGP9DU(P,BDATE,EDATE,T,3)
 .Q
 Q BGPLBE
 ;
LOINC(A,B) ;
 NEW %
 S %=$P($G(^LAB(95.3,A,9999999)),U,2)
 I %]"",$D(^ATXAX(B,21,"B",%)) Q 1
 S %=$P($G(^LAB(95.3,A,0)),U)_"-"_$P($G(^LAB(95.3,A,0)),U,15)
 I $D(^ATXAX(B,21,"B",%)) Q 1
 Q ""
REF(P,BDATE,EDATE) ;EP
 ;refusal
 S BGPT=$O(^ATXLAB("B","BGP GPRA FOB TESTS",0))
 I BGPT D  I $P(G,U) Q "1^"_$P(G,U,2)_U_"REF FOB"
 .S (G,BGPT1)=0 F  S BGPT1=$O(^ATXLAB(BGPT,21,"B",BGPT1)) Q:BGPT1=""!($P(G,U))  D
 ..S G=$$REFUSAL^BGP9UTL1(P,60,BGPT1,BDATE,EDATE)
 F BGPT=82270,82274,"G0107",89205,"G0328","G0394" D  Q:$P(T,U)=1
 .S C=+$$CODEN^ICPTCOD(BGPT) Q:C'>0
 .S T=""
 .S T=$$REFUSAL^BGP9UTL1(P,81,+$$CODEN^ICPTCOD(BGPT),$$FMADD^XLFDT(EDATE,-365),EDATE)
 .I T S T="1^"_$P(T,U,2)_"^ref FOBT cpt"
 I $P(T,U)=1 Q T
 S BGPT=$O(^ATXAX("B","BGP SIG CPTS",0))
 I BGPT S G=$$RADREF^BGP9UTL1(P,BDATE,EDATE,BGPT) I $P(G,U,1)=1 Q 1_"^"_$P(G,U,2)_"^"_"ref SIG cpt"
 S BGPT=$O(^ATXAX("B","BGP BE CPTS",0))
 I BGPT S G=$$RADREF^BGP9UTL1(P,BDATE,EDATE,BGPT) I $P(G,U,1)=1 Q 1_"^"_$P(G,U,2)_"^"_"ref DCBE cpt"
 S BGPT=$O(^ATXAX("B","BGP COLO CPTS",0))
 I BGPT S G=$$RADREF^BGP9UTL1(P,BDATE,EDATE,BGPT) I $P(G,U,1)=1 Q 1_"^"_$P(G,U,2)_"^"_"ref COLO cpt"
 S BGPT=$O(^ATXAX("B","BGP SIG CPTS",0))
 I BGPT S G=$$CPTREFT^BGP9UTL1(P,BDATE,EDATE,BGPT) I $P(G,U,1)=1 Q 1_"^"_$P(G,U,2)_"^"_"ref SIG cpt"
 S BGPT=$O(^ATXAX("B","BGP BE CPTS",0))
 I BGPT S G=$$CPTREFT^BGP9UTL1(P,BDATE,EDATE,BGPT) I $P(G,U,1)=1 Q 1_"^"_$P(G,U,2)_"^"_"ref DCBE cpt"
 S BGPT=$O(^ATXAX("B","BGP COLO CPTS",0))
 I BGPT S G=$$CPTREFT^BGP9UTL1(P,BDATE,EDATE,BGPT) I $P(G,U,1)=1 Q 1_"^"_$P(G,U,2)_"^"_"ref COLO cpt"
 F BGPT=45.24,45.42,45.22,45.23,45.25,45.43 D  Q:$P(T,U)=1
 .S C=+$$CODEN^ICDCODE(BGPT,80.1) Q:C'>0
 .S T=""
 .S T=$$REFUSAL^BGP9UTL1(P,80.1,C,$$FMADD^XLFDT(EDATE,-365),EDATE)
 .I T S T="1^"_$P(T,U,2)_"^ref "_$S(BGPT="45.24":"SIG ",1:"COLO ")_"proc"
 I $P(T,U)=1 Q T
 Q ""
RECT(P,EDATE) ;EP
 S BDATE=$$FMADD^XLFDT(EDATE,2*(-365))
 K BGPG
 S %=P_"^LAST EXAM RECTAL;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)) Q "RECTAL EXAM"_"^"_$$DATE^BGP6UTL($P(BGPG(1),U))
 S %=P_"^LAST DIAGNOSIS V76.41;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)) Q "RECT DX V76.41"_"^"_$$DATE^BGP6UTL($P(BGPG(1),U))
 S T=$O(^ATXAX("B","BGP RECTAL PROCEDURE CODES",0))
 S (F,S)=0 F  S F=$O(^AUPNVPRC("AC",P,F)) Q:F'=+F!(S)  S C=$P(^AUPNVPRC(F,0),U) D
 .S G=0 S:$$ICD^ATXCHK(C,T,0) G=1
 .Q:G=0
 .S D=$P(^AUPNVPRC(F,0),U,6) I D="" S D=$P($P(^AUPNVSIT($P(^AUPNVPRC(F,0),U,3),0),U),".")
 .I D>EDATE Q
 .I D<BDATE Q
 .S S=1
 I S=1 Q "RECT VPRC"_"^"_$$DATE^BGP6UTL(D)_" "_$P($$ICDOP^ICDCODE(C),U,2)
 S BDATE=$$FMADD^XLFDT(EDATE,-365)
 S G=$$REFUSAL^BGP6UTL1(P,9999999.15,$O(^AUTTEXAM("B","RECTAL EXAM",0)),BDATE,EDATE)
 I $P(G,U)=1 Q "REFUSED RECTAL EXAM"_"^"_$$DATE^BGP6UTL($P(G,U,2))
 Q ""
