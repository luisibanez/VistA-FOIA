BGPM5AFO ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON JUL 15, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"881,68180051302 ",.01)
 ;;68180051302
 ;;9002226.02101,"881,68180051302 ",.02)
 ;;68180051302
 ;;9002226.02101,"881,68180051303 ",.01)
 ;;68180051303
 ;;9002226.02101,"881,68180051303 ",.02)
 ;;68180051303
 ;;9002226.02101,"881,68180051304 ",.01)
 ;;68180051304
 ;;9002226.02101,"881,68180051304 ",.02)
 ;;68180051304
 ;;9002226.02101,"881,68180051305 ",.01)
 ;;68180051305
 ;;9002226.02101,"881,68180051305 ",.02)
 ;;68180051305
 ;;9002226.02101,"881,68180051309 ",.01)
 ;;68180051309
 ;;9002226.02101,"881,68180051309 ",.02)
 ;;68180051309
 ;;9002226.02101,"881,68180051330 ",.01)
 ;;68180051330
 ;;9002226.02101,"881,68180051330 ",.02)
 ;;68180051330
 ;;9002226.02101,"881,68180051401 ",.01)
 ;;68180051401
 ;;9002226.02101,"881,68180051401 ",.02)
 ;;68180051401
 ;;9002226.02101,"881,68180051402 ",.01)
 ;;68180051402
 ;;9002226.02101,"881,68180051402 ",.02)
 ;;68180051402
 ;;9002226.02101,"881,68180051403 ",.01)
 ;;68180051403
 ;;9002226.02101,"881,68180051403 ",.02)
 ;;68180051403
 ;;9002226.02101,"881,68180051404 ",.01)
 ;;68180051404
 ;;9002226.02101,"881,68180051404 ",.02)
 ;;68180051404
 ;;9002226.02101,"881,68180051405 ",.01)
 ;;68180051405
 ;;9002226.02101,"881,68180051405 ",.02)
 ;;68180051405
 ;;9002226.02101,"881,68180051409 ",.01)
 ;;68180051409
 ;;9002226.02101,"881,68180051409 ",.02)
 ;;68180051409
 ;;9002226.02101,"881,68180051430 ",.01)
 ;;68180051430
 ;;9002226.02101,"881,68180051430 ",.02)
 ;;68180051430
 ;;9002226.02101,"881,68180051501 ",.01)
 ;;68180051501
 ;;9002226.02101,"881,68180051501 ",.02)
 ;;68180051501
 ;;9002226.02101,"881,68180051502 ",.01)
 ;;68180051502
 ;;9002226.02101,"881,68180051502 ",.02)
 ;;68180051502
 ;;9002226.02101,"881,68180051503 ",.01)
 ;;68180051503
 ;;9002226.02101,"881,68180051503 ",.02)
 ;;68180051503
 ;;9002226.02101,"881,68180051504 ",.01)
 ;;68180051504
 ;;9002226.02101,"881,68180051504 ",.02)
 ;;68180051504
 ;;9002226.02101,"881,68180051505 ",.01)
 ;;68180051505
 ;;9002226.02101,"881,68180051505 ",.02)
 ;;68180051505
 ;;9002226.02101,"881,68180051509 ",.01)
 ;;68180051509
 ;;9002226.02101,"881,68180051509 ",.02)
 ;;68180051509
 ;;9002226.02101,"881,68180051530 ",.01)
 ;;68180051530
 ;;9002226.02101,"881,68180051530 ",.02)
 ;;68180051530
 ;;9002226.02101,"881,68180051601 ",.01)
 ;;68180051601
 ;;9002226.02101,"881,68180051601 ",.02)
 ;;68180051601
 ;;9002226.02101,"881,68180051602 ",.01)
 ;;68180051602
 ;;9002226.02101,"881,68180051602 ",.02)
 ;;68180051602
 ;;9002226.02101,"881,68180051603 ",.01)
 ;;68180051603
 ;;9002226.02101,"881,68180051603 ",.02)
 ;;68180051603
 ;;9002226.02101,"881,68180051609 ",.01)
 ;;68180051609
 ;;9002226.02101,"881,68180051609 ",.02)
 ;;68180051609
 ;;9002226.02101,"881,68180051630 ",.01)
 ;;68180051630
 ;;9002226.02101,"881,68180051630 ",.02)
 ;;68180051630
 ;;9002226.02101,"881,68180051701 ",.01)
 ;;68180051701
 ;;9002226.02101,"881,68180051701 ",.02)
 ;;68180051701
 ;;9002226.02101,"881,68180051702 ",.01)
 ;;68180051702
 ;;9002226.02101,"881,68180051702 ",.02)
 ;;68180051702
 ;;9002226.02101,"881,68180051703 ",.01)
 ;;68180051703
 ;;9002226.02101,"881,68180051703 ",.02)
 ;;68180051703
 ;;9002226.02101,"881,68180051704 ",.01)
 ;;68180051704
 ;;9002226.02101,"881,68180051704 ",.02)
 ;;68180051704
 ;;9002226.02101,"881,68180051709 ",.01)
 ;;68180051709
 ;;9002226.02101,"881,68180051709 ",.02)
 ;;68180051709
 ;;9002226.02101,"881,68180051730 ",.01)
 ;;68180051730
 ;;9002226.02101,"881,68180051730 ",.02)
 ;;68180051730
 ;;9002226.02101,"881,68180051790 ",.01)
 ;;68180051790
 ;;9002226.02101,"881,68180051790 ",.02)
 ;;68180051790
 ;;9002226.02101,"881,68180051801 ",.01)
 ;;68180051801
 ;;9002226.02101,"881,68180051801 ",.02)
 ;;68180051801
 ;;9002226.02101,"881,68180051802 ",.01)
 ;;68180051802
 ;;9002226.02101,"881,68180051802 ",.02)
 ;;68180051802
 ;;9002226.02101,"881,68180051830 ",.01)
 ;;68180051830
 ;;9002226.02101,"881,68180051830 ",.02)
 ;;68180051830
 ;;9002226.02101,"881,68180051901 ",.01)
 ;;68180051901
 ;;9002226.02101,"881,68180051901 ",.02)
 ;;68180051901
 ;;9002226.02101,"881,68180051902 ",.01)
 ;;68180051902
 ;;9002226.02101,"881,68180051902 ",.02)
 ;;68180051902
 ;;9002226.02101,"881,68180051930 ",.01)
 ;;68180051930
 ;;9002226.02101,"881,68180051930 ",.02)
 ;;68180051930
 ;;9002226.02101,"881,68180052001 ",.01)
 ;;68180052001
 ;;9002226.02101,"881,68180052001 ",.02)
 ;;68180052001
 ;;9002226.02101,"881,68180052002 ",.01)
 ;;68180052002
 ;;9002226.02101,"881,68180052002 ",.02)
 ;;68180052002
 ;;9002226.02101,"881,68180052030 ",.01)
 ;;68180052030
 ;;9002226.02101,"881,68180052030 ",.02)
 ;;68180052030
 ;;9002226.02101,"881,68180055609 ",.01)
 ;;68180055609
 ;;9002226.02101,"881,68180055609 ",.02)
 ;;68180055609
 ;;9002226.02101,"881,68180055703 ",.01)
 ;;68180055703
 ;;9002226.02101,"881,68180055703 ",.02)
 ;;68180055703
 ;;9002226.02101,"881,68180055709 ",.01)
 ;;68180055709
 ;;9002226.02101,"881,68180055709 ",.02)
 ;;68180055709
 ;;9002226.02101,"881,68180055803 ",.01)
 ;;68180055803
 ;;9002226.02101,"881,68180055803 ",.02)
 ;;68180055803
 ;;9002226.02101,"881,68180055809 ",.01)
 ;;68180055809
 ;;9002226.02101,"881,68180055809 ",.02)
 ;;68180055809
 ;;9002226.02101,"881,68180055903 ",.01)
 ;;68180055903
 ;;9002226.02101,"881,68180055903 ",.02)
 ;;68180055903
 ;;9002226.02101,"881,68180055909 ",.01)
 ;;68180055909
 ;;9002226.02101,"881,68180055909 ",.02)
 ;;68180055909
 ;;9002226.02101,"881,68180056601 ",.01)
 ;;68180056601
 ;;9002226.02101,"881,68180056601 ",.02)
 ;;68180056601
 ;;9002226.02101,"881,68180056701 ",.01)
 ;;68180056701
 ;;9002226.02101,"881,68180056701 ",.02)
 ;;68180056701
 ;;9002226.02101,"881,68180058801 ",.01)
 ;;68180058801
 ;;9002226.02101,"881,68180058801 ",.02)
 ;;68180058801
 ;;9002226.02101,"881,68180058802 ",.01)
 ;;68180058802
 ;;9002226.02101,"881,68180058802 ",.02)
 ;;68180058802
 ;;9002226.02101,"881,68180058901 ",.01)
 ;;68180058901
 ;;9002226.02101,"881,68180058901 ",.02)
 ;;68180058901
 ;;9002226.02101,"881,68180058902 ",.01)
 ;;68180058902
 ;;9002226.02101,"881,68180058902 ",.02)
 ;;68180058902
 ;;9002226.02101,"881,68180058909 ",.01)
 ;;68180058909
 ;;9002226.02101,"881,68180058909 ",.02)
 ;;68180058909
 ;;9002226.02101,"881,68180059001 ",.01)
 ;;68180059001
 ;;9002226.02101,"881,68180059001 ",.02)
 ;;68180059001
 ;;9002226.02101,"881,68180059002 ",.01)
 ;;68180059002
 ;;9002226.02101,"881,68180059002 ",.02)
 ;;68180059002
 ;;9002226.02101,"881,68180059009 ",.01)
 ;;68180059009
 ;;9002226.02101,"881,68180059009 ",.02)
 ;;68180059009
 ;;9002226.02101,"881,68180059101 ",.01)
 ;;68180059101
 ;;9002226.02101,"881,68180059101 ",.02)
 ;;68180059101
 ;;9002226.02101,"881,68180059102 ",.01)
 ;;68180059102
 ;;9002226.02101,"881,68180059102 ",.02)
 ;;68180059102
 ;;9002226.02101,"881,68180059109 ",.01)
 ;;68180059109
 ;;9002226.02101,"881,68180059109 ",.02)
 ;;68180059109
 ;;9002226.02101,"881,68382014401 ",.01)
 ;;68382014401
 ;;9002226.02101,"881,68382014401 ",.02)
 ;;68382014401
 ;;9002226.02101,"881,68382014405 ",.01)
 ;;68382014405
 ;;9002226.02101,"881,68382014405 ",.02)
 ;;68382014405
 ;;9002226.02101,"881,68382014406 ",.01)
 ;;68382014406
 ;;9002226.02101,"881,68382014406 ",.02)
 ;;68382014406
 ;;9002226.02101,"881,68382014416 ",.01)
 ;;68382014416
 ;;9002226.02101,"881,68382014416 ",.02)
 ;;68382014416
 ;;9002226.02101,"881,68382014430 ",.01)
 ;;68382014430
 ;;9002226.02101,"881,68382014430 ",.02)
 ;;68382014430
 ;;9002226.02101,"881,68382014501 ",.01)
 ;;68382014501
 ;;9002226.02101,"881,68382014501 ",.02)
 ;;68382014501
 ;;9002226.02101,"881,68382014505 ",.01)
 ;;68382014505
 ;;9002226.02101,"881,68382014505 ",.02)
 ;;68382014505
 ;;9002226.02101,"881,68382014506 ",.01)
 ;;68382014506
 ;;9002226.02101,"881,68382014506 ",.02)
 ;;68382014506
 ;;9002226.02101,"881,68382014516 ",.01)
 ;;68382014516
 ;;9002226.02101,"881,68382014516 ",.02)
 ;;68382014516
 ;;9002226.02101,"881,68382014530 ",.01)
 ;;68382014530
 ;;9002226.02101,"881,68382014530 ",.02)
 ;;68382014530
 ;;9002226.02101,"881,68382014601 ",.01)
 ;;68382014601
 ;;9002226.02101,"881,68382014601 ",.02)
 ;;68382014601
 ;;9002226.02101,"881,68382014605 ",.01)
 ;;68382014605
 ;;9002226.02101,"881,68382014605 ",.02)
 ;;68382014605
 ;;9002226.02101,"881,68382014606 ",.01)
 ;;68382014606
 ;;9002226.02101,"881,68382014606 ",.02)
 ;;68382014606
 ;;9002226.02101,"881,68382014616 ",.01)
 ;;68382014616
 ;;9002226.02101,"881,68382014616 ",.02)
 ;;68382014616
 ;;9002226.02101,"881,68382014630 ",.01)
 ;;68382014630
 ;;9002226.02101,"881,68382014630 ",.02)
 ;;68382014630
 ;;9002226.02101,"881,68382014701 ",.01)
 ;;68382014701
 ;;9002226.02101,"881,68382014701 ",.02)
 ;;68382014701
 ;;9002226.02101,"881,68382014705 ",.01)
 ;;68382014705
 ;;9002226.02101,"881,68382014705 ",.02)
 ;;68382014705
 ;;9002226.02101,"881,68382014706 ",.01)
 ;;68382014706
 ;;9002226.02101,"881,68382014706 ",.02)
 ;;68382014706
 ;;9002226.02101,"881,68382014716 ",.01)
 ;;68382014716
 ;;9002226.02101,"881,68382014716 ",.02)
 ;;68382014716
 ;;9002226.02101,"881,68382014730 ",.01)
 ;;68382014730
 ;;9002226.02101,"881,68382014730 ",.02)
 ;;68382014730
 ;;9002226.02101,"881,68387052110 ",.01)
 ;;68387052110
 ;;9002226.02101,"881,68387052110 ",.02)
 ;;68387052110
 ;;9002226.02101,"881,68387054330 ",.01)
 ;;68387054330
 ;;9002226.02101,"881,68387054330 ",.02)
 ;;68387054330
 ;;9002226.02101,"881,68462020501 ",.01)
 ;;68462020501
 ;;9002226.02101,"881,68462020501 ",.02)
 ;;68462020501
 ;;9002226.02101,"881,68462020510 ",.01)
 ;;68462020510
 ;;9002226.02101,"881,68462020510 ",.02)
 ;;68462020510
 ;;9002226.02101,"881,68462020530 ",.01)
 ;;68462020530
 ;;9002226.02101,"881,68462020530 ",.02)
 ;;68462020530
 ;;9002226.02101,"881,68462020601 ",.01)
 ;;68462020601
 ;;9002226.02101,"881,68462020601 ",.02)
 ;;68462020601
 ;;9002226.02101,"881,68462020610 ",.01)
 ;;68462020610
 ;;9002226.02101,"881,68462020610 ",.02)
 ;;68462020610
 ;;9002226.02101,"881,68462020630 ",.01)
 ;;68462020630
 ;;9002226.02101,"881,68462020630 ",.02)
 ;;68462020630
 ;;9002226.02101,"881,68462020701 ",.01)
 ;;68462020701
 ;;9002226.02101,"881,68462020701 ",.02)
 ;;68462020701
 ;;9002226.02101,"881,68462020710 ",.01)
 ;;68462020710
 ;;9002226.02101,"881,68462020710 ",.02)
 ;;68462020710
 ;;9002226.02101,"881,68462020730 ",.01)
 ;;68462020730
 ;;9002226.02101,"881,68462020730 ",.02)
 ;;68462020730
 ;;9002226.02101,"881,68462020801 ",.01)
 ;;68462020801
 ;;9002226.02101,"881,68462020801 ",.02)
 ;;68462020801
 ;;9002226.02101,"881,68462020810 ",.01)
 ;;68462020810
 ;;9002226.02101,"881,68462020810 ",.02)
 ;;68462020810
 ;;9002226.02101,"881,68462020890 ",.01)
 ;;68462020890
 ;;9002226.02101,"881,68462020890 ",.02)
 ;;68462020890
 ;;9002226.02101,"881,68462020901 ",.01)
 ;;68462020901
 ;;9002226.02101,"881,68462020901 ",.02)
 ;;68462020901
 ;;9002226.02101,"881,68462020910 ",.01)
 ;;68462020910
 ;;9002226.02101,"881,68462020910 ",.02)
 ;;68462020910
 ;;9002226.02101,"881,68462020990 ",.01)
 ;;68462020990
 ;;9002226.02101,"881,68462020990 ",.02)
 ;;68462020990
 ;;9002226.02101,"881,68462036705 ",.01)
 ;;68462036705
 ;;9002226.02101,"881,68462036705 ",.02)
 ;;68462036705
 ;;9002226.02101,"881,68462036710 ",.01)
 ;;68462036710
 ;;9002226.02101,"881,68462036710 ",.02)
 ;;68462036710
 ;;9002226.02101,"881,68462036790 ",.01)
 ;;68462036790
 ;;9002226.02101,"881,68462036790 ",.02)
 ;;68462036790
 ;;9002226.02101,"881,68462036805 ",.01)
 ;;68462036805
 ;;9002226.02101,"881,68462036805 ",.02)
 ;;68462036805
