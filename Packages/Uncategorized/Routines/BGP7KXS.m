BGP7KXS ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 10, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;BGP ALT LOINC
 ;
 ; This routine loads Taxonomy BGP ALT LOINC
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
 ;;21,"16324-6 ")
 ;;1
 ;;21,"16325-3 ")
 ;;5
 ;;21,"1742-6 ")
 ;;2
 ;;21,"1743-4 ")
 ;;3
 ;;21,"1744-2 ")
 ;;4
 ;;21,"44785-4 ")
 ;;6
 ;;9002226,515,.01)
 ;;BGP ALT LOINC
 ;;9002226,515,.02)
 ;;ALT LOINC CODES
 ;;9002226,515,.04)
 ;;n
 ;;9002226,515,.06)
 ;;@
 ;;9002226,515,.08)
 ;;@
 ;;9002226,515,.09)
 ;;@
 ;;9002226,515,.11)
 ;;@
 ;;9002226,515,.12)
 ;;@
 ;;9002226,515,.13)
 ;;1
 ;;9002226,515,.14)
 ;;FIHS
 ;;9002226,515,.15)
 ;;95.3
 ;;9002226,515,.16)
 ;;@
 ;;9002226,515,.17)
 ;;@
 ;;9002226,515,3101)
 ;;@
 ;;9002226.02101,"515,16324-6 ",.01)
 ;;16324-6
 ;;9002226.02101,"515,16324-6 ",.02)
 ;;16324-6
 ;;9002226.02101,"515,16325-3 ",.01)
 ;;16325-3
 ;;9002226.02101,"515,16325-3 ",.02)
 ;;16325-3
 ;;9002226.02101,"515,1742-6 ",.01)
 ;;1742-6
 ;;9002226.02101,"515,1742-6 ",.02)
 ;;1742-6
 ;;9002226.02101,"515,1743-4 ",.01)
 ;;1743-4
 ;;9002226.02101,"515,1743-4 ",.02)
 ;;1743-4
 ;;9002226.02101,"515,1744-2 ",.01)
 ;;1744-2
 ;;9002226.02101,"515,1744-2 ",.02)
 ;;1744-2
 ;;9002226.02101,"515,44785-4 ",.01)
 ;;44785-4
 ;;9002226.02101,"515,44785-4 ",.02)
 ;;44785-4
 ;
OTHER ; OTHER ROUTINES
 Q
