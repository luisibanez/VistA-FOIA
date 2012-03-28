BGP6AXB ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON AUG 21, 2005 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;;BGP6;;AUG 21, 2005
 ;;BGP ALCOHOL DXS
 ;
 ; This routine loads Taxonomy BGP ALCOHOL DXS
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
 ;;21,"291.0 ")
 ;;1
 ;;21,"303.00 ")
 ;;2
 ;;21,"305.00 ")
 ;;3
 ;;21,"357.5 ")
 ;;4
 ;;9002226,308,.01)
 ;;BGP ALCOHOL DXS
 ;;9002226,308,.02)
 ;;@
 ;;9002226,308,.04)
 ;;n
 ;;9002226,308,.06)
 ;;@
 ;;9002226,308,.08)
 ;;0
 ;;9002226,308,.09)
 ;;3031111
 ;;9002226,308,.11)
 ;;@
 ;;9002226,308,.12)
 ;;31
 ;;9002226,308,.13)
 ;;1
 ;;9002226,308,.14)
 ;;@
 ;;9002226,308,.15)
 ;;80
 ;;9002226,308,.16)
 ;;@
 ;;9002226,308,.17)
 ;;@
 ;;9002226,308,3101)
 ;;@
 ;;9002226.02101,"308,291.0 ",.01)
 ;;291.0 
 ;;9002226.02101,"308,291.0 ",.02)
 ;;291.9 
 ;;9002226.02101,"308,303.00 ",.01)
 ;;303.00 
 ;;9002226.02101,"308,303.00 ",.02)
 ;;303.93 
 ;;9002226.02101,"308,305.00 ",.01)
 ;;305.00 
 ;;9002226.02101,"308,305.00 ",.02)
 ;;305.03 
 ;;9002226.02101,"308,357.5 ",.01)
 ;;357.5 
 ;;9002226.02101,"308,357.5 ",.02)
 ;;357.5 
 ;
OTHER ; OTHER ROUTINES
 Q
