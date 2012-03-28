BGP5DP7 ; IHS/CMI/LAB - print ind 10 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
 ;
 ;this routine for Indicator I10 ONLY
I10 ;EP
 D H1 S BGPNODEN=1
 F BGPPC1="10.1" D PI Q:BGPQUIT
 Q
PI ;EP
 S BGPDENP=0
 K BGPDHOLD
 K BGPCYP,BGPBLP,BGPPRP
 S BGPPC2=0 F  S BGPPC2=$O(^BGPINDVC("AB",BGPPC1,BGPPC2)) Q:BGPPC2=""  S BGPPC=$O(^BGPINDVC("AB",BGPPC1,BGPPC2,0)) D PI1
 Q
PI1 ;
 K BGPEXCT,BGPSDP
 I BGPRTYPE'=4,BGPINDT="G",$P(^BGPINDVC(BGPPC,0),U,5)'=1 Q
 I BGPINDT="D",$P(^BGPINDVC(BGPPC,0),U,12)'=1 Q
 I BGPINDT="C",$P(^BGPINDVC(BGPPC,0),U,13)'=1 Q
 I BGPINDT="W",$P($G(^BGPINDVC(BGPPC,12)),U,2)'=1 Q
 I BGPINDT="E",$P($G(^BGPINDVC(BGPPC,12)),U,3)'=1 Q
 ;get numerator value of indicator and calc %
 S BGPDF=$P(^BGPINDVC(BGPPC,0),U,9)
 I $P(^BGPINDVC(BGPPC,0),U,4)[".1" S BGPDHOLD=BGPDF
 I $P(^BGPINDVC(BGPPC,0),U,4)'[".1" S BGPDF=BGPDHOLD
 S BGPNP=$P(^DD(90371.03,BGPDF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 S BGPCYD=$$V(1,BGPRPT,N,P,1) I $G(BGPAREAA) D SETEXA^BGP5DP1(1,N,P)
 S BGPPRD=$$V(2,BGPRPT,N,P,1) I $G(BGPAREAA) D SETEXA^BGP5DP1(2,N,P)
 S BGPBLD=$$V(3,BGPRPT,N,P,1) I $G(BGPAREAA) D SETEXA^BGP5DP1(3,N,P)
 S BGPNF=$P(^BGPINDVC(BGPPC,0),U,9)
 S BGPNP=$P(^DD(90371.03,BGPNF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 D SETN
 I $P($G(^BGPINDVC(BGPPC,14)),U) D
 .S ^TMP($J,"SUMMARY",$P(^BGPINDVC(BGPPC,14),U,5),$P(^BGPINDVC(BGPPC,14),U,6),BGPPC)=BGPCYN_U_BGPPRN_U_BGPBLN
 .Q:'$G(BGPAREAA)
 .S X=0 F  S X=$O(BGPSDP(X)) Q:X'=+X  D  ;SDPX
 ..S ^TMP($J,"SUMMARY DETAIL PAGE",$P(^BGPINDVC(BGPPC,14),U,5),$P(^BGPINDVC(BGPPC,14),U,6),BGPPC,X)=$P($G(BGPSDP(X,1)),U,2)_U_$P($G(BGPSDP(X,2)),U,2)_U_$P($G(BGPSDP(X,3)),U,2)_U_BGPCYN
 ;write header for 1.A.1
 W !!,$P(^BGPINDVC(BGPPC,0),U,15)
 I $P(^BGPINDVC(BGPPC,0),U,16)]"" W !?1,$P(^BGPINDVC(BGPPC,0),U,16)
 I $P(^BGPINDVC(BGPPC,0),U,19)]"" W !?1,$P(^BGPINDVC(BGPPC,0),U,19)
 D H2
 Q
H2 ;EP
 S BGPX="",BGPX=$$C(BGPCYN,0,8),$E(BGPX,9)=$S(BGPCYP]"":$J($G(BGPCYP),5,1),1:""),$E(BGPX,16)=$$C(BGPPRN,0,8),$E(BGPX,24)=$S(BGPPRP]"":$J($G(BGPPRP),5,1),1:""),$E(BGPX,32)=$$CALC(BGPCYN,BGPPRN)
 S $E(BGPX,39)=$$C(BGPBLN,0,8),$E(BGPX,47)=$S(BGPBLP]"":$J($G(BGPBLP),5,1),1:""),$E(BGPX,55)=$$CALC(BGPCYN,BGPBLN)
 W ?20,BGPX
 Q
H1 ;EP
 W !!?21,"REPORT",?31,"",?35,"PREV YR",?46,"",?49,"CHG from",?59,"BASE",?69,"",?72,"CHG from"
 W !?21,"PERIOD      ",?35,"PERIOD      ",?49,"PREV YR ",?59,"PERIOD      ",?72,"BASE "
 Q
SETN ;set numerator fields
 D SETN^BGP5DP1
 I $P(^BGPINDVC(BGPPC,0),U,4)[".1" S (BGPCYP,BGPPRP,BGPBLP)=""
 Q
V(T,R,N,P,ND) ;EP
 I $G(BGPAREAA) G VA
 I T=1 Q $P($G(^BGPGPDCV(R,N)),U,P)
 I T=2 Q $P($G(^BGPGPDPV(R,N)),U,P)
 I T=3 Q $P($G(^BGPGPDBV(R,N)),U,P)
 Q ""
VA ;
 NEW X,V,C S X=0,C="" F  S X=$O(BGPSUL(X)) Q:X'=+X  D
 .I T=1 S C=C+$P($G(^BGPGPDCV(X,N)),U,P)
 .I T=2 S C=C+$P($G(^BGPGPDPV(X,N)),U,P)
 .I T=3 S C=C+$P($G(^BGPGPDBV(X,N)),U,P)
 .I $G(BGPAREAA),$P($G(^BGPINDVC(BGPPC,14)),U) D  ;SPDX
 ..I T=1 S $P(BGPSDP(X,T),U,ND)=$P($G(^BGPGPDCV(X,N)),U,P) ;SPDX
 ..I T=2 S $P(BGPSDP(X,T),U,ND)=$P($G(^BGPGPDPV(X,N)),U,P) ;SPDX
 ..I T=3 S $P(BGPSDP(X,T),U,ND)=$P($G(^BGPGPDBV(X,N)),U,P) ;SPDX
 .Q
 Q C
CALC(N,O) ;ENTRY POINT
 NEW Z
 S Z=N-O,Z=$FN(Z,"+,",0)
 Q Z
C(X,X2,X3) ;
 D COMMA^%DTC
 Q X
