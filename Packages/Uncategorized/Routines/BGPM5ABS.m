BGPM5ABS ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON JUL 15, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"830,00904585053 ",.02)
 ;;00904585053
 ;;9002226.02101,"830,00904585089 ",.01)
 ;;00904585089
 ;;9002226.02101,"830,00904585089 ",.02)
 ;;00904585089
 ;;9002226.02101,"830,00904585093 ",.01)
 ;;00904585093
 ;;9002226.02101,"830,00904585093 ",.02)
 ;;00904585093
 ;;9002226.02101,"830,00904585140 ",.01)
 ;;00904585140
 ;;9002226.02101,"830,00904585140 ",.02)
 ;;00904585140
 ;;9002226.02101,"830,00904585152 ",.01)
 ;;00904585152
 ;;9002226.02101,"830,00904585152 ",.02)
 ;;00904585152
 ;;9002226.02101,"830,00904585189 ",.01)
 ;;00904585189
 ;;9002226.02101,"830,00904585189 ",.02)
 ;;00904585189
 ;;9002226.02101,"830,00904585193 ",.01)
 ;;00904585193
 ;;9002226.02101,"830,00904585193 ",.02)
 ;;00904585193
 ;;9002226.02101,"830,00904609061 ",.01)
 ;;00904609061
 ;;9002226.02101,"830,00904609061 ",.02)
 ;;00904609061
 ;;9002226.02101,"830,00904609161 ",.01)
 ;;00904609161
 ;;9002226.02101,"830,00904609161 ",.02)
 ;;00904609161
 ;;9002226.02101,"830,00904609210 ",.01)
 ;;00904609210
 ;;9002226.02101,"830,00904609210 ",.02)
 ;;00904609210
 ;;9002226.02101,"830,00904609261 ",.01)
 ;;00904609261
 ;;9002226.02101,"830,00904609261 ",.02)
 ;;00904609261
 ;;9002226.02101,"830,00904610740 ",.01)
 ;;00904610740
 ;;9002226.02101,"830,00904610740 ",.02)
 ;;00904610740
 ;;9002226.02101,"830,00904610761 ",.01)
 ;;00904610761
 ;;9002226.02101,"830,00904610761 ",.02)
 ;;00904610761
 ;;9002226.02101,"830,00904610860 ",.01)
 ;;00904610860
 ;;9002226.02101,"830,00904610860 ",.02)
 ;;00904610860
 ;;9002226.02101,"830,00904610861 ",.01)
 ;;00904610861
 ;;9002226.02101,"830,00904610861 ",.02)
 ;;00904610861
 ;;9002226.02101,"830,11819012160 ",.01)
 ;;11819012160
 ;;9002226.02101,"830,11819012160 ",.02)
 ;;11819012160
 ;;9002226.02101,"830,11819012190 ",.01)
 ;;11819012190
 ;;9002226.02101,"830,11819012190 ",.02)
 ;;11819012190
 ;;9002226.02101,"830,12634075690 ",.01)
 ;;12634075690
 ;;9002226.02101,"830,12634075690 ",.02)
 ;;12634075690
 ;;9002226.02101,"830,12634078912 ",.01)
 ;;12634078912
 ;;9002226.02101,"830,12634078912 ",.02)
 ;;12634078912
 ;;9002226.02101,"830,13107000801 ",.01)
 ;;13107000801
 ;;9002226.02101,"830,13107000801 ",.02)
 ;;13107000801
 ;;9002226.02101,"830,13107000805 ",.01)
 ;;13107000805
 ;;9002226.02101,"830,13107000805 ",.02)
 ;;13107000805
 ;;9002226.02101,"830,13107000849 ",.01)
 ;;13107000849
 ;;9002226.02101,"830,13107000849 ",.02)
 ;;13107000849
 ;;9002226.02101,"830,13107000850 ",.01)
 ;;13107000850
 ;;9002226.02101,"830,13107000850 ",.02)
 ;;13107000850
 ;;9002226.02101,"830,13107000860 ",.01)
 ;;13107000860
 ;;9002226.02101,"830,13107000860 ",.02)
 ;;13107000860
 ;;9002226.02101,"830,13107000890 ",.01)
 ;;13107000890
 ;;9002226.02101,"830,13107000890 ",.02)
 ;;13107000890
 ;;9002226.02101,"830,13107000901 ",.01)
 ;;13107000901
 ;;9002226.02101,"830,13107000901 ",.02)
 ;;13107000901
 ;;9002226.02101,"830,13107000905 ",.01)
 ;;13107000905
 ;;9002226.02101,"830,13107000905 ",.02)
 ;;13107000905
 ;;9002226.02101,"830,13107000922 ",.01)
 ;;13107000922
 ;;9002226.02101,"830,13107000922 ",.02)
 ;;13107000922
 ;;9002226.02101,"830,13107000950 ",.01)
 ;;13107000950
 ;;9002226.02101,"830,13107000950 ",.02)
 ;;13107000950
 ;;9002226.02101,"830,13107000960 ",.01)
 ;;13107000960
 ;;9002226.02101,"830,13107000960 ",.02)
 ;;13107000960
 ;;9002226.02101,"830,13107000990 ",.01)
 ;;13107000990
 ;;9002226.02101,"830,13107000990 ",.02)
 ;;13107000990
 ;;9002226.02101,"830,13107001001 ",.01)
 ;;13107001001
 ;;9002226.02101,"830,13107001001 ",.02)
 ;;13107001001
 ;;9002226.02101,"830,13107001005 ",.01)
 ;;13107001005
 ;;9002226.02101,"830,13107001005 ",.02)
 ;;13107001005
 ;;9002226.02101,"830,13107001026 ",.01)
 ;;13107001026
 ;;9002226.02101,"830,13107001026 ",.02)
 ;;13107001026
 ;;9002226.02101,"830,13107001050 ",.01)
 ;;13107001050
 ;;9002226.02101,"830,13107001050 ",.02)
 ;;13107001050
 ;;9002226.02101,"830,13107001090 ",.01)
 ;;13107001090
 ;;9002226.02101,"830,13107001090 ",.02)
 ;;13107001090
 ;;9002226.02101,"830,13411016302 ",.01)
 ;;13411016302
 ;;9002226.02101,"830,13411016302 ",.02)
 ;;13411016302
 ;;9002226.02101,"830,13411016303 ",.01)
 ;;13411016303
 ;;9002226.02101,"830,13411016303 ",.02)
 ;;13411016303
 ;;9002226.02101,"830,13411016306 ",.01)
 ;;13411016306
 ;;9002226.02101,"830,13411016306 ",.02)
 ;;13411016306
 ;;9002226.02101,"830,13411016309 ",.01)
 ;;13411016309
 ;;9002226.02101,"830,13411016309 ",.02)
 ;;13411016309
 ;;9002226.02101,"830,13411016310 ",.01)
 ;;13411016310
 ;;9002226.02101,"830,13411016310 ",.02)
 ;;13411016310
 ;;9002226.02101,"830,13411016402 ",.01)
 ;;13411016402
 ;;9002226.02101,"830,13411016402 ",.02)
 ;;13411016402
 ;;9002226.02101,"830,13411016403 ",.01)
 ;;13411016403
 ;;9002226.02101,"830,13411016403 ",.02)
 ;;13411016403
 ;;9002226.02101,"830,13411016406 ",.01)
 ;;13411016406
 ;;9002226.02101,"830,13411016406 ",.02)
 ;;13411016406
 ;;9002226.02101,"830,13411016409 ",.01)
 ;;13411016409
 ;;9002226.02101,"830,13411016409 ",.02)
 ;;13411016409
 ;;9002226.02101,"830,13411016410 ",.01)
 ;;13411016410
 ;;9002226.02101,"830,13411016410 ",.02)
 ;;13411016410
 ;;9002226.02101,"830,13411022302 ",.01)
 ;;13411022302
 ;;9002226.02101,"830,13411022302 ",.02)
 ;;13411022302
 ;;9002226.02101,"830,13411022303 ",.01)
 ;;13411022303
 ;;9002226.02101,"830,13411022303 ",.02)
 ;;13411022303
 ;;9002226.02101,"830,13411022306 ",.01)
 ;;13411022306
 ;;9002226.02101,"830,13411022306 ",.02)
 ;;13411022306
 ;;9002226.02101,"830,13411022309 ",.01)
 ;;13411022309
 ;;9002226.02101,"830,13411022309 ",.02)
 ;;13411022309
 ;;9002226.02101,"830,13411022310 ",.01)
 ;;13411022310
 ;;9002226.02101,"830,13411022310 ",.02)
 ;;13411022310
 ;;9002226.02101,"830,13668000101 ",.01)
 ;;13668000101
 ;;9002226.02101,"830,13668000101 ",.02)
 ;;13668000101
 ;;9002226.02101,"830,13668000105 ",.01)
 ;;13668000105
 ;;9002226.02101,"830,13668000105 ",.02)
 ;;13668000105
 ;;9002226.02101,"830,13668000110 ",.01)
 ;;13668000110
 ;;9002226.02101,"830,13668000110 ",.02)
 ;;13668000110
 ;;9002226.02101,"830,13668000112 ",.01)
 ;;13668000112
 ;;9002226.02101,"830,13668000112 ",.02)
 ;;13668000112
 ;;9002226.02101,"830,13668000130 ",.01)
 ;;13668000130
 ;;9002226.02101,"830,13668000130 ",.02)
 ;;13668000130
 ;;9002226.02101,"830,13668000160 ",.01)
 ;;13668000160
 ;;9002226.02101,"830,13668000160 ",.02)
 ;;13668000160
 ;;9002226.02101,"830,13668000190 ",.01)
 ;;13668000190
 ;;9002226.02101,"830,13668000190 ",.02)
 ;;13668000190
 ;;9002226.02101,"830,13668000201 ",.01)
 ;;13668000201
 ;;9002226.02101,"830,13668000201 ",.02)
 ;;13668000201
 ;;9002226.02101,"830,13668000205 ",.01)
 ;;13668000205
 ;;9002226.02101,"830,13668000205 ",.02)
 ;;13668000205
 ;;9002226.02101,"830,13668000212 ",.01)
 ;;13668000212
 ;;9002226.02101,"830,13668000212 ",.02)
 ;;13668000212
 ;;9002226.02101,"830,13668000230 ",.01)
 ;;13668000230
 ;;9002226.02101,"830,13668000230 ",.02)
 ;;13668000230
 ;;9002226.02101,"830,13668000260 ",.01)
 ;;13668000260
 ;;9002226.02101,"830,13668000260 ",.02)
 ;;13668000260
 ;;9002226.02101,"830,13668000290 ",.01)
 ;;13668000290
 ;;9002226.02101,"830,13668000290 ",.02)
 ;;13668000290
 ;;9002226.02101,"830,13668000301 ",.01)
 ;;13668000301
 ;;9002226.02101,"830,13668000301 ",.02)
 ;;13668000301
 ;;9002226.02101,"830,13668000305 ",.01)
 ;;13668000305
 ;;9002226.02101,"830,13668000305 ",.02)
 ;;13668000305
 ;;9002226.02101,"830,13668000312 ",.01)
 ;;13668000312
 ;;9002226.02101,"830,13668000312 ",.02)
 ;;13668000312
 ;;9002226.02101,"830,13668000330 ",.01)
 ;;13668000330
 ;;9002226.02101,"830,13668000330 ",.02)
 ;;13668000330
 ;;9002226.02101,"830,13668000360 ",.01)
 ;;13668000360
 ;;9002226.02101,"830,13668000360 ",.02)
 ;;13668000360
 ;;9002226.02101,"830,13668000390 ",.01)
 ;;13668000390
 ;;9002226.02101,"830,13668000390 ",.02)
 ;;13668000390
 ;;9002226.02101,"830,13668001205 ",.01)
 ;;13668001205
 ;;9002226.02101,"830,13668001205 ",.02)
 ;;13668001205
 ;;9002226.02101,"830,13668001212 ",.01)
 ;;13668001212
 ;;9002226.02101,"830,13668001212 ",.02)
 ;;13668001212
 ;;9002226.02101,"830,13668001230 ",.01)
 ;;13668001230
 ;;9002226.02101,"830,13668001230 ",.02)
 ;;13668001230
 ;;9002226.02101,"830,13668001260 ",.01)
 ;;13668001260
 ;;9002226.02101,"830,13668001260 ",.02)
 ;;13668001260
 ;;9002226.02101,"830,13668001290 ",.01)
 ;;13668001290
 ;;9002226.02101,"830,13668001290 ",.02)
 ;;13668001290
 ;;9002226.02101,"830,13668001305 ",.01)
 ;;13668001305
 ;;9002226.02101,"830,13668001305 ",.02)
 ;;13668001305
 ;;9002226.02101,"830,13668001312 ",.01)
 ;;13668001312
 ;;9002226.02101,"830,13668001312 ",.02)
 ;;13668001312
 ;;9002226.02101,"830,13668001330 ",.01)
 ;;13668001330
 ;;9002226.02101,"830,13668001330 ",.02)
 ;;13668001330
 ;;9002226.02101,"830,13668001360 ",.01)
 ;;13668001360
 ;;9002226.02101,"830,13668001360 ",.02)
 ;;13668001360
 ;;9002226.02101,"830,13668001390 ",.01)
 ;;13668001390
 ;;9002226.02101,"830,13668001390 ",.02)
 ;;13668001390
 ;;9002226.02101,"830,14550020210 ",.01)
 ;;14550020210
 ;;9002226.02101,"830,14550020210 ",.02)
 ;;14550020210
 ;;9002226.02101,"830,14550020250 ",.01)
 ;;14550020250
 ;;9002226.02101,"830,14550020250 ",.02)
 ;;14550020250
 ;;9002226.02101,"830,14550051702 ",.01)
 ;;14550051702
 ;;9002226.02101,"830,14550051702 ",.02)
 ;;14550051702
 ;;9002226.02101,"830,14550051704 ",.01)
 ;;14550051704
 ;;9002226.02101,"830,14550051704 ",.02)
 ;;14550051704
 ;;9002226.02101,"830,14550051802 ",.01)
 ;;14550051802
 ;;9002226.02101,"830,14550051802 ",.02)
 ;;14550051802
 ;;9002226.02101,"830,14550051804 ",.01)
 ;;14550051804
 ;;9002226.02101,"830,14550051804 ",.02)
 ;;14550051804
 ;;9002226.02101,"830,14550051902 ",.01)
 ;;14550051902
 ;;9002226.02101,"830,14550051902 ",.02)
 ;;14550051902
 ;;9002226.02101,"830,14550051904 ",.01)
 ;;14550051904
 ;;9002226.02101,"830,14550051904 ",.02)
 ;;14550051904
 ;;9002226.02101,"830,14565020210 ",.01)
 ;;14565020210
 ;;9002226.02101,"830,14565020210 ",.02)
 ;;14565020210
 ;;9002226.02101,"830,14565020250 ",.01)
 ;;14565020250
 ;;9002226.02101,"830,14565020250 ",.02)
 ;;14565020250
 ;;9002226.02101,"830,14593040901 ",.01)
 ;;14593040901
 ;;9002226.02101,"830,14593040901 ",.02)
 ;;14593040901
 ;;9002226.02101,"830,14593040902 ",.01)
 ;;14593040902
 ;;9002226.02101,"830,14593040902 ",.02)
 ;;14593040902
 ;;9002226.02101,"830,14593040905 ",.01)
 ;;14593040905
 ;;9002226.02101,"830,14593040905 ",.02)
 ;;14593040905
 ;;9002226.02101,"830,14593040910 ",.01)
 ;;14593040910
 ;;9002226.02101,"830,14593040910 ",.02)
 ;;14593040910
 ;;9002226.02101,"830,14593041001 ",.01)
 ;;14593041001
 ;;9002226.02101,"830,14593041001 ",.02)
 ;;14593041001
 ;;9002226.02101,"830,14593041010 ",.01)
 ;;14593041010
 ;;9002226.02101,"830,14593041010 ",.02)
 ;;14593041010
 ;;9002226.02101,"830,14593041101 ",.01)
 ;;14593041101
 ;;9002226.02101,"830,14593041101 ",.02)
 ;;14593041101
 ;;9002226.02101,"830,14593041110 ",.01)
 ;;14593041110
 ;;9002226.02101,"830,14593041110 ",.02)
 ;;14593041110
 ;;9002226.02101,"830,15548096701 ",.01)
 ;;15548096701
 ;;9002226.02101,"830,15548096701 ",.02)
 ;;15548096701
 ;;9002226.02101,"830,15548096705 ",.01)
 ;;15548096705
 ;;9002226.02101,"830,15548096705 ",.02)
 ;;15548096705
 ;;9002226.02101,"830,15548096801 ",.01)
 ;;15548096801
 ;;9002226.02101,"830,15548096801 ",.02)
 ;;15548096801
 ;;9002226.02101,"830,15548096805 ",.01)
 ;;15548096805
 ;;9002226.02101,"830,15548096805 ",.02)
 ;;15548096805
 ;;9002226.02101,"830,16590031330 ",.01)
 ;;16590031330
