BGPM5AFP ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON JUL 15, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"881,68462036810 ",.01)
 ;;68462036810
 ;;9002226.02101,"881,68462036810 ",.02)
 ;;68462036810
 ;;9002226.02101,"881,68462036890 ",.01)
 ;;68462036890
 ;;9002226.02101,"881,68462036890 ",.02)
 ;;68462036890
 ;;9002226.02101,"881,68462036910 ",.01)
 ;;68462036910
 ;;9002226.02101,"881,68462036910 ",.02)
 ;;68462036910
 ;;9002226.02101,"881,68462036990 ",.01)
 ;;68462036990
 ;;9002226.02101,"881,68462036990 ",.02)
 ;;68462036990
 ;;9002226.02101,"881,68462055401 ",.01)
 ;;68462055401
 ;;9002226.02101,"881,68462055401 ",.02)
 ;;68462055401
 ;;9002226.02101,"881,68462055410 ",.01)
 ;;68462055410
 ;;9002226.02101,"881,68462055410 ",.02)
 ;;68462055410
 ;;9002226.02101,"881,68462055430 ",.01)
 ;;68462055430
 ;;9002226.02101,"881,68462055430 ",.02)
 ;;68462055430
 ;;9002226.02101,"881,68462055501 ",.01)
 ;;68462055501
 ;;9002226.02101,"881,68462055501 ",.02)
 ;;68462055501
 ;;9002226.02101,"881,68462055510 ",.01)
 ;;68462055510
 ;;9002226.02101,"881,68462055510 ",.02)
 ;;68462055510
 ;;9002226.02101,"881,68462055530 ",.01)
 ;;68462055530
 ;;9002226.02101,"881,68462055530 ",.02)
 ;;68462055530
 ;;9002226.02101,"881,68505251002 ",.01)
 ;;68505251002
 ;;9002226.02101,"881,68505251002 ",.02)
 ;;68505251002
 ;;9002226.02101,"881,68505251004 ",.01)
 ;;68505251004
 ;;9002226.02101,"881,68505251004 ",.02)
 ;;68505251004
 ;;9002226.02101,"881,68533004200 ",.01)
 ;;68533004200
 ;;9002226.02101,"881,68533004200 ",.02)
 ;;68533004200
 ;;9002226.02101,"881,68533004212 ",.01)
 ;;68533004212
 ;;9002226.02101,"881,68533004212 ",.02)
 ;;68533004212
 ;;9002226.02101,"881,68533004225 ",.01)
 ;;68533004225
 ;;9002226.02101,"881,68533004225 ",.02)
 ;;68533004225
 ;;9002226.02101,"881,68533004240 ",.01)
 ;;68533004240
 ;;9002226.02101,"881,68533004240 ",.02)
 ;;68533004240
 ;;9002226.02101,"881,68533004300 ",.01)
 ;;68533004300
 ;;9002226.02101,"881,68533004300 ",.02)
 ;;68533004300
 ;;9002226.02101,"881,68533004312 ",.01)
 ;;68533004312
 ;;9002226.02101,"881,68533004312 ",.02)
 ;;68533004312
 ;;9002226.02101,"881,68533004325 ",.01)
 ;;68533004325
 ;;9002226.02101,"881,68533004325 ",.02)
 ;;68533004325
 ;;9002226.02101,"881,68533004340 ",.01)
 ;;68533004340
 ;;9002226.02101,"881,68533004340 ",.02)
 ;;68533004340
 ;;9002226.02101,"881,68533004400 ",.01)
 ;;68533004400
 ;;9002226.02101,"881,68533004400 ",.02)
 ;;68533004400
 ;;9002226.02101,"881,68533004412 ",.01)
 ;;68533004412
 ;;9002226.02101,"881,68533004412 ",.02)
 ;;68533004412
 ;;9002226.02101,"881,68533004425 ",.01)
 ;;68533004425
 ;;9002226.02101,"881,68533004425 ",.02)
 ;;68533004425
 ;;9002226.02101,"881,68533004440 ",.01)
 ;;68533004440
 ;;9002226.02101,"881,68533004440 ",.02)
 ;;68533004440
 ;;9002226.02101,"881,68533006500 ",.01)
 ;;68533006500
 ;;9002226.02101,"881,68533006500 ",.02)
 ;;68533006500
 ;;9002226.02101,"881,68533006512 ",.01)
 ;;68533006512
 ;;9002226.02101,"881,68533006512 ",.02)
 ;;68533006512
 ;;9002226.02101,"881,68533006540 ",.01)
 ;;68533006540
 ;;9002226.02101,"881,68533006540 ",.02)
 ;;68533006540
 ;;9002226.02101,"881,68533006548 ",.01)
 ;;68533006548
 ;;9002226.02101,"881,68533006548 ",.02)
 ;;68533006548
 ;;9002226.02101,"881,68533006600 ",.01)
 ;;68533006600
 ;;9002226.02101,"881,68533006600 ",.02)
 ;;68533006600
 ;;9002226.02101,"881,68533006612 ",.01)
 ;;68533006612
 ;;9002226.02101,"881,68533006612 ",.02)
 ;;68533006612
 ;;9002226.02101,"881,68533006640 ",.01)
 ;;68533006640
 ;;9002226.02101,"881,68533006640 ",.02)
 ;;68533006640
 ;;9002226.02101,"881,68533006648 ",.01)
 ;;68533006648
 ;;9002226.02101,"881,68533006648 ",.02)
 ;;68533006648
 ;;9002226.02101,"881,68552022110 ",.01)
 ;;68552022110
 ;;9002226.02101,"881,68552022110 ",.02)
 ;;68552022110
 ;;9002226.02101,"881,68552022190 ",.01)
 ;;68552022190
 ;;9002226.02101,"881,68552022190 ",.02)
 ;;68552022190
 ;;9002226.02101,"881,68552022210 ",.01)
 ;;68552022210
 ;;9002226.02101,"881,68552022210 ",.02)
 ;;68552022210
 ;;9002226.02101,"881,68552022290 ",.01)
 ;;68552022290
 ;;9002226.02101,"881,68552022290 ",.02)
 ;;68552022290
 ;;9002226.02101,"881,68552022310 ",.01)
 ;;68552022310
 ;;9002226.02101,"881,68552022310 ",.02)
 ;;68552022310
 ;;9002226.02101,"881,68552022390 ",.01)
 ;;68552022390
 ;;9002226.02101,"881,68552022390 ",.02)
 ;;68552022390
 ;;9002226.02101,"881,68645016059 ",.01)
 ;;68645016059
 ;;9002226.02101,"881,68645016059 ",.02)
 ;;68645016059
 ;;9002226.02101,"881,68645016159 ",.01)
 ;;68645016159
 ;;9002226.02101,"881,68645016159 ",.02)
 ;;68645016159
 ;;9002226.02101,"881,68645016259 ",.01)
 ;;68645016259
 ;;9002226.02101,"881,68645016259 ",.02)
 ;;68645016259
 ;;9002226.02101,"881,68645016359 ",.01)
 ;;68645016359
 ;;9002226.02101,"881,68645016359 ",.02)
 ;;68645016359
 ;;9002226.02101,"881,68645027254 ",.01)
 ;;68645027254
 ;;9002226.02101,"881,68645027254 ",.02)
 ;;68645027254
 ;;9002226.02101,"881,68788006703 ",.01)
 ;;68788006703
 ;;9002226.02101,"881,68788006703 ",.02)
 ;;68788006703
 ;;9002226.02101,"881,68788006706 ",.01)
 ;;68788006706
 ;;9002226.02101,"881,68788006706 ",.02)
 ;;68788006706
 ;;9002226.02101,"881,68788006709 ",.01)
 ;;68788006709
 ;;9002226.02101,"881,68788006709 ",.02)
 ;;68788006709
 ;;9002226.02101,"881,68788010203 ",.01)
 ;;68788010203
 ;;9002226.02101,"881,68788010203 ",.02)
 ;;68788010203
 ;;9002226.02101,"881,68788010206 ",.01)
 ;;68788010206
 ;;9002226.02101,"881,68788010206 ",.02)
 ;;68788010206
 ;;9002226.02101,"881,68788010209 ",.01)
 ;;68788010209
 ;;9002226.02101,"881,68788010209 ",.02)
 ;;68788010209
 ;;9002226.02101,"881,68788036003 ",.01)
 ;;68788036003
 ;;9002226.02101,"881,68788036003 ",.02)
 ;;68788036003
 ;;9002226.02101,"881,68788036006 ",.01)
 ;;68788036006
 ;;9002226.02101,"881,68788036006 ",.02)
 ;;68788036006
 ;;9002226.02101,"881,68788036009 ",.01)
 ;;68788036009
 ;;9002226.02101,"881,68788036009 ",.02)
 ;;68788036009
 ;;9002226.02101,"881,68788056101 ",.01)
 ;;68788056101
 ;;9002226.02101,"881,68788056101 ",.02)
 ;;68788056101
 ;;9002226.02101,"881,68788056103 ",.01)
 ;;68788056103
 ;;9002226.02101,"881,68788056103 ",.02)
 ;;68788056103
 ;;9002226.02101,"881,68788056106 ",.01)
 ;;68788056106
 ;;9002226.02101,"881,68788056106 ",.02)
 ;;68788056106
 ;;9002226.02101,"881,68788056109 ",.01)
 ;;68788056109
 ;;9002226.02101,"881,68788056109 ",.02)
 ;;68788056109
 ;;9002226.02101,"881,68788083503 ",.01)
 ;;68788083503
 ;;9002226.02101,"881,68788083503 ",.02)
 ;;68788083503
 ;;9002226.02101,"881,68788083506 ",.01)
 ;;68788083506
 ;;9002226.02101,"881,68788083506 ",.02)
 ;;68788083506
 ;;9002226.02101,"881,68788083509 ",.01)
 ;;68788083509
 ;;9002226.02101,"881,68788083509 ",.02)
 ;;68788083509
 ;;9002226.02101,"881,68788083603 ",.01)
 ;;68788083603
 ;;9002226.02101,"881,68788083603 ",.02)
 ;;68788083603
 ;;9002226.02101,"881,68788083606 ",.01)
 ;;68788083606
 ;;9002226.02101,"881,68788083606 ",.02)
 ;;68788083606
 ;;9002226.02101,"881,68788083609 ",.01)
 ;;68788083609
 ;;9002226.02101,"881,68788083609 ",.02)
 ;;68788083609
 ;;9002226.02101,"881,68788083703 ",.01)
 ;;68788083703
 ;;9002226.02101,"881,68788083703 ",.02)
 ;;68788083703
 ;;9002226.02101,"881,68788083706 ",.01)
 ;;68788083706
 ;;9002226.02101,"881,68788083706 ",.02)
 ;;68788083706
 ;;9002226.02101,"881,68788083709 ",.01)
 ;;68788083709
 ;;9002226.02101,"881,68788083709 ",.02)
 ;;68788083709
 ;;9002226.02101,"881,68788084301 ",.01)
 ;;68788084301
 ;;9002226.02101,"881,68788084301 ",.02)
 ;;68788084301
 ;;9002226.02101,"881,68788084303 ",.01)
 ;;68788084303
 ;;9002226.02101,"881,68788084303 ",.02)
 ;;68788084303
 ;;9002226.02101,"881,68788084306 ",.01)
 ;;68788084306
 ;;9002226.02101,"881,68788084306 ",.02)
 ;;68788084306
 ;;9002226.02101,"881,68788084309 ",.01)
 ;;68788084309
 ;;9002226.02101,"881,68788084309 ",.02)
 ;;68788084309
 ;;9002226.02101,"881,68788092403 ",.01)
 ;;68788092403
 ;;9002226.02101,"881,68788092403 ",.02)
 ;;68788092403
 ;;9002226.02101,"881,68788092406 ",.01)
 ;;68788092406
 ;;9002226.02101,"881,68788092406 ",.02)
 ;;68788092406
 ;;9002226.02101,"881,68788092409 ",.01)
 ;;68788092409
 ;;9002226.02101,"881,68788092409 ",.02)
 ;;68788092409
 ;;9002226.02101,"881,68788092503 ",.01)
 ;;68788092503
 ;;9002226.02101,"881,68788092503 ",.02)
 ;;68788092503
 ;;9002226.02101,"881,68788092506 ",.01)
 ;;68788092506
 ;;9002226.02101,"881,68788092506 ",.02)
 ;;68788092506
 ;;9002226.02101,"881,68788092509 ",.01)
 ;;68788092509
 ;;9002226.02101,"881,68788092509 ",.02)
 ;;68788092509
 ;;9002226.02101,"881,68788092903 ",.01)
 ;;68788092903
 ;;9002226.02101,"881,68788092903 ",.02)
 ;;68788092903
 ;;9002226.02101,"881,68788092906 ",.01)
 ;;68788092906
 ;;9002226.02101,"881,68788092906 ",.02)
 ;;68788092906
 ;;9002226.02101,"881,68788092909 ",.01)
 ;;68788092909
 ;;9002226.02101,"881,68788092909 ",.02)
 ;;68788092909
 ;;9002226.02101,"881,68788117203 ",.01)
 ;;68788117203
 ;;9002226.02101,"881,68788117203 ",.02)
 ;;68788117203
 ;;9002226.02101,"881,68788117209 ",.01)
 ;;68788117209
 ;;9002226.02101,"881,68788117209 ",.02)
 ;;68788117209
 ;;9002226.02101,"881,68788234200 ",.01)
 ;;68788234200
 ;;9002226.02101,"881,68788234200 ",.02)
 ;;68788234200
 ;;9002226.02101,"881,68788234203 ",.01)
 ;;68788234203
 ;;9002226.02101,"881,68788234203 ",.02)
 ;;68788234203
 ;;9002226.02101,"881,68788234206 ",.01)
 ;;68788234206
 ;;9002226.02101,"881,68788234206 ",.02)
 ;;68788234206
 ;;9002226.02101,"881,68788234209 ",.01)
 ;;68788234209
 ;;9002226.02101,"881,68788234209 ",.02)
 ;;68788234209
 ;;9002226.02101,"881,68788376003 ",.01)
 ;;68788376003
 ;;9002226.02101,"881,68788376003 ",.02)
 ;;68788376003
 ;;9002226.02101,"881,68788376006 ",.01)
 ;;68788376006
 ;;9002226.02101,"881,68788376006 ",.02)
 ;;68788376006
 ;;9002226.02101,"881,68788376009 ",.01)
 ;;68788376009
 ;;9002226.02101,"881,68788376009 ",.02)
 ;;68788376009
 ;;9002226.02101,"881,68788376203 ",.01)
 ;;68788376203
 ;;9002226.02101,"881,68788376203 ",.02)
 ;;68788376203
 ;;9002226.02101,"881,68788376206 ",.01)
 ;;68788376206
 ;;9002226.02101,"881,68788376206 ",.02)
 ;;68788376206
 ;;9002226.02101,"881,68788376209 ",.01)
 ;;68788376209
 ;;9002226.02101,"881,68788376209 ",.02)
 ;;68788376209
 ;;9002226.02101,"881,68788540003 ",.01)
 ;;68788540003
 ;;9002226.02101,"881,68788540003 ",.02)
 ;;68788540003
 ;;9002226.02101,"881,68788540006 ",.01)
 ;;68788540006
 ;;9002226.02101,"881,68788540006 ",.02)
 ;;68788540006
 ;;9002226.02101,"881,68788540009 ",.01)
 ;;68788540009
 ;;9002226.02101,"881,68788540009 ",.02)
 ;;68788540009
 ;;9002226.02101,"881,68788999401 ",.01)
 ;;68788999401
 ;;9002226.02101,"881,68788999401 ",.02)
 ;;68788999401
 ;;9002226.02101,"881,68788999403 ",.01)
 ;;68788999403
 ;;9002226.02101,"881,68788999403 ",.02)
 ;;68788999403
 ;;9002226.02101,"881,68788999406 ",.01)
 ;;68788999406
 ;;9002226.02101,"881,68788999406 ",.02)
 ;;68788999406
 ;;9002226.02101,"881,68788999409 ",.01)
 ;;68788999409
 ;;9002226.02101,"881,68788999409 ",.02)
 ;;68788999409
 ;;9002226.02101,"881,68966207301 ",.01)
 ;;68966207301
 ;;9002226.02101,"881,68966207301 ",.02)
 ;;68966207301
