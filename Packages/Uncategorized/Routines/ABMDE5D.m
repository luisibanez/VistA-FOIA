ABMDE5D ; IHS/ASDST/DMJ - Edit Page 5 - ICD PROCEDURE VIEW ; 
 ;;2.6;IHS 3P BILLING SYSTEM;;NOV 12, 2009
 ;
 ;IHS/DED/DMJ - 5/12/1999 - NOIS HQW-0599-100027
 ;      Changed mm/dd DOS display to full Charge Date
 ;
 ; IHS/SD/SDR - v2.6 CSV
 ;
DISP2 ;EP - Entry Point to Display Dx Info
 K ABMZ S ABMZ("TITL")="ICD PROCEDURES",ABMZ("PG")="5B"
 D B^ABMDE5X
 I $D(ABMP("DDL")),$Y>(IOSL-9) D PAUSE^ABMDE1 G:$D(DUOUT)!$D(DTOUT)!$D(DIROUT) XIT I 1
 E  D SUM^ABMDE1
 ;
PROC ; ICD Procedure Info
 S ABMZ("SUB")=19,ABMZ("ITEM")="Procedure",ABMZ("DIC")="^ICD0("
 S ABMZ("X")="DINUM"
 S ABMZ("DR")=";W !;.03//"_ABMP("VISTDT")
 S ABMZ("NARR")=";.04////"_U_4_U_5
 D HD2 G LOOP2
HD2 W !,"BIL",?4,"SERV",?12,"ICD0"
 W !,"SEQ",?4,"DATE",?12,"CODE -",?19,"PROCEDURE DESCRIPTION",?54,"PROVIDER'S NARRATIVE"
 W !,"===",?4,"=====",?11,"===================================",?48,"================================"
 Q
LOOP2 ;LOOP 2
 S (ABMZ("LNUM"),ABMZ("NUM"),ABMZ(1))=0,ABM=0
 F ABM("I")=1:1 S ABM=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),19,"C",ABM)) Q:'ABM!($D(DIROUT))!($D(DTOUT))!($D(DUOUT))  D
 .S ABM("X")=$O(^ABMDCLM(DUZ(2),ABMP("CDFN"),19,"C",ABM,0))
 .S ABMZ("NUM")=ABM("I")
 .D PX
 G XIT:$D(DUOUT)!$D(DTOUT)!$D(DIROUT)
 S ABM("L")=ABMZ("LNUM")+1,ABMZ("DR2")=";.02////"_ABM("L")
 I +$O(ABME(0)) S ABME("CONT")="" D ^ABMDERR K ABME("CONT")
 Q
PX ;
 S ABM("X0")=^ABMDCLM(DUZ(2),ABMP("CDFN"),19,ABM("X"),0)
 S ABM("ICD0IEN")=$P(ABM("X0"),U)
 Q:'$D(^ICD0(ABM("ICD0IEN"),0))  S ABMZ(ABM("I"))=$P($$ICDOP^ABMCVAPI(ABM("ICD0IEN"),ABMP("VDT")),U,2)_U_ABM("X")_U_$P(ABM("X0"),U)_U_$P(ABM("X0"),U,3)_U_$P(ABM("X0"),U,4)  ;CSV-c
 I $Y>(IOSL-5) D PAUSE^ABMDE1 Q:$D(DUOUT)!$D(DTOUT)!$D(DIROUT)  D HD2
 S ABM("Y")=$P(^ABMDCLM(DUZ(2),ABMP("CDFN"),19,ABM("X"),0),U,3) S:ABMZ("LNUM")<$P(^(0),U,2) ABMZ("LNUM")=$P(^(0),U,2) I $D(^(1)),$P(^ABMDPARM(DUZ(2),1,0),U,14)="Y" S ABMU("TXT")=$$ICDDX^ABMCVAPI(ABM("X"),ABMP("VDT"))  ;CSV-c
 E  S ABMU("TXT")=$P($$DX^ABMCVAPI(ABM("X"),ABMP("VDT")),U,4)  ;CSV-c
 W !,$J(ABM("I"),2),?4,"CHARGE DATE: ",$$SDT^ABMDUTL(ABM("Y"))
 W !,?11,$P($$ICDOP^ABMCVAPI(ABM("ICD0IEN"),ABMP("VDT")),U,2)," -" I $D(^(1)),$P(^ABMDPARM(DUZ(2),1,0),U,14)="Y" S ABMU("TXT")=$P($$ICDDOP^ABMCVAPI(ABM("ICD0IEN"),ABMP("VDT")),U)  ;CSV-c
 E  S ABMU("TXT")=$P($$ICDOP^ABMCVAPI(ABM("ICD0IEN"),ABMP("VDT")),U,5)  ;CSV-c
 S ABMU("LM")=19,ABMU("RM")=46,ABMU("TAB")=5
 S ABMU("2TXT")=$S($P(ABM("X0"),U,4)]"":$P($G(^AUTNPOV($P(ABM("X0"),U,4),0)),U),1:""),ABMU("2TAB")=-2,ABMU("2LM")=48,ABMU("2RM")=80
 D ^ABMDWRAP
 Q
 ;
XIT K ABME
 Q