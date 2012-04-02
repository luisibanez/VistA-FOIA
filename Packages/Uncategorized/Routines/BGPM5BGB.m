BGPM5BGB ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON OCT 27, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;;BGPMU BMI PREG ENC DX
 ;
 ; This routine loads Taxonomy BGPMU BMI PREG ENC DX
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
 ;;21,"V24 ")
 ;;1
 ;;21,"V24.0 ")
 ;;2
 ;;21,"V24.2 ")
 ;;3
 ;;21,"V25 ")
 ;;4
 ;;21,"V25.01 ")
 ;;5
 ;;21,"V25.02 ")
 ;;6
 ;;21,"V25.03 ")
 ;;7
 ;;21,"V25.09 ")
 ;;8
 ;;21,"V26.81 ")
 ;;9
 ;;21,"V28 ")
 ;;10
 ;;21,"V28.3 ")
 ;;11
 ;;21,"V28.81 ")
 ;;12
 ;;21,"V28.82 ")
 ;;13
 ;;21,"V72.4 ")
 ;;14
 ;;21,"V72.40 ")
 ;;15
 ;;21,"V72.41 ")
 ;;16
 ;;21,"V72.42 ")
 ;;17
 ;;9002226,1086,.01)
 ;;BGPMU BMI PREG ENC DX
 ;;9002226,1086,.02)
 ;;Preg Enc ICD codes
 ;;9002226,1086,.04)
 ;;@
 ;;9002226,1086,.06)
 ;;@
 ;;9002226,1086,.08)
 ;;@
 ;;9002226,1086,.09)
 ;;@
 ;;9002226,1086,.11)
 ;;@
 ;;9002226,1086,.12)
 ;;@
 ;;9002226,1086,.13)
 ;;@
 ;;9002226,1086,.14)
 ;;@
 ;;9002226,1086,.15)
 ;;80
 ;;9002226,1086,.16)
 ;;@
 ;;9002226,1086,.17)
 ;;@
 ;;9002226,1086,3101)
 ;;@
 ;;9002226.02101,"1086,V24 ",.01)
 ;;V24
 ;;9002226.02101,"1086,V24 ",.02)
 ;;V24
 ;;9002226.02101,"1086,V24.0 ",.01)
 ;;V24.0
 ;;9002226.02101,"1086,V24.0 ",.02)
 ;;V24.0
 ;;9002226.02101,"1086,V24.2 ",.01)
 ;;V24.2
 ;;9002226.02101,"1086,V24.2 ",.02)
 ;;V24.2
 ;;9002226.02101,"1086,V25 ",.01)
 ;;V25
 ;;9002226.02101,"1086,V25 ",.02)
 ;;V25
 ;;9002226.02101,"1086,V25.01 ",.01)
 ;;V25.01
 ;;9002226.02101,"1086,V25.01 ",.02)
 ;;V25.01
 ;;9002226.02101,"1086,V25.02 ",.01)
 ;;V25.02
 ;;9002226.02101,"1086,V25.02 ",.02)
 ;;V25.02
 ;;9002226.02101,"1086,V25.03 ",.01)
 ;;V25.03
 ;;9002226.02101,"1086,V25.03 ",.02)
 ;;V25.03
 ;;9002226.02101,"1086,V25.09 ",.01)
 ;;V25.09
 ;;9002226.02101,"1086,V25.09 ",.02)
 ;;V25.09
 ;;9002226.02101,"1086,V26.81 ",.01)
 ;;V26.81
 ;;9002226.02101,"1086,V26.81 ",.02)
 ;;V26.81
 ;;9002226.02101,"1086,V28 ",.01)
 ;;V28
 ;;9002226.02101,"1086,V28 ",.02)
 ;;V28
 ;;9002226.02101,"1086,V28.3 ",.01)
 ;;V28.3
 ;;9002226.02101,"1086,V28.3 ",.02)
 ;;V28.3
 ;;9002226.02101,"1086,V28.81 ",.01)
 ;;V28.81
 ;;9002226.02101,"1086,V28.81 ",.02)
 ;;V28.81
 ;;9002226.02101,"1086,V28.82 ",.01)
 ;;V28.82
 ;;9002226.02101,"1086,V28.82 ",.02)
 ;;V28.82
 ;;9002226.02101,"1086,V72.4 ",.01)
 ;;V72.4
 ;;9002226.02101,"1086,V72.4 ",.02)
 ;;V72.4
 ;;9002226.02101,"1086,V72.40 ",.01)
 ;;V72.40
 ;;9002226.02101,"1086,V72.40 ",.02)
 ;;V72.40
 ;;9002226.02101,"1086,V72.41 ",.01)
 ;;V72.41
 ;;9002226.02101,"1086,V72.41 ",.02)
 ;;V72.41
 ;;9002226.02101,"1086,V72.42 ",.01)
 ;;V72.42
 ;;9002226.02101,"1086,V72.42 ",.02)
 ;;V72.42
 ;
OTHER ; OTHER ROUTINES
 Q
