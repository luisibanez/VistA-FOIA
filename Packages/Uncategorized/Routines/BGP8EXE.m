BGP8EXE ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 28, 2007 ;
 ;;8.0;IHS CLINICAL REPORTING;;MAR 12, 2008
 ;;;BGP6;;SEP 28, 2007
 ;;BGP ESRD DXS
 ;
 ; This routine loads Taxonomy BGP ESRD DXS
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
 ;;21,"585.5 ")
 ;;1
 ;;21,"V42.0 ")
 ;;2
 ;;21,"V45.1 ")
 ;;3
 ;;21,"V56.0 ")
 ;;4
 ;;9002226,562,.01)
 ;;BGP ESRD DXS
 ;;9002226,562,.02)
 ;;@
 ;;9002226,562,.04)
 ;;@
 ;;9002226,562,.06)
 ;;@
 ;;9002226,562,.08)
 ;;0
 ;;9002226,562,.09)
 ;;3071024
 ;;9002226,562,.11)
 ;;@
 ;;9002226,562,.12)
 ;;31
 ;;9002226,562,.13)
 ;;1
 ;;9002226,562,.14)
 ;;@
 ;;9002226,562,.15)
 ;;80
 ;;9002226,562,.16)
 ;;@
 ;;9002226,562,.17)
 ;;@
 ;;9002226,562,3101)
 ;;@
 ;;9002226.02101,"562,585.5 ",.01)
 ;;585.5 
 ;;9002226.02101,"562,585.5 ",.02)
 ;;585.6 
 ;;9002226.02101,"562,V42.0 ",.01)
 ;;V42.0 
 ;;9002226.02101,"562,V42.0 ",.02)
 ;;V42.0 
 ;;9002226.02101,"562,V45.1 ",.01)
 ;;V45.1 
 ;;9002226.02101,"562,V45.1 ",.02)
 ;;V45.1 
 ;;9002226.02101,"562,V56.0 ",.01)
 ;;V56.0 
 ;;9002226.02101,"562,V56.0 ",.02)
 ;;V56.32 
 ;
OTHER ; OTHER ROUTINES
 Q
