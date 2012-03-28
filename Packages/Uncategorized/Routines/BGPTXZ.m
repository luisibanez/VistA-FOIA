BGPTXZ ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 21, 2005 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;BGP CMS BETA BLOCKER CLASS
 ;
 ; This routine loads Taxonomy BGP CMS BETA BLOCKER CLASS
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
 ;;21,"CV100 ")
 ;;1
 ;;9002226,341,.01)
 ;;BGP CMS BETA BLOCKER CLASS
 ;;9002226,341,.02)
 ;;@
 ;;9002226,341,.04)
 ;;@
 ;;9002226,341,.06)
 ;;@
 ;;9002226,341,.08)
 ;;@
 ;;9002226,341,.09)
 ;;@
 ;;9002226,341,.11)
 ;;@
 ;;9002226,341,.12)
 ;;@
 ;;9002226,341,.13)
 ;;1
 ;;9002226,341,.14)
 ;;@
 ;;9002226,341,.15)
 ;;@
 ;;9002226,341,.16)
 ;;@
 ;;9002226,341,.17)
 ;;@
 ;;9002226,341,3101)
 ;;@
 ;;9002226.02101,"341,CV100 ",.01)
 ;;CV100
 ;;9002226.02101,"341,CV100 ",.02)
 ;;CV100
 ;
OTHER ; OTHER ROUTINES
 Q
