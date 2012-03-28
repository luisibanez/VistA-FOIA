BGP0ZD42 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"976,68115-0182-10 ",.02)
 ;;68115-0182-10
 ;;9002226.02101,"976,68115-0182-20 ",.01)
 ;;68115-0182-20
 ;;9002226.02101,"976,68115-0182-20 ",.02)
 ;;68115-0182-20
 ;;9002226.02101,"976,68115-0182-24 ",.01)
 ;;68115-0182-24
 ;;9002226.02101,"976,68115-0182-24 ",.02)
 ;;68115-0182-24
 ;;9002226.02101,"976,68115-0182-30 ",.01)
 ;;68115-0182-30
 ;;9002226.02101,"976,68115-0182-30 ",.02)
 ;;68115-0182-30
 ;;9002226.02101,"976,68115-0182-40 ",.01)
 ;;68115-0182-40
 ;;9002226.02101,"976,68115-0182-40 ",.02)
 ;;68115-0182-40
 ;;9002226.02101,"976,68115-0182-60 ",.01)
 ;;68115-0182-60
 ;;9002226.02101,"976,68115-0182-60 ",.02)
 ;;68115-0182-60
 ;;9002226.02101,"976,68115-0182-80 ",.01)
 ;;68115-0182-80
 ;;9002226.02101,"976,68115-0182-80 ",.02)
 ;;68115-0182-80
 ;;9002226.02101,"976,68115-0182-90 ",.01)
 ;;68115-0182-90
 ;;9002226.02101,"976,68115-0182-90 ",.02)
 ;;68115-0182-90
 ;;9002226.02101,"976,68115-0182-99 ",.01)
 ;;68115-0182-99
 ;;9002226.02101,"976,68115-0182-99 ",.02)
 ;;68115-0182-99
 ;;9002226.02101,"976,68115-0183-30 ",.01)
 ;;68115-0183-30
 ;;9002226.02101,"976,68115-0183-30 ",.02)
 ;;68115-0183-30
 ;;9002226.02101,"976,68115-0183-60 ",.01)
 ;;68115-0183-60
 ;;9002226.02101,"976,68115-0183-60 ",.02)
 ;;68115-0183-60
 ;;9002226.02101,"976,68115-0184-20 ",.01)
 ;;68115-0184-20
 ;;9002226.02101,"976,68115-0184-20 ",.02)
 ;;68115-0184-20
 ;;9002226.02101,"976,68115-0184-30 ",.01)
 ;;68115-0184-30
 ;;9002226.02101,"976,68115-0184-30 ",.02)
 ;;68115-0184-30
 ;;9002226.02101,"976,68115-0184-90 ",.01)
 ;;68115-0184-90
 ;;9002226.02101,"976,68115-0184-90 ",.02)
 ;;68115-0184-90
 ;;9002226.02101,"976,68115-0185-30 ",.01)
 ;;68115-0185-30
 ;;9002226.02101,"976,68115-0185-30 ",.02)
 ;;68115-0185-30
 ;;9002226.02101,"976,68115-0190-60 ",.01)
 ;;68115-0190-60
 ;;9002226.02101,"976,68115-0190-60 ",.02)
 ;;68115-0190-60
 ;;9002226.02101,"976,68115-0191-21 ",.01)
 ;;68115-0191-21
 ;;9002226.02101,"976,68115-0191-21 ",.02)
 ;;68115-0191-21
 ;;9002226.02101,"976,68115-0191-30 ",.01)
 ;;68115-0191-30
 ;;9002226.02101,"976,68115-0191-30 ",.02)
 ;;68115-0191-30
 ;;9002226.02101,"976,68115-0192-20 ",.01)
 ;;68115-0192-20
 ;;9002226.02101,"976,68115-0192-20 ",.02)
 ;;68115-0192-20
 ;;9002226.02101,"976,68115-0192-30 ",.01)
 ;;68115-0192-30
 ;;9002226.02101,"976,68115-0192-30 ",.02)
 ;;68115-0192-30
 ;;9002226.02101,"976,68115-0244-00 ",.01)
 ;;68115-0244-00
 ;;9002226.02101,"976,68115-0244-00 ",.02)
 ;;68115-0244-00
 ;;9002226.02101,"976,68115-0244-30 ",.01)
 ;;68115-0244-30
 ;;9002226.02101,"976,68115-0244-30 ",.02)
 ;;68115-0244-30
 ;;9002226.02101,"976,68115-0244-40 ",.01)
 ;;68115-0244-40
 ;;9002226.02101,"976,68115-0244-40 ",.02)
 ;;68115-0244-40
 ;;9002226.02101,"976,68115-0244-60 ",.01)
 ;;68115-0244-60
 ;;9002226.02101,"976,68115-0244-60 ",.02)
 ;;68115-0244-60
 ;;9002226.02101,"976,68115-0244-99 ",.01)
 ;;68115-0244-99
 ;;9002226.02101,"976,68115-0244-99 ",.02)
 ;;68115-0244-99
 ;;9002226.02101,"976,68115-0245-30 ",.01)
 ;;68115-0245-30
 ;;9002226.02101,"976,68115-0245-30 ",.02)
 ;;68115-0245-30
 ;;9002226.02101,"976,68115-0245-60 ",.01)
 ;;68115-0245-60
 ;;9002226.02101,"976,68115-0245-60 ",.02)
 ;;68115-0245-60
 ;;9002226.02101,"976,68115-0245-99 ",.01)
 ;;68115-0245-99
 ;;9002226.02101,"976,68115-0245-99 ",.02)
 ;;68115-0245-99
 ;;9002226.02101,"976,68115-0246-30 ",.01)
 ;;68115-0246-30
 ;;9002226.02101,"976,68115-0246-30 ",.02)
 ;;68115-0246-30
 ;;9002226.02101,"976,68115-0246-60 ",.01)
 ;;68115-0246-60
 ;;9002226.02101,"976,68115-0246-60 ",.02)
 ;;68115-0246-60
 ;;9002226.02101,"976,68115-0247-20 ",.01)
 ;;68115-0247-20
 ;;9002226.02101,"976,68115-0247-20 ",.02)
 ;;68115-0247-20
 ;;9002226.02101,"976,68115-0247-30 ",.01)
 ;;68115-0247-30
 ;;9002226.02101,"976,68115-0247-30 ",.02)
 ;;68115-0247-30
 ;;9002226.02101,"976,68115-0247-40 ",.01)
 ;;68115-0247-40
 ;;9002226.02101,"976,68115-0247-40 ",.02)
 ;;68115-0247-40
 ;;9002226.02101,"976,68115-0247-60 ",.01)
 ;;68115-0247-60
 ;;9002226.02101,"976,68115-0247-60 ",.02)
 ;;68115-0247-60
 ;;9002226.02101,"976,68115-0247-90 ",.01)
 ;;68115-0247-90
 ;;9002226.02101,"976,68115-0247-90 ",.02)
 ;;68115-0247-90
 ;;9002226.02101,"976,68115-0247-99 ",.01)
 ;;68115-0247-99
 ;;9002226.02101,"976,68115-0247-99 ",.02)
 ;;68115-0247-99
 ;;9002226.02101,"976,68115-0248-10 ",.01)
 ;;68115-0248-10
 ;;9002226.02101,"976,68115-0248-10 ",.02)
 ;;68115-0248-10
 ;;9002226.02101,"976,68115-0248-14 ",.01)
 ;;68115-0248-14
 ;;9002226.02101,"976,68115-0248-14 ",.02)
 ;;68115-0248-14
 ;;9002226.02101,"976,68115-0248-20 ",.01)
 ;;68115-0248-20
 ;;9002226.02101,"976,68115-0248-20 ",.02)
 ;;68115-0248-20
 ;;9002226.02101,"976,68115-0248-30 ",.01)
 ;;68115-0248-30
 ;;9002226.02101,"976,68115-0248-30 ",.02)
 ;;68115-0248-30
 ;;9002226.02101,"976,68115-0248-40 ",.01)
 ;;68115-0248-40
 ;;9002226.02101,"976,68115-0248-40 ",.02)
 ;;68115-0248-40
 ;;9002226.02101,"976,68115-0248-45 ",.01)
 ;;68115-0248-45
 ;;9002226.02101,"976,68115-0248-45 ",.02)
 ;;68115-0248-45
 ;;9002226.02101,"976,68115-0248-60 ",.01)
 ;;68115-0248-60
 ;;9002226.02101,"976,68115-0248-60 ",.02)
 ;;68115-0248-60
 ;;9002226.02101,"976,68115-0248-90 ",.01)
 ;;68115-0248-90
 ;;9002226.02101,"976,68115-0248-90 ",.02)
 ;;68115-0248-90
 ;;9002226.02101,"976,68115-0248-99 ",.01)
 ;;68115-0248-99
 ;;9002226.02101,"976,68115-0248-99 ",.02)
 ;;68115-0248-99
 ;;9002226.02101,"976,68115-0251-60 ",.01)
 ;;68115-0251-60
 ;;9002226.02101,"976,68115-0251-60 ",.02)
 ;;68115-0251-60
 ;;9002226.02101,"976,68115-0252-14 ",.01)
 ;;68115-0252-14
 ;;9002226.02101,"976,68115-0252-14 ",.02)
 ;;68115-0252-14
 ;;9002226.02101,"976,68115-0252-20 ",.01)
 ;;68115-0252-20
 ;;9002226.02101,"976,68115-0252-20 ",.02)
 ;;68115-0252-20
 ;;9002226.02101,"976,68115-0252-30 ",.01)
 ;;68115-0252-30
 ;;9002226.02101,"976,68115-0252-30 ",.02)
 ;;68115-0252-30
 ;;9002226.02101,"976,68115-0252-90 ",.01)
 ;;68115-0252-90
 ;;9002226.02101,"976,68115-0252-90 ",.02)
 ;;68115-0252-90
 ;;9002226.02101,"976,68115-0265-30 ",.01)
 ;;68115-0265-30
 ;;9002226.02101,"976,68115-0265-30 ",.02)
 ;;68115-0265-30
 ;;9002226.02101,"976,68115-0265-60 ",.01)
 ;;68115-0265-60
 ;;9002226.02101,"976,68115-0265-60 ",.02)
 ;;68115-0265-60
 ;;9002226.02101,"976,68115-0282-10 ",.01)
 ;;68115-0282-10
 ;;9002226.02101,"976,68115-0282-10 ",.02)
 ;;68115-0282-10
 ;;9002226.02101,"976,68115-0282-20 ",.01)
 ;;68115-0282-20
 ;;9002226.02101,"976,68115-0282-20 ",.02)
 ;;68115-0282-20
 ;;9002226.02101,"976,68115-0282-30 ",.01)
 ;;68115-0282-30
 ;;9002226.02101,"976,68115-0282-30 ",.02)
 ;;68115-0282-30
 ;;9002226.02101,"976,68115-0282-40 ",.01)
 ;;68115-0282-40
 ;;9002226.02101,"976,68115-0282-40 ",.02)
 ;;68115-0282-40
 ;;9002226.02101,"976,68115-0282-60 ",.01)
 ;;68115-0282-60
 ;;9002226.02101,"976,68115-0282-60 ",.02)
 ;;68115-0282-60
 ;;9002226.02101,"976,68115-0282-99 ",.01)
 ;;68115-0282-99
 ;;9002226.02101,"976,68115-0282-99 ",.02)
 ;;68115-0282-99
 ;;9002226.02101,"976,68115-0405-14 ",.01)
 ;;68115-0405-14
 ;;9002226.02101,"976,68115-0405-14 ",.02)
 ;;68115-0405-14
 ;;9002226.02101,"976,68115-0405-30 ",.01)
 ;;68115-0405-30
 ;;9002226.02101,"976,68115-0405-30 ",.02)
 ;;68115-0405-30
 ;;9002226.02101,"976,68115-0422-14 ",.01)
 ;;68115-0422-14
 ;;9002226.02101,"976,68115-0422-14 ",.02)
 ;;68115-0422-14
 ;;9002226.02101,"976,68115-0424-20 ",.01)
 ;;68115-0424-20
 ;;9002226.02101,"976,68115-0424-20 ",.02)
 ;;68115-0424-20
 ;;9002226.02101,"976,68115-0424-30 ",.01)
 ;;68115-0424-30
 ;;9002226.02101,"976,68115-0424-30 ",.02)
 ;;68115-0424-30
 ;;9002226.02101,"976,68115-0436-30 ",.01)
 ;;68115-0436-30
 ;;9002226.02101,"976,68115-0436-30 ",.02)
 ;;68115-0436-30
 ;;9002226.02101,"976,68115-0436-45 ",.01)
 ;;68115-0436-45
 ;;9002226.02101,"976,68115-0436-45 ",.02)
 ;;68115-0436-45
 ;;9002226.02101,"976,68115-0436-90 ",.01)
 ;;68115-0436-90
 ;;9002226.02101,"976,68115-0436-90 ",.02)
 ;;68115-0436-90
 ;;9002226.02101,"976,68115-0437-14 ",.01)
 ;;68115-0437-14
 ;;9002226.02101,"976,68115-0437-14 ",.02)
 ;;68115-0437-14
 ;;9002226.02101,"976,68115-0437-30 ",.01)
 ;;68115-0437-30
 ;;9002226.02101,"976,68115-0437-30 ",.02)
 ;;68115-0437-30
 ;;9002226.02101,"976,68115-0438-30 ",.01)
 ;;68115-0438-30
 ;;9002226.02101,"976,68115-0438-30 ",.02)
 ;;68115-0438-30
 ;;9002226.02101,"976,68115-0457-60 ",.01)
 ;;68115-0457-60
 ;;9002226.02101,"976,68115-0457-60 ",.02)
 ;;68115-0457-60
 ;;9002226.02101,"976,68115-0585-00 ",.01)
 ;;68115-0585-00
 ;;9002226.02101,"976,68115-0585-00 ",.02)
 ;;68115-0585-00
 ;;9002226.02101,"976,68115-0674-60 ",.01)
 ;;68115-0674-60
 ;;9002226.02101,"976,68115-0674-60 ",.02)
 ;;68115-0674-60
 ;;9002226.02101,"976,68115-0805-00 ",.01)
 ;;68115-0805-00
 ;;9002226.02101,"976,68115-0805-00 ",.02)
 ;;68115-0805-00
 ;;9002226.02101,"976,68115-0962-90 ",.01)
 ;;68115-0962-90
 ;;9002226.02101,"976,68115-0962-90 ",.02)
 ;;68115-0962-90
 ;;9002226.02101,"976,68115-0963-00 ",.01)
 ;;68115-0963-00
 ;;9002226.02101,"976,68115-0963-00 ",.02)
 ;;68115-0963-00
 ;;9002226.02101,"976,68387-0150-30 ",.01)
 ;;68387-0150-30
 ;;9002226.02101,"976,68387-0150-30 ",.02)
 ;;68387-0150-30
 ;;9002226.02101,"976,68387-0150-60 ",.01)
 ;;68387-0150-60
 ;;9002226.02101,"976,68387-0150-60 ",.02)
 ;;68387-0150-60
 ;;9002226.02101,"976,68387-0150-90 ",.01)
 ;;68387-0150-90
 ;;9002226.02101,"976,68387-0150-90 ",.02)
 ;;68387-0150-90
 ;;9002226.02101,"976,68387-0180-30 ",.01)
 ;;68387-0180-30
 ;;9002226.02101,"976,68387-0180-30 ",.02)
 ;;68387-0180-30
 ;;9002226.02101,"976,68387-0180-60 ",.01)
 ;;68387-0180-60
 ;;9002226.02101,"976,68387-0180-60 ",.02)
 ;;68387-0180-60
 ;;9002226.02101,"976,68387-0210-10 ",.01)
 ;;68387-0210-10
 ;;9002226.02101,"976,68387-0210-10 ",.02)
 ;;68387-0210-10
 ;;9002226.02101,"976,68387-0210-30 ",.01)
 ;;68387-0210-30
 ;;9002226.02101,"976,68387-0210-30 ",.02)
 ;;68387-0210-30
 ;;9002226.02101,"976,68387-0210-60 ",.01)
 ;;68387-0210-60
 ;;9002226.02101,"976,68387-0210-60 ",.02)
 ;;68387-0210-60
 ;;9002226.02101,"976,68387-0210-90 ",.01)
 ;;68387-0210-90
 ;;9002226.02101,"976,68387-0210-90 ",.02)
 ;;68387-0210-90
 ;;9002226.02101,"976,68387-0260-30 ",.01)
 ;;68387-0260-30
 ;;9002226.02101,"976,68387-0260-30 ",.02)
 ;;68387-0260-30
 ;;9002226.02101,"976,68387-0260-60 ",.01)
 ;;68387-0260-60
 ;;9002226.02101,"976,68387-0260-60 ",.02)
 ;;68387-0260-60
 ;;9002226.02101,"976,68387-0270-30 ",.01)
 ;;68387-0270-30
 ;;9002226.02101,"976,68387-0270-30 ",.02)
 ;;68387-0270-30
 ;;9002226.02101,"976,68387-0270-60 ",.01)
 ;;68387-0270-60
 ;;9002226.02101,"976,68387-0270-60 ",.02)
 ;;68387-0270-60
 ;;9002226.02101,"976,68387-0280-30 ",.01)
 ;;68387-0280-30
 ;;9002226.02101,"976,68387-0280-30 ",.02)
 ;;68387-0280-30
 ;;9002226.02101,"976,68387-0440-30 ",.01)
 ;;68387-0440-30
 ;;9002226.02101,"976,68387-0440-30 ",.02)
 ;;68387-0440-30
 ;;9002226.02101,"976,68387-0700-30 ",.01)
 ;;68387-0700-30
 ;;9002226.02101,"976,68387-0700-30 ",.02)
 ;;68387-0700-30
 ;;9002226.02101,"976,68387-0700-60 ",.01)
 ;;68387-0700-60
 ;;9002226.02101,"976,68387-0700-60 ",.02)
 ;;68387-0700-60
 ;;9002226.02101,"976,68387-0700-90 ",.01)
 ;;68387-0700-90
 ;;9002226.02101,"976,68387-0700-90 ",.02)
 ;;68387-0700-90
 ;;9002226.02101,"976,68387-0800-30 ",.01)
 ;;68387-0800-30
 ;;9002226.02101,"976,68387-0800-30 ",.02)
 ;;68387-0800-30
 ;;9002226.02101,"976,68387-0800-60 ",.01)
 ;;68387-0800-60
 ;;9002226.02101,"976,68387-0800-60 ",.02)
 ;;68387-0800-60
 ;;9002226.02101,"976,68387-0800-90 ",.01)
 ;;68387-0800-90
 ;;9002226.02101,"976,68387-0800-90 ",.02)
 ;;68387-0800-90
 ;;
 ;;3148
 ;;
 ;;897
 ;;
 ;;3191
 ;;
 ;;3196
 ;;
 ;;3197
 ;;
 ;;3149
 ;;
 ;;3150
 ;;
 ;;3151
 ;;
 ;;3208
 ;;
 ;;3209
 ;;
 ;;3435
 ;;
 ;;3436
 ;;
 ;;584
 ;;
 ;;583
 ;;
 ;;2440
 ;;
 ;;2091
 ;;
 ;;2092
 ;;
 ;;2093
 ;;
 ;;2094
 ;;
 ;;2096
 ;;
 ;;2097
 ;;
 ;;2098
 ;;
 ;;2095
 ;;
 ;;3314
 ;;
 ;;3315
 ;;
 ;;3316
 ;;
 ;;300
 ;;
 ;;298
 ;;
 ;;299
 ;;
 ;;301
 ;;
 ;;3446
 ;;
 ;;3447
 ;;
 ;;3448
 ;;
 ;;3449
 ;;
 ;;3450
 ;;
 ;;3451
 ;;
 ;;3453
 ;;
 ;;3452
 ;;
 ;;296
 ;;
 ;;261
 ;;
 ;;262
 ;;
 ;;263
 ;;
 ;;1223
 ;;
 ;;1224
 ;;
 ;;302
 ;;
 ;;1084
 ;;
 ;;2089
 ;;
 ;;2090
 ;;
 ;;535
 ;;
 ;;536
 ;;
 ;;571
 ;;
 ;;572
 ;;
 ;;2527
 ;;
 ;;58
 ;;
 ;;60
 ;;
 ;;61
 ;;
 ;;63
 ;;
 ;;59
 ;;
 ;;62
 ;;
 ;;1524
 ;;
 ;;1525
 ;;
 ;;826
 ;;
 ;;828
 ;;
 ;;824
 ;;
 ;;825
 ;;
 ;;827
 ;;
 ;;829
 ;;
 ;;2553
 ;;
 ;;2554
 ;;
 ;;2555
 ;;
 ;;2556
 ;;
 ;;2557
 ;;
 ;;2558
 ;;
 ;;2559
 ;;
 ;;2560
 ;;
 ;;844
 ;;
 ;;2985
 ;;
 ;;2986
 ;;
 ;;2987
 ;;
 ;;2988
 ;;
 ;;2989
 ;;
 ;;2990
 ;;
 ;;1581
 ;;
 ;;1582
 ;;
 ;;3401
 ;;
 ;;3402
 ;;
 ;;3400
 ;;
 ;;1374
 ;;
 ;;1375
 ;;
 ;;1376
 ;;
 ;;392
 ;;
 ;;3234
 ;;
 ;;3235
 ;;
 ;;3
 ;;
 ;;4
 ;;
 ;;2911
 ;;
 ;;2912
 ;;
 ;;2913
 ;;
 ;;2914
 ;;
 ;;1115
 ;;
 ;;1116
 ;;
 ;;83
 ;;
 ;;395
 ;;
 ;;393
 ;;
 ;;2371
 ;;
 ;;2372
 ;;
 ;;2373
 ;;
 ;;394
 ;;
 ;;391
 ;;
 ;;1053
 ;;
 ;;2996
 ;;
 ;;2997
 ;;
 ;;2995
 ;;
 ;;1754
 ;;
 ;;611
 ;;
 ;;613
