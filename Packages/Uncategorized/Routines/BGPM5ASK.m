BGPM5ASK ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON AUG 16, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1005,67544038030 ",.01)
 ;;67544038030
 ;;9002226.02101,"1005,67544038030 ",.02)
 ;;67544038030
 ;;9002226.02101,"1005,67544038060 ",.01)
 ;;67544038060
 ;;9002226.02101,"1005,67544038060 ",.02)
 ;;67544038060
 ;;9002226.02101,"1005,67544038115 ",.01)
 ;;67544038115
 ;;9002226.02101,"1005,67544038115 ",.02)
 ;;67544038115
 ;;9002226.02101,"1005,67544038130 ",.01)
 ;;67544038130
 ;;9002226.02101,"1005,67544038130 ",.02)
 ;;67544038130
 ;;9002226.02101,"1005,67544038145 ",.01)
 ;;67544038145
 ;;9002226.02101,"1005,67544038145 ",.02)
 ;;67544038145
 ;;9002226.02101,"1005,67544038153 ",.01)
 ;;67544038153
 ;;9002226.02101,"1005,67544038153 ",.02)
 ;;67544038153
 ;;9002226.02101,"1005,67544038160 ",.01)
 ;;67544038160
 ;;9002226.02101,"1005,67544038160 ",.02)
 ;;67544038160
 ;;9002226.02101,"1005,67544038170 ",.01)
 ;;67544038170
 ;;9002226.02101,"1005,67544038170 ",.02)
 ;;67544038170
 ;;9002226.02101,"1005,67544038173 ",.01)
 ;;67544038173
 ;;9002226.02101,"1005,67544038173 ",.02)
 ;;67544038173
 ;;9002226.02101,"1005,67544038180 ",.01)
 ;;67544038180
 ;;9002226.02101,"1005,67544038180 ",.02)
 ;;67544038180
 ;;9002226.02101,"1005,67544038192 ",.01)
 ;;67544038192
 ;;9002226.02101,"1005,67544038192 ",.02)
 ;;67544038192
 ;;9002226.02101,"1005,67544038194 ",.01)
 ;;67544038194
 ;;9002226.02101,"1005,67544038194 ",.02)
 ;;67544038194
 ;;9002226.02101,"1005,67544040045 ",.01)
 ;;67544040045
 ;;9002226.02101,"1005,67544040045 ",.02)
 ;;67544040045
 ;;9002226.02101,"1005,67544040330 ",.01)
 ;;67544040330
 ;;9002226.02101,"1005,67544040330 ",.02)
 ;;67544040330
 ;;9002226.02101,"1005,67544040331 ",.01)
 ;;67544040331
 ;;9002226.02101,"1005,67544040331 ",.02)
 ;;67544040331
 ;;9002226.02101,"1005,67544040430 ",.01)
 ;;67544040430
 ;;9002226.02101,"1005,67544040430 ",.02)
 ;;67544040430
 ;;9002226.02101,"1005,67544040431 ",.01)
 ;;67544040431
 ;;9002226.02101,"1005,67544040431 ",.02)
 ;;67544040431
 ;;9002226.02101,"1005,67544041860 ",.01)
 ;;67544041860
 ;;9002226.02101,"1005,67544041860 ",.02)
 ;;67544041860
 ;;9002226.02101,"1005,67544043115 ",.01)
 ;;67544043115
 ;;9002226.02101,"1005,67544043115 ",.02)
 ;;67544043115
 ;;9002226.02101,"1005,67544043130 ",.01)
 ;;67544043130
 ;;9002226.02101,"1005,67544043130 ",.02)
 ;;67544043130
 ;;9002226.02101,"1005,67544043145 ",.01)
 ;;67544043145
 ;;9002226.02101,"1005,67544043145 ",.02)
 ;;67544043145
 ;;9002226.02101,"1005,67544043153 ",.01)
 ;;67544043153
 ;;9002226.02101,"1005,67544043153 ",.02)
 ;;67544043153
 ;;9002226.02101,"1005,67544043160 ",.01)
 ;;67544043160
 ;;9002226.02101,"1005,67544043160 ",.02)
 ;;67544043160
 ;;9002226.02101,"1005,67544043170 ",.01)
 ;;67544043170
 ;;9002226.02101,"1005,67544043170 ",.02)
 ;;67544043170
 ;;9002226.02101,"1005,67544043173 ",.01)
 ;;67544043173
 ;;9002226.02101,"1005,67544043173 ",.02)
 ;;67544043173
 ;;9002226.02101,"1005,67544043180 ",.01)
 ;;67544043180
 ;;9002226.02101,"1005,67544043180 ",.02)
 ;;67544043180
 ;;9002226.02101,"1005,67544043192 ",.01)
 ;;67544043192
 ;;9002226.02101,"1005,67544043192 ",.02)
 ;;67544043192
 ;;9002226.02101,"1005,67544043194 ",.01)
 ;;67544043194
 ;;9002226.02101,"1005,67544043194 ",.02)
 ;;67544043194
 ;;9002226.02101,"1005,67544045415 ",.01)
 ;;67544045415
 ;;9002226.02101,"1005,67544045415 ",.02)
 ;;67544045415
 ;;9002226.02101,"1005,67544045430 ",.01)
 ;;67544045430
 ;;9002226.02101,"1005,67544045430 ",.02)
 ;;67544045430
 ;;9002226.02101,"1005,67544045440 ",.01)
 ;;67544045440
 ;;9002226.02101,"1005,67544045440 ",.02)
 ;;67544045440
 ;;9002226.02101,"1005,67544045445 ",.01)
 ;;67544045445
 ;;9002226.02101,"1005,67544045445 ",.02)
 ;;67544045445
 ;;9002226.02101,"1005,67544045460 ",.01)
 ;;67544045460
 ;;9002226.02101,"1005,67544045460 ",.02)
 ;;67544045460
 ;;9002226.02101,"1005,67544048915 ",.01)
 ;;67544048915
 ;;9002226.02101,"1005,67544048915 ",.02)
 ;;67544048915
 ;;9002226.02101,"1005,67544048930 ",.01)
 ;;67544048930
 ;;9002226.02101,"1005,67544048930 ",.02)
 ;;67544048930
 ;;9002226.02101,"1005,67544048960 ",.01)
 ;;67544048960
 ;;9002226.02101,"1005,67544048960 ",.02)
 ;;67544048960
 ;;9002226.02101,"1005,67544051531 ",.01)
 ;;67544051531
 ;;9002226.02101,"1005,67544051531 ",.02)
 ;;67544051531
 ;;9002226.02101,"1005,67544055930 ",.01)
 ;;67544055930
 ;;9002226.02101,"1005,67544055930 ",.02)
 ;;67544055930
 ;;9002226.02101,"1005,67544055932 ",.01)
 ;;67544055932
 ;;9002226.02101,"1005,67544055932 ",.02)
 ;;67544055932
 ;;9002226.02101,"1005,67544062131 ",.01)
 ;;67544062131
 ;;9002226.02101,"1005,67544062131 ",.02)
 ;;67544062131
 ;;9002226.02101,"1005,67544062145 ",.01)
 ;;67544062145
 ;;9002226.02101,"1005,67544062145 ",.02)
 ;;67544062145
 ;;9002226.02101,"1005,67544062160 ",.01)
 ;;67544062160
 ;;9002226.02101,"1005,67544062160 ",.02)
 ;;67544062160
 ;;9002226.02101,"1005,67544066731 ",.01)
 ;;67544066731
 ;;9002226.02101,"1005,67544066731 ",.02)
 ;;67544066731
 ;;9002226.02101,"1005,67544066760 ",.01)
 ;;67544066760
 ;;9002226.02101,"1005,67544066760 ",.02)
 ;;67544066760
 ;;9002226.02101,"1005,67544067832 ",.01)
 ;;67544067832
 ;;9002226.02101,"1005,67544067832 ",.02)
 ;;67544067832
 ;;9002226.02101,"1005,67544067845 ",.01)
 ;;67544067845
 ;;9002226.02101,"1005,67544067845 ",.02)
 ;;67544067845
 ;;9002226.02101,"1005,67544067860 ",.01)
 ;;67544067860
 ;;9002226.02101,"1005,67544067860 ",.02)
 ;;67544067860
 ;;9002226.02101,"1005,67544068731 ",.01)
 ;;67544068731
 ;;9002226.02101,"1005,67544068731 ",.02)
 ;;67544068731
 ;;9002226.02101,"1005,67544068732 ",.01)
 ;;67544068732
 ;;9002226.02101,"1005,67544068732 ",.02)
 ;;67544068732
 ;;9002226.02101,"1005,67544070531 ",.01)
 ;;67544070531
 ;;9002226.02101,"1005,67544070531 ",.02)
 ;;67544070531
 ;;9002226.02101,"1005,67544070631 ",.01)
 ;;67544070631
 ;;9002226.02101,"1005,67544070631 ",.02)
 ;;67544070631
 ;;9002226.02101,"1005,67544071132 ",.01)
 ;;67544071132
 ;;9002226.02101,"1005,67544071132 ",.02)
 ;;67544071132
 ;;9002226.02101,"1005,67544071731 ",.01)
 ;;67544071731
 ;;9002226.02101,"1005,67544071731 ",.02)
 ;;67544071731
 ;;9002226.02101,"1005,67544072431 ",.01)
 ;;67544072431
 ;;9002226.02101,"1005,67544072431 ",.02)
 ;;67544072431
 ;;9002226.02101,"1005,67544077932 ",.01)
 ;;67544077932
 ;;9002226.02101,"1005,67544077932 ",.02)
 ;;67544077932
 ;;9002226.02101,"1005,67544081832 ",.01)
 ;;67544081832
 ;;9002226.02101,"1005,67544081832 ",.02)
 ;;67544081832
 ;;9002226.02101,"1005,67544086131 ",.01)
 ;;67544086131
 ;;9002226.02101,"1005,67544086131 ",.02)
 ;;67544086131
 ;;9002226.02101,"1005,67544086132 ",.01)
 ;;67544086132
 ;;9002226.02101,"1005,67544086132 ",.02)
 ;;67544086132
 ;;9002226.02101,"1005,67544086832 ",.01)
 ;;67544086832
 ;;9002226.02101,"1005,67544086832 ",.02)
 ;;67544086832
 ;;9002226.02101,"1005,67544093330 ",.01)
 ;;67544093330
 ;;9002226.02101,"1005,67544093330 ",.02)
 ;;67544093330
 ;;9002226.02101,"1005,67544096032 ",.01)
 ;;67544096032
 ;;9002226.02101,"1005,67544096032 ",.02)
 ;;67544096032
 ;;9002226.02101,"1005,67544099730 ",.01)
 ;;67544099730
 ;;9002226.02101,"1005,67544099730 ",.02)
 ;;67544099730
 ;;9002226.02101,"1005,67544099760 ",.01)
 ;;67544099760
 ;;9002226.02101,"1005,67544099760 ",.02)
 ;;67544099760
 ;;9002226.02101,"1005,67544099960 ",.01)
 ;;67544099960
 ;;9002226.02101,"1005,67544099960 ",.02)
 ;;67544099960
 ;;9002226.02101,"1005,67544099980 ",.01)
 ;;67544099980
 ;;9002226.02101,"1005,67544099980 ",.02)
 ;;67544099980
 ;;9002226.02101,"1005,67651001801 ",.01)
 ;;67651001801
 ;;9002226.02101,"1005,67651001801 ",.02)
 ;;67651001801
 ;;9002226.02101,"1005,67651001805 ",.01)
 ;;67651001805
 ;;9002226.02101,"1005,67651001805 ",.02)
 ;;67651001805
 ;;9002226.02101,"1005,67651001901 ",.01)
 ;;67651001901
 ;;9002226.02101,"1005,67651001901 ",.02)
 ;;67651001901
 ;;9002226.02101,"1005,67651001905 ",.01)
 ;;67651001905
 ;;9002226.02101,"1005,67651001905 ",.02)
 ;;67651001905
 ;;9002226.02101,"1005,67651002001 ",.01)
 ;;67651002001
 ;;9002226.02101,"1005,67651002001 ",.02)
 ;;67651002001
 ;;9002226.02101,"1005,67651002005 ",.01)
 ;;67651002005
 ;;9002226.02101,"1005,67651002005 ",.02)
 ;;67651002005
 ;;9002226.02101,"1005,67651002101 ",.01)
 ;;67651002101
 ;;9002226.02101,"1005,67651002101 ",.02)
 ;;67651002101
 ;;9002226.02101,"1005,67651002105 ",.01)
 ;;67651002105
 ;;9002226.02101,"1005,67651002105 ",.02)
 ;;67651002105
 ;;9002226.02101,"1005,67787020005 ",.01)
 ;;67787020005
 ;;9002226.02101,"1005,67787020005 ",.02)
 ;;67787020005
 ;;9002226.02101,"1005,67787020010 ",.01)
 ;;67787020010
 ;;9002226.02101,"1005,67787020010 ",.02)
 ;;67787020010
 ;;9002226.02101,"1005,67787020090 ",.01)
 ;;67787020090
 ;;9002226.02101,"1005,67787020090 ",.02)
 ;;67787020090
 ;;9002226.02101,"1005,67787020105 ",.01)
 ;;67787020105
 ;;9002226.02101,"1005,67787020105 ",.02)
 ;;67787020105
 ;;9002226.02101,"1005,67787020110 ",.01)
 ;;67787020110
 ;;9002226.02101,"1005,67787020110 ",.02)
 ;;67787020110
 ;;9002226.02101,"1005,67787020190 ",.01)
 ;;67787020190
 ;;9002226.02101,"1005,67787020190 ",.02)
 ;;67787020190
 ;;9002226.02101,"1005,67787020210 ",.01)
 ;;67787020210
 ;;9002226.02101,"1005,67787020210 ",.02)
 ;;67787020210
 ;;9002226.02101,"1005,67787020290 ",.01)
 ;;67787020290
 ;;9002226.02101,"1005,67787020290 ",.02)
 ;;67787020290
 ;;9002226.02101,"1005,67787026790 ",.01)
 ;;67787026790
 ;;9002226.02101,"1005,67787026790 ",.02)
 ;;67787026790
 ;;9002226.02101,"1005,67787026890 ",.01)
 ;;67787026890
 ;;9002226.02101,"1005,67787026890 ",.02)
 ;;67787026890
 ;;9002226.02101,"1005,67787026990 ",.01)
 ;;67787026990
 ;;9002226.02101,"1005,67787026990 ",.02)
 ;;67787026990
 ;;9002226.02101,"1005,67787027090 ",.01)
 ;;67787027090
 ;;9002226.02101,"1005,67787027090 ",.02)
 ;;67787027090
 ;;9002226.02101,"1005,68071004845 ",.01)
 ;;68071004845
 ;;9002226.02101,"1005,68071004845 ",.02)
 ;;68071004845
 ;;9002226.02101,"1005,68071009530 ",.01)
 ;;68071009530
 ;;9002226.02101,"1005,68071009530 ",.02)
 ;;68071009530
 ;;9002226.02101,"1005,68071010430 ",.01)
 ;;68071010430
 ;;9002226.02101,"1005,68071010430 ",.02)
 ;;68071010430
 ;;9002226.02101,"1005,68071015330 ",.01)
 ;;68071015330
 ;;9002226.02101,"1005,68071015330 ",.02)
 ;;68071015330
 ;;9002226.02101,"1005,68071015360 ",.01)
 ;;68071015360
 ;;9002226.02101,"1005,68071015360 ",.02)
 ;;68071015360
 ;;9002226.02101,"1005,68071015390 ",.01)
 ;;68071015390
 ;;9002226.02101,"1005,68071015390 ",.02)
 ;;68071015390
 ;;9002226.02101,"1005,68071015745 ",.01)
 ;;68071015745
 ;;9002226.02101,"1005,68071015745 ",.02)
 ;;68071015745
 ;;9002226.02101,"1005,68071015790 ",.01)
 ;;68071015790
 ;;9002226.02101,"1005,68071015790 ",.02)
 ;;68071015790
 ;;9002226.02101,"1005,68071015792 ",.01)
 ;;68071015792
 ;;9002226.02101,"1005,68071015792 ",.02)
 ;;68071015792
 ;;9002226.02101,"1005,68071021692 ",.01)
 ;;68071021692
 ;;9002226.02101,"1005,68071021692 ",.02)
 ;;68071021692
 ;;9002226.02101,"1005,68071039030 ",.01)
 ;;68071039030
 ;;9002226.02101,"1005,68071039030 ",.02)
 ;;68071039030
 ;;9002226.02101,"1005,68071043612 ",.01)
 ;;68071043612
 ;;9002226.02101,"1005,68071043612 ",.02)
 ;;68071043612
 ;;9002226.02101,"1005,68071049330 ",.01)
 ;;68071049330
 ;;9002226.02101,"1005,68071049330 ",.02)
 ;;68071049330
 ;;9002226.02101,"1005,68071076928 ",.01)
 ;;68071076928
 ;;9002226.02101,"1005,68071076928 ",.02)
 ;;68071076928
 ;;9002226.02101,"1005,68071077130 ",.01)
 ;;68071077130
 ;;9002226.02101,"1005,68071077130 ",.02)
 ;;68071077130
 ;;9002226.02101,"1005,68071078530 ",.01)
 ;;68071078530