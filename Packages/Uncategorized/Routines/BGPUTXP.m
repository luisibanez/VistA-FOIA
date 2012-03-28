BGPUTXP ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 21, 2005 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;;BGPU;;APR 21, 2005
 ;;BGP CPT MAMMOGRAM
 ;
 ; This routine loads Taxonomy BGP CPT MAMMOGRAM
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
 ;;21,"76090 ")
 ;;1
 ;;21,"G0202 ")
 ;;2
 ;;21,"G0204 ")
 ;;3
 ;;21,"G0206 ")
 ;;4
 ;;9002226,298,.01)
 ;;BGP CPT MAMMOGRAM
 ;;9002226,298,.02)
 ;;@
 ;;9002226,298,.04)
 ;;n
 ;;9002226,298,.06)
 ;;@
 ;;9002226,298,.08)
 ;;0
 ;;9002226,298,.09)
 ;;3040719
 ;;9002226,298,.11)
 ;;@
 ;;9002226,298,.12)
 ;;455
 ;;9002226,298,.13)
 ;;1
 ;;9002226,298,.14)
 ;;@
 ;;9002226,298,.15)
 ;;81
 ;;9002226,298,.16)
 ;;@
 ;;9002226,298,.17)
 ;;@
 ;;9002226,298,3101)
 ;;@
 ;;9002226.02101,"298,76090 ",.01)
 ;;76090 
 ;;9002226.02101,"298,76090 ",.02)
 ;;76092 
 ;;9002226.02101,"298,G0202 ",.01)
 ;;G0202 
 ;;9002226.02101,"298,G0202 ",.02)
 ;;G0202 
 ;;9002226.02101,"298,G0204 ",.01)
 ;;G0204 
 ;;9002226.02101,"298,G0204 ",.02)
 ;;G0204 
 ;;9002226.02101,"298,G0206 ",.01)
 ;;G0206 
 ;;9002226.02101,"298,G0206 ",.02)
 ;;G0206 
 ;
OTHER ; OTHER ROUTINES
 Q
