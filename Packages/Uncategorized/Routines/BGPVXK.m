BGPVXK ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON JUL 09, 2004 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;BGP GPRA SMOKING DXS
 ;
 ; This routine loads Taxonomy BGP GPRA SMOKING DXS
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
 ;;21,"305.1 ")
 ;;1
 ;;21,"V15.82 ")
 ;;2
 ;;9002226,774,.01)
 ;;BGP GPRA SMOKING DXS
 ;;9002226,774,.02)
 ;;@
 ;;9002226,774,.04)
 ;;@
 ;;9002226,774,.06)
 ;;@
 ;;9002226,774,.08)
 ;;0
 ;;9002226,774,.09)
 ;;3030305
 ;;9002226,774,.11)
 ;;@
 ;;9002226,774,.12)
 ;;31
 ;;9002226,774,.13)
 ;;1
 ;;9002226,774,.14)
 ;;@
 ;;9002226,774,.15)
 ;;80
 ;;9002226,774,.16)
 ;;@
 ;;9002226,774,.17)
 ;;@
 ;;9002226,774,3101)
 ;;@
 ;;9002226.02101,"774,305.1 ",.01)
 ;;305.1 
 ;;9002226.02101,"774,305.1 ",.02)
 ;;305.13 
 ;;9002226.02101,"774,V15.82 ",.01)
 ;;V15.82 
 ;;9002226.02101,"774,V15.82 ",.02)
 ;;V15.82 
 ;
OTHER ; OTHER ROUTINES
 Q
