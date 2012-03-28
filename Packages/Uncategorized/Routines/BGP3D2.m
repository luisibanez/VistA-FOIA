BGP3D2 ; IHS/CMI/LAB - indicator 2 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
I1 ;EP - indicator 1 general processing
 K BGPG
 S Y="BGPG("
 S X=DFN_"^LAST DX [SURVEILLANCE DIABETES;DURING "_$$DOB^AUPNPAT(DFN,"E")_"-"_$$FMTE^XLFDT(BGPEDATE) S E=$$START1^APCLDF(X,Y)
 I '$D(BGPG(1)) S BGPVALUE="" Q
 S BGPVALUE=$$DATE^BGP3UTL($P(BGPG(1),U))_" "_$P(BGPG(1),U,2)
 Q
 ;
I2 ;EP
 K BGPN1,BGPN2,BGPN3,BGPN4,BGPVALUE,BGPLHGB
 I 'BGPDM1 S BGPSTOP=1  ;don't process this indicator, pt not diabetic
 S BGPN1=$P($$LASTHGB(DFN,BGP365,BGPEDATE),U)
 S BGPLHGB=$$HGBA1C(DFN,BGP365,BGPEDATE)
 S BGPN2=$S($P(BGPLHGB,U,2)=2:1,1:0)
 S BGPN3=$S($P(BGPLHGB,U,2)=3:1,1:0)
 S BGPN4=$S($P(BGPLHGB,U,2)=4:1,1:0)
 S BGPVALUE=$S(BGPDMD1:1,1:"")_$S(BGPDMD2:",2",1:"")_$S(BGPDMD3:",3",1:"")_$S(BGPDMD4:",4",1:"")_"; "_$$DATE^BGP3UTL($P(BGPLHGB,U,3))_" "_$P(BGPLHGB,U,4)_" "_$P(BGPLHGB,U,1)
 K X,Y,Z,%,A,B,C,D,E,H,BDATE,EDATE,P,V,S,F
 Q
I3 ;EP
 K BGPN1,BGPN2,BGPN3,BGPVALUE,BGPLBP
 I 'BGPDM1 S BGPSTOP=1  ;don't process this indicator, pt not diabetic
 S BGPVALUE=$$MEANBP(DFN,BGP365,BGPEDATE)
 S BGPN1=$S($P(BGPVALUE,U,2)=1:1,1:0)
 S BGPN2=$S($P(BGPVALUE,U,2)=2:1,1:0)
 S BGPN3=$S($P(BGPVALUE,U,2)=4:1,1:0)
 I $P(BGPVALUE,U,2)=4 S BGPVALUE="u"
 S BGPVALUE=$S(BGPDMD1:1,1:"")_$S(BGPDMD2:",2",1:"")_$S(BGPDMD3:",3",1:"")_$S(BGPDMD4:",4",1:"")_"; "_$P(BGPVALUE,U)
 K X,Y,Z,%,A,B,C,D,E,H,BDATE,EDATE,P,V,S,F
 Q
 ;
I4 ;EP
 K BGPN1,BGPN2,BGPN3,BGPVALUE,BGPLD,BGPLDL,BGPTRI,BGPHDL
 I 'BGPDM1 S BGPSTOP=1  ;don't process this indicator, pt not diabetic
 S BGPN1=$$LIPID(DFN,BGP365,BGPEDATE)
 S BGPLDL=$$LDL(DFN,BGP365,BGPEDATE)
 I $P(BGPN1,U)'=1 D
 .S BGPTRI=$$TRIG(DFN,BGP365,BGPEDATE)
 .S BGPHDL=$$HDL(DFN,BGP365,BGPEDATE)
 .I BGPTRI,BGPHDL,BGPLDL S BGPN1=1
 S BGPN2=$P(BGPLDL,U)
 S BGPN3=0
 I $P(BGPLDL,U,2)]"",$P(BGPLDL,U,2)'>100 S BGPN3=1
 S BGPVALUE=$S(BGPDMD1:1,1:"")_$S(BGPDMD2:",2",1:"")_$S(BGPDMD3:",3",1:"")_$S(BGPDMD4:",4",1:"")_"; "_$S(BGPN1:"LP; ",1:" ")_$$DATE^BGP3UTL($P(BGPLDL,U,3))_" "_$P(BGPLDL,U,2)_" "_$P(BGPLDL,U,4)
 K X,Y,Z,%,A,B,C,D,E,H,BDATE,EDATE,P,V,S,F,BGPLDL,BGPHDL,BGPTRI,BGPLP
 Q
 ;
I5 ;EP
 K BGPN1,BGPN2,BPGN3,BPGN4,BGPVALUE,BGPUP
 I 'BGPDM1 S BGPSTOP=1  ;don't process this indicator, pt not diabetic
 S BGPUP=$$POSUR(DFN,BGP365,BGPEDATE)
 S BGPN1=0 I $P(BGPUP,U)=1 S BGPN1=1
 S BGPVALUE=$S(BGPDMD1:1,1:"")_$S(BGPDMD2:",2",1:"")_$S(BGPDMD3:",3",1:"")_$S(BGPDMD4:",4",1:"")_"; "_$$DATE^BGP3UTL($P(BGPUP,U,4))_" "_$P(BGPUP,U,3)_" "_$P(BGPUP,U,2)
 Q
 ;
I6 ;EP
 K BGPN1,BGPN2,BGPN3,BGPN4,BGPVALUE,BGPEYE
 I 'BGPDM1 S BGPSTOP=1  ;don't process this indicator, pt not diabetic
 S BGPEYE=$$EYE(DFN,BGP365,BGPEDATE)
 S BGPN1=0 I $P(BGPEYE,U)=1 S BGPN1=1
 S BGPVALUE=$S(BGPDMD1:1,1:"")_$S(BGPDMD2:",2",1:"")_$S(BGPDMD3:",3",1:"")_$S(BGPDMD4:",4",1:"")_";"_$$DATE^BGP3UTL($P(BGPEYE,U,2))_" "_$P(BGPEYE,U,3)
 Q
LASTHGB(P,BDATE,EDATE) ;
 K BGPG
 S %=P_"^LAST LAB [DM AUDIT HGB A1C;DURING "_$$FMTE^XLFDT(BDATE)_"-"_EDATE,E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)) Q 1
 S %="",E=+$$CODEN^ICPTCOD(83036),%=$$CPTI^BGPDU(P,BDATE,EDATE,E)
 Q %
 ;
HGBA1C(P,BDATE,EDATE) ;EP
 K BGPG
 S %=P_"^LAST LAB [DM AUDIT HGB A1C;DURING "_$$FMTE^XLFDT(BDATE)_"-"_EDATE,E=$$START1^APCLDF(%,"BGPG(")
 I '$D(BGPG(1)) S R="" D BS Q R
 S X=$P(^AUPNVLAB(+$P(BGPG(1),U,4),0),U,4) ;get result
 I $$UP^XLFSTR(X)="COMMENT" D BS Q R
 I X[">" Q X_"^"_3_"^"_$P(BGPG(1),U)_"^"_"H"
 I X["<" Q X_"^"_2_"^"_$P(BGPG(1),U)_"^"_"H"
 I $E(X)'=+$E(X) D BS Q R
 I +X<7!(+X=7) Q X_"^"_2_"^"_$P(BGPG(1),U)_"^"_"H"
 I +X>9.5 Q X_"^"_3_"^"_$P(BGPG(1),U)_"^"_"H"
 Q X_"^^"_$P(BGPG(1),U)_"^H"
BS ;EP
 K BGPBS
 S A=P_"^LAST 3 LAB [DM AUDIT GLUCOSE TESTS TAX;DURING "_$$FMTE^XLFDT(BDATE)_"-"_EDATE,B=$$START1^APCLDF(A,"BGPBS(")
 I '$D(BGPBS(1)) K BGPBS S R="u^4^^" Q
 S (A,C,T)=0 F  S A=$O(BGPBS(A)) Q:A'=+A  S B=$P(^AUPNVLAB(+$P(BGPBS(A),U,4),0),U,4) I B=+B S C=C+1,T=T+B,Z=$P(BGPBS(A),U)
 I C<3 K BGPBS S R="u^4^^" Q  ;not 3 with numeric value
 S B=T/3,A=$S(B'>150:2,B'<225:3,1:"")
 S R=$J(B,5,1)_"^"_A_"^"_Z_"^"_"G"
 Q
 ;
MEANBP(P,BDATE,EDATE) ;
 S X=$$BPS(P,BDATE,EDATE,"I")
 S S=$$SYSMEAN(X) I S="" Q "^4"
 S DS=$$DIAMEAN(X) I DS="" Q "^4"
 I S<131&(DS<81) Q S_"/"_DS_" CON"_U_1
 Q S_"/"_DS_" UNC"_U_2
 ;
SYSMEAN(X) ;EP
 I X="" Q ""
 S C=0 F Y=1:1:3 I $P(X,";",Y)]"" S C=C+1
 I C<2 Q ""
 S T=0 F Y=1:1:3 S T=$P($P(X,";",Y),"/")+T
 Q T\C
 ;
DIAMEAN(X) ;EP
 I X="" Q ""
 S C=0 F Y=1:1:3 I $P(X,";",Y)]"" S C=C+1
 I C<2 Q ""
 S T=0 F Y=1:1:3 S T=$P($P(X,";",Y),"/",2)+T
 Q T\C
 ;
BPS(P,BDATE,EDATE,F) ;EP ;
 I $G(F)="" S F="E"
 S BGPGLL=0,BGPGV=""
 K BGPG
 S X=P_"^LAST 50 MEAS BP;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,"BGPG(")
 S BGPGL=0 F  S BGPGL=$O(BGPG(BGPGL)) Q:BGPGL'=+BGPGL!(BGPGLL=3)  S BGPGBP=$P($G(BGPG(BGPGL)),U,2) D
 .Q:$$CLINIC^APCLV($P(BGPG(BGPGL),U,5),"C")=30
 .S BGPGLL=BGPGLL+1
 .I F="E" S $P(BGPGV,";",BGPGLL)=BGPGBP_"  "_$$FMTE^XLFDT($P(BGPG(BGPGL),U))
 .I F="I" S $P(BGPGV,";",BGPGLL)=$P(BGPGBP," ")
 Q BGPGV
LIPID(P,BDATE,EDATE) ;
 K BGPG
 S %=P_"^LAST LAB [DM AUDIT LIPID PROFILE TAX;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)) Q 1
 S %="",E=+$$CODEN^ICPTCOD(80061),%=$$CPTI^BGPDU(P,BDATE,EDATE,E)
 Q %
 ;
TRIG(P,BDATE,EDATE) ;
 K BGPG
 S %=P_"^LAST LAB [DM AUDIT TRIGLYCERIDE TAX;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)) Q 1
 S E=+$$CODEN^ICPTCOD(84478),%=$$CPTI^BGPDU(P,BDATE,EDATE,E)
 Q %
HDL(P,BDATE,EDATE) ;
 K BGPG
 S %=P_"^LAST LAB [DM AUDIT HDL TAX;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)) Q 1
 S %="",E=+$$CODEN^ICPTCOD(83718),%=$$CPTI^BGPDU(P,BDATE,EDATE,E)
 Q %
 ;
LDL(P,BDATE,EDATE) ;
 K BGPZ
 K BGPG
 S %=P_"^ALL LAB [DM AUDIT LDL CHOLESTEROL TAX;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,"BGPG(")
 I '$D(BGPG(1)) G LDLCPT
 ;reorder by date
 NEW X S X=0 F  S X=$O(BGPG(X)) Q:X'=+X  S BGPZ(9999999-$P(BGPG(X),U),X)=BGPG(X)
 S %="" D
 .S (D,X,G)=0 F  S D=$O(BGPZ(D)) Q:D'=+D!(G)  S X=0 F  S X=$O(BGPZ(D,X)) Q:X'=+X!(G)  D
 ..S E=$P(^AUPNVLAB(+$P(BGPZ(D,X),U,4),0),U,4)
 ..I +E S %="1^"_E_"^"_$P(BGPZ(D,X),U) S G=1 Q
 I %]"" Q %
 S D=$O(BGPZ("")),X=$O(BGPZ(D,0)) Q 1_"^^"_$P(BGPZ(D,X),U)
LDLCPT ;
 S E=+$$CODEN^ICPTCOD(83718),%=$$CPTI^BGPDU(P,BDATE,EDATE,E)
 Q $P(%,U)_"^^"_$P(%,U,2)
POSUR(P,BDATE,EDATE) ;
 K BGPG
 S %=P_"^LAST LAB [DM AUDIT MICROALBUMINURIA TAX;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)) Q 1_"^^M^"_$P(BGPG(1),U)
 S %="",E=+$$CODEN^ICPTCOD(82043),%=$$CPTI^BGPDU(P,BDATE,EDATE,E)
 I %]"" Q "1^^M^"_$P(%,U,2)
 S %="",E=+$$CODEN^ICPTCOD(82044),%=$$CPTI^BGPDU(P,BDATE,EDATE,E)
 I %]"" Q "1^^M^"_$P(%,U,2)
 S %=P_"^LAST LAB [DM AUDIT URINE PROTEIN TAX;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,"BGPG(")
 S (%,R)="" I $D(BGPG(1)) D  Q R_"^"_%_"^U"_"^"_$P(BGPG(1),U)
 .S %=$P(^AUPNVLAB(+$P(BGPG(1),U,4),0),U,4)
 .S R=$S(%="":"",%["+":1,%[">":1,$E(%)="P":1,$E(%)="p":1,$E(%)="c":"",$E(%)="C":"",+%>29:1,1:"")
 .Q
 Q ""
EYE(P,BDATE,EDATE) ;
 K BGPG S %=P_"^LAST EXAM DIABETIC EYE EXAM;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,"BGPG(")
 I $D(BGPG(1)) Q "1^"_$P(BGPG(1),U)_"^Diab Eye Ex"
 S BD=BDATE
 S ED=EDATE
 S T=+$$CODEN^ICPTCOD(92250),T1=+$$CODEN^ICPTCOD(92012),T2=+$$CODEN^ICPTCOD(92014),T3=+$$CODEN^ICPTCOD(92015),T4=+$$CODEN^ICPTCOD(92004),T5=+$$CODEN^ICPTCOD(92002)
 I T,$D(^AUPNVCPT("AA",P,T)) S %="" D  I %]"" Q %
 .S E=0 F  S E=$O(^AUPNVCPT("AA",P,T,E)) Q:E'=+E!(%]"")  D
 ..S D=9999999-E ;date done
 ..I D>ED Q
 ..I D<BD Q
 ..S %="1^"_D_"^CPT 92250"
 ..Q
 .Q
 I T1,$D(^AUPNVCPT("AA",P,T1)) S %="" D  I %]"" Q %
 .S E=0 F  S E=$O(^AUPNVCPT("AA",P,T1,E)) Q:E'=+E!(%]"")  D
 ..S D=9999999-E ;date done
 ..I D>ED Q
 ..I D<BD Q
 ..S %="1^"_D_"^CPT 92012"
 ..Q
 .Q
 I T2,$D(^AUPNVCPT("AA",P,T2)) S %="" D  I %]"" Q %
 .S E=0 F  S E=$O(^AUPNVCPT("AA",P,T2,E)) Q:E'=+E!(%]"")  D
 ..S D=9999999-E ;date done
 ..I D>ED Q
 ..I D<BD Q
 ..S %="1^"_D_"^CPT 92014"
 ..Q
 .Q
 I T3,$D(^AUPNVCPT("AA",P,T3)) S %="" D  I %]"" Q %
 .S E=0 F  S E=$O(^AUPNVCPT("AA",P,T3,E)) Q:E'=+E!(%]"")  D
 ..S D=9999999-E ;date done
 ..I D>ED Q
 ..I D<BD Q
 ..S %="1^"_D_"^CPT 92015"
 ..Q
 .Q
 I T4,$D(^AUPNVCPT("AA",P,T4)) S %="" D  I %]"" Q %
 .S E=0 F  S E=$O(^AUPNVCPT("AA",P,T4,E)) Q:E'=+E!(%]"")  D
 ..S D=9999999-E ;date done
 ..I D>ED Q
 ..I D<BD Q
 ..S %="1^"_D_"^CPT 92004"
 ..Q
 .Q
 I T5,$D(^AUPNVCPT("AA",P,T5)) S %="" D  I %]"" Q %
 .S E=0 F  S E=$O(^AUPNVCPT("AA",P,T5,E)) Q:E'=+E!(%]"")  D
 ..S D=9999999-E ;date done
 ..I D>ED Q
 ..I D<BD Q
 ..S %="1^"_D_"^CPT 92002"
 ..Q
 .Q
 S %=P_"^ALL VISITS;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(%,"BGPG(")
 S (X,Y)=0,D="" F  S X=$O(BGPG(X)) Q:X'=+X!(Y)  S R=$$PRIMPROV^APCLV($P(BGPG(X),U,5),"D") I (R=24!(R=79)!(R="08")),'$$DNKA($P(BGPG(X),U,5)) S Y=1,D=$P(BGPG(X),U)
 I Y Q "1^"_D_"^Prov: "_R
 S X=0,Y=0 F  S X=$O(BGPG(X)) Q:X'=+X!(Y)  S R=$$CLINIC^APCLV($P(BGPG(X),U,5),"C") I (R=17!(R=18)!(R=64)!(R="A2")),'$$DNKA($P(BGPG(X),U,5)) S Y=1,D=$P(BGPG(X),U)
 I Y Q "1^"_D_"^Cl: "_R
 ;now check for refusal of diabetic eye exam
 S G=$$REFUSAL^BGP3UTL1(P,9999999.15,$O(^AUTTEXAM("B","DIABETIC EYE EXAM",0)),BDATE,EDATE)
 I $P(G,U)=1 Q "1^"_$P(G,U,2)_"^Refused"
 Q ""
DNKA(V) ;EP - is this a DNKA visit?
 NEW D,N
 S D=$$PRIMPOV^APCLV(V,"C")
 I D=".0860" Q 1
 S N=$$PRIMPOV^APCLV(V,"N")
 I $E(D)="V",N["DNKA" Q 1
 I $E(D)="V",N["DID NOT KEEP APPOINTMENT" Q 1
 I $E(D)="V",N["DID NOT KEEP APPT" Q 1
 Q 0
