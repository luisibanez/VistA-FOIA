BGPM5ACD ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON JUL 15, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"830,66267049740 ",.02)
 ;;66267049740
 ;;9002226.02101,"830,66267049745 ",.01)
 ;;66267049745
 ;;9002226.02101,"830,66267049745 ",.02)
 ;;66267049745
 ;;9002226.02101,"830,66267049760 ",.01)
 ;;66267049760
 ;;9002226.02101,"830,66267049760 ",.02)
 ;;66267049760
 ;;9002226.02101,"830,66267049790 ",.01)
 ;;66267049790
 ;;9002226.02101,"830,66267049790 ",.02)
 ;;66267049790
 ;;9002226.02101,"830,66267055300 ",.01)
 ;;66267055300
 ;;9002226.02101,"830,66267055300 ",.02)
 ;;66267055300
 ;;9002226.02101,"830,66267055305 ",.01)
 ;;66267055305
 ;;9002226.02101,"830,66267055305 ",.02)
 ;;66267055305
 ;;9002226.02101,"830,66267055318 ",.01)
 ;;66267055318
 ;;9002226.02101,"830,66267055318 ",.02)
 ;;66267055318
 ;;9002226.02101,"830,66267055320 ",.01)
 ;;66267055320
 ;;9002226.02101,"830,66267055320 ",.02)
 ;;66267055320
 ;;9002226.02101,"830,66267055330 ",.01)
 ;;66267055330
 ;;9002226.02101,"830,66267055330 ",.02)
 ;;66267055330
 ;;9002226.02101,"830,66267055340 ",.01)
 ;;66267055340
 ;;9002226.02101,"830,66267055340 ",.02)
 ;;66267055340
 ;;9002226.02101,"830,66267055360 ",.01)
 ;;66267055360
 ;;9002226.02101,"830,66267055360 ",.02)
 ;;66267055360
 ;;9002226.02101,"830,66267055390 ",.01)
 ;;66267055390
 ;;9002226.02101,"830,66267055390 ",.02)
 ;;66267055390
 ;;9002226.02101,"830,66267062710 ",.01)
 ;;66267062710
 ;;9002226.02101,"830,66267062710 ",.02)
 ;;66267062710
 ;;9002226.02101,"830,66336027030 ",.01)
 ;;66336027030
 ;;9002226.02101,"830,66336027030 ",.02)
 ;;66336027030
 ;;9002226.02101,"830,66336035830 ",.01)
 ;;66336035830
 ;;9002226.02101,"830,66336035830 ",.02)
 ;;66336035830
 ;;9002226.02101,"830,66336035860 ",.01)
 ;;66336035860
 ;;9002226.02101,"830,66336035860 ",.02)
 ;;66336035860
 ;;9002226.02101,"830,66336078430 ",.01)
 ;;66336078430
 ;;9002226.02101,"830,66336078430 ",.02)
 ;;66336078430
 ;;9002226.02101,"830,66336088330 ",.01)
 ;;66336088330
 ;;9002226.02101,"830,66336088330 ",.02)
 ;;66336088330
 ;;9002226.02101,"830,66336088360 ",.01)
 ;;66336088360
 ;;9002226.02101,"830,66336088360 ",.02)
 ;;66336088360
 ;;9002226.02101,"830,66336088414 ",.01)
 ;;66336088414
 ;;9002226.02101,"830,66336088414 ",.02)
 ;;66336088414
 ;;9002226.02101,"830,66336088430 ",.01)
 ;;66336088430
 ;;9002226.02101,"830,66336088430 ",.02)
 ;;66336088430
 ;;9002226.02101,"830,66336088460 ",.01)
 ;;66336088460
 ;;9002226.02101,"830,66336088460 ",.02)
 ;;66336088460
 ;;9002226.02101,"830,67046046030 ",.01)
 ;;67046046030
 ;;9002226.02101,"830,67046046030 ",.02)
 ;;67046046030
 ;;9002226.02101,"830,67046046130 ",.01)
 ;;67046046130
 ;;9002226.02101,"830,67046046130 ",.02)
 ;;67046046130
 ;;9002226.02101,"830,67046046230 ",.01)
 ;;67046046230
 ;;9002226.02101,"830,67046046230 ",.02)
 ;;67046046230
 ;;9002226.02101,"830,67228026803 ",.01)
 ;;67228026803
 ;;9002226.02101,"830,67228026803 ",.02)
 ;;67228026803
 ;;9002226.02101,"830,67228026806 ",.01)
 ;;67228026806
 ;;9002226.02101,"830,67228026806 ",.02)
 ;;67228026806
 ;;9002226.02101,"830,67228028103 ",.01)
 ;;67228028103
 ;;9002226.02101,"830,67228028103 ",.02)
 ;;67228028103
 ;;9002226.02101,"830,67228028106 ",.01)
 ;;67228028106
 ;;9002226.02101,"830,67228028106 ",.02)
 ;;67228028106
 ;;9002226.02101,"830,67228036803 ",.01)
 ;;67228036803
 ;;9002226.02101,"830,67228036803 ",.02)
 ;;67228036803
 ;;9002226.02101,"830,67228036806 ",.01)
 ;;67228036806
 ;;9002226.02101,"830,67228036806 ",.02)
 ;;67228036806
 ;;9002226.02101,"830,67228036903 ",.01)
 ;;67228036903
 ;;9002226.02101,"830,67228036903 ",.02)
 ;;67228036903
 ;;9002226.02101,"830,67228036906 ",.01)
 ;;67228036906
 ;;9002226.02101,"830,67228036906 ",.02)
 ;;67228036906
 ;;9002226.02101,"830,67544004730 ",.01)
 ;;67544004730
 ;;9002226.02101,"830,67544004730 ",.02)
 ;;67544004730
 ;;9002226.02101,"830,67544004732 ",.01)
 ;;67544004732
 ;;9002226.02101,"830,67544004732 ",.02)
 ;;67544004732
 ;;9002226.02101,"830,67544004753 ",.01)
 ;;67544004753
 ;;9002226.02101,"830,67544004753 ",.02)
 ;;67544004753
 ;;9002226.02101,"830,67544004760 ",.01)
 ;;67544004760
 ;;9002226.02101,"830,67544004760 ",.02)
 ;;67544004760
 ;;9002226.02101,"830,67544004770 ",.01)
 ;;67544004770
 ;;9002226.02101,"830,67544004770 ",.02)
 ;;67544004770
 ;;9002226.02101,"830,67544004775 ",.01)
 ;;67544004775
 ;;9002226.02101,"830,67544004775 ",.02)
 ;;67544004775
 ;;9002226.02101,"830,67544004780 ",.01)
 ;;67544004780
 ;;9002226.02101,"830,67544004780 ",.02)
 ;;67544004780
 ;;9002226.02101,"830,67544004790 ",.01)
 ;;67544004790
 ;;9002226.02101,"830,67544004790 ",.02)
 ;;67544004790
 ;;9002226.02101,"830,67544004792 ",.01)
 ;;67544004792
 ;;9002226.02101,"830,67544004792 ",.02)
 ;;67544004792
 ;;9002226.02101,"830,67544004794 ",.01)
 ;;67544004794
 ;;9002226.02101,"830,67544004794 ",.02)
 ;;67544004794
 ;;9002226.02101,"830,67544004796 ",.01)
 ;;67544004796
 ;;9002226.02101,"830,67544004796 ",.02)
 ;;67544004796
 ;;9002226.02101,"830,67544010753 ",.01)
 ;;67544010753
 ;;9002226.02101,"830,67544010753 ",.02)
 ;;67544010753
 ;;9002226.02101,"830,67544010760 ",.01)
 ;;67544010760
 ;;9002226.02101,"830,67544010760 ",.02)
 ;;67544010760
 ;;9002226.02101,"830,67544010770 ",.01)
 ;;67544010770
 ;;9002226.02101,"830,67544010770 ",.02)
 ;;67544010770
 ;;9002226.02101,"830,67544010780 ",.01)
 ;;67544010780
 ;;9002226.02101,"830,67544010780 ",.02)
 ;;67544010780
 ;;9002226.02101,"830,67544010792 ",.01)
 ;;67544010792
 ;;9002226.02101,"830,67544010792 ",.02)
 ;;67544010792
 ;;9002226.02101,"830,67544016330 ",.01)
 ;;67544016330
 ;;9002226.02101,"830,67544016330 ",.02)
 ;;67544016330
 ;;9002226.02101,"830,67544016345 ",.01)
 ;;67544016345
 ;;9002226.02101,"830,67544016345 ",.02)
 ;;67544016345
 ;;9002226.02101,"830,67544016353 ",.01)
 ;;67544016353
 ;;9002226.02101,"830,67544016353 ",.02)
 ;;67544016353
 ;;9002226.02101,"830,67544016360 ",.01)
 ;;67544016360
 ;;9002226.02101,"830,67544016360 ",.02)
 ;;67544016360
 ;;9002226.02101,"830,67544016380 ",.01)
 ;;67544016380
 ;;9002226.02101,"830,67544016380 ",.02)
 ;;67544016380
 ;;9002226.02101,"830,67544016386 ",.01)
 ;;67544016386
 ;;9002226.02101,"830,67544016386 ",.02)
 ;;67544016386
 ;;9002226.02101,"830,67544036470 ",.01)
 ;;67544036470
 ;;9002226.02101,"830,67544036470 ",.02)
 ;;67544036470
 ;;9002226.02101,"830,67544041770 ",.01)
 ;;67544041770
 ;;9002226.02101,"830,67544041770 ",.02)
 ;;67544041770
 ;;9002226.02101,"830,67544042160 ",.01)
 ;;67544042160
 ;;9002226.02101,"830,67544042160 ",.02)
 ;;67544042160
 ;;9002226.02101,"830,67544042180 ",.01)
 ;;67544042180
 ;;9002226.02101,"830,67544042180 ",.02)
 ;;67544042180
 ;;9002226.02101,"830,67544042192 ",.01)
 ;;67544042192
 ;;9002226.02101,"830,67544042192 ",.02)
 ;;67544042192
 ;;9002226.02101,"830,67544042230 ",.01)
 ;;67544042230
 ;;9002226.02101,"830,67544042230 ",.02)
 ;;67544042230
 ;;9002226.02101,"830,67544042253 ",.01)
 ;;67544042253
 ;;9002226.02101,"830,67544042253 ",.02)
 ;;67544042253
 ;;9002226.02101,"830,67544042260 ",.01)
 ;;67544042260
 ;;9002226.02101,"830,67544042260 ",.02)
 ;;67544042260
 ;;9002226.02101,"830,67544042270 ",.01)
 ;;67544042270
 ;;9002226.02101,"830,67544042270 ",.02)
 ;;67544042270
 ;;9002226.02101,"830,67544042275 ",.01)
 ;;67544042275
 ;;9002226.02101,"830,67544042275 ",.02)
 ;;67544042275
 ;;9002226.02101,"830,67544042280 ",.01)
 ;;67544042280
 ;;9002226.02101,"830,67544042280 ",.02)
 ;;67544042280
 ;;9002226.02101,"830,67544042290 ",.01)
 ;;67544042290
 ;;9002226.02101,"830,67544042290 ",.02)
 ;;67544042290
 ;;9002226.02101,"830,67544042292 ",.01)
 ;;67544042292
 ;;9002226.02101,"830,67544042292 ",.02)
 ;;67544042292
 ;;9002226.02101,"830,67544042294 ",.01)
 ;;67544042294
 ;;9002226.02101,"830,67544042294 ",.02)
 ;;67544042294
 ;;9002226.02101,"830,67544042296 ",.01)
 ;;67544042296
 ;;9002226.02101,"830,67544042296 ",.02)
 ;;67544042296
 ;;9002226.02101,"830,67544042430 ",.01)
 ;;67544042430
 ;;9002226.02101,"830,67544042430 ",.02)
 ;;67544042430
 ;;9002226.02101,"830,67544042431 ",.01)
 ;;67544042431
 ;;9002226.02101,"830,67544042431 ",.02)
 ;;67544042431
 ;;9002226.02101,"830,67544042453 ",.01)
 ;;67544042453
 ;;9002226.02101,"830,67544042453 ",.02)
 ;;67544042453
 ;;9002226.02101,"830,67544042460 ",.01)
 ;;67544042460
 ;;9002226.02101,"830,67544042460 ",.02)
 ;;67544042460
 ;;9002226.02101,"830,67544042470 ",.01)
 ;;67544042470
 ;;9002226.02101,"830,67544042470 ",.02)
 ;;67544042470
 ;;9002226.02101,"830,67544042475 ",.01)
 ;;67544042475
 ;;9002226.02101,"830,67544042475 ",.02)
 ;;67544042475
 ;;9002226.02101,"830,67544042480 ",.01)
 ;;67544042480
 ;;9002226.02101,"830,67544042480 ",.02)
 ;;67544042480
 ;;9002226.02101,"830,67544042490 ",.01)
 ;;67544042490
 ;;9002226.02101,"830,67544042490 ",.02)
 ;;67544042490
 ;;9002226.02101,"830,67544042492 ",.01)
 ;;67544042492
 ;;9002226.02101,"830,67544042492 ",.02)
 ;;67544042492
 ;;9002226.02101,"830,67544042494 ",.01)
 ;;67544042494
 ;;9002226.02101,"830,67544042494 ",.02)
 ;;67544042494
 ;;9002226.02101,"830,67544042496 ",.01)
 ;;67544042496
 ;;9002226.02101,"830,67544042496 ",.02)
 ;;67544042496
 ;;9002226.02101,"830,67544042830 ",.01)
 ;;67544042830
 ;;9002226.02101,"830,67544042830 ",.02)
 ;;67544042830
 ;;9002226.02101,"830,67544042831 ",.01)
 ;;67544042831
 ;;9002226.02101,"830,67544042831 ",.02)
 ;;67544042831
 ;;9002226.02101,"830,67544042832 ",.01)
 ;;67544042832
 ;;9002226.02101,"830,67544042832 ",.02)
 ;;67544042832
 ;;9002226.02101,"830,67544042845 ",.01)
 ;;67544042845
 ;;9002226.02101,"830,67544042845 ",.02)
 ;;67544042845
 ;;9002226.02101,"830,67544042853 ",.01)
 ;;67544042853
 ;;9002226.02101,"830,67544042853 ",.02)
 ;;67544042853
 ;;9002226.02101,"830,67544042860 ",.01)
 ;;67544042860
 ;;9002226.02101,"830,67544042860 ",.02)
 ;;67544042860
 ;;9002226.02101,"830,67544042873 ",.01)
 ;;67544042873
 ;;9002226.02101,"830,67544042873 ",.02)
 ;;67544042873
 ;;9002226.02101,"830,67544042880 ",.01)
 ;;67544042880
 ;;9002226.02101,"830,67544042880 ",.02)
 ;;67544042880
 ;;9002226.02101,"830,67544042886 ",.01)
 ;;67544042886
 ;;9002226.02101,"830,67544042886 ",.02)
 ;;67544042886
 ;;9002226.02101,"830,67544048631 ",.01)
 ;;67544048631
 ;;9002226.02101,"830,67544048631 ",.02)
 ;;67544048631
 ;;9002226.02101,"830,67544048632 ",.01)
 ;;67544048632
 ;;9002226.02101,"830,67544048632 ",.02)
 ;;67544048632
 ;;9002226.02101,"830,67544048653 ",.01)
 ;;67544048653
 ;;9002226.02101,"830,67544048653 ",.02)
 ;;67544048653
 ;;9002226.02101,"830,67544051130 ",.01)
 ;;67544051130
 ;;9002226.02101,"830,67544051130 ",.02)
 ;;67544051130
 ;;9002226.02101,"830,67544051170 ",.01)
 ;;67544051170
 ;;9002226.02101,"830,67544051170 ",.02)
 ;;67544051170
 ;;9002226.02101,"830,67544051194 ",.01)
 ;;67544051194
 ;;9002226.02101,"830,67544051194 ",.02)
 ;;67544051194
 ;;9002226.02101,"830,67544059630 ",.01)
 ;;67544059630
 ;;9002226.02101,"830,67544059630 ",.02)
 ;;67544059630
 ;;9002226.02101,"830,67544059631 ",.01)
 ;;67544059631
 ;;9002226.02101,"830,67544059631 ",.02)
 ;;67544059631
 ;;9002226.02101,"830,67544059632 ",.01)
 ;;67544059632
 ;;9002226.02101,"830,67544059632 ",.02)
 ;;67544059632
 ;;9002226.02101,"830,67544059653 ",.01)
 ;;67544059653
 ;;9002226.02101,"830,67544059653 ",.02)
 ;;67544059653
 ;;9002226.02101,"830,67544059660 ",.01)
 ;;67544059660
 ;;9002226.02101,"830,67544059660 ",.02)
 ;;67544059660
 ;;9002226.02101,"830,67544059670 ",.01)
 ;;67544059670
 ;;9002226.02101,"830,67544059670 ",.02)
 ;;67544059670
 ;;9002226.02101,"830,67544059675 ",.01)
 ;;67544059675