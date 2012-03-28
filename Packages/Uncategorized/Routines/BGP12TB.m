BGP12TB ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"17236-0335-01 ")
 ;;124
 ;;21,"23490-7355-01 ")
 ;;210
 ;;21,"24839-0226-01 ")
 ;;17
 ;;21,"24839-0227-16 ")
 ;;20
 ;;21,"29033-0001-01 ")
 ;;142
 ;;21,"29033-0002-01 ")
 ;;143
 ;;21,"35356-0126-60 ")
 ;;144
 ;;21,"38130-0012-01 ")
 ;;28
 ;;21,"45985-0633-08 ")
 ;;19
 ;;21,"45985-0647-01 ")
 ;;18
 ;;21,"46672-0614-16 ")
 ;;27
 ;;21,"49708-0644-90 ")
 ;;44
 ;;21,"49999-0550-00 ")
 ;;11
 ;;21,"49999-0921-30 ")
 ;;145
 ;;21,"50111-0459-01 ")
 ;;146
 ;;21,"50111-0459-02 ")
 ;;147
 ;;21,"50111-0459-03 ")
 ;;148
 ;;21,"50111-0482-01 ")
 ;;149
 ;;21,"50111-0482-02 ")
 ;;150
 ;;21,"50111-0482-03 ")
 ;;151
 ;;21,"50111-0483-01 ")
 ;;152
 ;;21,"50111-0483-02 ")
 ;;153
 ;;21,"50111-0518-01 ")
 ;;154
 ;;21,"50242-0040-62 ")
 ;;291
 ;;21,"50383-0806-16 ")
 ;;38
 ;;21,"50474-0100-01 ")
 ;;62
 ;;21,"50474-0200-01 ")
 ;;63
 ;;21,"50474-0200-50 ")
 ;;64
 ;;21,"50474-0300-01 ")
 ;;65
 ;;21,"50474-0300-50 ")
 ;;66
 ;;21,"50474-0400-01 ")
 ;;67
 ;;21,"50991-0200-16 ")
 ;;21
 ;;21,"50991-0214-16 ")
 ;;23
 ;;21,"50991-0400-01 ")
 ;;22
 ;;21,"50991-0413-01 ")
 ;;24
 ;;21,"51991-0536-01 ")
 ;;35
 ;;21,"52959-0279-30 ")
 ;;211
 ;;21,"53265-0380-10 ")
 ;;212
 ;;21,"53265-0380-50 ")
 ;;213
 ;;21,"53265-0382-10 ")
 ;;214
 ;;21,"54569-0062-02 ")
 ;;115
 ;;21,"54569-0065-01 ")
 ;;215
 ;;21,"54569-0065-02 ")
 ;;216
 ;;21,"54569-0065-05 ")
 ;;217
 ;;21,"54569-0318-01 ")
 ;;116
 ;;21,"54569-1666-00 ")
 ;;68
 ;;21,"54569-8580-00 ")
 ;;117
 ;;21,"54569-8586-00 ")
 ;;118
 ;;21,"54838-0513-80 ")
 ;;32
 ;;21,"54839-0513-80 ")
 ;;33
 ;;21,"54868-0028-00 ")
 ;;218
 ;;21,"54868-0028-01 ")
 ;;219
 ;;21,"54868-0028-02 ")
 ;;220
 ;;21,"54868-0028-03 ")
 ;;221
 ;;21,"54868-0028-05 ")
 ;;222
 ;;21,"54868-0028-06 ")
 ;;223
 ;;21,"54868-0029-00 ")
 ;;224
 ;;21,"54868-0029-02 ")
 ;;225
 ;;21,"54868-0029-03 ")
 ;;226
 ;;21,"54868-0029-05 ")
 ;;227
 ;;21,"54868-0029-06 ")
 ;;228
 ;;21,"54868-0029-07 ")
 ;;229
 ;;21,"54868-1438-00 ")
 ;;285
 ;;21,"54868-1438-01 ")
 ;;286
 ;;21,"54868-1461-01 ")
 ;;230
 ;;21,"54868-1461-02 ")
 ;;231
 ;;21,"54868-2710-00 ")
 ;;69
 ;;21,"54868-2710-01 ")
 ;;70
 ;;21,"54868-5531-00 ")
 ;;232
 ;;21,"54868-5531-01 ")
 ;;233
 ;;21,"55045-3768-08 ")
 ;;234
 ;;21,"55289-0003-60 ")
 ;;119
 ;;21,"55289-0155-97 ")
 ;;120
 ;;21,"55289-0259-01 ")
 ;;155
 ;;21,"55289-0259-30 ")
 ;;156
 ;;21,"55289-0259-60 ")
 ;;157
 ;;21,"55289-0260-01 ")
 ;;158
 ;;21,"55289-0260-06 ")
 ;;159
 ;;21,"55289-0260-20 ")
 ;;160
 ;;21,"55289-0260-30 ")
 ;;161
 ;;21,"55289-0260-60 ")
 ;;162
 ;;21,"55289-0789-30 ")
 ;;287
 ;;21,"55422-0814-16 ")
 ;;48
 ;;21,"55887-0079-60 ")
 ;;163
 ;;21,"55887-0277-30 ")
 ;;164
 ;;21,"55887-0847-60 ")
 ;;165
 ;;21,"55887-0847-90 ")
 ;;166
 ;;21,"57866-4651-02 ")
 ;;235
 ;;21,"57866-4652-02 ")
 ;;236
 ;;21,"59243-0021-10 ")
 ;;15
 ;;21,"60258-0335-16 ")
 ;;41
 ;;21,"60258-0336-01 ")
 ;;34
 ;;21,"60258-0371-16 ")
 ;;29
 ;;21,"61392-0016-30 ")
 ;;237
 ;;21,"61392-0016-45 ")
 ;;238
 ;;21,"61392-0016-51 ")
 ;;239
 ;;21,"61392-0016-54 ")
 ;;240
 ;;21,"61392-0016-56 ")
 ;;241
 ;;21,"61392-0016-60 ")
 ;;242
 ;;21,"61392-0016-90 ")
 ;;243
 ;;21,"61392-0016-91 ")
 ;;244
 ;;21,"61392-0017-30 ")
 ;;245
 ;;21,"61392-0017-51 ")
 ;;246
 ;;21,"61392-0017-54 ")
 ;;247
 ;;21,"61392-0017-56 ")
 ;;248
 ;;21,"61392-0017-60 ")
 ;;249
 ;;21,"61392-0017-90 ")
 ;;250
 ;;21,"61392-0017-91 ")
 ;;251
 ;;21,"61570-0019-01 ")
 ;;61
 ;;21,"61570-0020-01 ")
 ;;60
 ;;21,"61570-0022-01 ")
 ;;59
 ;;21,"63629-2792-01 ")
 ;;252
 ;;21,"63629-2792-02 ")
 ;;253
 ;;21,"63629-3551-01 ")
 ;;254
 ;;21,"63874-0443-01 ")
 ;;255
 ;;21,"63874-0443-15 ")
 ;;256
 ;;21,"63874-0443-20 ")
 ;;257
 ;;21,"63874-0443-30 ")
 ;;258
 ;;21,"63874-0447-01 ")
 ;;259
 ;;21,"63874-0447-15 ")
 ;;260
 ;;21,"63874-0447-20 ")
 ;;261
 ;;21,"63874-0447-30 ")
 ;;262
 ;;21,"63874-0447-60 ")
 ;;263
 ;;21,"63874-0675-01 ")
 ;;264
 ;;21,"63874-0675-15 ")
 ;;265
 ;;21,"63874-0675-20 ")
 ;;266
 ;;21,"63874-0675-30 ")
 ;;267
 ;;21,"63874-0744-12 ")
 ;;125
 ;;21,"63874-0744-24 ")
 ;;126
 ;;21,"64661-0814-16 ")
 ;;49
 ;;21,"65162-0324-10 ")
 ;;268
 ;;21,"65162-0324-11 ")
 ;;269
 ;;21,"65162-0325-10 ")
 ;;270
 ;;21,"65162-0325-11 ")
 ;;271
 ;;21,"65162-0335-10 ")
 ;;272
 ;;21,"66336-0596-30 ")
 ;;273
 ;;21,"67781-0251-01 ")
 ;;288
 ;;21,"67781-0251-05 ")
 ;;289
 ;;21,"67781-0252-01 ")
 ;;290
 ;;21,"68115-0328-60 ")
 ;;274
 ;;21,"68462-0356-01 ")
 ;;167
 ;;21,"68462-0380-01 ")
 ;;168
 ;;9002226,801,.01)
 ;;BGP HEDIS ASTHMA NDC
 ;;9002226,801,.02)
 ;;@
 ;;9002226,801,.04)
 ;;n
 ;;9002226,801,.06)
 ;;@
 ;;9002226,801,.08)
 ;;@
 ;;9002226,801,.09)
 ;;3080528
 ;;9002226,801,.11)
 ;;@
 ;;9002226,801,.12)
 ;;@
 ;;9002226,801,.13)
 ;;1
 ;;9002226,801,.14)
 ;;@
 ;;9002226,801,.15)
 ;;@
 ;;9002226,801,.16)
 ;;@
 ;;9002226,801,.17)
 ;;@
