BGPM3AFK ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON APR 21, 2011;
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"791,61392090539 ",.02)
 ;;61392090539
 ;;9002226.02101,"791,61392090560 ",.01)
 ;;61392090560
 ;;9002226.02101,"791,61392090560 ",.02)
 ;;61392090560
 ;;9002226.02101,"791,61392090565 ",.01)
 ;;61392090565
 ;;9002226.02101,"791,61392090565 ",.02)
 ;;61392090565
 ;;9002226.02101,"791,61392090590 ",.01)
 ;;61392090590
 ;;9002226.02101,"791,61392090590 ",.02)
 ;;61392090590
 ;;9002226.02101,"791,61392090595 ",.01)
 ;;61392090595
 ;;9002226.02101,"791,61392090595 ",.02)
 ;;61392090595
 ;;9002226.02101,"791,61392090625 ",.01)
 ;;61392090625
 ;;9002226.02101,"791,61392090625 ",.02)
 ;;61392090625
 ;;9002226.02101,"791,61392090630 ",.01)
 ;;61392090630
 ;;9002226.02101,"791,61392090630 ",.02)
 ;;61392090630
 ;;9002226.02101,"791,61392090631 ",.01)
 ;;61392090631
 ;;9002226.02101,"791,61392090631 ",.02)
 ;;61392090631
 ;;9002226.02101,"791,61392090639 ",.01)
 ;;61392090639
 ;;9002226.02101,"791,61392090639 ",.02)
 ;;61392090639
 ;;9002226.02101,"791,61392090660 ",.01)
 ;;61392090660
 ;;9002226.02101,"791,61392090660 ",.02)
 ;;61392090660
 ;;9002226.02101,"791,61392090665 ",.01)
 ;;61392090665
 ;;9002226.02101,"791,61392090665 ",.02)
 ;;61392090665
 ;;9002226.02101,"791,61392090690 ",.01)
 ;;61392090690
 ;;9002226.02101,"791,61392090690 ",.02)
 ;;61392090690
 ;;9002226.02101,"791,61392090695 ",.01)
 ;;61392090695
 ;;9002226.02101,"791,61392090695 ",.02)
 ;;61392090695
 ;;9002226.02101,"791,61392090723 ",.01)
 ;;61392090723
 ;;9002226.02101,"791,61392090723 ",.02)
 ;;61392090723
 ;;9002226.02101,"791,61392090725 ",.01)
 ;;61392090725
 ;;9002226.02101,"791,61392090725 ",.02)
 ;;61392090725
 ;;9002226.02101,"791,61392090730 ",.01)
 ;;61392090730
 ;;9002226.02101,"791,61392090730 ",.02)
 ;;61392090730
 ;;9002226.02101,"791,61392090731 ",.01)
 ;;61392090731
 ;;9002226.02101,"791,61392090731 ",.02)
 ;;61392090731
 ;;9002226.02101,"791,61392090739 ",.01)
 ;;61392090739
 ;;9002226.02101,"791,61392090739 ",.02)
 ;;61392090739
 ;;9002226.02101,"791,61392090760 ",.01)
 ;;61392090760
 ;;9002226.02101,"791,61392090760 ",.02)
 ;;61392090760
 ;;9002226.02101,"791,61392090765 ",.01)
 ;;61392090765
 ;;9002226.02101,"791,61392090765 ",.02)
 ;;61392090765
 ;;9002226.02101,"791,61392090790 ",.01)
 ;;61392090790
 ;;9002226.02101,"791,61392090790 ",.02)
 ;;61392090790
 ;;9002226.02101,"791,61392090795 ",.01)
 ;;61392090795
 ;;9002226.02101,"791,61392090795 ",.02)
 ;;61392090795
 ;;9002226.02101,"791,61392090925 ",.01)
 ;;61392090925
 ;;9002226.02101,"791,61392090925 ",.02)
 ;;61392090925
 ;;9002226.02101,"791,61392090930 ",.01)
 ;;61392090930
 ;;9002226.02101,"791,61392090930 ",.02)
 ;;61392090930
 ;;9002226.02101,"791,61392090931 ",.01)
 ;;61392090931
 ;;9002226.02101,"791,61392090931 ",.02)
 ;;61392090931
 ;;9002226.02101,"791,61392090939 ",.01)
 ;;61392090939
 ;;9002226.02101,"791,61392090939 ",.02)
 ;;61392090939
 ;;9002226.02101,"791,61392090960 ",.01)
 ;;61392090960
 ;;9002226.02101,"791,61392090960 ",.02)
 ;;61392090960
 ;;9002226.02101,"791,61392090965 ",.01)
 ;;61392090965
 ;;9002226.02101,"791,61392090965 ",.02)
 ;;61392090965
 ;;9002226.02101,"791,61392090990 ",.01)
 ;;61392090990
 ;;9002226.02101,"791,61392090990 ",.02)
 ;;61392090990
 ;;9002226.02101,"791,61392090995 ",.01)
 ;;61392090995
 ;;9002226.02101,"791,61392090995 ",.02)
 ;;61392090995
 ;;9002226.02101,"791,61392091125 ",.01)
 ;;61392091125
 ;;9002226.02101,"791,61392091125 ",.02)
 ;;61392091125
 ;;9002226.02101,"791,61392091130 ",.01)
 ;;61392091130
 ;;9002226.02101,"791,61392091130 ",.02)
 ;;61392091130
 ;;9002226.02101,"791,61392091131 ",.01)
 ;;61392091131
 ;;9002226.02101,"791,61392091131 ",.02)
 ;;61392091131
 ;;9002226.02101,"791,61392091139 ",.01)
 ;;61392091139
 ;;9002226.02101,"791,61392091139 ",.02)
 ;;61392091139
 ;;9002226.02101,"791,61392091160 ",.01)
 ;;61392091160
 ;;9002226.02101,"791,61392091160 ",.02)
 ;;61392091160
 ;;9002226.02101,"791,61392091165 ",.01)
 ;;61392091165
 ;;9002226.02101,"791,61392091165 ",.02)
 ;;61392091165
 ;;9002226.02101,"791,61392091190 ",.01)
 ;;61392091190
 ;;9002226.02101,"791,61392091190 ",.02)
 ;;61392091190
 ;;9002226.02101,"791,61392091195 ",.01)
 ;;61392091195
 ;;9002226.02101,"791,61392091195 ",.02)
 ;;61392091195
 ;;9002226.02101,"791,61392092023 ",.01)
 ;;61392092023
 ;;9002226.02101,"791,61392092023 ",.02)
 ;;61392092023
 ;;9002226.02101,"791,61392092025 ",.01)
 ;;61392092025
 ;;9002226.02101,"791,61392092025 ",.02)
 ;;61392092025
 ;;9002226.02101,"791,61392092030 ",.01)
 ;;61392092030
 ;;9002226.02101,"791,61392092030 ",.02)
 ;;61392092030
 ;;9002226.02101,"791,61392092031 ",.01)
 ;;61392092031
 ;;9002226.02101,"791,61392092031 ",.02)
 ;;61392092031
 ;;9002226.02101,"791,61392092039 ",.01)
 ;;61392092039
 ;;9002226.02101,"791,61392092039 ",.02)
 ;;61392092039
 ;;9002226.02101,"791,61392092060 ",.01)
 ;;61392092060
 ;;9002226.02101,"791,61392092060 ",.02)
 ;;61392092060
 ;;9002226.02101,"791,61392092065 ",.01)
 ;;61392092065
 ;;9002226.02101,"791,61392092065 ",.02)
 ;;61392092065
 ;;9002226.02101,"791,61392092090 ",.01)
 ;;61392092090
 ;;9002226.02101,"791,61392092090 ",.02)
 ;;61392092090
 ;;9002226.02101,"791,61392092095 ",.01)
 ;;61392092095
 ;;9002226.02101,"791,61392092095 ",.02)
 ;;61392092095
 ;;9002226.02101,"791,62580499477 ",.01)
 ;;62580499477
 ;;9002226.02101,"791,62580499477 ",.02)
 ;;62580499477
 ;;9002226.02101,"791,62584098401 ",.01)
 ;;62584098401
 ;;9002226.02101,"791,62584098401 ",.02)
 ;;62584098401
 ;;9002226.02101,"791,62584098411 ",.01)
 ;;62584098411
 ;;9002226.02101,"791,62584098411 ",.02)
 ;;62584098411
 ;;9002226.02101,"791,62584098477 ",.01)
 ;;62584098477
 ;;9002226.02101,"791,62584098477 ",.02)
 ;;62584098477
 ;;9002226.02101,"791,62584098601 ",.01)
 ;;62584098601
 ;;9002226.02101,"791,62584098601 ",.02)
 ;;62584098601
 ;;9002226.02101,"791,62584099401 ",.01)
 ;;62584099401
 ;;9002226.02101,"791,62584099401 ",.02)
 ;;62584099401
 ;;9002226.02101,"791,62584099411 ",.01)
 ;;62584099411
 ;;9002226.02101,"791,62584099411 ",.02)
 ;;62584099411
 ;;9002226.02101,"791,62584099477 ",.01)
 ;;62584099477
 ;;9002226.02101,"791,62584099477 ",.02)
 ;;62584099477
 ;;9002226.02101,"791,63739036101 ",.01)
 ;;63739036101
 ;;9002226.02101,"791,63739036101 ",.02)
 ;;63739036101
 ;;9002226.02101,"791,63739036103 ",.01)
 ;;63739036103
 ;;9002226.02101,"791,63739036103 ",.02)
 ;;63739036103
 ;;9002226.02101,"791,63739036110 ",.01)
 ;;63739036110
 ;;9002226.02101,"791,63739036110 ",.02)
 ;;63739036110
 ;;9002226.02101,"791,63739036115 ",.01)
 ;;63739036115
 ;;9002226.02101,"791,63739036115 ",.02)
 ;;63739036115
 ;;9002226.02101,"791,63739036201 ",.01)
 ;;63739036201
 ;;9002226.02101,"791,63739036201 ",.02)
 ;;63739036201
 ;;9002226.02101,"791,63739036203 ",.01)
 ;;63739036203
 ;;9002226.02101,"791,63739036203 ",.02)
 ;;63739036203
 ;;9002226.02101,"791,63739036210 ",.01)
 ;;63739036210
 ;;9002226.02101,"791,63739036210 ",.02)
 ;;63739036210
 ;;9002226.02101,"791,63739036215 ",.01)
 ;;63739036215
 ;;9002226.02101,"791,63739036215 ",.02)
 ;;63739036215
 ;;9002226.02101,"791,63739036301 ",.01)
 ;;63739036301
 ;;9002226.02101,"791,63739036301 ",.02)
 ;;63739036301
 ;;9002226.02101,"791,63739036303 ",.01)
 ;;63739036303
 ;;9002226.02101,"791,63739036303 ",.02)
 ;;63739036303
 ;;9002226.02101,"791,63739036310 ",.01)
 ;;63739036310
 ;;9002226.02101,"791,63739036310 ",.02)
 ;;63739036310
 ;;9002226.02101,"791,63739036315 ",.01)
 ;;63739036315
 ;;9002226.02101,"791,63739036315 ",.02)
 ;;63739036315
 ;;9002226.02101,"791,63739036401 ",.01)
 ;;63739036401
 ;;9002226.02101,"791,63739036401 ",.02)
 ;;63739036401
 ;;9002226.02101,"791,63739036403 ",.01)
 ;;63739036403
 ;;9002226.02101,"791,63739036403 ",.02)
 ;;63739036403
 ;;9002226.02101,"791,63739036410 ",.01)
 ;;63739036410
 ;;9002226.02101,"791,63739036410 ",.02)
 ;;63739036410
 ;;9002226.02101,"791,63739036415 ",.01)
 ;;63739036415
 ;;9002226.02101,"791,63739036415 ",.02)
 ;;63739036415
 ;;9002226.02101,"791,64725036303 ",.01)
 ;;64725036303
 ;;9002226.02101,"791,64725036303 ",.02)
 ;;64725036303
 ;;9002226.02101,"791,64725036703 ",.01)
 ;;64725036703
 ;;9002226.02101,"791,64725036703 ",.02)
 ;;64725036703
 ;;9002226.02101,"791,65243027403 ",.01)
 ;;65243027403
 ;;9002226.02101,"791,65243027403 ",.02)
 ;;65243027403
 ;;9002226.02101,"791,65243027406 ",.01)
 ;;65243027406
 ;;9002226.02101,"791,65243027406 ",.02)
 ;;65243027406
 ;;9002226.02101,"791,65243027409 ",.01)
 ;;65243027409
 ;;9002226.02101,"791,65243027409 ",.02)
 ;;65243027409
 ;;9002226.02101,"791,65243027445 ",.01)
 ;;65243027445
 ;;9002226.02101,"791,65243027445 ",.02)
 ;;65243027445
 ;;9002226.02101,"791,65243027503 ",.01)
 ;;65243027503
 ;;9002226.02101,"791,65243027503 ",.02)
 ;;65243027503
 ;;9002226.02101,"791,65243027506 ",.01)
 ;;65243027506
 ;;9002226.02101,"791,65243027506 ",.02)
 ;;65243027506
 ;;9002226.02101,"791,65243027509 ",.01)
 ;;65243027509
 ;;9002226.02101,"791,65243027509 ",.02)
 ;;65243027509
 ;;9002226.02101,"791,65243027545 ",.01)
 ;;65243027545
 ;;9002226.02101,"791,65243027545 ",.02)
 ;;65243027545
 ;;9002226.02101,"791,65243027603 ",.01)
 ;;65243027603
 ;;9002226.02101,"791,65243027603 ",.02)
 ;;65243027603
 ;;9002226.02101,"791,65243027606 ",.01)
 ;;65243027606
 ;;9002226.02101,"791,65243027606 ",.02)
 ;;65243027606
 ;;9002226.02101,"791,65243027609 ",.01)
 ;;65243027609
 ;;9002226.02101,"791,65243027609 ",.02)
 ;;65243027609
 ;;9002226.02101,"791,65243027645 ",.01)
 ;;65243027645
 ;;9002226.02101,"791,65243027645 ",.02)
 ;;65243027645
 ;;9002226.02101,"791,65243027803 ",.01)
 ;;65243027803
 ;;9002226.02101,"791,65243027803 ",.02)
 ;;65243027803
 ;;9002226.02101,"791,65243027806 ",.01)
 ;;65243027806
 ;;9002226.02101,"791,65243027806 ",.02)
 ;;65243027806
 ;;9002226.02101,"791,65243027809 ",.01)
 ;;65243027809
 ;;9002226.02101,"791,65243027809 ",.02)
 ;;65243027809
 ;;9002226.02101,"791,65243027845 ",.01)
 ;;65243027845
 ;;9002226.02101,"791,65243027845 ",.02)
 ;;65243027845
 ;;9002226.02101,"791,65841005201 ",.01)
 ;;65841005201
 ;;9002226.02101,"791,65841005201 ",.02)
 ;;65841005201
 ;;9002226.02101,"791,65841005210 ",.01)
 ;;65841005210
 ;;9002226.02101,"791,65841005210 ",.02)
 ;;65841005210
 ;;9002226.02101,"791,65841005301 ",.01)
 ;;65841005301
 ;;9002226.02101,"791,65841005301 ",.02)
 ;;65841005301
 ;;9002226.02101,"791,65841005310 ",.01)
 ;;65841005310
 ;;9002226.02101,"791,65841005310 ",.02)
 ;;65841005310
 ;;9002226.02101,"791,65841005401 ",.01)
 ;;65841005401
 ;;9002226.02101,"791,65841005401 ",.02)
 ;;65841005401
 ;;9002226.02101,"791,65841005410 ",.01)
 ;;65841005410
 ;;9002226.02101,"791,65841005410 ",.02)
 ;;65841005410
 ;;9002226.02101,"791,65841005501 ",.01)
 ;;65841005501
 ;;9002226.02101,"791,65841005501 ",.02)
 ;;65841005501
 ;;9002226.02101,"791,65841005510 ",.01)
 ;;65841005510
 ;;9002226.02101,"791,65841005510 ",.02)
 ;;65841005510
 ;;9002226.02101,"791,65841005601 ",.01)
 ;;65841005601
 ;;9002226.02101,"791,65841005601 ",.02)
 ;;65841005601
 ;;9002226.02101,"791,65841005610 ",.01)
 ;;65841005610
 ;;9002226.02101,"791,65841005610 ",.02)
 ;;65841005610
 ;;9002226.02101,"791,65841005701 ",.01)
 ;;65841005701
 ;;9002226.02101,"791,65841005701 ",.02)
 ;;65841005701
 ;;9002226.02101,"791,65841005901 ",.01)
 ;;65841005901
 ;;9002226.02101,"791,65841005901 ",.02)
 ;;65841005901
 ;;9002226.02101,"791,65841006401 ",.01)
 ;;65841006401
 ;;9002226.02101,"791,65841006401 ",.02)
 ;;65841006401
 ;;9002226.02101,"791,65841006410 ",.01)
 ;;65841006410
