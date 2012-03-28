BGP9UXL ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON JUN 05, 2009;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;;BGP CPT HIV TESTS
 ;
 ; This routine loads Taxonomy BGP CPT HIV TESTS
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 D OTHER
 I $O(^TMP("ATX",$J,3.6,0)) D BULL^ATXSTX2
 I $O(^TMP("ATX",$J,9002226,0)) D TAX^ATXSTX2
 D KILL^ATXSTX2
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"86689 ")
 ;;1
 ;;21,"86701 ")
 ;;2
 ;;21,"87390 ")
 ;;3
 ;;21,"87534 ")
 ;;4
 ;;9002226,270,.01)
 ;;BGP CPT HIV TESTS
 ;;9002226,270,.02)
 ;;@
 ;;9002226,270,.04)
 ;;@
 ;;9002226,270,.06)
 ;;@
 ;;9002226,270,.08)
 ;;0
 ;;9002226,270,.09)
 ;;3090605
 ;;9002226,270,.11)
 ;;@
 ;;9002226,270,.12)
 ;;455
 ;;9002226,270,.13)
 ;;1
 ;;9002226,270,.14)
 ;;@
 ;;9002226,270,.15)
 ;;81
 ;;9002226,270,.16)
 ;;@
 ;;9002226,270,.17)
 ;;@
 ;;9002226,270,3101)
 ;;@
 ;;9002226.02101,"270,86689 ",.01)
 ;;86689 
 ;;9002226.02101,"270,86689 ",.02)
 ;;86689 
 ;;9002226.02101,"270,86701 ",.01)
 ;;86701 
 ;;9002226.02101,"270,86701 ",.02)
 ;;86703 
 ;;9002226.02101,"270,87390 ",.01)
 ;;87390 
 ;;9002226.02101,"270,87390 ",.02)
 ;;87391 
 ;;9002226.02101,"270,87534 ",.01)
 ;;87534 
 ;;9002226.02101,"270,87534 ",.02)
 ;;87539 
 ;
OTHER ; OTHER ROUTINES
 Q
