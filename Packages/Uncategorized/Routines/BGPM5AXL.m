BGPM5AXL ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON AUG 30, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1034,67544084932 ",.01)
 ;;67544084932
 ;;9002226.02101,"1034,67544084932 ",.02)
 ;;67544084932
 ;;9002226.02101,"1034,68071040830 ",.01)
 ;;68071040830
 ;;9002226.02101,"1034,68071040830 ",.02)
 ;;68071040830
 ;;9002226.02101,"1034,68462035601 ",.01)
 ;;68462035601
 ;;9002226.02101,"1034,68462035601 ",.02)
 ;;68462035601
 ;;9002226.02101,"1034,68462035605 ",.01)
 ;;68462035605
 ;;9002226.02101,"1034,68462035605 ",.02)
 ;;68462035605
 ;;9002226.02101,"1034,68462038001 ",.01)
 ;;68462038001
 ;;9002226.02101,"1034,68462038001 ",.02)
 ;;68462038001
 ;;9002226.02101,"1034,68462038005 ",.01)
 ;;68462038005
 ;;9002226.02101,"1034,68462038005 ",.02)
 ;;68462038005