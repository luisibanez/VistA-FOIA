BGPM5ARS ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON AUG 16, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1005,58016088726 ",.02)
 ;;58016088726
 ;;9002226.02101,"1005,58016088727 ",.01)
 ;;58016088727
 ;;9002226.02101,"1005,58016088727 ",.02)
 ;;58016088727
 ;;9002226.02101,"1005,58016088728 ",.01)
 ;;58016088728
 ;;9002226.02101,"1005,58016088728 ",.02)
 ;;58016088728
 ;;9002226.02101,"1005,58016088730 ",.01)
 ;;58016088730
 ;;9002226.02101,"1005,58016088730 ",.02)
 ;;58016088730
 ;;9002226.02101,"1005,58016088732 ",.01)
 ;;58016088732
 ;;9002226.02101,"1005,58016088732 ",.02)
 ;;58016088732
 ;;9002226.02101,"1005,58016088735 ",.01)
 ;;58016088735
 ;;9002226.02101,"1005,58016088735 ",.02)
 ;;58016088735
 ;;9002226.02101,"1005,58016088736 ",.01)
 ;;58016088736
 ;;9002226.02101,"1005,58016088736 ",.02)
 ;;58016088736
 ;;9002226.02101,"1005,58016088740 ",.01)
 ;;58016088740
 ;;9002226.02101,"1005,58016088740 ",.02)
 ;;58016088740
 ;;9002226.02101,"1005,58016088742 ",.01)
 ;;58016088742
 ;;9002226.02101,"1005,58016088742 ",.02)
 ;;58016088742
 ;;9002226.02101,"1005,58016088744 ",.01)
 ;;58016088744
 ;;9002226.02101,"1005,58016088744 ",.02)
 ;;58016088744
 ;;9002226.02101,"1005,58016088745 ",.01)
 ;;58016088745
 ;;9002226.02101,"1005,58016088745 ",.02)
 ;;58016088745
 ;;9002226.02101,"1005,58016088748 ",.01)
 ;;58016088748
 ;;9002226.02101,"1005,58016088748 ",.02)
 ;;58016088748
 ;;9002226.02101,"1005,58016088750 ",.01)
 ;;58016088750
 ;;9002226.02101,"1005,58016088750 ",.02)
 ;;58016088750
 ;;9002226.02101,"1005,58016088756 ",.01)
 ;;58016088756
 ;;9002226.02101,"1005,58016088756 ",.02)
 ;;58016088756
 ;;9002226.02101,"1005,58016088760 ",.01)
 ;;58016088760
 ;;9002226.02101,"1005,58016088760 ",.02)
 ;;58016088760
 ;;9002226.02101,"1005,58016088767 ",.01)
 ;;58016088767
 ;;9002226.02101,"1005,58016088767 ",.02)
 ;;58016088767
 ;;9002226.02101,"1005,58016088769 ",.01)
 ;;58016088769
 ;;9002226.02101,"1005,58016088769 ",.02)
 ;;58016088769
 ;;9002226.02101,"1005,58016088770 ",.01)
 ;;58016088770
 ;;9002226.02101,"1005,58016088770 ",.02)
 ;;58016088770
 ;;9002226.02101,"1005,58016088771 ",.01)
 ;;58016088771
 ;;9002226.02101,"1005,58016088771 ",.02)
 ;;58016088771
 ;;9002226.02101,"1005,58016088772 ",.01)
 ;;58016088772
 ;;9002226.02101,"1005,58016088772 ",.02)
 ;;58016088772
 ;;9002226.02101,"1005,58016088773 ",.01)
 ;;58016088773
 ;;9002226.02101,"1005,58016088773 ",.02)
 ;;58016088773
 ;;9002226.02101,"1005,58016088775 ",.01)
 ;;58016088775
 ;;9002226.02101,"1005,58016088775 ",.02)
 ;;58016088775
 ;;9002226.02101,"1005,58016088776 ",.01)
 ;;58016088776
 ;;9002226.02101,"1005,58016088776 ",.02)
 ;;58016088776
 ;;9002226.02101,"1005,58016088777 ",.01)
 ;;58016088777
 ;;9002226.02101,"1005,58016088777 ",.02)
 ;;58016088777
 ;;9002226.02101,"1005,58016088779 ",.01)
 ;;58016088779
 ;;9002226.02101,"1005,58016088779 ",.02)
 ;;58016088779
 ;;9002226.02101,"1005,58016088780 ",.01)
 ;;58016088780
 ;;9002226.02101,"1005,58016088780 ",.02)
 ;;58016088780
 ;;9002226.02101,"1005,58016088781 ",.01)
 ;;58016088781
 ;;9002226.02101,"1005,58016088781 ",.02)
 ;;58016088781
 ;;9002226.02101,"1005,58016088782 ",.01)
 ;;58016088782
 ;;9002226.02101,"1005,58016088782 ",.02)
 ;;58016088782
 ;;9002226.02101,"1005,58016088783 ",.01)
 ;;58016088783
 ;;9002226.02101,"1005,58016088783 ",.02)
 ;;58016088783
 ;;9002226.02101,"1005,58016088784 ",.01)
 ;;58016088784
 ;;9002226.02101,"1005,58016088784 ",.02)
 ;;58016088784
 ;;9002226.02101,"1005,58016088787 ",.01)
 ;;58016088787
 ;;9002226.02101,"1005,58016088787 ",.02)
 ;;58016088787
 ;;9002226.02101,"1005,58016088789 ",.01)
 ;;58016088789
 ;;9002226.02101,"1005,58016088789 ",.02)
 ;;58016088789
 ;;9002226.02101,"1005,58016088790 ",.01)
 ;;58016088790
 ;;9002226.02101,"1005,58016088790 ",.02)
 ;;58016088790
 ;;9002226.02101,"1005,58016088791 ",.01)
 ;;58016088791
 ;;9002226.02101,"1005,58016088791 ",.02)
 ;;58016088791
 ;;9002226.02101,"1005,58016088792 ",.01)
 ;;58016088792
 ;;9002226.02101,"1005,58016088792 ",.02)
 ;;58016088792
 ;;9002226.02101,"1005,58016088793 ",.01)
 ;;58016088793
 ;;9002226.02101,"1005,58016088793 ",.02)
 ;;58016088793
 ;;9002226.02101,"1005,58016088796 ",.01)
 ;;58016088796
 ;;9002226.02101,"1005,58016088796 ",.02)
 ;;58016088796
 ;;9002226.02101,"1005,58016088797 ",.01)
 ;;58016088797
 ;;9002226.02101,"1005,58016088797 ",.02)
 ;;58016088797
 ;;9002226.02101,"1005,58016088798 ",.01)
 ;;58016088798
 ;;9002226.02101,"1005,58016088798 ",.02)
 ;;58016088798
 ;;9002226.02101,"1005,58016088799 ",.01)
 ;;58016088799
 ;;9002226.02101,"1005,58016088799 ",.02)
 ;;58016088799
 ;;9002226.02101,"1005,58016089200 ",.01)
 ;;58016089200
 ;;9002226.02101,"1005,58016089200 ",.02)
 ;;58016089200
 ;;9002226.02101,"1005,58016089201 ",.01)
 ;;58016089201
 ;;9002226.02101,"1005,58016089201 ",.02)
 ;;58016089201
 ;;9002226.02101,"1005,58016089202 ",.01)
 ;;58016089202
 ;;9002226.02101,"1005,58016089202 ",.02)
 ;;58016089202
 ;;9002226.02101,"1005,58016089203 ",.01)
 ;;58016089203
 ;;9002226.02101,"1005,58016089203 ",.02)
 ;;58016089203
 ;;9002226.02101,"1005,58016089204 ",.01)
 ;;58016089204
 ;;9002226.02101,"1005,58016089204 ",.02)
 ;;58016089204
 ;;9002226.02101,"1005,58016089205 ",.01)
 ;;58016089205
 ;;9002226.02101,"1005,58016089205 ",.02)
 ;;58016089205
 ;;9002226.02101,"1005,58016089206 ",.01)
 ;;58016089206
 ;;9002226.02101,"1005,58016089206 ",.02)
 ;;58016089206
 ;;9002226.02101,"1005,58016089207 ",.01)
 ;;58016089207
 ;;9002226.02101,"1005,58016089207 ",.02)
 ;;58016089207
 ;;9002226.02101,"1005,58016089208 ",.01)
 ;;58016089208
 ;;9002226.02101,"1005,58016089208 ",.02)
 ;;58016089208
 ;;9002226.02101,"1005,58016089209 ",.01)
 ;;58016089209
 ;;9002226.02101,"1005,58016089209 ",.02)
 ;;58016089209
 ;;9002226.02101,"1005,58016089210 ",.01)
 ;;58016089210
 ;;9002226.02101,"1005,58016089210 ",.02)
 ;;58016089210
 ;;9002226.02101,"1005,58016089212 ",.01)
 ;;58016089212
 ;;9002226.02101,"1005,58016089212 ",.02)
 ;;58016089212
 ;;9002226.02101,"1005,58016089214 ",.01)
 ;;58016089214
 ;;9002226.02101,"1005,58016089214 ",.02)
 ;;58016089214
 ;;9002226.02101,"1005,58016089215 ",.01)
 ;;58016089215
 ;;9002226.02101,"1005,58016089215 ",.02)
 ;;58016089215
 ;;9002226.02101,"1005,58016089216 ",.01)
 ;;58016089216
 ;;9002226.02101,"1005,58016089216 ",.02)
 ;;58016089216
 ;;9002226.02101,"1005,58016089218 ",.01)
 ;;58016089218
 ;;9002226.02101,"1005,58016089218 ",.02)
 ;;58016089218
 ;;9002226.02101,"1005,58016089221 ",.01)
 ;;58016089221
 ;;9002226.02101,"1005,58016089221 ",.02)
 ;;58016089221
 ;;9002226.02101,"1005,58016089224 ",.01)
 ;;58016089224
 ;;9002226.02101,"1005,58016089224 ",.02)
 ;;58016089224
 ;;9002226.02101,"1005,58016089225 ",.01)
 ;;58016089225
 ;;9002226.02101,"1005,58016089225 ",.02)
 ;;58016089225
 ;;9002226.02101,"1005,58016089226 ",.01)
 ;;58016089226
 ;;9002226.02101,"1005,58016089226 ",.02)
 ;;58016089226
 ;;9002226.02101,"1005,58016089227 ",.01)
 ;;58016089227
 ;;9002226.02101,"1005,58016089227 ",.02)
 ;;58016089227
 ;;9002226.02101,"1005,58016089228 ",.01)
 ;;58016089228
 ;;9002226.02101,"1005,58016089228 ",.02)
 ;;58016089228
 ;;9002226.02101,"1005,58016089230 ",.01)
 ;;58016089230
 ;;9002226.02101,"1005,58016089230 ",.02)
 ;;58016089230
 ;;9002226.02101,"1005,58016089232 ",.01)
 ;;58016089232
 ;;9002226.02101,"1005,58016089232 ",.02)
 ;;58016089232
 ;;9002226.02101,"1005,58016089235 ",.01)
 ;;58016089235
 ;;9002226.02101,"1005,58016089235 ",.02)
 ;;58016089235
 ;;9002226.02101,"1005,58016089236 ",.01)
 ;;58016089236
 ;;9002226.02101,"1005,58016089236 ",.02)
 ;;58016089236
 ;;9002226.02101,"1005,58016089240 ",.01)
 ;;58016089240
 ;;9002226.02101,"1005,58016089240 ",.02)
 ;;58016089240
 ;;9002226.02101,"1005,58016089242 ",.01)
 ;;58016089242
 ;;9002226.02101,"1005,58016089242 ",.02)
 ;;58016089242
 ;;9002226.02101,"1005,58016089244 ",.01)
 ;;58016089244
 ;;9002226.02101,"1005,58016089244 ",.02)
 ;;58016089244
 ;;9002226.02101,"1005,58016089245 ",.01)
 ;;58016089245
 ;;9002226.02101,"1005,58016089245 ",.02)
 ;;58016089245
 ;;9002226.02101,"1005,58016089248 ",.01)
 ;;58016089248
 ;;9002226.02101,"1005,58016089248 ",.02)
 ;;58016089248
 ;;9002226.02101,"1005,58016089250 ",.01)
 ;;58016089250
 ;;9002226.02101,"1005,58016089250 ",.02)
 ;;58016089250
 ;;9002226.02101,"1005,58016089256 ",.01)
 ;;58016089256
 ;;9002226.02101,"1005,58016089256 ",.02)
 ;;58016089256
 ;;9002226.02101,"1005,58016089260 ",.01)
 ;;58016089260
 ;;9002226.02101,"1005,58016089260 ",.02)
 ;;58016089260
 ;;9002226.02101,"1005,58016089267 ",.01)
 ;;58016089267
 ;;9002226.02101,"1005,58016089267 ",.02)
 ;;58016089267
 ;;9002226.02101,"1005,58016089269 ",.01)
 ;;58016089269
 ;;9002226.02101,"1005,58016089269 ",.02)
 ;;58016089269
 ;;9002226.02101,"1005,58016089270 ",.01)
 ;;58016089270
 ;;9002226.02101,"1005,58016089270 ",.02)
 ;;58016089270
 ;;9002226.02101,"1005,58016089271 ",.01)
 ;;58016089271
 ;;9002226.02101,"1005,58016089271 ",.02)
 ;;58016089271
 ;;9002226.02101,"1005,58016089272 ",.01)
 ;;58016089272
 ;;9002226.02101,"1005,58016089272 ",.02)
 ;;58016089272
 ;;9002226.02101,"1005,58016089273 ",.01)
 ;;58016089273
 ;;9002226.02101,"1005,58016089273 ",.02)
 ;;58016089273
 ;;9002226.02101,"1005,58016089275 ",.01)
 ;;58016089275
 ;;9002226.02101,"1005,58016089275 ",.02)
 ;;58016089275
 ;;9002226.02101,"1005,58016089276 ",.01)
 ;;58016089276
 ;;9002226.02101,"1005,58016089276 ",.02)
 ;;58016089276
 ;;9002226.02101,"1005,58016089277 ",.01)
 ;;58016089277
 ;;9002226.02101,"1005,58016089277 ",.02)
 ;;58016089277
 ;;9002226.02101,"1005,58016089279 ",.01)
 ;;58016089279
 ;;9002226.02101,"1005,58016089279 ",.02)
 ;;58016089279
 ;;9002226.02101,"1005,58016089280 ",.01)
 ;;58016089280
 ;;9002226.02101,"1005,58016089280 ",.02)
 ;;58016089280
 ;;9002226.02101,"1005,58016089281 ",.01)
 ;;58016089281
 ;;9002226.02101,"1005,58016089281 ",.02)
 ;;58016089281
 ;;9002226.02101,"1005,58016089282 ",.01)
 ;;58016089282
 ;;9002226.02101,"1005,58016089282 ",.02)
 ;;58016089282
 ;;9002226.02101,"1005,58016089283 ",.01)
 ;;58016089283
 ;;9002226.02101,"1005,58016089283 ",.02)
 ;;58016089283
 ;;9002226.02101,"1005,58016089284 ",.01)
 ;;58016089284
 ;;9002226.02101,"1005,58016089284 ",.02)
 ;;58016089284
 ;;9002226.02101,"1005,58016089287 ",.01)
 ;;58016089287
 ;;9002226.02101,"1005,58016089287 ",.02)
 ;;58016089287
 ;;9002226.02101,"1005,58016089289 ",.01)
 ;;58016089289
 ;;9002226.02101,"1005,58016089289 ",.02)
 ;;58016089289
 ;;9002226.02101,"1005,58016089290 ",.01)
 ;;58016089290
 ;;9002226.02101,"1005,58016089290 ",.02)
 ;;58016089290
 ;;9002226.02101,"1005,58016089291 ",.01)
 ;;58016089291
 ;;9002226.02101,"1005,58016089291 ",.02)
 ;;58016089291
 ;;9002226.02101,"1005,58016089292 ",.01)
 ;;58016089292
 ;;9002226.02101,"1005,58016089292 ",.02)
 ;;58016089292
 ;;9002226.02101,"1005,58016089293 ",.01)
 ;;58016089293
 ;;9002226.02101,"1005,58016089293 ",.02)
 ;;58016089293
 ;;9002226.02101,"1005,58016089296 ",.01)
 ;;58016089296
 ;;9002226.02101,"1005,58016089296 ",.02)
 ;;58016089296
 ;;9002226.02101,"1005,58016089297 ",.01)
 ;;58016089297
 ;;9002226.02101,"1005,58016089297 ",.02)
 ;;58016089297
 ;;9002226.02101,"1005,58016089298 ",.01)
 ;;58016089298
 ;;9002226.02101,"1005,58016089298 ",.02)
 ;;58016089298
 ;;9002226.02101,"1005,58016089299 ",.01)
 ;;58016089299
 ;;9002226.02101,"1005,58016089299 ",.02)
 ;;58016089299
 ;;9002226.02101,"1005,58016091430 ",.01)
 ;;58016091430
 ;;9002226.02101,"1005,58016091430 ",.02)
 ;;58016091430
 ;;9002226.02101,"1005,58016091700 ",.01)
 ;;58016091700
 ;;9002226.02101,"1005,58016091700 ",.02)
 ;;58016091700
