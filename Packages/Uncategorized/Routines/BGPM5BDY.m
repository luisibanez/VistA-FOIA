BGPM5BDY ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON SEP 12, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1044,66336000490 ",.02)
 ;;66336000490
 ;;9002226.02101,"1044,66336001428 ",.01)
 ;;66336001428
 ;;9002226.02101,"1044,66336001428 ",.02)
 ;;66336001428
 ;;9002226.02101,"1044,66336001430 ",.01)
 ;;66336001430
 ;;9002226.02101,"1044,66336001430 ",.02)
 ;;66336001430
 ;;9002226.02101,"1044,66336001460 ",.01)
 ;;66336001460
 ;;9002226.02101,"1044,66336001460 ",.02)
 ;;66336001460
 ;;9002226.02101,"1044,66336002730 ",.01)
 ;;66336002730
 ;;9002226.02101,"1044,66336002730 ",.02)
 ;;66336002730
 ;;9002226.02101,"1044,66336002760 ",.01)
 ;;66336002760
 ;;9002226.02101,"1044,66336002760 ",.02)
 ;;66336002760
 ;;9002226.02101,"1044,66336002790 ",.01)
 ;;66336002790
 ;;9002226.02101,"1044,66336002790 ",.02)
 ;;66336002790
 ;;9002226.02101,"1044,66336022430 ",.01)
 ;;66336022430
 ;;9002226.02101,"1044,66336022430 ",.02)
 ;;66336022430
 ;;9002226.02101,"1044,66336027130 ",.01)
 ;;66336027130
 ;;9002226.02101,"1044,66336027130 ",.02)
 ;;66336027130
 ;;9002226.02101,"1044,66336035430 ",.01)
 ;;66336035430
 ;;9002226.02101,"1044,66336035430 ",.02)
 ;;66336035430
 ;;9002226.02101,"1044,66336035460 ",.01)
 ;;66336035460
 ;;9002226.02101,"1044,66336035460 ",.02)
 ;;66336035460
 ;;9002226.02101,"1044,66336035490 ",.01)
 ;;66336035490
 ;;9002226.02101,"1044,66336035490 ",.02)
 ;;66336035490
 ;;9002226.02101,"1044,66336041830 ",.01)
 ;;66336041830
 ;;9002226.02101,"1044,66336041830 ",.02)
 ;;66336041830
 ;;9002226.02101,"1044,66336062028 ",.01)
 ;;66336062028
 ;;9002226.02101,"1044,66336062028 ",.02)
 ;;66336062028
 ;;9002226.02101,"1044,66336062030 ",.01)
 ;;66336062030
 ;;9002226.02101,"1044,66336062030 ",.02)
 ;;66336062030
 ;;9002226.02101,"1044,66336062060 ",.01)
 ;;66336062060
 ;;9002226.02101,"1044,66336062060 ",.02)
 ;;66336062060
 ;;9002226.02101,"1044,66336062090 ",.01)
 ;;66336062090
 ;;9002226.02101,"1044,66336062090 ",.02)
 ;;66336062090
 ;;9002226.02101,"1044,66336062130 ",.01)
 ;;66336062130
 ;;9002226.02101,"1044,66336062130 ",.02)
 ;;66336062130
 ;;9002226.02101,"1044,66336062160 ",.01)
 ;;66336062160
 ;;9002226.02101,"1044,66336062160 ",.02)
 ;;66336062160
 ;;9002226.02101,"1044,66336067330 ",.01)
 ;;66336067330
 ;;9002226.02101,"1044,66336067330 ",.02)
 ;;66336067330
 ;;9002226.02101,"1044,66336067350 ",.01)
 ;;66336067350
 ;;9002226.02101,"1044,66336067350 ",.02)
 ;;66336067350
 ;;9002226.02101,"1044,66336067360 ",.01)
 ;;66336067360
 ;;9002226.02101,"1044,66336067360 ",.02)
 ;;66336067360
 ;;9002226.02101,"1044,66336075730 ",.01)
 ;;66336075730
 ;;9002226.02101,"1044,66336075730 ",.02)
 ;;66336075730
 ;;9002226.02101,"1044,66336075760 ",.01)
 ;;66336075760
 ;;9002226.02101,"1044,66336075760 ",.02)
 ;;66336075760
 ;;9002226.02101,"1044,66336075790 ",.01)
 ;;66336075790
 ;;9002226.02101,"1044,66336075790 ",.02)
 ;;66336075790
 ;;9002226.02101,"1044,66336079930 ",.01)
 ;;66336079930
 ;;9002226.02101,"1044,66336079930 ",.02)
 ;;66336079930
 ;;9002226.02101,"1044,66336079960 ",.01)
 ;;66336079960
 ;;9002226.02101,"1044,66336079960 ",.02)
 ;;66336079960
 ;;9002226.02101,"1044,66336083814 ",.01)
 ;;66336083814
 ;;9002226.02101,"1044,66336083814 ",.02)
 ;;66336083814
 ;;9002226.02101,"1044,66336083830 ",.01)
 ;;66336083830
 ;;9002226.02101,"1044,66336083830 ",.02)
 ;;66336083830
 ;;9002226.02101,"1044,66336084430 ",.01)
 ;;66336084430
 ;;9002226.02101,"1044,66336084430 ",.02)
 ;;66336084430
 ;;9002226.02101,"1044,66336084490 ",.01)
 ;;66336084490
 ;;9002226.02101,"1044,66336084490 ",.02)
 ;;66336084490
 ;;9002226.02101,"1044,66336097360 ",.01)
 ;;66336097360
 ;;9002226.02101,"1044,66336097360 ",.02)
 ;;66336097360
 ;;9002226.02101,"1044,66336099330 ",.01)
 ;;66336099330
 ;;9002226.02101,"1044,66336099330 ",.02)
 ;;66336099330
 ;;9002226.02101,"1044,66336099390 ",.01)
 ;;66336099390
 ;;9002226.02101,"1044,66336099390 ",.02)
 ;;66336099390
 ;;9002226.02101,"1044,66406003202 ",.01)
 ;;66406003202
 ;;9002226.02101,"1044,66406003202 ",.02)
 ;;66406003202
 ;;9002226.02101,"1044,66406003303 ",.01)
 ;;66406003303
 ;;9002226.02101,"1044,66406003303 ",.02)
 ;;66406003303
 ;;9002226.02101,"1044,66406003404 ",.01)
 ;;66406003404
 ;;9002226.02101,"1044,66406003404 ",.02)
 ;;66406003404
 ;;9002226.02101,"1044,66406003505 ",.01)
 ;;66406003505
 ;;9002226.02101,"1044,66406003505 ",.02)
 ;;66406003505
 ;;9002226.02101,"1044,66893003201 ",.01)
 ;;66893003201
 ;;9002226.02101,"1044,66893003201 ",.02)
 ;;66893003201
 ;;9002226.02101,"1044,66893028008 ",.01)
 ;;66893028008
 ;;9002226.02101,"1044,66893028008 ",.02)
 ;;66893028008
 ;;9002226.02101,"1044,66893028108 ",.01)
 ;;66893028108
 ;;9002226.02101,"1044,66893028108 ",.02)
 ;;66893028108
 ;;9002226.02101,"1044,66893028202 ",.01)
 ;;66893028202
 ;;9002226.02101,"1044,66893028202 ",.02)
 ;;66893028202
 ;;9002226.02101,"1044,66993070930 ",.01)
 ;;66993070930
 ;;9002226.02101,"1044,66993070930 ",.02)
 ;;66993070930
 ;;9002226.02101,"1044,66993071130 ",.01)
 ;;66993071130
 ;;9002226.02101,"1044,66993071130 ",.02)
 ;;66993071130
 ;;9002226.02101,"1044,66993071230 ",.01)
 ;;66993071230
 ;;9002226.02101,"1044,66993071230 ",.02)
 ;;66993071230
 ;;9002226.02101,"1044,67046001030 ",.01)
 ;;67046001030
 ;;9002226.02101,"1044,67046001030 ",.02)
 ;;67046001030
 ;;9002226.02101,"1044,67046001130 ",.01)
 ;;67046001130
 ;;9002226.02101,"1044,67046001130 ",.02)
 ;;67046001130
 ;;9002226.02101,"1044,67046001230 ",.01)
 ;;67046001230
 ;;9002226.02101,"1044,67046001230 ",.02)
 ;;67046001230
 ;;9002226.02101,"1044,67046001330 ",.01)
 ;;67046001330
 ;;9002226.02101,"1044,67046001330 ",.02)
 ;;67046001330
 ;;9002226.02101,"1044,67046001430 ",.01)
 ;;67046001430
 ;;9002226.02101,"1044,67046001430 ",.02)
 ;;67046001430
 ;;9002226.02101,"1044,67046001530 ",.01)
 ;;67046001530
 ;;9002226.02101,"1044,67046001530 ",.02)
 ;;67046001530
 ;;9002226.02101,"1044,67046001630 ",.01)
 ;;67046001630
 ;;9002226.02101,"1044,67046001630 ",.02)
 ;;67046001630
 ;;9002226.02101,"1044,67046001730 ",.01)
 ;;67046001730
 ;;9002226.02101,"1044,67046001730 ",.02)
 ;;67046001730
 ;;9002226.02101,"1044,67046010730 ",.01)
 ;;67046010730
 ;;9002226.02101,"1044,67046010730 ",.02)
 ;;67046010730
 ;;9002226.02101,"1044,67046010830 ",.01)
 ;;67046010830
 ;;9002226.02101,"1044,67046010830 ",.02)
 ;;67046010830
 ;;9002226.02101,"1044,67046010930 ",.01)
 ;;67046010930
 ;;9002226.02101,"1044,67046010930 ",.02)
 ;;67046010930
 ;;9002226.02101,"1044,67046011030 ",.01)
 ;;67046011030
 ;;9002226.02101,"1044,67046011030 ",.02)
 ;;67046011030
 ;;9002226.02101,"1044,67046011130 ",.01)
 ;;67046011130
 ;;9002226.02101,"1044,67046011130 ",.02)
 ;;67046011130
 ;;9002226.02101,"1044,67046011230 ",.01)
 ;;67046011230
 ;;9002226.02101,"1044,67046011230 ",.02)
 ;;67046011230
 ;;9002226.02101,"1044,67046011330 ",.01)
 ;;67046011330
 ;;9002226.02101,"1044,67046011330 ",.02)
 ;;67046011330
 ;;9002226.02101,"1044,67046011430 ",.01)
 ;;67046011430
 ;;9002226.02101,"1044,67046011430 ",.02)
 ;;67046011430
 ;;9002226.02101,"1044,67046011530 ",.01)
 ;;67046011530
 ;;9002226.02101,"1044,67046011530 ",.02)
 ;;67046011530
 ;;9002226.02101,"1044,67046011630 ",.01)
 ;;67046011630
 ;;9002226.02101,"1044,67046011630 ",.02)
 ;;67046011630
 ;;9002226.02101,"1044,67046021030 ",.01)
 ;;67046021030
 ;;9002226.02101,"1044,67046021030 ",.02)
 ;;67046021030
 ;;9002226.02101,"1044,67046021060 ",.01)
 ;;67046021060
 ;;9002226.02101,"1044,67046021060 ",.02)
 ;;67046021060
 ;;9002226.02101,"1044,67046021130 ",.01)
 ;;67046021130
 ;;9002226.02101,"1044,67046021130 ",.02)
 ;;67046021130
 ;;9002226.02101,"1044,67046021160 ",.01)
 ;;67046021160
 ;;9002226.02101,"1044,67046021160 ",.02)
 ;;67046021160
 ;;9002226.02101,"1044,67046021230 ",.01)
 ;;67046021230
 ;;9002226.02101,"1044,67046021230 ",.02)
 ;;67046021230
 ;;9002226.02101,"1044,67046021260 ",.01)
 ;;67046021260
 ;;9002226.02101,"1044,67046021260 ",.02)
 ;;67046021260
 ;;9002226.02101,"1044,67046048130 ",.01)
 ;;67046048130
 ;;9002226.02101,"1044,67046048130 ",.02)
 ;;67046048130
 ;;9002226.02101,"1044,67046048230 ",.01)
 ;;67046048230
 ;;9002226.02101,"1044,67046048230 ",.02)
 ;;67046048230
 ;;9002226.02101,"1044,67046048330 ",.01)
 ;;67046048330
 ;;9002226.02101,"1044,67046048330 ",.02)
 ;;67046048330
 ;;9002226.02101,"1044,67046053030 ",.01)
 ;;67046053030
 ;;9002226.02101,"1044,67046053030 ",.02)
 ;;67046053030
 ;;9002226.02101,"1044,67046053130 ",.01)
 ;;67046053130
 ;;9002226.02101,"1044,67046053130 ",.02)
 ;;67046053130
 ;;9002226.02101,"1044,67046053230 ",.01)
 ;;67046053230
 ;;9002226.02101,"1044,67046053230 ",.02)
 ;;67046053230
 ;;9002226.02101,"1044,67046053330 ",.01)
 ;;67046053330
 ;;9002226.02101,"1044,67046053330 ",.02)
 ;;67046053330
 ;;9002226.02101,"1044,67046066530 ",.01)
 ;;67046066530
 ;;9002226.02101,"1044,67046066530 ",.02)
 ;;67046066530
 ;;9002226.02101,"1044,67046073930 ",.01)
 ;;67046073930
 ;;9002226.02101,"1044,67046073930 ",.02)
 ;;67046073930
 ;;9002226.02101,"1044,67046074030 ",.01)
 ;;67046074030
 ;;9002226.02101,"1044,67046074030 ",.02)
 ;;67046074030
 ;;9002226.02101,"1044,67046074130 ",.01)
 ;;67046074130
 ;;9002226.02101,"1044,67046074130 ",.02)
 ;;67046074130
 ;;9002226.02101,"1044,67046074230 ",.01)
 ;;67046074230
 ;;9002226.02101,"1044,67046074230 ",.02)
 ;;67046074230
 ;;9002226.02101,"1044,67228000703 ",.01)
 ;;67228000703
 ;;9002226.02101,"1044,67228000703 ",.02)
 ;;67228000703
 ;;9002226.02101,"1044,67228000706 ",.01)
 ;;67228000706
 ;;9002226.02101,"1044,67228000706 ",.02)
 ;;67228000706
 ;;9002226.02101,"1044,67228006803 ",.01)
 ;;67228006803
 ;;9002226.02101,"1044,67228006803 ",.02)
 ;;67228006803
 ;;9002226.02101,"1044,67228006806 ",.01)
 ;;67228006806
 ;;9002226.02101,"1044,67228006806 ",.02)
 ;;67228006806
 ;;9002226.02101,"1044,67228006903 ",.01)
 ;;67228006903
 ;;9002226.02101,"1044,67228006903 ",.02)
 ;;67228006903
 ;;9002226.02101,"1044,67228006906 ",.01)
 ;;67228006906
 ;;9002226.02101,"1044,67228006906 ",.02)
 ;;67228006906
 ;;9002226.02101,"1044,67228014003 ",.01)
 ;;67228014003
 ;;9002226.02101,"1044,67228014003 ",.02)
 ;;67228014003
 ;;9002226.02101,"1044,67228014006 ",.01)
 ;;67228014006
 ;;9002226.02101,"1044,67228014006 ",.02)
 ;;67228014006
 ;;9002226.02101,"1044,67228021703 ",.01)
 ;;67228021703
 ;;9002226.02101,"1044,67228021703 ",.02)
 ;;67228021703
 ;;9002226.02101,"1044,67228021706 ",.01)
 ;;67228021706
 ;;9002226.02101,"1044,67228021706 ",.02)
 ;;67228021706
 ;;9002226.02101,"1044,67228021803 ",.01)
 ;;67228021803
 ;;9002226.02101,"1044,67228021803 ",.02)
 ;;67228021803
 ;;9002226.02101,"1044,67228021806 ",.01)
 ;;67228021806
 ;;9002226.02101,"1044,67228021806 ",.02)
 ;;67228021806
 ;;9002226.02101,"1044,67228021903 ",.01)
 ;;67228021903
 ;;9002226.02101,"1044,67228021903 ",.02)
 ;;67228021903
 ;;9002226.02101,"1044,67228021906 ",.01)
 ;;67228021906
 ;;9002226.02101,"1044,67228021906 ",.02)
 ;;67228021906
 ;;9002226.02101,"1044,67228023203 ",.01)
 ;;67228023203
 ;;9002226.02101,"1044,67228023203 ",.02)
 ;;67228023203
 ;;9002226.02101,"1044,67228023206 ",.01)
 ;;67228023206
 ;;9002226.02101,"1044,67228023206 ",.02)
 ;;67228023206
 ;;9002226.02101,"1044,67228023403 ",.01)
 ;;67228023403
 ;;9002226.02101,"1044,67228023403 ",.02)
 ;;67228023403
 ;;9002226.02101,"1044,67228023406 ",.01)
 ;;67228023406
 ;;9002226.02101,"1044,67228023406 ",.02)
 ;;67228023406
 ;;9002226.02101,"1044,67228025103 ",.01)
 ;;67228025103
 ;;9002226.02101,"1044,67228025103 ",.02)
 ;;67228025103
 ;;9002226.02101,"1044,67228025106 ",.01)
 ;;67228025106
 ;;9002226.02101,"1044,67228025106 ",.02)
 ;;67228025106