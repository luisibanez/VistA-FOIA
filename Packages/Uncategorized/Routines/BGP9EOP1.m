BGP9EOP1 ; IHS/CMI/LAB - EO report print ; 
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
IREG ;EP
 I BGPPTYPE="P",$Y>(BGPIOSL-8) D HEADER^BGP9EOP Q:BGPQUIT
 ;D W^BGP9EOH(^BGPEOMN(BGPIC,53,1,0),0,2,BGPPTYPE)
 D H1^BGP9EOP
 S BGPORDP=$P(^BGPEOMN(BGPIC,0),U,6) F BGPORDP1=1:1:$P(^BGPEOMN(BGPIC,0),U,4) S BGPPC1=BGPORDP_"."_BGPORDP1 Q:BGPQUIT  D PI
 Q
 ;
PI ;EP
 S BGPDENP=0
 S BGPPC2=0 F  S BGPPC2=$O(^BGPEOMIN("AO",BGPPC1,BGPPC2)) Q:BGPPC2=""  S BGPPC=$O(^BGPEOMIN("AO",BGPPC1,BGPPC2,0)) D PI1
 Q
 ;
PI1 ;EP
 K BGPEXCT,BGPSDP,BGPSDPN,BGPSDPO ;SDPX
 S BGPDF=$P(^BGPEOMIN(BGPPC,0),U,4)
 ;get denominator value
 S BGPNP=$P(^DD(90538.1,BGPDF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 S BGPCYD=$$V(1,BGPRPT,N,P,1) I $G(BGPAREAA) D SETEXA(1,N,P) ;SPDX
 S BGPPRD=$$V(2,BGPRPT,N,P,1) I $G(BGPAREAA) D SETEXA(2,N,P) ;SPDX
 S BGPBLD=$$V(3,BGPRPT,N,P,1) I $G(BGPAREAA) D SETEXA(3,N,P) ;SPDX
 ;write out denominator
 I 'BGPDENP D
 .I BGPPTYPE="P",$Y>(BGPIOSL-10) D HEADER^BGP9EOP Q:BGPQUIT  D W^BGP9EOH(^BGPEOMN(BGPIC,53,1,0),0,2,BGPPTYPE) D:$D(^BGPEOMN(BGPIC,53,2,0)) W^BGP9EOH(^BGPEOMN(BGPIC,53,2,0),0,1,BGPPTYPE) D H1^BGP9EOP
 .D W^BGP9EOH($P(^BGPEOMIN(BGPPC,0),U,9),0,2,BGPPTYPE)
 .I $P(^BGPEOMIN(BGPPC,0),U,10)]"" D W^BGP9EOH($P(^BGPEOMIN(BGPPC,0),U,10),0,1,BGPPTYPE)
 .I $P(^BGPEOMIN(BGPPC,0),U,11)]"" D W^BGP9EOH($P(^BGPEOMIN(BGPPC,0),U,11),0,1,BGPPTYPE)
 .I BGPPTYPE="P" D
 ..D W^BGP9EOH($$C(BGPCYD,0,8),0,0,BGPPTYPE,1,20)
 ..D W^BGP9EOH($$C(BGPPRD,0,8),0,0,BGPPTYPE,1,35)
 ..D W^BGP9EOH($$C(BGPBLD,0,8),0,0,BGPPTYPE,1,58)
 ..D W^BGP9EOH("",0,1,BGPPTYPE)
 .I BGPPTYPE="D" D
 ..S Y=BGPCYD_"^^"_BGPPRD_"^^^"_BGPBLD D W^BGP9EOH(Y,0,0,BGPPTYPE,2),W^BGP9EOH(" ",0,1,BGPPTYPE)
 .S BGPDENP=1
 S BGPNF=$P(^BGPEOMIN(BGPPC,0),U,5)  ;numerator field
 S BGPNP=$P(^DD(90538.1,BGPNF,0),U,4),N=$P(BGPNP,";"),P=$P(BGPNP,";",2)
 D SETN
 ;write header
 D W^BGP9EOH($P(^BGPEOMIN(BGPPC,0),U,6),0,1,BGPPTYPE)
 I $P(^BGPEOMIN(BGPPC,0),U,7)]"" D W^BGP9EOH($P(^BGPEOMIN(BGPPC,0),U,7),0,1,BGPPTYPE,1,1)
 I $P(^BGPEOMIN(BGPPC,0),U,8)]"" D W^BGP9EOH($P(^BGPEOMIN(BGPPC,0),U,8),0,1,BGPPTYPE,1,1)
 D H2^BGP9EOP
 Q
 ;
SETN ;EP - set numerator fields
 S BGPCYN=$$V(1,BGPRPT,N,P,2) ;SPDX
 S BGPPRN=$$V(2,BGPRPT,N,P,2) ;SPDX
 S BGPBLN=$$V(3,BGPRPT,N,P,2) ;SPDX
 S BGPCYP=$S(BGPCYD:((BGPCYN/BGPCYD)*100),1:"")
 S BGPPRP=$S(BGPPRD:((BGPPRN/BGPPRD)*100),1:"")
 S BGPBLP=$S(BGPBLD:((BGPBLN/BGPBLD)*100),1:"")
 I $G(BGPAREAA) D SDP
 I $P($G(^BGPEOMIN(BGPPC,14)),U) D
 .S ^TMP($J,"SUMMARY",$P(^BGPSCAT($P(^BGPEOMIN(BGPPC,14),U,5),0),U,4),$P(^BGPEOMIN(BGPPC,14),U,6),BGPPC)=BGPCYP_U_BGPPRP_U_BGPBLP
 .I $G(BGPAREAA) D  ;SDPX
 ..S X=0 F  S X=$O(BGPSDP(X)) Q:X'=+X  D  ;SDPX
 ...S ^TMP($J,"SUMMARY DETAIL PAGE",$P(^BGPSCAT($P(^BGPEOMIN(BGPPC,14),U,5),0),U,4),$P(^BGPEOMIN(BGPPC,14),U,6),BGPPC,X)=$P($G(BGPSDP(X,1)),U,3)_U_$P($G(BGPSDP(X,2)),U,3)_U_$P($G(BGPSDP(X,3)),U,3)_U_$J(BGPCYP,5,1)
 .S ^TMP($J,"SUMMARYDEL",$P(^BGPSCAT($P(^BGPEOMIN(BGPPC,14),U,5),0),U,4),$P(^BGPEOMIN(BGPPC,14),U,6),BGPPC)=$$SB($J(BGPCYP,5,1))_U_$$SB($J(BGPPRP,5,1))_U_$$SB($J(BGPBLP,5,1))
 .I $G(BGPAREAA) D  ;SDPX
 ..S X=0 F  S X=$O(BGPSDP(X)) Q:X'=+X  D  ;SDPX
 ...S A=$P(^BGPSCAT($P(^BGPEOMIN(BGPPC,14),U,5),0),U,4)
 ...S B=$P(^BGPEOMIN(BGPPC,14),U,6)
 ...S ^TMP($J,"SUMMARYDEL DETAIL PAGE",A,B,BGPPC,X)=$$SB($J($P($G(BGPSDP(X,1)),U,3),5,1))_U_$$SB($J($P($G(BGPSDP(X,2)),U,3),5,1))_U_$$SB($J($P($G(BGPSDP(X,3)),U,3),5,1))_U_$$SB($J(BGPCYP,5,1))
 ;
 I BGPPTYPE="D",BGPROT="B" Q
CRSEONT1 ;
 I $G(BGPAREAA),$G(BGPEXCEL) D
 .Q:$P(^BGPEOMIN(BGPPC,0),U,12)=""
 .;set each numerator and percent,then set BGPEI
 .NEW X S X=0 F  S X=$O(BGPSUL(X)) Q:X'=+X  D
 ..S $P(BGPEXCT(X,1),U,1)=$P($G(^BGPEOCN(X,N)),U,P),$P(BGPEXCT(X,1),U,3)=$S($P(BGPEXCT(X,1),U,2):(($P(BGPEXCT(X,1),U,1)/$P(BGPEXCT(X,1),U,2))*100),1:"")
 ..S $P(BGPEXCT(X,2),U,1)=$P($G(^BGPEOPN(X,N)),U,P),$P(BGPEXCT(X,2),U,3)=$S($P(BGPEXCT(X,2),U,2):(($P(BGPEXCT(X,2),U,1)/$P(BGPEXCT(X,2),U,2))*100),1:"")
 ..S $P(BGPEXCT(X,3),U,1)=$P($G(^BGPEOBN(X,N)),U,P),$P(BGPEXCT(X,3),U,3)=$S($P(BGPEXCT(X,3),U,2):(($P(BGPEXCT(X,3),U,1)/$P(BGPEXCT(X,3),U,2))*100),1:"")
 .S X=0 F  S X=$O(BGPEXCT(X)) Q:X'=+X  D
 ..S A=$P(BGPEXCT(X,1),U,1),B=$P(BGPEXCT(X,1),U,2),C=$P(BGPEXCT(X,1),U,3)
 ..S D=$P(BGPEXCT(X,2),U,1),E=$P(BGPEXCT(X,2),U,2),F=$P(BGPEXCT(X,2),U,3)
 ..S G=$P(BGPEXCT(X,3),U,1),H=$P(BGPEXCT(X,3),U,2),I=$P(BGPEXCT(X,3),U,3)
 ..S Y=$P(^BGPEOMIN(BGPPC,0),U,12)
 ..S $P(BGPEI(X),U,$P(^BGPEOMIN(BGPPC,0),U,12))=$S(A:A,1:0),$P(BGPEI(X),U,(Y+1))=$S(B:B,1:0),$P(BGPEI(X),U,(Y+2))=$$SL(C)
 ..S $P(BGPEI(X),U,(Y+3))=$S(D:D,1:0),$P(BGPEI(X),U,(Y+4))=$S(E:E,1:0),$P(BGPEI(X),U,(Y+5))=$$SL(F),$P(BGPEI(X),U,(Y+6))=$S(G:G,1:0),$P(BGPEI(X),U,(Y+7))=$S(H:H,1:0),$P(BGPEI(X),U,(Y+8))=$$SL(I)
 Q
 ;
SL(V) ;
 I V="" S V=0
 Q $$STRIP^XLFSTR($J(V,5,1)," ")
 ;
SETEXA(T,N,P) ;EP - set denominator
 Q:'$G(BGPEXCEL)
 NEW X,Y,Z
 S X=0 F  S X=$O(BGPSUL(X)) Q:X'=+X  D
 .I T=1 S $P(BGPEXCT(X,T),U,2)=$P($G(^BGPEOCN(X,N)),U,P)
 .I T=2 S $P(BGPEXCT(X,T),U,2)=$P($G(^BGPEOPN(X,N)),U,P)
 .I T=3 S $P(BGPEXCT(X,T),U,2)=$P($G(^BGPEOBN(X,N)),U,P)
 Q
 ;
V(T,R,N,P,ND) ;EP ;SPDX
 I $G(BGPAREAA) G VA
 NEW X
 I T=1 S X=$P($G(^BGPEOCN(R,N)),U,P) Q $S(X]"":X,1:0)
 I T=2 S X=$P($G(^BGPEOPN(R,N)),U,P) Q $S(X]"":X,1:0)
 I T=3 S X=$P($G(^BGPEOBN(R,N)),U,P) Q $S(X]"":X,1:0)
 Q ""
VA ;
 NEW X,V,C S X=0,C="" F  S X=$O(BGPSUL(X)) Q:X'=+X  D
 .I T=1 S C=C+$P($G(^BGPEOCN(X,N)),U,P)
 .I T=2 S C=C+$P($G(^BGPEOPN(X,N)),U,P)
 .I T=3 S C=C+$P($G(^BGPEOBN(X,N)),U,P)
 .I $G(BGPAREAA),$P($G(^BGPEOMIN(BGPPC,14)),U) D  ;SPDX
 ..I T=1 S $P(BGPSDP(X,T),U,ND)=$P($G(^BGPEOCN(X,N)),U,P) ;SPDX
 ..I T=2 S $P(BGPSDP(X,T),U,ND)=$P($G(^BGPEOPN(X,N)),U,P) ;SPDX
 ..I T=3 S $P(BGPSDP(X,T),U,ND)=$P($G(^BGPEOBN(X,N)),U,P) ;SPDX
 .I $G(BGPAREAA),$P($G(^BGPEOMIN(BGPPC,15)),U) D  ;SPDX
 ..I T=1 S $P(BGPSDPN(X,T),U,ND)=$P($G(^BGPEOCN(X,N)),U,P) ;SPDX
 ..I T=2 S $P(BGPSDPN(X,T),U,ND)=$P($G(^BGPEOPN(X,N)),U,P) ;SPDX
 ..I T=3 S $P(BGPSDPN(X,T),U,ND)=$P($G(^BGPEOBN(X,N)),U,P) ;SPDX
 .I $G(BGPAREAA),$P($G(^BGPEOMIN(BGPPC,19)),U) D  ;SPDX
 ..I T=1 S $P(BGPSDPO(X,T),U,ND)=$P($G(^BGPEOCN(X,N)),U,P) ;SPDX
 ..I T=2 S $P(BGPSDPO(X,T),U,ND)=$P($G(^BGPEOPN(X,N)),U,P) ;SPDX
 ..I T=3 S $P(BGPSDPO(X,T),U,ND)=$P($G(^BGPEOBN(X,N)),U,P) ;SPDX
 .Q
 Q $S(C]"":C,1:0)
 ;
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
 Q
 ;
SB(X) ;EP - Strip leading and trailing blanks from X.
 NEW %
 X ^DD("FUNC",$O(^DD("FUNC","B","STRIPBLANKS",0)),1)
 Q X
