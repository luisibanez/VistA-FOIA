ABME5L2 ; IHS/ASDST/DMJ - Header 
 ;;2.6;IHS Third Party Billing System;**6**;NOV 12, 2009
 ;Header Segments
START ;START HERE
 K ABMHLCNT
 D EP^ABME5HL(20,1)
 D WR^ABMUTL8("HL")
 I ABMP("EXP")=31!((ABMRCID="NMMAD")&(ABMP("EXP")=32))!((ABMP("EXP")=32)&(ABMP("VTYP")=831)) D
 .D EP^ABME5PRV("BI",DUZ(2))
 .D WR^ABMUTL8("PRV")
 S ABMP("PAYDFN")=$P($G(^ABMDPARM(DUZ(2),1,2)),U,3)
 S ABMLOOP="2010AA"
 D EP^ABME5NM1(85)
 D WR^ABMUTL8("NM1")
 D EP^ABME5N3(4,DUZ(2))
 D WR^ABMUTL8("N3")
 D EP^ABME5N4(4,DUZ(2))
 D WR^ABMUTL8("N4")
 D EP^ABME5REF("EI",9999999.06,DUZ(2))
 D WR^ABMUTL8("REF")
 S ABMNPIU=$$NPIUSAGE^ABMUTLF(DUZ(2),ABMP("INS"))
 K ABMIDCD
 I ABMP("PAYDFN")'=DUZ(2) D
 .Q:$P($G(^AUTNINS(ABMP("INS"),2)),U)="D"&($P($G(^AUTNINS(ABMP("INS"),0)),U)["OK")
 .S ABMLOOP="2010AB"
 .D EP^ABME5NM1(87)
 .D WR^ABMUTL8("NM1")
 .D EP^ABME5N3(9999999.06,ABMP("PAYDFN"))
 .D WR^ABMUTL8("N3")
 .D EP^ABME5N4(9999999.06,ABMP("PAYDFN"))
 .D WR^ABMUTL8("N4")
 .K ABMIDCD
 .K ABMLOOP
 Q
PIREFID ;EP - Find EMC Ref ID for Private Ins.
 S:ABMP("ITYPE")="H" ABMIDCD="BQ"
 S:ABMP("ITYPE")="C" ABMIDCD="1H"
 I "M^P^W^F"[ABMP("ITYPE") S ABMIDCD="G2"
 I ABMIDCD="G2",ABMP("ITYPE")'="M" D
 .I $P($G(^ABMNINS(DUZ(2),ABMP("INS"),1,ABMP("VTYP"),1)),U)]"" D
 ..S ABMIDCD=$P($G(^ABMNINS(DUZ(2),ABMP("INS"),1,ABMP("VTYP"),1)),U)
 ..S ABMIDCD=$P($G(^ABMREFID(ABMIDCD,0)),U)
 ..S:ABMIDCD="" ABMIDCD="G2"
 Q
