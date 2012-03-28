LREXECU ; IHS/DIR/AAB - EXECUTE CODE UTILITY 8/11/97 ; [ 11/18/2002  2:25 PM ]
 ;;5.2;LR;**1003,1013,1015**;NOV 18, 2002
 ;;5.2;LAB SERVICE;**121**;Sep 27, 1994
TDM ; DRUG MONITORING
 W !,"Will (is) the sample to be drawn at ",!," Peak, Trough, Mid, or Unknown: " R X:DTIME S Y=$F("PTMU",$E(X,1)) S:Y<2 Y=1 S X=$P("?^PEAK^TROUGH^MID^UNK",U,Y)
 I X["^"!(X="")!(X["?") W !,"You must answer this question!  just enter a 'P', 'T', 'M', 'U' " G TDM
 S LRCCOM="~Dose is expected to be at "_X_" level."
 ;I $$VER^LR7OU1>2.5 D TCOM^LRORD2(+LRTEST(LRTSTN),LRCCOM),RCS^LRORD2
 ;I $$VER^LR7OU1<3 D RCS^LRORD2,RCS^LRXO9 ;OE/RR 2.5
 D TCOM^LRORD2(+LRTEST(LRTSTN),LRCCOM),RCS^LRORD2  ;IHS/ITSC/TPF WE ARE NOT CONCERNED ABOUT OE/RR VERSION  FIX 'SAMPLE TO BE DRAWN AT' NOT SHOWING ON ORDER PRINT OUT REPORTED BY SANTA FE
 R !,"ADDITIONAL COMMENT: ",LRCCOM:DTIME Q
 Q
DOSE ;DOSE/DRAW TIMES
EN ;
 S %DT("A")="Enter the last dose time: ",%DT="AT" D ^%DT S LRDOSE=Y
 I Y<1 W !,"Time unknown" S %=2 D YN^DICN S:%=1 LRDOSE="UNKNOWN" G:%'=1 EN
 I Y>1,Y'["." W !,"You must enter a time, e.g.  T@6AM" G EN
 I LRDOSE["." S Y=LRDOSE D DD^LRX S LRDOSE=Y
DRAW W ! S %DT("A")="Enter draw time: ",%DT="AT" D ^%DT S LRDRAW=Y
 I Y<1 W !,"Time unknown" S %=2 D YN^DICN S:%=1 LRDRAW="UNKNOWN" G:%'=1 DRAW
 I Y>1,Y'["." W !,"You must enter a time, e.g.  T@6AM" G DRAW
 I LRDRAW["." S Y=LRDRAW D DD^LRX S LRDRAW=Y
 S LRCCOM="~Last dose: "_LRDOSE_"   draw time: "_LRDRAW W !,LRCCOM
 W !,"OK" S %=1 D YN^DICN G EN:%'=1
 K LRDOSE,LRDRAW,%DT Q
