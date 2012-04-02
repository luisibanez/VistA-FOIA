ABMDE8X ; IHS/ASDST/DMJ - Page 8 - ERROR CHECKS ; 
 ;;2.6;IHS Third Party Billing System;**3,6,8**;NOV 12, 2009
 ; IHS/SD/SDR - v2.6 CSV
 ; IHS/SD/SDR -abm*2.6*3 - HEAT12234 - Require coor. DX for all CPT categories
 ; IHS/SD/SDR - abm*2.6*6 - 5010 - error 239 if no RX number on line
 ;
A ;EP - Entry Point for Page 8A Errors
 D MODE
 I $P($G(^ABMDCLM(DUZ(2),ABMP("CDFN"),8)),"^",5)="Y" S ABME(182)=""
 S ABMX=0 F ABMX("I")=1:1 S ABMX=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),27,ABMX)) Q:'ABMX  D A1  ;abm*2.6*8
 S ABME("TITL")="PAGE 8A - MEDICAL SERVICES"
 I $P($G(^ABMDCLM(DUZ(2),ABMP("CDFN"),4)),U,1)="Y" S ABME(163)=""
 G XIT
A1 ;A1
 S ABMX("X0")=^ABMDCLM(DUZ(2),ABMP("CDFN"),27,ABMX,0)
 S ABMX("CPT")=$P(ABMX("X0"),U)
 K:$P($$CPT^ABMCVAPI(ABMX("CPT"),ABMP("VDT")),U,4)=28 ABME(182)  ;CSV-c
 I ^ABMDEXP(ABMMODE(1),0)["UB" D
 .I $P(ABMX("X0"),U,2)="" S ABME(121)=""
 I $P(ABMX("X0"),U,3)="" S ABME(123)=""
 I $P(ABMX("X0"),U,4)="" S ABME(126)=""
 I (^ABMDEXP(ABMMODE(1),0)["HCFA")!(^ABMDEXP(ABMMODE(1),0)["CMS") D
 .S ABMCODXS=$P(ABMX("X0"),U,6)
 .I ABMCODXS'="" D
 ..F ABMJ=1:1 S ABMCODX=$P(ABMCODXS,",",ABMJ) Q:+$G(ABMCODX)=0  D
 ...;start old code abm*2.6*8 NOHEAT
 ...;I +$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),17,"C",ABMCODX,0))=0,($G(ABME(217))'="") S ABME(217)=$G(ABME(217))_","_ABMX
 ...;I +$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),17,"C",ABMCODX,0))=0,($G(ABME(217))="") S ABME(217)=ABMX
 ...;end old code start new code
 ...I +$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),17,"C",ABMCODX,0))=0,($G(ABME(217))'="") S ABME(217)=$G(ABME(217))_","_ABMX("I")
 ...I +$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),17,"C",ABMCODX,0))=0,($G(ABME(217))="") S ABME(217)=ABMX("I")
 ...;end new code
 .;I $P($$CPT^ABMCVAPI(ABMX("CPT"),ABMP("VDT")),U,4)>22,$P($$CPT^ABMCVAPI(ABMX("CPT"),ABMP("VDT")),U,4)<30 Q  ;CSV-c  ;abm*2.6*3 HEAT12234
 .;I $P(ABMX("X0"),U,6)="" S ABME(122)=$S($D(ABME(122)):ABME(122)_","_ABMX,1:ABMX) Q  ;abm*2.6*8 NOHEAT
 .I $P(ABMX("X0"),U,6)="" S ABME(122)=$S($D(ABME(122)):ABME(122)_","_ABMX("I"),1:ABMX("I")) Q  ;abm*2.6*8 NOHEAT
 I ABMMODE(1)=22!(ABMMODE(1)=27) D
 .S ABMPIEN=0
 .F  S ABMPIEN=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),27,ABMX,"P",ABMPIEN)) Q:+ABMPIEN=0  D
 ..S ABMNPIUS=$$NPIUSAGE^ABMUTLF(ABMP("LDFN"),ABMP("INS"))
 ..S ABMPRV=$P($G(^ABMDCLM(DUZ(2),ABMP("CDFN"),27,ABMX,"P",ABMPIEN,0)),U)
 ..;start old code abm*2.6*8 NOHEAT
 ..;I ABMNPIUS="N",($P($$NPI^XUSNPI("Individual_ID",ABMPRV),U)<0) S ABME(220)=$S('$D(ABME(220)):ABMX,1:ABME(220)_","_ABMX)
 ..;I ABMNPIUS="B",($P($$NPI^XUSNPI("Individual_ID",ABMPRV),U)<0) S ABME(221)=$S('$D(ABME(221)):ABMX,1:ABME(221)_","_ABMX)
 ..;end old code start new code
 ..I ABMNPIUS="N",($P($$NPI^XUSNPI("Individual_ID",ABMPRV),U)<0) S ABME(220)=$S('$D(ABME(220)):ABMX("I"),1:ABME(220)_","_ABMX("I"))
 ..I ABMNPIUS="B",($P($$NPI^XUSNPI("Individual_ID",ABMPRV),U)<0) S ABME(221)=$S('$D(ABME(221)):ABMX("I"),1:ABME(221)_","_ABMX("I"))
 ..;end new code
 ..Q:$P($G(^ABMDCLM(DUZ(2),ABMP("CDFN"),27,ABMX,"P",ABMPIEN,0)),U,2)'="D"
 ..S ABMPRV=$P($G(^ABMDCLM(DUZ(2),ABMP("CDFN"),27,ABMX,"P",ABMPIEN,0)),U)
 ..I $P($G(^VA(200,ABMPRV,.11)),U)="" S ABME(216)=ABMX  ;provider street
 ..I $P($G(^VA(200,ABMPRV,.11)),U,4)="" S ABME(216)=ABMX  ;city
 ..I $P($G(^VA(200,ABMPRV,.11)),U,5)="" S ABME(216)=ABMX  ;state
 ..I $P($G(^VA(200,ABMPRV,.11)),U,6)="" S ABME(216)=ABMX  ;zip
 K ABMPIEN
 Q
 ;
B ;EP - Entry Point for Page 8B Errors
 D MODE
 S ABMX="" F ABMX("I")=1:1 S ABMX=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),21,"C",ABMX)) Q:ABMX=""  S ABMX(1)=$O(^(ABMX,"")) D B1
 I $P($G(^ABMDCLM(DUZ(2),ABMP("CDFN"),4)),U,1)="Y" S ABME(163)=""
 S ABME("TITL")="PAGE 8B - SURGICAL PROCEDURES"
 ;I $D(^ABMDCLM(DUZ(2),ABMP("CDFN"),41,"C","O")),'$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),21,0)) S ABME(1)=""  abm*2.6*8 HEAT42572
 I $D(^ABMDCLM(DUZ(2),ABMP("CDFN"),41,"C","O")),('$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),21,0)))&('$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),19,0))) S ABME(1)=""  ;abm*2.6*8 HEAT42572
 G XIT
B1 S ABMX("X0")=^ABMDCLM(DUZ(2),ABMP("CDFN"),21,ABMX(1),0)
 I $P($$IHSCPT^ABMCVAPI(+ABMX("X0"),ABMP("VDT")),U,2) S ABME(171)=$S('$D(ABME(171)):+ABMX("X0"),1:ABME(171)_","_+ABMX("X0"))  ;CSV-c
 I ^ABMDEXP(ABMMODE(2),0)["UB" D
 .I $P(ABMX("X0"),U,3)="" S ABME(121)=""
 I $P(ABMX("X0"),U,13)="" S ABME(123)=""
 I (^ABMDEXP(ABMMODE(2),0)["HCFA")!(^ABMDEXP(ABMMODE(2),0)["CMS") D
 .I $P(ABMX("X0"),U,4)="" S ABME(122)=""
 .S ABMCODXS=$P(ABMX("X0"),U,4)
 .I ABMCODXS'="" D
 ..F ABMJ=1:1 S ABMCODX=$P(ABMCODXS,",",ABMJ) Q:+$G(ABMCODX)=0  D
 ...;end old code start new code  ;abm*2.6*8
 ...I +$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),17,"C",ABMCODX,0))=0,($G(ABME(217))'="") S ABME(217)=$G(ABME(217))_","_ABMX("I")
 ...I +$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),17,"C",ABMCODX,0))=0,($G(ABME(217))="") S ABME(217)=ABMX("I")
 ...;end new code
 I $P(ABMX("X0"),U,5)="" S ABME(125)=""
 I $P(ABMX("X0"),U,6)="" S ABME(124)=""
 I $P(ABMX("X0"),U,7)="" S ABME(126)=""
 I $P(ABMX("X0"),U,8)="Y" S ABME(164)=$S('$D(ABME(164)):ABMX("I"),1:ABME(164)_","_ABMX("I"))
 I $P(ABMX("X0"),U,5)]"",$P(ABMX("X0"),U,5)<ABMP("VDT") S ABME(127)=""
 I $G(ABMP("DDT")),$P(ABMX("X0"),U,5)]"",($P(ABMX("X0"),U,5)\1)>ABMP("DDT") S ABME(130)=""
 I ABMMODE(2)=22!(ABMMODE(2)=27) D
 .S ABMPIEN=0
 .F  S ABMPIEN=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),21,ABMX,"P",ABMPIEN)) Q:+ABMPIEN=0  D
 ..S ABMNPIUS=$$NPIUSAGE^ABMUTLF(ABMP("LDFN"),ABMP("INS"))
 ..S ABMPRV=$P($G(^ABMDCLM(DUZ(2),ABMP("CDFN"),21,ABMX,"P",ABMPIEN,0)),U)
 ..;start old code abm*2.6*8 NOHEAT
 ..;I ABMNPIUS="N",($P($$NPI^XUSNPI("Individual_ID",ABMPRV),U)<0) S ABME(220)=$S('$D(ABME(220)):ABMX,1:ABME(220)_","_ABMX)
 ..;I ABMNPIUS="B",($P($$NPI^XUSNPI("Individual_ID",ABMPRV),U)<0) S ABME(221)=$S('$D(ABME(221)):ABMX,1:ABME(221)_","_ABMX)
 ..;end old code start new code
 ..I ABMNPIUS="N",($P($$NPI^XUSNPI("Individual_ID",ABMPRV),U)<0) S ABME(220)=$S('$D(ABME(220)):ABMX("I"),1:ABME(220)_","_ABMX("I"))
 ..I ABMNPIUS="B",($P($$NPI^XUSNPI("Individual_ID",ABMPRV),U)<0) S ABME(221)=$S('$D(ABME(221)):ABMX("I"),1:ABME(221)_","_ABMX("I"))
 ..;end new code
 ..Q:$P($G(^ABMDCLM(DUZ(2),ABMP("CDFN"),21,ABMX,"P",ABMPIEN,0)),U,2)'="D"
 ..S ABMPRV=$P($G(^ABMDCLM(DUZ(2),ABMP("CDFN"),21,ABMX,"P",ABMPIEN,0)),U)
 ..I $P($G(^VA(200,ABMPRV,.11)),U)="" S ABME(216)=ABMX  ;provider street
 ..I $P($G(^VA(200,ABMPRV,.11)),U,4)="" S ABME(216)=ABMX  ;city
 ..I $P($G(^VA(200,ABMPRV,.11)),U,5)="" S ABME(216)=ABMX  ;state
 ..I $P($G(^VA(200,ABMPRV,.11)),U,6)="" S ABME(216)=ABMX  ;zip
 K ABMPIEN
 Q
 ;
C ;EP - Entry Point for Page 8C Errors
 Q:$D(^ABMDPARM(DUZ(2),1,11,2))
 Q:ABMP("VTYP")'=111
 S ABMX=0,ABMX("CNT")=0 F  S ABMX=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),25,ABMX)) Q:'ABMX  D C1
 S ABMX("DAYS")=$P($G(^ABMDCLM(DUZ(2),ABMP("CDFN"),7)),U,3) S:ABMX("DAYS")<1 ABMX("DAYS")=1
 I ABMX("DAYS")<ABMX("CNT") S ABME(142)=""
 S ABME("TITL")="PAGE 8C - REVENUE CODE"
 G XIT
C1 S ABMX("X0")=^ABMDCLM(DUZ(2),ABMP("CDFN"),25,ABMX,0)
 I +ABMX("X0")>99&(+ABMX("X0")<220) S ABMX("CNT")=ABMX("CNT")+$P(ABMX("X0"),U,2)
 I $P(ABMX("X0"),U,2)="" S ABME(123)=""
 I $P(ABMX("X0"),U,3)="" S ABME(126)=""
 Q
 ;
D ;EP - Entry Point for Page 8D Errors
 Q:$D(^ABMDPARM(DUZ(2),1,11,6))
 D MODE
 I $P($G(^ABMNINS(DUZ(2),+ABMP("INS"),1,997,0)),U,4),$D(^ABMDERR(175,21,$P(^(0),U,4),0)) S ABMZ("RX")=""
 S ABMX=0 F ABMX("I")=1:1 S ABMX=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),23,ABMX)) Q:'ABMX  D D1
 D D2
 S ABME("TITL")="PAGE 8D - MEDICATIONS"
 G XIT
D1 S ABMX("X0")=^ABMDCLM(DUZ(2),ABMP("CDFN"),23,ABMX,0)
 I ^ABMDEXP(ABMMODE(4),0)["UB" D
 .I $P(ABMX("X0"),U,2)="" S ABME(121)=""
 I (^ABMDEXP(ABMMODE(4),0)["HCFA")!(^ABMDEXP(ABMMODE(4),0)["CMS") D
 .I $P(ABMX("X0"),"^",13)="" S ABME(188)=""
 .S ABMCODXS=$P(ABMX("X0"),U,13)
 .I ABMCODXS'="" D
 ..F ABMJ=1:1 S ABMCODX=$P(ABMCODXS,",",ABMJ) Q:+$G(ABMCODX)=0  D
 ...;start old code abm*2.6*8 NOHEAT
 ...;I +$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),17,"C",ABMCODX,0))=0,($G(ABME(217))'="") S ABME(217)=$G(ABME(217))_","_ABMX
 ...;I +$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),17,"C",ABMCODX,0))=0,($G(ABME(217))="") S ABME(217)=ABMX
 ...;end old code start new code
 ...I +$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),17,"C",ABMCODX,0))=0,($G(ABME(217))'="") S ABME(217)=$G(ABME(217))_","_ABMX("I")
 ...I +$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),17,"C",ABMCODX,0))=0,($G(ABME(217))="") S ABME(217)=ABMX("I")
 ...;end new code
 .;I ABMMODE(4)=32&($P(ABMX("X0"),U,6)="")&($P(ABMX("X0"),U,22)="") S ABME(239)=$S($G(ABME(239)):$G(ABME(239))_","_ABMX,1:ABMX)  ;abm*2.6*6 5010  ;abm*2.6*8 5010
 I (ABMMODE(4)=31!(ABMMODE(4)=32))&($P(ABMX("X0"),U,6)="")&($P(ABMX("X0"),U,22)="") S ABME(239)=$S($G(ABME(239)):$G(ABME(239))_","_ABMX("I"),1:ABMX("I"))  ;abm*2.6*8 5010
 I $P(ABMX("X0"),U,3)="" S ABME(123)=""
 I $P(ABMX("X0"),U,4)="" S ABME(165)=""
 I $P(ABMX("X0"),U,5)="",ABMP("BTYP")'=111 S ABME(135)=""
 I $D(ABMZ("RX")),'$P(ABMX("X0"),U,6) S ABME(175)=$S($D(ABME(175)):ABME(175)_",",1:"")_ABMX("I")
 I ABMMODE(4)=22!(ABMMODE(4)=27) D
 .S ABMPIEN=0
 .F  S ABMPIEN=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),21,ABMX,"P",ABMPIEN)) Q:+ABMPIEN=0  D
 ..S ABMNPIUS=$$NPIUSAGE^ABMUTLF(ABMP("LDFN"),ABMP("INS"))
 ..S ABMPRV=$P($G(^ABMDCLM(DUZ(2),ABMP("CDFN"),21,ABMX,"P",ABMPIEN,0)),U)
 ..;start old code abm*2.6*8 NOHEAT
 ..;I ABMNPIUS="N",($P($$NPI^XUSNPI("Individual_ID",ABMPRV),U)<0) S ABME(220)=$S('$D(ABME(220)):ABMX,1:ABME(220)_","_ABMX)
 ..;I ABMNPIUS="B",($P($$NPI^XUSNPI("Individual_ID",ABMPRV),U)<0) S ABME(221)=$S('$D(ABME(221)):ABMX,1:ABME(221)_","_ABMX)
 ..;end old code start new code
 ..I ABMNPIUS="N",($P($$NPI^XUSNPI("Individual_ID",ABMPRV),U)<0) S ABME(220)=$S('$D(ABME(220)):ABMX("I"),1:ABME(220)_","_ABMX("I"))
 ..I ABMNPIUS="B",($P($$NPI^XUSNPI("Individual_ID",ABMPRV),U)<0) S ABME(221)=$S('$D(ABME(221)):ABMX("I"),1:ABME(221)_","_ABMX("I"))
 ..;end new code
 ..Q:$P($G(^ABMDCLM(DUZ(2),ABMP("CDFN"),21,ABMX,"P",ABMPIEN,0)),U,2)'="D"
 ..S ABMPRV=$P($G(^ABMDCLM(DUZ(2),ABMP("CDFN"),21,ABMX,"P",ABMPIEN,0)),U)
 ..I $P($G(^VA(200,ABMPRV,.11)),U)="" S ABME(216)=ABMX  ;provider street
 ..I $P($G(^VA(200,ABMPRV,.11)),U,4)="" S ABME(216)=ABMX  ;city
 ..I $P($G(^VA(200,ABMPRV,.11)),U,5)="" S ABME(216)=ABMX  ;state
 ..I $P($G(^VA(200,ABMPRV,.11)),U,6)="" S ABME(216)=ABMX  ;zip
 K ABMPIEN
 Q
D2 ;EP - this next section compares entries in V Med vs 23 multiple; will
 ;display warning if entry in V Med that's not in 23 multiple
 ;build array of V Med entries by drug with count of occurances
 ;  ABMMEDS(V MED IEN)=  P1=# OF V MED ENTRIES
 ;                       P2=# OF 23 MULTIPLE ENTRIES
 ;                       P3=DATE DISCONTINUED
 ;                       P4=RETURN TO STOCK DATE
 S ABMVIEN=0
 K ABMMEDS
 F  S ABMVIEN=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),11,ABMVIEN)) Q:+ABMVIEN=0  D
 .S ABMVDFN=$P($G(^ABMDCLM(DUZ(2),ABMP("CDFN"),11,ABMVIEN,0)),U)
 .S ABM=0
 .F  S ABM=$O(^AUPNVMED("AD",ABMVDFN,ABM)) Q:'ABM  D
 ..I $P($G(^AUPNVMED(ABM,0)),U)'="" D
 ...S ABMMEDS($P(^AUPNVMED(ABM,0),U))=+$G(ABMMEDS($P(^AUPNVMED(ABM,0),U)))+1
 ...S $P(ABMMEDS($P(^AUPNVMED(ABM,0),U)),U,3)=$P($G(^AUPNVMED(ABM,0)),U,8)  ;date disc.
 ...S $P(ABMMEDS($P(^AUPNVMED(ABM,0),U)),U,4)=$P($G(^PSDRUG($P($G(^AUPNVMED(ABM,0)),U),2)),U,15)  ;RTS
 ;build array of 23-multiple entries by drug with count of occurances
 S ABMVIEN=0
 F  S ABMVIEN=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),23,ABMVIEN)) Q:+ABMVIEN=0  D
 .S ABMVDATA=$P($G(^ABMDCLM(DUZ(2),ABMP("CDFN"),23,ABMVIEN,0)),U)
 .S $P(ABMMEDS(ABMVDATA),U,2)=$P(+$G(ABMMEDS(ABMVDATA)),U,2)+1
 ;now compare p1 and p2; p1 must be < or = p2
 S ABMVIEN=0,ABMVFLG=0
 K ABME(213)
 F  S ABMVIEN=$O(ABMMEDS(ABMVIEN)) Q:+ABMVIEN=0  D
 .K ABMVMED,ABM23M
 .S ABMVMED=$P(ABMMEDS(ABMVIEN),U)
 .S ABM23M=$P(ABMMEDS(ABMVIEN),U,2)
 .Q:ABMVMED=ABM23M
 .Q:ABM23M>ABMVMED
 .S ABMVFLG=1
 I $G(ABMVFLG)=1 S ABME(213)=""
 K ABMVFLG,ABMVIEN,ABMVMED,ABM23M
 Q
 ;
E ;EP - Entry Point for Page 8E Errors
 Q:$D(^ABMDPARM(DUZ(2),1,11,3))
 D MODE
 S ABMX=0 F ABMX("I")=1:1 S ABMX=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),37,ABMX)) Q:'ABMX  D E1^ABMDE8X1  ;abm*2.6*8
 S ABMX("V")=0 F  S ABMX("V")=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),11,ABMX("V"))) Q:'ABMX("V")  I $D(^AUPNVLAB("AD",ABMX("V"))) S ABME(174)="" Q
 S ABME("TITL")="PAGE 8E - LABORATORY PROCEDURES"
 G XIT
 ;
F ;EP - Entry Point for Page 8F Errors
 Q:$D(^ABMDPARM(DUZ(2),1,11,4))
 D MODE
 S ABMX=0 F ABMX("I")=1:1 S ABMX=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),35,ABMX)) Q:'ABMX  D F1^ABMDE8X1  ;abm*2.6*8
 S ABME("TITL")="PAGE 8F - RADIOLOGY PROCEDURES"
 G XIT
 ;
G ;EP - Entry Point for Page 8G Errors
 Q:$D(^ABMDPARM(DUZ(2),1,11,5))
 D MODE
 S ABMX=0 F ABMX("I")=1:1 S ABMX=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),39,ABMX)) Q:'ABMX  D G1^ABMDE8X1  ;abm*2.6*8
 S ABME("TITL")="PAGE 8G - ANESTHESIA PROCEDURES"
 G XIT
 ;
H ;EP - Entry Point for Page 8H Errors
 Q:$D(^ABMDPARM(DUZ(2),1,11,8))
 D MODE
 S ABMX=0 F ABMX("I")=1:1 S ABMX=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),43,ABMX)) Q:'ABMX  D H1^ABMDE8X1  ;abm*2.6*8
 S ABME("TITL")="PAGE 8H - MISC. SERVICES"
 G XIT
 ;
J ;EP - Entry Point for Page 8J Errors
 Q:$D(^ABMDPARM(DUZ(2),1,11,9))
 D MODE
 S ABMX=0 F ABMX("I")=1:1 S ABMX=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),45,ABMX)) Q:'ABMX  D  ;abm*2.6*8
 .I ^ABMDEXP(ABMMODE(10),0)["UB" D
 ..I $P(^ABMDCLM(DUZ(2),ABMP("CDFN"),45,ABMX,0),"^",5)="" S ABME(121)=""
 .I (^ABMDEXP(ABMMODE(10),0)["HCFA")!(^ABMDEXP(ABMMODE(10),0)["CMS") D
 ..I $P(^ABMDCLM(DUZ(2),ABMP("CDFN"),45,ABMX,0),"^",6)="" S ABME(122)=""
 ..S ABMCODXS=$P($G(^ABMDCLM(DUZ(2),ABMP("CDFN"),45,ABMX,0)),U,6)
 ..I ABMCODXS'="" D
 ...F ABMJ=1:1 S ABMCODX=$P(ABMCODXS,",",ABMJ) Q:+$G(ABMCODX)=0  D
 ....;start old code abm*2.6*8 NOHEAT
 ....;I +$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),17,"C",ABMCODX,0))=0,($G(ABME(217))'="") S ABME(217)=$G(ABME(217))_","_ABMX
 ....;I +$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),17,"C",ABMCODX,0))=0,($G(ABME(217))="") S ABME(217)=ABMX
 ....;end old code start new code
 ....I +$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),17,"C",ABMCODX,0))=0,($G(ABME(217))'="") S ABME(217)=$G(ABME(217))_","_ABMX("I")
 ....I +$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),17,"C",ABMCODX,0))=0,($G(ABME(217))="") S ABME(217)=ABMX("I")
 ....;end new code
 S ABME("TITL")="PAGE 8J - SUPPLIES"
 G XIT
K ;EP - Entry Point for Page 8K Errors
 Q:$D(^ABMDPARM(DUZ(2),1,11,8))
 D MODE
 S ABMX=0 F ABMX("I")=1:1 S ABMX=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),47,ABMX)) Q:'ABMX  D K1^ABMDE8X1  ;abm*2.6*8
 S ABME("TITL")="PAGE 8K - AMBULANCE SERVICES"
 G XIT
 ;
MODE ;EP - SET MODE OF EXPORT ARRAY
 N I F I=1:1:10 D
 .S ABMMODE(I)=$P($G(^ABMDCLM(DUZ(2),ABMP("CDFN"),70)),"^",I)
 .S:ABMMODE(I)="" ABMMODE(I)=ABMP("EXP")
 Q
 ;
XIT ;
 K ABMX,ABMMODE,ABMMEDS
 Q
