BGP12XM ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"686,63629-1584-05 ",.02)
 ;;63629-1584-05
 ;;9002226.02101,"686,63629-1604-01 ",.01)
 ;;63629-1604-01
 ;;9002226.02101,"686,63629-1604-01 ",.02)
 ;;63629-1604-01
 ;;9002226.02101,"686,63629-1604-02 ",.01)
 ;;63629-1604-02
 ;;9002226.02101,"686,63629-1604-02 ",.02)
 ;;63629-1604-02
 ;;9002226.02101,"686,63629-1604-03 ",.01)
 ;;63629-1604-03
 ;;9002226.02101,"686,63629-1604-03 ",.02)
 ;;63629-1604-03
 ;;9002226.02101,"686,63629-1604-04 ",.01)
 ;;63629-1604-04
 ;;9002226.02101,"686,63629-1604-04 ",.02)
 ;;63629-1604-04
 ;;9002226.02101,"686,63629-2949-01 ",.01)
 ;;63629-2949-01
 ;;9002226.02101,"686,63629-2949-01 ",.02)
 ;;63629-2949-01
 ;;9002226.02101,"686,63629-2949-02 ",.01)
 ;;63629-2949-02
 ;;9002226.02101,"686,63629-2949-02 ",.02)
 ;;63629-2949-02
 ;;9002226.02101,"686,63629-2949-03 ",.01)
 ;;63629-2949-03
 ;;9002226.02101,"686,63629-2949-03 ",.02)
 ;;63629-2949-03
 ;;9002226.02101,"686,63629-2949-04 ",.01)
 ;;63629-2949-04
 ;;9002226.02101,"686,63629-2949-04 ",.02)
 ;;63629-2949-04
 ;;9002226.02101,"686,63629-2950-01 ",.01)
 ;;63629-2950-01
 ;;9002226.02101,"686,63629-2950-01 ",.02)
 ;;63629-2950-01
 ;;9002226.02101,"686,63629-2950-02 ",.01)
 ;;63629-2950-02
 ;;9002226.02101,"686,63629-2950-02 ",.02)
 ;;63629-2950-02
 ;;9002226.02101,"686,63629-2950-03 ",.01)
 ;;63629-2950-03
 ;;9002226.02101,"686,63629-2950-03 ",.02)
 ;;63629-2950-03
 ;;9002226.02101,"686,63629-2950-04 ",.01)
 ;;63629-2950-04
 ;;9002226.02101,"686,63629-2950-04 ",.02)
 ;;63629-2950-04
 ;;9002226.02101,"686,63629-3051-01 ",.01)
 ;;63629-3051-01
 ;;9002226.02101,"686,63629-3051-01 ",.02)
 ;;63629-3051-01
 ;;9002226.02101,"686,63629-3065-01 ",.01)
 ;;63629-3065-01
 ;;9002226.02101,"686,63629-3065-01 ",.02)
 ;;63629-3065-01
 ;;9002226.02101,"686,63629-3166-01 ",.01)
 ;;63629-3166-01
 ;;9002226.02101,"686,63629-3166-01 ",.02)
 ;;63629-3166-01
 ;;9002226.02101,"686,63629-3166-02 ",.01)
 ;;63629-3166-02
 ;;9002226.02101,"686,63629-3166-02 ",.02)
 ;;63629-3166-02
 ;;9002226.02101,"686,63629-3768-01 ",.01)
 ;;63629-3768-01
 ;;9002226.02101,"686,63629-3768-01 ",.02)
 ;;63629-3768-01
 ;;9002226.02101,"686,63629-3769-01 ",.01)
 ;;63629-3769-01
 ;;9002226.02101,"686,63629-3769-01 ",.02)
 ;;63629-3769-01
 ;;9002226.02101,"686,63874-0260-01 ",.01)
 ;;63874-0260-01
 ;;9002226.02101,"686,63874-0260-01 ",.02)
 ;;63874-0260-01
 ;;9002226.02101,"686,63874-0260-02 ",.01)
 ;;63874-0260-02
 ;;9002226.02101,"686,63874-0260-02 ",.02)
 ;;63874-0260-02
 ;;9002226.02101,"686,63874-0260-07 ",.01)
 ;;63874-0260-07
 ;;9002226.02101,"686,63874-0260-07 ",.02)
 ;;63874-0260-07
 ;;9002226.02101,"686,63874-0260-14 ",.01)
 ;;63874-0260-14
 ;;9002226.02101,"686,63874-0260-14 ",.02)
 ;;63874-0260-14
 ;;9002226.02101,"686,63874-0260-20 ",.01)
 ;;63874-0260-20
 ;;9002226.02101,"686,63874-0260-20 ",.02)
 ;;63874-0260-20
 ;;9002226.02101,"686,63874-0260-30 ",.01)
 ;;63874-0260-30
 ;;9002226.02101,"686,63874-0260-30 ",.02)
 ;;63874-0260-30
 ;;9002226.02101,"686,63874-0260-50 ",.01)
 ;;63874-0260-50
 ;;9002226.02101,"686,63874-0260-50 ",.02)
 ;;63874-0260-50
 ;;9002226.02101,"686,63874-0265-01 ",.01)
 ;;63874-0265-01
 ;;9002226.02101,"686,63874-0265-01 ",.02)
 ;;63874-0265-01
 ;;9002226.02101,"686,63874-0265-20 ",.01)
 ;;63874-0265-20
 ;;9002226.02101,"686,63874-0265-20 ",.02)
 ;;63874-0265-20
 ;;9002226.02101,"686,63874-0269-01 ",.01)
 ;;63874-0269-01
 ;;9002226.02101,"686,63874-0269-01 ",.02)
 ;;63874-0269-01
 ;;9002226.02101,"686,63874-0269-02 ",.01)
 ;;63874-0269-02
 ;;9002226.02101,"686,63874-0269-02 ",.02)
 ;;63874-0269-02
 ;;9002226.02101,"686,63874-0269-03 ",.01)
 ;;63874-0269-03
 ;;9002226.02101,"686,63874-0269-03 ",.02)
 ;;63874-0269-03
 ;;9002226.02101,"686,63874-0269-07 ",.01)
 ;;63874-0269-07
 ;;9002226.02101,"686,63874-0269-07 ",.02)
 ;;63874-0269-07
 ;;9002226.02101,"686,63874-0269-10 ",.01)
 ;;63874-0269-10
 ;;9002226.02101,"686,63874-0269-10 ",.02)
 ;;63874-0269-10
 ;;9002226.02101,"686,63874-0269-12 ",.01)
 ;;63874-0269-12
 ;;9002226.02101,"686,63874-0269-12 ",.02)
 ;;63874-0269-12
 ;;9002226.02101,"686,63874-0269-14 ",.01)
 ;;63874-0269-14
 ;;9002226.02101,"686,63874-0269-14 ",.02)
 ;;63874-0269-14
 ;;9002226.02101,"686,63874-0269-15 ",.01)
 ;;63874-0269-15
 ;;9002226.02101,"686,63874-0269-15 ",.02)
 ;;63874-0269-15
 ;;9002226.02101,"686,63874-0269-20 ",.01)
 ;;63874-0269-20
 ;;9002226.02101,"686,63874-0269-20 ",.02)
 ;;63874-0269-20
 ;;9002226.02101,"686,63874-0269-21 ",.01)
 ;;63874-0269-21
 ;;9002226.02101,"686,63874-0269-21 ",.02)
 ;;63874-0269-21
 ;;9002226.02101,"686,63874-0269-24 ",.01)
 ;;63874-0269-24
 ;;9002226.02101,"686,63874-0269-24 ",.02)
 ;;63874-0269-24
 ;;9002226.02101,"686,63874-0269-30 ",.01)
 ;;63874-0269-30
 ;;9002226.02101,"686,63874-0269-30 ",.02)
 ;;63874-0269-30
 ;;9002226.02101,"686,63874-0269-40 ",.01)
 ;;63874-0269-40
 ;;9002226.02101,"686,63874-0269-40 ",.02)
 ;;63874-0269-40
 ;;9002226.02101,"686,63874-0269-60 ",.01)
 ;;63874-0269-60
 ;;9002226.02101,"686,63874-0269-60 ",.02)
 ;;63874-0269-60
 ;;9002226.02101,"686,63874-0270-01 ",.01)
 ;;63874-0270-01
 ;;9002226.02101,"686,63874-0270-01 ",.02)
 ;;63874-0270-01
 ;;9002226.02101,"686,63874-0270-07 ",.01)
 ;;63874-0270-07
 ;;9002226.02101,"686,63874-0270-07 ",.02)
 ;;63874-0270-07
 ;;9002226.02101,"686,63874-0270-30 ",.01)
 ;;63874-0270-30
 ;;9002226.02101,"686,63874-0270-30 ",.02)
 ;;63874-0270-30
 ;;9002226.02101,"686,63874-0271-01 ",.01)
 ;;63874-0271-01
 ;;9002226.02101,"686,63874-0271-01 ",.02)
 ;;63874-0271-01
 ;;9002226.02101,"686,63874-0271-07 ",.01)
 ;;63874-0271-07
 ;;9002226.02101,"686,63874-0271-07 ",.02)
 ;;63874-0271-07
 ;;9002226.02101,"686,63874-0271-14 ",.01)
 ;;63874-0271-14
 ;;9002226.02101,"686,63874-0271-14 ",.02)
 ;;63874-0271-14
 ;;9002226.02101,"686,63874-0271-15 ",.01)
 ;;63874-0271-15
 ;;9002226.02101,"686,63874-0271-15 ",.02)
 ;;63874-0271-15
 ;;9002226.02101,"686,63874-0271-30 ",.01)
 ;;63874-0271-30
 ;;9002226.02101,"686,63874-0271-30 ",.02)
 ;;63874-0271-30
 ;;9002226.02101,"686,63874-0282-01 ",.01)
 ;;63874-0282-01
 ;;9002226.02101,"686,63874-0282-01 ",.02)
 ;;63874-0282-01
 ;;9002226.02101,"686,63874-0282-02 ",.01)
 ;;63874-0282-02
 ;;9002226.02101,"686,63874-0282-02 ",.02)
 ;;63874-0282-02
 ;;9002226.02101,"686,63874-0282-10 ",.01)
 ;;63874-0282-10
 ;;9002226.02101,"686,63874-0282-10 ",.02)
 ;;63874-0282-10
 ;;9002226.02101,"686,63874-0282-14 ",.01)
 ;;63874-0282-14
 ;;9002226.02101,"686,63874-0282-14 ",.02)
 ;;63874-0282-14
 ;;9002226.02101,"686,63874-0282-15 ",.01)
 ;;63874-0282-15
 ;;9002226.02101,"686,63874-0282-15 ",.02)
 ;;63874-0282-15
 ;;9002226.02101,"686,63874-0282-30 ",.01)
 ;;63874-0282-30
 ;;9002226.02101,"686,63874-0282-30 ",.02)
 ;;63874-0282-30
 ;;9002226.02101,"686,64376-0650-01 ",.01)
 ;;64376-0650-01
 ;;9002226.02101,"686,64376-0650-01 ",.02)
 ;;64376-0650-01
 ;;9002226.02101,"686,64376-0650-05 ",.01)
 ;;64376-0650-05
 ;;9002226.02101,"686,64376-0650-05 ",.02)
 ;;64376-0650-05
 ;;9002226.02101,"686,64376-0650-31 ",.01)
 ;;64376-0650-31
 ;;9002226.02101,"686,64376-0650-31 ",.02)
 ;;64376-0650-31
 ;;9002226.02101,"686,64376-0650-90 ",.01)
 ;;64376-0650-90
 ;;9002226.02101,"686,64376-0650-90 ",.02)
 ;;64376-0650-90
 ;;9002226.02101,"686,64720-0130-10 ",.01)
 ;;64720-0130-10
 ;;9002226.02101,"686,64720-0130-10 ",.02)
 ;;64720-0130-10
 ;;9002226.02101,"686,64720-0132-10 ",.01)
 ;;64720-0132-10
 ;;9002226.02101,"686,64720-0132-10 ",.02)
 ;;64720-0132-10
 ;;9002226.02101,"686,64720-0135-10 ",.01)
 ;;64720-0135-10
 ;;9002226.02101,"686,64720-0135-10 ",.02)
 ;;64720-0135-10
 ;;9002226.02101,"686,64720-0136-10 ",.01)
 ;;64720-0136-10
 ;;9002226.02101,"686,64720-0136-10 ",.02)
 ;;64720-0136-10
 ;;9002226.02101,"686,64720-0194-01 ",.01)
 ;;64720-0194-01
 ;;9002226.02101,"686,64720-0194-01 ",.02)
 ;;64720-0194-01
 ;;9002226.02101,"686,64720-0194-10 ",.01)
 ;;64720-0194-10
 ;;9002226.02101,"686,64720-0194-10 ",.02)
 ;;64720-0194-10
 ;;9002226.02101,"686,64720-0194-50 ",.01)
 ;;64720-0194-50
 ;;9002226.02101,"686,64720-0194-50 ",.02)
 ;;64720-0194-50
 ;;9002226.02101,"686,64720-0208-10 ",.01)
 ;;64720-0208-10
 ;;9002226.02101,"686,64720-0208-10 ",.02)
 ;;64720-0208-10
 ;;9002226.02101,"686,64980-0145-01 ",.01)
 ;;64980-0145-01
 ;;9002226.02101,"686,64980-0145-01 ",.02)
 ;;64980-0145-01
 ;;9002226.02101,"686,65234-0047-10 ",.01)
 ;;65234-0047-10
 ;;9002226.02101,"686,65234-0047-10 ",.02)
 ;;65234-0047-10
 ;;9002226.02101,"686,65234-0048-10 ",.01)
 ;;65234-0048-10
 ;;9002226.02101,"686,65234-0048-10 ",.02)
 ;;65234-0048-10
 ;;9002226.02101,"686,65234-0048-90 ",.01)
 ;;65234-0048-90
 ;;9002226.02101,"686,65234-0048-90 ",.02)
 ;;65234-0048-90
 ;;9002226.02101,"686,66267-0166-07 ",.01)
 ;;66267-0166-07
 ;;9002226.02101,"686,66267-0166-07 ",.02)
 ;;66267-0166-07
 ;;9002226.02101,"686,66267-0166-30 ",.01)
 ;;66267-0166-30
 ;;9002226.02101,"686,66267-0166-30 ",.02)
 ;;66267-0166-30
 ;;9002226.02101,"686,66267-0166-45 ",.01)
 ;;66267-0166-45
 ;;9002226.02101,"686,66267-0166-45 ",.02)
 ;;66267-0166-45
 ;;9002226.02101,"686,66267-0166-60 ",.01)
 ;;66267-0166-60
 ;;9002226.02101,"686,66267-0166-60 ",.02)
 ;;66267-0166-60
 ;;9002226.02101,"686,66267-0166-90 ",.01)
 ;;66267-0166-90
 ;;9002226.02101,"686,66267-0166-90 ",.02)
 ;;66267-0166-90
 ;;9002226.02101,"686,66336-0133-07 ",.01)
 ;;66336-0133-07
 ;;9002226.02101,"686,66336-0133-07 ",.02)
 ;;66336-0133-07
 ;;9002226.02101,"686,66336-0133-14 ",.01)
 ;;66336-0133-14
 ;;9002226.02101,"686,66336-0133-14 ",.02)
 ;;66336-0133-14
 ;;9002226.02101,"686,66336-0133-28 ",.01)
 ;;66336-0133-28
 ;;9002226.02101,"686,66336-0133-28 ",.02)
 ;;66336-0133-28
 ;;9002226.02101,"686,66336-0133-30 ",.01)
 ;;66336-0133-30
 ;;9002226.02101,"686,66336-0133-30 ",.02)
 ;;66336-0133-30
 ;;9002226.02101,"686,66336-0185-07 ",.01)
 ;;66336-0185-07
 ;;9002226.02101,"686,66336-0185-07 ",.02)
 ;;66336-0185-07
 ;;9002226.02101,"686,66336-0185-14 ",.01)
 ;;66336-0185-14
 ;;9002226.02101,"686,66336-0185-14 ",.02)
 ;;66336-0185-14
 ;;9002226.02101,"686,66336-0185-28 ",.01)
 ;;66336-0185-28
 ;;9002226.02101,"686,66336-0185-28 ",.02)
 ;;66336-0185-28
 ;;9002226.02101,"686,66336-0185-30 ",.01)
 ;;66336-0185-30
 ;;9002226.02101,"686,66336-0185-30 ",.02)
 ;;66336-0185-30
 ;;9002226.02101,"686,66336-0185-42 ",.01)
 ;;66336-0185-42
 ;;9002226.02101,"686,66336-0185-42 ",.02)
 ;;66336-0185-42
 ;;9002226.02101,"686,66336-0191-21 ",.01)
 ;;66336-0191-21
 ;;9002226.02101,"686,66336-0191-21 ",.02)
 ;;66336-0191-21
 ;;9002226.02101,"686,66336-0191-28 ",.01)
 ;;66336-0191-28
 ;;9002226.02101,"686,66336-0191-28 ",.02)
 ;;66336-0191-28
 ;;9002226.02101,"686,66336-0191-30 ",.01)
 ;;66336-0191-30
 ;;9002226.02101,"686,66336-0191-30 ",.02)
 ;;66336-0191-30
 ;;9002226.02101,"686,66336-0191-42 ",.01)
 ;;66336-0191-42
 ;;9002226.02101,"686,66336-0191-42 ",.02)
 ;;66336-0191-42
 ;;9002226.02101,"686,66336-0191-56 ",.01)
 ;;66336-0191-56
 ;;9002226.02101,"686,66336-0191-56 ",.02)
 ;;66336-0191-56
 ;;9002226.02101,"686,66336-0191-84 ",.01)
 ;;66336-0191-84
 ;;9002226.02101,"686,66336-0191-84 ",.02)
 ;;66336-0191-84
 ;;9002226.02101,"686,66336-0344-07 ",.01)
 ;;66336-0344-07
 ;;9002226.02101,"686,66336-0344-07 ",.02)
 ;;66336-0344-07
 ;;9002226.02101,"686,66336-0344-14 ",.01)
 ;;66336-0344-14
 ;;9002226.02101,"686,66336-0344-14 ",.02)
 ;;66336-0344-14
 ;;9002226.02101,"686,66336-0344-28 ",.01)
 ;;66336-0344-28
 ;;9002226.02101,"686,66336-0344-28 ",.02)
 ;;66336-0344-28
 ;;9002226.02101,"686,66336-0344-30 ",.01)
 ;;66336-0344-30
 ;;9002226.02101,"686,66336-0344-30 ",.02)
 ;;66336-0344-30
 ;;9002226.02101,"686,66336-0344-56 ",.01)
 ;;66336-0344-56
 ;;9002226.02101,"686,66336-0344-56 ",.02)
 ;;66336-0344-56
 ;;9002226.02101,"686,66336-0344-84 ",.01)
 ;;66336-0344-84
 ;;9002226.02101,"686,66336-0344-84 ",.02)
 ;;66336-0344-84
 ;;9002226.02101,"686,66336-0426-30 ",.01)
 ;;66336-0426-30
 ;;9002226.02101,"686,66336-0426-30 ",.02)
 ;;66336-0426-30
 ;;9002226.02101,"686,66336-0562-07 ",.01)
 ;;66336-0562-07
 ;;9002226.02101,"686,66336-0562-07 ",.02)
 ;;66336-0562-07
 ;;9002226.02101,"686,66336-0678-21 ",.01)
 ;;66336-0678-21
 ;;9002226.02101,"686,66336-0678-21 ",.02)
 ;;66336-0678-21
 ;;9002226.02101,"686,66336-0689-07 ",.01)
 ;;66336-0689-07
 ;;9002226.02101,"686,66336-0689-07 ",.02)
 ;;66336-0689-07
 ;;9002226.02101,"686,66336-0689-14 ",.01)
 ;;66336-0689-14
 ;;9002226.02101,"686,66336-0689-14 ",.02)
 ;;66336-0689-14
 ;;9002226.02101,"686,66336-0689-28 ",.01)
 ;;66336-0689-28
 ;;9002226.02101,"686,66336-0689-28 ",.02)
 ;;66336-0689-28
