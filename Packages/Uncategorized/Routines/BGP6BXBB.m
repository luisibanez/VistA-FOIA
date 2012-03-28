BGP6BXBB ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON AUG 21, 2005 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;;BGP6;;AUG 21, 2005
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"58016-0529-30 ")
 ;;395
 ;;21,"58016-0531-00 ")
 ;;396
 ;;21,"58016-0531-15 ")
 ;;397
 ;;21,"58016-0531-30 ")
 ;;398
 ;;21,"58016-0532-00 ")
 ;;399
 ;;21,"58016-0532-30 ")
 ;;400
 ;;21,"58016-0582-00 ")
 ;;401
 ;;21,"58016-0582-15 ")
 ;;402
 ;;21,"58016-0582-20 ")
 ;;403
 ;;21,"58016-0582-30 ")
 ;;404
 ;;21,"58016-0582-60 ")
 ;;405
 ;;21,"58016-0771-00 ")
 ;;406
 ;;21,"58016-0771-12 ")
 ;;407
 ;;21,"58016-0771-15 ")
 ;;408
 ;;21,"58016-0771-20 ")
 ;;409
 ;;21,"58016-0771-30 ")
 ;;410
 ;;21,"58019-0532-15 ")
 ;;411
 ;;21,"59591-0767-10 ")
 ;;412
 ;;21,"59591-0768-03 ")
 ;;413
 ;;21,"59591-0768-10 ")
 ;;414
 ;;21,"59772-2461-01 ")
 ;;415
 ;;21,"59772-2462-01 ")
 ;;416
 ;;21,"59772-2462-03 ")
 ;;417
 ;;21,"59772-2464-01 ")
 ;;418
 ;;21,"59772-2465-01 ")
 ;;419
 ;;21,"59930-1602-01 ")
 ;;420
 ;;21,"59930-1602-02 ")
 ;;421
 ;;21,"59930-1653-01 ")
 ;;422
 ;;21,"59930-1653-02 ")
 ;;423
 ;;21,"60429-0025-30 ")
 ;;424
 ;;21,"60429-0025-90 ")
 ;;425
 ;;21,"60429-0026-30 ")
 ;;426
 ;;21,"60429-0126-30 ")
 ;;427
 ;;21,"60429-0126-60 ")
 ;;428
 ;;21,"60429-0127-30 ")
 ;;429
 ;;21,"60505-0159-00 ")
 ;;430
 ;;21,"60505-0222-01 ")
 ;;431
 ;;21,"60505-0224-01 ")
 ;;432
 ;;21,"60505-0551-03 ")
 ;;433
 ;;21,"60505-0552-03 ")
 ;;434
 ;;21,"60505-0553-01 ")
 ;;435
 ;;21,"60758-0801-05 ")
 ;;436
 ;;21,"60758-0801-10 ")
 ;;437
 ;;21,"60758-0802-10 ")
 ;;438
 ;;21,"60976-0347-44 ")
 ;;439
 ;;21,"60976-0348-43 ")
 ;;440
 ;;21,"61314-0224-05 ")
 ;;441
 ;;21,"61314-0226-05 ")
 ;;442
 ;;21,"61314-0226-10 ")
 ;;443
 ;;21,"61314-0227-05 ")
 ;;444
 ;;21,"61314-0227-10 ")
 ;;445
 ;;21,"61314-0238-05 ")
 ;;446
 ;;21,"61314-0238-10 ")
 ;;447
 ;;21,"61392-0018-30 ")
 ;;448
 ;;21,"61392-0018-31 ")
 ;;449
 ;;21,"61392-0018-32 ")
 ;;450
 ;;21,"61392-0018-39 ")
 ;;451
 ;;21,"61392-0018-45 ")
 ;;452
 ;;21,"61392-0018-51 ")
 ;;453
 ;;21,"61392-0018-54 ")
 ;;454
 ;;21,"61392-0018-56 ")
 ;;455
 ;;21,"61392-0018-60 ")
 ;;456
 ;;21,"61392-0018-90 ")
 ;;457
 ;;21,"61392-0018-91 ")
 ;;458
 ;;21,"61392-0069-31 ")
 ;;459
 ;;21,"61392-0069-32 ")
 ;;460
 ;;21,"61392-0069-39 ")
 ;;461
 ;;21,"61392-0069-45 ")
 ;;462
 ;;21,"61392-0069-51 ")
 ;;463
 ;;21,"61392-0069-54 ")
 ;;464
 ;;21,"61392-0069-60 ")
 ;;465
 ;;21,"61392-0069-90 ")
 ;;466
 ;;21,"61392-0069-91 ")
 ;;467
 ;;21,"61392-0280-30 ")
 ;;468
 ;;21,"61392-0280-31 ")
 ;;469
 ;;21,"61392-0280-32 ")
 ;;470
 ;;21,"61392-0280-39 ")
 ;;471
 ;;21,"61392-0280-45 ")
 ;;472
 ;;21,"61392-0280-51 ")
 ;;473
 ;;21,"61392-0280-54 ")
 ;;474
 ;;21,"61392-0280-56 ")
 ;;475
 ;;21,"61392-0280-60 ")
 ;;476
 ;;21,"61392-0280-90 ")
 ;;477
 ;;21,"61392-0280-91 ")
 ;;478
 ;;21,"61392-0286-31 ")
 ;;479
 ;;21,"61392-0286-32 ")
 ;;480
 ;;21,"61392-0286-39 ")
 ;;481
 ;;21,"61392-0286-45 ")
 ;;482
 ;;21,"61392-0286-51 ")
 ;;483
 ;;21,"61392-0286-54 ")
 ;;484
 ;;21,"61392-0286-56 ")
 ;;485
 ;;21,"61392-0286-60 ")
 ;;486
 ;;21,"61392-0286-90 ")
 ;;487
 ;;21,"61392-0286-91 ")
 ;;488
 ;;21,"61392-0392-30 ")
 ;;489
 ;;21,"61392-0392-31 ")
 ;;490
 ;;21,"61392-0392-32 ")
 ;;491
 ;;21,"61392-0392-39 ")
 ;;492
 ;;21,"61392-0392-45 ")
 ;;493
 ;;21,"61392-0392-51 ")
 ;;494
 ;;21,"61392-0392-54 ")
 ;;495
 ;;21,"61392-0392-56 ")
 ;;496
 ;;21,"61392-0392-60 ")
 ;;497
 ;;21,"61392-0392-90 ")
 ;;498
 ;;21,"61392-0392-91 ")
 ;;499
 ;;21,"61392-0420-30 ")
 ;;500
 ;;21,"61392-0420-31 ")
 ;;501
 ;;21,"61392-0420-32 ")
 ;;502
 ;;21,"61392-0420-34 ")
 ;;503
 ;;21,"61392-0420-39 ")
 ;;504
 ;;21,"61392-0420-45 ")
 ;;505
 ;;21,"61392-0420-51 ")
 ;;506
 ;;21,"61392-0420-54 ")
 ;;507
 ;;21,"61392-0420-56 ")
 ;;508
 ;;21,"61392-0420-60 ")
 ;;509
 ;;21,"61392-0420-90 ")
 ;;510
 ;;21,"61392-0420-91 ")
 ;;511
 ;;21,"61392-0423-30 ")
 ;;512
 ;;21,"61392-0423-31 ")
 ;;513
 ;;21,"61392-0423-32 ")
 ;;514
 ;;21,"61392-0423-34 ")
 ;;515
 ;;21,"61392-0423-39 ")
 ;;516
 ;;21,"61392-0423-45 ")
 ;;517
 ;;21,"61392-0423-51 ")
 ;;518
 ;;21,"61392-0423-54 ")
 ;;519
 ;;21,"61392-0423-56 ")
 ;;520
 ;;21,"61392-0423-60 ")
 ;;521
 ;;21,"61392-0423-90 ")
 ;;522
 ;;21,"61392-0423-91 ")
 ;;523
 ;;21,"61392-0427-30 ")
 ;;524
 ;;21,"61392-0427-31 ")
 ;;525
 ;;21,"61392-0427-32 ")
 ;;526
 ;;21,"61392-0427-39 ")
 ;;527
 ;;21,"61392-0427-45 ")
 ;;528
 ;;21,"61392-0427-51 ")
 ;;529
 ;;21,"61392-0427-54 ")
 ;;530
 ;;21,"61392-0427-56 ")
 ;;531
 ;;21,"61392-0427-60 ")
 ;;532
 ;;21,"61392-0427-90 ")
 ;;533
 ;;21,"61392-0427-91 ")
 ;;534
 ;;21,"61392-0430-30 ")
 ;;535
 ;;21,"61392-0430-31 ")
 ;;536
 ;;21,"61392-0430-32 ")
 ;;537
 ;;21,"61392-0430-39 ")
 ;;538
 ;;21,"61392-0430-45 ")
 ;;539
 ;;21,"61392-0430-51 ")
 ;;540
 ;;21,"61392-0430-54 ")
 ;;541
 ;;21,"61392-0430-56 ")
 ;;542
 ;;21,"61392-0430-60 ")
 ;;543
 ;;21,"61392-0430-90 ")
 ;;544
 ;;21,"61392-0430-91 ")
 ;;545
 ;;21,"61392-0543-30 ")
 ;;546
 ;;21,"61392-0543-31 ")
 ;;547
 ;;21,"61392-0543-32 ")
 ;;548
 ;;21,"61392-0543-39 ")
 ;;549
 ;;21,"61392-0543-45 ")
 ;;550
 ;;21,"61392-0543-51 ")
 ;;551
 ;;21,"61392-0543-54 ")
 ;;552
 ;;21,"61392-0543-56 ")
 ;;553
 ;;21,"61392-0543-60 ")
 ;;554
 ;;21,"61392-0543-90 ")
 ;;555
 ;;21,"61392-0543-91 ")
 ;;556
 ;;21,"61392-0546-30 ")
 ;;557
 ;;21,"61392-0546-31 ")
 ;;558
 ;;21,"61392-0546-32 ")
 ;;559
 ;;21,"61392-0546-39 ")
 ;;560
 ;;21,"61392-0546-45 ")
 ;;561
 ;;21,"61392-0546-51 ")
 ;;562
 ;;21,"61392-0546-54 ")
 ;;563
 ;;21,"61392-0546-56 ")
 ;;564
 ;;21,"61392-0546-60 ")
 ;;565
 ;;21,"61392-0546-90 ")
 ;;566
 ;;21,"61392-0546-91 ")
 ;;567
 ;;21,"61570-0200-01 ")
 ;;568
 ;;21,"61570-0201-01 ")
 ;;569
 ;;21,"61570-0202-01 ")
 ;;570
 ;;21,"61570-0202-10 ")
 ;;571
 ;;21,"61570-0203-01 ")
 ;;572
 ;;21,"61570-0204-01 ")
 ;;573
 ;;21,"63739-0027-01 ")
 ;;574
 ;;21,"63739-0027-03 ")
 ;;575
 ;;21,"63739-0028-01 ")
 ;;576
 ;;21,"63739-0028-03 ")
 ;;577
 ;;21,"63739-0173-01 ")
 ;;578
 ;;21,"63739-0173-03 ")
 ;;579
 ;;21,"63739-0174-01 ")
 ;;580
 ;;21,"63739-0174-03 ")
 ;;581
 ;;21,"63739-0179-03 ")
 ;;582
 ;;21,"65483-0339-50 ")
 ;;583
 ;;21,"65483-0391-10 ")
 ;;584
 ;;21,"65483-0391-11 ")
 ;;585
 ;;21,"65483-0391-50 ")
 ;;586
 ;;21,"65483-0392-10 ")
 ;;587
 ;;21,"65483-0392-22 ")
 ;;588
 ;;21,"65483-0392-50 ")
 ;;589
 ;;21,"65483-0393-10 ")
 ;;590
 ;;21,"65483-0393-33 ")
 ;;591
 ;;21,"66336-0719-30 ")
 ;;592
 ;;9002226,393,.01)
 ;;BGP CMS BETA BLOCKER NDC
 ;;9002226,393,.02)
 ;;@
 ;;9002226,393,.04)
 ;;n
 ;;9002226,393,.06)
 ;;@
 ;;9002226,393,.08)
 ;;@
 ;;9002226,393,.09)
 ;;@
 ;;9002226,393,.11)
 ;;@
 ;;9002226,393,.12)
 ;;@
 ;;9002226,393,.13)
 ;;1
 ;;9002226,393,.14)
 ;;@
 ;;9002226,393,.15)
 ;;@
 ;;9002226,393,.16)
 ;;@
 ;;9002226,393,.17)
 ;;@
 ;;9002226,393,3101)
 ;;@
 ;;9002226.02101,"393,00005-3816-38 ",.01)
 ;;00005-3816-38
 ;;9002226.02101,"393,00005-3816-38 ",.02)
 ;;00005-3816-38
 ;;9002226.02101,"393,00005-3817-38 ",.01)
 ;;00005-3817-38
 ;;9002226.02101,"393,00005-3817-38 ",.02)
 ;;00005-3817-38
 ;;9002226.02101,"393,00007-4139-20 ",.01)
 ;;00007-4139-20
 ;;9002226.02101,"393,00007-4139-20 ",.02)
 ;;00007-4139-20
 ;;9002226.02101,"393,00007-4140-20 ",.01)
 ;;00007-4140-20
 ;;9002226.02101,"393,00007-4140-20 ",.02)
 ;;00007-4140-20
 ;;9002226.02101,"393,00007-4141-20 ",.01)
 ;;00007-4141-20
 ;;9002226.02101,"393,00007-4141-20 ",.02)
 ;;00007-4141-20
 ;;9002226.02101,"393,00007-4142-20 ",.01)
 ;;00007-4142-20
 ;;9002226.02101,"393,00007-4142-20 ",.02)
 ;;00007-4142-20
 ;;9002226.02101,"393,00008-4177-01 ",.01)
 ;;00008-4177-01
 ;;9002226.02101,"393,00008-4177-01 ",.02)
 ;;00008-4177-01
 ;;9002226.02101,"393,00008-4179-01 ",.01)
 ;;00008-4179-01
 ;;9002226.02101,"393,00008-4179-01 ",.02)
 ;;00008-4179-01
 ;;9002226.02101,"393,00025-5101-31 ",.01)
 ;;00025-5101-31
 ;;9002226.02101,"393,00025-5101-31 ",.02)
 ;;00025-5101-31
 ;;9002226.02101,"393,00025-5201-31 ",.01)
 ;;00025-5201-31
 ;;9002226.02101,"393,00025-5201-31 ",.02)
 ;;00025-5201-31
 ;;9002226.02101,"393,00028-0051-01 ",.01)
 ;;00028-0051-01
 ;;9002226.02101,"393,00028-0051-01 ",.02)
 ;;00028-0051-01
 ;;9002226.02101,"393,00028-0051-10 ",.01)
 ;;00028-0051-10
 ;;9002226.02101,"393,00028-0051-10 ",.02)
 ;;00028-0051-10
 ;;9002226.02101,"393,00028-0071-01 ",.01)
 ;;00028-0071-01
 ;;9002226.02101,"393,00028-0071-01 ",.02)
 ;;00028-0071-01
 ;;9002226.02101,"393,00028-0071-10 ",.01)
 ;;00028-0071-10
 ;;9002226.02101,"393,00028-0071-10 ",.02)
 ;;00028-0071-10
 ;;9002226.02101,"393,00046-0421-81 ",.01)
 ;;00046-0421-81
 ;;9002226.02101,"393,00046-0421-81 ",.02)
 ;;00046-0421-81
 ;;9002226.02101,"393,00046-0422-81 ",.01)
 ;;00046-0422-81
 ;;9002226.02101,"393,00046-0422-81 ",.02)
 ;;00046-0422-81
 ;;9002226.02101,"393,00046-0424-81 ",.01)
 ;;00046-0424-81
 ;;9002226.02101,"393,00046-0424-81 ",.02)
 ;;00046-0424-81
 ;;9002226.02101,"393,00046-0426-81 ",.01)
 ;;00046-0426-81
 ;;9002226.02101,"393,00046-0426-81 ",.02)
 ;;00046-0426-81
 ;;9002226.02101,"393,00046-0470-81 ",.01)
 ;;00046-0470-81
 ;;9002226.02101,"393,00046-0470-81 ",.02)
 ;;00046-0470-81
 ;;9002226.02101,"393,00046-0473-81 ",.01)
 ;;00046-0473-81
 ;;9002226.02101,"393,00046-0473-81 ",.02)
 ;;00046-0473-81
 ;;9002226.02101,"393,00046-0479-81 ",.01)
 ;;00046-0479-81
 ;;9002226.02101,"393,00046-0479-81 ",.02)
 ;;00046-0479-81
 ;;9002226.02101,"393,00046-0484-81 ",.01)
 ;;00046-0484-81
 ;;9002226.02101,"393,00046-0484-81 ",.02)
 ;;00046-0484-81
 ;;9002226.02101,"393,00074-1664-13 ",.01)
 ;;00074-1664-13
 ;;9002226.02101,"393,00074-1664-13 ",.02)
 ;;00074-1664-13
 ;;9002226.02101,"393,00083-0133-11 ",.01)
 ;;00083-0133-11
 ;;9002226.02101,"393,00083-0133-11 ",.02)
 ;;00083-0133-11
 ;;9002226.02101,"393,00085-0244-04 ",.01)
 ;;00085-0244-04
 ;;9002226.02101,"393,00085-0244-04 ",.02)
 ;;00085-0244-04
 ;;9002226.02101,"393,00085-0244-05 ",.01)
 ;;00085-0244-05
 ;;9002226.02101,"393,00085-0244-05 ",.02)
 ;;00085-0244-05
 ;;9002226.02101,"393,00085-0244-07 ",.01)
 ;;00085-0244-07
 ;;9002226.02101,"393,00085-0244-07 ",.02)
 ;;00085-0244-07
 ;;9002226.02101,"393,00085-0244-08 ",.01)
 ;;00085-0244-08
 ;;9002226.02101,"393,00085-0244-08 ",.02)
 ;;00085-0244-08
 ;;9002226.02101,"393,00085-0438-03 ",.01)
 ;;00085-0438-03
 ;;9002226.02101,"393,00085-0438-03 ",.02)
 ;;00085-0438-03
 ;;9002226.02101,"393,00085-0438-05 ",.01)
 ;;00085-0438-05
 ;;9002226.02101,"393,00085-0438-05 ",.02)
 ;;00085-0438-05
 ;;9002226.02101,"393,00085-0438-06 ",.01)
 ;;00085-0438-06
 ;;9002226.02101,"393,00085-0438-06 ",.02)
 ;;00085-0438-06
 ;;9002226.02101,"393,00085-0752-04 ",.01)
 ;;00085-0752-04
 ;;9002226.02101,"393,00085-0752-04 ",.02)
 ;;00085-0752-04
 ;;9002226.02101,"393,00085-0752-05 ",.01)
 ;;00085-0752-05
 ;;9002226.02101,"393,00085-0752-05 ",.02)
 ;;00085-0752-05
 ;;9002226.02101,"393,00085-0752-08 ",.01)
 ;;00085-0752-08
 ;;9002226.02101,"393,00085-0752-08 ",.02)
 ;;00085-0752-08
 ;;9002226.02101,"393,00091-4500-15 ",.01)
 ;;00091-4500-15
 ;;9002226.02101,"393,00091-4500-15 ",.02)
 ;;00091-4500-15
 ;;9002226.02101,"393,00093-0733-01 ",.01)
 ;;00093-0733-01
 ;;9002226.02101,"393,00093-0733-01 ",.02)
 ;;00093-0733-01
 ;;9002226.02101,"393,00093-0733-10 ",.01)
 ;;00093-0733-10
 ;;9002226.02101,"393,00093-0733-10 ",.02)
 ;;00093-0733-10
 ;;9002226.02101,"393,00093-0734-01 ",.01)
 ;;00093-0734-01
 ;;9002226.02101,"393,00093-0734-01 ",.02)
 ;;00093-0734-01
 ;;9002226.02101,"393,00093-0734-10 ",.01)
 ;;00093-0734-10
 ;;9002226.02101,"393,00093-0734-10 ",.02)
 ;;00093-0734-10
 ;;9002226.02101,"393,00093-0752-01 ",.01)
 ;;00093-0752-01
 ;;9002226.02101,"393,00093-0752-01 ",.02)
 ;;00093-0752-01
 ;;9002226.02101,"393,00093-0752-10 ",.01)
 ;;00093-0752-10
 ;;9002226.02101,"393,00093-0752-10 ",.02)
 ;;00093-0752-10
 ;;9002226.02101,"393,00093-0753-01 ",.01)
 ;;00093-0753-01
 ;;9002226.02101,"393,00093-0753-01 ",.02)
 ;;00093-0753-01
 ;;9002226.02101,"393,00093-1060-01 ",.01)
 ;;00093-1060-01
 ;;9002226.02101,"393,00093-1060-01 ",.02)
 ;;00093-1060-01
 ;;9002226.02101,"393,00093-1061-01 ",.01)
 ;;00093-1061-01
 ;;9002226.02101,"393,00093-1061-01 ",.02)
 ;;00093-1061-01
 ;;9002226.02101,"393,00093-1062-01 ",.01)
 ;;00093-1062-01
 ;;9002226.02101,"393,00093-1062-01 ",.02)
 ;;00093-1062-01
 ;;9002226.02101,"393,00093-1063-01 ",.01)
 ;;00093-1063-01
 ;;9002226.02101,"393,00093-1063-01 ",.02)
 ;;00093-1063-01
 ;;9002226.02101,"393,00093-5270-56 ",.01)
 ;;00093-5270-56
 ;;9002226.02101,"393,00093-5270-56 ",.02)
 ;;00093-5270-56
 ;;9002226.02101,"393,00115-2101-01 ",.01)
 ;;00115-2101-01
 ;;9002226.02101,"393,00115-2101-01 ",.02)
 ;;00115-2101-01
 ;;9002226.02101,"393,00115-2711-01 ",.01)
 ;;00115-2711-01
 ;;9002226.02101,"393,00115-2711-01 ",.02)
 ;;00115-2711-01
 ;;9002226.02101,"393,00115-2722-01 ",.01)
 ;;00115-2722-01
 ;;9002226.02101,"393,00115-2722-01 ",.02)
 ;;00115-2722-01
 ;;9002226.02101,"393,00115-2733-01 ",.01)
 ;;00115-2733-01
 ;;9002226.02101,"393,00115-2733-01 ",.02)
 ;;00115-2733-01
 ;;9002226.02101,"393,00115-2744-01 ",.01)
 ;;00115-2744-01
 ;;9002226.02101,"393,00115-2744-01 ",.02)
 ;;00115-2744-01
 ;;9002226.02101,"393,00158-0171-01 ",.01)
 ;;00158-0171-01
