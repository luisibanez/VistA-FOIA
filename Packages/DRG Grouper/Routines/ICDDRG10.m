ICDDRG10 ;ALB/GRR - FIX SURGERY HIERARCHY ; 11/6/00 2:03pm
 ;;18.0;DRG Grouper;**1**;Oct 20, 2000
 Q:$O(ICDODRG(0))'>0  K ICDJ,ICDJJ F ICDJ=0:0 S ICDJ=$O(ICDODRG(ICDJ)) Q:ICDJ'>0  S ICDJJ(ICDJ)="" D F
END S ICDJ=$O(ICDJ(0)) Q:ICDJ'>0  S ICDJ=ICDJ(ICDJ) K ICDODRG S ICDODRG(ICDJ)="" Q
F I ICDJ=286 S ICDJ(1)=ICDJ Q
 I ICDJ=288 S ICDJ(2)=ICDJ Q
 I ICDJ=285 S ICDJ(3)=ICDJ
 Q
