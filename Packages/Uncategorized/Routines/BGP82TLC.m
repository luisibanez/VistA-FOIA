BGP82TLC ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON JUN 09, 2008;
 ;;8.0;IHS CLINICAL REPORTING;**2**;MAR 12, 2008
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"337,54868-4264-00 ",.01)
 ;;54868-4264-00
 ;;9002226.02101,"337,54868-4264-00 ",.02)
 ;;54868-4264-00
 ;;9002226.02101,"337,54868-4295-00 ",.01)
 ;;54868-4295-00
 ;;9002226.02101,"337,54868-4295-00 ",.02)
 ;;54868-4295-00
 ;;9002226.02101,"337,54868-4392-00 ",.01)
 ;;54868-4392-00
 ;;9002226.02101,"337,54868-4392-00 ",.02)
 ;;54868-4392-00
 ;;9002226.02101,"337,54868-4516-00 ",.01)
 ;;54868-4516-00
 ;;9002226.02101,"337,54868-4516-00 ",.02)
 ;;54868-4516-00
 ;;9002226.02101,"337,54868-4517-00 ",.01)
 ;;54868-4517-00
 ;;9002226.02101,"337,54868-4517-00 ",.02)
 ;;54868-4517-00
 ;;9002226.02101,"337,54868-4518-00 ",.01)
 ;;54868-4518-00
 ;;9002226.02101,"337,54868-4518-00 ",.02)
 ;;54868-4518-00
 ;;9002226.02101,"337,54969-4741-00 ",.01)
 ;;54969-4741-00
 ;;9002226.02101,"337,54969-4741-00 ",.02)
 ;;54969-4741-00
 ;;9002226.02101,"337,58016-4604-01 ",.01)
 ;;58016-4604-01
 ;;9002226.02101,"337,58016-4604-01 ",.02)
 ;;58016-4604-01
 ;;9002226.02101,"337,58016-4812-01 ",.01)
 ;;58016-4812-01
 ;;9002226.02101,"337,58016-4812-01 ",.02)
 ;;58016-4812-01
 ;;9002226.02101,"337,58016-4813-01 ",.01)
 ;;58016-4813-01
 ;;9002226.02101,"337,58016-4813-01 ",.02)
 ;;58016-4813-01
 ;;9002226.02101,"337,58016-6075-01 ",.01)
 ;;58016-6075-01
 ;;9002226.02101,"337,58016-6075-01 ",.02)
 ;;58016-6075-01
 ;;9002226.02101,"337,58016-6207-01 ",.01)
 ;;58016-6207-01
 ;;9002226.02101,"337,58016-6207-01 ",.02)
 ;;58016-6207-01
 ;;9002226.02101,"337,59569-4822-00 ",.01)
 ;;59569-4822-00
 ;;9002226.02101,"337,59569-4822-00 ",.02)
 ;;59569-4822-00
 ;;9002226.02101,"337,68115-0657-01 ",.01)
 ;;68115-0657-01
 ;;9002226.02101,"337,68115-0657-01 ",.02)
 ;;68115-0657-01
 ;;9002226.02101,"337,68115-0760-01 ",.01)
 ;;68115-0760-01
 ;;9002226.02101,"337,68115-0760-01 ",.02)
 ;;68115-0760-01
 ;;9002226.02101,"337,68115-0924-60 ",.01)
 ;;68115-0924-60
 ;;9002226.02101,"337,68115-0924-60 ",.02)
 ;;68115-0924-60