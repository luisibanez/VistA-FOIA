BGP13Q3 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"00781-5442-01 ")
 ;;725
 ;;21,"00781-5442-10 ")
 ;;726
 ;;21,"00781-5443-01 ")
 ;;727
 ;;21,"00781-5443-10 ")
 ;;728
 ;;21,"00781-5444-01 ")
 ;;729
 ;;21,"00781-5444-10 ")
 ;;730
 ;;21,"00904-5045-61 ")
 ;;461
 ;;21,"00904-5045-67 ")
 ;;462
 ;;21,"00904-5046-61 ")
 ;;463
 ;;21,"00904-5047-40 ")
 ;;464
 ;;21,"00904-5047-61 ")
 ;;465
 ;;21,"00904-5502-61 ")
 ;;731
 ;;21,"00904-5502-80 ")
 ;;732
 ;;21,"00904-5503-60 ")
 ;;733
 ;;21,"00904-5504-60 ")
 ;;734
 ;;21,"00904-5609-60 ")
 ;;735
 ;;21,"00904-5609-61 ")
 ;;736
 ;;21,"00904-5610-61 ")
 ;;737
 ;;21,"00904-5611-61 ")
 ;;738
 ;;21,"00904-5638-43 ")
 ;;1480
 ;;21,"00904-5638-46 ")
 ;;1481
 ;;21,"00904-5638-61 ")
 ;;1482
 ;;21,"00904-5638-89 ")
 ;;1483
 ;;21,"00904-5639-43 ")
 ;;1484
 ;;21,"00904-5639-46 ")
 ;;1485
 ;;21,"00904-5639-48 ")
 ;;1486
 ;;21,"00904-5639-61 ")
 ;;1487
 ;;21,"00904-5639-89 ")
 ;;1488
 ;;21,"00904-5639-93 ")
 ;;1489
 ;;21,"00904-5640-43 ")
 ;;1490
 ;;21,"00904-5640-46 ")
 ;;1491
 ;;21,"00904-5640-48 ")
 ;;1492
 ;;21,"00904-5640-61 ")
 ;;1493
 ;;21,"00904-5640-89 ")
 ;;1494
 ;;21,"00904-5640-93 ")
 ;;1495
 ;;21,"00904-5642-43 ")
 ;;1496
 ;;21,"00904-5642-46 ")
 ;;1497
 ;;21,"00904-5642-48 ")
 ;;1498
 ;;21,"00904-5642-52 ")
 ;;1499
 ;;21,"00904-5642-61 ")
 ;;1500
 ;;21,"00904-5642-89 ")
 ;;1501
 ;;21,"00904-5642-93 ")
 ;;1502
 ;;21,"00904-5778-89 ")
 ;;1503
 ;;21,"00904-5808-43 ")
 ;;1504
 ;;21,"00904-5808-46 ")
 ;;1505
 ;;21,"00904-5808-48 ")
 ;;1506
 ;;21,"00904-5808-61 ")
 ;;1507
 ;;21,"00904-5808-80 ")
 ;;1508
 ;;21,"00904-5808-89 ")
 ;;1509
 ;;21,"00904-5808-93 ")
 ;;1510
 ;;21,"00904-5809-43 ")
 ;;1511
 ;;21,"00904-5809-46 ")
 ;;1512
 ;;21,"00904-5809-48 ")
 ;;1513
 ;;21,"00904-5809-61 ")
 ;;1514
 ;;21,"00904-5809-80 ")
 ;;1515
 ;;21,"00904-5809-89 ")
 ;;1516
 ;;21,"00904-5809-93 ")
 ;;1517
 ;;21,"00904-5810-43 ")
 ;;1518
 ;;21,"00904-5810-46 ")
 ;;1519
 ;;21,"00904-5810-48 ")
 ;;1520
 ;;21,"00904-5810-52 ")
 ;;1521
 ;;21,"00904-5810-61 ")
 ;;1522
 ;;21,"00904-5810-80 ")
 ;;1523
 ;;21,"00904-5810-89 ")
 ;;1524
 ;;21,"00904-5810-93 ")
 ;;1525
 ;;21,"00904-5811-43 ")
 ;;1526
 ;;21,"00904-5811-46 ")
 ;;1527
 ;;21,"00904-5811-61 ")
 ;;1528
 ;;21,"00904-5811-80 ")
 ;;1529
 ;;21,"00904-5811-89 ")
 ;;1530
 ;;21,"00904-5812-40 ")
 ;;1531
 ;;21,"00904-5812-89 ")
 ;;1532
 ;;21,"12280-0033-00 ")
 ;;2005
 ;;21,"12280-0059-90 ")
 ;;20
 ;;21,"12280-0061-00 ")
 ;;77
 ;;21,"12280-0120-30 ")
 ;;326
 ;;21,"12280-0121-30 ")
 ;;327
 ;;21,"12280-0123-30 ")
 ;;328
 ;;21,"12280-0124-30 ")
 ;;1199
 ;;21,"12280-0126-30 ")
 ;;1200
 ;;21,"12280-0126-60 ")
 ;;1201
 ;;21,"12280-0127-30 ")
 ;;1202
 ;;21,"12280-0129-60 ")
 ;;1533
 ;;21,"12280-0144-00 ")
 ;;1534
 ;;21,"12280-0183-30 ")
 ;;1203
 ;;21,"12280-0220-00 ")
 ;;329
 ;;21,"12280-0228-90 ")
 ;;2235
 ;;21,"15338-0200-30 ")
 ;;739
 ;;21,"15338-0211-30 ")
 ;;740
 ;;21,"15338-0220-30 ")
 ;;741
 ;;21,"15338-0233-30 ")
 ;;742
 ;;21,"16252-0541-30 ")
 ;;2404
 ;;21,"16252-0542-90 ")
 ;;2405
 ;;21,"16252-0543-90 ")
 ;;2406
 ;;21,"16252-0570-30 ")
 ;;2314
 ;;21,"16252-0571-01 ")
 ;;2315
 ;;21,"16252-0571-50 ")
 ;;2316
 ;;21,"16252-0572-01 ")
 ;;2317
 ;;21,"16252-0572-50 ")
 ;;2318
 ;;21,"16252-0573-01 ")
 ;;2319
 ;;21,"16252-0573-50 ")
 ;;2320
 ;;21,"16252-0610-01 ")
 ;;2119
 ;;21,"16252-0611-01 ")
 ;;2120
 ;;21,"16252-0612-01 ")
 ;;1316
 ;;21,"16252-0613-01 ")
 ;;1317
 ;;21,"16252-0614-01 ")
 ;;1318
 ;;21,"16590-0309-30 ")
 ;;1204
 ;;21,"16590-0309-60 ")
 ;;1205
 ;;21,"16590-0309-72 ")
 ;;1206
 ;;21,"16590-0309-90 ")
 ;;1207
 ;;21,"18837-0277-30 ")
 ;;1535
 ;;21,"21695-0326-30 ")
 ;;194
 ;;21,"21695-0327-30 ")
 ;;195
 ;;21,"21695-0328-30 ")
 ;;1536
 ;;21,"21695-0329-30 ")
 ;;1537
 ;;21,"21695-0329-90 ")
 ;;1538
 ;;21,"21695-0330-20 ")
 ;;1539
 ;;21,"21695-0330-30 ")
 ;;1540
 ;;21,"21695-0330-90 ")
 ;;1541
 ;;21,"21695-0331-30 ")
 ;;1542
 ;;21,"21695-0393-30 ")
 ;;2236
 ;;21,"21695-0394-30 ")
 ;;2237
 ;;21,"21695-0477-30 ")
 ;;466
 ;;21,"21695-0478-30 ")
 ;;467
 ;;21,"21695-0487-30 ")
 ;;743
 ;;21,"21695-0488-30 ")
 ;;744
 ;;21,"21695-0489-90 ")
 ;;745
 ;;21,"21695-0733-30 ")
 ;;1208
 ;;21,"21695-0780-30 ")
 ;;1022
 ;;21,"21695-0821-30 ")
 ;;2321
 ;;21,"21695-0877-30 ")
 ;;196
 ;;21,"23490-5118-01 ")
 ;;197
 ;;21,"23490-5119-01 ")
 ;;198
 ;;21,"23490-5120-03 ")
 ;;199
 ;;21,"23490-5120-09 ")
 ;;200
 ;;21,"23490-5121-01 ")
 ;;201
 ;;21,"23490-5191-01 ")
 ;;468
 ;;21,"23490-5192-01 ")
 ;;469
 ;;21,"23490-5193-01 ")
 ;;470
 ;;21,"23490-5193-02 ")
 ;;471
 ;;21,"23490-5193-03 ")
 ;;472
 ;;21,"23490-5194-00 ")
 ;;473
 ;;21,"23490-5194-01 ")
 ;;474
 ;;21,"23490-5194-02 ")
 ;;475
 ;;21,"23490-5491-01 ")
 ;;746
 ;;21,"23490-5491-02 ")
 ;;747
 ;;21,"23490-5491-08 ")
 ;;748
 ;;21,"23490-5491-09 ")
 ;;749
 ;;21,"23490-5492-01 ")
 ;;750
 ;;21,"23490-5492-02 ")
 ;;751
 ;;21,"23490-5494-01 ")
 ;;752
 ;;21,"23490-5494-02 ")
 ;;753
 ;;21,"23490-5815-00 ")
 ;;1543
 ;;21,"23490-5815-01 ")
 ;;1544
 ;;21,"23490-5816-01 ")
 ;;1545
 ;;21,"23490-5816-02 ")
 ;;1546
 ;;21,"23490-5816-06 ")
 ;;1547
 ;;21,"23490-5817-02 ")
 ;;1548
 ;;21,"23490-5818-02 ")
 ;;1549
 ;;21,"23490-5819-02 ")
 ;;1550
 ;;21,"23490-5820-01 ")
 ;;1209
 ;;21,"23490-5821-01 ")
 ;;1210
 ;;21,"23490-5822-01 ")
 ;;1211
 ;;21,"23490-9364-03 ")
 ;;2238
 ;;21,"23629-0007-01 ")
 ;;202
 ;;21,"23629-0021-01 ")
 ;;1064
 ;;21,"23629-0080-01 ")
 ;;203
 ;;21,"24658-0100-10 ")
 ;;1065
 ;;21,"24658-0100-90 ")
 ;;1066
 ;;21,"24658-0101-10 ")
 ;;1067
 ;;21,"24658-0101-90 ")
 ;;1068
 ;;21,"24658-0102-10 ")
 ;;1069
 ;;21,"24658-0102-90 ")
 ;;1070
 ;;21,"24658-0200-01 ")
 ;;2322
 ;;21,"24658-0200-05 ")
 ;;2323
 ;;21,"24658-0201-01 ")
 ;;2324
 ;;21,"24658-0201-05 ")
 ;;2325
 ;;21,"24658-0202-01 ")
 ;;2326
 ;;21,"24658-0202-05 ")
 ;;2327
 ;;21,"24658-0203-01 ")
 ;;2328
 ;;21,"24658-0203-05 ")
 ;;2329
 ;;21,"24658-0240-10 ")
 ;;1551
 ;;21,"24658-0240-90 ")
 ;;1552
 ;;21,"24658-0241-10 ")
 ;;1553
 ;;21,"24658-0241-30 ")
 ;;1554
 ;;21,"24658-0241-45 ")
 ;;1555
 ;;21,"24658-0241-90 ")
 ;;1556
 ;;21,"24658-0242-10 ")
 ;;1557
 ;;21,"24658-0242-15 ")
 ;;1558
 ;;21,"24658-0242-18 ")
 ;;1559
 ;;21,"24658-0242-30 ")
 ;;1560
 ;;21,"24658-0242-45 ")
 ;;1561
 ;;21,"24658-0242-90 ")
 ;;1562
 ;;21,"24658-0243-10 ")
 ;;1563
 ;;21,"24658-0243-15 ")
 ;;1564
 ;;21,"24658-0243-18 ")
 ;;1565
 ;;21,"24658-0243-30 ")
 ;;1566
 ;;21,"24658-0243-45 ")
 ;;1567
 ;;21,"24658-0243-90 ")
 ;;1568
 ;;21,"24658-0244-01 ")
 ;;1569
 ;;21,"24658-0244-10 ")
 ;;1570
 ;;21,"24658-0245-10 ")
 ;;1571
 ;;21,"24658-0245-15 ")
 ;;1572
 ;;21,"24658-0245-18 ")
 ;;1573
 ;;21,"24658-0245-30 ")
 ;;1574
 ;;21,"24658-0245-45 ")
 ;;1575
 ;;21,"24658-0245-60 ")
 ;;1576
 ;;21,"24658-0245-90 ")
 ;;1577
 ;;21,"31722-0271-01 ")
 ;;2330
 ;;21,"31722-0272-01 ")
 ;;2331
 ;;21,"31722-0272-10 ")
 ;;2332
 ;;21,"31722-0273-01 ")
 ;;2333
 ;;21,"31722-0273-10 ")
 ;;2334
 ;;21,"31722-0274-01 ")
 ;;2335
 ;;21,"31722-0274-10 ")
 ;;2336
 ;;21,"33358-0047-30 ")
 ;;330
 ;;21,"33358-0048-30 ")
 ;;204
 ;;21,"33358-0049-30 ")
 ;;205
 ;;21,"33358-0050-30 ")
 ;;331
 ;;21,"33358-0127-30 ")
 ;;754
 ;;21,"33358-0211-30 ")
 ;;1578
 ;;21,"33358-0212-30 ")
 ;;1579
 ;;21,"33358-0213-30 ")
 ;;1580
 ;;21,"33358-0214-30 ")
 ;;1212
 ;;21,"33358-0214-60 ")
 ;;1213
 ;;21,"33358-0222-00 ")
 ;;2068
 ;;21,"33458-0211-30 ")
 ;;1581
 ;;21,"35356-0541-30 ")
 ;;755
 ;;21,"43063-0007-01 ")
 ;;1582
 ;;21,"43063-0032-01 ")
 ;;1583
 ;;21,"43063-0065-30 ")
 ;;1214
 ;;21,"43063-0065-90 ")
 ;;1215
 ;;21,"43063-0118-30 ")
 ;;1216
 ;;21,"43063-0118-90 ")
 ;;1217
 ;;21,"43063-0130-90 ")
 ;;1218
 ;;21,"43063-0131-30 ")
 ;;206
 ;;21,"43063-0132-30 ")
 ;;207
 ;;21,"43063-0138-90 ")
 ;;1584
 ;;21,"43063-0146-30 ")
 ;;476
 ;;21,"43063-0171-14 ")
 ;;131
 ;;21,"43063-0232-30 ")
 ;;132
 ;;21,"43063-0232-60 ")
 ;;133
 ;;21,"43063-0233-60 ")
 ;;134
 ;;21,"43063-0234-60 ")
 ;;135
 ;;21,"43353-0350-30 ")
 ;;1585
 ;;21,"43353-0365-15 ")
 ;;1586
 ;;21,"43353-0411-60 ")
 ;;1587
 ;;21,"43353-0488-45 ")
 ;;1588
 ;;21,"49158-0501-01 ")
 ;;756
 ;;21,"49158-0502-01 ")
 ;;757
 ;;21,"49158-0503-01 ")
 ;;758
 ;;21,"49884-0556-01 ")
 ;;1589
 ;;21,"49884-0556-10 ")
 ;;1590
 ;;21,"49884-0557-01 ")
 ;;1591
 ;;21,"49884-0557-10 ")
 ;;1592
 ;;21,"49884-0558-01 ")
 ;;1593
 ;;21,"49884-0558-10 ")
 ;;1594
 ;;21,"49884-0559-01 ")
 ;;1595
 ;;21,"49884-0559-10 ")
 ;;1596
 ;;21,"49884-0560-01 ")
 ;;1597
 ;;21,"49884-0560-10 ")
 ;;1598
 ;;21,"49884-0591-01 ")
 ;;759
 ;;21,"49884-0591-10 ")
 ;;760
 ;;21,"49884-0592-01 ")
 ;;761
 ;;21,"49884-0592-10 ")
 ;;762
 ;;21,"49884-0593-01 ")
 ;;763
 ;;21,"49884-0593-10 ")
 ;;764
 ;;21,"49884-0594-01 ")
 ;;765
 ;;21,"49884-0594-10 ")
 ;;766
 ;;21,"49884-0619-01 ")
 ;;477
 ;;21,"49884-0620-01 ")
 ;;478
 ;;21,"49884-0620-10 ")
 ;;479
 ;;21,"49884-0622-01 ")
 ;;480
 ;;21,"49884-0635-01 ")
 ;;1599
 ;;21,"49884-0635-10 ")
 ;;1600
 ;;21,"49884-0686-01 ")
 ;;1023
 ;;21,"49884-0687-01 ")
 ;;1024
 ;;21,"49884-0793-01 ")
 ;;375
 ;;21,"49884-0793-74 ")
 ;;376
 ;;21,"49884-0794-01 ")
 ;;377
 ;;21,"49884-0794-10 ")
 ;;378
 ;;21,"49884-0794-74 ")
 ;;379
 ;;21,"49884-0795-01 ")
 ;;380
 ;;21,"49884-0795-10 ")
 ;;381
 ;;21,"49884-0795-74 ")
 ;;382
 ;;21,"49884-0796-01 ")
 ;;383
 ;;21,"49884-0815-01 ")
 ;;401
 ;;21,"49884-0816-01 ")
 ;;403
 ;;21,"49884-0817-01 ")
 ;;404
 ;;21,"49884-0818-01 ")
 ;;405
 ;;21,"49884-0861-01 ")
 ;;332
 ;;21,"49884-0862-01 ")
 ;;333
 ;;21,"49884-0863-01 ")
 ;;334
 ;;21,"49884-0864-01 ")
 ;;335
 ;;21,"49884-0990-09 ")
 ;;2239
 ;;21,"49884-0991-09 ")
 ;;2240
 ;;21,"49884-0992-09 ")
 ;;2241
 ;;21,"49884-0993-09 ")
 ;;2242
 ;;21,"49999-0105-00 ")
 ;;481
 ;;21,"49999-0105-10 ")
 ;;482
 ;;21,"49999-0105-30 ")
 ;;483
 ;;21,"49999-0105-60 ")
 ;;484
 ;;21,"49999-0182-10 ")
 ;;1601
 ;;21,"49999-0182-30 ")
 ;;1602
 ;;21,"49999-0182-60 ")
 ;;1603
 ;;21,"49999-0183-10 ")
 ;;1604
 ;;21,"49999-0183-30 ")
 ;;1605
 ;;21,"49999-0183-60 ")
 ;;1606
 ;;21,"49999-0239-00 ")
 ;;767
 ;;21,"49999-0239-30 ")
 ;;768
 ;;21,"49999-0239-60 ")
 ;;769
 ;;21,"49999-0240-00 ")
 ;;770
 ;;21,"49999-0240-30 ")
 ;;771
 ;;21,"49999-0287-30 ")
 ;;2006
 ;;21,"49999-0294-30 ")
 ;;2111
 ;;21,"49999-0295-00 ")
 ;;1607
 ;;21,"49999-0295-10 ")
 ;;1608
 ;;21,"49999-0295-30 ")
 ;;1609
 ;;21,"49999-0321-00 ")
 ;;1219
 ;;21,"49999-0321-30 ")
 ;;1220
 ;;21,"49999-0321-60 ")
 ;;1221
 ;;21,"49999-0345-00 ")
 ;;772
 ;;21,"49999-0345-30 ")
 ;;773
 ;;21,"49999-0469-10 ")
 ;;1610
 ;;21,"49999-0469-30 ")
 ;;1611
 ;;21,"49999-0511-30 ")
 ;;485
 ;;21,"49999-0511-60 ")
 ;;486
 ;;21,"49999-0759-30 ")
 ;;208
 ;;21,"49999-0761-00 ")
 ;;1222
 ;;21,"49999-0761-30 ")
 ;;1223
 ;;21,"49999-0823-00 ")
 ;;1025
 ;;21,"49999-0870-00 ")
 ;;1612
 ;;21,"49999-0871-30 ")
 ;;78
 ;;21,"49999-0871-90 ")
 ;;79
 ;;21,"49999-0924-00 ")
 ;;1224
 ;;21,"49999-0924-10 ")
 ;;1225
 ;;21,"49999-0924-30 ")
 ;;1226
 ;;21,"49999-0924-60 ")
 ;;1227
 ;;21,"49999-0934-30 ")
 ;;80
 ;;21,"49999-0946-30 ")
 ;;2069
 ;;21,"49999-0947-30 ")
 ;;2070
 ;;21,"49999-0948-30 ")
 ;;2071
 ;;21,"51079-0145-01 ")
 ;;209
 ;;21,"51079-0145-20 ")
 ;;210
 ;;21,"51079-0146-01 ")
 ;;211
 ;;21,"51079-0146-20 ")
 ;;212
 ;;21,"51079-0256-40 ")
 ;;1613
 ;;21,"51079-0261-40 ")
 ;;1614
 ;;21,"51079-0697-40 ")
 ;;1228
 ;;21,"51079-0698-40 ")
 ;;1229
 ;;21,"51079-0699-40 ")
 ;;1230
 ;;21,"51079-0863-01 ")
 ;;487
 ;;21,"51079-0863-20 ")
 ;;488
 ;;21,"51079-0864-01 ")
 ;;489
 ;;21,"51079-0864-20 ")
 ;;490
 ;;21,"51079-0950-01 ")
 ;;774
 ;;21,"51079-0950-20 ")
 ;;775
 ;;21,"51079-0951-01 ")
 ;;776
 ;;21,"51079-0951-20 ")
 ;;777
 ;;21,"51079-0952-01 ")
 ;;778
 ;;21,"51079-0952-20 ")
 ;;779
 ;;21,"51079-0953-01 ")
 ;;780
 ;;21,"51079-0953-20 ")
 ;;781
