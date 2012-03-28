BGP8HXT ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 28, 2007 ;
 ;;8.0;IHS CLINICAL REPORTING;;MAR 12, 2008
 ;;;BGP6;;SEP 28, 2007
 ;;BGP PTCA PROCS
 ;
 ; This routine loads Taxonomy BGP PTCA PROCS
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
 ;;21,"00.66 ")
 ;;1
 ;;21,"36.01 ")
 ;;2
 ;;21,"36.05 ")
 ;;3
 ;;21,"36.06 ")
 ;;4
 ;;9002226,487,.01)
 ;;BGP PTCA PROCS
 ;;9002226,487,.02)
 ;;@
 ;;9002226,487,.04)
 ;;@
 ;;9002226,487,.06)
 ;;@
 ;;9002226,487,.08)
 ;;0
 ;;9002226,487,.09)
 ;;3070705
 ;;9002226,487,.11)
 ;;@
 ;;9002226,487,.12)
 ;;255
 ;;9002226,487,.13)
 ;;1
 ;;9002226,487,.14)
 ;;@
 ;;9002226,487,.15)
 ;;80.1
 ;;9002226,487,.16)
 ;;@
 ;;9002226,487,.17)
 ;;@
 ;;9002226,487,3101)
 ;;@
 ;;9002226.02101,"487,00.66 ",.01)
 ;;00.66 
 ;;9002226.02101,"487,00.66 ",.02)
 ;;00.66 
 ;;9002226.02101,"487,36.01 ",.01)
 ;;36.01 
 ;;9002226.02101,"487,36.01 ",.02)
 ;;36.02 
 ;;9002226.02101,"487,36.05 ",.01)
 ;;36.05 
 ;;9002226.02101,"487,36.05 ",.02)
 ;;36.05 
 ;;9002226.02101,"487,36.06 ",.01)
 ;;36.06 
 ;;9002226.02101,"487,36.06 ",.02)
 ;;36.09 
 ;
OTHER ; OTHER ROUTINES
 Q
