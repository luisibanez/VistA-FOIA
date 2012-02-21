LRBEBA3 ;DALOI/JAH/FHS - ORDERING AND RESULTING OUTPATIENT ;8/10/04
 ;;5.2;LAB SERVICE;**291**;Sep 27, 1994
 ;
BLDAR(LRBEDFN,LRODT,LRSN,LRBEAR,LRBEY,LRBETEST,LRBEPAN,LRBEDEL) ; Build LRBEAR array with
 ; CIDC information
 N LRBEODT,LRBEIEN,LRBETST,LRBETS,LRJ,N,NX,P,X,XX,REQX,OK
 S LRBEAR(LRBEDFN,"DSS ID")=LROOS
 S LRBEAR(LRBEDFN,"ORDGX")="O"
 S LRBEAR(LRBEDFN,"DOS")=LRBECDT
 S LRBEAR(LRBEDFN,"PAT")=$G(LRBEDFN)
 S LRBEAR(LRBEDFN,"POS")=LROOS
 S LRBEAR(LRBEDFN,"DEL")=LRBEDEL
 S LRBEAR(LRBEDFN,"USR")=DUZ
 S LRBEIEN=LRSN_","_LRODT_","
 S LRBEAR(LRBEDFN,"ORDPRO")=$$GET1^DIQ(69.01,LRBEIEN,7,"I")
 S:'+$G(LRSAMP) LRSAMP=$$GET1^DIQ(69.01,LRBEIEN,3,"I")
 ;reset LRBETEST, LRBEY for panel tests
 S LRBETS="" F  S LRBETS=$O(^LRO(69,LRODT,1,LRSN,2,"B",LRBETS)) Q:'LRBETS  D
 .S LRJ=$O(^LRO(69,LRODT,1,LRSN,2,"B",LRBETS,0))
 .Q:($P(^LRO(69,LRODT,1,LRSN,2,LRJ,0),U,9)="CA")
 .I $G(ORIEN),$P(^LRO(69,LRODT,1,LRSN,2,LRJ,0),U,7)'=ORIEN Q
 .I ($G(^LAB(60,LRBETS,12))),($D(^LAB(60,LRBETS,0))#2),'$L($P($G(^LAB(60,LRBETS,0)),U,5)) S LRBEPAN(LRBETS)=""
 .S OK=0,N=0 F  S N=$O(LRBETEST(N)) Q:'N  I LRBETS=+LRBETEST(N) S OK=1
 .I 'OK S N=$O(LRBETEST(""),-1),N=N+1,LRBETEST(N)=LRBETS_U_^LAB(60,LRBETS,0),LRBETEST(N,"P")=LRBETS_U_$$NLT^LRVER1(LRBETS)
 .S NX=0 F  S NX=$O(^LAB(60,LRBETS,2,NX)) Q:'NX  D
 ..S X=+^LAB(60,LRBETS,2,NX,0)
 ..S XX=$P($P(^LAB(60,X,0),U,5),";",2),REQX=$P(^(0),U,17)
 ..I XX,$D(LRBESB(XX)) S P(LRBETS,XX,X)=""
 ..I XX,$D(LRBEPAN(LRBETS)),REQX S P(LRBETS,XX,X)="R"
 ..;if XX null, then possibly another panel
 ..I 'XX D PARRAY(X,LRBETS,.P)
 .;reset LRBEY array;
 .;1st subscript is panel test; 2nd subscript is data identifier of atomic test
 .I $D(P(LRBETS)) D
 ..;retain original LRBEY array node if atomic test exists as a separate accession
 ..I '$D(^LRO(68,$G(LRAA),1,$G(LRAD),1,$G(LRAN),4,LRBETS,0)) K LRBEY(LRBETS)
 ..S XX=0 F  S XX=$O(P(LRBETS,XX)) Q:'XX  D
 ...S LRBEY(LRBETS,XX)=""
 ...S X=$O(P(LRBETS,XX,0))
 ...I P(LRBETS,XX,X)="R" S LRBEY(LRBETS,XX,"R")=X
 ;continue
 S LRBETS="" F  S LRBETS=$O(LRBETEST(LRBETS)) Q:LRBETS=""  D
 .S LRBETST=$P(LRBETEST(LRBETS),U,1)
 .D BLDAR^LRBEBA2(LRBEDFN,LRODT,LRSN,LRBETS,LRSAMP,LRSPEC,LRBETST,.LRBEAR)
 Q
 ;
PARRAY(XTEST,PTEST,P) ;
 N NX,X,XX,REQX
 S NX=0 F  S NX=$O(^LAB(60,XTEST,2,NX)) Q:'NX  D
 .S X=+^LAB(60,XTEST,2,NX,0)
 .S XX=$P($P(^LAB(60,X,0),U,5),";",2),REQX=$P(^(0),U,17)
 .I XX,$D(LRBESB(XX)) S P(PTEST,XX,X)=""
 .I XX,$D(LRBEPAN(PTEST)),REQX S P(PTEST,XX,X)="R"
 Q
 ;
QRYADD(LRODT,LRSN,LRTS,LRBEDFN,LRBESMP,LRBESPC,LRBETS,LRBEX,LRBEXD) ; Query #69 for
 ; default LRBEDGX and SC/EI
 N LRBEA,LRDGX,LRDX,LRDGXD
 S LRDGX=0
 F  S LRDGX=$O(^LRO(69,LRODT,1,LRSN,2,LRTS,2,LRDGX)) Q:LRDGX<1  D
 .S LRDGXD=2
 .S LRBEPTDT=$G(^LRO(69,LRODT,1,LRSN,2,LRTS,2,LRDGX,0)) Q:'LRBEPTDT
 .S LRBEA=$P(LRBEPTDT,U,1)_"^^^"_$P(LRBEPTDT,U,4)_U_$P(LRBEPTDT,U,5)
 .S LRBEA=LRBEA_U_$P(LRBEPTDT,U,2)_U_$P(LRBEPTDT,U,6)_U_$P(LRBEPTDT,U,8)
 .S LRBEA=LRBEA_U_$P(LRBEPTDT,U,7)_U_$P(LRBEPTDT,U,3)
 .I $P(LRBEPTDT,U,9)=1 S LRBEA=LRBEA_U_$P(LRBEPTDT,U,9),LRDGXD=1
 .S LRBEX(LRBEDFN,"LRBEDGX",LRBESMP,LRBESPC,LRBETS,$P(LRBEA,U))=LRBEA
 .S LRBEXD(LRBEDFN,"LRBEDGX",LRBESMP,LRBESPC,LRBETS,LRDGXD,$P(LRBEA,U))=LRBEA
 Q
 ;
ELIG(DFN) ; Display eligibility and disabilities
 D ELIG^VADPT W !," Eligibility: "_$P(VAEL(1),"^",2)_$S(+VAEL(3):"    SC%: "_$P(VAEL(3),"^",2),1:"")
 W !," Disabilities: " F I=0:0 S I=$O(^DPT(DFN,.372,I)) Q:'I  S I1=$S($D(^DPT(DFN,.372,I,0)):^(0),1:"") D:+I1
 .S LRDIS=$S($P($G(^DIC(31,+I1,0)),"^")]""&($P($G(^(0)),"^",4)']""):$P(^(0),"^"),$P($G(^DIC(31,+I1,0)),"^",4)]"":$P(^(0),"^",4),1:""),LRCNT=$P(I1,"^",2)
 .S LRDIS=$E(LRDIS,1,55)
 .I LRDIS]"" W ?15,LRDIS_" - "_LRCNT_"%("_$S($P(I1,"^",3):"SC",1:"NSC")_")",!
 K LRDIS,LRCNT,I,I1,VAEL
 Q
 ;
BALROW(LRODT,LRSN,LRTEST) ; CIDC LROW
 N LRBEA,LRBEB,LRBEAT,LRBET,LRBESN,LRBETS,LRBETST,LRBEQT,LRBEOT,LRBEVAL
 S LRBEVAL=$D(^XUSEC("PROVIDER",DUZ)) Q:'LRBEVAL
 S LRBEVAL=$$CIDC^IBBAPI(DFN) Q:'LRBEVAL
 I '$D(DFN) S LRBEDFN=$$GET1^DIQ(63,LRDFN_",",.03,"I")
 S:$G(LRSN)="" LRSN=1
 D SLROT^LRBEBA2(.LRXST,.LRTEST,.LRBEOT) S:$G(LRSS)="" LRSS="CH"
 S LRBEAT=1,LRBEY=$$SBA^LRBEBA31(LRDFN,.LRBEX,.LRBEQT,.LRBEOT)
 Q
 ;
AQ1 ; Ask question from LRORD1
 N LRBEVAL
 S LRBEVAL=$D(^XUSEC("PROVIDER",DUZ)) Q:'LRBEVAL
 S LRBEVAL=$$CIDC^IBBAPI(DFN) Q:'LRBEVAL
 K LRBEODT D DT^LRX S LRBEODT=%
 S:$G(LRSS)="" LRSS="CH"
 S LRBEAT=1,LRBEY=$$SBA^LRBEBA31(LRDFN,.LRBEX,.LRBEQT,.LROT)
 Q
 ;
AQ2 ; from LROW2A
 N LRBEVAL
 S LRBEVAL=$$CIDC^IBBAPI(DFN) Q:'LRBEVAL
 D SACC^LRBEBA2(LRODT,LRSN,LRTN,LRSSP,LRSPEC,$P(LRTEST(LRI),U,1),.LRBEX)
 Q
 ;
SVST(ENUM,ETYP,LRODT,LRSN) ; Set the Encounter # in #69
 S ^LRO(69,LRODT,1,LRSN,ETYP)=ENUM
 Q
 ;
BALROR(LRORD) ; CIDC LRORD
 N LRBEA,LRBEAT,LRBEB,LRBET,LRBESN,LRBETS,LRBETST,LRBEQT,LRBEODT
 N LRBEOT,LRBEVAL,LRBEZ,LRBETN
 S LRBEVAL=$D(^XUSEC("PROVIDER",DUZ)) Q:'LRBEVAL
 S LRBEVAL=$$CIDC^IBBAPI(DFN) Q:'LRBEVAL
 I '$D(DFN) S LRBEDFN=$$GET1^DIQ(63,LRDFN_",",.03,"I")
 S LRBEAT=1,LRBEY=$$SBA^LRBEBA31(LRDFN,.LRBEX,.LRBEQT,.LROT)
 Q
