BGP13O2 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"18837-0087-30 ")
 ;;1122
 ;;21,"18837-0087-60 ")
 ;;1123
 ;;21,"18837-0088-30 ")
 ;;1124
 ;;21,"18837-0088-60 ")
 ;;1125
 ;;21,"18837-0088-90 ")
 ;;1126
 ;;21,"18837-0088-94 ")
 ;;1127
 ;;21,"18837-0088-98 ")
 ;;1128
 ;;21,"18837-0117-30 ")
 ;;1477
 ;;21,"18837-0117-60 ")
 ;;1478
 ;;21,"18837-0117-90 ")
 ;;1479
 ;;21,"18837-0144-30 ")
 ;;1631
 ;;21,"18837-0144-60 ")
 ;;1632
 ;;21,"18837-0144-90 ")
 ;;1633
 ;;21,"18837-0144-94 ")
 ;;1634
 ;;21,"18837-0144-98 ")
 ;;1635
 ;;21,"18837-0294-40 ")
 ;;1765
 ;;21,"18837-0336-11 ")
 ;;3
 ;;21,"18837-0336-30 ")
 ;;4
 ;;21,"21695-0021-15 ")
 ;;129
 ;;21,"21695-0021-30 ")
 ;;130
 ;;21,"21695-0021-60 ")
 ;;131
 ;;21,"21695-0021-72 ")
 ;;132
 ;;21,"21695-0021-90 ")
 ;;133
 ;;21,"21695-0036-20 ")
 ;;647
 ;;21,"21695-0036-30 ")
 ;;648
 ;;21,"21695-0037-10 ")
 ;;649
 ;;21,"21695-0037-14 ")
 ;;650
 ;;21,"21695-0037-15 ")
 ;;651
 ;;21,"21695-0037-20 ")
 ;;652
 ;;21,"21695-0037-30 ")
 ;;653
 ;;21,"21695-0037-45 ")
 ;;654
 ;;21,"21695-0037-60 ")
 ;;655
 ;;21,"21695-0037-90 ")
 ;;656
 ;;21,"21695-0078-20 ")
 ;;1129
 ;;21,"21695-0078-30 ")
 ;;1130
 ;;21,"21695-0078-60 ")
 ;;1131
 ;;21,"21695-0078-90 ")
 ;;1132
 ;;21,"21695-0079-20 ")
 ;;1133
 ;;21,"21695-0079-60 ")
 ;;1134
 ;;21,"21695-0079-90 ")
 ;;1135
 ;;21,"21695-0099-14 ")
 ;;1480
 ;;21,"21695-0099-30 ")
 ;;1481
 ;;21,"21695-0099-60 ")
 ;;1482
 ;;21,"21695-0123-15 ")
 ;;1636
 ;;21,"21695-0123-30 ")
 ;;1637
 ;;21,"21695-0123-60 ")
 ;;1638
 ;;21,"21695-0569-30 ")
 ;;434
 ;;21,"21695-0723-14 ")
 ;;5
 ;;21,"21695-0723-28 ")
 ;;6
 ;;21,"21695-0726-45 ")
 ;;31
 ;;21,"23490-0381-02 ")
 ;;657
 ;;21,"23490-0381-03 ")
 ;;658
 ;;21,"23490-0381-06 ")
 ;;659
 ;;21,"23490-5212-00 ")
 ;;134
 ;;21,"23490-5212-01 ")
 ;;135
 ;;21,"23490-5212-02 ")
 ;;136
 ;;21,"23490-5212-03 ")
 ;;137
 ;;21,"23490-5212-05 ")
 ;;138
 ;;21,"23490-5212-06 ")
 ;;139
 ;;21,"23490-5212-07 ")
 ;;140
 ;;21,"23490-5212-08 ")
 ;;141
 ;;21,"23490-5212-09 ")
 ;;142
 ;;21,"23490-5310-01 ")
 ;;435
 ;;21,"23490-5310-02 ")
 ;;436
 ;;21,"23490-5310-03 ")
 ;;437
 ;;21,"23490-5310-04 ")
 ;;438
 ;;21,"23490-5377-00 ")
 ;;660
 ;;21,"23490-5377-01 ")
 ;;661
 ;;21,"23490-5377-02 ")
 ;;662
 ;;21,"23490-5377-03 ")
 ;;663
 ;;21,"23490-5377-04 ")
 ;;664
 ;;21,"23490-5377-05 ")
 ;;665
 ;;21,"23490-5377-06 ")
 ;;666
 ;;21,"23490-5377-07 ")
 ;;667
 ;;21,"23490-5377-08 ")
 ;;668
 ;;21,"23490-5377-09 ")
 ;;669
 ;;21,"23490-5882-01 ")
 ;;1136
 ;;21,"23490-5882-02 ")
 ;;1137
 ;;21,"23490-5882-03 ")
 ;;1138
 ;;21,"23490-5882-04 ")
 ;;1139
 ;;21,"23490-5882-05 ")
 ;;1140
 ;;21,"23490-5882-06 ")
 ;;1141
 ;;21,"23490-5883-01 ")
 ;;1142
 ;;21,"23490-5883-02 ")
 ;;1143
 ;;21,"23490-5883-03 ")
 ;;1144
 ;;21,"23490-5883-04 ")
 ;;1145
 ;;21,"23490-5883-05 ")
 ;;1146
 ;;21,"23490-5883-06 ")
 ;;1147
 ;;21,"23490-6039-01 ")
 ;;1483
 ;;21,"23490-6039-02 ")
 ;;1484
 ;;21,"23490-6039-03 ")
 ;;1485
 ;;21,"23490-6039-04 ")
 ;;1486
 ;;21,"23490-6039-09 ")
 ;;1487
 ;;21,"23490-7673-00 ")
 ;;670
 ;;21,"23490-7673-01 ")
 ;;671
 ;;21,"23490-7673-03 ")
 ;;672
 ;;21,"23490-7673-04 ")
 ;;673
 ;;21,"23490-7917-00 ")
 ;;143
 ;;21,"23490-7917-04 ")
 ;;144
 ;;21,"23490-7917-05 ")
 ;;145
 ;;21,"23490-7917-07 ")
 ;;146
 ;;21,"23490-7917-08 ")
 ;;147
 ;;21,"23490-7940-01 ")
 ;;674
 ;;21,"23490-7940-02 ")
 ;;675
 ;;21,"31722-0533-01 ")
 ;;1148
 ;;21,"31722-0533-05 ")
 ;;1149
 ;;21,"31722-0534-01 ")
 ;;1150
 ;;21,"31722-0534-05 ")
 ;;1151
 ;;21,"33261-0088-10 ")
 ;;1488
 ;;21,"33261-0088-14 ")
 ;;1489
 ;;21,"33261-0088-20 ")
 ;;1490
 ;;21,"33261-0088-21 ")
 ;;1491
 ;;21,"33261-0088-28 ")
 ;;1492
 ;;21,"33261-0088-30 ")
 ;;1493
 ;;21,"33261-0088-60 ")
 ;;1494
 ;;21,"33261-0088-90 ")
 ;;1495
 ;;21,"33358-0064-01 ")
 ;;148
 ;;21,"33358-0097-00 ")
 ;;676
 ;;21,"33358-0097-01 ")
 ;;677
 ;;21,"33358-0097-15 ")
 ;;678
 ;;21,"33358-0097-20 ")
 ;;679
 ;;21,"33358-0097-28 ")
 ;;680
 ;;21,"33358-0097-30 ")
 ;;681
 ;;21,"33358-0097-60 ")
 ;;682
 ;;21,"33358-0097-90 ")
 ;;683
 ;;21,"33358-0239-14 ")
 ;;1152
 ;;21,"33358-0239-20 ")
 ;;1153
 ;;21,"33358-0239-30 ")
 ;;1154
 ;;21,"33358-0239-60 ")
 ;;1155
 ;;21,"33358-0239-90 ")
 ;;1156
 ;;21,"33358-0240-01 ")
 ;;1157
 ;;21,"33358-0240-20 ")
 ;;1158
 ;;21,"33358-0240-30 ")
 ;;1159
 ;;21,"33358-0240-40 ")
 ;;1160
 ;;21,"33358-0240-60 ")
 ;;1161
 ;;21,"33358-0240-90 ")
 ;;1162
 ;;21,"33358-0274-20 ")
 ;;1496
 ;;21,"33358-0274-30 ")
 ;;1497
 ;;21,"33358-0274-60 ")
 ;;1498
 ;;21,"33358-0325-01 ")
 ;;1639
 ;;21,"33358-0325-30 ")
 ;;1640
 ;;21,"33358-0325-45 ")
 ;;1641
 ;;21,"33358-0325-60 ")
 ;;1642
 ;;21,"33358-0325-90 ")
 ;;1643
 ;;21,"35356-0262-10 ")
 ;;7
 ;;21,"35356-0262-30 ")
 ;;8
 ;;21,"35356-0262-60 ")
 ;;9
 ;;21,"35356-0262-90 ")
 ;;10
 ;;21,"35356-0263-01 ")
 ;;11
 ;;21,"35356-0263-30 ")
 ;;12
 ;;21,"35356-0265-15 ")
 ;;987
 ;;21,"35356-0265-20 ")
 ;;988
 ;;21,"35356-0501-30 ")
 ;;1766
 ;;21,"43063-0050-03 ")
 ;;684
 ;;21,"43063-0050-04 ")
 ;;685
 ;;21,"43063-0050-06 ")
 ;;686
 ;;21,"43353-0436-60 ")
 ;;1163
 ;;21,"43386-0480-24 ")
 ;;1499
 ;;21,"49884-0016-01 ")
 ;;439
 ;;21,"49884-0016-10 ")
 ;;440
 ;;21,"49884-0246-01 ")
 ;;65
 ;;21,"49884-0246-05 ")
 ;;66
 ;;21,"49884-0472-01 ")
 ;;1584
 ;;21,"49884-0472-05 ")
 ;;1585
 ;;21,"49884-0473-01 ")
 ;;1586
 ;;21,"49884-0473-05 ")
 ;;1587
 ;;21,"49999-0034-01 ")
 ;;687
 ;;21,"49999-0034-07 ")
 ;;688
 ;;21,"49999-0034-12 ")
 ;;689
 ;;21,"49999-0034-15 ")
 ;;690
 ;;21,"49999-0034-20 ")
 ;;691
 ;;21,"49999-0034-21 ")
 ;;692
 ;;21,"49999-0034-30 ")
 ;;693
 ;;21,"49999-0034-60 ")
 ;;694
 ;;21,"49999-0034-90 ")
 ;;695
 ;;21,"49999-0044-10 ")
 ;;441
 ;;21,"49999-0044-14 ")
 ;;442
 ;;21,"49999-0044-15 ")
 ;;443
 ;;21,"49999-0044-18 ")
 ;;444
 ;;21,"49999-0044-20 ")
 ;;445
 ;;21,"49999-0044-30 ")
 ;;446
 ;;21,"49999-0044-40 ")
 ;;447
 ;;21,"49999-0044-60 ")
 ;;448
 ;;21,"49999-0044-90 ")
 ;;449
 ;;21,"49999-0046-14 ")
 ;;1500
 ;;21,"49999-0046-20 ")
 ;;1501
 ;;21,"49999-0046-30 ")
 ;;1502
 ;;21,"49999-0048-01 ")
 ;;1164
 ;;21,"49999-0048-20 ")
 ;;1165
 ;;21,"49999-0048-30 ")
 ;;1166
 ;;21,"49999-0048-40 ")
 ;;1167
 ;;21,"49999-0048-60 ")
 ;;1168
 ;;21,"49999-0048-90 ")
 ;;1169
 ;;21,"49999-0064-00 ")
 ;;149
 ;;21,"49999-0064-01 ")
 ;;150
 ;;21,"49999-0064-06 ")
 ;;151
 ;;21,"49999-0064-07 ")
 ;;152
 ;;21,"49999-0064-10 ")
 ;;153
 ;;21,"49999-0064-14 ")
 ;;154
 ;;21,"49999-0064-15 ")
 ;;155
 ;;21,"49999-0064-18 ")
 ;;156
 ;;21,"49999-0064-20 ")
 ;;157
 ;;21,"49999-0064-30 ")
 ;;158
 ;;21,"49999-0064-40 ")
 ;;159
 ;;21,"49999-0064-50 ")
 ;;160
 ;;21,"49999-0064-60 ")
 ;;161
 ;;21,"49999-0064-90 ")
 ;;162
 ;;21,"49999-0065-01 ")
 ;;1170
 ;;21,"49999-0065-12 ")
 ;;1171
 ;;21,"49999-0065-20 ")
 ;;1172
 ;;21,"49999-0065-30 ")
 ;;1173
 ;;21,"49999-0065-40 ")
 ;;1174
 ;;21,"49999-0065-60 ")
 ;;1175
 ;;21,"49999-0065-90 ")
 ;;1176
 ;;21,"49999-0070-20 ")
 ;;1644
 ;;21,"49999-0070-30 ")
 ;;1645
 ;;21,"49999-0070-40 ")
 ;;1646
 ;;21,"49999-0070-42 ")
 ;;1647
 ;;21,"49999-0070-60 ")
 ;;1648
 ;;21,"49999-0274-10 ")
 ;;989
 ;;21,"49999-0274-21 ")
 ;;990
 ;;21,"49999-0363-01 ")
 ;;1649
 ;;21,"49999-0363-15 ")
 ;;1650
 ;;21,"49999-0363-16 ")
 ;;1651
 ;;21,"49999-0363-18 ")
 ;;1652
 ;;21,"49999-0363-20 ")
 ;;1653
 ;;21,"49999-0363-30 ")
 ;;1654
 ;;21,"49999-0363-60 ")
 ;;1655
 ;;21,"49999-0363-90 ")
 ;;1656
 ;;21,"49999-0791-00 ")
 ;;696
 ;;21,"49999-0791-21 ")
 ;;697
 ;;21,"49999-0791-30 ")
 ;;698
 ;;21,"50111-0563-01 ")
 ;;699
 ;;21,"50111-0563-02 ")
 ;;700
 ;;21,"50111-0563-03 ")
 ;;701
 ;;21,"50111-0820-01 ")
 ;;702
 ;;21,"50580-0280-10 ")
 ;;991
 ;;21,"50580-0874-11 ")
 ;;992
 ;;21,"51079-0055-01 ")
 ;;163
 ;;21,"51079-0055-20 ")
 ;;164
 ;;21,"51079-0476-01 ")
 ;;450
 ;;21,"51079-0476-20 ")
 ;;451
 ;;21,"51079-0644-01 ")
 ;;703
 ;;21,"51079-0644-19 ")
 ;;704
 ;;21,"51079-0644-20 ")
 ;;705
 ;;21,"51079-0644-93 ")
 ;;706
 ;;21,"51079-0644-97 ")
 ;;707
 ;;21,"51079-0819-01 ")
 ;;165
 ;;21,"51079-0819-20 ")
 ;;166
 ;;21,"51285-0873-02 ")
 ;;708
 ;;21,"51285-0873-04 ")
 ;;709
 ;;21,"51285-0873-05 ")
 ;;710
 ;;21,"51285-0874-04 ")
 ;;167
 ;;21,"51285-0874-05 ")
 ;;168
 ;;21,"51525-5901-01 ")
 ;;169
 ;;21,"51655-0141-50 ")
 ;;1177
 ;;21,"51655-0141-51 ")
 ;;1178
 ;;21,"51655-0141-52 ")
 ;;1179
 ;;21,"51655-0240-53 ")
 ;;1657
 ;;21,"51655-0376-52 ")
 ;;170
 ;;21,"51655-0440-24 ")
 ;;711
 ;;21,"51655-0440-25 ")
 ;;712
 ;;21,"51655-0440-52 ")
 ;;713
 ;;21,"51655-0440-54 ")
 ;;714
 ;;21,"51655-0440-85 ")
 ;;715
 ;;21,"51655-0440-89 ")
 ;;716
 ;;21,"51655-0576-24 ")
 ;;1180
 ;;21,"51655-0576-25 ")
 ;;1181
 ;;21,"51655-0576-51 ")
 ;;1182
 ;;21,"51655-0576-52 ")
 ;;1183
 ;;21,"51991-0467-01 ")
 ;;717
 ;;21,"51991-0467-10 ")
 ;;718
 ;;21,"51991-0468-01 ")
 ;;719
 ;;21,"51991-0468-10 ")
 ;;720
 ;;21,"52152-0025-02 ")
 ;;452
 ;;21,"52152-0025-04 ")
 ;;453
 ;;21,"52152-0053-02 ")
 ;;454
 ;;21,"52152-0053-05 ")
 ;;455
 ;;21,"52152-0136-02 ")
 ;;171
 ;;21,"52152-0136-04 ")
 ;;172
 ;;21,"52152-0136-05 ")
 ;;173
 ;;21,"52152-0137-02 ")
 ;;67
 ;;21,"52152-0137-04 ")
 ;;68
 ;;21,"52152-0138-02 ")
 ;;38
 ;;21,"52152-0301-02 ")
 ;;721
 ;;21,"52152-0302-02 ")
 ;;722
 ;;21,"52152-0302-05 ")
 ;;723
 ;;21,"52152-0340-02 ")
 ;;1503
 ;;21,"52959-0006-10 ")
 ;;993
 ;;21,"52959-0006-20 ")
 ;;994
 ;;21,"52959-0006-30 ")
 ;;995
 ;;21,"52959-0006-90 ")
 ;;996
 ;;21,"52959-0026-00 ")
 ;;174
 ;;21,"52959-0026-03 ")
 ;;175
 ;;21,"52959-0026-06 ")
 ;;176
 ;;21,"52959-0026-10 ")
 ;;177
 ;;21,"52959-0026-12 ")
 ;;178
 ;;21,"52959-0026-14 ")
 ;;179
 ;;21,"52959-0026-15 ")
 ;;180
 ;;21,"52959-0026-20 ")
 ;;181
 ;;21,"52959-0026-21 ")
 ;;182
 ;;21,"52959-0026-24 ")
 ;;183
 ;;21,"52959-0026-25 ")
 ;;184
 ;;21,"52959-0026-28 ")
 ;;185
 ;;21,"52959-0026-30 ")
 ;;186
 ;;21,"52959-0026-32 ")
 ;;187
 ;;21,"52959-0026-40 ")
 ;;188
 ;;21,"52959-0026-45 ")
 ;;189
 ;;21,"52959-0026-50 ")
 ;;190
 ;;21,"52959-0026-52 ")
 ;;191
 ;;21,"52959-0026-56 ")
 ;;192
 ;;21,"52959-0026-60 ")
 ;;193
 ;;21,"52959-0026-80 ")
 ;;194
 ;;21,"52959-0026-90 ")
 ;;195
 ;;21,"52959-0035-00 ")
 ;;456
 ;;21,"52959-0035-01 ")
 ;;457
 ;;21,"52959-0035-10 ")
 ;;458
 ;;21,"52959-0035-20 ")
 ;;459
 ;;21,"52959-0035-21 ")
 ;;460
 ;;21,"52959-0035-28 ")
 ;;461
 ;;21,"52959-0035-30 ")
 ;;462
 ;;21,"52959-0035-40 ")
 ;;463
 ;;21,"52959-0035-56 ")
 ;;464
 ;;21,"52959-0035-60 ")
 ;;465
 ;;21,"52959-0035-70 ")
 ;;466
 ;;21,"52959-0035-90 ")
 ;;467
 ;;21,"52959-0042-00 ")
 ;;724
 ;;21,"52959-0042-02 ")
 ;;725
 ;;21,"52959-0042-04 ")
 ;;726
 ;;21,"52959-0042-07 ")
 ;;727
 ;;21,"52959-0042-10 ")
 ;;728
 ;;21,"52959-0042-12 ")
 ;;729
 ;;21,"52959-0042-14 ")
 ;;730
 ;;21,"52959-0042-15 ")
 ;;731
 ;;21,"52959-0042-20 ")
 ;;732
 ;;21,"52959-0042-21 ")
 ;;733
 ;;21,"52959-0042-25 ")
 ;;734
 ;;21,"52959-0042-28 ")
 ;;735
 ;;21,"52959-0042-30 ")
 ;;736
 ;;21,"52959-0042-35 ")
 ;;737
 ;;21,"52959-0042-40 ")
 ;;738
 ;;21,"52959-0042-45 ")
 ;;739
 ;;21,"52959-0042-60 ")
 ;;740
 ;;21,"52959-0042-90 ")
 ;;741
 ;;21,"52959-0069-10 ")
 ;;997
 ;;21,"52959-0069-15 ")
 ;;998
 ;;21,"52959-0069-20 ")
 ;;999
 ;;21,"52959-0069-21 ")
 ;;1000
 ;;21,"52959-0069-30 ")
 ;;1001
 ;;21,"52959-0069-40 ")
 ;;1002
 ;;21,"52959-0099-00 ")
 ;;1184
 ;;21,"52959-0099-03 ")
 ;;1185
 ;;21,"52959-0099-10 ")
 ;;1186
 ;;21,"52959-0099-15 ")
 ;;1187
 ;;21,"52959-0099-20 ")
 ;;1188
 ;;21,"52959-0099-21 ")
 ;;1189
 ;;21,"52959-0099-28 ")
 ;;1190
 ;;21,"52959-0099-30 ")
 ;;1191
 ;;21,"52959-0099-40 ")
 ;;1192
 ;;21,"52959-0099-45 ")
 ;;1193
 ;;21,"52959-0099-50 ")
 ;;1194
 ;;21,"52959-0099-60 ")
 ;;1195
 ;;21,"52959-0099-90 ")
 ;;1196
 ;;21,"52959-0167-00 ")
 ;;1197
 ;;21,"52959-0167-03 ")
 ;;1198
 ;;21,"52959-0167-10 ")
 ;;1199
