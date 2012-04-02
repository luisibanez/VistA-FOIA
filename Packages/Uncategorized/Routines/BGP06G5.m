BGP06G5 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"534,54868-5858-00 ",.01)
 ;;54868-5858-00
 ;;9002226.02101,"534,54868-5858-00 ",.02)
 ;;54868-5858-00
 ;;9002226.02101,"534,55045-1868-03 ",.01)
 ;;55045-1868-03
 ;;9002226.02101,"534,55045-1868-03 ",.02)
 ;;55045-1868-03
 ;;9002226.02101,"534,55045-2043-07 ",.01)
 ;;55045-2043-07
 ;;9002226.02101,"534,55045-2043-07 ",.02)
 ;;55045-2043-07
 ;;9002226.02101,"534,55045-2390-05 ",.01)
 ;;55045-2390-05
 ;;9002226.02101,"534,55045-2390-05 ",.02)
 ;;55045-2390-05
 ;;9002226.02101,"534,55045-2470-02 ",.01)
 ;;55045-2470-02
 ;;9002226.02101,"534,55045-2470-02 ",.02)
 ;;55045-2470-02
 ;;9002226.02101,"534,55045-2520-07 ",.01)
 ;;55045-2520-07
 ;;9002226.02101,"534,55045-2520-07 ",.02)
 ;;55045-2520-07
 ;;9002226.02101,"534,55045-2819-00 ",.01)
 ;;55045-2819-00
 ;;9002226.02101,"534,55045-2819-00 ",.02)
 ;;55045-2819-00
 ;;9002226.02101,"534,55045-2919-01 ",.01)
 ;;55045-2919-01
 ;;9002226.02101,"534,55045-2919-01 ",.02)
 ;;55045-2919-01
 ;;9002226.02101,"534,55045-3054-01 ",.01)
 ;;55045-3054-01
 ;;9002226.02101,"534,55045-3054-01 ",.02)
 ;;55045-3054-01
 ;;9002226.02101,"534,55045-3063-00 ",.01)
 ;;55045-3063-00
 ;;9002226.02101,"534,55045-3063-00 ",.02)
 ;;55045-3063-00
 ;;9002226.02101,"534,55045-3351-00 ",.01)
 ;;55045-3351-00
 ;;9002226.02101,"534,55045-3351-00 ",.02)
 ;;55045-3351-00
 ;;9002226.02101,"534,55045-3354-00 ",.01)
 ;;55045-3354-00
 ;;9002226.02101,"534,55045-3354-00 ",.02)
 ;;55045-3354-00
 ;;9002226.02101,"534,55045-3388-01 ",.01)
 ;;55045-3388-01
 ;;9002226.02101,"534,55045-3388-01 ",.02)
 ;;55045-3388-01
 ;;9002226.02101,"534,55045-3416-00 ",.01)
 ;;55045-3416-00
 ;;9002226.02101,"534,55045-3416-00 ",.02)
 ;;55045-3416-00
 ;;9002226.02101,"534,55045-3494-01 ",.01)
 ;;55045-3494-01
 ;;9002226.02101,"534,55045-3494-01 ",.02)
 ;;55045-3494-01
 ;;9002226.02101,"534,55045-3686-01 ",.01)
 ;;55045-3686-01
 ;;9002226.02101,"534,55045-3686-01 ",.02)
 ;;55045-3686-01
 ;;9002226.02101,"534,55045-3695-08 ",.01)
 ;;55045-3695-08
 ;;9002226.02101,"534,55045-3695-08 ",.02)
 ;;55045-3695-08
 ;;9002226.02101,"534,55887-0043-18 ",.01)
 ;;55887-0043-18
 ;;9002226.02101,"534,55887-0043-18 ",.02)
 ;;55887-0043-18
 ;;9002226.02101,"534,55887-0332-24 ",.01)
 ;;55887-0332-24
 ;;9002226.02101,"534,55887-0332-24 ",.02)
 ;;55887-0332-24
 ;;9002226.02101,"534,55887-0391-25 ",.01)
 ;;55887-0391-25
 ;;9002226.02101,"534,55887-0391-25 ",.02)
 ;;55887-0391-25
 ;;9002226.02101,"534,55887-0391-30 ",.01)
 ;;55887-0391-30
 ;;9002226.02101,"534,55887-0391-30 ",.02)
 ;;55887-0391-30
 ;;9002226.02101,"534,55887-0678-60 ",.01)
 ;;55887-0678-60
 ;;9002226.02101,"534,55887-0678-60 ",.02)
 ;;55887-0678-60
 ;;9002226.02101,"534,55887-0812-18 ",.01)
 ;;55887-0812-18
 ;;9002226.02101,"534,55887-0812-18 ",.02)
 ;;55887-0812-18
 ;;9002226.02101,"534,57866-0051-01 ",.01)
 ;;57866-0051-01
 ;;9002226.02101,"534,57866-0051-01 ",.02)
 ;;57866-0051-01
 ;;9002226.02101,"534,58016-4604-01 ",.01)
 ;;58016-4604-01
 ;;9002226.02101,"534,58016-4604-01 ",.02)
 ;;58016-4604-01
 ;;9002226.02101,"534,58016-4812-01 ",.01)
 ;;58016-4812-01
 ;;9002226.02101,"534,58016-4812-01 ",.02)
 ;;58016-4812-01
 ;;9002226.02101,"534,58016-4813-01 ",.01)
 ;;58016-4813-01
 ;;9002226.02101,"534,58016-4813-01 ",.02)
 ;;58016-4813-01
 ;;9002226.02101,"534,58016-6099-01 ",.01)
 ;;58016-6099-01
 ;;9002226.02101,"534,58016-6099-01 ",.02)
 ;;58016-6099-01
 ;;9002226.02101,"534,58016-6404-01 ",.01)
 ;;58016-6404-01
 ;;9002226.02101,"534,58016-6404-01 ",.02)
 ;;58016-6404-01
 ;;9002226.02101,"534,58016-6537-01 ",.01)
 ;;58016-6537-01
 ;;9002226.02101,"534,58016-6537-01 ",.02)
 ;;58016-6537-01
 ;;9002226.02101,"534,58016-6569-01 ",.01)
 ;;58016-6569-01
 ;;9002226.02101,"534,58016-6569-01 ",.02)
 ;;58016-6569-01
 ;;9002226.02101,"534,59310-0175-40 ",.01)
 ;;59310-0175-40
 ;;9002226.02101,"534,59310-0175-40 ",.02)
 ;;59310-0175-40
 ;;9002226.02101,"534,59310-0177-80 ",.01)
 ;;59310-0177-80
 ;;9002226.02101,"534,59310-0177-80 ",.02)
 ;;59310-0177-80
 ;;9002226.02101,"534,59310-0179-20 ",.01)
 ;;59310-0179-20
 ;;9002226.02101,"534,59310-0179-20 ",.02)
 ;;59310-0179-20
 ;;9002226.02101,"534,59310-0579-20 ",.01)
 ;;59310-0579-20
 ;;9002226.02101,"534,59310-0579-20 ",.02)
 ;;59310-0579-20
 ;;9002226.02101,"534,59930-1517-01 ",.01)
 ;;59930-1517-01
 ;;9002226.02101,"534,59930-1517-01 ",.02)
 ;;59930-1517-01
 ;;9002226.02101,"534,59930-1517-02 ",.01)
 ;;59930-1517-02
 ;;9002226.02101,"534,59930-1517-02 ",.02)
 ;;59930-1517-02
 ;;9002226.02101,"534,59930-1560-01 ",.01)
 ;;59930-1560-01
 ;;9002226.02101,"534,59930-1560-01 ",.02)
 ;;59930-1560-01
 ;;9002226.02101,"534,59930-1647-02 ",.01)
 ;;59930-1647-02
 ;;9002226.02101,"534,59930-1647-02 ",.02)
 ;;59930-1647-02
 ;;9002226.02101,"534,60346-0282-74 ",.01)
 ;;60346-0282-74
 ;;9002226.02101,"534,60346-0282-74 ",.02)
 ;;60346-0282-74
 ;;9002226.02101,"534,60432-0094-06 ",.01)
 ;;60432-0094-06
 ;;9002226.02101,"534,60432-0094-06 ",.02)
 ;;60432-0094-06
 ;;9002226.02101,"534,60432-0157-06 ",.01)
 ;;60432-0157-06
 ;;9002226.02101,"534,60432-0157-06 ",.02)
 ;;60432-0157-06
 ;;9002226.02101,"534,60432-0157-21 ",.01)
 ;;60432-0157-21
 ;;9002226.02101,"534,60432-0157-21 ",.02)
 ;;60432-0157-21
 ;;9002226.02101,"534,60432-0676-01 ",.01)
 ;;60432-0676-01
 ;;9002226.02101,"534,60432-0676-01 ",.02)
 ;;60432-0676-01
 ;;9002226.02101,"534,60432-0676-30 ",.01)
 ;;60432-0676-30
 ;;9002226.02101,"534,60432-0676-30 ",.02)
 ;;60432-0676-30
 ;;9002226.02101,"534,60505-0802-01 ",.01)
 ;;60505-0802-01
 ;;9002226.02101,"534,60505-0802-01 ",.02)
 ;;60505-0802-01
 ;;9002226.02101,"534,60505-0802-02 ",.01)
 ;;60505-0802-02
 ;;9002226.02101,"534,60505-0802-02 ",.02)
 ;;60505-0802-02
 ;;9002226.02101,"534,60505-0807-01 ",.01)
 ;;60505-0807-01
 ;;9002226.02101,"534,60505-0807-01 ",.02)
 ;;60505-0807-01
 ;;9002226.02101,"534,60505-0808-01 ",.01)
 ;;60505-0808-01
 ;;9002226.02101,"534,60505-0808-01 ",.02)
 ;;60505-0808-01
 ;;9002226.02101,"534,60598-0061-60 ",.01)
 ;;60598-0061-60
 ;;9002226.02101,"534,60598-0061-60 ",.02)
 ;;60598-0061-60
 ;;9002226.02101,"534,60793-0010-12 ",.01)
 ;;60793-0010-12
 ;;9002226.02101,"534,60793-0010-12 ",.02)
 ;;60793-0010-12
 ;;9002226.02101,"534,60793-0010-60 ",.01)
 ;;60793-0010-60
 ;;9002226.02101,"534,60793-0010-60 ",.02)
 ;;60793-0010-60
 ;;9002226.02101,"534,60793-0011-08 ",.01)
 ;;60793-0011-08
 ;;9002226.02101,"534,60793-0011-08 ",.02)
 ;;60793-0011-08
 ;;9002226.02101,"534,60793-0011-14 ",.01)
 ;;60793-0011-14
 ;;9002226.02101,"534,60793-0011-14 ",.02)
 ;;60793-0011-14
 ;;9002226.02101,"534,60793-0120-01 ",.01)
 ;;60793-0120-01
 ;;9002226.02101,"534,60793-0120-01 ",.02)
 ;;60793-0120-01
 ;;9002226.02101,"534,62037-0794-44 ",.01)
 ;;62037-0794-44
 ;;9002226.02101,"534,62037-0794-44 ",.02)
 ;;62037-0794-44
 ;;9002226.02101,"534,63402-0510-01 ",.01)
 ;;63402-0510-01
 ;;9002226.02101,"534,63402-0510-01 ",.02)
 ;;63402-0510-01
 ;;9002226.02101,"534,63402-0511-24 ",.01)
 ;;63402-0511-24
 ;;9002226.02101,"534,63402-0511-24 ",.02)
 ;;63402-0511-24
 ;;9002226.02101,"534,63402-0512-24 ",.01)
 ;;63402-0512-24
 ;;9002226.02101,"534,63402-0512-24 ",.02)
 ;;63402-0512-24
 ;;9002226.02101,"534,63402-0513-24 ",.01)
 ;;63402-0513-24
 ;;9002226.02101,"534,63402-0513-24 ",.02)
 ;;63402-0513-24
 ;;9002226.02101,"534,63402-0515-30 ",.01)
 ;;63402-0515-30
 ;;9002226.02101,"534,63402-0515-30 ",.02)
 ;;63402-0515-30
 ;;9002226.02101,"534,63402-0911-30 ",.01)
 ;;63402-0911-30
 ;;9002226.02101,"534,63402-0911-30 ",.02)
 ;;63402-0911-30
 ;;9002226.02101,"534,63402-0911-64 ",.01)
 ;;63402-0911-64
 ;;9002226.02101,"534,63402-0911-64 ",.02)
 ;;63402-0911-64
 ;;9002226.02101,"534,63874-0708-20 ",.01)
 ;;63874-0708-20
 ;;9002226.02101,"534,63874-0708-20 ",.02)
 ;;63874-0708-20
 ;;9002226.02101,"534,63874-0714-20 ",.01)
 ;;63874-0714-20
 ;;9002226.02101,"534,63874-0714-20 ",.02)
 ;;63874-0714-20
 ;;9002226.02101,"534,63874-0749-17 ",.01)
 ;;63874-0749-17
 ;;9002226.02101,"534,63874-0749-17 ",.02)
 ;;63874-0749-17
 ;;9002226.02101,"534,65271-0002-05 ",.01)
 ;;65271-0002-05
 ;;9002226.02101,"534,65271-0002-05 ",.02)
 ;;65271-0002-05
 ;;9002226.02101,"534,65271-0002-06 ",.01)
 ;;65271-0002-06
 ;;9002226.02101,"534,65271-0002-06 ",.02)
 ;;65271-0002-06
 ;;9002226.02101,"534,66267-0995-17 ",.01)
 ;;66267-0995-17
 ;;9002226.02101,"534,66267-0995-17 ",.02)
 ;;66267-0995-17
 ;;9002226.02101,"534,66794-0001-25 ",.01)
 ;;66794-0001-25
 ;;9002226.02101,"534,66794-0001-25 ",.02)
 ;;66794-0001-25
 ;;9002226.02101,"534,66794-0001-30 ",.01)
 ;;66794-0001-30
 ;;9002226.02101,"534,66794-0001-30 ",.02)
 ;;66794-0001-30
 ;;9002226.02101,"534,66794-0001-60 ",.01)
 ;;66794-0001-60
 ;;9002226.02101,"534,66794-0001-60 ",.02)
 ;;66794-0001-60
 ;;9002226.02101,"534,68115-0547-20 ",.01)
 ;;68115-0547-20
 ;;9002226.02101,"534,68115-0547-20 ",.02)
 ;;68115-0547-20
 ;;9002226.02101,"534,68115-0637-13 ",.01)
 ;;68115-0637-13
 ;;9002226.02101,"534,68115-0637-13 ",.02)
 ;;68115-0637-13
 ;;9002226.02101,"534,68115-0651-60 ",.01)
 ;;68115-0651-60
 ;;9002226.02101,"534,68115-0651-60 ",.02)
 ;;68115-0651-60
 ;;9002226.02101,"534,68115-0652-01 ",.01)
 ;;68115-0652-01
 ;;9002226.02101,"534,68115-0652-01 ",.02)
 ;;68115-0652-01
 ;;9002226.02101,"534,68115-0653-01 ",.01)
 ;;68115-0653-01
 ;;9002226.02101,"534,68115-0653-01 ",.02)
 ;;68115-0653-01
 ;;9002226.02101,"534,68115-0657-01 ",.01)
 ;;68115-0657-01
 ;;9002226.02101,"534,68115-0657-01 ",.02)
 ;;68115-0657-01
 ;;9002226.02101,"534,68115-0711-20 ",.01)
 ;;68115-0711-20
 ;;9002226.02101,"534,68115-0711-20 ",.02)
 ;;68115-0711-20
 ;;9002226.02101,"534,68115-0760-01 ",.01)
 ;;68115-0760-01
 ;;9002226.02101,"534,68115-0760-01 ",.02)
 ;;68115-0760-01
 ;;9002226.02101,"534,68115-0769-17 ",.01)
 ;;68115-0769-17
 ;;9002226.02101,"534,68115-0769-17 ",.02)
 ;;68115-0769-17
 ;;9002226.02101,"534,68115-0775-07 ",.01)
 ;;68115-0775-07
 ;;9002226.02101,"534,68115-0775-07 ",.02)
 ;;68115-0775-07
 ;;9002226.02101,"534,68115-0924-60 ",.01)
 ;;68115-0924-60
 ;;9002226.02101,"534,68115-0924-60 ",.02)
 ;;68115-0924-60
 ;;9002226.02101,"534,68115-0995-17 ",.01)
 ;;68115-0995-17
 ;;9002226.02101,"534,68115-0995-17 ",.02)
 ;;68115-0995-17
 ;;
 ;;3148
 ;;
 ;;897
 ;;
 ;;3191
 ;;
 ;;3196
 ;;
 ;;3197
 ;;
 ;;3149
 ;;
 ;;3150
 ;;
 ;;3151
 ;;
 ;;3208
 ;;
 ;;3209
 ;;
 ;;3435
 ;;
 ;;3436
 ;;
 ;;584
 ;;
 ;;583
 ;;
 ;;2440
 ;;
 ;;2091
 ;;
 ;;2092
 ;;
 ;;2093
 ;;
 ;;2094
 ;;
 ;;2096
 ;;
 ;;2097
 ;;
 ;;2098
 ;;
 ;;2095
 ;;
 ;;3314
 ;;
 ;;3315
 ;;
 ;;3316
 ;;
 ;;300
 ;;
 ;;298
 ;;
 ;;299
 ;;
 ;;301
 ;;
 ;;3446
 ;;
 ;;3447
 ;;
 ;;3448
 ;;
 ;;3449
 ;;
 ;;3450
 ;;
 ;;3451
 ;;
 ;;3453
 ;;
 ;;3452
 ;;
 ;;296
 ;;
 ;;261
 ;;
 ;;262
 ;;
 ;;263
 ;;
 ;;1223
 ;;
 ;;1224
 ;;
 ;;302
 ;;
 ;;1084
 ;;
 ;;2089
 ;;
 ;;2090
 ;;
 ;;535
 ;;
 ;;536
 ;;
 ;;571
 ;;
 ;;572
 ;;
 ;;2527
 ;;
 ;;58
 ;;
 ;;60
 ;;
 ;;61
 ;;
 ;;63
 ;;
 ;;59
 ;;
 ;;62
 ;;
 ;;1524
 ;;
 ;;1525
 ;;
 ;;826
 ;;
 ;;828
 ;;
 ;;824
 ;;
 ;;825
 ;;
 ;;827
 ;;
 ;;829
 ;;
 ;;2553
 ;;
 ;;2554
 ;;
 ;;2555
 ;;
 ;;2556
 ;;
 ;;2557
 ;;
 ;;2558
 ;;
 ;;2559
 ;;
 ;;2560
 ;;
 ;;844
 ;;
 ;;2985
 ;;
 ;;2986
 ;;
 ;;2987
 ;;
 ;;2988
 ;;
 ;;2989
 ;;
 ;;2990
 ;;
 ;;1581
 ;;
 ;;1582
 ;;
 ;;3401
 ;;
 ;;3402
 ;;
 ;;3400
 ;;
 ;;1374
 ;;
 ;;1375
 ;;
 ;;1376
 ;;
 ;;392
 ;;
 ;;3234
 ;;
 ;;3235
 ;;
 ;;3
 ;;
 ;;4
 ;;
 ;;2911
 ;;
 ;;2912
 ;;
 ;;2913
 ;;
 ;;2914
 ;;
 ;;1115
 ;;
 ;;1116
 ;;
 ;;83
 ;;
 ;;395
 ;;
 ;;393
 ;;
 ;;2371
 ;;
 ;;2372
 ;;
 ;;2373
 ;;
 ;;394
 ;;
 ;;391
 ;;
 ;;1053
 ;;
 ;;2996
 ;;
 ;;2997
 ;;
 ;;2995
 ;;
 ;;1754
 ;;
 ;;611
 ;;
 ;;613
 ;;
 ;;614
 ;;
 ;;616
 ;;
 ;;1109
 ;;
 ;;1110
 ;;
 ;;1111
 ;;
 ;;1112
 ;;
 ;;1113
 ;;
 ;;1114
 ;;
 ;;1538
 ;;
 ;;3229
 ;;
 ;;3230
 ;;
 ;;3231
 ;;
 ;;612
 ;;
 ;;615
 ;;
 ;;1752
 ;;
 ;;1753
 ;;
 ;;3364
 ;;
 ;;3363
 ;;
 ;;2490
 ;;
 ;;2491
 ;;
 ;;345
 ;;
 ;;346
 ;;
 ;;347
 ;;
 ;;343
 ;;
 ;;344
 ;;
 ;;3225
 ;;
 ;;3226
 ;;
 ;;1105
 ;;
 ;;1106
 ;;
 ;;1107
 ;;
 ;;1108
 ;;
 ;;600
 ;;
 ;;601
 ;;
 ;;599
 ;;
 ;;1698
 ;;
 ;;1699
 ;;
 ;;1700
 ;;
 ;;1701
 ;;
 ;;1702
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