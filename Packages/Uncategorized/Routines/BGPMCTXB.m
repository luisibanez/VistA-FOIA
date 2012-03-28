BGPMCTXB ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON APR 02, 2011;
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 ;;BGPMU BMI ENC PEDS EM
 ;
 ; This routine loads Taxonomy BGPMU BMI ENC PEDS EM
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
 ;;21,"99201 ")
 ;;1
 ;;21,"99211 ")
 ;;2
 ;;21,"99217 ")
 ;;3
 ;;21,"99241 ")
 ;;4
 ;;21,"99341 ")
 ;;5
 ;;21,"99347 ")
 ;;6
 ;;21,"99384 ")
 ;;7
 ;;21,"99394 ")
 ;;8
 ;;21,"99401 ")
 ;;9
 ;;21,"99411 ")
 ;;10
 ;;21,"99420 ")
 ;;11
 ;;21,"99429 ")
 ;;12
 ;;21,"99455 ")
 ;;13
 ;;9002226,859,.01)
 ;;BGPMU BMI ENC PEDS EM
 ;;9002226,859,.02)
 ;;MU CPTS for peds encounter
 ;;9002226,859,.04)
 ;;n
 ;;9002226,859,.06)
 ;;@
 ;;9002226,859,.08)
 ;;@
 ;;9002226,859,.09)
 ;;3110107
 ;;9002226,859,.11)
 ;;@
 ;;9002226,859,.12)
 ;;@
 ;;9002226,859,.13)
 ;;@
 ;;9002226,859,.14)
 ;;@
 ;;9002226,859,.15)
 ;;81
 ;;9002226,859,.16)
 ;;1
 ;;9002226,859,.17)
 ;;@
 ;;9002226,859,3101)
 ;;@
 ;;9002226.02101,"859,99201 ",.01)
 ;;99201
 ;;9002226.02101,"859,99201 ",.02)
 ;;99205
 ;;9002226.02101,"859,99211 ",.01)
 ;;99211
 ;;9002226.02101,"859,99211 ",.02)
 ;;99215
 ;;9002226.02101,"859,99217 ",.01)
 ;;99217
 ;;9002226.02101,"859,99217 ",.02)
 ;;99220
 ;;9002226.02101,"859,99241 ",.01)
 ;;99241
 ;;9002226.02101,"859,99241 ",.02)
 ;;99245
 ;;9002226.02101,"859,99341 ",.01)
 ;;99341
 ;;9002226.02101,"859,99341 ",.02)
 ;;99245
 ;;9002226.02101,"859,99347 ",.01)
 ;;99347
 ;;9002226.02101,"859,99347 ",.02)
 ;;99350
 ;;9002226.02101,"859,99384 ",.01)
 ;;99384
 ;;9002226.02101,"859,99384 ",.02)
 ;;99387
 ;;9002226.02101,"859,99394 ",.01)
 ;;99394
 ;;9002226.02101,"859,99394 ",.02)
 ;;99397
 ;;9002226.02101,"859,99401 ",.01)
 ;;99401
 ;;9002226.02101,"859,99401 ",.02)
 ;;99404
 ;;9002226.02101,"859,99411 ",.01)
 ;;99411
 ;;9002226.02101,"859,99411 ",.02)
 ;;99412
 ;;9002226.02101,"859,99420 ",.01)
 ;;99420
 ;;9002226.02101,"859,99420 ",.02)
 ;;99420
 ;;9002226.02101,"859,99429 ",.01)
 ;;99429
 ;;9002226.02101,"859,99429 ",.02)
 ;;99429
 ;;9002226.02101,"859,99455 ",.01)
 ;;99455
 ;;9002226.02101,"859,99455 ",.02)
 ;;99456
 ;
OTHER ; OTHER ROUTINES
 Q
