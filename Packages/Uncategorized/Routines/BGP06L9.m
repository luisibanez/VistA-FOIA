BGP06L9 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"692,55887-0638-30 ",.01)
 ;;55887-0638-30
 ;;9002226.02101,"692,55887-0638-30 ",.02)
 ;;55887-0638-30
 ;;9002226.02101,"692,55887-0684-01 ",.01)
 ;;55887-0684-01
 ;;9002226.02101,"692,55887-0684-01 ",.02)
 ;;55887-0684-01
 ;;9002226.02101,"692,55887-0684-30 ",.01)
 ;;55887-0684-30
 ;;9002226.02101,"692,55887-0684-30 ",.02)
 ;;55887-0684-30
 ;;9002226.02101,"692,55887-0684-60 ",.01)
 ;;55887-0684-60
 ;;9002226.02101,"692,55887-0684-60 ",.02)
 ;;55887-0684-60
 ;;9002226.02101,"692,55887-0686-01 ",.01)
 ;;55887-0686-01
 ;;9002226.02101,"692,55887-0686-01 ",.02)
 ;;55887-0686-01
 ;;9002226.02101,"692,55887-0686-02 ",.01)
 ;;55887-0686-02
 ;;9002226.02101,"692,55887-0686-02 ",.02)
 ;;55887-0686-02
 ;;9002226.02101,"692,55887-0686-04 ",.01)
 ;;55887-0686-04
 ;;9002226.02101,"692,55887-0686-04 ",.02)
 ;;55887-0686-04
 ;;9002226.02101,"692,55887-0686-10 ",.01)
 ;;55887-0686-10
 ;;9002226.02101,"692,55887-0686-10 ",.02)
 ;;55887-0686-10
 ;;9002226.02101,"692,55887-0686-12 ",.01)
 ;;55887-0686-12
 ;;9002226.02101,"692,55887-0686-12 ",.02)
 ;;55887-0686-12
 ;;9002226.02101,"692,55887-0686-14 ",.01)
 ;;55887-0686-14
 ;;9002226.02101,"692,55887-0686-14 ",.02)
 ;;55887-0686-14
 ;;9002226.02101,"692,55887-0686-15 ",.01)
 ;;55887-0686-15
 ;;9002226.02101,"692,55887-0686-15 ",.02)
 ;;55887-0686-15
 ;;9002226.02101,"692,55887-0686-20 ",.01)
 ;;55887-0686-20
 ;;9002226.02101,"692,55887-0686-20 ",.02)
 ;;55887-0686-20
 ;;9002226.02101,"692,55887-0686-30 ",.01)
 ;;55887-0686-30
 ;;9002226.02101,"692,55887-0686-30 ",.02)
 ;;55887-0686-30
 ;;9002226.02101,"692,55887-0686-40 ",.01)
 ;;55887-0686-40
 ;;9002226.02101,"692,55887-0686-40 ",.02)
 ;;55887-0686-40
 ;;9002226.02101,"692,55887-0686-60 ",.01)
 ;;55887-0686-60
 ;;9002226.02101,"692,55887-0686-60 ",.02)
 ;;55887-0686-60
 ;;9002226.02101,"692,55887-0686-90 ",.01)
 ;;55887-0686-90
 ;;9002226.02101,"692,55887-0686-90 ",.02)
 ;;55887-0686-90
 ;;9002226.02101,"692,55887-0848-30 ",.01)
 ;;55887-0848-30
 ;;9002226.02101,"692,55887-0848-30 ",.02)
 ;;55887-0848-30
 ;;9002226.02101,"692,55887-0856-30 ",.01)
 ;;55887-0856-30
 ;;9002226.02101,"692,55887-0856-30 ",.02)
 ;;55887-0856-30
 ;;9002226.02101,"692,57866-3591-01 ",.01)
 ;;57866-3591-01
 ;;9002226.02101,"692,57866-3591-01 ",.02)
 ;;57866-3591-01
 ;;9002226.02101,"692,57866-3592-01 ",.01)
 ;;57866-3592-01
 ;;9002226.02101,"692,57866-3592-01 ",.02)
 ;;57866-3592-01
 ;;9002226.02101,"692,57866-3592-02 ",.01)
 ;;57866-3592-02
 ;;9002226.02101,"692,57866-3592-02 ",.02)
 ;;57866-3592-02
 ;;9002226.02101,"692,57866-3592-03 ",.01)
 ;;57866-3592-03
 ;;9002226.02101,"692,57866-3592-03 ",.02)
 ;;57866-3592-03
 ;;9002226.02101,"692,57866-3592-04 ",.01)
 ;;57866-3592-04
 ;;9002226.02101,"692,57866-3592-04 ",.02)
 ;;57866-3592-04
 ;;9002226.02101,"692,57866-3592-05 ",.01)
 ;;57866-3592-05
 ;;9002226.02101,"692,57866-3592-05 ",.02)
 ;;57866-3592-05
 ;;9002226.02101,"692,57866-3592-08 ",.01)
 ;;57866-3592-08
 ;;9002226.02101,"692,57866-3592-08 ",.02)
 ;;57866-3592-08
 ;;9002226.02101,"692,57866-3593-01 ",.01)
 ;;57866-3593-01
 ;;9002226.02101,"692,57866-3593-01 ",.02)
 ;;57866-3593-01
 ;;9002226.02101,"692,57866-3593-02 ",.01)
 ;;57866-3593-02
 ;;9002226.02101,"692,57866-3593-02 ",.02)
 ;;57866-3593-02
 ;;9002226.02101,"692,57866-3593-03 ",.01)
 ;;57866-3593-03
 ;;9002226.02101,"692,57866-3593-03 ",.02)
 ;;57866-3593-03
 ;;9002226.02101,"692,57866-3593-04 ",.01)
 ;;57866-3593-04
 ;;9002226.02101,"692,57866-3593-04 ",.02)
 ;;57866-3593-04
 ;;9002226.02101,"692,57866-3593-05 ",.01)
 ;;57866-3593-05
 ;;9002226.02101,"692,57866-3593-05 ",.02)
 ;;57866-3593-05
 ;;9002226.02101,"692,57866-3593-07 ",.01)
 ;;57866-3593-07
 ;;9002226.02101,"692,57866-3593-07 ",.02)
 ;;57866-3593-07
 ;;9002226.02101,"692,57866-3795-01 ",.01)
 ;;57866-3795-01
 ;;9002226.02101,"692,57866-3795-01 ",.02)
 ;;57866-3795-01
 ;;9002226.02101,"692,57866-3795-02 ",.01)
 ;;57866-3795-02
 ;;9002226.02101,"692,57866-3795-02 ",.02)
 ;;57866-3795-02
 ;;9002226.02101,"692,57866-3796-01 ",.01)
 ;;57866-3796-01
 ;;9002226.02101,"692,57866-3796-01 ",.02)
 ;;57866-3796-01
 ;;9002226.02101,"692,57866-3796-02 ",.01)
 ;;57866-3796-02
 ;;9002226.02101,"692,57866-3796-02 ",.02)
 ;;57866-3796-02
 ;;9002226.02101,"692,58016-0064-00 ",.01)
 ;;58016-0064-00
 ;;9002226.02101,"692,58016-0064-00 ",.02)
 ;;58016-0064-00
 ;;9002226.02101,"692,58016-0064-30 ",.01)
 ;;58016-0064-30
 ;;9002226.02101,"692,58016-0064-30 ",.02)
 ;;58016-0064-30
 ;;9002226.02101,"692,58016-0064-60 ",.01)
 ;;58016-0064-60
 ;;9002226.02101,"692,58016-0064-60 ",.02)
 ;;58016-0064-60
 ;;9002226.02101,"692,58016-0064-90 ",.01)
 ;;58016-0064-90
 ;;9002226.02101,"692,58016-0064-90 ",.02)
 ;;58016-0064-90
 ;;9002226.02101,"692,58016-0273-00 ",.01)
 ;;58016-0273-00
 ;;9002226.02101,"692,58016-0273-00 ",.02)
 ;;58016-0273-00
 ;;9002226.02101,"692,58016-0273-02 ",.01)
 ;;58016-0273-02
 ;;9002226.02101,"692,58016-0273-02 ",.02)
 ;;58016-0273-02
 ;;9002226.02101,"692,58016-0273-03 ",.01)
 ;;58016-0273-03
 ;;9002226.02101,"692,58016-0273-03 ",.02)
 ;;58016-0273-03
 ;;9002226.02101,"692,58016-0273-04 ",.01)
 ;;58016-0273-04
 ;;9002226.02101,"692,58016-0273-04 ",.02)
 ;;58016-0273-04
 ;;9002226.02101,"692,58016-0273-06 ",.01)
 ;;58016-0273-06
 ;;9002226.02101,"692,58016-0273-06 ",.02)
 ;;58016-0273-06
 ;;9002226.02101,"692,58016-0273-09 ",.01)
 ;;58016-0273-09
 ;;9002226.02101,"692,58016-0273-09 ",.02)
 ;;58016-0273-09
 ;;9002226.02101,"692,58016-0273-10 ",.01)
 ;;58016-0273-10
 ;;9002226.02101,"692,58016-0273-10 ",.02)
 ;;58016-0273-10
 ;;9002226.02101,"692,58016-0273-12 ",.01)
 ;;58016-0273-12
 ;;9002226.02101,"692,58016-0273-12 ",.02)
 ;;58016-0273-12
 ;;9002226.02101,"692,58016-0273-15 ",.01)
 ;;58016-0273-15
 ;;9002226.02101,"692,58016-0273-15 ",.02)
 ;;58016-0273-15
 ;;9002226.02101,"692,58016-0273-20 ",.01)
 ;;58016-0273-20
 ;;9002226.02101,"692,58016-0273-20 ",.02)
 ;;58016-0273-20
 ;;9002226.02101,"692,58016-0273-30 ",.01)
 ;;58016-0273-30
 ;;9002226.02101,"692,58016-0273-30 ",.02)
 ;;58016-0273-30
 ;;9002226.02101,"692,58016-0273-40 ",.01)
 ;;58016-0273-40
 ;;9002226.02101,"692,58016-0273-40 ",.02)
 ;;58016-0273-40
 ;;9002226.02101,"692,58016-0273-60 ",.01)
 ;;58016-0273-60
 ;;9002226.02101,"692,58016-0273-60 ",.02)
 ;;58016-0273-60
 ;;9002226.02101,"692,58016-0273-73 ",.01)
 ;;58016-0273-73
 ;;9002226.02101,"692,58016-0273-73 ",.02)
 ;;58016-0273-73
 ;;9002226.02101,"692,58016-0273-89 ",.01)
 ;;58016-0273-89
 ;;9002226.02101,"692,58016-0273-89 ",.02)
 ;;58016-0273-89
 ;;9002226.02101,"692,58016-0273-90 ",.01)
 ;;58016-0273-90
 ;;9002226.02101,"692,58016-0273-90 ",.02)
 ;;58016-0273-90
 ;;9002226.02101,"692,58016-0274-12 ",.01)
 ;;58016-0274-12
 ;;9002226.02101,"692,58016-0274-12 ",.02)
 ;;58016-0274-12
 ;;9002226.02101,"692,58016-0274-20 ",.01)
 ;;58016-0274-20
 ;;9002226.02101,"692,58016-0274-20 ",.02)
 ;;58016-0274-20
 ;;9002226.02101,"692,58016-0274-30 ",.01)
 ;;58016-0274-30
 ;;9002226.02101,"692,58016-0274-30 ",.02)
 ;;58016-0274-30
 ;;9002226.02101,"692,58016-0275-00 ",.01)
 ;;58016-0275-00
 ;;9002226.02101,"692,58016-0275-00 ",.02)
 ;;58016-0275-00
 ;;9002226.02101,"692,58016-0275-02 ",.01)
 ;;58016-0275-02
 ;;9002226.02101,"692,58016-0275-02 ",.02)
 ;;58016-0275-02
 ;;9002226.02101,"692,58016-0275-03 ",.01)
 ;;58016-0275-03
 ;;9002226.02101,"692,58016-0275-03 ",.02)
 ;;58016-0275-03
 ;;9002226.02101,"692,58016-0275-04 ",.01)
 ;;58016-0275-04
 ;;9002226.02101,"692,58016-0275-04 ",.02)
 ;;58016-0275-04
 ;;9002226.02101,"692,58016-0275-06 ",.01)
 ;;58016-0275-06
 ;;9002226.02101,"692,58016-0275-06 ",.02)
 ;;58016-0275-06
 ;;9002226.02101,"692,58016-0275-08 ",.01)
 ;;58016-0275-08
 ;;9002226.02101,"692,58016-0275-08 ",.02)
 ;;58016-0275-08
 ;;9002226.02101,"692,58016-0275-10 ",.01)
 ;;58016-0275-10
 ;;9002226.02101,"692,58016-0275-10 ",.02)
 ;;58016-0275-10
 ;;9002226.02101,"692,58016-0275-14 ",.01)
 ;;58016-0275-14
 ;;9002226.02101,"692,58016-0275-14 ",.02)
 ;;58016-0275-14
 ;;9002226.02101,"692,58016-0275-15 ",.01)
 ;;58016-0275-15
 ;;9002226.02101,"692,58016-0275-15 ",.02)
 ;;58016-0275-15
 ;;9002226.02101,"692,58016-0275-16 ",.01)
 ;;58016-0275-16
 ;;9002226.02101,"692,58016-0275-16 ",.02)
 ;;58016-0275-16
 ;;9002226.02101,"692,58016-0275-18 ",.01)
 ;;58016-0275-18
 ;;9002226.02101,"692,58016-0275-18 ",.02)
 ;;58016-0275-18
 ;;9002226.02101,"692,58016-0275-20 ",.01)
 ;;58016-0275-20
 ;;9002226.02101,"692,58016-0275-20 ",.02)
 ;;58016-0275-20
 ;;9002226.02101,"692,58016-0275-21 ",.01)
 ;;58016-0275-21
 ;;9002226.02101,"692,58016-0275-21 ",.02)
 ;;58016-0275-21
 ;;9002226.02101,"692,58016-0275-24 ",.01)
 ;;58016-0275-24
 ;;9002226.02101,"692,58016-0275-24 ",.02)
 ;;58016-0275-24
 ;;9002226.02101,"692,58016-0275-28 ",.01)
 ;;58016-0275-28
 ;;9002226.02101,"692,58016-0275-28 ",.02)
 ;;58016-0275-28
 ;;9002226.02101,"692,58016-0275-30 ",.01)
 ;;58016-0275-30
 ;;9002226.02101,"692,58016-0275-30 ",.02)
 ;;58016-0275-30
 ;;9002226.02101,"692,58016-0275-36 ",.01)
 ;;58016-0275-36
 ;;9002226.02101,"692,58016-0275-36 ",.02)
 ;;58016-0275-36
 ;;9002226.02101,"692,58016-0275-40 ",.01)
 ;;58016-0275-40
 ;;9002226.02101,"692,58016-0275-40 ",.02)
 ;;58016-0275-40
 ;;9002226.02101,"692,58016-0275-50 ",.01)
 ;;58016-0275-50
 ;;9002226.02101,"692,58016-0275-50 ",.02)
 ;;58016-0275-50
 ;;9002226.02101,"692,58016-0275-60 ",.01)
 ;;58016-0275-60
 ;;9002226.02101,"692,58016-0275-60 ",.02)
 ;;58016-0275-60
 ;;9002226.02101,"692,58016-0275-73 ",.01)
 ;;58016-0275-73
 ;;9002226.02101,"692,58016-0275-73 ",.02)
 ;;58016-0275-73
 ;;9002226.02101,"692,58016-0275-89 ",.01)
 ;;58016-0275-89
 ;;9002226.02101,"692,58016-0275-89 ",.02)
 ;;58016-0275-89
 ;;9002226.02101,"692,58016-0275-90 ",.01)
 ;;58016-0275-90
 ;;9002226.02101,"692,58016-0275-90 ",.02)
 ;;58016-0275-90
 ;;9002226.02101,"692,58016-0712-20 ",.01)
 ;;58016-0712-20
 ;;9002226.02101,"692,58016-0712-20 ",.02)
 ;;58016-0712-20
 ;;9002226.02101,"692,58016-0712-30 ",.01)
 ;;58016-0712-30
 ;;9002226.02101,"692,58016-0712-30 ",.02)
 ;;58016-0712-30
 ;;9002226.02101,"692,58016-0811-05 ",.01)
 ;;58016-0811-05
 ;;9002226.02101,"692,58016-0811-05 ",.02)
 ;;58016-0811-05
 ;;9002226.02101,"692,58016-0811-14 ",.01)
 ;;58016-0811-14
 ;;9002226.02101,"692,58016-0811-14 ",.02)
 ;;58016-0811-14
 ;;9002226.02101,"692,58016-0811-15 ",.01)
 ;;58016-0811-15
 ;;9002226.02101,"692,58016-0811-15 ",.02)
 ;;58016-0811-15
 ;;9002226.02101,"692,58016-0811-30 ",.01)
 ;;58016-0811-30
 ;;9002226.02101,"692,58016-0811-30 ",.02)
 ;;58016-0811-30
 ;;9002226.02101,"692,58016-0811-40 ",.01)
 ;;58016-0811-40
 ;;9002226.02101,"692,58016-0811-40 ",.02)
 ;;58016-0811-40
 ;;9002226.02101,"692,58016-0811-60 ",.01)
 ;;58016-0811-60
 ;;9002226.02101,"692,58016-0811-60 ",.02)
 ;;58016-0811-60
 ;;9002226.02101,"692,58016-0812-00 ",.01)
 ;;58016-0812-00
 ;;9002226.02101,"692,58016-0812-00 ",.02)
 ;;58016-0812-00
 ;;9002226.02101,"692,58016-0812-02 ",.01)
 ;;58016-0812-02
 ;;9002226.02101,"692,58016-0812-02 ",.02)
 ;;58016-0812-02
 ;;9002226.02101,"692,58016-0812-03 ",.01)
 ;;58016-0812-03
 ;;9002226.02101,"692,58016-0812-03 ",.02)
 ;;58016-0812-03
 ;;9002226.02101,"692,58016-0812-06 ",.01)
 ;;58016-0812-06
 ;;9002226.02101,"692,58016-0812-06 ",.02)
 ;;58016-0812-06
 ;;9002226.02101,"692,58016-0812-09 ",.01)
 ;;58016-0812-09
 ;;9002226.02101,"692,58016-0812-09 ",.02)
 ;;58016-0812-09
 ;;9002226.02101,"692,58016-0812-10 ",.01)
 ;;58016-0812-10
 ;;9002226.02101,"692,58016-0812-10 ",.02)
 ;;58016-0812-10
 ;;9002226.02101,"692,58016-0812-12 ",.01)
 ;;58016-0812-12
 ;;9002226.02101,"692,58016-0812-12 ",.02)
 ;;58016-0812-12
 ;;9002226.02101,"692,58016-0812-14 ",.01)
 ;;58016-0812-14
 ;;9002226.02101,"692,58016-0812-14 ",.02)
 ;;58016-0812-14
 ;;9002226.02101,"692,58016-0812-15 ",.01)
 ;;58016-0812-15
 ;;9002226.02101,"692,58016-0812-15 ",.02)
 ;;58016-0812-15
 ;;9002226.02101,"692,58016-0812-20 ",.01)
 ;;58016-0812-20
 ;;9002226.02101,"692,58016-0812-20 ",.02)
 ;;58016-0812-20
 ;;9002226.02101,"692,58016-0812-21 ",.01)
 ;;58016-0812-21
 ;;9002226.02101,"692,58016-0812-21 ",.02)
 ;;58016-0812-21
 ;;9002226.02101,"692,58016-0812-24 ",.01)
 ;;58016-0812-24
 ;;9002226.02101,"692,58016-0812-24 ",.02)
 ;;58016-0812-24
 ;;9002226.02101,"692,58016-0812-30 ",.01)
 ;;58016-0812-30
 ;;9002226.02101,"692,58016-0812-30 ",.02)
 ;;58016-0812-30
 ;;9002226.02101,"692,58016-0812-60 ",.01)
 ;;58016-0812-60
 ;;9002226.02101,"692,58016-0812-60 ",.02)
 ;;58016-0812-60
 ;;9002226.02101,"692,58016-0812-73 ",.01)
 ;;58016-0812-73
 ;;9002226.02101,"692,58016-0812-73 ",.02)
 ;;58016-0812-73
 ;;9002226.02101,"692,58016-0812-89 ",.01)
 ;;58016-0812-89
 ;;9002226.02101,"692,58016-0812-89 ",.02)
 ;;58016-0812-89
 ;;9002226.02101,"692,58016-0821-00 ",.01)
 ;;58016-0821-00
 ;;9002226.02101,"692,58016-0821-00 ",.02)
 ;;58016-0821-00
 ;;9002226.02101,"692,58016-0821-08 ",.01)
 ;;58016-0821-08
 ;;9002226.02101,"692,58016-0821-08 ",.02)
 ;;58016-0821-08
 ;;9002226.02101,"692,58016-0821-10 ",.01)
 ;;58016-0821-10
 ;;9002226.02101,"692,58016-0821-10 ",.02)
 ;;58016-0821-10
 ;;9002226.02101,"692,58016-0821-12 ",.01)
 ;;58016-0821-12
 ;;9002226.02101,"692,58016-0821-12 ",.02)
 ;;58016-0821-12
 ;;9002226.02101,"692,58016-0821-14 ",.01)
 ;;58016-0821-14
 ;;9002226.02101,"692,58016-0821-14 ",.02)
 ;;58016-0821-14
 ;;9002226.02101,"692,58016-0821-15 ",.01)
 ;;58016-0821-15
 ;;9002226.02101,"692,58016-0821-15 ",.02)
 ;;58016-0821-15
