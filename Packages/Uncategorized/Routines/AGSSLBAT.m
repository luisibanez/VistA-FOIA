AGSSLBAT ; IHS/ASDS/EFG - PRINT 'SSN ADDED' LETTERS TO SEND TO PATIENTS ; 
 ;;7.1;PATIENT REGISTRATION;;AUG 25,2005
 ;
START D DT^DICRW S IOP="HOME" D ^%ZIS
 H 2 W $$S^AGVDF("IOF"),!,"This will send SSN Notification Letters to those patients",! W "that have had their SSN ADDED by the SSA/SSN Matching Process.",!!
REVIEW ;review previous printing
 I '$D(^AGSSLTMP) K DIR S DIR(0)="Y",DIR("A")="Do you wish to proceed",DIR("B")="Y" W !!,"There is no temporary SSN global to print batches from." D ^DIR G:$G(DUOUT)!(Y=0) END D LOAD
 S AGSSTP=^AGSSLTMP("TP"),AGSSLPB=^("LPB"),AGSSBFP=^("BFP")
 W !!,"TOTAL PATIENTS",?25,$J(AGSSTP,5)
 W !,"Letters Per Batch",?25,$J(AGSSLPB,5)
 W !,"Batches for Printing",?25,$J(AGSSBFP,5)
 W !!,"Batch Numbers Completed",!
 F AGSI=1:1:AGSSBFP-1 S AGSC=$G(^AGSSLTMP("BAT",AGSI)) I AGSC=(AGSI*AGSSLPB) W:$X>75 ! W $J(AGSI,5)
 S AGSC=$G(^AGSSLTMP("BAT",AGSSBFP)) I (AGSC=AGSSTP) W:$X>75 ! W $J(AGSSBFP,5)
 W !!,"Batch Numbers to Print",! K AGSSMORE
 F AGSI=1:1:AGSSBFP-1 S AGSC=$G(^AGSSLTMP("BAT",AGSI)) I AGSC'=(AGSI*AGSSLPB) W:$X>75 ! W $J(AGSI,5)
 S AGSC=$G(^AGSSLTMP("BAT",AGSSBFP)) I (AGSC'=AGSSTP) W:$X>75 ! W $J(AGSSBFP,5)
 I $G(AGSSMORE) W !,"There are ",AGSSMORE," batches to Print",!
 K DIR S DIR(0)="S^C:Continue;R:Restart;K:Kill Temporary Global;E:EXIT",DIR("B")="C" D ^DIR
 I Y="R" D LOAD G START
 I Y="C" D CONTINUE G END
 I Y="K" S AGTMP="^AGSSLTMP" K @AGTMP G START
 G END ;----->
 Q
LOAD ;EP
 S AGTMP="^AGSSLTMP" K @AGTMP
 K DIC S X="A",DIC="^AUTTSSN(",DIC(0)="XQMZ" D ^DIC S AGSSIEN=+Y
 I '$D(^AGSSLTMP) S DFN=0 F AGSSC=0:1 S DFN=$O(^AUPNPAT("AS",AGSSIEN,DFN)) Q:DFN'>0
 W !,"There are ",AGSSC,"  potential patients to receive letters. ",!
 K DIR S DIR(0)="N^1:99999",DIR("A")="How many letters per batch do you wish to have / OR ^ to quit " D ^DIR G:$G(DUOUT) END S AGSSLPB=Y
 S AGSSBFP=AGSSC\AGSSLPB+$S(AGSSC#AGSSLPB:1,1:0)
 S ^AGSSLTMP("BFP")=AGSSBFP,^("TP")=AGSSC,^("LPB")=AGSSLPB
 Q
CONTINUE ;EP
 K DIR S DIR(0)="L^1:"_AGSSBFP,DIR("A")="Please select batch(s) to print /OR ^ to quit" D ^DIR G:$G(DUOUT) START S AGSSNUM=Y
 S XBRC="SCAN^AGSSLBAT",XBRP="PRINT^AGSSLBAT",XBRX="END^AGSSLBAT",XBNS="AGS"
 D ^XBDBQUE
 Q
SCAN ;scan SSN Ver Stat Indx / build
 Q:$D(^AGSSLTMP("A"))  ;indexing already built
 K DIC S X="A",DIC="^AUTTSSN(",DIC(0)="XQMZ" D ^DIC S AGSSIEN=+Y
 S DFN=0 F AGSSC=1:1 S DFN=$O(^AUPNPAT("AS",AGSSIEN,DFN)) Q:DFN'>0  S AGSSNM=$P(^DPT(DFN,0),U),^AGSSLTMP("A",AGSSNM,DFN)="" ;order alpha index
 S AGSSC=0,AGSSNM="" F  S AGSSNM=$O(^AGSSLTMP("A",AGSSNM)) Q:AGSSNM=""  S DFN=0 F  S DFN=$O(^AGSSLTMP("A",AGSSNM,DFN)) Q:DFN'>0  S AGSSC=AGSSC+1,^AGSSLTMP(AGSSC,AGSSNM,DFN)="",^AGSSLTMP("A",AGSSNM,DFN)=AGSSC ;order numeric-alpha index
 Q
PRINT F AGSSI=1:1 S AGSSNB=$P(AGSSNUM,",",AGSSI) Q:AGSSNB'>0  D PATPRT,RPTPRT
 U IO W:$Y>1 @IOF
 D END
 Q
PATPRT ;print patient letters for a batch
 U IO W:$Y>1 @IOF
 F AGSSIEN=(AGSSNB-1)*AGSSLPB+1:1:AGSSNB*AGSSLPB Q:'$D(^AGSSLTMP(AGSSIEN))   D PRTLTR S ^AGSSLTMP("BAT",AGSSNB)=AGSSIEN
 Q
PRTLTR ;print letter
 S AGSSNM=$O(^AGSSLTMP(AGSSIEN,"")),DFN=$O(^(AGSSNM,"")),^AGSSLTMP(AGSSIEN)=""
 D ^AGSSLPRT I $G(AGSST)]"" S ^AGSSLTMP(AGSSIEN)=AGSST K AGSST
 Q
RPTPRT ;print summary report
 ;needs AGSSNB,AGSSLPB (b number),(n per batch)
 I $G(AGSITE)="" S AGSITE=$P(^AUTTSITE(1,0),"^")
 S AGSSPG("PG")=1,AGSSPG("HDR")="Report of 'SSN ADDED' Patient Leters BATCH  "_AGSSNB_" " D AGSSHDR ;print header
 S AGSSC=0 F AGSSIEN=(AGSSNB-1)*AGSSLPB+1:1:AGSSNB*AGSSLPB Q:'$D(^AGSSLTMP(AGSSIEN))  S AGSSNM=$O(^AGSSLTMP(AGSSIEN,"")),DFN=$O(^(AGSSNM,0)) Q:AGSSNM=""  D
 .S AGSHRN=$P($G(^AUPNPAT(DFN,41,AGSITE,0)),"^",2)
 .S AGSSCL=5+35*(AGSSC#2) W ?AGSSCL,$J(AGSHRN,6)," ",AGSSNM W:($G(^AGSSLTMP(AGSSIEN))]"") " *"_^AGSSLTMP(AGSSIEN) I AGSSCL>10 W ! D AGSSPG
 .S AGSSC=AGSSC+1
 W !!,"TOTAL = ",AGSSC H 5
 Q
END ;EP
 K AGSS,AGSC,AGSHRN,AGSI,AGSITE,AGSSNUM,AGSSBFP,AGSSNB,AGSSBFP,AGSSC,AGSSCL,AGSSIEN,AGSSLPB,AGSSNM,AGSSTP
 K AGBOT,AGI,AGIN,AGSSLPB,AGSSI,AGSSLBC,DA,DIR,DFN,DR
 Q
AGSSPG ;EP
 ;this utility uses variables AGSSPG("HDR"),AGSSPG("DT"),AGSSPG("LINE"),AGSSPG("PG") ; kill variables by D EAGSSPG
 Q:($Y<(IOSL-4))!($G(DOUT)!$G(DFOUT))  S:'$D(AGSSPG("PG")) AGSSPG("PG")=0 S AGSSPG("PG")=AGSSPG("PG")+1 I $E(IOST)="C" K DIR S DIR(0)="E" D ^DIR Q:($G(DIROUT)!$G(DUOUT)!$G(DTOUT)!$G(DROUT))
AGSSHDR ;EP header
 W:$Y @IOF W ! Q:'$D(AGSSPG("HDR"))  S:'$D(AGSSPG("LINE")) $P(AGSSPG("LINE"),"-",IOM-2)="" S:'$D(AGSSPG("PG")) AGSSPG("PG")=1 I '$D(AGSSPG("DT")) S %H=$H D YX^%DTC S AGSSPG("DT")=Y
 U IO W ?(IOM-40-$L(AGSSPG("HDR"))/2),AGSSPG("HDR"),?(IOM-40),AGSSPG("DT"),?(IOM-10),"PAGE: ",AGSSPG("PG"),!,AGSSPG("LINE")
AGSSHD ;EP column
 W !!,"  * BAD Patient Record -- LETTER NOT PRINTED",!!
 W !,"   A - Address D - Date of Death  R - Record Disposition S - Patient Status",!
 Q:($G(DIROUT)!$G(DUOUT)!$G(DTOUT)!$G(DROUT))
EAGSSPG K AGSSPG("LINE"),AGSSPG("PG"),AGSSPG("HDR"),AGSSPG("DT") Q
 Q
