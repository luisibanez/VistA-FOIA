BGP9WXE ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;;BGP CMS ARB MEDS CLASS
 ;
 ; This routine loads Taxonomy BGP CMS ARB MEDS CLASS
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
 ;;21,"CV805 ")
 ;;1
 ;;9002226,475,.01)
 ;;BGP CMS ARB MEDS CLASS
 ;;9002226,475,.02)
 ;;@
 ;;9002226,475,.04)
 ;;n
 ;;9002226,475,.06)
 ;;@
 ;;9002226,475,.08)
 ;;@
 ;;9002226,475,.09)
 ;;@
 ;;9002226,475,.11)
 ;;@
 ;;9002226,475,.12)
 ;;@
 ;;9002226,475,.13)
 ;;1
 ;;9002226,475,.14)
 ;;@
 ;;9002226,475,.15)
 ;;@
 ;;9002226,475,.16)
 ;;@
 ;;9002226,475,.17)
 ;;@
 ;;9002226,475,3101)
 ;;@
 ;;9002226.02101,"475,CV805 ",.01)
 ;;CV805
 ;;9002226.02101,"475,CV805 ",.02)
 ;;CV805
 ;
OTHER ; OTHER ROUTINES
 Q
