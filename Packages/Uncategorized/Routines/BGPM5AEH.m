BGPM5AEH ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON JUL 15, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"881,15548004701 ",.01)
 ;;15548004701
 ;;9002226.02101,"881,15548004701 ",.02)
 ;;15548004701
 ;;9002226.02101,"881,15548004703 ",.01)
 ;;15548004703
 ;;9002226.02101,"881,15548004703 ",.02)
 ;;15548004703
 ;;9002226.02101,"881,15548004801 ",.01)
 ;;15548004801
 ;;9002226.02101,"881,15548004801 ",.02)
 ;;15548004801
 ;;9002226.02101,"881,15548022703 ",.01)
 ;;15548022703
 ;;9002226.02101,"881,15548022703 ",.02)
 ;;15548022703
 ;;9002226.02101,"881,15548027203 ",.01)
 ;;15548027203
 ;;9002226.02101,"881,15548027203 ",.02)
 ;;15548027203
 ;;9002226.02101,"881,15548027210 ",.01)
 ;;15548027210
 ;;9002226.02101,"881,15548027210 ",.02)
 ;;15548027210
 ;;9002226.02101,"881,15548027303 ",.01)
 ;;15548027303
 ;;9002226.02101,"881,15548027303 ",.02)
 ;;15548027303
 ;;9002226.02101,"881,15548027310 ",.01)
 ;;15548027310
 ;;9002226.02101,"881,15548027310 ",.02)
 ;;15548027310
 ;;9002226.02101,"881,16252053000 ",.01)
 ;;16252053000
 ;;9002226.02101,"881,16252053000 ",.02)
 ;;16252053000
 ;;9002226.02101,"881,16252053090 ",.01)
 ;;16252053090
 ;;9002226.02101,"881,16252053090 ",.02)
 ;;16252053090
 ;;9002226.02101,"881,16252053100 ",.01)
 ;;16252053100
 ;;9002226.02101,"881,16252053100 ",.02)
 ;;16252053100
 ;;9002226.02101,"881,16252053190 ",.01)
 ;;16252053190
 ;;9002226.02101,"881,16252053190 ",.02)
 ;;16252053190
 ;;9002226.02101,"881,16252053200 ",.01)
 ;;16252053200
 ;;9002226.02101,"881,16252053200 ",.02)
 ;;16252053200
 ;;9002226.02101,"881,16252053290 ",.01)
 ;;16252053290
 ;;9002226.02101,"881,16252053290 ",.02)
 ;;16252053290
 ;;9002226.02101,"881,16252054100 ",.01)
 ;;16252054100
 ;;9002226.02101,"881,16252054100 ",.02)
 ;;16252054100
 ;;9002226.02101,"881,16252054130 ",.01)
 ;;16252054130
 ;;9002226.02101,"881,16252054130 ",.02)
 ;;16252054130
 ;;9002226.02101,"881,16252054200 ",.01)
 ;;16252054200
 ;;9002226.02101,"881,16252054200 ",.02)
 ;;16252054200
 ;;9002226.02101,"881,16252054290 ",.01)
 ;;16252054290
 ;;9002226.02101,"881,16252054290 ",.02)
 ;;16252054290
 ;;9002226.02101,"881,16252057001 ",.01)
 ;;16252057001
 ;;9002226.02101,"881,16252057001 ",.02)
 ;;16252057001
 ;;9002226.02101,"881,16252057030 ",.01)
 ;;16252057030
 ;;9002226.02101,"881,16252057030 ",.02)
 ;;16252057030
 ;;9002226.02101,"881,16252057101 ",.01)
 ;;16252057101
 ;;9002226.02101,"881,16252057101 ",.02)
 ;;16252057101
 ;;9002226.02101,"881,16252057150 ",.01)
 ;;16252057150
 ;;9002226.02101,"881,16252057150 ",.02)
 ;;16252057150
 ;;9002226.02101,"881,16252057201 ",.01)
 ;;16252057201
 ;;9002226.02101,"881,16252057201 ",.02)
 ;;16252057201
 ;;9002226.02101,"881,16252057250 ",.01)
 ;;16252057250
 ;;9002226.02101,"881,16252057250 ",.02)
 ;;16252057250
 ;;9002226.02101,"881,16252057301 ",.01)
 ;;16252057301
 ;;9002226.02101,"881,16252057301 ",.02)
 ;;16252057301
 ;;9002226.02101,"881,16252057310 ",.01)
 ;;16252057310
 ;;9002226.02101,"881,16252057310 ",.02)
 ;;16252057310
 ;;9002226.02101,"881,16252057350 ",.01)
 ;;16252057350
 ;;9002226.02101,"881,16252057350 ",.02)
 ;;16252057350
 ;;9002226.02101,"881,16252061001 ",.01)
 ;;16252061001
 ;;9002226.02101,"881,16252061001 ",.02)
 ;;16252061001
 ;;9002226.02101,"881,16252061101 ",.01)
 ;;16252061101
 ;;9002226.02101,"881,16252061101 ",.02)
 ;;16252061101
 ;;9002226.02101,"881,16252061201 ",.01)
 ;;16252061201
 ;;9002226.02101,"881,16252061201 ",.02)
 ;;16252061201
 ;;9002226.02101,"881,16252061301 ",.01)
 ;;16252061301
 ;;9002226.02101,"881,16252061301 ",.02)
 ;;16252061301
 ;;9002226.02101,"881,16252061401 ",.01)
 ;;16252061401
 ;;9002226.02101,"881,16252061401 ",.02)
 ;;16252061401
 ;;9002226.02101,"881,16590030630 ",.01)
 ;;16590030630
 ;;9002226.02101,"881,16590030630 ",.02)
 ;;16590030630
 ;;9002226.02101,"881,16590030660 ",.01)
 ;;16590030660
 ;;9002226.02101,"881,16590030660 ",.02)
 ;;16590030660
 ;;9002226.02101,"881,16590030690 ",.01)
 ;;16590030690
 ;;9002226.02101,"881,16590030690 ",.02)
 ;;16590030690
 ;;9002226.02101,"881,16590030930 ",.01)
 ;;16590030930
 ;;9002226.02101,"881,16590030930 ",.02)
 ;;16590030930
 ;;9002226.02101,"881,16590030960 ",.01)
 ;;16590030960
 ;;9002226.02101,"881,16590030960 ",.02)
 ;;16590030960
 ;;9002226.02101,"881,16590030972 ",.01)
 ;;16590030972
 ;;9002226.02101,"881,16590030972 ",.02)
 ;;16590030972
 ;;9002226.02101,"881,16590030990 ",.01)
 ;;16590030990
 ;;9002226.02101,"881,16590030990 ",.02)
 ;;16590030990
 ;;9002226.02101,"881,16590035630 ",.01)
 ;;16590035630
 ;;9002226.02101,"881,16590035630 ",.02)
 ;;16590035630
 ;;9002226.02101,"881,16590035645 ",.01)
 ;;16590035645
 ;;9002226.02101,"881,16590035645 ",.02)
 ;;16590035645
 ;;9002226.02101,"881,16590035671 ",.01)
 ;;16590035671
 ;;9002226.02101,"881,16590035671 ",.02)
 ;;16590035671
 ;;9002226.02101,"881,16590039230 ",.01)
 ;;16590039230
 ;;9002226.02101,"881,16590039230 ",.02)
 ;;16590039230
 ;;9002226.02101,"881,16590039260 ",.01)
 ;;16590039260
 ;;9002226.02101,"881,16590039260 ",.02)
 ;;16590039260
 ;;9002226.02101,"881,16590039290 ",.01)
 ;;16590039290
 ;;9002226.02101,"881,16590039290 ",.02)
 ;;16590039290
 ;;9002226.02101,"881,17106100100 ",.01)
 ;;17106100100
 ;;9002226.02101,"881,17106100100 ",.02)
 ;;17106100100
 ;;9002226.02101,"881,17106100200 ",.01)
 ;;17106100200
 ;;9002226.02101,"881,17106100200 ",.02)
 ;;17106100200
 ;;9002226.02101,"881,17106100300 ",.01)
 ;;17106100300
 ;;9002226.02101,"881,17106100300 ",.02)
 ;;17106100300
 ;;9002226.02101,"881,17106100400 ",.01)
 ;;17106100400
 ;;9002226.02101,"881,17106100400 ",.02)
 ;;17106100400
 ;;9002226.02101,"881,17856004102 ",.01)
 ;;17856004102
 ;;9002226.02101,"881,17856004102 ",.02)
 ;;17856004102
 ;;9002226.02101,"881,17856010802 ",.01)
 ;;17856010802
 ;;9002226.02101,"881,17856010802 ",.02)
 ;;17856010802
 ;;9002226.02101,"881,17856099002 ",.01)
 ;;17856099002
 ;;9002226.02101,"881,17856099002 ",.02)
 ;;17856099002
 ;;9002226.02101,"881,17856099302 ",.01)
 ;;17856099302
 ;;9002226.02101,"881,17856099302 ",.02)
 ;;17856099302
 ;;9002226.02101,"881,18837027730 ",.01)
 ;;18837027730
 ;;9002226.02101,"881,18837027730 ",.02)
 ;;18837027730
 ;;9002226.02101,"881,21695032830 ",.01)
 ;;21695032830
 ;;9002226.02101,"881,21695032830 ",.02)
 ;;21695032830
 ;;9002226.02101,"881,21695032890 ",.01)
 ;;21695032890
 ;;9002226.02101,"881,21695032890 ",.02)
 ;;21695032890
 ;;9002226.02101,"881,21695032930 ",.01)
 ;;21695032930
 ;;9002226.02101,"881,21695032930 ",.02)
 ;;21695032930
 ;;9002226.02101,"881,21695032978 ",.01)
 ;;21695032978
 ;;9002226.02101,"881,21695032978 ",.02)
 ;;21695032978
 ;;9002226.02101,"881,21695032990 ",.01)
 ;;21695032990
 ;;9002226.02101,"881,21695032990 ",.02)
 ;;21695032990
 ;;9002226.02101,"881,21695033020 ",.01)
 ;;21695033020
 ;;9002226.02101,"881,21695033020 ",.02)
 ;;21695033020
 ;;9002226.02101,"881,21695033030 ",.01)
 ;;21695033030
 ;;9002226.02101,"881,21695033030 ",.02)
 ;;21695033030
 ;;9002226.02101,"881,21695033090 ",.01)
 ;;21695033090
 ;;9002226.02101,"881,21695033090 ",.02)
 ;;21695033090
 ;;9002226.02101,"881,21695033130 ",.01)
 ;;21695033130
 ;;9002226.02101,"881,21695033130 ",.02)
 ;;21695033130
 ;;9002226.02101,"881,21695033190 ",.01)
 ;;21695033190
 ;;9002226.02101,"881,21695033190 ",.02)
 ;;21695033190
 ;;9002226.02101,"881,21695034590 ",.01)
 ;;21695034590
 ;;9002226.02101,"881,21695034590 ",.02)
 ;;21695034590
 ;;9002226.02101,"881,21695039330 ",.01)
 ;;21695039330
 ;;9002226.02101,"881,21695039330 ",.02)
 ;;21695039330
 ;;9002226.02101,"881,21695039430 ",.01)
 ;;21695039430
 ;;9002226.02101,"881,21695039430 ",.02)
 ;;21695039430
 ;;9002226.02101,"881,21695047730 ",.01)
 ;;21695047730
 ;;9002226.02101,"881,21695047730 ",.02)
 ;;21695047730
 ;;9002226.02101,"881,21695047778 ",.01)
 ;;21695047778
 ;;9002226.02101,"881,21695047778 ",.02)
 ;;21695047778
 ;;9002226.02101,"881,21695047830 ",.01)
 ;;21695047830
 ;;9002226.02101,"881,21695047830 ",.02)
 ;;21695047830
 ;;9002226.02101,"881,21695048730 ",.01)
 ;;21695048730
 ;;9002226.02101,"881,21695048730 ",.02)
 ;;21695048730
 ;;9002226.02101,"881,21695048830 ",.01)
 ;;21695048830
 ;;9002226.02101,"881,21695048830 ",.02)
 ;;21695048830
 ;;9002226.02101,"881,21695048860 ",.01)
 ;;21695048860
 ;;9002226.02101,"881,21695048860 ",.02)
 ;;21695048860
 ;;9002226.02101,"881,21695048890 ",.01)
 ;;21695048890
 ;;9002226.02101,"881,21695048890 ",.02)
 ;;21695048890
 ;;9002226.02101,"881,21695048930 ",.01)
 ;;21695048930
 ;;9002226.02101,"881,21695048930 ",.02)
 ;;21695048930
 ;;9002226.02101,"881,21695048990 ",.01)
 ;;21695048990
 ;;9002226.02101,"881,21695048990 ",.02)
 ;;21695048990
 ;;9002226.02101,"881,21695073330 ",.01)
 ;;21695073330
 ;;9002226.02101,"881,21695073330 ",.02)
 ;;21695073330
 ;;9002226.02101,"881,21695073430 ",.01)
 ;;21695073430
 ;;9002226.02101,"881,21695073430 ",.02)
 ;;21695073430
 ;;9002226.02101,"881,21695073460 ",.01)
 ;;21695073460
 ;;9002226.02101,"881,21695073460 ",.02)
 ;;21695073460
 ;;9002226.02101,"881,21695073530 ",.01)
 ;;21695073530
 ;;9002226.02101,"881,21695073530 ",.02)
 ;;21695073530
 ;;9002226.02101,"881,21695073560 ",.01)
 ;;21695073560
 ;;9002226.02101,"881,21695073560 ",.02)
 ;;21695073560
 ;;9002226.02101,"881,21695073590 ",.01)
 ;;21695073590
 ;;9002226.02101,"881,21695073590 ",.02)
 ;;21695073590
 ;;9002226.02101,"881,21695078030 ",.01)
 ;;21695078030
 ;;9002226.02101,"881,21695078030 ",.02)
 ;;21695078030
 ;;9002226.02101,"881,21695082130 ",.01)
 ;;21695082130
 ;;9002226.02101,"881,21695082130 ",.02)
 ;;21695082130
 ;;9002226.02101,"881,21695082190 ",.01)
 ;;21695082190
 ;;9002226.02101,"881,21695082190 ",.02)
 ;;21695082190
 ;;9002226.02101,"881,21695082230 ",.01)
 ;;21695082230
 ;;9002226.02101,"881,21695082230 ",.02)
 ;;21695082230
 ;;9002226.02101,"881,21695082290 ",.01)
 ;;21695082290
 ;;9002226.02101,"881,21695082290 ",.02)
 ;;21695082290
 ;;9002226.02101,"881,21695082330 ",.01)
 ;;21695082330
 ;;9002226.02101,"881,21695082330 ",.02)
 ;;21695082330
 ;;9002226.02101,"881,21695082360 ",.01)
 ;;21695082360
 ;;9002226.02101,"881,21695082360 ",.02)
 ;;21695082360
 ;;9002226.02101,"881,23490052300 ",.01)
 ;;23490052300
 ;;9002226.02101,"881,23490052300 ",.02)
 ;;23490052300
 ;;9002226.02101,"881,23490052303 ",.01)
 ;;23490052303
 ;;9002226.02101,"881,23490052303 ",.02)
 ;;23490052303
 ;;9002226.02101,"881,23490052305 ",.01)
 ;;23490052305
 ;;9002226.02101,"881,23490052305 ",.02)
 ;;23490052305
 ;;9002226.02101,"881,23490052306 ",.01)
 ;;23490052306
 ;;9002226.02101,"881,23490052306 ",.02)
 ;;23490052306
 ;;9002226.02101,"881,23490052309 ",.01)
 ;;23490052309
 ;;9002226.02101,"881,23490052309 ",.02)
 ;;23490052309
 ;;9002226.02101,"881,23490082700 ",.01)
 ;;23490082700
 ;;9002226.02101,"881,23490082700 ",.02)
 ;;23490082700
 ;;9002226.02101,"881,23490082703 ",.01)
 ;;23490082703
 ;;9002226.02101,"881,23490082703 ",.02)
 ;;23490082703
 ;;9002226.02101,"881,23490082705 ",.01)
 ;;23490082705
 ;;9002226.02101,"881,23490082705 ",.02)
 ;;23490082705
 ;;9002226.02101,"881,23490082706 ",.01)
 ;;23490082706
 ;;9002226.02101,"881,23490082706 ",.02)
 ;;23490082706
 ;;9002226.02101,"881,23490082709 ",.01)
 ;;23490082709
 ;;9002226.02101,"881,23490082709 ",.02)
 ;;23490082709
 ;;9002226.02101,"881,23490082903 ",.01)
 ;;23490082903
 ;;9002226.02101,"881,23490082903 ",.02)
 ;;23490082903
 ;;9002226.02101,"881,23490082905 ",.01)
 ;;23490082905
 ;;9002226.02101,"881,23490082905 ",.02)
 ;;23490082905
 ;;9002226.02101,"881,23490082906 ",.01)
 ;;23490082906
 ;;9002226.02101,"881,23490082906 ",.02)
 ;;23490082906
