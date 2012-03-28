BDM2TXG ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON JAN 12, 2010 ;
 ;;2.0;DIABETES MANAGEMENT SYSTEM;**3**;JUN 14, 2007
 ;;DM AUDIT EKG CPTS
 ;
 ; This routine loads Taxonomy DM AUDIT EKG CPTS
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
 ;;21,"0178T ")
 ;;1
 ;;21,"0179T ")
 ;;2
 ;;21,"0180T ")
 ;;3
 ;;21,"3120F ")
 ;;4
 ;;21,"93000 ")
 ;;5
 ;;21,"93025 ")
 ;;6
 ;;21,"93224 ")
 ;;7
 ;;21,"93268 ")
 ;;8
 ;;21,"93270 ")
 ;;9
 ;;21,"93278 ")
 ;;10
 ;;21,"G0403 ")
 ;;11
 ;;9002226,304,.01)
 ;;DM AUDIT EKG CPTS
 ;;9002226,304,.02)
 ;;@
 ;;9002226,304,.04)
 ;;@
 ;;9002226,304,.06)
 ;;@
 ;;9002226,304,.08)
 ;;0
 ;;9002226,304,.09)
 ;;3100112
 ;;9002226,304,.11)
 ;;@
 ;;9002226,304,.12)
 ;;455
 ;;9002226,304,.13)
 ;;1
 ;;9002226,304,.14)
 ;;@
 ;;9002226,304,.15)
 ;;81
 ;;9002226,304,.16)
 ;;@
 ;;9002226,304,.17)
 ;;@
 ;;9002226,304,3101)
 ;;@
 ;;9002226.02101,"304,0178T ",.01)
 ;;0178T 
 ;;9002226.02101,"304,0178T ",.02)
 ;;0178T 
 ;;9002226.02101,"304,0179T ",.01)
 ;;0179T 
 ;;9002226.02101,"304,0179T ",.02)
 ;;0179T 
 ;;9002226.02101,"304,0180T ",.01)
 ;;0180T 
 ;;9002226.02101,"304,0180T ",.02)
 ;;0180T 
 ;;9002226.02101,"304,3120F ",.01)
 ;;3120F 
 ;;9002226.02101,"304,3120F ",.02)
 ;;3120F 
 ;;9002226.02101,"304,93000 ",.01)
 ;;93000 
 ;;9002226.02101,"304,93000 ",.02)
 ;;93024 
 ;;9002226.02101,"304,93025 ",.01)
 ;;93025 
 ;;9002226.02101,"304,93025 ",.02)
 ;;93042 
 ;;9002226.02101,"304,93224 ",.01)
 ;;93224 
 ;;9002226.02101,"304,93224 ",.02)
 ;;93237 
 ;;9002226.02101,"304,93268 ",.01)
 ;;93268 
 ;;9002226.02101,"304,93268 ",.02)
 ;;93268 
 ;;9002226.02101,"304,93270 ",.01)
 ;;93270 
 ;;9002226.02101,"304,93270 ",.02)
 ;;93272 
 ;;9002226.02101,"304,93278 ",.01)
 ;;93278 
 ;;9002226.02101,"304,93278 ",.02)
 ;;93278 
 ;;9002226.02101,"304,G0403 ",.01)
 ;;G0403 
 ;;9002226.02101,"304,G0403 ",.02)
 ;;G0405 
 ;
OTHER ; OTHER ROUTINES
 Q
