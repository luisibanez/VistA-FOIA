ABMDF1C ; IHS/ASDST/DMJ - Set UB82 Print Array - cont ;
 ;;2.6;IHS 3P BILLING SYSTEM;**6**;NOV 12, 2009
 ;Original;TMD;
 ;
 S ABM("CNT")=0
 S ABMP("B0")=^ABMDBILL(DUZ(2),ABMP("BDFN"),0)
 S ABMP("GL")="^ABMDBILL(DUZ(2),"_ABMP("BDFN")_","
 S ABMP("VDT")=$P(^ABMDBILL(DUZ(2),ABMP("BDFN"),7),U),$P(ABMP("B0"),U,2)=ABMP("VDT")
 S ABMP("BTYP")=$P(ABMP("B0"),"^",12)
 S ABMP("VTYP")=$P(ABMP("B0"),U,7)
 D ^ABMDE2X1 S ABMP("EXP")=1
LOOP S ABM("IN")="",(ABMP("PAID"),ABMP("TW"))=0 F ABM("I")=41:1:43 S ABM("IN")=$O(^ABMDBILL(DUZ(2),ABMP("BDFN"),13,"C",ABM("IN"))) Q:'ABM("IN")  S ABM("XIEN")=$O(^(ABM("IN"),0)) D
 .S ABM("INSCO")=$P(^ABMDBILL(DUZ(2),ABMP("BDFN"),13,ABM("XIEN"),0),"^",1)
 .D INS
 .D INSRD
 ;S ABMP("PAID")=+$FN(ABMP("PAID")*ABM("RATIO"),"",2)  ;IHS/SD/AML NOHEAT 2/15/2011
 ;S ABMP("TW")=+$FN(ABMP("TW")*ABM("RATIO"),"",2)  ;IHS/SD/AML NOHEAT 2/15/2011
 S ABMP("PAID")=+$FN(ABMP("PAID")*$G(ABM("RATIO")),"",2)  ;IHS/SD/AML NOHEAT 2/15/2011
 S ABMP("TW")=+$FN(ABMP("TW")*$G(ABM("RATIO")),"",2)  ;IHS/SD/AML NOHEAT 2/15/2011
 K ABM,ABME,ABMV
 G ^ABMDF1D
 ;
MINUS S ABM("I")=ABM("I")-1
 Q
 ;
INS G MINUS:'$D(^ABMDBILL(DUZ(2),ABMP("BDFN"),13,ABM("XIEN"),0)),MINUS:"U"[$P(^(0),U,3),MINUS:'$D(^AUTNINS(ABM("INSCO"),0))
 S ABM("Z")=$S(ABM("I")=41:"A",ABM("I")=42:"B",1:"C")
 I $P($G(^AUTNINS(ABM("INSCO"),2)),U)="R" S $P(ABMF(4),U,4)=$P(^AUTTLOC(ABMP("LDFN"),0),U,19)
PAYOR S Y=ABM("INSCO") S ABMP("GL")="^ABMDBILL(DUZ(2),"_ABMP("BDFN")_",",ABMP("VDT")=$P(^ABMDBILL(DUZ(2),ABMP("BDFN"),7),U) D SEL^ABMDE2X
 I ABM("INSCO")=$P(ABMP("B0"),"^",8),$P(^ABMDBILL(DUZ(2),ABMP("BDFN"),13,ABM("XIEN"),0),"^",3)="I" D
 .S ABMP("PAYOR")=ABM("I")
 .I $P(ABMV("X1"),U,5)]"" S $P(ABMF(6),U)=$P(ABMV("X1"),U,5)
CONT S ABM("I0")=+ABMV("X1")
 S (ABM("PD"),ABM("DEDCT"),ABM("COINS"))=0 D PREV
 S ABM("RATIO")=+^ABMDBILL(DUZ(2),ABMP("BDFN"),2)/$S($P(^(2),U,3):$P(^(2),U,3),1:1)
 S:ABM("RATIO")>1 ABM("RATIO")=1
 S ABM("PD")=+$FN(ABM("PD")*ABM("RATIO"),"",2)
 ;
 G NON:$P($G(^AUTNINS(ABM("I0"),2)),U)="N" S ABMF(ABM("I"))=$P(^(0),U)_U_$P($G(^ABMDBILL(DUZ(2),ABMP("BDFN"),7)),U,4)_U_$P($G(^(7)),U,5)
 S:ABM("DEDCT") $P(ABMF(ABM("I")),U,4)=ABM("DEDCT")
 S:ABM("COINS") $P(ABMF(ABM("I")),U,5)=ABM("COINS")
 S:ABM("PD") $P(ABMF(ABM("I")),U,7)=ABM("PD")
 Q
NON S $P(ABMF(44),U,2)=$S(ABM("PD")>0:ABM("PD"),1:"")
 I $G(ABMP("PAYOR"))=ABM("I") S ABMP("PAYOR")=44
 S ABM("I")=ABM("I")-1
 Q
 ;
PREV S ABM("C")="" F  S ABM("C")=$O(^ABMDBILL(DUZ(2),"AS",+^ABMDBILL(DUZ(2),ABMP("BDFN"),0),ABM("C"))) Q:ABM("C")=""  D
 .S ABM("B")=0 F  S ABM("B")=$O(^ABMDBILL(DUZ(2),"AS",+^ABMDBILL(DUZ(2),ABMP("BDFN"),0),ABM("C"),ABM("B"))) Q:'ABM("B")  D
 ..I $D(^ABMDBILL(DUZ(2),ABM("B"),0)),$P(^(0),U,8)=+ABM("I0"),$P(^(0),U,5)=ABMP("PDFN") D
 ...S ABM("J")=0 F  S ABM("J")=$O(^ABMDBILL(DUZ(2),ABM("B"),3,ABM("J"))) Q:'ABM("J")  D
 ....S ABM("PD")=$P(^ABMDBILL(DUZ(2),ABM("B"),3,ABM("J"),0),U,2)+ABM("PD"),ABM("DEDCT")=ABM("DEDCT")+$P(^(0),U,3),ABM("COINS")=ABM("COINS")+$P(^(0),U,4),ABMP("PAID")=ABMP("PAID")+$P(^(0),U,2),ABM("WO")=$P(^(0),U,6)
 ....I $P(^ABMDBILL(DUZ(2),ABM("B"),2),U,4)=0 S ABMP("TW")=ABMP("TW")+ABM("WO")
 K ABM("B"),ABM("J")
 Q
 ;
 ; Insured Section
INSRD Q:'$D(^ABMDBILL(DUZ(2),ABMP("BDFN"),13,ABM("XIEN"),0))  Q:"U"[$P(^(0),U,3)!'$D(^AUTNINS($P(^(0),"^",1),0))
 I "NI"[$P($G(^AUTNINS(ABM("I0"),2)),U),$P(^(2),U)]"" Q
 I $P($G(^AUTNINS(ABM("I0"),1)),U,7)=4 Q
 S ABMF(ABM("I")+5)=$P($P(ABMV("X2"),U),";",2)_U_$S($P(ABMV("X2"),U,6)]"":$P(ABMV("X2"),U,6),1:"U")_U_$P($G(^AUTTRLSH(+$P(ABMV("X2"),U,2),0)),U,2)_U_$P(ABMV("X1"),U,4)_U_$P(ABMV("X3"),U,6,7)
 I ABM("I0")=$P(ABMP("B0"),U,8),$P(^ABMDBILL(DUZ(2),ABMP("BDFN"),13,ABM("XIEN"),0),"^",3)="I",1'=+$P(ABMF(ABM("I")+5),U,3) D PRIHOLD
 D EMPL
 Q
 ;
PRIHOLD S $P(ABMF(12),U)=$P($P(ABMV("X2"),U),";",2)
 S $P(ABMF(13),U)=$P(ABMV("X2"),U,3)
 S $P(ABMF(14),U)=$P(ABMV("X2"),U,4)
 S $P(ABMF(15),U)=$P(ABMV("X2"),U,5)
 Q
 ;
EMPL ; Employment Info
 Q:$P(ABMV("X3"),U)=""
 S ABM("CNT")=ABM("CNT")+1 Q:ABM("CNT")>2
 S ABMF(49+ABM("CNT"))=ABM("Z")_U_$P(ABMV("X3"),U,5)_U_$P(ABMV("X3"),U)_U_$P(ABMV("X3"),U,8)_U_$P(ABMV("X3"),U,2)_", "_$P(ABMV("X3"),U,3)
 Q
