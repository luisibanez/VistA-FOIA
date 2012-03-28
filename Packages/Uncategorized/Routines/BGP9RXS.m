BGP9RXS ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;;BGP IPV/DV COUNSELING ICDS
 ;
 ; This routine loads Taxonomy BGP IPV/DV COUNSELING ICDS
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
 ;;21,"V61.11 ")
 ;;1
 ;;9002226,627,.01)
 ;;BGP IPV/DV COUNSELING ICDS
 ;;9002226,627,.02)
 ;;IPV/DV COUNSELING ICDS
 ;;9002226,627,.04)
 ;;n
 ;;9002226,627,.06)
 ;;@
 ;;9002226,627,.08)
 ;;0
 ;;9002226,627,.09)
 ;;3050721
 ;;9002226,627,.11)
 ;;@
 ;;9002226,627,.12)
 ;;31
 ;;9002226,627,.13)
 ;;0
 ;;9002226,627,.14)
 ;;@
 ;;9002226,627,.15)
 ;;80
 ;;9002226,627,.16)
 ;;@
 ;;9002226,627,.17)
 ;;@
 ;;9002226,627,3101)
 ;;@
 ;;9002226.02101,"627,V61.11 ",.01)
 ;;V61.11
 ;;9002226.02101,"627,V61.11 ",.02)
 ;;V61.11
 ;
OTHER ; OTHER ROUTINES
 Q
