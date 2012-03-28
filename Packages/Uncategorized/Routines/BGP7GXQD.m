BGP7GXQD ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 27, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"630,54569-0707-00 ",.02)
 ;;54569-0707-00
 ;;9002226.02101,"630,54569-0802-01 ",.01)
 ;;54569-0802-01
 ;;9002226.02101,"630,54569-0802-01 ",.02)
 ;;54569-0802-01
 ;;9002226.02101,"630,54569-0811-01 ",.01)
 ;;54569-0811-01
 ;;9002226.02101,"630,54569-0811-01 ",.02)
 ;;54569-0811-01
 ;;9002226.02101,"630,54569-0812-00 ",.01)
 ;;54569-0812-00
 ;;9002226.02101,"630,54569-0812-00 ",.02)
 ;;54569-0812-00
 ;;9002226.02101,"630,54569-0812-01 ",.01)
 ;;54569-0812-01
 ;;9002226.02101,"630,54569-0812-01 ",.02)
 ;;54569-0812-01
 ;;9002226.02101,"630,54569-0812-02 ",.01)
 ;;54569-0812-02
 ;;9002226.02101,"630,54569-0812-02 ",.02)
 ;;54569-0812-02
 ;;9002226.02101,"630,54569-0812-05 ",.01)
 ;;54569-0812-05
 ;;9002226.02101,"630,54569-0812-05 ",.02)
 ;;54569-0812-05
 ;;9002226.02101,"630,54569-0813-00 ",.01)
 ;;54569-0813-00
 ;;9002226.02101,"630,54569-0813-00 ",.02)
 ;;54569-0813-00
 ;;9002226.02101,"630,54569-0813-01 ",.01)
 ;;54569-0813-01
 ;;9002226.02101,"630,54569-0813-01 ",.02)
 ;;54569-0813-01
 ;;9002226.02101,"630,54569-0849-00 ",.01)
 ;;54569-0849-00
 ;;9002226.02101,"630,54569-0849-00 ",.02)
 ;;54569-0849-00
 ;;9002226.02101,"630,54569-0849-01 ",.01)
 ;;54569-0849-01
 ;;9002226.02101,"630,54569-0849-01 ",.02)
 ;;54569-0849-01
 ;;9002226.02101,"630,54569-1047-00 ",.01)
 ;;54569-1047-00
 ;;9002226.02101,"630,54569-1047-00 ",.02)
 ;;54569-1047-00
 ;;9002226.02101,"630,54569-1592-00 ",.01)
 ;;54569-1592-00
 ;;9002226.02101,"630,54569-1592-00 ",.02)
 ;;54569-1592-00
 ;;9002226.02101,"630,54569-2729-00 ",.01)
 ;;54569-2729-00
 ;;9002226.02101,"630,54569-2729-00 ",.02)
 ;;54569-2729-00
 ;;9002226.02101,"630,54569-2729-02 ",.01)
 ;;54569-2729-02
 ;;9002226.02101,"630,54569-2729-02 ",.02)
 ;;54569-2729-02
 ;;9002226.02101,"630,54569-3540-00 ",.01)
 ;;54569-3540-00
 ;;9002226.02101,"630,54569-3540-00 ",.02)
 ;;54569-3540-00
 ;;9002226.02101,"630,54569-3540-01 ",.01)
 ;;54569-3540-01
 ;;9002226.02101,"630,54569-3540-01 ",.02)
 ;;54569-3540-01
 ;;9002226.02101,"630,54569-3540-02 ",.01)
 ;;54569-3540-02
 ;;9002226.02101,"630,54569-3540-02 ",.02)
 ;;54569-3540-02
 ;;9002226.02101,"630,54569-4354-01 ",.01)
 ;;54569-4354-01
 ;;9002226.02101,"630,54569-4354-01 ",.02)
 ;;54569-4354-01
 ;;9002226.02101,"630,54569-4618-00 ",.01)
 ;;54569-4618-00
 ;;9002226.02101,"630,54569-4618-00 ",.02)
 ;;54569-4618-00
 ;;9002226.02101,"630,54569-4673-00 ",.01)
 ;;54569-4673-00
 ;;9002226.02101,"630,54569-4673-00 ",.02)
 ;;54569-4673-00
 ;;9002226.02101,"630,54569-4907-00 ",.01)
 ;;54569-4907-00
 ;;9002226.02101,"630,54569-4907-00 ",.02)
 ;;54569-4907-00
 ;;9002226.02101,"630,54569-4908-00 ",.01)
 ;;54569-4908-00
 ;;9002226.02101,"630,54569-4908-00 ",.02)
 ;;54569-4908-00
 ;;9002226.02101,"630,54569-4925-00 ",.01)
 ;;54569-4925-00
 ;;9002226.02101,"630,54569-4925-00 ",.02)
 ;;54569-4925-00
 ;;9002226.02101,"630,54569-8006-00 ",.01)
 ;;54569-8006-00
 ;;9002226.02101,"630,54569-8006-00 ",.02)
 ;;54569-8006-00
 ;;9002226.02101,"630,54569-8006-01 ",.01)
 ;;54569-8006-01
 ;;9002226.02101,"630,54569-8006-01 ",.02)
 ;;54569-8006-01
 ;;9002226.02101,"630,54569-8006-02 ",.01)
 ;;54569-8006-02
 ;;9002226.02101,"630,54569-8006-02 ",.02)
 ;;54569-8006-02
 ;;9002226.02101,"630,54569-8014-00 ",.01)
 ;;54569-8014-00
 ;;9002226.02101,"630,54569-8014-00 ",.02)
 ;;54569-8014-00
 ;;9002226.02101,"630,54569-8500-00 ",.01)
 ;;54569-8500-00
 ;;9002226.02101,"630,54569-8500-00 ",.02)
 ;;54569-8500-00
 ;;9002226.02101,"630,54569-8500-01 ",.01)
 ;;54569-8500-01
 ;;9002226.02101,"630,54569-8500-01 ",.02)
 ;;54569-8500-01
 ;;9002226.02101,"630,54569-8500-02 ",.01)
 ;;54569-8500-02
 ;;9002226.02101,"630,54569-8500-02 ",.02)
 ;;54569-8500-02
 ;;9002226.02101,"630,54569-8505-00 ",.01)
 ;;54569-8505-00
 ;;9002226.02101,"630,54569-8505-00 ",.02)
 ;;54569-8505-00
 ;;9002226.02101,"630,54569-8505-01 ",.01)
 ;;54569-8505-01
 ;;9002226.02101,"630,54569-8505-01 ",.02)
 ;;54569-8505-01
 ;;9002226.02101,"630,54569-8505-02 ",.01)
 ;;54569-8505-02
 ;;9002226.02101,"630,54569-8505-02 ",.02)
 ;;54569-8505-02
 ;;9002226.02101,"630,54569-8517-00 ",.01)
 ;;54569-8517-00
 ;;9002226.02101,"630,54569-8517-00 ",.02)
 ;;54569-8517-00
 ;;9002226.02101,"630,54569-8517-01 ",.01)
 ;;54569-8517-01
 ;;9002226.02101,"630,54569-8517-01 ",.02)
 ;;54569-8517-01
 ;;9002226.02101,"630,54569-8518-00 ",.01)
 ;;54569-8518-00
 ;;9002226.02101,"630,54569-8518-00 ",.02)
 ;;54569-8518-00
 ;;9002226.02101,"630,54569-8518-01 ",.01)
 ;;54569-8518-01
 ;;9002226.02101,"630,54569-8518-01 ",.02)
 ;;54569-8518-01
 ;;9002226.02101,"630,54569-8525-00 ",.01)
 ;;54569-8525-00
 ;;9002226.02101,"630,54569-8525-00 ",.02)
 ;;54569-8525-00
 ;;9002226.02101,"630,54569-8528-00 ",.01)
 ;;54569-8528-00
 ;;9002226.02101,"630,54569-8528-00 ",.02)
 ;;54569-8528-00
 ;;9002226.02101,"630,54569-8551-00 ",.01)
 ;;54569-8551-00
 ;;9002226.02101,"630,54569-8551-00 ",.02)
 ;;54569-8551-00
 ;;9002226.02101,"630,54569-8577-00 ",.01)
 ;;54569-8577-00
 ;;9002226.02101,"630,54569-8577-00 ",.02)
 ;;54569-8577-00
 ;;9002226.02101,"630,54868-0107-00 ",.01)
 ;;54868-0107-00
 ;;9002226.02101,"630,54868-0107-00 ",.02)
 ;;54868-0107-00
 ;;9002226.02101,"630,54868-0107-02 ",.01)
 ;;54868-0107-02
 ;;9002226.02101,"630,54868-0107-02 ",.02)
 ;;54868-0107-02
 ;;9002226.02101,"630,54868-0107-05 ",.01)
 ;;54868-0107-05
 ;;9002226.02101,"630,54868-0107-05 ",.02)
 ;;54868-0107-05
 ;;9002226.02101,"630,54868-0263-00 ",.01)
 ;;54868-0263-00
 ;;9002226.02101,"630,54868-0263-00 ",.02)
 ;;54868-0263-00
 ;;9002226.02101,"630,54868-0365-00 ",.01)
 ;;54868-0365-00
 ;;9002226.02101,"630,54868-0365-00 ",.02)
 ;;54868-0365-00
 ;;9002226.02101,"630,54868-0429-02 ",.01)
 ;;54868-0429-02
 ;;9002226.02101,"630,54868-0429-02 ",.02)
 ;;54868-0429-02
 ;;9002226.02101,"630,54868-0451-00 ",.01)
 ;;54868-0451-00
 ;;9002226.02101,"630,54868-0451-00 ",.02)
 ;;54868-0451-00
 ;;9002226.02101,"630,54868-0451-01 ",.01)
 ;;54868-0451-01
 ;;9002226.02101,"630,54868-0451-01 ",.02)
 ;;54868-0451-01
 ;;9002226.02101,"630,54868-0451-02 ",.01)
 ;;54868-0451-02
 ;;9002226.02101,"630,54868-0451-02 ",.02)
 ;;54868-0451-02
 ;;9002226.02101,"630,54868-0451-03 ",.01)
 ;;54868-0451-03
 ;;9002226.02101,"630,54868-0451-03 ",.02)
 ;;54868-0451-03
 ;;9002226.02101,"630,54868-0452-03 ",.01)
 ;;54868-0452-03
 ;;9002226.02101,"630,54868-0452-03 ",.02)
 ;;54868-0452-03
 ;;9002226.02101,"630,54868-0453-00 ",.01)
 ;;54868-0453-00
 ;;9002226.02101,"630,54868-0453-00 ",.02)
 ;;54868-0453-00
 ;;9002226.02101,"630,54868-0453-01 ",.01)
 ;;54868-0453-01
 ;;9002226.02101,"630,54868-0453-01 ",.02)
 ;;54868-0453-01
 ;;9002226.02101,"630,54868-0453-02 ",.01)
 ;;54868-0453-02
 ;;9002226.02101,"630,54868-0453-02 ",.02)
 ;;54868-0453-02
 ;;9002226.02101,"630,54868-0453-04 ",.01)
 ;;54868-0453-04
 ;;9002226.02101,"630,54868-0453-04 ",.02)
 ;;54868-0453-04
 ;;9002226.02101,"630,54868-0453-05 ",.01)
 ;;54868-0453-05
 ;;9002226.02101,"630,54868-0453-05 ",.02)
 ;;54868-0453-05
 ;;9002226.02101,"630,54868-0453-06 ",.01)
 ;;54868-0453-06
 ;;9002226.02101,"630,54868-0453-06 ",.02)
 ;;54868-0453-06
 ;;9002226.02101,"630,54868-1028-01 ",.01)
 ;;54868-1028-01
 ;;9002226.02101,"630,54868-1028-01 ",.02)
 ;;54868-1028-01
 ;;9002226.02101,"630,54868-1029-02 ",.01)
 ;;54868-1029-02
 ;;9002226.02101,"630,54868-1029-02 ",.02)
 ;;54868-1029-02
 ;;9002226.02101,"630,54868-1261-00 ",.01)
 ;;54868-1261-00
 ;;9002226.02101,"630,54868-1261-00 ",.02)
 ;;54868-1261-00
 ;;9002226.02101,"630,54868-1262-00 ",.01)
 ;;54868-1262-00
 ;;9002226.02101,"630,54868-1262-00 ",.02)
 ;;54868-1262-00
 ;;9002226.02101,"630,54868-2702-00 ",.01)
 ;;54868-2702-00
 ;;9002226.02101,"630,54868-2702-00 ",.02)
 ;;54868-2702-00
 ;;9002226.02101,"630,54868-2702-04 ",.01)
 ;;54868-2702-04
 ;;9002226.02101,"630,54868-2702-04 ",.02)
 ;;54868-2702-04
 ;;9002226.02101,"630,54868-3114-01 ",.01)
 ;;54868-3114-01
 ;;9002226.02101,"630,54868-3114-01 ",.02)
 ;;54868-3114-01
 ;;9002226.02101,"630,54868-3672-00 ",.01)
 ;;54868-3672-00
 ;;9002226.02101,"630,54868-3672-00 ",.02)
 ;;54868-3672-00
 ;;9002226.02101,"630,54868-3673-00 ",.01)
 ;;54868-3673-00
 ;;9002226.02101,"630,54868-3673-00 ",.02)
 ;;54868-3673-00
 ;;9002226.02101,"630,54868-3673-01 ",.01)
 ;;54868-3673-01
 ;;9002226.02101,"630,54868-3673-01 ",.02)
 ;;54868-3673-01
 ;;9002226.02101,"630,54868-3799-00 ",.01)
 ;;54868-3799-00
 ;;9002226.02101,"630,54868-3799-00 ",.02)
 ;;54868-3799-00
 ;;9002226.02101,"630,54868-3800-00 ",.01)
 ;;54868-3800-00
 ;;9002226.02101,"630,54868-3800-00 ",.02)
 ;;54868-3800-00
 ;;9002226.02101,"630,55045-1266-08 ",.01)
 ;;55045-1266-08
 ;;9002226.02101,"630,55045-1266-08 ",.02)
 ;;55045-1266-08
 ;;9002226.02101,"630,55045-1266-09 ",.01)
 ;;55045-1266-09
 ;;9002226.02101,"630,55045-1266-09 ",.02)
 ;;55045-1266-09
 ;;9002226.02101,"630,55045-1316-08 ",.01)
 ;;55045-1316-08
 ;;9002226.02101,"630,55045-1316-08 ",.02)
 ;;55045-1316-08
 ;;9002226.02101,"630,55045-1563-03 ",.01)
 ;;55045-1563-03
 ;;9002226.02101,"630,55045-1563-03 ",.02)
 ;;55045-1563-03
 ;;9002226.02101,"630,55045-1687-02 ",.01)
 ;;55045-1687-02
 ;;9002226.02101,"630,55045-1687-02 ",.02)
 ;;55045-1687-02
 ;;9002226.02101,"630,55045-1687-08 ",.01)
 ;;55045-1687-08
 ;;9002226.02101,"630,55045-1687-08 ",.02)
 ;;55045-1687-08
 ;;9002226.02101,"630,55175-2092-00 ",.01)
 ;;55175-2092-00
 ;;9002226.02101,"630,55175-2092-00 ",.02)
 ;;55175-2092-00
 ;;9002226.02101,"630,55175-2625-03 ",.01)
 ;;55175-2625-03
 ;;9002226.02101,"630,55175-2625-03 ",.02)
 ;;55175-2625-03
 ;;9002226.02101,"630,55175-2625-08 ",.01)
 ;;55175-2625-08
 ;;9002226.02101,"630,55175-2625-08 ",.02)
 ;;55175-2625-08
 ;;9002226.02101,"630,55288-1252-01 ",.01)
 ;;55288-1252-01
 ;;9002226.02101,"630,55288-1252-01 ",.02)
 ;;55288-1252-01
 ;;9002226.02101,"630,55289-0028-08 ",.01)
 ;;55289-0028-08
 ;;9002226.02101,"630,55289-0028-08 ",.02)
 ;;55289-0028-08
 ;;9002226.02101,"630,55289-0047-25 ",.01)
 ;;55289-0047-25
 ;;9002226.02101,"630,55289-0047-25 ",.02)
 ;;55289-0047-25
 ;;9002226.02101,"630,55289-0047-30 ",.01)
 ;;55289-0047-30
 ;;9002226.02101,"630,55289-0047-30 ",.02)
 ;;55289-0047-30
 ;;9002226.02101,"630,55289-0047-42 ",.01)
 ;;55289-0047-42
 ;;9002226.02101,"630,55289-0047-42 ",.02)
 ;;55289-0047-42
 ;;9002226.02101,"630,55289-0047-90 ",.01)
 ;;55289-0047-90
 ;;9002226.02101,"630,55289-0047-90 ",.02)
 ;;55289-0047-90
 ;;9002226.02101,"630,55289-0101-30 ",.01)
 ;;55289-0101-30
 ;;9002226.02101,"630,55289-0101-30 ",.02)
 ;;55289-0101-30
 ;;9002226.02101,"630,55289-0101-50 ",.01)
 ;;55289-0101-50
 ;;9002226.02101,"630,55289-0101-50 ",.02)
 ;;55289-0101-50
 ;;9002226.02101,"630,55289-0123-30 ",.01)
 ;;55289-0123-30
 ;;9002226.02101,"630,55289-0123-30 ",.02)
 ;;55289-0123-30
 ;;9002226.02101,"630,55289-0396-30 ",.01)
 ;;55289-0396-30
 ;;9002226.02101,"630,55289-0396-30 ",.02)
 ;;55289-0396-30
 ;;9002226.02101,"630,55289-0503-07 ",.01)
 ;;55289-0503-07
 ;;9002226.02101,"630,55289-0503-07 ",.02)
 ;;55289-0503-07
 ;;9002226.02101,"630,55289-0503-21 ",.01)
 ;;55289-0503-21
 ;;9002226.02101,"630,55289-0503-21 ",.02)
 ;;55289-0503-21
 ;;9002226.02101,"630,55289-0735-01 ",.01)
 ;;55289-0735-01
 ;;9002226.02101,"630,55289-0735-01 ",.02)
 ;;55289-0735-01
 ;;9002226.02101,"630,55289-0943-07 ",.01)
 ;;55289-0943-07
 ;;9002226.02101,"630,55289-0943-07 ",.02)
 ;;55289-0943-07
 ;;9002226.02101,"630,55289-0943-25 ",.01)
 ;;55289-0943-25
 ;;9002226.02101,"630,55289-0943-25 ",.02)
 ;;55289-0943-25
 ;;9002226.02101,"630,55289-0943-30 ",.01)
 ;;55289-0943-30
 ;;9002226.02101,"630,55289-0943-30 ",.02)
 ;;55289-0943-30
 ;;9002226.02101,"630,55887-0266-30 ",.01)
 ;;55887-0266-30
 ;;9002226.02101,"630,55887-0266-30 ",.02)
 ;;55887-0266-30
 ;;9002226.02101,"630,55887-0266-60 ",.01)
 ;;55887-0266-60
 ;;9002226.02101,"630,55887-0266-60 ",.02)
 ;;55887-0266-60
 ;;9002226.02101,"630,55887-0266-82 ",.01)
 ;;55887-0266-82
 ;;9002226.02101,"630,55887-0266-82 ",.02)
 ;;55887-0266-82
 ;;9002226.02101,"630,55887-0266-90 ",.01)
 ;;55887-0266-90
 ;;9002226.02101,"630,55887-0266-90 ",.02)
 ;;55887-0266-90
 ;;9002226.02101,"630,55887-0300-30 ",.01)
 ;;55887-0300-30
 ;;9002226.02101,"630,55887-0300-30 ",.02)
 ;;55887-0300-30
 ;;9002226.02101,"630,55887-0300-60 ",.01)
 ;;55887-0300-60
 ;;9002226.02101,"630,55887-0300-60 ",.02)
 ;;55887-0300-60
 ;;9002226.02101,"630,55887-0300-90 ",.01)
 ;;55887-0300-90
 ;;9002226.02101,"630,55887-0300-90 ",.02)
 ;;55887-0300-90
 ;;9002226.02101,"630,55887-0301-30 ",.01)
 ;;55887-0301-30
 ;;9002226.02101,"630,55887-0301-30 ",.02)
 ;;55887-0301-30
 ;;9002226.02101,"630,55887-0301-60 ",.01)
 ;;55887-0301-60
 ;;9002226.02101,"630,55887-0301-60 ",.02)
 ;;55887-0301-60
 ;;9002226.02101,"630,55887-0301-90 ",.01)
 ;;55887-0301-90
 ;;9002226.02101,"630,55887-0301-90 ",.02)
 ;;55887-0301-90
 ;;9002226.02101,"630,55887-0305-30 ",.01)
 ;;55887-0305-30
 ;;9002226.02101,"630,55887-0305-30 ",.02)
 ;;55887-0305-30
 ;;9002226.02101,"630,55887-0305-60 ",.01)
 ;;55887-0305-60
 ;;9002226.02101,"630,55887-0305-60 ",.02)
 ;;55887-0305-60
 ;;9002226.02101,"630,55887-0305-90 ",.01)
 ;;55887-0305-90
 ;;9002226.02101,"630,55887-0305-90 ",.02)
 ;;55887-0305-90
 ;;9002226.02101,"630,55887-0306-30 ",.01)
 ;;55887-0306-30
 ;;9002226.02101,"630,55887-0306-30 ",.02)
 ;;55887-0306-30
 ;;9002226.02101,"630,55887-0306-60 ",.01)
 ;;55887-0306-60
 ;;9002226.02101,"630,55887-0306-60 ",.02)
 ;;55887-0306-60
 ;;9002226.02101,"630,55887-0306-90 ",.01)
 ;;55887-0306-90
