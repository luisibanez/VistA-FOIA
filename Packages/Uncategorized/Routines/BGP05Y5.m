BGP05Y5 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
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
 ;;
 ;;2437
 ;;
 ;;333
 ;;
 ;;330
 ;;
 ;;331
 ;;
 ;;332
 ;;
 ;;3306
 ;;
 ;;3307
 ;;
 ;;3308
 ;;
 ;;3296
 ;;
 ;;3297
 ;;
 ;;3298
 ;;
 ;;3299
 ;;
 ;;3300
 ;;
 ;;3301
 ;;
 ;;3302
 ;;
 ;;3303
 ;;
 ;;3304
 ;;
 ;;3310
 ;;
 ;;3309
 ;;
 ;;3305
 ;;
 ;;325
 ;;
 ;;326
 ;;
 ;;327
 ;;
 ;;322
 ;;
 ;;323
 ;;
 ;;329
 ;;
 ;;328
 ;;
 ;;324
 ;;
 ;;1329
 ;;
 ;;1324
 ;;
 ;;1325
 ;;
 ;;1326
 ;;
 ;;1327
 ;;
 ;;1328
 ;;
 ;;1075
 ;;
 ;;1072
 ;;
 ;;1073
 ;;
 ;;1074
 ;;
 ;;1211
 ;;
 ;;1212
 ;;
 ;;1198
 ;;
 ;;1199
 ;;
 ;;1200
 ;;
 ;;1201
 ;;
 ;;1202
 ;;
 ;;1203
 ;;
 ;;1204
 ;;
 ;;1205
 ;;
 ;;1206
 ;;
 ;;1207
 ;;
 ;;1208
 ;;
 ;;1209
 ;;
 ;;1210
 ;;
 ;;1217
 ;;
 ;;1218
 ;;
 ;;1219
 ;;
 ;;1213
 ;;
 ;;1214
 ;;
 ;;1215
 ;;
 ;;1221
 ;;
 ;;1220
 ;;
 ;;1216
 ;;
 ;;1335
 ;;
 ;;1336
 ;;
 ;;1330
 ;;
 ;;1331
 ;;
 ;;1334
 ;;
 ;;531
 ;;
 ;;532
 ;;
 ;;528
 ;;
 ;;529
 ;;
 ;;530
 ;;
 ;;1516
 ;;
 ;;1517
 ;;
 ;;1519
 ;;
 ;;1503
 ;;
 ;;1504
 ;;
 ;;1505
 ;;
 ;;1506
 ;;
 ;;1507
 ;;
 ;;1508
 ;;
 ;;1509
 ;;
 ;;1510
 ;;
 ;;1511
 ;;
 ;;1512
 ;;
 ;;1513
 ;;
 ;;1514
 ;;
 ;;1521
 ;;
 ;;1520
 ;;
 ;;1515
 ;;
 ;;1518
 ;;
 ;;3125
 ;;
 ;;3126
 ;;
 ;;3127
 ;;
 ;;3119
 ;;
 ;;3120
 ;;
 ;;3121
 ;;
 ;;3122
 ;;
 ;;3123
 ;;
 ;;3129
 ;;
 ;;3128
 ;;
 ;;3124
 ;;
 ;;1501
 ;;
 ;;1489
 ;;
 ;;1490
 ;;
 ;;1491
 ;;
 ;;1492
 ;;
 ;;1493
 ;;
 ;;1494
 ;;
 ;;1495
 ;;
 ;;1496
 ;;
 ;;1497
 ;;
 ;;1498
 ;;
 ;;1499
 ;;
 ;;1500
 ;;
 ;;1502
 ;;
 ;;1032
 ;;
 ;;1033
 ;;
 ;;1034
 ;;
 ;;1026
 ;;
 ;;1027
 ;;
 ;;1028
 ;;
 ;;1029
 ;;
 ;;1030
 ;;
 ;;1036
 ;;
 ;;1035
 ;;
 ;;1031
 ;;
 ;;1633
 ;;
 ;;1625
 ;;
 ;;1626
 ;;
 ;;1627
 ;;
 ;;1629
 ;;
 ;;1628
 ;;
 ;;1630
 ;;
 ;;1631
 ;;
 ;;1632
 ;;
 ;;2439
 ;;
 ;;228
 ;;
 ;;1332
 ;;
 ;;1333
 ;;
 ;;295
 ;;
 ;;294
 ;;
 ;;890
 ;;
 ;;823
 ;;
 ;;2933
 ;;
 ;;2934
 ;;
 ;;2825
 ;;
 ;;264
 ;;
 ;;265
 ;;
 ;;2111
 ;;
 ;;2018
 ;;
 ;;2019
 ;;
 ;;737
 ;;
 ;;738
 ;;
 ;;739
 ;;
 ;;2772
 ;;
 ;;2770
 ;;
 ;;2771
 ;;
 ;;2782
 ;;
 ;;2783
 ;;
 ;;2788
 ;;
 ;;2791
 ;;
 ;;2795
 ;;
 ;;2798
 ;;
 ;;2763
 ;;
 ;;1015
 ;;
 ;;1477
 ;;
 ;;1478
 ;;
 ;;3549
 ;;
 ;;3554
 ;;
 ;;3090
 ;;
 ;;3098
 ;;
 ;;1474
 ;;
 ;;953
 ;;
 ;;952
 ;;
 ;;3403
 ;;
 ;;1099
 ;;
 ;;1569
 ;;
 ;;1570
 ;;
 ;;3227
 ;;
 ;;3228
 ;;
 ;;1713
 ;;
 ;;1714
 ;;
 ;;1715
 ;;
 ;;1716
 ;;
 ;;1717
 ;;
 ;;1712
 ;;
 ;;3236
 ;;
 ;;3237
 ;;
 ;;3362
 ;;
 ;;3445
 ;;
 ;;2844
 ;;
 ;;3189
 ;;
 ;;772
 ;;
 ;;773
 ;;
 ;;775
 ;;
 ;;780
 ;;
 ;;3355
 ;;
 ;;922
 ;;
 ;;1718
 ;;
 ;;1719
 ;;
 ;;1720
 ;;
 ;;1721
 ;;
 ;;1722
 ;;
 ;;1723
 ;;
 ;;1726
 ;;
 ;;1724
 ;;
 ;;1725
 ;;
 ;;605
 ;;
 ;;2472
 ;;
 ;;2473
 ;;
 ;;2469
 ;;
 ;;2470
 ;;
 ;;2471
 ;;
 ;;2474
 ;;
 ;;2476
 ;;
 ;;2475
 ;;
 ;;339
 ;;
 ;;340
 ;;
 ;;341
 ;;
 ;;342
 ;;
 ;;3219
 ;;
 ;;3220
 ;;
 ;;807
 ;;
 ;;808
 ;;
 ;;809
 ;;
 ;;1222
 ;;
 ;;1522
 ;;
 ;;1523
 ;;
 ;;1337
 ;;
 ;;1829
 ;;
 ;;1827
 ;;
 ;;1828
 ;;
 ;;1832
 ;;
 ;;1830
 ;;
 ;;1831
 ;;
 ;;2902
 ;;
 ;;2903
 ;;
 ;;896
 ;;
 ;;3311
 ;;
 ;;3312
 ;;
 ;;3313
 ;;
 ;;2904
 ;;
 ;;2905
 ;;
 ;;2906
 ;;
 ;;3596
 ;;
 ;;3597
 ;;
 ;;3117
 ;;
 ;;3118
 ;;
 ;;533
 ;;
 ;;534
 ;;
 ;;244
 ;;
 ;;245
 ;;
 ;;3409
 ;;
 ;;3412
 ;;
 ;;3411
 ;;
 ;;3410
 ;;
 ;;3413
 ;;
 ;;3416
 ;;
 ;;3417
 ;;
 ;;3418
 ;;
 ;;3414
 ;;
 ;;3415
 ;;
 ;;3419
 ;;
 ;;1597
 ;;
 ;;1599
 ;;
 ;;1600
 ;;
 ;;1598
 ;;
 ;;1601
 ;;
 ;;1604
 ;;
 ;;1605
 ;;
 ;;1602
 ;;
 ;;1603
 ;;
 ;;1606
 ;;
 ;;2703
 ;;
 ;;2704
 ;;
 ;;2706
 ;;
 ;;2707
 ;;
 ;;2705
 ;;
 ;;2708
 ;;
 ;;2711
 ;;
 ;;2712
 ;;
 ;;2713
 ;;
 ;;2709
 ;;
 ;;2710
 ;;
 ;;2714
 ;;
 ;;2715
 ;;
 ;;2716
 ;;
 ;;2718
 ;;
 ;;2719
 ;;
 ;;2717
 ;;
 ;;2720
 ;;
 ;;2723
 ;;
 ;;2724
 ;;
 ;;2725
 ;;
 ;;2721
 ;;
 ;;2722
 ;;
 ;;2726
 ;;
 ;;2727
 ;;
 ;;2728
 ;;
 ;;2730
 ;;
 ;;2731
 ;;
 ;;2729
 ;;
 ;;2732
 ;;
 ;;2735
 ;;
 ;;2736
 ;;
 ;;2737
 ;;
 ;;2733
 ;;
 ;;2734
 ;;
 ;;2738
 ;;
 ;;3060
 ;;
 ;;3062
 ;;
 ;;3063
 ;;
 ;;3061
 ;;
 ;;3064
 ;;
 ;;3067
