BGP8CXW ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 28, 2007 ;
 ;;8.0;IHS CLINICAL REPORTING;;MAR 12, 2008
 ;;;BGP6;;SEP 28, 2007
 ;;BGP CMS PACEMAKER DXS
 ;
 ; This routine loads Taxonomy BGP CMS PACEMAKER DXS
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
 ;;21,"V43.21 ")
 ;;1
 ;;21,"V45.00 ")
 ;;2
 ;;21,"V53.31 ")
 ;;3
 ;;9002226,674,.01)
 ;;BGP CMS PACEMAKER DXS
 ;;9002226,674,.02)
 ;;@
 ;;9002226,674,.04)
 ;;@
 ;;9002226,674,.06)
 ;;@
 ;;9002226,674,.08)
 ;;0
 ;;9002226,674,.09)
 ;;3070525
 ;;9002226,674,.11)
 ;;@
 ;;9002226,674,.12)
 ;;31
 ;;9002226,674,.13)
 ;;1
 ;;9002226,674,.14)
 ;;@
 ;;9002226,674,.15)
 ;;80
 ;;9002226,674,.16)
 ;;@
 ;;9002226,674,.17)
 ;;@
 ;;9002226,674,3101)
 ;;@
 ;;9002226.02101,"674,V43.21 ",.01)
 ;;V43.21 
 ;;9002226.02101,"674,V43.21 ",.02)
 ;;V43.22 
 ;;9002226.02101,"674,V45.00 ",.01)
 ;;V45.00 
 ;;9002226.02101,"674,V45.00 ",.02)
 ;;V45.09 
 ;;9002226.02101,"674,V53.31 ",.01)
 ;;V53.31 
 ;;9002226.02101,"674,V53.31 ",.02)
 ;;V53.39 
 ;
OTHER ; OTHER ROUTINES
 Q
