BGP9RXK ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;;BGP HYPERTENSION DXS
 ;
 ; This routine loads Taxonomy BGP HYPERTENSION DXS
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
 ;;21,"401.0 ")
 ;;1
 ;;9002226,450,.01)
 ;;BGP HYPERTENSION DXS
 ;;9002226,450,.02)
 ;;@
 ;;9002226,450,.04)
 ;;n
 ;;9002226,450,.06)
 ;;@
 ;;9002226,450,.08)
 ;;0
 ;;9002226,450,.09)
 ;;3040803
 ;;9002226,450,.11)
 ;;@
 ;;9002226,450,.12)
 ;;31
 ;;9002226,450,.13)
 ;;1
 ;;9002226,450,.14)
 ;;@
 ;;9002226,450,.15)
 ;;80
 ;;9002226,450,.16)
 ;;@
 ;;9002226,450,.17)
 ;;@
 ;;9002226,450,3101)
 ;;@
 ;;9002226.02101,"450,401.0 ",.01)
 ;;401.0 
 ;;9002226.02101,"450,401.0 ",.02)
 ;;401.9 
 ;
OTHER ; OTHER ROUTINES
 Q
