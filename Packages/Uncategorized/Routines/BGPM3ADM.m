BGPM3ADM ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON APR 21, 2011;
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"23490583809 ")
 ;;22
 ;;21,"23490583900 ")
 ;;203
 ;;21,"23490583901 ")
 ;;204
 ;;21,"23490584001 ")
 ;;447
 ;;21,"23490584002 ")
 ;;448
 ;;21,"23490935303 ")
 ;;691
 ;;21,"23490935306 ")
 ;;692
 ;;21,"23490935309 ")
 ;;693
 ;;21,"23490935403 ")
 ;;846
 ;;21,"23490935406 ")
 ;;847
 ;;21,"23490935409 ")
 ;;848
 ;;21,"23490935503 ")
 ;;1054
 ;;21,"23490935506 ")
 ;;1055
 ;;21,"23490935509 ")
 ;;1056
 ;;21,"23490935603 ")
 ;;1256
 ;;21,"23490935606 ")
 ;;1257
 ;;21,"23490935609 ")
 ;;1258
 ;;21,"23490935703 ")
 ;;1369
 ;;21,"23490935706 ")
 ;;1370
 ;;21,"23490935709 ")
 ;;1371
 ;;21,"24236008602 ")
 ;;205
 ;;21,"24236015602 ")
 ;;206
 ;;21,"24236021002 ")
 ;;23
 ;;21,"24236037202 ")
 ;;207
 ;;21,"24236038402 ")
 ;;449
 ;;21,"24236050002 ")
 ;;24
 ;;21,"24236059102 ")
 ;;208
 ;;21,"24236064002 ")
 ;;209
 ;;21,"24236064402 ")
 ;;25
 ;;21,"24236067702 ")
 ;;694
 ;;21,"24236069502 ")
 ;;849
 ;;21,"24236072402 ")
 ;;695
 ;;21,"24236074502 ")
 ;;696
 ;;21,"24236075602 ")
 ;;850
 ;;21,"24236093702 ")
 ;;1057
 ;;21,"24658021010 ")
 ;;1259
 ;;21,"24658021030 ")
 ;;1260
 ;;21,"24658021045 ")
 ;;1261
 ;;21,"24658021090 ")
 ;;1262
 ;;21,"24658021110 ")
 ;;697
 ;;21,"24658021130 ")
 ;;698
 ;;21,"24658021145 ")
 ;;699
 ;;21,"24658021190 ")
 ;;700
 ;;21,"24658021210 ")
 ;;851
 ;;21,"24658021230 ")
 ;;852
 ;;21,"24658021245 ")
 ;;853
 ;;21,"24658021290 ")
 ;;854
 ;;21,"24658021310 ")
 ;;1058
 ;;21,"24658021330 ")
 ;;1059
 ;;21,"24658021345 ")
 ;;1060
 ;;21,"24658021390 ")
 ;;1061
 ;;21,"24658021410 ")
 ;;1372
 ;;21,"24658021430 ")
 ;;1373
 ;;21,"24658021445 ")
 ;;1374
 ;;21,"24658021490 ")
 ;;1375
 ;;21,"26053006401 ")
 ;;13
 ;;21,"26053006501 ")
 ;;15
 ;;21,"26053006601 ")
 ;;11
 ;;21,"26053017701 ")
 ;;210
 ;;21,"26053018301 ")
 ;;855
 ;;21,"26053031001 ")
 ;;856
 ;;21,"26053031201 ")
 ;;701
 ;;21,"26053041501 ")
 ;;1062
 ;;21,"33358022330 ")
 ;;26
 ;;21,"33358022500 ")
 ;;211
 ;;21,"33358022530 ")
 ;;212
 ;;21,"33358022560 ")
 ;;213
 ;;21,"33358022630 ")
 ;;450
 ;;21,"33358043130 ")
 ;;857
 ;;21,"43063000801 ")
 ;;858
 ;;21,"43063008030 ")
 ;;1376
 ;;21,"43063008090 ")
 ;;1377
 ;;21,"43353000730 ")
 ;;1063
 ;;21,"43353000733 ")
 ;;1064
 ;;21,"43353000760 ")
 ;;1065
 ;;21,"43353022715 ")
 ;;1066
 ;;21,"43353022730 ")
 ;;1067
 ;;21,"43353022745 ")
 ;;1068
 ;;21,"43353022760 ")
 ;;1069
 ;;21,"43353022815 ")
 ;;1378
 ;;21,"43353022830 ")
 ;;1379
 ;;21,"43353022845 ")
 ;;1380
 ;;21,"43353022860 ")
 ;;1381
 ;;21,"43353039460 ")
 ;;1382
 ;;21,"43683015230 ")
 ;;1070
 ;;21,"43869415600 ")
 ;;4
 ;;21,"45802009301 ")
 ;;702
 ;;21,"45802009365 ")
 ;;703
 ;;21,"45802009375 ")
 ;;704
 ;;21,"45802029265 ")
 ;;1383
 ;;21,"45802029275 ")
 ;;1384
 ;;21,"45802038401 ")
 ;;859
 ;;21,"45802038465 ")
 ;;860
 ;;21,"45802038475 ")
 ;;861
 ;;21,"45802038493 ")
 ;;862
 ;;21,"45802087901 ")
 ;;1071
 ;;21,"45802087965 ")
 ;;1072
 ;;21,"45802087975 ")
 ;;1073
 ;;21,"45802087993 ")
 ;;1074
 ;;21,"45802092465 ")
 ;;1263
 ;;21,"49856017700 ")
 ;;27
 ;;21,"49856017701 ")
 ;;28
 ;;21,"49856017703 ")
 ;;29
 ;;21,"49856017709 ")
 ;;30
 ;;21,"49856017800 ")
 ;;214
 ;;21,"49856017801 ")
 ;;215
 ;;21,"49856017803 ")
 ;;216
 ;;21,"49856017809 ")
 ;;217
 ;;21,"49856017900 ")
 ;;451
 ;;21,"49856017901 ")
 ;;452
 ;;21,"49856017903 ")
 ;;453
 ;;21,"49856017909 ")
 ;;454
 ;;21,"49884075401 ")
 ;;31
 ;;21,"49884075402 ")
 ;;32
 ;;21,"49884075410 ")
 ;;33
 ;;21,"49884075501 ")
 ;;218
 ;;21,"49884075502 ")
 ;;219
 ;;21,"49884075510 ")
 ;;220
 ;;21,"49884075601 ")
 ;;455
 ;;21,"49884075602 ")
 ;;456
 ;;21,"49884075610 ")
 ;;457
 ;;21,"49999029330 ")
 ;;34
 ;;21,"49999047060 ")
 ;;221
 ;;21,"49999047100 ")
 ;;458
 ;;21,"49999047130 ")
 ;;459
 ;;21,"49999047160 ")
 ;;460
 ;;21,"49999088930 ")
 ;;863
 ;;21,"49999088960 ")
 ;;864
 ;;21,"49999088990 ")
 ;;865
 ;;21,"49999090090 ")
 ;;1264
 ;;21,"49999090315 ")
 ;;1075
 ;;21,"49999090330 ")
 ;;1076
 ;;21,"49999090390 ")
 ;;1077
 ;;21,"51079045401 ")
 ;;705
 ;;21,"51079045420 ")
 ;;706
 ;;21,"51079045501 ")
 ;;866
 ;;21,"51079045520 ")
 ;;867
 ;;21,"51079045601 ")
 ;;1078
 ;;21,"51079045620 ")
 ;;1079
 ;;21,"51079097401 ")
 ;;35
 ;;21,"51079097420 ")
 ;;36
 ;;21,"51079097501 ")
 ;;222
 ;;21,"51079097520 ")
 ;;223
 ;;21,"51079097530 ")
 ;;224
 ;;21,"51079097556 ")
 ;;225
 ;;21,"51079097601 ")
 ;;461
 ;;21,"51079097620 ")
 ;;462
 ;;21,"51079097630 ")
 ;;463
 ;;21,"51079097656 ")
 ;;464
 ;;21,"51129258201 ")
 ;;465
 ;;21,"51129275401 ")
 ;;226
 ;;21,"51129289201 ")
 ;;227
 ;;21,"51129291101 ")
 ;;466
 ;;21,"51129291102 ")
 ;;467
 ;;21,"51129295201 ")
 ;;468
 ;;21,"51129295202 ")
 ;;469
 ;;21,"51129325001 ")
 ;;37
 ;;21,"51129325002 ")
 ;;38
 ;;21,"51129341001 ")
 ;;228
 ;;21,"51129341002 ")
 ;;229
 ;;21,"51129351401 ")
 ;;230
 ;;21,"51129351402 ")
 ;;231
 ;;21,"51129351601 ")
 ;;470
 ;;21,"51129351602 ")
 ;;471
 ;;21,"51129354101 ")
 ;;232
 ;;21,"51129354102 ")
 ;;233
 ;;21,"51129359201 ")
 ;;472
 ;;21,"51129359202 ")
 ;;473
 ;;21,"51129366701 ")
 ;;474
 ;;21,"51129366702 ")
 ;;475
 ;;21,"51129368101 ")
 ;;234
 ;;21,"51129368102 ")
 ;;235
 ;;21,"51129373701 ")
 ;;39
 ;;21,"51129373702 ")
 ;;40
 ;;21,"51129375101 ")
 ;;868
 ;;21,"51129375102 ")
 ;;869
 ;;21,"51129375701 ")
 ;;1080
 ;;21,"51129375702 ")
 ;;1081
 ;;21,"51129378301 ")
 ;;1265
 ;;21,"51129378302 ")
 ;;1266
 ;;21,"51129378901 ")
 ;;1385
 ;;21,"51129378902 ")
 ;;1386
 ;;21,"51129379501 ")
 ;;1082
 ;;21,"51129379502 ")
 ;;1083
 ;;21,"51129389101 ")
 ;;41
 ;;21,"51129389102 ")
 ;;42
 ;;21,"51129396601 ")
 ;;476
 ;;21,"51129396602 ")
 ;;477
 ;;21,"51129405501 ")
 ;;478
 ;;21,"51129405502 ")
 ;;479
 ;;21,"51129410601 ")
 ;;870
 ;;21,"51129410602 ")
 ;;871
 ;;21,"51129410901 ")
 ;;1267
 ;;21,"51129410902 ")
 ;;1268
 ;;21,"51129413901 ")
 ;;1084
 ;;21,"51129413902 ")
 ;;1085
 ;;21,"51129415601 ")
 ;;707
 ;;21,"51129415602 ")
 ;;708
 ;;21,"51129417001 ")
 ;;1086
 ;;21,"51129417002 ")
 ;;1087
 ;;21,"51129420701 ")
 ;;1088
 ;;21,"51129420702 ")
 ;;1089
 ;;21,"51129420801 ")
 ;;1090
 ;;21,"51129420802 ")
 ;;1091
 ;;21,"51129420901 ")
 ;;872
 ;;21,"51129420902 ")
 ;;873
 ;;21,"51129436501 ")
 ;;1092
 ;;21,"51129436502 ")
 ;;1093
 ;;21,"51129436601 ")
 ;;1387
 ;;21,"51129436602 ")
 ;;1388
 ;;21,"51129437101 ")
 ;;480
 ;;21,"51129437102 ")
 ;;481
 ;;21,"51129438501 ")
 ;;236
 ;;21,"51129438502 ")
 ;;237
 ;;21,"51129444201 ")
 ;;1094
 ;;21,"51129444202 ")
 ;;1095
 ;;21,"51129468201 ")
 ;;709
 ;;21,"51129468202 ")
 ;;710
 ;;21,"51655028124 ")
 ;;482
 ;;21,"51655028150 ")
 ;;483
 ;;21,"51655028152 ")
 ;;484
 ;;21,"51655031450 ")
 ;;238
 ;;21,"51655031452 ")
 ;;239
 ;;21,"51655031453 ")
 ;;240
 ;;21,"51660078910 ")
 ;;1269
 ;;21,"51660078930 ")
 ;;1270
 ;;21,"51660078990 ")
 ;;1271
 ;;21,"51660079010 ")
 ;;711
 ;;21,"51660079030 ")
 ;;712
 ;;21,"51660079090 ")
 ;;713
 ;;21,"51660079110 ")
 ;;874
 ;;21,"51660079130 ")
 ;;875
 ;;21,"51660079190 ")
 ;;876
 ;;21,"51660079210 ")
 ;;1096
 ;;21,"51660079230 ")
 ;;1097
 ;;21,"51660079250 ")
 ;;1098
 ;;21,"51660079290 ")
 ;;1099
 ;;21,"51660079310 ")
 ;;1389
 ;;21,"51660079330 ")
 ;;1390
 ;;21,"51660079350 ")
 ;;1391
 ;;21,"51660079390 ")
 ;;1392
 ;;21,"52959072030 ")
 ;;241
 ;;21,"52959094430 ")
 ;;1100
 ;;21,"52959098830 ")
 ;;714
 ;;21,"52959098930 ")
 ;;877
 ;;21,"53489060701 ")
 ;;43
 ;;21,"53489060703 ")
 ;;44
 ;;21,"53489060705 ")
 ;;45
 ;;21,"53489060706 ")
 ;;46
 ;;21,"53489060707 ")
 ;;47
 ;;21,"53489060710 ")
 ;;48
 ;;21,"53489060801 ")
 ;;242
 ;;21,"53489060803 ")
 ;;243
 ;;21,"53489060805 ")
 ;;244
 ;;21,"53489060806 ")
 ;;245
 ;;21,"53489060807 ")
 ;;246
 ;;21,"53489060810 ")
 ;;247
 ;;21,"53489060901 ")
 ;;485
 ;;21,"53489060903 ")
 ;;486
 ;;21,"53489060905 ")
 ;;487
 ;;21,"53489060906 ")
 ;;488
 ;;21,"53489060907 ")
 ;;489
 ;;21,"53489060910 ")
 ;;490
 ;;21,"53808079001 ")
 ;;715
 ;;21,"53808079101 ")
 ;;878
 ;;21,"53808079201 ")
 ;;879
 ;;21,"53808079301 ")
 ;;880
 ;;21,"53808079401 ")
 ;;1101
 ;;21,"53816414300 ")
 ;;6
 ;;21,"53869414300 ")
 ;;7
 ;;21,"53869414400 ")
 ;;1
 ;;21,"53869414500 ")
 ;;8
 ;;21,"53869414600 ")
 ;;2
 ;;21,"53869414700 ")
 ;;9
 ;;21,"53869414800 ")
 ;;3
 ;;21,"53869415500 ")
 ;;10
 ;;21,"53869415600 ")
 ;;5
 ;;21,"53978090303 ")
 ;;248
 ;;21,"53978306901 ")
 ;;716
 ;;21,"53978306903 ")
 ;;717
 ;;21,"53978337001 ")
 ;;881
 ;;21,"53978337003 ")
 ;;882
 ;;21,"54458093610 ")
 ;;491
 ;;21,"54458093710 ")
 ;;249
 ;;21,"54458093810 ")
 ;;49
 ;;21,"54458098210 ")
 ;;492
 ;;21,"54458098310 ")
 ;;250
 ;;21,"54458098410 ")
 ;;50
 ;;21,"54569534500 ")
 ;;51
 ;;21,"54569534600 ")
 ;;251
 ;;21,"54569534700 ")
 ;;493
 ;;21,"54569583300 ")
 ;;883
 ;;21,"54569583301 ")
 ;;884
 ;;21,"54569583302 ")
 ;;885
 ;;21,"54569583303 ")
 ;;886
 ;;21,"54569583401 ")
 ;;1102
 ;;21,"54569583402 ")
 ;;1103
 ;;21,"54569583403 ")
 ;;1104
 ;;21,"54569583404 ")
 ;;1105
 ;;21,"54868458500 ")
 ;;252
 ;;21,"54868458501 ")
 ;;253
 ;;21,"54868459300 ")
 ;;52
 ;;21,"54868459301 ")
 ;;53
 ;;21,"54868459302 ")
 ;;54
 ;;21,"54868477400 ")
 ;;494
 ;;21,"54868477401 ")
 ;;495
 ;;21,"54868477402 ")
 ;;496
 ;;21,"54868477403 ")
 ;;497
 ;;21,"54868562700 ")
 ;;718
 ;;21,"54868562701 ")
 ;;719
 ;;21,"54868562800 ")
 ;;887
 ;;21,"54868562801 ")
 ;;888
 ;;21,"54868562802 ")
 ;;889
 ;;21,"54868562900 ")
 ;;1106
 ;;21,"54868562901 ")
 ;;1107
 ;;21,"54868562902 ")
 ;;1108
 ;;21,"54868562903 ")
 ;;1109
 ;;21,"54868562904 ")
 ;;1110
 ;;21,"54868563000 ")
 ;;1393
 ;;21,"54868563001 ")
 ;;1394
 ;;21,"54868606600 ")
 ;;1272
 ;;21,"55045301401 ")
 ;;254
 ;;21,"55045301402 ")
 ;;255
 ;;21,"55045301406 ")
 ;;256
 ;;21,"55045301408 ")
 ;;257
 ;;21,"55045301409 ")
 ;;258
 ;;21,"55045301501 ")
 ;;498
 ;;21,"55045301508 ")
 ;;499
 ;;21,"55045301509 ")
 ;;500
 ;;21,"55111019701 ")
 ;;1273
 ;;21,"55111019705 ")
 ;;1274
 ;;21,"55111019710 ")
 ;;1275
 ;;21,"55111019730 ")
 ;;1276
 ;;21,"55111019760 ")
 ;;1277
 ;;21,"55111019778 ")
 ;;1278
 ;;21,"55111019790 ")
 ;;1279
 ;;21,"55111019801 ")
 ;;720
 ;;21,"55111019805 ")
 ;;721
 ;;21,"55111019830 ")
 ;;722
 ;;21,"55111019860 ")
 ;;723
 ;;21,"55111019878 ")
 ;;724
 ;;21,"55111019890 ")
 ;;725
 ;;21,"55111019901 ")
 ;;890
 ;;21,"55111019905 ")
 ;;891
 ;;21,"55111019910 ")
 ;;892
 ;;21,"55111019930 ")
 ;;893
 ;;21,"55111019960 ")
 ;;894
 ;;21,"55111019978 ")
 ;;895
 ;;21,"55111019990 ")
 ;;896
 ;;21,"55111020001 ")
 ;;1111
 ;;21,"55111020005 ")
 ;;1112
 ;;21,"55111020010 ")
 ;;1113
 ;;21,"55111020030 ")
 ;;1114
 ;;21,"55111020060 ")
 ;;1115
 ;;21,"55111020078 ")
 ;;1116
 ;;21,"55111020090 ")
 ;;1117
 ;;21,"55111026801 ")
 ;;1395
 ;;21,"55111026805 ")
 ;;1396
 ;;21,"55111026830 ")
 ;;1397
 ;;21,"55111026860 ")
 ;;1398
