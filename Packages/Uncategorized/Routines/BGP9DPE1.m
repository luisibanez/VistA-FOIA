BGP9DPE1 ; IHS/CMI/LAB - calc measures 29 Apr 2008 7:38 PM 14 Nov 2006 5:02 PM ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
PROC ;EP
 S BGPBT=$H
 D JRNL
 S BGPJ=$J,BGPH=$H
 D XTMP^BGP9UTL("BGP9PE","CRS PT ED Patient List")
 S BGPCHSO=$P($G(^BGPSITE(DUZ(2),0)),U,6)
 ;calculate 3 years before end of each time frame
 S BGP3YE=$$FMADD^XLFDT(BGPED,-1096)
 S BGPP3YE=$$FMADD^XLFDT(BGPPED,-1096)
 S BGPB3YE=$$FMADD^XLFDT(BGPBED,-1096)
 ;process each patient
 S DFN=0 F  S DFN=$O(^AUPNPAT(DFN)) Q:DFN'=+DFN  D
 .Q:'$D(^DPT(DFN,0))
 .I $G(BGPSEAT) G N
 .Q:$P($G(^DPT(DFN,0)),U)["DEMO,PATIENT"
 .I $P($G(^BGPSITE(DUZ(2),0)),U,12) Q:$D(^DIBT($P(^BGPSITE(DUZ(2),0),U,12),1,DFN))
N .;
 .I $G(BGPSEAT) Q:'$D(^DIBT(BGPSEAT,1,DFN))
 .D PROCCY,PROCPY,PROCBY
 S BGPET=$H
 Q
EDUALLOW(Y,T) ;EP - is this a valid topic?
 I $G(T)="" Q ""
 I $G(Y)="" Q ""
 I $D(^BGPCTRL(Y,62,"B",T)) Q 1
 NEW D
 S D=$P(T,"-")
 I $P($$ICDDX^ICDCODE(D),U)'=-1 Q 1
 Q ""
 ;
ICDMAP(Y,T) ;EP - CAN THIS ICD CODE BE MAPPED TO A CATEGORY, IF YES, RETURN CATEGORY
 I $G(T)="" Q ""
 I $G(Y)="" Q ""
 NEW C,X,G,Z,L,E,F,S
 S G="",X=0
 F  S X=$O(^BGPCTRL(Y,63,X)) Q:X'=+X!(G]"")  D
 .S Z=0 F  S Z=$O(^BGPCTRL(Y,63,X,11,Z)) Q:Z'=+Z!(G]"")  D
 ..S C=$P(^BGPCTRL(Y,63,X,11,Z,0),U),L=$P(^BGPCTRL(Y,63,X,11,Z,0),U,2),E=$P(^BGPCTRL(Y,63,X,11,Z,0),U,3)
 ..I C["-" D  Q
 ...S F=$P(C,"-",1),S=$P(C,"-",2)
 ...I 'E,$E(T,1,L)'<$E(F,1,L),$E(T,1,L)'>$E(S,1,L) S G=$P(^BGPCTRL(Y,63,X,0),U,2) Q
 ...I E,$L(F)=$L(T),$E(T,1,L)'<$E(F,1,L),$E(T,1,L)'>$E(S,1,L) S G=$P(^BGPCTRL(Y,63,X,0),U,2) Q
 ..I 'E,$E(T,1,L)=$E(C,1,L) S G=$P(^BGPCTRL(Y,63,X,0),U,2) Q
 ..I E,$E(T,1,L)=$E(C,1,L),$L(C)=$L(T) S G=$P(^BGPCTRL(Y,63,X,0),U,2)
 ..Q
 .Q
 Q G
CAT(C) ;
 NEW X
 I $G(C)="" Q C
 S X=$O(^APCDEDCV("C",C,0))
 I X="" Q C
 Q $P(^APCDEDCV(X,0),U)
 ;
JRNL ;
 N (DT,U,ZTQUEUED) S %=$$NOJOURN^ZIBGCHAR("BGPPEDCN"),%=$$NOJOURN^ZIBGCHAR("BGPPEDPN"),%=$$NOJOURN^ZIBGCHAR("BGPPEDBN")
 S %=$$NOJOURN^ZIBGCHAR("BGPDATA"),%=$$NOJOURN^ZIBGCHAR("BGPGUI")
 Q
PROCCY ;current time period
 K ^TMP($J)
 S (BGPACTUP,BGPACTCL)=""
 Q:'$D(^DPT(DFN,0))
 Q:$P(^DPT(DFN,0),U,2)=""
 Q:"FM"'[$P(^DPT(DFN,0),U,2)
 S BGPEDATE=BGPED,BGPTIME=1,BGPBDATE=BGPBD,BGPGBL="^BGPPEDCN("
 S BGP365=BGPBDATE
 I '$G(BGPSEAT) S BGPACTUP=$$ACTUP(DFN,BGP3YE,BGPEDATE,BGPTAXI,BGPBEN) ;user pop
 I $G(BGPSEAT) S BGPACTUP=1
 I 'BGPACTUP Q
 S BGPAGEB=$$AGE^AUPNPAT(DFN,BGPBDATE)
 S BGPAGEE=$$AGE^AUPNPAT(DFN,BGPEDATE)
 S BGPSEX=$P(^DPT(DFN,0),U,2)
 D CALCIND
 K ^TMP($J,"A")
 Q
PROCPY ;
 K ^TMP($J)
 S (BGPACTUP,BGPACTCL)=""
 Q:'$D(^DPT(DFN,0))
 Q:$P(^DPT(DFN,0),U,2)=""
 Q:"FM"'[$P(^DPT(DFN,0),U,2)
 S BGPEDATE=BGPPED,BGPTIME=2,BGPBDATE=BGPPBD,BGPGBL="^BGPPEDPN("
 S BGP365=BGPBDATE
 ;S BGPACTUP=$$ACTUP(DFN,BGPP3YE,BGPEDATE,BGPTAXI,BGPBEN) ;user pop
 I '$G(BGPSEAT) S BGPACTUP=$$ACTUP(DFN,BGPP3YE,BGPEDATE,BGPTAXI,BGPBEN) ;user pop
 I $G(BGPSEAT) S BGPACTUP=1
 I 'BGPACTUP Q  ;if not in user pop, don't use patient
 S BGPAGEB=$$AGE^AUPNPAT(DFN,BGPBDATE)
 S BGPAGEE=$$AGE^AUPNPAT(DFN,BGPEDATE)
 S BGPSEX=$P(^DPT(DFN,0),U,2)
 D CALCIND
 K ^TMP($J)
 Q
PROCBY ;
 K ^TMP($J)
 S (BGPACTUP,BGPACTCL)=""
 Q:'$D(^DPT(DFN,0))
 Q:$P(^DPT(DFN,0),U,2)=""
 Q:"FM"'[$P(^DPT(DFN,0),U,2)
 S BGPEDATE=BGPBED,BGPTIME=3,BGPBDATE=BGPBBD,BGPGBL="^BGPPEDBN("
 S BGP365=BGPBDATE
 I '$G(BGPSEAT) S BGPACTUP=$$ACTUP(DFN,BGPB3YE,BGPEDATE,BGPTAXI,BGPBEN) ;user pop
 I $G(BGPSEAT) S BGPACTUP=1
 I 'BGPACTUP Q  ;if not in user pop, don't use patient
 S BGPAGEB=$$AGE^AUPNPAT(DFN,BGPBDATE)
 S BGPAGEE=$$AGE^AUPNPAT(DFN,BGPEDATE)
 S BGPSEX=$P(^DPT(DFN,0),U,2)
 D CALCIND
 K ^TMP($J)
 Q
CALCIND ;
 S BGPIC=0 F  S BGPIC=$O(BGPIND(BGPIC)) Q:BGPIC'=+BGPIC  D @BGPIC
 Q
1 ;
 S N=11,P=1 D S(BGPRPT,BGPGBL,N,P,1)  ;set user pop total
 S (BGPPEUP,BGPPEUPW)=""
 Q:'$D(^AUPNVPED("AC",DFN))  ;no education so don't bother
 K BGPALLED
 S BGPFYCT=$O(^BGPCTRL("B",2009,0))
 S Y="BGPALLED("
 S X=DFN_"^ALL EDUC;DURING "_$$FMTE^XLFDT(BGPBDATE)_"-"_$$FMTE^XLFDT(BGPEDATE) S E=$$START1^APCLDF(X,Y)
 I '$D(BGPALLED(1)) Q
 S (X,D,G)=0,%="",T="" F  S X=$O(BGPALLED(X)) Q:X'=+X!(G)  D
 .S T=$P(^AUPNVPED(+$P(BGPALLED(X),U,4),0),U)
 .Q:'T
 .Q:'$D(^AUTTEDT(T,0))
 .S T=$P(^AUTTEDT(T,0),U,2)
 .I T="" Q
 .Q:'$$EDUALLOW(BGPFYCT,T)
 .;Q:'$D(^BGPCTRL(BGPFYCT,62,"B",T))  ;not an official topic per Chris Lamer's spreadsheet
 .S G=1  ;patient had 1 topic
 I G S N=11,P=2 D S(BGPRPT,BGPGBL,N,P,1) S BGPVALUE="Received Education" D SETLIST  ;set # w/education total
 Q
2 ;
 Q:'$D(^AUPNVPED("AC",DFN))  ;no education so don't bother
 K BGPALLED S BGPVALUE=""
 K BGPPROVS
 S BGPFYCT=$O(^BGPCTRL("B",2009,0))
 S Y="BGPALLED("
 S X=DFN_"^ALL EDUC;DURING "_$$FMTE^XLFDT(BGPBDATE)_"-"_$$FMTE^XLFDT(BGPEDATE) S E=$$START1^APCLDF(X,Y)
 I '$D(BGPALLED(1)) Q
 S (X,D,G)=0,%="",T="" F  S X=$O(BGPALLED(X)) Q:X'=+X!(G)  D
 .S Y=+$P(BGPALLED(X),U,4)
 .S T=$P(^AUPNVPED(+$P(BGPALLED(X),U,4),0),U)
 .Q:'T
 .Q:'$D(^AUTTEDT(T,0))
 .S T=$P(^AUTTEDT(T,0),U,2)
 .I T="" Q
 .Q:'$$EDUALLOW(BGPFYCT,T)
 .;Q:'$D(^BGPCTRL(BGPFYCT,62,"B",T))  ;not an official topic per Chris Lamer's spreadsheet
 .Q:'$P(^AUPNVPED(Y,0),U,8)  ;SKIP IF NO MINUTES
 .Q:$P(^AUPNVPED(Y,0),U,5)=""  ;SKIP IF NO PROVIDER DOCUMENTED
 .S P=$P(^AUPNVPED(Y,0),U,5)
 .S D=$P($G(^VA(200,P,"PS")),U,5)
 .I 'D Q  ;no discipline to tally
 .S D=$P($G(^DIC(7,D,9999999)),U,1)
 .I D="" Q  ;not standard
 .;add to total # of topics
 .D S(BGPRPT,BGPGBL,11,6,1)  ;add to total # of topics
 .S M=$P(^AUPNVPED(Y,0),U,8)  ;MINUTES
 .D SMIN(BGPRPT,BGPGBL,11,4,M)
 .D SMAX(BGPRPT,BGPGBL,11,5,M)
 .D S(BGPRPT,BGPGBL,11,7,M)
 .S E=$O(^DIC(7,"D",D,0)),N=$P(^DIC(7,E,0),U)
 .I BGPTIME=1 D SET21
 .I BGPTIME=2 D SET22
 .I BGPTIME=3 D SET23
 .;set PROVS For this patient
 .S BGPPROVS(N)=$G(BGPPROVS(N))+M
 Q:'$D(BGPPROVS)
 S BGPVALUE=""
 S X="" F  S X=$O(BGPPROVS(X)) Q:X=""  S BGPVALUE=BGPVALUE_$S(BGPVALUE]"":";",1:"")_X_"-"_BGPPROVS(X)
 D SETLIST
 Q
SET21 ;
 I $P($G(^BGPPEDCN(BGPRPT,11)),U,6) S $P(^BGPPEDCN(BGPRPT,11),U,3)=$P(^BGPPEDCN(BGPRPT,11),U,7)/$P(^BGPPEDCN(BGPRPT,11),U,6)
 I '$D(^BGPPEDCN(BGPRPT,12,0)) S ^BGPPEDCN(BGPRPT,12,0)="^90536.1212A^0^0"
 S Z=$O(^BGPPEDCN(BGPRPT,12,"B",D,0)) I Z D  Q
 .S $P(^BGPPEDCN(BGPRPT,12,Z,0),U,3)=$P(^BGPPEDCN(BGPRPT,12,Z,0),U,3)+M
 S Z=$P(^BGPPEDCN(BGPRPT,12,0),U,3)+1,$P(^BGPPEDCN(BGPRPT,12,0),U,3)=Z,$P(^BGPPEDCN(BGPRPT,12,0),U,4)=Z
 S ^BGPPEDCN(BGPRPT,12,Z,0)=D_U_N_U_M
 S ^BGPPEDCN(BGPRPT,12,"B",D,Z)=""
 Q
SET22 ;
 I $P($G(^BGPPEDPN(BGPRPT,11)),U,6) S $P(^BGPPEDPN(BGPRPT,11),U,3)=$P(^BGPPEDPN(BGPRPT,11),U,7)/$P(^BGPPEDPN(BGPRPT,11),U,6)
 I '$D(^BGPPEDPN(BGPRPT,12,0)) S ^BGPPEDPN(BGPRPT,12,0)="^90536.1312A^0^0"
 S Z=$O(^BGPPEDPN(BGPRPT,12,"B",D,0)) I Z D  Q
 .S $P(^BGPPEDPN(BGPRPT,12,Z,0),U,3)=$P(^BGPPEDPN(BGPRPT,12,Z,0),U,3)+M
 S Z=$P(^BGPPEDPN(BGPRPT,12,0),U,3)+1,$P(^BGPPEDPN(BGPRPT,12,0),U,3)=Z,$P(^BGPPEDPN(BGPRPT,12,0),U,4)=Z
 S ^BGPPEDPN(BGPRPT,12,Z,0)=D_U_N_U_M
 S ^BGPPEDPN(BGPRPT,12,"B",D,Z)=""
 Q
SET23 ;
 I $P($G(^BGPPEDBN(BGPRPT,11)),U,6) S $P(^BGPPEDBN(BGPRPT,11),U,3)=$P(^BGPPEDBN(BGPRPT,11),U,7)/$P(^BGPPEDBN(BGPRPT,11),U,6)
 I '$D(^BGPPEDBN(BGPRPT,12,0)) S ^BGPPEDBN(BGPRPT,12,0)="^90536.1412A^0^0"
 S Z=$O(^BGPPEDBN(BGPRPT,12,"B",D,0)) I Z D  Q
 .S $P(^BGPPEDBN(BGPRPT,12,Z,0),U,3)=$P(^BGPPEDBN(BGPRPT,12,Z,0),U,3)+M
 S Z=$P(^BGPPEDBN(BGPRPT,12,0),U,3)+1,$P(^BGPPEDBN(BGPRPT,12,0),U,3)=Z,$P(^BGPPEDBN(BGPRPT,12,0),U,4)=Z
 S ^BGPPEDBN(BGPRPT,12,Z,0)=D_U_N_U_M
 S ^BGPPEDBN(BGPRPT,12,"B",D,Z)=""
 Q
3 ;
 Q:'$D(^AUPNVPED("AC",DFN))  ;no education so don't bother
 K BGPALLED S BGPVALUE=""
 K BGPPROVS
 S BGPFYCT=$O(^BGPCTRL("B",2009,0))
 S Y="BGPALLED("
 S X=DFN_"^ALL EDUC;DURING "_$$FMTE^XLFDT(BGPBDATE)_"-"_$$FMTE^XLFDT(BGPEDATE) S E=$$START1^APCLDF(X,Y)
 I '$D(BGPALLED(1)) Q
 S (X,D,G)=0,%="",T="" F  S X=$O(BGPALLED(X)) Q:X'=+X!(G)  D
 .S Y=+$P(BGPALLED(X),U,4)
 .S T=$P(^AUPNVPED(+$P(BGPALLED(X),U,4),0),U)
 .Q:'T
 .Q:'$D(^AUTTEDT(T,0))
 .S T=$P(^AUTTEDT(T,0),U,2)
 .I T="" Q
 .Q:'$$EDUALLOW(BGPFYCT,T)
 .;Q:'$D(^BGPCTRL(BGPFYCT,62,"B",T))  ;not an official topic per Chris Lamer's spreadsheet
 .S BGPS=$O(^BGPCTRL(BGPFYCT,62,"B",T,0))
 .;add to total # of topics
 .S BGPT=$P(T,"-")  ;dx is first piece
 .I BGPS S BGPT1=$P(^BGPCTRL(BGPFYCT,62,BGPS,0),U,2)
 .I 'BGPS S BGPT1=$$ICDMAP(BGPFYCT,BGPT)
 .I BGPT1="" S BGPT1=BGPT
 .D S(BGPRPT,BGPGBL,11,8,1)  ;add to total # of topics
 .I BGPTIME=1 D SET31
 .I BGPTIME=2 D SET32
 .I BGPTIME=3 D SET33
 .;set PROVS For this patient
 .S BGPPROVS(BGPT1)=$G(BGPPROVS(BGPT1))+1
 Q:'$D(BGPPROVS)
 S BGPVALUE=""
 S X="" F  S X=$O(BGPPROVS(X)) Q:X=""  S BGPVALUE=BGPVALUE_$S(BGPVALUE]"":";",1:"")_X_"-"_BGPPROVS(X)
 D SETLIST
 Q
SET31 ;
 I '$D(^BGPPEDCN(BGPRPT,13,0)) S ^BGPPEDCN(BGPRPT,13,0)="^90536.1213A^0^0"
 S Z=$O(^BGPPEDCN(BGPRPT,13,"B",BGPT,0)) I Z D  Q
 .S $P(^BGPPEDCN(BGPRPT,13,Z,0),U,3)=$P(^BGPPEDCN(BGPRPT,13,Z,0),U,3)+1
 S Z=$P(^BGPPEDCN(BGPRPT,13,0),U,3)+1,$P(^BGPPEDCN(BGPRPT,13,0),U,3)=Z,$P(^BGPPEDCN(BGPRPT,13,0),U,4)=Z
 S ^BGPPEDCN(BGPRPT,13,Z,0)=BGPT_U_BGPT1_U_1
 S ^BGPPEDCN(BGPRPT,13,"B",BGPT,Z)=""
 Q
SET32 ;
 I '$D(^BGPPEDPN(BGPRPT,13,0)) S ^BGPPEDPN(BGPRPT,13,0)="^90536.1313A^0^0"
 S Z=$O(^BGPPEDPN(BGPRPT,13,"B",BGPT,0)) I Z D  Q
 .S $P(^BGPPEDPN(BGPRPT,13,Z,0),U,3)=$P(^BGPPEDPN(BGPRPT,13,Z,0),U,3)+1
 S Z=$P(^BGPPEDPN(BGPRPT,13,0),U,3)+1,$P(^BGPPEDPN(BGPRPT,13,0),U,3)=Z,$P(^BGPPEDPN(BGPRPT,13,0),U,4)=Z
 S ^BGPPEDPN(BGPRPT,13,Z,0)=BGPT_U_BGPT1_U_1
 S ^BGPPEDPN(BGPRPT,13,"B",BGPT,Z)=""
 Q
SET33 ;
 I '$D(^BGPPEDBN(BGPRPT,13,0)) S ^BGPPEDBN(BGPRPT,13,0)="^90536.1413A^0^0"
 S Z=$O(^BGPPEDBN(BGPRPT,13,"B",BGPT,0)) I Z D  Q
 .S $P(^BGPPEDBN(BGPRPT,13,Z,0),U,3)=$P(^BGPPEDBN(BGPRPT,13,Z,0),U,3)+1
 S Z=$P(^BGPPEDBN(BGPRPT,13,0),U,3)+1,$P(^BGPPEDBN(BGPRPT,13,0),U,3)=Z,$P(^BGPPEDBN(BGPRPT,13,0),U,4)=Z
 S ^BGPPEDBN(BGPRPT,13,Z,0)=BGPT_U_BGPT1_U_1
 S ^BGPPEDBN(BGPRPT,13,"B",BGPT,Z)=""
 Q
4 ;
 Q:'$D(^AUPNVPED("AC",DFN))  ;no education so don't bother
 K BGPALLED S BGPVALUE=""
 K BGPPROVS
 S BGPFYCT=$O(^BGPCTRL("B",2009,0))
 S Y="BGPALLED("
 S X=DFN_"^ALL EDUC;DURING "_$$FMTE^XLFDT(BGPBDATE)_"-"_$$FMTE^XLFDT(BGPEDATE) S E=$$START1^APCLDF(X,Y)
 I '$D(BGPALLED(1)) Q
 S (X,D,G)=0,%="",T="" F  S X=$O(BGPALLED(X)) Q:X'=+X!(G)  D
 .S Y=+$P(BGPALLED(X),U,4)
 .S T=$P(^AUPNVPED(+$P(BGPALLED(X),U,4),0),U)
 .Q:'T
 .Q:'$D(^AUTTEDT(T,0))
 .S T=$P(^AUTTEDT(T,0),U,2)
 .I T="" Q
 .Q:'$$EDUALLOW(BGPFYCT,T)
 .;Q:'$D(^BGPCTRL(BGPFYCT,62,"B",T))  ;not an official topic per Chris Lamer's spreadsheet
 .S BGPS=$O(^BGPCTRL(BGPFYCT,62,"B",T,0))
 .;add to total # of topics
 .S BGPT=$P(T,"-",2)  ;dx is first piece
 .I BGPS S BGPT1=$P(^BGPCTRL(BGPFYCT,62,BGPS,0),U,3)
 .I 'BGPS S BGPT1=$$CAT(BGPT)
 .D S(BGPRPT,BGPGBL,11,9,1)  ;add to total # of topics
 .I BGPTIME=1 D SET41
 .I BGPTIME=2 D SET42
 .I BGPTIME=3 D SET43
 .;set PROVS For this patient
 .S BGPPROVS(BGPT1)=$G(BGPPROVS(BGPT1))+1
 Q:'$D(BGPPROVS)
 S BGPVALUE=""
 S X="" F  S X=$O(BGPPROVS(X)) Q:X=""  S BGPVALUE=BGPVALUE_$S(BGPVALUE]"":";",1:"")_X_"-"_BGPPROVS(X)
 D SETLIST
 Q
SET41 ;
 I '$D(^BGPPEDCN(BGPRPT,14,0)) S ^BGPPEDCN(BGPRPT,14,0)="^90536.1214A^0^0"
 S Z=$O(^BGPPEDCN(BGPRPT,14,"B",BGPT,0)) I Z D  Q
 .S $P(^BGPPEDCN(BGPRPT,14,Z,0),U,3)=$P(^BGPPEDCN(BGPRPT,14,Z,0),U,3)+1
 S Z=$P(^BGPPEDCN(BGPRPT,14,0),U,3)+1,$P(^BGPPEDCN(BGPRPT,14,0),U,3)=Z,$P(^BGPPEDCN(BGPRPT,14,0),U,4)=Z
 S ^BGPPEDCN(BGPRPT,14,Z,0)=BGPT_U_BGPT1_U_1
 S ^BGPPEDCN(BGPRPT,14,"B",BGPT,Z)=""
 Q
SET42 ;
 I '$D(^BGPPEDPN(BGPRPT,14,0)) S ^BGPPEDPN(BGPRPT,14,0)="^90536.1314A^0^0"
 S Z=$O(^BGPPEDPN(BGPRPT,14,"B",BGPT,0)) I Z D  Q
 .S $P(^BGPPEDPN(BGPRPT,14,Z,0),U,3)=$P(^BGPPEDPN(BGPRPT,14,Z,0),U,3)+1
 S Z=$P(^BGPPEDPN(BGPRPT,14,0),U,3)+1,$P(^BGPPEDPN(BGPRPT,14,0),U,3)=Z,$P(^BGPPEDPN(BGPRPT,14,0),U,4)=Z
 S ^BGPPEDPN(BGPRPT,14,Z,0)=BGPT_U_BGPT1_U_1
 S ^BGPPEDPN(BGPRPT,14,"B",BGPT,Z)=""
 Q
SET43 ;
 I '$D(^BGPPEDBN(BGPRPT,14,0)) S ^BGPPEDBN(BGPRPT,14,0)="^90536.1414A^0^0"
 S Z=$O(^BGPPEDBN(BGPRPT,14,"B",BGPT,0)) I Z D  Q
 .S $P(^BGPPEDBN(BGPRPT,14,Z,0),U,3)=$P(^BGPPEDBN(BGPRPT,14,Z,0),U,3)+1
 S Z=$P(^BGPPEDBN(BGPRPT,14,0),U,3)+1,$P(^BGPPEDBN(BGPRPT,14,0),U,3)=Z,$P(^BGPPEDBN(BGPRPT,14,0),U,4)=Z
 S ^BGPPEDBN(BGPRPT,14,Z,0)=BGPT_U_BGPT1_U_1
 S ^BGPPEDBN(BGPRPT,14,"B",BGPT,Z)=""
 Q
5 ;
 D 5^BGP9DPE2
 Q
6 ;
 D 6^BGP9DPE2
 Q
7 ;
 D 7^BGP9DPE2
 Q
ACTUP(P,BDATE,EDATE,T,B) ;EP - is this patient in user pop?
 I B=1,$$BEN^AUPNPAT(P,"C")'="01" Q 0  ;must be Indian/Alaskan Native
 I B=2,$$BEN^AUPNPAT(P,"C")="01" Q 0  ;must not be I/A
 S DOD=$$DOD^AUPNPAT(P) I DOD]"",DOD<EDATE Q 0
 S X=$P($G(^AUPNPAT(P,11)),U,18) I X="" Q 0
 I '$D(^ATXAX(T,21,"B",($P(^AUPNPAT(P,11),U,18)))),'$D(^ATXAX(T,21,"AA",$P(^AUPNPAT(P,11),U,18),$P(^AUPNPAT(P,11),U,18))) Q 0
 S X=$$LASTVD(P,BDATE,EDATE)
 Q $S(X:1,1:0)
 ;
S(R,G,N,P,V,J) ;
 I 'V Q  ;no value to add 
 I $G(J) S $P(@(G_R_","_N_")"),U,P)=$P($G(@(G_R_","_N_")")),U,P)=V Q
 S $P(@(G_R_","_N_")"),U,P)=$P($G(@(G_R_","_N_")")),U,P)+V
 Q
 ;
SMIN(R,G,N,P,V,J) ;
 I 'V Q  ;no value to add
 I $P(@(G_R_","_N_")"),U,P)="" S $P(@(G_R_","_N_")"),U,P)=V
 I V<$P(@(G_R_","_N_")"),U,P) S $P(@(G_R_","_N_")"),U,P)=V Q
 Q
SMAX(R,G,N,P,V,J) ;
 I 'V Q  ;no value to add 
 I V>$P(@(G_R_","_N_")"),U,P) S $P(@(G_R_","_N_")"),U,P)=V Q
 Q
SETLIST ;
 Q:'$D(BGPLIST(BGPIC))
 Q:BGPTIME'=1
 I BGPLIST="P",$P(^AUPNPAT(DFN,0),U,14)'=BGPLPRV Q
 S BGPLIST(BGPIC)=$G(BGPLIST(BGPIC))+1
 S ^XTMP("BGP9PE",BGPJ,BGPH,"LIST",BGPIC,$S($P($G(^AUPNPAT(DFN,11)),U,18)]"":$P(^AUPNPAT(DFN,11),U,18),1:"UNKNOWN"),$P(^DPT(DFN,0),U,2),BGPAGEB,DFN)=$G(BGPVALUE)
 Q
LASTVD(P,BDATE,EDATE) ;
 I '$D(^AUPNVSIT("AC",P)) Q ""
 K ^TMP($J,"A")
 S A="^TMP($J,""A"",",B=P_"^ALL VISITS;DURING "_$$FMTE^XLFDT(BDATE)_"-"_$$FMTE^XLFDT(EDATE),E=$$START1^APCLDF(B,A)
 I '$D(^TMP($J,"A",1)) Q ""
 S (X,G)=0 F  S X=$O(^TMP($J,"A",X)) Q:X'=+X!(G)  S V=$P(^TMP($J,"A",X),U,5) D
 .Q:'$D(^AUPNVSIT(V,0))
 .Q:'$P(^AUPNVSIT(V,0),U,9)
 .Q:$P(^AUPNVSIT(V,0),U,11)
 .Q:'$D(^AUPNVPRV("AD",V))
 .Q:"SAHO"'[$P(^AUPNVSIT(V,0),U,7)
 .Q:"V"[$P(^AUPNVSIT(V,0),U,3)
 .Q:$P(^AUPNVSIT(V,0),U,6)=""
 .I $G(BGPMFITI),'$D(^ATXAX(BGPMFITI,21,"B",$P(^AUPNVSIT(V,0),U,6))) Q
 .S G=1
 .Q
 Q G
