BTPWWXC ;VNGT/HS/ALA-CREATED BY ^ATXSTX ON JAN 14, 2010;
 ;;1.0;CARE MANAGEMENT EVENT TRACKING;;Feb 07, 2011
 ;;BTPW DUCTOGRAM CPTS
 ;
 ; This routine loads Taxonomy BTPW DUCTOGRAM CPTS
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
 ;;21,"19030 ")
 ;;1
 ;;21,"76086 ")
 ;;2
 ;;21,"76088 ")
 ;;3
 ;;21,"77053 ")
 ;;4
 ;;21,"77054 ")
 ;;5
 ;;9002226,1280,.01)
 ;;BTPW DUCTOGRAM CPTS
 ;;9002226,1280,.02)
 ;;@
 ;;9002226,1280,.04)
 ;;n
 ;;9002226,1280,.06)
 ;;@
 ;;9002226,1280,.08)
 ;;0
 ;;9002226,1280,.09)
 ;;3061103
 ;;9002226,1280,.11)
 ;;@
 ;;9002226,1280,.12)
 ;;455
 ;;9002226,1280,.13)
 ;;1
 ;;9002226,1280,.14)
 ;;@
 ;;9002226,1280,.15)
 ;;81
 ;;9002226,1280,.16)
 ;;@
 ;;9002226,1280,.17)
 ;;@
 ;;9002226,1280,3101)
 ;;@
 ;;9002226.02101,"1280,19030 ",.01)
 ;;19030 
 ;;9002226.02101,"1280,19030 ",.02)
 ;;19030 
 ;;9002226.02101,"1280,76086 ",.01)
 ;;76086 
 ;;9002226.02101,"1280,76086 ",.02)
 ;;76086 
 ;;9002226.02101,"1280,76088 ",.01)
 ;;76088 
 ;;9002226.02101,"1280,76088 ",.02)
 ;;76088 
 ;;9002226.02101,"1280,77053 ",.01)
 ;;77053
 ;;9002226.02101,"1280,77053 ",.02)
 ;;77053
 ;;9002226.02101,"1280,77054 ",.01)
 ;;77054
 ;;9002226.02101,"1280,77054 ",.02)
 ;;77054
 ;
OTHER ; OTHER ROUTINES
 Q