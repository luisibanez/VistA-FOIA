BGPVXO ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON JUL 13, 2004 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;BGP GPRA PREGNANCY DIAGNOSES
 ;
 ; This routine loads Taxonomy BGP GPRA PREGNANCY DIAGNOSES
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
 ;;21,"640.00 ")
 ;;1
 ;;21,"651.00 ")
 ;;2
 ;;21,"V22.0 ")
 ;;3
 ;;9002226,773,.01)
 ;;BGP GPRA PREGNANCY DIAGNOSES
 ;;9002226,773,.02)
 ;;@
 ;;9002226,773,.04)
 ;;@
 ;;9002226,773,.06)
 ;;@
 ;;9002226,773,.08)
 ;;0
 ;;9002226,773,.09)
 ;;3030305
 ;;9002226,773,.11)
 ;;@
 ;;9002226,773,.12)
 ;;31
 ;;9002226,773,.13)
 ;;1
 ;;9002226,773,.14)
 ;;@
 ;;9002226,773,.15)
 ;;80
 ;;9002226,773,.16)
 ;;@
 ;;9002226,773,.17)
 ;;@
 ;;9002226,773,3101)
 ;;@
 ;;9002226.02101,"773,640.00 ",.01)
 ;;640.00 
 ;;9002226.02101,"773,640.00 ",.02)
 ;;648.94 
 ;;9002226.02101,"773,651.00 ",.01)
 ;;651.00 
 ;;9002226.02101,"773,651.00 ",.02)
 ;;676.94 
 ;;9002226.02101,"773,V22.0 ",.01)
 ;;V22.0 
 ;;9002226.02101,"773,V22.0 ",.02)
 ;;V23.9 
 ;
OTHER ; OTHER ROUTINES
 Q
