BGPM5BFE ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON SEP 12, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1084,53489046710 ",.01)
 ;;53489046710
 ;;9002226.02101,"1084,53489046710 ",.02)
 ;;53489046710
 ;;9002226.02101,"1084,53489046788 ",.01)
 ;;53489046788
 ;;9002226.02101,"1084,53489046788 ",.02)
 ;;53489046788
 ;;9002226.02101,"1084,53489046801 ",.01)
 ;;53489046801
 ;;9002226.02101,"1084,53489046801 ",.02)
 ;;53489046801
 ;;9002226.02101,"1084,53489046803 ",.01)
 ;;53489046803
 ;;9002226.02101,"1084,53489046803 ",.02)
 ;;53489046803
 ;;9002226.02101,"1084,53489046805 ",.01)
 ;;53489046805
 ;;9002226.02101,"1084,53489046805 ",.02)
 ;;53489046805
 ;;9002226.02101,"1084,53489046810 ",.01)
 ;;53489046810
 ;;9002226.02101,"1084,53489046810 ",.02)
 ;;53489046810
 ;;9002226.02101,"1084,53489046888 ",.01)
 ;;53489046888
 ;;9002226.02101,"1084,53489046888 ",.02)
 ;;53489046888
 ;;9002226.02101,"1084,53489046901 ",.01)
 ;;53489046901
 ;;9002226.02101,"1084,53489046901 ",.02)
 ;;53489046901
 ;;9002226.02101,"1084,53489046903 ",.01)
 ;;53489046903
 ;;9002226.02101,"1084,53489046903 ",.02)
 ;;53489046903
 ;;9002226.02101,"1084,53489046905 ",.01)
 ;;53489046905
 ;;9002226.02101,"1084,53489046905 ",.02)
 ;;53489046905
 ;;9002226.02101,"1084,53489046910 ",.01)
 ;;53489046910
 ;;9002226.02101,"1084,53489046910 ",.02)
 ;;53489046910
 ;;9002226.02101,"1084,53489046988 ",.01)
 ;;53489046988
 ;;9002226.02101,"1084,53489046988 ",.02)
 ;;53489046988
 ;;9002226.02101,"1084,53489058501 ",.01)
 ;;53489058501
 ;;9002226.02101,"1084,53489058501 ",.02)
 ;;53489058501
 ;;9002226.02101,"1084,53489058503 ",.01)
 ;;53489058503
 ;;9002226.02101,"1084,53489058503 ",.02)
 ;;53489058503
 ;;9002226.02101,"1084,53489058505 ",.01)
 ;;53489058505
 ;;9002226.02101,"1084,53489058505 ",.02)
 ;;53489058505
 ;;9002226.02101,"1084,53489058506 ",.01)
 ;;53489058506
 ;;9002226.02101,"1084,53489058506 ",.02)
 ;;53489058506
 ;;9002226.02101,"1084,53489058507 ",.01)
 ;;53489058507
 ;;9002226.02101,"1084,53489058507 ",.02)
 ;;53489058507
 ;;9002226.02101,"1084,53489058510 ",.01)
 ;;53489058510
 ;;9002226.02101,"1084,53489058510 ",.02)
 ;;53489058510
 ;;9002226.02101,"1084,53746017801 ",.01)
 ;;53746017801
 ;;9002226.02101,"1084,53746017801 ",.02)
 ;;53746017801
 ;;9002226.02101,"1084,53746017805 ",.01)
 ;;53746017805
 ;;9002226.02101,"1084,53746017805 ",.02)
 ;;53746017805
 ;;9002226.02101,"1084,53746017810 ",.01)
 ;;53746017810
 ;;9002226.02101,"1084,53746017810 ",.02)
 ;;53746017810
 ;;9002226.02101,"1084,53746017890 ",.01)
 ;;53746017890
 ;;9002226.02101,"1084,53746017890 ",.02)
 ;;53746017890
 ;;9002226.02101,"1084,53746017901 ",.01)
 ;;53746017901
 ;;9002226.02101,"1084,53746017901 ",.02)
 ;;53746017901
 ;;9002226.02101,"1084,53746017905 ",.01)
 ;;53746017905
 ;;9002226.02101,"1084,53746017905 ",.02)
 ;;53746017905
 ;;9002226.02101,"1084,53746017910 ",.01)
 ;;53746017910
 ;;9002226.02101,"1084,53746017910 ",.02)
 ;;53746017910
 ;;9002226.02101,"1084,53746028602 ",.01)
 ;;53746028602
 ;;9002226.02101,"1084,53746028602 ",.02)
 ;;53746028602
 ;;9002226.02101,"1084,53808018301 ",.01)
 ;;53808018301
 ;;9002226.02101,"1084,53808018301 ",.02)
 ;;53808018301
 ;;9002226.02101,"1084,53808018401 ",.01)
 ;;53808018401
 ;;9002226.02101,"1084,53808018401 ",.02)
 ;;53808018401
 ;;9002226.02101,"1084,53808018501 ",.01)
 ;;53808018501
 ;;9002226.02101,"1084,53808018501 ",.02)
 ;;53808018501
 ;;9002226.02101,"1084,53808025701 ",.01)
 ;;53808025701
 ;;9002226.02101,"1084,53808025701 ",.02)
 ;;53808025701
 ;;9002226.02101,"1084,53808025801 ",.01)
 ;;53808025801
 ;;9002226.02101,"1084,53808025801 ",.02)
 ;;53808025801
 ;;9002226.02101,"1084,53808025901 ",.01)
 ;;53808025901
 ;;9002226.02101,"1084,53808025901 ",.02)
 ;;53808025901
 ;;9002226.02101,"1084,53808026001 ",.01)
 ;;53808026001
 ;;9002226.02101,"1084,53808026001 ",.02)
 ;;53808026001
 ;;9002226.02101,"1084,53808036901 ",.01)
 ;;53808036901
 ;;9002226.02101,"1084,53808036901 ",.02)
 ;;53808036901
 ;;9002226.02101,"1084,53808038101 ",.01)
 ;;53808038101
 ;;9002226.02101,"1084,53808038101 ",.02)
 ;;53808038101
 ;;9002226.02101,"1084,53808040001 ",.01)
 ;;53808040001
 ;;9002226.02101,"1084,53808040001 ",.02)
 ;;53808040001
 ;;9002226.02101,"1084,53808040101 ",.01)
 ;;53808040101
 ;;9002226.02101,"1084,53808040101 ",.02)
 ;;53808040101
 ;;9002226.02101,"1084,53808040801 ",.01)
 ;;53808040801
 ;;9002226.02101,"1084,53808040801 ",.02)
 ;;53808040801
 ;;9002226.02101,"1084,53808040901 ",.01)
 ;;53808040901
 ;;9002226.02101,"1084,53808040901 ",.02)
 ;;53808040901
 ;;9002226.02101,"1084,53808045901 ",.01)
 ;;53808045901
 ;;9002226.02101,"1084,53808045901 ",.02)
 ;;53808045901
 ;;9002226.02101,"1084,53808061301 ",.01)
 ;;53808061301
 ;;9002226.02101,"1084,53808061301 ",.02)
 ;;53808061301
 ;;9002226.02101,"1084,53808071201 ",.01)
 ;;53808071201
 ;;9002226.02101,"1084,53808071201 ",.02)
 ;;53808071201
 ;;9002226.02101,"1084,53808071301 ",.01)
 ;;53808071301
 ;;9002226.02101,"1084,53808071301 ",.02)
 ;;53808071301
 ;;9002226.02101,"1084,53808071701 ",.01)
 ;;53808071701
 ;;9002226.02101,"1084,53808071701 ",.02)
 ;;53808071701
 ;;9002226.02101,"1084,53808071801 ",.01)
 ;;53808071801
 ;;9002226.02101,"1084,53808071801 ",.02)
 ;;53808071801
 ;;9002226.02101,"1084,53808072001 ",.01)
 ;;53808072001
 ;;9002226.02101,"1084,53808072001 ",.02)
 ;;53808072001
 ;;9002226.02101,"1084,53978069303 ",.01)
 ;;53978069303
 ;;9002226.02101,"1084,53978069303 ",.02)
 ;;53978069303
 ;;9002226.02101,"1084,53978069305 ",.01)
 ;;53978069305
 ;;9002226.02101,"1084,53978069305 ",.02)
 ;;53978069305
 ;;9002226.02101,"1084,53978069402 ",.01)
 ;;53978069402
 ;;9002226.02101,"1084,53978069402 ",.02)
 ;;53978069402
 ;;9002226.02101,"1084,53978069403 ",.01)
 ;;53978069403
 ;;9002226.02101,"1084,53978069403 ",.02)
 ;;53978069403
 ;;9002226.02101,"1084,53978069405 ",.01)
 ;;53978069405
 ;;9002226.02101,"1084,53978069405 ",.02)
 ;;53978069405
 ;;9002226.02101,"1084,53978069407 ",.01)
 ;;53978069407
 ;;9002226.02101,"1084,53978069407 ",.02)
 ;;53978069407
 ;;9002226.02101,"1084,53978069408 ",.01)
 ;;53978069408
 ;;9002226.02101,"1084,53978069408 ",.02)
 ;;53978069408
 ;;9002226.02101,"1084,53978201303 ",.01)
 ;;53978201303
 ;;9002226.02101,"1084,53978201303 ",.02)
 ;;53978201303
 ;;9002226.02101,"1084,53978201305 ",.01)
 ;;53978201305
 ;;9002226.02101,"1084,53978201305 ",.02)
 ;;53978201305
 ;;9002226.02101,"1084,53978201308 ",.01)
 ;;53978201308
 ;;9002226.02101,"1084,53978201308 ",.02)
 ;;53978201308
 ;;9002226.02101,"1084,53978201402 ",.01)
 ;;53978201402
 ;;9002226.02101,"1084,53978201402 ",.02)
 ;;53978201402
 ;;9002226.02101,"1084,53978201403 ",.01)
 ;;53978201403
 ;;9002226.02101,"1084,53978201403 ",.02)
 ;;53978201403
 ;;9002226.02101,"1084,53978201404 ",.01)
 ;;53978201404
 ;;9002226.02101,"1084,53978201404 ",.02)
 ;;53978201404
 ;;9002226.02101,"1084,53978201405 ",.01)
 ;;53978201405
 ;;9002226.02101,"1084,53978201405 ",.02)
 ;;53978201405
 ;;9002226.02101,"1084,53978201408 ",.01)
 ;;53978201408
 ;;9002226.02101,"1084,53978201408 ",.02)
 ;;53978201408
 ;;9002226.02101,"1084,54458096610 ",.01)
 ;;54458096610
 ;;9002226.02101,"1084,54458096610 ",.02)
 ;;54458096610
 ;;9002226.02101,"1084,54458096710 ",.01)
 ;;54458096710
 ;;9002226.02101,"1084,54458096710 ",.02)
 ;;54458096710
 ;;9002226.02101,"1084,54458096810 ",.01)
 ;;54458096810
 ;;9002226.02101,"1084,54458096810 ",.02)
 ;;54458096810
 ;;9002226.02101,"1084,54569020300 ",.01)
 ;;54569020300
 ;;9002226.02101,"1084,54569020300 ",.02)
 ;;54569020300
 ;;9002226.02101,"1084,54569020301 ",.01)
 ;;54569020301
 ;;9002226.02101,"1084,54569020301 ",.02)
 ;;54569020301
 ;;9002226.02101,"1084,54569020340 ",.01)
 ;;54569020340
 ;;9002226.02101,"1084,54569020340 ",.02)
 ;;54569020340
 ;;9002226.02101,"1084,54569201701 ",.01)
 ;;54569201701
 ;;9002226.02101,"1084,54569201701 ",.02)
 ;;54569201701
 ;;9002226.02101,"1084,54569383000 ",.01)
 ;;54569383000
 ;;9002226.02101,"1084,54569383000 ",.02)
 ;;54569383000
 ;;9002226.02101,"1084,54569383001 ",.01)
 ;;54569383001
 ;;9002226.02101,"1084,54569383001 ",.02)
 ;;54569383001
 ;;9002226.02101,"1084,54569383002 ",.01)
 ;;54569383002
 ;;9002226.02101,"1084,54569383002 ",.02)
 ;;54569383002
 ;;9002226.02101,"1084,54569383100 ",.01)
 ;;54569383100
 ;;9002226.02101,"1084,54569383100 ",.02)
 ;;54569383100
 ;;9002226.02101,"1084,54569383101 ",.01)
 ;;54569383101
 ;;9002226.02101,"1084,54569383101 ",.02)
 ;;54569383101
 ;;9002226.02101,"1084,54569383102 ",.01)
 ;;54569383102
 ;;9002226.02101,"1084,54569383102 ",.02)
 ;;54569383102
 ;;9002226.02101,"1084,54569383104 ",.01)
 ;;54569383104
 ;;9002226.02101,"1084,54569383104 ",.02)
 ;;54569383104
 ;;9002226.02101,"1084,54569383105 ",.01)
 ;;54569383105
 ;;9002226.02101,"1084,54569383105 ",.02)
 ;;54569383105
 ;;9002226.02101,"1084,54569383106 ",.01)
 ;;54569383106
 ;;9002226.02101,"1084,54569383106 ",.02)
 ;;54569383106
 ;;9002226.02101,"1084,54569383108 ",.01)
 ;;54569383108
 ;;9002226.02101,"1084,54569383108 ",.02)
 ;;54569383108
 ;;9002226.02101,"1084,54569383200 ",.01)
 ;;54569383200
 ;;9002226.02101,"1084,54569383200 ",.02)
 ;;54569383200
 ;;9002226.02101,"1084,54569384100 ",.01)
 ;;54569384100
 ;;9002226.02101,"1084,54569384100 ",.02)
 ;;54569384100
 ;;9002226.02101,"1084,54569384101 ",.01)
 ;;54569384101
 ;;9002226.02101,"1084,54569384101 ",.02)
 ;;54569384101
 ;;9002226.02101,"1084,54569384102 ",.01)
 ;;54569384102
 ;;9002226.02101,"1084,54569384102 ",.02)
 ;;54569384102
 ;;9002226.02101,"1084,54569384200 ",.01)
 ;;54569384200
 ;;9002226.02101,"1084,54569384200 ",.02)
 ;;54569384200
 ;;9002226.02101,"1084,54569384201 ",.01)
 ;;54569384201
 ;;9002226.02101,"1084,54569384201 ",.02)
 ;;54569384201
 ;;9002226.02101,"1084,54569384202 ",.01)
 ;;54569384202
 ;;9002226.02101,"1084,54569384202 ",.02)
 ;;54569384202
 ;;9002226.02101,"1084,54569384204 ",.01)
 ;;54569384204
 ;;9002226.02101,"1084,54569384204 ",.02)
 ;;54569384204
 ;;9002226.02101,"1084,54569535300 ",.01)
 ;;54569535300
 ;;9002226.02101,"1084,54569535300 ",.02)
 ;;54569535300
 ;;9002226.02101,"1084,54569535302 ",.01)
 ;;54569535302
 ;;9002226.02101,"1084,54569535302 ",.02)
 ;;54569535302
 ;;9002226.02101,"1084,54569535303 ",.01)
 ;;54569535303
 ;;9002226.02101,"1084,54569535303 ",.02)
 ;;54569535303
 ;;9002226.02101,"1084,54569536000 ",.01)
 ;;54569536000
 ;;9002226.02101,"1084,54569536000 ",.02)
 ;;54569536000
 ;;9002226.02101,"1084,54569536003 ",.01)
 ;;54569536003
 ;;9002226.02101,"1084,54569536003 ",.02)
 ;;54569536003
 ;;9002226.02101,"1084,54569537300 ",.01)
 ;;54569537300
 ;;9002226.02101,"1084,54569537300 ",.02)
 ;;54569537300
 ;;9002226.02101,"1084,54569537302 ",.01)
 ;;54569537302
 ;;9002226.02101,"1084,54569537302 ",.02)
 ;;54569537302
 ;;9002226.02101,"1084,54569554600 ",.01)
 ;;54569554600
 ;;9002226.02101,"1084,54569554600 ",.02)
 ;;54569554600
 ;;9002226.02101,"1084,54569554601 ",.01)
 ;;54569554601
 ;;9002226.02101,"1084,54569554601 ",.02)
 ;;54569554601
 ;;9002226.02101,"1084,54569554602 ",.01)
 ;;54569554602
 ;;9002226.02101,"1084,54569554602 ",.02)
 ;;54569554602
 ;;9002226.02101,"1084,54569554700 ",.01)
 ;;54569554700
 ;;9002226.02101,"1084,54569554700 ",.02)
 ;;54569554700
 ;;9002226.02101,"1084,54569554701 ",.01)
 ;;54569554701
 ;;9002226.02101,"1084,54569554701 ",.02)
 ;;54569554701
 ;;9002226.02101,"1084,54569554800 ",.01)
 ;;54569554800
 ;;9002226.02101,"1084,54569554800 ",.02)
 ;;54569554800
 ;;9002226.02101,"1084,54569554801 ",.01)
 ;;54569554801
 ;;9002226.02101,"1084,54569554801 ",.02)
 ;;54569554801
 ;;9002226.02101,"1084,54569561800 ",.01)
 ;;54569561800
