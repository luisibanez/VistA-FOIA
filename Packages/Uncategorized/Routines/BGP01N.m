BGP01N ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;;BGP CHLAMYDIA LOINC CODES
 ;
 ; This routine loads Taxonomy BGP CHLAMYDIA LOINC CODES
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 D OTHER
 I $O(^TMP("ATX",$J,3.6,0)) D BULL^ATXSTX2
 I $O(^TMP("ATX",$J,9002226,0)) D TAX^ATXSTX2
 D KILL^ATXSTX2
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"14463-4 ")
 ;;1
 ;;21,"14464-2 ")
 ;;2
 ;;21,"14465-9 ")
 ;;3
 ;;21,"14467-5 ")
 ;;4
 ;;21,"14470-9 ")
 ;;5
 ;;21,"14471-7 ")
 ;;6
 ;;21,"14472-5 ")
 ;;7
 ;;21,"14474-1 ")
 ;;8
 ;;21,"14509-4 ")
 ;;9
 ;;21,"14510-2 ")
 ;;10
 ;;21,"14511-0 ")
 ;;11
 ;;21,"14513-6 ")
 ;;12
 ;;21,"16600-9 ")
 ;;13
 ;;21,"16601-7 ")
 ;;14
 ;;21,"16602-5 ")
 ;;15
 ;;21,"21189-6 ")
 ;;16
 ;;21,"21190-4 ")
 ;;17
 ;;21,"21191-2 ")
 ;;18
 ;;21,"21192-0 ")
 ;;19
 ;;21,"23838-6 ")
 ;;20
 ;;21,"31771-9 ")
 ;;21
 ;;21,"31772-7 ")
 ;;22
 ;;21,"31775-0 ")
 ;;23
 ;;21,"31776-8 ")
 ;;24
 ;;21,"34710-4 ")
 ;;25
 ;;21,"42931-6 ")
 ;;26
 ;;21,"43406-8 ")
 ;;27
 ;;21,"44806-8 ")
 ;;28
 ;;21,"44807-6 ")
 ;;29
 ;;21,"45067-6 ")
 ;;30
 ;;21,"45068-4 ")
 ;;31
 ;;21,"45069-2 ")
 ;;32
 ;;21,"45070-0 ")
 ;;33
 ;;21,"45072-6 ")
 ;;34
 ;;21,"45074-2 ")
 ;;35
 ;;21,"45075-9 ")
 ;;36
 ;;21,"45078-3 ")
 ;;37
 ;;21,"45079-1 ")
 ;;38
 ;;21,"45080-9 ")
 ;;39
 ;;21,"45081-7 ")
 ;;40
 ;;21,"45082-5 ")
 ;;41
 ;;21,"45083-3 ")
 ;;42
 ;;21,"45084-1 ")
 ;;43
 ;;21,"45089-0 ")
 ;;44
 ;;21,"45090-8 ")
 ;;45
 ;;21,"45091-6 ")
 ;;46
 ;;21,"45093-2 ")
 ;;47
 ;;21,"45095-7 ")
 ;;48
 ;;21,"45098-1 ")
 ;;49
 ;;21,"45100-5 ")
 ;;50
 ;;21,"45106-2 ")
 ;;51
 ;;21,"45107-0 ")
 ;;52
 ;;21,"45108-8 ")
 ;;53
 ;;21,"45112-0 ")
 ;;54
 ;;21,"45113-8 ")
 ;;55
 ;;21,"45114-6 ")
 ;;56
 ;;21,"45115-3 ")
 ;;57
 ;;21,"50387-0 ")
 ;;58
 ;;21,"53925-4 ")
 ;;59
 ;;21,"557-9 ")
 ;;60
 ;;21,"6356-0 ")
 ;;61
 ;;21,"6357-8 ")
 ;;62
 ;;9002226,288,.01)
 ;;BGP CHLAMYDIA LOINC CODES
 ;;9002226,288,.02)
 ;;@
 ;;9002226,288,.04)
 ;;n
 ;;9002226,288,.06)
 ;;@
 ;;9002226,288,.08)
 ;;@
 ;;9002226,288,.09)
 ;;@
 ;;9002226,288,.11)
 ;;@
 ;;9002226,288,.12)
 ;;@
 ;;9002226,288,.13)
 ;;1
 ;;9002226,288,.14)
 ;;FIHS
 ;;9002226,288,.15)
 ;;95.3
 ;;9002226,288,.16)
 ;;@
 ;;9002226,288,.17)
 ;;@
 ;;9002226,288,3101)
 ;;@
 ;;9002226.02101,"288,14463-4 ",.01)
 ;;14463-4
 ;;9002226.02101,"288,14463-4 ",.02)
 ;;14463-4
 ;;9002226.02101,"288,14464-2 ",.01)
 ;;14464-2
 ;;9002226.02101,"288,14464-2 ",.02)
 ;;14464-2
 ;;9002226.02101,"288,14465-9 ",.01)
 ;;14465-9
 ;;9002226.02101,"288,14465-9 ",.02)
 ;;14465-9
 ;;9002226.02101,"288,14467-5 ",.01)
 ;;14467-5
 ;;9002226.02101,"288,14467-5 ",.02)
 ;;14467-5
 ;;9002226.02101,"288,14470-9 ",.01)
 ;;14470-9
 ;;9002226.02101,"288,14470-9 ",.02)
 ;;14470-9
 ;;9002226.02101,"288,14471-7 ",.01)
 ;;14471-7
 ;;9002226.02101,"288,14471-7 ",.02)
 ;;14471-7
 ;;9002226.02101,"288,14472-5 ",.01)
 ;;14472-5
 ;;9002226.02101,"288,14472-5 ",.02)
 ;;14472-5
 ;;9002226.02101,"288,14474-1 ",.01)
 ;;14474-1
 ;;9002226.02101,"288,14474-1 ",.02)
 ;;14474-1
 ;;9002226.02101,"288,14509-4 ",.01)
 ;;14509-4
 ;;9002226.02101,"288,14509-4 ",.02)
 ;;14509-4
 ;;9002226.02101,"288,14510-2 ",.01)
 ;;14510-2
 ;;9002226.02101,"288,14510-2 ",.02)
 ;;14510-2
 ;;9002226.02101,"288,14511-0 ",.01)
 ;;14511-0
 ;;9002226.02101,"288,14511-0 ",.02)
 ;;14511-0
 ;;9002226.02101,"288,14513-6 ",.01)
 ;;14513-6
 ;;9002226.02101,"288,14513-6 ",.02)
 ;;14513-6
 ;;9002226.02101,"288,16600-9 ",.01)
 ;;16600-9
 ;;9002226.02101,"288,16600-9 ",.02)
 ;;16600-9
 ;;9002226.02101,"288,16601-7 ",.01)
 ;;16601-7
 ;;9002226.02101,"288,16601-7 ",.02)
 ;;16601-7
 ;;9002226.02101,"288,16602-5 ",.01)
 ;;16602-5
 ;;9002226.02101,"288,16602-5 ",.02)
 ;;16602-5
 ;;9002226.02101,"288,21189-6 ",.01)
 ;;21189-6
 ;;9002226.02101,"288,21189-6 ",.02)
 ;;21189-6
 ;;9002226.02101,"288,21190-4 ",.01)
 ;;21190-4
 ;;9002226.02101,"288,21190-4 ",.02)
 ;;21190-4
 ;;9002226.02101,"288,21191-2 ",.01)
 ;;21191-2
 ;;9002226.02101,"288,21191-2 ",.02)
 ;;21191-2
 ;;9002226.02101,"288,21192-0 ",.01)
 ;;21192-0
 ;;9002226.02101,"288,21192-0 ",.02)
 ;;21192-0
 ;;9002226.02101,"288,23838-6 ",.01)
 ;;23838-6
 ;;9002226.02101,"288,23838-6 ",.02)
 ;;23838-6
 ;;9002226.02101,"288,31771-9 ",.01)
 ;;31771-9
 ;;9002226.02101,"288,31771-9 ",.02)
 ;;31771-9
 ;;9002226.02101,"288,31772-7 ",.01)
 ;;31772-7
 ;;9002226.02101,"288,31772-7 ",.02)
 ;;31772-7
 ;;9002226.02101,"288,31775-0 ",.01)
 ;;31775-0
 ;;9002226.02101,"288,31775-0 ",.02)
 ;;31775-0
 ;;9002226.02101,"288,31776-8 ",.01)
 ;;31776-8
 ;;9002226.02101,"288,31776-8 ",.02)
 ;;31776-8
 ;;9002226.02101,"288,34710-4 ",.01)
 ;;34710-4
 ;;9002226.02101,"288,34710-4 ",.02)
 ;;34710-4
 ;;9002226.02101,"288,42931-6 ",.01)
 ;;42931-6
 ;;9002226.02101,"288,42931-6 ",.02)
 ;;42931-6
 ;;9002226.02101,"288,43406-8 ",.01)
 ;;43406-8
 ;;9002226.02101,"288,43406-8 ",.02)
 ;;43406-8
 ;;9002226.02101,"288,44806-8 ",.01)
 ;;44806-8
 ;;9002226.02101,"288,44806-8 ",.02)
 ;;44806-8
 ;;9002226.02101,"288,44807-6 ",.01)
 ;;44807-6
 ;;9002226.02101,"288,44807-6 ",.02)
 ;;44807-6
 ;;9002226.02101,"288,45067-6 ",.01)
 ;;45067-6
 ;;9002226.02101,"288,45067-6 ",.02)
 ;;45067-6
 ;;9002226.02101,"288,45068-4 ",.01)
 ;;45068-4
 ;;9002226.02101,"288,45068-4 ",.02)
 ;;45068-4
 ;;9002226.02101,"288,45069-2 ",.01)
 ;;45069-2
 ;;9002226.02101,"288,45069-2 ",.02)
 ;;45069-2
 ;;9002226.02101,"288,45070-0 ",.01)
 ;;45070-0
 ;;9002226.02101,"288,45070-0 ",.02)
 ;;45070-0
 ;;9002226.02101,"288,45072-6 ",.01)
 ;;45072-6
 ;;9002226.02101,"288,45072-6 ",.02)
 ;;45072-6
 ;;9002226.02101,"288,45074-2 ",.01)
 ;;45074-2
 ;;9002226.02101,"288,45074-2 ",.02)
 ;;45074-2
 ;;9002226.02101,"288,45075-9 ",.01)
 ;;45075-9
 ;;9002226.02101,"288,45075-9 ",.02)
 ;;45075-9
 ;;9002226.02101,"288,45078-3 ",.01)
 ;;45078-3
 ;;9002226.02101,"288,45078-3 ",.02)
 ;;45078-3
 ;;9002226.02101,"288,45079-1 ",.01)
 ;;45079-1
 ;;9002226.02101,"288,45079-1 ",.02)
 ;;45079-1
 ;;9002226.02101,"288,45080-9 ",.01)
 ;;45080-9
 ;;9002226.02101,"288,45080-9 ",.02)
 ;;45080-9
 ;;9002226.02101,"288,45081-7 ",.01)
 ;;45081-7
 ;;9002226.02101,"288,45081-7 ",.02)
 ;;45081-7
 ;;9002226.02101,"288,45082-5 ",.01)
 ;;45082-5
 ;;9002226.02101,"288,45082-5 ",.02)
 ;;45082-5
 ;;9002226.02101,"288,45083-3 ",.01)
 ;;45083-3
 ;;9002226.02101,"288,45083-3 ",.02)
 ;;45083-3
 ;;9002226.02101,"288,45084-1 ",.01)
 ;;45084-1
 ;;9002226.02101,"288,45084-1 ",.02)
 ;;45084-1
 ;;9002226.02101,"288,45089-0 ",.01)
 ;;45089-0
 ;;9002226.02101,"288,45089-0 ",.02)
 ;;45089-0
 ;;9002226.02101,"288,45090-8 ",.01)
 ;;45090-8
 ;;9002226.02101,"288,45090-8 ",.02)
 ;;45090-8
 ;;9002226.02101,"288,45091-6 ",.01)
 ;;45091-6
 ;;9002226.02101,"288,45091-6 ",.02)
 ;;45091-6
 ;;9002226.02101,"288,45093-2 ",.01)
 ;;45093-2
 ;;9002226.02101,"288,45093-2 ",.02)
 ;;45093-2
 ;;9002226.02101,"288,45095-7 ",.01)
 ;;45095-7
 ;;9002226.02101,"288,45095-7 ",.02)
 ;;45095-7
 ;;9002226.02101,"288,45098-1 ",.01)
 ;;45098-1
 ;;9002226.02101,"288,45098-1 ",.02)
 ;;45098-1
 ;;9002226.02101,"288,45100-5 ",.01)
 ;;45100-5
 ;;9002226.02101,"288,45100-5 ",.02)
 ;;45100-5
 ;;9002226.02101,"288,45106-2 ",.01)
 ;;45106-2
 ;;9002226.02101,"288,45106-2 ",.02)
 ;;45106-2
 ;;9002226.02101,"288,45107-0 ",.01)
 ;;45107-0
 ;;9002226.02101,"288,45107-0 ",.02)
 ;;45107-0
 ;;9002226.02101,"288,45108-8 ",.01)
 ;;45108-8
 ;;9002226.02101,"288,45108-8 ",.02)
 ;;45108-8
 ;;9002226.02101,"288,45112-0 ",.01)
 ;;45112-0
 ;;9002226.02101,"288,45112-0 ",.02)
 ;;45112-0
 ;;9002226.02101,"288,45113-8 ",.01)
 ;;45113-8
 ;;9002226.02101,"288,45113-8 ",.02)
 ;;45113-8
 ;;9002226.02101,"288,45114-6 ",.01)
 ;;45114-6
 ;;9002226.02101,"288,45114-6 ",.02)
 ;;45114-6
 ;;9002226.02101,"288,45115-3 ",.01)
 ;;45115-3
 ;;9002226.02101,"288,45115-3 ",.02)
 ;;45115-3
 ;;9002226.02101,"288,50387-0 ",.01)
 ;;50387-0
 ;;9002226.02101,"288,50387-0 ",.02)
 ;;50387-0
 ;;9002226.02101,"288,53925-4 ",.01)
 ;;53925-4
 ;;9002226.02101,"288,53925-4 ",.02)
 ;;53925-4
 ;;9002226.02101,"288,557-9 ",.01)
 ;;557-9
 ;;9002226.02101,"288,557-9 ",.02)
 ;;557-9
 ;;9002226.02101,"288,6356-0 ",.01)
 ;;6356-0
 ;;9002226.02101,"288,6356-0 ",.02)
 ;;6356-0
 ;;9002226.02101,"288,6357-8 ",.01)
 ;;6357-8
 ;;9002226.02101,"288,6357-8 ",.02)
 ;;6357-8
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
 ;
OTHER ; OTHER ROUTINES
 D ^BGP01N2
 D ^BGP01N3
 D ^BGP01N4
 D ^BGP01N5
 Q
