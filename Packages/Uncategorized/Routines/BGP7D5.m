BGP7D5 ; IHS/CMI/LAB - measure calc ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
I20 ;EP
 S (BGPN1,BGPN2,BGPN3,BGPN4,BGPN5,BGPN6,BGPD1,BGPD2,BGPD3,BGPD4,BGPD5,BGPD6,BGPD7,BGPD8,BGPD9)=0
 I 'BGPACTUP S BGPSTOP=1 Q
 I BGPSEX'="F" S BGPSTOP=1 Q
 I BGPAGEB<15 S BGPSTOP=1 Q
 I BGPAGEB>44 S BGPSTOP=1 Q
 I BGPACTUP S BGPD2=1
 I BGPACTCL S BGPD1=1
 S BGPN2=$$ALHF(DFN,BGP365,BGPEDATE)
 S BGPN3=$$ALDX(DFN,BGP365,BGPEDATE)
 I 'BGPN3 S BGPN3=$$ALPRC(DFN,BGP365,BGPEDATE)
 S BGPN4=$$ALPED(DFN,BGP365,BGPEDATE)
 S BGPN5=0
 I BGPN2 S BGPN1=1
 I BGPN3 S BGPN1=1
 I BGPN4 S BGPN1=1
 I 'BGPN1 S BGPN5=$$ALREF(DFN,BGP365,BGPEDATE)
 I BGPN5 S BGPN1=1
 S BGPVALUE=$S(BGPD2:"UP",1:"")_";"_$S(BGPD1:"AC",1:"")_"|||"
 I $P(BGPN2,U)=1 S BGPVALUE=BGPVALUE_$P(BGPN2,U,2)_" "_$P(BGPN2,U,3)
 I $P(BGPN3,U)=1 S BGPVALUE=BGPVALUE_$P(BGPN3,U,2)_" "_$P(BGPN3,U,3)
 I $P(BGPN4,U)=1 S BGPVALUE=BGPVALUE_$P(BGPN4,U,2)_" "_$P(BGPN4,U,3)
 I $P(BGPN5,U)=1 S BGPVALUE=BGPVALUE_$P(BGPN5,U,2)_" "_$P(BGPN5,U,3)
 K X,Y,Z,%,A,B,C,D,E,H,BDATE,EDATE,P,V,S,F,T
 Q
I21 ;EP
 S (BGPN1,BGPN2,BGPN3,BGPN4,BGPN5,BGPN6,BGPD1,BGPD2,BGPD3,BGPD4,BGPD5,BGPD6,BGPD7,BGPD8,BGPD9)=0
 S (BGPDVEX,BGPDVDX,BGPDVPED,BGPDVREF)=""
 I 'BGPACTUP S BGPSTOP=1 Q
 I BGPSEX'="F" S BGPSTOP=1 Q
 I BGPAGEB<13 S BGPSTOP=1 Q
 I BGPACTUP S BGPD3=1
 I BGPACTCL S BGPD1=1
 I BGPAGEB>14,BGPAGEB<41,BGPACTCL S BGPD2=1 ;gpra denominator 15-40
 S BGPDVEX=$$DVEX(DFN,BGP365,BGPEDATE) I $P(BGPDVEX,U)=1 S BGPN2=1
 S BGPDVDX=$$DVDX(DFN,BGP365,BGPEDATE) I $P(BGPDVDX,U)=1 S BGPN3=1
 S BGPDVPED=$$DVPED(DFN,BGP365,BGPEDATE) I $P(BGPDVPED,U)=1 S BGPN4=1
 I BGPN2 S BGPN1=1
 I BGPN3 S BGPN1=1
 I BGPN4 S BGPN1=1
 I 'BGPN1 S BGPDVREF=$$REFDV(DFN,BGP365,BGPEDATE) I $P(BGPDVREF,U)=1 S BGPN5=1
 I BGPN5 S BGPN1=1
 S BGPVALUE=$S(BGPD3:"UP",1:"")_";"_$S(BGPD1:"AC",1:"")_"|||"
 I $P(BGPDVEX,U)=1 S BGPVALUE=BGPVALUE_$P(BGPDVEX,U,3)_" "_$$DATE^BGP7UTL($P(BGPDVEX,U,2))
 I $P(BGPDVDX,U)=1 S BGPVALUE=BGPVALUE_$P(BGPDVDX,U,3)_" "_$$DATE^BGP7UTL($P(BGPDVDX,U,2))
 I $P(BGPDVPED,U)=1 S BGPVALUE=BGPVALUE_$P(BGPDVPED,U,3)_" "_$$DATE^BGP7UTL($P(BGPDVPED,U,2))
 I $P(BGPDVREF,U)=1 S BGPVALUE=BGPVALUE_$P(BGPDVREF,U,3)_" "_$$DATE^BGP7UTL($P(BGPDVREF,U,2))
 K X,Y,Z,%,A,B,C,D,E,H,BDATE,EDATE,P,V,S,F,T
 Q
IK ;EP
 S (BGPN1,BGPN2,BGPN3,BGPN4,BGPN5,BGPN6,BGPD1,BGPD2,BGPD3,BGPD4,BGPD5,BGPD6,BGPD7,BGPD8,BGPD9)=0
 I 'BGPACTUP S BGPSTOP=1 Q
 I BGPSEX'="F" S BGPSTOP=1 Q
 I BGPAGEB<16 S BGPSTOP=1 Q
 I BGPAGEB>25 S BGPSTOP=1 Q
 I BGPACTUP S BGPD2=1
 I BGPACTCL S BGPD1=1
 I BGPACTCL,BGPAGEB>15,BGPAGEB<21 S BGPD3=1
 I BGPACTCL,BGPAGEB>20,BGPAGEB<26 S BGPD4=1
 I BGPACTUP,BGPAGEB>15,BGPAGEB<21 S BGPD5=1
 I BGPACTUP,BGPAGEB>20,BGPAGEB<26 S BGPD6=1
 S BGPNV=$$CHL(DFN,BGP365,BGPEDATE)
 S BGPN1=+BGPNV
 S BGPVALUE=$S(BGPD2:"UP",1:"")_";"_$S(BGPD1:"AC",1:"")_"|||"_$P(BGPNV,U,2)_" "_$P(BGPNV,U,3)
 K X,Y,Z,%,A,B,C,D,E,H,BDATE,EDATE,P,V,S,F,T
 Q
DVEX(P,BDATE,EDATE) ;EP
 K BGPG S %=P_"^LAST EXAM 34;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)) Q 1_"^"_$P(BGPG(1),U)_"^exam 34"
 S BGPC=0,BGPV=""
 S E=9999999-BDATE,D=9999999-EDATE-1_".99" F  S D=$O(^AMHREC("AE",P,D)) Q:D'=+D!($P(D,".")>E)!(BGPC)  S V=0 F  S V=$O(^AMHREC("AE",P,D,V)) Q:V'=+V!(BGPC)  D
 .S X=$P($G(^AMHREC(V,14)),U)
 .I X="" Q  ;no test
 .I $E(X)="U" Q  ;don't count refusal here
 .I X="REF" Q
 .S BGPC=BGPC+1,BGPV="1^"_(9999999-D)_"^BH EXAM"
 I BGPC Q BGPV
 Q ""
REFDV(P,BDATE,EDATE) ;EP
 ;add refusal for exam 34
 S G=$$REFUSAL^BGP7UTL1(P,9999999.15,$O(^AUTTEXAM("C",34,0)),$$FMADD^XLFDT(EDATE,-365),EDATE)
 I $P(G,U)=1 Q 1_"^"_$P(G,U,2)_"^ref exam 34"
 S G=""
 S X=0 F  S X=$O(^AUPNPREF("AA",P,9999999.09,X)) Q:X'=+X!(G)  D
 .S H=""
 .I $P($P($G(^AUTTEDT(X,0)),U),"-")="DV"!($P($P($G(^AUTTEDT(X,0)),U),"-",2)="DV") S H=1
 .Q:H'=1
 .S D=0 F  S D=$O(^AUPNPREF("AA",P,9999999.09,X,D)) Q:D'=+D  D
 ..S Z=9999999-D
 ..Q:Z<BDATE
 ..Q:Z>EDATE
 ..S G=1_"^"_Z_"^ref PtEd "_$P(^AUTTEDT(X,0),U)
 I $P(G,U,1)=1 Q G
 S BGPC=0 K BGPV
 S E=9999999-BDATE,D=9999999-EDATE-1_".99" F  S D=$O(^AMHREC("AE",P,D)) Q:D'=+D!($P(D,".")>E)!(BGPC)  S V=0 F  S V=$O(^AMHREC("AE",P,D,V)) Q:V'=+V!(BGPC)  D
 .S X=$P($G(^AMHREC(V,14)),U)
 .I X="" Q  ;no test
 .I X="U" S BGPC=1,BGPV=1_"^"_(9999999-D)_"^BH UTS" Q
 .I X="REF" S BGPC=1,BGPV=1_"^"_(9999999-D)_"^BH REF" Q
 .Q
 I BGPC Q BGPV
 Q ""
DVDX(P,BDATE,EDATE) ;EP
 I $G(P)="" Q ""
 K BGPG
 S Y="BGPG("
 S X=P_"^LAST DX [BGP DV DXS;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 I $D(BGPG(1)) Q 1_"^"_$P(BGPG(1),U)_"^Dv Dx "_$P(BGPG(1),U,2)
 S BGPC=0 K BGPV ;I $D(BGPG(1)) S BGPC=1
 S E=9999999-BDATE,D=9999999-EDATE-1_".99" F  S D=$O(^AMHREC("AE",P,D)) Q:D'=+D!($P(D,".")>E)!(BGPC)  S V=0 F  S V=$O(^AMHREC("AE",P,D,V)) Q:V'=+V!(BGPC)  D
 .S X=0 F  S X=$O(^AMHRPRO("AD",V,X)) Q:X'=+X!(BGPC)  S BGPP=$P($G(^AMHRPRO(X,0)),U) D
 ..Q:'BGPP
 ..S BGPP=$P($G(^AMHPROB(BGPP,0)),U)
 ..I $E(BGPP,1,2)=43 S BGPC=1,BGPV=1_"^"_(9999999-D)_"^BH "_BGPP Q
 ..I $E(BGPP,1,2)=44 S BGPC=1,BGPV=1_"^"_(9999999-D)_"^BH "_BGPP Q
 ..I BGPP=995.80 S BGPC=1,BGPV=1_"^"_(9999999-D)_"^BH "_BGPP Q
 ..I BGPP=995.81 S BGPC=1,BGPV=1_"^"_(9999999-D)_"^BH "_BGPP Q
 ..Q
 I BGPC Q BGPV
 ;now check pcc problem list
 S T=$O(^ATXAX("B","BGP DV DXS",0))
 S (X,G)=0 F  S X=$O(^AUPNPROB("AC",P,X)) Q:X'=+X!(G)  D
 .Q:$P(^AUPNPROB(X,0),U,12)'="A"
 .Q:$P(^AUPNPROB(X,0),U,3)>EDATE
 .Q:$P(^AUPNPROB(X,0),U,3)<BDATE
 .S Y=$P(^AUPNPROB(X,0),U)
 .Q:'$$ICD^ATXCHK(Y,T,9)
 .S G=1
 .Q
 I G Q "PL"
 S (X,G)=0 F  S X=$O(^AMHPPROB("AC",P,X)) Q:X'=+X!(G)  D
 .Q:$P(^AMHPPROB(X,0),U,12)'="A"
 .Q:$P(^AMHPPROB(X,0),U,3)>EDATE
 .Q:$P(^AMHPPROB(X,0),U,3)<BDATE
 .S Y=$P(^AMHPPROB(X,0),U)
 .S Y=$P($G(^AMHPROB(Y,0)),U)
 .I $E(Y,1,2)="43" S G=1 Q
 .I $E(Y,1,2)="44" S G=1 Q
 .I Y=995.80 S G=1 Q
 .I Y=995.81 S G=1 Q
 .I Y=995.82 S G=1 Q
 .I Y=995.83 S G=1 Q
 .I Y=995.85 S G=1 Q
 .Q
 .Q
 I G Q "PL"
 Q ""
DVPED(P,BDATE,EDATE) ;EP
 K BGPG
 S Y="BGPG("
 S X=P_"^ALL EDUC;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 I '$D(BGPG(1)) G BHPED
 K BGPV S (X,D,E)=0,%="",T="" F  S X=$O(BGPG(X)) Q:X'=+X!(D)  D
 .S T=$P(^AUPNVPED(+$P(BGPG(X),U,4),0),U)
 .Q:'T
 .Q:'$D(^AUTTEDT(T,0))
 .S T=$P(^AUTTEDT(T,0),U,2)
 .I $P(T,"-",1)="DV"!($P(T,"-",2)="DV") S D=1,BGPV=1_"^"_$P(BGPG(X),U)_"^PED "_T Q
 I D Q BGPV
BHPED ;
 K BGPV S BGPC="",T="" S E=9999999-BDATE,D=9999999-EDATE-1_".99" F  S D=$O(^AMHREC("AE",P,D)) Q:D'=+D!($P(D,".")>E)!(BGPC)  S V=0 F  S V=$O(^AMHREC("AE",P,D,V)) Q:V'=+V!(BGPC)  D
 .S X=0 F  S X=$O(^AMHREDU("AD",V,X)) Q:X'=+X!(BGPC)  S T=$P($G(^AMHREDU(X,0)),U) D
 ..Q:'T
 ..Q:'$D(^AUTTEDT(T,0))
 ..S T=$P(^AUTTEDT(T,0),U,2)
 ..I $P(T,"-",1)="DV"!($P(T,"-",2)="DV") S BGPC=1,BGPV=1_"^"_(9999999-$P(D,"."))_"^BH PED "_T
 I BGPC Q BGPV
DVSCR K BGPG S X=P_"^LAST DX V61.11;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 I $D(BGPG(1)) Q 1_"^"_$P(BGPG(1),U)_"^V61.11"
 Q ""
ALHF(P,BDATE,EDATE) ;alcohol hf or screening pov
 K BGPG S %=P_"^LAST EXAM 35;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)) Q 1_"^exam 35^"_$$DATE^BGP7UTL($P(BGPG(1),U))
 S V=$$LASTHF(P,"ALCOHOL/DRUG",BDATE,EDATE)
 I V]"" Q 1_U_"HF: "_V
 S V=$$LASTHF(P,"ALCOHOL",BDATE,EDATE)
 I V]"" Q 1_U_"HF: "_V
 S V=$$LASTHF(P,"SBIRT",BDATE,EDATE)
 I V]"" Q 1_U_"HF: "_V
 ;CHECK BH HF FILE
 S BGPC="",T="",F="" S E=9999999-BDATE,D=9999999-EDATE-1_".99" F  S D=$O(^AMHREC("AE",P,D)) Q:D'=+D!($P(D,".")>E)!(BGPC)  S V=0 F  S V=$O(^AMHREC("AE",P,D,V)) Q:V'=+V!(BGPC)  D
 .S X=0 F  S X=$O(^AMHRHF("AD",V,X)) Q:X'=+X!(BGPC)  S F=$P($G(^AMHRHF(X,0)),U) D
 ..Q:'F
 ..Q:'$D(^AUTTHF(F,0))
 ..S T=$P(^AUTTHF(F,0),U,3)
 ..Q:'T
 ..I $P($G(^AUTTHF(T,0)),U)["ALCOHOL" S BGPC=1_U_"BH HF: "_$P(^AUTTHF(F,0),U)_U_$$DATE^BGP7UTL((9999999-D))
 ..Q
 I BGPC Q BGPC
 K BGPG S %=P_"^LAST DX V11.3;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)) Q 1_U_"DX: V11.3"_U_$$DATE^BGP7UTL($P(BGPG(1),U))
 S %=P_"^LAST DX V79.1;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)) Q 1_U_"DX: V79.1"_U_$$DATE^BGP7UTL($P(BGPG(1),U))
 ;go through BH record file and find up to 1 visits in date range
 S E=9999999-BDATE,D=9999999-EDATE-1_".99" F  S D=$O(^AMHREC("AE",P,D)) Q:D'=+D!($P(D,".")>E)!(BGPC)  S V=0 F  S V=$O(^AMHREC("AE",P,D,V)) Q:V'=+V!(BGPC)  D
 .S X=0 F  S X=$O(^AMHRPRO("AD",V,X)) Q:X'=+X!(BGPC)  S BGPP=$P($G(^AMHRPRO(X,0)),U) D
 ..Q:'BGPP
 ..S BGPP=$P($G(^AMHPROB(BGPP,0)),U)
 ..I BGPP=29.1 S BGPC=1_U_"BH dx: 29.1"_U_$$DATE^BGP7UTL((9999999-$P(D,"."))) Q
 ..Q
 I BGPC Q BGPC
 Q ""
ALDX(P,BDATE,EDATE) ;
 I $G(P)="" Q ""
 K BGPG
 S Y="BGPG("
 S X=P_"^LAST DX [BGP ALCOHOL DXS;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 I $D(BGPG(1)) Q 1_U_"DX: "_$P(BGPG(1),U,2)_U_$$DATE^BGP7UTL($P(BGPG(1),U))
 S BGPC=0
 ;go through BH record file and find up to 1 visits in date range
 S E=9999999-BDATE,D=9999999-EDATE-1_".99" F  S D=$O(^AMHREC("AE",P,D)) Q:D'=+D!($P(D,".")>E)!(BGPC)  S V=0 F  S V=$O(^AMHREC("AE",P,D,V)) Q:V'=+V!(BGPC)  D
 .S X=0 F  S X=$O(^AMHRPRO("AD",V,X)) Q:X'=+X!(BGPC)  S BGPP=$P($G(^AMHRPRO(X,0)),U) D
 ..Q:'BGPP
 ..S BGPP=$P($G(^AMHPROB(BGPP,0)),U)
 ..I BGPP=10 S BGPC=1_U_"BH dx: 10"_U_$$DATE^BGP7UTL((9999999-D)) Q
 ..I BGPP=27 S BGPC=1_U_"BH dx: 27"_U_$$DATE^BGP7UTL((9999999-D)) Q
 ..I BGPP=29 S BGPC=1_U_"BH dx: 29"_U_$$DATE^BGP7UTL((9999999-D)) Q
 ..I $E(BGPP,1,3)=303  S BGPC=1_U_"BH dx: "_BGPP_U_$$DATE^BGP7UTL((9999999-D)) Q
 ..I $E(BGPP,1,5)=305.0 S BGPC=1_U_"BH dx: "_BGPP_U_$$DATE^BGP7UTL((9999999-D)) Q
 ..I $E(BGPP,1,3)=291 S BGPC=1_U_"BH dx: "_BGPP_U_$$DATE^BGP7UTL((9999999-D)) Q
 ..I $E(BGPP,1,5)=357.5 S BGPC=1_U_"BH dx: "_BGPP_U_$$DATE^BGP7UTL((9999999-D)) Q
 ..Q
 I BGPC Q BGPC
 ;now check pcc and bh problem lists
 S T=$O(^ATXAX("B","BGP ALCOHOL DXS",0))
 S (X,G)=0 F  S X=$O(^AUPNPROB("AC",P,X)) Q:X'=+X!(G)  D
 .Q:$P(^AUPNPROB(X,0),U,12)'="A"
 .Q:$P(^AUPNPROB(X,0),U,3)>EDATE
 .Q:$P(^AUPNPROB(X,0),U,3)<BDATE
 .S Y=$P(^AUPNPROB(X,0),U)
 .Q:'$$ICD^ATXCHK(Y,T,9)
 .S G=1_U_"PROB LIST: "_$P($$ICDDX^ICDCODE(Y),U,2)_U_$$DATE^BGP7UTL((9999999-D))
 .Q
 I G Q G
 S (X,G)=0 F  S X=$O(^AMHPPROB("AC",P,X)) Q:X'=+X!(G)  D
 .Q:$P(^AMHPPROB(X,0),U,12)'="A"
 .Q:$P(^AMHPPROB(X,0),U,3)>EDATE
 .Q:$P(^AMHPPROB(X,0),U,3)<BDATE
 .S Y=$P(^AMHPPROB(X,0),U)
 .S Y=$P($G(^AMHPROB(Y,0)),U)
 .I $E(Y,1,3)="303" S G=1_U_"BH PL: "_Y_U_$$DATE^BGP7UTL($P(^AMHPPROB(X,0),U,3)) Q
 .I $E(Y,1,5)="305.0" S G=1_U_"BH PL: "_Y_U_$$DATE^BGP7UTL($P(^AMHPPROB(X,0),U,3)) Q
 .I $E(Y,1,3)=291 S G=1_U_"BH PL: "_Y_U_$$DATE^BGP7UTL($P(^AMHPPROB(X,0),U,3)) Q
 .I $E(Y,1,5)=357.5 S G=1_U_"BH PL: "_Y_U_$$DATE^BGP7UTL($P(^AMHPPROB(X,0),U,3)) Q
 .I Y=10 S G=1_U_"BH PL: "_Y_U_$$DATE^BGP7UTL($P(^AMHPPROB(X,0),U,3)) Q
 .I Y=27 S G=1_U_"BH PL: "_Y_U_$$DATE^BGP7UTL($P(^AMHPPROB(X,0),U,3)) Q
 .I Y=29 S G=1_U_"BH PL: "_Y_U_$$DATE^BGP7UTL($P(^AMHPPROB(X,0),U,3)) Q
 .Q
 Q G
ALPRC(P,BDATE,EDATE) ;
 S BGPG=$$LASTPRC^BGP7UTL1(P,"BGP ALCOHOL PROCEDURES",BDATE,EDATE)
 I BGPG Q 1_U_"PROC: "_$P(BGPG,U,2)_U_$$DATE^BGP7UTL($P(BGPG,U,3))
 Q ""
ALPED(P,BDATE,EDATE) ;
 K BGPG
 S Y="BGPG("
 S X=P_"^ALL EDUC;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 I '$D(BGPG(1)) G ALMH
 S (X,D,E)=0,%="",T="" F  S X=$O(BGPG(X)) Q:X'=+X!(D)  D
 .S T=$P(^AUPNVPED(+$P(BGPG(X),U,4),0),U)
 .Q:'T
 .Q:'$D(^AUTTEDT(T,0))
 .S T=$P(^AUTTEDT(T,0),U,2)
 .I $P(T,"-",1)="CD"!($P(T,"-",2)="CD")!($P(T,"-",1)="AOD")!($P(T,"-",2)="AOD") S D=1_U_"EDUC: "_T_U_$$DATE^BGP7UTL($P(BGPG(1),U))
 I D Q D
ALMH ;
 S BGPC="",T="" S E=9999999-BDATE,D=9999999-EDATE-1_".99" F  S D=$O(^AMHREC("AE",P,D)) Q:D'=+D!($P(D,".")>E)!(BGPC)  S V=0 F  S V=$O(^AMHREC("AE",P,D,V)) Q:V'=+V!(BGPC)  D
 .S X=0 F  S X=$O(^AMHREDU("AD",V,X)) Q:X'=+X!(BGPC)  S T=$P($G(^AMHREDU(X,0)),U) D
 ..Q:'T
 ..Q:'$D(^AUTTEDT(T,0))
 ..S T=$P(^AUTTEDT(T,0),U,2)
 ..I $P(T,"-",1)="CD"!($P(T,"-",2)="CD")!($P(T,"-",1)="AOD")!($P(T,"-",2)="AOD") S BGPC=1_U_"EDUC: "_T_U_$$DATE^BGP7UTL((9999999-D))
 Q BGPC
 ;
LASTHF(P,C,BDATE,EDATE) ;EP - get last factor in category C for patient P
 S C=$O(^AUTTHF("B",C,0)) ;ien of category passed
 I '$G(C) Q ""
 S (H,D)=0 K O
 F  S H=$O(^AUTTHF("AC",C,H))  Q:'+H  D
 .Q:'$D(^AUPNVHF("AA",P,H))
 .S D="" F  S D=$O(^AUPNVHF("AA",P,H,D)) Q:D'=+D  D
 ..Q:(9999999-D)>EDATE  ;after time frame
 ..Q:(9999999-D)<BDATE  ;before time frame
 ..S O(D)=$O(^AUPNVHF("AA",P,H,D,""))
 .Q
 S D=$O(O(0))
 I D="" Q D
 Q $$VAL^XBDIQ1(9000010.23,O(D),.01)_"^"_$$DATE^BGP7UTL(9999999-D)
 ;
CHL(P,BDATE,EDATE) ;EP
 I '$G(P) Q ""
 S BGPC=""
 K BGPG S %=P_"^LAST DX V73.88;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)) Q 1_U_$$DATE^BGP7UTL($P(BGPG(1),U))_U_"V73.88"
 S %=P_"^LAST DX V73.98;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)) Q 1_U_"V73.88"_U_$$DATE^BGP7UTL($P(BGPG(1),U))
 ;check cpt taxonomy
 S T=$O(^ATXAX("B","BGP CHLAMYDIA CPTS",0))
 I T D  I X Q 1_U_$P(X,U,3)_U_$$DATE^BGP7UTL($P(X,U,2))
 .S X=$$CPT^BGP7DU(P,BDATE,EDATE,T,6) I X]"" Q
 .S X=$$TRAN^BGP7DU(P,BDATE,EDATE,T,6)
 ;now get all loinc/taxonomy tests
 S BGPC=""
 S T=$O(^ATXAX("B","BGP CHLAMYDIA LOINC CODES",0))
 S BGPLT=$O(^ATXLAB("B","BGP CHLAMYDIA TESTS TAX",0))
 S B=9999999-BDATE,E=9999999-EDATE S D=E-1 F  S D=$O(^AUPNVLAB("AE",P,D)) Q:D'=+D!(D>B)!(BGPC)  D
 .S L=0 F  S L=$O(^AUPNVLAB("AE",P,D,L)) Q:L'=+L!(BGPC)  D
 ..S X=0 F  S X=$O(^AUPNVLAB("AE",P,D,L,X)) Q:X'=+X!(BGPC)  D
 ...Q:'$D(^AUPNVLAB(X,0))
 ...I BGPLT,$P(^AUPNVLAB(X,0),U),$D(^ATXLAB(BGPLT,21,"B",$P(^AUPNVLAB(X,0),U))) S BGPC=1_U_"lab test"_U_$$DATE^BGP7UTL((9999999-D)) Q
 ...Q:'T
 ...S J=$P($G(^AUPNVLAB(X,11)),U,13) Q:J=""
 ...Q:'$$LOINC(J,T)
 ...S R=$P(^AUPNVLAB(X,0),U,4)
 ...S BGPC=1_U_"lab loinc"_U_$$DATE^BGP7UTL((9999999-D))
 ...Q
 I BGPC Q BGPC
 S B=9999999-BDATE,E=9999999-EDATE S D=E-1 F  S D=$O(^AUPNVMIC("AE",P,D)) Q:D'=+D!(D>B)!(BGPC)  D
 .S L=0 F  S L=$O(^AUPNVMIC("AE",P,D,L)) Q:L'=+L!(BGPC)  D
 ..S X=0 F  S X=$O(^AUPNVMIC("AE",P,D,L,X)) Q:X'=+X!(BGPC)  D
 ...Q:'$D(^AUPNVMIC(X,0))
 ...I BGPLT,$P(^AUPNVMIC(X,0),U),$D(^ATXLAB(BGPLT,21,"B",$P(^AUPNVMIC(X,0),U))) S BGPC=1_U_"v micro test"_U_$$DATE^BGP7UTL((9999999-D)) Q
 ...Q:'T
 ...S J=$P($G(^AUPNVMIC(X,11)),U,13) Q:J=""
 ...Q:'$$LOINC(J,T)
 ...S R=$P(^AUPNVMIC(X,0),U,4)
 ...S BGPC=1_U_"v micro loinc"_U_$$DATE^BGP7UTL((9999999-D))
 ...Q
 Q BGPC
ALREF(P,BDATE,EDATE) ;EP
 ;add refusal for exam 35
 S G=$$REFUSAL^BGP7UTL1(P,9999999.15,$O(^AUTTEXAM("C",35,0)),$$FMADD^XLFDT(EDATE,-365),EDATE)
 I $P(G,U)=1 Q 1_"^ref exam 35^"_$$DATE^BGP7UTL($P(G,U,2))
 Q ""
LOINC(A,B) ;
 NEW %
 S %=$P($G(^LAB(95.3,A,9999999)),U,2)
 I %]"",$D(^ATXAX(B,21,"B",%)) Q 1
 S %=$P($G(^LAB(95.3,A,0)),U)_"-"_$P($G(^LAB(95.3,A,0)),U,15)
 I $D(^ATXAX(B,21,"B",%)) Q 1
 Q ""
