BGP8EXWB ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 28, 2007 ;
 ;;8.0;IHS CLINICAL REPORTING;;MAR 12, 2008
 ;;;BGP6;;SEP 28, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"00185-0505-01 ")
 ;;122
 ;;21,"00185-0505-05 ")
 ;;123
 ;;21,"00185-0591-01 ")
 ;;202
 ;;21,"00185-0591-05 ")
 ;;203
 ;;21,"00185-0591-10 ")
 ;;204
 ;;21,"00185-0808-01 ")
 ;;124
 ;;21,"00185-0808-05 ")
 ;;125
 ;;21,"00185-0820-01 ")
 ;;53
 ;;21,"00185-0820-05 ")
 ;;54
 ;;21,"00185-5400-01 ")
 ;;1208
 ;;21,"00185-5400-10 ")
 ;;1209
 ;;21,"00185-7100-01 ")
 ;;833
 ;;21,"00185-7100-10 ")
 ;;834
 ;;21,"00186-0001-31 ")
 ;;1412
 ;;21,"00186-0001-68 ")
 ;;1413
 ;;21,"00186-0002-31 ")
 ;;1414
 ;;21,"00228-2658-11 ")
 ;;570
 ;;21,"00228-2658-96 ")
 ;;571
 ;;21,"00228-2659-11 ")
 ;;688
 ;;21,"00228-2659-96 ")
 ;;689
 ;;21,"00228-2660-11 ")
 ;;495
 ;;21,"00228-2660-96 ")
 ;;496
 ;;21,"00228-2661-11 ")
 ;;622
 ;;21,"00228-2661-96 ")
 ;;623
 ;;21,"00228-2706-03 ")
 ;;835
 ;;21,"00228-2706-11 ")
 ;;836
 ;;21,"00228-2707-03 ")
 ;;862
 ;;21,"00228-2707-11 ")
 ;;863
 ;;21,"00228-2708-03 ")
 ;;894
 ;;21,"00228-2708-11 ")
 ;;895
 ;;21,"00310-0130-10 ")
 ;;1258
 ;;21,"00310-0130-34 ")
 ;;1259
 ;;21,"00310-0130-39 ")
 ;;1260
 ;;21,"00310-0131-10 ")
 ;;995
 ;;21,"00310-0131-34 ")
 ;;996
 ;;21,"00310-0131-39 ")
 ;;997
 ;;21,"00310-0131-73 ")
 ;;998
 ;;21,"00310-0132-10 ")
 ;;1117
 ;;21,"00310-0132-34 ")
 ;;1118
 ;;21,"00310-0132-39 ")
 ;;1119
 ;;21,"00310-0132-73 ")
 ;;1120
 ;;21,"00310-0133-10 ")
 ;;1156
 ;;21,"00310-0134-10 ")
 ;;1198
 ;;21,"00310-0135-10 ")
 ;;1041
 ;;21,"00310-0141-10 ")
 ;;849
 ;;21,"00310-0142-10 ")
 ;;884
 ;;21,"00310-0145-10 ")
 ;;907
 ;;21,"00364-2698-01 ")
 ;;572
 ;;21,"00364-2698-02 ")
 ;;573
 ;;21,"00364-2701-01 ")
 ;;690
 ;;21,"00364-2701-02 ")
 ;;691
 ;;21,"00364-2727-01 ")
 ;;497
 ;;21,"00364-2727-02 ")
 ;;498
 ;;21,"00364-2734-01 ")
 ;;624
 ;;21,"00364-2734-02 ")
 ;;625
 ;;21,"00378-0017-77 ")
 ;;1354
 ;;21,"00378-0081-01 ")
 ;;463
 ;;21,"00378-0083-01 ")
 ;;469
 ;;21,"00378-0084-01 ")
 ;;475
 ;;21,"00378-0086-01 ")
 ;;483
 ;;21,"00378-0226-77 ")
 ;;1301
 ;;21,"00378-0254-77 ")
 ;;1320
 ;;21,"00378-0272-77 ")
 ;;1340
 ;;21,"00378-0441-01 ")
 ;;126
 ;;21,"00378-0443-01 ")
 ;;9
 ;;21,"00378-0444-01 ")
 ;;55
 ;;21,"00378-0447-01 ")
 ;;94
 ;;21,"00378-0712-01 ")
 ;;768
 ;;21,"00378-0723-01 ")
 ;;760
 ;;21,"00378-1012-01 ")
 ;;837
 ;;21,"00378-1051-01 ")
 ;;574
 ;;21,"00378-1051-05 ")
 ;;575
 ;;21,"00378-1052-01 ")
 ;;692
 ;;21,"00378-1052-10 ")
 ;;693
 ;;21,"00378-1053-01 ")
 ;;499
 ;;21,"00378-1053-10 ")
 ;;500
 ;;21,"00378-1054-01 ")
 ;;626
 ;;21,"00378-1054-05 ")
 ;;627
 ;;21,"00378-2012-01 ")
 ;;864
 ;;21,"00378-2025-01 ")
 ;;896
 ;;21,"00378-2072-01 ")
 ;;1025
 ;;21,"00378-2073-01 ")
 ;;1210
 ;;21,"00378-2073-10 ")
 ;;1211
 ;;21,"00378-2074-01 ")
 ;;936
 ;;21,"00378-2074-10 ")
 ;;937
 ;;21,"00378-2075-01 ")
 ;;1053
 ;;21,"00378-2075-10 ")
 ;;1054
 ;;21,"00378-2076-01 ")
 ;;1166
 ;;21,"00378-2077-01 ")
 ;;1140
 ;;21,"00378-3007-01 ")
 ;;244
 ;;21,"00378-3007-10 ")
 ;;245
 ;;21,"00378-3012-01 ")
 ;;313
 ;;21,"00378-3012-10 ")
 ;;314
 ;;21,"00378-3017-01 ")
 ;;399
 ;;21,"00378-3017-10 ")
 ;;400
 ;;21,"00378-3022-01 ")
 ;;205
 ;;21,"00378-4725-01 ")
 ;;189
 ;;21,"00378-4735-01 ")
 ;;146
 ;;21,"00378-4745-01 ")
 ;;157
 ;;21,"00378-4745-04 ")
 ;;158
 ;;21,"00378-4775-01 ")
 ;;177
 ;;21,"00403-2241-01 ")
 ;;739
 ;;21,"00403-2241-30 ")
 ;;740
 ;;21,"00403-2779-01 ")
 ;;1121
 ;;21,"00403-2779-30 ")
 ;;1122
 ;;21,"00403-3029-01 ")
 ;;999
 ;;21,"00403-3029-30 ")
 ;;1000
 ;;21,"00536-3471-01 ")
 ;;246
 ;;21,"00536-3473-01 ")
 ;;401
 ;;21,"00536-3474-01 ")
 ;;206
 ;;21,"00591-0405-01 ")
 ;;1026
 ;;21,"00591-0406-01 ")
 ;;1212
 ;;21,"00591-0406-10 ")
 ;;1213
 ;;21,"00591-0407-01 ")
 ;;938
 ;;21,"00591-0407-10 ")
 ;;939
 ;;21,"00591-0408-01 ")
 ;;1055
 ;;21,"00591-0408-10 ")
 ;;1056
 ;;21,"00591-0409-01 ")
 ;;1167
 ;;21,"00591-0409-05 ")
 ;;1168
 ;;21,"00591-0668-01 ")
 ;;576
 ;;21,"00591-0668-05 ")
 ;;577
 ;;21,"00591-0669-01 ")
 ;;694
 ;;21,"00591-0669-05 ")
 ;;695
 ;;21,"00591-0670-01 ")
 ;;501
 ;;21,"00591-0670-05 ")
 ;;502
 ;;21,"00591-0671-01 ")
 ;;628
 ;;21,"00591-0671-05 ")
 ;;629
 ;;21,"00591-0671-10 ")
 ;;630
 ;;21,"00591-0860-01 ")
 ;;838
 ;;21,"00591-0860-05 ")
 ;;839
 ;;21,"00591-0861-01 ")
 ;;865
 ;;21,"00591-0861-05 ")
 ;;866
 ;;21,"00591-0862-01 ")
 ;;897
 ;;21,"00591-0862-05 ")
 ;;898
 ;;21,"00591-0885-01 ")
 ;;1141
 ;;21,"00603-2555-21 ")
 ;;247
 ;;21,"00603-2556-21 ")
 ;;315
 ;;21,"00603-2557-21 ")
 ;;402
 ;;21,"00603-2558-21 ")
 ;;207
 ;;21,"00615-4519-53 ")
 ;;248
 ;;21,"00615-4519-63 ")
 ;;249
 ;;21,"00615-4520-53 ")
 ;;316
 ;;21,"00615-4520-63 ")
 ;;317
 ;;21,"00615-4521-43 ")
 ;;403
 ;;21,"00615-4521-53 ")
 ;;404
 ;;21,"00615-4521-63 ")
 ;;405
 ;;21,"00615-4521-65 ")
 ;;406
 ;;21,"00781-1176-01 ")
 ;;867
 ;;21,"00781-1178-01 ")
 ;;899
 ;;21,"00781-1229-01 ")
 ;;578
 ;;21,"00781-1229-10 ")
 ;;579
 ;;21,"00781-1229-13 ")
 ;;580
 ;;21,"00781-1231-01 ")
 ;;696
 ;;21,"00781-1231-10 ")
 ;;697
 ;;21,"00781-1231-13 ")
 ;;698
 ;;21,"00781-1232-01 ")
 ;;503
 ;;21,"00781-1232-10 ")
 ;;504
 ;;21,"00781-1232-13 ")
 ;;505
 ;;21,"00781-1233-01 ")
 ;;631
 ;;21,"00781-1233-10 ")
 ;;632
 ;;21,"00781-1665-01 ")
 ;;1214
 ;;21,"00781-1666-01 ")
 ;;940
 ;;21,"00781-1667-01 ")
 ;;1057
 ;;21,"00781-1668-01 ")
 ;;1169
 ;;21,"00781-1669-01 ")
 ;;1027
 ;;21,"00781-1673-01 ")
 ;;1142
 ;;21,"00781-1839-01 ")
 ;;208
 ;;21,"00781-1848-01 ")
 ;;840
 ;;21,"00781-1891-01 ")
 ;;127
 ;;21,"00781-1892-01 ")
 ;;10
 ;;21,"00781-1893-01 ")
 ;;56
 ;;21,"00781-1894-01 ")
 ;;95
 ;;21,"00781-5083-10 ")
 ;;777
 ;;21,"00781-5083-92 ")
 ;;778
 ;;21,"00781-5084-10 ")
 ;;796
 ;;21,"00781-5084-92 ")
 ;;797
 ;;21,"00781-5085-92 ")
 ;;813
 ;;21,"00781-5131-01 ")
 ;;190
 ;;21,"00781-5132-01 ")
 ;;147
 ;;21,"00781-5133-01 ")
 ;;159
 ;;21,"00781-5134-01 ")
 ;;178
 ;;21,"00839-7994-16 ")
 ;;250
 ;;21,"00839-7996-06 ")
 ;;407
 ;;21,"00839-7996-16 ")
 ;;408
 ;;21,"00904-5045-60 ")
 ;;251
 ;;21,"00904-5045-61 ")
 ;;252
 ;;21,"00904-5045-67 ")
 ;;253
 ;;21,"00904-5045-80 ")
 ;;254
 ;;21,"00904-5046-60 ")
 ;;318
 ;;21,"00904-5046-61 ")
 ;;319
 ;;21,"00904-5046-80 ")
 ;;320
 ;;21,"00904-5047-40 ")
 ;;409
 ;;21,"00904-5047-60 ")
 ;;410
 ;;21,"00904-5047-61 ")
 ;;411
 ;;21,"00904-5047-80 ")
 ;;412
 ;;21,"00904-5048-60 ")
 ;;209
 ;;21,"00904-5502-60 ")
 ;;699
 ;;21,"00904-5502-61 ")
 ;;700
 ;;21,"00904-5503-60 ")
 ;;506
 ;;21,"00904-5504-60 ")
 ;;633
 ;;21,"00904-5609-60 ")
 ;;581
 ;;21,"00904-5609-61 ")
 ;;582
 ;;21,"00904-5610-60 ")
 ;;507
 ;;21,"00904-5610-61 ")
 ;;508
 ;;21,"00904-5611-61 ")
 ;;634
 ;;21,"00904-5638-43 ")
 ;;1215
 ;;21,"00904-5638-46 ")
 ;;1216
 ;;21,"00904-5638-61 ")
 ;;1217
 ;;21,"00904-5638-89 ")
 ;;1218
 ;;21,"00904-5639-43 ")
 ;;941
 ;;21,"00904-5639-46 ")
 ;;942
 ;;21,"00904-5639-48 ")
 ;;943
 ;;21,"00904-5639-61 ")
 ;;944
 ;;21,"00904-5639-89 ")
 ;;945
 ;;21,"00904-5639-93 ")
 ;;946
 ;;21,"00904-5640-43 ")
 ;;1058
 ;;21,"00904-5640-46 ")
 ;;1059
 ;;21,"00904-5640-48 ")
 ;;1060
 ;;21,"00904-5640-61 ")
 ;;1061
 ;;21,"00904-5640-89 ")
 ;;1062
 ;;21,"00904-5640-93 ")
 ;;1063
 ;;21,"00904-5642-43 ")
 ;;1170
 ;;21,"00904-5642-46 ")
 ;;1171
 ;;21,"00904-5642-48 ")
 ;;1172
 ;;21,"00904-5642-52 ")
 ;;1173
 ;;21,"00904-5642-61 ")
 ;;1174
 ;;21,"00904-5642-89 ")
 ;;1175
 ;;21,"00904-5642-93 ")
 ;;1176
 ;;21,"12280-0033-00 ")
 ;;109
 ;;21,"12280-0059-90 ")
 ;;1290
 ;;21,"12280-0061-00 ")
 ;;1360
 ;;21,"12280-0120-30 ")
 ;;179
 ;;21,"12280-0121-30 ")
 ;;160
 ;;21,"12280-0123-30 ")
 ;;148
 ;;21,"12280-0124-30 ")
 ;;900
 ;;21,"12280-0126-30 ")
 ;;868
 ;;21,"12280-0126-60 ")
 ;;869
 ;;21,"12280-0127-30 ")
 ;;841
 ;;21,"12280-0129-60 ")
 ;;1143
 ;;21,"12280-0183-30 ")
 ;;842
 ;;21,"12280-0220-00 ")
 ;;161
 ;;21,"12280-0228-90 ")
 ;;1321
 ;;21,"49884-0556-01 ")
 ;;1028
 ;;21,"49884-0556-10 ")
 ;;1029
 ;;21,"49884-0557-01 ")
 ;;1219
 ;;21,"49884-0557-10 ")
 ;;1220
 ;;21,"49884-0558-01 ")
 ;;947
 ;;21,"49884-0558-10 ")
 ;;948
 ;;21,"49884-0559-01 ")
 ;;1064
 ;;21,"49884-0559-10 ")
 ;;1065
 ;;21,"49884-0560-01 ")
 ;;1177
 ;;21,"49884-0560-10 ")
 ;;1178
 ;;21,"49884-0591-01 ")
 ;;583
 ;;21,"49884-0591-10 ")
 ;;584
 ;;21,"49884-0592-01 ")
 ;;701
 ;;21,"49884-0592-10 ")
 ;;702
 ;;21,"49884-0593-01 ")
 ;;509
 ;;21,"49884-0593-10 ")
 ;;510
 ;;21,"49884-0594-01 ")
 ;;635
 ;;21,"49884-0594-10 ")
 ;;636
 ;;21,"49884-0619-01 ")
 ;;255
 ;;21,"49884-0619-10 ")
 ;;256
 ;;21,"49884-0620-01 ")
 ;;321
 ;;21,"49884-0620-10 ")
 ;;322
 ;;21,"49884-0621-01 ")
 ;;413
 ;;21,"49884-0621-10 ")
 ;;414
 ;;21,"49884-0622-01 ")
 ;;210
 ;;21,"49884-0635-01 ")
 ;;1144
 ;;21,"49884-0635-10 ")
 ;;1145
 ;;21,"49884-0686-01 ")
 ;;769
 ;;21,"49884-0687-01 ")
 ;;761
 ;;21,"49884-0793-01 ")
 ;;225
 ;;21,"49884-0794-01 ")
 ;;289
 ;;21,"49884-0794-10 ")
 ;;290
 ;;21,"49884-0794-74 ")
 ;;291
 ;;21,"49884-0795-01 ")
 ;;383
 ;;21,"49884-0795-10 ")
 ;;384
 ;;21,"49884-0795-74 ")
 ;;385
 ;;21,"49884-0796-01 ")
 ;;196
 ;;21,"49884-0815-01 ")
 ;;459
 ;;21,"49884-0818-01 ")
 ;;479
 ;;21,"49884-0861-01 ")
 ;;191
 ;;21,"49884-0862-01 ")
 ;;149
 ;;21,"49884-0863-01 ")
 ;;162
 ;;21,"49884-0864-01 ")
 ;;180
 ;;21,"49884-0990-09 ")
 ;;1322
 ;;21,"49884-0991-09 ")
 ;;1341
 ;;21,"49884-0992-09 ")
 ;;1355
 ;;21,"49884-0993-09 ")
 ;;1302
 ;;21,"49999-0287-30 ")
 ;;74
 ;;21,"49999-0294-30 ")
 ;;1391
 ;;21,"50111-0891-01 ")
 ;;585
 ;;21,"50111-0891-03 ")
 ;;586
 ;;21,"50111-0892-01 ")
 ;;703
 ;;21,"50111-0892-03 ")
 ;;704
 ;;21,"50111-0893-01 ")
 ;;511
 ;;21,"50111-0893-03 ")
 ;;512
 ;;21,"50111-0894-01 ")
 ;;637
 ;;21,"50111-0894-03 ")
 ;;638
 ;;21,"51079-0145-20 ")
 ;;11
 ;;21,"51079-0146-20 ")
 ;;57
 ;;21,"51079-0863-20 ")
 ;;257
 ;;21,"51079-0864-20 ")
 ;;323
 ;;21,"51079-0950-20 ")
 ;;587
 ;;21,"51079-0951-20 ")
 ;;705
 ;;21,"51079-0952-20 ")
 ;;513
 ;;21,"51079-0953-20 ")
 ;;639
 ;;21,"51079-0981-20 ")
 ;;1221
 ;;21,"51079-0981-57 ")
 ;;1222
 ;;21,"51079-0982-19 ")
 ;;949
 ;;21,"51079-0982-20 ")
 ;;950
 ;;21,"51079-0982-57 ")
 ;;951
 ;;21,"51079-0983-19 ")
 ;;1066
 ;;21,"51079-0983-20 ")
 ;;1067
 ;;21,"51079-0983-57 ")
 ;;1068
 ;;21,"51079-0984-20 ")
 ;;1179
 ;;21,"51285-0956-02 ")
 ;;324
 ;;21,"51285-0956-05 ")
 ;;325
 ;;21,"51285-0957-02 ")
 ;;415
 ;;21,"51285-0957-05 ")
 ;;416
 ;;21,"51285-0958-02 ")
 ;;211
 ;;21,"51655-0975-24 ")
 ;;226
 ;;21,"51672-4037-01 ")
 ;;588
 ;;21,"51672-4037-03 ")
 ;;589
 ;;21,"51672-4038-01 ")
 ;;706
 ;;21,"51672-4038-03 ")
 ;;707
 ;;21,"51672-4039-01 ")
 ;;514
 ;;21,"51672-4039-03 ")
 ;;515
 ;;21,"51672-4040-01 ")
 ;;640
 ;;21,"51672-4040-03 ")
 ;;641
 ;;21,"51672-4045-01 ")
 ;;770
 ;;21,"51672-4046-01 ")
 ;;762
 ;;21,"51875-0355-01 ")
 ;;258
 ;;21,"51875-0955-02 ")
 ;;259
 ;;21,"51875-0955-05 ")
 ;;260
 ;;21,"52152-0238-08 ")
 ;;914
 ;;21,"52152-0238-30 ")
 ;;915
 ;;21,"52152-0239-08 ")
 ;;919
 ;;21,"52152-0239-30 ")
 ;;920
 ;;21,"52152-0240-08 ")
 ;;924
 ;;21,"52152-0240-30 ")
 ;;925
 ;;21,"52544-0668-01 ")
 ;;590
 ;;21,"52544-0668-05 ")
 ;;591
 ;;21,"52544-0669-01 ")
 ;;708
 ;;21,"52544-0669-05 ")
 ;;709
 ;;21,"52544-0670-01 ")
 ;;516
 ;;21,"52544-0670-05 ")
 ;;517
 ;;21,"52544-0671-01 ")
 ;;642
 ;;21,"52544-0688-01 ")
 ;;261
 ;;21,"52544-0688-05 ")
 ;;262
 ;;21,"52544-0688-10 ")
 ;;263
 ;;21,"52544-0689-01 ")
 ;;326
 ;;21,"52544-0689-05 ")
 ;;327
 ;;21,"52544-0689-10 ")
 ;;328
 ;;21,"52544-0690-01 ")
 ;;417
 ;;21,"52544-0690-05 ")
 ;;418
 ;;21,"52544-0690-10 ")
 ;;419
 ;;21,"52544-0691-01 ")
 ;;212
 ;;21,"52959-0498-00 ")
 ;;850
 ;;21,"52959-0831-30 ")
 ;;58
 ;;21,"52989-0835-30 ")
 ;;96
 ;;21,"54569-0522-00 ")
 ;;227
 ;;21,"54569-0522-01 ")
 ;;228
 ;;21,"54569-0522-03 ")
 ;;229
 ;;21,"54569-0523-00 ")
 ;;292
 ;;21,"54569-0523-02 ")
 ;;293
 ;;21,"54569-0606-00 ")
 ;;741
 ;;21,"54569-0606-01 ")
 ;;742
 ;;21,"54569-0606-02 ")
 ;;743
 ;;21,"54569-0606-03 ")
 ;;744
 ;;21,"54569-0607-00 ")
 ;;548
 ;;21,"54569-0607-01 ")
 ;;549
 ;;21,"54569-0607-03 ")
 ;;550
 ;;21,"54569-0612-00 ")
 ;;670
 ;;21,"54569-1752-03 ")
 ;;985
 ;;21,"54569-1944-00 ")
 ;;1001
 ;;21,"54569-1944-01 ")
 ;;1002
 ;;21,"54569-1944-02 ")
 ;;1003
 ;;21,"54569-1944-03 ")
 ;;1004
 ;;21,"54569-2051-01 ")
 ;;1105
 ;;21,"54569-2051-02 ")
 ;;1106
 ;;21,"54569-2665-01 ")
 ;;1123
 ;;21,"54569-2665-02 ")
 ;;1124
 ;;21,"54569-3258-01 ")
 ;;608
 ;;21,"54569-3300-01 ")
 ;;1248
 ;;21,"54569-3359-00 ")
 ;;75
 ;;21,"54569-3359-01 ")
 ;;76
 ;;21,"54569-3423-00 ")
 ;;32
 ;;21,"54569-3423-01 ")
 ;;33
 ;;21,"54569-3713-00 ")
 ;;1365
 ;;21,"54569-3714-00 ")
 ;;1372
 ;;21,"54569-3771-00 ")
 ;;1261
 ;;21,"54569-3808-00 ")
 ;;787
 ;;21,"54569-3809-00 ")
 ;;806
 ;;21,"54569-3984-00 ")
 ;;1291
