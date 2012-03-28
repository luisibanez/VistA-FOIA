ACHSVDC ; IHS/ITSC/PMF - DOCUMENTS BY PROVIDER/VENDOR ;    [ 12/23/2004  11:17 AM ]
 ;;3.1;CONTRACT HEALTH MGMT SYSTEM;**11,12**;JUN 11, 2001
 ;3.1*11 9.8.04 IHS/ITSC/FCJ added additonal sort by PAT or PO
 ;3.1*12 11.8.04 IHS/ITSC/FCJ sort by PAT or PO patched
 ;
A ;
 S DIC="^AUTTVNDR("
 S DIC(0)="AEZQM"
 S DIC("A")="Enter Provider/Vendor: "
 D ^DIC K DIC
 I +Y<1 D K Q
 ;
 S ACHSVDOR=+Y,ACHSIO=IO
 I '$D(^ACHSF(DUZ(2),"VB",ACHSVDOR)) W *7,!!,"This vendor has no CHS documents on file.",! W:$$DIR^XBDIR("E","Press <RETURN> To Continue....") "" G A
BDT ;
 S ACHSBDT=$$DATE^ACHS("B","DOCUMENTS BY PROVIDER/VENDOR")
 I $D(DUOUT)!$D(DTOUT)!(ACHSBDT<1) D K Q
 ;
EDT ;
 S ACHSEDT=$$DATE^ACHS("E","DOCUMENTS BY PROVIDER/VENDOR")
 I $D(DTOUT)!(ACHSEDT<1) D K Q
 G BDT:$D(DUOUT)
 G:$$EBB^ACHS(ACHSBDT,ACHSEDT) EDT
B ;
 W !!,"TYPE of service:"
 S ACHS("A")=$P($G(^DD(9002080.01,3,0)),U,3)
 F ACHS=1:1 S ACHS(ACHS)=$P(ACHS("A"),";",ACHS) Q:ACHS(ACHS)=""  W ?20,$P(ACHS(ACHS),":"),"   ",$P(ACHS(ACHS),":",2),!
 W !,"Select TYPE of service (1 - ",ACHS-1,"  'A' = 'ALL') ALL // "
 D READ^ACHSFU
 I $G(ACHSQUIT) D K Q
 G BDT:$D(DUOUT)
 S:(Y="") Y="A"
 G B3:Y="A"
 I ($E(Y)="?")!(Y<1)!(Y>(ACHS-1)) W !!,"Enter an 'A' to view documents for all types of service,",!,"otherwise, enter a number from 1 to ",ACHS-1,".",! G B
B3 ;
 K ACHSTYPE
 S:Y="A" ACHSTYPE="ALL"
 I '$D(ACHSTYPE) S ACHSTYPE=+Y
D ;
 W !!,"Type of Report:"
 W !!,"1  list only PAID documents"
 W !,"2  list only OPEN documents"
 W !,"3  list only CANCELLED documents"
 W !,"4  list ALL documents"
 W !,"5  print TOTALS ONLY (no specific documents)",!!
 W "list ALL documents// "
 D READ^ACHSFU
 I $G(ACHSQUIT) D K Q
 G B:$D(DUOUT)
 S:(Y="") Y=4
 I ($E(Y)="?")!(+Y<1)!(+Y>5) W !!,*7,"Enter only '1' through '5'." G D
 S ACHSRPT=+Y
 ;ACHS*3.1*11 9.8.04 IHS/ITSC/FCJ ADDED NXT SECT
SORT ;SORT BY PATIENT OR PO
 G:ACHSRPT=5 DEV
 S DIR(0)="S^1:Purchase Order;2:Patient",DIR("A")="Sort by",DIR("B")=2
 D ^DIR K DIR
 I $D(DUOUT)!$D(DTOUT) G K Q
DEV ;
 S ACHSSRT=Y
 ;ACHS*3.1*11 9.8.04 IHS/ITSC/FCJ END OF CHANGES
 S %=$$PB^ACHS
 I %=U!$D(DTOUT)!$D(DUOUT) D K Q
 I %="B" D VIEWR^XBLM("PRINT^ACHSVDC"),EN^XBVK("VALM"),K Q
 S %ZIS="OPQ"
 D ^%ZIS
 I POP D HOME^%ZIS D K Q
 G:'$D(IO("Q")) PRINT
 K IO("Q")
 I $D(IO("S"))!($E(IOST)'="P") W *7,!,"Please queue to system printers." D ^%ZISC G DEV
 S ZTRTN="PRINT^ACHSVDC",ZTDESC="CHS VENDOR Document Summary, "_$$FMTE^XLFDT(ACHSBDT)_" to "_$$FMTE^XLFDT(ACHSEDT)_" for "_ACHSVDOR
 F ACHS="ACHSSRT","ACHSVDOR","ACHSBDT","ACHSRPT","ACHSEDT","ACHSTYPE" S ZTSAVE(ACHS)=""
 D ^%ZTLOAD
 G:'$D(ZTSK) DEV
K ;
 K A,ACHS,ACHSIO,ACHSVDOR,ACHSBDT,DTOUT,DUOUT,ACHSEDT,ACHSRPT,ACHSTYPE,ZTSK
 D ^%ZISC
 Q
 ;
PRINT ;EP - TaskMan.
 Q:'$D(^AUTTVNDR(ACHSVDOR))
 D FC^ACHSUF
 I $D(ACHSERR),ACHSERR=1 G KILL
 S (ACHSDOC,ACHSOPEN,ACHSOPEN("$"),ACHSPD,ACHSPD("$"),ACHSCNX,ACHSCNX("$"))=0
 S ACHST3=$$C^XBFUNC($S(ACHSRPT=1:"PAID documents only",ACHSRPT=2:"OPEN documents only",ACHSRPT=3:"CANCELLED documents only",1:""),80)
 S ACHST1=$$C^XBFUNC($P(^AUTTVNDR(ACHSVDOR,0),U)_"    EIN #: "_$P(^AUTTVNDR(ACHSVDOR,11),U),80)
 S ACHST2=$$C^XBFUNC("For the period "_$$FMTE^XLFDT(ACHSBDT)_" through "_$$FMTE^XLFDT(ACHSEDT),80)
 D BRPT^ACHSFU,HDR
 I ACHSRPT<5 S ACHSTOS=$P(^DD(9002080.01,3,0),U,3),ACHSSTS=$P(^DD(9002080.01,11,0),U,3)
DOC ;
 S ACHSDOC=$O(^ACHSF(DUZ(2),"VB",ACHSVDOR,ACHSDOC))
 ;I ACHSDOC="" D END Q ;ACHS*3.1*11 9.8.04 IHS/ITSC/FCJ
 I ACHSDOC="",ACHSRPT=5 D END Q  ;ACHS*3.1*11 9.8.04 IHS/ITSC/FCJ
 I ACHSDOC="" G DOC1 ;ACHS*3.1*11 9.8.04 IHS/ITSC/FCJ
 S ACHSDOC0=$G(^ACHSF(DUZ(2),"D",ACHSDOC,0))
 I ACHSDOC0="" W !!,"NO DOCUMENT ZERO NODE FOR X-REF VB FOR FACILITY: "_DUZ(2)_" DOCUMENT IEN: "_ACHSDOC D KILL Q
 G DOC:+$P(ACHSDOC0,U,2)<ACHSBDT,DOC:+$P(ACHSDOC0,U,2)>ACHSEDT,DOC:(ACHSTYPE'="ALL")&(ACHSTYPE'=$P(ACHSDOC0,U,4))
 I ACHSRPT<4 S C=$P(ACHSDOC0,U,12) G DOC:ACHSRPT=1&(C'=3),DOC:ACHSRPT=2&(C>2),DOC:ACHSRPT=3&(C'=4)
 G RPT5:ACHSRPT=5
 ;ACHS*3.1*11 9.8.04 IHS/ITSC/FCJ START OF CHANGES
 S ACHSTYP=$P(ACHSDOC0,U,3)
 S X=$S(ACHSTYP=1:"* BLANKET",ACHSTYP=2:"* SPECIAL TRANS",ACHSTYP=0:$P(^DPT($P(^ACHSF(DUZ(2),"D",ACHSDOC,"T",1,0),U,3),0),U),1:"")
 S ^TMP($J,"ACHSVDC",ACHSDOC)=X
 S ^TMP($J,"ACHSVDC","B",X,ACHSDOC)=""
 G DOC
DOC1 S ACHSDOC=0,ACHSPAT=0
 I ACHSSRT=1 F  S ACHSDOC=$O(^TMP($J,"ACHSVDC",ACHSDOC)) Q:ACHSDOC'?1N.N  D DOC2
 I ACHSSRT'=1 F  S ACHSPAT=$O(^TMP($J,"ACHSVDC","B",ACHSPAT)) Q:ACHSPAT=""  D
 .S ACHSDOC=0
 .F  S ACHSDOC=$O(^TMP($J,"ACHSVDC","B",ACHSPAT,ACHSDOC)) Q:ACHSDOC'?1N.N  D DOC2
 I $G(ACHSQUIT) D K Q
 D END Q
DOC2 ;ACHS*3.1*11 9.8.04 IHS/ITSC/FCJ END OF CHANGES
 S ACHSDOC0=$G(^ACHSF(DUZ(2),"D",ACHSDOC,0))
 W !,"DOC. #: ",$P(ACHSDOC0,U,14),"-",ACHSFC,"-",$P(ACHSDOC0,U),"  ("
 K Y
 I $D(^ACHSF(DUZ(2),"D",ACHSDOC,3)),+$P(^(3),U)>0 S Y=+$P(^(3),U)
 S:'$D(Y) Y=+$P(ACHSDOC0,U,2)
 W $$FMTE^XLFDT(Y),")",?45,"SERVICE: ",$P($P(ACHSTOS,";",$P(ACHSDOC0,U,4)),":",2)
 W !?2
 S DFN=$P(^ACHSF(DUZ(2),"D",ACHSDOC,"T",1,0),U,3)
 I +DFN,$D(^DPT(DFN)) W $P(^DPT(DFN,0),U)
 I $P(ACHSDOC0,U,3) W $S($P(ACHSDOC0,U,3)=1:"* BLANKET",$P(ACHSDOC0,U,3)=2:"* SPECIAL TRANS",1:"")
RPT5 ;
 W:ACHSRPT<5 ?45
 I '$D(^ACHSF(DUZ(2),"D",ACHSDOC,"PA")) G P5
 ;
 S ACHS("$")=$S($D(^ACHSF(DUZ(2),"D",ACHSDOC,"ZA")):+^ACHSF(DUZ(2),"D",ACHSDOC,"ZA"),1:+^ACHSF(DUZ(2),"D",ACHSDOC,"PA"))
 I ACHSRPT<5 W "(PAID: " S X=ACHS("$"),X2="2$" D FMT^ACHS W ")"
 S ACHSPD=ACHSPD+1,ACHSPD("$")=ACHSPD("$")+ACHS("$")
 G P6
 ;
P5 ;
 I $P(ACHSDOC0,U,12)]"",ACHSRPT<5 W "(",$P($P(ACHSSTS,";",$P(ACHSDOC0,U,12)+1),":",2),": "
 S ACHS("$")=$S($D(^ACHSF(DUZ(2),"D",ACHSDOC,"ZA")):+^("ZA"),1:$P(ACHSDOC0,U,9))
 I $P(ACHSDOC0,U,12)=4 S ACHS("$")=0,A(1)=$O(^ACHSF(DUZ(2),"D",ACHSDOC,"T",0)) F ACHS=0:0 Q:+A(1)=0  S ACHS("$")=+$P(^(A(1),0),U,4),A(1)=$O(^ACHSF(DUZ(2),"D",ACHSDOC,"T",A(1)))
 I ACHSRPT<5 S X=ACHS("$"),X2="2$" D FMT^ACHS W ")"
 I $P(ACHSDOC0,U,12)=4 S ACHSCNX=ACHSCNX+1,ACHSCNX("$")=ACHSCNX("$")+ACHS("$") G P6
 I $P(ACHSDOC0,U,12)<4 S ACHSOPEN=ACHSOPEN+1,ACHSOPEN("$")=ACHSOPEN("$")+ACHS("$")
P6 ;
 I ACHSRPT<5 W !,$$REPEAT^XLFSTR("-",79)
 I ACHSRPT<5,IOST["C-",$Y>ACHSBM D RTRN^ACHS Q:$G(ACHSQUIT)  G KILL:$D(DUOUT)!$D(DTOUT) D HDR
 I ACHSRPT<5,IOST'["C-",$Y>ACHSBM D RTRN^ACHS G KILL:$D(DUOUT)!$D(DTOUT) D HDR
 I $G(ACHSQUIT) D KILL
 I ACHSRPT=5 G DOC
 Q
 ;
END ;
 W !,"Total documents: ",ACHSPD+ACHSCNX+ACHSOPEN,!!
 I ACHSPD W "TOTAL PAID DOCUMENTS:",$J(ACHSPD,12),?40,"TOTAL DOLLARS PAID:     " S X=ACHSPD("$"),X2="2$",X3=16 D FMT^ACHS W !
 I ACHSCNX W "TOTAL CANCELLED DOCUMENTS:",$J(ACHSCNX,7),?40,"TOTAL DOLLARS CANCELLED:" S X=ACHSCNX("$"),X2="2$",X3=16 D FMT^ACHS W !
 I ACHSOPEN W "TOTAL OPEN DOCUMENTS:",$J(ACHSOPEN,12),?40,"TOTAL DOLLARS OPEN:     " S X=ACHSOPEN("$"),X3=16 D FMT^ACHS W !
 D RTRN^ACHS
 W @IOF
KILL ;
 W "XXX"
 K A,ACHSCNX,ACHSDOC0,ACHSDOC,ACHSOPEN,ACHSPD,ACHSSTS,ACHSTOS,ACHSTYPE,ACHSVDOR
 K ACHSQUIT,ACHSPAT,ACHSSRT,^TMP($J,"ACHSVDC") ;3.1*11 9.8.04 IHS/ITSC/FCJ
 D ERPT^ACHS
 Q
 ;
HDR ;
 S ACHSPG=ACHSPG+1
 W @IOF,!,$$REPEAT^XLFSTR("*",79),!,ACHSUSR,?71,"Page",$J(ACHSPG,3),!,$$C^XBFUNC("PROVIDER-SPECIFIC CHS ACTIVITIES SUMMARY",80),!,ACHST1,!,ACHST2
 W:ACHST3]"" !,ACHST3
 W !,$$REPEAT^XLFSTR("*",79)
 Q
 ;
