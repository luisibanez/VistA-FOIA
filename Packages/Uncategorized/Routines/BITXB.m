BITXB ;IHS/CMI/MWR - ROUTINES TO CREATE PNEUMO RISK TAXONOMY; MAY 10, 2010
 ;;8.4;IMMUNIZATION;;MAY 10,2010
 ;;* MICHAEL REMILLARD, DDS * CIMARRON MEDICAL INFORMATICS, FOR IHS *
 ;;IHS/CMI/LAB-CREATED BY ^ATXSTX ON FEB 3, 2010
 ;;BI HIGH RISK PNEUMO
 ;
 ; This routine loads Taxonomy BI HIGH RISK PNEUMO
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
 ;;21,"042.0 ")
 ;;1
 ;;21,"044.9 ")
 ;;2
 ;;21,"250.00 ")
 ;;3
 ;;21,"303.90 ")
 ;;4
 ;;21,"303.91 ")
 ;;5
 ;;21,"428.0 ")
 ;;6
 ;;21,"429.2 ")
 ;;7
 ;;21,"492.0 ")
 ;;8
 ;;21,"493.00 ")
 ;;9
 ;;21,"494. ")
 ;;10
 ;;21,"501. ")
 ;;11
 ;;21,"571.0 ")
 ;;12
 ;;21,"581.0 ")
 ;;13
 ;;21,"585.6 ")
 ;;14
 ;;21,"865.00 ")
 ;;15
 ;;21,"996.80 ")
 ;;16
 ;;21,"V42.0 ")
 ;;17
 ;;21,"V58.1 ")
 ;;18
 ;;21,"V67.2 ")
 ;;19
 ;;9002226,707,.01)
 ;;BI HIGH RISK PNEUMO
 ;;9002226,707,.02)
 ;;@
 ;;9002226,707,.04)
 ;;@
 ;;9002226,707,.06)
 ;;@
 ;;9002226,707,.08)
 ;;0
 ;;9002226,707,.09)
 ;;3100203
 ;;9002226,707,.11)
 ;;@
 ;;9002226,707,.12)
 ;;31
 ;;9002226,707,.13)
 ;;1
 ;;9002226,707,.14)
 ;;@
 ;;9002226,707,.15)
 ;;80
 ;;9002226,707,.16)
 ;;@
 ;;9002226,707,.17)
 ;;@
 ;;9002226,707,3101)
 ;;@
 ;;9002226.02101,"707,042.0 ",.01)
 ;;042.0
 ;;9002226.02101,"707,042.0 ",.02)
 ;;043.9
 ;;9002226.02101,"707,044.9 ",.01)
 ;;044.9
 ;;9002226.02101,"707,044.9 ",.02)
 ;;044.9
 ;;9002226.02101,"707,250.00 ",.01)
 ;;250.00
 ;;9002226.02101,"707,250.00 ",.02)
 ;;250.93
 ;;9002226.02101,"707,303.90 ",.01)
 ;;303.90
 ;;9002226.02101,"707,303.90 ",.02)
 ;;303.90
 ;;9002226.02101,"707,303.91 ",.01)
 ;;303.91
 ;;9002226.02101,"707,303.91 ",.02)
 ;;303.91
 ;;9002226.02101,"707,428.0 ",.01)
 ;;428.0
 ;;9002226.02101,"707,428.0 ",.02)
 ;;428.9
 ;;9002226.02101,"707,429.2 ",.01)
 ;;429.2
 ;;9002226.02101,"707,429.2 ",.02)
 ;;429.2
 ;;9002226.02101,"707,492.0 ",.01)
 ;;492.0
 ;;9002226.02101,"707,492.0 ",.02)
 ;;492.8
 ;;9002226.02101,"707,493.00 ",.01)
 ;;493.00
 ;;9002226.02101,"707,493.00 ",.02)
 ;;493.91
 ;;9002226.02101,"707,494. ",.01)
 ;;494.
 ;;9002226.02101,"707,494. ",.02)
 ;;496.
 ;;9002226.02101,"707,501. ",.01)
 ;;501.
 ;;9002226.02101,"707,501. ",.02)
 ;;505.
 ;;9002226.02101,"707,571.0 ",.01)
 ;;571.0
 ;;9002226.02101,"707,571.0 ",.02)
 ;;571.9
 ;;9002226.02101,"707,581.0 ",.01)
 ;;581.0
 ;;9002226.02101,"707,581.0 ",.02)
 ;;581.9
 ;;9002226.02101,"707,585.6 ",.01)
 ;;585.6
 ;;9002226.02101,"707,585.6 ",.02)
 ;;585.9
 ;;9002226.02101,"707,865.00 ",.01)
 ;;865.00
 ;;9002226.02101,"707,865.00 ",.02)
 ;;865.19
 ;;9002226.02101,"707,996.80 ",.01)
 ;;996.80
 ;;9002226.02101,"707,996.80 ",.02)
 ;;996.89
 ;;9002226.02101,"707,V42.0 ",.01)
 ;;V42.0
 ;;9002226.02101,"707,V42.0 ",.02)
 ;;V42.89
 ;;9002226.02101,"707,V58.1 ",.01)
 ;;V58.1
 ;;9002226.02101,"707,V58.1 ",.02)
 ;;V58.1
 ;;9002226.02101,"707,V67.2 ",.01)
 ;;V67.2
 ;;9002226.02101,"707,V67.2 ",.02)
 ;;V67.2
 ;
OTHER ; OTHER ROUTINES
 Q
