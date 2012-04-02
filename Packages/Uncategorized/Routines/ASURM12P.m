ASURM12P ; IHS/ITSC/LMH -RPT 12 LIST INACTIVE ITEMS ; 
 ;;4.2T2;Supply Accounting Mgmt. System;;JUN 30, 2000
 ;This routine formats and prints report 12, List Inactive Items
 ;from sorted extracts.
EN ;EP;PRIMARY ENTRY POINT FOR REPORT 12
 I '$D(IO) D HOME^%ZIS
 I '$D(DUZ(2)) W !,"Report must be run from Kernel option" Q
 I '$D(ASUL(1,"AR","AP")) D SETAREA^ASULARST
 S ASUK("PTRSEL")=$G(ASUK("PTRSEL")) I ASUK("PTRSEL")]"" G PSER
 S ZTRTN="PSER^ASURD12P",ZTDESC="SAMS RPT 12" D O^ASUUZIS
 I POP S IOP=$I D ^%ZIS Q
 I ASUK(ASUK("PTR"),"Q") Q
PSER ;EP;FOR TASKMAN QUEUE OF PRINT
 D:'$D(^XTMP("ASUR","R12")) SORT
 Q:$O(^XTMP("ASUR","R12",0))=""  ;WAR 10/1/99 no data for Dir Issue
 D U^ASUUZIS
 S (ASUC("PG"),ASUMS("E#","STA"))=0,ASUF("BK")=0
 S ASUMS("E#","STA")=$O(^XTMP("ASUR","R12",0)) D ARE^ASULARST($E(ASUMS("E#","STA"),1,2)),STA^ASULARST(ASUMS("E#","STA"))
 S ASURX("ACG")=$O(^XTMP("ASUR","R12",ASUMS("E#","STA"),0)) D ACGNM^ASULDIRF(ASURX("ACG"))
 S ASUV("RPT")="R12",ASUQ("HDR")="HEADER^ASURM12P"
 D ^ASUUDATA I ASUX("NDTA") G K
 S (ASUC("PG"),ASUMS("E#","STA"))=0,ASUF("BK")=""
 F  S ASUMS("E#","STA")=$O(^XTMP("ASUR","R12",ASUMS("E#","STA"))) Q:ASUMS("E#","STA")']""  D  Q:$D(DTOUT)  Q:$D(DUOUT)
 .D ARE^ASULARST($E(ASUMS("E#","STA"),1,2)),STA^ASULARST(ASUMS("E#","STA"))
 .S ASURX("ACG")=0
 .S:ASUF("BK")'="" ASUF("BK")=3
 .F  S ASURX("ACG")=$O(^XTMP("ASUR","R12",ASUMS("E#","STA"),ASURX("ACG"))) Q:ASURX("ACG")']""  D  Q:$D(DTOUT)  Q:$D(DUOUT)
 ..D ACGNM^ASULDIRF(ASURX("ACG")) S ASUV("ACGNM")=ASUL(9,"ACG","NM")
 ..S:ASUF("BK")=0 ASUF("BK")=2
 ..S ASUMS("E#","IDX")=0
 ..F  S ASUMS("E#","IDX")=$O(^XTMP("ASUR","R12",ASUMS("E#","STA"),ASURX("ACG"),ASUMS("E#","IDX"))) Q:ASUMS("E#","IDX")']""  D  Q:$D(DUOUT)  Q:$D(DTOUT)
 ...S ASUV("LIMOS")=$FN(^XTMP("ASUR","R12",ASUMS("E#","STA"),ASURX("ACG"),ASUMS("E#","IDX"))/30,",",0)
 ...S ASUMX("E#","IDX")=ASUMS("E#","IDX")
 ...D READ^ASUMXDIO,^ASUMSTRD D:ASUF("BK") HEADER Q:$D(DUOUT)  Q:$D(DTOUT)
 ...W !,ASUL(9,"ACG"),ASUMS("EOQ","TP"),ASUMS("SRC")
 ...W ?6,$E(ASUMX("IDX"),1,5),".",$E(ASUMX("IDX"),6),?15,ASUMX("DESC",1)
 ...D NSNFMT W ?50,ASUV("NSN"),?70,ASUMX("AR U/I"),?75,$E(ASUMS("LSTISS"),2,3),"-",$E(ASUMS("LSTISS"),4,5)
 ...W ?85,$J($FN(ASUMS("QTY","O/H"),","),5),?92,$J($FN(ASUMS("CST/U"),",",2),8)
 ...W ?103,$J($FN(ASUMS("VAL","O/H"),",",2),8),?113,$J($FN(ASUMS("D/I","QTY-TOT"),","),5),?119,$J(ASUV("LIMOS"),6),?126,$J(ASUMS("PMIQ"),6),!
 ...S ASUC("TOTLI")=$G(ASUC("TOTLI"))+1
 ...S ASUC("TOTVAL")=$G(ASUC("TOTVAL"))+ASUMS("VAL","O/H")
 ...W ?7,ASUMS("SLC"),?15,ASUMX("DESC",2),!
 ...S:ASUF("BK")="" ASUF("BK")=0
 ...S ASUC("LINE")=ASUC("LINE")+3 S:ASUC("LINE")>55 ASUF("BK")=1
 D FOOTER
K ;
 D PAZ^ASUURHDR I ASUK("PTRSEL")']"" D
 .D C^ASUUZIS
 K ASUMX,ASUMS,ASURX,ASUX,ASUC,ASUF("BK")
 Q
NSNFMT ;
 I ASUMS("ORD#")]"" D
 .I $E(ASUMS("ORD#"))="M" S ASUV("NSN")=ASUMS("ORD#") Q
 .I ASUMS("ORD#")]"" S ASUV("NSN")=ASUMS("ORD#")
 .E  S ASUV("NSN")=ASUMX("NSN")
 .I $L(ASUV("NSN"))=4 Q
 .S ASUV("NSN")=$E(ASUV("NSN"),1,4)_"-"_$E(ASUV("NSN"),5,$L(ASUV("NSN")))
 .I $L(ASUV("NSN"))>7 S ASUV("NSN")=$E(ASUV("NSN"),1,7)_"-"_$E(ASUV("NSN"),8,$L(ASUV("NSN")))
 .I $L(ASUV("NSN"))>11 S ASUV("NSN")=$E(ASUV("NSN"),1,11)_"-"_$E(ASUV("NSN"),12,$L(ASUV("NSN")))
 E  D
 .S ASUV("NSN")=""
 Q
HEADER ;EP ;HEADING LINES
 I ASUF("BK")>1 D FOOTER
 S ASUF("BK")=0
 S ASUC("PG")=$G(ASUC("PG"))+1,ASUC("LINE")=5
 I ASUC("PG")>1 D PAZ^ASUURHDR Q:$D(DUOUT)  Q:$D(DTOUT)
 W @(IOF),"REPORT #12 LISTING OF STOCK ITEMS WITH NO ISSUES IN THREE MONTHS",?90,ASUK("DT"),?110,"PAGE",?115,$J($FN(ASUC("PG"),","),7)
 W !,"AREA",?6,ASUL(1,"AR","AP"),?9,ASUL(1,"AR","NM")
 W !,"STAT",?6,ASUL(2,"STA","CD"),?9,ASUL(2,"STA","NM"),?50,"G L ACCOUNT 125.",ASUL(9,"ACG"),?68,ASUL(9,"ACG","NM"),!
 W !,"A",?75,"LAST",?88,"QTY",?115,"QTY  MONTHS"
 W !,"CTS",?8,"INDEX",?74,"ISSUE",?89,"ON",?96,"UNIT",?105,"TOTAL",?115,"DUE",?123,"W/O"
 W !,"CYC",?7,"NUMBER",?15,"DESCRIPTION",?50,"NSN/ORDER NUMBER",?70,"U/I",?75,"DATE",?87,"HAND",?96,"COST",?105,"VALUE",?116,"IN",?121,"ISSUE",?127,"PAMIQ",!
 Q
FOOTER ;
 W !?10,"TOTAL",?20,ASUV("ACGNM"),?40,"LINE ITEMS",?55,$J($FN($G(ASUC("TOTLI")),","),8),?92,"VALUE",?101,$J($FN($G(ASUC("TOTVAL")),",",2),10)
 S (ASUC("TOTVAL"),ASUC("TOTLI"))=0
 Q
SORT ;EP ;
 K ^XTMP("ASUR","R12")
 S ^XTMP("ASUR","R12",0)=ASUK("DT","FM")+10000_U_ASUK("DT","FM")
 ;S ASUMS("E#","STA")=0  ;WAR 5/20/99 replaced w/next line
 S ASUMS("E#","STA")=ASUL(2,"STA","E#")-1  ;this station only 
 ;F  S ASUMS("E#","STA")=$O(^ASUMS(ASUMS("E#","STA"))) Q:ASUMS("E#","STA")'?1N.N  D  ;WAR 5/20/99  replaced w/next line
 F  S ASUMS("E#","STA")=$O(^ASUMS(ASUMS("E#","STA"))) Q:ASUMS("E#","STA")'=ASUL(2,"STA","E#")  D  ;this station only, NOT all stations
 .F ASUMS("E#","IDX")=0:0 S ASUMS("E#","IDX")=$O(^ASUMS(ASUMS("E#","STA"),1,ASUMS("E#","IDX"))) Q:ASUMS("E#","IDX")'?1N.N  D
 ..S ASUMS("LSTISS")=$P(^ASUMS(ASUMS("E#","STA"),1,ASUMS("E#","IDX"),0),U,13)
 ..S X1=ASUK("DT","FM"),X2=ASUMS("LSTISS") D ^%DTC
 ..Q:X<91
 ..S ASUV("LIDAYS")=X
 ..S ASUMX("ACC")=$P($G(^ASUMX(ASUMS("E#","IDX"),0)),U,6)
 ..Q:ASUMX("ACC")']""
 ..D ACC^ASULDIRF(ASUMX("ACC"))
 ..S ^XTMP("ASUR","R12",ASUMS("E#","STA"),ASUL(9,"ACG"),ASUMS("E#","IDX"))=ASUV("LIDAYS")
 Q