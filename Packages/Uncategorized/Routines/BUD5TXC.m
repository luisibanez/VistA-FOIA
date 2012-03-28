BUD5TXC ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON JAN 16, 2006 ;
 ;;5.0;IHS/RPMS UNIFORM DATA SYSTEM;;JAN 18, 2011;Build 12
 ;;;BUD5;;JAN 16, 2006
 ;;BGP PAP LOINC CODES
 ;
 ; This routine loads Taxonomy BGP PAP LOINC CODES
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
 ;;21,"10524-7 ")
 ;;1
 ;;21,"10525-4 ")
 ;;2
 ;;21,"11270-6 ")
 ;;3
 ;;21,"16317-0 ")
 ;;4
 ;;21,"1712-9 ")
 ;;5
 ;;21,"18500-9 ")
 ;;6
 ;;21,"19762-4 ")
 ;;7
 ;;21,"19763-2 ")
 ;;8
 ;;21,"19764-0 ")
 ;;9
 ;;21,"19765-7 ")
 ;;10
 ;;21,"19766-5 ")
 ;;11
 ;;21,"19767-3 ")
 ;;12
 ;;21,"19768-1 ")
 ;;13
 ;;21,"19769-9 ")
 ;;14
 ;;21,"19771-5 ")
 ;;15
 ;;21,"19772-3 ")
 ;;16
 ;;21,"19773-1 ")
 ;;17
 ;;21,"19774-9 ")
 ;;18
 ;;21,"33038-1 ")
 ;;19
 ;;9002226,333,.01)
 ;;BGP PAP LOINC CODES
 ;;9002226,333,.02)
 ;;@
 ;;9002226,333,.04)
 ;;n
 ;;9002226,333,.06)
 ;;@
 ;;9002226,333,.08)
 ;;@
 ;;9002226,333,.09)
 ;;@
 ;;9002226,333,.11)
 ;;@
 ;;9002226,333,.12)
 ;;@
 ;;9002226,333,.13)
 ;;1
 ;;9002226,333,.14)
 ;;FIHS
 ;;9002226,333,.15)
 ;;95.3
 ;;9002226,333,.16)
 ;;@
 ;;9002226,333,.17)
 ;;@
 ;;9002226,333,3101)
 ;;@
 ;;9002226.02101,"333,10524-7 ",.01)
 ;;10524-7
 ;;9002226.02101,"333,10524-7 ",.02)
 ;;10524-7
 ;;9002226.02101,"333,10525-4 ",.01)
 ;;10525-4
 ;;9002226.02101,"333,10525-4 ",.02)
 ;;10525-4
 ;;9002226.02101,"333,11270-6 ",.01)
 ;;11270-6
 ;;9002226.02101,"333,11270-6 ",.02)
 ;;11270-6
 ;;9002226.02101,"333,16317-0 ",.01)
 ;;16317-0
 ;;9002226.02101,"333,16317-0 ",.02)
 ;;16317-0
 ;;9002226.02101,"333,1712-9 ",.01)
 ;;1712-9
 ;;9002226.02101,"333,1712-9 ",.02)
 ;;1712-9
 ;;9002226.02101,"333,18500-9 ",.01)
 ;;18500-9
 ;;9002226.02101,"333,18500-9 ",.02)
 ;;18500-9
 ;;9002226.02101,"333,19762-4 ",.01)
 ;;19762-4
 ;;9002226.02101,"333,19762-4 ",.02)
 ;;19762-4
 ;;9002226.02101,"333,19763-2 ",.01)
 ;;19763-2
 ;;9002226.02101,"333,19763-2 ",.02)
 ;;19763-2
 ;;9002226.02101,"333,19764-0 ",.01)
 ;;19764-0
 ;;9002226.02101,"333,19764-0 ",.02)
 ;;19764-0
 ;;9002226.02101,"333,19765-7 ",.01)
 ;;19765-7
 ;;9002226.02101,"333,19765-7 ",.02)
 ;;19765-7
 ;;9002226.02101,"333,19766-5 ",.01)
 ;;19766-5
 ;;9002226.02101,"333,19766-5 ",.02)
 ;;19766-5
 ;;9002226.02101,"333,19767-3 ",.01)
 ;;19767-3
 ;;9002226.02101,"333,19767-3 ",.02)
 ;;19767-3
 ;;9002226.02101,"333,19768-1 ",.01)
 ;;19768-1
 ;;9002226.02101,"333,19768-1 ",.02)
 ;;19768-1
 ;;9002226.02101,"333,19769-9 ",.01)
 ;;19769-9
 ;;9002226.02101,"333,19769-9 ",.02)
 ;;19769-9
 ;;9002226.02101,"333,19771-5 ",.01)
 ;;19771-5
 ;;9002226.02101,"333,19771-5 ",.02)
 ;;19771-5
 ;;9002226.02101,"333,19772-3 ",.01)
 ;;19772-3
 ;;9002226.02101,"333,19772-3 ",.02)
 ;;19772-3
 ;;9002226.02101,"333,19773-1 ",.01)
 ;;19773-1
 ;;9002226.02101,"333,19773-1 ",.02)
 ;;19773-1
 ;;9002226.02101,"333,19774-9 ",.01)
 ;;19774-9
 ;;9002226.02101,"333,19774-9 ",.02)
 ;;19774-9
 ;;9002226.02101,"333,33038-1 ",.01)
 ;;33038-1
 ;;9002226.02101,"333,33038-1 ",.02)
 ;;33038-1
 ;
OTHER ; OTHER ROUTINES
 Q
