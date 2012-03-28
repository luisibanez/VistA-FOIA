BGP7IXP ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 12, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;BGP ASA ALLERGY 995.0-995.3
 ;
 ; This routine loads Taxonomy BGP ASA ALLERGY 995.0-995.3
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
 ;;21,"995.0 ")
 ;;1
 ;;9002226,452,.01)
 ;;BGP ASA ALLERGY 995.0-995.3
 ;;9002226,452,.02)
 ;;@
 ;;9002226,452,.04)
 ;;n
 ;;9002226,452,.06)
 ;;@
 ;;9002226,452,.08)
 ;;0
 ;;9002226,452,.09)
 ;;3041020
 ;;9002226,452,.11)
 ;;@
 ;;9002226,452,.12)
 ;;31
 ;;9002226,452,.13)
 ;;1
 ;;9002226,452,.14)
 ;;@
 ;;9002226,452,.15)
 ;;80
 ;;9002226,452,.16)
 ;;@
 ;;9002226,452,.17)
 ;;@
 ;;9002226,452,3101)
 ;;@
 ;;9002226.02101,"452,995.0 ",.01)
 ;;995.0 
 ;;9002226.02101,"452,995.0 ",.02)
 ;;995.3 
 ;
OTHER ; OTHER ROUTINES
 Q
