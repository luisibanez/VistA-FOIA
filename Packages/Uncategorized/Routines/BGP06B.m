BGP06B ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;;BGP HEDIS ANTIDEPRESSANT NDC
 ;
 ; This routine loads Taxonomy BGP HEDIS ANTIDEPRESSANT NDC
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
 ;;21,"00002-0817-02 ")
 ;;1
 ;;21,"00002-0817-03 ")
 ;;2
 ;;21,"00002-0819-02 ")
 ;;3
 ;;21,"00002-0819-03 ")
 ;;4
 ;;21,"00002-2468-05 ")
 ;;5
 ;;21,"00002-3004-75 ")
 ;;6
 ;;21,"00002-3210-45 ")
 ;;7
 ;;21,"00002-3220-45 ")
 ;;8
 ;;21,"00002-3231-30 ")
 ;;9
 ;;21,"00002-3231-33 ")
 ;;10
 ;;21,"00002-3232-30 ")
 ;;11
 ;;21,"00002-3232-33 ")
 ;;12
 ;;21,"00002-3233-30 ")
 ;;13
 ;;21,"00002-3233-33 ")
 ;;14
 ;;21,"00002-3234-30 ")
 ;;15
 ;;21,"00002-3234-33 ")
 ;;16
 ;;21,"00002-3235-33 ")
 ;;17
 ;;21,"00002-3235-60 ")
 ;;18
 ;;21,"00002-3237-04 ")
 ;;19
 ;;21,"00002-3237-30 ")
 ;;20
 ;;21,"00002-3237-33 ")
 ;;21
 ;;21,"00002-3240-30 ")
 ;;22
 ;;21,"00002-3240-33 ")
 ;;23
 ;;21,"00002-4006-02 ")
 ;;24
 ;;21,"00002-4006-30 ")
 ;;25
 ;;21,"00006-0026-68 ")
 ;;26
 ;;21,"00006-0047-68 ")
 ;;27
 ;;21,"00007-4471-20 ")
 ;;28
 ;;21,"00008-0701-01 ")
 ;;29
 ;;21,"00008-0701-02 ")
 ;;30
 ;;21,"00008-0701-07 ")
 ;;31
 ;;21,"00008-0701-08 ")
 ;;32
 ;;21,"00008-0703-01 ")
 ;;33
 ;;21,"00008-0703-02 ")
 ;;34
 ;;21,"00008-0703-07 ")
 ;;35
 ;;21,"00008-0703-08 ")
 ;;36
 ;;21,"00008-0704-01 ")
 ;;37
 ;;21,"00008-0704-02 ")
 ;;38
 ;;21,"00008-0704-07 ")
 ;;39
 ;;21,"00008-0704-08 ")
 ;;40
 ;;21,"00008-0705-01 ")
 ;;41
 ;;21,"00008-0705-02 ")
 ;;42
 ;;21,"00008-0705-07 ")
 ;;43
 ;;21,"00008-0705-08 ")
 ;;44
 ;;21,"00008-0781-01 ")
 ;;45
 ;;21,"00008-0781-02 ")
 ;;46
 ;;21,"00008-0781-07 ")
 ;;47
 ;;21,"00008-0781-08 ")
 ;;48
 ;;21,"00008-0833-01 ")
 ;;49
 ;;21,"00008-0833-03 ")
 ;;50
 ;;21,"00008-0833-20 ")
 ;;51
 ;;21,"00008-0833-21 ")
 ;;52
 ;;21,"00008-0833-22 ")
 ;;53
 ;;21,"00008-0836-01 ")
 ;;54
 ;;21,"00008-0836-03 ")
 ;;55
 ;;21,"00008-0836-20 ")
 ;;56
 ;;21,"00008-0836-21 ")
 ;;57
 ;;21,"00008-0836-22 ")
 ;;58
 ;;21,"00008-0837-01 ")
 ;;59
 ;;21,"00008-0837-03 ")
 ;;60
 ;;21,"00008-0837-20 ")
 ;;61
 ;;21,"00008-0837-21 ")
 ;;62
 ;;21,"00008-0837-22 ")
 ;;63
 ;;21,"00008-2702-11 ")
 ;;64
 ;;21,"00008-4132-01 ")
 ;;65
 ;;21,"00008-4133-01 ")
 ;;66
 ;;21,"00008-4158-01 ")
 ;;67
 ;;21,"00028-0020-01 ")
 ;;68
 ;;21,"00028-0020-26 ")
 ;;69
 ;;21,"00028-0022-01 ")
 ;;70
 ;;21,"00028-0022-26 ")
 ;;71
 ;;21,"00028-0032-01 ")
 ;;72
 ;;21,"00028-0040-01 ")
 ;;73
 ;;21,"00028-0040-26 ")
 ;;74
 ;;21,"00028-0045-01 ")
 ;;75
 ;;21,"00028-0045-26 ")
 ;;76
 ;;21,"00028-0136-01 ")
 ;;77
 ;;21,"00028-0136-10 ")
 ;;78
 ;;21,"00028-0136-65 ")
 ;;79
 ;;21,"00028-0140-01 ")
 ;;80
 ;;21,"00028-0140-10 ")
 ;;81
 ;;21,"00029-3206-13 ")
 ;;82
 ;;21,"00029-3207-13 ")
 ;;83
 ;;21,"00029-3208-13 ")
 ;;84
 ;;21,"00029-3210-13 ")
 ;;85
 ;;21,"00029-3211-13 ")
 ;;86
 ;;21,"00029-3211-20 ")
 ;;87
 ;;21,"00029-3211-21 ")
 ;;88
 ;;21,"00029-3211-59 ")
 ;;89
 ;;21,"00029-3212-13 ")
 ;;90
 ;;21,"00029-3213-13 ")
 ;;91
 ;;21,"00029-3213-25 ")
 ;;92
 ;;21,"00029-3215-48 ")
 ;;93
 ;;21,"00032-4202-01 ")
 ;;94
 ;;21,"00032-4202-11 ")
 ;;95
 ;;21,"00032-4205-01 ")
 ;;96
 ;;21,"00032-4205-11 ")
 ;;97
 ;;21,"00032-4210-01 ")
 ;;98
 ;;21,"00032-4210-11 ")
 ;;99
 ;;21,"00038-0041-10 ")
 ;;100
 ;;21,"00038-0041-34 ")
 ;;101
 ;;21,"00038-0041-39 ")
 ;;102
 ;;21,"00049-4900-30 ")
 ;;103
 ;;21,"00049-4900-41 ")
 ;;104
 ;;21,"00049-4900-66 ")
 ;;105
 ;;21,"00049-4900-73 ")
 ;;106
 ;;21,"00049-4900-94 ")
 ;;107
 ;;21,"00049-4910-30 ")
 ;;108
 ;;21,"00049-4910-41 ")
 ;;109
 ;;21,"00049-4910-66 ")
 ;;110
 ;;21,"00049-4910-73 ")
 ;;111
 ;;21,"00049-4910-94 ")
 ;;112
 ;;21,"00049-4940-23 ")
 ;;113
 ;;21,"00049-4960-30 ")
 ;;114
 ;;21,"00049-4960-50 ")
 ;;115
 ;;21,"00049-5100-47 ")
 ;;116
 ;;21,"00049-5340-66 ")
 ;;117
 ;;21,"00049-5350-66 ")
 ;;118
 ;;21,"00049-5360-66 ")
 ;;119
 ;;21,"00049-5360-94 ")
 ;;120
 ;;21,"00049-5370-50 ")
 ;;121
 ;;21,"00049-5380-66 ")
 ;;122
 ;;21,"00049-5390-66 ")
 ;;123
 ;;21,"00052-0105-30 ")
 ;;124
 ;;21,"00052-0105-90 ")
 ;;125
 ;;21,"00052-0106-30 ")
 ;;126
 ;;21,"00052-0106-90 ")
 ;;127
 ;;21,"00052-0106-93 ")
 ;;128
 ;;21,"00052-0107-30 ")
 ;;129
 ;;21,"00052-0107-90 ")
 ;;130
 ;;21,"00052-0108-30 ")
 ;;131
 ;;21,"00052-0108-90 ")
 ;;132
 ;;21,"00052-0108-93 ")
 ;;133
 ;;21,"00052-0109-30 ")
 ;;134
 ;;21,"00052-0110-30 ")
 ;;135
 ;;21,"00052-0110-90 ")
 ;;136
 ;;21,"00054-0062-58 ")
 ;;137
 ;;21,"00054-4672-21 ")
 ;;138
 ;;21,"00054-4673-21 ")
 ;;139
 ;;21,"00054-4674-21 ")
 ;;140
 ;;21,"00054-4676-13 ")
 ;;141
 ;;21,"00054-4677-13 ")
 ;;142
 ;;21,"00054-4678-13 ")
 ;;143
 ;;21,"00054-8676-25 ")
 ;;144
 ;;21,"00054-8677-25 ")
 ;;145
 ;;21,"00068-0007-01 ")
 ;;146
 ;;21,"00068-0011-01 ")
 ;;147
 ;;21,"00068-0015-01 ")
 ;;148
 ;;21,"00068-0019-01 ")
 ;;149
 ;;21,"00068-0020-01 ")
 ;;150
 ;;21,"00068-0021-50 ")
 ;;151
 ;;21,"00071-0270-24 ")
 ;;152
 ;;21,"00071-0350-24 ")
 ;;153
 ;;21,"00078-0016-33 ")
 ;;154
 ;;21,"00078-0078-05 ")
 ;;155
 ;;21,"00078-0078-06 ")
 ;;156
 ;;21,"00078-0079-05 ")
 ;;157
 ;;21,"00078-0086-05 ")
 ;;158
 ;;21,"00078-0086-06 ")
 ;;159
 ;;21,"00078-0087-05 ")
 ;;160
 ;;21,"00078-0087-06 ")
 ;;161
 ;;21,"00078-0087-08 ")
 ;;162
 ;;21,"00078-0316-05 ")
 ;;163
 ;;21,"00078-0316-06 ")
 ;;164
 ;;21,"00078-0317-05 ")
 ;;165
 ;;21,"00078-0317-06 ")
 ;;166
 ;;21,"00078-0318-05 ")
 ;;167
 ;;21,"00083-0135-30 ")
 ;;168
 ;;21,"00085-0287-04 ")
 ;;169
 ;;21,"00085-0287-08 ")
 ;;170
 ;;21,"00085-0598-04 ")
 ;;171
 ;;21,"00085-0598-08 ")
 ;;172
 ;;21,"00085-0720-04 ")
 ;;173
 ;;21,"00085-0720-08 ")
 ;;174
 ;;21,"00087-0031-47 ")
 ;;175
 ;;21,"00087-0032-31 ")
 ;;176
 ;;21,"00087-0033-31 ")
 ;;177
 ;;21,"00087-0039-31 ")
 ;;178
 ;;21,"00087-0041-31 ")
 ;;179
 ;;21,"00087-0775-41 ")
 ;;180
 ;;21,"00087-0775-42 ")
 ;;181
 ;;21,"00087-0775-43 ")
 ;;182
 ;;21,"00087-0776-41 ")
 ;;183
 ;;21,"00087-0776-42 ")
 ;;184
 ;;21,"00087-0776-43 ")
 ;;185
 ;;21,"00087-0778-43 ")
 ;;186
 ;;21,"00087-0778-44 ")
 ;;187
 ;;21,"00087-0796-41 ")
 ;;188
 ;;21,"00093-0280-01 ")
 ;;189
 ;;21,"00093-0280-05 ")
 ;;190
 ;;21,"00093-0290-01 ")
 ;;191
 ;;21,"00093-0290-05 ")
 ;;192
 ;;21,"00093-0637-01 ")
 ;;193
 ;;21,"00093-0637-10 ")
 ;;194
 ;;21,"00093-0638-01 ")
 ;;195
 ;;21,"00093-0638-10 ")
 ;;196
 ;;21,"00093-0810-01 ")
 ;;197
 ;;21,"00093-0810-05 ")
 ;;198
 ;;21,"00093-0811-01 ")
 ;;199
 ;;21,"00093-0811-05 ")
 ;;200
 ;;21,"00093-0812-01 ")
 ;;201
 ;;21,"00093-0812-05 ")
 ;;202
 ;;21,"00093-0813-01 ")
 ;;203
 ;;21,"00093-0813-05 ")
 ;;204
 ;;21,"00093-0956-01 ")
 ;;205
 ;;21,"00093-0958-01 ")
 ;;206
 ;;21,"00093-0960-01 ")
 ;;207
 ;;21,"00093-1024-06 ")
 ;;208
 ;;21,"00093-1025-06 ")
 ;;209
 ;;21,"00093-1026-06 ")
 ;;210
 ;;21,"00093-1042-01 ")
 ;;211
 ;;21,"00093-1043-01 ")
 ;;212
 ;;21,"00093-2111-01 ")
 ;;213
 ;;21,"00093-2113-10 ")
 ;;214
 ;;21,"00093-5501-01 ")
 ;;215
 ;;21,"00093-5502-01 ")
 ;;216
 ;;21,"00093-5703-01 ")
 ;;217
 ;;21,"00093-6108-12 ")
 ;;218
 ;;21,"00093-7113-06 ")
 ;;219
 ;;21,"00093-7114-56 ")
 ;;220
 ;;21,"00093-7114-98 ")
 ;;221
 ;;21,"00093-7115-56 ")
 ;;222
 ;;21,"00093-7115-98 ")
 ;;223
 ;;21,"00093-7116-56 ")
 ;;224
 ;;21,"00093-7116-98 ")
 ;;225
 ;;21,"00093-7121-56 ")
 ;;226
 ;;21,"00093-7121-98 ")
 ;;227
 ;;21,"00093-7178-01 ")
 ;;228
 ;;21,"00093-7188-10 ")
 ;;229
 ;;21,"00093-7188-56 ")
 ;;230
 ;;21,"00093-7198-56 ")
 ;;231
 ;;21,"00093-7206-56 ")
 ;;232
 ;;21,"00093-7207-56 ")
 ;;233
 ;;21,"00093-7208-56 ")
 ;;234
 ;;21,"00093-7303-65 ")
 ;;235
 ;;21,"00093-7304-65 ")
 ;;236
 ;;21,"00093-7305-65 ")
 ;;237
 ;;21,"00093-9612-12 ")
 ;;238
 ;;21,"00115-5445-13 ")
 ;;239
 ;;21,"00121-0678-12 ")
 ;;240
 ;;21,"00121-0678-16 ")
 ;;241
 ;;21,"00121-0721-04 ")
 ;;242
 ;;21,"00121-0721-05 ")
 ;;243
 ;;21,"00121-4721-05 ")
 ;;244
 ;;21,"00140-0070-01 ")
 ;;245
 ;;21,"00140-0070-49 ")
 ;;246
 ;;21,"00140-0071-01 ")
 ;;247
 ;;21,"00140-0071-49 ")
 ;;248
 ;;21,"00172-4332-10 ")
 ;;249
 ;;21,"00172-4332-49 ")
 ;;250
 ;;21,"00172-4332-60 ")
 ;;251
 ;;21,"00172-4332-70 ")
 ;;252
 ;;21,"00172-4333-10 ")
 ;;253
 ;;21,"00172-4333-49 ")
 ;;254
 ;;21,"00172-4333-60 ")
 ;;255
 ;;21,"00172-4333-70 ")
 ;;256
 ;;21,"00172-4334-10 ")
 ;;257
 ;;21,"00172-4334-49 ")
 ;;258
 ;;21,"00172-4334-60 ")
 ;;259
 ;;21,"00172-4334-70 ")
 ;;260
 ;;21,"00172-4335-10 ")
 ;;261
 ;;21,"00172-4335-49 ")
 ;;262
 ;;21,"00172-4335-60 ")
 ;;263
 ;;21,"00172-4343-10 ")
 ;;264
 ;;21,"00172-4343-49 ")
 ;;265
 ;;21,"00172-4343-60 ")
 ;;266
 ;;21,"00172-4346-10 ")
 ;;267
 ;;21,"00172-4346-46 ")
 ;;268
 ;;21,"00172-4346-60 ")
 ;;269
 ;;21,"00172-4346-70 ")
 ;;270
 ;;21,"00172-4356-60 ")
 ;;271
 ;;21,"00172-4356-70 ")
 ;;272
 ;;21,"00172-4356-80 ")
 ;;273
 ;;21,"00172-4363-60 ")
 ;;274
 ;;21,"00172-4363-70 ")
 ;;275
 ;;21,"00172-4363-80 ")
 ;;276
 ;;21,"00172-4389-60 ")
 ;;277
 ;;21,"00172-4389-70 ")
 ;;278
 ;;21,"00172-4391-60 ")
 ;;279
 ;;21,"00172-4391-70 ")
 ;;280
 ;;21,"00172-4391-80 ")
 ;;281
 ;;21,"00172-4392-60 ")
 ;;282
 ;;21,"00172-4392-70 ")
 ;;283
 ;;21,"00172-4392-80 ")
 ;;284
 ;;21,"00172-4510-60 ")
 ;;285
 ;;21,"00172-4510-70 ")
 ;;286
 ;;21,"00172-4510-80 ")
 ;;287
 ;;21,"00172-4740-10 ")
 ;;288
 ;;21,"00172-4740-60 ")
 ;;289
 ;;21,"00172-4740-80 ")
 ;;290
 ;;21,"00172-4741-10 ")
 ;;291
 ;;21,"00172-4741-60 ")
 ;;292
 ;;21,"00172-4741-70 ")
 ;;293
 ;;21,"00172-4741-85 ")
 ;;294
 ;;21,"00172-4742-10 ")
 ;;295
 ;;21,"00172-4742-60 ")
 ;;296
 ;;21,"00172-4742-70 ")
 ;;297
 ;;21,"00172-4742-85 ")
 ;;298
 ;;21,"00172-5675-10 ")
 ;;299
 ;;21,"00172-5675-46 ")
 ;;300
 ;;21,"00172-5675-70 ")
 ;;301
 ;;21,"00172-5676-10 ")
 ;;302
 ;;21,"00172-5676-46 ")
 ;;303
 ;;21,"00172-5676-70 ")
 ;;304
 ;;21,"00172-5695-10 ")
 ;;305
 ;;21,"00172-5695-46 ")
 ;;306
 ;;21,"00172-5695-70 ")
 ;;307
 ;;21,"00173-0135-55 ")
 ;;308
 ;;21,"00173-0177-55 ")
 ;;309
 ;;21,"00173-0178-55 ")
 ;;310
 ;;21,"00173-0722-00 ")
 ;;311
 ;;21,"00173-0730-01 ")
 ;;312
 ;;21,"00173-0730-02 ")
 ;;313
 ;;21,"00173-0731-01 ")
 ;;314
 ;;21,"00173-0947-55 ")
 ;;315
 ;;21,"00182-1018-01 ")
 ;;316
 ;;21,"00182-1018-10 ")
 ;;317
 ;;21,"00182-1018-89 ")
 ;;318
 ;;21,"00182-1019-01 ")
 ;;319
 ;;21,"00182-1019-10 ")
 ;;320
 ;;21,"00182-1019-89 ")
 ;;321
 ;;21,"00182-1020-01 ")
 ;;322
 ;;21,"00182-1020-89 ")
 ;;323
 ;;21,"00182-1021-01 ")
 ;;324
 ;;21,"00182-1021-89 ")
 ;;325
 ;;21,"00182-1043-01 ")
 ;;326
 ;;21,"00182-1063-01 ")
 ;;327
 ;;21,"00182-1063-89 ")
 ;;328
 ;;21,"00182-1190-01 ")
 ;;329
 ;;21,"00182-1191-01 ")
 ;;330
 ;;21,"00182-1192-01 ")
 ;;331
 ;;21,"00182-1193-01 ")
 ;;332
 ;;21,"00182-1235-01 ")
 ;;333
 ;;21,"00182-1235-05 ")
 ;;334
 ;;21,"00182-1236-01 ")
 ;;335
 ;;21,"00182-1236-05 ")
 ;;336
 ;;21,"00182-1237-01 ")
 ;;337
 ;;21,"00182-1238-01 ")
 ;;338
 ;;21,"00182-1238-05 ")
 ;;339
 ;;21,"00182-1259-05 ")
 ;;340
 ;;21,"00182-1259-89 ")
 ;;341
 ;;21,"00182-1260-01 ")
 ;;342
 ;;21,"00182-1260-10 ")
 ;;343
 ;;21,"00182-1260-89 ")
 ;;344
 ;;21,"00182-1298-01 ")
 ;;345
 ;;21,"00182-1325-01 ")
 ;;346
 ;;21,"00182-1326-01 ")
 ;;347
 ;;21,"00182-1327-01 ")
 ;;348
 ;;21,"00182-1328-01 ")
 ;;349
 ;;21,"00182-1329-01 ")
 ;;350
 ;;21,"00182-1329-89 ")
 ;;351
 ;;21,"00182-1332-89 ")
 ;;352
 ;;21,"00182-1333-10 ")
 ;;353
 ;;21,"00182-1333-89 ")
 ;;354
 ;;21,"00182-1486-01 ")
 ;;355
 ;;21,"00182-1878-01 ")
 ;;356
 ;;21,"00182-1882-01 ")
 ;;357
 ;;21,"00182-1883-01 ")
 ;;358
 ;;21,"00182-2643-01 ")
 ;;359
 ;;21,"00182-2644-01 ")
 ;;360
 ;;21,"00182-2652-01 ")
 ;;361
 ;;21,"00182-6043-71 ")
 ;;362
 ;;21,"00185-0016-60 ")
 ;;363
 ;;21,"00185-0017-01 ")
 ;;364
 ;;21,"00185-0019-01 ")
 ;;365
 ;;21,"00185-0019-05 ")
 ;;366
 ;;21,"00185-0019-10 ")
 ;;367
 ;;21,"00185-0020-10 ")
 ;;368
 ;;21,"00185-0020-30 ")
 ;;369
 ;;21,"00185-0027-01 ")
 ;;370
 ;;21,"00185-0027-05 ")
 ;;371
 ;;21,"00185-0027-88 ")
 ;;372
 ;;21,"00185-0029-01 ")
 ;;373
 ;;21,"00185-0038-60 ")
 ;;374
 ;;21,"00185-0080-01 ")
 ;;375
 ;;21,"00185-0080-10 ")
 ;;376
 ;;21,"00185-0081-60 ")
 ;;377
 ;;21,"00185-0085-01 ")
 ;;378
 ;;21,"00185-0085-10 ")
 ;;379
 ;;21,"00185-0126-60 ")
 ;;380
 ;;21,"00185-0148-60 ")
 ;;381
 ;;21,"00185-0157-01 ")
 ;;382
 ;;21,"00185-0157-05 ")
 ;;383
 ;;21,"00185-0212-10 ")
 ;;384
 ;;21,"00185-0212-30 ")
 ;;385
 ;;21,"00185-0222-10 ")
 ;;386
 ;;21,"00185-0222-30 ")
 ;;387
 ;;21,"00185-0371-01 ")
 ;;388
 ;;21,"00185-0371-10 ")
 ;;389
 ;;21,"00185-0372-01 ")
 ;;390
 ;;21,"00185-0372-10 ")
 ;;391
 ;;21,"00185-0373-01 ")
 ;;392
 ;;21,"00185-0373-10 ")
 ;;393
 ;
OTHER ; OTHER ROUTINES
 D ^BGP06B10
 D ^BGP06B11
 D ^BGP06B12
 D ^BGP06B13
 D ^BGP06B14
 D ^BGP06B15
 D ^BGP06B16
 D ^BGP06B17
 D ^BGP06B18
 D ^BGP06B19
 D ^BGP06B2
 D ^BGP06B20
 D ^BGP06B21
 D ^BGP06B22
 D ^BGP06B23
 D ^BGP06B24
 D ^BGP06B25
 D ^BGP06B26
 D ^BGP06B27
 D ^BGP06B28
 D ^BGP06B29
 D ^BGP06B3
 D ^BGP06B30
 D ^BGP06B31
 D ^BGP06B32
 D ^BGP06B33
 D ^BGP06B34
 D ^BGP06B35
 D ^BGP06B36
 D ^BGP06B37
 D ^BGP06B38
 D ^BGP06B39
 D ^BGP06B4
 D ^BGP06B40
 D ^BGP06B41
 D ^BGP06B42
 D ^BGP06B43
 D ^BGP06B44
 D ^BGP06B5
 D ^BGP06B6
 D ^BGP06B7
 D ^BGP06B8
 D ^BGP06B9
 Q