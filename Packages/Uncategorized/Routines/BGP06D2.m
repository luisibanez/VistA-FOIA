BGP06D2 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"00536-0770-97 ")
 ;;394
 ;;21,"00536-1002-85 ")
 ;;395
 ;;21,"00536-1745-90 ")
 ;;396
 ;;21,"00536-1930-85 ")
 ;;397
 ;;21,"00536-3283-35 ")
 ;;398
 ;;21,"00536-3594-01 ")
 ;;399
 ;;21,"00536-3594-10 ")
 ;;400
 ;;21,"00536-3594-35 ")
 ;;401
 ;;21,"00536-3597-01 ")
 ;;402
 ;;21,"00536-3772-06 ")
 ;;403
 ;;21,"00555-0059-02 ")
 ;;404
 ;;21,"00555-0059-05 ")
 ;;405
 ;;21,"00555-0302-02 ")
 ;;406
 ;;21,"00555-0302-04 ")
 ;;407
 ;;21,"00555-0323-02 ")
 ;;408
 ;;21,"00555-0323-04 ")
 ;;409
 ;;21,"00555-0324-02 ")
 ;;410
 ;;21,"00573-0315-10 ")
 ;;411
 ;;21,"00573-0315-20 ")
 ;;412
 ;;21,"00573-3412-10 ")
 ;;413
 ;;21,"00573-3412-15 ")
 ;;414
 ;;21,"00591-0800-01 ")
 ;;415
 ;;21,"00591-0800-05 ")
 ;;416
 ;;21,"00591-0801-01 ")
 ;;417
 ;;21,"00591-0801-05 ")
 ;;418
 ;;21,"00591-1408-01 ")
 ;;419
 ;;21,"00591-3423-01 ")
 ;;420
 ;;21,"00591-3423-05 ")
 ;;421
 ;;21,"00591-3423-10 ")
 ;;422
 ;;21,"00591-4009-01 ")
 ;;423
 ;;21,"00591-5307-01 ")
 ;;424
 ;;21,"00591-5307-10 ")
 ;;425
 ;;21,"00591-5319-01 ")
 ;;426
 ;;21,"00591-5522-01 ")
 ;;427
 ;;21,"00591-5522-05 ")
 ;;428
 ;;21,"00591-5523-01 ")
 ;;429
 ;;21,"00591-5523-05 ")
 ;;430
 ;;21,"00591-5523-10 ")
 ;;431
 ;;21,"00591-5565-01 ")
 ;;432
 ;;21,"00591-5565-05 ")
 ;;433
 ;;21,"00591-5726-01 ")
 ;;434
 ;;21,"00591-5726-05 ")
 ;;435
 ;;21,"00603-0239-18 ")
 ;;436
 ;;21,"00603-0240-18 ")
 ;;437
 ;;21,"00603-0241-18 ")
 ;;438
 ;;21,"00603-0822-54 ")
 ;;439
 ;;21,"00603-0823-54 ")
 ;;440
 ;;21,"00603-0823-58 ")
 ;;441
 ;;21,"00603-0823-81 ")
 ;;442
 ;;21,"00603-0823-94 ")
 ;;443
 ;;21,"00603-0860-54 ")
 ;;444
 ;;21,"00603-1117-58 ")
 ;;445
 ;;21,"00603-1175-58 ")
 ;;446
 ;;21,"00603-1310-58 ")
 ;;447
 ;;21,"00603-1584-54 ")
 ;;448
 ;;21,"00603-1584-58 ")
 ;;449
 ;;21,"00603-1585-54 ")
 ;;450
 ;;21,"00603-1585-58 ")
 ;;451
 ;;21,"00603-1586-54 ")
 ;;452
 ;;21,"00603-1586-58 ")
 ;;453
 ;;21,"00603-1587-54 ")
 ;;454
 ;;21,"00603-1587-58 ")
 ;;455
 ;;21,"00603-1588-54 ")
 ;;456
 ;;21,"00603-1588-58 ")
 ;;457
 ;;21,"00603-3198-21 ")
 ;;458
 ;;21,"00603-3199-21 ")
 ;;459
 ;;21,"00603-3337-21 ")
 ;;460
 ;;21,"00603-3337-32 ")
 ;;461
 ;;21,"00603-3338-21 ")
 ;;462
 ;;21,"00603-3338-32 ")
 ;;463
 ;;21,"00603-3339-21 ")
 ;;464
 ;;21,"00603-3339-32 ")
 ;;465
 ;;21,"00603-3340-21 ")
 ;;466
 ;;21,"00603-3340-32 ")
 ;;467
 ;;21,"00603-3967-21 ")
 ;;468
 ;;21,"00603-3967-28 ")
 ;;469
 ;;21,"00603-3967-32 ")
 ;;470
 ;;21,"00603-3968-21 ")
 ;;471
 ;;21,"00603-3968-28 ")
 ;;472
 ;;21,"00603-3968-32 ")
 ;;473
 ;;21,"00603-3969-21 ")
 ;;474
 ;;21,"00603-3969-28 ")
 ;;475
 ;;21,"00603-3994-21 ")
 ;;476
 ;;21,"00603-3994-28 ")
 ;;477
 ;;21,"00603-3995-21 ")
 ;;478
 ;;21,"00603-5437-21 ")
 ;;479
 ;;21,"00603-5438-21 ")
 ;;480
 ;;21,"00603-5438-32 ")
 ;;481
 ;;21,"00603-5439-21 ")
 ;;482
 ;;21,"00615-0331-53 ")
 ;;483
 ;;21,"00615-0331-63 ")
 ;;484
 ;;21,"00615-0332-13 ")
 ;;485
 ;;21,"00615-0332-63 ")
 ;;486
 ;;21,"00615-0368-01 ")
 ;;487
 ;;21,"00615-0368-10 ")
 ;;488
 ;;21,"00615-0368-32 ")
 ;;489
 ;;21,"00615-0369-01 ")
 ;;490
 ;;21,"00615-0369-10 ")
 ;;491
 ;;21,"00615-0369-32 ")
 ;;492
 ;;21,"00615-0369-53 ")
 ;;493
 ;;21,"00615-0369-63 ")
 ;;494
 ;;21,"00615-1525-13 ")
 ;;495
 ;;21,"00615-1526-43 ")
 ;;496
 ;;21,"00615-1526-53 ")
 ;;497
 ;;21,"00615-1526-63 ")
 ;;498
 ;;21,"00615-1536-13 ")
 ;;499
 ;;21,"00677-0597-01 ")
 ;;500
 ;;21,"00677-0604-01 ")
 ;;501
 ;;21,"00677-0604-05 ")
 ;;502
 ;;21,"00677-0604-10 ")
 ;;503
 ;;21,"00677-0605-01 ")
 ;;504
 ;;21,"00677-0605-05 ")
 ;;505
 ;;21,"00677-0605-10 ")
 ;;506
 ;;21,"00677-0606-01 ")
 ;;507
 ;;21,"00677-0606-05 ")
 ;;508
 ;;21,"00677-0606-10 ")
 ;;509
 ;;21,"00677-1827-33 ")
 ;;510
 ;;21,"00677-1828-33 ")
 ;;511
 ;;21,"00677-1856-01 ")
 ;;512
 ;;21,"00677-1856-10 ")
 ;;513
 ;;21,"00677-1857-01 ")
 ;;514
 ;;21,"00677-1857-10 ")
 ;;515
 ;;21,"00677-1914-41 ")
 ;;516
 ;;21,"00677-1956-41 ")
 ;;517
 ;;21,"00677-1957-06 ")
 ;;518
 ;;21,"00677-1958-06 ")
 ;;519
 ;;21,"00677-1959-41 ")
 ;;520
 ;;21,"00677-1960-41 ")
 ;;521
 ;;21,"00677-1961-06 ")
 ;;522
 ;;21,"00781-1125-01 ")
 ;;523
 ;;21,"00781-1830-01 ")
 ;;524
 ;;21,"00781-1832-01 ")
 ;;525
 ;;21,"00781-2256-01 ")
 ;;526
 ;;21,"00781-2458-13 ")
 ;;527
 ;;21,"00781-2498-13 ")
 ;;528
 ;;21,"00781-6575-04 ")
 ;;529
 ;;21,"00781-6575-16 ")
 ;;530
 ;;21,"00781-6575-28 ")
 ;;531
 ;;21,"00904-0123-09 ")
 ;;532
 ;;21,"00904-0123-16 ")
 ;;533
 ;;21,"00904-0357-40 ")
 ;;534
 ;;21,"00904-0357-60 ")
 ;;535
 ;;21,"00904-0358-40 ")
 ;;536
 ;;21,"00904-0358-60 ")
 ;;537
 ;;21,"00904-0359-40 ")
 ;;538
 ;;21,"00904-0359-60 ")
 ;;539
 ;;21,"00904-0624-16 ")
 ;;540
 ;;21,"00904-0624-28 ")
 ;;541
 ;;21,"00904-1145-61 ")
 ;;542
 ;;21,"00904-1145-70 ")
 ;;543
 ;;21,"00904-1146-16 ")
 ;;544
 ;;21,"00904-1146-28 ")
 ;;545
 ;;21,"00904-1228-00 ")
 ;;546
 ;;21,"00904-1228-20 ")
 ;;547
 ;;21,"00904-1508-00 ")
 ;;548
 ;;21,"00904-1508-16 ")
 ;;549
 ;;21,"00904-1508-20 ")
 ;;550
 ;;21,"00904-1508-28 ")
 ;;551
 ;;21,"00904-1516-00 ")
 ;;552
 ;;21,"00904-1516-16 ")
 ;;553
 ;;21,"00904-1516-28 ")
 ;;554
 ;;21,"00904-2035-24 ")
 ;;555
 ;;21,"00904-2035-59 ")
 ;;556
 ;;21,"00904-2056-61 ")
 ;;557
 ;;21,"00904-2329-60 ")
 ;;558
 ;;21,"00904-2329-80 ")
 ;;559
 ;;21,"00904-2330-60 ")
 ;;560
 ;;21,"00904-5174-16 ")
 ;;561
 ;;21,"00904-5306-60 ")
 ;;562
 ;;21,"00904-5306-61 ")
 ;;563
 ;;21,"00904-5306-80 ")
 ;;564
 ;;21,"00904-5307-60 ")
 ;;565
 ;;21,"00904-5307-80 ")
 ;;566
 ;;21,"00904-5551-24 ")
 ;;567
 ;;21,"00904-5551-59 ")
 ;;568
 ;;21,"00904-5840-61 ")
 ;;569
 ;;21,"00904-7616-51 ")
 ;;570
 ;;21,"00904-7651-51 ")
 ;;571
 ;;21,"00927-0221-24 ")
 ;;572
 ;;21,"00927-0616-34 ")
 ;;573
 ;;21,"01981-0003-23 ")
 ;;574
 ;;21,"01981-0003-25 ")
 ;;575
 ;;21,"01981-0003-26 ")
 ;;576
 ;;21,"01981-0076-34 ")
 ;;577
 ;;21,"01981-0076-43 ")
 ;;578
 ;;21,"10135-0119-99 ")
 ;;579
 ;;21,"10135-0149-01 ")
 ;;580
 ;;21,"10135-0149-10 ")
 ;;581
 ;;21,"10135-0149-24 ")
 ;;582
 ;;21,"10135-0149-61 ")
 ;;583
 ;;21,"10135-0151-01 ")
 ;;584
 ;;21,"10135-0151-10 ")
 ;;585
 ;;21,"10135-0151-13 ")
 ;;586
 ;;21,"10135-0151-24 ")
 ;;587
 ;;21,"10135-0151-50 ")
 ;;588
 ;;21,"10135-0151-52 ")
 ;;589
 ;;21,"10135-0151-57 ")
 ;;590
 ;;21,"10135-0156-01 ")
 ;;591
 ;;21,"10135-0156-10 ")
 ;;592
 ;;21,"10135-0156-13 ")
 ;;593
 ;;21,"10135-0166-13 ")
 ;;594
 ;;21,"10135-0352-01 ")
 ;;595
 ;;21,"10135-0352-13 ")
 ;;596
 ;;21,"10135-0352-50 ")
 ;;597
 ;;21,"10135-0352-55 ")
 ;;598
 ;;21,"10135-0352-57 ")
 ;;599
 ;;21,"10135-0410-55 ")
 ;;600
 ;;21,"10135-0418-29 ")
 ;;601
 ;;21,"10135-0495-01 ")
 ;;602
 ;;21,"10135-0495-10 ")
 ;;603
 ;;21,"10135-0496-01 ")
 ;;604
 ;;21,"10135-0514-01 ")
 ;;605
 ;;21,"10158-0043-02 ")
 ;;606
 ;;21,"10158-0043-04 ")
 ;;607
 ;;21,"10158-0043-06 ")
 ;;608
 ;;21,"10267-0835-01 ")
 ;;609
 ;;21,"10267-0835-04 ")
 ;;610
 ;;21,"10267-0836-01 ")
 ;;611
 ;;21,"10267-0836-04 ")
 ;;612
 ;;21,"10267-1311-01 ")
 ;;613
 ;;21,"10544-0328-30 ")
 ;;614
 ;;21,"10702-0002-01 ")
 ;;615
 ;;21,"10702-0003-01 ")
 ;;616
 ;;21,"10702-0003-10 ")
 ;;617
 ;;21,"10702-0004-01 ")
 ;;618
 ;;21,"10702-0010-01 ")
 ;;619
 ;;21,"10702-0010-10 ")
 ;;620
 ;;21,"10702-0010-50 ")
 ;;621
 ;;21,"10702-0011-01 ")
 ;;622
 ;;21,"10702-0011-10 ")
 ;;623
 ;;21,"10702-0011-50 ")
 ;;624
 ;;21,"10702-0012-01 ")
 ;;625
 ;;21,"10702-0012-10 ")
 ;;626
 ;;21,"10702-0012-50 ")
 ;;627
 ;;21,"10702-0052-16 ")
 ;;628
 ;;21,"10892-0112-65 ")
 ;;629
 ;;21,"10914-0931-06 ")
 ;;630
 ;;21,"10939-0564-01 ")
 ;;631
 ;;21,"10956-0601-24 ")
 ;;632
 ;;21,"10956-0601-48 ")
 ;;633
 ;;21,"10956-0607-24 ")
 ;;634
 ;;21,"10956-0607-48 ")
 ;;635
 ;;21,"10956-0610-24 ")
 ;;636
 ;;21,"10956-0610-48 ")
 ;;637
 ;;21,"10956-0623-04 ")
 ;;638
 ;;21,"10956-0750-24 ")
 ;;639
 ;;21,"10956-0750-48 ")
 ;;640
 ;;21,"12280-0068-24 ")
 ;;641
 ;;21,"12280-0068-30 ")
 ;;642
 ;;21,"12280-0114-04 ")
 ;;643
 ;;21,"12280-0185-00 ")
 ;;644
 ;;21,"12280-0197-00 ")
 ;;645
 ;;21,"12280-0205-04 ")
 ;;646
 ;;21,"12547-0170-21 ")
 ;;647
 ;;21,"12547-0170-31 ")
 ;;648
 ;;21,"12547-0170-33 ")
 ;;649
 ;;21,"12547-0170-50 ")
 ;;650
 ;;21,"12547-0170-55 ")
 ;;651
 ;;21,"12547-0171-36 ")
 ;;652
 ;;21,"12547-0171-37 ")
 ;;653
 ;;21,"12547-0172-38 ")
 ;;654
 ;;21,"12547-0175-85 ")
 ;;655
 ;;21,"12547-0175-86 ")
 ;;656
 ;;21,"12547-0175-88 ")
 ;;657
 ;;21,"12547-0227-33 ")
 ;;658
 ;;21,"12547-0227-34 ")
 ;;659
 ;;21,"12843-0148-20 ")
 ;;660
 ;;21,"12843-0148-21 ")
 ;;661
 ;;21,"12843-0165-21 ")
 ;;662
 ;;21,"12843-0165-23 ")
 ;;663
 ;;21,"16500-0010-20 ")
 ;;664
 ;;21,"16500-0010-22 ")
 ;;665
 ;;21,"16590-0078-20 ")
 ;;666
 ;;21,"16590-0079-20 ")
 ;;667
 ;;21,"16590-0122-20 ")
 ;;668
 ;;21,"16590-0122-30 ")
 ;;669
 ;;21,"16590-0122-40 ")
 ;;670
 ;;21,"16590-0122-60 ")
 ;;671
 ;;21,"16590-0122-90 ")
 ;;672
 ;;21,"16590-0191-10 ")
 ;;673
 ;;21,"16590-0191-15 ")
 ;;674
 ;;21,"16590-0191-20 ")
 ;;675
 ;;21,"16590-0191-30 ")
 ;;676
 ;;21,"16590-0191-60 ")
 ;;677
 ;;21,"16590-0191-90 ")
 ;;678
 ;;21,"16590-0192-04 ")
 ;;679
 ;;21,"16590-0357-09 ")
 ;;680
 ;;21,"16590-0357-12 ")
 ;;681
 ;;21,"16590-0357-20 ")
 ;;682
 ;;21,"16590-0357-30 ")
 ;;683
 ;;21,"16714-0081-04 ")
 ;;684
 ;;21,"16714-0081-05 ")
 ;;685
 ;;21,"16714-0082-04 ")
 ;;686
 ;;21,"16714-0082-05 ")
 ;;687
 ;;21,"16714-0082-06 ")
 ;;688
 ;;21,"16714-0083-04 ")
 ;;689
 ;;21,"16714-0083-05 ")
 ;;690
 ;;21,"17236-0516-01 ")
 ;;691
 ;;21,"17236-0516-10 ")
 ;;692
 ;;21,"17236-0518-01 ")
 ;;693
 ;;21,"17236-0518-10 ")
 ;;694
 ;;21,"17714-0020-01 ")
 ;;695
 ;;21,"17714-0020-10 ")
 ;;696
 ;;21,"17714-0021-01 ")
 ;;697
 ;;21,"17714-0021-10 ")
 ;;698
 ;;21,"17714-0042-01 ")
 ;;699
 ;;21,"18837-0043-30 ")
 ;;700
 ;;21,"18837-0070-30 ")
 ;;701
 ;;21,"18837-0127-10 ")
 ;;702
 ;;21,"18837-0127-30 ")
 ;;703
 ;;21,"18837-0127-60 ")
 ;;704
 ;;21,"18837-0127-90 ")
 ;;705
 ;;21,"19810-0001-56 ")
 ;;706
 ;;21,"19810-0001-82 ")
 ;;707
 ;;21,"19810-0001-83 ")
 ;;708
 ;;21,"19810-0002-40 ")
 ;;709
 ;;21,"19810-0003-22 ")
 ;;710
 ;;21,"19810-0003-23 ")
 ;;711
 ;;21,"19810-0003-26 ")
 ;;712
 ;;21,"19810-0018-01 ")
 ;;713
 ;;21,"19810-0018-02 ")
 ;;714
 ;;21,"19810-0018-03 ")
 ;;715
 ;;21,"19810-0018-04 ")
 ;;716
 ;;21,"19810-0032-02 ")
 ;;717
 ;;21,"19810-0032-03 ")
 ;;718
 ;;21,"19810-0032-06 ")
 ;;719
 ;;21,"19810-0070-67 ")
 ;;720
 ;;21,"19810-0070-68 ")
 ;;721
 ;;21,"20254-0207-06 ")
 ;;722
 ;;21,"20254-0207-10 ")
 ;;723
 ;;21,"20254-0208-06 ")
 ;;724
 ;;21,"20254-0208-10 ")
 ;;725
 ;;21,"21406-0490-50 ")
 ;;726
 ;;21,"21406-0491-30 ")
 ;;727
 ;;21,"21695-0208-30 ")
 ;;728
 ;;21,"21695-0208-60 ")
 ;;729
 ;;21,"21695-0208-90 ")
 ;;730
 ;;21,"21695-0304-30 ")
 ;;731
 ;;21,"21695-0304-90 ")
 ;;732
 ;;21,"21695-0336-04 ")
 ;;733
 ;;21,"21695-0356-60 ")
 ;;734
 ;;21,"21695-0453-10 ")
 ;;735
 ;;21,"21695-0453-15 ")
 ;;736
 ;;21,"21695-0453-20 ")
 ;;737
 ;;21,"21695-0453-25 ")
 ;;738
 ;;21,"23490-5455-01 ")
 ;;739
 ;;21,"23490-5457-00 ")
 ;;740
 ;;21,"23490-5457-01 ")
 ;;741
 ;;21,"23490-5457-02 ")
 ;;742
 ;;21,"23490-5457-03 ")
 ;;743
 ;;21,"23490-5457-04 ")
 ;;744
 ;;21,"23490-5457-05 ")
 ;;745
 ;;21,"23490-5459-01 ")
 ;;746
 ;;21,"23490-5459-02 ")
 ;;747
 ;;21,"23490-5459-03 ")
 ;;748
 ;;21,"23490-5459-04 ")
 ;;749
 ;;21,"23490-5727-01 ")
 ;;750
 ;;21,"23490-5727-02 ")
 ;;751
 ;;21,"23490-5728-01 ")
 ;;752
 ;;21,"23490-5729-01 ")
 ;;753
 ;;21,"23490-5729-02 ")
 ;;754
 ;;21,"23490-5729-03 ")
 ;;755
 ;;21,"23490-5729-04 ")
 ;;756
 ;;21,"23490-5729-05 ")
 ;;757
 ;;21,"23490-5729-06 ")
 ;;758
 ;;21,"23490-5731-00 ")
 ;;759
 ;;21,"23490-5731-01 ")
 ;;760
 ;;21,"23490-5733-01 ")
 ;;761
 ;;21,"23490-5733-02 ")
 ;;762
 ;;21,"23490-6178-01 ")
 ;;763
 ;;21,"23490-6178-02 ")
 ;;764
 ;;21,"23490-6183-01 ")
 ;;765
 ;;21,"23490-6183-02 ")
 ;;766
 ;;21,"23490-6183-03 ")
 ;;767
 ;;21,"23490-6183-04 ")
 ;;768
 ;;21,"23490-6183-06 ")
 ;;769
 ;;21,"23490-6183-07 ")
 ;;770
 ;;21,"23490-6183-08 ")
 ;;771
 ;;21,"23490-6187-01 ")
 ;;772
 ;;21,"23490-6188-01 ")
 ;;773
 ;;21,"23629-0029-01 ")
 ;;774
 ;;21,"23629-0030-01 ")
 ;;775
 ;;21,"23629-0031-01 ")
 ;;776
 ;;21,"23629-0032-01 ")
 ;;777
 ;;21,"23629-0033-01 ")
 ;;778
 ;;21,"23629-0290-01 ")
 ;;779
 ;;21,"23629-0300-01 ")
 ;;780
 ;;21,"23629-0310-01 ")
 ;;781
 ;;21,"23629-0320-01 ")
 ;;782
 ;;21,"23629-0330-01 ")
 ;;783
 ;;21,"24385-0379-26 ")
 ;;784
 ;;21,"24385-0437-71 ")
 ;;785
 ;;21,"24385-0462-62 ")
 ;;786
 ;;21,"24385-0462-78 ")
 ;;787
 ;;21,"24385-0479-62 ")
 ;;788
 ;;21,"24385-0479-78 ")
 ;;789
