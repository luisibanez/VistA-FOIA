BGP08A3 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
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
 ;;
 ;;441
 ;;
 ;;440
 ;;
 ;;1137
 ;;
 ;;1138
 ;;
 ;;1139
 ;;
 ;;1140
 ;;
 ;;1291
 ;;
 ;;1292
 ;;
 ;;1293
 ;;
 ;;1295
 ;;
 ;;1294
 ;;
 ;;1296
 ;;
 ;;1297
 ;;
 ;;1298
 ;;
 ;;1300
 ;;
 ;;1299
 ;;
 ;;147
 ;;
 ;;148
 ;;
 ;;149
 ;;
 ;;150
 ;;
 ;;307
 ;;
 ;;305
 ;;
 ;;308
 ;;
 ;;306
 ;;
 ;;142
 ;;
 ;;143
 ;;
 ;;144
 ;;
 ;;146
 ;;
 ;;145
 ;;
 ;;1141
 ;;
 ;;1142
 ;;
 ;;1143
 ;;
 ;;1144
 ;;
 ;;1407
 ;;
 ;;1408
 ;;
 ;;1409
 ;;
 ;;3255
 ;;
 ;;3256
 ;;
 ;;3257
 ;;
 ;;3258
 ;;
 ;;3259
 ;;
 ;;2632
 ;;
 ;;2634
 ;;
 ;;2633
 ;;
 ;;2635
 ;;
 ;;2926
 ;;
 ;;2927
 ;;
 ;;2928
 ;;
 ;;2929
 ;;
 ;;3496
 ;;
 ;;3497
 ;;
 ;;3498
 ;;
 ;;3499
 ;;
 ;;3500
 ;;
 ;;3501
 ;;
 ;;3502
 ;;
 ;;3503
 ;;
 ;;3504
 ;;
 ;;3506
 ;;
 ;;3505
 ;;
 ;;1241
 ;;
 ;;1242
 ;;
 ;;1243
 ;;
 ;;1410
 ;;
 ;;1411
 ;;
 ;;1412
 ;;
 ;;1414
 ;;
 ;;1413
 ;;
 ;;1590
 ;;
 ;;1591
 ;;
 ;;1592
 ;;
 ;;1593
 ;;
 ;;431
 ;;
 ;;432
 ;;
 ;;434
 ;;
 ;;433
 ;;
 ;;435
 ;;
 ;;437
 ;;
 ;;436
 ;;
 ;;702
 ;;
 ;;703
 ;;
 ;;704
 ;;
 ;;705
 ;;
 ;;857
 ;;
 ;;858
 ;;
 ;;3320
 ;;
 ;;3321
 ;;
 ;;3322
 ;;
 ;;3323
 ;;
 ;;2223
 ;;
 ;;2384
 ;;
 ;;2385
 ;;
 ;;2386
 ;;
 ;;899
 ;;
 ;;697
 ;;
 ;;698
 ;;
 ;;699
 ;;
 ;;3024
 ;;
 ;;3025
 ;;
 ;;3026
 ;;
 ;;3027
 ;;
 ;;3028
 ;;
 ;;700
 ;;
 ;;701
 ;;
 ;;2636
 ;;
 ;;2637
 ;;
 ;;2638
 ;;
 ;;2639
 ;;
 ;;2640
 ;;
 ;;2641
 ;;
 ;;2642
 ;;
 ;;2643
 ;;
 ;;2645
 ;;
 ;;2644
 ;;
 ;;2231
 ;;
 ;;2224
 ;;
 ;;2225
 ;;
 ;;2226
 ;;
 ;;2227
 ;;
 ;;2228
 ;;
 ;;2229
 ;;
 ;;2232
 ;;
 ;;2230
 ;;
 ;;1565
 ;;
 ;;1566
 ;;
 ;;1567
 ;;
 ;;3359
 ;;
 ;;3360
 ;;
 ;;3361
 ;;
 ;;3221
 ;;
 ;;3222
 ;;
 ;;444
 ;;
 ;;445
 ;;
 ;;443
 ;;
 ;;442
 ;;
 ;;3372
 ;;
 ;;3260
 ;;
 ;;3261
 ;;
 ;;3262
 ;;
 ;;3263
 ;;
 ;;3324
 ;;
 ;;151
 ;;
 ;;3034
 ;;
 ;;3035
 ;;
 ;;706
 ;;
 ;;707
 ;;
 ;;708
 ;;
 ;;2234
 ;;
 ;;2235
 ;;
 ;;2236
 ;;
 ;;2233
 ;;
 ;;2237
 ;;
 ;;2238
 ;;
 ;;2241
 ;;
 ;;2242
 ;;
 ;;2239
 ;;
 ;;2240
 ;;
 ;;2248
 ;;
 ;;2250
 ;;
 ;;2247
 ;;
 ;;2246
 ;;
 ;;2249
 ;;
 ;;2245
 ;;
 ;;2252
 ;;
 ;;2251
 ;;
 ;;2244
 ;;
 ;;2243
 ;;
 ;;976
 ;;
 ;;978
 ;;
 ;;977
 ;;
 ;;979
 ;;
 ;;2388
 ;;
 ;;2387
 ;;
 ;;709
 ;;
 ;;1415
 ;;
 ;;1594
 ;;
 ;;1244
 ;;
 ;;2935
 ;;
 ;;2936
 ;;
 ;;2646
 ;;
 ;;2649
 ;;
 ;;2648
 ;;
 ;;2647
 ;;
 ;;2653
 ;;
 ;;2650
 ;;
 ;;2654
 ;;
 ;;2652
 ;;
 ;;2651
 ;;
 ;;3040
 ;;
 ;;3042
 ;;
 ;;3038
 ;;
 ;;3036
 ;;
 ;;3037
 ;;
 ;;3039
 ;;
 ;;3041
 ;;
 ;;3043
 ;;
 ;;7
 ;;
 ;;152
 ;;
 ;;153
 ;;
 ;;446
 ;;
 ;;859
 ;;
 ;;860
 ;;
 ;;3508
 ;;
 ;;3510
 ;;
 ;;3509
 ;;
 ;;3511
 ;;
 ;;3512
 ;;
 ;;3507
 ;;
 ;;3605
 ;;
 ;;3598
 ;;
 ;;3599
 ;;
 ;;3600
 ;;
 ;;3601
 ;;
 ;;3602
 ;;
 ;;3603
 ;;
 ;;3604
 ;;
 ;;3430
 ;;
 ;;3431
 ;;
 ;;3432
 ;;
 ;;3386
 ;;
 ;;3387
 ;;
 ;;3388
 ;;
 ;;3389
 ;;
 ;;3390
 ;;
 ;;3391
 ;;
 ;;3392
 ;;
 ;;3393
 ;;
 ;;3394
 ;;
 ;;3395
 ;;
 ;;3426
 ;;
 ;;3396
 ;;
 ;;3427
 ;;
 ;;3434
 ;;
 ;;3428
 ;;
 ;;3433
 ;;
 ;;3429
 ;;
 ;;519
 ;;
 ;;354
 ;;
 ;;355
 ;;
 ;;356
 ;;
 ;;357
 ;;
 ;;358
 ;;
 ;;359
 ;;
 ;;523
 ;;
 ;;367
 ;;
 ;;368
 ;;
 ;;369
 ;;
 ;;370
 ;;
 ;;371
 ;;
 ;;372
 ;;
 ;;373
 ;;
 ;;522
 ;;
 ;;521
 ;;
 ;;360
 ;;
 ;;361
 ;;
 ;;362
 ;;
 ;;363
 ;;
 ;;364
 ;;
 ;;365
 ;;
 ;;366
 ;;
 ;;520
 ;;
 ;;3615
 ;;
 ;;3606
 ;;
 ;;3607
 ;;
 ;;3608
 ;;
 ;;3609
 ;;
 ;;3610
 ;;
 ;;3611
 ;;
 ;;3612
 ;;
 ;;3613
 ;;
 ;;3614
 ;;
 ;;787
 ;;
 ;;782
 ;;
 ;;783
 ;;
 ;;784
 ;;
 ;;785
 ;;
 ;;786
 ;;
 ;;794
 ;;
 ;;788
 ;;
 ;;789
 ;;
 ;;790
 ;;
 ;;791
 ;;
 ;;792
 ;;
 ;;793
 ;;
 ;;795
 ;;
 ;;796
 ;;
 ;;797
 ;;
 ;;798
 ;;
 ;;799
 ;;
 ;;800
 ;;
 ;;801
 ;;
 ;;802
 ;;
 ;;803
 ;;
 ;;804
 ;;
 ;;805
 ;;
 ;;806
 ;;
 ;;1850
 ;;
 ;;1851
 ;;
 ;;1837
 ;;
 ;;1838
 ;;
 ;;1839
 ;;
 ;;1840
 ;;
 ;;1841
 ;;
 ;;1842
 ;;
 ;;1843
 ;;
 ;;1844
 ;;
 ;;1845
 ;;
 ;;1846
 ;;
 ;;1847
 ;;
 ;;1848
 ;;
 ;;1849
 ;;
 ;;1867
 ;;
 ;;1868
 ;;
 ;;1852
 ;;
 ;;1853
 ;;
 ;;1854
 ;;
 ;;1855
 ;;
 ;;1856
 ;;
 ;;1857
 ;;
 ;;1858
 ;;
 ;;1859
 ;;
 ;;1860
 ;;
 ;;1861
 ;;
 ;;1862
 ;;
 ;;1863
 ;;
 ;;1864
 ;;
 ;;1869
 ;;
 ;;1865
 ;;
 ;;1866
 ;;
 ;;1836
 ;;
 ;;1835
 ;;
 ;;1833
 ;;
 ;;1870
 ;;
 ;;1871
 ;;
 ;;1872
 ;;
 ;;1873
 ;;
 ;;1874
 ;;
 ;;1875
 ;;
 ;;1876
 ;;
 ;;1877
 ;;
 ;;1878
 ;;
 ;;1879
 ;;
 ;;1880
 ;;
 ;;1881
 ;;
 ;;1882
 ;;
 ;;1883
 ;;
 ;;1884
 ;;
 ;;1834
 ;;
 ;;1885
 ;;
 ;;1886
 ;;
 ;;1887
 ;;
 ;;1555
 ;;
 ;;1556
 ;;
 ;;1557
 ;;
 ;;1558
 ;;
 ;;1559
 ;;
 ;;839
 ;;
 ;;892
 ;;
 ;;893
 ;;
 ;;833
 ;;
 ;;834
 ;;
 ;;835
 ;;
 ;;836
 ;;
 ;;837
 ;;
 ;;838
 ;;
 ;;891
 ;;
 ;;895
 ;;
 ;;894
 ;;
 ;;2362
 ;;
 ;;2417
 ;;
 ;;2356
 ;;
 ;;2357
 ;;
 ;;2358
 ;;
 ;;2359
 ;;
 ;;2360
 ;;
 ;;2361
 ;;
 ;;2876
 ;;
 ;;2877
 ;;
 ;;2878
 ;;
 ;;2863
 ;;
 ;;2864
 ;;
 ;;2865
 ;;
 ;;2866
 ;;
 ;;2867
 ;;
 ;;2868
 ;;
 ;;2869
 ;;
 ;;2870
 ;;
 ;;2871
 ;;
 ;;2872
 ;;
 ;;2873
 ;;
 ;;2874
 ;;
 ;;2880
 ;;
 ;;2879
 ;;
 ;;2875
 ;;
 ;;2119
 ;;
 ;;2896
 ;;
 ;;2897
 ;;
 ;;2899
 ;;
 ;;2881
 ;;
 ;;2882
 ;;
 ;;2883
 ;;
 ;;2884
 ;;
 ;;2885
 ;;
 ;;2886
 ;;
 ;;2887
 ;;
 ;;2888
 ;;
 ;;2889
 ;;
 ;;2890
 ;;
 ;;2891
 ;;
 ;;2892
 ;;
 ;;2893
 ;;
 ;;2894
 ;;
 ;;2898
 ;;
 ;;2901
 ;;
 ;;2900
 ;;
 ;;2895
 ;;
 ;;1045
 ;;
 ;;1046
 ;;
 ;;1047
 ;;
 ;;1037
 ;;
 ;;1038
 ;;
 ;;1039
 ;;
 ;;1040
 ;;
 ;;1041
 ;;
 ;;1042
 ;;
 ;;1043
 ;;
 ;;1049
 ;;
 ;;1048
 ;;
 ;;1044
 ;;
 ;;2858
 ;;
 ;;2859
 ;;
 ;;2860
 ;;
 ;;2847
 ;;
 ;;2848
 ;;
 ;;2849
 ;;
 ;;2850
 ;;
 ;;2851
 ;;
 ;;2852
 ;;
 ;;2853
 ;;
 ;;2854
 ;;
 ;;2855
 ;;
 ;;2856
 ;;
 ;;2857
 ;;
 ;;2862
 ;;
 ;;2861
 ;;
 ;;3143
 ;;
 ;;3144
 ;;
 ;;3145
 ;;
 ;;3130
 ;;
 ;;3131
 ;;
 ;;3132
 ;;
 ;;3133
 ;;
 ;;3134
 ;;
 ;;3135
 ;;
 ;;3136
 ;;
 ;;3137
 ;;
 ;;3138
 ;;
 ;;3139
 ;;
 ;;3140
 ;;
 ;;3141
 ;;
 ;;3147
 ;;
 ;;3146
 ;;
 ;;3142
 ;;
 ;;1620
 ;;
 ;;1621
 ;;
 ;;1622
 ;;
 ;;1614
 ;;
 ;;1615
 ;;
 ;;1616
 ;;
 ;;1617
 ;;
 ;;1618
 ;;
 ;;1619
 ;;
 ;;1624
 ;;
 ;;1623
 ;;
 ;;2955
 ;;
 ;;2949
 ;;
 ;;2950
 ;;
 ;;2951
 ;;
 ;;2952
 ;;
 ;;2953
 ;;
 ;;2954
 ;;
 ;;527
 ;;
 ;;524
 ;;
 ;;525
 ;;
 ;;374
 ;;
 ;;375
 ;;
 ;;376
 ;;
 ;;377
 ;;
 ;;378
 ;;
 ;;526
 ;;
 ;;2431
 ;;
 ;;2418
 ;;
 ;;2419
 ;;
 ;;2420
 ;;
 ;;2421
 ;;
 ;;2422
 ;;
 ;;2423
 ;;
 ;;2424
 ;;
 ;;2425
 ;;
 ;;2426
 ;;
 ;;2427
 ;;
 ;;2428
 ;;
 ;;2429
 ;;
 ;;2430
 ;;
 ;;217
 ;;
 ;;218
 ;;
 ;;219
 ;;
 ;;68
 ;;
 ;;69
 ;;
 ;;70
 ;;
 ;;213
 ;;
 ;;71
 ;;
 ;;214
 ;;
 ;;221
 ;;
 ;;215
 ;;
 ;;220
 ;;
 ;;216
 ;;
 ;;223
 ;;
 ;;224
 ;;
 ;;225
 ;;
 ;;72
 ;;
 ;;73
 ;;
 ;;74
 ;;
 ;;75
 ;;
 ;;76
 ;;
 ;;77
 ;;
 ;;78
 ;;
 ;;79
 ;;
 ;;227
 ;;
 ;;222
 ;;
 ;;226
 ;;
 ;;80
 ;;
 ;;27
 ;;
 ;;22
 ;;
 ;;23
 ;;
 ;;24
 ;;
 ;;25
 ;;
 ;;26
 ;;
 ;;239
 ;;
 ;;240
 ;;
 ;;241
 ;;
 ;;229
 ;;
 ;;230
 ;;
 ;;231
 ;;
 ;;232
 ;;
 ;;233
 ;;
 ;;234
 ;;
 ;;235
 ;;
 ;;236
 ;;
 ;;237
 ;;
 ;;243
 ;;
 ;;242
 ;;
 ;;238
 ;;
 ;;2438
 ;;
 ;;2432
 ;;
 ;;2433
 ;;
 ;;2434
 ;;
 ;;2435
 ;;
 ;;2436
