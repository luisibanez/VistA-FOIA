BGPM3ACK ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON APR 21, 2011;
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"51660079130 ")
 ;;1656
 ;;21,"51660079190 ")
 ;;1657
 ;;21,"51660079210 ")
 ;;1877
 ;;21,"51660079230 ")
 ;;1878
 ;;21,"51660079250 ")
 ;;1879
 ;;21,"51660079290 ")
 ;;1880
 ;;21,"51660079310 ")
 ;;2170
 ;;21,"51660079330 ")
 ;;2171
 ;;21,"51660079350 ")
 ;;2172
 ;;21,"51660079390 ")
 ;;2173
 ;;21,"52297001778 ")
 ;;730
 ;;21,"52297052278 ")
 ;;731
 ;;21,"52544045405 ")
 ;;245
 ;;21,"52544045460 ")
 ;;246
 ;;21,"52555011101 ")
 ;;2
 ;;21,"52555063405 ")
 ;;247
 ;;21,"52555063460 ")
 ;;248
 ;;21,"52604554501 ")
 ;;615
 ;;21,"52735007601 ")
 ;;732
 ;;21,"52959072030 ")
 ;;1022
 ;;21,"52959093730 ")
 ;;249
 ;;21,"52959094430 ")
 ;;1881
 ;;21,"52959098830 ")
 ;;1495
 ;;21,"52959098930 ")
 ;;1658
 ;;21,"53261058003 ")
 ;;33
 ;;21,"53261058004 ")
 ;;34
 ;;21,"53489060701 ")
 ;;824
 ;;21,"53489060703 ")
 ;;825
 ;;21,"53489060705 ")
 ;;826
 ;;21,"53489060706 ")
 ;;827
 ;;21,"53489060707 ")
 ;;828
 ;;21,"53489060710 ")
 ;;829
 ;;21,"53489060801 ")
 ;;1023
 ;;21,"53489060803 ")
 ;;1024
 ;;21,"53489060805 ")
 ;;1025
 ;;21,"53489060806 ")
 ;;1026
 ;;21,"53489060807 ")
 ;;1027
 ;;21,"53489060810 ")
 ;;1028
 ;;21,"53489060901 ")
 ;;1266
 ;;21,"53489060903 ")
 ;;1267
 ;;21,"53489060905 ")
 ;;1268
 ;;21,"53489060906 ")
 ;;1269
 ;;21,"53489060907 ")
 ;;1270
 ;;21,"53489060910 ")
 ;;1271
 ;;21,"53489067707 ")
 ;;184
 ;;21,"53489067807 ")
 ;;182
 ;;21,"53489067890 ")
 ;;183
 ;;21,"53808025101 ")
 ;;250
 ;;21,"53808036801 ")
 ;;251
 ;;21,"53808067301 ")
 ;;252
 ;;21,"53808079001 ")
 ;;1496
 ;;21,"53808079101 ")
 ;;1659
 ;;21,"53808079201 ")
 ;;1660
 ;;21,"53808079301 ")
 ;;1661
 ;;21,"53808079401 ")
 ;;1882
 ;;21,"53816414300 ")
 ;;787
 ;;21,"53869414300 ")
 ;;788
 ;;21,"53869414400 ")
 ;;782
 ;;21,"53869414500 ")
 ;;789
 ;;21,"53869414600 ")
 ;;783
 ;;21,"53869414700 ")
 ;;790
 ;;21,"53869414800 ")
 ;;784
 ;;21,"53869415500 ")
 ;;791
 ;;21,"53869415600 ")
 ;;786
 ;;21,"53978090303 ")
 ;;1029
 ;;21,"53978203307 ")
 ;;253
 ;;21,"53978203308 ")
 ;;254
 ;;21,"53978306901 ")
 ;;1497
 ;;21,"53978306903 ")
 ;;1498
 ;;21,"53978337001 ")
 ;;1662
 ;;21,"53978337003 ")
 ;;1663
 ;;21,"54421032001 ")
 ;;185
 ;;21,"54429314801 ")
 ;;3
 ;;21,"54441015810 ")
 ;;186
 ;;21,"54441015811 ")
 ;;187
 ;;21,"54441015815 ")
 ;;188
 ;;21,"54441015825 ")
 ;;189
 ;;21,"54441015850 ")
 ;;190
 ;;21,"54458093610 ")
 ;;1272
 ;;21,"54458093710 ")
 ;;1030
 ;;21,"54458093810 ")
 ;;830
 ;;21,"54458098210 ")
 ;;1273
 ;;21,"54458098310 ")
 ;;1031
 ;;21,"54458098410 ")
 ;;831
 ;;21,"54569225901 ")
 ;;521
 ;;21,"54569369500 ")
 ;;255
 ;;21,"54569369501 ")
 ;;256
 ;;21,"54569466300 ")
 ;;35
 ;;21,"54569466301 ")
 ;;36
 ;;21,"54569483200 ")
 ;;37
 ;;21,"54569534500 ")
 ;;832
 ;;21,"54569534600 ")
 ;;1032
 ;;21,"54569534700 ")
 ;;1274
 ;;21,"54569583300 ")
 ;;1664
 ;;21,"54569583301 ")
 ;;1665
 ;;21,"54569583302 ")
 ;;1666
 ;;21,"54569583303 ")
 ;;1667
 ;;21,"54569583401 ")
 ;;1883
 ;;21,"54569583402 ")
 ;;1884
 ;;21,"54569583403 ")
 ;;1885
 ;;21,"54569583404 ")
 ;;1886
 ;;21,"54569801600 ")
 ;;257
 ;;21,"54569851100 ")
 ;;258
 ;;21,"54569851101 ")
 ;;259
 ;;21,"54629005101 ")
 ;;522
 ;;21,"54629007101 ")
 ;;733
 ;;21,"54868061000 ")
 ;;96
 ;;21,"54868235300 ")
 ;;260
 ;;21,"54868235301 ")
 ;;261
 ;;21,"54868235302 ")
 ;;262
 ;;21,"54868235303 ")
 ;;263
 ;;21,"54868235304 ")
 ;;264
 ;;21,"54868235305 ")
 ;;265
 ;;21,"54868235306 ")
 ;;266
 ;;21,"54868458500 ")
 ;;1033
 ;;21,"54868458501 ")
 ;;1034
 ;;21,"54868459300 ")
 ;;833
 ;;21,"54868459301 ")
 ;;834
 ;;21,"54868459302 ")
 ;;835
 ;;21,"54868477400 ")
 ;;1275
 ;;21,"54868477401 ")
 ;;1276
 ;;21,"54868477402 ")
 ;;1277
 ;;21,"54868477403 ")
 ;;1278
 ;;21,"54868481200 ")
 ;;38
 ;;21,"54868481201 ")
 ;;39
 ;;21,"54868552600 ")
 ;;40
 ;;21,"54868557500 ")
 ;;173
 ;;21,"54868557501 ")
 ;;174
 ;;21,"54868557502 ")
 ;;175
 ;;21,"54868562700 ")
 ;;1499
 ;;21,"54868562701 ")
 ;;1500
 ;;21,"54868562800 ")
 ;;1668
 ;;21,"54868562801 ")
 ;;1669
 ;;21,"54868562802 ")
 ;;1670
 ;;21,"54868562900 ")
 ;;1887
 ;;21,"54868562901 ")
 ;;1888
 ;;21,"54868562902 ")
 ;;1889
 ;;21,"54868562903 ")
 ;;1890
 ;;21,"54868562904 ")
 ;;1891
 ;;21,"54868563000 ")
 ;;2174
 ;;21,"54868563001 ")
 ;;2175
 ;;21,"54868566000 ")
 ;;130
 ;;21,"54868566001 ")
 ;;131
 ;;21,"54868569700 ")
 ;;148
 ;;21,"54868599400 ")
 ;;165
 ;;21,"54868599401 ")
 ;;166
 ;;21,"54868606600 ")
 ;;2053
 ;;21,"54907090009 ")
 ;;149
 ;;21,"54907090105 ")
 ;;132
 ;;21,"54907090109 ")
 ;;133
 ;;21,"55045232302 ")
 ;;267
 ;;21,"55045232306 ")
 ;;268
 ;;21,"55045301401 ")
 ;;1035
 ;;21,"55045301402 ")
 ;;1036
 ;;21,"55045301406 ")
 ;;1037
 ;;21,"55045301408 ")
 ;;1038
 ;;21,"55045301409 ")
 ;;1039
 ;;21,"55045301501 ")
 ;;1279
 ;;21,"55045301508 ")
 ;;1280
 ;;21,"55045301509 ")
 ;;1281
 ;;21,"55111019701 ")
 ;;2054
 ;;21,"55111019705 ")
 ;;2055
 ;;21,"55111019710 ")
 ;;2056
 ;;21,"55111019730 ")
 ;;2057
 ;;21,"55111019760 ")
 ;;2058
 ;;21,"55111019778 ")
 ;;2059
 ;;21,"55111019790 ")
 ;;2060
 ;;21,"55111019801 ")
 ;;1501
 ;;21,"55111019805 ")
 ;;1502
 ;;21,"55111019830 ")
 ;;1503
 ;;21,"55111019860 ")
 ;;1504
 ;;21,"55111019878 ")
 ;;1505
 ;;21,"55111019890 ")
 ;;1506
 ;;21,"55111019901 ")
 ;;1671
 ;;21,"55111019905 ")
 ;;1672
 ;;21,"55111019910 ")
 ;;1673
 ;;21,"55111019930 ")
 ;;1674
 ;;21,"55111019960 ")
 ;;1675
 ;;21,"55111019978 ")
 ;;1676
 ;;21,"55111019990 ")
 ;;1677
 ;;21,"55111020001 ")
 ;;1892
 ;;21,"55111020005 ")
 ;;1893
 ;;21,"55111020010 ")
 ;;1894
 ;;21,"55111020030 ")
 ;;1895
 ;;21,"55111020060 ")
 ;;1896
 ;;21,"55111020078 ")
 ;;1897
 ;;21,"55111020090 ")
 ;;1898
 ;;21,"55111026801 ")
 ;;2176
 ;;21,"55111026805 ")
 ;;2177
 ;;21,"55111026830 ")
 ;;2178
 ;;21,"55111026860 ")
 ;;2179
 ;;21,"55111026878 ")
 ;;2180
 ;;21,"55111026890 ")
 ;;2181
 ;;21,"55111072610 ")
 ;;2061
 ;;21,"55111072630 ")
 ;;2062
 ;;21,"55111072690 ")
 ;;2063
 ;;21,"55111073510 ")
 ;;1507
 ;;21,"55111073530 ")
 ;;1508
 ;;21,"55111073590 ")
 ;;1509
 ;;21,"55111074010 ")
 ;;1678
 ;;21,"55111074030 ")
 ;;1679
 ;;21,"55111074090 ")
 ;;1680
 ;;21,"55111074910 ")
 ;;1899
 ;;21,"55111074930 ")
 ;;1900
 ;;21,"55111074990 ")
 ;;1901
 ;;21,"55111075010 ")
 ;;2182
 ;;21,"55111075030 ")
 ;;2183
 ;;21,"55111075090 ")
 ;;2184
 ;;21,"55154067000 ")
 ;;269
 ;;21,"55154347609 ")
 ;;1681
 ;;21,"55154347709 ")
 ;;1902
 ;;21,"55154347809 ")
 ;;2185
 ;;21,"55154506200 ")
 ;;1510
 ;;21,"55154506300 ")
 ;;1682
 ;;21,"55154506400 ")
 ;;1903
 ;;21,"55154523100 ")
 ;;270
 ;;21,"55154523107 ")
 ;;271
 ;;21,"55154566600 ")
 ;;1040
 ;;21,"55154827209 ")
 ;;272
 ;;21,"55175532503 ")
 ;;793
 ;;21,"55289029314 ")
 ;;1683
 ;;21,"55289029330 ")
 ;;1684
 ;;21,"55289029390 ")
 ;;1685
 ;;21,"55289032601 ")
 ;;644
 ;;21,"55289033814 ")
 ;;1511
 ;;21,"55289033830 ")
 ;;1512
 ;;21,"55289033890 ")
 ;;1513
 ;;21,"55289039530 ")
 ;;1904
 ;;21,"55289039590 ")
 ;;1905
 ;;21,"55289041160 ")
 ;;273
 ;;21,"55289041193 ")
 ;;274
 ;;21,"55289069214 ")
 ;;1282
 ;;21,"55289069230 ")
 ;;1283
 ;;21,"55289088130 ")
 ;;1041
 ;;21,"55567012700 ")
 ;;836
 ;;21,"55567012706 ")
 ;;837
 ;;21,"55567012718 ")
 ;;838
 ;;21,"55567012735 ")
 ;;839
 ;;21,"55567012769 ")
 ;;840
 ;;21,"55567012800 ")
 ;;1042
 ;;21,"55567012806 ")
 ;;1043
 ;;21,"55567012818 ")
 ;;1044
 ;;21,"55567012835 ")
 ;;1045
 ;;21,"55567012869 ")
 ;;1046
 ;;21,"55567012900 ")
 ;;1284
 ;;21,"55567012906 ")
 ;;1285
 ;;21,"55567012918 ")
 ;;1286
 ;;21,"55567012935 ")
 ;;1287
 ;;21,"55567012969 ")
 ;;1288
 ;;21,"55648090101 ")
 ;;690
 ;;21,"55887031830 ")
 ;;2186
 ;;21,"55887031860 ")
 ;;2187
 ;;21,"55887031890 ")
 ;;2188
 ;;21,"55887032730 ")
 ;;1686
 ;;21,"55887032760 ")
 ;;1687
 ;;21,"55887032790 ")
 ;;1688
 ;;21,"55887033530 ")
 ;;275
 ;;21,"55887033560 ")
 ;;276
 ;;21,"55887033582 ")
 ;;277
 ;;21,"55887033590 ")
 ;;278
 ;;21,"55887033592 ")
 ;;279
 ;;21,"55887035001 ")
 ;;841
 ;;21,"55887035030 ")
 ;;842
 ;;21,"55887035060 ")
 ;;843
 ;;21,"55887035090 ")
 ;;844
 ;;21,"55887036930 ")
 ;;1289
 ;;21,"55887036940 ")
 ;;1290
 ;;21,"55887036960 ")
 ;;1291
 ;;21,"55887036990 ")
 ;;1292
 ;;21,"55887085810 ")
 ;;1906
 ;;21,"55887085830 ")
 ;;1907
 ;;21,"55887085860 ")
 ;;1908
 ;;21,"55887085890 ")
 ;;1909
 ;;21,"55887086130 ")
 ;;1514
 ;;21,"55887086160 ")
 ;;1515
 ;;21,"55887086190 ")
 ;;1516
 ;;21,"55887097430 ")
 ;;1047
 ;;21,"55887097490 ")
 ;;1048
 ;;21,"55953000935 ")
 ;;41
 ;;21,"55953000965 ")
 ;;42
 ;;21,"55953001135 ")
 ;;43
 ;;21,"55953001156 ")
 ;;44
 ;;21,"55953009635 ")
 ;;45
 ;;21,"55953009665 ")
 ;;46
 ;;21,"55953011135 ")
 ;;47
 ;;21,"55953011156 ")
 ;;48
 ;;21,"55953038240 ")
 ;;4
 ;;21,"57297046701 ")
 ;;845
 ;;21,"57297046703 ")
 ;;846
 ;;21,"57297046707 ")
 ;;847
 ;;21,"57297046801 ")
 ;;1049
 ;;21,"57297046803 ")
 ;;1050
 ;;21,"57297046807 ")
 ;;1051
 ;;21,"57297046809 ")
 ;;1052
 ;;21,"57297046901 ")
 ;;1293
 ;;21,"57297046903 ")
 ;;1294
 ;;21,"57297046907 ")
 ;;1295
 ;;21,"57297046909 ")
 ;;1296
 ;;21,"57297047801 ")
 ;;1517
 ;;21,"57297047802 ")
 ;;1518
 ;;21,"57297047803 ")
 ;;1519
 ;;21,"57297047901 ")
 ;;1689
 ;;21,"57297047902 ")
 ;;1690
 ;;21,"57297047903 ")
 ;;1691
 ;;21,"57297048001 ")
 ;;1910
 ;;21,"57297048002 ")
 ;;1911
 ;;21,"57297048003 ")
 ;;1912
 ;;21,"57297048101 ")
 ;;2189
 ;;21,"57297048102 ")
 ;;2190
 ;;21,"57297048103 ")
 ;;2191
 ;;21,"57297048203 ")
 ;;2064
 ;;21,"57297048206 ")
 ;;2065
 ;;21,"57297048209 ")
 ;;2066
 ;;21,"57297048213 ")
 ;;2067
 ;;21,"57480080901 ")
 ;;280
 ;;21,"57480080906 ")
 ;;281
 ;;21,"57587090100 ")
 ;;180
 ;;21,"57587090300 ")
 ;;181
 ;;21,"57664011508 ")
 ;;282
 ;;21,"57664011513 ")
 ;;283
 ;;21,"57664011518 ")
 ;;284
 ;;21,"57664011583 ")
 ;;285
 ;;21,"57664011586 ")
 ;;286
 ;;21,"57664011588 ")
 ;;287
 ;;21,"57866393601 ")
 ;;1692
 ;;21,"57866394901 ")
 ;;1913
 ;;21,"57866640001 ")
 ;;848
 ;;21,"57866650001 ")
 ;;1297
 ;;21,"57866654001 ")
 ;;288
 ;;21,"57866654002 ")
 ;;289
 ;;21,"57866654004 ")
 ;;290
 ;;21,"57866660101 ")
 ;;1053
 ;;21,"58016000600 ")
 ;;1914
 ;;21,"58016000601 ")
 ;;1915
 ;;21,"58016000602 ")
 ;;1916
 ;;21,"58016000603 ")
 ;;1917
 ;;21,"58016000604 ")
 ;;1918
 ;;21,"58016000605 ")
 ;;1919
 ;;21,"58016000606 ")
 ;;1920
 ;;21,"58016000607 ")
 ;;1921
 ;;21,"58016000608 ")
 ;;1922
 ;;21,"58016000609 ")
 ;;1923
 ;;21,"58016000610 ")
 ;;1924
 ;;21,"58016000630 ")
 ;;1925
 ;;21,"58016000660 ")
 ;;1926
 ;;21,"58016000690 ")
 ;;1927
 ;;21,"58016000700 ")
 ;;1693
 ;;21,"58016000701 ")
 ;;1694
 ;;21,"58016000702 ")
 ;;1695
 ;;21,"58016000703 ")
 ;;1696
 ;;21,"58016000704 ")
 ;;1697
 ;;21,"58016000705 ")
 ;;1698
 ;;21,"58016000706 ")
 ;;1699
 ;;21,"58016000707 ")
 ;;1700
 ;;21,"58016000708 ")
 ;;1701
 ;;21,"58016000709 ")
 ;;1702
