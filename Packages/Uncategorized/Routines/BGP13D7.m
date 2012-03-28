BGP13D7 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"994,00121-0489-05 ",.02)
 ;;00121-0489-05
 ;;9002226.02101,"994,00121-0489-10 ",.01)
 ;;00121-0489-10
 ;;9002226.02101,"994,00121-0489-10 ",.02)
 ;;00121-0489-10
 ;;9002226.02101,"994,00121-0489-20 ",.01)
 ;;00121-0489-20
 ;;9002226.02101,"994,00121-0489-20 ",.02)
 ;;00121-0489-20
 ;;9002226.02101,"994,00121-0547-05 ",.01)
 ;;00121-0547-05
 ;;9002226.02101,"994,00121-0547-05 ",.02)
 ;;00121-0547-05
 ;;9002226.02101,"994,00122-0815-66 ",.01)
 ;;00122-0815-66
 ;;9002226.02101,"994,00122-0815-66 ",.02)
 ;;00122-0815-66
 ;;9002226.02101,"994,00122-0816-66 ",.01)
 ;;00122-0816-66
 ;;9002226.02101,"994,00122-0816-66 ",.02)
 ;;00122-0816-66
 ;;9002226.02101,"994,00122-0878-66 ",.01)
 ;;00122-0878-66
 ;;9002226.02101,"994,00122-0878-66 ",.02)
 ;;00122-0878-66
 ;;9002226.02101,"994,00135-0009-45 ",.01)
 ;;00135-0009-45
 ;;9002226.02101,"994,00135-0009-45 ",.02)
 ;;00135-0009-45
 ;;9002226.02101,"994,00147-0236-05 ",.01)
 ;;00147-0236-05
 ;;9002226.02101,"994,00147-0236-05 ",.02)
 ;;00147-0236-05
 ;;9002226.02101,"994,00172-2929-60 ",.01)
 ;;00172-2929-60
 ;;9002226.02101,"994,00172-2929-60 ",.02)
 ;;00172-2929-60
 ;;9002226.02101,"994,00172-2929-80 ",.01)
 ;;00172-2929-80
 ;;9002226.02101,"994,00172-2929-80 ",.02)
 ;;00172-2929-80
 ;;9002226.02101,"994,00182-0135-10 ",.01)
 ;;00182-0135-10
 ;;9002226.02101,"994,00182-0135-10 ",.02)
 ;;00182-0135-10
 ;;9002226.02101,"994,00182-0492-10 ",.01)
 ;;00182-0492-10
 ;;9002226.02101,"994,00182-0492-10 ",.02)
 ;;00182-0492-10
 ;;9002226.02101,"994,00182-1015-01 ",.01)
 ;;00182-1015-01
 ;;9002226.02101,"994,00182-1015-01 ",.02)
 ;;00182-1015-01
 ;;9002226.02101,"994,00182-1064-08 ",.01)
 ;;00182-1064-08
 ;;9002226.02101,"994,00182-1064-08 ",.02)
 ;;00182-1064-08
 ;;9002226.02101,"994,00182-1064-18 ",.01)
 ;;00182-1064-18
 ;;9002226.02101,"994,00182-1064-18 ",.02)
 ;;00182-1064-18
 ;;9002226.02101,"994,00182-1099-89 ",.01)
 ;;00182-1099-89
 ;;9002226.02101,"994,00182-1099-89 ",.02)
 ;;00182-1099-89
 ;;9002226.02101,"994,00182-1131-93 ",.01)
 ;;00182-1131-93
 ;;9002226.02101,"994,00182-1131-93 ",.02)
 ;;00182-1131-93
 ;;9002226.02101,"994,00182-1132-00 ",.01)
 ;;00182-1132-00
 ;;9002226.02101,"994,00182-1132-00 ",.02)
 ;;00182-1132-00
 ;;9002226.02101,"994,00182-1132-89 ",.01)
 ;;00182-1132-89
 ;;9002226.02101,"994,00182-1132-89 ",.02)
 ;;00182-1132-89
 ;;9002226.02101,"994,00182-1146-16 ",.01)
 ;;00182-1146-16
 ;;9002226.02101,"994,00182-1146-16 ",.02)
 ;;00182-1146-16
 ;;9002226.02101,"994,00182-1147-16 ",.01)
 ;;00182-1147-16
 ;;9002226.02101,"994,00182-1147-16 ",.02)
 ;;00182-1147-16
 ;;9002226.02101,"994,00182-1355-40 ",.01)
 ;;00182-1355-40
 ;;9002226.02101,"994,00182-1355-40 ",.02)
 ;;00182-1355-40
 ;;9002226.02101,"994,00182-1376-40 ",.01)
 ;;00182-1376-40
 ;;9002226.02101,"994,00182-1376-40 ",.02)
 ;;00182-1376-40
 ;;9002226.02101,"994,00182-1492-05 ",.01)
 ;;00182-1492-05
 ;;9002226.02101,"994,00182-1492-05 ",.02)
 ;;00182-1492-05
 ;;9002226.02101,"994,00182-1492-10 ",.01)
 ;;00182-1492-10
 ;;9002226.02101,"994,00182-1492-10 ",.02)
 ;;00182-1492-10
 ;;9002226.02101,"994,00182-1493-01 ",.01)
 ;;00182-1493-01
 ;;9002226.02101,"994,00182-1493-01 ",.02)
 ;;00182-1493-01
 ;;9002226.02101,"994,00182-1494-05 ",.01)
 ;;00182-1494-05
 ;;9002226.02101,"994,00182-1494-05 ",.02)
 ;;00182-1494-05
 ;;9002226.02101,"994,00182-1737-41 ",.01)
 ;;00182-1737-41
 ;;9002226.02101,"994,00182-1737-41 ",.02)
 ;;00182-1737-41
 ;;9002226.02101,"994,00182-1991-01 ",.01)
 ;;00182-1991-01
 ;;9002226.02101,"994,00182-1991-01 ",.02)
 ;;00182-1991-01
 ;;9002226.02101,"994,00182-2001-37 ",.01)
 ;;00182-2001-37
 ;;9002226.02101,"994,00182-2001-37 ",.02)
 ;;00182-2001-37
 ;;9002226.02101,"994,00182-2091-16 ",.01)
 ;;00182-2091-16
 ;;9002226.02101,"994,00182-2091-16 ",.02)
 ;;00182-2091-16
 ;;9002226.02101,"994,00182-2092-01 ",.01)
 ;;00182-2092-01
 ;;9002226.02101,"994,00182-2092-01 ",.02)
 ;;00182-2092-01
 ;;9002226.02101,"994,00182-2092-16 ",.01)
 ;;00182-2092-16
 ;;9002226.02101,"994,00182-2092-16 ",.02)
 ;;00182-2092-16
 ;;9002226.02101,"994,00182-2095-37 ",.01)
 ;;00182-2095-37
 ;;9002226.02101,"994,00182-2095-37 ",.02)
 ;;00182-2095-37
 ;;9002226.02101,"994,00182-2115-19 ",.01)
 ;;00182-2115-19
 ;;9002226.02101,"994,00182-2115-19 ",.02)
 ;;00182-2115-19
 ;;9002226.02101,"994,00182-6061-37 ",.01)
 ;;00182-6061-37
 ;;9002226.02101,"994,00182-6061-37 ",.02)
 ;;00182-6061-37
 ;;9002226.02101,"994,00182-6168-37 ",.01)
 ;;00182-6168-37
 ;;9002226.02101,"994,00182-6168-37 ",.02)
 ;;00182-6168-37
 ;;9002226.02101,"994,00182-6168-40 ",.01)
 ;;00182-6168-40
 ;;9002226.02101,"994,00182-6168-40 ",.02)
 ;;00182-6168-40
 ;;9002226.02101,"994,00182-8222-00 ",.01)
 ;;00182-8222-00
 ;;9002226.02101,"994,00182-8222-00 ",.02)
 ;;00182-8222-00
 ;;9002226.02101,"994,00182-8222-89 ",.01)
 ;;00182-8222-89
 ;;9002226.02101,"994,00182-8222-89 ",.02)
 ;;00182-8222-89
 ;;9002226.02101,"994,00185-0613-01 ",.01)
 ;;00185-0613-01
 ;;9002226.02101,"994,00185-0613-01 ",.02)
 ;;00185-0613-01
 ;;9002226.02101,"994,00185-0613-05 ",.01)
 ;;00185-0613-05
 ;;9002226.02101,"994,00185-0613-05 ",.02)
 ;;00185-0613-05
 ;;9002226.02101,"994,00185-0615-01 ",.01)
 ;;00185-0615-01
 ;;9002226.02101,"994,00185-0615-01 ",.02)
 ;;00185-0615-01
 ;;9002226.02101,"994,00185-0615-05 ",.01)
 ;;00185-0615-05
 ;;9002226.02101,"994,00185-0615-05 ",.02)
 ;;00185-0615-05
 ;;9002226.02101,"994,00185-0648-01 ",.01)
 ;;00185-0648-01
 ;;9002226.02101,"994,00185-0648-01 ",.02)
 ;;00185-0648-01
 ;;9002226.02101,"994,00185-0648-10 ",.01)
 ;;00185-0648-10
 ;;9002226.02101,"994,00185-0648-10 ",.02)
 ;;00185-0648-10
 ;;9002226.02101,"994,00185-0649-01 ",.01)
 ;;00185-0649-01
 ;;9002226.02101,"994,00185-0649-01 ",.02)
 ;;00185-0649-01
 ;;9002226.02101,"994,00185-0649-10 ",.01)
 ;;00185-0649-10
 ;;9002226.02101,"994,00185-0649-10 ",.02)
 ;;00185-0649-10
 ;;9002226.02101,"994,00223-0585-01 ",.01)
 ;;00223-0585-01
 ;;9002226.02101,"994,00223-0585-01 ",.02)
 ;;00223-0585-01
 ;;9002226.02101,"994,00223-0586-01 ",.01)
 ;;00223-0586-01
 ;;9002226.02101,"994,00223-0586-01 ",.02)
 ;;00223-0586-01
 ;;9002226.02101,"994,00223-0586-02 ",.01)
 ;;00223-0586-02
 ;;9002226.02101,"994,00223-0586-02 ",.02)
 ;;00223-0586-02
 ;;9002226.02101,"994,00223-0709-01 ",.01)
 ;;00223-0709-01
 ;;9002226.02101,"994,00223-0709-01 ",.02)
 ;;00223-0709-01
 ;;9002226.02101,"994,00223-0709-02 ",.01)
 ;;00223-0709-02
 ;;9002226.02101,"994,00223-0709-02 ",.02)
 ;;00223-0709-02
 ;;9002226.02101,"994,00223-1006-01 ",.01)
 ;;00223-1006-01
 ;;9002226.02101,"994,00223-1006-01 ",.02)
 ;;00223-1006-01
 ;;9002226.02101,"994,00223-1006-02 ",.01)
 ;;00223-1006-02
 ;;9002226.02101,"994,00223-1006-02 ",.02)
 ;;00223-1006-02
 ;;9002226.02101,"994,00223-1007-01 ",.01)
 ;;00223-1007-01
 ;;9002226.02101,"994,00223-1007-01 ",.02)
 ;;00223-1007-01
 ;;9002226.02101,"994,00223-1007-02 ",.01)
 ;;00223-1007-02
 ;;9002226.02101,"994,00223-1007-02 ",.02)
 ;;00223-1007-02
 ;;9002226.02101,"994,00223-1007-05 ",.01)
 ;;00223-1007-05
 ;;9002226.02101,"994,00223-1007-05 ",.02)
 ;;00223-1007-05
 ;;9002226.02101,"994,00223-1008-01 ",.01)
 ;;00223-1008-01
 ;;9002226.02101,"994,00223-1008-01 ",.02)
 ;;00223-1008-01
 ;;9002226.02101,"994,00223-1008-02 ",.01)
 ;;00223-1008-02
 ;;9002226.02101,"994,00223-1008-02 ",.02)
 ;;00223-1008-02
 ;;9002226.02101,"994,00223-1009-01 ",.01)
 ;;00223-1009-01
 ;;9002226.02101,"994,00223-1009-01 ",.02)
 ;;00223-1009-01
 ;;9002226.02101,"994,00223-1049-01 ",.01)
 ;;00223-1049-01
 ;;9002226.02101,"994,00223-1049-01 ",.02)
 ;;00223-1049-01
 ;;9002226.02101,"994,00223-1049-02 ",.01)
 ;;00223-1049-02
 ;;9002226.02101,"994,00223-1049-02 ",.02)
 ;;00223-1049-02
 ;;9002226.02101,"994,00223-1050-01 ",.01)
 ;;00223-1050-01
 ;;9002226.02101,"994,00223-1050-01 ",.02)
 ;;00223-1050-01
 ;;9002226.02101,"994,00223-1050-02 ",.01)
 ;;00223-1050-02
 ;;9002226.02101,"994,00223-1050-02 ",.02)
 ;;00223-1050-02
 ;;9002226.02101,"994,00223-1051-01 ",.01)
 ;;00223-1051-01
 ;;9002226.02101,"994,00223-1051-01 ",.02)
 ;;00223-1051-01
 ;;9002226.02101,"994,00223-1051-02 ",.01)
 ;;00223-1051-02
 ;;9002226.02101,"994,00223-1051-02 ",.02)
 ;;00223-1051-02
 ;;9002226.02101,"994,00223-1521-01 ",.01)
 ;;00223-1521-01
 ;;9002226.02101,"994,00223-1521-01 ",.02)
 ;;00223-1521-01
 ;;9002226.02101,"994,00223-1521-02 ",.01)
 ;;00223-1521-02
 ;;9002226.02101,"994,00223-1521-02 ",.02)
 ;;00223-1521-02
 ;;9002226.02101,"994,00223-6135-01 ",.01)
 ;;00223-6135-01
 ;;9002226.02101,"994,00223-6135-01 ",.02)
 ;;00223-6135-01
 ;;9002226.02101,"994,00223-6135-02 ",.01)
 ;;00223-6135-02
 ;;9002226.02101,"994,00223-6135-02 ",.02)
 ;;00223-6135-02
 ;;9002226.02101,"994,00223-6251-01 ",.01)
 ;;00223-6251-01
 ;;9002226.02101,"994,00223-6251-01 ",.02)
 ;;00223-6251-01
 ;;9002226.02101,"994,00223-6251-02 ",.01)
 ;;00223-6251-02
 ;;9002226.02101,"994,00223-6251-02 ",.02)
 ;;00223-6251-02
 ;;9002226.02101,"994,00223-6251-03 ",.01)
 ;;00223-6251-03
 ;;9002226.02101,"994,00223-6251-03 ",.02)
 ;;00223-6251-03
 ;;9002226.02101,"994,00223-6343-01 ",.01)
 ;;00223-6343-01
 ;;9002226.02101,"994,00223-6343-01 ",.02)
 ;;00223-6343-01
 ;;9002226.02101,"994,00223-6345-01 ",.01)
 ;;00223-6345-01
 ;;9002226.02101,"994,00223-6345-01 ",.02)
 ;;00223-6345-01
 ;;9002226.02101,"994,00223-6345-02 ",.01)
 ;;00223-6345-02
 ;;9002226.02101,"994,00223-6345-02 ",.02)
 ;;00223-6345-02
 ;;9002226.02101,"994,00223-6345-03 ",.01)
 ;;00223-6345-03
 ;;9002226.02101,"994,00223-6345-03 ",.02)
 ;;00223-6345-03
 ;;9002226.02101,"994,00223-6347-01 ",.01)
 ;;00223-6347-01
 ;;9002226.02101,"994,00223-6347-01 ",.02)
 ;;00223-6347-01
 ;;9002226.02101,"994,00223-6347-02 ",.01)
 ;;00223-6347-02
 ;;9002226.02101,"994,00223-6347-02 ",.02)
 ;;00223-6347-02
 ;;9002226.02101,"994,00223-6489-01 ",.01)
 ;;00223-6489-01
 ;;9002226.02101,"994,00223-6489-01 ",.02)
 ;;00223-6489-01
 ;;9002226.02101,"994,00223-6489-02 ",.01)
 ;;00223-6489-02
 ;;9002226.02101,"994,00223-6489-02 ",.02)
 ;;00223-6489-02
 ;;9002226.02101,"994,00228-2188-16 ",.01)
 ;;00228-2188-16
 ;;9002226.02101,"994,00228-2188-16 ",.02)
 ;;00228-2188-16
 ;;9002226.02101,"994,00228-2191-10 ",.01)
 ;;00228-2191-10
 ;;9002226.02101,"994,00228-2191-10 ",.02)
 ;;00228-2191-10
 ;;9002226.02101,"994,00228-2191-96 ",.01)
 ;;00228-2191-96
 ;;9002226.02101,"994,00228-2191-96 ",.02)
 ;;00228-2191-96
 ;;9002226.02101,"994,00228-2192-10 ",.01)
 ;;00228-2192-10
 ;;9002226.02101,"994,00228-2192-10 ",.02)
 ;;00228-2192-10
 ;;9002226.02101,"994,00228-2192-96 ",.01)
 ;;00228-2192-96
 ;;9002226.02101,"994,00228-2192-96 ",.02)
 ;;00228-2192-96
 ;;9002226.02101,"994,00247-0073-00 ",.01)
 ;;00247-0073-00
 ;;9002226.02101,"994,00247-0073-00 ",.02)
 ;;00247-0073-00
 ;;9002226.02101,"994,00247-0073-01 ",.01)
 ;;00247-0073-01
 ;;9002226.02101,"994,00247-0073-01 ",.02)
 ;;00247-0073-01
 ;;9002226.02101,"994,00247-0073-02 ",.01)
 ;;00247-0073-02
 ;;9002226.02101,"994,00247-0073-02 ",.02)
 ;;00247-0073-02
 ;;9002226.02101,"994,00247-0073-03 ",.01)
 ;;00247-0073-03
 ;;9002226.02101,"994,00247-0073-03 ",.02)
 ;;00247-0073-03
 ;;9002226.02101,"994,00247-0073-04 ",.01)
 ;;00247-0073-04
 ;;9002226.02101,"994,00247-0073-04 ",.02)
 ;;00247-0073-04
 ;;9002226.02101,"994,00247-0073-05 ",.01)
 ;;00247-0073-05
 ;;9002226.02101,"994,00247-0073-05 ",.02)
 ;;00247-0073-05
 ;;9002226.02101,"994,00247-0073-06 ",.01)
 ;;00247-0073-06
 ;;9002226.02101,"994,00247-0073-06 ",.02)
 ;;00247-0073-06
 ;;9002226.02101,"994,00247-0073-07 ",.01)
 ;;00247-0073-07
 ;;9002226.02101,"994,00247-0073-07 ",.02)
 ;;00247-0073-07
 ;;9002226.02101,"994,00247-0073-08 ",.01)
 ;;00247-0073-08
 ;;9002226.02101,"994,00247-0073-08 ",.02)
 ;;00247-0073-08
 ;;9002226.02101,"994,00247-0073-10 ",.01)
 ;;00247-0073-10
 ;;9002226.02101,"994,00247-0073-10 ",.02)
 ;;00247-0073-10
 ;;9002226.02101,"994,00247-0073-12 ",.01)
 ;;00247-0073-12
 ;;9002226.02101,"994,00247-0073-12 ",.02)
 ;;00247-0073-12
 ;;9002226.02101,"994,00247-0073-14 ",.01)
 ;;00247-0073-14
 ;;9002226.02101,"994,00247-0073-14 ",.02)
 ;;00247-0073-14
 ;;9002226.02101,"994,00247-0073-15 ",.01)
 ;;00247-0073-15
 ;;9002226.02101,"994,00247-0073-15 ",.02)
 ;;00247-0073-15
 ;;9002226.02101,"994,00247-0073-16 ",.01)
 ;;00247-0073-16
 ;;9002226.02101,"994,00247-0073-16 ",.02)
 ;;00247-0073-16
 ;;9002226.02101,"994,00247-0073-18 ",.01)
 ;;00247-0073-18
 ;;9002226.02101,"994,00247-0073-18 ",.02)
 ;;00247-0073-18
 ;;9002226.02101,"994,00247-0073-20 ",.01)
 ;;00247-0073-20
 ;;9002226.02101,"994,00247-0073-20 ",.02)
 ;;00247-0073-20
