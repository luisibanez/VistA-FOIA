ABPVNTEG ;ISC/XTSUMBLD KERNEL V6 - Package checksum checker ;AUG 07, 1991@15:54:47
 ;;6;AUG 07, 1991@15:54:47
C0 S C0="S XT=0 F I=1:1 S L=$T(+I) Q:$L(L)'>0  F J=1:1:$L(L) S XT=$A(L,J)*J+XT"
 W !!,"Checksum routine created on ",$P($T(+2),";",4)," by KERNEL V6",!
 F LI=1:1 S LV=$T(ROU+LI) Q:LV=""  S RN=$P(LV," ",1),RT=$P(LV,";",3) W !,RN X "ZL @RN X C0" W ?10,$S(XT'=RT:"Calculated "_XT_", off by "_(XT-RT),1:"ok")
 Q
ROU ;
ABPVCK0 ;;8906177
ABPVCK1 ;;2104459
ABPVDATE ;;937095
ABPVDG01 ;;1664632
ABPVDG02 ;;1304034
ABPVDG03 ;;6536020
ABPVDIN ;;5372955
ABPVEEC0 ;;3626847
ABPVEEC1 ;;5618795
ABPVEEC2 ;;8097363
ABPVEEC3 ;;5686295
ABPVEEIN ;;4535091
ABPVHD ;;1804149
ABPVOP01 ;;1717348
ABPVOP02 ;;2272618
ABPVOP03 ;;6500323
ABPVPCC1 ;;1565458
ABPVPCC2 ;;3155778
ABPVPCC3 ;;5134294
ABPVPI01 ;;3241890
ABPVPI02 ;;2443406
ABPVPRE1 ;;3229116
ABPVPRT ;;905810
ABPVRX01 ;;2113103
ABPVRX02 ;;2836310
ABPVRX03 ;;8538573
ABPVTINS ;;5510604
ABPVTX0 ;;7848808
ABPVTX1 ;;5020503
ABPVTX2 ;;7070661
ABPVVAR ;;1798295
ABPVZILP ;;599275
ABPVZMM ;;2026314
