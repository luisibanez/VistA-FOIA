BGP7LXLO ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON AUG 29, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"629,54868-1253-02 ",.01)
 ;;54868-1253-02
 ;;9002226.02101,"629,54868-1253-02 ",.02)
 ;;54868-1253-02
 ;;9002226.02101,"629,54868-1534-00 ",.01)
 ;;54868-1534-00
 ;;9002226.02101,"629,54868-1534-00 ",.02)
 ;;54868-1534-00
 ;;9002226.02101,"629,54868-1746-00 ",.01)
 ;;54868-1746-00
 ;;9002226.02101,"629,54868-1746-00 ",.02)
 ;;54868-1746-00
 ;;9002226.02101,"629,54868-1826-01 ",.01)
 ;;54868-1826-01
 ;;9002226.02101,"629,54868-1826-01 ",.02)
 ;;54868-1826-01
 ;;9002226.02101,"629,54868-2206-00 ",.01)
 ;;54868-2206-00
 ;;9002226.02101,"629,54868-2206-00 ",.02)
 ;;54868-2206-00
 ;;9002226.02101,"629,54868-2956-00 ",.01)
 ;;54868-2956-00
 ;;9002226.02101,"629,54868-2956-00 ",.02)
 ;;54868-2956-00
 ;;9002226.02101,"629,54868-2956-01 ",.01)
 ;;54868-2956-01
 ;;9002226.02101,"629,54868-2956-01 ",.02)
 ;;54868-2956-01
 ;;9002226.02101,"629,54868-2956-03 ",.01)
 ;;54868-2956-03
 ;;9002226.02101,"629,54868-2956-03 ",.02)
 ;;54868-2956-03
 ;;9002226.02101,"629,54868-2956-04 ",.01)
 ;;54868-2956-04
 ;;9002226.02101,"629,54868-2956-04 ",.02)
 ;;54868-2956-04
 ;;9002226.02101,"629,54868-2956-05 ",.01)
 ;;54868-2956-05
 ;;9002226.02101,"629,54868-2956-05 ",.02)
 ;;54868-2956-05
 ;;9002226.02101,"629,54868-4102-00 ",.01)
 ;;54868-4102-00
 ;;9002226.02101,"629,54868-4102-00 ",.02)
 ;;54868-4102-00
 ;;9002226.02101,"629,54868-4102-01 ",.01)
 ;;54868-4102-01
 ;;9002226.02101,"629,54868-4102-01 ",.02)
 ;;54868-4102-01
 ;;9002226.02101,"629,54868-4102-02 ",.01)
 ;;54868-4102-02
 ;;9002226.02101,"629,54868-4102-02 ",.02)
 ;;54868-4102-02
 ;;9002226.02101,"629,54868-4102-03 ",.01)
 ;;54868-4102-03
 ;;9002226.02101,"629,54868-4102-03 ",.02)
 ;;54868-4102-03
 ;;9002226.02101,"629,54868-4102-04 ",.01)
 ;;54868-4102-04
 ;;9002226.02101,"629,54868-4102-04 ",.02)
 ;;54868-4102-04
 ;;9002226.02101,"629,54868-4733-00 ",.01)
 ;;54868-4733-00
 ;;9002226.02101,"629,54868-4733-00 ",.02)
 ;;54868-4733-00
 ;;9002226.02101,"629,54868-4733-01 ",.01)
 ;;54868-4733-01
 ;;9002226.02101,"629,54868-4733-01 ",.02)
 ;;54868-4733-01
 ;;9002226.02101,"629,54868-4733-02 ",.01)
 ;;54868-4733-02
 ;;9002226.02101,"629,54868-4733-02 ",.02)
 ;;54868-4733-02
 ;;9002226.02101,"629,54868-4733-03 ",.01)
 ;;54868-4733-03
 ;;9002226.02101,"629,54868-4733-03 ",.02)
 ;;54868-4733-03
 ;;9002226.02101,"629,54868-4733-04 ",.01)
 ;;54868-4733-04
 ;;9002226.02101,"629,54868-4733-04 ",.02)
 ;;54868-4733-04
 ;;9002226.02101,"629,54868-4733-05 ",.01)
 ;;54868-4733-05
 ;;9002226.02101,"629,54868-4733-05 ",.02)
 ;;54868-4733-05
 ;;9002226.02101,"629,54868-4733-06 ",.01)
 ;;54868-4733-06
 ;;9002226.02101,"629,54868-4733-06 ",.02)
 ;;54868-4733-06
 ;;9002226.02101,"629,54868-4979-00 ",.01)
 ;;54868-4979-00
 ;;9002226.02101,"629,54868-4979-00 ",.02)
 ;;54868-4979-00
 ;;9002226.02101,"629,54868-4979-01 ",.01)
 ;;54868-4979-01
 ;;9002226.02101,"629,54868-4979-01 ",.02)
 ;;54868-4979-01
 ;;9002226.02101,"629,54868-4982-01 ",.01)
 ;;54868-4982-01
 ;;9002226.02101,"629,54868-4982-01 ",.02)
 ;;54868-4982-01
 ;;9002226.02101,"629,54868-5073-00 ",.01)
 ;;54868-5073-00
 ;;9002226.02101,"629,54868-5073-00 ",.02)
 ;;54868-5073-00
 ;;9002226.02101,"629,54868-5073-01 ",.01)
 ;;54868-5073-01
 ;;9002226.02101,"629,54868-5073-01 ",.02)
 ;;54868-5073-01
 ;;9002226.02101,"629,54868-5073-02 ",.01)
 ;;54868-5073-02
 ;;9002226.02101,"629,54868-5073-02 ",.02)
 ;;54868-5073-02
 ;;9002226.02101,"629,54868-5073-03 ",.01)
 ;;54868-5073-03
 ;;9002226.02101,"629,54868-5073-03 ",.02)
 ;;54868-5073-03
 ;;9002226.02101,"629,54868-5159-00 ",.01)
 ;;54868-5159-00
 ;;9002226.02101,"629,54868-5159-00 ",.02)
 ;;54868-5159-00
 ;;9002226.02101,"629,55045-1325-05 ",.01)
 ;;55045-1325-05
 ;;9002226.02101,"629,55045-1325-05 ",.02)
 ;;55045-1325-05
 ;;9002226.02101,"629,55045-1325-07 ",.01)
 ;;55045-1325-07
 ;;9002226.02101,"629,55045-1325-07 ",.02)
 ;;55045-1325-07
 ;;9002226.02101,"629,55045-1325-08 ",.01)
 ;;55045-1325-08
 ;;9002226.02101,"629,55045-1325-08 ",.02)
 ;;55045-1325-08
 ;;9002226.02101,"629,55045-1386-00 ",.01)
 ;;55045-1386-00
 ;;9002226.02101,"629,55045-1386-00 ",.02)
 ;;55045-1386-00
 ;;9002226.02101,"629,55045-1386-02 ",.01)
 ;;55045-1386-02
 ;;9002226.02101,"629,55045-1386-02 ",.02)
 ;;55045-1386-02
 ;;9002226.02101,"629,55045-1386-04 ",.01)
 ;;55045-1386-04
 ;;9002226.02101,"629,55045-1386-04 ",.02)
 ;;55045-1386-04
 ;;9002226.02101,"629,55045-1386-07 ",.01)
 ;;55045-1386-07
 ;;9002226.02101,"629,55045-1386-07 ",.02)
 ;;55045-1386-07
 ;;9002226.02101,"629,55045-1386-08 ",.01)
 ;;55045-1386-08
 ;;9002226.02101,"629,55045-1386-08 ",.02)
 ;;55045-1386-08
 ;;9002226.02101,"629,55045-1386-09 ",.01)
 ;;55045-1386-09
 ;;9002226.02101,"629,55045-1386-09 ",.02)
 ;;55045-1386-09
 ;;9002226.02101,"629,55045-1433-01 ",.01)
 ;;55045-1433-01
 ;;9002226.02101,"629,55045-1433-01 ",.02)
 ;;55045-1433-01
 ;;9002226.02101,"629,55045-1433-02 ",.01)
 ;;55045-1433-02
 ;;9002226.02101,"629,55045-1433-02 ",.02)
 ;;55045-1433-02
 ;;9002226.02101,"629,55045-1433-03 ",.01)
 ;;55045-1433-03
 ;;9002226.02101,"629,55045-1433-03 ",.02)
 ;;55045-1433-03
 ;;9002226.02101,"629,55045-1433-05 ",.01)
 ;;55045-1433-05
 ;;9002226.02101,"629,55045-1433-05 ",.02)
 ;;55045-1433-05
 ;;9002226.02101,"629,55045-1493-08 ",.01)
 ;;55045-1493-08
 ;;9002226.02101,"629,55045-1493-08 ",.02)
 ;;55045-1493-08
 ;;9002226.02101,"629,55045-1531-01 ",.01)
 ;;55045-1531-01
 ;;9002226.02101,"629,55045-1531-01 ",.02)
 ;;55045-1531-01
 ;;9002226.02101,"629,55045-1531-03 ",.01)
 ;;55045-1531-03
 ;;9002226.02101,"629,55045-1531-03 ",.02)
 ;;55045-1531-03
 ;;9002226.02101,"629,55045-1531-08 ",.01)
 ;;55045-1531-08
 ;;9002226.02101,"629,55045-1531-08 ",.02)
 ;;55045-1531-08
 ;;9002226.02101,"629,55045-1531-09 ",.01)
 ;;55045-1531-09
 ;;9002226.02101,"629,55045-1531-09 ",.02)
 ;;55045-1531-09
 ;;9002226.02101,"629,55045-1566-00 ",.01)
 ;;55045-1566-00
 ;;9002226.02101,"629,55045-1566-00 ",.02)
 ;;55045-1566-00
 ;;9002226.02101,"629,55045-1566-01 ",.01)
 ;;55045-1566-01
 ;;9002226.02101,"629,55045-1566-01 ",.02)
 ;;55045-1566-01
 ;;9002226.02101,"629,55045-1566-02 ",.01)
 ;;55045-1566-02
 ;;9002226.02101,"629,55045-1566-02 ",.02)
 ;;55045-1566-02
 ;;9002226.02101,"629,55045-1566-03 ",.01)
 ;;55045-1566-03
 ;;9002226.02101,"629,55045-1566-03 ",.02)
 ;;55045-1566-03
 ;;9002226.02101,"629,55045-1566-06 ",.01)
 ;;55045-1566-06
 ;;9002226.02101,"629,55045-1566-06 ",.02)
 ;;55045-1566-06
 ;;9002226.02101,"629,55045-1566-09 ",.01)
 ;;55045-1566-09
 ;;9002226.02101,"629,55045-1566-09 ",.02)
 ;;55045-1566-09
 ;;9002226.02101,"629,55045-1586-08 ",.01)
 ;;55045-1586-08
 ;;9002226.02101,"629,55045-1586-08 ",.02)
 ;;55045-1586-08
 ;;9002226.02101,"629,55045-1594-03 ",.01)
 ;;55045-1594-03
 ;;9002226.02101,"629,55045-1594-03 ",.02)
 ;;55045-1594-03
 ;;9002226.02101,"629,55045-1594-04 ",.01)
 ;;55045-1594-04
 ;;9002226.02101,"629,55045-1594-04 ",.02)
 ;;55045-1594-04
 ;;9002226.02101,"629,55045-1594-06 ",.01)
 ;;55045-1594-06
 ;;9002226.02101,"629,55045-1594-06 ",.02)
 ;;55045-1594-06
 ;;9002226.02101,"629,55045-1594-07 ",.01)
 ;;55045-1594-07
 ;;9002226.02101,"629,55045-1594-07 ",.02)
 ;;55045-1594-07
 ;;9002226.02101,"629,55045-1594-08 ",.01)
 ;;55045-1594-08
 ;;9002226.02101,"629,55045-1594-08 ",.02)
 ;;55045-1594-08
 ;;9002226.02101,"629,55045-1594-09 ",.01)
 ;;55045-1594-09
 ;;9002226.02101,"629,55045-1594-09 ",.02)
 ;;55045-1594-09
 ;;9002226.02101,"629,55045-1598-00 ",.01)
 ;;55045-1598-00
 ;;9002226.02101,"629,55045-1598-00 ",.02)
 ;;55045-1598-00
 ;;9002226.02101,"629,55045-1598-03 ",.01)
 ;;55045-1598-03
 ;;9002226.02101,"629,55045-1598-03 ",.02)
 ;;55045-1598-03
 ;;9002226.02101,"629,55045-1598-05 ",.01)
 ;;55045-1598-05
 ;;9002226.02101,"629,55045-1598-05 ",.02)
 ;;55045-1598-05
 ;;9002226.02101,"629,55045-1598-06 ",.01)
 ;;55045-1598-06
 ;;9002226.02101,"629,55045-1598-06 ",.02)
 ;;55045-1598-06
 ;;9002226.02101,"629,55045-1598-07 ",.01)
 ;;55045-1598-07
 ;;9002226.02101,"629,55045-1598-07 ",.02)
 ;;55045-1598-07
 ;;9002226.02101,"629,55045-1598-08 ",.01)
 ;;55045-1598-08
 ;;9002226.02101,"629,55045-1598-08 ",.02)
 ;;55045-1598-08
 ;;9002226.02101,"629,55045-1598-09 ",.01)
 ;;55045-1598-09
 ;;9002226.02101,"629,55045-1598-09 ",.02)
 ;;55045-1598-09
 ;;9002226.02101,"629,55045-1620-09 ",.01)
 ;;55045-1620-09
 ;;9002226.02101,"629,55045-1620-09 ",.02)
 ;;55045-1620-09
 ;;9002226.02101,"629,55045-1637-05 ",.01)
 ;;55045-1637-05
 ;;9002226.02101,"629,55045-1637-05 ",.02)
 ;;55045-1637-05
 ;;9002226.02101,"629,55045-1690-04 ",.01)
 ;;55045-1690-04
 ;;9002226.02101,"629,55045-1690-04 ",.02)
 ;;55045-1690-04
 ;;9002226.02101,"629,55045-2777-06 ",.01)
 ;;55045-2777-06
 ;;9002226.02101,"629,55045-2777-06 ",.02)
 ;;55045-2777-06
 ;;9002226.02101,"629,55045-2777-08 ",.01)
 ;;55045-2777-08
 ;;9002226.02101,"629,55045-2777-08 ",.02)
 ;;55045-2777-08
 ;;9002226.02101,"629,55045-2972-05 ",.01)
 ;;55045-2972-05
 ;;9002226.02101,"629,55045-2972-05 ",.02)
 ;;55045-2972-05
 ;;9002226.02101,"629,55045-2972-06 ",.01)
 ;;55045-2972-06
 ;;9002226.02101,"629,55045-2972-06 ",.02)
 ;;55045-2972-06
 ;;9002226.02101,"629,55045-2972-07 ",.01)
 ;;55045-2972-07
 ;;9002226.02101,"629,55045-2972-07 ",.02)
 ;;55045-2972-07
 ;;9002226.02101,"629,55045-2972-08 ",.01)
 ;;55045-2972-08
 ;;9002226.02101,"629,55045-2972-08 ",.02)
 ;;55045-2972-08
 ;;9002226.02101,"629,55175-0587-00 ",.01)
 ;;55175-0587-00
 ;;9002226.02101,"629,55175-0587-00 ",.02)
 ;;55175-0587-00
 ;;9002226.02101,"629,55175-0587-01 ",.01)
 ;;55175-0587-01
 ;;9002226.02101,"629,55175-0587-01 ",.02)
 ;;55175-0587-01
 ;;9002226.02101,"629,55175-0587-02 ",.01)
 ;;55175-0587-02
 ;;9002226.02101,"629,55175-0587-02 ",.02)
 ;;55175-0587-02
 ;;9002226.02101,"629,55175-0587-03 ",.01)
 ;;55175-0587-03
 ;;9002226.02101,"629,55175-0587-03 ",.02)
 ;;55175-0587-03
 ;;9002226.02101,"629,55175-0587-04 ",.01)
 ;;55175-0587-04
 ;;9002226.02101,"629,55175-0587-04 ",.02)
 ;;55175-0587-04
 ;;9002226.02101,"629,55175-0587-05 ",.01)
 ;;55175-0587-05
 ;;9002226.02101,"629,55175-0587-05 ",.02)
 ;;55175-0587-05
 ;;9002226.02101,"629,55175-0587-06 ",.01)
 ;;55175-0587-06
 ;;9002226.02101,"629,55175-0587-06 ",.02)
 ;;55175-0587-06
 ;;9002226.02101,"629,55175-0587-07 ",.01)
 ;;55175-0587-07
 ;;9002226.02101,"629,55175-0587-07 ",.02)
 ;;55175-0587-07
 ;;9002226.02101,"629,55175-0587-08 ",.01)
 ;;55175-0587-08
 ;;9002226.02101,"629,55175-0587-08 ",.02)
 ;;55175-0587-08
 ;;9002226.02101,"629,55175-0587-09 ",.01)
 ;;55175-0587-09
 ;;9002226.02101,"629,55175-0587-09 ",.02)
 ;;55175-0587-09
 ;;9002226.02101,"629,55175-0588-02 ",.01)
 ;;55175-0588-02
 ;;9002226.02101,"629,55175-0588-02 ",.02)
 ;;55175-0588-02
 ;;9002226.02101,"629,55175-1313-08 ",.01)
 ;;55175-1313-08
 ;;9002226.02101,"629,55175-1313-08 ",.02)
 ;;55175-1313-08
 ;;9002226.02101,"629,55175-1931-00 ",.01)
 ;;55175-1931-00
 ;;9002226.02101,"629,55175-1931-00 ",.02)
 ;;55175-1931-00
 ;;9002226.02101,"629,55175-1931-01 ",.01)
 ;;55175-1931-01
 ;;9002226.02101,"629,55175-1931-01 ",.02)
 ;;55175-1931-01
 ;;9002226.02101,"629,55175-1931-02 ",.01)
 ;;55175-1931-02
 ;;9002226.02101,"629,55175-1931-02 ",.02)
 ;;55175-1931-02
 ;;9002226.02101,"629,55175-1931-03 ",.01)
 ;;55175-1931-03
 ;;9002226.02101,"629,55175-1931-03 ",.02)
 ;;55175-1931-03
 ;;9002226.02101,"629,55175-1931-04 ",.01)
 ;;55175-1931-04
 ;;9002226.02101,"629,55175-1931-04 ",.02)
 ;;55175-1931-04
 ;;9002226.02101,"629,55175-1931-05 ",.01)
 ;;55175-1931-05
 ;;9002226.02101,"629,55175-1931-05 ",.02)
 ;;55175-1931-05
 ;;9002226.02101,"629,55175-1931-06 ",.01)
 ;;55175-1931-06
 ;;9002226.02101,"629,55175-1931-06 ",.02)
 ;;55175-1931-06
 ;;9002226.02101,"629,55175-1931-07 ",.01)
 ;;55175-1931-07
 ;;9002226.02101,"629,55175-1931-07 ",.02)
 ;;55175-1931-07
 ;;9002226.02101,"629,55175-1931-08 ",.01)
 ;;55175-1931-08
 ;;9002226.02101,"629,55175-1931-08 ",.02)
 ;;55175-1931-08
 ;;9002226.02101,"629,55175-1931-09 ",.01)
 ;;55175-1931-09
 ;;9002226.02101,"629,55175-1931-09 ",.02)
 ;;55175-1931-09
 ;;9002226.02101,"629,55175-2739-02 ",.01)
 ;;55175-2739-02
 ;;9002226.02101,"629,55175-2739-02 ",.02)
 ;;55175-2739-02
 ;;9002226.02101,"629,55175-2739-04 ",.01)
 ;;55175-2739-04
 ;;9002226.02101,"629,55175-2739-04 ",.02)
 ;;55175-2739-04
 ;;9002226.02101,"629,55175-2740-00 ",.01)
 ;;55175-2740-00
 ;;9002226.02101,"629,55175-2740-00 ",.02)
 ;;55175-2740-00
 ;;9002226.02101,"629,55175-2740-01 ",.01)
 ;;55175-2740-01
 ;;9002226.02101,"629,55175-2740-01 ",.02)
 ;;55175-2740-01
 ;;9002226.02101,"629,55175-2740-02 ",.01)
 ;;55175-2740-02
 ;;9002226.02101,"629,55175-2740-02 ",.02)
 ;;55175-2740-02
 ;;9002226.02101,"629,55175-2740-03 ",.01)
 ;;55175-2740-03
 ;;9002226.02101,"629,55175-2740-03 ",.02)
 ;;55175-2740-03
 ;;9002226.02101,"629,55175-2740-04 ",.01)
 ;;55175-2740-04
 ;;9002226.02101,"629,55175-2740-04 ",.02)
 ;;55175-2740-04
 ;;9002226.02101,"629,55175-2740-08 ",.01)
 ;;55175-2740-08
 ;;9002226.02101,"629,55175-2740-08 ",.02)
 ;;55175-2740-08
 ;;9002226.02101,"629,55175-2780-00 ",.01)
 ;;55175-2780-00
 ;;9002226.02101,"629,55175-2780-00 ",.02)
 ;;55175-2780-00
 ;;9002226.02101,"629,55175-2780-01 ",.01)
 ;;55175-2780-01
 ;;9002226.02101,"629,55175-2780-01 ",.02)
 ;;55175-2780-01
 ;;9002226.02101,"629,55175-2780-02 ",.01)
 ;;55175-2780-02
 ;;9002226.02101,"629,55175-2780-02 ",.02)
 ;;55175-2780-02
 ;;9002226.02101,"629,55175-2780-03 ",.01)
 ;;55175-2780-03
 ;;9002226.02101,"629,55175-2780-03 ",.02)
 ;;55175-2780-03
