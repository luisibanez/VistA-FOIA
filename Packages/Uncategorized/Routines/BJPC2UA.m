BJPC2UA ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON JUN 23, 2008 ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;;SURVEILLANCE HYPERTENSION
 ;
 ; This routine loads Taxonomy SURVEILLANCE HYPERTENSION
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
 ;;21,"401.0 ")
 ;;1
 ;;9002226,2,.01)
 ;;SURVEILLANCE HYPERTENSION
 ;;9002226,2,.02)
 ;;USED BY HLTH. SUM. SURV.
 ;;9002226,2,.04)
 ;;n
 ;;9002226,2,.06)
 ;;2600101
 ;;9002226,2,.08)
 ;;1
 ;;9002226,2,.09)
 ;;2910319.075331
 ;;9002226,2,.11)
 ;;@
 ;;9002226,2,.12)
 ;;31
 ;;9002226,2,.13)
 ;;1
 ;;9002226,2,.14)
 ;;BA
 ;;9002226,2,.15)
 ;;80
 ;;9002226,2,.16)
 ;;1
 ;;9002226,2,.17)
 ;;@
 ;;9002226,2,3101)
 ;;@
 ;;9002226.02101,"2,401.0 ",.01)
 ;;401.0
 ;;9002226.02101,"2,401.0 ",.02)
 ;;405.99
 ;
OTHER ; OTHER ROUTINES
 Q
