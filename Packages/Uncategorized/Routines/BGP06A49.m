BGP06A49 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"974,54868-1171-01 ",.01)
 ;;54868-1171-01
 ;;9002226.02101,"974,54868-1171-01 ",.02)
 ;;54868-1171-01
 ;;9002226.02101,"974,54868-1171-03 ",.01)
 ;;54868-1171-03
 ;;9002226.02101,"974,54868-1171-03 ",.02)
 ;;54868-1171-03
 ;;9002226.02101,"974,54868-1173-00 ",.01)
 ;;54868-1173-00
 ;;9002226.02101,"974,54868-1173-00 ",.02)
 ;;54868-1173-00
 ;;9002226.02101,"974,54868-1173-01 ",.01)
 ;;54868-1173-01
 ;;9002226.02101,"974,54868-1173-01 ",.02)
 ;;54868-1173-01
 ;;9002226.02101,"974,54868-1173-02 ",.01)
 ;;54868-1173-02
 ;;9002226.02101,"974,54868-1173-02 ",.02)
 ;;54868-1173-02
 ;;9002226.02101,"974,54868-1173-04 ",.01)
 ;;54868-1173-04
 ;;9002226.02101,"974,54868-1173-04 ",.02)
 ;;54868-1173-04
 ;;9002226.02101,"974,54868-1173-05 ",.01)
 ;;54868-1173-05
 ;;9002226.02101,"974,54868-1173-05 ",.02)
 ;;54868-1173-05
 ;;9002226.02101,"974,54868-1173-06 ",.01)
 ;;54868-1173-06
 ;;9002226.02101,"974,54868-1173-06 ",.02)
 ;;54868-1173-06
 ;;9002226.02101,"974,54868-1184-01 ",.01)
 ;;54868-1184-01
 ;;9002226.02101,"974,54868-1184-01 ",.02)
 ;;54868-1184-01
 ;;9002226.02101,"974,54868-1184-02 ",.01)
 ;;54868-1184-02
 ;;9002226.02101,"974,54868-1184-02 ",.02)
 ;;54868-1184-02
 ;;9002226.02101,"974,54868-1184-03 ",.01)
 ;;54868-1184-03
 ;;9002226.02101,"974,54868-1184-03 ",.02)
 ;;54868-1184-03
 ;;9002226.02101,"974,54868-1231-00 ",.01)
 ;;54868-1231-00
 ;;9002226.02101,"974,54868-1231-00 ",.02)
 ;;54868-1231-00
 ;;9002226.02101,"974,54868-1380-00 ",.01)
 ;;54868-1380-00
 ;;9002226.02101,"974,54868-1380-00 ",.02)
 ;;54868-1380-00
 ;;9002226.02101,"974,54868-1380-01 ",.01)
 ;;54868-1380-01
 ;;9002226.02101,"974,54868-1380-01 ",.02)
 ;;54868-1380-01
 ;;9002226.02101,"974,54868-1380-02 ",.01)
 ;;54868-1380-02
 ;;9002226.02101,"974,54868-1380-02 ",.02)
 ;;54868-1380-02
 ;;9002226.02101,"974,54868-1380-03 ",.01)
 ;;54868-1380-03
 ;;9002226.02101,"974,54868-1380-03 ",.02)
 ;;54868-1380-03
 ;;9002226.02101,"974,54868-1383-00 ",.01)
 ;;54868-1383-00
 ;;9002226.02101,"974,54868-1383-00 ",.02)
 ;;54868-1383-00
 ;;9002226.02101,"974,54868-1384-01 ",.01)
 ;;54868-1384-01
 ;;9002226.02101,"974,54868-1384-01 ",.02)
 ;;54868-1384-01
 ;;9002226.02101,"974,54868-1384-02 ",.01)
 ;;54868-1384-02
 ;;9002226.02101,"974,54868-1384-02 ",.02)
 ;;54868-1384-02
 ;;9002226.02101,"974,54868-1385-01 ",.01)
 ;;54868-1385-01
 ;;9002226.02101,"974,54868-1385-01 ",.02)
 ;;54868-1385-01
 ;;9002226.02101,"974,54868-1385-02 ",.01)
 ;;54868-1385-02
 ;;9002226.02101,"974,54868-1385-02 ",.02)
 ;;54868-1385-02
 ;;9002226.02101,"974,54868-1386-01 ",.01)
 ;;54868-1386-01
 ;;9002226.02101,"974,54868-1386-01 ",.02)
 ;;54868-1386-01
 ;;9002226.02101,"974,54868-1386-02 ",.01)
 ;;54868-1386-02
 ;;9002226.02101,"974,54868-1386-02 ",.02)
 ;;54868-1386-02
 ;;9002226.02101,"974,54868-1386-03 ",.01)
 ;;54868-1386-03
 ;;9002226.02101,"974,54868-1386-03 ",.02)
 ;;54868-1386-03
 ;;9002226.02101,"974,54868-1386-04 ",.01)
 ;;54868-1386-04
 ;;9002226.02101,"974,54868-1386-04 ",.02)
 ;;54868-1386-04
 ;;9002226.02101,"974,54868-1387-00 ",.01)
 ;;54868-1387-00
 ;;9002226.02101,"974,54868-1387-00 ",.02)
 ;;54868-1387-00
 ;;9002226.02101,"974,54868-1387-01 ",.01)
 ;;54868-1387-01
 ;;9002226.02101,"974,54868-1387-01 ",.02)
 ;;54868-1387-01
 ;;9002226.02101,"974,54868-1387-04 ",.01)
 ;;54868-1387-04
 ;;9002226.02101,"974,54868-1387-04 ",.02)
 ;;54868-1387-04
 ;;9002226.02101,"974,54868-1392-00 ",.01)
 ;;54868-1392-00
 ;;9002226.02101,"974,54868-1392-00 ",.02)
 ;;54868-1392-00
 ;;9002226.02101,"974,54868-1420-01 ",.01)
 ;;54868-1420-01
 ;;9002226.02101,"974,54868-1420-01 ",.02)
 ;;54868-1420-01
 ;;9002226.02101,"974,54868-1426-01 ",.01)
 ;;54868-1426-01
 ;;9002226.02101,"974,54868-1426-01 ",.02)
 ;;54868-1426-01
 ;;9002226.02101,"974,54868-1535-00 ",.01)
 ;;54868-1535-00
 ;;9002226.02101,"974,54868-1535-00 ",.02)
 ;;54868-1535-00
 ;;9002226.02101,"974,54868-1710-00 ",.01)
 ;;54868-1710-00
 ;;9002226.02101,"974,54868-1710-00 ",.02)
 ;;54868-1710-00
 ;;9002226.02101,"974,54868-1772-00 ",.01)
 ;;54868-1772-00
 ;;9002226.02101,"974,54868-1772-00 ",.02)
 ;;54868-1772-00
 ;;9002226.02101,"974,54868-1772-02 ",.01)
 ;;54868-1772-02
 ;;9002226.02101,"974,54868-1772-02 ",.02)
 ;;54868-1772-02
 ;;9002226.02101,"974,54868-1774-00 ",.01)
 ;;54868-1774-00
 ;;9002226.02101,"974,54868-1774-00 ",.02)
 ;;54868-1774-00
 ;;9002226.02101,"974,54868-1774-02 ",.01)
 ;;54868-1774-02
 ;;9002226.02101,"974,54868-1774-02 ",.02)
 ;;54868-1774-02
 ;;9002226.02101,"974,54868-1780-01 ",.01)
 ;;54868-1780-01
 ;;9002226.02101,"974,54868-1780-01 ",.02)
 ;;54868-1780-01
 ;;9002226.02101,"974,54868-1780-02 ",.01)
 ;;54868-1780-02
 ;;9002226.02101,"974,54868-1780-02 ",.02)
 ;;54868-1780-02
 ;;9002226.02101,"974,54868-1857-00 ",.01)
 ;;54868-1857-00
 ;;9002226.02101,"974,54868-1857-00 ",.02)
 ;;54868-1857-00
 ;;9002226.02101,"974,54868-1857-01 ",.01)
 ;;54868-1857-01
 ;;9002226.02101,"974,54868-1857-01 ",.02)
 ;;54868-1857-01
 ;;9002226.02101,"974,54868-1857-02 ",.01)
 ;;54868-1857-02
 ;;9002226.02101,"974,54868-1857-02 ",.02)
 ;;54868-1857-02
 ;;9002226.02101,"974,54868-1857-06 ",.01)
 ;;54868-1857-06
 ;;9002226.02101,"974,54868-1857-06 ",.02)
 ;;54868-1857-06
 ;;9002226.02101,"974,54868-1865-01 ",.01)
 ;;54868-1865-01
 ;;9002226.02101,"974,54868-1865-01 ",.02)
 ;;54868-1865-01
 ;;9002226.02101,"974,54868-1865-02 ",.01)
 ;;54868-1865-02
 ;;9002226.02101,"974,54868-1865-02 ",.02)
 ;;54868-1865-02
 ;;9002226.02101,"974,54868-1865-03 ",.01)
 ;;54868-1865-03
 ;;9002226.02101,"974,54868-1865-03 ",.02)
 ;;54868-1865-03
 ;;9002226.02101,"974,54868-1886-00 ",.01)
 ;;54868-1886-00
 ;;9002226.02101,"974,54868-1886-00 ",.02)
 ;;54868-1886-00
 ;;9002226.02101,"974,54868-1887-00 ",.01)
 ;;54868-1887-00
 ;;9002226.02101,"974,54868-1887-00 ",.02)
 ;;54868-1887-00
 ;;9002226.02101,"974,54868-1887-01 ",.01)
 ;;54868-1887-01
 ;;9002226.02101,"974,54868-1887-01 ",.02)
 ;;54868-1887-01
 ;;9002226.02101,"974,54868-1997-01 ",.01)
 ;;54868-1997-01
 ;;9002226.02101,"974,54868-1997-01 ",.02)
 ;;54868-1997-01
 ;;9002226.02101,"974,54868-2016-00 ",.01)
 ;;54868-2016-00
 ;;9002226.02101,"974,54868-2016-00 ",.02)
 ;;54868-2016-00
 ;;9002226.02101,"974,54868-2017-00 ",.01)
 ;;54868-2017-00
 ;;9002226.02101,"974,54868-2017-00 ",.02)
 ;;54868-2017-00
 ;;9002226.02101,"974,54868-2017-01 ",.01)
 ;;54868-2017-01
 ;;9002226.02101,"974,54868-2017-01 ",.02)
 ;;54868-2017-01
 ;;9002226.02101,"974,54868-2201-01 ",.01)
 ;;54868-2201-01
 ;;9002226.02101,"974,54868-2201-01 ",.02)
 ;;54868-2201-01
 ;;9002226.02101,"974,54868-2391-01 ",.01)
 ;;54868-2391-01
 ;;9002226.02101,"974,54868-2391-01 ",.02)
 ;;54868-2391-01
 ;;9002226.02101,"974,54868-2391-02 ",.01)
 ;;54868-2391-02
 ;;9002226.02101,"974,54868-2391-02 ",.02)
 ;;54868-2391-02
 ;;9002226.02101,"974,54868-2444-00 ",.01)
 ;;54868-2444-00
 ;;9002226.02101,"974,54868-2444-00 ",.02)
 ;;54868-2444-00
 ;;9002226.02101,"974,54868-2488-01 ",.01)
 ;;54868-2488-01
 ;;9002226.02101,"974,54868-2488-01 ",.02)
 ;;54868-2488-01
 ;;9002226.02101,"974,54868-2641-00 ",.01)
 ;;54868-2641-00
 ;;9002226.02101,"974,54868-2641-00 ",.02)
 ;;54868-2641-00
 ;;9002226.02101,"974,54868-2641-02 ",.01)
 ;;54868-2641-02
 ;;9002226.02101,"974,54868-2641-02 ",.02)
 ;;54868-2641-02
 ;;9002226.02101,"974,54868-2641-03 ",.01)
 ;;54868-2641-03
 ;;9002226.02101,"974,54868-2641-03 ",.02)
 ;;54868-2641-03
 ;;9002226.02101,"974,54868-2805-00 ",.01)
 ;;54868-2805-00
 ;;9002226.02101,"974,54868-2805-00 ",.02)
 ;;54868-2805-00
 ;;9002226.02101,"974,54868-2910-00 ",.01)
 ;;54868-2910-00
 ;;9002226.02101,"974,54868-2910-00 ",.02)
 ;;54868-2910-00
 ;;9002226.02101,"974,54868-2927-00 ",.01)
 ;;54868-2927-00
 ;;9002226.02101,"974,54868-2927-00 ",.02)
 ;;54868-2927-00
 ;;9002226.02101,"974,54868-3016-00 ",.01)
 ;;54868-3016-00
 ;;9002226.02101,"974,54868-3016-00 ",.02)
 ;;54868-3016-00
 ;;9002226.02101,"974,54868-3016-01 ",.01)
 ;;54868-3016-01
 ;;9002226.02101,"974,54868-3016-01 ",.02)
 ;;54868-3016-01
 ;;9002226.02101,"974,54868-3105-00 ",.01)
 ;;54868-3105-00
 ;;9002226.02101,"974,54868-3105-00 ",.02)
 ;;54868-3105-00
 ;;9002226.02101,"974,54868-3105-01 ",.01)
 ;;54868-3105-01
 ;;9002226.02101,"974,54868-3105-01 ",.02)
 ;;54868-3105-01
 ;;9002226.02101,"974,54868-3105-02 ",.01)
 ;;54868-3105-02
 ;;9002226.02101,"974,54868-3105-02 ",.02)
 ;;54868-3105-02
 ;;9002226.02101,"974,54868-3107-00 ",.01)
 ;;54868-3107-00
 ;;9002226.02101,"974,54868-3107-00 ",.02)
 ;;54868-3107-00
 ;;9002226.02101,"974,54868-3107-01 ",.01)
 ;;54868-3107-01
 ;;9002226.02101,"974,54868-3107-01 ",.02)
 ;;54868-3107-01
 ;;9002226.02101,"974,54868-3107-02 ",.01)
 ;;54868-3107-02
 ;;9002226.02101,"974,54868-3107-02 ",.02)
 ;;54868-3107-02
 ;;9002226.02101,"974,54868-3107-03 ",.01)
 ;;54868-3107-03
 ;;9002226.02101,"974,54868-3107-03 ",.02)
 ;;54868-3107-03
 ;;9002226.02101,"974,54868-3107-07 ",.01)
 ;;54868-3107-07
 ;;9002226.02101,"974,54868-3107-07 ",.02)
 ;;54868-3107-07
 ;;9002226.02101,"974,54868-3107-08 ",.01)
 ;;54868-3107-08
 ;;9002226.02101,"974,54868-3107-08 ",.02)
 ;;54868-3107-08
 ;;9002226.02101,"974,54868-3107-09 ",.01)
 ;;54868-3107-09
 ;;9002226.02101,"974,54868-3107-09 ",.02)
 ;;54868-3107-09
 ;;9002226.02101,"974,54868-3109-00 ",.01)
 ;;54868-3109-00
 ;;9002226.02101,"974,54868-3109-00 ",.02)
 ;;54868-3109-00
 ;;9002226.02101,"974,54868-3109-01 ",.01)
 ;;54868-3109-01
 ;;9002226.02101,"974,54868-3109-01 ",.02)
 ;;54868-3109-01
 ;;9002226.02101,"974,54868-3109-02 ",.01)
 ;;54868-3109-02
 ;;9002226.02101,"974,54868-3109-02 ",.02)
 ;;54868-3109-02
 ;;9002226.02101,"974,54868-3109-04 ",.01)
 ;;54868-3109-04
 ;;9002226.02101,"974,54868-3109-04 ",.02)
 ;;54868-3109-04
 ;;9002226.02101,"974,54868-3109-06 ",.01)
 ;;54868-3109-06
 ;;9002226.02101,"974,54868-3109-06 ",.02)
 ;;54868-3109-06
 ;;9002226.02101,"974,54868-3109-07 ",.01)
 ;;54868-3109-07
 ;;9002226.02101,"974,54868-3109-07 ",.02)
 ;;54868-3109-07
 ;;9002226.02101,"974,54868-3109-08 ",.01)
 ;;54868-3109-08
 ;;9002226.02101,"974,54868-3109-08 ",.02)
 ;;54868-3109-08
 ;;9002226.02101,"974,54868-3109-09 ",.01)
 ;;54868-3109-09
 ;;9002226.02101,"974,54868-3109-09 ",.02)
 ;;54868-3109-09
 ;;9002226.02101,"974,54868-3111-00 ",.01)
 ;;54868-3111-00
 ;;9002226.02101,"974,54868-3111-00 ",.02)
 ;;54868-3111-00
 ;;9002226.02101,"974,54868-3111-01 ",.01)
 ;;54868-3111-01
 ;;9002226.02101,"974,54868-3111-01 ",.02)
 ;;54868-3111-01
 ;;9002226.02101,"974,54868-3111-03 ",.01)
 ;;54868-3111-03
 ;;9002226.02101,"974,54868-3111-03 ",.02)
 ;;54868-3111-03
 ;;9002226.02101,"974,54868-3111-05 ",.01)
 ;;54868-3111-05
 ;;9002226.02101,"974,54868-3111-05 ",.02)
 ;;54868-3111-05
 ;;9002226.02101,"974,54868-3113-00 ",.01)
 ;;54868-3113-00
 ;;9002226.02101,"974,54868-3113-00 ",.02)
 ;;54868-3113-00
 ;;9002226.02101,"974,54868-3113-01 ",.01)
 ;;54868-3113-01
 ;;9002226.02101,"974,54868-3113-01 ",.02)
 ;;54868-3113-01
 ;;9002226.02101,"974,54868-3113-03 ",.01)
 ;;54868-3113-03
 ;;9002226.02101,"974,54868-3113-03 ",.02)
 ;;54868-3113-03
 ;;9002226.02101,"974,54868-3113-05 ",.01)
 ;;54868-3113-05
 ;;9002226.02101,"974,54868-3113-05 ",.02)
 ;;54868-3113-05
 ;;9002226.02101,"974,54868-3113-07 ",.01)
 ;;54868-3113-07
 ;;9002226.02101,"974,54868-3113-07 ",.02)
 ;;54868-3113-07
 ;;9002226.02101,"974,54868-3113-08 ",.01)
 ;;54868-3113-08
 ;;9002226.02101,"974,54868-3113-08 ",.02)
 ;;54868-3113-08
 ;;9002226.02101,"974,54868-3113-09 ",.01)
 ;;54868-3113-09
 ;;9002226.02101,"974,54868-3113-09 ",.02)
 ;;54868-3113-09
 ;;9002226.02101,"974,54868-3169-00 ",.01)
 ;;54868-3169-00
 ;;9002226.02101,"974,54868-3169-00 ",.02)
 ;;54868-3169-00
 ;;9002226.02101,"974,54868-3169-01 ",.01)
 ;;54868-3169-01
 ;;9002226.02101,"974,54868-3169-01 ",.02)
 ;;54868-3169-01
 ;;9002226.02101,"974,54868-3169-02 ",.01)
 ;;54868-3169-02
 ;;9002226.02101,"974,54868-3169-02 ",.02)
 ;;54868-3169-02
 ;;9002226.02101,"974,54868-3169-04 ",.01)
 ;;54868-3169-04
 ;;9002226.02101,"974,54868-3169-04 ",.02)
 ;;54868-3169-04
 ;;9002226.02101,"974,54868-3221-00 ",.01)
 ;;54868-3221-00
 ;;9002226.02101,"974,54868-3221-00 ",.02)
 ;;54868-3221-00
 ;;9002226.02101,"974,54868-3221-01 ",.01)
 ;;54868-3221-01
 ;;9002226.02101,"974,54868-3221-01 ",.02)
 ;;54868-3221-01
 ;;9002226.02101,"974,54868-3244-00 ",.01)
 ;;54868-3244-00
 ;;9002226.02101,"974,54868-3244-00 ",.02)
 ;;54868-3244-00
 ;;9002226.02101,"974,54868-3343-00 ",.01)
 ;;54868-3343-00
 ;;9002226.02101,"974,54868-3343-00 ",.02)
 ;;54868-3343-00
 ;;9002226.02101,"974,54868-3343-01 ",.01)
 ;;54868-3343-01
 ;;9002226.02101,"974,54868-3343-01 ",.02)
 ;;54868-3343-01
 ;;9002226.02101,"974,54868-3424-00 ",.01)
 ;;54868-3424-00
 ;;9002226.02101,"974,54868-3424-00 ",.02)
 ;;54868-3424-00
 ;;9002226.02101,"974,54868-3472-00 ",.01)
 ;;54868-3472-00
 ;;9002226.02101,"974,54868-3472-00 ",.02)
 ;;54868-3472-00
 ;;9002226.02101,"974,54868-3473-00 ",.01)
 ;;54868-3473-00
 ;;9002226.02101,"974,54868-3473-00 ",.02)
 ;;54868-3473-00
 ;;9002226.02101,"974,54868-3478-00 ",.01)
 ;;54868-3478-00
 ;;9002226.02101,"974,54868-3478-00 ",.02)
 ;;54868-3478-00
 ;;9002226.02101,"974,54868-3478-01 ",.01)
 ;;54868-3478-01
 ;;9002226.02101,"974,54868-3478-01 ",.02)
 ;;54868-3478-01
 ;;9002226.02101,"974,54868-3478-02 ",.01)
 ;;54868-3478-02
 ;;9002226.02101,"974,54868-3478-02 ",.02)
 ;;54868-3478-02
 ;;9002226.02101,"974,54868-3478-03 ",.01)
 ;;54868-3478-03
 ;;9002226.02101,"974,54868-3478-03 ",.02)
 ;;54868-3478-03
