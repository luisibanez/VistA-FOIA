BTPWXXK ;VNGT/HS/ALA-CREATED BY ^ATXSTX ON FEB 08, 2010;
 ;;1.0;CARE MANAGEMENT EVENT TRACKING;;Feb 07, 2011
 ;;BTPW OSTEO SCREEN PROC
 ;
 ; This routine loads Taxonomy BTPW OSTEO SCREEN PROC
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
 ;;21,"88.98 ")
 ;;1
 ;;9002226,1359,.01)
 ;;BTPW OSTEO SCREEN PROC
 ;;9002226,1359,.02)
 ;;Osteoporosis Screen Proc
 ;;9002226,1359,.04)
 ;;@
 ;;9002226,1359,.06)
 ;;@
 ;;9002226,1359,.08)
 ;;0
 ;;9002226,1359,.09)
 ;;3100111
 ;;9002226,1359,.11)
 ;;@
 ;;9002226,1359,.12)
 ;;255
 ;;9002226,1359,.13)
 ;;@
 ;;9002226,1359,.14)
 ;;@
 ;;9002226,1359,.15)
 ;;80.1
 ;;9002226,1359,.16)
 ;;@
 ;;9002226,1359,.17)
 ;;@
 ;;9002226,1359,3101)
 ;;@
 ;;9002226.02101,"1359,88.98 ",.01)
 ;;88.98
 ;;9002226.02101,"1359,88.98 ",.02)
 ;;88.98
 ;
OTHER ; OTHER ROUTINES
 Q
