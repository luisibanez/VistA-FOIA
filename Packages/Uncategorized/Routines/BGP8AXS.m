BGP8AXS ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 28, 2007 ;
 ;;8.0;IHS CLINICAL REPORTING;;MAR 12, 2008
 ;;BGP BMD DXS
 ;
 ; This routine loads Taxonomy BGP BMD DXS
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
 ;;21,"V82.81 ")
 ;;1
 ;;9002226,506,.01)
 ;;BGP BMD DXS
 ;;9002226,506,.02)
 ;;@
 ;;9002226,506,.04)
 ;;n
 ;;9002226,506,.06)
 ;;@
 ;;9002226,506,.08)
 ;;0
 ;;9002226,506,.09)
 ;;3051212
 ;;9002226,506,.11)
 ;;@
 ;;9002226,506,.12)
 ;;31
 ;;9002226,506,.13)
 ;;1
 ;;9002226,506,.14)
 ;;@
 ;;9002226,506,.15)
 ;;80
 ;;9002226,506,.16)
 ;;@
 ;;9002226,506,.17)
 ;;@
 ;;9002226,506,3101)
 ;;@
 ;;9002226.02101,"506,V82.81 ",.01)
 ;;V82.81 
 ;;9002226.02101,"506,V82.81 ",.02)
 ;;V82.81 
 ;
OTHER ; OTHER ROUTINES
 Q
