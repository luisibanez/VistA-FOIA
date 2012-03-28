APCLD61C ; IHS/CMI/LAB - 2006 DIABETES AUDIT ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;
GATHER ;
 S B=9999999-BDATE,E=9999999-EDATE S D=E-1 F  S D=$O(^AUPNVLAB("AE",P,D)) Q:D'=+D!(D>B)!($D(APCL))  D
 .S L=0 F  S L=$O(^AUPNVLAB("AE",P,D,L)) Q:L'=+L  D
 ..S X=0 F  S X=$O(^AUPNVLAB("AE",P,D,L,X)) Q:X'=+X  D
 ...Q:'$D(^AUPNVLAB(X,0))
 ...I APCLLT,$P(^AUPNVLAB(X,0),U),$D(^ATXLAB(APCLLT,21,"B",$P(^AUPNVLAB(X,0),U))) D SETV Q
 ...Q:'APCLOT
 ...S J=$P($G(^AUPNVLAB(X,11)),U,13) Q:J=""
 ...Q:'$$LOINC(J,APCLOT)
 ...D SETV
 ...Q
 I '$D(APCL(1)) Q
 S D=$P(APCL(1),U),D=9999999-D
 K APCL S APCLC=0
 S L=0 F  S L=$O(^AUPNVLAB("AE",P,D,L)) Q:L'=+L  D
 .S X=0 F  S X=$O(^AUPNVLAB("AE",P,D,L,X)) Q:X'=+X  D
 ..Q:'$D(^AUPNVLAB(X,0))
 ..I APCLLT,$P(^AUPNVLAB(X,0),U),$D(^ATXLAB(APCLLT,21,"B",$P(^AUPNVLAB(X,0),U))) D SETV Q
 ..Q:'APCLOT
 ..S J=$P($G(^AUPNVLAB(X,11)),U,13) Q:J=""
 ..Q:'$$LOINC(J,APCLOT)
 ..D SETV
 ..Q
 Q
LOINC(A,B) ;EP - is loinc code A in taxonomy B
 NEW %
 S %=$P($G(^LAB(95.3,A,9999999)),U,2)
 I %]"",$D(^ATXAX(B,21,"B",%)) Q 1
 S %=$P($G(^LAB(95.3,A,0)),U)_"-"_$P($G(^LAB(95.3,A,0)),U,15)
 I $D(^ATXAX(B,21,"B",%)) Q 1
 Q ""
SETV ;
 S APCLC=APCLC+1
 S V=$P(^AUPNVLAB(X,0),U,3),APCLV=$P($P($G(^AUPNVSIT(V,0)),U),".") Q:'APCLV
 S APCL(APCLC)=APCLV_"^"_$S($P(^AUPNVLAB(X,0),U,4)]"":$P(^AUPNVLAB(X,0),U,4),1:"?")_"^"_$$VAL^XBDIQ1(9000010.09,X,.01)_"^"_X_";AUPNVLAB^"_V
 Q
SETN ;
 S N="" NEW A,G S (A,G)=0 F  S A=$O(APCL(A)) Q:A'=+A!(G)  S R=$P(^AUPNVLAB(+$P(APCL(A),U,4),0),U,4) I R]"",$$UP^XLFSTR(R)'="COMMENT" S G=A
 S N=$S(G:G,1:1)
 Q
SET3 ;
 NEW X,N1,N2,N3,A,T
 K A
 S X=0 F  S X=$O(APCL(X)) Q:X'=+X  S A($P(APCL(X),U),X)=""
 NEW D S D=0 F  S D=$O(A(D)) Q:D'=+D  D
 .S G=0,N=0 F  S N=$O(A(D,N)) Q:N'=+N  D
 ..I $P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)]"",$$UP^XLFSTR($P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4))'="COMMENT" S G=1 Q
 .I G S N=0 F  S N=$O(A(D,N)) Q:N'=+N  I $P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)="" K APCL(N)
 .Q
 Q
CREAT ;EP
 I $G(F)="" S F="E"
 NEW APCL,X,%,E,R,V,APCLLT,APCLOT,B,D,L,J,APCLC,APCLV,V
 K APCL
 S APCLC=0
 S APCLOT=$O(^ATXAX("B","BGP CREATININE LOINC CODES",0))
 S APCLLT=$O(^ATXLAB("B","DM AUDIT CREATININE TAX",0))
 D GATHER
 I '$D(APCL(1)) Q ""
 D SETN
 I F="I" Q $P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)_"^"_$P(APCL(N),U)
 Q $P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)_$S($P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)]"":" mg/dl ",1:"")_$$FMTE^XLFDT($P(APCL(N),U),5)
CHOL ;EP
 S:$G(F)="" F="E"
 NEW APCL,X,%,E,R,V,APCLLT,APCLOT,B,D,L,J,APCLC,APCLV,V
 K APCL
 S APCLC=0
 S APCLOT=$O(^ATXAX("B","BGP TOTAL CHOLESTEROL LOINC",0))
 S APCLLT=$O(^ATXLAB("B","DM AUDIT CHOLESTEROL TAX",0))
 D GATHER
 I '$D(APCL(1)) Q ""
 D SETN
 I F="I" Q $P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)_"^"_$P(APCL(N),U)
 Q $P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)_$S($P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)]"":" mg/dl ",1:"")_$$FMTE^XLFDT($P(APCL(N),U),5)
LPROF ;
 K APCL,APCLX S APCLX=""
 S %=P_"^LAST LAB [DM AUDIT LIPID PROFILE TAX;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"APCL(")
 I '$D(APCL(1)) Q
 I F="I" S APCLX=$P(^AUPNVLAB(+$P(APCL(1),U,4),0),U,4)_"^"_$P(APCL(1),U) Q
 S APCLX=$P(^AUPNVLAB(+$P(APCL(1),U,4),0),U,4)_$S($P(^AUPNVLAB(+$P(APCL(1),U,4),0),U,4)]"":" mg/dl",1:"")_$$FMTE^XLFDT($P(APCL(1),U),5)
 Q
HDL ;EP
 I $G(F)="" S F="E"
 NEW APCL,X,%,E,R,V,APCLLT,APCLOT,B,D,L,J,APCLC,APCLV,V
 K APCL
 S APCLC=0
 S APCLOT=$O(^ATXAX("B","BGP HDL LOINC CODES",0))
 S APCLLT=$O(^ATXLAB("B","DM AUDIT HDL TAX",0))
 D GATHER
 I '$D(APCL(1)) K APCL,APCLX S APCLX="" D LPROF Q APCLX
 D SETN
 I F="I" Q $P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)_"^"_$P(APCL(N),U)
 Q $P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)_$S($P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)]"":" mg/dl ",1:"")_$$FMTE^XLFDT($P(APCL(N),U),5)
LDL ;EP
 I $G(F)="" S F="E"
 NEW APCL,X,%,E,R,V,APCLLT,APCLOT,B,D,L,J,APCLC,APCLV,V
 K APCL
 S APCLC=0
 S APCLOT=$O(^ATXAX("B","BGP LDL LOINC CODES",0))
 S APCLLT=$O(^ATXLAB("B","DM AUDIT LDL CHOLESTEROL TAX",0))
 S B=9999999-BDATE,E=9999999-EDATE S D=E-1 F  S D=$O(^AUPNVLAB("AE",P,D)) Q:D'=+D!(D>B)  D
 .S L=0 F  S L=$O(^AUPNVLAB("AE",P,D,L)) Q:L'=+L  D
 ..S X=0 F  S X=$O(^AUPNVLAB("AE",P,D,L,X)) Q:X'=+X  D
 ...Q:'$D(^AUPNVLAB(X,0))
 ...I APCLLT,$P(^AUPNVLAB(X,0),U),$D(^ATXLAB(APCLLT,21,"B",$P(^AUPNVLAB(X,0),U))) D SETV Q
 ...Q:'APCLOT
 ...S J=$P($G(^AUPNVLAB(X,11)),U,13) Q:J=""
 ...Q:'$$LOINC(J,APCLOT)
 ...D SETV
 ...Q
 I '$D(APCL(1)) K APCL,APCLX S APCLX="" D LPROF Q APCLX
 K APCLLDL S X=0 F  S X=$O(APCL(X)) Q:X'=+X  S APCLLDL(9999999-$P(APCL(X),U),X)=APCL(X)
 S X=0,G=0 F  S X=$O(APCLLDL(X)) Q:X'=+X!G  S Y=0 F  S Y=$O(APCLLDL(X,Y)) Q:Y'=+Y!(G)  I +$P(^AUPNVLAB(+$P(APCLLDL(X,Y),U,4),0),U,4) S G=Y
 I 'G S X=$O(APCLLDL(0)),G=$O(APCLLDL(X,0))
 ;NEW N D SETN
 I F="I" Q $P(^AUPNVLAB(+$P(APCL(G),U,4),0),U,4)_"^"_$P(APCL(G),U)
 Q $P(^AUPNVLAB(+$P(APCL(G),U,4),0),U,4)_$S($P(^AUPNVLAB(+$P(APCL(G),U,4),0),U,4)]"":" mg/dl ",1:"")_$$FMTE^XLFDT($P(APCL(G),U),5)
TRIG ;EP
 I $G(F)="" S F="E"
 NEW APCL,X,%,E,R,V,APCLLT,APCLOT,B,D,L,J,APCLC,APCLV,V
 K APCL
 S APCLC=0
 S APCLOT=$O(^ATXAX("B","BGP TRIGLYCERIDE LOINC CODES",0))
 S APCLLT=$O(^ATXLAB("B","DM AUDIT TRIGLYCERIDE TAX",0))
 D GATHER
 I '$D(APCL(1)) K APCL,APCLX S APCLX="" D LPROF Q APCLX
 D SETN
 I F="I" Q $P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)_"^"_$P(APCL(N),U)
 Q $P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)_$S($P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)]"":" mg/dl ",1:"")_$$FMTE^XLFDT($P(APCL(N),U),5)
URIN ;EP
 NEW APCL,X,%,E,R,V,APCLLT,APCLOT,B,D,L,J,APCLC,APCLV,V
 K APCL
 S APCLC=0
 ;S %=P_"^LAST LAB [DM AUDIT URINALYSIS TAX;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"APCL(")
 ;gather up all labs in the date range for hemoglobin a1c
 S APCLOT=$O(^ATXAX("B","DM AUDIT URINALYSIS LOINC",0))
 S APCLLT=$O(^ATXLAB("B","DM AUDIT URINALYSIS TAX",0))
 S B=9999999-BDATE,E=9999999-EDATE S D=E-1 F  S D=$O(^AUPNVLAB("AE",P,D)) Q:D'=+D!(D>B)  D
 .S L=0 F  S L=$O(^AUPNVLAB("AE",P,D,L)) Q:L'=+L  D
 ..S X=0 F  S X=$O(^AUPNVLAB("AE",P,D,L,X)) Q:X'=+X  D
 ...Q:'$D(^AUPNVLAB(X,0))
 ...I APCLLT,$P(^AUPNVLAB(X,0),U),$D(^ATXLAB(APCLLT,21,"B",$P(^AUPNVLAB(X,0),U))) D SETV Q
 ...Q:'APCLOT
 ...S J=$P($G(^AUPNVLAB(X,11)),U,13) Q:J=""
 ...Q:'$$LOINC(J,APCLOT)
 ...D SETV
 ...Q
 I $D(APCL(1)) Q "Yes  "_$$FMTE^XLFDT($P(APCL(1),U),5)_" Urinalysis"
 K APCL S APCLC=0
 S APCLOT=$O(^ATXAX("B","DM AUDIT A/C RATIO LOINC",0))
 S APCLLT=$O(^ATXLAB("B","DM AUDIT A/C RATIO TAX",0))
 S B=9999999-BDATE,E=9999999-EDATE S D=E-1 F  S D=$O(^AUPNVLAB("AE",P,D)) Q:D'=+D!(D>B)  D
 .S L=0 F  S L=$O(^AUPNVLAB("AE",P,D,L)) Q:L'=+L  D
 ..S X=0 F  S X=$O(^AUPNVLAB("AE",P,D,L,X)) Q:X'=+X  D
 ...Q:'$D(^AUPNVLAB(X,0))
 ...I APCLLT,$P(^AUPNVLAB(X,0),U),$D(^ATXLAB(APCLLT,21,"B",$P(^AUPNVLAB(X,0),U))) D SETV Q
 ...Q:'APCLOT
 ...S J=$P($G(^AUPNVLAB(X,11)),U,13) Q:J=""
 ...Q:'$$LOINC(J,APCLOT)
 ...D SETV
 ...Q
 I $D(APCL(1)) Q "Yes  "_$$FMTE^XLFDT($P(APCL(1),U),5)_" A/C Ratio"
 K APCL
 S APCLC=0
 S APCLOT=$O(^ATXAX("B","DM AUDIT URINE PROTEIN LOINC",0))
 S APCLLT=$O(^ATXLAB("B","DM AUDIT URINE PROTEIN TAX",0))
 S B=9999999-BDATE,E=9999999-EDATE S D=E-1 F  S D=$O(^AUPNVLAB("AE",P,D)) Q:D'=+D!(D>B)  D
 .S L=0 F  S L=$O(^AUPNVLAB("AE",P,D,L)) Q:L'=+L  D
 ..S X=0 F  S X=$O(^AUPNVLAB("AE",P,D,L,X)) Q:X'=+X  D
 ...Q:'$D(^AUPNVLAB(X,0))
 ...I APCLLT,$P(^AUPNVLAB(X,0),U),$D(^ATXLAB(APCLLT,21,"B",$P(^AUPNVLAB(X,0),U))) D SETV Q
 ...Q:'APCLOT
 ...S J=$P($G(^AUPNVLAB(X,11)),U,13) Q:J=""
 ...Q:'$$LOINC(J,APCLOT)
 ...D SETV
 ...Q
 I $D(APCL(1)) Q "Yes  "_$$FMTE^XLFDT($P(APCL(1),U),5)_" Urine Prot"
 NEW G S G=0
 NEW T S T=$O(^ATXLAB("B","DM AUDIT URINALYSIS TAX",0))
 S X=0 F  S X=$O(^ATXLAB(T,21,X)) Q:X'=+X!(G)  I $$REFUSAL^APCLD617(P,60,$P(^ATXLAB(T,21,X,0),U),BDATE,EDATE) S G=1
 I G Q "Refused"
 S G=0
 NEW T S T=$O(^ATXLAB("B","DM AUDIT A/C RATIO TAX",0))
 S X=0 F  S X=$O(^ATXLAB(T,21,X)) Q:X'=+X!(G)  I $$REFUSAL^APCLD617(P,60,$P(^ATXLAB(T,21,X,0),U),BDATE,EDATE) S G=1
 I G Q "Refused"
 S G=0
 NEW T S T=$O(^ATXLAB("B","DM AUDIT URINE PROTEIN TAX",0))
 S X=0 F  S X=$O(^ATXLAB(T,21,X)) Q:X'=+X!(G)  I $$REFUSAL^APCLD617(P,60,$P(^ATXLAB(T,21,X,0),U),BDATE,EDATE) S G=1
 Q $S(G:"Refused",1:"No")
PROTEIN ;EP
 NEW APCL,X,%,E,R,V,APCLLT,APCLOT,B,D,L,J,APCLC,APCLV,V
 K APCL
 S APCLC=0
 S APCLOT=$O(^ATXAX("B","DM AUDIT URINE PROTEIN LOINC",0))
 S APCLLT=$O(^ATXLAB("B","DM AUDIT URINE PROTEIN TAX",0))
 S B=9999999-BDATE,E=9999999-EDATE S D=E-1 F  S D=$O(^AUPNVLAB("AE",P,D)) Q:D'=+D!(D>B)  D
 .S L=0 F  S L=$O(^AUPNVLAB("AE",P,D,L)) Q:L'=+L  D
 ..S X=0 F  S X=$O(^AUPNVLAB("AE",P,D,L,X)) Q:X'=+X  D
 ...Q:'$D(^AUPNVLAB(X,0))
 ...I APCLLT,$P(^AUPNVLAB(X,0),U),$D(^ATXLAB(APCLLT,21,"B",$P(^AUPNVLAB(X,0),U))) D SETV Q
 ...Q:'APCLOT
 ...S J=$P($G(^AUPNVLAB(X,11)),U,13) Q:J=""
 ...Q:'$$LOINC(J,APCLOT)
 ...D SETV
 ...Q
 I '$D(APCL(1)) S %1="" D ACRATIO Q %1
 D SETN
 NEW %,%1 S %=$P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)
 S %1=$S(%="":"No result",%["+":"Yes ",%[">":"Yes ",$E(%)="P":"Yes ",$E(%)="p":"Yes ",$$UP^XLFSTR($E(%))="S":"Yes ",$$UP^XLFSTR($E(%))="M":"Yes ",$$UP^XLFSTR($E(%))="L":"Yes ",$E(%)="c":"No result ",$E(%)="C":"No result ",+%>29:"Yes ",1:"No ")
 Q %1_%_" "_$$FMTE^XLFDT($P(APCL(N),U),"5")_" "_$P(APCL(N),U,3)
ACRATIO ;
 NEW APCL,X,%,E,R,V,APCLLT,APCLOT,B,D,L,J,APCLC,APCLV,V
 K APCL S APCLC=0
 S APCLOT=$O(^ATXAX("B","DM AUDIT A/C RATIO LOINC",0))
 S APCLLT=$O(^ATXLAB("B","DM AUDIT A/C RATIO TAX",0))
 S B=9999999-BDATE,E=9999999-EDATE S D=E-1 F  S D=$O(^AUPNVLAB("AE",P,D)) Q:D'=+D!(D>B)  D
 .S L=0 F  S L=$O(^AUPNVLAB("AE",P,D,L)) Q:L'=+L  D
 ..S X=0 F  S X=$O(^AUPNVLAB("AE",P,D,L,X)) Q:X'=+X  D
 ...Q:'$D(^AUPNVLAB(X,0))
 ...I APCLLT,$P(^AUPNVLAB(X,0),U),$D(^ATXLAB(APCLLT,21,"B",$P(^AUPNVLAB(X,0),U))) D SETV Q
 ...Q:'APCLOT
 ...S J=$P($G(^AUPNVLAB(X,11)),U,13) Q:J=""
 ...Q:'$$LOINC(J,APCLOT)
 ...D SETV
 ...Q
 I '$D(APCL) S %1="" Q
 D SETN
 NEW % S %=$P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)
 S %1=$S(%="":"No result",%[">":"Yes ",$E(%)="c":"No result ",$E(%)="C":"No result ",+%>299:"Yes ",1:"No ")
 S %1=%1_" "_%_" "_$$FMTE^XLFDT($P(APCL(N),U),"5")_" "_$P(APCL(N),U,3)
 Q
ACRATIOM ;
 NEW APCL,X,%,E,R,V,APCLLT,APCLOT,B,D,L,J,APCLC,APCLV,V
 K APCL S APCLC=0
 S APCLOT=$O(^ATXAX("B","DM AUDIT A/C RATIO LOINC",0))
 S APCLLT=$O(^ATXLAB("B","DM AUDIT A/C RATIO TAX",0))
 S B=9999999-BDATE,E=9999999-EDATE S D=E-1 F  S D=$O(^AUPNVLAB("AE",P,D)) Q:D'=+D!(D>B)  D
 .S L=0 F  S L=$O(^AUPNVLAB("AE",P,D,L)) Q:L'=+L  D
 ..S X=0 F  S X=$O(^AUPNVLAB("AE",P,D,L,X)) Q:X'=+X  D
 ...Q:'$D(^AUPNVLAB(X,0))
 ...I APCLLT,$P(^AUPNVLAB(X,0),U),$D(^ATXLAB(APCLLT,21,"B",$P(^AUPNVLAB(X,0),U))) D SETV Q
 ...Q:'APCLOT
 ...S J=$P($G(^AUPNVLAB(X,11)),U,13) Q:J=""
 ...Q:'$$LOINC(J,APCLOT)
 ...D SETV
 ...Q
 I '$D(APCL) S %1="" Q
 D SETN
 NEW % S %=$P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)
 S %1=$S(%="":"No result",%="30-300":"Pos ",$E(%)="c":"No result ",$E(%)="C":"No result ",+%>29&(+%<300):"Pos ",1:"No ")
 S %1=%1_" "_%_" "_$$FMTE^XLFDT($P(APCL(N),U),"5")_" "_$P(APCL(N),U,3)
 Q
MICRO ;EP
 NEW APCL,X,%,E,R,V,APCLLT,APCLOT,B,D,L,J,APCLC,APCLV,V
 K APCL S APCLC=0
 S APCLOT=$O(^ATXAX("B","DM AUDIT MICROALBUMIN LOINC",0))
 S APCLLT=$O(^ATXLAB("B","DM AUDIT MICROALBUMINURIA TAX",0))
 S B=9999999-BDATE,E=9999999-EDATE S D=E-1 F  S D=$O(^AUPNVLAB("AE",P,D)) Q:D'=+D!(D>B)  D
 .S L=0 F  S L=$O(^AUPNVLAB("AE",P,D,L)) Q:L'=+L  D
 ..S X=0 F  S X=$O(^AUPNVLAB("AE",P,D,L,X)) Q:X'=+X  D
 ...Q:'$D(^AUPNVLAB(X,0))
 ...I APCLLT,$P(^AUPNVLAB(X,0),U),$D(^ATXLAB(APCLLT,21,"B",$P(^AUPNVLAB(X,0),U))) D SETV Q
 ...Q:'APCLOT
 ...S J=$P($G(^AUPNVLAB(X,11)),U,13) Q:J=""
 ...Q:'$$LOINC(J,APCLOT)
 ...D SETV
 ...Q
 I '$D(APCL(1)) S %1="" D ACRATIOM Q %1
 D SETN
 NEW % S %=$P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)
 S %1=$S(%="":"No result",%["+":"Pos ",%[">":"Pos ",$E(%)="P":"Pos ",$E(%)="p":"Pos ",$E(%)="c":"No result ",$E(%)="C":"No result ",+%>29:"Pos ",1:"Neg ")
 Q %1_%_" "_$$FMTE^XLFDT($P(APCL(N),U),"5")_" "_$P(APCL(N),U,3)
HGBA1C ;EP
 NEW APCL,X,%,E,R,V,APCLLT,APCLOT,B,D,L,J,APCLC,APCLV,V
 K APCL
 S APCLC=0
 S APCLOT=$O(^ATXAX("B","BGP HGBA1C LOINC CODES",0))
 S APCLLT=$O(^ATXLAB("B","DM AUDIT HGB A1C TAX",0))
 S B=9999999-BDATE,E=9999999-EDATE S D=E-1 F  S D=$O(^AUPNVLAB("AE",P,D)) Q:D'=+D!(D>B)  D
 .S L=0 F  S L=$O(^AUPNVLAB("AE",P,D,L)) Q:L'=+L  D
 ..S X=0 F  S X=$O(^AUPNVLAB("AE",P,D,L,X)) Q:X'=+X  D
 ...Q:'$D(^AUPNVLAB(X,0))
 ...I APCLLT,$P(^AUPNVLAB(X,0),U),$D(^ATXLAB(APCLLT,21,"B",$P(^AUPNVLAB(X,0),U))) D SETV Q
 ...Q:'APCLOT
 ...S J=$P($G(^AUPNVLAB(X,11)),U,13) Q:J=""
 ...Q:'$$LOINC(J,APCLOT)
 ...D SETV
 ...Q
 D SET3
 K X S (%,C,R)="" F  S %=$O(APCL(%)) Q:%'=+%!(C>1)  S X(9999999-$P(APCL(%),U),1)=$P(^AUPNVLAB(+$P(APCL(%),U,4),0),U,4)
 S %=0,R="" F  S %=$O(X(%)) Q:%=""  S V=0 F  S V=$O(X(%,V)) Q:V=""  S R=R_X(%,V)_"^"_$$FMTE^XLFDT(9999999-%)_"^"_(9999999-%)_"^"
 Q R
BS ;EP
 NEW APCL,X,%,E,R,V,C
 K APCL
 S %=P_"^LAST 200 LAB [DM AUDIT GLUCOSE TESTS TAX;DURING "_BDATE_"-"_EDATE,E=$$START1^APCLDF(%,"APCL(")
 I '$D(APCL(1)) Q ""
 D SET3
 S (%,C,R)="" F  S %=$O(APCL(%)) Q:%=""!(C>2)  S R=R_$P(^AUPNVLAB(+$P(APCL(%),U,4),0),U,4)_$S($P(^AUPNVLAB(+$P(APCL(%),U,4),0),U,4)]"":" mg/dl ",1:"")_$$FMTE^XLFDT($P(APCL(%),U))_"^",C=C+1
 Q R
 ;
FGLUCOSE ;EP
 I $G(F)="" S F="E"
 NEW APCL,X,%,E,R,V,APCLLT,APCLOT,B,D,L,J,APCLC,APCLV,V
 K APCL
 S APCLC=0
 S APCLOT=$O(^ATXAX("B","DM AUDIT FASTING GLUC LOINC",0))
 S APCLLT=$O(^ATXLAB("B","DM AUDIT FASTING GLUCOSE TESTS",0))
 D GATHER
 I '$D(APCL(1)) Q ""
 D SETN
 I F="I" Q $P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)_"^"_$P(APCL(N),U)
 Q $P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)_$S($P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)]"":" mg/dl ",1:"")_$$FMTE^XLFDT($P(APCL(N),U),5)
G75 ;EP
 I $G(F)="" S F="E"
 NEW APCL,X,%,E,R,V,APCLLT,APCLOT,B,D,L,J,APCLC,APCLV,V
 K APCL
 S APCLC=0
 S APCLOT=$O(^ATXAX("B","DM AUDIT 75GM 2HR LOINC",0))
 S APCLLT=$O(^ATXLAB("B","DM AUDIT 75GM 2HR GLUCOSE",0))
 D GATHER
 I '$D(APCL(1)) Q ""
 D SETN
 I F="I" Q $P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)_"^"_$P(APCL(N),U)
 Q $P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)_$S($P(^AUPNVLAB(+$P(APCL(N),U,4),0),U,4)]"":" mg/dl ",1:"")_$$FMTE^XLFDT($P(APCL(N),U),5)
