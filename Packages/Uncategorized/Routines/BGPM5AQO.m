BGPM5AQO ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON AUG 16, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1005,00247230530 ",.01)
 ;;00247230530
 ;;9002226.02101,"1005,00247230530 ",.02)
 ;;00247230530
 ;;9002226.02101,"1005,00247230560 ",.01)
 ;;00247230560
 ;;9002226.02101,"1005,00247230560 ",.02)
 ;;00247230560
 ;;9002226.02101,"1005,00247230590 ",.01)
 ;;00247230590
 ;;9002226.02101,"1005,00247230590 ",.02)
 ;;00247230590
 ;;9002226.02101,"1005,00247230630 ",.01)
 ;;00247230630
 ;;9002226.02101,"1005,00247230630 ",.02)
 ;;00247230630
 ;;9002226.02101,"1005,00247230660 ",.01)
 ;;00247230660
 ;;9002226.02101,"1005,00247230660 ",.02)
 ;;00247230660
 ;;9002226.02101,"1005,00247230690 ",.01)
 ;;00247230690
 ;;9002226.02101,"1005,00247230690 ",.02)
 ;;00247230690
 ;;9002226.02101,"1005,00247231830 ",.01)
 ;;00247231830
 ;;9002226.02101,"1005,00247231830 ",.02)
 ;;00247231830
 ;;9002226.02101,"1005,00247231860 ",.01)
 ;;00247231860
 ;;9002226.02101,"1005,00247231860 ",.02)
 ;;00247231860
 ;;9002226.02101,"1005,00247231890 ",.01)
 ;;00247231890
 ;;9002226.02101,"1005,00247231890 ",.02)
 ;;00247231890
 ;;9002226.02101,"1005,00247232030 ",.01)
 ;;00247232030
 ;;9002226.02101,"1005,00247232030 ",.02)
 ;;00247232030
 ;;9002226.02101,"1005,00247232060 ",.01)
 ;;00247232060
 ;;9002226.02101,"1005,00247232060 ",.02)
 ;;00247232060
 ;;9002226.02101,"1005,00247232090 ",.01)
 ;;00247232090
 ;;9002226.02101,"1005,00247232090 ",.02)
 ;;00247232090
 ;;9002226.02101,"1005,00310013010 ",.01)
 ;;00310013010
 ;;9002226.02101,"1005,00310013010 ",.02)
 ;;00310013010
 ;;9002226.02101,"1005,00310013011 ",.01)
 ;;00310013011
 ;;9002226.02101,"1005,00310013011 ",.02)
 ;;00310013011
 ;;9002226.02101,"1005,00310013034 ",.01)
 ;;00310013034
 ;;9002226.02101,"1005,00310013034 ",.02)
 ;;00310013034
 ;;9002226.02101,"1005,00310013110 ",.01)
 ;;00310013110
 ;;9002226.02101,"1005,00310013110 ",.02)
 ;;00310013110
 ;;9002226.02101,"1005,00310013111 ",.01)
 ;;00310013111
 ;;9002226.02101,"1005,00310013111 ",.02)
 ;;00310013111
 ;;9002226.02101,"1005,00310013134 ",.01)
 ;;00310013134
 ;;9002226.02101,"1005,00310013134 ",.02)
 ;;00310013134
 ;;9002226.02101,"1005,00310013173 ",.01)
 ;;00310013173
 ;;9002226.02101,"1005,00310013173 ",.02)
 ;;00310013173
 ;;9002226.02101,"1005,00310013210 ",.01)
 ;;00310013210
 ;;9002226.02101,"1005,00310013210 ",.02)
 ;;00310013210
 ;;9002226.02101,"1005,00310013211 ",.01)
 ;;00310013211
 ;;9002226.02101,"1005,00310013211 ",.02)
 ;;00310013211
 ;;9002226.02101,"1005,00310013234 ",.01)
 ;;00310013234
 ;;9002226.02101,"1005,00310013234 ",.02)
 ;;00310013234
 ;;9002226.02101,"1005,00310013273 ",.01)
 ;;00310013273
 ;;9002226.02101,"1005,00310013273 ",.02)
 ;;00310013273
 ;;9002226.02101,"1005,00310013310 ",.01)
 ;;00310013310
 ;;9002226.02101,"1005,00310013310 ",.02)
 ;;00310013310
 ;;9002226.02101,"1005,00310013311 ",.01)
 ;;00310013311
 ;;9002226.02101,"1005,00310013311 ",.02)
 ;;00310013311
 ;;9002226.02101,"1005,00310013395 ",.01)
 ;;00310013395
 ;;9002226.02101,"1005,00310013395 ",.02)
 ;;00310013395
 ;;9002226.02101,"1005,00310013410 ",.01)
 ;;00310013410
 ;;9002226.02101,"1005,00310013410 ",.02)
 ;;00310013410
 ;;9002226.02101,"1005,00310013411 ",.01)
 ;;00310013411
 ;;9002226.02101,"1005,00310013411 ",.02)
 ;;00310013411
 ;;9002226.02101,"1005,00310013510 ",.01)
 ;;00310013510
 ;;9002226.02101,"1005,00310013510 ",.02)
 ;;00310013510
 ;;9002226.02101,"1005,00310014110 ",.01)
 ;;00310014110
 ;;9002226.02101,"1005,00310014110 ",.02)
 ;;00310014110
 ;;9002226.02101,"1005,00310014111 ",.01)
 ;;00310014111
 ;;9002226.02101,"1005,00310014111 ",.02)
 ;;00310014111
 ;;9002226.02101,"1005,00310014210 ",.01)
 ;;00310014210
 ;;9002226.02101,"1005,00310014210 ",.02)
 ;;00310014210
 ;;9002226.02101,"1005,00310014211 ",.01)
 ;;00310014211
 ;;9002226.02101,"1005,00310014211 ",.02)
 ;;00310014211
 ;;9002226.02101,"1005,00310014510 ",.01)
 ;;00310014510
 ;;9002226.02101,"1005,00310014510 ",.02)
 ;;00310014510
 ;;9002226.02101,"1005,00310014511 ",.01)
 ;;00310014511
 ;;9002226.02101,"1005,00310014511 ",.02)
 ;;00310014511
 ;;9002226.02101,"1005,00310914102 ",.01)
 ;;00310914102
 ;;9002226.02101,"1005,00310914102 ",.02)
 ;;00310914102
 ;;9002226.02101,"1005,00339522511 ",.01)
 ;;00339522511
 ;;9002226.02101,"1005,00339522511 ",.02)
 ;;00339522511
 ;;9002226.02101,"1005,00378001777 ",.01)
 ;;00378001777
 ;;9002226.02101,"1005,00378001777 ",.02)
 ;;00378001777
 ;;9002226.02101,"1005,00378008101 ",.01)
 ;;00378008101
 ;;9002226.02101,"1005,00378008101 ",.02)
 ;;00378008101
 ;;9002226.02101,"1005,00378008301 ",.01)
 ;;00378008301
 ;;9002226.02101,"1005,00378008301 ",.02)
 ;;00378008301
 ;;9002226.02101,"1005,00378008401 ",.01)
 ;;00378008401
 ;;9002226.02101,"1005,00378008401 ",.02)
 ;;00378008401
 ;;9002226.02101,"1005,00378008601 ",.01)
 ;;00378008601
 ;;9002226.02101,"1005,00378008601 ",.02)
 ;;00378008601
 ;;9002226.02101,"1005,00378022605 ",.01)
 ;;00378022605
 ;;9002226.02101,"1005,00378022605 ",.02)
 ;;00378022605
 ;;9002226.02101,"1005,00378022677 ",.01)
 ;;00378022677
 ;;9002226.02101,"1005,00378022677 ",.02)
 ;;00378022677
 ;;9002226.02101,"1005,00378025405 ",.01)
 ;;00378025405
 ;;9002226.02101,"1005,00378025405 ",.02)
 ;;00378025405
 ;;9002226.02101,"1005,00378025477 ",.01)
 ;;00378025477
 ;;9002226.02101,"1005,00378025477 ",.02)
 ;;00378025477
 ;;9002226.02101,"1005,00378027205 ",.01)
 ;;00378027205
 ;;9002226.02101,"1005,00378027205 ",.02)
 ;;00378027205
 ;;9002226.02101,"1005,00378027277 ",.01)
 ;;00378027277
 ;;9002226.02101,"1005,00378027277 ",.02)
 ;;00378027277
 ;;9002226.02101,"1005,00378071201 ",.01)
 ;;00378071201
 ;;9002226.02101,"1005,00378071201 ",.02)
 ;;00378071201
 ;;9002226.02101,"1005,00378072301 ",.01)
 ;;00378072301
 ;;9002226.02101,"1005,00378072301 ",.02)
 ;;00378072301
 ;;9002226.02101,"1005,00378072305 ",.01)
 ;;00378072305
 ;;9002226.02101,"1005,00378072305 ",.02)
 ;;00378072305
 ;;9002226.02101,"1005,00378101201 ",.01)
 ;;00378101201
 ;;9002226.02101,"1005,00378101201 ",.02)
 ;;00378101201
 ;;9002226.02101,"1005,00378101293 ",.01)
 ;;00378101293
 ;;9002226.02101,"1005,00378101293 ",.02)
 ;;00378101293
 ;;9002226.02101,"1005,00378105101 ",.01)
 ;;00378105101
 ;;9002226.02101,"1005,00378105101 ",.02)
 ;;00378105101
 ;;9002226.02101,"1005,00378105105 ",.01)
 ;;00378105105
 ;;9002226.02101,"1005,00378105105 ",.02)
 ;;00378105105
 ;;9002226.02101,"1005,00378105201 ",.01)
 ;;00378105201
 ;;9002226.02101,"1005,00378105201 ",.02)
 ;;00378105201
 ;;9002226.02101,"1005,00378105210 ",.01)
 ;;00378105210
 ;;9002226.02101,"1005,00378105210 ",.02)
 ;;00378105210
 ;;9002226.02101,"1005,00378105301 ",.01)
 ;;00378105301
 ;;9002226.02101,"1005,00378105301 ",.02)
 ;;00378105301
 ;;9002226.02101,"1005,00378105310 ",.01)
 ;;00378105310
 ;;9002226.02101,"1005,00378105310 ",.02)
 ;;00378105310
 ;;9002226.02101,"1005,00378105401 ",.01)
 ;;00378105401
 ;;9002226.02101,"1005,00378105401 ",.02)
 ;;00378105401
 ;;9002226.02101,"1005,00378105405 ",.01)
 ;;00378105405
 ;;9002226.02101,"1005,00378105405 ",.02)
 ;;00378105405
 ;;9002226.02101,"1005,00378111705 ",.01)
 ;;00378111705
 ;;9002226.02101,"1005,00378111705 ",.02)
 ;;00378111705
 ;;9002226.02101,"1005,00378111777 ",.01)
 ;;00378111777
 ;;9002226.02101,"1005,00378111777 ",.02)
 ;;00378111777
 ;;9002226.02101,"1005,00378201201 ",.01)
 ;;00378201201
 ;;9002226.02101,"1005,00378201201 ",.02)
 ;;00378201201
 ;;9002226.02101,"1005,00378201293 ",.01)
 ;;00378201293
 ;;9002226.02101,"1005,00378201293 ",.02)
 ;;00378201293
 ;;9002226.02101,"1005,00378202501 ",.01)
 ;;00378202501
 ;;9002226.02101,"1005,00378202501 ",.02)
 ;;00378202501
 ;;9002226.02101,"1005,00378202593 ",.01)
 ;;00378202593
 ;;9002226.02101,"1005,00378202593 ",.02)
 ;;00378202593
 ;;9002226.02101,"1005,00378207201 ",.01)
 ;;00378207201
 ;;9002226.02101,"1005,00378207201 ",.02)
 ;;00378207201
 ;;9002226.02101,"1005,00378207205 ",.01)
 ;;00378207205
 ;;9002226.02101,"1005,00378207205 ",.02)
 ;;00378207205
 ;;9002226.02101,"1005,00378207301 ",.01)
 ;;00378207301
 ;;9002226.02101,"1005,00378207301 ",.02)
 ;;00378207301
 ;;9002226.02101,"1005,00378207310 ",.01)
 ;;00378207310
 ;;9002226.02101,"1005,00378207310 ",.02)
 ;;00378207310
 ;;9002226.02101,"1005,00378207401 ",.01)
 ;;00378207401
 ;;9002226.02101,"1005,00378207401 ",.02)
 ;;00378207401
 ;;9002226.02101,"1005,00378207410 ",.01)
 ;;00378207410
 ;;9002226.02101,"1005,00378207410 ",.02)
 ;;00378207410
 ;;9002226.02101,"1005,00378207501 ",.01)
 ;;00378207501
 ;;9002226.02101,"1005,00378207501 ",.02)
 ;;00378207501
 ;;9002226.02101,"1005,00378207510 ",.01)
 ;;00378207510
 ;;9002226.02101,"1005,00378207510 ",.02)
 ;;00378207510
 ;;9002226.02101,"1005,00378207601 ",.01)
 ;;00378207601
 ;;9002226.02101,"1005,00378207601 ",.02)
 ;;00378207601
 ;;9002226.02101,"1005,00378207605 ",.01)
 ;;00378207605
 ;;9002226.02101,"1005,00378207605 ",.02)
 ;;00378207605
 ;;9002226.02101,"1005,00378207701 ",.01)
 ;;00378207701
 ;;9002226.02101,"1005,00378207701 ",.02)
 ;;00378207701
 ;;9002226.02101,"1005,00378207705 ",.01)
 ;;00378207705
 ;;9002226.02101,"1005,00378207705 ",.02)
 ;;00378207705
 ;;9002226.02101,"1005,00378300701 ",.01)
 ;;00378300701
 ;;9002226.02101,"1005,00378300701 ",.02)
 ;;00378300701
 ;;9002226.02101,"1005,00378300710 ",.01)
 ;;00378300710
 ;;9002226.02101,"1005,00378300710 ",.02)
 ;;00378300710
 ;;9002226.02101,"1005,00378301201 ",.01)
 ;;00378301201
 ;;9002226.02101,"1005,00378301201 ",.02)
 ;;00378301201
 ;;9002226.02101,"1005,00378301210 ",.01)
 ;;00378301210
 ;;9002226.02101,"1005,00378301210 ",.02)
 ;;00378301210
 ;;9002226.02101,"1005,00378301701 ",.01)
 ;;00378301701
 ;;9002226.02101,"1005,00378301701 ",.02)
 ;;00378301701
 ;;9002226.02101,"1005,00378301710 ",.01)
 ;;00378301710
 ;;9002226.02101,"1005,00378301710 ",.02)
 ;;00378301710
 ;;9002226.02101,"1005,00378302201 ",.01)
 ;;00378302201
 ;;9002226.02101,"1005,00378302201 ",.02)
 ;;00378302201
 ;;9002226.02101,"1005,00409212201 ",.01)
 ;;00409212201
 ;;9002226.02101,"1005,00409212201 ",.02)
 ;;00409212201
 ;;9002226.02101,"1005,00409212202 ",.01)
 ;;00409212202
 ;;9002226.02101,"1005,00409212202 ",.02)
 ;;00409212202
 ;;9002226.02101,"1005,00409212213 ",.01)
 ;;00409212213
 ;;9002226.02101,"1005,00409212213 ",.02)
 ;;00409212213
 ;;9002226.02101,"1005,00409212288 ",.01)
 ;;00409212288
 ;;9002226.02101,"1005,00409212288 ",.02)
 ;;00409212288
 ;;9002226.02101,"1005,00440723160 ",.01)
 ;;00440723160
 ;;9002226.02101,"1005,00440723160 ",.02)
 ;;00440723160
 ;;9002226.02101,"1005,00440723190 ",.01)
 ;;00440723190
 ;;9002226.02101,"1005,00440723190 ",.02)
 ;;00440723190
 ;;9002226.02101,"1005,00440723192 ",.01)
 ;;00440723192
 ;;9002226.02101,"1005,00440723192 ",.02)
 ;;00440723192
 ;;9002226.02101,"1005,00440723194 ",.01)
 ;;00440723194
 ;;9002226.02101,"1005,00440723194 ",.02)
 ;;00440723194
 ;;9002226.02101,"1005,00440723260 ",.01)
 ;;00440723260
 ;;9002226.02101,"1005,00440723260 ",.02)
 ;;00440723260
 ;;9002226.02101,"1005,00440723290 ",.01)
 ;;00440723290
 ;;9002226.02101,"1005,00440723290 ",.02)
 ;;00440723290
 ;;9002226.02101,"1005,00440723292 ",.01)
 ;;00440723292
 ;;9002226.02101,"1005,00440723292 ",.02)
 ;;00440723292
 ;;9002226.02101,"1005,00440723294 ",.01)
 ;;00440723294
 ;;9002226.02101,"1005,00440723294 ",.02)
 ;;00440723294
 ;;9002226.02101,"1005,00440767490 ",.01)
 ;;00440767490
 ;;9002226.02101,"1005,00440767490 ",.02)
 ;;00440767490
 ;;9002226.02101,"1005,00440767590 ",.01)
 ;;00440767590
 ;;9002226.02101,"1005,00440767590 ",.02)
 ;;00440767590
 ;;9002226.02101,"1005,00440767690 ",.01)
 ;;00440767690
