BGP8CXP ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 28, 2007 ;
 ;;8.0;IHS CLINICAL REPORTING;;MAR 12, 2008
 ;;;BGP6;;SEP 28, 2007
 ;;BGP CMS LVSD DXS
 ;
 ; This routine loads Taxonomy BGP CMS LVSD DXS
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
 ;;21,"428.20 ")
 ;;1
 ;;9002226,475,.01)
 ;;BGP CMS LVSD DXS
 ;;9002226,475,.02)
 ;;@
 ;;9002226,475,.04)
 ;;n
 ;;9002226,475,.06)
 ;;@
 ;;9002226,475,.08)
 ;;0
 ;;9002226,475,.09)
 ;;3050104
 ;;9002226,475,.11)
 ;;@
 ;;9002226,475,.12)
 ;;31
 ;;9002226,475,.13)
 ;;1
 ;;9002226,475,.14)
 ;;@
 ;;9002226,475,.15)
 ;;80
 ;;9002226,475,.16)
 ;;@
 ;;9002226,475,.17)
 ;;@
 ;;9002226,475,3101)
 ;;@
 ;;9002226.02101,"475,428.20 ",.01)
 ;;428.20 
 ;;9002226.02101,"475,428.20 ",.02)
 ;;428.23 
 ;
OTHER ; OTHER ROUTINES
 Q
