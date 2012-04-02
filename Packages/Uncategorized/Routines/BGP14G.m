BGP14G ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 19, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;;BGP PAP SMEAR DXS
 ;
 ; This routine loads Taxonomy BGP PAP SMEAR DXS
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
 ;;21,"795.0 ")
 ;;1
 ;;21,"V67.01 ")
 ;;2
 ;;21,"V72.3 ")
 ;;3
 ;;21,"V72.32 ")
 ;;4
 ;;21,"V76.2 ")
 ;;5
 ;;21,"V76.47 ")
 ;;6
 ;;9002226,875,.01)
 ;;BGP PAP SMEAR DXS
 ;;9002226,875,.02)
 ;;@
 ;;9002226,875,.04)
 ;;n
 ;;9002226,875,.06)
 ;;@
 ;;9002226,875,.08)
 ;;0
 ;;9002226,875,.09)
 ;;3070707
 ;;9002226,875,.11)
 ;;@
 ;;9002226,875,.12)
 ;;31
 ;;9002226,875,.13)
 ;;1
 ;;9002226,875,.14)
 ;;@
 ;;9002226,875,.15)
 ;;80
 ;;9002226,875,.16)
 ;;@
 ;;9002226,875,.17)
 ;;@
 ;;9002226,875,3101)
 ;;@
 ;;9002226.02101,"875,795.0 ",.01)
 ;;795.0 
 ;;9002226.02101,"875,795.0 ",.02)
 ;;795.09 
 ;;9002226.02101,"875,V67.01 ",.01)
 ;;V67.01 
 ;;9002226.02101,"875,V67.01 ",.02)
 ;;V67.01 
 ;;9002226.02101,"875,V72.3 ",.01)
 ;;V72.3 
 ;;9002226.02101,"875,V72.3 ",.02)
 ;;V72.31 
 ;;9002226.02101,"875,V72.32 ",.01)
 ;;V72.32 
 ;;9002226.02101,"875,V72.32 ",.02)
 ;;V72.32 
 ;;9002226.02101,"875,V76.2 ",.01)
 ;;V76.2 
 ;;9002226.02101,"875,V76.2 ",.02)
 ;;V76.2 
 ;;9002226.02101,"875,V76.47 ",.01)
 ;;V76.47 
 ;;9002226.02101,"875,V76.47 ",.02)
 ;;V76.47 
 ;
OTHER ; OTHER ROUTINES
 Q