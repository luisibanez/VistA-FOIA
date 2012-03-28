BGP1D25 ; IHS/CMI/LAB - measure 6 03 Jun 2011 3:16 PM ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
IA ;EP
 S (BGPN1,BGPN2,BGPN3,BGPN4,BGPN5,BGPN6,BGPN7,BGPN8,BGPD1,BGPD2,BGPD3,BGPD4,BGPD5,BGPD6,BGPD7,BGPD8,BGPD9)=0
 I BGPACTCL,BGPAGEB>7,BGPAGEB<18 S BGPD1=1  ;8-17
 I BGPACTCL,BGPAGEB>17 S BGPD2=1  ;>17
 I BGPACTCL,BGPAGEB>64 S BGPD3=1  ;65 AND OLDER
 I BGPACTUP,BGPAGEB>7,BGPAGEB<18 S BGPD4=1
 I BGPACTUP,BGPAGEB>17 S BGPD5=1  ;>17 UP
 I BGPACTUP,BGPAGEB>64 S BGPD6=1  ;65 UP
 I BGPACTCL,BGPAGEB>11,BGPAGEB<19 S BGPD9=1
 I BGPDMD2 S BGPD7=1
 I $$IHD^BGP1D721(DFN,BGP365,BGPEDATE),BGPACTCL S BGPIHD=1,BGPD8=1
 I BGPRTYPE=4,BGPAGEB<18,'BGPIHD,'BGPDMD2 S BGPSTOP=1 Q  ;IF THEY ARE UNDER 18 AND NOT IHD AND NOT DM Q
 I '(BGPD1+BGPD2+BGPD3+BGPD4+BGPD5+BGPD6+BGPD7+BGPD8+BGPD9) S BGPSTOP=1 Q
DEPEP ;EP - called from elder
 S BGPN3=0 S BGPDEP=$$DEP(DFN,BGPBDATE,BGPEDATE) I $P(BGPDEP,U)=1 S BGPN3=1
 S BGPN2=0 S BGPDEPS=$$DEPSCR(DFN,BGPBDATE,BGPEDATE) I $P(BGPDEPS,U)=1 S BGPN2=1
 S BGPN5=0 S BGPDEDU=$$DEPEDU(DFN,BGPBDATE,BGPEDATE) I $P(BGPDEDU,U)=1 S BGPN5=1
 S BGPN6=0 S BGPSUIC=$$DEPSUIC(DFN,BGPBDATE,BGPEDATE) I $P(BGPSUIC,U)=1 S BGPN6=1
 I BGPN2 S BGPN1=1
 I BGPN3 S BGPN1=1
 S BGPREF=""
 S BGPN4=0 I 'BGPN1 S BGPREF=$$DEPREF(DFN,BGPBDATE,BGPEDATE) I $P(BGPREF,U)=1 S BGPN4=1
 I BGPN4 S BGPN1=1
 I BGPN1,'BGPN4 S BGPN7=1
 S BGPN8=0 I BGPN2!(BGPN3)!(BGPN6) S BGPN8=1
 S BGPVALUE=""
 I (BGPD4+BGPD5+BGPD6) S BGPVALUE="UP"
 I (BGPD1+BGPD2+BGPD3) S BGPVALUE=BGPVALUE_$S(BGPVALUE]"":",",1:"")_"AC"
 I BGPD7 S BGPVALUE=BGPVALUE_$S(BGPVALUE]"":",",1:"")_"AD"
 I BGPD8 S BGPVALUE=BGPVALUE_$S(BGPVALUE]"":",",1:"")_"IHD"
 S BGPVALUE=BGPVALUE_"|||"
 I BGPDEPS]"" S BGPVALUE=BGPVALUE_$S($P(BGPVALUE,"|||",2)]"":"; SCREEN: ",1:"SCREEN: ") S BGPVALUE=BGPVALUE_$P(BGPDEPS,U,3)_" "_$P(BGPDEPS,U,5)
 I BGPDEP]"" S BGPVALUE=BGPVALUE_$S($P(BGPVALUE,"|||",2)]"":"; DX: ",1:"DX: ") S BGPVALUE=BGPVALUE_$P(BGPDEP,U,3)_" "_$P(BGPDEP,U,4)_" "_$P(BGPDEP,U,2)
 I BGPDEDU]"" S BGPVALUE=BGPVALUE_$S($P(BGPVALUE,"|||",2)]"":"; PT ED: ",1:"PT ED: ") S BGPVALUE=BGPVALUE_$P(BGPDEDU,U,3)_" "_$P(BGPDEDU,U,2)
 I BGPREF]"" S BGPVALUE=BGPVALUE_$S($P(BGPVALUE,"|||",2)]"":"; ",1:"") S BGPVALUE=BGPVALUE_$P(BGPREF,U,3)_" "_$P(BGPREF,U,2)
 I BGPD5!(BGPD9) S BGPVALUD=$S(BGPD5:"AC >=18",BGPD9:"AC 12-18",1:"")_"|||" D
 .I BGPDEPS]"" S BGPVALUD=BGPVALUD_$S($P(BGPVALUD,"|||",2)]"":"; SCREEN: ",1:"SCREEN: ") S BGPVALUD=BGPVALUD_$P(BGPDEPS,U,2)_" "_$P(BGPDEPS,U,5)
 .I BGPDEP]"" S BGPVALUD=BGPVALUD_$S($P(BGPVALUD,"|||",2)]"":"; DX: ",1:"DX: ") S BGPVALUD=BGPVALUD_$P(BGPDEP,U,3)_" "_$P(BGPDEP,U,4)_" "_$P(BGPDEP,U,2)
 .I BGPSUIC]"" S BGPVALUD=BGPVALUD_$S($P(BGPVALUD,"|||",2)]"":"; SUIC DX: ",1:"SUIC DX: ") S BGPVALUD=BGPVALUD_$P(BGPSUIC,U,3)_" "_$P(BGPSUIC,U,2)
 K BGPDEP,BGPDEPS,BGPREF,BGPDEDU
 Q
 ;
DEP(P,BDATE,EDATE) ;EP
 I $G(P)="" Q ""
 NEW BGPG,BGPDEP,BGPV,Y,X,E,D,V,BGPC,BGPP
 K BGPG,BGPDEP
 S BGPV=""
 S Y="BGPG("
 S X=P_"^LAST 2 DX [BGP MOOD DISORDERS;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 I $D(BGPG(2)) S BGPDEP((9999999-$P(BGPG(1),U)))="",BGPDEP((9999999-$P(BGPG(2),U)))="" Q 1_U_"POV "_$P(BGPG(2),U,2)_"&"_$P(BGPG(1),U,2)_U_$$DATE^BGP1UTL($P(BGPG(2),U))_U_$$DATE^BGP1UTL($P(BGPG(1),U))
 S BGPC=0 I $D(BGPG(1)) S BGPC=1,BGPV=$P(BGPG(1),U,5),BGPDEP((9999999-$P(BGPG(1),U)))=""
 ;
 S E=9999999-BDATE,D=9999999-EDATE-1_".99" F  S D=$O(^AMHREC("AE",P,D)) Q:D'=+D!($P(D,".")>E)!(BGPC>1)  S V=0 F  S V=$O(^AMHREC("AE",P,D,V)) Q:V'=+V!(BGPC>1)  D
 .S X=0 F  S X=$O(^AMHRPRO("AD",V,X)) Q:X'=+X!(BGPC>1)  S BGPP=$P($G(^AMHRPRO(X,0)),U) D
 ..Q:'BGPP
 ..I $P(^AMHREC(V,0),U,16)]"",BGPV]"",$P(^AMHREC(V,0),U,16)=BGPV Q  ;same visit found in pcc
 ..I $D(BGPDEP(D)) Q  ;already got a dx on this date
 ..S BGPP=$P($G(^AMHPROB(BGPP,0)),U)
 ..I BGPP=14 S BGPC=BGPC+1,BGPDEP(D)=BGPP Q
 ..I BGPP=15 S BGPC=BGPC+1,BGPDEP(D)=BGPP Q
 ..I $E(BGPP,1,3)=296 S BGPC=BGPC+1,BGPDEP(D)=BGPP Q
 ..I BGPP=291.89 S BGPC=BGPC+1,BGPDEP(D)=BGPP Q
 ..I BGPP=292.84 S BGPC=BGPC+1,BGPDEP(D)=BGPP Q
 ..I BGPP="293.83" S BGPC=BGPC+1,BGPDEP(D)=BGPP Q
 ..I BGPP="301.13" S BGPC=BGPC+1,BGPDEP(D)=BGPP Q
 ..I BGPP=300.4 S BGPC=BGPC+1,BGPDEP(D)=BGPP Q
 ..I BGPP="311." S BGPC=BGPC+1,BGPDEP(D)=BGPP Q
 ..Q
 S X=$O(BGPDEP(0)),Y=$O(BGPDEP(X))
 I BGPC>1 Q 1_"^BH POV "_BGPDEP(X)_"&"_BGPDEP(Y)_U_$$FMTE^XLFDT((9999999-X))_U_$$FMTE^XLFDT((9999999-Y))
 Q ""
DEPSUIC(P,BDATE,EDATE) ;EP
 I $G(P)="" Q ""
 NEW BGPV,Y,X,BGPP,BGPC,E,D,V
 S BGPV=""
 S Y="BGPG("
 S X=P_"^LAST DX V62.84;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 I $D(BGPG(1)) Q 1_U_"POV V62.84"_U_$$DATE^BGP1UTL($P(BGPG(1),U))
 ;
 S BGPC=""
 S E=9999999-BDATE,D=9999999-EDATE-1_".99" F  S D=$O(^AMHREC("AE",P,D)) Q:D'=+D!($P(D,".")>E)!(BGPC)  S V=0 F  S V=$O(^AMHREC("AE",P,D,V)) Q:V'=+V!(BGPC>1)  D
 .S X=0 F  S X=$O(^AMHRPRO("AD",V,X)) Q:X'=+X!(BGPC>1)  S BGPP=$P($G(^AMHRPRO(X,0)),U) D
 ..Q:'BGPP
 ..S BGPP=$P($G(^AMHPROB(BGPP,0)),U)
 ..I BGPP=39 S BGPC=1_U_"BH POV 39"_U_$$DATE^BGP1UTL((9999999-$P(D,".")))
 ..Q
 Q BGPC
DEPSCR(P,BDATE,EDATE) ;EP
 NEW BGPDEPS,BGPG,%,E,Y,X,BGPC,D,V,BGPP,T
 S BGPDEPS=""
 I $G(P)="" Q ""
 K BGPG S %=P_"^LAST EXAM 36;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)) S BGPDEPS=1_"^DEP SCRN^"_$$DATE^BGP1UTL($P(BGPG(1),U))_U_$P(BGPG(1),U)_U_"Ex 36"
 K BGPG
 S Y="BGPG("
 S X=P_"^LAST DX V79.0;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 I $D(BGPG(1)),$P(BGPDEPS,U,4)<$P(BGPG(1),U) S BGPDEPS=1_U_"POV V79.0 DEP"_U_$$DATE^BGP1UTL($P(BGPG(1),U))_U_$P(BGPG(1),U)_U_"POV V79.0"
 ;CPT CODE ADDED IN 11.1
 S Y=$$CPTI^BGP1DU(DFN,BDATE,EDATE,+$$CODEN^ICPTCOD("1220F"))
 I Y,$P(BGPDEPS,U,4)<$P(Y,U,2) S BGPDEPS=1_U_"CPT 1220F"_U_$$DATE^BGP1UTL($P(Y,U,2))_U_$P(Y,U,2)_U_"CPT 1220F"
 ;now add in v measurements
 S BGPC=$$LASTITEM^BGP1DU(P,BDATE,EDATE,"MEASUREMENT","PHQ2")
 I $P(BGPDEPS,U,4)<$P(BGPC,U,2) S BGPDEPS=1_U_"Meas "_$P(BGPC,U,3)_U_$$DATE^BGP1UTL($P(BGPC,U,2))_U_$P(BGPC,U,2)_"Meas "_$P(BGPC,U,3)
 S BGPC=$$LASTITEM^BGP1DU(P,BDATE,EDATE,"MEASUREMENT","PHQ9")
 I $P(BGPDEPS,U,4)<$P(BGPC,U,2) S BGPDEPS=1_U_"Meas "_$P(BGPC,U,3)_U_$$DATE^BGP1UTL($P(BGPC,U,2))_U_$P(BGPC,U,2)_"Meas "_$P(BGPC,U,3)
BHSCR ;
 S D=0,BGPC="",E=9999999-BDATE,D=9999999-EDATE-1_".99" F  S D=$O(^AMHREC("AE",P,D)) Q:D'=+D!($P(D,".")>E)!(BGPC)  S V=0 F  S V=$O(^AMHREC("AE",P,D,V)) Q:V'=+V!(BGPC)  D
 .S X=0 F  S X=$O(^AMHRPRO("AD",V,X)) Q:X'=+X!(BGPC)  S BGPP=$P($G(^AMHRPRO(X,0)),U) D
 ..Q:'BGPP
 ..S BGPP=$P($G(^AMHPROB(BGPP,0)),U)
 ..I BGPP=14.1 S BGPC=1_U_"BH 14.1"_U_$$DATE^BGP1UTL(9999999-D)_U_(9999999-D) Q
 .Q:BGPC
 .S X=0 F  S X=$O(^AMHRMSR("AD",V,X)) Q:X'=+X!(BGPC)  S BGPP=$P($G(^AMHRMSR(X,0)),U) D
 ..Q:'BGPP
 ..S BGPP=$P($G(^AUTTMSR(BGPP,0)),U)
 ..I BGPP="PHQ2"!(BGPP="PHQ9") S BGPC=1_U_"BH "_BGPP_U_$$DATE^BGP1UTL(9999999-D)_U_(9999999-D)
 .I $P($G(^AMHREC(V,14)),U,5)="P"!($P($G(^AMHREC(V,14)),U,5)="N") S BGPC=1_"BH Dep Exam"_U_$$DATE^BGP1UTL(9999999-D)_U_(9999999-D)
 I BGPC]"",$P(BGPDEPS,U,4)<$P(BGPC,U,4) S BGPDEPS=BGPC
 ;add in measurements
 ;ANMC
 S T=$O(^AUTTHF("B","PRIME MD SCORE",0))
 I T="" Q BGPDEPS
 S BGPC="" S D=0 F  S D=$O(^AUPNVHF("AA",P,T,D)) Q:D'=+D!(BGPC]"")  D
 .S Y=9999999-D
 .Q:Y<BDATE
 .Q:Y>EDATE
 .S BGPC=1_U_"PRIME MD SCORE HEALTH FACTOR"_U_$$DATE^BGP1UTL(9999999-D)_U_(9999999-D)
 .Q
 I $P(BGPDEPS,U,4)<$P(BGPC,U,4) S BGPDEPS=BGPC
 Q BGPDEPS
DEPREF(P,BDATE,EDATE) ;EP
 NEW G
 S G=$$REFUSAL^BGP1UTL1(P,9999999.15,$O(^AUTTEXAM("C",36,0)),$$FMADD^XLFDT(EDATE,-365),EDATE)
 I $P(G,U)=1 Q 1_"^Refused Ex 36^"_$$DATE^BGP1UTL($P(G,U,2))_U_$P(G,U,2)
 Q ""
DEPEDU(P,BDATE,EDATE) ;EP
 NEW BGPG,Y,X,E,D,T,BGPDEPE,V,BGPC,G,I,Z
 K BGPG
 S Y="BGPG(",BGPDEPE=""
 S X=P_"^ALL EDUC;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 I '$D(BGPG(1)) G DEPMH
 S (X,D,E)=0,%="",T="" F  S X=$O(BGPG(X)) Q:X'=+X  D
 .S T=$P(^AUPNVPED(+$P(BGPG(X),U,4),0),U)
 .Q:'T
 .Q:'$D(^AUTTEDT(T,0))
 .S T=$P(^AUTTEDT(T,0),U,2)
 .I $P(T,"-",1)="DEP"!($P(T,"-",1)="BH")!($P(T,"-",1)="SB")!($P(T,"-",1)="PDEP"),$P(BGPDEPE,U,4)<$P(BGPG(X),U,1) S BGPDEPE=1_U_""_T_U_$$DATE^BGP1UTL($P(BGPG(X),U))_U_$P(BGPG(X),U)
 .I $P(T,"-",1)["296.2"!($P(T,"-",1["296.3")),$P(BGPDEPE,U,4)<$P(BGPG(X),U,1) S BGPDEPE=1_U_""_T_U_$$DATE^BGP1UTL($P(BGPG(X),U))_U_$P(BGPG(X),U)
 .I $P(T,"-",1)["995.5"!($P(T,"-",1)="995.80")!($P(T,"-",1)="995.81")!($P(T,"-")="995.82")!($P(T,"-")="995.83")!($P(T,"-")="995.84")!($P(T,"-")="995.85"),$P(BGPDEPE,U,4)<$P(BGPG(X),U,1) D
 ..S BGPDEPE=1_U_T_U_$$DATE^BGP1UTL($P(BGPG(X),U))_U_$P(BGPG(X),U)
 .;I $P(T,"-",1)["V40."!($P(T,"-",1)="V60.0")!($P(T,"-",1)="V61.11")!($P(T,"-")="V61.21")!($P(T,"-")["V62.")!($P(T,"-")="V67.3")!($P(T,"-")["V69."),$P(BGPDEPE,U,4)<$P(BGPG(X),U,1) D
 .;.S BGPDEPE=1_U_"EDUC: "_T_U_$$DATE^BGP1UTL($P(BGPG(X),U))_U_$P(BGPG(X),U)
 .;I $P(T,"-",1)="V79.2"!($P(T,"-",1)="V79.3")!($P(T,"-",1)="V79.4")!($P(T,"-")="V79.5")!($P(T,"-")="V79.6")!($P(T,"-")="V79.7")!($P(T,"-")="V79.8")!($P(T,"-")="V79.9"),$P(BGPDEPE,U,4)<$P(BGPG(X),U,1) D
 .;.S BGPDEPE=1_U_"EDUC: "_T_U_$$DATE^BGP1UTL($P(BGPG(X),U))_U_$P(BGPG(X),U)
 .I $P(T,"-",1)="300.9"!($P(T,"-")="684.44"),$P(BGPDEPE,U,4)<$P(BGPG(X),U,1) D
 ..S BGPDEPE=1_U_T_U_$$DATE^BGP1UTL($P(BGPG(X),U))_U_$P(BGPG(X),U)
 .I +$E($P(T,"-",1),1,3)>289,+$E($P(T,"-",1),1,3)<320,$P(BGPDEPE,U,4)<$P(BGPG(X),U,1) D
 ..S BGPDEPE=1_U_T_U_$$DATE^BGP1UTL($P(BGPG(X),U))_U_$P(BGPG(X),U)
DEPMH ;
 S BGPC="",T="" S E=9999999-BDATE,D=9999999-EDATE-1_".99" F  S D=$O(^AMHREC("AE",P,D)) Q:D'=+D!($P(D,".")>E)!(BGPC)  S V=0 F  S V=$O(^AMHREC("AE",P,D,V)) Q:V'=+V!(BGPC)  D
 .S X=0 F  S X=$O(^AMHREDU("AD",V,X)) Q:X'=+X!(BGPC)  S T=$P($G(^AMHREDU(X,0)),U) D
 ..Q:'T
 ..Q:'$D(^AUTTEDT(T,0))
 ..S T=$P(^AUTTEDT(T,0),U,2)
 ..I $P(T,"-",1)="DEP"!($P(T,"-",1)="BH")!($P(T,"-",1)="SB")!($P(T,"-",1)="PDEP") S BGPC=1_U_T_U_$$DATE^BGP1UTL((9999999-D))_U_(9999999-D)
 ..I $P(T,"-",1)["296.2"!($P(T,"-",1["296.3")) S BGPC=1_U_T_U_$$DATE^BGP1UTL((9999999-D))_U_(9999999-D)
 ..I $P(T,"-",1)["995.5"!($P(T,"-",1)="995.80")!($P(T,"-",1)="995.81")!($P(T,"-")="995.82")!($P(T,"-")="995.83")!($P(T,"-")="995.84")!($P(T,"-")="995.85") D
 ...S BGPC=1_U_T_U_$$DATE^BGP1UTL((9999999-D))_U_(9999999-D)
 ..;I $P(T,"-",1)["V40."!($P(T,"-",1)="V60.0")!($P(T,"-",1)="V61.11")!($P(T,"-")="V61.21")!($P(T,"-")["V62.")!($P(T,"-")="V67.3")!($P(T,"-")["V69.") D
 ..;.S BGPC=1_U_"EDUC: "_T_U_$$DATE^BGP1UTL((9999999-D))_U_(9999999-D)
 ..;I $P(T,"-",1)="V79.2"!($P(T,"-",1)="V79.3")!($P(T,"-",1)="V79.4")!($P(T,"-")="V79.5")!($P(T,"-")="V79.6")!($P(T,"-")="V79.7")!($P(T,"-")="V79.8")!($P(T,"-")="V79.9") D
 ..;.S BGPC=1_U_"EDUC: "_T_U_$$DATE^BGP1UTL((9999999-D))_U_(9999999-D)
 ..I $P(T,"-",1)="300.9"!($P(T,"-",1)="684.44") D
 ...S BGPC=1_U_T_U_$$DATE^BGP1UTL((9999999-D))_U_(9999999-D)
 ..I +$E($P(T,"-",1),1,3)>289,+$E($P(T,"-",1),1,3)<320 D
 ...S BGPC=1_U_T_U_$$DATE^BGP1UTL((9999999-D))_U_(9999999-D)
 I $P(BGPDEPE,U,4)<$P(BGPC,U,4) S BGPDEPE=BGPC
 I BGPDEPE Q BGPDEPE
EDUREF ;
 S G="",X=0 F  S X=$O(^AUPNPREF("AA",P,9999999.09,X)) Q:X=""!(G]"")  D
 .S D=0 F  S D=$O(^AUPNPREF("AA",P,9999999.09,X,D)) Q:D=""!(G]"")  D
 ..S I=0 F  S I=$O(^AUPNPREF("AA",P,9999999.09,X,D,I)) Q:I'=+I!(G]"")  D
 ...S Z=$P($G(^AUPNPREF(I,0)),U,3)
 ...Q:Z=""
 ...I Z<BDATE Q
 ...I Z>EDATE Q
 ...S Y=$P($G(^AUTTEDT(X,0)),U,2)
 ...I $P(Y,"-")="DEP"!($P(Y,"-",1)="BH")!($P(Y,"-",1)="SB")!($P(Y,"-",1)="PDEP") S G=1_U_"Refused "_Y_U_$$DATE^BGP1UTL(Z)
 ...;I $P(Y,"-",1)["296.2"!($P(Y,"-",1["296.3")) S G=1_U_"ref "_Y_U_$$DATE^BGP1UTL(Z)
 ...;I $P(Y,"-",1)["995.5"!($P(Y,"-",1)="995.80")!($P(Y,"-",1)="995.81")!($P(Y,"-")="995.82")!($P(Y,"-")="995.83")!($P(Y,"-")="995.84")!($P(Y,"-")="995.85") S G=1_U_"ref "_Y_U_$$DATE^BGP1UTL(Z)
 ...;I $P(Y,"-",1)["300.9"!($P(Y,"-",1["684.44")) S G=1_U_"ref "_Y_U_$$DATE^BGP1UTL(Z)
 ...;I +$E($P(Y,"-",1),1,3)>289,+$E($P(Y,"-",1),1,3)<320 S G=1_U_"ref "_Y_U_$$DATE^BGP1UTL(Z)
 Q G
