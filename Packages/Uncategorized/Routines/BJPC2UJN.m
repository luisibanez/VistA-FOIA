BJPC2UJN ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON FEB 17, 2009;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"750,00580-0875-05 ",.01)
 ;;00580-0875-05
 ;;9002226.02101,"750,00580-0875-05 ",.02)
 ;;00580-0875-05
 ;;9002226.02101,"750,00585-0673-02 ",.01)
 ;;00585-0673-02
 ;;9002226.02101,"750,00585-0673-02 ",.02)
 ;;00585-0673-02
 ;;9002226.02101,"750,00585-0673-03 ",.01)
 ;;00585-0673-03
 ;;9002226.02101,"750,00585-0673-03 ",.02)
 ;;00585-0673-03
 ;;9002226.02101,"750,00585-0675-01 ",.01)
 ;;00585-0675-01
 ;;9002226.02101,"750,00585-0675-01 ",.02)
 ;;00585-0675-01
 ;;9002226.02101,"750,00585-0675-02 ",.01)
 ;;00585-0675-02
 ;;9002226.02101,"750,00585-0675-02 ",.02)
 ;;00585-0675-02
 ;;9002226.02101,"750,00585-0685-02 ",.01)
 ;;00585-0685-02
 ;;9002226.02101,"750,00585-0685-02 ",.02)
 ;;00585-0685-02
 ;;9002226.02101,"750,00585-0685-04 ",.01)
 ;;00585-0685-04
 ;;9002226.02101,"750,00585-0685-04 ",.02)
 ;;00585-0685-04
 ;;9002226.02101,"750,00597-0048-01 ",.01)
 ;;00597-0048-01
 ;;9002226.02101,"750,00597-0048-01 ",.02)
 ;;00597-0048-01
 ;;9002226.02101,"750,00597-0049-01 ",.01)
 ;;00597-0049-01
 ;;9002226.02101,"750,00597-0049-01 ",.02)
 ;;00597-0049-01
 ;;9002226.02101,"750,00603-5747-21 ",.01)
 ;;00603-5747-21
 ;;9002226.02101,"750,00603-5747-21 ",.02)
 ;;00603-5747-21
 ;;9002226.02101,"750,00603-5944-21 ",.01)
 ;;00603-5944-21
 ;;9002226.02101,"750,00603-5944-21 ",.02)
 ;;00603-5944-21
 ;;9002226.02101,"750,00603-5944-28 ",.01)
 ;;00603-5944-28
 ;;9002226.02101,"750,00603-5944-28 ",.02)
 ;;00603-5944-28
 ;;9002226.02101,"750,00603-5945-21 ",.01)
 ;;00603-5945-21
 ;;9002226.02101,"750,00603-5945-21 ",.02)
 ;;00603-5945-21
 ;;9002226.02101,"750,00603-5945-28 ",.01)
 ;;00603-5945-28
 ;;9002226.02101,"750,00603-5945-28 ",.02)
 ;;00603-5945-28
 ;;9002226.02101,"750,00603-5945-29 ",.01)
 ;;00603-5945-29
 ;;9002226.02101,"750,00603-5945-29 ",.02)
 ;;00603-5945-29
 ;;9002226.02101,"750,00603-5945-32 ",.01)
 ;;00603-5945-32
 ;;9002226.02101,"750,00603-5945-32 ",.02)
 ;;00603-5945-32
 ;;9002226.02101,"750,00603-5946-21 ",.01)
 ;;00603-5946-21
 ;;9002226.02101,"750,00603-5946-21 ",.02)
 ;;00603-5946-21
 ;;9002226.02101,"750,00603-5946-28 ",.01)
 ;;00603-5946-28
 ;;9002226.02101,"750,00603-5946-28 ",.02)
 ;;00603-5946-28
 ;;9002226.02101,"750,00603-5946-29 ",.01)
 ;;00603-5946-29
 ;;9002226.02101,"750,00603-5946-29 ",.02)
 ;;00603-5946-29
 ;;9002226.02101,"750,00603-5946-32 ",.01)
 ;;00603-5946-32
 ;;9002226.02101,"750,00603-5946-32 ",.02)
 ;;00603-5946-32
 ;;9002226.02101,"750,00603-5949-21 ",.01)
 ;;00603-5949-21
 ;;9002226.02101,"750,00603-5949-21 ",.02)
 ;;00603-5949-21
 ;;9002226.02101,"750,00603-5950-21 ",.01)
 ;;00603-5950-21
 ;;9002226.02101,"750,00603-5950-21 ",.02)
 ;;00603-5950-21
 ;;9002226.02101,"750,00603-5951-21 ",.01)
 ;;00603-5951-21
 ;;9002226.02101,"750,00603-5951-21 ",.02)
 ;;00603-5951-21
 ;;9002226.02101,"750,00603-5952-21 ",.01)
 ;;00603-5952-21
 ;;9002226.02101,"750,00603-5952-21 ",.02)
 ;;00603-5952-21
 ;;9002226.02101,"750,00675-4024-07 ",.01)
 ;;00675-4024-07
 ;;9002226.02101,"750,00675-4024-07 ",.02)
 ;;00675-4024-07
 ;;9002226.02101,"750,00675-4024-10 ",.01)
 ;;00675-4024-10
 ;;9002226.02101,"750,00675-4024-10 ",.02)
 ;;00675-4024-10
 ;;9002226.02101,"750,00677-0817-01 ",.01)
 ;;00677-0817-01
 ;;9002226.02101,"750,00677-0817-01 ",.02)
 ;;00677-0817-01
 ;;9002226.02101,"750,00677-0817-05 ",.01)
 ;;00677-0817-05
 ;;9002226.02101,"750,00677-0817-05 ",.02)
 ;;00677-0817-05
 ;;9002226.02101,"750,00677-0845-01 ",.01)
 ;;00677-0845-01
 ;;9002226.02101,"750,00677-0845-01 ",.02)
 ;;00677-0845-01
 ;;9002226.02101,"750,00677-0846-01 ",.01)
 ;;00677-0846-01
 ;;9002226.02101,"750,00677-0846-01 ",.02)
 ;;00677-0846-01
 ;;9002226.02101,"750,00677-0846-05 ",.01)
 ;;00677-0846-05
 ;;9002226.02101,"750,00677-0846-05 ",.02)
 ;;00677-0846-05
 ;;9002226.02101,"750,00677-1410-01 ",.01)
 ;;00677-1410-01
 ;;9002226.02101,"750,00677-1410-01 ",.02)
 ;;00677-1410-01
 ;;9002226.02101,"750,00686-1689-20 ",.01)
 ;;00686-1689-20
 ;;9002226.02101,"750,00686-1689-20 ",.02)
 ;;00686-1689-20
 ;;9002226.02101,"750,00686-1690-20 ",.01)
 ;;00686-1690-20
 ;;9002226.02101,"750,00686-1690-20 ",.02)
 ;;00686-1690-20
 ;;9002226.02101,"750,00719-1939-10 ",.01)
 ;;00719-1939-10
 ;;9002226.02101,"750,00719-1939-10 ",.02)
 ;;00719-1939-10
 ;;9002226.02101,"750,00719-1942-10 ",.01)
 ;;00719-1942-10
 ;;9002226.02101,"750,00719-1942-10 ",.02)
 ;;00719-1942-10
 ;;9002226.02101,"750,00719-1942-13 ",.01)
 ;;00719-1942-13
 ;;9002226.02101,"750,00719-1942-13 ",.02)
 ;;00719-1942-13
 ;;9002226.02101,"750,00719-1943-10 ",.01)
 ;;00719-1943-10
 ;;9002226.02101,"750,00719-1943-10 ",.02)
 ;;00719-1943-10
 ;;9002226.02101,"750,00719-1943-12 ",.01)
 ;;00719-1943-12
 ;;9002226.02101,"750,00719-1943-12 ",.02)
 ;;00719-1943-12
 ;;9002226.02101,"750,00719-1943-13 ",.01)
 ;;00719-1943-13
 ;;9002226.02101,"750,00719-1943-13 ",.02)
 ;;00719-1943-13
 ;;9002226.02101,"750,00719-1970-10 ",.01)
 ;;00719-1970-10
 ;;9002226.02101,"750,00719-1970-10 ",.02)
 ;;00719-1970-10
 ;;9002226.02101,"750,00719-1970-13 ",.01)
 ;;00719-1970-13
 ;;9002226.02101,"750,00719-1970-13 ",.02)
 ;;00719-1970-13
 ;;9002226.02101,"750,00781-1003-01 ",.01)
 ;;00781-1003-01
 ;;9002226.02101,"750,00781-1003-01 ",.02)
 ;;00781-1003-01
