BGP8DXD ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 28, 2007 ;
 ;;8.0;IHS CLINICAL REPORTING;;MAR 12, 2008
 ;;;BGP6;;SEP 28, 2007
 ;;BGP CMS SEPTI/RESP FAIL DXS
 ;
 ; This routine loads Taxonomy BGP CMS SEPTI/RESP FAIL DXS
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
 ;;21,"038.0 ")
 ;;1
 ;;21,"518.81 ")
 ;;2
 ;;21,"518.84 ")
 ;;3
 ;;9002226,477,.01)
 ;;BGP CMS SEPTI/RESP FAIL DXS
 ;;9002226,477,.02)
 ;;@
 ;;9002226,477,.04)
 ;;n
 ;;9002226,477,.06)
 ;;@
 ;;9002226,477,.08)
 ;;0
 ;;9002226,477,.09)
 ;;3050105
 ;;9002226,477,.11)
 ;;@
 ;;9002226,477,.12)
 ;;31
 ;;9002226,477,.13)
 ;;1
 ;;9002226,477,.14)
 ;;@
 ;;9002226,477,.15)
 ;;80
 ;;9002226,477,.16)
 ;;@
 ;;9002226,477,.17)
 ;;@
 ;;9002226,477,3101)
 ;;@
 ;;9002226.02101,"477,038.0 ",.01)
 ;;038.0 
 ;;9002226.02101,"477,038.0 ",.02)
 ;;038.9 
 ;;9002226.02101,"477,518.81 ",.01)
 ;;518.81 
 ;;9002226.02101,"477,518.81 ",.02)
 ;;518.81 
 ;;9002226.02101,"477,518.84 ",.01)
 ;;518.84 
 ;;9002226.02101,"477,518.84 ",.02)
 ;;518.84 
 ;
OTHER ; OTHER ROUTINES
 Q