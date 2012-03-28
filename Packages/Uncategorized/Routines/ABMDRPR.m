ABMDRPR ; IHS/ASDST/DMJ - Productivity Listing ;
 ;;2.6;IHS 3P BILLING SYSTEM;;NOV 12, 2009
 ;Original;TMD;
 ;
 K ABM,ABMY S ABM("OVER-DUE")=2,ABM("APPR")=DUZ,ABM("RTYP")=3,ABM("RTYP","NM")="STATISTICAL SUMMARY ONLY"
 D ^ABMDRSEL G XIT:$D(DTOUT)!$D(DUOUT)!$D(DIROUT)
 S ABM("HD",0)="PRODUCTIVITY REPORT"_$S($D(ABMY("APPR")):" by "_$P(^VA(200,ABMY("APPR"),0),U),1:" for All Employees") D ^ABMDRHD
 S ABM("PRIVACY")=1
 S ABMQ("RC")="COMPUTE^ABMDRPR",ABMQ("RX")="POUT^ABMDRUTL",ABMQ("NS")="ABM"
 S ABMQ("RP")="PRINT^ABMDRPR"_ABM("RTYP")
 D ^ABMDRDBQ
 Q
 ;
COMPUTE ;EP - Entry Point for Setting up Data
 S ABM("SUBR")="ABM-PR" K ^TMP("ABM-PR",$J)
 S ABMP("RTN")="ABMDRPR" D LOOP^ABMDRUTL
 Q
 ;
DATA S ABMP("HIT")=0 D ^ABMDRCHK Q:'ABMP("HIT")
 Q:$P(^ABMDBILL(DUZ(2),ABM,0),"^",4)="X"
 S ABM("SORT")=$S(ABMY("SORT")="C":ABM("C"),1:ABM("V"))
 S ABM("L")=$P(^DIC(4,ABM("L"),0),U)
 S ^TMP("ABM-PR",$J,ABM("A"),ABM("L")_U_ABM("SORT")_U_$E($P(^AUTNINS(ABM("I"),0),U),1,15)_U_$E($P(^DPT(ABM("P"),0),U),1,15)_U_ABM)=""
 I '$D(ABM("ST",ABM("A"),ABM("L"),ABM("SORT"))) S ABM("ST",ABM("A"),ABM("L"),ABM("SORT"))=""
 S $P(ABM("ST",ABM("A"),ABM("L"),ABM("SORT")),U)=$P(ABM("ST",ABM("A"),ABM("L"),ABM("SORT")),U)+1
 S $P(ABM("ST",ABM("A"),ABM("L"),ABM("SORT")),U,2)=$P(ABM("ST",ABM("A"),ABM("L"),ABM("SORT")),U,2)+$P($G(^ABMDBILL(DUZ(2),ABM,2)),U)
 Q
 ;
XIT K ABM,ABMY,ABMP
 Q
