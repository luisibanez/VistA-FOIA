BGP9SXNG ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"736,00172-4980-70 ",.01)
 ;;00172-4980-70
 ;;9002226.02101,"736,00172-4980-70 ",.02)
 ;;00172-4980-70
 ;;9002226.02101,"736,00172-4980-80 ",.01)
 ;;00172-4980-80
 ;;9002226.02101,"736,00172-4980-80 ",.02)
 ;;00172-4980-80
 ;;9002226.02101,"736,00182-0317-89 ",.01)
 ;;00182-0317-89
 ;;9002226.02101,"736,00182-0317-89 ",.02)
 ;;00182-0317-89
 ;;9002226.02101,"736,00182-0698-01 ",.01)
 ;;00182-0698-01
 ;;9002226.02101,"736,00182-0698-01 ",.02)
 ;;00182-0698-01
 ;;9002226.02101,"736,00182-0698-05 ",.01)
 ;;00182-0698-05
 ;;9002226.02101,"736,00182-0698-05 ",.02)
 ;;00182-0698-05
 ;;9002226.02101,"736,00182-1673-01 ",.01)
 ;;00182-1673-01
 ;;9002226.02101,"736,00182-1673-01 ",.02)
 ;;00182-1673-01
 ;;9002226.02101,"736,00182-1673-05 ",.01)
 ;;00182-1673-05
 ;;9002226.02101,"736,00182-1673-05 ",.02)
 ;;00182-1673-05
 ;;9002226.02101,"736,00182-9130-66 ",.01)
 ;;00182-9130-66
 ;;9002226.02101,"736,00182-9130-66 ",.02)
 ;;00182-9130-66
 ;;9002226.02101,"736,00182-9131-65 ",.01)
 ;;00182-9131-65
 ;;9002226.02101,"736,00182-9131-65 ",.02)
 ;;00182-9131-65
 ;;9002226.02101,"736,00182-9140-01 ",.01)
 ;;00182-9140-01
 ;;9002226.02101,"736,00182-9140-01 ",.02)
 ;;00182-9140-01
 ;;9002226.02101,"736,00182-9141-01 ",.01)
 ;;00182-9141-01
 ;;9002226.02101,"736,00182-9141-01 ",.02)
 ;;00182-9141-01
 ;;9002226.02101,"736,00228-2082-10 ",.01)
 ;;00228-2082-10
 ;;9002226.02101,"736,00228-2082-10 ",.02)
 ;;00228-2082-10
 ;;9002226.02101,"736,00228-2082-50 ",.01)
 ;;00228-2082-50
 ;;9002226.02101,"736,00228-2082-50 ",.02)
 ;;00228-2082-50
 ;;9002226.02101,"736,00228-2085-10 ",.01)
 ;;00228-2085-10
 ;;9002226.02101,"736,00228-2085-10 ",.02)
 ;;00228-2085-10
 ;;9002226.02101,"736,00228-2085-50 ",.01)
 ;;00228-2085-50
 ;;9002226.02101,"736,00228-2085-50 ",.02)
 ;;00228-2085-50
 ;;9002226.02101,"736,00247-0086-00 ",.01)
 ;;00247-0086-00
 ;;9002226.02101,"736,00247-0086-00 ",.02)
 ;;00247-0086-00
 ;;9002226.02101,"736,00247-0086-02 ",.01)
 ;;00247-0086-02
 ;;9002226.02101,"736,00247-0086-02 ",.02)
 ;;00247-0086-02
 ;;9002226.02101,"736,00247-0086-03 ",.01)
 ;;00247-0086-03
 ;;9002226.02101,"736,00247-0086-03 ",.02)
 ;;00247-0086-03
 ;;9002226.02101,"736,00247-0086-04 ",.01)
 ;;00247-0086-04
 ;;9002226.02101,"736,00247-0086-04 ",.02)
 ;;00247-0086-04
 ;;9002226.02101,"736,00247-0086-05 ",.01)
 ;;00247-0086-05
 ;;9002226.02101,"736,00247-0086-05 ",.02)
 ;;00247-0086-05
 ;;9002226.02101,"736,00247-0086-06 ",.01)
 ;;00247-0086-06
 ;;9002226.02101,"736,00247-0086-06 ",.02)
 ;;00247-0086-06
 ;;9002226.02101,"736,00247-0086-08 ",.01)
 ;;00247-0086-08
 ;;9002226.02101,"736,00247-0086-08 ",.02)
 ;;00247-0086-08
 ;;9002226.02101,"736,00247-0086-10 ",.01)
 ;;00247-0086-10
 ;;9002226.02101,"736,00247-0086-10 ",.02)
 ;;00247-0086-10
 ;;9002226.02101,"736,00247-0086-12 ",.01)
 ;;00247-0086-12
 ;;9002226.02101,"736,00247-0086-12 ",.02)
 ;;00247-0086-12
 ;;9002226.02101,"736,00247-0086-15 ",.01)
 ;;00247-0086-15
 ;;9002226.02101,"736,00247-0086-15 ",.02)
 ;;00247-0086-15
 ;;9002226.02101,"736,00247-0086-16 ",.01)
 ;;00247-0086-16
 ;;9002226.02101,"736,00247-0086-16 ",.02)
 ;;00247-0086-16
 ;;9002226.02101,"736,00247-0086-20 ",.01)
 ;;00247-0086-20
 ;;9002226.02101,"736,00247-0086-20 ",.02)
 ;;00247-0086-20
 ;;9002226.02101,"736,00247-0086-24 ",.01)
 ;;00247-0086-24
 ;;9002226.02101,"736,00247-0086-24 ",.02)
 ;;00247-0086-24
 ;;9002226.02101,"736,00247-0086-25 ",.01)
 ;;00247-0086-25
 ;;9002226.02101,"736,00247-0086-25 ",.02)
 ;;00247-0086-25
 ;;9002226.02101,"736,00247-0086-28 ",.01)
 ;;00247-0086-28
 ;;9002226.02101,"736,00247-0086-28 ",.02)
 ;;00247-0086-28
 ;;9002226.02101,"736,00247-0086-30 ",.01)
 ;;00247-0086-30
 ;;9002226.02101,"736,00247-0086-30 ",.02)
 ;;00247-0086-30
 ;;9002226.02101,"736,00247-0086-40 ",.01)
 ;;00247-0086-40
 ;;9002226.02101,"736,00247-0086-40 ",.02)
 ;;00247-0086-40
 ;;9002226.02101,"736,00247-0086-45 ",.01)
 ;;00247-0086-45
 ;;9002226.02101,"736,00247-0086-45 ",.02)
 ;;00247-0086-45
 ;;9002226.02101,"736,00247-0086-60 ",.01)
 ;;00247-0086-60
 ;;9002226.02101,"736,00247-0086-60 ",.02)
 ;;00247-0086-60
 ;;9002226.02101,"736,00247-0086-98 ",.01)
 ;;00247-0086-98
 ;;9002226.02101,"736,00247-0086-98 ",.02)
 ;;00247-0086-98
 ;;9002226.02101,"736,00247-0154-04 ",.01)
 ;;00247-0154-04
 ;;9002226.02101,"736,00247-0154-04 ",.02)
 ;;00247-0154-04
 ;;9002226.02101,"736,00247-0154-10 ",.01)
 ;;00247-0154-10
 ;;9002226.02101,"736,00247-0154-10 ",.02)
 ;;00247-0154-10
 ;;9002226.02101,"736,00247-0154-12 ",.01)
 ;;00247-0154-12
 ;;9002226.02101,"736,00247-0154-12 ",.02)
 ;;00247-0154-12
 ;;9002226.02101,"736,00247-0154-20 ",.01)
 ;;00247-0154-20
 ;;9002226.02101,"736,00247-0154-20 ",.02)
 ;;00247-0154-20
 ;;9002226.02101,"736,00247-0154-30 ",.01)
 ;;00247-0154-30
 ;;9002226.02101,"736,00247-0154-30 ",.02)
 ;;00247-0154-30
 ;;9002226.02101,"736,00247-0154-40 ",.01)
 ;;00247-0154-40
 ;;9002226.02101,"736,00247-0154-40 ",.02)
 ;;00247-0154-40
 ;;9002226.02101,"736,00254-4206-28 ",.01)
 ;;00254-4206-28
 ;;9002226.02101,"736,00254-4206-28 ",.02)
 ;;00254-4206-28
 ;;9002226.02101,"736,00254-5112-28 ",.01)
 ;;00254-5112-28
 ;;9002226.02101,"736,00254-5112-28 ",.02)
 ;;00254-5112-28
