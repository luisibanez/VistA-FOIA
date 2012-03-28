BGP9DPE2 ; IHS/CMI/LAB - calc measures 29 Apr 2008 7:38 PM 14 Nov 2006 5:02 PM ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
5 ;EP
 Q:'$D(^AUPNVPED("AC",DFN))  ;no education so don't bother
 K BGPALLED S BGPVALUE=""
 K BGPPROVS
 S BGPFYCT=$O(^BGPCTRL("B",2009,0))
 S Y="BGPALLED("
 S X=DFN_"^ALL EDUC;DURING "_$$FMTE^XLFDT(BGPBDATE)_"-"_$$FMTE^XLFDT(BGPEDATE) S E=$$START1^APCLDF(X,Y)
 I '$D(BGPALLED(1)) Q
 S (X,D,G)=0,%="",T="" F  S X=$O(BGPALLED(X)) Q:X'=+X  D
 .S Y=+$P(BGPALLED(X),U,4)
 .S T=$P(^AUPNVPED(+$P(BGPALLED(X),U,4),0),U)
 .Q:'T
 .Q:'$D(^AUTTEDT(T,0))
 .S T=$P(^AUTTEDT(T,0),U,2)
 .I T="" Q
 .Q:'$$EDUALLOW^BGP9DPE1(BGPFYCT,T)
 .;Q:'$D(^BGPCTRL(BGPFYCT,62,"B",T))  ;not an official topic per Chris Lamer's spreadsheet
 .Q:$P(^AUPNVPED(Y,0),U,5)=""  ;SKIP IF NO PROVIDER DOCUMENTED
 .S P=$P(^AUPNVPED(Y,0),U,5)
 .S D=$P($G(^VA(200,P,"PS")),U,5)
 .I 'D Q  ;no discipline to tally
 .S BGPT=$P($G(^DIC(7,D,9999999)),U,1)
 .Q:BGPT=""  ;not standard
 .S BGPT1=$P(^DIC(7,D,0),U,1)
 .D S(BGPRPT,BGPGBL,11,10,1)  ;add to total # of topics
 .I BGPTIME=1 D SET51
 .I BGPTIME=2 D SET52
 .I BGPTIME=3 D SET53
 .;set PROVS For this patient
 .S BGPPROVS(BGPT1)=$G(BGPPROVS(BGPT1))+1
 Q:'$D(BGPPROVS)
 S BGPVALUE=""
 S X="" F  S X=$O(BGPPROVS(X)) Q:X=""  S BGPVALUE=BGPVALUE_$S(BGPVALUE]"":";",1:"")_X_"-"_BGPPROVS(X)
 D SETLIST
 Q
SET51 ;
 I '$D(^BGPPEDCN(BGPRPT,15,0)) S ^BGPPEDCN(BGPRPT,15,0)="^90536.1215A^0^0"
 S Z=$O(^BGPPEDCN(BGPRPT,15,"B",BGPT,0)) I Z D  Q
 .S $P(^BGPPEDCN(BGPRPT,15,Z,0),U,3)=$P(^BGPPEDCN(BGPRPT,15,Z,0),U,3)+1
 S Z=$P(^BGPPEDCN(BGPRPT,15,0),U,3)+1,$P(^BGPPEDCN(BGPRPT,15,0),U,3)=Z,$P(^BGPPEDCN(BGPRPT,15,0),U,4)=Z
 S ^BGPPEDCN(BGPRPT,15,Z,0)=BGPT_U_BGPT1_U_1
 S ^BGPPEDCN(BGPRPT,15,"B",BGPT,Z)=""
 Q
SET52 ;
 I '$D(^BGPPEDPN(BGPRPT,15,0)) S ^BGPPEDPN(BGPRPT,15,0)="^90536.1315A^0^0"
 S Z=$O(^BGPPEDPN(BGPRPT,15,"B",BGPT,0)) I Z D  Q
 .S $P(^BGPPEDPN(BGPRPT,15,Z,0),U,3)=$P(^BGPPEDPN(BGPRPT,15,Z,0),U,3)+1
 S Z=$P(^BGPPEDPN(BGPRPT,15,0),U,3)+1,$P(^BGPPEDPN(BGPRPT,15,0),U,3)=Z,$P(^BGPPEDPN(BGPRPT,15,0),U,4)=Z
 S ^BGPPEDPN(BGPRPT,15,Z,0)=BGPT_U_BGPT1_U_1
 S ^BGPPEDPN(BGPRPT,15,"B",BGPT,Z)=""
 Q
SET53 ;
 I '$D(^BGPPEDBN(BGPRPT,15,0)) S ^BGPPEDBN(BGPRPT,15,0)="^90536.1515A^0^0"
 S Z=$O(^BGPPEDBN(BGPRPT,15,"B",BGPT,0)) I Z D  Q
 .S $P(^BGPPEDBN(BGPRPT,15,Z,0),U,3)=$P(^BGPPEDBN(BGPRPT,15,Z,0),U,3)+1
 S Z=$P(^BGPPEDBN(BGPRPT,15,0),U,3)+1,$P(^BGPPEDBN(BGPRPT,15,0),U,3)=Z,$P(^BGPPEDBN(BGPRPT,15,0),U,4)=Z
 S ^BGPPEDBN(BGPRPT,15,Z,0)=BGPT_U_BGPT1_U_1
 S ^BGPPEDBN(BGPRPT,15,"B",BGPT,Z)=""
 Q
6 ;EP
 Q:'$D(^AUPNVPED("AC",DFN))  ;no education so don't bother
 K BGPALLED S BGPVALUE=""
 K BGPPROVS
 S BGPFYCT=$O(^BGPCTRL("B",2009,0))
 S Y="BGPALLED("
 S X=DFN_"^ALL EDUC;DURING "_$$FMTE^XLFDT(BGPBDATE)_"-"_$$FMTE^XLFDT(BGPEDATE) S E=$$START1^APCLDF(X,Y)
 I '$D(BGPALLED(1)) Q
 S (X,D,G)=0,%="",T="" F  S X=$O(BGPALLED(X)) Q:X'=+X  D
 .S Y=+$P(BGPALLED(X),U,4)
 .S T=$P(^AUPNVPED(+$P(BGPALLED(X),U,4),0),U)
 .Q:'T
 .Q:'$D(^AUTTEDT(T,0))
 .S T=$P(^AUTTEDT(T,0),U,2)
 .I T="" Q
 .Q:'$$EDUALLOW^BGP9DPE1(BGPFYCT,T)
 .;Q:'$D(^BGPCTRL(BGPFYCT,62,"B",T))  ;not an official topic per Chris Lamer's spreadsheet
 .D S(BGPRPT,BGPGBL,11,12,1)  ;add to total # of topics
 .S BGPLEVEL=$P(^AUPNVPED(Y,0),U,6)
 .I BGPLEVEL=1 D S(BGPRPT,BGPGBL,11,13,1)
 .I BGPLEVEL=2 D S(BGPRPT,BGPGBL,11,14,1)
 .I BGPLEVEL=3 D S(BGPRPT,BGPGBL,11,15,1)
 .I BGPLEVEL=5 D S(BGPRPT,BGPGBL,11,16,1)
 .I BGPLEVEL=4 D S(BGPRPT,BGPGBL,11,17,1)
 .I BGPLEVEL="" D S(BGPRPT,BGPGBL,11,18,1)
 .;set PROVS For this patient
 .I BGPLEVEL="" S BGPLEVEL="BLANK"
 .S BGPPROVS(BGPLEVEL)=$G(BGPPROVS(BGPLEVEL))+1
 Q:'$D(BGPPROVS)
 S BGPVALUE=""
 S X="" F  S X=$O(BGPPROVS(X)) Q:X=""  S BGPVALUE=BGPVALUE_$S(BGPVALUE]"":";",1:"")_$S(X:$$EXTSET^XBFUNC(9000010.16,.06,X),1:"BLANK-NOT RECORDED")_"-"_BGPPROVS(X)
 D SETLIST
 Q
 ;
7 ;EP
 Q:'$D(^AUPNVPED("AC",DFN))  ;no education so don't bother
 K BGPALLED S BGPVALUE=""
 K BGPPROVS
 S BGPFYCT=$O(^BGPCTRL("B",2009,0))
 S Y="BGPALLED("
 S X=DFN_"^ALL EDUC;DURING "_$$FMTE^XLFDT(BGPBDATE)_"-"_$$FMTE^XLFDT(BGPEDATE) S E=$$START1^APCLDF(X,Y)
 I '$D(BGPALLED(1)) Q
 S (X,D,G)=0,%="",T="" F  S X=$O(BGPALLED(X)) Q:X'=+X  D
 .S Y=+$P(BGPALLED(X),U,4)
 .S T=$P(^AUPNVPED(+$P(BGPALLED(X),U,4),0),U)
 .Q:'T
 .Q:'$D(^AUTTEDT(T,0))
 .S T=$P(^AUTTEDT(T,0),U,2)
 .I T="" Q
 .Q:'$$EDUALLOW^BGP9DPE1(BGPFYCT,T)
 .S G=1
 .S BGPLEVEL=$P(^AUPNVPED(Y,0),U,13)
 .Q:BGPLEVEL=""
 .S BGPPROVS(BGPLEVEL)=$G(BGPPROVS(BGPLEVEL))+1   ;count up 
 .;get provider
 .S R="",R=$P(^AUPNVPED(Y,0),U,5) D
 ..Q:R]""
 ..S R=$P($G(^AUPNVPED(Y,12)),U,2)
 ..Q:R]""
 ..S R=$P($G(^AUPNVPED(Y,12)),U,4)
 ..Q:R]""
 ..S R=$$PRIMPROV^APCLV($P(^AUPNVPED(Y,0),U,3),"I")
 .I R D
 ..S D=$$VALI^XBDIQ1(200,R,53.5)
 ..S D=$S(D:$$VAL^XBDIQ1(7,D,9999999.01),1:"")
 ..I D="" S D="??"
 ..S BGPPROVS(BGPLEVEL,"PROVS")=$G(BGPPROVS(BGPLEVEL,"PROVS"))_"; "_$$VAL^XBDIQ1(200,R,.01)_"-"_D
 ;
 S BGPVALUE=""
 I 'G Q  ;no allowable topics
 D S(BGPRPT,BGPGBL,11,19,1)  ;add to total # of patients with a topic
 Q:'$D(BGPPROVS)
 I $G(BGPPROVS("GS")) D S(BGPRPT,BGPGBL,11,20,1) S BGPVALUE="GS"_$G(BGPPROVS("GS","PROVS"))
 I $G(BGPPROVS("GNS")),'$G(BGPPROVS("GS")) D S(BGPRPT,BGPGBL,11,21,1) S BGPVALUE=BGPVALUE_$S(BGPVALUE]"":", ",1:"")_"GNS"_$G(BGPPROVS("GNS","PROVS"))
 I $G(BGPPROVS("GM")) D S(BGPRPT,BGPGBL,11,22,1) S BGPVALUE=BGPVALUE_$S(BGPVALUE]"":", ",1:"")_"GM"_$G(BGPPROVS("GM","PROVS"))
 I $G(BGPPROVS("GNM")),'$G(BGPPROVS("GM")) D S(BGPRPT,BGPGBL,11,23,1) S BGPVALUE=BGPVALUE_$S(BGPVALUE]"":", ",1:"")_"GNM"_$G(BGPPROVS("GNM","PROVS"))
 D SETLIST
 Q
S(R,G,N,P,V,J) ;
 I 'V Q  ;no value to add 
 I $G(J) S $P(@(G_R_","_N_")"),U,P)=$P($G(@(G_R_","_N_")")),U,P)=V Q
 S $P(@(G_R_","_N_")"),U,P)=$P($G(@(G_R_","_N_")")),U,P)+V
 Q
 ;
SETLIST ;
 Q:'$D(BGPLIST(BGPIC))
 Q:BGPTIME'=1
 I BGPLIST="P",$P(^AUPNPAT(DFN,0),U,14)'=BGPLPRV Q
 S BGPLIST(BGPIC)=$G(BGPLIST(BGPIC))+1
 S ^XTMP("BGP9PE",BGPJ,BGPH,"LIST",BGPIC,$S($P($G(^AUPNPAT(DFN,11)),U,18)]"":$P(^AUPNPAT(DFN,11),U,18),1:"UNKNOWN"),$P(^DPT(DFN,0),U,2),BGPAGEB,DFN)=$G(BGPVALUE)
 Q
