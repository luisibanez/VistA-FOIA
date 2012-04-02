BPMHRCN ; IHS/TUCSON/JCM - DISPLAYS CHART NUMBERS FROM PATIENT FILE ;
 ;;1.0;IHS PATIENT MERGE;;MAR 01, 2010
 ;IHS/OIT/LJF 11/02/2006 changed namespace from DPTD to BPM
START ;
 D CHARTS
 D EOJ
 Q
 ;
CHARTS ; Displays chart numbers and facilities for patients
 W !!,"*** HEALTH RECORD NO."
 S Y=XDRMCD,Y(2)=XDRMCD2
 S BPMLKF=0,BPMLKFF=0,BPMLKI=0
 I $D(^AUPNPAT(Y,41,0)) F BPMLKI=0:1 S BPMLKF=$O(^AUPNPAT(Y,41,BPMLKF)) Q:'BPMLKF  W:BPMLKI ! W ?23," ",$J($P(^AUTTLOC(BPMLKF,0),U,7),4)," ",$P(^AUPNPAT(Y,41,BPMLKF,0),U,2) I $D(^AUPNPAT(Y(2),41,0)) D CHART2
 I $D(^AUPNPAT(Y(2),41,0)),$P(^AUPNPAT(Y(2),41,0),U,4)>BPMLKI F BPMLKII=1:1 Q:'$O(^AUPNPAT(Y(2),41,BPMLKFF))  W ! D CHART2
 Q
CHART2 ;prints second patient's chart numbers
 I '$D(BPMLKII),$P(^AUPNPAT(Y(2),41,0),U,4)<(BPMLKI+1) G CHART2X
 S BPMLKFF=$O(^AUPNPAT(Y(2),41,BPMLKFF))
 W ?49 W " ",$J($P(^AUTTLOC(BPMLKFF,0),U,7),4)," ",$P(^AUPNPAT(Y(2),41,BPMLKFF,0),U,2)
 ;
CHART2X ;
 Q
 ;
EOJ ;
 K BPM,Y,BPMLKF,BPMLKFF,BPMLKI,BPMLKII
 Q