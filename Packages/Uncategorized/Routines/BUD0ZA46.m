BUD0ZA46 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON DEC 13, 2010;
 ;;5.0;IHS/RPMS UNIFORM DATA SYSTEM;;JAN 18, 2011;Build 12
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1062,68115-0671-30 ",.01)
 ;;68115-0671-30
 ;;9002226.02101,"1062,68115-0671-30 ",.02)
 ;;68115-0671-30
 ;;9002226.02101,"1062,68115-0684-30 ",.01)
 ;;68115-0684-30
 ;;9002226.02101,"1062,68115-0684-30 ",.02)
 ;;68115-0684-30
 ;;9002226.02101,"1062,68115-0709-05 ",.01)
 ;;68115-0709-05
 ;;9002226.02101,"1062,68115-0709-05 ",.02)
 ;;68115-0709-05
 ;;9002226.02101,"1062,68115-0712-60 ",.01)
 ;;68115-0712-60
 ;;9002226.02101,"1062,68115-0712-60 ",.02)
 ;;68115-0712-60
 ;;9002226.02101,"1062,68115-0728-10 ",.01)
 ;;68115-0728-10
 ;;9002226.02101,"1062,68115-0728-10 ",.02)
 ;;68115-0728-10
 ;;9002226.02101,"1062,68115-0729-05 ",.01)
 ;;68115-0729-05
 ;;9002226.02101,"1062,68115-0729-05 ",.02)
 ;;68115-0729-05
 ;;9002226.02101,"1062,68115-0746-10 ",.01)
 ;;68115-0746-10
 ;;9002226.02101,"1062,68115-0746-10 ",.02)
 ;;68115-0746-10
 ;;9002226.02101,"1062,68115-0839-10 ",.01)
 ;;68115-0839-10
 ;;9002226.02101,"1062,68115-0839-10 ",.02)
 ;;68115-0839-10
 ;;9002226.02101,"1062,68115-0840-00 ",.01)
 ;;68115-0840-00
 ;;9002226.02101,"1062,68115-0840-00 ",.02)
 ;;68115-0840-00
 ;;9002226.02101,"1062,68115-0841-30 ",.01)
 ;;68115-0841-30
 ;;9002226.02101,"1062,68115-0841-30 ",.02)
 ;;68115-0841-30
 ;;9002226.02101,"1062,68115-0891-60 ",.01)
 ;;68115-0891-60
 ;;9002226.02101,"1062,68115-0891-60 ",.02)
 ;;68115-0891-60
