BGP06G7 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
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
 ;;650
 ;;
 ;;647
 ;;
 ;;1664
 ;;
 ;;1666
 ;;
 ;;2136
 ;;
 ;;1661
 ;;
 ;;1665
 ;;
 ;;1662
 ;;
 ;;1660
 ;;
 ;;2134
 ;;
 ;;2137
 ;;
 ;;1668
 ;;
 ;;1669
 ;;
 ;;1674
 ;;
 ;;1676
 ;;
 ;;2140
 ;;
 ;;1675
 ;;
 ;;1670
 ;;
 ;;1672
 ;;
 ;;2141
 ;;
 ;;2145
 ;;
 ;;1678
 ;;
 ;;1681
 ;;
 ;;1684
 ;;
 ;;1685
 ;;
 ;;1686
 ;;
 ;;2148
 ;;
 ;;1680
 ;;
 ;;1677
 ;;
 ;;1682
 ;;
 ;;3152
 ;;
 ;;3154
 ;;
 ;;3155
 ;;
 ;;3437
 ;;
 ;;1085
 ;;
 ;;657
 ;;
 ;;654
 ;;
 ;;655
 ;;
 ;;656
 ;;
 ;;3198
 ;;
 ;;1543
 ;;
 ;;266
 ;;
 ;;1095
 ;;
 ;;1094
 ;;
 ;;537
 ;;
 ;;539
 ;;
 ;;538
 ;;
 ;;2142
 ;;
 ;;1679
 ;;
 ;;1683
 ;;
 ;;2144
 ;;
 ;;2147
 ;;
 ;;2149
 ;;
 ;;2143
 ;;
 ;;2146
 ;;
 ;;2150
 ;;
 ;;954
 ;;
 ;;1234
 ;;
 ;;1228
 ;;
 ;;1231
 ;;
 ;;1233
 ;;
 ;;1227
 ;;
 ;;1229
 ;;
 ;;1230
 ;;
 ;;1232
 ;;
 ;;898
 ;;
 ;;3404
 ;;
 ;;3405
 ;;
 ;;3406
 ;;
 ;;2378
 ;;
 ;;2376
 ;;
 ;;2374
 ;;
 ;;2375
 ;;
 ;;2377
 ;;
 ;;1382
 ;;
 ;;1381
 ;;
 ;;1380
 ;;
 ;;1383
 ;;
 ;;1384
 ;;
 ;;1526
 ;;
 ;;3318
 ;;
 ;;3317
 ;;
 ;;1055
 ;;
 ;;2570
 ;;
 ;;2573
 ;;
 ;;2571
 ;;
 ;;2572
 ;;
 ;;2574
 ;;
 ;;2578
 ;;
 ;;2579
 ;;
 ;;2575
 ;;
 ;;2577
 ;;
 ;;2576
 ;;
 ;;2581
 ;;
 ;;2582
 ;;
 ;;2580
 ;;
 ;;2586
 ;;
 ;;2587
 ;;
 ;;2589
 ;;
 ;;2584
 ;;
 ;;2585
 ;;
 ;;2590
 ;;
 ;;2593
 ;;
 ;;2591
 ;;
 ;;2999
 ;;
 ;;3000
 ;;
 ;;2998
 ;;
 ;;3001
 ;;
 ;;3003
 ;;
 ;;3004
 ;;
 ;;3005
 ;;
 ;;3006
 ;;
 ;;3002
 ;;
 ;;542
 ;;
 ;;541
 ;;
 ;;2442
 ;;
 ;;2441
 ;;
 ;;2135
 ;;
 ;;1659
 ;;
 ;;1663
 ;;
 ;;3371
 ;;
 ;;1238
 ;;
 ;;1236
 ;;
 ;;1237
 ;;
 ;;1584
 ;;
 ;;1585
 ;;
 ;;1586
 ;;
 ;;1379
 ;;
 ;;3153
 ;;
 ;;3210
 ;;
 ;;2138
 ;;
 ;;1667
 ;;
 ;;1673
 ;;
 ;;2139
 ;;
 ;;955
 ;;
 ;;957
 ;;
 ;;956
 ;;
 ;;268
 ;;
 ;;648
 ;;
 ;;92
 ;;
 ;;94
 ;;
 ;;95
 ;;
 ;;93
 ;;
 ;;96
 ;;
 ;;1086
 ;;
 ;;2588
 ;;
 ;;2592
 ;;
 ;;2103
 ;;
 ;;2102
 ;;
 ;;2105
 ;;
 ;;2106
 ;;
 ;;2107
 ;;
 ;;2101
 ;;
 ;;2099
 ;;
 ;;2100
 ;;
 ;;543
 ;;
 ;;573
 ;;
 ;;398
 ;;
 ;;399
 ;;
 ;;400
 ;;
 ;;401
 ;;
 ;;847
 ;;
 ;;845
 ;;
 ;;846
 ;;
 ;;2916
 ;;
 ;;2917
 ;;
 ;;2915
 ;;
 ;;397
 ;;
 ;;396
 ;;
 ;;304
 ;;
 ;;403
 ;;
 ;;404
 ;;
 ;;402
 ;;
 ;;3459
 ;;
 ;;3457
 ;;
 ;;3458
 ;;
 ;;3456
 ;;
 ;;3464
 ;;
 ;;3461
 ;;
 ;;3463
 ;;
 ;;3465
 ;;
 ;;3462
 ;;
 ;;3460
 ;;
 ;;6
 ;;
 ;;5
 ;;
 ;;1286
 ;;
 ;;1287
 ;;
 ;;1285
 ;;
 ;;2133
 ;;
 ;;1289
 ;;
 ;;1290
 ;;
 ;;1288
 ;;
 ;;3240
 ;;
 ;;3238
 ;;
 ;;3241
 ;;
 ;;3239
 ;;
 ;;3242
 ;;
 ;;1123
 ;;
 ;;1119
 ;;
 ;;1121
 ;;
 ;;1118
 ;;
 ;;1120
 ;;
 ;;1122
 ;;
 ;;1125
 ;;
 ;;1124
 ;;
 ;;1385
 ;;
 ;;3156
 ;;
 ;;1235
 ;;
 ;;267
 ;;
 ;;2583
 ;;
 ;;2108
 ;;
 ;;540
 ;;
 ;;2594
 ;;
 ;;2104
 ;;
 ;;3319
 ;;
 ;;3370
 ;;
 ;;759
 ;;
 ;;758
 ;;
 ;;754
 ;;
 ;;755
 ;;
 ;;756
 ;;
 ;;757
 ;;
 ;;1914
 ;;
 ;;1917
 ;;
 ;;1918
 ;;
 ;;1915
 ;;
 ;;1916
 ;;
 ;;1920
 ;;
 ;;1919
 ;;
 ;;1926
 ;;
 ;;1928
 ;;
 ;;1922
 ;;
 ;;1924
 ;;
 ;;1921
 ;;
 ;;1925
 ;;
 ;;1927
 ;;
 ;;1923
 ;;
 ;;1929
 ;;
 ;;1936
 ;;
 ;;1930
 ;;
 ;;1933
 ;;
 ;;1935
 ;;
 ;;1934
 ;;
 ;;1931
 ;;
 ;;1932
 ;;
 ;;1937
 ;;
 ;;3205
 ;;
 ;;3206
 ;;
 ;;3207
 ;;
 ;;3188
 ;;
 ;;3187
 ;;
 ;;2118
 ;;
 ;;2116
 ;;
 ;;2117
 ;;
 ;;2113
 ;;
 ;;2114
 ;;
 ;;2115
 ;;
 ;;1104
 ;;
 ;;1103
 ;;
 ;;1537
 ;;
 ;;585
 ;;
 ;;1554
 ;;
 ;;1562
 ;;
 ;;1563
 ;;
 ;;762
 ;;
 ;;764
 ;;
 ;;760
 ;;
 ;;761
 ;;
 ;;763
 ;;
 ;;587
 ;;
 ;;1024
 ;;
 ;;1023
 ;;
 ;;287
 ;;
 ;;285
 ;;
 ;;286
 ;;
 ;;289
 ;;
 ;;288
 ;;
 ;;290
 ;;
 ;;769
 ;;
 ;;766
 ;;
 ;;768
 ;;
 ;;765
 ;;
 ;;767
 ;;
 ;;1025
 ;;
 ;;563
 ;;
 ;;3195
 ;;
 ;;2120
 ;;
 ;;1273
 ;;
 ;;1274
 ;;
 ;;1275
 ;;
 ;;564
 ;;
 ;;565
 ;;
 ;;566
 ;;
 ;;1485
 ;;
 ;;1484
 ;;
 ;;1486
 ;;
 ;;917
 ;;
 ;;916
 ;;
 ;;919
 ;;
 ;;918
 ;;
 ;;2407
 ;;
 ;;2408
 ;;
 ;;2410
 ;;
 ;;2409
 ;;
 ;;2411
 ;;
 ;;1071
 ;;
 ;;1070
 ;;
 ;;292
 ;;
 ;;291
 ;;
 ;;2829
 ;;
 ;;2819
 ;;
 ;;2820
 ;;
 ;;2818
 ;;
 ;;2824
 ;;
 ;;2822
 ;;
 ;;2823
 ;;
 ;;2826
 ;;
 ;;2821
 ;;
 ;;2833
 ;;
 ;;2831
 ;;
 ;;2830
 ;;
 ;;2828
 ;;
 ;;2827
 ;;
 ;;2832
 ;;
 ;;568
 ;;
 ;;567
 ;;
 ;;3349
 ;;
 ;;3352
 ;;
 ;;3351
 ;;
 ;;3353
 ;;
 ;;3350
 ;;
 ;;3348
 ;;
 ;;3105
 ;;
 ;;3107
 ;;
 ;;3106
 ;;
 ;;3108
 ;;
 ;;3424
 ;;
 ;;3425
 ;;
 ;;1278
 ;;
 ;;1277
 ;;
 ;;1276
 ;;
 ;;3104
 ;;
 ;;1611
 ;;
 ;;1612
 ;;
 ;;2451
 ;;
 ;;2450
 ;;
 ;;2449
 ;;
 ;;2448
 ;;
 ;;512
 ;;
 ;;198
 ;;
 ;;199
 ;;
 ;;197
 ;;
 ;;2447
 ;;
 ;;200
 ;;
 ;;202
 ;;
 ;;203
 ;;
 ;;201
 ;;
 ;;921
 ;;
 ;;569
 ;;
 ;;580
 ;;
 ;;581
 ;;
 ;;582
 ;;
 ;;513
 ;;
 ;;196
 ;;
 ;;2948
 ;;
 ;;514
 ;;
 ;;3586
 ;;
 ;;3585
 ;;
 ;;3584
 ;;
 ;;3583
 ;;
 ;;3582
 ;;
 ;;3587
 ;;
 ;;3580
 ;;
 ;;3579
 ;;
 ;;3581
 ;;
 ;;3578
 ;;
 ;;321
 ;;
 ;;883
 ;;
 ;;1913
 ;;
 ;;882
 ;;
 ;;1319
 ;;
 ;;1320
 ;;
 ;;1318
 ;;
 ;;3293
 ;;
 ;;3292
 ;;
 ;;3294
 ;;
 ;;1184
 ;;
 ;;1182
 ;;
 ;;1185
 ;;
 ;;1183
 ;;
 ;;1187
 ;;
 ;;1186
 ;;
 ;;1188
 ;;
 ;;2413
 ;;
 ;;2412
 ;;
 ;;2414
 ;;
 ;;205
 ;;
 ;;204
 ;;
 ;;1322
 ;;
 ;;1321
 ;;
 ;;721
 ;;
 ;;717
 ;;
 ;;719
 ;;
 ;;718
 ;;
 ;;720
 ;;
 ;;2304
 ;;
 ;;2311
 ;;
 ;;2312
 ;;
 ;;2308
 ;;
 ;;2305
 ;;
 ;;2310
 ;;
 ;;2306
 ;;
 ;;2307
 ;;
 ;;2309
 ;;
 ;;2322
 ;;
 ;;2315
 ;;
 ;;2318
 ;;
 ;;2321
 ;;
 ;;2313
 ;;
 ;;2317
 ;;
 ;;2314
 ;;
 ;;2316
 ;;
 ;;2320
 ;;
 ;;724
 ;;
 ;;722
 ;;
 ;;723
 ;;
 ;;2299
 ;;
 ;;2302
 ;;
 ;;2300
 ;;
 ;;2301
 ;;
 ;;2303
 ;;
 ;;725
 ;;
 ;;726
 ;;
 ;;1550
 ;;
 ;;984
 ;;
 ;;1245
 ;;
 ;;1246
 ;;
 ;;1247
 ;;
 ;;1434
 ;;
 ;;1433
 ;;
 ;;1429
 ;;
 ;;1430
 ;;
 ;;1431
 ;;
 ;;1432
 ;;
 ;;1428
 ;;
 ;;2396
 ;;
 ;;2394
 ;;
 ;;2395
 ;;
 ;;2692
 ;;
 ;;2690
 ;;
 ;;2689
 ;;
 ;;2686
 ;;
 ;;2687
 ;;
 ;;2688
 ;;
 ;;2691
 ;;
 ;;2701
 ;;
 ;;2698
 ;;
 ;;2693
 ;;
 ;;2697
 ;;
 ;;2694
 ;;
 ;;2699
 ;;
 ;;2695
 ;;
 ;;2696
 ;;
 ;;2700
 ;;
 ;;3056
 ;;
 ;;3059
 ;;
 ;;3058
 ;;
 ;;3057
 ;;
 ;;269
 ;;
 ;;270
 ;;
 ;;3055
 ;;
 ;;3327
 ;;
 ;;3326
 ;;
 ;;1595
 ;;
 ;;1596
 ;;
 ;;174
 ;;
 ;;173
 ;;
 ;;252
 ;;
 ;;172
 ;;
 ;;175
 ;;
 ;;171
 ;;
 ;;170
 ;;
 ;;169
 ;;
 ;;168
 ;;
 ;;2685
 ;;
 ;;1248
 ;;
 ;;467
 ;;
 ;;466
 ;;
 ;;462
 ;;
 ;;461
 ;;
 ;;464
 ;;
 ;;468
 ;;
 ;;465
 ;;
 ;;463
 ;;
 ;;2930
 ;;
 ;;2931
 ;;
 ;;865
 ;;
 ;;866
 ;;
 ;;867
 ;;
 ;;310
 ;;
 ;;309
 ;;
 ;;459
 ;;
 ;;460
 ;;
 ;;457
 ;;
 ;;455
 ;;
 ;;456
 ;;
 ;;458
 ;;
 ;;12
 ;;
 ;;10
 ;;
 ;;11
 ;;
 ;;3524
 ;;
 ;;3525
 ;;
 ;;3526
 ;;
 ;;3528
 ;;
 ;;3527
 ;;
 ;;3529
 ;;
 ;;3530
 ;;
 ;;3531
 ;;
 ;;3532
 ;;
 ;;469
 ;;
 ;;471
 ;;
 ;;470
 ;;
 ;;474
 ;;
 ;;476
 ;;
 ;;477
 ;;
 ;;472
 ;;
 ;;475
 ;;
 ;;473
 ;;
 ;;3271
 ;;
 ;;3268
 ;;
 ;;3269
 ;;
 ;;3266
 ;;
 ;;3267
 ;;
 ;;3270
 ;;
 ;;1307
 ;;
 ;;1158
 ;;
 ;;1156
 ;;
 ;;1157
 ;;
 ;;1154
 ;;
 ;;1155
 ;;
 ;;311
 ;;
 ;;1161
 ;;
 ;;1162
 ;;
 ;;1160
 ;;
 ;;1159
 ;;
 ;;1306
 ;;
 ;;1305
 ;;
 ;;2323
 ;;
 ;;2319
 ;;
 ;;162
 ;;
 ;;2702
 ;;
 ;;478
 ;;
 ;;1703
 ;;
 ;;1704
 ;;
 ;;1705
 ;;
 ;;1706
 ;;
 ;;1707
 ;;
 ;;1708
 ;;
 ;;3223
 ;;
 ;;3224
 ;;
 ;;2461
 ;;
 ;;2462
 ;;
 ;;2463
 ;;
 ;;2464
 ;;
 ;;2465
 ;;
 ;;2466
 ;;
 ;;1253
 ;;
 ;;1254
 ;;
 ;;1255
 ;;
 ;;1256
 ;;
 ;;1257
 ;;
 ;;1258
 ;;
 ;;1259
 ;;
 ;;2109
 ;;
 ;;2110
 ;;
 ;;1470
 ;;
 ;;1471
 ;;
 ;;1472
 ;;
 ;;1473
 ;;
 ;;1475
 ;;
 ;;1476
 ;;
 ;;2020
 ;;
 ;;2006
 ;;
 ;;2007
 ;;
 ;;2009
 ;;
 ;;2010
 ;;
 ;;2011
 ;;
 ;;2013
 ;;
 ;;2014
 ;;
 ;;2016
 ;;
 ;;2017
 ;;
 ;;2004
 ;;
 ;;1987
 ;;
 ;;1988
 ;;
 ;;1989
 ;;
 ;;1990
 ;;
 ;;1991
 ;;
 ;;1992
 ;;
 ;;1993
 ;;
 ;;1994
 ;;
 ;;1995
 ;;
 ;;1996
 ;;
 ;;1997
 ;;
 ;;2000
 ;;
 ;;2001
 ;;
 ;;734
 ;;
 ;;735
 ;;
 ;;736
 ;;
 ;;257
 ;;
 ;;258
 ;;
 ;;259
 ;;
 ;;260
 ;;
 ;;253
 ;;
 ;;254
 ;;
 ;;255
 ;;
 ;;256
 ;;
 ;;1561
 ;;
 ;;2400
 ;;
 ;;2401
 ;;
 ;;2402
 ;;
 ;;2403
 ;;
 ;;551
 ;;
 ;;552
 ;;
 ;;575
 ;;
 ;;574
 ;;
 ;;488
 ;;
 ;;489
 ;;
 ;;490
 ;;
 ;;491
 ;;
 ;;3211
 ;;
 ;;3212
 ;;
 ;;1096
 ;;
 ;;1097
 ;;
 ;;3377
 ;;
 ;;1981
 ;;
 ;;1984
 ;;
 ;;1999
 ;;
 ;;2002
 ;;
 ;;2003
 ;;
 ;;2005
 ;;
 ;;2008
 ;;
 ;;2012
 ;;
 ;;2015
 ;;
 ;;2773
 ;;
 ;;2774
 ;;
 ;;2775
 ;;
 ;;2776
 ;;
 ;;2777
 ;;
 ;;2778
 ;;
 ;;2779
 ;;
 ;;2780
 ;;
 ;;2781
 ;;
 ;;2784
 ;;
 ;;2785
 ;;
 ;;2786
 ;;
 ;;2787
 ;;
 ;;2789
 ;;
 ;;2790
 ;;
 ;;2792
 ;;
 ;;2793
 ;;
 ;;2794
 ;;
 ;;2796
 ;;
 ;;2797
 ;;
 ;;2937
 ;;
 ;;2938
 ;;
 ;;2939
 ;;
 ;;870
 ;;
 ;;871
 ;;
 ;;872
 ;;
 ;;3199
 ;;
 ;;3200
 ;;
 ;;3201
 ;;
 ;;3202
 ;;
 ;;1551
 ;;
 ;;1552
 ;;
 ;;1553
 ;;
 ;;3091
 ;;
 ;;3092
 ;;
 ;;3093
 ;;
 ;;3094
 ;;
 ;;3095
 ;;
 ;;3096
 ;;
 ;;3097
 ;;
 ;;3099
 ;;
 ;;2443
 ;;
 ;;312
 ;;
 ;;313
 ;;
 ;;492
 ;;
 ;;493
 ;;
 ;;494
 ;;
 ;;3164
 ;;
 ;;3165
 ;;
 ;;3166
 ;;
 ;;3167
 ;;
 ;;3168
 ;;
 ;;3169
 ;;
 ;;3159
 ;;
 ;;3160
 ;;
 ;;3161
 ;;
 ;;3162
 ;;
 ;;3163
 ;;
 ;;2762
 ;;
 ;;2764
 ;;
 ;;2765
 ;;
 ;;2766
 ;;
 ;;2767
 ;;
 ;;2768
 ;;
 ;;2769
 ;;
 ;;3547
 ;;
 ;;3548
 ;;
 ;;3331
 ;;
 ;;3332
 ;;
 ;;3333
 ;;
 ;;3334
 ;;
 ;;3335
 ;;
 ;;3336
 ;;
 ;;3420
 ;;
 ;;3421
 ;;
 ;;3422
 ;;
 ;;3423
 ;;
 ;;3086
 ;;
 ;;3087
 ;;
 ;;3088
 ;;
 ;;3089
 ;;
 ;;743
 ;;
 ;;744
 ;;
 ;;745
 ;;
 ;;746
 ;;
 ;;747
 ;;
 ;;1527
 ;;
 ;;1528
 ;;
 ;;1529
 ;;
 ;;1530
 ;;
 ;;3550
 ;;
 ;;3551
 ;;
 ;;3552
 ;;
 ;;3553
 ;;
 ;;3555
 ;;
 ;;487
 ;;
 ;;1469
 ;;
 ;;272
 ;;
 ;;271
 ;;
 ;;273
 ;;
 ;;1010
 ;;
 ;;1011
 ;;
 ;;1608
 ;;
 ;;1609
 ;;
 ;;1610
 ;;
 ;;3442
 ;;
 ;;3443
 ;;
 ;;1974
 ;;
 ;;1975
 ;;
 ;;1976
 ;;
 ;;1977
 ;;
 ;;1978
 ;;
 ;;1979
 ;;
 ;;1980
 ;;
 ;;1982
 ;;
 ;;1983
 ;;
 ;;1985
 ;;
 ;;1986
 ;;
 ;;274
 ;;
 ;;275
 ;;
 ;;276
 ;;
 ;;277
 ;;
 ;;3278
 ;;
 ;;3279
 ;;
 ;;1172
 ;;
 ;;1170
 ;;
 ;;1171
 ;;
 ;;1308
 ;;
 ;;549
 ;;
 ;;550
 ;;
 ;;3157
 ;;
 ;;742
 ;;
 ;;740
 ;;
 ;;741
 ;;
 ;;3213
 ;;
 ;;3214
 ;;
 ;;3215
 ;;
 ;;1260
 ;;
 ;;1261
 ;;
 ;;1309
 ;;
 ;;1100
 ;;
 ;;1101
 ;;
 ;;1102
 ;;
 ;;16
 ;;
 ;;3192
 ;;
 ;;3193
 ;;
 ;;1012
 ;;
 ;;1013
 ;;
 ;;1014
 ;;
 ;;3158
 ;;
 ;;902
 ;;
 ;;903
 ;;
 ;;904
 ;;
 ;;905
 ;;
 ;;906
 ;;
 ;;544
 ;;
 ;;545
 ;;
 ;;546
 ;;
 ;;547
 ;;
 ;;548
 ;;
 ;;2539
 ;;
 ;;2540
 ;;
 ;;2543
 ;;
 ;;2544
 ;;
 ;;2548
 ;;
 ;;2550
 ;;
 ;;379
 ;;
 ;;380
 ;;
 ;;819
 ;;
 ;;820
 ;;
 ;;822
 ;;
 ;;821
 ;;
 ;;3029
 ;;
 ;;3030
 ;;
 ;;3031
 ;;
 ;;3033
 ;;
 ;;3032
 ;;
 ;;3491
 ;;
 ;;3492
 ;;
 ;;3493
 ;;
 ;;3495
 ;;
 ;;3494
 ;;
 ;;438
 ;;
 ;;439
