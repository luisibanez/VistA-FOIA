BUD0RP7B ; IHS/CMI/LAB - UDS REPORT PROCESSOR 01 Dec 2010 5:11 PM ;
 ;;5.0;IHS/RPMS UNIFORM DATA SYSTEM;;JAN 18, 2011;Build 12
 ;
HTN ;EP - list of HTN
 ;is patient pregnant during the time period BUDBD and BUDED
 S BUDDOB=$P(^DPT(DFN,0),U,3)
 S BUDBDB=($E(BUDBD,1,3)-85)_"0101"
 S BUDBDE=($E(BUDBD,1,3)-18)_"1231"
 Q:BUDDOB>BUDBDE
 Q:BUDDOB<BUDBDB
 Q:BUDMEDV<2
 ;
 S BUDP=$$HTNDX(DFN,$$DOB^AUPNPAT(DFN),BUDCAD)
 I '$P(BUDP,U) Q  ;not dx'ed before june 30
 S BUDP=$$HTNDX(DFN,$$DOB^AUPNPAT(DFN),BUDED,1)
 S BUDRACEX=$$RACE^BUD0RPTC(DFN),BUDRACE=$P(BUDRACEX,U,2),BUDRACEP=$P(BUDRACEX,U,5)
 S BUDRACEE=$$RACE^BUD0RP7I(BUDRACE)
 S BUDR=""
 S BUDETHN=$P($$HISP^BUD0RPTC(DFN),U,1)
 I +BUDETHN=1 S BUDETHNN="Hispanic or Latino"
 I +BUDETHN=2 S BUDETHNN="Non-Hispanic/Latino"
 I +BUDETHN=3 S BUDETHNN="Unreported/Refused to Report"
 I BUDRACEP=8,+BUDETHN=3 S BUDR=17 G SETSECTB
 I +BUDETHN=1 S BUDR=BUDRACEP G SETSECTB
 I +BUDETHN=2!(+BUDETHN=3) S BUDR=BUDRACEP+8 G SETSECTB
SETSECTB ;
 S $P(BUDSECTB(6),U,BUDR)=$P($G(BUDSECTB(6)),U,BUDR)+1
 S $P(BUDSECTB(7),U,BUDR)=$P($G(BUDSECTB(7)),U,BUDR)+1
 S $P(BUDSECTB(6),U,18)=$P($G(BUDSECTB(6)),U,18)+1
 S $P(BUDSECTB(7),U,18)=$P($G(BUDSECTB(7)),U,18)+1
 ;S $P(BUDSECTE(6),U,BUDETHN)=$P($G(BUDSECTE(6)),U,BUDETHN)+1
 ;S $P(BUDSECTE(7),U,BUDETHN)=$P($G(BUDSECTE(7)),U,BUDETHN)+1
 ;S $P(BUDSECTE(6),U,3)=$P($G(BUDSECTE(6)),U,3)+1
 ;S $P(BUDSECTE(7),U,3)=$P($G(BUDSECTE(7)),U,3)+1
 I $G(BUDHTRL) S ^XTMP("BUD0RP7",BUDJ,BUDH,"HTR",BUDRACEP,+BUDETHN,BUDCOM,BUDAGE,$P(^DPT(DFN,0),U),DFN)=$P(BUDP,"^",2)
 ;I $G(BUDHTEL) S ^XTMP("BUD0RP7",BUDJ,BUDH,"HTE",BUDETHNN,BUDCOM,BUDAGE,$P(^DPT(DFN,0),U),DFN)=$P(BUDP,"^",2)
 ;now check BP
 S BUDBP=$$LASTITEM^BUD0DU(DFN,BUDBD,BUDED,"MEASUREMENT","BP")
 I BUDBP]"" S BUDV=$$BPCHK(BUDBP) G SET
 ;now check cpts
 S T=$O(^ATXAX("B","BUD SYSTOLIC BP CPTS",0))
 S BUDS=$$CPT^BUD0DU(DFN,BUDBD,BUDED,T,6)
 S T=$O(^ATXAX("B","BUD DIASTOLIC BP CPTS",0))
 S BUDD=$$CPT^BUD0DU(DFN,BUDBD,BUDED,T,6)
 I 'BUDS,'BUDD S BUDV=0_U_"NO BP TAKEN DURING THE REPORT PERIOD" G SET  ;DIDN'T HAVE BOTH IN TIME PERIOD
 S S=$P(BUDS,U,3)
 S D=$P(BUDD,U,3)
 S G=0
 I S="3074F",D="3078F" S G=1
 I S="3074F",D="3079F" S G=1
 I S="3075F",D="3078F" S G=1
 I S="3075F",D="3079F" S G=1
 S BUDV=G_U_"CPTs: "_$P(BUDS,U,3)_" on "_$$FMTE^XLFDT($P(BUDS,U,2))_" and "_$P(BUDD,U,3)_" on "_$$FMTE^XLFDT($P(BUDD,U,2))
SET ;
 I $P(BUDV,U) S $P(BUDSECTB(8),U,BUDR)=$P($G(BUDSECTB(8)),U,BUDR)+1,$P(BUDSECTB(8),U,18)=$P($G(BUDSECTB(8)),U,18)+1
 ;I $P(BUDV,U) S $P(BUDSECTE(8),U,BUDETHN)=$P($G(BUDSECTE(8)),U,BUDETHN)+1,$P(BUDSECTE(8),U,9)=$P($G(BUDSECTE(8)),U,9)+1
 I $G(BUDHTCRL),$P(BUDV,U,1) S ^XTMP("BUD0RP7",BUDJ,BUDH,"HTCR",BUDRACEP,+BUDETHN,BUDCOM,BUDAGE,$P(^DPT(DFN,0),U),DFN)=$P(BUDP,"^",2)_"^"_$P(BUDV,U,2)
 I $G(BUDHTURL),'$P(BUDV,U,1) S ^XTMP("BUD0RP7",BUDJ,BUDH,"HTUR",BUDRACEP,+BUDETHN,BUDCOM,BUDAGE,$P(^DPT(DFN,0),U),DFN)=$P(BUDP,"^",2)_"#"_$P(BUDV,U,2)
 ;I $G(BUDHTCEL),$P(BUDV,U,1) S ^XTMP("BUD0RP7",BUDJ,BUDH,"HTCE",BUDETHNN,$P(^DPT(DFN,0),U),BUDCOM,DFN)=$P(BUDP,"^",2)_"^"_$P(BUDV,U,2)
 ;I $G(BUDHTUEL),'$P(BUDV,U,1) S ^XTMP("BUD0RP7",BUDJ,BUDH,"HTUE",BUDETHNN,$P(^DPT(DFN,0),U),BUDCOM,DFN)=$P(BUDP,"^",2)_"^"_$P(BUDV,U,2)
 Q
 ;
BPCHK(BP) ;
 NEW S,D
 S S=$P($P(BP,U,4),"/")
 S D=$P($P(BP,U,4),"/",2)
 I S>139 Q 0_U_$P(BP,U,4)_"  "_$$FMTE^XLFDT($P(BP,U,2))
 I D>89 Q 0_U_$P(BP,U,4)_"  "_$$FMTE^XLFDT($P(BP,U,2))
 Q 1_U_$P(BP,U,4)_"  "_$$FMTE^XLFDT($P(BP,U,2))
RACE(R) ;EP
 I R="Unreported" Q 8
 I R="Asian" Q 1
 I R="Native Hawaiian" Q 2
 I R="Other Pacific Islander" Q 3
 I R="Black/African American" Q 4
 I R="American Indian/Alaska Native" Q 5
 I R="White" Q 6
 Q ""
HTNDX(P,BDATE,EDATE,STOP) ;EP
 NEW BUDDX,B,CNT,BUDD,BUDG,BUDALL
 S STOP=$G(STOP)
 S B=0,CNT=0,BUDD="",BUDALL=""  ;if there is one before time frame set this to 1
 K BUDG
 S Y="BUDG("
 S X=P_"^LAST DX [BUD HYPERTENSION DXS;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE) S E=$$START1^APCLDF(X,Y)
 I $D(BUDG(1)) Q 1_"^"_$P(BUDG(1),U,5)_"|"_$P(BUDG(1),U,2)
 I STOP Q ""
PROBDX S T=$O(^ATXAX("B","BUD HYPERTENSION DXS",0))
 S (X,G)=0,Z="" F  S X=$O(^AUPNPROB("AC",P,X)) Q:X'=+X!(G)  D
 .Q:$P(^AUPNPROB(X,0),U,12)'="A"
 .Q:$P(^AUPNPROB(X,0),U,8)>EDATE
 .Q:$P(^AUPNPROB(X,0),U,8)<BDATE
 .S Y=$P(^AUPNPROB(X,0),U)
 .Q:'$$ICD^ATXCHK(Y,T,9)
 .S G=$P(^AUPNPROB(X,0),U,8),Z=X
 .Q
 I G Q 1_U_"Problem List: "_$$VAL^XBDIQ1(9000011,Z,.01)_" on "_$$FMTE^XLFDT($P(^AUPNPROB(Z,0),U,8))
 Q ""
 ;
