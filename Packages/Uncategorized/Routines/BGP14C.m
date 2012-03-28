BGP14C ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;;BGP PQA STATIN NDC
 ;
 ; This routine loads Taxonomy BGP PQA STATIN NDC
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
 ;;21,"00002-4770-90 ")
 ;;547
 ;;21,"00002-4771-90 ")
 ;;548
 ;;21,"00002-4772-90 ")
 ;;549
 ;;21,"00003-5154-05 ")
 ;;550
 ;;21,"00003-5168-11 ")
 ;;48
 ;;21,"00003-5169-11 ")
 ;;45
 ;;21,"00003-5173-11 ")
 ;;49
 ;;21,"00003-5174-11 ")
 ;;46
 ;;21,"00003-5178-05 ")
 ;;601
 ;;21,"00003-5178-06 ")
 ;;602
 ;;21,"00003-5178-75 ")
 ;;603
 ;;21,"00003-5183-11 ")
 ;;50
 ;;21,"00003-5184-11 ")
 ;;47
 ;;21,"00003-5194-10 ")
 ;;680
 ;;21,"00003-5194-33 ")
 ;;681
 ;;21,"00003-5195-10 ")
 ;;768
 ;;21,"00003-5195-33 ")
 ;;769
 ;;21,"00006-0543-28 ")
 ;;1346
 ;;21,"00006-0543-31 ")
 ;;1347
 ;;21,"00006-0543-54 ")
 ;;1348
 ;;21,"00006-0543-61 ")
 ;;1349
 ;;21,"00006-0543-82 ")
 ;;1350
 ;;21,"00006-0726-28 ")
 ;;1278
 ;;21,"00006-0726-31 ")
 ;;1279
 ;;21,"00006-0726-54 ")
 ;;1280
 ;;21,"00006-0726-61 ")
 ;;1281
 ;;21,"00006-0726-82 ")
 ;;1282
 ;;21,"00006-0730-61 ")
 ;;247
 ;;21,"00006-0731-28 ")
 ;;321
 ;;21,"00006-0731-61 ")
 ;;322
 ;;21,"00006-0731-82 ")
 ;;323
 ;;21,"00006-0731-87 ")
 ;;324
 ;;21,"00006-0731-94 ")
 ;;325
 ;;21,"00006-0732-61 ")
 ;;432
 ;;21,"00006-0732-82 ")
 ;;433
 ;;21,"00006-0732-87 ")
 ;;434
 ;;21,"00006-0732-94 ")
 ;;435
 ;;21,"00006-0735-28 ")
 ;;865
 ;;21,"00006-0735-31 ")
 ;;866
 ;;21,"00006-0735-54 ")
 ;;867
 ;;21,"00006-0735-61 ")
 ;;868
 ;;21,"00006-0735-82 ")
 ;;869
 ;;21,"00006-0735-87 ")
 ;;870
 ;;21,"00006-0740-28 ")
 ;;978
 ;;21,"00006-0740-31 ")
 ;;979
 ;;21,"00006-0740-54 ")
 ;;980
 ;;21,"00006-0740-61 ")
 ;;981
 ;;21,"00006-0740-82 ")
 ;;982
 ;;21,"00006-0740-87 ")
 ;;983
 ;;21,"00006-0749-28 ")
 ;;1124
 ;;21,"00006-0749-31 ")
 ;;1125
 ;;21,"00006-0749-54 ")
 ;;1126
 ;;21,"00006-0749-61 ")
 ;;1127
 ;;21,"00006-0749-82 ")
 ;;1128
 ;;21,"00069-2150-30 ")
 ;;72
 ;;21,"00069-2160-30 ")
 ;;51
 ;;21,"00069-2170-30 ")
 ;;78
 ;;21,"00069-2180-30 ")
 ;;55
 ;;21,"00069-2190-30 ")
 ;;81
 ;;21,"00069-2250-30 ")
 ;;60
 ;;21,"00069-2260-30 ")
 ;;83
 ;;21,"00069-2270-30 ")
 ;;64
 ;;21,"00069-2960-30 ")
 ;;67
 ;;21,"00069-2970-30 ")
 ;;68
 ;;21,"00069-2980-30 ")
 ;;70
 ;;21,"00071-0155-23 ")
 ;;85
 ;;21,"00071-0155-34 ")
 ;;86
 ;;21,"00071-0155-40 ")
 ;;87
 ;;21,"00071-0156-23 ")
 ;;127
 ;;21,"00071-0156-40 ")
 ;;128
 ;;21,"00071-0156-94 ")
 ;;129
 ;;21,"00071-0157-23 ")
 ;;159
 ;;21,"00071-0157-40 ")
 ;;160
 ;;21,"00071-0157-73 ")
 ;;161
 ;;21,"00071-0157-88 ")
 ;;162
 ;;21,"00071-0158-23 ")
 ;;194
 ;;21,"00071-0158-73 ")
 ;;195
 ;;21,"00071-0158-88 ")
 ;;196
 ;;21,"00071-0158-92 ")
 ;;197
 ;;21,"00074-3005-90 ")
 ;;1464
 ;;21,"00074-3007-90 ")
 ;;1458
 ;;21,"00074-3010-90 ")
 ;;1461
 ;;21,"00074-3072-90 ")
 ;;1469
 ;;21,"00074-3312-90 ")
 ;;1479
 ;;21,"00074-3315-90 ")
 ;;1482
 ;;21,"00074-3316-90 ")
 ;;1475
 ;;21,"00074-3455-90 ")
 ;;1478
 ;;21,"00074-3457-90 ")
 ;;1473
 ;;21,"00074-3459-90 ")
 ;;1474
 ;;21,"00078-0176-05 ")
 ;;218
 ;;21,"00078-0176-15 ")
 ;;219
 ;;21,"00078-0234-05 ")
 ;;234
 ;;21,"00078-0234-15 ")
 ;;235
 ;;21,"00078-0354-05 ")
 ;;242
 ;;21,"00078-0354-15 ")
 ;;243
 ;;21,"00093-0576-06 ")
 ;;326
 ;;21,"00093-0576-10 ")
 ;;327
 ;;21,"00093-0576-19 ")
 ;;328
 ;;21,"00093-0576-93 ")
 ;;329
 ;;21,"00093-0771-10 ")
 ;;551
 ;;21,"00093-0771-98 ")
 ;;552
 ;;21,"00093-0926-06 ")
 ;;248
 ;;21,"00093-0926-10 ")
 ;;249
 ;;21,"00093-0926-19 ")
 ;;250
 ;;21,"00093-0926-93 ")
 ;;251
 ;;21,"00093-0928-06 ")
 ;;436
 ;;21,"00093-0928-10 ")
 ;;437
 ;;21,"00093-0928-19 ")
 ;;438
 ;;21,"00093-0928-93 ")
 ;;439
 ;;21,"00093-7152-19 ")
 ;;1283
 ;;21,"00093-7152-56 ")
 ;;1284
 ;;21,"00093-7152-93 ")
 ;;1285
 ;;21,"00093-7152-98 ")
 ;;1286
 ;;21,"00093-7153-10 ")
 ;;871
 ;;21,"00093-7153-19 ")
 ;;872
 ;;21,"00093-7153-56 ")
 ;;873
 ;;21,"00093-7153-93 ")
 ;;874
 ;;21,"00093-7153-98 ")
 ;;875
 ;;21,"00093-7154-10 ")
 ;;984
 ;;21,"00093-7154-19 ")
 ;;985
 ;;21,"00093-7154-56 ")
 ;;986
 ;;21,"00093-7154-93 ")
 ;;987
 ;;21,"00093-7154-98 ")
 ;;988
 ;;21,"00093-7155-10 ")
 ;;1129
 ;;21,"00093-7155-19 ")
 ;;1130
 ;;21,"00093-7155-56 ")
 ;;1131
 ;;21,"00093-7155-93 ")
 ;;1132
 ;;21,"00093-7155-98 ")
 ;;1133
 ;;21,"00093-7156-10 ")
 ;;1351
 ;;21,"00093-7156-56 ")
 ;;1352
 ;;21,"00093-7156-98 ")
 ;;1353
 ;;21,"00093-7201-10 ")
 ;;604
 ;;21,"00093-7201-98 ")
 ;;605
 ;;21,"00093-7202-10 ")
 ;;682
 ;;21,"00093-7202-98 ")
 ;;683
 ;;21,"00093-7270-10 ")
 ;;770
 ;;21,"00093-7270-98 ")
 ;;771
 ;;21,"00185-0070-01 ")
 ;;252
 ;;21,"00185-0070-05 ")
 ;;253
 ;;21,"00185-0070-10 ")
 ;;254
 ;;21,"00185-0070-60 ")
 ;;255
 ;;21,"00185-0072-01 ")
 ;;330
 ;;21,"00185-0072-10 ")
 ;;331
 ;;21,"00185-0072-60 ")
 ;;332
 ;;21,"00185-0074-01 ")
 ;;440
 ;;21,"00185-0074-10 ")
 ;;441
 ;;21,"00185-0074-60 ")
 ;;442
 ;;21,"00228-2633-06 ")
 ;;256
 ;;21,"00228-2633-50 ")
 ;;257
 ;;21,"00228-2634-06 ")
 ;;333
 ;;21,"00228-2634-50 ")
 ;;334
 ;;21,"00228-2635-06 ")
 ;;443
 ;;21,"00228-2635-50 ")
 ;;444
 ;;21,"00247-1129-30 ")
 ;;335
 ;;21,"00247-1129-60 ")
 ;;336
 ;;21,"00247-1130-30 ")
 ;;445
 ;;21,"00247-1130-60 ")
 ;;446
 ;;21,"00247-1139-30 ")
 ;;606
 ;;21,"00247-1139-60 ")
 ;;607
 ;;21,"00247-1140-30 ")
 ;;684
 ;;21,"00247-1140-60 ")
 ;;685
 ;;21,"00247-1152-30 ")
 ;;876
 ;;21,"00247-1152-60 ")
 ;;877
 ;;21,"00247-1153-30 ")
 ;;989
 ;;21,"00247-1153-60 ")
 ;;990
 ;;21,"00247-1276-30 ")
 ;;686
 ;;21,"00310-0751-39 ")
 ;;796
 ;;21,"00310-0751-90 ")
 ;;797
 ;;21,"00310-0752-39 ")
 ;;820
 ;;21,"00310-0752-90 ")
 ;;821
 ;;21,"00310-0754-30 ")
 ;;841
 ;;21,"00310-0755-90 ")
 ;;858
 ;;21,"00378-0552-77 ")
 ;;598
 ;;21,"00378-0553-77 ")
 ;;792
 ;;21,"00378-0554-77 ")
 ;;674
 ;;21,"00378-0557-77 ")
 ;;761
 ;;21,"00378-6510-91 ")
 ;;258
 ;;21,"00378-6520-05 ")
 ;;337
 ;;21,"00378-6520-91 ")
 ;;338
 ;;21,"00378-6540-05 ")
 ;;447
 ;;21,"00378-6540-91 ")
 ;;448
 ;;21,"00378-8210-10 ")
 ;;553
 ;;21,"00378-8210-77 ")
 ;;554
 ;;21,"00378-8220-10 ")
 ;;608
 ;;21,"00378-8220-77 ")
 ;;609
 ;;21,"00378-8240-10 ")
 ;;687
 ;;21,"00378-8240-77 ")
 ;;688
 ;;21,"00378-8280-05 ")
 ;;772
 ;;21,"00378-8280-77 ")
 ;;773
 ;;21,"00406-2065-03 ")
 ;;1287
 ;;21,"00406-2065-05 ")
 ;;1288
 ;;21,"00406-2065-10 ")
 ;;1289
 ;;21,"00406-2065-60 ")
 ;;1290
 ;;21,"00406-2065-90 ")
 ;;1291
 ;;21,"00406-2066-03 ")
 ;;878
 ;;21,"00406-2066-05 ")
 ;;879
 ;;21,"00406-2066-10 ")
 ;;880
 ;;21,"00406-2066-60 ")
 ;;881
 ;;21,"00406-2066-90 ")
 ;;882
 ;;21,"00406-2067-03 ")
 ;;991
 ;;21,"00406-2067-05 ")
 ;;992
 ;;21,"00406-2067-10 ")
 ;;993
 ;;21,"00406-2067-60 ")
 ;;994
 ;;21,"00406-2067-90 ")
 ;;995
 ;;21,"00406-2068-03 ")
 ;;1134
 ;;21,"00406-2068-05 ")
 ;;1135
 ;;21,"00406-2068-10 ")
 ;;1136
 ;;21,"00406-2068-60 ")
 ;;1137
 ;;21,"00406-2068-90 ")
 ;;1138
 ;;21,"00406-2069-03 ")
 ;;1354
 ;;21,"00406-2069-05 ")
 ;;1355
 ;;21,"00406-2069-10 ")
 ;;1356
 ;;21,"00406-2069-60 ")
 ;;1357
 ;;21,"00406-2069-90 ")
 ;;1358
 ;;21,"00440-7692-30 ")
 ;;259
 ;;21,"00440-7692-60 ")
 ;;260
 ;;21,"00440-7693-30 ")
 ;;339
 ;;21,"00440-7693-60 ")
 ;;340
 ;;21,"00440-7694-30 ")
 ;;449
 ;;21,"00440-7694-60 ")
 ;;450
 ;;21,"00440-8155-30 ")
 ;;555
 ;;21,"00440-8155-60 ")
 ;;556
 ;;21,"00440-8155-90 ")
 ;;557
 ;;21,"00440-8156-30 ")
 ;;610
 ;;21,"00440-8156-60 ")
 ;;611
 ;;21,"00440-8156-90 ")
 ;;612
 ;;21,"00440-8157-30 ")
 ;;689
 ;;21,"00440-8157-60 ")
 ;;690
 ;;21,"00440-8157-90 ")
 ;;691
 ;;21,"00440-8158-30 ")
 ;;774
 ;;21,"00440-8158-60 ")
 ;;775
 ;;21,"00440-8158-90 ")
 ;;776
 ;;21,"00440-8320-30 ")
 ;;1292
 ;;21,"00440-8320-90 ")
 ;;1293
 ;;21,"00440-8321-30 ")
 ;;883
 ;;21,"00440-8321-90 ")
 ;;884
 ;;21,"00440-8322-30 ")
 ;;996
 ;;21,"00440-8322-90 ")
 ;;997
 ;;21,"00440-8323-30 ")
 ;;1139
 ;;21,"00440-8323-90 ")
 ;;1140
 ;;21,"00440-8324-30 ")
 ;;1359
 ;;21,"00440-8324-90 ")
 ;;1360
 ;;21,"00591-0013-10 ")
 ;;558
 ;;21,"00591-0013-19 ")
 ;;559
 ;;21,"00591-0014-10 ")
 ;;613
 ;;21,"00591-0014-19 ")
 ;;614
 ;;21,"00591-0016-10 ")
 ;;692
 ;;21,"00591-0016-19 ")
 ;;693
 ;;21,"00591-0019-05 ")
 ;;777
 ;;21,"00591-0019-19 ")
 ;;778
 ;;21,"00781-1210-10 ")
 ;;341
 ;;21,"00781-1210-60 ")
 ;;342
 ;;21,"00781-1213-10 ")
 ;;451
 ;;21,"00781-1213-60 ")
 ;;452
 ;;21,"00781-1323-05 ")
 ;;261
 ;;21,"00781-1323-60 ")
 ;;262
 ;;21,"00781-5070-31 ")
 ;;1294
 ;;21,"00781-5070-92 ")
 ;;1295
 ;;21,"00781-5071-31 ")
 ;;885
 ;;21,"00781-5071-92 ")
 ;;886
 ;;21,"00781-5072-31 ")
 ;;998
 ;;21,"00781-5072-92 ")
 ;;999
 ;;21,"00781-5073-31 ")
 ;;1141
 ;;21,"00781-5073-92 ")
 ;;1142
 ;;21,"00781-5074-31 ")
 ;;1361
 ;;21,"00781-5074-92 ")
 ;;1362
 ;;21,"00781-5231-10 ")
 ;;560
 ;;21,"00781-5231-92 ")
 ;;561
 ;;21,"00781-5232-10 ")
 ;;615
 ;;21,"00781-5232-92 ")
 ;;616
 ;;21,"00781-5234-10 ")
 ;;694
 ;;21,"00781-5234-92 ")
 ;;695
 ;;21,"00904-5581-52 ")
 ;;263
 ;;21,"00904-5582-52 ")
 ;;343
 ;;21,"00904-5583-52 ")
 ;;453
 ;;21,"00904-5800-61 ")
 ;;887
 ;;21,"00904-5801-61 ")
 ;;1000
 ;;21,"00904-5802-61 ")
 ;;1143
 ;;21,"00904-5891-61 ")
 ;;562
 ;;21,"00904-5892-61 ")
 ;;617
 ;;21,"00904-5893-61 ")
 ;;696
 ;;21,"00904-6113-61 ")
 ;;599
 ;;21,"00904-6114-61 ")
 ;;675
 ;;21,"00904-6115-61 ")
 ;;762
 ;;21,"10135-0498-90 ")
 ;;563
 ;;21,"10135-0499-90 ")
 ;;618
 ;;21,"10135-0500-90 ")
 ;;697
 ;;21,"10135-0508-05 ")
 ;;1296
 ;;21,"10135-0508-30 ")
 ;;1297
 ;;21,"10135-0508-90 ")
 ;;1298
 ;;21,"10135-0509-05 ")
 ;;888
 ;;21,"10135-0509-30 ")
 ;;889
 ;;21,"10135-0509-90 ")
 ;;890
 ;;21,"10135-0510-05 ")
 ;;1001
 ;;21,"10135-0510-30 ")
 ;;1002
 ;;21,"10135-0510-90 ")
 ;;1003
 ;;21,"10135-0511-05 ")
 ;;1144
 ;;21,"10135-0511-30 ")
 ;;1145
 ;;21,"10135-0511-90 ")
 ;;1146
 ;;21,"10135-0512-05 ")
 ;;1363
 ;;21,"10135-0512-30 ")
 ;;1364
 ;;21,"10135-0512-90 ")
 ;;1365
 ;;21,"12280-0038-90 ")
 ;;564
 ;;21,"12280-0108-60 ")
 ;;344
 ;;21,"12280-0150-30 ")
 ;;198
 ;;21,"12280-0164-15 ")
 ;;798
 ;;21,"12280-0164-90 ")
 ;;799
 ;;21,"12280-0181-30 ")
 ;;23
 ;;21,"12280-0181-90 ")
 ;;24
 ;;21,"12280-0335-15 ")
 ;;698
 ;;21,"12280-0335-30 ")
 ;;699
 ;;21,"12280-0335-90 ")
 ;;700
 ;;21,"12280-0351-30 ")
 ;;822
 ;;21,"12280-0351-90 ")
 ;;823
 ;;21,"12280-0385-30 ")
 ;;9
 ;;21,"12280-0385-90 ")
 ;;10
 ;;21,"12280-0386-30 ")
 ;;8
 ;;21,"12280-0397-30 ")
 ;;52
 ;;21,"12280-0398-30 ")
 ;;56
 ;;21,"12280-0399-30 ")
 ;;73
 ;;21,"13411-0111-01 ")
 ;;220
 ;;21,"13411-0111-02 ")
 ;;221
 ;;21,"13411-0111-03 ")
 ;;222
 ;;21,"13411-0111-06 ")
 ;;223
 ;;21,"13411-0111-10 ")
 ;;224
 ;;21,"13411-0113-01 ")
 ;;88
 ;;21,"13411-0113-03 ")
 ;;89
 ;;21,"13411-0113-06 ")
 ;;90
 ;;21,"13411-0113-09 ")
 ;;91
 ;;21,"13411-0113-15 ")
 ;;92
 ;;21,"13411-0114-01 ")
 ;;163
 ;;21,"13411-0114-03 ")
 ;;164
 ;;21,"13411-0114-06 ")
 ;;165
 ;;21,"13411-0114-09 ")
 ;;166
 ;;21,"13411-0114-15 ")
 ;;167
 ;;21,"13411-0115-01 ")
 ;;130
 ;;21,"13411-0115-03 ")
 ;;131
 ;;21,"13411-0115-06 ")
 ;;132
 ;;21,"13411-0115-09 ")
 ;;133
 ;;21,"13411-0115-15 ")
 ;;134
 ;;21,"13411-0118-01 ")
 ;;619
 ;;21,"13411-0118-02 ")
 ;;620
 ;;21,"13411-0118-03 ")
 ;;621
 ;;21,"13411-0118-06 ")
 ;;622
 ;;21,"13411-0118-09 ")
 ;;623
 ;;21,"13411-0119-01 ")
 ;;701
 ;;21,"13411-0119-02 ")
 ;;702
 ;;21,"13411-0119-03 ")
 ;;703
 ;;21,"13411-0119-06 ")
 ;;704
 ;;21,"13411-0119-09 ")
 ;;705
 ;;21,"13411-0132-01 ")
 ;;1004
 ;;21,"13411-0132-03 ")
 ;;1005
 ;;21,"13411-0132-06 ")
 ;;1006
 ;;21,"13411-0132-09 ")
 ;;1007
 ;;21,"13411-0132-15 ")
 ;;1008
 ;;21,"13411-0133-01 ")
 ;;1147
 ;;21,"13411-0133-03 ")
 ;;1148
 ;;21,"13411-0133-06 ")
 ;;1149
 ;;21,"13411-0133-09 ")
 ;;1150
 ;;21,"13411-0133-15 ")
 ;;1151
 ;;21,"13411-0161-01 ")
 ;;1299
 ;;21,"13411-0161-03 ")
 ;;1300
 ;
OTHER ; OTHER ROUTINES
 D ^BGP14C10
 D ^BGP14C11
 D ^BGP14C12
 D ^BGP14C13
 D ^BGP14C14
 D ^BGP14C15
 D ^BGP14C16
 D ^BGP14C17
 D ^BGP14C18
 D ^BGP14C19
 D ^BGP14C2
 D ^BGP14C3
 D ^BGP14C4
 D ^BGP14C5
 D ^BGP14C6
 D ^BGP14C7
 D ^BGP14C8
 D ^BGP14C9
 Q
