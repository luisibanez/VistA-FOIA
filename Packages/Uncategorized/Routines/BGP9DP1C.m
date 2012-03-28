BGP9DP1C ; IHS/CMI/LAB - print ind 1 21 Mar 2008 12:55 PM ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
 ;
PI ;EP
 S BGPDENP=0
 S BGPPC2=0 F  S BGPPC2=$O(^BGPINDNC("ABC",BGPPC1,BGPPC2)) Q:BGPPC2=""  S BGPPC=$O(^BGPINDNC("ABC",BGPPC1,BGPPC2,0)) D PI1
 Q
PI1 ;EP
 K BGPEXCT,BGPSDP,BGPSDPN,BGPSDPO,BGPSDPD
 I BGPRTYPE=1,$P(^BGPINDNC(BGPPC,0),U,5)'=1 Q
 I BGPRTYPE=7,$P($G(^BGPINDNC(BGPPC,12)),U,12)'=1 Q
 I BGPRTYPE=4,$P($G(^BGPINDNC(BGPPC,21)),U,2)=1 Q
 I BGPINDT="D",$P(^BGPINDNC(BGPPC,0),U,12)'=1 Q
 I BGPINDT="C",$P(^BGPINDNC(BGPPC,0),U,13)'=1 Q
 I BGPINDT="W",$P($G(^BGPINDNC(BGPPC,12)),U,2)'=1 Q
 I BGPINDT="E",$P($G(^BGPINDNC(BGPPC,12)),U,3)'=1 Q
 I $P(^BGPINDNC(BGPPC,0),U,4)="E-2.B.3" D PI1^BGP9DP2 Q
 S BGPDF=$P(^BGPINDNC(BGPPC,0),U,8)
 ;get denom value
 S BGPNP=$P(^DD(90536.03,BGPDF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 S BGPCYD=$$V(1,BGPRPT,N,P,1) I $G(BGPAREAA) D SETEXA(1,N,P)
 S BGPPRD=$$V(2,BGPRPT,N,P,1) I $G(BGPAREAA) D SETEXA(2,N,P)
 S BGPBLD=$$V(3,BGPRPT,N,P,1) I $G(BGPAREAA) D SETEXA(3,N,P)
 ;write out denom
 I BGPRTYPE=1,$P(^BGPINDNC(BGPPC,0),U,4)="MS.A.9" S BGPDENP=0
 I BGPRTYPE=1,$P(^BGPINDNC(BGPPC,0),U,4)="DM.2.1" S BGPDENP=0
 I BGPRTYPE=7,$P(^BGPINDNC(BGPPC,0),U,4)="028.C.4" S BGPDENP=0
 I BGPRTYPE=1,$P(^BGPINDNC(BGPPC,0),U,4)="E-2.A.1" S BGPDENP=0
 I 'BGPDENP D
 .I $P($G(^BGPINDNC(BGPPC,12)),U,14) Q
 .I $P(^BGPINDNC(BGPPC,0),U,11),BGPRTYPE=1 I '$G(BGPSUMON) D HEADER^BGP9DPH Q:BGPQUIT  W !!,^BGPINDN(BGPIC,53,1,0) W:$D(^BGPINDN(BGPIC,53,2,0)) !,^BGPINDN(BGPIC,53,2,0) D H1^BGP9DPH
 .I $P(^BGPINDNC(BGPPC,0),U,24),BGPRTYPE=4 I '$G(BGPSUMON) D HEADER^BGP9DPH Q:BGPQUIT  W !!,^BGPINDN(BGPIC,53,1,0) W:$D(^BGPINDN(BGPIC,53,2,0)) !,^BGPINDN(BGPIC,53,2,0) D H1^BGP9DPH
 .I $P($G(^BGPINDNC(BGPPC,12)),U,15),BGPRTYPE=7 I '$G(BGPSUMON) D HEADER^BGP9DPH Q:BGPQUIT  W !!,^BGPINDN(BGPIC,53,1,0) W:$D(^BGPINDN(BGPIC,53,2,0)) !,^BGPINDN(BGPIC,53,2,0) D H1^BGP9DPH
 .I $Y>(BGPIOSL-15),'$G(BGPSUMON) D HEADER^BGP9DPH Q:BGPQUIT  W !!,^BGPINDN(BGPIC,53,1,0) W:$D(^BGPINDN(BGPIC,53,2,0)) !,^BGPINDN(BGPIC,53,2,0) D H1^BGP9DPH
 .I BGPRTYPE=1,$P($G(^BGPINDNC(BGPPC,20)),U,4)]"" D  I 1
 ..W:'$G(BGPSUMON) !!,$P(^BGPINDNC(BGPPC,20),U,4)
 ..I $P(^BGPINDNC(BGPPC,20),U,5)]"" W:'$G(BGPSUMON) !,$P(^BGPINDNC(BGPPC,20),U,5)
 ..I $P(^BGPINDNC(BGPPC,20),U,6)]"" W:'$G(BGPSUMON) !,$P(^BGPINDNC(BGPPC,20),U,6)
 .E  D
 ..W:'$G(BGPSUMON) !!,$P(^BGPINDNC(BGPPC,0),U,17)
 ..I $P(^BGPINDNC(BGPPC,0),U,18)]"" D C18
 ..I $P(^BGPINDNC(BGPPC,0),U,21)]"" D C21
 .W:'$G(BGPSUMON) ?20,$$C(BGPCYD,0,8),?35,$$C(BGPPRD,0,8),?58,$$C(BGPBLD,0,8),!
 .S BGPDENP=1
 I $E($P(^BGPINDNC(BGPPC,0),U,4),1,2)="I." D
 .S BGPDF=$P(^BGPINDNC(BGPPC,0),U,8)
 .;get denominator value
 .S BGPNP=$P(^DD(90536.03,BGPDF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 .S BGPCYD=$$V(1,BGPRPT,N,P,1) I $G(BGPAREAA) D SETEXA(1,N,P)
 .S BGPPRD=$$V(2,BGPRPT,N,P,1) I $G(BGPAREAA) D SETEXA(2,N,P)
 .S BGPBLD=$$V(3,BGPRPT,N,P,1) I $G(BGPAREAA) D SETEXA(3,N,P)
 S BGPNF=$P(^BGPINDNC(BGPPC,0),U,9)
 S BGPNP=$P(^DD(90536.03,BGPNF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 D SETN
 ;write header
 I $P(^BGPINDNC(BGPPC,0),U,22) W:'$G(BGPSUMON) !
 I $P($G(^BGPINDNC(BGPPC,12)),U,8),BGPRTYPE=4 I '$G(BGPSUMON) D HEADER^BGP9DPH Q:BGPQUIT  W !!,^BGPINDN(BGPIC,53,1,0) W:$D(^BGPINDN(BGPIC,53,2,0)) !,^BGPINDN(BGPIC,53,2,0) D H1^BGP9DPH
 I $P($G(^BGPINDNC(BGPPC,21)),U,5),BGPRTYPE=1 I '$G(BGPSUMON) D HEADER^BGP9DPH Q:BGPQUIT  W !!,^BGPINDN(BGPIC,53,1,0) W:$D(^BGPINDN(BGPIC,53,2,0)) !,^BGPINDN(BGPIC,53,2,0) D H1^BGP9DPH
 I BGPRTYPE=1,$P($G(^BGPINDNC(BGPPC,20)),U,1)]"",'$G(BGPSUMON) D  G N
 .W !,$P(^BGPINDNC(BGPPC,20),U,1)
 .I $P(^BGPINDNC(BGPPC,20),U,2)]"" W !,$P(^BGPINDNC(BGPPC,20),U,2)
 .I $P(^BGPINDNC(BGPPC,20),U,3)]"" W !,$P(^BGPINDNC(BGPPC,20),U,3)
 W:'$G(BGPSUMON) !,$P(^BGPINDNC(BGPPC,0),U,15) I BGPRTYPE=4,$P($G(^BGPINDNC(BGPPC,12)),U,5) W:'$G(BGPSUMON) " (GPRA)"
 I $P(^BGPINDNC(BGPPC,0),U,16)]"" W:'$G(BGPSUMON) !?1,$P(^BGPINDNC(BGPPC,0),U,16)
 I BGPRTYPE=4,$P($G(^BGPINDNC(BGPPC,12)),U,6) W:$P(^BGPINDNC(BGPPC,0),U,16)="" ! W:'$G(BGPSUMON) " (GPRA)"
 I $P(^BGPINDNC(BGPPC,0),U,19)]"" W:'$G(BGPSUMON) !?1,$P(^BGPINDNC(BGPPC,0),U,19)
 I BGPRTYPE=4,$P($G(^BGPINDNC(BGPPC,12)),U,7) W:$P(^BGPINDNC(BGPPC,0),U,19)="" ! W:'$G(BGPSUMON) " (GPRA)"
N D H2^BGP9DPH
 Q
C18 ;
 W:'$G(BGPSUMON) !,$P(^BGPINDNC(BGPPC,0),U,18)
 Q
C21 ;
 W:'$G(BGPSUMON) !,$P(^BGPINDNC(BGPPC,0),U,21)
 Q
I1AGE ;EP - age tallies
 D I1AGE^BGP9DP11
 Q
SETN ;EP - set numerator fields
 S BGPCYN=$$V^BGP9DP1C(1,BGPRPT,N,P,2) ;SPDX
 S BGPPRN=$$V^BGP9DP1C(2,BGPRPT,N,P,2) ;SPDX
 S BGPBLN=$$V^BGP9DP1C(3,BGPRPT,N,P,2) ;SPDX
 S BGPCYP=$S(BGPCYD:((BGPCYN/BGPCYD)*100),1:"")
 S BGPPRP=$S(BGPPRD:((BGPPRN/BGPPRD)*100),1:"")
 S BGPBLP=$S(BGPBLD:((BGPBLN/BGPBLD)*100),1:"")
 I $G(BGPAREAA) D SDP
 ;GPRA MEASURES SUMMARY SHEET
 I $P($G(^BGPINDNC(BGPPC,14)),U),'$G(BGPNOSUM) D
 .S ^TMP($J,"SUMMARY",$P(^BGPSCAT($P(^BGPINDNC(BGPPC,14),U,5),0),U,2),$P(^BGPINDNC(BGPPC,14),U,6),BGPPC)=BGPCYP_U_BGPPRP_U_BGPBLP
 .I $G(BGPAREAA) D  ;SDPX
 ..S X=0 F  S X=$O(BGPSDP(X)) Q:X'=+X  D  ;SDPX
 ...S ^TMP($J,"SUMMARY DETAIL PAGE",$P(^BGPSCAT($P(^BGPINDNC(BGPPC,14),U,5),0),U,2),$P(^BGPINDNC(BGPPC,14),U,6),BGPPC,X)=$P($G(BGPSDP(X,1)),U,3)_U_$P($G(BGPSDP(X,2)),U,3)_U_$P($G(BGPSDP(X,3)),U,3)_U_$J(BGPCYP,5,1)
 .S ^TMP($J,"SUMMARYDEL",$P(^BGPSCAT($P(^BGPINDNC(BGPPC,14),U,5),0),U,2),$P(^BGPINDNC(BGPPC,14),U,6),BGPPC)=$$SB($J(BGPCYP,5,1))_U_$$SB($J(BGPPRP,5,1))_U_$$SB($J(BGPBLP,5,1))
 .I $G(BGPAREAA) D  ;SDPX
 ..S X=0 F  S X=$O(BGPSDP(X)) Q:X'=+X  D  ;SDPX
 ...S A=$P(^BGPSCAT($P(^BGPINDNC(BGPPC,14),U,5),0),U,2)
 ...S B=$P(^BGPINDNC(BGPPC,14),U,6)
 ...S ^TMP($J,"SUMMARYDEL DETAIL PAGE",A,B,BGPPC,X)=$$SB($J($P($G(BGPSDP(X,1)),U,3),5,1))_U_$$SB($J($P($G(BGPSDP(X,2)),U,3),5,1))_U_$$SB($J($P($G(BGPSDP(X,3)),U,3),5,1))_U_$$SB($J(BGPCYP,5,1))
 ;NON GRPA MEASURES
 I $P($G(^BGPINDNC(BGPPC,15)),U),'$G(BGPNOSUM) D
 .S ^TMP($J,"SUMMARY NON",$P(^BGPSCAT($P(^BGPINDNC(BGPPC,15),U,5),0),U,2),$P(^BGPINDNC(BGPPC,15),U,6),BGPPC)=BGPCYP_U_BGPPRP_U_BGPBLP
 .I $G(BGPAREAA) D  ;SDPX
 ..S X=0 F  S X=$O(BGPSDPN(X)) Q:X'=+X  D  ;SDPX
 ...S ^TMP($J,"SUMMARY DETAIL PAGE NON",$P(^BGPSCAT($P(^BGPINDNC(BGPPC,15),U,5),0),U,2),$P(^BGPINDNC(BGPPC,15),U,6),BGPPC,X)=$P($G(BGPSDPN(X,1)),U,3)_U_$P($G(BGPSDPN(X,2)),U,3)_U_$P($G(BGPSDPN(X,3)),U,3)_U_$J(BGPCYP,5,1)
 I $P($G(^BGPINDNC(BGPPC,15)),U),'$G(BGPNOSUM) D
 .S ^TMP($J,"SUMMARYDEL NON",$P(^BGPSCAT($P(^BGPINDNC(BGPPC,15),U,5),0),U,2),$P(^BGPINDNC(BGPPC,15),U,6),BGPPC)=$$SB($J(BGPCYP,5,1))_U_$$SB($J(BGPPRP,5,1))_U_$$SB($J(BGPBLP,5,1))
 .I $G(BGPAREAA) D  ;SDPX
 ..S X=0 F  S X=$O(BGPSDPN(X)) Q:X'=+X  D  ;SDPX
 ...S A=$P(^BGPSCAT($P(^BGPINDNC(BGPPC,15),U,5),0),U,2)
 ...S B=$P(^BGPINDNC(BGPPC,15),U,6)
 ...S ^TMP($J,"SUMMARYDEL DETAIL PAGE NON",A,B,BGPPC,X)=$$SB($J($P($G(BGPSDPN(X,1)),U,3),5,1))_U_$$SB($J($P($G(BGPSDPN(X,2)),U,3),5,1))_U_$$SB($J($P($G(BGPSDPN(X,3)),U,3),5,1))_U_$$SB($J(BGPCYP,5,1))
 ;DEVELOP
 D SETDEV^BGP9DP1E
 ;OTHER NATIONAL REPORT SUMMARY
  I $P($G(^BGPINDNC(BGPPC,19)),U),'$G(BGPNOSUM) D
 .S ^TMP($J,"SUMMARY OTHER",$P(^BGPSCAT($P(^BGPINDNC(BGPPC,19),U,5),0),U,3),$P(^BGPINDNC(BGPPC,19),U,6),BGPPC)=BGPCYP_U_BGPPRP_U_BGPBLP
 .I $G(BGPAREAA) D  ;SDPX
 ..S X=0 F  S X=$O(BGPSDPO(X)) Q:X'=+X  D  ;SDPX
 ...S ^TMP($J,"SUMMARY DETAIL PAGE OTHER",$P(^BGPSCAT($P(^BGPINDNC(BGPPC,19),U,5),0),U,3),$P(^BGPINDNC(BGPPC,19),U,6),BGPPC,X)=$P($G(BGPSDPO(X,1)),U,3)_U_$P($G(BGPSDPO(X,2)),U,3)_U_$P($G(BGPSDPO(X,3)),U,3)_U_$J(BGPCYP,5,1)
 I $P($G(^BGPINDNC(BGPPC,19)),U),'$G(BGPNOSUM) D
 .S ^TMP($J,"SUMMARYDEL OTHER",$P(^BGPSCAT($P(^BGPINDNC(BGPPC,19),U,5),0),U,3),$P(^BGPINDNC(BGPPC,19),U,6),BGPPC)=$$SB($J(BGPCYP,5,1))_U_$$SB($J(BGPPRP,5,1))_U_$$SB($J(BGPBLP,5,1))
 .I $G(BGPAREAA) D  ;SDPX
 ..S X=0 F  S X=$O(BGPSDPO(X)) Q:X'=+X  D  ;SDPX
 ...S A=$P(^BGPSCAT($P(^BGPINDNC(BGPPC,19),U,5),0),U,3)
 ...S B=$P(^BGPINDNC(BGPPC,19),U,6)
 ...S ^TMP($J,"SUMMARYDEL DETAIL PAGE OTHER",A,B,BGPPC,X)=$$SB($J($P($G(BGPSDPO(X,1)),U,3),5,1))_U_$$SB($J($P($G(BGPSDPO(X,2)),U,3),5,1))_U_$$SB($J($P($G(BGPSDPO(X,3)),U,3),5,1))_U_$$SB($J(BGPCYP,5,1))
 I $G(BGPIIDEL),BGPROT="B" Q
GPRANT1 ;
 I $G(BGPAREAA),$G(BGPEXCEL) D
 .Q:$P(^BGPINDNC(BGPPC,0),U,14)=""
 .;set each numerator and percent,then set BGPEI
 .NEW X S X=0 F  S X=$O(BGPSUL(X)) Q:X'=+X  D
 ..S $P(BGPEXCT(X,1),U,1)=$P($G(^BGPGPDCN(X,N)),U,P),$P(BGPEXCT(X,1),U,3)=$S($P(BGPEXCT(X,1),U,2):(($P(BGPEXCT(X,1),U,1)/$P(BGPEXCT(X,1),U,2))*100),1:"")
 ..S $P(BGPEXCT(X,2),U,1)=$P($G(^BGPGPDPN(X,N)),U,P),$P(BGPEXCT(X,2),U,3)=$S($P(BGPEXCT(X,2),U,2):(($P(BGPEXCT(X,2),U,1)/$P(BGPEXCT(X,2),U,2))*100),1:"")
 ..S $P(BGPEXCT(X,3),U,1)=$P($G(^BGPGPDBN(X,N)),U,P),$P(BGPEXCT(X,3),U,3)=$S($P(BGPEXCT(X,3),U,2):(($P(BGPEXCT(X,3),U,1)/$P(BGPEXCT(X,3),U,2))*100),1:"")
 .S X=0 F  S X=$O(BGPEXCT(X)) Q:X'=+X  D
 ..S A=$P(BGPEXCT(X,1),U,1),B=$P(BGPEXCT(X,1),U,2),C=$P(BGPEXCT(X,1),U,3)
 ..S D=$P(BGPEXCT(X,2),U,1),E=$P(BGPEXCT(X,2),U,2),F=$P(BGPEXCT(X,2),U,3)
 ..S G=$P(BGPEXCT(X,3),U,1),H=$P(BGPEXCT(X,3),U,2),I=$P(BGPEXCT(X,3),U,3)
 ..I $P($P(^BGPINDNC(BGPPC,0),U,4),".")="023" S Y=$P(^BGPINDNC(BGPPC,0),U,14),$P(BGPEI(X),U,Y)=$S(B:B,1:0),$P(BGPEI(X),U,(Y+3))=$S(E:E,1:0),$P(BGPEI(X),U,(Y+6))=$S(H:H,1:0) Q
 ..I $P($P(^BGPINDNC(BGPPC,0),U,4),".")="014" S Y=$P(^BGPINDNC(BGPPC,0),U,14),$P(BGPEI(X),U,Y)=$S(B:B,1:0),$P(BGPEI(X),U,(Y+3))=$S(E:E,1:0),$P(BGPEI(X),U,(Y+6))=$S(H:H,1:0) Q
 ..I $P($P(^BGPINDNC(BGPPC,0),U,4),".")="016" S Y=$P(^BGPINDNC(BGPPC,0),U,14),$P(BGPEI(X),U,Y)=$S(B:B,1:0),$P(BGPEI(X),U,(Y+3))=$S(E:E,1:0),$P(BGPEI(X),U,(Y+6))=$S(H:H,1:0) Q
 ..I $P($G(^BGPINDNC(BGPPC,19)),U,13) S Y=$P(^BGPINDNC(BGPPC,0),U,14),$P(BGPEI(X),U,Y)=$S(B:B,1:0),$P(BGPEI(X),U,(Y+3))=$S(E:E,1:0),$P(BGPEI(X),U,(Y+6))=$S(H:H,1:0) Q
 ..S Y=$P(^BGPINDNC(BGPPC,0),U,14)
 ..S $P(BGPEI(X),U,$P(^BGPINDNC(BGPPC,0),U,14))=$S(A:A,1:0),$P(BGPEI(X),U,(Y+1))=$S(B:B,1:0),$P(BGPEI(X),U,(Y+2))=$$SL(C)
 ..S $P(BGPEI(X),U,(Y+3))=$S(D:D,1:0),$P(BGPEI(X),U,(Y+4))=$S(E:E,1:0),$P(BGPEI(X),U,(Y+5))=$$SL(F),$P(BGPEI(X),U,(Y+6))=$S(G:G,1:0),$P(BGPEI(X),U,(Y+7))=$S(H:H,1:0),$P(BGPEI(X),U,(Y+8))=$$SL(I)
GPRANT2 ;
 I $G(BGPAREAA),$G(BGPEXCEL) D
 .Q:$P($G(^BGPINDNC(BGPPC,12)),U,13)=""
 .;set each numerator and percent,then set BGPEI2
 .NEW X S X=0 F  S X=$O(BGPSUL(X)) Q:X'=+X  D
 ..S $P(BGPEXCT(X,1),U,1)=$P($G(^BGPGPDCN(X,N)),U,P),$P(BGPEXCT(X,1),U,3)=$S($P(BGPEXCT(X,1),U,2):(($P(BGPEXCT(X,1),U,1)/$P(BGPEXCT(X,1),U,2))*100),1:"")
 ..S $P(BGPEXCT(X,2),U,1)=$P($G(^BGPGPDPN(X,N)),U,P),$P(BGPEXCT(X,2),U,3)=$S($P(BGPEXCT(X,2),U,2):(($P(BGPEXCT(X,2),U,1)/$P(BGPEXCT(X,2),U,2))*100),1:"")
 ..S $P(BGPEXCT(X,3),U,1)=$P($G(^BGPGPDBN(X,N)),U,P),$P(BGPEXCT(X,3),U,3)=$S($P(BGPEXCT(X,3),U,2):(($P(BGPEXCT(X,3),U,1)/$P(BGPEXCT(X,3),U,2))*100),1:"")
 .S X=0 F  S X=$O(BGPEXCT(X)) Q:X'=+X  D
 ..S A=$P(BGPEXCT(X,1),U,1),B=$P(BGPEXCT(X,1),U,2),C=$P(BGPEXCT(X,1),U,3)
 ..S D=$P(BGPEXCT(X,2),U,1),E=$P(BGPEXCT(X,2),U,2),F=$P(BGPEXCT(X,2),U,3)
 ..S G=$P(BGPEXCT(X,3),U,1),H=$P(BGPEXCT(X,3),U,2),I=$P(BGPEXCT(X,3),U,3)
 ..I $P($P(^BGPINDNC(BGPPC,0),U,4),".")="023" S Y=$P(^BGPINDNC(BGPPC,12),U,13),$P(BGPEI2(X),U,Y)=$S(B:B,1:0),$P(BGPEI2(X),U,(Y+3))=$S(E:E,1:0),$P(BGPEI2(X),U,(Y+6))=$S(H:H,1:0) Q
 ..I $P($P(^BGPINDNC(BGPPC,0),U,4),".")="014" S Y=$P(^BGPINDNC(BGPPC,12),U,13),$P(BGPEI2(X),U,Y)=$S(B:B,1:0),$P(BGPEI2(X),U,(Y+3))=$S(E:E,1:0),$P(BGPEI2(X),U,(Y+6))=$S(H:H,1:0) Q
 ..I $P($P(^BGPINDNC(BGPPC,0),U,4),".")="016" S Y=$P(^BGPINDNC(BGPPC,12),U,13),$P(BGPEI2(X),U,Y)=$S(B:B,1:0),$P(BGPEI2(X),U,(Y+3))=$S(E:E,1:0),$P(BGPEI2(X),U,(Y+6))=$S(H:H,1:0) Q
 ..I $P($G(^BGPINDNC(BGPPC,19)),U,13) S Y=$P(^BGPINDNC(BGPPC,12),U,13),$P(BGPEI2(X),U,Y)=$S(B:B,1:0),$P(BGPEI2(X),U,(Y+3))=$S(E:E,1:0),$P(BGPEI2(X),U,(Y+6))=$S(H:H,1:0) Q
 ..S Y=$P(^BGPINDNC(BGPPC,12),U,13)
 ..S $P(BGPEI2(X),U,$P(^BGPINDNC(BGPPC,12),U,13))=$S(A:A,1:0),$P(BGPEI2(X),U,(Y+1))=$S(B:B,1:0),$P(BGPEI2(X),U,(Y+2))=$$SL(C)
 ..S $P(BGPEI2(X),U,(Y+3))=$S(D:D,1:0),$P(BGPEI2(X),U,(Y+4))=$S(E:E,1:0),$P(BGPEI2(X),U,(Y+5))=$$SL(F),$P(BGPEI2(X),U,(Y+6))=$S(G:G,1:0),$P(BGPEI2(X),U,(Y+7))=$S(H:H,1:0),$P(BGPEI2(X),U,(Y+8))=$$SL(I)
 I $G(BGPAREAA),$G(BGPEXCEL) D GPRANT3^BGP9DP1D
ONN1 ;
 D ONM1^BGP9DP1D
 Q
SL(V) ;
 I V="" S V=0
 Q $$STRIP^XLFSTR($J(V,5,1)," ")
SETEXA(T,N,P) ;EP - set denominator
 Q:'$G(BGPEXCEL)
 NEW X,Y,Z
 S X=0 F  S X=$O(BGPSUL(X)) Q:X'=+X  D
 .I T=1 S $P(BGPEXCT(X,T),U,2)=$P($G(^BGPGPDCN(X,N)),U,P)
 .I T=2 S $P(BGPEXCT(X,T),U,2)=$P($G(^BGPGPDPN(X,N)),U,P)
 .I T=3 S $P(BGPEXCT(X,T),U,2)=$P($G(^BGPGPDBN(X,N)),U,P)
 Q
V(T,R,N,P,ND) ;EP ;SPDX
 I $G(BGPAREAA) G VA
 NEW X
 I T=1 S X=$P($G(^BGPGPDCN(R,N)),U,P) Q $S(X]"":X,1:0)
 I T=2 S X=$P($G(^BGPGPDPN(R,N)),U,P) Q $S(X]"":X,1:0)
 I T=3 S X=$P($G(^BGPGPDBN(R,N)),U,P) Q $S(X]"":X,1:0)
 Q ""
VA ;
 NEW X,V,C S X=0,C="" F  S X=$O(BGPSUL(X)) Q:X'=+X  D
 .I T=1 S C=C+$P($G(^BGPGPDCN(X,N)),U,P)
 .I T=2 S C=C+$P($G(^BGPGPDPN(X,N)),U,P)
 .I T=3 S C=C+$P($G(^BGPGPDBN(X,N)),U,P)
 .I $G(BGPAREAA),$P($G(^BGPINDNC(BGPPC,14)),U) D  ;SPDX
 ..I T=1 S $P(BGPSDP(X,T),U,ND)=$P($G(^BGPGPDCN(X,N)),U,P) ;SPDX
 ..I T=2 S $P(BGPSDP(X,T),U,ND)=$P($G(^BGPGPDPN(X,N)),U,P) ;SPDX
 ..I T=3 S $P(BGPSDP(X,T),U,ND)=$P($G(^BGPGPDBN(X,N)),U,P) ;SPDX
 .I $G(BGPAREAA),$P($G(^BGPINDNC(BGPPC,15)),U) D  ;SPDX
 ..I T=1 S $P(BGPSDPN(X,T),U,ND)=$P($G(^BGPGPDCN(X,N)),U,P) ;SPDX
 ..I T=2 S $P(BGPSDPN(X,T),U,ND)=$P($G(^BGPGPDPN(X,N)),U,P) ;SPDX
 ..I T=3 S $P(BGPSDPN(X,T),U,ND)=$P($G(^BGPGPDBN(X,N)),U,P) ;SPDX
 .I $G(BGPAREAA),$P($G(^BGPINDNC(BGPPC,19)),U) D  ;SPDX
 ..I T=1 S $P(BGPSDPO(X,T),U,ND)=$P($G(^BGPGPDCN(X,N)),U,P) ;SPDX
 ..I T=2 S $P(BGPSDPO(X,T),U,ND)=$P($G(^BGPGPDPN(X,N)),U,P) ;SPDX
 ..I T=3 S $P(BGPSDPO(X,T),U,ND)=$P($G(^BGPGPDBN(X,N)),U,P) ;SPDX
 .I $G(BGPAREAA),$P($G(^BGPINDNC(BGPPC,22)),U) D  ;SPDX
 ..I T=1 S $P(BGPSDPD(X,T),U,ND)=$P($G(^BGPGPDCN(X,N)),U,P) ;SPDX
 ..I T=2 S $P(BGPSDPD(X,T),U,ND)=$P($G(^BGPGPDPN(X,N)),U,P) ;SPDX
 ..I T=3 S $P(BGPSDPD(X,T),U,ND)=$P($G(^BGPGPDBN(X,N)),U,P) ;SPDX
 .Q
 Q $S(C]"":C,1:0)
C(X,X2,X3) ;
 D COMMA^%DTC
 Q X
SDP ;SDPX
 ;loop thru each BGPSDP and set 3rd piece
 NEW X,Y,T,D,N
 S X=0 F  S X=$O(BGPSDP(X)) Q:X'=+X  D
 .S T=0 F  S T=$O(BGPSDP(X,T)) Q:T'=+T  D
 ..S D=$P(BGPSDP(X,T),U,1),N=$P(BGPSDP(X,T),U,2)
 ..S $P(BGPSDP(X,T),U,3)=$S(D:((N/D)*100),1:"")
 S X=0 F  S X=$O(BGPSDPN(X)) Q:X'=+X  D
 .S T=0 F  S T=$O(BGPSDPN(X,T)) Q:T'=+T  D
 ..S D=$P(BGPSDPN(X,T),U,1),N=$P(BGPSDPN(X,T),U,2)
 ..S $P(BGPSDPN(X,T),U,3)=$S(D:((N/D)*100),1:"")
 S X=0 F  S X=$O(BGPSDPO(X)) Q:X'=+X  D
 .S T=0 F  S T=$O(BGPSDPO(X,T)) Q:T'=+T  D
 ..S D=$P(BGPSDPO(X,T),U,1),N=$P(BGPSDPO(X,T),U,2)
 ..S $P(BGPSDPO(X,T),U,3)=$S(D:((N/D)*100),1:"")
 S X=0 F  S X=$O(BGPSDPD(X)) Q:X'=+X  D
 .S T=0 F  S T=$O(BGPSDPD(X,T)) Q:T'=+T  D
 ..S D=$P(BGPSDPD(X,T),U,1),N=$P(BGPSDPD(X,T),U,2)
 ..S $P(BGPSDPD(X,T),U,3)=$S(D:((N/D)*100),1:"")
 Q
SB(X) ;EP - Strip leading and trailing blanks from X.
 NEW %
 X ^DD("FUNC",$O(^DD("FUNC","B","STRIPBLANKS",0)),1)
 Q X
