BGP82TMC ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON JUN 09, 2008;
 ;;8.0;IHS CLINICAL REPORTING;**2**;MAR 12, 2008
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"532,68115-0923-90 ",.01)
 ;;68115-0923-90
 ;;9002226.02101,"532,68115-0923-90 ",.02)
 ;;68115-0923-90
 ;;9002226.02101,"532,68734-0700-10 ",.01)
 ;;68734-0700-10
 ;;9002226.02101,"532,68734-0700-10 ",.02)
 ;;68734-0700-10
 ;;9002226.02101,"532,68734-0710-10 ",.01)
 ;;68734-0710-10
 ;;9002226.02101,"532,68734-0710-10 ",.02)
 ;;68734-0710-10
