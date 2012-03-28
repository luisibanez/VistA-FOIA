BGP9TXT ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
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
 ;;21,"V72.42 ")
 ;;4
 ;;9002226,307,.01)
 ;;BGP GPRA PREGNANCY DIAGNOSES
 ;;9002226,307,.02)
 ;;@
 ;;9002226,307,.04)
 ;;n
 ;;9002226,307,.06)
 ;;@
 ;;9002226,307,.08)
 ;;0
 ;;9002226,307,.09)
 ;;3070806
 ;;9002226,307,.11)
 ;;@
 ;;9002226,307,.12)
 ;;31
 ;;9002226,307,.13)
 ;;1
 ;;9002226,307,.14)
 ;;@
 ;;9002226,307,.15)
 ;;80
 ;;9002226,307,.16)
 ;;@
 ;;9002226,307,.17)
 ;;@
 ;;9002226,307,3101)
 ;;@
 ;;9002226.02101,"307,640.00 ",.01)
 ;;640.00 
 ;;9002226.02101,"307,640.00 ",.02)
 ;;649.64 
 ;;9002226.02101,"307,651.00 ",.01)
 ;;651.00 
 ;;9002226.02101,"307,651.00 ",.02)
 ;;676.94 
 ;;9002226.02101,"307,V22.0 ",.01)
 ;;V22.0 
 ;;9002226.02101,"307,V22.0 ",.02)
 ;;V23.9 
 ;;9002226.02101,"307,V72.42 ",.01)
 ;;V72.42 
 ;;9002226.02101,"307,V72.42 ",.02)
 ;;V72.42 
 ;
OTHER ; OTHER ROUTINES
 Q
