BGP0ZD3 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"52959-0224-08 ")
 ;;907
 ;;21,"52959-0224-10 ")
 ;;908
 ;;21,"52959-0224-12 ")
 ;;909
 ;;21,"52959-0224-14 ")
 ;;910
 ;;21,"52959-0224-15 ")
 ;;911
 ;;21,"52959-0224-20 ")
 ;;912
 ;;21,"52959-0224-30 ")
 ;;913
 ;;21,"52959-0224-40 ")
 ;;914
 ;;21,"52959-0224-60 ")
 ;;915
 ;;21,"52959-0227-14 ")
 ;;1262
 ;;21,"52959-0227-15 ")
 ;;1263
 ;;21,"52959-0227-20 ")
 ;;1264
 ;;21,"52959-0227-28 ")
 ;;1265
 ;;21,"52959-0227-30 ")
 ;;1266
 ;;21,"52959-0227-40 ")
 ;;1267
 ;;21,"52959-0227-60 ")
 ;;1268
 ;;21,"52959-0232-07 ")
 ;;1481
 ;;21,"52959-0232-09 ")
 ;;1482
 ;;21,"52959-0232-10 ")
 ;;1361
 ;;21,"52959-0232-14 ")
 ;;1362
 ;;21,"52959-0232-15 ")
 ;;1363
 ;;21,"52959-0232-18 ")
 ;;1364
 ;;21,"52959-0232-20 ")
 ;;1365
 ;;21,"52959-0232-21 ")
 ;;1366
 ;;21,"52959-0232-30 ")
 ;;1367
 ;;21,"52959-0232-60 ")
 ;;1483
 ;;21,"52959-0245-15 ")
 ;;2405
 ;;21,"52959-0245-20 ")
 ;;2350
 ;;21,"52959-0245-21 ")
 ;;2406
 ;;21,"52959-0245-30 ")
 ;;2351
 ;;21,"52959-0252-01 ")
 ;;3347
 ;;21,"52959-0252-14 ")
 ;;3337
 ;;21,"52959-0252-15 ")
 ;;3338
 ;;21,"52959-0252-20 ")
 ;;3339
 ;;21,"52959-0252-21 ")
 ;;3340
 ;;21,"52959-0252-24 ")
 ;;3341
 ;;21,"52959-0252-28 ")
 ;;3342
 ;;21,"52959-0252-30 ")
 ;;3343
 ;;21,"52959-0252-42 ")
 ;;3344
 ;;21,"52959-0252-45 ")
 ;;3345
 ;;21,"52959-0252-60 ")
 ;;3346
 ;;21,"52959-0266-03 ")
 ;;2112
 ;;21,"52959-0271-14 ")
 ;;2970
 ;;21,"52959-0271-15 ")
 ;;2971
 ;;21,"52959-0271-20 ")
 ;;2972
 ;;21,"52959-0271-28 ")
 ;;2973
 ;;21,"52959-0271-30 ")
 ;;2974
 ;;21,"52959-0271-60 ")
 ;;3103
 ;;21,"52959-0271-90 ")
 ;;2975
 ;;21,"52959-0281-14 ")
 ;;557
 ;;21,"52959-0281-20 ")
 ;;558
 ;;21,"52959-0281-30 ")
 ;;559
 ;;21,"52959-0281-60 ")
 ;;560
 ;;21,"52959-0318-14 ")
 ;;281
 ;;21,"52959-0318-20 ")
 ;;282
 ;;21,"52959-0318-30 ")
 ;;283
 ;;21,"52959-0342-00 ")
 ;;1069
 ;;21,"52959-0342-30 ")
 ;;1068
 ;;21,"52959-0347-15 ")
 ;;2444
 ;;21,"52959-0347-20 ")
 ;;2445
 ;;21,"52959-0347-30 ")
 ;;2446
 ;;21,"52959-0357-21 ")
 ;;2968
 ;;21,"52959-0357-30 ")
 ;;2969
 ;;21,"52959-0357-60 ")
 ;;3102
 ;;21,"52959-0373-20 ")
 ;;1269
 ;;21,"52959-0373-28 ")
 ;;1270
 ;;21,"52959-0373-30 ")
 ;;1271
 ;;21,"52959-0373-40 ")
 ;;1272
 ;;21,"52959-0377-30 ")
 ;;42
 ;;21,"52959-0377-60 ")
 ;;43
 ;;21,"52959-0379-15 ")
 ;;3383
 ;;21,"52959-0379-20 ")
 ;;3384
 ;;21,"52959-0379-30 ")
 ;;3385
 ;;21,"52959-0398-00 ")
 ;;1480
 ;;21,"52959-0398-10 ")
 ;;1357
 ;;21,"52959-0398-20 ")
 ;;1358
 ;;21,"52959-0398-21 ")
 ;;1359
 ;;21,"52959-0398-30 ")
 ;;1360
 ;;21,"52959-0416-30 ")
 ;;278
 ;;21,"52959-0423-10 ")
 ;;193
 ;;21,"52959-0423-14 ")
 ;;45
 ;;21,"52959-0423-15 ")
 ;;194
 ;;21,"52959-0423-20 ")
 ;;46
 ;;21,"52959-0423-21 ")
 ;;195
 ;;21,"52959-0423-28 ")
 ;;47
 ;;21,"52959-0423-30 ")
 ;;48
 ;;21,"52959-0423-60 ")
 ;;49
 ;;21,"52959-0436-14 ")
 ;;187
 ;;21,"52959-0436-20 ")
 ;;188
 ;;21,"52959-0436-28 ")
 ;;189
 ;;21,"52959-0436-30 ")
 ;;190
 ;;21,"52959-0436-40 ")
 ;;44
 ;;21,"52959-0436-60 ")
 ;;191
 ;;21,"52959-0436-90 ")
 ;;192
 ;;21,"52959-0445-20 ")
 ;;561
 ;;21,"52959-0445-30 ")
 ;;562
 ;;21,"52959-0455-60 ")
 ;;3218
 ;;21,"52959-0456-30 ")
 ;;3216
 ;;21,"52959-0456-40 ")
 ;;3217
 ;;21,"52959-0467-14 ")
 ;;576
 ;;21,"52959-0467-30 ")
 ;;577
 ;;21,"52959-0471-12 ")
 ;;498
 ;;21,"52959-0471-14 ")
 ;;499
 ;;21,"52959-0471-15 ")
 ;;500
 ;;21,"52959-0471-20 ")
 ;;501
 ;;21,"52959-0471-28 ")
 ;;502
 ;;21,"52959-0471-30 ")
 ;;503
 ;;21,"52959-0471-60 ")
 ;;504
 ;;21,"52959-0471-90 ")
 ;;505
 ;;21,"52959-0472-20 ")
 ;;297
 ;;21,"52959-0483-20 ")
 ;;495
 ;;21,"52959-0483-21 ")
 ;;496
 ;;21,"52959-0483-30 ")
 ;;497
 ;;21,"52959-0503-21 ")
 ;;2404
 ;;21,"52959-0503-40 ")
 ;;2349
 ;;21,"52959-0512-08 ")
 ;;873
 ;;21,"52959-0512-10 ")
 ;;874
 ;;21,"52959-0512-12 ")
 ;;875
 ;;21,"52959-0512-14 ")
 ;;876
 ;;21,"52959-0512-15 ")
 ;;877
 ;;21,"52959-0512-20 ")
 ;;878
 ;;21,"52959-0512-40 ")
 ;;880
 ;;21,"52959-0512-60 ")
 ;;881
 ;;21,"52959-0516-02 ")
 ;;2947
 ;;21,"52959-0516-10 ")
 ;;2941
 ;;21,"52959-0516-14 ")
 ;;2942
 ;;21,"52959-0516-15 ")
 ;;2932
 ;;21,"52959-0516-20 ")
 ;;2943
 ;;21,"52959-0516-30 ")
 ;;2944
 ;;21,"52959-0516-40 ")
 ;;2945
 ;;21,"52959-0516-60 ")
 ;;2946
 ;;21,"52959-0520-10 ")
 ;;2352
 ;;21,"52959-0520-15 ")
 ;;2353
 ;;21,"52959-0520-20 ")
 ;;2354
 ;;21,"52959-0520-30 ")
 ;;2355
 ;;21,"52959-0525-14 ")
 ;;318
 ;;21,"52959-0525-20 ")
 ;;319
 ;;21,"52959-0525-30 ")
 ;;320
 ;;21,"52959-0530-14 ")
 ;;506
 ;;21,"52959-0530-20 ")
 ;;507
 ;;21,"52959-0530-28 ")
 ;;508
 ;;21,"52959-0530-45 ")
 ;;510
 ;;21,"52959-0530-60 ")
 ;;511
 ;;21,"52959-0531-20 ")
 ;;314
 ;;21,"52959-0531-30 ")
 ;;315
 ;;21,"52959-0531-42 ")
 ;;316
 ;;21,"52959-0531-60 ")
 ;;317
 ;;21,"52959-0539-00 ")
 ;;3577
 ;;21,"52959-0539-05 ")
 ;;3563
 ;;21,"52959-0539-07 ")
 ;;3564
 ;;21,"52959-0539-10 ")
 ;;3565
 ;;21,"52959-0539-14 ")
 ;;3566
 ;;21,"52959-0539-15 ")
 ;;3567
 ;;21,"52959-0539-20 ")
 ;;3568
 ;;21,"52959-0539-21 ")
 ;;3569
 ;;21,"52959-0539-28 ")
 ;;3570
 ;;21,"52959-0539-30 ")
 ;;3571
 ;;21,"52959-0539-40 ")
 ;;3572
 ;;21,"52959-0539-45 ")
 ;;3573
 ;;21,"52959-0539-50 ")
 ;;3574
 ;;21,"52959-0539-60 ")
 ;;3575
 ;;21,"52959-0539-90 ")
 ;;3576
 ;;21,"52959-0540-14 ")
 ;;3556
 ;;21,"52959-0540-15 ")
 ;;3557
 ;;21,"52959-0540-20 ")
 ;;3558
 ;;21,"52959-0540-21 ")
 ;;3559
 ;;21,"52959-0540-28 ")
 ;;3560
 ;;21,"52959-0540-30 ")
 ;;3561
 ;;21,"52959-0540-40 ")
 ;;3562
 ;;21,"52959-0594-03 ")
 ;;284
 ;;21,"52959-0623-00 ")
 ;;1313
 ;;21,"52959-0623-20 ")
 ;;1310
 ;;21,"52959-0623-30 ")
 ;;1311
 ;;21,"52959-0623-60 ")
 ;;1312
 ;;21,"52959-0649-30 ")
 ;;509
 ;;21,"52959-0650-14 ")
 ;;1173
 ;;21,"52959-0650-20 ")
 ;;1174
 ;;21,"52959-0650-30 ")
 ;;1175
 ;;21,"52959-0650-40 ")
 ;;1176
 ;;21,"52959-0650-60 ")
 ;;1177
 ;;21,"52959-0656-20 ")
 ;;1178
 ;;21,"52959-0656-30 ")
 ;;1179
 ;;21,"52959-0656-40 ")
 ;;1180
 ;;21,"52959-0656-60 ")
 ;;1181
 ;;21,"52959-0659-20 ")
 ;;17
 ;;21,"52959-0659-28 ")
 ;;18
 ;;21,"52959-0659-40 ")
 ;;19
 ;;21,"52959-0663-14 ")
 ;;1314
 ;;21,"52959-0663-30 ")
 ;;1315
 ;;21,"52959-0663-60 ")
 ;;1316
 ;;21,"52959-0663-90 ")
 ;;1317
 ;;21,"52959-0800-00 ")
 ;;3291
 ;;21,"52959-0800-14 ")
 ;;3280
 ;;21,"52959-0800-15 ")
 ;;3281
 ;;21,"52959-0800-20 ")
 ;;3282
 ;;21,"52959-0800-21 ")
 ;;3283
 ;;21,"52959-0800-24 ")
 ;;3284
 ;;21,"52959-0800-28 ")
 ;;3285
 ;;21,"52959-0800-30 ")
 ;;3286
 ;;21,"52959-0800-40 ")
 ;;3287
 ;;21,"52959-0800-42 ")
 ;;3288
 ;;21,"52959-0800-45 ")
 ;;3289
 ;;21,"52959-0800-60 ")
 ;;3290
 ;;21,"52989-0512-30 ")
 ;;879
 ;;21,"53265-0267-10 ")
 ;;588
 ;;21,"53265-0267-11 ")
 ;;589
 ;;21,"53265-0268-10 ")
 ;;590
 ;;21,"53265-0268-50 ")
 ;;591
 ;;21,"53265-0269-10 ")
 ;;593
 ;;21,"53265-0269-11 ")
 ;;594
 ;;21,"53265-0269-60 ")
 ;;592
 ;;21,"53265-0363-10 ")
 ;;2956
 ;;21,"53265-0363-11 ")
 ;;2958
 ;;21,"53265-0363-50 ")
 ;;2957
 ;;21,"53265-0364-10 ")
 ;;2959
 ;;21,"53265-0364-11 ")
 ;;2961
 ;;21,"53265-0364-50 ")
 ;;2960
 ;;21,"53489-0478-01 ")
 ;;924
 ;;21,"53489-0478-05 ")
 ;;925
 ;;21,"53489-0479-01 ")
 ;;926
 ;;21,"53489-0479-05 ")
 ;;927
 ;;21,"53489-0506-01 ")
 ;;1050
 ;;21,"53716-0189-50 ")
 ;;2484
 ;;21,"53746-0131-01 ")
 ;;1734
 ;;21,"53746-0131-05 ")
 ;;1737
 ;;21,"53746-0131-18 ")
 ;;1735
 ;;21,"53746-0131-24 ")
 ;;1730
 ;;21,"53746-0131-27 ")
 ;;1736
 ;;21,"53746-0131-50 ")
 ;;1731
 ;;21,"53746-0131-60 ")
 ;;1732
 ;;21,"53746-0131-90 ")
 ;;1733
 ;;21,"53746-0132-01 ")
 ;;1743
 ;;21,"53746-0132-05 ")
 ;;1746
 ;;21,"53746-0132-18 ")
 ;;1744
 ;;21,"53746-0132-24 ")
 ;;1738
 ;;21,"53746-0132-27 ")
 ;;1745
 ;;21,"53746-0132-30 ")
 ;;1739
 ;;21,"53746-0132-50 ")
 ;;1740
 ;;21,"53746-0132-60 ")
 ;;1741
 ;;21,"53746-0132-90 ")
 ;;1742
 ;;21,"53746-0137-01 ")
 ;;1750
 ;;21,"53746-0137-05 ")
 ;;1751
 ;;21,"53746-0137-24 ")
 ;;1747
 ;;21,"53746-0137-50 ")
 ;;1748
 ;;21,"53746-0137-90 ")
 ;;1749
 ;;21,"53746-0188-01 ")
 ;;2482
 ;;21,"53746-0188-05 ")
 ;;2483
 ;;21,"53746-0188-50 ")
 ;;2481
 ;;21,"53746-0189-01 ")
 ;;2485
 ;;21,"53746-0189-05 ")
 ;;2486
 ;;21,"53746-0190-01 ")
 ;;2488
 ;;21,"53746-0190-05 ")
 ;;2489
 ;;21,"53746-0190-50 ")
 ;;2487
 ;;21,"54560-4002-01 ")
 ;;1671
 ;;21,"54569-0275-00 ")
 ;;652
 ;;21,"54569-0275-01 ")
 ;;653
 ;;21,"54569-0275-05 ")
 ;;651
 ;;21,"54569-0277-01 ")
 ;;649
 ;;21,"54569-0277-03 ")
 ;;650
 ;;21,"54569-0277-04 ")
 ;;647
 ;;21,"54569-0285-01 ")
 ;;1664
 ;;21,"54569-0285-02 ")
 ;;1666
 ;;21,"54569-0285-03 ")
 ;;2136
 ;;21,"54569-0285-04 ")
 ;;1661
 ;;21,"54569-0285-05 ")
 ;;1665
 ;;21,"54569-0285-06 ")
 ;;1662
 ;;21,"54569-0285-07 ")
 ;;1660
 ;;21,"54569-0285-08 ")
 ;;2134
 ;;21,"54569-0287-00 ")
 ;;2137
 ;;21,"54569-0287-01 ")
 ;;1668
 ;;21,"54569-0287-02 ")
 ;;1669
 ;;21,"54569-0287-03 ")
 ;;1674
 ;;21,"54569-0287-04 ")
 ;;1676
 ;;21,"54569-0287-05 ")
 ;;2140
 ;;21,"54569-0287-07 ")
 ;;1675
 ;;21,"54569-0287-08 ")
 ;;1670
 ;;21,"54569-0287-09 ")
 ;;1672
 ;;21,"54569-0287-60 ")
 ;;2141
 ;;21,"54569-0289-00 ")
 ;;2145
 ;;21,"54569-0289-01 ")
 ;;1678
 ;;21,"54569-0289-02 ")
 ;;1681
 ;;21,"54569-0289-03 ")
 ;;1684
 ;;21,"54569-0289-04 ")
 ;;1685
 ;;21,"54569-0289-05 ")
 ;;1686
 ;;21,"54569-0289-06 ")
 ;;2148
 ;;21,"54569-0289-07 ")
 ;;1680
 ;;21,"54569-0289-08 ")
 ;;1677
 ;;21,"54569-0289-09 ")
 ;;1682
 ;;21,"54569-0293-01 ")
 ;;3152
 ;;21,"54569-0294-01 ")
 ;;3154
 ;;21,"54569-0294-02 ")
 ;;3155
 ;;21,"54569-0296-06 ")
 ;;3437
 ;;21,"54569-1467-07 ")
 ;;1085
 ;;21,"54569-1518-00 ")
 ;;657
 ;;21,"54569-1518-01 ")
 ;;654
 ;;21,"54569-1518-02 ")
 ;;655
 ;;21,"54569-1518-03 ")
 ;;656
 ;;21,"54569-1763-03 ")
 ;;3198
 ;;21,"54569-2105-01 ")
 ;;1543
 ;;21,"54569-2155-01 ")
 ;;266
 ;;21,"54569-2526-01 ")
 ;;1095
 ;;21,"54569-2526-05 ")
 ;;1094
 ;;21,"54569-3264-02 ")
 ;;537
 ;;21,"54569-3264-03 ")
 ;;539
 ;;21,"54569-3264-04 ")
 ;;538
 ;;21,"54569-3332-00 ")
 ;;2142
 ;;21,"54569-3332-01 ")
 ;;1679
 ;;21,"54569-3332-02 ")
 ;;1683
 ;;21,"54569-3332-03 ")
 ;;2144
 ;;21,"54569-3332-04 ")
 ;;2147
 ;;21,"54569-3332-05 ")
 ;;2149
 ;;21,"54569-3332-06 ")
 ;;2143
 ;;21,"54569-3332-07 ")
 ;;2146
 ;;21,"54569-3332-08 ")
 ;;2150
 ;;21,"54569-3336-00 ")
 ;;954
 ;;21,"54569-3535-00 ")
 ;;1234
 ;;21,"54569-3535-01 ")
 ;;1228
 ;;21,"54569-3535-02 ")
 ;;1231
 ;;21,"54569-3535-03 ")
 ;;1233
 ;;21,"54569-3535-04 ")
 ;;1227
 ;;21,"54569-3535-05 ")
 ;;1229
 ;;21,"54569-3535-06 ")
 ;;1230
 ;;21,"54569-3535-07 ")
 ;;1232
 ;;21,"54569-3539-01 ")
 ;;898
 ;;21,"54569-3658-00 ")
 ;;3404
 ;;21,"54569-3658-01 ")
 ;;3405
 ;;21,"54569-3658-02 ")
 ;;3406
 ;;21,"54569-3688-00 ")
 ;;2378
 ;;21,"54569-3688-01 ")
 ;;2376
 ;;21,"54569-3688-02 ")
 ;;2374
 ;;21,"54569-3688-03 ")
 ;;2375
 ;;21,"54569-3688-04 ")
 ;;2377
 ;;21,"54569-3690-05 ")
 ;;1382
 ;;21,"54569-3693-00 ")
 ;;1381
 ;;21,"54569-3693-01 ")
 ;;1380
 ;;21,"54569-3693-03 ")
 ;;1383
 ;;21,"54569-3693-04 ")
 ;;1384
 ;;21,"54569-3693-07 ")
 ;;1526
 ;;21,"54569-3702-00 ")
 ;;3318
 ;;21,"54569-3702-01 ")
 ;;3317
 ;;21,"54569-3730-02 ")
 ;;1055
 ;;21,"54569-3758-00 ")
 ;;2570
 ;;21,"54569-3758-01 ")
 ;;2573
 ;;21,"54569-3758-02 ")
 ;;2571
 ;;21,"54569-3758-04 ")
 ;;2572
 ;;21,"54569-3759-00 ")
 ;;2574
 ;;21,"54569-3759-01 ")
 ;;2578
 ;;21,"54569-3759-02 ")
 ;;2579
 ;;21,"54569-3759-03 ")
 ;;2575
 ;;21,"54569-3759-04 ")
 ;;2577
 ;;21,"54569-3759-05 ")
 ;;2576
 ;;21,"54569-3759-06 ")
 ;;2581
 ;;21,"54569-3759-08 ")
 ;;2582
 ;;21,"54569-3759-09 ")
 ;;2580
 ;;21,"54569-3760-00 ")
 ;;2586
 ;;21,"54569-3760-01 ")
 ;;2587
 ;;21,"54569-3760-02 ")
 ;;2589
 ;;21,"54569-3760-03 ")
 ;;2584
 ;;21,"54569-3760-04 ")
 ;;2585
 ;;21,"54569-3760-05 ")
 ;;2590
 ;;21,"54569-3760-06 ")
 ;;2593
 ;;21,"54569-3760-07 ")
 ;;2591
 ;;21,"54569-3761-00 ")
 ;;2999
 ;;21,"54569-3761-02 ")
 ;;3000
 ;;21,"54569-3761-04 ")
 ;;2998
 ;;21,"54569-3762-00 ")
 ;;3001
 ;;21,"54569-3762-02 ")
 ;;3003
 ;;21,"54569-3762-03 ")
 ;;3004
 ;;21,"54569-3762-04 ")
 ;;3005
 ;;21,"54569-3762-05 ")
 ;;3006
 ;;21,"54569-3762-07 ")
 ;;3002
 ;;21,"54569-3764-00 ")
 ;;542
 ;;21,"54569-3764-02 ")
 ;;541
 ;;21,"54569-3792-00 ")
 ;;2442
 ;;21,"54569-3792-01 ")
 ;;2441
 ;;21,"54569-3820-00 ")
 ;;2135
 ;;21,"54569-3820-01 ")
 ;;1659
 ;;21,"54569-3820-02 ")
 ;;1663
 ;;21,"54569-3825-02 ")
 ;;3371
 ;;21,"54569-3845-00 ")
 ;;1238
 ;;21,"54569-3845-01 ")
 ;;1236
 ;;21,"54569-3845-02 ")
 ;;1237
 ;;21,"54569-3857-00 ")
 ;;1584
 ;;21,"54569-3858-00 ")
 ;;1585
 ;;21,"54569-3858-03 ")
 ;;1586
 ;;21,"54569-3974-00 ")
 ;;1379
 ;;21,"54569-3982-00 ")
 ;;3153
 ;;21,"54569-3982-01 ")
 ;;3210
 ;;21,"54569-4002-00 ")
 ;;2138