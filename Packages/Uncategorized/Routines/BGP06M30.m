BGP06M30 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
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
 ;;729
 ;;
 ;;731
 ;;
 ;;732
 ;;
 ;;733
 ;;
 ;;2397
 ;;
 ;;2398
 ;;
 ;;2744
 ;;
 ;;2745
 ;;
 ;;2746
 ;;
 ;;2747
 ;;
 ;;2748
 ;;
 ;;2749
 ;;
 ;;2750
 ;;
 ;;2751
 ;;
 ;;2752
 ;;
 ;;2753
 ;;
 ;;2754
 ;;
 ;;2755
 ;;
 ;;2756
 ;;
 ;;2757
 ;;
 ;;2758
 ;;
 ;;2759
 ;;
 ;;2760
 ;;
 ;;2761
 ;;
 ;;3082
 ;;
 ;;3083
 ;;
 ;;3084
 ;;
 ;;3085
 ;;
 ;;1463
 ;;
 ;;1464
 ;;
 ;;1465
 ;;
 ;;1466
 ;;
 ;;1467
 ;;
 ;;1468
 ;;
 ;;1249
 ;;
 ;;1250
 ;;
 ;;1251
 ;;
 ;;1252
 ;;
 ;;1006
 ;;
 ;;1007
 ;;
 ;;1008
 ;;
 ;;1009
 ;;
 ;;900
 ;;
 ;;901
 ;;
 ;;1005
 ;;
 ;;182
 ;;
 ;;183
 ;;
 ;;184
 ;;
 ;;3274
 ;;
 ;;3275
 ;;
 ;;3276
 ;;
 ;;3277
 ;;
 ;;869
 ;;
 ;;1165
 ;;
 ;;1166
 ;;
 ;;1167
 ;;
 ;;1607
 ;;
 ;;486
 ;;
 ;;1168
 ;;
 ;;1169
 ;;
 ;;730
 ;;
 ;;2291
 ;;
 ;;2292
 ;;
 ;;2293
 ;;
 ;;2294
 ;;
 ;;2295
 ;;
 ;;2296
 ;;
 ;;2297
 ;;
 ;;2298
 ;;
 ;;164
 ;;
 ;;165
 ;;
 ;;1153
 ;;
 ;;2278
 ;;
 ;;2279
 ;;
 ;;2280
 ;;
 ;;2281
 ;;
 ;;863
 ;;
 ;;864
 ;;
 ;;166
 ;;
 ;;167
 ;;
 ;;2282
 ;;
 ;;2283
 ;;
 ;;2284
 ;;
 ;;2285
 ;;
 ;;2286
 ;;
 ;;2287
 ;;
 ;;2288
 ;;
 ;;2289
 ;;
 ;;2290
 ;;
 ;;2392
 ;;
 ;;2393
 ;;
 ;;1424
 ;;
 ;;1425
 ;;
 ;;1426
 ;;
 ;;1427
 ;;
 ;;716
 ;;
 ;;982
 ;;
 ;;983
 ;;
 ;;3325
 ;;
 ;;3521
 ;;
 ;;3522
 ;;
 ;;3523
 ;;
 ;;453
 ;;
 ;;454
 ;;
 ;;2677
 ;;
 ;;2678
 ;;
 ;;2679
 ;;
 ;;2681
 ;;
 ;;2682
 ;;
 ;;2680
 ;;
 ;;2683
 ;;
 ;;2684
 ;;
 ;;2672
 ;;
 ;;2673
 ;;
 ;;2674
 ;;
 ;;2675
 ;;
 ;;2676
 ;;
 ;;3051
 ;;
 ;;3052
 ;;
 ;;3053
 ;;
 ;;3054
 ;;
 ;;3049
 ;;
 ;;3050
 ;;
 ;;450
 ;;
 ;;451
 ;;
 ;;452
 ;;
 ;;2541
 ;;
 ;;2542
 ;;
 ;;2545
 ;;
 ;;2546
 ;;
 ;;2547
 ;;
 ;;2549
 ;;
 ;;2551
 ;;
 ;;2552
 ;;
 ;;3513
 ;;
 ;;3514
 ;;
 ;;3515
 ;;
 ;;3520
 ;;
 ;;3516
 ;;
 ;;3517
 ;;
 ;;3518
 ;;
 ;;3519
 ;;
 ;;8
 ;;
 ;;9
 ;;
 ;;154
 ;;
 ;;155
 ;;
 ;;156
 ;;
 ;;157
 ;;
 ;;158
 ;;
 ;;159
 ;;
 ;;160
 ;;
 ;;161
 ;;
 ;;447
 ;;
 ;;448
 ;;
 ;;449
 ;;
 ;;1549
 ;;
 ;;2253
 ;;
 ;;2254
 ;;
 ;;2255
 ;;
 ;;2256
 ;;
 ;;2257
 ;;
 ;;2258
 ;;
 ;;2265
 ;;
 ;;2259
 ;;
 ;;2260
 ;;
 ;;2261
 ;;
 ;;2262
 ;;
 ;;2263
 ;;
 ;;2264
 ;;
 ;;2267
 ;;
 ;;2268
 ;;
 ;;2269
 ;;
 ;;2270
 ;;
 ;;2271
 ;;
 ;;2272
 ;;
 ;;2273
 ;;
 ;;2274
 ;;
 ;;2275
 ;;
 ;;2277
 ;;
 ;;710
 ;;
 ;;711
 ;;
 ;;712
 ;;
 ;;713
 ;;
 ;;714
 ;;
 ;;715
 ;;
 ;;2389
 ;;
 ;;2390
 ;;
 ;;2391
 ;;
 ;;861
 ;;
 ;;862
 ;;
 ;;1148
 ;;
 ;;1145
 ;;
 ;;1146
 ;;
 ;;1147
 ;;
 ;;1149
 ;;
 ;;1150
 ;;
 ;;1151
 ;;
 ;;1152
 ;;
 ;;2655
 ;;
 ;;2656
 ;;
 ;;2657
 ;;
 ;;2658
 ;;
 ;;2659
 ;;
 ;;2660
 ;;
 ;;2661
 ;;
 ;;2662
 ;;
 ;;2663
 ;;
 ;;2664
 ;;
 ;;2665
 ;;
 ;;2666
 ;;
 ;;2667
 ;;
 ;;2668
 ;;
 ;;2669
 ;;
 ;;2670
 ;;
 ;;2671
 ;;
 ;;3044
 ;;
 ;;3045
 ;;
 ;;3046
 ;;
 ;;3047
 ;;
 ;;3048
 ;;
 ;;3264
 ;;
 ;;3265
 ;;
 ;;1418
 ;;
 ;;1419
 ;;
 ;;1420
 ;;
 ;;1421
 ;;
 ;;1422
 ;;
 ;;1423
 ;;
 ;;980
 ;;
 ;;981
 ;;
 ;;3407
 ;;
 ;;1416
 ;;
 ;;1417
 ;;
 ;;3373
 ;;
 ;;3374
 ;;
 ;;3375
 ;;
 ;;1301
 ;;
 ;;1304
 ;;
 ;;1302
 ;;
 ;;163
 ;;
 ;;3376
 ;;
 ;;3408
 ;;
 ;;1303
 ;;
 ;;2276
 ;;
 ;;2266
 ;;
 ;;479
 ;;
 ;;480
 ;;
 ;;481
 ;;
 ;;3272
 ;;
 ;;3273
 ;;
 ;;2051
 ;;
 ;;2048
 ;;
 ;;2049
 ;;
 ;;2050
 ;;
 ;;180
 ;;
 ;;181
 ;;
 ;;1163
 ;;
 ;;1164
 ;;
 ;;15
 ;;
 ;;868
 ;;
 ;;1460
 ;;
 ;;1461
 ;;
 ;;1462
 ;;
 ;;2741
 ;;
 ;;2742
 ;;
 ;;2743
