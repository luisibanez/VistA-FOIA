BQIETXG ;PRXM/HC/ALA-CREATED BY ^ATXSTX ON OCT 01, 2007;
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 ;;BQI KNOWN CVD-MULT PROCEDURES
 ;
 ; This routine loads Taxonomy BQI KNOWN CVD-MULT PROCEDURES
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
 ;;21,"38.34 ")
 ;;1
 ;;21,"38.341 ")
 ;;5
 ;;21,"38.342 ")
 ;;6
 ;;21,"38.44 ")
 ;;2
 ;;21,"38.64 ")
 ;;3
 ;;21,"39.71 ")
 ;;4
 ;;9002226,576,.01)
 ;;BQI KNOWN CVD-MULT PROCEDURES
 ;;9002226,576,.02)
 ;;@
 ;;9002226,576,.04)
 ;;@
 ;;9002226,576,.06)
 ;;@
 ;;9002226,576,.08)
 ;;0
 ;;9002226,576,.09)
 ;;3060525
 ;;9002226,576,.11)
 ;;@
 ;;9002226,576,.12)
 ;;255
 ;;9002226,576,.13)
 ;;1
 ;;9002226,576,.14)
 ;;@
 ;;9002226,576,.15)
 ;;80.1
 ;;9002226,576,.16)
 ;;@
 ;;9002226,576,.17)
 ;;@
 ;;9002226,576,3101)
 ;;@
 ;;9002226.02101,"576,38.34 ",.01)
 ;;38.34 
 ;;9002226.02101,"576,38.34 ",.02)
 ;;38.34 
 ;;9002226.02101,"576,38.341 ",.01)
 ;;38.341
 ;;9002226.02101,"576,38.341 ",.02)
 ;;38.341
 ;;9002226.02101,"576,38.342 ",.01)
 ;;38.342
 ;;9002226.02101,"576,38.342 ",.02)
 ;;38.342
 ;;9002226.02101,"576,38.44 ",.01)
 ;;38.44 
 ;;9002226.02101,"576,38.44 ",.02)
 ;;38.44 
 ;;9002226.02101,"576,38.64 ",.01)
 ;;38.64 
 ;;9002226.02101,"576,38.64 ",.02)
 ;;38.64 
 ;;9002226.02101,"576,39.71 ",.01)
 ;;39.71 
 ;;9002226.02101,"576,39.71 ",.02)
 ;;39.71 
 ;
OTHER ; OTHER ROUTINES
 Q