BQIATXG ;PRXM/HC/ALA-CREATED BY ^ATXSTX ON SEP 19, 2006;
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 ;;BQI KNOWN CVD-MULT DXS
 ;
 ; This routine loads Taxonomy BQI KNOWN CVD-MULT DXS
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
 ;;21,"430. ")
 ;;1
 ;;21,"432.0 ")
 ;;2
 ;;21,"433.0 ")
 ;;3
 ;;21,"434.0 ")
 ;;4
 ;;21,"435.0 ")
 ;;5
 ;;21,"436. ")
 ;;6
 ;;21,"437.0 ")
 ;;7
 ;;21,"440.0 ")
 ;;8
 ;;21,"441.0 ")
 ;;9
 ;;9002226,575,.01)
 ;;BQI KNOWN CVD-MULT DXS
 ;;9002226,575,.02)
 ;;@
 ;;9002226,575,.04)
 ;;@
 ;;9002226,575,.06)
 ;;@
 ;;9002226,575,.08)
 ;;0
 ;;9002226,575,.09)
 ;;3060525
 ;;9002226,575,.11)
 ;;@
 ;;9002226,575,.12)
 ;;31
 ;;9002226,575,.13)
 ;;1
 ;;9002226,575,.14)
 ;;@
 ;;9002226,575,.15)
 ;;80
 ;;9002226,575,.16)
 ;;@
 ;;9002226,575,.17)
 ;;@
 ;;9002226,575,3101)
 ;;@
 ;;9002226.02101,"575,430. ",.01)
 ;;430. 
 ;;9002226.02101,"575,430. ",.02)
 ;;430. 
 ;;9002226.02101,"575,432.0 ",.01)
 ;;432.0
 ;;9002226.02101,"575,432.0 ",.02)
 ;;432.99
 ;;9002226.02101,"575,433.0 ",.01)
 ;;433.0
 ;;9002226.02101,"575,433.0 ",.02)
 ;;433.99
 ;;9002226.02101,"575,434.0 ",.01)
 ;;434.0
 ;;9002226.02101,"575,434.0 ",.02)
 ;;434.99
 ;;9002226.02101,"575,435.0 ",.01)
 ;;435.0
 ;;9002226.02101,"575,435.0 ",.02)
 ;;435.9
 ;;9002226.02101,"575,436. ",.01)
 ;;436. 
 ;;9002226.02101,"575,436. ",.02)
 ;;436. 
 ;;9002226.02101,"575,437.0 ",.01)
 ;;437.0
 ;;9002226.02101,"575,437.0 ",.02)
 ;;437.99
 ;;9002226.02101,"575,440.0 ",.01)
 ;;440.0
 ;;9002226.02101,"575,440.0 ",.02)
 ;;440.99
 ;;9002226.02101,"575,441.0 ",.01)
 ;;441.0
 ;;9002226.02101,"575,441.0 ",.02)
 ;;441.99
 ;
OTHER ; OTHER ROUTINES
 Q