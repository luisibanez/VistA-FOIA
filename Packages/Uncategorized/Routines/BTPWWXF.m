BTPWWXF ;VNGT/HS/ALA-CREATED BY ^ATXSTX ON JAN 14, 2010;
 ;;1.0;CARE MANAGEMENT EVENT TRACKING;;Feb 07, 2011
 ;;BTPW ECTOCERVICAL BX CPTS
 ;
 ; This routine loads Taxonomy BTPW ECTOCERVICAL BX CPTS
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
 ;;21,"57454 ")
 ;;1
 ;;21,"57460 ")
 ;;2
 ;;21,"57500 ")
 ;;3
 ;;21,"57520 ")
 ;;4
 ;;9002226,1282,.01)
 ;;BTPW ECTOCERVICAL BX CPTS
 ;;9002226,1282,.02)
 ;;@
 ;;9002226,1282,.04)
 ;;n
 ;;9002226,1282,.06)
 ;;@
 ;;9002226,1282,.08)
 ;;@
 ;;9002226,1282,.09)
 ;;3060516
 ;;9002226,1282,.11)
 ;;@
 ;;9002226,1282,.12)
 ;;455
 ;;9002226,1282,.13)
 ;;1
 ;;9002226,1282,.14)
 ;;@
 ;;9002226,1282,.15)
 ;;81
 ;;9002226,1282,.16)
 ;;@
 ;;9002226,1282,.17)
 ;;@
 ;;9002226,1282,3101)
 ;;@
 ;;9002226.02101,"1282,57454 ",.01)
 ;;57454 
 ;;9002226.02101,"1282,57454 ",.02)
 ;;57455 
 ;;9002226.02101,"1282,57460 ",.01)
 ;;57460 
 ;;9002226.02101,"1282,57460 ",.02)
 ;;57460 
 ;;9002226.02101,"1282,57500 ",.01)
 ;;57500 
 ;;9002226.02101,"1282,57500 ",.02)
 ;;57500 
 ;;9002226.02101,"1282,57520 ",.01)
 ;;57520 
 ;;9002226.02101,"1282,57520 ",.02)
 ;;57520 
 ;
OTHER ; OTHER ROUTINES
 Q
