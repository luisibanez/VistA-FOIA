BGPM5AXR ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON AUG 30, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1038,00603209421 ",.01)
 ;;00603209421
 ;;9002226.02101,"1038,00603209421 ",.02)
 ;;00603209421
 ;;9002226.02101,"1038,00603209428 ",.01)
 ;;00603209428
 ;;9002226.02101,"1038,00603209428 ",.02)
 ;;00603209428
 ;;9002226.02101,"1038,00677152122 ",.01)
 ;;00677152122
 ;;9002226.02101,"1038,00677152122 ",.02)
 ;;00677152122
 ;;9002226.02101,"1038,00677152272 ",.01)
 ;;00677152272
 ;;9002226.02101,"1038,00677152272 ",.02)
 ;;00677152272
 ;;9002226.02101,"1038,00904287640 ",.01)
 ;;00904287640
 ;;9002226.02101,"1038,00904287640 ",.02)
 ;;00904287640
 ;;9002226.02101,"1038,00904287660 ",.01)
 ;;00904287660
 ;;9002226.02101,"1038,00904287660 ",.02)
 ;;00904287660
 ;;9002226.02101,"1038,00904287740 ",.01)
 ;;00904287740
 ;;9002226.02101,"1038,00904287740 ",.02)
 ;;00904287740
 ;;9002226.02101,"1038,00904287760 ",.01)
 ;;00904287760
 ;;9002226.02101,"1038,00904287760 ",.02)
 ;;00904287760
 ;;9002226.02101,"1038,00904287761 ",.01)
 ;;00904287761
 ;;9002226.02101,"1038,00904287761 ",.02)
 ;;00904287761
 ;;9002226.02101,"1038,00904765855 ",.01)
 ;;00904765855
 ;;9002226.02101,"1038,00904765855 ",.02)
 ;;00904765855
 ;;9002226.02101,"1038,00904768116 ",.01)
 ;;00904768116
 ;;9002226.02101,"1038,00904768116 ",.02)
 ;;00904768116
 ;;9002226.02101,"1038,00904773117 ",.01)
 ;;00904773117
 ;;9002226.02101,"1038,00904773117 ",.02)
 ;;00904773117
 ;;9002226.02101,"1038,11014071025 ",.01)
 ;;11014071025
 ;;9002226.02101,"1038,11014071025 ",.02)
 ;;11014071025
 ;;9002226.02101,"1038,11014071030 ",.01)
 ;;11014071030
 ;;9002226.02101,"1038,11014071030 ",.02)
 ;;11014071030
 ;;9002226.02101,"1038,11014071060 ",.01)
 ;;11014071060
 ;;9002226.02101,"1038,11014071060 ",.02)
 ;;11014071060
 ;;9002226.02101,"1038,11014071930 ",.01)
 ;;11014071930
 ;;9002226.02101,"1038,11014071930 ",.02)
 ;;11014071930
 ;;9002226.02101,"1038,11014071960 ",.01)
 ;;11014071960
 ;;9002226.02101,"1038,11014071960 ",.02)
 ;;11014071960
 ;;9002226.02101,"1038,12634009042 ",.01)
 ;;12634009042
 ;;9002226.02101,"1038,12634009042 ",.02)
 ;;12634009042
 ;;9002226.02101,"1038,13411027702 ",.01)
 ;;13411027702
 ;;9002226.02101,"1038,13411027702 ",.02)
 ;;13411027702
 ;;9002226.02101,"1038,13411027891 ",.01)
 ;;13411027891
 ;;9002226.02101,"1038,13411027891 ",.02)
 ;;13411027891
 ;;9002226.02101,"1038,13411027892 ",.01)
 ;;13411027892
 ;;9002226.02101,"1038,13411027892 ",.02)
 ;;13411027892
 ;;9002226.02101,"1038,13411027894 ",.01)
 ;;13411027894
 ;;9002226.02101,"1038,13411027894 ",.02)
 ;;13411027894
 ;;9002226.02101,"1038,13411027906 ",.01)
 ;;13411027906
 ;;9002226.02101,"1038,13411027906 ",.02)
 ;;13411027906
 ;;9002226.02101,"1038,13411043909 ",.01)
 ;;13411043909
 ;;9002226.02101,"1038,13411043909 ",.02)
 ;;13411043909
 ;;9002226.02101,"1038,16252009722 ",.01)
 ;;16252009722
 ;;9002226.02101,"1038,16252009722 ",.02)
 ;;16252009722
 ;;9002226.02101,"1038,16252009733 ",.01)
 ;;16252009733
 ;;9002226.02101,"1038,16252009733 ",.02)
 ;;16252009733
 ;;9002226.02101,"1038,16252009766 ",.01)
 ;;16252009766
 ;;9002226.02101,"1038,16252009766 ",.02)
 ;;16252009766
 ;;9002226.02101,"1038,16252054733 ",.01)
 ;;16252054733
 ;;9002226.02101,"1038,16252054733 ",.02)
 ;;16252054733
 ;;9002226.02101,"1038,16252054766 ",.01)
 ;;16252054766
 ;;9002226.02101,"1038,16252054766 ",.02)
 ;;16252054766
 ;;9002226.02101,"1038,17270066611 ",.01)
 ;;17270066611
 ;;9002226.02101,"1038,17270066611 ",.02)
 ;;17270066611
 ;;9002226.02101,"1038,17270066622 ",.01)
 ;;17270066622
 ;;9002226.02101,"1038,17270066622 ",.02)
 ;;17270066622
 ;;9002226.02101,"1038,17270072101 ",.01)
 ;;17270072101
 ;;9002226.02101,"1038,17270072101 ",.02)
 ;;17270072101
 ;;9002226.02101,"1038,17270072102 ",.01)
 ;;17270072102
 ;;9002226.02101,"1038,17270072102 ",.02)
 ;;17270072102
 ;;9002226.02101,"1038,17856074002 ",.01)
 ;;17856074002
 ;;9002226.02101,"1038,17856074002 ",.02)
 ;;17856074002
 ;;9002226.02101,"1038,21695019801 ",.01)
 ;;21695019801
 ;;9002226.02101,"1038,21695019801 ",.02)
 ;;21695019801
 ;;9002226.02101,"1038,21695024520 ",.01)
 ;;21695024520
 ;;9002226.02101,"1038,21695024520 ",.02)
 ;;21695024520
 ;;9002226.02101,"1038,21695033225 ",.01)
 ;;21695033225
 ;;9002226.02101,"1038,21695033225 ",.02)
 ;;21695033225
 ;;9002226.02101,"1038,21695035016 ",.01)
 ;;21695035016
 ;;9002226.02101,"1038,21695035016 ",.02)
 ;;21695035016
 ;;9002226.02101,"1038,23490501901 ",.01)
 ;;23490501901
 ;;9002226.02101,"1038,23490501901 ",.02)
 ;;23490501901
 ;;9002226.02101,"1038,23490502001 ",.01)
 ;;23490502001
 ;;9002226.02101,"1038,23490502001 ",.02)
 ;;23490502001
 ;;9002226.02101,"1038,23490502002 ",.01)
 ;;23490502002
 ;;9002226.02101,"1038,23490502002 ",.02)
 ;;23490502002
 ;;9002226.02101,"1038,23490502003 ",.01)
 ;;23490502003
 ;;9002226.02101,"1038,23490502003 ",.02)
 ;;23490502003
 ;;9002226.02101,"1038,23490502102 ",.01)
 ;;23490502102
 ;;9002226.02101,"1038,23490502102 ",.02)
 ;;23490502102
 ;;9002226.02101,"1038,23490502201 ",.01)
 ;;23490502201
 ;;9002226.02101,"1038,23490502201 ",.02)
 ;;23490502201
 ;;9002226.02101,"1038,23490502202 ",.01)
 ;;23490502202
 ;;9002226.02101,"1038,23490502202 ",.02)
 ;;23490502202
 ;;9002226.02101,"1038,23490502300 ",.01)
 ;;23490502300
 ;;9002226.02101,"1038,23490502300 ",.02)
 ;;23490502300
 ;;9002226.02101,"1038,23490502301 ",.01)
 ;;23490502301
 ;;9002226.02101,"1038,23490502301 ",.02)
 ;;23490502301
 ;;9002226.02101,"1038,23490502302 ",.01)
 ;;23490502302
 ;;9002226.02101,"1038,23490502302 ",.02)
 ;;23490502302
 ;;9002226.02101,"1038,23490502501 ",.01)
 ;;23490502501
 ;;9002226.02101,"1038,23490502501 ",.02)
 ;;23490502501
 ;;9002226.02101,"1038,24208034720 ",.01)
 ;;24208034720
 ;;9002226.02101,"1038,24208034720 ",.02)
 ;;24208034720
 ;;9002226.02101,"1038,24208037425 ",.01)
 ;;24208037425
 ;;9002226.02101,"1038,24208037425 ",.02)
 ;;24208037425
 ;;9002226.02101,"1038,24208037460 ",.01)
 ;;24208037460
 ;;9002226.02101,"1038,24208037460 ",.02)
 ;;24208037460
 ;;9002226.02101,"1038,43806048040 ",.01)
 ;;43806048040
 ;;9002226.02101,"1038,43806048040 ",.02)
 ;;43806048040
 ;;9002226.02101,"1038,43806048070 ",.01)
 ;;43806048070
 ;;9002226.02101,"1038,43806048070 ",.02)
 ;;43806048070
 ;;9002226.02101,"1038,43806049940 ",.01)
 ;;43806049940
 ;;9002226.02101,"1038,43806049940 ",.02)
 ;;43806049940
 ;;9002226.02101,"1038,43806049970 ",.01)
 ;;43806049970
 ;;9002226.02101,"1038,43806049970 ",.02)
 ;;43806049970
 ;;9002226.02101,"1038,48879083123 ",.01)
 ;;48879083123
 ;;9002226.02101,"1038,48879083123 ",.02)
 ;;48879083123
 ;;9002226.02101,"1038,48879083130 ",.01)
 ;;48879083130
 ;;9002226.02101,"1038,48879083130 ",.02)
 ;;48879083130
 ;;9002226.02101,"1038,48879083160 ",.01)
 ;;48879083160
 ;;9002226.02101,"1038,48879083160 ",.02)
 ;;48879083160
 ;;9002226.02101,"1038,49502010501 ",.01)
 ;;49502010501
 ;;9002226.02101,"1038,49502010501 ",.02)
 ;;49502010501
 ;;9002226.02101,"1038,49502030317 ",.01)
 ;;49502030317
 ;;9002226.02101,"1038,49502030317 ",.02)
 ;;49502030317
 ;;9002226.02101,"1038,49502030327 ",.01)
 ;;49502030327
 ;;9002226.02101,"1038,49502030327 ",.02)
 ;;49502030327
 ;;9002226.02101,"1038,49502069700 ",.01)
 ;;49502069700
 ;;9002226.02101,"1038,49502069700 ",.02)
 ;;49502069700
 ;;9002226.02101,"1038,49502069703 ",.01)
 ;;49502069703
 ;;9002226.02101,"1038,49502069703 ",.02)
 ;;49502069703
 ;;9002226.02101,"1038,49502069705 ",.01)
 ;;49502069705
 ;;9002226.02101,"1038,49502069705 ",.02)
 ;;49502069705
 ;;9002226.02101,"1038,49502069724 ",.01)
 ;;49502069724
 ;;9002226.02101,"1038,49502069724 ",.02)
 ;;49502069724
 ;;9002226.02101,"1038,49502069729 ",.01)
 ;;49502069729
 ;;9002226.02101,"1038,49502069729 ",.02)
 ;;49502069729
 ;;9002226.02101,"1038,49502069730 ",.01)
 ;;49502069730
 ;;9002226.02101,"1038,49502069730 ",.02)
 ;;49502069730
 ;;9002226.02101,"1038,49502069733 ",.01)
 ;;49502069733
 ;;9002226.02101,"1038,49502069733 ",.02)
 ;;49502069733
 ;;9002226.02101,"1038,49502069760 ",.01)
 ;;49502069760
 ;;9002226.02101,"1038,49502069760 ",.02)
 ;;49502069760
 ;;9002226.02101,"1038,49502069761 ",.01)
 ;;49502069761
 ;;9002226.02101,"1038,49502069761 ",.02)
 ;;49502069761
 ;;9002226.02101,"1038,49502069785 ",.01)
 ;;49502069785
 ;;9002226.02101,"1038,49502069785 ",.02)
 ;;49502069785
 ;;9002226.02101,"1038,49999033816 ",.01)
 ;;49999033816
 ;;9002226.02101,"1038,49999033816 ",.02)
 ;;49999033816
 ;;9002226.02101,"1038,49999034425 ",.01)
 ;;49999034425
 ;;9002226.02101,"1038,49999034425 ",.02)
 ;;49999034425
 ;;9002226.02101,"1038,49999090120 ",.01)
 ;;49999090120
 ;;9002226.02101,"1038,49999090120 ",.02)
 ;;49999090120
 ;;9002226.02101,"1038,50111064501 ",.01)
 ;;50111064501
 ;;9002226.02101,"1038,50111064501 ",.02)
 ;;50111064501
 ;;9002226.02101,"1038,50111064601 ",.01)
 ;;50111064601
 ;;9002226.02101,"1038,50111064601 ",.02)
 ;;50111064601
 ;;9002226.02101,"1038,50383074016 ",.01)
 ;;50383074016
 ;;9002226.02101,"1038,50383074016 ",.02)
 ;;50383074016
 ;;9002226.02101,"1038,50383074120 ",.01)
 ;;50383074120
 ;;9002226.02101,"1038,50383074120 ",.02)
 ;;50383074120
 ;;9002226.02101,"1038,50383074225 ",.01)
 ;;50383074225
 ;;9002226.02101,"1038,50383074225 ",.02)
 ;;50383074225
 ;;9002226.02101,"1038,50550033526 ",.01)
 ;;50550033526
 ;;9002226.02101,"1038,50550033526 ",.02)
 ;;50550033526
 ;;9002226.02101,"1038,50550033550 ",.01)
 ;;50550033550
 ;;9002226.02101,"1038,50550033550 ",.02)
 ;;50550033550
 ;;9002226.02101,"1038,51079065701 ",.01)
 ;;51079065701
 ;;9002226.02101,"1038,51079065701 ",.02)
 ;;51079065701
 ;;9002226.02101,"1038,51079065720 ",.01)
 ;;51079065720
 ;;9002226.02101,"1038,51079065720 ",.02)
 ;;51079065720
 ;;9002226.02101,"1038,51079065801 ",.01)
 ;;51079065801
 ;;9002226.02101,"1038,51079065801 ",.02)
 ;;51079065801
 ;;9002226.02101,"1038,51079065820 ",.01)
 ;;51079065820
 ;;9002226.02101,"1038,51079065820 ",.02)
 ;;51079065820
 ;;9002226.02101,"1038,51079076010 ",.01)
 ;;51079076010
 ;;9002226.02101,"1038,51079076010 ",.02)
 ;;51079076010
 ;;9002226.02101,"1038,51079076038 ",.01)
 ;;51079076038
 ;;9002226.02101,"1038,51079076038 ",.02)
 ;;51079076038
 ;;9002226.02101,"1038,51129154901 ",.01)
 ;;51129154901
 ;;9002226.02101,"1038,51129154901 ",.02)
 ;;51129154901
 ;;9002226.02101,"1038,51129329101 ",.01)
 ;;51129329101
 ;;9002226.02101,"1038,51129329101 ",.02)
 ;;51129329101
 ;;9002226.02101,"1038,51129329102 ",.01)
 ;;51129329102
 ;;9002226.02101,"1038,51129329102 ",.02)
 ;;51129329102
 ;;9002226.02101,"1038,51129339901 ",.01)
 ;;51129339901
 ;;9002226.02101,"1038,51129339901 ",.02)
 ;;51129339901
 ;;9002226.02101,"1038,51129339902 ",.01)
 ;;51129339902
 ;;9002226.02101,"1038,51129339902 ",.02)
 ;;51129339902
 ;;9002226.02101,"1038,52959009403 ",.01)
 ;;52959009403
 ;;9002226.02101,"1038,52959009403 ",.02)
 ;;52959009403
 ;;9002226.02101,"1038,52959015303 ",.01)
 ;;52959015303
 ;;9002226.02101,"1038,52959015303 ",.02)
 ;;52959015303
 ;;9002226.02101,"1038,52959015306 ",.01)
 ;;52959015306
 ;;9002226.02101,"1038,52959015306 ",.02)
 ;;52959015306
 ;;9002226.02101,"1038,52959015309 ",.01)
 ;;52959015309
 ;;9002226.02101,"1038,52959015309 ",.02)
 ;;52959015309
 ;;9002226.02101,"1038,52959042520 ",.01)
 ;;52959042520
 ;;9002226.02101,"1038,52959042520 ",.02)
 ;;52959042520
 ;;9002226.02101,"1038,52959042530 ",.01)
 ;;52959042530
 ;;9002226.02101,"1038,52959042530 ",.02)
 ;;52959042530
 ;;9002226.02101,"1038,52959074120 ",.01)
 ;;52959074120
 ;;9002226.02101,"1038,52959074120 ",.02)
 ;;52959074120
 ;;9002226.02101,"1038,52959090620 ",.01)
 ;;52959090620
