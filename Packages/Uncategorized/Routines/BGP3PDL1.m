BGP3PDL1 ; IHS/CMI/LAB - print ind 1 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
 ;
I1 ;EP
 D H1
I1A1 ;001.A, 001.B, 001.C
 F BGPPC1="001.A","001.B","001.C" D PI
 D I1AGE
 Q
I2 ;EP
 D H1
 F BGPPC1="002.A","002.D","002.B","002.C" D PI
 Q
I3 ;EP
 D H1
 F BGPPC1="003.A","003.D","003.B","003.C" D PI
 Q
I4 ;
 D H1
 F BGPPC1="004.A","004.D","004.B","004.C" D PI
 Q
I5 ;EP
 D H1
 F BGPPC1="005.A","005.D","005.B","005.C" D PI
 Q
I6 ;EP
 D H1
 F BGPPC1="006.A","006.D","006.B","006.C" D PI
 Q
I7 ;EP
 D H1
 F BGPPC1="007.A","007.B" D PI
 Q
I8 ;EP
 D H1
 F BGPPC1="008.A","008.B" D PI
 Q
I13 ;EP
 D H1
 F BGPPC1="013.A" D PI
 Q
I15 ;EP
 D H1
 F BGPPC1="015.A" D PI
 Q
I25 ;EP
 D H1
 F BGPPC1="025.A","025.B","025.C","025.E","025.H","025.I","025.D" D PI
 Q
I26 ;EP
 D H1
 F BGPPC1="026.A","026.C","026.B" D PI
 Q
I301 ;EP
 D H1
 F BGPPC1="030-1.AA","030-1.AB","030-1.AC","030-1.CA","030-1.CB","030-1.CC","030-1.BA","030-1.BB","030-1.BC" D PI
 Q
I302 ;EP
 D H1
 F BGPPC1="030-2.AA","030-2.AB","030-2.AC","030-2.CA","030-2.CB","030-2.CC","030-2.BA","030-2.BB","030-2.BC" D PI
 Q
IA ;EP
 D H1
 F BGPPC1="A.A" D PI
 Q
IB ;EP
 D H1
 F BGPPC1="B.A","B.B","B.C","B.D","B.E","B.F" D PI
 Q
IC2 ;EP
 D H1
 F BGPPC1="C-2.A","C-2.B" D PI
 Q
PI ;EP
 S BGPPC=$O(^BGPINDC("AA",BGPPC1,0))
 I BGPRTYPE'=4,BGPINDT="G",$P(^BGPINDC(BGPPC,0),U,5)'=1 Q
 I BGPRTYPE'=4,BGPINDT="A",$P(^BGPINDC(BGPPC,0),U,6)'=1 Q
 I BGPINDT="D",$P(^BGPINDC(BGPPC,0),U,12)'=1 Q
 I BGPINDT="C",$P(^BGPINDC(BGPPC,0),U,13)'=1 Q
 S BGPDF=$P(^BGPINDC(BGPPC,0),U,8)
 ;get denominator value of indicator
 S BGPNP=$P(^DD(90243,BGPDF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 S BGPCYD=$$V(1,BGPRPT,N,P)
 S BGPPRD=$$V(2,BGPRPT,N,P)
 S BGPBLD=$$V(3,BGPRPT,N,P)
 ;write out denominator
 S Y=" " D S(Y,1,1)
 I BGPRTYPE=4 S Y=$P(^BGPINDC(BGPPC,0),U,17) D S(Y,1,1) I $P(^BGPINDC(BGPPC,0),U,18)]"" D S($P(^BGPINDC(BGPPC,0),U,18),1,1) I $P(^BGPINDC(BGPPC,0),U,19)]"" D S($P(^BGPINDC(BGPPC,0),U,19),1,1)
 I BGPRTYPE=1 S Y=$P(^BGPINDC(BGPPC,11),U,1) D S(Y,1,1) I $P(^BGPINDC(BGPPC,11),U,2)]"" D S($P(^BGPINDC(BGPPC,11),U,2),1,1) I $P(^BGPINDC(BGPPC,11),U,3)]"" D S($P(^BGPINDC(BGPPC,11),U,3),1,1)
 I BGPRTYPE=2 S Y=$P(^BGPINDC(BGPPC,11),U,4) D S(Y,1,1) I $P(^BGPINDC(BGPPC,11),U,5)]"" D S($P(^BGPINDC(BGPPC,11),U,5),1,1) I $P(^BGPINDC(BGPPC,11),U,6)]"" D S($P(^BGPINDC(BGPPC,11),U,6),1,1)
 S Y=BGPCYD_"^^"_BGPPRD_"^^^"_BGPBLD D S(Y,,2)
 ;get numerator value of indicator and calc %
 S BGPPC2=0 F  S BGPPC2=$O(^BGPINDC("AA",BGPPC1,BGPPC2))  Q:BGPPC2'=+BGPPC2  D
 .I $P(^BGPINDC(BGPPC2,0),U,4)["031"!($P(^BGPINDC(BGPPC2,0),U,4)["C-") D
 ..S BGPDF=$P(^BGPINDC(BGPPC2,0),U,8)
 ..;get denominator value of indicator
 ..S BGPNP=$P(^DD(90243,BGPDF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 ..S BGPCYD=$$V(1,BGPRPT,N,P)
 ..S BGPPRD=$$V(2,BGPRPT,N,P)
 ..S BGPBLD=$$V(3,BGPRPT,N,P)
 .S BGPNF=$P(^BGPINDC(BGPPC2,0),U,9)
 .S BGPNP=$P(^DD(90243,BGPNF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 .D SETN
 .;write header for 1.A.1
 .S Y=" " D S(Y,1,1) S Y=$P(^BGPINDC(BGPPC2,0),U,15) D S(Y,1,1)
 .I $P(^BGPINDC(BGPPC2,0),U,16)]"" S Y=$P(^BGPINDC(BGPPC2,0),U,16) D S(Y,1,1)
 .I $P(^BGPINDC(BGPPC2,0),U,19)]"" S Y=$P(^BGPINDC(BGPPC2,0),U,19) D S(Y,1,1)
 .D H2
 Q
I1AGE ;
 S BGPHD1="TOTAL GPRA USER POPULATION",BGPHD2="Total # User Pop"
 S X=^BGPIND(BGPIC,53,1,0) D S(X,1,1) S X=" " D S(X,1,1) D H3 S X=" " D S(X,1,1)
 K BGPDAC,BGPDAP,BGPDAB S (C,D)=0 F BGPX="TA","TB","TC","TD","TE","TF","TG","TH" D I1AGE1,I1AGE2
 D I1AGEP
 S BGPHD1="MALE GPRA USER POPULATION",BGPHD2="Total # MALE User Pop"
 S X=^BGPIND(BGPIC,53,1,0) D S(X,1,1) D H3
 K BGPDAC,BGPDAP,BGPDAB S (D,C)=0 F BGPX="D","E","F","G","H","I","J","K" D I1AGE1,I1AGE2
 D I1AGEP
 S BGPHD1="FEMALE GPRA USER POPULATION",BGPHD2="Total # FEMALE User Pop"
 S X=^BGPIND(BGPIC,53,1,0) D S(X,1,1) D H3
 K BGPDAC,BGPDAP,BGPDAB S (C,D)=0 F BGPX="L","M","N","O","P","Q","R","S" D I1AGE1,I1AGE2
 D I1AGEP
 Q
I1AGE1 ;
 S C=C+1
 S BGPF="001."_BGPX_".1" S BGPPC=$O(^BGPINDC("C",BGPF,0))
 S BGPDF=$P(^BGPINDC(BGPPC,0),U,8)
 S BGPNP=$P(^DD(90243,BGPDF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 S $P(BGPDAC(C),U)=$$V(1,BGPRPT,N,P)
 S $P(BGPDAP(C),U)=$$V(2,BGPRPT,N,P)
 S $P(BGPDAB(C),U)=$$V(3,BGPRPT,N,P)
 ;set 2nd piece to numerator and 3rd to %
 S BGPNF=$P(^BGPINDC(BGPPC,0),U,9)
 S BGPNP=$P(^DD(90243,BGPNF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 S $P(BGPDAC(C),U,2)=$$V(1,BGPRPT,N,P),$P(BGPDAC(C),U,3)=$S($P(BGPDAC(C),U,1):($P(BGPDAC(C),U,2)/$P(BGPDAC(C),U)*100),1:"")
 S $P(BGPDAP(C),U,2)=$$V(2,BGPRPT,N,P),$P(BGPDAP(C),U,3)=$S($P(BGPDAP(C),U,1):($P(BGPDAP(C),U,2)/$P(BGPDAP(C),U)*100),1:"")
 S $P(BGPDAB(C),U,2)=$$V(3,BGPRPT,N,P),$P(BGPDAB(C),U,3)=$S($P(BGPDAB(C),U,1):($P(BGPDAB(C),U,2)/$P(BGPDAB(C),U)*100),1:"")
 Q
I1AGE2 ;
 S D=D+1
 S BGPF="001."_BGPX_".2" S BGPPC=$O(^BGPINDC("C",BGPF,0))
 ;set 4th piece to numerator and 5th to %
 S BGPNF=$P(^BGPINDC(BGPPC,0),U,9)
 S BGPNP=$P(^DD(90243,BGPNF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 S $P(BGPDAC(D),U,4)=$$V(1,BGPRPT,N,P),$P(BGPDAC(D),U,5)=$S($P(BGPDAC(D),U,1):($P(BGPDAC(D),U,4)/$P(BGPDAC(D),U)*100),1:"")
 S $P(BGPDAP(D),U,4)=$$V(2,BGPRPT,N,P),$P(BGPDAP(D),U,5)=$S($P(BGPDAP(D),U,1):($P(BGPDAP(D),U,4)/$P(BGPDAP(D),U)*100),1:"")
 S $P(BGPDAB(D),U,4)=$$V(3,BGPRPT,N,P),$P(BGPDAB(D),U,5)=$S($P(BGPDAB(D),U,1):($P(BGPDAB(D),U,4)/$P(BGPDAB(D),U)*100),1:"")
 Q
I1AGEP ;
 S X=" " D S(X,1,1)
 S X="CURRENT REPORT PERIOD" D S(X,1,1) S X=" " D S(X,1,1)
 S X=BGPHD2 D S(X,1,1)
 F X=1:1:8 S V=$P(BGPDAC(X),U) S Y=V D S(Y,,X+1)
 S X="# w/ DM DX ever" D S(X,1,1)
 F X=1:1:8 S V=$P(BGPDAC(X),U,2) S Y=V D S(Y,,X+1)
 S X="% w/ DM DX ever" D S(X,1,1)
 F X=1:1:8 S V=$P(BGPDAC(X),U,3) S Y=$$SB($J(V,6,1)) D S(Y,,X+1)
 S X="# w/DM DX in past yr" D S(X,1,1)
 F X=1:1:8 S V=$P(BGPDAC(X),U,4) S Y=V D S(Y,,X+1)
 S X=" " D S(X,1,1) S X="% w/DM DX in past yr" D S(X,1,1)
 F X=1:1:8 S V=$P(BGPDAC(X),U,5) S Y=$$SB($J(V,6,1)) D S(Y,,X+1)
PR ; 
 ;S X=^BGPIND(BGPIC,53,1,0) D S(X,1,1) D H3
 S X=" " D S(X,1,1) S X="PREVIOUS YEAR PERIOD" D S(X,1,1)
 S X=" " D S(X,1,1) S X=BGPHD2 D S(X,1,1)
 F X=1:1:8 S V=$P(BGPDAP(X),U) S Y=V D S(Y,,X+1)
 S X="# w/ DM DX ever" D S(X,1,1)
 F X=1:1:8 S V=$P(BGPDAP(X),U,2) S Y=V D S(Y,,X+1)
 S X="% w/ DM DX ever" D S(X,1,1)
 F X=1:1:8 S V=$P(BGPDAP(X),U,3) S Y=$$SB($J(V,6,1)) D S(Y,,X+1)
 S X=" " D S(X,1,1) S X="# w/DM DX in past yr" D S(X,1,1)
 F X=1:1:8 S V=$P(BGPDAP(X),U,4) S Y=V D S(Y,,X+1)
 S X="% w/DM DX in past yr" D S(X,1,1)
 F X=1:1:8 S V=$P(BGPDAP(X),U,5) S Y=$$SB($J(V,6,1)) D S(Y,,X+1)
 ;percentage changes
 S X=" " D S(X,1,1) S X="CHANGE FROM PREV YR %" D S(X,1,1)
 S X="w/ DM DX ever" D S(X,1,1)
 F X=1:1:8 S N=$P(BGPDAC(X),U,3),O=$P(BGPDAP(X),U,3) S Y=$$SB($J((N-O),6,1)) D S(Y,,X+1)
 S X="w/DM DX in past yr" D S(X,1,1)
 F X=1:1:8 S N=$P(BGPDAC(X),U,5),O=$P(BGPDAP(X),U,5) S Y=$$SB($J((N-O),6,1)) D S(Y,,X+1)
BL ;
 ;S X=^BGPIND(BGPIC,53,1,0) D S(X,1,1) D H3
 S X=" " D S(X,1,1) S X="BASELINE REPORT PERIOD" D S(X,1,1)
 S X=" " D S(X,1,1) S X=BGPHD2 D S(X,1,1)
 F X=1:1:8 S V=$P(BGPDAB(X),U) S Y=V D S(Y,,X+1)
 S X="# w/ DM DX ever" D S(X,1,1)
 F X=1:1:8 S V=$P(BGPDAB(X),U,2) S Y=V D S(Y,,X+1)
 S X="% w/ DM DX ever" D S(X,1,1)
 F X=1:1:8 S V=$P(BGPDAB(X),U,3) S Y=$$SB($J(V,6,1)) D S(Y,,X+1)
 S X=" " D S(X,1,1) S X="# w/DM DX in past yr" D S(X,1,1)
 F X=1:1:8 S V=$P(BGPDAB(X),U,4) S Y=V D S(Y,,X+1)
 S X="% w/DM DX in past yr" D S(X,1,1)
 F X=1:1:8 S V=$P(BGPDAB(X),U,5) S Y=$$SB($J(V,6,1)) D S(Y,,X+1)
 ;percentage changes
 S X=" " D S(X,1,1) S X="CHANGE FROM BASE YR %" D S(X,1,1)
 S X="w/ DM DX ever" D S(X,1,1)
 F X=1:1:8 S N=$P(BGPDAC(X),U,3),O=$P(BGPDAB(X),U,3) S Y=$$SB($J((N-O),6,1)) D S(Y,,X+1)
 S X="w/DM DX in past yr" D S(X,1,1)
 F X=1:1:8 S N=$P(BGPDAC(X),U,5),O=$P(BGPDAB(X),U,5) S Y=$$SB($J((N-O),6,1)) D S(Y,,X+1)
 Q
SETN ;set numerator fields
 S BGPCYN=$$V(1,BGPRPT,N,P)
 S BGPPRN=$$V(2,BGPRPT,N,P)
 S BGPBLN=$$V(3,BGPRPT,N,P)
 S BGPCYP=$S(BGPCYD:((BGPCYN/BGPCYD)*100),1:"")
 S BGPPRP=$S(BGPPRD:((BGPPRN/BGPPRD)*100),1:"")
 S BGPBLP=$S(BGPBLD:((BGPBLN/BGPBLD)*100),1:"")
 Q
V(T,R,N,P) ;EP
 I $G(BGPAREAA) G VA
 NEW X
 I T=1 S X=$P($G(^BGPGPDC(R,N)),U,P) Q $S(X]"":X,1:0)
 I T=2 S X=$P($G(^BGPGPDP(R,N)),U,P) Q $S(X]"":X,1:0)
 I T=3 S X=$P($G(^BGPGPDB(R,N)),U,P) Q $S(X]"":X,1:0)
 Q ""
VA ;
 NEW X,V,C S X=0,C="" F  S X=$O(BGPSUL(X)) Q:X'=+X  D
 .I T=1 S C=C+$P($G(^BGPGPDC(X,N)),U,P)
 .I T=2 S C=C+$P($G(^BGPGPDP(X,N)),U,P)
 .I T=3 S C=C+$P($G(^BGPGPDB(X,N)),U,P)
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
 S X="Age specific Diabetes Prevalence" D S(X,1,1) S Y=" " D S(Y,1,1) S X=BGPHD1 D S(X,1,1) S Y=" " D S(Y,1,1)
 S X="Age Distribution" D S(X,1,1) S X=" " D S(X,1,1)
 S Y="<15" D S(Y,1,2)
 S Y="15-19" D S(Y,,3)
 S Y="20-24" D S(Y,,4)
 S Y="25-34" D S(Y,,5)
 S Y="35-44" D S(Y,,6)
 S Y="45-54" D S(Y,,7)
 S Y="55-64" D S(Y,,8)
 S Y=">64 yrs" D S(Y,,9)
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
