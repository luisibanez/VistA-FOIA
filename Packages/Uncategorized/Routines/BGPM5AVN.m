BGPM5AVN ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON AUG 29, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1033,55648070201 ",.01)
 ;;55648070201
 ;;9002226.02101,"1033,55648070201 ",.02)
 ;;55648070201
 ;;9002226.02101,"1033,55648070202 ",.01)
 ;;55648070202
 ;;9002226.02101,"1033,55648070202 ",.02)
 ;;55648070202
 ;;9002226.02101,"1033,55648071201 ",.01)
 ;;55648071201
 ;;9002226.02101,"1033,55648071201 ",.02)
 ;;55648071201
 ;;9002226.02101,"1033,55648071202 ",.01)
 ;;55648071202
 ;;9002226.02101,"1033,55648071202 ",.02)
 ;;55648071202
 ;;9002226.02101,"1033,55648071203 ",.01)
 ;;55648071203
 ;;9002226.02101,"1033,55648071203 ",.02)
 ;;55648071203
 ;;9002226.02101,"1033,55648071204 ",.01)
 ;;55648071204
 ;;9002226.02101,"1033,55648071204 ",.02)
 ;;55648071204
 ;;9002226.02101,"1033,55648071301 ",.01)
 ;;55648071301
 ;;9002226.02101,"1033,55648071301 ",.02)
 ;;55648071301
 ;;9002226.02101,"1033,55648071302 ",.01)
 ;;55648071302
 ;;9002226.02101,"1033,55648071302 ",.02)
 ;;55648071302
 ;;9002226.02101,"1033,55648071303 ",.01)
 ;;55648071303
 ;;9002226.02101,"1033,55648071303 ",.02)
 ;;55648071303
 ;;9002226.02101,"1033,55648092001 ",.01)
 ;;55648092001
 ;;9002226.02101,"1033,55648092001 ",.02)
 ;;55648092001
 ;;9002226.02101,"1033,55648092101 ",.01)
 ;;55648092101
 ;;9002226.02101,"1033,55648092101 ",.02)
 ;;55648092101
 ;;9002226.02101,"1033,55648092102 ",.01)
 ;;55648092102
 ;;9002226.02101,"1033,55648092102 ",.02)
 ;;55648092102
 ;;9002226.02101,"1033,55648092201 ",.01)
 ;;55648092201
 ;;9002226.02101,"1033,55648092201 ",.02)
 ;;55648092201
 ;;9002226.02101,"1033,55648092202 ",.01)
 ;;55648092202
 ;;9002226.02101,"1033,55648092202 ",.02)
 ;;55648092202
 ;;9002226.02101,"1033,55648094901 ",.01)
 ;;55648094901
 ;;9002226.02101,"1033,55648094901 ",.02)
 ;;55648094901
 ;;9002226.02101,"1033,55648095401 ",.01)
 ;;55648095401
 ;;9002226.02101,"1033,55648095401 ",.02)
 ;;55648095401
 ;;9002226.02101,"1033,55648096101 ",.01)
 ;;55648096101
 ;;9002226.02101,"1033,55648096101 ",.02)
 ;;55648096101
 ;;9002226.02101,"1033,55648096102 ",.01)
 ;;55648096102
 ;;9002226.02101,"1033,55648096102 ",.02)
 ;;55648096102
 ;;9002226.02101,"1033,55648096104 ",.01)
 ;;55648096104
 ;;9002226.02101,"1033,55648096104 ",.02)
 ;;55648096104
 ;;9002226.02101,"1033,55648096105 ",.01)
 ;;55648096105
 ;;9002226.02101,"1033,55648096105 ",.02)
 ;;55648096105
 ;;9002226.02101,"1033,55648096106 ",.01)
 ;;55648096106
 ;;9002226.02101,"1033,55648096106 ",.02)
 ;;55648096106
 ;;9002226.02101,"1033,55648096107 ",.01)
 ;;55648096107
 ;;9002226.02101,"1033,55648096107 ",.02)
 ;;55648096107
 ;;9002226.02101,"1033,55648096108 ",.01)
 ;;55648096108
 ;;9002226.02101,"1033,55648096108 ",.02)
 ;;55648096108
 ;;9002226.02101,"1033,55648098301 ",.01)
 ;;55648098301
 ;;9002226.02101,"1033,55648098301 ",.02)
 ;;55648098301
 ;;9002226.02101,"1033,55648098302 ",.01)
 ;;55648098302
 ;;9002226.02101,"1033,55648098302 ",.02)
 ;;55648098302
 ;;9002226.02101,"1033,55835040407 ",.01)
 ;;55835040407
 ;;9002226.02101,"1033,55835040407 ",.02)
 ;;55835040407
 ;;9002226.02101,"1033,55835070206 ",.01)
 ;;55835070206
 ;;9002226.02101,"1033,55835070206 ",.02)
 ;;55835070206
 ;;9002226.02101,"1033,55835070215 ",.01)
 ;;55835070215
 ;;9002226.02101,"1033,55835070215 ",.02)
 ;;55835070215
 ;;9002226.02101,"1033,55835070216 ",.01)
 ;;55835070216
 ;;9002226.02101,"1033,55835070216 ",.02)
 ;;55835070216
 ;;9002226.02101,"1033,55887003275 ",.01)
 ;;55887003275
 ;;9002226.02101,"1033,55887003275 ",.02)
 ;;55887003275
 ;;9002226.02101,"1033,55887007130 ",.01)
 ;;55887007130
 ;;9002226.02101,"1033,55887007130 ",.02)
 ;;55887007130
 ;;9002226.02101,"1033,55887007160 ",.01)
 ;;55887007160
 ;;9002226.02101,"1033,55887007160 ",.02)
 ;;55887007160
 ;;9002226.02101,"1033,55887013820 ",.01)
 ;;55887013820
 ;;9002226.02101,"1033,55887013820 ",.02)
 ;;55887013820
 ;;9002226.02101,"1033,55887013830 ",.01)
 ;;55887013830
 ;;9002226.02101,"1033,55887013830 ",.02)
 ;;55887013830
 ;;9002226.02101,"1033,55887013860 ",.01)
 ;;55887013860
 ;;9002226.02101,"1033,55887013860 ",.02)
 ;;55887013860
 ;;9002226.02101,"1033,55887013890 ",.01)
 ;;55887013890
 ;;9002226.02101,"1033,55887013890 ",.02)
 ;;55887013890
 ;;9002226.02101,"1033,55887013914 ",.01)
 ;;55887013914
 ;;9002226.02101,"1033,55887013914 ",.02)
 ;;55887013914
 ;;9002226.02101,"1033,55887013928 ",.01)
 ;;55887013928
 ;;9002226.02101,"1033,55887013928 ",.02)
 ;;55887013928
 ;;9002226.02101,"1033,55887014714 ",.01)
 ;;55887014714
 ;;9002226.02101,"1033,55887014714 ",.02)
 ;;55887014714
 ;;9002226.02101,"1033,55887014720 ",.01)
 ;;55887014720
 ;;9002226.02101,"1033,55887014720 ",.02)
 ;;55887014720
 ;;9002226.02101,"1033,55887014730 ",.01)
 ;;55887014730
 ;;9002226.02101,"1033,55887014730 ",.02)
 ;;55887014730
 ;;9002226.02101,"1033,55887014745 ",.01)
 ;;55887014745
 ;;9002226.02101,"1033,55887014745 ",.02)
 ;;55887014745
 ;;9002226.02101,"1033,55887014760 ",.01)
 ;;55887014760
 ;;9002226.02101,"1033,55887014760 ",.02)
 ;;55887014760
 ;;9002226.02101,"1033,55887018760 ",.01)
 ;;55887018760
 ;;9002226.02101,"1033,55887018760 ",.02)
 ;;55887018760
 ;;9002226.02101,"1033,55887021501 ",.01)
 ;;55887021501
 ;;9002226.02101,"1033,55887021501 ",.02)
 ;;55887021501
 ;;9002226.02101,"1033,55887021620 ",.01)
 ;;55887021620
 ;;9002226.02101,"1033,55887021620 ",.02)
 ;;55887021620
 ;;9002226.02101,"1033,55887021801 ",.01)
 ;;55887021801
 ;;9002226.02101,"1033,55887021801 ",.02)
 ;;55887021801
 ;;9002226.02101,"1033,55887024420 ",.01)
 ;;55887024420
 ;;9002226.02101,"1033,55887024420 ",.02)
 ;;55887024420
 ;;9002226.02101,"1033,55887024430 ",.01)
 ;;55887024430
 ;;9002226.02101,"1033,55887024430 ",.02)
 ;;55887024430
 ;;9002226.02101,"1033,55887029210 ",.01)
 ;;55887029210
 ;;9002226.02101,"1033,55887029210 ",.02)
 ;;55887029210
 ;;9002226.02101,"1033,55887029220 ",.01)
 ;;55887029220
 ;;9002226.02101,"1033,55887029220 ",.02)
 ;;55887029220
 ;;9002226.02101,"1033,55887029228 ",.01)
 ;;55887029228
 ;;9002226.02101,"1033,55887029228 ",.02)
 ;;55887029228
 ;;9002226.02101,"1033,55887029230 ",.01)
 ;;55887029230
 ;;9002226.02101,"1033,55887029230 ",.02)
 ;;55887029230
 ;;9002226.02101,"1033,55887030601 ",.01)
 ;;55887030601
 ;;9002226.02101,"1033,55887030601 ",.02)
 ;;55887030601
 ;;9002226.02101,"1033,55887031115 ",.01)
 ;;55887031115
 ;;9002226.02101,"1033,55887031115 ",.02)
 ;;55887031115
 ;;9002226.02101,"1033,55887031130 ",.01)
 ;;55887031130
 ;;9002226.02101,"1033,55887031130 ",.02)
 ;;55887031130
 ;;9002226.02101,"1033,55887031630 ",.01)
 ;;55887031630
 ;;9002226.02101,"1033,55887031630 ",.02)
 ;;55887031630
 ;;9002226.02101,"1033,55887032030 ",.01)
 ;;55887032030
 ;;9002226.02101,"1033,55887032030 ",.02)
 ;;55887032030
 ;;9002226.02101,"1033,55887032060 ",.01)
 ;;55887032060
 ;;9002226.02101,"1033,55887032060 ",.02)
 ;;55887032060
 ;;9002226.02101,"1033,55887037806 ",.01)
 ;;55887037806
 ;;9002226.02101,"1033,55887037806 ",.02)
 ;;55887037806
 ;;9002226.02101,"1033,55887037808 ",.01)
 ;;55887037808
 ;;9002226.02101,"1033,55887037808 ",.02)
 ;;55887037808
 ;;9002226.02101,"1033,55887037810 ",.01)
 ;;55887037810
 ;;9002226.02101,"1033,55887037810 ",.02)
 ;;55887037810
 ;;9002226.02101,"1033,55887037815 ",.01)
 ;;55887037815
 ;;9002226.02101,"1033,55887037815 ",.02)
 ;;55887037815
 ;;9002226.02101,"1033,55887037821 ",.01)
 ;;55887037821
 ;;9002226.02101,"1033,55887037821 ",.02)
 ;;55887037821
 ;;9002226.02101,"1033,55887037828 ",.01)
 ;;55887037828
 ;;9002226.02101,"1033,55887037828 ",.02)
 ;;55887037828
 ;;9002226.02101,"1033,55887037830 ",.01)
 ;;55887037830
 ;;9002226.02101,"1033,55887037830 ",.02)
 ;;55887037830
 ;;9002226.02101,"1033,55887037840 ",.01)
 ;;55887037840
 ;;9002226.02101,"1033,55887037840 ",.02)
 ;;55887037840
 ;;9002226.02101,"1033,55887037842 ",.01)
 ;;55887037842
 ;;9002226.02101,"1033,55887037842 ",.02)
 ;;55887037842
 ;;9002226.02101,"1033,55887046314 ",.01)
 ;;55887046314
 ;;9002226.02101,"1033,55887046314 ",.02)
 ;;55887046314
 ;;9002226.02101,"1033,55887046321 ",.01)
 ;;55887046321
 ;;9002226.02101,"1033,55887046321 ",.02)
 ;;55887046321
 ;;9002226.02101,"1033,55887046328 ",.01)
 ;;55887046328
 ;;9002226.02101,"1033,55887046328 ",.02)
 ;;55887046328
 ;;9002226.02101,"1033,55887046330 ",.01)
 ;;55887046330
 ;;9002226.02101,"1033,55887046330 ",.02)
 ;;55887046330
 ;;9002226.02101,"1033,55887046340 ",.01)
 ;;55887046340
 ;;9002226.02101,"1033,55887046340 ",.02)
 ;;55887046340
 ;;9002226.02101,"1033,55887046360 ",.01)
 ;;55887046360
 ;;9002226.02101,"1033,55887046360 ",.02)
 ;;55887046360
 ;;9002226.02101,"1033,55887052730 ",.01)
 ;;55887052730
 ;;9002226.02101,"1033,55887052730 ",.02)
 ;;55887052730
 ;;9002226.02101,"1033,55887058401 ",.01)
 ;;55887058401
 ;;9002226.02101,"1033,55887058401 ",.02)
 ;;55887058401
 ;;9002226.02101,"1033,55887058404 ",.01)
 ;;55887058404
 ;;9002226.02101,"1033,55887058404 ",.02)
 ;;55887058404
 ;;9002226.02101,"1033,55887058406 ",.01)
 ;;55887058406
 ;;9002226.02101,"1033,55887058406 ",.02)
 ;;55887058406
 ;;9002226.02101,"1033,55887058408 ",.01)
 ;;55887058408
 ;;9002226.02101,"1033,55887058408 ",.02)
 ;;55887058408
 ;;9002226.02101,"1033,55887058410 ",.01)
 ;;55887058410
 ;;9002226.02101,"1033,55887058410 ",.02)
 ;;55887058410
 ;;9002226.02101,"1033,55887058414 ",.01)
 ;;55887058414
 ;;9002226.02101,"1033,55887058414 ",.02)
 ;;55887058414
 ;;9002226.02101,"1033,55887058415 ",.01)
 ;;55887058415
 ;;9002226.02101,"1033,55887058415 ",.02)
 ;;55887058415
 ;;9002226.02101,"1033,55887058420 ",.01)
 ;;55887058420
 ;;9002226.02101,"1033,55887058420 ",.02)
 ;;55887058420
 ;;9002226.02101,"1033,55887058421 ",.01)
 ;;55887058421
 ;;9002226.02101,"1033,55887058421 ",.02)
 ;;55887058421
 ;;9002226.02101,"1033,55887058425 ",.01)
 ;;55887058425
 ;;9002226.02101,"1033,55887058425 ",.02)
 ;;55887058425
 ;;9002226.02101,"1033,55887058428 ",.01)
 ;;55887058428
 ;;9002226.02101,"1033,55887058428 ",.02)
 ;;55887058428
 ;;9002226.02101,"1033,55887058430 ",.01)
 ;;55887058430
 ;;9002226.02101,"1033,55887058430 ",.02)
 ;;55887058430
 ;;9002226.02101,"1033,55887058442 ",.01)
 ;;55887058442
 ;;9002226.02101,"1033,55887058442 ",.02)
 ;;55887058442
 ;;9002226.02101,"1033,55887058460 ",.01)
 ;;55887058460
 ;;9002226.02101,"1033,55887058460 ",.02)
 ;;55887058460
 ;;9002226.02101,"1033,55887058471 ",.01)
 ;;55887058471
 ;;9002226.02101,"1033,55887058471 ",.02)
 ;;55887058471
 ;;9002226.02101,"1033,55887061101 ",.01)
 ;;55887061101
 ;;9002226.02101,"1033,55887061101 ",.02)
 ;;55887061101
 ;;9002226.02101,"1033,55887061108 ",.01)
 ;;55887061108
 ;;9002226.02101,"1033,55887061108 ",.02)
 ;;55887061108
 ;;9002226.02101,"1033,55887061114 ",.01)
 ;;55887061114
 ;;9002226.02101,"1033,55887061114 ",.02)
 ;;55887061114
 ;;9002226.02101,"1033,55887061115 ",.01)
 ;;55887061115
 ;;9002226.02101,"1033,55887061115 ",.02)
 ;;55887061115
 ;;9002226.02101,"1033,55887061116 ",.01)
 ;;55887061116
 ;;9002226.02101,"1033,55887061116 ",.02)
 ;;55887061116
 ;;9002226.02101,"1033,55887061120 ",.01)
 ;;55887061120
 ;;9002226.02101,"1033,55887061120 ",.02)
 ;;55887061120
 ;;9002226.02101,"1033,55887061121 ",.01)
 ;;55887061121
 ;;9002226.02101,"1033,55887061121 ",.02)
 ;;55887061121
 ;;9002226.02101,"1033,55887061128 ",.01)
 ;;55887061128
 ;;9002226.02101,"1033,55887061128 ",.02)
 ;;55887061128
 ;;9002226.02101,"1033,55887061130 ",.01)
 ;;55887061130
 ;;9002226.02101,"1033,55887061130 ",.02)
 ;;55887061130
 ;;9002226.02101,"1033,55887061140 ",.01)
 ;;55887061140
 ;;9002226.02101,"1033,55887061140 ",.02)
 ;;55887061140
 ;;9002226.02101,"1033,55887061160 ",.01)
 ;;55887061160