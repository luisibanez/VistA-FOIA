ABMDRAL ; IHS/ASDST/DMJ - Bill Listing ;
 ;;2.6;IHS 3P BILLING SYSTEM;**4**;NOV 12, 2009
 ;Original;TMD;
 ; IHS/SD/SDR -abm*2.6*4 - HEAT12210 - put subscripts in the correct order
 ;
 K ABM,ABMY
 K DIR S DIR(0)="SO^1:UNPAID BILLS;2:PAID BILLS;3:ALL BILLS;4:INCOMPLETE BILLS"
 S DIR("B")=3,DIR("A")="Select TYPE of REPORT"
 D ^DIR K DIR Q:$D(DIRUT)  S ABMP("TYP")=+Y-1
 S:ABMP("TYP")=3 ABMP("COMPL")=1
 I ABMP("TYP")>0 S ABM("PAY")="",ABM("COST")=""
 E  S ABM("OVER-DUE")=""
 S ABM("RTYP")=1,ABM("RTYP","NM")="BRIEF LISTING (80 Width)" D ^ABMDRSEL G XIT:$D(DTOUT)!$D(DUOUT)!$D(DIROUT)
HD S ABM("HD",0)="LISTING of "_$S(ABMP("TYP")=0:"UNPAID",ABMP("TYP")=1:"PAID",ABMP("TYP")=3:"INCOMPLETE",1:"ALL")_" BILLS" D ^ABMDRHD G XIT:'$D(IO)!$G(POP)!$D(DTOUT)!$D(DUOUT)
 S ABMQ("RC")="COMPUTE^ABMDRAL",ABMQ("RX")="POUT^ABMDRUTL",ABMQ("NS")="ABM"
 I 'ABMP("TYP") S ABMQ("RP")="PRINT^ABMDRUN"_ABM("RTYP")
 E  S ABMQ("RP")="PRINT^ABMDRAL"_ABM("RTYP")
 D ^ABMDRDBQ
 Q
 ;
COMPUTE ;EP - Entry Point for Setting up Data
 S ABM("SUBR")="ABM-AL" K ^TMP(ABM("SUBR"),$J),^TMP("ABM-AL",$J,"ST")
 S ABMP("RTN")="ABMDRAL" D LOOP^ABMDRUTL
 Q
 ;
DATA S ABMP("HIT")=0 D ^ABMDRCHK Q:'ABMP("HIT")
 S ABM("S1")=$S(ABMY("SORT")="C":ABM("C"),1:ABM("V"))
 S ABM("S2")=$S(ABM("RTYP")=3:0,1:$P(^AUTNINS(ABM("I"),0),U))
 S ABM("S3")=$S(ABM("RTYP")=3:0,1:ABM)
 S ABM("L")=$P(^DIC(4,ABM("L"),0),U)
 G STAT:ABM("RTYP")>2
 S ^TMP("ABM-AL",$J,$E(ABM("L"),1,18)_U_ABM("S1")_U_$E(ABM("S2"),1,18)_U_$E($P(^DPT(ABM("P"),0),U),1,18)_U_ABM)=""
 Q
 ;
STAT I '$D(^TMP("ABM-AL",$J,"ST",ABM("L"),ABM("S1"),ABM("S2"),ABM("S3"))) S ^TMP("ABM-AL",$J,"ST",ABM("L"),ABM("S1"),ABM("S2"),ABM("S3"))=""
 ;S $P(^TMP("ABM-AL","ST",$J,ABM("L"),ABM("S1"),ABM("S2"),ABM("S3")),U)=$P(^TMP("ABM-AL",$J,"ST",ABM("L"),ABM("S1"),ABM("S2"),ABM("S3")),U)+1  ;abm*2.6*4 HEAT12210
 S $P(^TMP("ABM-AL",$J,"ST",ABM("L"),ABM("S1"),ABM("S2"),ABM("S3")),U)=$P(^TMP("ABM-AL",$J,"ST",ABM("L"),ABM("S1"),ABM("S2"),ABM("S3")),U)+1  ;abm*2.6*4 HEAT12210
 S $P(^TMP("ABM-AL",$J,"ST",ABM("L"),ABM("S1"),ABM("S2"),ABM("S3")),U,2)=$P(^TMP("ABM-AL",$J,"ST",ABM("L"),ABM("S1"),ABM("S2"),ABM("S3")),U,2)+$P($G(^ABMDBILL(DUZ(2),ABM,2)),U)
 Q:'ABMP("TYP")
 ;
PREV S (ABM("J"),ABM("PD"),ABM("DEDCT"))=0
 F  S ABM("J")=$O(^ABMDBILL(DUZ(2),ABM,3,ABM("J"))) Q:'ABM("J")  S ABM("PDD")=+^(ABM("J"),0) D
 .I $G(ABMY("DT"))="P",ABM("PDD")<ABMY("DT",1)!(ABM("PDD")>ABMY("DT",2)) Q
 .S ABM("PD")=$P(^ABMDBILL(DUZ(2),ABM,3,ABM("J"),0),U,2)+ABM("PD"),ABM("DEDCT")=ABM("DEDCT")+$P(^(0),U,3)+$P(^(0),U,4)
 S (ABM("WO"),ABM("OB"))=0
 I $P(^ABMDBILL(DUZ(2),ABM,0),U,4)="C" S ABM("WO")=^(2)-ABM("PD")-ABM("DEDCT")
 E  S ABM("OB")=$P(^ABMDBILL(DUZ(2),ABM,2),U)-ABM("PD")-ABM("DEDCT")
 I ABM("WO")<0 S ABM("OB")=ABM("WO"),ABM("WO")=0
 S $P(^TMP("ABM-AL",$J,"ST",ABM("L"),ABM("S1"),ABM("S2"),ABM("S3")),U,3)=$P(^TMP("ABM-AL",$J,"ST",ABM("L"),ABM("S1"),ABM("S2"),ABM("S3")),U,3)+ABM("PD")
 S $P(^TMP("ABM-AL",$J,"ST",ABM("L"),ABM("S1"),ABM("S2"),ABM("S3")),U,4)=$P(^TMP("ABM-AL",$J,"ST",ABM("L"),ABM("S1"),ABM("S2"),ABM("S3")),U,4)+ABM("DEDCT")
 S $P(^TMP("ABM-AL",$J,"ST",ABM("L"),ABM("S1"),ABM("S2"),ABM("S3")),U,5)=$P(^TMP("ABM-AL",$J,"ST",ABM("L"),ABM("S1"),ABM("S2"),ABM("S3")),U,5)+ABM("WO")
 S $P(^TMP("ABM-AL",$J,"ST",ABM("L"),ABM("S1"),ABM("S2"),ABM("S3")),U,6)=$P(^TMP("ABM-AL",$J,"ST",ABM("L"),ABM("S1"),ABM("S2"),ABM("S3")),U,6)+ABM("OB")
 Q
 ;
XIT K ABM,ABMY,ABMP
 Q