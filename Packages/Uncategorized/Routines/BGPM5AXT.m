BGPM5AXT ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON AUG 30, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1038,59930164702 ",.01)
 ;;59930164702
 ;;9002226.02101,"1038,59930164702 ",.02)
 ;;59930164702
 ;;9002226.02101,"1038,61392056725 ",.01)
 ;;61392056725
 ;;9002226.02101,"1038,61392056725 ",.02)
 ;;61392056725
 ;;9002226.02101,"1038,61392056730 ",.01)
 ;;61392056730
 ;;9002226.02101,"1038,61392056730 ",.02)
 ;;61392056730
 ;;9002226.02101,"1038,61392056731 ",.01)
 ;;61392056731
 ;;9002226.02101,"1038,61392056731 ",.02)
 ;;61392056731
 ;;9002226.02101,"1038,61392056739 ",.01)
 ;;61392056739
 ;;9002226.02101,"1038,61392056739 ",.02)
 ;;61392056739
 ;;9002226.02101,"1038,61392056745 ",.01)
 ;;61392056745
 ;;9002226.02101,"1038,61392056745 ",.02)
 ;;61392056745
 ;;9002226.02101,"1038,61392056756 ",.01)
 ;;61392056756
 ;;9002226.02101,"1038,61392056756 ",.02)
 ;;61392056756
 ;;9002226.02101,"1038,61392056760 ",.01)
 ;;61392056760
 ;;9002226.02101,"1038,61392056760 ",.02)
 ;;61392056760
 ;;9002226.02101,"1038,61392056765 ",.01)
 ;;61392056765
 ;;9002226.02101,"1038,61392056765 ",.02)
 ;;61392056765
 ;;9002226.02101,"1038,61392056790 ",.01)
 ;;61392056790
 ;;9002226.02101,"1038,61392056790 ",.02)
 ;;61392056790
 ;;9002226.02101,"1038,61392056791 ",.01)
 ;;61392056791
 ;;9002226.02101,"1038,61392056791 ",.02)
 ;;61392056791
 ;;9002226.02101,"1038,61392056795 ",.01)
 ;;61392056795
 ;;9002226.02101,"1038,61392056795 ",.02)
 ;;61392056795
 ;;9002226.02101,"1038,61392057025 ",.01)
 ;;61392057025
 ;;9002226.02101,"1038,61392057025 ",.02)
 ;;61392057025
 ;;9002226.02101,"1038,61392057030 ",.01)
 ;;61392057030
 ;;9002226.02101,"1038,61392057030 ",.02)
 ;;61392057030
 ;;9002226.02101,"1038,61392057031 ",.01)
 ;;61392057031
 ;;9002226.02101,"1038,61392057031 ",.02)
 ;;61392057031
 ;;9002226.02101,"1038,61392057039 ",.01)
 ;;61392057039
 ;;9002226.02101,"1038,61392057039 ",.02)
 ;;61392057039
 ;;9002226.02101,"1038,61392057045 ",.01)
 ;;61392057045
 ;;9002226.02101,"1038,61392057045 ",.02)
 ;;61392057045
 ;;9002226.02101,"1038,61392057054 ",.01)
 ;;61392057054
 ;;9002226.02101,"1038,61392057054 ",.02)
 ;;61392057054
 ;;9002226.02101,"1038,61392057056 ",.01)
 ;;61392057056
 ;;9002226.02101,"1038,61392057056 ",.02)
 ;;61392057056
 ;;9002226.02101,"1038,61392057060 ",.01)
 ;;61392057060
 ;;9002226.02101,"1038,61392057060 ",.02)
 ;;61392057060
 ;;9002226.02101,"1038,61392057065 ",.01)
 ;;61392057065
 ;;9002226.02101,"1038,61392057065 ",.02)
 ;;61392057065
 ;;9002226.02101,"1038,61392057090 ",.01)
 ;;61392057090
 ;;9002226.02101,"1038,61392057090 ",.02)
 ;;61392057090
 ;;9002226.02101,"1038,61392057091 ",.01)
 ;;61392057091
 ;;9002226.02101,"1038,61392057091 ",.02)
 ;;61392057091
 ;;9002226.02101,"1038,61392057095 ",.01)
 ;;61392057095
 ;;9002226.02101,"1038,61392057095 ",.02)
 ;;61392057095
 ;;9002226.02101,"1038,62584060501 ",.01)
 ;;62584060501
 ;;9002226.02101,"1038,62584060501 ",.02)
 ;;62584060501
 ;;9002226.02101,"1038,62584060601 ",.01)
 ;;62584060601
 ;;9002226.02101,"1038,62584060601 ",.02)
 ;;62584060601
 ;;9002226.02101,"1038,62947640504 ",.01)
 ;;62947640504
 ;;9002226.02101,"1038,62947640504 ",.02)
 ;;62947640504
 ;;9002226.02101,"1038,62947640509 ",.01)
 ;;62947640509
 ;;9002226.02101,"1038,62947640509 ",.02)
 ;;62947640509
 ;;9002226.02101,"1038,63629182801 ",.01)
 ;;63629182801
 ;;9002226.02101,"1038,63629182801 ",.02)
 ;;63629182801
 ;;9002226.02101,"1038,63629182802 ",.01)
 ;;63629182802
 ;;9002226.02101,"1038,63629182802 ",.02)
 ;;63629182802
 ;;9002226.02101,"1038,63629263801 ",.01)
 ;;63629263801
 ;;9002226.02101,"1038,63629263801 ",.02)
 ;;63629263801
 ;;9002226.02101,"1038,63629263802 ",.01)
 ;;63629263802
 ;;9002226.02101,"1038,63629263802 ",.02)
 ;;63629263802
 ;;9002226.02101,"1038,63629273601 ",.01)
 ;;63629273601
 ;;9002226.02101,"1038,63629273601 ",.02)
 ;;63629273601
 ;;9002226.02101,"1038,63874037701 ",.01)
 ;;63874037701
 ;;9002226.02101,"1038,63874037701 ",.02)
 ;;63874037701
 ;;9002226.02101,"1038,63874037712 ",.01)
 ;;63874037712
 ;;9002226.02101,"1038,63874037712 ",.02)
 ;;63874037712
 ;;9002226.02101,"1038,63874037715 ",.01)
 ;;63874037715
 ;;9002226.02101,"1038,63874037715 ",.02)
 ;;63874037715
 ;;9002226.02101,"1038,63874037720 ",.01)
 ;;63874037720
 ;;9002226.02101,"1038,63874037720 ",.02)
 ;;63874037720
 ;;9002226.02101,"1038,63874037724 ",.01)
 ;;63874037724
 ;;9002226.02101,"1038,63874037724 ",.02)
 ;;63874037724
 ;;9002226.02101,"1038,63874037730 ",.01)
 ;;63874037730
 ;;9002226.02101,"1038,63874037730 ",.02)
 ;;63874037730
 ;;9002226.02101,"1038,63874037801 ",.01)
 ;;63874037801
 ;;9002226.02101,"1038,63874037801 ",.02)
 ;;63874037801
 ;;9002226.02101,"1038,63874037824 ",.01)
 ;;63874037824
 ;;9002226.02101,"1038,63874037824 ",.02)
 ;;63874037824
 ;;9002226.02101,"1038,63874037850 ",.01)
 ;;63874037850
 ;;9002226.02101,"1038,63874037850 ",.02)
 ;;63874037850
 ;;9002226.02101,"1038,63874048501 ",.01)
 ;;63874048501
 ;;9002226.02101,"1038,63874048501 ",.02)
 ;;63874048501
 ;;9002226.02101,"1038,63874048503 ",.01)
 ;;63874048503
 ;;9002226.02101,"1038,63874048503 ",.02)
 ;;63874048503
 ;;9002226.02101,"1038,63874048505 ",.01)
 ;;63874048505
 ;;9002226.02101,"1038,63874048505 ",.02)
 ;;63874048505
 ;;9002226.02101,"1038,63874048512 ",.01)
 ;;63874048512
 ;;9002226.02101,"1038,63874048512 ",.02)
 ;;63874048512
 ;;9002226.02101,"1038,63874048515 ",.01)
 ;;63874048515
 ;;9002226.02101,"1038,63874048515 ",.02)
 ;;63874048515
 ;;9002226.02101,"1038,63874048520 ",.01)
 ;;63874048520
 ;;9002226.02101,"1038,63874048520 ",.02)
 ;;63874048520
 ;;9002226.02101,"1038,63874048524 ",.01)
 ;;63874048524
 ;;9002226.02101,"1038,63874048524 ",.02)
 ;;63874048524
 ;;9002226.02101,"1038,63874048530 ",.01)
 ;;63874048530
 ;;9002226.02101,"1038,63874048530 ",.02)
 ;;63874048530
 ;;9002226.02101,"1038,63874048560 ",.01)
 ;;63874048560
 ;;9002226.02101,"1038,63874048560 ",.02)
 ;;63874048560
 ;;9002226.02101,"1038,63874070820 ",.01)
 ;;63874070820
 ;;9002226.02101,"1038,63874070820 ",.02)
 ;;63874070820
 ;;9002226.02101,"1038,63874070901 ",.01)
 ;;63874070901
 ;;9002226.02101,"1038,63874070901 ",.02)
 ;;63874070901
 ;;9002226.02101,"1038,63874070912 ",.01)
 ;;63874070912
 ;;9002226.02101,"1038,63874070912 ",.02)
 ;;63874070912
 ;;9002226.02101,"1038,63874070924 ",.01)
 ;;63874070924
 ;;9002226.02101,"1038,63874070924 ",.02)
 ;;63874070924
 ;;9002226.02101,"1038,63874070948 ",.01)
 ;;63874070948
 ;;9002226.02101,"1038,63874070948 ",.02)
 ;;63874070948
 ;;9002226.02101,"1038,63874070990 ",.01)
 ;;63874070990
 ;;9002226.02101,"1038,63874070990 ",.02)
 ;;63874070990
 ;;9002226.02101,"1038,65271000205 ",.01)
 ;;65271000205
 ;;9002226.02101,"1038,65271000205 ",.02)
 ;;65271000205
 ;;9002226.02101,"1038,65271000206 ",.01)
 ;;65271000206
 ;;9002226.02101,"1038,65271000206 ",.02)
 ;;65271000206
 ;;9002226.02101,"1038,65302008301 ",.01)
 ;;65302008301
 ;;9002226.02101,"1038,65302008301 ",.02)
 ;;65302008301
 ;;9002226.02101,"1038,65302008302 ",.01)
 ;;65302008302
 ;;9002226.02101,"1038,65302008302 ",.02)
 ;;65302008302
 ;;9002226.02101,"1038,65302008303 ",.01)
 ;;65302008303
 ;;9002226.02101,"1038,65302008303 ",.02)
 ;;65302008303
 ;;9002226.02101,"1038,66267001010 ",.01)
 ;;66267001010
 ;;9002226.02101,"1038,66267001010 ",.02)
 ;;66267001010
 ;;9002226.02101,"1038,66267001020 ",.01)
 ;;66267001020
 ;;9002226.02101,"1038,66267001020 ",.02)
 ;;66267001020
 ;;9002226.02101,"1038,66267001030 ",.01)
 ;;66267001030
 ;;9002226.02101,"1038,66267001030 ",.02)
 ;;66267001030
 ;;9002226.02101,"1038,66267001040 ",.01)
 ;;66267001040
 ;;9002226.02101,"1038,66267001040 ",.02)
 ;;66267001040
 ;;9002226.02101,"1038,66267001060 ",.01)
 ;;66267001060
 ;;9002226.02101,"1038,66267001060 ",.02)
 ;;66267001060
 ;;9002226.02101,"1038,66267074604 ",.01)
 ;;66267074604
 ;;9002226.02101,"1038,66267074604 ",.02)
 ;;66267074604
 ;;9002226.02101,"1038,66267074605 ",.01)
 ;;66267074605
 ;;9002226.02101,"1038,66267074605 ",.02)
 ;;66267074605
 ;;9002226.02101,"1038,66267074606 ",.01)
 ;;66267074606
 ;;9002226.02101,"1038,66267074606 ",.02)
 ;;66267074606
 ;;9002226.02101,"1038,66267099517 ",.01)
 ;;66267099517
 ;;9002226.02101,"1038,66267099517 ",.02)
 ;;66267099517
 ;;9002226.02101,"1038,66336005430 ",.01)
 ;;66336005430
 ;;9002226.02101,"1038,66336005430 ",.02)
 ;;66336005430
 ;;9002226.02101,"1038,66336005490 ",.01)
 ;;66336005490
 ;;9002226.02101,"1038,66336005490 ",.02)
 ;;66336005490
 ;;9002226.02101,"1038,66336028520 ",.01)
 ;;66336028520
 ;;9002226.02101,"1038,66336028520 ",.02)
 ;;66336028520
 ;;9002226.02101,"1038,66336028530 ",.01)
 ;;66336028530
 ;;9002226.02101,"1038,66336028530 ",.02)
 ;;66336028530
 ;;9002226.02101,"1038,66689023057 ",.01)
 ;;66689023057
 ;;9002226.02101,"1038,66689023057 ",.02)
 ;;66689023057
 ;;9002226.02101,"1038,66794000125 ",.01)
 ;;66794000125
 ;;9002226.02101,"1038,66794000125 ",.02)
 ;;66794000125
 ;;9002226.02101,"1038,66794000130 ",.01)
 ;;66794000130
 ;;9002226.02101,"1038,66794000130 ",.02)
 ;;66794000130
 ;;9002226.02101,"1038,66794000160 ",.01)
 ;;66794000160
 ;;9002226.02101,"1038,66794000160 ",.02)
 ;;66794000160
 ;;9002226.02101,"1038,66993023057 ",.01)
 ;;66993023057
 ;;9002226.02101,"1038,66993023057 ",.02)
 ;;66993023057
 ;;9002226.02101,"1038,67296015001 ",.01)
 ;;67296015001
 ;;9002226.02101,"1038,67296015001 ",.02)
 ;;67296015001
 ;;9002226.02101,"1038,67296027701 ",.01)
 ;;67296027701
 ;;9002226.02101,"1038,67296027701 ",.02)
 ;;67296027701
 ;;9002226.02101,"1038,68071027520 ",.01)
 ;;68071027520
 ;;9002226.02101,"1038,68071027520 ",.02)
 ;;68071027520
 ;;9002226.02101,"1038,68774040001 ",.01)
 ;;68774040001
 ;;9002226.02101,"1038,68774040001 ",.02)
 ;;68774040001
 ;;9002226.02101,"1038,68774040101 ",.01)
 ;;68774040101
 ;;9002226.02101,"1038,68774040101 ",.02)
 ;;68774040101
 ;;9002226.02101,"1038,68788000102 ",.01)
 ;;68788000102
 ;;9002226.02101,"1038,68788000102 ",.02)
 ;;68788000102
 ;;9002226.02101,"1038,68788013402 ",.01)
 ;;68788013402
 ;;9002226.02101,"1038,68788013402 ",.02)
 ;;68788013402
 ;;9002226.02101,"1038,68788017701 ",.01)
 ;;68788017701
 ;;9002226.02101,"1038,68788017701 ",.02)
 ;;68788017701
 ;;9002226.02101,"1038,68788017703 ",.01)
 ;;68788017703
 ;;9002226.02101,"1038,68788017703 ",.02)
 ;;68788017703
 ;;9002226.02101,"1038,68788017706 ",.01)
 ;;68788017706
 ;;9002226.02101,"1038,68788017706 ",.02)
 ;;68788017706
 ;;9002226.02101,"1038,68788017709 ",.01)
 ;;68788017709
 ;;9002226.02101,"1038,68788017709 ",.02)
 ;;68788017709
 ;;9002226.02101,"1038,68788025501 ",.01)
 ;;68788025501
 ;;9002226.02101,"1038,68788025501 ",.02)
 ;;68788025501
 ;;9002226.02101,"1038,68788025502 ",.01)
 ;;68788025502
 ;;9002226.02101,"1038,68788025502 ",.02)
 ;;68788025502
 ;;9002226.02101,"1038,68788025503 ",.01)
 ;;68788025503
 ;;9002226.02101,"1038,68788025503 ",.02)
 ;;68788025503
 ;;9002226.02101,"1038,68788025506 ",.01)
 ;;68788025506
 ;;9002226.02101,"1038,68788025506 ",.02)
 ;;68788025506
 ;;9002226.02101,"1038,68788074000 ",.01)
 ;;68788074000
 ;;9002226.02101,"1038,68788074000 ",.02)
 ;;68788074000
 ;;9002226.02101,"1038,68788074102 ",.01)
 ;;68788074102
 ;;9002226.02101,"1038,68788074102 ",.02)
 ;;68788074102
 ;;9002226.02101,"1038,68788082500 ",.01)
 ;;68788082500
 ;;9002226.02101,"1038,68788082500 ",.02)
 ;;68788082500
 ;;9002226.02101,"1038,68788082504 ",.01)
 ;;68788082504
 ;;9002226.02101,"1038,68788082504 ",.02)
 ;;68788082504
 ;;9002226.02101,"1038,68788156601 ",.01)
 ;;68788156601
 ;;9002226.02101,"1038,68788156601 ",.02)
 ;;68788156601
