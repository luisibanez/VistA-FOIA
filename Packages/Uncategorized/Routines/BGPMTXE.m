BGPMTXE ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON FEB 02, 2011;
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 ;;BGPMU BMI PERCENTILE ICD
 ;
 ; This routine loads Taxonomy BGPMU BMI PERCENTILE ICD
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
 ;;21,"V85.5 ")
 ;;1
 ;;9002226,729,.01)
 ;;BGPMU BMI PERCENTILE ICD
 ;;9002226,729,.02)
 ;;ICD physical exam findings
 ;;9002226,729,.04)
 ;;n
 ;;9002226,729,.06)
 ;;@
 ;;9002226,729,.08)
 ;;@
 ;;9002226,729,.09)
 ;;3110112
 ;;9002226,729,.11)
 ;;@
 ;;9002226,729,.12)
 ;;@
 ;;9002226,729,.13)
 ;;@
 ;;9002226,729,.14)
 ;;@
 ;;9002226,729,.15)
 ;;80
 ;;9002226,729,.16)
 ;;1
 ;;9002226,729,.17)
 ;;@
 ;;9002226,729,3101)
 ;;@
 ;;9002226.02101,"729,V85.5 ",.01)
 ;;V85.5
 ;;9002226.02101,"729,V85.5 ",.02)
 ;;V85.54
 ;
OTHER ; OTHER ROUTINES
 Q