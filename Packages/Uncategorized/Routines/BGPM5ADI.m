BGPM5ADI ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON JUL 15, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"846,68084013601 ",.02)
 ;;68084013601
 ;;9002226.02101,"846,68084013701 ",.01)
 ;;68084013701
 ;;9002226.02101,"846,68084013701 ",.02)
 ;;68084013701
 ;;9002226.02101,"846,68084013801 ",.01)
 ;;68084013801
 ;;9002226.02101,"846,68084013801 ",.02)
 ;;68084013801
 ;;9002226.02101,"846,68084029511 ",.01)
 ;;68084029511
 ;;9002226.02101,"846,68084029511 ",.02)
 ;;68084029511
 ;;9002226.02101,"846,68084029521 ",.01)
 ;;68084029521
 ;;9002226.02101,"846,68084029521 ",.02)
 ;;68084029521
 ;;9002226.02101,"846,68084032601 ",.01)
 ;;68084032601
 ;;9002226.02101,"846,68084032601 ",.02)
 ;;68084032601
 ;;9002226.02101,"846,68084032611 ",.01)
 ;;68084032611
 ;;9002226.02101,"846,68084032611 ",.02)
 ;;68084032611
 ;;9002226.02101,"846,68084032701 ",.01)
 ;;68084032701
 ;;9002226.02101,"846,68084032701 ",.02)
 ;;68084032701
 ;;9002226.02101,"846,68084032711 ",.01)
 ;;68084032711
 ;;9002226.02101,"846,68084032711 ",.02)
 ;;68084032711
 ;;9002226.02101,"846,68115015490 ",.01)
 ;;68115015490
 ;;9002226.02101,"846,68115015490 ",.02)
 ;;68115015490
 ;;9002226.02101,"846,68115016090 ",.01)
 ;;68115016090
 ;;9002226.02101,"846,68115016090 ",.02)
 ;;68115016090
 ;;9002226.02101,"846,68115016190 ",.01)
 ;;68115016190
 ;;9002226.02101,"846,68115016190 ",.02)
 ;;68115016190
 ;;9002226.02101,"846,68533003400 ",.01)
 ;;68533003400
 ;;9002226.02101,"846,68533003400 ",.02)
 ;;68533003400
 ;;9002226.02101,"846,68533003412 ",.01)
 ;;68533003412
 ;;9002226.02101,"846,68533003412 ",.02)
 ;;68533003412
 ;;9002226.02101,"846,68533003440 ",.01)
 ;;68533003440
 ;;9002226.02101,"846,68533003440 ",.02)
 ;;68533003440
 ;;9002226.02101,"846,68533003445 ",.01)
 ;;68533003445
 ;;9002226.02101,"846,68533003445 ",.02)
 ;;68533003445
 ;;9002226.02101,"846,68533003500 ",.01)
 ;;68533003500
 ;;9002226.02101,"846,68533003500 ",.02)
 ;;68533003500
 ;;9002226.02101,"846,68533003512 ",.01)
 ;;68533003512
 ;;9002226.02101,"846,68533003512 ",.02)
 ;;68533003512
 ;;9002226.02101,"846,68533003540 ",.01)
 ;;68533003540
 ;;9002226.02101,"846,68533003540 ",.02)
 ;;68533003540
 ;;9002226.02101,"846,68533003548 ",.01)
 ;;68533003548
 ;;9002226.02101,"846,68533003548 ",.02)
 ;;68533003548
 ;;9002226.02101,"846,68533003600 ",.01)
 ;;68533003600
 ;;9002226.02101,"846,68533003600 ",.02)
 ;;68533003600
 ;;9002226.02101,"846,68533003612 ",.01)
 ;;68533003612
 ;;9002226.02101,"846,68533003612 ",.02)
 ;;68533003612
 ;;9002226.02101,"846,68533003640 ",.01)
 ;;68533003640
 ;;9002226.02101,"846,68533003640 ",.02)
 ;;68533003640
 ;;9002226.02101,"846,68533003645 ",.01)
 ;;68533003645
 ;;9002226.02101,"846,68533003645 ",.02)
 ;;68533003645
 ;;9002226.02101,"846,68645015054 ",.01)
 ;;68645015054
 ;;9002226.02101,"846,68645015054 ",.02)
 ;;68645015054
 ;;9002226.02101,"846,68645015159 ",.01)
 ;;68645015159
 ;;9002226.02101,"846,68645015159 ",.02)
 ;;68645015159
 ;;9002226.02101,"846,68645021054 ",.01)
 ;;68645021054
 ;;9002226.02101,"846,68645021054 ",.02)
 ;;68645021054
 ;;9002226.02101,"846,68645021154 ",.01)
 ;;68645021154
 ;;9002226.02101,"846,68645021154 ",.02)
 ;;68645021154
 ;;9002226.02101,"846,68788014103 ",.01)
 ;;68788014103
 ;;9002226.02101,"846,68788014103 ",.02)
 ;;68788014103
 ;;9002226.02101,"846,68788014106 ",.01)
 ;;68788014106
 ;;9002226.02101,"846,68788014106 ",.02)
 ;;68788014106
 ;;9002226.02101,"846,68788014203 ",.01)
 ;;68788014203
 ;;9002226.02101,"846,68788014203 ",.02)
 ;;68788014203
 ;;9002226.02101,"846,68788014206 ",.01)
 ;;68788014206
 ;;9002226.02101,"846,68788014206 ",.02)
 ;;68788014206
 ;;9002226.02101,"846,68788046003 ",.01)
 ;;68788046003
 ;;9002226.02101,"846,68788046003 ",.02)
 ;;68788046003
 ;;9002226.02101,"846,68788046006 ",.01)
 ;;68788046006
 ;;9002226.02101,"846,68788046006 ",.02)
 ;;68788046006
 ;;9002226.02101,"846,68788046009 ",.01)
 ;;68788046009
 ;;9002226.02101,"846,68788046009 ",.02)
 ;;68788046009
 ;;9002226.02101,"846,68788046103 ",.01)
 ;;68788046103
 ;;9002226.02101,"846,68788046103 ",.02)
 ;;68788046103
 ;;9002226.02101,"846,68788046106 ",.01)
 ;;68788046106
 ;;9002226.02101,"846,68788046106 ",.02)
 ;;68788046106
 ;;9002226.02101,"846,68788096903 ",.01)
 ;;68788096903
 ;;9002226.02101,"846,68788096903 ",.02)
 ;;68788096903
 ;;9002226.02101,"846,68788096906 ",.01)
 ;;68788096906
 ;;9002226.02101,"846,68788096906 ",.02)
 ;;68788096906
 ;;9002226.02101,"846,68788119100 ",.01)
 ;;68788119100
 ;;9002226.02101,"846,68788119100 ",.02)
 ;;68788119100
 ;;9002226.02101,"846,68788119103 ",.01)
 ;;68788119103
 ;;9002226.02101,"846,68788119103 ",.02)
 ;;68788119103
 ;;9002226.02101,"846,68788119106 ",.01)
 ;;68788119106
 ;;9002226.02101,"846,68788119106 ",.02)
 ;;68788119106
 ;;9002226.02101,"846,68788834403 ",.01)
 ;;68788834403
 ;;9002226.02101,"846,68788834403 ",.02)
 ;;68788834403
 ;;9002226.02101,"846,68788834406 ",.01)
 ;;68788834406
 ;;9002226.02101,"846,68788834406 ",.02)
 ;;68788834406
 ;;9002226.02101,"846,71114022100 ",.01)
 ;;71114022100
 ;;9002226.02101,"846,71114022100 ",.02)
 ;;71114022100
 ;;9002226.02101,"846,71114022101 ",.01)
 ;;71114022101
 ;;9002226.02101,"846,71114022101 ",.02)
 ;;71114022101
 ;;9002226.02101,"846,71114022105 ",.01)
 ;;71114022105
 ;;9002226.02101,"846,71114022105 ",.02)
 ;;71114022105
 ;;9002226.02101,"846,71114022200 ",.01)
 ;;71114022200
 ;;9002226.02101,"846,71114022200 ",.02)
 ;;71114022200
 ;;9002226.02101,"846,71114022201 ",.01)
 ;;71114022201
 ;;9002226.02101,"846,71114022201 ",.02)
 ;;71114022201
 ;;9002226.02101,"846,71114022205 ",.01)
 ;;71114022205
 ;;9002226.02101,"846,71114022205 ",.02)
 ;;71114022205
