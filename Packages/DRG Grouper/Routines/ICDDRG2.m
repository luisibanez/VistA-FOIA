ICDDRG2 ;ALB/GRR/EG - FIX SURGERY HIERARCHY ; 10/23/00 11:39am
 ;;18.0;DRG Grouper;;Oct 20, 2000
 Q:$O(ICDODRG(0))'>0  K ICDJ F ICDJ=0:0 S ICDJ=$O(ICDODRG(ICDJ)) Q:ICDJ'>0  D F
END S ICDJ=$O(ICDJ(0)) Q:ICDJ'>0  S ICDJ=ICDJ(ICDJ) K ICDODRG S ICDODRG(ICDJ)="" K ICDJ Q
F I ICDJ=37 S ICDJ(1)=ICDJ Q
 I ICDJ=40 S ICDJ(2)=ICDJ Q
 I ICDJ=36 S ICDJ(3)=ICDJ Q
 I ICDJ=42 S ICDJ(4)=ICDJ Q
 I ICDJ=39 S ICDJ(5)=ICDJ Q
 I ICDJ=38 S ICDJ(6)=ICDJ Q
 Q
VER S ICDF="",ICDL39=0 F ICDFZ=1:1 S ICDF=$O(ICDOP(ICDF)) Q:ICDF=""  S ICD=$P(ICDF," ",2) I "12.91^12.92^14.71^14.72^14.73^14.74^14.75^14.79"'[ICD S ICDL39=1 Q
 S ICDRG=$S(ICDL39:39,1:42)
 Q
