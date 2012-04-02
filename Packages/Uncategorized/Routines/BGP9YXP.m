BGP9YXP ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;;BGP AST CPT
 ;
 ; This routine loads Taxonomy BGP AST CPT
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
 ;;21,"84450 ")
 ;;1
 ;;9002226,547,.01)
 ;;BGP AST CPT
 ;;9002226,547,.02)
 ;;AST CPT CODES
 ;;9002226,547,.04)
 ;;n
 ;;9002226,547,.06)
 ;;@
 ;;9002226,547,.08)
 ;;0
 ;;9002226,547,.09)
 ;;3051208
 ;;9002226,547,.11)
 ;;@
 ;;9002226,547,.12)
 ;;455
 ;;9002226,547,.13)
 ;;1
 ;;9002226,547,.14)
 ;;@
 ;;9002226,547,.15)
 ;;81
 ;;9002226,547,.16)
 ;;@
 ;;9002226,547,.17)
 ;;@
 ;;9002226,547,3101)
 ;;@
 ;;9002226.02101,"547,84450 ",.01)
 ;;84450 
 ;;9002226.02101,"547,84450 ",.02)
 ;;84450 
 ;
OTHER ; OTHER ROUTINES
 Q