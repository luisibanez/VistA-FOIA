BGP7PDLA ; IHS/CMI/LAB - print ind ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
 ;
I1AGE ;EP
 I BGPINDT="E",BGPRTYPE=4 Q
 I BGPINDT="W",BGPRTYPE=4 G FEM
 S BGPHD1="ACTIVE CLINICAL TOBACCO USERS",BGPHD2="# Active Clinical Tobacco Users"
 S X=" " D S(X,1,1) D H3 S X=" " D S(X,1,1)
 K BGPDAC,BGPDAP,BGPDAB S (C,D)=0 F BGPX=8,9,10 D I1AGE1,I1AGE2
 D I1AGEP
 S BGPHD1="MALE ACTIVE CLINICAL TOBACCO USERS",BGPHD2="# Male AC Tobacco Users"
 D H3
 K BGPDAC,BGPDAP,BGPDAB S (D,C)=0 F BGPX=14,15,16 D I1AGE1,I1AGE2
 D I1AGEP
FEM ;
 S BGPHD1="FEMALE ACTIVE CLINICAL TOBACCO USERS",BGPHD2="# Female AC Tobacco Users"
 D H3
 K BGPDAC,BGPDAP,BGPDAB S (C,D)=0 F BGPX=20,21,22 D I1AGE1,I1AGE2
 D I1AGEP
 Q
I1AGE1 ;
 S C=C+1
 S BGPF="H.BA."_BGPX S BGPPC=$O(^BGPINDAC("C",BGPF,0))
 S BGPDF=$P(^BGPINDAC(BGPPC,0),U,8)
 S BGPNP=$P(^DD(90530.03,BGPDF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 S $P(BGPDAC(C),U)=$$V^BGP7DP1C(1,BGPRPT,N,P)
 S $P(BGPDAP(C),U)=$$V^BGP7DP1C(2,BGPRPT,N,P)
 S $P(BGPDAB(C),U)=$$V^BGP7DP1C(3,BGPRPT,N,P)
 ;set 2nd piece to numerator and 3rd to %
 S BGPNF=$P(^BGPINDAC(BGPPC,0),U,9)
 S BGPNP=$P(^DD(90530.03,BGPNF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 S $P(BGPDAC(C),U,2)=$$V^BGP7DP1C(1,BGPRPT,N,P),$P(BGPDAC(C),U,3)=$S($P(BGPDAC(C),U,1):($P(BGPDAC(C),U,2)/$P(BGPDAC(C),U)*100),1:"")
 S $P(BGPDAP(C),U,2)=$$V^BGP7DP1C(2,BGPRPT,N,P),$P(BGPDAP(C),U,3)=$S($P(BGPDAP(C),U,1):($P(BGPDAP(C),U,2)/$P(BGPDAP(C),U)*100),1:"")
 S $P(BGPDAB(C),U,2)=$$V^BGP7DP1C(3,BGPRPT,N,P),$P(BGPDAB(C),U,3)=$S($P(BGPDAB(C),U,1):($P(BGPDAB(C),U,2)/$P(BGPDAB(C),U)*100),1:"")
 Q
I1AGE2 ;
 S D=D+1
 S BGPF="H.BA."_(BGPX+3) S BGPPC=$O(^BGPINDAC("C",BGPF,0))
 ;set 4th piece to numerator and 5th to %
 S BGPNF=$P(^BGPINDAC(BGPPC,0),U,9)
 S BGPNP=$P(^DD(90530.03,BGPNF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 S $P(BGPDAC(D),U,4)=$$V^BGP7DP1C(1,BGPRPT,N,P),$P(BGPDAC(D),U,5)=$S($P(BGPDAC(D),U,1):($P(BGPDAC(D),U,4)/$P(BGPDAC(D),U)*100),1:"")
 S $P(BGPDAP(D),U,4)=$$V^BGP7DP1C(2,BGPRPT,N,P),$P(BGPDAP(D),U,5)=$S($P(BGPDAP(D),U,1):($P(BGPDAP(D),U,4)/$P(BGPDAP(D),U)*100),1:"")
 S $P(BGPDAB(D),U,4)=$$V^BGP7DP1C(3,BGPRPT,N,P),$P(BGPDAB(D),U,5)=$S($P(BGPDAB(D),U,1):($P(BGPDAB(D),U,4)/$P(BGPDAB(D),U)*100),1:"")
 Q
I1AGEP ;
 S X=" " D S(X,1,1)
 S X="CURRENT REPORT PERIOD" D S(X,1,1) S X=" " D S(X,1,1)
 S X=BGPHD2 D S(X,1,1)
 F X=1:1:3 S V=$P(BGPDAC(X),U) S Y=V D S(Y,,X+1)
 S X="# w/tobacco cessation counseling or refusal" D S(X,1,1)
 F X=1:1:3 S V=$P(BGPDAC(X),U,2) S Y=V D S(Y,,X+1)
 S X="% w/tobacco cessation counseling or refusal" D S(X,1,1)
 F X=1:1:3 S V=$P(BGPDAC(X),U,3) S Y=$$SB($J(V,6,1)) D S(Y,,X+1)
 S X=" " D S(X,1,1) S X="# who quit" D S(X,1,1)
 F X=1:1:3 S V=$P(BGPDAC(X),U,4) S Y=V D S(Y,,X+1)
 S X="% who quit" D S(X,1,1)
 F X=1:1:3 S V=$P(BGPDAC(X),U,5) S Y=$$SB($J(V,6,1)) D S(Y,,X+1)
PR ; 
 S X=" " D S(X,1,1) S X="PREVIOUS YEAR PERIOD" D S(X,1,1)
 S X=" " D S(X,1,1) S X=BGPHD2 D S(X,1,1)
 F X=1:1:3 S V=$P(BGPDAP(X),U) S Y=V D S(Y,,X+1)
 S X="# w/tobacco cessation counseling or refusal" D S(X,1,1)
 F X=1:1:3 S V=$P(BGPDAP(X),U,2) S Y=V D S(Y,,X+1)
 S X="% w/tobacco cessation counseling or refusal" D S(X,1,1)
 F X=1:1:3 S V=$P(BGPDAP(X),U,3) S Y=$$SB($J(V,6,1)) D S(Y,,X+1)
 S X=" " D S(X,1,1) S X="# who quit" D S(X,1,1)
 F X=1:1:3 S V=$P(BGPDAP(X),U,4) S Y=V D S(Y,,X+1)
 S X="% who quit" D S(X,1,1)
 F X=1:1:3 S V=$P(BGPDAP(X),U,5) S Y=$$SB($J(V,6,1)) D S(Y,,X+1)
 ;percentage changes
 S X=" " D S(X,1,1) S X="CHANGE FROM PREV YR %" D S(X,1,1)
 S X="w/tobacco cessation counseling or refusal" D S(X,1,1)
 F X=1:1:3 S N=$P(BGPDAC(X),U,3),O=$P(BGPDAP(X),U,3) S Y=$$SB($J((N-O),6,1)) D S(Y,,X+1)
 S X="who quit" D S(X,1,1)
 F X=1:1:3 S N=$P(BGPDAC(X),U,5),O=$P(BGPDAP(X),U,5) S Y=$$SB($J((N-O),6,1)) D S(Y,,X+1)
BL ;
 S X=" " D S(X,1,1) S X="BASELINE REPORT PERIOD" D S(X,1,1)
 S X=" " D S(X,1,1) S X=BGPHD2 D S(X,1,1)
 F X=1:1:3 S V=$P(BGPDAB(X),U) S Y=V D S(Y,,X+1)
 S X="# w/tobacco cessation counseling or refusal" D S(X,1,1)
 F X=1:1:3 S V=$P(BGPDAB(X),U,2) S Y=V D S(Y,,X+1)
 S X="% w/tobacco cessation counseling or refusal" D S(X,1,1)
 F X=1:1:3 S V=$P(BGPDAB(X),U,3) S Y=$$SB($J(V,6,1)) D S(Y,,X+1)
 S X=" " D S(X,1,1) S X="# who quit" D S(X,1,1)
 F X=1:1:3 S V=$P(BGPDAB(X),U,4) S Y=V D S(Y,,X+1)
 S X="% who quit" D S(X,1,1)
 F X=1:1:3 S V=$P(BGPDAB(X),U,5) S Y=$$SB($J(V,6,1)) D S(Y,,X+1)
 ;percentage changes
 S X=" " D S(X,1,1) S X="CHANGE FROM BASE YR %" D S(X,1,1)
 S X="w/tobacco cessation counseling or refusal" D S(X,1,1)
 F X=1:1:3 S N=$P(BGPDAC(X),U,3),O=$P(BGPDAB(X),U,3) S Y=$$SB($J((N-O),6,1)) D S(Y,,X+1)
 S X="who quit" D S(X,1,1)
 F X=1:1:3 S N=$P(BGPDAC(X),U,5),O=$P(BGPDAB(X),U,5) S Y=$$SB($J((N-O),6,1)) D S(Y,,X+1)
 Q
SETN ;set numerator fields
 S BGPCYN=$$V^BGP7DP1C(1,BGPRPT,N,P)
 S BGPPRN=$$V^BGP7DP1C(2,BGPRPT,N,P)
 S BGPBLN=$$V^BGP7DP1C(3,BGPRPT,N,P)
 S BGPCYP=$S(BGPCYD:((BGPCYN/BGPCYD)*100),1:"")
 S BGPPRP=$S(BGPPRD:((BGPPRN/BGPPRD)*100),1:"")
 S BGPBLP=$S(BGPBLD:((BGPBLN/BGPBLD)*100),1:"")
 Q
V(T,R,N,P) ;EP
 I $G(BGPAREAA) G VA
 NEW X
 I T=1 S X=$P($G(^BGPGPDCA(R,N)),U,P) Q $S(X]"":X,1:0)
 I T=2 S X=$P($G(^BGPGPDPA(R,N)),U,P) Q $S(X]"":X,1:0)
 I T=3 S X=$P($G(^BGPGPDBA(R,N)),U,P) Q $S(X]"":X,1:0)
 Q ""
VA ;
 NEW X,V,C S X=0,C="" F  S X=$O(BGPSUL(X)) Q:X'=+X  D
 .I T=1 S C=C+$P($G(^BGPGPDCA(X,N)),U,P)
 .I T=2 S C=C+$P($G(^BGPGPDPA(X,N)),U,P)
 .I T=3 S C=C+$P($G(^BGPGPDBA(X,N)),U,P)
 .Q
 Q $S(C:C,1:0)
C(X,X2,X3) ;
 D COMMA^%DTC
 Q X
S(Y,F,P) ;set up array
 I '$G(F) S F=0
 S %=$P(^TMP($J,"BGPDEL",0),U)+F,$P(^TMP($J,"BGPDEL",0),U)=%
 I '$D(^TMP($J,"BGPDEL",%)) S ^TMP($J,"BGPDEL",%)=""
 S $P(^TMP($J,"BGPDEL",%),U,P)=Y
 Q
CALC(N,O) ;
 NEW Z
 S Z=N-O,Z=$FN(Z,"+,",1)
 Q Z
H3 ;EP
 S X="Age specific Tobacco Cessation" D S(X,1,1) S Y=" " D S(Y,1,1) S X=BGPHD1 D S(X,1,1) S Y=" " D S(Y,1,1)
 S X="Age Distribution" D S(X,1,1) S X=" " D S(X,1,1)
 S Y="<12" D S(Y,1,2)
 S Y="12-17" D S(Y,,3)
 S Y="=>18 yrs" D S(Y,,4)
 Q
SB(X) ;EP - Strip leading and trailing blanks from X.
 X ^DD("FUNC",$O(^DD("FUNC","B","STRIPBLANKS",0)),1)
 Q X
H2 ;
 S BGPX="",BGPX=BGPCYN,$P(BGPX,U,2)=$$SB($J(BGPCYP,5,1)),$P(BGPX,U,3)=BGPPRN,$P(BGPX,U,4)=$$SB($J(BGPPRP,5,1)),$P(BGPX,U,5)=$$SB($J($$CALC(BGPCYP,BGPPRP),6)),$P(BGPX,U,6)=BGPBLN,$P(BGPX,U,7)=$$SB($J(BGPBLP,5,1))
 S $P(BGPX,U,8)=$$SB($J($$CALC(BGPCYP,BGPBLP),6))
 D S(BGPX,,2)
 Q
H1 ;EP
 S Y="REPORT" D S(Y,1,2)
 S Y="%" D S(Y,,3)
 S Y="PREV YR" D S(Y,,4)
 S Y="%" D S(Y,,5)
 S Y="CHG from" D S(Y,,6)
 S Y="BASE" D S(Y,,7)
 S Y="%" D S(Y,,8)
 S Y="CHG from" D S(Y,,9)
 S Y="PERIOD" D S(Y,1,2)
 S Y="PERIOD" D S(Y,,4)
 S Y="PREV YR %" D S(Y,,6)
 S Y="PERIOD" D S(Y,,7)
 S Y="BASE %" D S(Y,,9)
 Q
