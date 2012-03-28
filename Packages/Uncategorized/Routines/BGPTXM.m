BGPTXM ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 21, 2005 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;BGP CABG PROCS
 ;
 ; This routine loads Taxonomy BGP CABG PROCS
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
 ;;21,"36.10 ")
 ;;1
 ;;9002226,398,.01)
 ;;BGP CABG PROCS
 ;;9002226,398,.02)
 ;;@
 ;;9002226,398,.04)
 ;;@
 ;;9002226,398,.06)
 ;;@
 ;;9002226,398,.08)
 ;;0
 ;;9002226,398,.09)
 ;;3050410
 ;;9002226,398,.11)
 ;;@
 ;;9002226,398,.12)
 ;;255
 ;;9002226,398,.13)
 ;;1
 ;;9002226,398,.14)
 ;;@
 ;;9002226,398,.15)
 ;;80.1
 ;;9002226,398,.16)
 ;;@
 ;;9002226,398,.17)
 ;;@
 ;;9002226,398,3101)
 ;;@
 ;;9002226.02101,"398,36.10 ",.01)
 ;;36.10 
 ;;9002226.02101,"398,36.10 ",.02)
 ;;36.2 
 ;
OTHER ; OTHER ROUTINES
 Q
