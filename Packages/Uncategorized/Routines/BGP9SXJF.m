BGP9SXJF ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"733,00185-0230-10 ",.01)
 ;;00185-0230-10
 ;;9002226.02101,"733,00185-0230-10 ",.02)
 ;;00185-0230-10
 ;;9002226.02101,"733,00187-0500-01 ",.01)
 ;;00187-0500-01
 ;;9002226.02101,"733,00187-0500-01 ",.02)
 ;;00187-0500-01
 ;;9002226.02101,"733,00187-0500-02 ",.01)
 ;;00187-0500-02
 ;;9002226.02101,"733,00187-0500-02 ",.02)
 ;;00187-0500-02
 ;;9002226.02101,"733,00223-0425-01 ",.01)
 ;;00223-0425-01
 ;;9002226.02101,"733,00223-0425-01 ",.02)
 ;;00223-0425-01
 ;;9002226.02101,"733,00223-0425-03 ",.01)
 ;;00223-0425-03
 ;;9002226.02101,"733,00223-0425-03 ",.02)
 ;;00223-0425-03
 ;;9002226.02101,"733,00223-6419-01 ",.01)
 ;;00223-6419-01
 ;;9002226.02101,"733,00223-6419-01 ",.02)
 ;;00223-6419-01
 ;;9002226.02101,"733,00223-6419-02 ",.01)
 ;;00223-6419-02
 ;;9002226.02101,"733,00223-6419-02 ",.02)
 ;;00223-6419-02
 ;;9002226.02101,"733,00223-6419-03 ",.01)
 ;;00223-6419-03
 ;;9002226.02101,"733,00223-6419-03 ",.02)
 ;;00223-6419-03
 ;;9002226.02101,"733,00223-7191-25 ",.01)
 ;;00223-7191-25
 ;;9002226.02101,"733,00223-7191-25 ",.02)
 ;;00223-7191-25
 ;;9002226.02101,"733,00223-7192-00 ",.01)
 ;;00223-7192-00
 ;;9002226.02101,"733,00223-7192-00 ",.02)
 ;;00223-7192-00
 ;;9002226.02101,"733,00223-7193-25 ",.01)
 ;;00223-7193-25
 ;;9002226.02101,"733,00223-7193-25 ",.02)
 ;;00223-7193-25
 ;;9002226.02101,"733,00223-7206-01 ",.01)
 ;;00223-7206-01
 ;;9002226.02101,"733,00223-7206-01 ",.02)
 ;;00223-7206-01
 ;;9002226.02101,"733,00223-8414-25 ",.01)
 ;;00223-8414-25
 ;;9002226.02101,"733,00223-8414-25 ",.02)
 ;;00223-8414-25
 ;;9002226.02101,"733,00225-0295-15 ",.01)
 ;;00225-0295-15
 ;;9002226.02101,"733,00225-0295-15 ",.02)
 ;;00225-0295-15
 ;;9002226.02101,"733,00225-0295-20 ",.01)
 ;;00225-0295-20
 ;;9002226.02101,"733,00225-0295-20 ",.02)
 ;;00225-0295-20
 ;;9002226.02101,"733,00247-0095-00 ",.01)
 ;;00247-0095-00
 ;;9002226.02101,"733,00247-0095-00 ",.02)
 ;;00247-0095-00
 ;;9002226.02101,"733,00247-0095-03 ",.01)
 ;;00247-0095-03
 ;;9002226.02101,"733,00247-0095-03 ",.02)
 ;;00247-0095-03
 ;;9002226.02101,"733,00247-0095-04 ",.01)
 ;;00247-0095-04
 ;;9002226.02101,"733,00247-0095-04 ",.02)
 ;;00247-0095-04
 ;;9002226.02101,"733,00247-0095-06 ",.01)
 ;;00247-0095-06
 ;;9002226.02101,"733,00247-0095-06 ",.02)
 ;;00247-0095-06
 ;;9002226.02101,"733,00247-0095-08 ",.01)
 ;;00247-0095-08
 ;;9002226.02101,"733,00247-0095-08 ",.02)
 ;;00247-0095-08
 ;;9002226.02101,"733,00247-0095-10 ",.01)
 ;;00247-0095-10
 ;;9002226.02101,"733,00247-0095-10 ",.02)
 ;;00247-0095-10
 ;;9002226.02101,"733,00247-0095-12 ",.01)
 ;;00247-0095-12
 ;;9002226.02101,"733,00247-0095-12 ",.02)
 ;;00247-0095-12
 ;;9002226.02101,"733,00247-0095-15 ",.01)
 ;;00247-0095-15
 ;;9002226.02101,"733,00247-0095-15 ",.02)
 ;;00247-0095-15
 ;;9002226.02101,"733,00247-0095-16 ",.01)
 ;;00247-0095-16
 ;;9002226.02101,"733,00247-0095-16 ",.02)
 ;;00247-0095-16
 ;;9002226.02101,"733,00247-0095-18 ",.01)
 ;;00247-0095-18
 ;;9002226.02101,"733,00247-0095-18 ",.02)
 ;;00247-0095-18
 ;;9002226.02101,"733,00247-0095-20 ",.01)
 ;;00247-0095-20
 ;;9002226.02101,"733,00247-0095-20 ",.02)
 ;;00247-0095-20
 ;;9002226.02101,"733,00247-0095-30 ",.01)
 ;;00247-0095-30
 ;;9002226.02101,"733,00247-0095-30 ",.02)
 ;;00247-0095-30
 ;;9002226.02101,"733,00247-0095-40 ",.01)
 ;;00247-0095-40
 ;;9002226.02101,"733,00247-0095-40 ",.02)
 ;;00247-0095-40
 ;;9002226.02101,"733,00247-0095-50 ",.01)
 ;;00247-0095-50
 ;;9002226.02101,"733,00247-0095-50 ",.02)
 ;;00247-0095-50
 ;;9002226.02101,"733,00254-2320-28 ",.01)
 ;;00254-2320-28
 ;;9002226.02101,"733,00254-2320-28 ",.02)
 ;;00254-2320-28
 ;;9002226.02101,"733,00254-2320-38 ",.01)
 ;;00254-2320-38
 ;;9002226.02101,"733,00254-2320-38 ",.02)
 ;;00254-2320-38
 ;;9002226.02101,"733,00254-9035-58 ",.01)
 ;;00254-9035-58
 ;;9002226.02101,"733,00254-9035-58 ",.02)
 ;;00254-9035-58
 ;;9002226.02101,"733,00254-9216-43 ",.01)
 ;;00254-9216-43
 ;;9002226.02101,"733,00254-9216-43 ",.02)
 ;;00254-9216-43
 ;;9002226.02101,"733,00314-0011-01 ",.01)
 ;;00314-0011-01
 ;;9002226.02101,"733,00314-0011-01 ",.02)
 ;;00314-0011-01
 ;;9002226.02101,"733,00314-0408-01 ",.01)
 ;;00314-0408-01
 ;;9002226.02101,"733,00314-0408-01 ",.02)
 ;;00314-0408-01
 ;;9002226.02101,"733,00314-0408-10 ",.01)
 ;;00314-0408-10
 ;;9002226.02101,"733,00314-0408-10 ",.02)
 ;;00314-0408-10
 ;;9002226.02101,"733,00339-4037-12 ",.01)
 ;;00339-4037-12
 ;;9002226.02101,"733,00339-4037-12 ",.02)
 ;;00339-4037-12
 ;;9002226.02101,"733,00378-0415-01 ",.01)
 ;;00378-0415-01
 ;;9002226.02101,"733,00378-0415-01 ",.02)
 ;;00378-0415-01
 ;;9002226.02101,"733,00378-0415-10 ",.01)
 ;;00378-0415-10
 ;;9002226.02101,"733,00378-0415-10 ",.02)
 ;;00378-0415-10
 ;;9002226.02101,"733,00405-0080-03 ",.01)
 ;;00405-0080-03
 ;;9002226.02101,"733,00405-0080-03 ",.02)
 ;;00405-0080-03
 ;;9002226.02101,"733,00405-2350-16 ",.01)
 ;;00405-2350-16
 ;;9002226.02101,"733,00405-2350-16 ",.02)
 ;;00405-2350-16
 ;;9002226.02101,"733,00405-2910-61 ",.01)
 ;;00405-2910-61
 ;;9002226.02101,"733,00405-2910-61 ",.02)
 ;;00405-2910-61
 ;;9002226.02101,"733,00405-4521-01 ",.01)
 ;;00405-4521-01
 ;;9002226.02101,"733,00405-4521-01 ",.02)
 ;;00405-4521-01
