LRAPDS ; IHS/DIR/AAB - AP REPORT DISPLAYS/PRINTS 11/9/95 07:22 ;
 ;;5.2;LR;**1002**;JUN 01, 1998
 ;;5.2;LAB SERVICE;**72**;Sep 27, 1994
 D ^LRAPCUM,END Q
 ;
 ;display
CY D END S (LRAA(1),X)="CYTOPATHOLOGY",LRSS="CY" D SET G LRAPDS
SP D END S (LRAA(1),X)="SURGICAL PATHOLOGY",LRSS="SP" D SET G LRAPDS
EM D END S LRAA(1)="ELECTRON MICROSCOPY",(LRSS,X)="EM" D SET G LRAPDS
 ;
 ;print
PCY D END S (LRAA(1),X)="CYTOPATHOLOGY",LRSS="CY" D SET G P
PSP D END S (LRAA(1),X)="SURGICAL PATHOLOGY",LRSS="SP" D SET G P
PEM D END S LRAA(1)="ELECTRON MICROSCOPY",(LRSS,X)="EM" D SET G P
 ;
P S (LR("R"),LR("W"))=1 D SGL^LRSPRPT,END Q
 ;
END D V^LRU Q
 ;
SET S LRAA=+$O(^LRO(68,"B",X,0)) Q
