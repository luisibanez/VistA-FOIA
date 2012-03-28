BGP13T3 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"00247-2272-30 ")
 ;;4351
 ;;21,"00247-2272-60 ")
 ;;4352
 ;;21,"00247-2272-90 ")
 ;;4353
 ;;21,"00247-2299-00 ")
 ;;5056
 ;;21,"00247-2299-90 ")
 ;;5057
 ;;21,"00247-2314-00 ")
 ;;1445
 ;;21,"00247-2314-30 ")
 ;;1446
 ;;21,"00247-2314-60 ")
 ;;1447
 ;;21,"00247-2314-77 ")
 ;;1448
 ;;21,"00247-2314-90 ")
 ;;1449
 ;;21,"00247-2337-30 ")
 ;;2049
 ;;21,"00247-2337-60 ")
 ;;2050
 ;;21,"00247-2337-90 ")
 ;;2051
 ;;21,"00247-2356-00 ")
 ;;606
 ;;21,"00247-2356-30 ")
 ;;607
 ;;21,"00258-3695-01 ")
 ;;1018
 ;;21,"00258-3695-05 ")
 ;;1019
 ;;21,"00258-3696-01 ")
 ;;1020
 ;;21,"00258-3696-10 ")
 ;;1021
 ;;21,"00258-3697-01 ")
 ;;1022
 ;;21,"00258-3697-10 ")
 ;;1023
 ;;21,"00332-2120-09 ")
 ;;40
 ;;21,"00332-2120-15 ")
 ;;41
 ;;21,"00332-2122-09 ")
 ;;42
 ;;21,"00332-2124-09 ")
 ;;43
 ;;21,"00332-2124-15 ")
 ;;44
 ;;21,"00332-2126-09 ")
 ;;45
 ;;21,"00332-2128-09 ")
 ;;46
 ;;21,"00364-2435-30 ")
 ;;581
 ;;21,"00378-0042-01 ")
 ;;4102
 ;;21,"00378-0060-01 ")
 ;;2930
 ;;21,"00378-0073-01 ")
 ;;4103
 ;;21,"00378-0087-01 ")
 ;;2931
 ;;21,"00378-0092-01 ")
 ;;2932
 ;;21,"00378-0211-01 ")
 ;;565
 ;;21,"00378-0211-05 ")
 ;;566
 ;;21,"00378-0277-01 ")
 ;;567
 ;;21,"00378-0277-05 ")
 ;;568
 ;;21,"00378-0330-01 ")
 ;;4104
 ;;21,"00378-0330-05 ")
 ;;4105
 ;;21,"00378-0407-01 ")
 ;;2638
 ;;21,"00378-0412-01 ")
 ;;2639
 ;;21,"00378-0414-01 ")
 ;;2640
 ;;21,"00378-0433-01 ")
 ;;624
 ;;21,"00378-0435-01 ")
 ;;625
 ;;21,"00378-0442-01 ")
 ;;4106
 ;;21,"00378-0442-05 ")
 ;;4107
 ;;21,"00378-0574-01 ")
 ;;4108
 ;;21,"00378-0574-05 ")
 ;;4109
 ;;21,"00378-1049-01 ")
 ;;1609
 ;;21,"00378-1049-10 ")
 ;;1610
 ;;21,"00378-1410-01 ")
 ;;3305
 ;;21,"00378-1921-01 ")
 ;;1024
 ;;21,"00378-1922-01 ")
 ;;1025
 ;;21,"00378-1922-05 ")
 ;;1026
 ;;21,"00378-1924-01 ")
 ;;1027
 ;;21,"00378-1924-05 ")
 ;;1028
 ;;21,"00378-2003-05 ")
 ;;3961
 ;;21,"00378-2003-93 ")
 ;;3962
 ;;21,"00378-2004-05 ")
 ;;3963
 ;;21,"00378-2004-93 ")
 ;;3964
 ;;21,"00378-2006-93 ")
 ;;3965
 ;;21,"00378-2052-91 ")
 ;;3213
 ;;21,"00378-2053-91 ")
 ;;3214
 ;;21,"00378-2054-91 ")
 ;;3215
 ;;21,"00378-2055-91 ")
 ;;3216
 ;;21,"00378-2325-01 ")
 ;;3306
 ;;21,"00378-2610-01 ")
 ;;47
 ;;21,"00378-2610-10 ")
 ;;48
 ;;21,"00378-2625-01 ")
 ;;49
 ;;21,"00378-2625-10 ")
 ;;50
 ;;21,"00378-2650-01 ")
 ;;51
 ;;21,"00378-2650-10 ")
 ;;52
 ;;21,"00378-2675-01 ")
 ;;53
 ;;21,"00378-2675-93 ")
 ;;54
 ;;21,"00378-2685-01 ")
 ;;55
 ;;21,"00378-2685-93 ")
 ;;56
 ;;21,"00378-2695-01 ")
 ;;57
 ;;21,"00378-2695-93 ")
 ;;58
 ;;21,"00378-3025-01 ")
 ;;1303
 ;;21,"00378-3050-01 ")
 ;;1304
 ;;21,"00378-3075-01 ")
 ;;1305
 ;;21,"00378-3125-01 ")
 ;;1611
 ;;21,"00378-3125-10 ")
 ;;1612
 ;;21,"00378-3250-01 ")
 ;;3307
 ;;21,"00378-3411-01 ")
 ;;772
 ;;21,"00378-3412-01 ")
 ;;773
 ;;21,"00378-3412-05 ")
 ;;774
 ;;21,"00378-3471-01 ")
 ;;4649
 ;;21,"00378-3472-01 ")
 ;;4650
 ;;21,"00378-3472-10 ")
 ;;4651
 ;;21,"00378-3473-01 ")
 ;;4652
 ;;21,"00378-3473-10 ")
 ;;4653
 ;;21,"00378-3515-10 ")
 ;;2975
 ;;21,"00378-3515-93 ")
 ;;2976
 ;;21,"00378-3530-05 ")
 ;;2977
 ;;21,"00378-3530-93 ")
 ;;2978
 ;;21,"00378-3545-05 ")
 ;;2979
 ;;21,"00378-3545-93 ")
 ;;2980
 ;;21,"00378-4175-01 ")
 ;;3308
 ;;21,"00378-4186-01 ")
 ;;4354
 ;;21,"00378-4186-05 ")
 ;;4355
 ;;21,"00378-4186-93 ")
 ;;4356
 ;;21,"00378-4187-01 ")
 ;;4357
 ;;21,"00378-4187-05 ")
 ;;4358
 ;;21,"00378-4187-93 ")
 ;;4359
 ;;21,"00378-4188-01 ")
 ;;4360
 ;;21,"00378-4188-05 ")
 ;;4361
 ;;21,"00378-4188-93 ")
 ;;4362
 ;;21,"00378-4210-01 ")
 ;;2243
 ;;21,"00378-4220-01 ")
 ;;2244
 ;;21,"00378-4250-01 ")
 ;;1613
 ;;21,"00378-4250-10 ")
 ;;1614
 ;;21,"00378-4350-93 ")
 ;;2245
 ;;21,"00378-4881-01 ")
 ;;5058
 ;;21,"00378-4882-01 ")
 ;;5059
 ;;21,"00378-4883-01 ")
 ;;5060
 ;;21,"00378-4884-01 ")
 ;;5061
 ;;21,"00378-4885-01 ")
 ;;5062
 ;;21,"00378-5375-01 ")
 ;;1615
 ;;21,"00378-5375-10 ")
 ;;1616
 ;;21,"00378-5410-28 ")
 ;;2246
 ;;21,"00378-5420-28 ")
 ;;2247
 ;;21,"00378-5521-01 ")
 ;;775
 ;;21,"00378-6231-01 ")
 ;;1029
 ;;21,"00378-6231-05 ")
 ;;1030
 ;;21,"00378-6232-01 ")
 ;;1031
 ;;21,"00378-6232-05 ")
 ;;1032
 ;;21,"00378-6233-01 ")
 ;;1033
 ;;21,"00378-6233-05 ")
 ;;1034
 ;;21,"00378-6410-01 ")
 ;;1617
 ;;21,"00378-6410-10 ")
 ;;1618
 ;;21,"00378-7001-10 ")
 ;;3645
 ;;21,"00378-7001-93 ")
 ;;3646
 ;;21,"00378-7002-10 ")
 ;;3647
 ;;21,"00378-7002-93 ")
 ;;3648
 ;;21,"00378-7003-10 ")
 ;;3649
 ;;21,"00378-7003-93 ")
 ;;3650
 ;;21,"00378-7004-10 ")
 ;;3651
 ;;21,"00378-7004-93 ")
 ;;3652
 ;;21,"00406-0661-01 ")
 ;;2248
 ;;21,"00406-0661-05 ")
 ;;2249
 ;;21,"00406-0661-91 ")
 ;;2250
 ;;21,"00406-0663-01 ")
 ;;2251
 ;;21,"00406-0663-03 ")
 ;;2252
 ;;21,"00406-0663-05 ")
 ;;2253
 ;;21,"00406-0663-62 ")
 ;;2254
 ;;21,"00406-0663-91 ")
 ;;2255
 ;;21,"00406-0667-01 ")
 ;;2256
 ;;21,"00406-2001-03 ")
 ;;3653
 ;;21,"00406-2001-05 ")
 ;;3654
 ;;21,"00406-2001-90 ")
 ;;3655
 ;;21,"00406-2097-03 ")
 ;;3656
 ;;21,"00406-2097-05 ")
 ;;3657
 ;;21,"00406-2097-90 ")
 ;;3658
 ;;21,"00406-2098-01 ")
 ;;3659
 ;;21,"00406-2098-03 ")
 ;;3660
 ;;21,"00406-2098-05 ")
 ;;3661
 ;;21,"00406-2098-90 ")
 ;;3662
 ;;21,"00406-2099-03 ")
 ;;3663
 ;;21,"00406-2099-05 ")
 ;;3664
 ;;21,"00406-2099-90 ")
 ;;3665
 ;;21,"00406-9906-01 ")
 ;;587
 ;;21,"00406-9906-03 ")
 ;;588
 ;;21,"00406-9906-62 ")
 ;;589
 ;;21,"00406-9907-01 ")
 ;;590
 ;;21,"00406-9907-03 ")
 ;;591
 ;;21,"00406-9907-62 ")
 ;;592
 ;;21,"00406-9908-01 ")
 ;;593
 ;;21,"00406-9908-03 ")
 ;;594
 ;;21,"00406-9910-01 ")
 ;;3614
 ;;21,"00406-9910-03 ")
 ;;3615
 ;;21,"00406-9911-01 ")
 ;;3616
 ;;21,"00406-9911-03 ")
 ;;3617
 ;;21,"00406-9912-01 ")
 ;;3618
 ;;21,"00406-9912-03 ")
 ;;3619
 ;;21,"00406-9913-01 ")
 ;;3620
 ;;21,"00406-9913-03 ")
 ;;3621
 ;;21,"00406-9918-16 ")
 ;;3622
 ;;21,"00406-9920-01 ")
 ;;4608
 ;;21,"00406-9920-03 ")
 ;;4609
 ;;21,"00406-9921-01 ")
 ;;4610
 ;;21,"00406-9921-03 ")
 ;;4611
 ;;21,"00406-9922-01 ")
 ;;4612
 ;;21,"00406-9922-03 ")
 ;;4613
 ;;21,"00406-9923-01 ")
 ;;4614
 ;;21,"00406-9923-03 ")
 ;;4615
 ;;21,"00406-9924-01 ")
 ;;4616
 ;;21,"00406-9924-03 ")
 ;;4617
 ;;21,"00406-9925-01 ")
 ;;4618
 ;;21,"00406-9925-03 ")
 ;;4619
 ;;21,"00406-9926-01 ")
 ;;4620
 ;;21,"00406-9926-03 ")
 ;;4621
 ;;21,"00406-9931-03 ")
 ;;2817
 ;;21,"00406-9932-03 ")
 ;;2818
 ;;21,"00406-9933-03 ")
 ;;2819
 ;;21,"00406-9934-03 ")
 ;;2820
 ;;21,"00430-0210-14 ")
 ;;4299
 ;;21,"00430-0215-14 ")
 ;;4300
 ;;21,"00430-0220-14 ")
 ;;4301
 ;;21,"00430-0435-14 ")
 ;;4302
 ;;21,"00430-0436-14 ")
 ;;4303
 ;;21,"00440-7090-30 ")
 ;;59
 ;;21,"00440-7091-30 ")
 ;;60
 ;;21,"00440-7092-30 ")
 ;;61
 ;;21,"00440-7477-30 ")
 ;;1619
 ;;21,"00440-7478-30 ")
 ;;1620
 ;;21,"00440-7521-30 ")
 ;;2257
 ;;21,"00440-8575-20 ")
 ;;4654
 ;;21,"00440-8576-30 ")
 ;;4655
 ;;21,"00456-2005-01 ")
 ;;2828
 ;;21,"00456-2010-01 ")
 ;;2829
 ;;21,"00456-2010-11 ")
 ;;2830
 ;;21,"00456-2010-63 ")
 ;;2831
 ;;21,"00456-2020-01 ")
 ;;2832
 ;;21,"00456-2020-11 ")
 ;;2833
 ;;21,"00456-2020-63 ")
 ;;2834
 ;;21,"00456-2101-08 ")
 ;;2835
 ;;21,"00456-4010-01 ")
 ;;910
 ;;21,"00456-4020-01 ")
 ;;911
 ;;21,"00456-4020-63 ")
 ;;912
 ;;21,"00456-4040-01 ")
 ;;913
 ;;21,"00456-4040-63 ")
 ;;914
 ;;21,"00456-4130-08 ")
 ;;915
 ;;21,"00472-0021-04 ")
 ;;2258
 ;;21,"00490-0034-00 ")
 ;;1919
 ;;21,"00490-0034-30 ")
 ;;1920
 ;;21,"00490-0034-60 ")
 ;;1921
 ;;21,"00490-0034-90 ")
 ;;1922
 ;;21,"00490-0114-00 ")
 ;;5063
 ;;21,"00490-0114-30 ")
 ;;5064
 ;;21,"00490-0114-60 ")
 ;;5065
 ;;21,"00490-0114-90 ")
 ;;5066
 ;;21,"00490-0163-00 ")
 ;;870
 ;;21,"00490-0163-30 ")
 ;;871
 ;;21,"00490-0163-60 ")
 ;;872
 ;;21,"00490-0163-90 ")
 ;;873
 ;;21,"00555-0201-01 ")
 ;;2259
 ;;21,"00555-0241-71 ")
 ;;2981
 ;;21,"00555-0242-71 ")
 ;;2982
 ;;21,"00555-0489-02 ")
 ;;4656
 ;;21,"00555-0489-04 ")
 ;;4657
 ;;21,"00555-0490-02 ")
 ;;4658
 ;;21,"00555-0490-04 ")
 ;;4659
 ;;21,"00555-0594-02 ")
 ;;4156
 ;;21,"00555-0595-02 ")
 ;;4157
 ;;21,"00555-0732-02 ")
 ;;4660
 ;;21,"00555-0732-04 ")
 ;;4661
 ;;21,"00555-0733-02 ")
 ;;4662
 ;;21,"00555-0871-54 ")
 ;;2618
 ;;21,"00555-0871-88 ")
 ;;2619
 ;;21,"00555-0876-02 ")
 ;;2260
 ;;21,"00555-0877-02 ")
 ;;2261
 ;;21,"00555-0877-04 ")
 ;;2262
 ;;21,"00555-0877-05 ")
 ;;2263
 ;;21,"00555-0877-07 ")
 ;;2264
 ;;21,"00555-0967-02 ")
 ;;2641
 ;;21,"00555-0968-02 ")
 ;;2642
 ;;21,"00555-0969-02 ")
 ;;2643
 ;;21,"00555-7243-71 ")
 ;;2983
 ;;21,"00591-0545-01 ")
 ;;1450
 ;;21,"00591-0764-60 ")
 ;;3217
 ;;21,"00591-0765-60 ")
 ;;3218
 ;;21,"00591-0766-60 ")
 ;;3219
 ;;21,"00591-0767-60 ")
 ;;3220
 ;;21,"00591-0808-01 ")
 ;;1451
 ;;21,"00591-0808-05 ")
 ;;1452
 ;;21,"00591-0809-01 ")
 ;;1453
 ;;21,"00591-0809-05 ")
 ;;1454
 ;;21,"00591-0839-25 ")
 ;;776
 ;;21,"00591-0839-60 ")
 ;;777
 ;;21,"00591-0858-60 ")
 ;;778
 ;;21,"00591-1117-10 ")
 ;;2984
 ;;21,"00591-1117-30 ")
 ;;2985
 ;;21,"00591-1118-10 ")
 ;;2986
 ;;21,"00591-1118-30 ")
 ;;2987
 ;;21,"00591-1119-30 ")
 ;;2988
 ;;21,"00591-2114-01 ")
 ;;1621
 ;;21,"00591-2230-15 ")
 ;;2989
 ;;21,"00591-2231-15 ")
 ;;2990
 ;;21,"00591-2300-01 ")
 ;;4663
 ;;21,"00591-3176-01 ")
 ;;1035
 ;;21,"00591-3176-05 ")
 ;;1036
 ;;21,"00591-3177-01 ")
 ;;1037
 ;;21,"00591-3177-05 ")
 ;;1038
 ;;21,"00591-3178-01 ")
 ;;1039
 ;;21,"00591-3178-05 ")
 ;;1040
 ;;21,"00591-3238-19 ")
 ;;4363
 ;;21,"00591-3238-30 ")
 ;;4364
 ;;21,"00591-3239-10 ")
 ;;4365
 ;;21,"00591-3239-19 ")
 ;;4366
 ;;21,"00591-3239-30 ")
 ;;4367
 ;;21,"00591-3240-10 ")
 ;;4368
 ;;21,"00591-3240-19 ")
 ;;4369
 ;;21,"00591-3240-30 ")
 ;;4370
 ;;21,"00591-3331-05 ")
 ;;874
 ;;21,"00591-3331-19 ")
 ;;875
 ;;21,"00591-3331-30 ")
 ;;876
 ;;21,"00591-3332-05 ")
 ;;877
 ;;21,"00591-3332-30 ")
 ;;878
 ;;21,"00591-3385-60 ")
 ;;779
 ;;21,"00591-3540-60 ")
 ;;780
 ;;21,"00591-3541-25 ")
 ;;781
 ;;21,"00591-3541-60 ")
 ;;782
 ;;21,"00591-3542-60 ")
 ;;783
 ;;21,"00591-3543-60 ")
 ;;784
 ;;21,"00591-3543-76 ")
 ;;785
 ;;21,"00591-5599-01 ")
 ;;4664
 ;;21,"00591-5599-10 ")
 ;;4665
 ;;21,"00591-5600-01 ")
 ;;4666
 ;;21,"00591-5600-10 ")
 ;;4667
 ;;21,"00591-5629-01 ")
 ;;1622
 ;;21,"00591-5630-01 ")
 ;;1623
 ;;21,"00591-5630-10 ")
 ;;1624
 ;;21,"00591-5631-01 ")
 ;;1625
 ;;21,"00591-5631-10 ")
 ;;1626
 ;;21,"00591-5632-01 ")
 ;;1627
 ;;21,"00591-5633-01 ")
 ;;1628
 ;;21,"00591-5713-01 ")
 ;;582
 ;;21,"00591-5714-01 ")
 ;;583
 ;;21,"00591-5715-01 ")
 ;;584
 ;;21,"00591-5716-30 ")
 ;;585
 ;;21,"00591-5786-01 ")
 ;;3309
 ;;21,"00591-5786-05 ")
 ;;3310
 ;;21,"00591-5787-01 ")
 ;;3311
 ;;21,"00591-5787-05 ")
 ;;3312
 ;;21,"00591-5787-10 ")
 ;;3313
 ;;21,"00591-5788-01 ")
 ;;3314
 ;;21,"00591-5788-05 ")
 ;;3315
 ;;21,"00591-5789-01 ")
 ;;3316
 ;;21,"00603-2212-21 ")
 ;;62
 ;;21,"00603-2212-32 ")
 ;;63
 ;;21,"00603-2213-21 ")
 ;;64
 ;;21,"00603-2213-30 ")
 ;;65
 ;;21,"00603-2213-32 ")
 ;;66
 ;;21,"00603-2214-21 ")
 ;;67
 ;;21,"00603-2214-32 ")
 ;;68
 ;;21,"00603-2215-21 ")
 ;;69
 ;;21,"00603-2216-21 ")
 ;;70
 ;;21,"00603-2217-21 ")
 ;;71
 ;;21,"00603-2690-21 ")
 ;;569
 ;;21,"00603-2690-28 ")
 ;;570
 ;;21,"00603-2691-21 ")
 ;;571
 ;;21,"00603-2691-28 ")
 ;;572
 ;;21,"00603-3167-32 ")
 ;;1455
 ;;21,"00603-3458-32 ")
 ;;1629
 ;;21,"00603-4043-32 ")
 ;;2684
 ;;21,"00603-6147-21 ")
 ;;4668
 ;;21,"00603-6147-32 ")
 ;;4669
 ;;21,"00603-6148-21 ")
 ;;4670
 ;;21,"00603-6148-32 ")
 ;;4671
 ;;21,"00603-6160-21 ")
 ;;4672
 ;;21,"00603-6160-28 ")
 ;;4673
 ;;21,"00603-6160-32 ")
 ;;4674
 ;;21,"00603-6161-21 ")
 ;;4675
 ;;21,"00603-6161-28 ")
 ;;4676
 ;;21,"00603-6161-32 ")
 ;;4677
 ;;21,"00615-0395-13 ")
 ;;1630
 ;;21,"00615-0828-53 ")
 ;;72
 ;;21,"00615-0828-63 ")
 ;;73
 ;;21,"00615-0829-43 ")
 ;;74
 ;;21,"00615-0829-53 ")
 ;;75
 ;;21,"00615-0829-63 ")
 ;;76
