BGPVTXR ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 21, 2005 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;;BGPV;;APR 21, 2005
 ;;BGP MEASLES EVIDENCE
 ;
 ; This routine loads Taxonomy BGP MEASLES EVIDENCE
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
 ;;21,"055.0 ")
 ;;1
 ;;21,"055.1 ")
 ;;2
 ;;21,"055.2 ")
 ;;3
 ;;21,"055.71 ")
 ;;4
 ;;21,"055.79 ")
 ;;5
 ;;21,"055.8 ")
 ;;6
 ;;21,"055.9 ")
 ;;7
 ;;9002226,352,.01)
 ;;BGP MEASLES EVIDENCE
 ;;9002226,352,.02)
 ;;BGP MEASLES EVIDENCE
 ;;9002226,352,.04)
 ;;n
 ;;9002226,352,.06)
 ;;@
 ;;9002226,352,.08)
 ;;0
 ;;9002226,352,.09)
 ;;3040527
 ;;9002226,352,.11)
 ;;@
 ;;9002226,352,.12)
 ;;31
 ;;9002226,352,.13)
 ;;1
 ;;9002226,352,.14)
 ;;@
 ;;9002226,352,.15)
 ;;80
 ;;9002226,352,.16)
 ;;@
 ;;9002226,352,.17)
 ;;@
 ;;9002226,352,3101)
 ;;@
 ;;9002226.02101,"352,055.0 ",.01)
 ;;055.0
 ;;9002226.02101,"352,055.0 ",.02)
 ;;055.0
 ;;9002226.02101,"352,055.1 ",.01)
 ;;055.1
 ;;9002226.02101,"352,055.1 ",.02)
 ;;055.1
 ;;9002226.02101,"352,055.2 ",.01)
 ;;055.2
 ;;9002226.02101,"352,055.2 ",.02)
 ;;055.2
 ;;9002226.02101,"352,055.71 ",.01)
 ;;055.71
 ;;9002226.02101,"352,055.71 ",.02)
 ;;055.71
 ;;9002226.02101,"352,055.79 ",.01)
 ;;055.79
 ;;9002226.02101,"352,055.79 ",.02)
 ;;055.79
 ;;9002226.02101,"352,055.8 ",.01)
 ;;055.8
 ;;9002226.02101,"352,055.8 ",.02)
 ;;055.8
 ;;9002226.02101,"352,055.9 ",.01)
 ;;055.9
 ;;9002226.02101,"352,055.9 ",.02)
 ;;055.9
 ;
OTHER ; OTHER ROUTINES
 Q
