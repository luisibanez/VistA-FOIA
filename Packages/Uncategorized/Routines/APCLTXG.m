APCLTXG ; IHS/OHPRD/TMJ -CREATED BY ^ATXSTX ON JAN 09, 1997 ;
 ;;3.0;IHS PCC REPORTS;;FEB 05, 1997
 ;;APCL INJ CUT
 ;
 ; This routine loads Taxonomy APCL INJ CUT
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
 ;;21,"E920.3 ")
 ;;1
 ;;9002226,152,.01)
 ;;APCL INJ CUT
 ;;9002226,152,.02)
 ;;APCL CUT ECODES
 ;;9002226,152,.04)
 ;;@
 ;;9002226,152,.06)
 ;;@
 ;;9002226,152,.08)
 ;;1
 ;;9002226,152,.09)
 ;;2961021.135744
 ;;9002226,152,.11)
 ;;@
 ;;9002226,152,.12)
 ;;157
 ;;9002226,152,.13)
 ;;1
 ;;9002226,152,.14)
 ;;BA
 ;;9002226,152,.15)
 ;;80
 ;;9002226,152,.16)
 ;;1
 ;;9002226,152,.17)
 ;;@
 ;;9002226,152,3101)
 ;;@
 ;;9002226.02101,"152,E920.3 ",.01)
 ;;E920.3
 ;;9002226.02101,"152,E920.3 ",.02)
 ;;E920.9
 ;
OTHER ; OTHER ROUTINES
 Q