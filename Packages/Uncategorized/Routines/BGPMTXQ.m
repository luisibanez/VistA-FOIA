BGPMTXQ ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON MAR 31, 2011;
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 ;;BGPMU COUNSELING PHYSICAL ACT
 ;
 ; This routine loads Taxonomy BGPMU COUNSELING PHYSICAL ACT
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
 ;;21,"S9451 ")
 ;;2
 ;;21,"V65.41 ")
 ;;1
 ;;9002226,732,.01)
 ;;BGPMU COUNSELING PHYSICAL ACT
 ;;9002226,732,.02)
 ;;Children PE counseling
 ;;9002226,732,.04)
 ;;n
 ;;9002226,732,.06)
 ;;@
 ;;9002226,732,.08)
 ;;@
 ;;9002226,732,.09)
 ;;3110112
 ;;9002226,732,.11)
 ;;@
 ;;9002226,732,.12)
 ;;@
 ;;9002226,732,.13)
 ;;@
 ;;9002226,732,.14)
 ;;@
 ;;9002226,732,.15)
 ;;80
 ;;9002226,732,.16)
 ;;1
 ;;9002226,732,.17)
 ;;@
 ;;9002226,732,3101)
 ;;@
 ;;9002226.02101,"732,S9451 ",.01)
 ;;S9451
 ;;9002226.02101,"732,S9451 ",.02)
 ;;S9451
 ;;9002226.02101,"732,V65.41 ",.01)
 ;;V65.41
 ;;9002226.02101,"732,V65.41 ",.02)
 ;;V65.41
 ;
OTHER ; OTHER ROUTINES
 Q
