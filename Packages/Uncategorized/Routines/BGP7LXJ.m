BGP7LXJ ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON AUG 29, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;BGP HEDIS GASTRO ANTISPASM NDC
 ;
 ; This routine loads Taxonomy BGP HEDIS GASTRO ANTISPASM NDC
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
 ;;21,"00054-4721-25 ")
 ;;3
 ;;21,"00054-4721-31 ")
 ;;4
 ;;21,"00054-8737-25 ")
 ;;5
 ;;21,"00054-8849-25 ")
 ;;161
 ;;21,"00054-8850-25 ")
 ;;235
 ;;21,"00054-8851-25 ")
 ;;236
 ;;21,"00054-8852-25 ")
 ;;219
 ;;21,"00068-0120-61 ")
 ;;20
 ;;21,"00068-0123-61 ")
 ;;101
 ;;21,"00068-0125-16 ")
 ;;99
 ;;21,"00068-0809-23 ")
 ;;90
 ;;21,"00068-0810-61 ")
 ;;91
 ;;21,"00078-0002-65 ")
 ;;162
 ;;21,"00078-0003-65 ")
 ;;237
 ;;21,"00078-0004-65 ")
 ;;238
 ;;21,"00115-3200-01 ")
 ;;21
 ;;21,"00115-3200-03 ")
 ;;22
 ;;21,"00115-3220-01 ")
 ;;102
 ;;21,"00115-3220-03 ")
 ;;103
 ;;21,"00115-4308-01 ")
 ;;6
 ;;21,"00115-4308-03 ")
 ;;7
 ;;21,"00143-1227-01 ")
 ;;104
 ;;21,"00143-1227-10 ")
 ;;105
 ;;21,"00143-3126-01 ")
 ;;23
 ;;21,"00143-3126-10 ")
 ;;24
 ;;21,"00182-0519-01 ")
 ;;25
 ;;21,"00182-0519-10 ")
 ;;26
 ;;21,"00182-0708-63 ")
 ;;92
 ;;21,"00182-1578-10 ")
 ;;163
 ;;21,"00182-1578-89 ")
 ;;164
 ;;21,"00182-1579-01 ")
 ;;239
 ;;21,"00182-1858-01 ")
 ;;8
 ;;21,"00223-0795-01 ")
 ;;106
 ;;21,"00223-0795-02 ")
 ;;107
 ;;21,"00223-2128-00 ")
 ;;165
 ;;21,"00223-2128-05 ")
 ;;166
 ;;21,"00223-2130-05 ")
 ;;240
 ;;21,"00223-2131-05 ")
 ;;241
 ;;21,"00223-7430-10 ")
 ;;93
 ;;21,"00247-0188-00 ")
 ;;27
 ;;21,"00247-0188-02 ")
 ;;28
 ;;21,"00247-0188-03 ")
 ;;29
 ;;21,"00247-0188-04 ")
 ;;30
 ;;21,"00247-0188-06 ")
 ;;31
 ;;21,"00247-0188-10 ")
 ;;32
 ;;21,"00247-0188-12 ")
 ;;33
 ;;21,"00247-0188-14 ")
 ;;34
 ;;21,"00247-0188-15 ")
 ;;35
 ;;21,"00247-0188-20 ")
 ;;36
 ;;21,"00247-0188-24 ")
 ;;37
 ;;21,"00247-0188-30 ")
 ;;38
 ;;21,"00247-0188-40 ")
 ;;39
 ;;21,"00302-7100-01 ")
 ;;167
 ;;21,"00302-7104-01 ")
 ;;242
 ;;21,"00302-7104-10 ")
 ;;243
 ;;21,"00302-7106-01 ")
 ;;244
 ;;21,"00314-0299-70 ")
 ;;94
 ;;21,"00349-8268-01 ")
 ;;168
 ;;21,"00349-8268-10 ")
 ;;169
 ;;21,"00349-8269-01 ")
 ;;245
 ;;21,"00349-8269-10 ")
 ;;246
 ;;21,"00349-8270-01 ")
 ;;247
 ;;21,"00349-8270-10 ")
 ;;248
 ;;21,"00349-8360-01 ")
 ;;249
 ;;21,"00349-8360-10 ")
 ;;250
 ;;21,"00349-8361-01 ")
 ;;170
 ;;21,"00349-8361-10 ")
 ;;171
 ;;21,"00349-8362-01 ")
 ;;251
 ;;21,"00349-8362-10 ")
 ;;252
 ;;21,"00378-1610-01 ")
 ;;40
 ;;21,"00378-1610-05 ")
 ;;41
 ;;21,"00378-1620-01 ")
 ;;108
 ;;21,"00378-1620-05 ")
 ;;109
 ;;21,"00405-4328-01 ")
 ;;42
 ;;21,"00405-4328-03 ")
 ;;43
 ;;21,"00463-1104-10 ")
 ;;95
 ;;21,"00472-1450-94 ")
 ;;172
 ;;21,"00527-0586-01 ")
 ;;44
 ;;21,"00527-0586-05 ")
 ;;45
 ;;21,"00527-0586-10 ")
 ;;46
 ;;21,"00527-1282-01 ")
 ;;110
 ;;21,"00527-1282-05 ")
 ;;111
 ;;21,"00527-1282-10 ")
 ;;112
 ;;21,"00536-3801-11 ")
 ;;173
 ;;21,"00556-0352-01 ")
 ;;174
 ;;21,"00556-0352-10 ")
 ;;175
 ;;21,"00556-0353-01 ")
 ;;253
 ;;21,"00556-0353-10 ")
 ;;254
 ;;21,"00556-0354-01 ")
 ;;255
 ;;21,"00556-0354-10 ")
 ;;256
 ;;21,"00591-0794-01 ")
 ;;47
 ;;21,"00591-0794-10 ")
 ;;48
 ;;21,"00591-0795-01 ")
 ;;113
 ;;21,"00591-0795-10 ")
 ;;114
 ;;21,"00591-5542-01 ")
 ;;257
 ;;21,"00591-5542-04 ")
 ;;258
 ;;21,"00591-5566-01 ")
 ;;176
 ;;21,"00591-5566-04 ")
 ;;177
 ;;21,"00591-5568-01 ")
 ;;259
 ;;21,"00591-5568-04 ")
 ;;260
 ;;21,"00603-1161-58 ")
 ;;315
 ;;21,"00603-3265-21 ")
 ;;49
 ;;21,"00603-3265-32 ")
 ;;50
 ;;21,"00603-3266-21 ")
 ;;115
 ;;21,"00615-0327-01 ")
 ;;51
 ;;21,"00615-0327-10 ")
 ;;52
 ;;21,"00615-1516-10 ")
 ;;116
 ;;21,"00615-2504-29 ")
 ;;178
 ;;21,"00615-2504-65 ")
 ;;179
 ;;21,"00615-2504-88 ")
 ;;180
 ;;21,"00615-2506-29 ")
 ;;261
 ;;21,"00615-2506-65 ")
 ;;262
 ;;21,"00615-2506-88 ")
 ;;263
 ;;21,"00615-2507-29 ")
 ;;264
 ;;21,"00615-2507-65 ")
 ;;265
 ;;21,"00615-2507-88 ")
 ;;266
 ;;21,"00675-4017-07 ")
 ;;181
 ;;21,"00675-4017-10 ")
 ;;182
 ;;21,"00675-4019-07 ")
 ;;267
 ;;21,"00675-4019-10 ")
 ;;268
 ;;21,"00675-4019-12 ")
 ;;269
 ;;21,"00675-4020-07 ")
 ;;270
 ;;21,"00675-4020-10 ")
 ;;213
 ;;21,"00675-4020-12 ")
 ;;214
 ;;21,"00677-0341-01 ")
 ;;53
 ;;21,"00677-0498-01 ")
 ;;117
 ;;21,"00686-0112-09 ")
 ;;293
 ;;21,"00839-1545-06 ")
 ;;9
 ;;21,"00839-5100-06 ")
 ;;54
 ;;21,"00839-5100-16 ")
 ;;55
 ;;21,"00839-7056-65 ")
 ;;183
 ;;21,"00839-7664-92 ")
 ;;294
 ;;21,"00904-0193-60 ")
 ;;56
 ;;21,"00904-0193-61 ")
 ;;57
 ;;21,"00904-0193-70 ")
 ;;58
 ;;21,"00904-0193-80 ")
 ;;59
 ;;21,"00904-0195-60 ")
 ;;118
 ;;21,"00904-0195-61 ")
 ;;119
 ;;21,"00904-0195-70 ")
 ;;120
 ;;21,"00904-0195-80 ")
 ;;121
 ;;21,"00904-1751-12 ")
 ;;314
 ;;21,"00904-2344-40 ")
 ;;10
 ;;21,"00904-2344-60 ")
 ;;11
 ;;21,"00904-2695-15 ")
 ;;184
 ;;21,"00904-5240-80 ")
 ;;185
 ;;21,"00904-5241-80 ")
 ;;271
 ;;21,"00904-5242-80 ")
 ;;215
 ;;21,"00904-5384-12 ")
 ;;186
 ;;21,"00904-7896-60 ")
 ;;60
 ;;21,"00904-7896-80 ")
 ;;61
 ;;21,"10960-0040-16 ")
 ;;295
 ;;21,"10960-0040-32 ")
 ;;296
 ;;21,"11845-0288-04 ")
 ;;187
 ;;21,"11845-0289-01 ")
 ;;272
 ;;21,"11845-0289-04 ")
 ;;273
 ;;21,"11845-0290-01 ")
 ;;216
 ;;21,"11845-0290-04 ")
 ;;217
 ;;21,"12547-0170-27 ")
 ;;297
 ;;21,"12547-0175-19 ")
 ;;298
 ;;21,"19458-9055-01 ")
 ;;299
 ;;21,"23513-0607-24 ")
 ;;300
 ;;21,"23513-0607-48 ")
 ;;301
 ;;21,"34575-0990-09 ")
 ;;302
 ;;21,"35515-0951-08 ")
 ;;303
 ;;21,"38245-0609-14 ")
 ;;188
 ;;21,"47682-0835-50 ")
 ;;304
 ;;21,"49727-0054-05 ")
 ;;62
 ;;21,"49884-0096-01 ")
 ;;189
 ;;21,"49884-0096-05 ")
 ;;190
 ;;21,"49884-0096-10 ")
 ;;191
 ;;21,"49884-0098-01 ")
 ;;274
 ;;21,"49884-0098-05 ")
 ;;275
 ;;21,"49884-0098-10 ")
 ;;276
 ;;21,"49884-0099-01 ")
 ;;218
 ;;21,"49884-0099-05 ")
 ;;220
 ;;21,"49884-0099-10 ")
 ;;221
 ;;21,"49884-0118-01 ")
 ;;12
 ;;21,"49884-0118-05 ")
 ;;13
 ;;21,"49999-0081-20 ")
 ;;316
 ;;21,"50383-0039-04 ")
 ;;192
 ;;21,"51079-0118-20 ")
 ;;63
 ;;21,"51079-0119-20 ")
 ;;122
 ;;21,"51079-0565-17 ")
 ;;193
 ;;21,"51432-0917-03 ")
 ;;194
 ;;21,"51432-0917-06 ")
 ;;195
 ;;21,"51432-0918-03 ")
 ;;277
 ;;21,"51432-0918-06 ")
 ;;278
 ;;21,"51432-0919-03 ")
 ;;222
 ;;21,"51432-0919-06 ")
 ;;223
 ;;21,"51432-0954-18 ")
 ;;196
 ;;21,"51432-0955-18 ")
 ;;197
 ;;21,"51655-0216-25 ")
 ;;198
 ;;21,"51655-0217-25 ")
 ;;279
 ;;21,"51655-0512-87 ")
 ;;224
 ;;21,"51991-0085-90 ")
 ;;199
 ;;21,"52544-0794-01 ")
 ;;64
 ;;21,"52544-0794-10 ")
 ;;65
 ;;21,"52544-0795-01 ")
 ;;123
 ;;21,"52544-0795-10 ")
 ;;124
 ;;21,"52555-0096-01 ")
 ;;200
 ;;21,"52555-0096-10 ")
 ;;201
 ;;21,"52555-0098-01 ")
 ;;280
 ;;21,"52555-0098-10 ")
 ;;281
 ;;21,"52555-0099-01 ")
 ;;225
 ;;21,"52555-0099-10 ")
 ;;226
 ;;21,"52959-0168-30 ")
 ;;66
 ;;21,"52959-0221-20 ")
 ;;125
 ;;21,"52959-0221-30 ")
 ;;126
 ;;21,"52959-0390-30 ")
 ;;127
 ;;21,"53445-1637-00 ")
 ;;282
 ;;21,"53445-1638-00 ")
 ;;283
 ;;21,"53445-1639-01 ")
 ;;227
 ;;21,"53633-0096-01 ")
 ;;202
 ;;21,"53633-0096-10 ")
 ;;203
 ;;21,"53633-0096-11 ")
 ;;204
 ;;21,"53633-0098-01 ")
 ;;284
 ;;21,"53633-0098-10 ")
 ;;285
 ;;21,"53633-0098-11 ")
 ;;286
 ;;21,"53633-0099-01 ")
 ;;228
 ;;21,"53633-0099-10 ")
 ;;229
 ;;21,"53633-0099-11 ")
 ;;230
 ;;21,"54092-0073-01 ")
 ;;1
 ;;21,"54092-0074-01 ")
 ;;14
 ;;21,"54092-0074-05 ")
 ;;15
 ;;21,"54092-0074-52 ")
 ;;16
 ;;21,"54252-0110-01 ")
 ;;67
 ;;21,"54252-0111-01 ")
 ;;128
 ;;21,"54274-0416-50 ")
 ;;205
 ;;21,"54274-0417-10 ")
 ;;287
 ;;21,"54274-0417-50 ")
 ;;288
 ;;21,"54274-0418-10 ")
 ;;231
 ;;21,"54274-0418-50 ")
 ;;232
 ;;21,"54274-0940-09 ")
 ;;206
 ;;21,"54569-0417-00 ")
 ;;68
 ;;21,"54569-0417-02 ")
 ;;69
 ;;21,"54569-0417-03 ")
 ;;70
 ;;21,"54569-0417-04 ")
 ;;71
 ;;21,"54569-0417-06 ")
 ;;72
 ;;21,"54569-0417-07 ")
 ;;73
 ;;21,"54569-0418-00 ")
 ;;129
 ;;21,"54569-0419-00 ")
 ;;130
 ;;21,"54569-0419-02 ")
 ;;131
 ;;21,"54569-0419-04 ")
 ;;132
 ;;21,"54569-0419-07 ")
 ;;133
 ;;21,"54569-2046-00 ")
 ;;96
 ;;21,"54868-0033-07 ")
 ;;317
 ;;21,"54868-0067-00 ")
 ;;289
 ;;21,"54868-0392-01 ")
 ;;134
 ;;21,"54868-3146-00 ")
 ;;207
 ;;21,"54902-0073-01 ")
 ;;2
 ;;21,"54902-0074-01 ")
 ;;17
 ;;21,"54902-0074-05 ")
 ;;18
 ;;21,"54902-0074-52 ")
 ;;19
 ;;21,"55045-2031-08 ")
 ;;290
 ;;21,"55045-2032-08 ")
 ;;233
 ;;21,"55053-0290-12 ")
 ;;208
 ;;21,"55053-0525-30 ")
 ;;209
 ;;21,"55289-0095-17 ")
 ;;135
 ;;21,"55289-0095-20 ")
 ;;136
 ;;21,"55289-0095-30 ")
 ;;137
 ;;21,"55289-0095-60 ")
 ;;138
 ;;21,"55289-0923-20 ")
 ;;74
 ;;21,"55289-0923-30 ")
 ;;75
 ;;21,"55370-0854-07 ")
 ;;76
 ;;21,"55370-0854-09 ")
 ;;77
 ;;21,"55370-0879-07 ")
 ;;139
 ;;21,"55370-0879-09 ")
 ;;140
 ;;21,"55370-0926-07 ")
 ;;78
 ;;21,"55370-0926-09 ")
 ;;79
 ;;21,"55390-0066-10 ")
 ;;97
 ;;21,"55887-0909-10 ")
 ;;318
 ;;21,"55887-0909-15 ")
 ;;319
 ;;21,"55887-0909-20 ")
 ;;320
 ;;21,"55887-0909-30 ")
 ;;321
 ;;21,"55887-0909-60 ")
 ;;322
 ;;21,"55887-0909-90 ")
 ;;323
 ;;21,"55953-0555-80 ")
 ;;80
 ;;21,"57866-0170-01 ")
 ;;324
 ;;21,"57866-3367-03 ")
 ;;81
 ;;21,"57866-3377-04 ")
 ;;141
 ;;21,"57866-3388-07 ")
 ;;325
 ;;21,"58016-0702-12 ")
 ;;82
 ;;21,"58016-0702-30 ")
 ;;83
 ;;21,"58016-0703-00 ")
 ;;142
 ;;21,"58016-0703-12 ")
 ;;143
 ;;21,"58016-0703-30 ")
 ;;144
 ;;21,"58634-0027-02 ")
 ;;305
 ;;21,"58634-0027-04 ")
 ;;306
 ;;21,"58634-0027-08 ")
 ;;307
 ;;21,"58914-0012-10 ")
 ;;84
 ;;21,"58914-0013-10 ")
 ;;145
 ;;21,"58914-0015-16 ")
 ;;100
 ;;21,"58914-0080-52 ")
 ;;98
 ;;21,"59492-0117-21 ")
 ;;308
 ;;21,"59741-0315-15 ")
 ;;210
 ;;21,"60104-4008-02 ")
 ;;309
 ;;21,"60104-4008-08 ")
 ;;310
 ;;21,"60346-0838-30 ")
 ;;211
 ;;21,"60346-0839-30 ")
 ;;291
 ;;21,"60346-0840-30 ")
 ;;234
 ;;21,"60951-0615-70 ")
 ;;85
 ;;21,"60951-0615-90 ")
 ;;86
 ;;21,"60951-0616-70 ")
 ;;146
 ;;21,"60951-0616-90 ")
 ;;147
 ;;21,"61392-0041-30 ")
 ;;148
 ;;21,"61392-0041-31 ")
 ;;149
 ;;21,"61392-0041-32 ")
 ;;150
 ;;21,"61392-0041-39 ")
 ;;151
 ;;21,"61392-0041-45 ")
 ;;152
 ;;21,"61392-0041-51 ")
 ;;153
 ;;21,"61392-0041-54 ")
 ;;154
 ;;21,"61392-0041-56 ")
 ;;155
 ;;21,"61392-0041-60 ")
 ;;156
 ;;21,"61392-0041-90 ")
 ;;157
 ;;21,"61392-0041-91 ")
 ;;158
 ;;21,"62584-0873-01 ")
 ;;212
 ;;21,"62584-0874-01 ")
 ;;292
 ;;21,"63868-0751-24 ")
 ;;311
 ;;21,"64899-0097-24 ")
 ;;312
 ;;21,"66267-0074-30 ")
 ;;159
 ;;21,"68115-0106-20 ")
 ;;87
 ;;21,"68115-0106-30 ")
 ;;88
 ;;21,"68115-0106-60 ")
 ;;89
 ;;21,"68115-0107-30 ")
 ;;160
 ;;21,"97807-0070-93 ")
 ;;313
 ;;9002226,627,.01)
 ;;BGP HEDIS GASTRO ANTISPASM NDC
 ;;9002226,627,.02)
 ;;@
 ;;9002226,627,.04)
 ;;n
 ;;9002226,627,.06)
 ;;@
 ;;9002226,627,.08)
 ;;@
 ;;9002226,627,.09)
 ;;@
 ;;9002226,627,.11)
 ;;@
 ;;9002226,627,.12)
 ;;@
 ;;9002226,627,.13)
 ;;1
 ;;9002226,627,.14)
 ;;@
 ;;9002226,627,.15)
 ;;@
 ;;9002226,627,.16)
 ;;@
 ;;9002226,627,.17)
 ;;@
 ;;9002226,627,3101)
 ;;@
 ;;9002226.02101,"627,00054-4721-25 ",.01)
 ;;00054-4721-25
 ;;9002226.02101,"627,00054-4721-25 ",.02)
 ;;00054-4721-25
 ;;9002226.02101,"627,00054-4721-31 ",.01)
 ;;00054-4721-31
 ;;9002226.02101,"627,00054-4721-31 ",.02)
 ;;00054-4721-31
 ;;9002226.02101,"627,00054-8737-25 ",.01)
 ;;00054-8737-25
 ;;9002226.02101,"627,00054-8737-25 ",.02)
 ;;00054-8737-25
 ;;9002226.02101,"627,00054-8849-25 ",.01)
 ;;00054-8849-25
 ;;9002226.02101,"627,00054-8849-25 ",.02)
 ;;00054-8849-25
 ;;9002226.02101,"627,00054-8850-25 ",.01)
 ;;00054-8850-25
 ;;9002226.02101,"627,00054-8850-25 ",.02)
 ;;00054-8850-25
 ;;9002226.02101,"627,00054-8851-25 ",.01)
 ;;00054-8851-25
 ;;9002226.02101,"627,00054-8851-25 ",.02)
 ;;00054-8851-25
 ;;9002226.02101,"627,00054-8852-25 ",.01)
 ;;00054-8852-25
 ;;9002226.02101,"627,00054-8852-25 ",.02)
 ;;00054-8852-25
 ;;9002226.02101,"627,00068-0120-61 ",.01)
 ;;00068-0120-61
 ;;9002226.02101,"627,00068-0120-61 ",.02)
 ;;00068-0120-61
 ;;9002226.02101,"627,00068-0123-61 ",.01)
 ;;00068-0123-61
 ;;9002226.02101,"627,00068-0123-61 ",.02)
 ;;00068-0123-61
 ;;9002226.02101,"627,00068-0125-16 ",.01)
 ;;00068-0125-16
 ;;9002226.02101,"627,00068-0125-16 ",.02)
 ;;00068-0125-16
 ;;9002226.02101,"627,00068-0809-23 ",.01)
 ;;00068-0809-23
 ;;9002226.02101,"627,00068-0809-23 ",.02)
 ;;00068-0809-23
 ;;9002226.02101,"627,00068-0810-61 ",.01)
 ;;00068-0810-61
 ;;9002226.02101,"627,00068-0810-61 ",.02)
 ;;00068-0810-61
 ;;9002226.02101,"627,00078-0002-65 ",.01)
 ;;00078-0002-65
 ;;9002226.02101,"627,00078-0002-65 ",.02)
 ;;00078-0002-65
 ;;9002226.02101,"627,00078-0003-65 ",.01)
 ;;00078-0003-65
 ;;9002226.02101,"627,00078-0003-65 ",.02)
 ;;00078-0003-65
 ;;9002226.02101,"627,00078-0004-65 ",.01)
 ;;00078-0004-65
 ;;9002226.02101,"627,00078-0004-65 ",.02)
 ;;00078-0004-65
 ;;9002226.02101,"627,00115-3200-01 ",.01)
 ;;00115-3200-01
 ;
OTHER ; OTHER ROUTINES
 D ^BGP7LXJB
 D ^BGP7LXJC
 D ^BGP7LXJD
 Q