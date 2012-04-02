BGPM5AOW ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON AUG 09, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;;BGPMU IV DRUG ABUSE DX
 ;
 ; This routine loads Taxonomy BGPMU IV DRUG ABUSE DX
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
 ;;21,"304.0 ")
 ;;1
 ;;21,"304.00 ")
 ;;2
 ;;21,"304.01 ")
 ;;3
 ;;21,"304.02 ")
 ;;4
 ;;21,"304.03 ")
 ;;5
 ;;21,"304.1 ")
 ;;6
 ;;21,"304.10 ")
 ;;7
 ;;21,"304.11 ")
 ;;8
 ;;21,"304.12 ")
 ;;9
 ;;21,"304.13 ")
 ;;10
 ;;21,"304.2 ")
 ;;11
 ;;21,"304.20 ")
 ;;12
 ;;21,"304.21 ")
 ;;13
 ;;21,"304.22 ")
 ;;14
 ;;21,"304.23 ")
 ;;15
 ;;21,"304.4 ")
 ;;16
 ;;21,"304.40 ")
 ;;17
 ;;21,"304.41 ")
 ;;18
 ;;21,"304.42 ")
 ;;19
 ;;21,"304.43 ")
 ;;20
 ;;21,"305.4 ")
 ;;21
 ;;21,"305.40 ")
 ;;22
 ;;21,"305.41 ")
 ;;23
 ;;21,"305.42 ")
 ;;24
 ;;21,"305.43 ")
 ;;25
 ;;21,"305.5 ")
 ;;26
 ;;21,"305.50 ")
 ;;27
 ;;21,"305.51 ")
 ;;28
 ;;21,"305.52 ")
 ;;29
 ;;21,"305.53 ")
 ;;30
 ;;21,"305.6 ")
 ;;31
 ;;21,"305.60 ")
 ;;32
 ;;21,"305.61 ")
 ;;33
 ;;21,"305.62 ")
 ;;34
 ;;21,"305.63 ")
 ;;35
 ;;21,"305.7 ")
 ;;36
 ;;21,"305.70 ")
 ;;37
 ;;21,"305.71 ")
 ;;38
 ;;21,"305.72 ")
 ;;39
 ;;21,"305.73 ")
 ;;40
 ;;9002226,994,.01)
 ;;BGPMU IV DRUG ABUSE DX
 ;;9002226,994,.02)
 ;;IV Drug Abuse Diagnosis codes
 ;;9002226,994,.04)
 ;;@
 ;;9002226,994,.06)
 ;;@
 ;;9002226,994,.08)
 ;;@
 ;;9002226,994,.09)
 ;;@
 ;;9002226,994,.11)
 ;;@
 ;;9002226,994,.12)
 ;;@
 ;;9002226,994,.13)
 ;;@
 ;;9002226,994,.14)
 ;;@
 ;;9002226,994,.15)
 ;;80
 ;;9002226,994,.16)
 ;;@
 ;;9002226,994,.17)
 ;;@
 ;;9002226,994,3101)
 ;;@
 ;;9002226.02101,"994,304.0 ",.01)
 ;;304.0
 ;;9002226.02101,"994,304.0 ",.02)
 ;;304.0
 ;;9002226.02101,"994,304.00 ",.01)
 ;;304.00
 ;;9002226.02101,"994,304.00 ",.02)
 ;;304.00
 ;;9002226.02101,"994,304.01 ",.01)
 ;;304.01
 ;;9002226.02101,"994,304.01 ",.02)
 ;;304.01
 ;;9002226.02101,"994,304.02 ",.01)
 ;;304.02
 ;;9002226.02101,"994,304.02 ",.02)
 ;;304.02
 ;;9002226.02101,"994,304.03 ",.01)
 ;;304.03
 ;;9002226.02101,"994,304.03 ",.02)
 ;;304.03
 ;;9002226.02101,"994,304.1 ",.01)
 ;;304.1
 ;;9002226.02101,"994,304.1 ",.02)
 ;;304.1
 ;;9002226.02101,"994,304.10 ",.01)
 ;;304.10
 ;;9002226.02101,"994,304.10 ",.02)
 ;;304.10
 ;;9002226.02101,"994,304.11 ",.01)
 ;;304.11
 ;;9002226.02101,"994,304.11 ",.02)
 ;;304.11
 ;;9002226.02101,"994,304.12 ",.01)
 ;;304.12
 ;;9002226.02101,"994,304.12 ",.02)
 ;;304.12
 ;;9002226.02101,"994,304.13 ",.01)
 ;;304.13
 ;;9002226.02101,"994,304.13 ",.02)
 ;;304.13
 ;;9002226.02101,"994,304.2 ",.01)
 ;;304.2
 ;;9002226.02101,"994,304.2 ",.02)
 ;;304.2
 ;;9002226.02101,"994,304.20 ",.01)
 ;;304.20
 ;;9002226.02101,"994,304.20 ",.02)
 ;;304.20
 ;;9002226.02101,"994,304.21 ",.01)
 ;;304.21
 ;;9002226.02101,"994,304.21 ",.02)
 ;;304.21
 ;;9002226.02101,"994,304.22 ",.01)
 ;;304.22
 ;;9002226.02101,"994,304.22 ",.02)
 ;;304.22
 ;;9002226.02101,"994,304.23 ",.01)
 ;;304.23
 ;;9002226.02101,"994,304.23 ",.02)
 ;;304.23
 ;;9002226.02101,"994,304.4 ",.01)
 ;;304.4
 ;;9002226.02101,"994,304.4 ",.02)
 ;;304.4
 ;;9002226.02101,"994,304.40 ",.01)
 ;;304.40
 ;;9002226.02101,"994,304.40 ",.02)
 ;;304.40
 ;;9002226.02101,"994,304.41 ",.01)
 ;;304.41
 ;;9002226.02101,"994,304.41 ",.02)
 ;;304.41
 ;;9002226.02101,"994,304.42 ",.01)
 ;;304.42
 ;;9002226.02101,"994,304.42 ",.02)
 ;;304.42
 ;;9002226.02101,"994,304.43 ",.01)
 ;;304.43
 ;;9002226.02101,"994,304.43 ",.02)
 ;;304.43
 ;;9002226.02101,"994,305.4 ",.01)
 ;;305.4
 ;;9002226.02101,"994,305.4 ",.02)
 ;;305.4
 ;;9002226.02101,"994,305.40 ",.01)
 ;;305.40
 ;;9002226.02101,"994,305.40 ",.02)
 ;;305.40
 ;;9002226.02101,"994,305.41 ",.01)
 ;;305.41
 ;;9002226.02101,"994,305.41 ",.02)
 ;;305.41
 ;;9002226.02101,"994,305.42 ",.01)
 ;;305.42
 ;;9002226.02101,"994,305.42 ",.02)
 ;;305.42
 ;;9002226.02101,"994,305.43 ",.01)
 ;;305.43
 ;;9002226.02101,"994,305.43 ",.02)
 ;;305.43
 ;;9002226.02101,"994,305.5 ",.01)
 ;;305.5
 ;;9002226.02101,"994,305.5 ",.02)
 ;;305.5
 ;;9002226.02101,"994,305.50 ",.01)
 ;;305.50
 ;;9002226.02101,"994,305.50 ",.02)
 ;;305.50
 ;;9002226.02101,"994,305.51 ",.01)
 ;;305.51
 ;;9002226.02101,"994,305.51 ",.02)
 ;;305.51
 ;;9002226.02101,"994,305.52 ",.01)
 ;;305.52
 ;;9002226.02101,"994,305.52 ",.02)
 ;;305.52
 ;;9002226.02101,"994,305.53 ",.01)
 ;;305.53
 ;;9002226.02101,"994,305.53 ",.02)
 ;;305.53
 ;;9002226.02101,"994,305.6 ",.01)
 ;;305.6
 ;;9002226.02101,"994,305.6 ",.02)
 ;;305.6
 ;;9002226.02101,"994,305.60 ",.01)
 ;;305.60
 ;;9002226.02101,"994,305.60 ",.02)
 ;;305.60
 ;;9002226.02101,"994,305.61 ",.01)
 ;;305.61
 ;;9002226.02101,"994,305.61 ",.02)
 ;;305.61
 ;;9002226.02101,"994,305.62 ",.01)
 ;;305.62
 ;;9002226.02101,"994,305.62 ",.02)
 ;;305.62
 ;;9002226.02101,"994,305.63 ",.01)
 ;;305.63
 ;;9002226.02101,"994,305.63 ",.02)
 ;;305.63
 ;;9002226.02101,"994,305.7 ",.01)
 ;;305.7
 ;;9002226.02101,"994,305.7 ",.02)
 ;;305.7
 ;;9002226.02101,"994,305.70 ",.01)
 ;;305.70
 ;;9002226.02101,"994,305.70 ",.02)
 ;;305.70
 ;;9002226.02101,"994,305.71 ",.01)
 ;;305.71
 ;;9002226.02101,"994,305.71 ",.02)
 ;;305.71
 ;;9002226.02101,"994,305.72 ",.01)
 ;;305.72
 ;;9002226.02101,"994,305.72 ",.02)
 ;;305.72
 ;;9002226.02101,"994,305.73 ",.01)
 ;;305.73
 ;;9002226.02101,"994,305.73 ",.02)
 ;;305.73
 ;
OTHER ; OTHER ROUTINES
 Q
