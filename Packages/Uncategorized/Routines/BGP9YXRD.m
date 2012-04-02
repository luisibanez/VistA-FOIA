BGP9YXRD ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"461,00456-4310-01 ",.01)
 ;;00456-4310-01
 ;;9002226.02101,"461,00456-4310-01 ",.02)
 ;;00456-4310-01
 ;;9002226.02101,"461,00456-4310-02 ",.01)
 ;;00456-4310-02
 ;;9002226.02101,"461,00456-4310-02 ",.02)
 ;;00456-4310-02
 ;;9002226.02101,"461,00456-4320-00 ",.01)
 ;;00456-4320-00
 ;;9002226.02101,"461,00456-4320-00 ",.02)
 ;;00456-4320-00
 ;;9002226.02101,"461,00456-4320-01 ",.01)
 ;;00456-4320-01
 ;;9002226.02101,"461,00456-4320-01 ",.02)
 ;;00456-4320-01
 ;;9002226.02101,"461,00456-4320-02 ",.01)
 ;;00456-4320-02
 ;;9002226.02101,"461,00456-4320-02 ",.02)
 ;;00456-4320-02
 ;;9002226.02101,"461,00456-4330-00 ",.01)
 ;;00456-4330-00
 ;;9002226.02101,"461,00456-4330-00 ",.02)
 ;;00456-4330-00
 ;;9002226.02101,"461,00456-4330-01 ",.01)
 ;;00456-4330-01
 ;;9002226.02101,"461,00456-4330-01 ",.02)
 ;;00456-4330-01
 ;;9002226.02101,"461,00456-4330-02 ",.01)
 ;;00456-4330-02
 ;;9002226.02101,"461,00456-4330-02 ",.02)
 ;;00456-4330-02
 ;;9002226.02101,"461,00463-9031-16 ",.01)
 ;;00463-9031-16
 ;;9002226.02101,"461,00463-9031-16 ",.02)
 ;;00463-9031-16
 ;;9002226.02101,"461,00472-0750-21 ",.01)
 ;;00472-0750-21
 ;;9002226.02101,"461,00472-0750-21 ",.02)
 ;;00472-0750-21
 ;;9002226.02101,"461,00472-0750-60 ",.01)
 ;;00472-0750-60
 ;;9002226.02101,"461,00472-0750-60 ",.02)
 ;;00472-0750-60
 ;;9002226.02101,"461,00472-1444-16 ",.01)
 ;;00472-1444-16
 ;;9002226.02101,"461,00472-1444-16 ",.02)
 ;;00472-1444-16
 ;;9002226.02101,"461,00585-0673-02 ",.01)
 ;;00585-0673-02
 ;;9002226.02101,"461,00585-0673-02 ",.02)
 ;;00585-0673-02
 ;;9002226.02101,"461,00585-0673-03 ",.01)
 ;;00585-0673-03
 ;;9002226.02101,"461,00585-0673-03 ",.02)
 ;;00585-0673-03
 ;;9002226.02101,"461,00585-0675-01 ",.01)
 ;;00585-0675-01
 ;;9002226.02101,"461,00585-0675-01 ",.02)
 ;;00585-0675-01
 ;;9002226.02101,"461,00585-0675-02 ",.01)
 ;;00585-0675-02
 ;;9002226.02101,"461,00585-0675-02 ",.02)
 ;;00585-0675-02
 ;;9002226.02101,"461,00585-0685-02 ",.01)
 ;;00585-0685-02
 ;;9002226.02101,"461,00585-0685-02 ",.02)
 ;;00585-0685-02
 ;;9002226.02101,"461,00603-5747-21 ",.01)
 ;;00603-5747-21
 ;;9002226.02101,"461,00603-5747-21 ",.02)
 ;;00603-5747-21
 ;;9002226.02101,"461,00603-5944-21 ",.01)
 ;;00603-5944-21
 ;;9002226.02101,"461,00603-5944-21 ",.02)
 ;;00603-5944-21
 ;;9002226.02101,"461,00603-5944-28 ",.01)
 ;;00603-5944-28
 ;;9002226.02101,"461,00603-5944-28 ",.02)
 ;;00603-5944-28
 ;;9002226.02101,"461,00603-5945-21 ",.01)
 ;;00603-5945-21
 ;;9002226.02101,"461,00603-5945-21 ",.02)
 ;;00603-5945-21
 ;;9002226.02101,"461,00603-5945-28 ",.01)
 ;;00603-5945-28
 ;;9002226.02101,"461,00603-5945-28 ",.02)
 ;;00603-5945-28
 ;;9002226.02101,"461,00603-5945-32 ",.01)
 ;;00603-5945-32
 ;;9002226.02101,"461,00603-5945-32 ",.02)
 ;;00603-5945-32
 ;;9002226.02101,"461,00603-5946-21 ",.01)
 ;;00603-5946-21
 ;;9002226.02101,"461,00603-5946-21 ",.02)
 ;;00603-5946-21
 ;;9002226.02101,"461,00603-5946-28 ",.01)
 ;;00603-5946-28
 ;;9002226.02101,"461,00603-5946-28 ",.02)
 ;;00603-5946-28
 ;;9002226.02101,"461,00603-5946-32 ",.01)
 ;;00603-5946-32
 ;;9002226.02101,"461,00603-5946-32 ",.02)
 ;;00603-5946-32
 ;;9002226.02101,"461,00603-5950-21 ",.01)
 ;;00603-5950-21
 ;;9002226.02101,"461,00603-5950-21 ",.02)
 ;;00603-5950-21
 ;;9002226.02101,"461,00603-5951-21 ",.01)
 ;;00603-5951-21
 ;;9002226.02101,"461,00603-5951-21 ",.02)
 ;;00603-5951-21
 ;;9002226.02101,"461,00603-5952-21 ",.01)
 ;;00603-5952-21
 ;;9002226.02101,"461,00603-5952-21 ",.02)
 ;;00603-5952-21
 ;;9002226.02101,"461,00677-0817-01 ",.01)
 ;;00677-0817-01
 ;;9002226.02101,"461,00677-0817-01 ",.02)
 ;;00677-0817-01
 ;;9002226.02101,"461,00677-0817-05 ",.01)
 ;;00677-0817-05
 ;;9002226.02101,"461,00677-0817-05 ",.02)
 ;;00677-0817-05
 ;;9002226.02101,"461,00677-0846-01 ",.01)
 ;;00677-0846-01
 ;;9002226.02101,"461,00677-0846-01 ",.02)
 ;;00677-0846-01
 ;;9002226.02101,"461,00677-0846-05 ",.01)
 ;;00677-0846-05
 ;;9002226.02101,"461,00677-0846-05 ",.02)
 ;;00677-0846-05
 ;;9002226.02101,"461,00904-1610-60 ",.01)
 ;;00904-1610-60
 ;;9002226.02101,"461,00904-1610-60 ",.02)
 ;;00904-1610-60
 ;;9002226.02101,"461,00904-1610-61 ",.01)
 ;;00904-1610-61
 ;;9002226.02101,"461,00904-1610-61 ",.02)
 ;;00904-1610-61
 ;;9002226.02101,"461,00904-1611-40 ",.01)
 ;;00904-1611-40
 ;;9002226.02101,"461,00904-1611-40 ",.02)
 ;;00904-1611-40
 ;;9002226.02101,"461,00904-1611-60 ",.01)
 ;;00904-1611-60
 ;;9002226.02101,"461,00904-1611-60 ",.02)
 ;;00904-1611-60
 ;;9002226.02101,"461,00904-1611-61 ",.01)
 ;;00904-1611-61
 ;;9002226.02101,"461,00904-1611-61 ",.02)
 ;;00904-1611-61
 ;;9002226.02101,"461,00904-1611-80 ",.01)
 ;;00904-1611-80
 ;;9002226.02101,"461,00904-1611-80 ",.02)
 ;;00904-1611-80
 ;;9002226.02101,"461,00904-1612-40 ",.01)
 ;;00904-1612-40
 ;;9002226.02101,"461,00904-1612-40 ",.02)
 ;;00904-1612-40
 ;;9002226.02101,"461,00904-1612-60 ",.01)
 ;;00904-1612-60
 ;;9002226.02101,"461,00904-1612-60 ",.02)
 ;;00904-1612-60
 ;;9002226.02101,"461,00904-1612-61 ",.01)
 ;;00904-1612-61
 ;;9002226.02101,"461,00904-1612-61 ",.02)
 ;;00904-1612-61
 ;;9002226.02101,"461,00904-1612-80 ",.01)
 ;;00904-1612-80
 ;;9002226.02101,"461,00904-1612-80 ",.02)
 ;;00904-1612-80