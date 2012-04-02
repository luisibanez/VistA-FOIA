BGPM5AZV ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON SEP 07, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;;BGPMU PROSTATE CANCER DX
 ;
 ; This routine loads Taxonomy BGPMU PROSTATE CANCER DX
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
 ;;21,"185 ")
 ;;1
 ;;9002226,1062,.01)
 ;;BGPMU PROSTATE CANCER DX
 ;;9002226,1062,.02)
 ;;PROSTATE CANCER ICD-9s
 ;;9002226,1062,.04)
 ;;@
 ;;9002226,1062,.06)
 ;;@
 ;;9002226,1062,.08)
 ;;@
 ;;9002226,1062,.09)
 ;;@
 ;;9002226,1062,.11)
 ;;@
 ;;9002226,1062,.12)
 ;;@
 ;;9002226,1062,.13)
 ;;@
 ;;9002226,1062,.14)
 ;;@
 ;;9002226,1062,.15)
 ;;80
 ;;9002226,1062,.16)
 ;;@
 ;;9002226,1062,.17)
 ;;@
 ;;9002226,1062,3101)
 ;;@
 ;;9002226.02101,"1062,185 ",.01)
 ;;185
 ;;9002226.02101,"1062,185 ",.02)
 ;;185
 ;
OTHER ; OTHER ROUTINES
 Q
