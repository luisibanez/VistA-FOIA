BGPM5AGY ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON JUL 15, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"882,55289021290 ",.02)
 ;;55289021290
 ;;9002226.02101,"882,55289034430 ",.01)
 ;;55289034430
 ;;9002226.02101,"882,55289034430 ",.02)
 ;;55289034430
 ;;9002226.02101,"882,55289034490 ",.01)
 ;;55289034490
 ;;9002226.02101,"882,55289034490 ",.02)
 ;;55289034490
 ;;9002226.02101,"882,55289034497 ",.01)
 ;;55289034497
 ;;9002226.02101,"882,55289034497 ",.02)
 ;;55289034497
 ;;9002226.02101,"882,55289059130 ",.01)
 ;;55289059130
 ;;9002226.02101,"882,55289059130 ",.02)
 ;;55289059130
 ;;9002226.02101,"882,55289059190 ",.01)
 ;;55289059190
 ;;9002226.02101,"882,55289059190 ",.02)
 ;;55289059190
 ;;9002226.02101,"882,55289063801 ",.01)
 ;;55289063801
 ;;9002226.02101,"882,55289063801 ",.02)
 ;;55289063801
 ;;9002226.02101,"882,55289063812 ",.01)
 ;;55289063812
 ;;9002226.02101,"882,55289063812 ",.02)
 ;;55289063812
 ;;9002226.02101,"882,55289063814 ",.01)
 ;;55289063814
 ;;9002226.02101,"882,55289063814 ",.02)
 ;;55289063814
 ;;9002226.02101,"882,55289063830 ",.01)
 ;;55289063830
 ;;9002226.02101,"882,55289063830 ",.02)
 ;;55289063830
 ;;9002226.02101,"882,55289063860 ",.01)
 ;;55289063860
 ;;9002226.02101,"882,55289063860 ",.02)
 ;;55289063860
 ;;9002226.02101,"882,55289063890 ",.01)
 ;;55289063890
 ;;9002226.02101,"882,55289063890 ",.02)
 ;;55289063890
 ;;9002226.02101,"882,55289063898 ",.01)
 ;;55289063898
 ;;9002226.02101,"882,55289063898 ",.02)
 ;;55289063898
 ;;9002226.02101,"882,55289069410 ",.01)
 ;;55289069410
 ;;9002226.02101,"882,55289069410 ",.02)
 ;;55289069410
 ;;9002226.02101,"882,55289069430 ",.01)
 ;;55289069430
 ;;9002226.02101,"882,55289069430 ",.02)
 ;;55289069430
 ;;9002226.02101,"882,55289069490 ",.01)
 ;;55289069490
 ;;9002226.02101,"882,55289069490 ",.02)
 ;;55289069490
 ;;9002226.02101,"882,55289069614 ",.01)
 ;;55289069614
 ;;9002226.02101,"882,55289069614 ",.02)
 ;;55289069614
 ;;9002226.02101,"882,55289069630 ",.01)
 ;;55289069630
 ;;9002226.02101,"882,55289069630 ",.02)
 ;;55289069630
 ;;9002226.02101,"882,55289069660 ",.01)
 ;;55289069660
 ;;9002226.02101,"882,55289069660 ",.02)
 ;;55289069660
 ;;9002226.02101,"882,55289069690 ",.01)
 ;;55289069690
 ;;9002226.02101,"882,55289069690 ",.02)
 ;;55289069690
 ;;9002226.02101,"882,55289069698 ",.01)
 ;;55289069698
 ;;9002226.02101,"882,55289069698 ",.02)
 ;;55289069698
 ;;9002226.02101,"882,55289087830 ",.01)
 ;;55289087830
 ;;9002226.02101,"882,55289087830 ",.02)
 ;;55289087830
 ;;9002226.02101,"882,55289088430 ",.01)
 ;;55289088430
 ;;9002226.02101,"882,55289088430 ",.02)
 ;;55289088430
 ;;9002226.02101,"882,55289088490 ",.01)
 ;;55289088490
 ;;9002226.02101,"882,55289088490 ",.02)
 ;;55289088490
 ;;9002226.02101,"882,55289091730 ",.01)
 ;;55289091730
 ;;9002226.02101,"882,55289091730 ",.02)
 ;;55289091730
 ;;9002226.02101,"882,55289091790 ",.01)
 ;;55289091790
 ;;9002226.02101,"882,55289091790 ",.02)
 ;;55289091790
 ;;9002226.02101,"882,55370092207 ",.01)
 ;;55370092207
 ;;9002226.02101,"882,55370092207 ",.02)
 ;;55370092207
 ;;9002226.02101,"882,55370092209 ",.01)
 ;;55370092209
 ;;9002226.02101,"882,55370092209 ",.02)
 ;;55370092209
 ;;9002226.02101,"882,55370092307 ",.01)
 ;;55370092307
 ;;9002226.02101,"882,55370092307 ",.02)
 ;;55370092307
 ;;9002226.02101,"882,55370092309 ",.01)
 ;;55370092309
 ;;9002226.02101,"882,55370092309 ",.02)
 ;;55370092309
 ;;9002226.02101,"882,55370092407 ",.01)
 ;;55370092407
 ;;9002226.02101,"882,55370092407 ",.02)
 ;;55370092407
 ;;9002226.02101,"882,55370092409 ",.01)
 ;;55370092409
 ;;9002226.02101,"882,55370092409 ",.02)
 ;;55370092409
 ;;9002226.02101,"882,55370092507 ",.01)
 ;;55370092507
 ;;9002226.02101,"882,55370092507 ",.02)
 ;;55370092507
 ;;9002226.02101,"882,55370092509 ",.01)
 ;;55370092509
 ;;9002226.02101,"882,55370092509 ",.02)
 ;;55370092509
 ;;9002226.02101,"882,55390071201 ",.01)
 ;;55390071201
 ;;9002226.02101,"882,55390071201 ",.02)
 ;;55390071201
 ;;9002226.02101,"882,55567023301 ",.01)
 ;;55567023301
 ;;9002226.02101,"882,55567023301 ",.02)
 ;;55567023301
 ;;9002226.02101,"882,55567023401 ",.01)
 ;;55567023401
 ;;9002226.02101,"882,55567023401 ",.02)
 ;;55567023401
 ;;9002226.02101,"882,55567027109 ",.01)
 ;;55567027109
 ;;9002226.02101,"882,55567027109 ",.02)
 ;;55567027109
 ;;9002226.02101,"882,55567027209 ",.01)
 ;;55567027209
 ;;9002226.02101,"882,55567027209 ",.02)
 ;;55567027209
 ;;9002226.02101,"882,55567027309 ",.01)
 ;;55567027309
 ;;9002226.02101,"882,55567027309 ",.02)
 ;;55567027309
 ;;9002226.02101,"882,55567027409 ",.01)
 ;;55567027409
 ;;9002226.02101,"882,55567027409 ",.02)
 ;;55567027409
 ;;9002226.02101,"882,55648090201 ",.01)
 ;;55648090201
 ;;9002226.02101,"882,55648090201 ",.02)
 ;;55648090201
 ;;9002226.02101,"882,55648090202 ",.01)
 ;;55648090202
 ;;9002226.02101,"882,55648090202 ",.02)
 ;;55648090202
 ;;9002226.02101,"882,55648090203 ",.01)
 ;;55648090203
 ;;9002226.02101,"882,55648090203 ",.02)
 ;;55648090203
 ;;9002226.02101,"882,55648090204 ",.01)
 ;;55648090204
 ;;9002226.02101,"882,55648090204 ",.02)
 ;;55648090204
 ;;9002226.02101,"882,55648090301 ",.01)
 ;;55648090301
 ;;9002226.02101,"882,55648090301 ",.02)
 ;;55648090301
 ;;9002226.02101,"882,55648090302 ",.01)
 ;;55648090302
 ;;9002226.02101,"882,55648090302 ",.02)
 ;;55648090302
 ;;9002226.02101,"882,55648090303 ",.01)
 ;;55648090303
 ;;9002226.02101,"882,55648090303 ",.02)
 ;;55648090303
 ;;9002226.02101,"882,55648090304 ",.01)
 ;;55648090304
 ;;9002226.02101,"882,55648090304 ",.02)
 ;;55648090304
 ;;9002226.02101,"882,55648090401 ",.01)
 ;;55648090401
 ;;9002226.02101,"882,55648090401 ",.02)
 ;;55648090401
 ;;9002226.02101,"882,55648090402 ",.01)
 ;;55648090402
 ;;9002226.02101,"882,55648090402 ",.02)
 ;;55648090402
 ;;9002226.02101,"882,55648090403 ",.01)
 ;;55648090403
 ;;9002226.02101,"882,55648090403 ",.02)
 ;;55648090403
 ;;9002226.02101,"882,55648090404 ",.01)
 ;;55648090404
 ;;9002226.02101,"882,55648090404 ",.02)
 ;;55648090404
 ;;9002226.02101,"882,55648090501 ",.01)
 ;;55648090501
 ;;9002226.02101,"882,55648090501 ",.02)
 ;;55648090501
 ;;9002226.02101,"882,55648090502 ",.01)
 ;;55648090502
 ;;9002226.02101,"882,55648090502 ",.02)
 ;;55648090502
 ;;9002226.02101,"882,55648090503 ",.01)
 ;;55648090503
 ;;9002226.02101,"882,55648090503 ",.02)
 ;;55648090503
 ;;9002226.02101,"882,55648092301 ",.01)
 ;;55648092301
 ;;9002226.02101,"882,55648092301 ",.02)
 ;;55648092301
 ;;9002226.02101,"882,55648092302 ",.01)
 ;;55648092302
 ;;9002226.02101,"882,55648092302 ",.02)
 ;;55648092302
 ;;9002226.02101,"882,55648092303 ",.01)
 ;;55648092303
 ;;9002226.02101,"882,55648092303 ",.02)
 ;;55648092303
 ;;9002226.02101,"882,55648092401 ",.01)
 ;;55648092401
 ;;9002226.02101,"882,55648092401 ",.02)
 ;;55648092401
 ;;9002226.02101,"882,55648092402 ",.01)
 ;;55648092402
 ;;9002226.02101,"882,55648092402 ",.02)
 ;;55648092402
 ;;9002226.02101,"882,55648092403 ",.01)
 ;;55648092403
 ;;9002226.02101,"882,55648092403 ",.02)
 ;;55648092403
 ;;9002226.02101,"882,55648092501 ",.01)
 ;;55648092501
 ;;9002226.02101,"882,55648092501 ",.02)
 ;;55648092501
 ;;9002226.02101,"882,55648092502 ",.01)
 ;;55648092502
 ;;9002226.02101,"882,55648092502 ",.02)
 ;;55648092502
 ;;9002226.02101,"882,55648092503 ",.01)
 ;;55648092503
 ;;9002226.02101,"882,55648092503 ",.02)
 ;;55648092503
 ;;9002226.02101,"882,55648092601 ",.01)
 ;;55648092601
 ;;9002226.02101,"882,55648092601 ",.02)
 ;;55648092601
 ;;9002226.02101,"882,55648092602 ",.01)
 ;;55648092602
 ;;9002226.02101,"882,55648092602 ",.02)
 ;;55648092602
 ;;9002226.02101,"882,55648092603 ",.01)
 ;;55648092603
 ;;9002226.02101,"882,55648092603 ",.02)
 ;;55648092603
 ;;9002226.02101,"882,55648092701 ",.01)
 ;;55648092701
 ;;9002226.02101,"882,55648092701 ",.02)
 ;;55648092701
 ;;9002226.02101,"882,55648092702 ",.01)
 ;;55648092702
 ;;9002226.02101,"882,55648092702 ",.02)
 ;;55648092702
 ;;9002226.02101,"882,55648092705 ",.01)
 ;;55648092705
 ;;9002226.02101,"882,55648092705 ",.02)
 ;;55648092705
 ;;9002226.02101,"882,55648092801 ",.01)
 ;;55648092801
 ;;9002226.02101,"882,55648092801 ",.02)
 ;;55648092801
 ;;9002226.02101,"882,55648092802 ",.01)
 ;;55648092802
 ;;9002226.02101,"882,55648092802 ",.02)
 ;;55648092802
 ;;9002226.02101,"882,55648092805 ",.01)
 ;;55648092805
 ;;9002226.02101,"882,55648092805 ",.02)
 ;;55648092805
 ;;9002226.02101,"882,55648092806 ",.01)
 ;;55648092806
 ;;9002226.02101,"882,55648092806 ",.02)
 ;;55648092806
 ;;9002226.02101,"882,55648092901 ",.01)
 ;;55648092901
 ;;9002226.02101,"882,55648092901 ",.02)
 ;;55648092901
 ;;9002226.02101,"882,55648092902 ",.01)
 ;;55648092902
 ;;9002226.02101,"882,55648092902 ",.02)
 ;;55648092902
 ;;9002226.02101,"882,55648092905 ",.01)
 ;;55648092905
 ;;9002226.02101,"882,55648092905 ",.02)
 ;;55648092905
 ;;9002226.02101,"882,55648092906 ",.01)
 ;;55648092906
 ;;9002226.02101,"882,55648092906 ",.02)
 ;;55648092906
 ;;9002226.02101,"882,55648094101 ",.01)
 ;;55648094101
 ;;9002226.02101,"882,55648094101 ",.02)
 ;;55648094101
 ;;9002226.02101,"882,55648094102 ",.01)
 ;;55648094102
 ;;9002226.02101,"882,55648094102 ",.02)
 ;;55648094102
 ;;9002226.02101,"882,55648094105 ",.01)
 ;;55648094105
 ;;9002226.02101,"882,55648094105 ",.02)
 ;;55648094105
 ;;9002226.02101,"882,55648094106 ",.01)
 ;;55648094106
 ;;9002226.02101,"882,55648094106 ",.02)
 ;;55648094106
 ;;9002226.02101,"882,55648094201 ",.01)
 ;;55648094201
 ;;9002226.02101,"882,55648094201 ",.02)
 ;;55648094201
 ;;9002226.02101,"882,55648094202 ",.01)
 ;;55648094202
 ;;9002226.02101,"882,55648094202 ",.02)
 ;;55648094202
 ;;9002226.02101,"882,55648094205 ",.01)
 ;;55648094205
 ;;9002226.02101,"882,55648094205 ",.02)
 ;;55648094205
 ;;9002226.02101,"882,55648095301 ",.01)
 ;;55648095301
 ;;9002226.02101,"882,55648095301 ",.02)
 ;;55648095301
 ;;9002226.02101,"882,55648095302 ",.01)
 ;;55648095302
 ;;9002226.02101,"882,55648095302 ",.02)
 ;;55648095302
 ;;9002226.02101,"882,55648095305 ",.01)
 ;;55648095305
 ;;9002226.02101,"882,55648095305 ",.02)
 ;;55648095305
 ;;9002226.02101,"882,55887009930 ",.01)
 ;;55887009930
 ;;9002226.02101,"882,55887009930 ",.02)
 ;;55887009930
 ;;9002226.02101,"882,55887022730 ",.01)
 ;;55887022730
 ;;9002226.02101,"882,55887022730 ",.02)
 ;;55887022730
 ;;9002226.02101,"882,55887022760 ",.01)
 ;;55887022760
 ;;9002226.02101,"882,55887022760 ",.02)
 ;;55887022760
 ;;9002226.02101,"882,55887022790 ",.01)
 ;;55887022790
 ;;9002226.02101,"882,55887022790 ",.02)
 ;;55887022790
 ;;9002226.02101,"882,55887030430 ",.01)
 ;;55887030430
 ;;9002226.02101,"882,55887030430 ",.02)
 ;;55887030430
 ;;9002226.02101,"882,55887030460 ",.01)
 ;;55887030460
 ;;9002226.02101,"882,55887030460 ",.02)
 ;;55887030460
 ;;9002226.02101,"882,55887030490 ",.01)
 ;;55887030490
 ;;9002226.02101,"882,55887030490 ",.02)
 ;;55887030490
 ;;9002226.02101,"882,55887042520 ",.01)
 ;;55887042520
 ;;9002226.02101,"882,55887042520 ",.02)
 ;;55887042520
 ;;9002226.02101,"882,55887042530 ",.01)
 ;;55887042530
 ;;9002226.02101,"882,55887042530 ",.02)
 ;;55887042530
 ;;9002226.02101,"882,55887042560 ",.01)
 ;;55887042560
 ;;9002226.02101,"882,55887042560 ",.02)
 ;;55887042560
 ;;9002226.02101,"882,55887042590 ",.01)
 ;;55887042590
 ;;9002226.02101,"882,55887042590 ",.02)
 ;;55887042590
 ;;9002226.02101,"882,55887042620 ",.01)
 ;;55887042620
 ;;9002226.02101,"882,55887042620 ",.02)
 ;;55887042620
 ;;9002226.02101,"882,55887042630 ",.01)
 ;;55887042630
 ;;9002226.02101,"882,55887042630 ",.02)
 ;;55887042630
 ;;9002226.02101,"882,55887042660 ",.01)
 ;;55887042660