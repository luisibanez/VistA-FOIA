BGPTXXQ ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 19, 2004 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"781,33352-6 ",.02)
 ;;33352-6
 ;;9002226.02101,"781,33558-8 ",.01)
 ;;33558-8
 ;;9002226.02101,"781,33558-8 ",.02)
 ;;33558-8
 ;;9002226.02101,"781,33659-4 ",.01)
 ;;33659-4
 ;;9002226.02101,"781,33659-4 ",.02)
 ;;33659-4
 ;;9002226.02101,"781,33798-0 ",.01)
 ;;33798-0
 ;;9002226.02101,"781,33798-0 ",.02)
 ;;33798-0
 ;;9002226.02101,"781,33859-0 ",.01)
 ;;33859-0
 ;;9002226.02101,"781,33859-0 ",.02)
 ;;33859-0
 ;;9002226.02101,"781,33860-8 ",.01)
 ;;33860-8
 ;;9002226.02101,"781,33860-8 ",.02)
 ;;33860-8
 ;;9002226.02101,"781,33873-1 ",.01)
 ;;33873-1
 ;;9002226.02101,"781,33873-1 ",.02)
 ;;33873-1
 ;;9002226.02101,"781,33874-9 ",.01)
 ;;33874-9
 ;;9002226.02101,"781,33874-9 ",.02)
 ;;33874-9
 ;;9002226.02101,"781,33876-4 ",.01)
 ;;33876-4
 ;;9002226.02101,"781,33876-4 ",.02)
 ;;33876-4
 ;;9002226.02101,"781,33948-1 ",.01)
 ;;33948-1
 ;;9002226.02101,"781,33948-1 ",.02)
 ;;33948-1
 ;;9002226.02101,"781,33949-9 ",.01)
 ;;33949-9
 ;;9002226.02101,"781,33949-9 ",.02)
 ;;33949-9
 ;;9002226.02101,"781,33950-7 ",.01)
 ;;33950-7
 ;;9002226.02101,"781,33950-7 ",.02)
 ;;33950-7
 ;;9002226.02101,"781,33951-5 ",.01)
 ;;33951-5
 ;;9002226.02101,"781,33951-5 ",.02)
 ;;33951-5
 ;;9002226.02101,"781,5919-6 ",.01)
 ;;5919-6
 ;;9002226.02101,"781,5919-6 ",.02)
 ;;5919-6
 ;;9002226.02101,"781,9318-7 ",.01)
 ;;9318-7
 ;;9002226.02101,"781,9318-7 ",.02)
 ;;9318-7
 ;;9002226.02101,"781,9321-1 ",.01)
 ;;9321-1
 ;;9002226.02101,"781,9321-1 ",.02)
 ;;9321-1
 ;;9002226.02101,"781,9641-2 ",.01)
 ;;9641-2
 ;;9002226.02101,"781,9641-2 ",.02)
 ;;9641-2
 ;;9002226.02101,"781,9645-3 ",.01)
 ;;9645-3
 ;;9002226.02101,"781,9645-3 ",.02)
 ;;9645-3
