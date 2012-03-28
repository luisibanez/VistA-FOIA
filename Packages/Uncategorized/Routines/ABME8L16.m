ABME8L16 ; IHS/ASDST/DMJ - Header 
 ;;2.6;IHS Third Party Billing System;**2,3**;NOV 12, 2009
 ;Header Segments
 ;
 ; IHS/SD/SDR - v2.5 p8 - IM13487/IM14092 - Modified to print payment
 ; IHS/SD/SDR - v2.5 p8 - task 6 - Don't do referring if ambulance
 ; IHS/SD/SDR - v2.5 p9 - IM19622 - Check if active is replacement
 ; IHS/SD/SDR - v2.5 p13 - IM25471 - Changes for CAS if SAR=A2
 ; IHS/SD/SDR - abm*2.6*2 - HEAT10900 - Ck multiple places for pymnt dt
 ; IHS/SD/SDR - abm*2.6*3 - HEAT7574 - tribal self-insured
 ;
START ;START HERE
 ;loop 2320
 D PAYED^ABMUTLP
 N ABMI
 S ABMI=0
 F  S ABMI=$O(ABMP("INS",ABMI)) Q:'ABMI  D
 .S ABMLINE=ABMP("INS",ABMI)
 .I $P(ABMLINE,U)=ABMP("INS")!($P(ABMLINE,"^",11)=ABMP("INS")),$P(ABMLINE,"^",3)="I" Q
 .S ABMLOOP=2320
 .D EP^ABME8SBR(ABMI)
 .D WR^ABMUTL8("SBR")
 .F ABML="OA","PR","CO" D
 ..Q:'$D(ABMP(+ABMLINE,ABML))  ;quit if no data for insurer in ABMP adj array
 ..D EP^ABME8CAS
 ..D WR^ABMUTL8("CAS")
 .;I $G(ABMP("PAYED",+ABMLINE)) D  ;abm*2.6*3 HEAT7574
 .I ($G(ABMP("PAYED",+ABMLINE))!($P($G(^ABMNINS(ABMP("LDFN"),+ABMLINE,0)),U,11)="Y")) D  ;abm*2.6*3 HEAT7574
 ..D EP^ABME8AMT("D")
 ..D WR^ABMUTL8("AMT")
 .;start new code abm*2.6*3 HEAT7574
 .I ($P($G(^ABMNINS(ABMP("LDFN"),+ABMLINE,0)),U,11)="Y") D
 ..S ABMB6AMT=0
 ..D EP^ABME8AMT("B6")
 ..D WR^ABMUTL8("AMT")
 .;end new code HEAT7574
 .I +$G(ABMF2AMT)'=0 D
 ..D EP^ABME8AMT("F2")
 ..D WR^ABMUTL8("AMT")
 ..K ABMF2AMT
 .I $G(ABMSBR(ABMI)) D
 ..S ABMSFILE=$P(ABMSBR(ABMI),"-",1)
 ..S ABMSIEN=$P(ABMSBR(ABMI),"-",2)
 ..D EP^ABME8DMG(ABMSFILE,ABMSIEN)
 ..D WR^ABMUTL8("DMG")
 .D ^ABME8OI
 .D WR^ABMUTL8("OI")
 .K ABMLOOP
 .;loop 2330A
 .D EP^ABME8NM1("IL")
 .D WR^ABMUTL8("NM1")
 .D EP^ABME8N3(ABMSFILE,ABMSIEN)
 .D WR^ABMUTL8("N3")
 .D EP^ABME8N4(ABMSFILE,ABMSIEN)
 .D WR^ABMUTL8("N4")
 .;loop 2330B
 .D EP^ABME8NM1("PR",+ABMLINE)
 .D WR^ABMUTL8("NM1")
 .I $G(ABMP("PAYED",+ABMLINE))'="" D
 ..;S ABMPDT=$P($G(ABMP("PAYED",+ABMLINE)),U,2)  ;abm*2.6*2 HEAT10900
 ..S ABMPDT=$S($P($G(ABMP("PAYED",+ABMLINE)),U,2)'="":$P(ABMP("PAYED",+ABMLINE),U,2),$G(ABMP("PDT",+ABMLINE))'="":ABMP("PDT",+ABMLINE),1:"")  ;abm*2.6*2 HEAT10900
 ..D EP^ABME8DTP(573,"D8",ABMPDT)
 ..D WR^ABMUTL8("DTP")
 ..K ABMPDT
 .;loop 2330C
 .I $G(ABMP("PNUM",ABMI))'="" D
 ..D EP^ABME8NM2("QC",ABMI)
 ..D WR^ABMUTL8("NM1")
 .D OTHR
 Q
OTHR ;other payer info
 ;loops 2330D through 2330H
 N J
 F J=1:1:4 D
 .S ABMPTYP=$E("FRPS",J)
 .Q:($G(ABMP("CLIN"))="A3")&(J="R")
 .S ABMPROV=$O(ABMP("PRV",ABMPTYP,0))
 .I ABMPROV D
 ..S ABMPNBR=$$NPI^ABMEEPRV(ABMPROV,ABMP("LDFN"),+ABMLINE)
 ..Q:ABMPNBR=""
 ..D EP^ABME8NM2($P("DN^82^QB^DQ","^",J))
 ..D WR^ABMUTL8("NM1")
 ..S ABMITYP=$P(ABMLINE,"^",2)
 ..S ABMP("RTYPE")=$S(ABMITYP="R":"1G",ABMITYP="D":"1D",$P($G(^ABMNINS(ABMDUZ2,ABMP("INS"),1,ABMP("VTYP"),1)),U)'="":$P($G(^ABMREFID($P($G(^ABMNINS(ABMDUZ2,ABMP("INS"),1,ABMP("VTYP"),1)),U),0)),U),1:"0B")
 ..I ABMP("EXP")=22,ABMP("RTYPE")="1G" S ABMP("RTYPE")="1C"
 ..D EP^ABME8RF2(ABMP("RTYPE"))
 ..I ABMNPIU="B"!(ABMNPIU="N") D
 ...D EP^ABME8REF("EI",9999999.06,DUZ(2))
 ..D WR^ABMUTL8("REF")
 Q
