BTPWVXR ;VNGT/HS/ALA-CREATED BY ^ATXSTX ON JAN 14, 2010;
 ;;1.0;CARE MANAGEMENT EVENT TRACKING;;Feb 07, 2011
 ;;BTPW CLIN BRST EXAM PROC
 ;
 ; This routine loads Taxonomy BTPW CLIN BRST EXAM PROC
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
 ;;21,"89.36 ")
 ;;1
 ;;9002226,1269,.01)
 ;;BTPW CLIN BRST EXAM PROC
 ;;9002226,1269,.02)
 ;;@
 ;;9002226,1269,.04)
 ;;n
 ;;9002226,1269,.06)
 ;;@
 ;;9002226,1269,.08)
 ;;0
 ;;9002226,1269,.09)
 ;;3060516
 ;;9002226,1269,.11)
 ;;@
 ;;9002226,1269,.12)
 ;;255
 ;;9002226,1269,.13)
 ;;1
 ;;9002226,1269,.14)
 ;;@
 ;;9002226,1269,.15)
 ;;80.1
 ;;9002226,1269,.16)
 ;;@
 ;;9002226,1269,.17)
 ;;@
 ;;9002226,1269,3101)
 ;;@
 ;;9002226.02101,"1269,89.36 ",.01)
 ;;89.36
 ;;9002226.02101,"1269,89.36 ",.02)
 ;;89.36
 ;
OTHER ; OTHER ROUTINES
 Q