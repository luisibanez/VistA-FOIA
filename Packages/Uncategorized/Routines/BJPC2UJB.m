BJPC2UJB ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON FEB 17, 2009;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"00089-0345-10 ")
 ;;152
 ;;21,"00089-0345-25 ")
 ;;153
 ;;21,"00089-0347-10 ")
 ;;154
 ;;21,"00089-0347-25 ")
 ;;155
 ;;21,"00093-0588-01 ")
 ;;156
 ;;21,"00093-0588-05 ")
 ;;157
 ;;21,"00093-0589-01 ")
 ;;158
 ;;21,"00093-0589-05 ")
 ;;159
 ;;21,"00093-0599-01 ")
 ;;160
 ;;21,"00093-0934-01 ")
 ;;161
 ;;21,"00093-0936-01 ")
 ;;162
 ;;21,"00093-0938-01 ")
 ;;163
 ;;21,"00093-0940-01 ")
 ;;164
 ;;21,"00102-3460-01 ")
 ;;165
 ;;21,"00102-3465-01 ")
 ;;166
 ;;21,"00102-3470-01 ")
 ;;167
 ;;21,"00131-4146-37 ")
 ;;168
 ;;21,"00131-4247-37 ")
 ;;169
 ;;21,"00131-4247-43 ")
 ;;170
 ;;21,"00131-4248-37 ")
 ;;171
 ;;21,"00131-4248-43 ")
 ;;172
 ;;21,"00143-1689-25 ")
 ;;173
 ;;21,"00143-1690-25 ")
 ;;174
 ;;21,"00157-0222-01 ")
 ;;175
 ;;21,"00157-0222-05 ")
 ;;176
 ;;21,"00172-6406-49 ")
 ;;177
 ;;21,"00172-6406-59 ")
 ;;178
 ;;21,"00173-0268-12 ")
 ;;179
 ;;21,"00173-0268-14 ")
 ;;180
 ;;21,"00173-0268-17 ")
 ;;181
 ;;21,"00173-0295-12 ")
 ;;182
 ;;21,"00173-0295-14 ")
 ;;183
 ;;21,"00173-0295-17 ")
 ;;184
 ;;21,"00173-0520-00 ")
 ;;185
 ;;21,"00173-0521-00 ")
 ;;186
 ;;21,"00182-1311-01 ")
 ;;187
 ;;21,"00182-1312-01 ")
 ;;188
 ;;21,"00182-1313-01 ")
 ;;189
 ;;21,"00182-1314-01 ")
 ;;190
 ;;21,"00182-1397-01 ")
 ;;191
 ;;21,"00182-1397-10 ")
 ;;192
 ;;21,"00182-1400-00 ")
 ;;193
 ;;21,"00182-1400-01 ")
 ;;194
 ;;21,"00182-1400-05 ")
 ;;195
 ;;21,"00182-1400-10 ")
 ;;196
 ;;21,"00182-1400-89 ")
 ;;197
 ;;21,"00182-1589-00 ")
 ;;198
 ;;21,"00182-1589-01 ")
 ;;199
 ;;21,"00182-1589-89 ")
 ;;200
 ;;21,"00182-1590-00 ")
 ;;201
 ;;21,"00182-1590-01 ")
 ;;202
 ;;21,"00182-1590-10 ")
 ;;203
 ;;21,"00182-1590-89 ")
 ;;204
 ;;21,"00182-1941-01 ")
 ;;205
 ;;21,"00185-5793-01 ")
 ;;206
 ;;21,"00185-5793-10 ")
 ;;207
 ;;21,"00228-2421-10 ")
 ;;208
 ;;21,"00228-2423-10 ")
 ;;209
 ;;21,"00228-2425-10 ")
 ;;210
 ;;21,"00245-0151-01 ")
 ;;211
 ;;21,"00245-0151-10 ")
 ;;212
 ;;21,"00245-0151-11 ")
 ;;213
 ;;21,"00245-0152-01 ")
 ;;214
 ;;21,"00245-0152-10 ")
 ;;215
 ;;21,"00245-0152-11 ")
 ;;216
 ;;21,"00247-0667-08 ")
 ;;217
 ;;21,"00247-0674-41 ")
 ;;218
 ;;21,"00256-0114-01 ")
 ;;219
 ;;21,"00256-0114-02 ")
 ;;220
 ;;21,"00256-0115-01 ")
 ;;221
 ;;21,"00256-0115-02 ")
 ;;222
 ;;21,"00258-3581-01 ")
 ;;223
 ;;21,"00258-3581-05 ")
 ;;224
 ;;21,"00258-3581-10 ")
 ;;225
 ;;21,"00258-3583-01 ")
 ;;226
 ;;21,"00258-3583-05 ")
 ;;227
 ;;21,"00258-3583-10 ")
 ;;228
 ;;21,"00258-3584-01 ")
 ;;229
 ;;21,"00258-3584-05 ")
 ;;230
 ;;21,"00258-3584-10 ")
 ;;231
 ;;21,"00258-3614-01 ")
 ;;232
 ;;21,"00258-3625-01 ")
 ;;233
 ;;21,"00258-3634-01 ")
 ;;234
 ;;21,"00258-3637-01 ")
 ;;235
 ;;21,"00258-3638-01 ")
 ;;236
 ;;21,"00277-0157-01 ")
 ;;237
 ;;21,"00277-0157-02 ")
 ;;238
 ;;21,"00277-0161-01 ")
 ;;239
 ;;21,"00277-0161-02 ")
 ;;240
 ;;21,"00277-0167-01 ")
 ;;241
 ;;21,"00277-0167-02 ")
 ;;242
 ;;21,"00281-0168-53 ")
 ;;243
 ;;21,"00281-0169-53 ")
 ;;244
 ;;21,"00281-0169-56 ")
 ;;245
 ;;21,"00281-0169-57 ")
 ;;246
 ;;21,"00281-0170-53 ")
 ;;247
 ;;21,"00281-0170-56 ")
 ;;248
 ;;21,"00281-0170-57 ")
 ;;249
 ;;21,"00302-7020-01 ")
 ;;250
 ;;21,"00302-7020-05 ")
 ;;251
 ;;21,"00302-7022-01 ")
 ;;252
 ;;21,"00302-7022-05 ")
 ;;253
 ;;21,"00302-7024-01 ")
 ;;254
 ;;21,"00302-7024-05 ")
 ;;255
 ;;21,"00304-0962-00 ")
 ;;256
 ;;21,"00304-0962-01 ")
 ;;257
 ;;21,"00304-0962-05 ")
 ;;258
 ;;21,"00304-1093-01 ")
 ;;259
 ;;21,"00304-1093-05 ")
 ;;260
 ;;21,"00304-1094-00 ")
 ;;261
 ;;21,"00304-1094-01 ")
 ;;262
 ;;21,"00304-1094-05 ")
 ;;263
 ;;21,"00304-1956-01 ")
 ;;264
 ;;21,"00339-5699-12 ")
 ;;265
 ;;21,"00349-8266-01 ")
 ;;266
 ;;21,"00349-8266-05 ")
 ;;267
 ;;21,"00349-8266-10 ")
 ;;268
 ;;21,"00349-8280-01 ")
 ;;269
 ;;21,"00349-8281-01 ")
 ;;270
 ;;21,"00349-8281-05 ")
 ;;271
 ;;21,"00349-8281-10 ")
 ;;272
 ;;21,"00349-8683-01 ")
 ;;273
 ;;21,"00349-8684-01 ")
 ;;274
 ;;21,"00349-8684-05 ")
 ;;275
 ;;21,"00349-8684-10 ")
 ;;276
 ;;21,"00349-8685-01 ")
 ;;277
 ;;21,"00349-8685-05 ")
 ;;278
 ;;21,"00349-8685-10 ")
 ;;279
 ;;21,"00364-0597-01 ")
 ;;280
 ;;21,"00364-0597-02 ")
 ;;281
 ;;21,"00364-0660-01 ")
 ;;282
 ;;21,"00364-0660-02 ")
 ;;283
 ;;21,"00364-0660-05 ")
 ;;284
 ;;21,"00364-0680-01 ")
 ;;285
 ;;21,"00364-0681-01 ")
 ;;286
 ;;21,"00364-0681-05 ")
 ;;287
 ;;21,"00364-2490-01 ")
 ;;288
 ;;21,"00364-2585-01 ")
 ;;289
 ;;21,"00364-2586-01 ")
 ;;290
 ;;21,"00364-2587-01 ")
 ;;291
 ;;21,"00364-2588-01 ")
 ;;292
 ;;21,"00369-0812-01 ")
 ;;293
 ;;21,"00369-0820-01 ")
 ;;294
 ;;21,"00369-0850-01 ")
 ;;295
 ;;21,"00369-0875-01 ")
 ;;296
 ;;21,"00405-4983-01 ")
 ;;297
 ;;21,"00405-4984-01 ")
 ;;298
 ;;21,"00405-4985-01 ")
 ;;299
 ;;21,"00405-4986-01 ")
 ;;300
 ;;21,"00405-4987-01 ")
 ;;301
 ;;21,"00405-4987-02 ")
 ;;302
 ;;21,"00405-4988-01 ")
 ;;303
 ;;21,"00405-4988-02 ")
 ;;304
