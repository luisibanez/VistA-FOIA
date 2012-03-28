ATXTXH ;IHS/OHPRD/TMJ-CREATED BY ^ATXSTX ON FEB 04, 1997;
 ;;5.0;TAXONOMY;;FEB 04, 1997
 ;;SURVEILLANCE TUBERCULOSIS
 ;
 ; This routine loads Taxonomy SURVEILLANCE TUBERCULOSIS
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
 ;;21,"010.00 ")
 ;;1
 ;;21,"137.0 ")
 ;;2
 ;;21,"795.5 ")
 ;;3
 ;;21,"V12.01 ")
 ;;4
 ;;9002226,4,.01)
 ;;SURVEILLANCE TUBERCULOSIS
 ;;9002226,4,.02)
 ;;USED BY HLTH. SUM. SURV.
 ;;9002226,4,.04)
 ;;N
 ;;9002226,4,.06)
 ;;2600101
 ;;9002226,4,.08)
 ;;1
 ;;9002226,4,.09)
 ;;2910319.080612
 ;;9002226,4,.11)
 ;;@
 ;;9002226,4,.12)
 ;;31
 ;;9002226,4,.13)
 ;;1
 ;;9002226,4,.14)
 ;;BA
 ;;9002226,4,.15)
 ;;80
 ;;9002226,4,.16)
 ;;1
 ;;9002226,4,.17)
 ;;@
 ;;9002226,4,3101)
 ;;@
 ;;9002226.02101,"4,010.00 ",.01)
 ;;010.00
 ;;9002226.02101,"4,010.00 ",.02)
 ;;018.96
 ;;9002226.02101,"4,137.0 ",.01)
 ;;137.0
 ;;9002226.02101,"4,137.0 ",.02)
 ;;137.4
 ;;9002226.02101,"4,795.5 ",.01)
 ;;795.5
 ;;9002226.02101,"4,795.5 ",.02)
 ;;795.5
 ;;9002226.02101,"4,V12.01 ",.01)
 ;;V12.01
 ;;9002226.02101,"4,V12.01 ",.02)
 ;;V12.01
 ;
OTHER ; OTHER ROUTINES
 Q
