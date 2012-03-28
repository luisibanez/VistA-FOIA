BGP9XXK ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;;BGP CBC CPT
 ;
 ; This routine loads Taxonomy BGP CBC CPT
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
 ;;21,"85025 ")
 ;;1
 ;;9002226,543,.01)
 ;;BGP CBC CPT
 ;;9002226,543,.02)
 ;;@
 ;;9002226,543,.04)
 ;;n
 ;;9002226,543,.06)
 ;;@
 ;;9002226,543,.08)
 ;;0
 ;;9002226,543,.09)
 ;;3051208
 ;;9002226,543,.11)
 ;;@
 ;;9002226,543,.12)
 ;;455
 ;;9002226,543,.13)
 ;;1
 ;;9002226,543,.14)
 ;;@
 ;;9002226,543,.15)
 ;;81
 ;;9002226,543,.16)
 ;;@
 ;;9002226,543,.17)
 ;;@
 ;;9002226,543,3101)
 ;;@
 ;;9002226.02101,"543,85025 ",.01)
 ;;85025 
 ;;9002226.02101,"543,85025 ",.02)
 ;;85027 
 ;
OTHER ; OTHER ROUTINES
 Q
