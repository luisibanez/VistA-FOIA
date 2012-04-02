BGPM5APQ ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON AUG 16, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;;BGPMU HEART FAILURE DX
 ;
 ; This routine loads Taxonomy BGPMU HEART FAILURE DX
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
 ;;21,"402.01 ")
 ;;1
 ;;21,"402.11 ")
 ;;2
 ;;21,"402.91 ")
 ;;3
 ;;21,"404.01 ")
 ;;4
 ;;21,"404.03 ")
 ;;5
 ;;21,"404.11 ")
 ;;6
 ;;21,"404.13 ")
 ;;7
 ;;21,"404.91 ")
 ;;8
 ;;21,"404.93 ")
 ;;9
 ;;21,"428.0 ")
 ;;10
 ;;21,"428.1 ")
 ;;11
 ;;21,"428.20 ")
 ;;12
 ;;21,"428.21 ")
 ;;13
 ;;21,"428.22 ")
 ;;14
 ;;21,"428.23 ")
 ;;15
 ;;21,"428.30 ")
 ;;16
 ;;21,"428.31 ")
 ;;17
 ;;21,"428.32 ")
 ;;18
 ;;21,"428.33 ")
 ;;19
 ;;21,"428.40 ")
 ;;20
 ;;21,"428.41 ")
 ;;21
 ;;21,"428.42 ")
 ;;22
 ;;21,"428.43 ")
 ;;23
 ;;21,"428.9 ")
 ;;24
 ;;9002226,809,.01)
 ;;BGPMU HEART FAILURE DX
 ;;9002226,809,.02)
 ;;ICD codes for Heart Failure
 ;;9002226,809,.04)
 ;;n
 ;;9002226,809,.06)
 ;;@
 ;;9002226,809,.08)
 ;;@
 ;;9002226,809,.09)
 ;;3110107
 ;;9002226,809,.11)
 ;;@
 ;;9002226,809,.12)
 ;;@
 ;;9002226,809,.13)
 ;;@
 ;;9002226,809,.14)
 ;;@
 ;;9002226,809,.15)
 ;;80
 ;;9002226,809,.16)
 ;;1
 ;;9002226,809,.17)
 ;;@
 ;;9002226,809,3101)
 ;;@
 ;;9002226.02101,"809,402.01 ",.01)
 ;;402.01
 ;;9002226.02101,"809,402.01 ",.02)
 ;;402.01
 ;;9002226.02101,"809,402.11 ",.01)
 ;;402.11
 ;;9002226.02101,"809,402.11 ",.02)
 ;;402.11
 ;;9002226.02101,"809,402.91 ",.01)
 ;;402.91
 ;;9002226.02101,"809,402.91 ",.02)
 ;;402.91
 ;;9002226.02101,"809,404.01 ",.01)
 ;;404.01
 ;;9002226.02101,"809,404.01 ",.02)
 ;;404.01
 ;;9002226.02101,"809,404.03 ",.01)
 ;;404.03
 ;;9002226.02101,"809,404.03 ",.02)
 ;;404.03
 ;;9002226.02101,"809,404.11 ",.01)
 ;;404.11
 ;;9002226.02101,"809,404.11 ",.02)
 ;;404.11
 ;;9002226.02101,"809,404.13 ",.01)
 ;;404.13
 ;;9002226.02101,"809,404.13 ",.02)
 ;;404.13
 ;;9002226.02101,"809,404.91 ",.01)
 ;;404.91
 ;;9002226.02101,"809,404.91 ",.02)
 ;;404.91
 ;;9002226.02101,"809,404.93 ",.01)
 ;;404.93
 ;;9002226.02101,"809,404.93 ",.02)
 ;;404.93
 ;;9002226.02101,"809,428.0 ",.01)
 ;;428.0
 ;;9002226.02101,"809,428.0 ",.02)
 ;;428.0
 ;;9002226.02101,"809,428.1 ",.01)
 ;;428.1
 ;;9002226.02101,"809,428.1 ",.02)
 ;;428.1
 ;;9002226.02101,"809,428.20 ",.01)
 ;;428.20
 ;;9002226.02101,"809,428.20 ",.02)
 ;;428.20
 ;;9002226.02101,"809,428.21 ",.01)
 ;;428.21
 ;;9002226.02101,"809,428.21 ",.02)
 ;;428.21
 ;;9002226.02101,"809,428.22 ",.01)
 ;;428.22
 ;;9002226.02101,"809,428.22 ",.02)
 ;;428.22
 ;;9002226.02101,"809,428.23 ",.01)
 ;;428.23
 ;;9002226.02101,"809,428.23 ",.02)
 ;;428.23
 ;;9002226.02101,"809,428.30 ",.01)
 ;;428.30
 ;;9002226.02101,"809,428.30 ",.02)
 ;;428.30
 ;;9002226.02101,"809,428.31 ",.01)
 ;;428.31
 ;;9002226.02101,"809,428.31 ",.02)
 ;;428.31
 ;;9002226.02101,"809,428.32 ",.01)
 ;;428.32
 ;;9002226.02101,"809,428.32 ",.02)
 ;;428.32
 ;;9002226.02101,"809,428.33 ",.01)
 ;;428.33
 ;;9002226.02101,"809,428.33 ",.02)
 ;;428.33
 ;;9002226.02101,"809,428.40 ",.01)
 ;;428.40
 ;;9002226.02101,"809,428.40 ",.02)
 ;;428.40
 ;;9002226.02101,"809,428.41 ",.01)
 ;;428.41
 ;;9002226.02101,"809,428.41 ",.02)
 ;;428.41
 ;;9002226.02101,"809,428.42 ",.01)
 ;;428.42
 ;;9002226.02101,"809,428.42 ",.02)
 ;;428.42
 ;;9002226.02101,"809,428.43 ",.01)
 ;;428.43
 ;;9002226.02101,"809,428.43 ",.02)
 ;;428.43
 ;;9002226.02101,"809,428.9 ",.01)
 ;;428.9
 ;;9002226.02101,"809,428.9 ",.02)
 ;;428.9
 ;
OTHER ; OTHER ROUTINES
 Q