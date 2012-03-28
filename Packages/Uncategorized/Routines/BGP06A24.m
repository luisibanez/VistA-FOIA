BGP06A24 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"974,00172-7406-21 ",.01)
 ;;00172-7406-21
 ;;9002226.02101,"974,00172-7406-21 ",.02)
 ;;00172-7406-21
 ;;9002226.02101,"974,00172-7406-22 ",.01)
 ;;00172-7406-22
 ;;9002226.02101,"974,00172-7406-22 ",.02)
 ;;00172-7406-22
 ;;9002226.02101,"974,00172-7407-14 ",.01)
 ;;00172-7407-14
 ;;9002226.02101,"974,00172-7407-14 ",.02)
 ;;00172-7407-14
 ;;9002226.02101,"974,00172-7407-22 ",.01)
 ;;00172-7407-22
 ;;9002226.02101,"974,00172-7407-22 ",.02)
 ;;00172-7407-22
 ;;9002226.02101,"974,00172-7407-26 ",.01)
 ;;00172-7407-26
 ;;9002226.02101,"974,00172-7407-26 ",.02)
 ;;00172-7407-26
 ;;9002226.02101,"974,00172-7408-14 ",.01)
 ;;00172-7408-14
 ;;9002226.02101,"974,00172-7408-14 ",.02)
 ;;00172-7408-14
 ;;9002226.02101,"974,00172-7408-22 ",.01)
 ;;00172-7408-22
 ;;9002226.02101,"974,00172-7408-22 ",.02)
 ;;00172-7408-22
 ;;9002226.02101,"974,00172-7408-26 ",.01)
 ;;00172-7408-26
 ;;9002226.02101,"974,00172-7408-26 ",.02)
 ;;00172-7408-26
 ;;9002226.02101,"974,00172-7411-42 ",.01)
 ;;00172-7411-42
 ;;9002226.02101,"974,00172-7411-42 ",.02)
 ;;00172-7411-42
 ;;9002226.02101,"974,00172-7411-60 ",.01)
 ;;00172-7411-60
 ;;9002226.02101,"974,00172-7411-60 ",.02)
 ;;00172-7411-60
 ;;9002226.02101,"974,00172-7411-70 ",.01)
 ;;00172-7411-70
 ;;9002226.02101,"974,00172-7411-70 ",.02)
 ;;00172-7411-70
 ;;9002226.02101,"974,00172-7414-70 ",.01)
 ;;00172-7414-70
 ;;9002226.02101,"974,00172-7414-70 ",.02)
 ;;00172-7414-70
 ;;9002226.02101,"974,00172-7416-42 ",.01)
 ;;00172-7416-42
 ;;9002226.02101,"974,00172-7416-42 ",.02)
 ;;00172-7416-42
 ;;9002226.02101,"974,00172-7416-60 ",.01)
 ;;00172-7416-60
 ;;9002226.02101,"974,00172-7416-60 ",.02)
 ;;00172-7416-60
 ;;9002226.02101,"974,00172-7417-23 ",.01)
 ;;00172-7417-23
 ;;9002226.02101,"974,00172-7417-23 ",.02)
 ;;00172-7417-23
 ;;9002226.02101,"974,00172-7418-21 ",.01)
 ;;00172-7418-21
 ;;9002226.02101,"974,00172-7418-21 ",.02)
 ;;00172-7418-21
 ;;9002226.02101,"974,00172-7418-23 ",.01)
 ;;00172-7418-23
 ;;9002226.02101,"974,00172-7418-23 ",.02)
 ;;00172-7418-23
 ;;9002226.02101,"974,00172-7419-21 ",.01)
 ;;00172-7419-21
 ;;9002226.02101,"974,00172-7419-21 ",.02)
 ;;00172-7419-21
 ;;9002226.02101,"974,00172-7420-20 ",.01)
 ;;00172-7420-20
 ;;9002226.02101,"974,00172-7420-20 ",.02)
 ;;00172-7420-20
 ;;9002226.02101,"974,00172-7420-21 ",.01)
 ;;00172-7420-21
 ;;9002226.02101,"974,00172-7420-21 ",.02)
 ;;00172-7420-21
 ;;9002226.02101,"974,00172-7420-22 ",.01)
 ;;00172-7420-22
 ;;9002226.02101,"974,00172-7420-22 ",.02)
 ;;00172-7420-22
 ;;9002226.02101,"974,00173-0352-10 ",.01)
 ;;00173-0352-10
 ;;9002226.02101,"974,00173-0352-10 ",.02)
 ;;00173-0352-10
 ;;9002226.02101,"974,00173-0352-31 ",.01)
 ;;00173-0352-31
 ;;9002226.02101,"974,00173-0352-31 ",.02)
 ;;00173-0352-31
 ;;9002226.02101,"974,00173-0353-32 ",.01)
 ;;00173-0353-32
 ;;9002226.02101,"974,00173-0353-32 ",.02)
 ;;00173-0353-32
 ;;9002226.02101,"974,00173-0354-10 ",.01)
 ;;00173-0354-10
 ;;9002226.02101,"974,00173-0354-10 ",.02)
 ;;00173-0354-10
 ;;9002226.02101,"974,00173-0354-35 ",.01)
 ;;00173-0354-35
 ;;9002226.02101,"974,00173-0354-35 ",.02)
 ;;00173-0354-35
 ;;9002226.02101,"974,00173-0356-32 ",.01)
 ;;00173-0356-32
 ;;9002226.02101,"974,00173-0356-32 ",.02)
 ;;00173-0356-32
 ;;9002226.02101,"974,00173-0387-00 ",.01)
 ;;00173-0387-00
 ;;9002226.02101,"974,00173-0387-00 ",.02)
 ;;00173-0387-00
 ;;9002226.02101,"974,00173-0387-01 ",.01)
 ;;00173-0387-01
 ;;9002226.02101,"974,00173-0387-01 ",.02)
 ;;00173-0387-01
 ;;9002226.02101,"974,00173-0387-42 ",.01)
 ;;00173-0387-42
 ;;9002226.02101,"974,00173-0387-42 ",.02)
 ;;00173-0387-42
 ;;9002226.02101,"974,00173-0394-00 ",.01)
 ;;00173-0394-00
 ;;9002226.02101,"974,00173-0394-00 ",.02)
 ;;00173-0394-00
 ;;9002226.02101,"974,00173-0394-01 ",.01)
 ;;00173-0394-01
 ;;9002226.02101,"974,00173-0394-01 ",.02)
 ;;00173-0394-01
 ;;9002226.02101,"974,00173-0394-42 ",.01)
 ;;00173-0394-42
 ;;9002226.02101,"974,00173-0394-42 ",.02)
 ;;00173-0394-42
 ;;9002226.02101,"974,00173-0395-01 ",.01)
 ;;00173-0395-01
 ;;9002226.02101,"974,00173-0395-01 ",.02)
 ;;00173-0395-01
 ;;9002226.02101,"974,00173-0395-02 ",.01)
 ;;00173-0395-02
 ;;9002226.02101,"974,00173-0395-02 ",.02)
 ;;00173-0395-02
 ;;9002226.02101,"974,00173-0400-00 ",.01)
 ;;00173-0400-00
 ;;9002226.02101,"974,00173-0400-00 ",.02)
 ;;00173-0400-00
 ;;9002226.02101,"974,00173-0406-00 ",.01)
 ;;00173-0406-00
 ;;9002226.02101,"974,00173-0406-00 ",.02)
 ;;00173-0406-00
 ;;9002226.02101,"974,00173-0406-01 ",.01)
 ;;00173-0406-01
 ;;9002226.02101,"974,00173-0406-01 ",.02)
 ;;00173-0406-01
 ;;9002226.02101,"974,00173-0424-00 ",.01)
 ;;00173-0424-00
 ;;9002226.02101,"974,00173-0424-00 ",.02)
 ;;00173-0424-00
 ;;9002226.02101,"974,00173-0425-00 ",.01)
 ;;00173-0425-00
 ;;9002226.02101,"974,00173-0425-00 ",.02)
 ;;00173-0425-00
 ;;9002226.02101,"974,00173-0436-00 ",.01)
 ;;00173-0436-00
 ;;9002226.02101,"974,00173-0436-00 ",.02)
 ;;00173-0436-00
 ;;9002226.02101,"974,00173-0437-00 ",.01)
 ;;00173-0437-00
 ;;9002226.02101,"974,00173-0437-00 ",.02)
 ;;00173-0437-00
 ;;9002226.02101,"974,00173-0554-00 ",.01)
 ;;00173-0554-00
 ;;9002226.02101,"974,00173-0554-00 ",.02)
 ;;00173-0554-00
 ;;9002226.02101,"974,00173-0555-00 ",.01)
 ;;00173-0555-00
 ;;9002226.02101,"974,00173-0555-00 ",.02)
 ;;00173-0555-00
 ;;9002226.02101,"974,00173-0740-00 ",.01)
 ;;00173-0740-00
 ;;9002226.02101,"974,00173-0740-00 ",.02)
 ;;00173-0740-00
 ;;9002226.02101,"974,00173-0741-00 ",.01)
 ;;00173-0741-00
 ;;9002226.02101,"974,00173-0741-00 ",.02)
 ;;00173-0741-00
 ;;9002226.02101,"974,00173-0741-10 ",.01)
 ;;00173-0741-10
 ;;9002226.02101,"974,00173-0741-10 ",.02)
 ;;00173-0741-10
 ;;9002226.02101,"974,00182-0112-01 ",.01)
 ;;00182-0112-01
 ;;9002226.02101,"974,00182-0112-01 ",.02)
 ;;00182-0112-01
 ;;9002226.02101,"974,00182-0112-89 ",.01)
 ;;00182-0112-89
 ;;9002226.02101,"974,00182-0112-89 ",.02)
 ;;00182-0112-89
 ;;9002226.02101,"974,00182-0115-01 ",.01)
 ;;00182-0115-01
 ;;9002226.02101,"974,00182-0115-01 ",.02)
 ;;00182-0115-01
 ;;9002226.02101,"974,00182-0115-10 ",.01)
 ;;00182-0115-10
 ;;9002226.02101,"974,00182-0115-10 ",.02)
 ;;00182-0115-10
 ;;9002226.02101,"974,00182-0116-10 ",.01)
 ;;00182-0116-10
 ;;9002226.02101,"974,00182-0116-10 ",.02)
 ;;00182-0116-10
 ;;9002226.02101,"974,00182-0163-01 ",.01)
 ;;00182-0163-01
 ;;9002226.02101,"974,00182-0163-01 ",.02)
 ;;00182-0163-01
 ;;9002226.02101,"974,00182-0163-05 ",.01)
 ;;00182-0163-05
 ;;9002226.02101,"974,00182-0163-05 ",.02)
 ;;00182-0163-05
 ;;9002226.02101,"974,00182-0163-89 ",.01)
 ;;00182-0163-89
 ;;9002226.02101,"974,00182-0163-89 ",.02)
 ;;00182-0163-89
 ;;9002226.02101,"974,00182-0274-70 ",.01)
 ;;00182-0274-70
 ;;9002226.02101,"974,00182-0274-70 ",.02)
 ;;00182-0274-70
 ;;9002226.02101,"974,00182-0274-73 ",.01)
 ;;00182-0274-73
 ;;9002226.02101,"974,00182-0274-73 ",.02)
 ;;00182-0274-73
 ;;9002226.02101,"974,00182-0275-70 ",.01)
 ;;00182-0275-70
 ;;9002226.02101,"974,00182-0275-70 ",.02)
 ;;00182-0275-70
 ;;9002226.02101,"974,00182-0275-73 ",.01)
 ;;00182-0275-73
 ;;9002226.02101,"974,00182-0275-73 ",.02)
 ;;00182-0275-73
 ;;9002226.02101,"974,00182-0276-70 ",.01)
 ;;00182-0276-70
 ;;9002226.02101,"974,00182-0276-70 ",.02)
 ;;00182-0276-70
 ;;9002226.02101,"974,00182-0276-73 ",.01)
 ;;00182-0276-73
 ;;9002226.02101,"974,00182-0276-73 ",.02)
 ;;00182-0276-73
 ;;9002226.02101,"974,00182-0308-70 ",.01)
 ;;00182-0308-70
 ;;9002226.02101,"974,00182-0308-70 ",.02)
 ;;00182-0308-70
 ;;9002226.02101,"974,00182-0308-73 ",.01)
 ;;00182-0308-73
 ;;9002226.02101,"974,00182-0308-73 ",.02)
 ;;00182-0308-73
 ;;9002226.02101,"974,00182-0497-01 ",.01)
 ;;00182-0497-01
 ;;9002226.02101,"974,00182-0497-01 ",.02)
 ;;00182-0497-01
 ;;9002226.02101,"974,00182-0538-01 ",.01)
 ;;00182-0538-01
 ;;9002226.02101,"974,00182-0538-01 ",.02)
 ;;00182-0538-01
 ;;9002226.02101,"974,00182-0538-05 ",.01)
 ;;00182-0538-05
 ;;9002226.02101,"974,00182-0538-05 ",.02)
 ;;00182-0538-05
 ;;9002226.02101,"974,00182-0539-01 ",.01)
 ;;00182-0539-01
 ;;9002226.02101,"974,00182-0539-01 ",.02)
 ;;00182-0539-01
 ;;9002226.02101,"974,00182-0641-01 ",.01)
 ;;00182-0641-01
 ;;9002226.02101,"974,00182-0641-01 ",.02)
 ;;00182-0641-01
 ;;9002226.02101,"974,00182-0641-05 ",.01)
 ;;00182-0641-05
 ;;9002226.02101,"974,00182-0641-05 ",.02)
 ;;00182-0641-05
 ;;9002226.02101,"974,00182-0641-89 ",.01)
 ;;00182-0641-89
 ;;9002226.02101,"974,00182-0641-89 ",.02)
 ;;00182-0641-89
 ;;9002226.02101,"974,00182-0679-01 ",.01)
 ;;00182-0679-01
 ;;9002226.02101,"974,00182-0679-01 ",.02)
 ;;00182-0679-01
 ;;9002226.02101,"974,00182-0679-10 ",.01)
 ;;00182-0679-10
 ;;9002226.02101,"974,00182-0679-10 ",.02)
 ;;00182-0679-10
 ;;9002226.02101,"974,00182-0679-89 ",.01)
 ;;00182-0679-89
 ;;9002226.02101,"974,00182-0679-89 ",.02)
 ;;00182-0679-89
 ;;9002226.02101,"974,00182-0869-01 ",.01)
 ;;00182-0869-01
 ;;9002226.02101,"974,00182-0869-01 ",.02)
 ;;00182-0869-01
 ;;9002226.02101,"974,00182-0869-10 ",.01)
 ;;00182-0869-10
 ;;9002226.02101,"974,00182-0869-10 ",.02)
 ;;00182-0869-10
 ;;9002226.02101,"974,00182-1035-19 ",.01)
 ;;00182-1035-19
 ;;9002226.02101,"974,00182-1035-19 ",.02)
 ;;00182-1035-19
 ;;9002226.02101,"974,00182-1035-89 ",.01)
 ;;00182-1035-89
 ;;9002226.02101,"974,00182-1035-89 ",.02)
 ;;00182-1035-89
 ;;9002226.02101,"974,00182-1070-01 ",.01)
 ;;00182-1070-01
 ;;9002226.02101,"974,00182-1070-01 ",.02)
 ;;00182-1070-01
 ;;9002226.02101,"974,00182-1070-89 ",.01)
 ;;00182-1070-89
 ;;9002226.02101,"974,00182-1070-89 ",.02)
 ;;00182-1070-89
 ;;9002226.02101,"974,00182-1071-05 ",.01)
 ;;00182-1071-05
 ;;9002226.02101,"974,00182-1071-05 ",.02)
 ;;00182-1071-05
 ;;9002226.02101,"974,00182-1071-19 ",.01)
 ;;00182-1071-19
 ;;9002226.02101,"974,00182-1071-19 ",.02)
 ;;00182-1071-19
 ;;9002226.02101,"974,00182-1071-89 ",.01)
 ;;00182-1071-89
 ;;9002226.02101,"974,00182-1071-89 ",.02)
 ;;00182-1071-89
 ;;9002226.02101,"974,00182-1072-70 ",.01)
 ;;00182-1072-70
 ;;9002226.02101,"974,00182-1072-70 ",.02)
 ;;00182-1072-70
 ;;9002226.02101,"974,00182-1072-72 ",.01)
 ;;00182-1072-72
 ;;9002226.02101,"974,00182-1072-72 ",.02)
 ;;00182-1072-72
 ;;9002226.02101,"974,00182-1073-70 ",.01)
 ;;00182-1073-70
 ;;9002226.02101,"974,00182-1073-70 ",.02)
 ;;00182-1073-70
 ;;9002226.02101,"974,00182-1073-72 ",.01)
 ;;00182-1073-72
 ;;9002226.02101,"974,00182-1073-72 ",.02)
 ;;00182-1073-72
 ;;9002226.02101,"974,00182-1090-19 ",.01)
 ;;00182-1090-19
 ;;9002226.02101,"974,00182-1090-19 ",.02)
 ;;00182-1090-19
 ;;9002226.02101,"974,00182-1253-01 ",.01)
 ;;00182-1253-01
 ;;9002226.02101,"974,00182-1253-01 ",.02)
 ;;00182-1253-01
 ;;9002226.02101,"974,00182-1253-89 ",.01)
 ;;00182-1253-89
 ;;9002226.02101,"974,00182-1253-89 ",.02)
 ;;00182-1253-89
 ;;9002226.02101,"974,00182-1254-01 ",.01)
 ;;00182-1254-01
 ;;9002226.02101,"974,00182-1254-01 ",.02)
 ;;00182-1254-01
 ;;9002226.02101,"974,00182-1254-89 ",.01)
 ;;00182-1254-89
 ;;9002226.02101,"974,00182-1254-89 ",.02)
 ;;00182-1254-89
 ;;9002226.02101,"974,00182-1278-01 ",.01)
 ;;00182-1278-01
 ;;9002226.02101,"974,00182-1278-01 ",.02)
 ;;00182-1278-01
 ;;9002226.02101,"974,00182-1278-05 ",.01)
 ;;00182-1278-05
 ;;9002226.02101,"974,00182-1278-05 ",.02)
 ;;00182-1278-05
 ;;9002226.02101,"974,00182-1278-89 ",.01)
 ;;00182-1278-89
 ;;9002226.02101,"974,00182-1278-89 ",.02)
 ;;00182-1278-89
 ;;9002226.02101,"974,00182-1279-01 ",.01)
 ;;00182-1279-01
 ;;9002226.02101,"974,00182-1279-01 ",.02)
 ;;00182-1279-01
 ;;9002226.02101,"974,00182-1279-05 ",.01)
 ;;00182-1279-05
 ;;9002226.02101,"974,00182-1279-05 ",.02)
 ;;00182-1279-05
 ;;9002226.02101,"974,00182-1279-89 ",.01)
 ;;00182-1279-89
 ;;9002226.02101,"974,00182-1279-89 ",.02)
 ;;00182-1279-89
 ;;9002226.02101,"974,00182-1371-40 ",.01)
 ;;00182-1371-40
 ;;9002226.02101,"974,00182-1371-40 ",.02)
 ;;00182-1371-40
 ;;9002226.02101,"974,00182-1398-01 ",.01)
 ;;00182-1398-01
 ;;9002226.02101,"974,00182-1398-01 ",.02)
 ;;00182-1398-01
 ;;9002226.02101,"974,00182-1398-05 ",.01)
 ;;00182-1398-05
 ;;9002226.02101,"974,00182-1398-05 ",.02)
 ;;00182-1398-05
 ;;9002226.02101,"974,00182-1408-01 ",.01)
 ;;00182-1408-01
 ;;9002226.02101,"974,00182-1408-01 ",.02)
 ;;00182-1408-01
 ;;9002226.02101,"974,00182-1478-01 ",.01)
 ;;00182-1478-01
 ;;9002226.02101,"974,00182-1478-01 ",.02)
 ;;00182-1478-01
 ;;9002226.02101,"974,00182-1489-01 ",.01)
 ;;00182-1489-01
 ;;9002226.02101,"974,00182-1489-01 ",.02)
 ;;00182-1489-01
 ;;9002226.02101,"974,00182-1489-05 ",.01)
 ;;00182-1489-05
 ;;9002226.02101,"974,00182-1489-05 ",.02)
 ;;00182-1489-05
 ;;9002226.02101,"974,00182-1530-70 ",.01)
 ;;00182-1530-70
 ;;9002226.02101,"974,00182-1530-70 ",.02)
 ;;00182-1530-70
 ;;9002226.02101,"974,00182-1530-73 ",.01)
 ;;00182-1530-73
 ;;9002226.02101,"974,00182-1530-73 ",.02)
 ;;00182-1530-73
 ;;9002226.02101,"974,00182-1535-05 ",.01)
 ;;00182-1535-05
 ;;9002226.02101,"974,00182-1535-05 ",.02)
 ;;00182-1535-05
 ;;9002226.02101,"974,00182-1535-19 ",.01)
 ;;00182-1535-19
 ;;9002226.02101,"974,00182-1535-19 ",.02)
 ;;00182-1535-19
 ;;9002226.02101,"974,00182-1535-89 ",.01)
 ;;00182-1535-89
 ;;9002226.02101,"974,00182-1535-89 ",.02)
 ;;00182-1535-89
 ;;9002226.02101,"974,00182-1536-01 ",.01)
 ;;00182-1536-01
 ;;9002226.02101,"974,00182-1536-01 ",.02)
 ;;00182-1536-01
 ;;9002226.02101,"974,00182-1537-01 ",.01)
 ;;00182-1537-01
 ;;9002226.02101,"974,00182-1537-01 ",.02)
 ;;00182-1537-01
