BGPM5AOO ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON AUG 09, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"993,812.03 ",.01)
 ;;812.03
 ;;9002226.02101,"993,812.03 ",.02)
 ;;812.03
 ;;9002226.02101,"993,812.09 ",.01)
 ;;812.09
 ;;9002226.02101,"993,812.09 ",.02)
 ;;812.09
 ;;9002226.02101,"993,812.1 ",.01)
 ;;812.1
 ;;9002226.02101,"993,812.1 ",.02)
 ;;812.1
 ;;9002226.02101,"993,812.10 ",.01)
 ;;812.10
 ;;9002226.02101,"993,812.10 ",.02)
 ;;812.10
 ;;9002226.02101,"993,812.11 ",.01)
 ;;812.11
 ;;9002226.02101,"993,812.11 ",.02)
 ;;812.11
 ;;9002226.02101,"993,812.12 ",.01)
 ;;812.12
 ;;9002226.02101,"993,812.12 ",.02)
 ;;812.12
 ;;9002226.02101,"993,812.13 ",.01)
 ;;812.13
 ;;9002226.02101,"993,812.13 ",.02)
 ;;812.13
 ;;9002226.02101,"993,812.19 ",.01)
 ;;812.19
 ;;9002226.02101,"993,812.19 ",.02)
 ;;812.19
 ;;9002226.02101,"993,812.2 ",.01)
 ;;812.2
 ;;9002226.02101,"993,812.2 ",.02)
 ;;812.2
 ;;9002226.02101,"993,812.20 ",.01)
 ;;812.20
 ;;9002226.02101,"993,812.20 ",.02)
 ;;812.20
 ;;9002226.02101,"993,812.21 ",.01)
 ;;812.21
 ;;9002226.02101,"993,812.21 ",.02)
 ;;812.21
 ;;9002226.02101,"993,812.3 ",.01)
 ;;812.3
 ;;9002226.02101,"993,812.3 ",.02)
 ;;812.3
 ;;9002226.02101,"993,812.30 ",.01)
 ;;812.30
 ;;9002226.02101,"993,812.30 ",.02)
 ;;812.30
 ;;9002226.02101,"993,812.31 ",.01)
 ;;812.31
 ;;9002226.02101,"993,812.31 ",.02)
 ;;812.31
 ;;9002226.02101,"993,812.4 ",.01)
 ;;812.4
 ;;9002226.02101,"993,812.4 ",.02)
 ;;812.4
 ;;9002226.02101,"993,812.40 ",.01)
 ;;812.40
 ;;9002226.02101,"993,812.40 ",.02)
 ;;812.40
 ;;9002226.02101,"993,812.41 ",.01)
 ;;812.41
 ;;9002226.02101,"993,812.41 ",.02)
 ;;812.41
 ;;9002226.02101,"993,812.42 ",.01)
 ;;812.42
 ;;9002226.02101,"993,812.42 ",.02)
 ;;812.42
 ;;9002226.02101,"993,812.43 ",.01)
 ;;812.43
 ;;9002226.02101,"993,812.43 ",.02)
 ;;812.43
 ;;9002226.02101,"993,812.44 ",.01)
 ;;812.44
 ;;9002226.02101,"993,812.44 ",.02)
 ;;812.44
 ;;9002226.02101,"993,812.49 ",.01)
 ;;812.49
 ;;9002226.02101,"993,812.49 ",.02)
 ;;812.49
 ;;9002226.02101,"993,812.5 ",.01)
 ;;812.5
 ;;9002226.02101,"993,812.5 ",.02)
 ;;812.5
 ;;9002226.02101,"993,812.50 ",.01)
 ;;812.50
 ;;9002226.02101,"993,812.50 ",.02)
 ;;812.50
 ;;9002226.02101,"993,812.51 ",.01)
 ;;812.51
 ;;9002226.02101,"993,812.51 ",.02)
 ;;812.51
 ;;9002226.02101,"993,812.52 ",.01)
 ;;812.52
 ;;9002226.02101,"993,812.52 ",.02)
 ;;812.52
 ;;9002226.02101,"993,812.53 ",.01)
 ;;812.53
 ;;9002226.02101,"993,812.53 ",.02)
 ;;812.53
 ;;9002226.02101,"993,812.54 ",.01)
 ;;812.54
 ;;9002226.02101,"993,812.54 ",.02)
 ;;812.54
 ;;9002226.02101,"993,812.59 ",.01)
 ;;812.59
 ;;9002226.02101,"993,812.59 ",.02)
 ;;812.59
 ;;9002226.02101,"993,813 ",.01)
 ;;813
 ;;9002226.02101,"993,813 ",.02)
 ;;813
 ;;9002226.02101,"993,813.0 ",.01)
 ;;813.0
 ;;9002226.02101,"993,813.0 ",.02)
 ;;813.0
 ;;9002226.02101,"993,813.00 ",.01)
 ;;813.00
 ;;9002226.02101,"993,813.00 ",.02)
 ;;813.00
 ;;9002226.02101,"993,813.01 ",.01)
 ;;813.01
 ;;9002226.02101,"993,813.01 ",.02)
 ;;813.01
 ;;9002226.02101,"993,813.02 ",.01)
 ;;813.02
 ;;9002226.02101,"993,813.02 ",.02)
 ;;813.02
 ;;9002226.02101,"993,813.03 ",.01)
 ;;813.03
 ;;9002226.02101,"993,813.03 ",.02)
 ;;813.03
 ;;9002226.02101,"993,813.04 ",.01)
 ;;813.04
 ;;9002226.02101,"993,813.04 ",.02)
 ;;813.04
 ;;9002226.02101,"993,813.05 ",.01)
 ;;813.05
 ;;9002226.02101,"993,813.05 ",.02)
 ;;813.05
 ;;9002226.02101,"993,813.06 ",.01)
 ;;813.06
 ;;9002226.02101,"993,813.06 ",.02)
 ;;813.06
 ;;9002226.02101,"993,813.07 ",.01)
 ;;813.07
 ;;9002226.02101,"993,813.07 ",.02)
 ;;813.07
 ;;9002226.02101,"993,813.08 ",.01)
 ;;813.08
 ;;9002226.02101,"993,813.08 ",.02)
 ;;813.08
 ;;9002226.02101,"993,813.1 ",.01)
 ;;813.1
 ;;9002226.02101,"993,813.1 ",.02)
 ;;813.1
 ;;9002226.02101,"993,813.10 ",.01)
 ;;813.10
 ;;9002226.02101,"993,813.10 ",.02)
 ;;813.10
 ;;9002226.02101,"993,813.11 ",.01)
 ;;813.11
 ;;9002226.02101,"993,813.11 ",.02)
 ;;813.11
 ;;9002226.02101,"993,813.12 ",.01)
 ;;813.12
 ;;9002226.02101,"993,813.12 ",.02)
 ;;813.12
 ;;9002226.02101,"993,813.13 ",.01)
 ;;813.13
 ;;9002226.02101,"993,813.13 ",.02)
 ;;813.13
 ;;9002226.02101,"993,813.14 ",.01)
 ;;813.14
 ;;9002226.02101,"993,813.14 ",.02)
 ;;813.14
 ;;9002226.02101,"993,813.15 ",.01)
 ;;813.15
 ;;9002226.02101,"993,813.15 ",.02)
 ;;813.15
 ;;9002226.02101,"993,813.16 ",.01)
 ;;813.16
 ;;9002226.02101,"993,813.16 ",.02)
 ;;813.16
 ;;9002226.02101,"993,813.17 ",.01)
 ;;813.17
 ;;9002226.02101,"993,813.17 ",.02)
 ;;813.17
 ;;9002226.02101,"993,813.18 ",.01)
 ;;813.18
 ;;9002226.02101,"993,813.18 ",.02)
 ;;813.18
 ;;9002226.02101,"993,813.2 ",.01)
 ;;813.2
 ;;9002226.02101,"993,813.2 ",.02)
 ;;813.2
 ;;9002226.02101,"993,813.20 ",.01)
 ;;813.20
 ;;9002226.02101,"993,813.20 ",.02)
 ;;813.20
 ;;9002226.02101,"993,813.21 ",.01)
 ;;813.21
 ;;9002226.02101,"993,813.21 ",.02)
 ;;813.21
 ;;9002226.02101,"993,813.22 ",.01)
 ;;813.22
 ;;9002226.02101,"993,813.22 ",.02)
 ;;813.22
 ;;9002226.02101,"993,813.23 ",.01)
 ;;813.23
 ;;9002226.02101,"993,813.23 ",.02)
 ;;813.23
 ;;9002226.02101,"993,813.3 ",.01)
 ;;813.3
 ;;9002226.02101,"993,813.3 ",.02)
 ;;813.3
 ;;9002226.02101,"993,813.30 ",.01)
 ;;813.30
 ;;9002226.02101,"993,813.30 ",.02)
 ;;813.30
 ;;9002226.02101,"993,813.31 ",.01)
 ;;813.31
 ;;9002226.02101,"993,813.31 ",.02)
 ;;813.31
 ;;9002226.02101,"993,813.32 ",.01)
 ;;813.32
 ;;9002226.02101,"993,813.32 ",.02)
 ;;813.32
 ;;9002226.02101,"993,813.33 ",.01)
 ;;813.33
 ;;9002226.02101,"993,813.33 ",.02)
 ;;813.33
 ;;9002226.02101,"993,813.4 ",.01)
 ;;813.4
 ;;9002226.02101,"993,813.4 ",.02)
 ;;813.4
 ;;9002226.02101,"993,813.40 ",.01)
 ;;813.40
 ;;9002226.02101,"993,813.40 ",.02)
 ;;813.40
 ;;9002226.02101,"993,813.41 ",.01)
 ;;813.41
 ;;9002226.02101,"993,813.41 ",.02)
 ;;813.41
 ;;9002226.02101,"993,813.42 ",.01)
 ;;813.42
 ;;9002226.02101,"993,813.42 ",.02)
 ;;813.42
 ;;9002226.02101,"993,813.43 ",.01)
 ;;813.43
 ;;9002226.02101,"993,813.43 ",.02)
 ;;813.43
 ;;9002226.02101,"993,813.44 ",.01)
 ;;813.44
 ;;9002226.02101,"993,813.44 ",.02)
 ;;813.44
 ;;9002226.02101,"993,813.45 ",.01)
 ;;813.45
 ;;9002226.02101,"993,813.45 ",.02)
 ;;813.45
 ;;9002226.02101,"993,813.5 ",.01)
 ;;813.5
 ;;9002226.02101,"993,813.5 ",.02)
 ;;813.5
 ;;9002226.02101,"993,813.50 ",.01)
 ;;813.50
 ;;9002226.02101,"993,813.50 ",.02)
 ;;813.50
 ;;9002226.02101,"993,813.51 ",.01)
 ;;813.51
 ;;9002226.02101,"993,813.51 ",.02)
 ;;813.51
 ;;9002226.02101,"993,813.52 ",.01)
 ;;813.52
 ;;9002226.02101,"993,813.52 ",.02)
 ;;813.52
 ;;9002226.02101,"993,813.53 ",.01)
 ;;813.53
 ;;9002226.02101,"993,813.53 ",.02)
 ;;813.53
 ;;9002226.02101,"993,813.54 ",.01)
 ;;813.54
 ;;9002226.02101,"993,813.54 ",.02)
 ;;813.54
 ;;9002226.02101,"993,813.8 ",.01)
 ;;813.8
 ;;9002226.02101,"993,813.8 ",.02)
 ;;813.8
 ;;9002226.02101,"993,813.80 ",.01)
 ;;813.80
 ;;9002226.02101,"993,813.80 ",.02)
 ;;813.80
 ;;9002226.02101,"993,813.81 ",.01)
 ;;813.81
 ;;9002226.02101,"993,813.81 ",.02)
 ;;813.81
 ;;9002226.02101,"993,813.82 ",.01)
 ;;813.82
 ;;9002226.02101,"993,813.82 ",.02)
 ;;813.82
 ;;9002226.02101,"993,813.83 ",.01)
 ;;813.83
 ;;9002226.02101,"993,813.83 ",.02)
 ;;813.83
 ;;9002226.02101,"993,813.9 ",.01)
 ;;813.9
 ;;9002226.02101,"993,813.9 ",.02)
 ;;813.9
 ;;9002226.02101,"993,813.90 ",.01)
 ;;813.90
 ;;9002226.02101,"993,813.90 ",.02)
 ;;813.90
 ;;9002226.02101,"993,813.91 ",.01)
 ;;813.91
 ;;9002226.02101,"993,813.91 ",.02)
 ;;813.91
 ;;9002226.02101,"993,813.92 ",.01)
 ;;813.92
 ;;9002226.02101,"993,813.92 ",.02)
 ;;813.92
 ;;9002226.02101,"993,813.93 ",.01)
 ;;813.93
 ;;9002226.02101,"993,813.93 ",.02)
 ;;813.93
 ;;9002226.02101,"993,814 ",.01)
 ;;814
 ;;9002226.02101,"993,814 ",.02)
 ;;814
 ;;9002226.02101,"993,814.0 ",.01)
 ;;814.0
 ;;9002226.02101,"993,814.0 ",.02)
 ;;814.0
 ;;9002226.02101,"993,814.00 ",.01)
 ;;814.00
 ;;9002226.02101,"993,814.00 ",.02)
 ;;814.00
 ;;9002226.02101,"993,814.01 ",.01)
 ;;814.01
 ;;9002226.02101,"993,814.01 ",.02)
 ;;814.01
 ;;9002226.02101,"993,814.02 ",.01)
 ;;814.02
 ;;9002226.02101,"993,814.02 ",.02)
 ;;814.02
 ;;9002226.02101,"993,814.03 ",.01)
 ;;814.03
 ;;9002226.02101,"993,814.03 ",.02)
 ;;814.03
 ;;9002226.02101,"993,814.04 ",.01)
 ;;814.04
 ;;9002226.02101,"993,814.04 ",.02)
 ;;814.04
 ;;9002226.02101,"993,814.05 ",.01)
 ;;814.05
 ;;9002226.02101,"993,814.05 ",.02)
 ;;814.05
 ;;9002226.02101,"993,814.06 ",.01)
 ;;814.06
 ;;9002226.02101,"993,814.06 ",.02)
 ;;814.06
 ;;9002226.02101,"993,814.07 ",.01)
 ;;814.07
 ;;9002226.02101,"993,814.07 ",.02)
 ;;814.07
 ;;9002226.02101,"993,814.08 ",.01)
 ;;814.08
 ;;9002226.02101,"993,814.08 ",.02)
 ;;814.08
 ;;9002226.02101,"993,814.09 ",.01)
 ;;814.09
 ;;9002226.02101,"993,814.09 ",.02)
 ;;814.09
 ;;9002226.02101,"993,814.1 ",.01)
 ;;814.1
 ;;9002226.02101,"993,814.1 ",.02)
 ;;814.1
 ;;9002226.02101,"993,814.10 ",.01)
 ;;814.10
 ;;9002226.02101,"993,814.10 ",.02)
 ;;814.10
 ;;9002226.02101,"993,814.11 ",.01)
 ;;814.11
 ;;9002226.02101,"993,814.11 ",.02)
 ;;814.11
 ;;9002226.02101,"993,814.12 ",.01)
 ;;814.12
 ;;9002226.02101,"993,814.12 ",.02)
 ;;814.12
 ;;9002226.02101,"993,814.13 ",.01)
 ;;814.13
 ;;9002226.02101,"993,814.13 ",.02)
 ;;814.13
 ;;9002226.02101,"993,814.14 ",.01)
 ;;814.14
 ;;9002226.02101,"993,814.14 ",.02)
 ;;814.14
 ;;9002226.02101,"993,814.15 ",.01)
 ;;814.15
 ;;9002226.02101,"993,814.15 ",.02)
 ;;814.15
 ;;9002226.02101,"993,814.16 ",.01)
 ;;814.16
 ;;9002226.02101,"993,814.16 ",.02)
 ;;814.16
 ;;9002226.02101,"993,814.17 ",.01)
 ;;814.17
 ;;9002226.02101,"993,814.17 ",.02)
 ;;814.17
 ;;9002226.02101,"993,814.18 ",.01)
 ;;814.18
 ;;9002226.02101,"993,814.18 ",.02)
 ;;814.18
 ;;9002226.02101,"993,814.19 ",.01)
 ;;814.19
 ;;9002226.02101,"993,814.19 ",.02)
 ;;814.19
 ;;9002226.02101,"993,815 ",.01)
 ;;815
 ;;9002226.02101,"993,815 ",.02)
 ;;815
 ;;9002226.02101,"993,815.0 ",.01)
 ;;815.0
 ;;9002226.02101,"993,815.0 ",.02)
 ;;815.0
 ;;9002226.02101,"993,815.00 ",.01)
 ;;815.00
 ;;9002226.02101,"993,815.00 ",.02)
 ;;815.00
 ;;9002226.02101,"993,815.01 ",.01)
 ;;815.01
 ;;9002226.02101,"993,815.01 ",.02)
 ;;815.01
 ;;9002226.02101,"993,815.02 ",.01)
 ;;815.02
 ;;9002226.02101,"993,815.02 ",.02)
 ;;815.02
 ;;9002226.02101,"993,815.03 ",.01)
 ;;815.03
 ;;9002226.02101,"993,815.03 ",.02)
 ;;815.03
 ;;9002226.02101,"993,815.04 ",.01)
 ;;815.04
 ;;9002226.02101,"993,815.04 ",.02)
 ;;815.04
 ;;9002226.02101,"993,815.09 ",.01)
 ;;815.09
 ;;9002226.02101,"993,815.09 ",.02)
 ;;815.09
 ;;9002226.02101,"993,815.1 ",.01)
 ;;815.1
 ;;9002226.02101,"993,815.1 ",.02)
 ;;815.1
 ;;9002226.02101,"993,815.10 ",.01)
 ;;815.10
 ;;9002226.02101,"993,815.10 ",.02)
 ;;815.10
 ;;9002226.02101,"993,815.11 ",.01)
 ;;815.11
 ;;9002226.02101,"993,815.11 ",.02)
 ;;815.11
 ;;9002226.02101,"993,815.12 ",.01)
 ;;815.12
 ;;9002226.02101,"993,815.12 ",.02)
 ;;815.12
 ;;9002226.02101,"993,815.13 ",.01)
 ;;815.13
 ;;9002226.02101,"993,815.13 ",.02)
 ;;815.13
 ;;9002226.02101,"993,815.14 ",.01)
 ;;815.14
 ;;9002226.02101,"993,815.14 ",.02)
 ;;815.14
 ;;9002226.02101,"993,815.19 ",.01)
 ;;815.19
 ;;9002226.02101,"993,815.19 ",.02)
 ;;815.19
 ;;9002226.02101,"993,816 ",.01)
 ;;816
 ;;9002226.02101,"993,816 ",.02)
 ;;816
 ;;9002226.02101,"993,816.0 ",.01)
 ;;816.0
 ;;9002226.02101,"993,816.0 ",.02)
 ;;816.0
 ;;9002226.02101,"993,816.00 ",.01)
 ;;816.00
 ;;9002226.02101,"993,816.00 ",.02)
 ;;816.00
