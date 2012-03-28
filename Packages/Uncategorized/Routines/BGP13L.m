BGP13L ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;;BGP HEDIS NARCOTIC NDC
 ;
 ; This routine loads Taxonomy BGP HEDIS NARCOTIC NDC
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
 ;;21,"00002-0353-02 ")
 ;;496
 ;;21,"00002-0353-03 ")
 ;;497
 ;;21,"00002-0353-33 ")
 ;;498
 ;;21,"00002-0803-02 ")
 ;;486
 ;;21,"00002-0803-03 ")
 ;;487
 ;;21,"00002-0803-33 ")
 ;;488
 ;;21,"00002-3111-02 ")
 ;;492
 ;;21,"00002-3111-03 ")
 ;;493
 ;;21,"00008-0259-01 ")
 ;;560
 ;;21,"00024-0332-06 ")
 ;;503
 ;;21,"00024-0335-02 ")
 ;;504
 ;;21,"00024-0335-04 ")
 ;;505
 ;;21,"00024-0335-06 ")
 ;;506
 ;;21,"00024-0337-04 ")
 ;;507
 ;;21,"00024-1937-04 ")
 ;;814
 ;;21,"00024-1951-04 ")
 ;;826
 ;;21,"00054-3545-63 ")
 ;;561
 ;;21,"00054-4595-25 ")
 ;;562
 ;;21,"00054-4596-25 ")
 ;;563
 ;;21,"00054-8595-11 ")
 ;;564
 ;;21,"00054-8596-11 ")
 ;;565
 ;;21,"00074-1176-30 ")
 ;;508
 ;;21,"00074-1178-30 ")
 ;;509
 ;;21,"00074-1179-01 ")
 ;;510
 ;;21,"00074-1179-02 ")
 ;;511
 ;;21,"00074-1179-21 ")
 ;;512
 ;;21,"00074-1179-30 ")
 ;;513
 ;;21,"00074-1180-69 ")
 ;;514
 ;;21,"00074-1181-30 ")
 ;;515
 ;;21,"00074-1201-20 ")
 ;;516
 ;;21,"00074-1203-01 ")
 ;;517
 ;;21,"00074-1253-01 ")
 ;;518
 ;;21,"00074-1254-01 ")
 ;;519
 ;;21,"00074-1255-02 ")
 ;;520
 ;;21,"00074-1256-01 ")
 ;;521
 ;;21,"00074-1266-01 ")
 ;;522
 ;;21,"00074-1267-01 ")
 ;;523
 ;;21,"00074-1269-01 ")
 ;;524
 ;;21,"00074-1271-02 ")
 ;;525
 ;;21,"00074-1920-10 ")
 ;;823
 ;;21,"00074-1941-01 ")
 ;;824
 ;;21,"00074-1941-11 ")
 ;;825
 ;;21,"00074-6030-04 ")
 ;;566
 ;;21,"00093-0490-01 ")
 ;;49
 ;;21,"00093-0490-05 ")
 ;;50
 ;;21,"00093-0741-01 ")
 ;;719
 ;;21,"00093-0890-01 ")
 ;;51
 ;;21,"00093-0890-05 ")
 ;;52
 ;;21,"00143-3235-01 ")
 ;;720
 ;;21,"00143-3235-05 ")
 ;;721
 ;;21,"00143-3235-10 ")
 ;;722
 ;;21,"00172-4980-60 ")
 ;;53
 ;;21,"00172-4980-70 ")
 ;;54
 ;;21,"00172-4980-80 ")
 ;;55
 ;;21,"00182-0317-89 ")
 ;;56
 ;;21,"00182-0698-01 ")
 ;;723
 ;;21,"00182-0698-05 ")
 ;;724
 ;;21,"00182-1673-01 ")
 ;;432
 ;;21,"00182-1673-05 ")
 ;;433
 ;;21,"00182-9130-66 ")
 ;;567
 ;;21,"00182-9131-65 ")
 ;;568
 ;;21,"00182-9140-01 ")
 ;;569
 ;;21,"00182-9141-01 ")
 ;;570
 ;;21,"00228-2082-10 ")
 ;;725
 ;;21,"00228-2082-50 ")
 ;;726
 ;;21,"00228-2085-10 ")
 ;;57
 ;;21,"00228-2085-50 ")
 ;;58
 ;;21,"00247-0086-00 ")
 ;;59
 ;;21,"00247-0086-02 ")
 ;;60
 ;;21,"00247-0086-03 ")
 ;;61
 ;;21,"00247-0086-04 ")
 ;;62
 ;;21,"00247-0086-05 ")
 ;;63
 ;;21,"00247-0086-06 ")
 ;;64
 ;;21,"00247-0086-08 ")
 ;;65
 ;;21,"00247-0086-10 ")
 ;;66
 ;;21,"00247-0086-12 ")
 ;;67
 ;;21,"00247-0086-15 ")
 ;;68
 ;;21,"00247-0086-16 ")
 ;;69
 ;;21,"00247-0086-20 ")
 ;;70
 ;;21,"00247-0086-24 ")
 ;;71
 ;;21,"00247-0086-25 ")
 ;;72
 ;;21,"00247-0086-28 ")
 ;;73
 ;;21,"00247-0086-30 ")
 ;;74
 ;;21,"00247-0086-40 ")
 ;;75
 ;;21,"00247-0086-45 ")
 ;;76
 ;;21,"00247-0086-50 ")
 ;;77
 ;;21,"00247-0086-59 ")
 ;;78
 ;;21,"00247-0086-60 ")
 ;;79
 ;;21,"00247-0086-77 ")
 ;;80
 ;;21,"00247-0086-90 ")
 ;;81
 ;;21,"00247-0086-98 ")
 ;;82
 ;;21,"00247-0154-04 ")
 ;;727
 ;;21,"00247-0154-10 ")
 ;;728
 ;;21,"00247-0154-12 ")
 ;;729
 ;;21,"00247-0154-20 ")
 ;;730
 ;;21,"00247-0154-30 ")
 ;;731
 ;;21,"00247-0154-40 ")
 ;;732
 ;;21,"00247-0611-20 ")
 ;;83
 ;;21,"00247-0818-04 ")
 ;;460
 ;;21,"00247-0818-12 ")
 ;;461
 ;;21,"00247-0818-15 ")
 ;;462
 ;;21,"00247-0818-20 ")
 ;;463
 ;;21,"00247-0818-25 ")
 ;;464
 ;;21,"00247-0818-30 ")
 ;;465
 ;;21,"00247-0971-20 ")
 ;;434
 ;;21,"00247-0971-28 ")
 ;;435
 ;;21,"00247-1037-12 ")
 ;;827
 ;;21,"00247-1037-20 ")
 ;;828
 ;;21,"00247-1037-90 ")
 ;;829
 ;;21,"00247-1038-90 ")
 ;;815
 ;;21,"00247-1441-01 ")
 ;;11
 ;;21,"00247-1441-04 ")
 ;;12
 ;;21,"00247-1441-05 ")
 ;;13
 ;;21,"00247-1441-20 ")
 ;;14
 ;;21,"00247-2124-00 ")
 ;;84
 ;;21,"00254-5112-28 ")
 ;;85
 ;;21,"00254-5112-35 ")
 ;;86
 ;;21,"00254-5112-38 ")
 ;;87
 ;;21,"00254-5113-28 ")
 ;;88
 ;;21,"00254-5113-35 ")
 ;;89
 ;;21,"00254-5113-38 ")
 ;;90
 ;;21,"00254-5114-35 ")
 ;;91
 ;;21,"00254-5114-38 ")
 ;;92
 ;;21,"00338-2691-75 ")
 ;;571
 ;;21,"00338-9370-41 ")
 ;;572
 ;;21,"00338-9372-48 ")
 ;;573
 ;;21,"00338-9373-48 ")
 ;;574
 ;;21,"00378-0130-01 ")
 ;;15
 ;;21,"00378-0130-05 ")
 ;;16
 ;;21,"00378-0131-05 ")
 ;;436
 ;;21,"00378-0155-01 ")
 ;;93
 ;;21,"00378-0155-05 ")
 ;;94
 ;;21,"00378-7065-01 ")
 ;;733
 ;;21,"00378-7065-05 ")
 ;;734
 ;;21,"00406-1721-01 ")
 ;;95
 ;;21,"00406-1721-05 ")
 ;;96
 ;;21,"00406-1721-10 ")
 ;;97
 ;;21,"00406-1721-91 ")
 ;;98
 ;;21,"00406-1772-01 ")
 ;;99
 ;;21,"00406-1772-03 ")
 ;;100
 ;;21,"00406-1772-05 ")
 ;;101
 ;;21,"00406-1772-10 ")
 ;;102
 ;;21,"00406-1772-12 ")
 ;;103
 ;;21,"00406-1772-33 ")
 ;;104
 ;;21,"00406-1772-60 ")
 ;;105
 ;;21,"00406-1772-62 ")
 ;;106
 ;;21,"00406-1772-90 ")
 ;;107
 ;;21,"00406-1772-91 ")
 ;;108
 ;;21,"00406-3118-01 ")
 ;;626
 ;;21,"00406-7113-01 ")
 ;;575
 ;;21,"00406-7115-01 ")
 ;;576
 ;;21,"00409-1176-30 ")
 ;;526
 ;;21,"00409-1178-30 ")
 ;;527
 ;;21,"00409-1179-30 ")
 ;;528
 ;;21,"00409-1180-69 ")
 ;;529
 ;;21,"00409-1181-30 ")
 ;;530
 ;;21,"00409-1201-20 ")
 ;;531
 ;;21,"00409-1203-01 ")
 ;;532
 ;;21,"00409-1253-01 ")
 ;;533
 ;;21,"00409-1254-01 ")
 ;;534
 ;;21,"00409-1255-02 ")
 ;;535
 ;;21,"00409-1256-01 ")
 ;;536
 ;;21,"00409-1920-10 ")
 ;;818
 ;;21,"00409-1941-01 ")
 ;;819
 ;;21,"00409-6030-04 ")
 ;;577
 ;;21,"00440-8210-10 ")
 ;;109
 ;;21,"00555-0381-02 ")
 ;;578
 ;;21,"00555-0382-02 ")
 ;;579
 ;;21,"00574-7040-12 ")
 ;;449
 ;;21,"00574-7045-12 ")
 ;;450
 ;;21,"00591-0395-01 ")
 ;;627
 ;;21,"00591-0396-01 ")
 ;;1
 ;;21,"00591-0714-01 ")
 ;;17
 ;;21,"00591-0714-05 ")
 ;;18
 ;;21,"00591-0726-01 ")
 ;;580
 ;;21,"00591-0727-01 ")
 ;;581
 ;;21,"00603-4415-21 ")
 ;;582
 ;;21,"00603-4416-21 ")
 ;;583
 ;;21,"00603-4424-21 ")
 ;;625
 ;;21,"00603-5110-21 ")
 ;;735
 ;;21,"00603-5110-28 ")
 ;;736
 ;;21,"00603-5459-21 ")
 ;;737
 ;;21,"00603-5459-28 ")
 ;;738
 ;;21,"00603-5460-21 ")
 ;;437
 ;;21,"00603-5460-28 ")
 ;;438
 ;;21,"00603-5462-21 ")
 ;;19
 ;;21,"00603-5462-28 ")
 ;;20
 ;;21,"00603-5463-28 ")
 ;;21
 ;;21,"00603-5465-21 ")
 ;;110
 ;;21,"00603-5466-21 ")
 ;;111
 ;;21,"00603-5466-28 ")
 ;;112
 ;;21,"00603-5466-32 ")
 ;;113
 ;;21,"00603-5467-16 ")
 ;;114
 ;;21,"00603-5467-21 ")
 ;;115
 ;;21,"00603-5467-28 ")
 ;;116
 ;;21,"00603-5467-32 ")
 ;;117
 ;;21,"00603-5468-02 ")
 ;;118
 ;;21,"00603-5468-04 ")
 ;;119
 ;;21,"00603-5468-16 ")
 ;;120
 ;;21,"00603-5468-19 ")
 ;;121
 ;;21,"00603-5468-21 ")
 ;;122
 ;;21,"00603-5468-22 ")
 ;;123
 ;;21,"00603-5468-28 ")
 ;;124
 ;;21,"00603-5468-32 ")
 ;;125
 ;;21,"00641-1130-25 ")
 ;;584
 ;;21,"00641-1140-25 ")
 ;;585
 ;;21,"00677-0356-01 ")
 ;;739
 ;;21,"00677-0356-05 ")
 ;;740
 ;;21,"00781-1378-13 ")
 ;;22
 ;;21,"00781-2140-01 ")
 ;;741
 ;;21,"00781-2140-10 ")
 ;;742
 ;;21,"00781-2367-01 ")
 ;;704
 ;;21,"00781-2367-10 ")
 ;;705
 ;;21,"00904-1977-60 ")
 ;;586
 ;;21,"00904-1978-60 ")
 ;;587
 ;;21,"00904-2280-60 ")
 ;;126
 ;;21,"00904-2281-40 ")
 ;;127
 ;;21,"00904-2281-60 ")
 ;;128
 ;;21,"00904-7700-40 ")
 ;;743
 ;;21,"00904-7700-60 ")
 ;;744
 ;;21,"00904-7700-61 ")
 ;;745
 ;;21,"00904-7700-80 ")
 ;;746
 ;;21,"00904-7701-40 ")
 ;;439
 ;;21,"00904-7701-60 ")
 ;;440
 ;;21,"00904-7701-80 ")
 ;;706
 ;;21,"00904-7702-80 ")
 ;;129
 ;;21,"10019-0151-44 ")
 ;;588
 ;;21,"10019-0151-47 ")
 ;;589
 ;;21,"10019-0155-68 ")
 ;;590
 ;;21,"10019-0156-68 ")
 ;;591
 ;;21,"10019-0157-68 ")
 ;;592
 ;;21,"10019-0158-68 ")
 ;;593
 ;;21,"10019-0159-01 ")
 ;;594
 ;;21,"10019-0159-44 ")
 ;;595
 ;;21,"10019-0160-01 ")
 ;;596
 ;;21,"10019-0160-44 ")
 ;;597
 ;;21,"10019-0161-01 ")
 ;;598
 ;;21,"10019-0161-44 ")
 ;;599
 ;;21,"10019-0162-01 ")
 ;;600
 ;;21,"10019-0162-44 ")
 ;;601
 ;;21,"10122-0301-10 ")
 ;;447
 ;;21,"10544-0302-30 ")
 ;;130
 ;;21,"12280-0160-00 ")
 ;;747
 ;;21,"16590-0196-15 ")
 ;;23
 ;;21,"16590-0196-20 ")
 ;;24
 ;;21,"16590-0196-30 ")
 ;;25
 ;;21,"16590-0197-15 ")
 ;;131
 ;;21,"16590-0197-28 ")
 ;;132
 ;;21,"16590-0197-30 ")
 ;;133
 ;;21,"16590-0197-40 ")
 ;;134
 ;;21,"16590-0197-45 ")
 ;;135
 ;;21,"16590-0197-60 ")
 ;;136
 ;;21,"16590-0197-72 ")
 ;;137
 ;;21,"16590-0197-75 ")
 ;;138
 ;;21,"16590-0197-90 ")
 ;;139
 ;;21,"16590-0198-30 ")
 ;;748
 ;;21,"16590-0198-60 ")
 ;;749
 ;;21,"16590-0198-72 ")
 ;;750
 ;;21,"16590-0198-90 ")
 ;;751
 ;;21,"18837-0128-15 ")
 ;;140
 ;;21,"18837-0128-28 ")
 ;;141
 ;;21,"18837-0128-30 ")
 ;;142
 ;;21,"18837-0128-40 ")
 ;;143
 ;;21,"18837-0128-50 ")
 ;;144
 ;;21,"18837-0128-60 ")
 ;;145
 ;;21,"18837-0128-90 ")
 ;;146
 ;;21,"18837-0128-98 ")
 ;;147
 ;;21,"21695-0241-01 ")
 ;;820
 ;;21,"21695-0280-08 ")
 ;;148
 ;;21,"21695-0280-12 ")
 ;;149
 ;;21,"21695-0280-15 ")
 ;;150
 ;;21,"21695-0280-20 ")
 ;;151
 ;;21,"21695-0280-28 ")
 ;;152
 ;;21,"21695-0280-30 ")
 ;;153
 ;;21,"21695-0280-60 ")
 ;;154
 ;;21,"21695-0280-72 ")
 ;;155
 ;;21,"21695-0280-90 ")
 ;;156
 ;;21,"21695-0364-28 ")
 ;;628
 ;;21,"21695-0364-60 ")
 ;;629
 ;;21,"21695-0364-72 ")
 ;;630
 ;;21,"21695-0634-60 ")
 ;;2
 ;;21,"23155-0012-01 ")
 ;;752
 ;;21,"23155-0012-05 ")
 ;;753
 ;;21,"23490-0120-03 ")
 ;;157
 ;;21,"23490-0120-06 ")
 ;;158
 ;;21,"23490-6073-01 ")
 ;;631
 ;;21,"23490-6073-03 ")
 ;;632
 ;;21,"23490-6073-08 ")
 ;;633
 ;;21,"23490-6197-00 ")
 ;;159
 ;;21,"23490-6197-01 ")
 ;;160
 ;;21,"23490-6197-02 ")
 ;;161
 ;;21,"23490-6197-03 ")
 ;;162
 ;;21,"23490-6197-04 ")
 ;;163
 ;;21,"23490-6197-05 ")
 ;;164
 ;;21,"23490-6197-07 ")
 ;;165
 ;;21,"23490-6197-08 ")
 ;;166
 ;;21,"23490-6197-09 ")
 ;;167
 ;;21,"23490-7775-01 ")
 ;;547
 ;;21,"23490-7775-02 ")
 ;;548
 ;;21,"23490-7775-03 ")
 ;;549
 ;;21,"23490-7775-04 ")
 ;;550
 ;;21,"23490-7930-04 ")
 ;;168
 ;;21,"23490-7930-07 ")
 ;;169
 ;;21,"23490-7930-08 ")
 ;;170
 ;;21,"23490-9300-03 ")
 ;;602
 ;;21,"23490-9300-06 ")
 ;;603
 ;;21,"23490-9300-09 ")
 ;;604
 ;;21,"24200-0359-80 ")
 ;;605
 ;;21,"24486-0325-10 ")
 ;;171
 ;;21,"24486-0326-10 ")
 ;;172
 ;;21,"33358-0308-01 ")
 ;;173
 ;;21,"33358-0308-60 ")
 ;;174
 ;;21,"33358-0309-20 ")
 ;;754
 ;;21,"33358-0309-30 ")
 ;;755
 ;;21,"33358-0309-60 ")
 ;;756
 ;;21,"35356-0176-30 ")
 ;;634
 ;;21,"35356-0329-30 ")
 ;;830
 ;;21,"35356-0507-30 ")
 ;;175
 ;;21,"35356-0507-60 ")
 ;;176
 ;;21,"35356-0507-90 ")
 ;;177
 ;;21,"43063-0023-06 ")
 ;;178
 ;;21,"43063-0142-20 ")
 ;;635
 ;;21,"43353-0467-30 ")
 ;;179
 ;;21,"43353-0468-30 ")
 ;;180
 ;;21,"49884-0120-01 ")
 ;;757
 ;;21,"49884-0120-10 ")
 ;;758
 ;;21,"49884-0314-01 ")
 ;;759
 ;;21,"49884-0314-10 ")
 ;;760
 ;;21,"49999-0767-00 ")
 ;;181
 ;;21,"49999-0767-01 ")
 ;;182
 ;;21,"49999-0767-06 ")
 ;;183
 ;;21,"49999-0767-10 ")
 ;;184
 ;;21,"49999-0767-12 ")
 ;;185
 ;;21,"49999-0767-15 ")
 ;;186
 ;;21,"49999-0767-20 ")
 ;;187
 ;;21,"49999-0767-30 ")
 ;;188
 ;;21,"49999-0767-50 ")
 ;;189
 ;;21,"49999-0767-60 ")
 ;;190
 ;;21,"49999-0767-90 ")
 ;;191
 ;;21,"49999-0798-30 ")
 ;;761
 ;;21,"49999-0798-60 ")
 ;;762
 ;;21,"49999-0837-30 ")
 ;;606
 ;;21,"49999-0838-01 ")
 ;;607
 ;;21,"49999-0838-30 ")
 ;;608
 ;;21,"50111-0790-01 ")
 ;;192
 ;;21,"51079-0322-01 ")
 ;;193
 ;;21,"51079-0322-20 ")
 ;;194
 ;;21,"51079-0322-21 ")
 ;;195
 ;;21,"51079-0322-30 ")
 ;;196
 ;;21,"51079-0322-56 ")
 ;;197
 ;;21,"51079-0322-96 ")
 ;;198
 ;;21,"51079-0322-99 ")
 ;;199
 ;;21,"51079-0741-01 ")
 ;;26
 ;;21,"51079-0741-20 ")
 ;;27
 ;;21,"51641-0321-01 ")
 ;;700
 ;;21,"51641-0321-05 ")
 ;;701
 ;;21,"51641-0321-10 ")
 ;;702
 ;;21,"51641-0321-11 ")
 ;;703
 ;;21,"51641-0323-01 ")
 ;;696
 ;;21,"51641-0323-05 ")
 ;;697
 ;;21,"51641-0323-10 ")
 ;;698
 ;;21,"51641-0323-11 ")
 ;;699
 ;;21,"51655-0837-24 ")
 ;;200
 ;;21,"51655-0837-25 ")
 ;;201
 ;;21,"51655-0837-26 ")
 ;;202
 ;
OTHER ; OTHER ROUTINES
 D ^BGP13L10
 D ^BGP13L11
 D ^BGP13L2
 D ^BGP13L3
 D ^BGP13L4
 D ^BGP13L5
 D ^BGP13L6
 D ^BGP13L7
 D ^BGP13L8
 D ^BGP13L9
 Q
