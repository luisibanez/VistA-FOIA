BGP03B11 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;
 ;;595
 ;;
 ;;596
 ;;
 ;;597
 ;;
 ;;598
 ;;
 ;;246
 ;;
 ;;247
 ;;
 ;;248
 ;;
 ;;249
 ;;
 ;;250
 ;;
 ;;251
 ;;
 ;;334
 ;;
 ;;335
 ;;
 ;;336
 ;;
 ;;337
 ;;
 ;;338
 ;;
 ;;28
 ;;
 ;;1574
 ;;
 ;;1575
 ;;
 ;;1576
 ;;
 ;;624
 ;;
 ;;625
 ;;
 ;;626
 ;;
 ;;627
 ;;
 ;;348
 ;;
 ;;1052
 ;;
 ;;40
 ;;
 ;;2503
 ;;
 ;;2504
 ;;
 ;;928
 ;;
 ;;2507
 ;;
 ;;2508
 ;;
 ;;1539
 ;;
 ;;929
 ;;
 ;;2505
 ;;
 ;;2506
 ;;
 ;;1353
 ;;
 ;;830
 ;;
 ;;349
 ;;
 ;;1354
 ;;
 ;;1355
 ;;
 ;;1090
 ;;
 ;;1
 ;;
 ;;1091
 ;;
 ;;1092
 ;;
 ;;2345
 ;;
 ;;1051
 ;;
 ;;2346
 ;;
 ;;2347
 ;;
 ;;1639
 ;;
 ;;1640
 ;;
 ;;1638
 ;;
 ;;1688
 ;;
 ;;1687
 ;;
 ;;85
 ;;
 ;;86
 ;;
 ;;84
 ;;
 ;;88
 ;;
 ;;89
 ;;
 ;;90
 ;;
 ;;87
 ;;
 ;;91
 ;;
 ;;2568
 ;;
 ;;2569
 ;;
 ;;2991
 ;;
 ;;2992
 ;;
 ;;2993
 ;;
 ;;2994
 ;;
 ;;2565
 ;;
 ;;2566
 ;;
 ;;2567
 ;;
 ;;2131
 ;;
 ;;2132
 ;;
 ;;2127
 ;;
 ;;2128
 ;;
 ;;2129
 ;;
 ;;2130
 ;;
 ;;950
 ;;
 ;;951
 ;;
 ;;948
 ;;
 ;;949
 ;;
 ;;1283
 ;;
 ;;1284
 ;;
 ;;1809
 ;;
 ;;1810
 ;;
 ;;1811
 ;;
 ;;1812
 ;;
 ;;1813
 ;;
 ;;1814
 ;;
 ;;3379
 ;;
 ;;3380
 ;;
 ;;3381
 ;;
 ;;2121
 ;;
 ;;2122
 ;;
 ;;2123
 ;;
 ;;2124
 ;;
 ;;2125
 ;;
 ;;2126
 ;;
 ;;943
 ;;
 ;;944
 ;;
 ;;942
 ;;
 ;;946
 ;;
 ;;947
 ;;
 ;;945
 ;;
 ;;1054
 ;;
 ;;2528
 ;;
 ;;2529
 ;;
 ;;2530
 ;;
 ;;2531
 ;;
 ;;2532
 ;;
 ;;2533
 ;;
 ;;2976
 ;;
 ;;2977
 ;;
 ;;2978
 ;;
 ;;2979
 ;;
 ;;67
 ;;
 ;;2909
 ;;
 ;;2910
 ;;
 ;;64
 ;;
 ;;65
 ;;
 ;;66
 ;;
 ;;2
 ;;
 ;;1757
 ;;
 ;;1755
 ;;
 ;;1756
 ;;
 ;;923
 ;;
 ;;1760
 ;;
 ;;1758
 ;;
 ;;1759
 ;;
 ;;1763
 ;;
 ;;1762
 ;;
 ;;1761
 ;;
 ;;2492
 ;;
 ;;2494
 ;;
 ;;2496
 ;;
 ;;2495
 ;;
 ;;2493
 ;;
 ;;2497
 ;;
 ;;813
 ;;
 ;;815
 ;;
 ;;818
 ;;
 ;;814
 ;;
 ;;816
 ;;
 ;;817
 ;;
 ;;1779
 ;;
 ;;1780
 ;;
 ;;3190
 ;;
 ;;1078
 ;;
 ;;1079
 ;;
 ;;617
 ;;
 ;;618
 ;;
 ;;619
 ;;
 ;;620
 ;;
 ;;2335
 ;;
 ;;2336
 ;;
 ;;2337
 ;;
 ;;2338
 ;;
 ;;621
 ;;
 ;;1087
 ;;
 ;;1088
 ;;
 ;;1089
 ;;
 ;;1764
 ;;
 ;;1765
 ;;
 ;;1766
 ;;
 ;;1767
 ;;
 ;;1347
 ;;
 ;;1348
 ;;
 ;;1349
 ;;
 ;;1571
 ;;
 ;;1572
 ;;
 ;;1573
 ;;
 ;;2964
 ;;
 ;;2965
 ;;
 ;;2966
 ;;
 ;;2499
 ;;
 ;;2500
 ;;
 ;;2501
 ;;
 ;;2498
 ;;
 ;;35
 ;;
 ;;36
 ;;
 ;;37
 ;;
 ;;81
 ;;
 ;;82
 ;;
 ;;3397
 ;;
 ;;3398
 ;;
 ;;3399
 ;;
 ;;1578
 ;;
 ;;1579
 ;;
 ;;1580
 ;;
 ;;1815
 ;;
 ;;1816
 ;;
 ;;1817
 ;;
 ;;1818
 ;;
 ;;1819
 ;;
 ;;641
 ;;
 ;;642
 ;;
 ;;643
 ;;
 ;;2363
 ;;
 ;;2365
 ;;
 ;;2367
 ;;
 ;;2369
 ;;
 ;;2364
 ;;
 ;;2366
 ;;
 ;;2368
 ;;
 ;;2370
 ;;
 ;;841
 ;;
 ;;842
 ;;
 ;;843
 ;;
 ;;840
 ;;
 ;;2538
 ;;
 ;;2534
 ;;
 ;;2535
 ;;
 ;;2536
 ;;
 ;;2537
 ;;
 ;;2984
 ;;
 ;;2981
 ;;
 ;;2982
 ;;
 ;;2980
 ;;
 ;;2983
 ;;
 ;;1371
 ;;
 ;;1372
 ;;
 ;;1373
 ;;
 ;;937
 ;;
 ;;938
 ;;
 ;;939
 ;;
 ;;1083
 ;;
 ;;1081
 ;;
 ;;1082
 ;;
 ;;350
 ;;
 ;;3232
 ;;
 ;;3233
 ;;
 ;;1772
 ;;
 ;;1773
 ;;
 ;;1774
 ;;
 ;;1775
 ;;
 ;;1776
 ;;
 ;;1777
 ;;
 ;;3593
 ;;
 ;;3594
 ;;
 ;;3595
 ;;
 ;;1894
 ;;
 ;;1895
 ;;
 ;;1896
 ;;
 ;;1897
 ;;
 ;;1898
 ;;
 ;;1899
 ;;
 ;;1900
 ;;
 ;;1901
 ;;
 ;;2840
 ;;
 ;;2841
 ;;
 ;;2842
 ;;
 ;;2843
 ;;
 ;;2845
 ;;
 ;;2846
 ;;
 ;;570
 ;;
 ;;515
 ;;
 ;;516
 ;;
 ;;517
 ;;
 ;;518
 ;;
 ;;1912
 ;;
 ;;1902
 ;;
 ;;1903
 ;;
 ;;1904
 ;;
 ;;1905
 ;;
 ;;1906
 ;;
 ;;1907
 ;;
 ;;1908
 ;;
 ;;1909
 ;;
 ;;1910
 ;;
 ;;1911
 ;;
 ;;2839
 ;;
 ;;2834
 ;;
 ;;2835
 ;;
 ;;2836
 ;;
 ;;2837
 ;;
 ;;2838
 ;;
 ;;3110
 ;;
 ;;3111
 ;;
 ;;3112
 ;;
 ;;3113
 ;;
 ;;3114
 ;;
 ;;3115
 ;;
 ;;3354
 ;;
 ;;1487
 ;;
 ;;1488
 ;;
 ;;209
 ;;
 ;;210
 ;;
 ;;211
 ;;
 ;;212
 ;;
 ;;1888
 ;;
 ;;1889
 ;;
 ;;1890
 ;;
 ;;1891
 ;;
 ;;1892
 ;;
 ;;1893
 ;;
 ;;776
 ;;
 ;;777
 ;;
 ;;778
 ;;
 ;;779
 ;;
 ;;1189
 ;;
 ;;1190
 ;;
 ;;1191
 ;;
 ;;1192
 ;;
 ;;1193
 ;;
 ;;1194
 ;;
 ;;1195
 ;;
 ;;1196
 ;;
 ;;1197
 ;;
 ;;3378
 ;;
 ;;1281
 ;;
 ;;1279
 ;;
 ;;1282
 ;;
 ;;1280
 ;;
 ;;885
 ;;
 ;;886
 ;;
 ;;887
 ;;
 ;;888
 ;;
 ;;889
 ;;
 ;;2415
 ;;
 ;;2416
 ;;
 ;;3116
 ;;
 ;;3109
 ;;
 ;;207
 ;;
 ;;208
 ;;
 ;;770
 ;;
 ;;771
 ;;
 ;;774
 ;;
 ;;1613
 ;;
 ;;293
 ;;
 ;;781
 ;;
 ;;3295
 ;;
 ;;3588
 ;;
 ;;3589
 ;;
 ;;3590
 ;;
 ;;3591
 ;;
 ;;3592
 ;;
 ;;884
 ;;
 ;;1323
 ;;
 ;;920
 ;;
 ;;206
 ;;
 ;;3366
 ;;
 ;;3367
 ;;
 ;;3368
 ;;
 ;;3369
 ;;
 ;;51
 ;;
 ;;52
 ;;
 ;;53
 ;;
 ;;50
 ;;
 ;;55
 ;;
 ;;56
 ;;
 ;;57
 ;;
 ;;54
 ;;
 ;;832
 ;;
 ;;2907
 ;;
 ;;2908
 ;;
 ;;2151
 ;;
 ;;644
 ;;
 ;;645
 ;;
 ;;646
 ;;
 ;;1820
 ;;
 ;;1821
 ;;
 ;;1822
 ;;
 ;;1824
 ;;
 ;;1823
 ;;
 ;;1825
 ;;
 ;;1826
 ;;
 ;;940
 ;;
 ;;941
 ;;
 ;;1377
 ;;
 ;;1378
 ;;
 ;;2561
 ;;
 ;;2562
 ;;
 ;;2563
 ;;
 ;;2564
 ;;
 ;;1583
 ;;
 ;;1117
 ;;
 ;;1076
 ;;
 ;;1077
 ;;
 ;;602
 ;;
 ;;603
 ;;
 ;;604
 ;;
 ;;2325
 ;;
 ;;2326
 ;;
 ;;2327
 ;;
 ;;2328
 ;;
 ;;1709
 ;;
 ;;1710
 ;;
 ;;1711
 ;;
 ;;2467
 ;;
 ;;2468
 ;;
 ;;2963
 ;;
 ;;1338
 ;;
 ;;1339
 ;;
 ;;29
 ;;
 ;;1568
 ;;
 ;;1649
 ;;
 ;;1651
 ;;
 ;;1652
 ;;
 ;;1650
 ;;
 ;;1645
 ;;
 ;;1647
 ;;
 ;;1648
 ;;
 ;;1646
 ;;
 ;;1641
 ;;
 ;;1643
 ;;
 ;;1644
 ;;
 ;;1642
 ;;
 ;;1957
 ;;
 ;;1959
 ;;
 ;;1960
 ;;
 ;;1958
 ;;
 ;;1956
 ;;
 ;;1961
 ;;
 ;;1962
 ;;
 ;;1963
 ;;
 ;;1964
 ;;
 ;;1965
 ;;
 ;;1966
 ;;
 ;;1967
 ;;
 ;;1969
 ;;
 ;;1970
 ;;
 ;;1971
 ;;
 ;;1968
 ;;
 ;;1972
 ;;
 ;;1973
 ;;
 ;;749
 ;;
 ;;748
 ;;
 ;;1067
 ;;
 ;;1479
 ;;
 ;;2801
 ;;
 ;;2800
 ;;
 ;;2804
 ;;
 ;;2803
 ;;
 ;;2802
 ;;
 ;;3101
 ;;
 ;;3100
 ;;
 ;;2799
 ;;
 ;;381
 ;;
 ;;382
 ;;
 ;;383
 ;;
 ;;384
 ;;
 ;;386
 ;;
 ;;385
 ;;
 ;;388
 ;;
 ;;387
 ;;
 ;;390
 ;;
 ;;389
 ;;
 ;;628
 ;;
 ;;1778
 ;;
 ;;1080
 ;;
 ;;1356
 ;;
 ;;1540
 ;;
 ;;41
 ;;
 ;;1093
 ;;
 ;;1098
 ;;
 ;;930
 ;;
 ;;2348
 ;;
 ;;3365
 ;;
 ;;3382
 ;;
 ;;1577
 ;;
 ;;2509
 ;;
 ;;2967
 ;;
 ;;3444
 ;;
 ;;351
 ;;
 ;;831
 ;;
 ;;1692
 ;;
 ;;1693
 ;;
 ;;1694
 ;;
 ;;1695
 ;;
 ;;1696
 ;;
 ;;1697
 ;;
 ;;3356
 ;;
 ;;3357
 ;;
 ;;3358
 ;;
 ;;33
 ;;
 ;;34
 ;;
 ;;1344
 ;;
 ;;1345
 ;;
 ;;1346
 ;;
 ;;1016
 ;;
 ;;3194
 ;;
 ;;3203
 ;;
 ;;3204
 ;;
 ;;1536
 ;;
 ;;1531
 ;;
 ;;1532
 ;;
 ;;1533
 ;;
 ;;1534
 ;;
 ;;1535
 ;;
 ;;1541
 ;;
 ;;1542
 ;;
 ;;1939
 ;;
 ;;1940
 ;;
 ;;1786
 ;;
 ;;1787
 ;;
 ;;1788
 ;;
 ;;1789
 ;;
 ;;1781
 ;;
 ;;1782
 ;;
 ;;1783
 ;;
 ;;1784
 ;;
 ;;1785
 ;;
 ;;1938
 ;;
 ;;1944
 ;;
 ;;1945
 ;;
 ;;1941
 ;;
 ;;1790
 ;;
 ;;1791
 ;;
 ;;1792
 ;;
 ;;1793
 ;;
 ;;1794
 ;;
 ;;1795
 ;;
 ;;1796
 ;;
 ;;1942
 ;;
 ;;1797
 ;;
 ;;1943
 ;;
 ;;1954
 ;;
 ;;1955
 ;;
 ;;1946
 ;;
 ;;1798
 ;;
 ;;1947
 ;;
 ;;1799
 ;;
 ;;1800
 ;;
 ;;1948
 ;;
 ;;1949
 ;;
 ;;1801
 ;;
 ;;1802
 ;;
 ;;1950
 ;;
 ;;1951
 ;;
 ;;1803
 ;;
 ;;1804
 ;;
 ;;1805
 ;;
 ;;1952
 ;;
 ;;1806
 ;;
 ;;1807
 ;;
 ;;1808
 ;;
 ;;1953
 ;;
 ;;629
 ;;
 ;;750
 ;;
 ;;630
 ;;
 ;;631
 ;;
 ;;751
 ;;
 ;;632
 ;;
 ;;633
 ;;
 ;;634
 ;;
 ;;635
 ;;
 ;;752
 ;;
 ;;753
 ;;
 ;;636
 ;;
 ;;637
 ;;
 ;;638
 ;;
 ;;639
 ;;
 ;;640
 ;;
 ;;578
 ;;
 ;;579
 ;;
 ;;3170
 ;;
 ;;3171
 ;;
 ;;3181
 ;;
 ;;3182
 ;;
 ;;3183
 ;;
 ;;3184
 ;;
 ;;3185
 ;;
 ;;3186
 ;;
 ;;279
 ;;
 ;;280
 ;;
 ;;2510
 ;;
 ;;2511
 ;;
 ;;2512
 ;;
 ;;2513
 ;;
 ;;2514
 ;;
 ;;2812
 ;;
 ;;2813
 ;;
 ;;2805
 ;;
 ;;2806
 ;;
 ;;2807
 ;;
 ;;2808
 ;;
 ;;2515
 ;;
 ;;2809
 ;;
 ;;2810
 ;;
 ;;2516
 ;;
 ;;2811
 ;;
 ;;3180
 ;;
 ;;3172
 ;;
 ;;3173
 ;;
 ;;3174
 ;;
 ;;3175
 ;;
 ;;3176
 ;;
 ;;3177
 ;;
 ;;3178
 ;;
 ;;3179
 ;;
 ;;2814
 ;;
 ;;2815
 ;;
 ;;2517
 ;;
 ;;2518
 ;;
 ;;2519
 ;;
 ;;2520
 ;;
 ;;2816
 ;;
 ;;2521
 ;;
 ;;2522
 ;;
 ;;2523
 ;;
 ;;2524
 ;;
 ;;2525
 ;;
 ;;2526
 ;;
 ;;2940
 ;;
 ;;931
 ;;
 ;;932
 ;;
 ;;933
 ;;
 ;;934
 ;;
 ;;935
 ;;
 ;;936
 ;;
 ;;1022
 ;;
 ;;1017
 ;;
 ;;1018
 ;;
 ;;1019
 ;;
 ;;1020
 ;;
 ;;1021
 ;;
 ;;553
 ;;
 ;;554
 ;;
 ;;555
 ;;
 ;;556
 ;;
 ;;907
 ;;
 ;;908
 ;;
 ;;909
 ;;
 ;;910
 ;;
 ;;911
 ;;
 ;;912
 ;;
 ;;913
 ;;
 ;;914
 ;;
 ;;915
 ;;
 ;;1262
 ;;
 ;;1263
 ;;
 ;;1264
 ;;
 ;;1265
 ;;
 ;;1266
 ;;
 ;;1267
 ;;
 ;;1268
 ;;
 ;;1481
 ;;
 ;;1482
 ;;
 ;;1361
 ;;
 ;;1362
 ;;
 ;;1363
 ;;
 ;;1364
 ;;
 ;;1365
 ;;
 ;;1366
 ;;
 ;;1367
 ;;
 ;;1483
 ;;
 ;;2405
 ;;
 ;;2350
 ;;
 ;;2406
 ;;
 ;;2351
 ;;
 ;;3347
 ;;
 ;;3337
 ;;
 ;;3338
 ;;
 ;;3339
 ;;
 ;;3340
 ;;
 ;;3341
 ;;
 ;;3342
 ;;
 ;;3343
 ;;
 ;;3344
 ;;
 ;;3345
 ;;
 ;;3346
 ;;
 ;;2112
 ;;
 ;;2970
 ;;
 ;;2971
 ;;
 ;;2972
 ;;
 ;;2973
 ;;
 ;;2974
 ;;
 ;;3103
 ;;
 ;;2975
 ;;
 ;;557
 ;;
 ;;558
 ;;
 ;;559
 ;;
 ;;560
 ;;
 ;;281
 ;;
 ;;282
 ;;
 ;;283
 ;;
 ;;1069
 ;;
 ;;1068
 ;;
 ;;2444
 ;;
 ;;2445
 ;;
 ;;2446
 ;;
 ;;2968
 ;;
 ;;2969
 ;;
 ;;3102
 ;;
 ;;1269
 ;;
 ;;1270
 ;;
 ;;1271
 ;;
 ;;1272
 ;;
 ;;42
 ;;
 ;;43
 ;;
 ;;3383
 ;;
 ;;3384
 ;;
 ;;3385
 ;;
 ;;1480
 ;;
 ;;1357
 ;;
 ;;1358
 ;;
 ;;1359
 ;;
 ;;1360
 ;;
 ;;278
 ;;
 ;;193
 ;;
 ;;45
 ;;
 ;;194
 ;;
 ;;46
 ;;
 ;;195
 ;;
 ;;47
 ;;
 ;;48
 ;;
 ;;49
 ;;
 ;;187
 ;;
 ;;188
 ;;
 ;;189
 ;;
 ;;190
 ;;
 ;;44
 ;;
 ;;191
 ;;
 ;;192
 ;;
 ;;561
 ;;
 ;;562
 ;;
 ;;3218
 ;;
 ;;3216
 ;;
 ;;3217
 ;;
 ;;576
 ;;
 ;;577
 ;;
 ;;498
 ;;
 ;;499
 ;;
 ;;500
 ;;
 ;;501
 ;;
 ;;502
 ;;
 ;;503
 ;;
 ;;504
 ;;
 ;;505
 ;;
 ;;297
 ;;
 ;;495
 ;;
 ;;496
 ;;
 ;;497
 ;;
 ;;2404
 ;;
 ;;2349
 ;;
 ;;873
 ;;
 ;;874
 ;;
 ;;875
 ;;
 ;;876
 ;;
 ;;877
 ;;
 ;;878
 ;;
 ;;880
 ;;
 ;;881
 ;;
 ;;2947
 ;;
 ;;2941
 ;;
 ;;2942
 ;;
 ;;2932
 ;;
 ;;2943
 ;;
 ;;2944
 ;;
 ;;2945
 ;;
 ;;2946
 ;;
 ;;2352
 ;;
 ;;2353
 ;;
 ;;2354
 ;;
 ;;2355
 ;;
 ;;318
 ;;
 ;;319
 ;;
 ;;320
 ;;
 ;;506
 ;;
 ;;507
 ;;
 ;;508
 ;;
 ;;510
 ;;
 ;;511
 ;;
 ;;314
 ;;
 ;;315
 ;;
 ;;316
 ;;
 ;;317
 ;;
 ;;3577
 ;;
 ;;3563
 ;;
 ;;3564
 ;;
 ;;3565
 ;;
 ;;3566
 ;;
 ;;3567
 ;;
 ;;3568
 ;;
 ;;3569
 ;;
 ;;3570
 ;;
 ;;3571
 ;;
 ;;3572
 ;;
 ;;3573
 ;;
 ;;3574
 ;;
 ;;3575
 ;;
 ;;3576
 ;;
 ;;3556
 ;;
 ;;3557
 ;;
 ;;3558
 ;;
 ;;3559
 ;;
 ;;3560
 ;;
 ;;3561
 ;;
 ;;3562
 ;;
 ;;284
 ;;
 ;;1313
 ;;
 ;;1310
 ;;
 ;;1311
 ;;
 ;;1312
 ;;
 ;;509
 ;;
 ;;1173
 ;;
 ;;1174
 ;;
 ;;1175
 ;;
 ;;1176
 ;;
 ;;1177
 ;;
 ;;1178
 ;;
 ;;1179
 ;;
 ;;1180
 ;;
 ;;1181
 ;;
 ;;17
 ;;
 ;;18
 ;;
 ;;19
 ;;
 ;;1314
 ;;
 ;;1315
 ;;
 ;;1316
 ;;
 ;;1317
 ;;
 ;;3291
 ;;
 ;;3280
 ;;
 ;;3281
 ;;
 ;;3282
 ;;
 ;;3283
 ;;
 ;;3284
 ;;
 ;;3285
 ;;
 ;;3286
 ;;
 ;;3287
 ;;
 ;;3288
 ;;
 ;;3289
 ;;
 ;;3290
 ;;
 ;;879
 ;;
 ;;588
 ;;
 ;;589
 ;;
 ;;590
 ;;
 ;;591
 ;;
 ;;593
 ;;
 ;;594
 ;;
 ;;592
 ;;
 ;;2956
