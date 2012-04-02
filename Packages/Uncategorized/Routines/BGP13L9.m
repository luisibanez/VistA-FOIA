BGP13L9 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"700,57866-4361-05 ",.01)
 ;;57866-4361-05
 ;;9002226.02101,"700,57866-4361-05 ",.02)
 ;;57866-4361-05
 ;;9002226.02101,"700,57866-4361-06 ",.01)
 ;;57866-4361-06
 ;;9002226.02101,"700,57866-4361-06 ",.02)
 ;;57866-4361-06
 ;;9002226.02101,"700,57866-4361-07 ",.01)
 ;;57866-4361-07
 ;;9002226.02101,"700,57866-4361-07 ",.02)
 ;;57866-4361-07
 ;;9002226.02101,"700,57866-4361-08 ",.01)
 ;;57866-4361-08
 ;;9002226.02101,"700,57866-4361-08 ",.02)
 ;;57866-4361-08
 ;;9002226.02101,"700,57866-4361-09 ",.01)
 ;;57866-4361-09
 ;;9002226.02101,"700,57866-4361-09 ",.02)
 ;;57866-4361-09
 ;;9002226.02101,"700,58016-0056-00 ",.01)
 ;;58016-0056-00
 ;;9002226.02101,"700,58016-0056-00 ",.02)
 ;;58016-0056-00
 ;;9002226.02101,"700,58016-0056-30 ",.01)
 ;;58016-0056-30
 ;;9002226.02101,"700,58016-0056-30 ",.02)
 ;;58016-0056-30
 ;;9002226.02101,"700,58016-0056-60 ",.01)
 ;;58016-0056-60
 ;;9002226.02101,"700,58016-0056-60 ",.02)
 ;;58016-0056-60
 ;;9002226.02101,"700,58016-0056-90 ",.01)
 ;;58016-0056-90
 ;;9002226.02101,"700,58016-0056-90 ",.02)
 ;;58016-0056-90
 ;;9002226.02101,"700,58016-0150-00 ",.01)
 ;;58016-0150-00
 ;;9002226.02101,"700,58016-0150-00 ",.02)
 ;;58016-0150-00
 ;;9002226.02101,"700,58016-0150-30 ",.01)
 ;;58016-0150-30
 ;;9002226.02101,"700,58016-0150-30 ",.02)
 ;;58016-0150-30
 ;;9002226.02101,"700,58016-0150-60 ",.01)
 ;;58016-0150-60
 ;;9002226.02101,"700,58016-0150-60 ",.02)
 ;;58016-0150-60
 ;;9002226.02101,"700,58016-0150-90 ",.01)
 ;;58016-0150-90
 ;;9002226.02101,"700,58016-0150-90 ",.02)
 ;;58016-0150-90
 ;;9002226.02101,"700,58016-0212-00 ",.01)
 ;;58016-0212-00
 ;;9002226.02101,"700,58016-0212-00 ",.02)
 ;;58016-0212-00
 ;;9002226.02101,"700,58016-0212-02 ",.01)
 ;;58016-0212-02
 ;;9002226.02101,"700,58016-0212-02 ",.02)
 ;;58016-0212-02
 ;;9002226.02101,"700,58016-0212-03 ",.01)
 ;;58016-0212-03
 ;;9002226.02101,"700,58016-0212-03 ",.02)
 ;;58016-0212-03
 ;;9002226.02101,"700,58016-0212-08 ",.01)
 ;;58016-0212-08
 ;;9002226.02101,"700,58016-0212-08 ",.02)
 ;;58016-0212-08
 ;;9002226.02101,"700,58016-0212-10 ",.01)
 ;;58016-0212-10
 ;;9002226.02101,"700,58016-0212-10 ",.02)
 ;;58016-0212-10
 ;;9002226.02101,"700,58016-0212-12 ",.01)
 ;;58016-0212-12
 ;;9002226.02101,"700,58016-0212-12 ",.02)
 ;;58016-0212-12
 ;;9002226.02101,"700,58016-0212-14 ",.01)
 ;;58016-0212-14
 ;;9002226.02101,"700,58016-0212-14 ",.02)
 ;;58016-0212-14
 ;;9002226.02101,"700,58016-0212-15 ",.01)
 ;;58016-0212-15
 ;;9002226.02101,"700,58016-0212-15 ",.02)
 ;;58016-0212-15
 ;;9002226.02101,"700,58016-0212-16 ",.01)
 ;;58016-0212-16
 ;;9002226.02101,"700,58016-0212-16 ",.02)
 ;;58016-0212-16
 ;;9002226.02101,"700,58016-0212-18 ",.01)
 ;;58016-0212-18
 ;;9002226.02101,"700,58016-0212-18 ",.02)
 ;;58016-0212-18
 ;;9002226.02101,"700,58016-0212-20 ",.01)
 ;;58016-0212-20
 ;;9002226.02101,"700,58016-0212-20 ",.02)
 ;;58016-0212-20
 ;;9002226.02101,"700,58016-0212-21 ",.01)
 ;;58016-0212-21
 ;;9002226.02101,"700,58016-0212-21 ",.02)
 ;;58016-0212-21
 ;;9002226.02101,"700,58016-0212-24 ",.01)
 ;;58016-0212-24
 ;;9002226.02101,"700,58016-0212-24 ",.02)
 ;;58016-0212-24
 ;;9002226.02101,"700,58016-0212-28 ",.01)
 ;;58016-0212-28
 ;;9002226.02101,"700,58016-0212-28 ",.02)
 ;;58016-0212-28
 ;;9002226.02101,"700,58016-0212-30 ",.01)
 ;;58016-0212-30
 ;;9002226.02101,"700,58016-0212-30 ",.02)
 ;;58016-0212-30
 ;;9002226.02101,"700,58016-0212-36 ",.01)
 ;;58016-0212-36
 ;;9002226.02101,"700,58016-0212-36 ",.02)
 ;;58016-0212-36
 ;;9002226.02101,"700,58016-0212-40 ",.01)
 ;;58016-0212-40
 ;;9002226.02101,"700,58016-0212-40 ",.02)
 ;;58016-0212-40
 ;;9002226.02101,"700,58016-0212-42 ",.01)
 ;;58016-0212-42
 ;;9002226.02101,"700,58016-0212-42 ",.02)
 ;;58016-0212-42
 ;;9002226.02101,"700,58016-0212-45 ",.01)
 ;;58016-0212-45
 ;;9002226.02101,"700,58016-0212-45 ",.02)
 ;;58016-0212-45
 ;;9002226.02101,"700,58016-0212-50 ",.01)
 ;;58016-0212-50
 ;;9002226.02101,"700,58016-0212-50 ",.02)
 ;;58016-0212-50
 ;;9002226.02101,"700,58016-0212-56 ",.01)
 ;;58016-0212-56
 ;;9002226.02101,"700,58016-0212-56 ",.02)
 ;;58016-0212-56
 ;;9002226.02101,"700,58016-0212-60 ",.01)
 ;;58016-0212-60
 ;;9002226.02101,"700,58016-0212-60 ",.02)
 ;;58016-0212-60
 ;;9002226.02101,"700,58016-0212-73 ",.01)
 ;;58016-0212-73
 ;;9002226.02101,"700,58016-0212-73 ",.02)
 ;;58016-0212-73
 ;;9002226.02101,"700,58016-0212-80 ",.01)
 ;;58016-0212-80
 ;;9002226.02101,"700,58016-0212-80 ",.02)
 ;;58016-0212-80
 ;;9002226.02101,"700,58016-0212-84 ",.01)
 ;;58016-0212-84
 ;;9002226.02101,"700,58016-0212-84 ",.02)
 ;;58016-0212-84
 ;;9002226.02101,"700,58016-0212-89 ",.01)
 ;;58016-0212-89
 ;;9002226.02101,"700,58016-0212-89 ",.02)
 ;;58016-0212-89
 ;;9002226.02101,"700,58016-0212-90 ",.01)
 ;;58016-0212-90
 ;;9002226.02101,"700,58016-0212-90 ",.02)
 ;;58016-0212-90
 ;;9002226.02101,"700,58016-0212-92 ",.01)
 ;;58016-0212-92
 ;;9002226.02101,"700,58016-0212-92 ",.02)
 ;;58016-0212-92
 ;;9002226.02101,"700,58016-0212-99 ",.01)
 ;;58016-0212-99
 ;;9002226.02101,"700,58016-0212-99 ",.02)
 ;;58016-0212-99
 ;;9002226.02101,"700,58016-0214-00 ",.01)
 ;;58016-0214-00
 ;;9002226.02101,"700,58016-0214-00 ",.02)
 ;;58016-0214-00
 ;;9002226.02101,"700,58016-0214-02 ",.01)
 ;;58016-0214-02
 ;;9002226.02101,"700,58016-0214-02 ",.02)
 ;;58016-0214-02
 ;;9002226.02101,"700,58016-0214-30 ",.01)
 ;;58016-0214-30
 ;;9002226.02101,"700,58016-0214-30 ",.02)
 ;;58016-0214-30
 ;;9002226.02101,"700,58016-0214-60 ",.01)
 ;;58016-0214-60
 ;;9002226.02101,"700,58016-0214-60 ",.02)
 ;;58016-0214-60
 ;;9002226.02101,"700,58016-0214-90 ",.01)
 ;;58016-0214-90
 ;;9002226.02101,"700,58016-0214-90 ",.02)
 ;;58016-0214-90
 ;;9002226.02101,"700,58016-0215-00 ",.01)
 ;;58016-0215-00
 ;;9002226.02101,"700,58016-0215-00 ",.02)
 ;;58016-0215-00
 ;;9002226.02101,"700,58016-0215-02 ",.01)
 ;;58016-0215-02
 ;;9002226.02101,"700,58016-0215-02 ",.02)
 ;;58016-0215-02
 ;;9002226.02101,"700,58016-0215-12 ",.01)
 ;;58016-0215-12
 ;;9002226.02101,"700,58016-0215-12 ",.02)
 ;;58016-0215-12
 ;;9002226.02101,"700,58016-0215-15 ",.01)
 ;;58016-0215-15
 ;;9002226.02101,"700,58016-0215-15 ",.02)
 ;;58016-0215-15
 ;;9002226.02101,"700,58016-0215-20 ",.01)
 ;;58016-0215-20
 ;;9002226.02101,"700,58016-0215-20 ",.02)
 ;;58016-0215-20
 ;;9002226.02101,"700,58016-0215-28 ",.01)
 ;;58016-0215-28
 ;;9002226.02101,"700,58016-0215-28 ",.02)
 ;;58016-0215-28
 ;;9002226.02101,"700,58016-0215-30 ",.01)
 ;;58016-0215-30
 ;;9002226.02101,"700,58016-0215-30 ",.02)
 ;;58016-0215-30
 ;;9002226.02101,"700,58016-0215-56 ",.01)
 ;;58016-0215-56
 ;;9002226.02101,"700,58016-0215-56 ",.02)
 ;;58016-0215-56
 ;;9002226.02101,"700,58016-0215-60 ",.01)
 ;;58016-0215-60
 ;;9002226.02101,"700,58016-0215-60 ",.02)
 ;;58016-0215-60
 ;;9002226.02101,"700,58016-0279-00 ",.01)
 ;;58016-0279-00
 ;;9002226.02101,"700,58016-0279-00 ",.02)
 ;;58016-0279-00
 ;;9002226.02101,"700,58016-0279-02 ",.01)
 ;;58016-0279-02
 ;;9002226.02101,"700,58016-0279-02 ",.02)
 ;;58016-0279-02
 ;;9002226.02101,"700,58016-0279-10 ",.01)
 ;;58016-0279-10
 ;;9002226.02101,"700,58016-0279-10 ",.02)
 ;;58016-0279-10
 ;;9002226.02101,"700,58016-0279-12 ",.01)
 ;;58016-0279-12
 ;;9002226.02101,"700,58016-0279-12 ",.02)
 ;;58016-0279-12
 ;;9002226.02101,"700,58016-0279-15 ",.01)
 ;;58016-0279-15
 ;;9002226.02101,"700,58016-0279-15 ",.02)
 ;;58016-0279-15
 ;;9002226.02101,"700,58016-0279-20 ",.01)
 ;;58016-0279-20
 ;;9002226.02101,"700,58016-0279-20 ",.02)
 ;;58016-0279-20
 ;;9002226.02101,"700,58016-0279-25 ",.01)
 ;;58016-0279-25
 ;;9002226.02101,"700,58016-0279-25 ",.02)
 ;;58016-0279-25
 ;;9002226.02101,"700,58016-0279-30 ",.01)
 ;;58016-0279-30
 ;;9002226.02101,"700,58016-0279-30 ",.02)
 ;;58016-0279-30
 ;;9002226.02101,"700,58016-0279-40 ",.01)
 ;;58016-0279-40
 ;;9002226.02101,"700,58016-0279-40 ",.02)
 ;;58016-0279-40
 ;;9002226.02101,"700,58016-0279-50 ",.01)
 ;;58016-0279-50
 ;;9002226.02101,"700,58016-0279-50 ",.02)
 ;;58016-0279-50
 ;;9002226.02101,"700,58016-0279-60 ",.01)
 ;;58016-0279-60
 ;;9002226.02101,"700,58016-0279-60 ",.02)
 ;;58016-0279-60
 ;;9002226.02101,"700,58016-0279-70 ",.01)
 ;;58016-0279-70
 ;;9002226.02101,"700,58016-0279-70 ",.02)
 ;;58016-0279-70
 ;;9002226.02101,"700,58016-0279-80 ",.01)
 ;;58016-0279-80
 ;;9002226.02101,"700,58016-0279-80 ",.02)
 ;;58016-0279-80
 ;;9002226.02101,"700,58016-0279-90 ",.01)
 ;;58016-0279-90
 ;;9002226.02101,"700,58016-0279-90 ",.02)
 ;;58016-0279-90
 ;;9002226.02101,"700,58016-0392-00 ",.01)
 ;;58016-0392-00
 ;;9002226.02101,"700,58016-0392-00 ",.02)
 ;;58016-0392-00
 ;;9002226.02101,"700,58016-0392-10 ",.01)
 ;;58016-0392-10
 ;;9002226.02101,"700,58016-0392-10 ",.02)
 ;;58016-0392-10
 ;;9002226.02101,"700,58016-0392-12 ",.01)
 ;;58016-0392-12
 ;;9002226.02101,"700,58016-0392-12 ",.02)
 ;;58016-0392-12
 ;;9002226.02101,"700,58016-0392-20 ",.01)
 ;;58016-0392-20
 ;;9002226.02101,"700,58016-0392-20 ",.02)
 ;;58016-0392-20
 ;;9002226.02101,"700,58016-0392-30 ",.01)
 ;;58016-0392-30
 ;;9002226.02101,"700,58016-0392-30 ",.02)
 ;;58016-0392-30
 ;;9002226.02101,"700,58016-0392-40 ",.01)
 ;;58016-0392-40
 ;;9002226.02101,"700,58016-0392-40 ",.02)
 ;;58016-0392-40
 ;;9002226.02101,"700,58016-0392-60 ",.01)
 ;;58016-0392-60
 ;;9002226.02101,"700,58016-0392-60 ",.02)
 ;;58016-0392-60
 ;;9002226.02101,"700,58016-0461-00 ",.01)
 ;;58016-0461-00
 ;;9002226.02101,"700,58016-0461-00 ",.02)
 ;;58016-0461-00
 ;;9002226.02101,"700,58016-0461-20 ",.01)
 ;;58016-0461-20
 ;;9002226.02101,"700,58016-0461-20 ",.02)
 ;;58016-0461-20
 ;;9002226.02101,"700,58016-0461-30 ",.01)
 ;;58016-0461-30
 ;;9002226.02101,"700,58016-0461-30 ",.02)
 ;;58016-0461-30
 ;;9002226.02101,"700,58016-0461-60 ",.01)
 ;;58016-0461-60
 ;;9002226.02101,"700,58016-0461-60 ",.02)
 ;;58016-0461-60
 ;;9002226.02101,"700,58016-0461-90 ",.01)
 ;;58016-0461-90
 ;;9002226.02101,"700,58016-0461-90 ",.02)
 ;;58016-0461-90
 ;;9002226.02101,"700,58177-0027-04 ",.01)
 ;;58177-0027-04
 ;;9002226.02101,"700,58177-0027-04 ",.02)
 ;;58177-0027-04
 ;;9002226.02101,"700,58864-0428-20 ",.01)
 ;;58864-0428-20
 ;;9002226.02101,"700,58864-0428-20 ",.02)
 ;;58864-0428-20
 ;;9002226.02101,"700,60760-0890-15 ",.01)
 ;;60760-0890-15
 ;;9002226.02101,"700,60760-0890-15 ",.02)
 ;;60760-0890-15
 ;;9002226.02101,"700,60760-0890-30 ",.01)
 ;;60760-0890-30
 ;;9002226.02101,"700,60760-0890-30 ",.02)
 ;;60760-0890-30
 ;;9002226.02101,"700,60760-0890-60 ",.01)
 ;;60760-0890-60
 ;;9002226.02101,"700,60760-0890-60 ",.02)
 ;;60760-0890-60
 ;;9002226.02101,"700,61392-0446-10 ",.01)
 ;;61392-0446-10
 ;;9002226.02101,"700,61392-0446-10 ",.02)
 ;;61392-0446-10
 ;;9002226.02101,"700,61392-0446-15 ",.01)
 ;;61392-0446-15
 ;;9002226.02101,"700,61392-0446-15 ",.02)
 ;;61392-0446-15
 ;;9002226.02101,"700,61392-0446-30 ",.01)
 ;;61392-0446-30
 ;;9002226.02101,"700,61392-0446-30 ",.02)
 ;;61392-0446-30
 ;;9002226.02101,"700,61392-0446-45 ",.01)
 ;;61392-0446-45
 ;;9002226.02101,"700,61392-0446-45 ",.02)
 ;;61392-0446-45
 ;;9002226.02101,"700,61392-0446-51 ",.01)
 ;;61392-0446-51
 ;;9002226.02101,"700,61392-0446-51 ",.02)
 ;;61392-0446-51
 ;;9002226.02101,"700,61392-0446-54 ",.01)
 ;;61392-0446-54
 ;;9002226.02101,"700,61392-0446-54 ",.02)
 ;;61392-0446-54
 ;;9002226.02101,"700,61392-0446-56 ",.01)
 ;;61392-0446-56
 ;;9002226.02101,"700,61392-0446-56 ",.02)
 ;;61392-0446-56
 ;;9002226.02101,"700,61392-0446-60 ",.01)
 ;;61392-0446-60
 ;;9002226.02101,"700,61392-0446-60 ",.02)
 ;;61392-0446-60
 ;;9002226.02101,"700,61392-0446-90 ",.01)
 ;;61392-0446-90
 ;;9002226.02101,"700,61392-0446-90 ",.02)
 ;;61392-0446-90
 ;;9002226.02101,"700,61392-0446-91 ",.01)
 ;;61392-0446-91
 ;;9002226.02101,"700,61392-0446-91 ",.02)
 ;;61392-0446-91
 ;;9002226.02101,"700,61451-5015-07 ",.01)
 ;;61451-5015-07
 ;;9002226.02101,"700,61451-5015-07 ",.02)
 ;;61451-5015-07
 ;;9002226.02101,"700,61451-5016-07 ",.01)
 ;;61451-5016-07
 ;;9002226.02101,"700,61451-5016-07 ",.02)
 ;;61451-5016-07
 ;;9002226.02101,"700,61553-0170-41 ",.01)
 ;;61553-0170-41
 ;;9002226.02101,"700,61553-0170-41 ",.02)
 ;;61553-0170-41
 ;;9002226.02101,"700,61553-0172-48 ",.01)
 ;;61553-0172-48
 ;;9002226.02101,"700,61553-0172-48 ",.02)
 ;;61553-0172-48
 ;;9002226.02101,"700,61553-0173-48 ",.01)
 ;;61553-0173-48
 ;;9002226.02101,"700,61553-0173-48 ",.02)
 ;;61553-0173-48
 ;;9002226.02101,"700,61553-0676-44 ",.01)
 ;;61553-0676-44
 ;;9002226.02101,"700,61553-0676-44 ",.02)
 ;;61553-0676-44
 ;;9002226.02101,"700,61553-0841-48 ",.01)
 ;;61553-0841-48