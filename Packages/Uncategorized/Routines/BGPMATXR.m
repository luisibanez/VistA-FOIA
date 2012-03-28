BGPMATXR ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON FEB 02, 2011;
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 ;;BGPMU MAMMOGRAM DX
 ;
 ; This routine loads Taxonomy BGPMU MAMMOGRAM DX
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
 ;;21,"V76.11 ")
 ;;1
 ;;21,"V76.12 ")
 ;;2
 ;;9002226,740,.01)
 ;;BGPMU MAMMOGRAM DX
 ;;9002226,740,.02)
 ;;Mammogram ICD9 codes
 ;;9002226,740,.04)
 ;;n
 ;;9002226,740,.06)
 ;;@
 ;;9002226,740,.08)
 ;;@
 ;;9002226,740,.09)
 ;;3110118
 ;;9002226,740,.11)
 ;;@
 ;;9002226,740,.12)
 ;;@
 ;;9002226,740,.13)
 ;;@
 ;;9002226,740,.14)
 ;;@
 ;;9002226,740,.15)
 ;;80
 ;;9002226,740,.16)
 ;;1
 ;;9002226,740,.17)
 ;;@
 ;;9002226,740,3101)
 ;;@
 ;;9002226.02101,"740,V76.11 ",.01)
 ;;V76.11
 ;;9002226.02101,"740,V76.11 ",.02)
 ;;V76.11
 ;;9002226.02101,"740,V76.12 ",.01)
 ;;V76.12
 ;;9002226.02101,"740,V76.12 ",.02)
 ;;V76.12
 ;
OTHER ; OTHER ROUTINES
 Q
