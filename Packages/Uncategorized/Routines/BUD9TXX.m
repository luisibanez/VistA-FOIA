BUD9TXX ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON NOV 29, 2009 ;
 ;;5.0;IHS/RPMS UNIFORM DATA SYSTEM;;JAN 18, 2011;Build 12
 ;;BUD CPT PAP 09
 ;
 ; This routine loads Taxonomy BUD CPT PAP 09
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
 ;;21,"88141 ")
 ;;1
 ;;21,"88164 ")
 ;;2
 ;;21,"88174 ")
 ;;3
 ;;9002226,1045,.01)
 ;;BUD CPT PAP 09
 ;;9002226,1045,.02)
 ;;@
 ;;9002226,1045,.04)
 ;;@
 ;;9002226,1045,.06)
 ;;@
 ;;9002226,1045,.08)
 ;;0
 ;;9002226,1045,.09)
 ;;3091129
 ;;9002226,1045,.11)
 ;;@
 ;;9002226,1045,.12)
 ;;455
 ;;9002226,1045,.13)
 ;;1
 ;;9002226,1045,.14)
 ;;@
 ;;9002226,1045,.15)
 ;;81
 ;;9002226,1045,.16)
 ;;@
 ;;9002226,1045,.17)
 ;;@
 ;;9002226,1045,3101)
 ;;@
 ;;9002226.02101,"1045,88141 ",.01)
 ;;88141 
 ;;9002226.02101,"1045,88141 ",.02)
 ;;88155 
 ;;9002226.02101,"1045,88164 ",.01)
 ;;88164 
 ;;9002226.02101,"1045,88164 ",.02)
 ;;88167 
 ;;9002226.02101,"1045,88174 ",.01)
 ;;88174 
 ;;9002226.02101,"1045,88174 ",.02)
 ;;88175 
 ;
OTHER ; OTHER ROUTINES
 Q
