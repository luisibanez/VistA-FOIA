BGP8DXL ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 28, 2007 ;
 ;;8.0;IHS CLINICAL REPORTING;;MAR 12, 2008
 ;;;BGP6;;SEP 28, 2007
 ;;BGP COPD DXS BB CONT
 ;
 ; This routine loads Taxonomy BGP COPD DXS BB CONT
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
 ;;21,"491.2 ")
 ;;1
 ;;21,"496. ")
 ;;2
 ;;21,"506.4 ")
 ;;3
 ;;9002226,479,.01)
 ;;BGP COPD DXS BB CONT
 ;;9002226,479,.02)
 ;;@
 ;;9002226,479,.04)
 ;;n
 ;;9002226,479,.06)
 ;;@
 ;;9002226,479,.08)
 ;;0
 ;;9002226,479,.09)
 ;;3050321
 ;;9002226,479,.11)
 ;;@
 ;;9002226,479,.12)
 ;;31
 ;;9002226,479,.13)
 ;;1
 ;;9002226,479,.14)
 ;;@
 ;;9002226,479,.15)
 ;;80
 ;;9002226,479,.16)
 ;;@
 ;;9002226,479,.17)
 ;;@
 ;;9002226,479,3101)
 ;;@
 ;;9002226.02101,"479,491.2 ",.01)
 ;;491.2 
 ;;9002226.02101,"479,491.2 ",.02)
 ;;491.22 
 ;;9002226.02101,"479,496. ",.01)
 ;;496. 
 ;;9002226.02101,"479,496. ",.02)
 ;;496. 
 ;;9002226.02101,"479,506.4 ",.01)
 ;;506.4 
 ;;9002226.02101,"479,506.4 ",.02)
 ;;506.4 
 ;
OTHER ; OTHER ROUTINES
 Q
