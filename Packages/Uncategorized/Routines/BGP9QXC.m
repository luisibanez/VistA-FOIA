BGP9QXC ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;;BGP LVAD/HEART TRANSPLANT PROC
 ;
 ; This routine loads Taxonomy BGP LVAD/HEART TRANSPLANT PROC
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
 ;;21,"33.6 ")
 ;;1
 ;;21,"37.51 ")
 ;;2
 ;;21,"37.62 ")
 ;;3
 ;;21,"37.68 ")
 ;;4
 ;;9002226,579,.01)
 ;;BGP LVAD/HEART TRANSPLANT PROC
 ;;9002226,579,.02)
 ;;@
 ;;9002226,579,.04)
 ;;n
 ;;9002226,579,.06)
 ;;@
 ;;9002226,579,.08)
 ;;0
 ;;9002226,579,.09)
 ;;3060327
 ;;9002226,579,.11)
 ;;@
 ;;9002226,579,.12)
 ;;255
 ;;9002226,579,.13)
 ;;1
 ;;9002226,579,.14)
 ;;@
 ;;9002226,579,.15)
 ;;80.1
 ;;9002226,579,.16)
 ;;@
 ;;9002226,579,.17)
 ;;@
 ;;9002226,579,3101)
 ;;@
 ;;9002226.02101,"579,33.6 ",.01)
 ;;33.6 
 ;;9002226.02101,"579,33.6 ",.02)
 ;;33.6 
 ;;9002226.02101,"579,37.51 ",.01)
 ;;37.51 
 ;;9002226.02101,"579,37.51 ",.02)
 ;;37.54 
 ;;9002226.02101,"579,37.62 ",.01)
 ;;37.62 
 ;;9002226.02101,"579,37.62 ",.02)
 ;;37.66 
 ;;9002226.02101,"579,37.68 ",.01)
 ;;37.68 
 ;;9002226.02101,"579,37.68 ",.02)
 ;;37.68 
 ;
OTHER ; OTHER ROUTINES
 Q
