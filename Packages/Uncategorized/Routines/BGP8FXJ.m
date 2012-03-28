BGP8FXJ ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 28, 2007 ;
 ;;8.0;IHS CLINICAL REPORTING;;MAR 12, 2008
 ;;;BGP6;;SEP 28, 2007
 ;;BGP HEDIS NEPHROPTHY SCR LOINC
 ;
 ; This routine loads Taxonomy BGP HEDIS NEPHROPTHY SCR LOINC
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
 ;;21,"11218-5 ")
 ;;1
 ;;21,"12842-1 ")
 ;;22
 ;;21,"13705-9 ")
 ;;13
 ;;21,"13801-6 ")
 ;;23
 ;;21,"14585-4 ")
 ;;14
 ;;21,"14956-7 ")
 ;;2
 ;;21,"14957-5 ")
 ;;3
 ;;21,"14958-3 ")
 ;;4
 ;;21,"14959-1 ")
 ;;5
 ;;21,"1753-3 ")
 ;;9
 ;;21,"1754-1 ")
 ;;10
 ;;21,"1755-8 ")
 ;;11
 ;;21,"18373-1 ")
 ;;24
 ;;21,"20621-9 ")
 ;;15
 ;;21,"21059-1 ")
 ;;16
 ;;21,"21482-5 ")
 ;;25
 ;;21,"26801-1 ")
 ;;26
 ;;21,"27298-9 ")
 ;;27
 ;;21,"2887-8 ")
 ;;18
 ;;21,"2888-6 ")
 ;;19
 ;;21,"2889-4 ")
 ;;20
 ;;21,"2890-2 ")
 ;;21
 ;;21,"30000-4 ")
 ;;6
 ;;21,"30001-2 ")
 ;;7
 ;;21,"30003-8 ")
 ;;8
 ;;21,"32209-9 ")
 ;;28
 ;;21,"32294-1 ")
 ;;17
 ;;21,"32551-4 ")
 ;;29
 ;;21,"34366-5 ")
 ;;30
 ;;21,"35663-4 ")
 ;;31
 ;;21,"9318-7 ")
 ;;12
 ;;9002226,811,.01)
 ;;BGP HEDIS NEPHROPTHY SCR LOINC
 ;;9002226,811,.02)
 ;;@
 ;;9002226,811,.04)
 ;;n
 ;;9002226,811,.06)
 ;;@
 ;;9002226,811,.08)
 ;;@
 ;;9002226,811,.09)
 ;;@
 ;;9002226,811,.11)
 ;;@
 ;;9002226,811,.12)
 ;;@
 ;;9002226,811,.13)
 ;;1
 ;;9002226,811,.14)
 ;;FIHS
 ;;9002226,811,.15)
 ;;95.3
 ;;9002226,811,.16)
 ;;@
 ;;9002226,811,.17)
 ;;@
 ;;9002226,811,3101)
 ;;@
 ;;9002226.02101,"811,11218-5 ",.01)
 ;;11218-5
 ;;9002226.02101,"811,11218-5 ",.02)
 ;;11218-5
 ;;9002226.02101,"811,12842-1 ",.01)
 ;;12842-1
 ;;9002226.02101,"811,12842-1 ",.02)
 ;;12842-1
 ;;9002226.02101,"811,13705-9 ",.01)
 ;;13705-9
 ;;9002226.02101,"811,13705-9 ",.02)
 ;;13705-9
 ;;9002226.02101,"811,13801-6 ",.01)
 ;;13801-6
 ;;9002226.02101,"811,13801-6 ",.02)
 ;;13801-6
 ;;9002226.02101,"811,14585-4 ",.01)
 ;;14585-4
 ;;9002226.02101,"811,14585-4 ",.02)
 ;;14585-4
 ;;9002226.02101,"811,14956-7 ",.01)
 ;;14956-7
 ;;9002226.02101,"811,14956-7 ",.02)
 ;;14956-7
 ;;9002226.02101,"811,14957-5 ",.01)
 ;;14957-5
 ;;9002226.02101,"811,14957-5 ",.02)
 ;;14957-5
 ;;9002226.02101,"811,14958-3 ",.01)
 ;;14958-3
 ;;9002226.02101,"811,14958-3 ",.02)
 ;;14958-3
 ;;9002226.02101,"811,14959-1 ",.01)
 ;;14959-1
 ;;9002226.02101,"811,14959-1 ",.02)
 ;;14959-1
 ;;9002226.02101,"811,1753-3 ",.01)
 ;;1753-3
 ;;9002226.02101,"811,1753-3 ",.02)
 ;;1753-3
 ;;9002226.02101,"811,1754-1 ",.01)
 ;;1754-1
 ;;9002226.02101,"811,1754-1 ",.02)
 ;;1754-1
 ;;9002226.02101,"811,1755-8 ",.01)
 ;;1755-8
 ;;9002226.02101,"811,1755-8 ",.02)
 ;;1755-8
 ;;9002226.02101,"811,18373-1 ",.01)
 ;;18373-1
 ;;9002226.02101,"811,18373-1 ",.02)
 ;;18373-1
 ;;9002226.02101,"811,20621-9 ",.01)
 ;;20621-9
 ;;9002226.02101,"811,20621-9 ",.02)
 ;;20621-9
 ;;9002226.02101,"811,21059-1 ",.01)
 ;;21059-1
 ;;9002226.02101,"811,21059-1 ",.02)
 ;;21059-1
 ;;9002226.02101,"811,21482-5 ",.01)
 ;;21482-5
 ;;9002226.02101,"811,21482-5 ",.02)
 ;;21482-5
 ;;9002226.02101,"811,26801-1 ",.01)
 ;;26801-1
 ;;9002226.02101,"811,26801-1 ",.02)
 ;;26801-1
 ;;9002226.02101,"811,27298-9 ",.01)
 ;;27298-9
 ;;9002226.02101,"811,27298-9 ",.02)
 ;;27298-9
 ;;9002226.02101,"811,2887-8 ",.01)
 ;;2887-8
 ;;9002226.02101,"811,2887-8 ",.02)
 ;;2887-8
 ;;9002226.02101,"811,2888-6 ",.01)
 ;;2888-6
 ;;9002226.02101,"811,2888-6 ",.02)
 ;;2888-6
 ;;9002226.02101,"811,2889-4 ",.01)
 ;;2889-4
 ;;9002226.02101,"811,2889-4 ",.02)
 ;;2889-4
 ;;9002226.02101,"811,2890-2 ",.01)
 ;;2890-2
 ;;9002226.02101,"811,2890-2 ",.02)
 ;;2890-2
 ;;9002226.02101,"811,30000-4 ",.01)
 ;;30000-4
 ;;9002226.02101,"811,30000-4 ",.02)
 ;;30000-4
 ;;9002226.02101,"811,30001-2 ",.01)
 ;;30001-2
 ;;9002226.02101,"811,30001-2 ",.02)
 ;;30001-2
 ;;9002226.02101,"811,30003-8 ",.01)
 ;;30003-8
 ;;9002226.02101,"811,30003-8 ",.02)
 ;;30003-8
 ;;9002226.02101,"811,32209-9 ",.01)
 ;;32209-9
 ;;9002226.02101,"811,32209-9 ",.02)
 ;;32209-9
 ;;9002226.02101,"811,32294-1 ",.01)
 ;;32294-1
 ;;9002226.02101,"811,32294-1 ",.02)
 ;;32294-1
 ;;9002226.02101,"811,32551-4 ",.01)
 ;;32551-4
 ;;9002226.02101,"811,32551-4 ",.02)
 ;;32551-4
 ;;9002226.02101,"811,34366-5 ",.01)
 ;;34366-5
 ;;9002226.02101,"811,34366-5 ",.02)
 ;;34366-5
 ;;9002226.02101,"811,35663-4 ",.01)
 ;;35663-4
 ;;9002226.02101,"811,35663-4 ",.02)
 ;;35663-4
 ;;9002226.02101,"811,9318-7 ",.01)
 ;;9318-7
 ;;9002226.02101,"811,9318-7 ",.02)
 ;;9318-7
 ;
OTHER ; OTHER ROUTINES
 Q
