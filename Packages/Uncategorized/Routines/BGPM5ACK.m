BGPM5ACK ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON JUL 15, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"55289006690 ")
 ;;675
 ;;21,"55289006697 ")
 ;;676
 ;;21,"55289018797 ")
 ;;677
 ;;21,"55289026590 ")
 ;;678
 ;;21,"55289028130 ")
 ;;679
 ;;21,"55289028160 ")
 ;;680
 ;;21,"55289028186 ")
 ;;681
 ;;21,"55289028190 ")
 ;;682
 ;;21,"55289030193 ")
 ;;683
 ;;21,"55289060630 ")
 ;;684
 ;;21,"55289060690 ")
 ;;685
 ;;21,"55289077907 ")
 ;;686
 ;;21,"55289080614 ")
 ;;687
 ;;21,"55289080630 ")
 ;;688
 ;;21,"55289080660 ")
 ;;689
 ;;21,"55289080686 ")
 ;;690
 ;;21,"55289080690 ")
 ;;691
 ;;21,"55289089201 ")
 ;;692
 ;;21,"55289089214 ")
 ;;693
 ;;21,"55289089215 ")
 ;;694
 ;;21,"55289089230 ")
 ;;695
 ;;21,"55289089260 ")
 ;;696
 ;;21,"55289089286 ")
 ;;697
 ;;21,"55289089290 ")
 ;;698
 ;;21,"55289089293 ")
 ;;699
 ;;21,"55289089297 ")
 ;;700
 ;;21,"55289089298 ")
 ;;701
 ;;21,"55289097601 ")
 ;;702
 ;;21,"55289097614 ")
 ;;703
 ;;21,"55289097630 ")
 ;;704
 ;;21,"55289097660 ")
 ;;705
 ;;21,"55289097693 ")
 ;;706
 ;;21,"55370014607 ")
 ;;707
 ;;21,"55370014608 ")
 ;;708
 ;;21,"55370014609 ")
 ;;709
 ;;21,"55370014707 ")
 ;;710
 ;;21,"55370014708 ")
 ;;711
 ;;21,"55370014709 ")
 ;;712
 ;;21,"55370014907 ")
 ;;713
 ;;21,"55370014909 ")
 ;;714
 ;;21,"55370046010 ")
 ;;715
 ;;21,"55370046011 ")
 ;;716
 ;;21,"55370046050 ")
 ;;717
 ;;21,"55370046110 ")
 ;;718
 ;;21,"55370046111 ")
 ;;719
 ;;21,"55370046150 ")
 ;;720
 ;;21,"55370046210 ")
 ;;721
 ;;21,"55370046211 ")
 ;;722
 ;;21,"55370046250 ")
 ;;723
 ;;21,"55370050607 ")
 ;;724
 ;;21,"55370050608 ")
 ;;725
 ;;21,"55370050609 ")
 ;;726
 ;;21,"55370059207 ")
 ;;727
 ;;21,"55370059407 ")
 ;;728
 ;;21,"55370059408 ")
 ;;729
 ;;21,"55370059507 ")
 ;;730
 ;;21,"55370059607 ")
 ;;731
 ;;21,"55370059608 ")
 ;;732
 ;;21,"55887017330 ")
 ;;733
 ;;21,"55887017990 ")
 ;;734
 ;;21,"55887021230 ")
 ;;735
 ;;21,"55887022230 ")
 ;;736
 ;;21,"55887022260 ")
 ;;737
 ;;21,"55887022290 ")
 ;;738
 ;;21,"55887033930 ")
 ;;739
 ;;21,"55887033960 ")
 ;;740
 ;;21,"55887033990 ")
 ;;741
 ;;21,"55887036830 ")
 ;;742
 ;;21,"55887036860 ")
 ;;743
 ;;21,"55887036890 ")
 ;;744
 ;;21,"55887036896 ")
 ;;745
 ;;21,"55887053501 ")
 ;;746
 ;;21,"55887053530 ")
 ;;747
 ;;21,"55887053560 ")
 ;;748
 ;;21,"55887053590 ")
 ;;749
 ;;21,"55887053601 ")
 ;;750
 ;;21,"55887053630 ")
 ;;751
 ;;21,"55887053660 ")
 ;;752
 ;;21,"55887053690 ")
 ;;753
 ;;21,"55887053699 ")
 ;;754
 ;;21,"55887065730 ")
 ;;755
 ;;21,"55887065760 ")
 ;;756
 ;;21,"55887069301 ")
 ;;757
 ;;21,"55887069330 ")
 ;;758
 ;;21,"55887069360 ")
 ;;759
 ;;21,"55887069390 ")
 ;;760
 ;;21,"55887072701 ")
 ;;761
 ;;21,"55887072730 ")
 ;;762
 ;;21,"55887072760 ")
 ;;763
 ;;21,"55887072790 ")
 ;;764
 ;;21,"55887084530 ")
 ;;765
 ;;21,"55887084560 ")
 ;;766
 ;;21,"55887096530 ")
 ;;767
 ;;21,"57315001001 ")
 ;;768
 ;;21,"57315001002 ")
 ;;769
 ;;21,"57315001003 ")
 ;;770
 ;;21,"57315001004 ")
 ;;771
 ;;21,"57315001101 ")
 ;;772
 ;;21,"57315001102 ")
 ;;773
 ;;21,"57315001103 ")
 ;;774
 ;;21,"57315001104 ")
 ;;775
 ;;21,"57664039808 ")
 ;;776
 ;;21,"57664039813 ")
 ;;777
 ;;21,"57664039818 ")
 ;;778
 ;;21,"57664039888 ")
 ;;779
 ;;21,"57664039908 ")
 ;;780
 ;;21,"57664039913 ")
 ;;781
 ;;21,"57664039918 ")
 ;;782
 ;;21,"57664039988 ")
 ;;783
 ;;21,"57664072413 ")
 ;;784
 ;;21,"57664072418 ")
 ;;785
 ;;21,"57664072488 ")
 ;;786
 ;;21,"57664072513 ")
 ;;787
 ;;21,"57664072518 ")
 ;;788
 ;;21,"57664072588 ")
 ;;789
 ;;21,"57664072713 ")
 ;;790
 ;;21,"57664072718 ")
 ;;791
 ;;21,"57664072788 ")
 ;;792
 ;;21,"57866346201 ")
 ;;793
 ;;21,"57866346502 ")
 ;;794
 ;;21,"57866346505 ")
 ;;795
 ;;21,"57866466802 ")
 ;;796
 ;;21,"57866640701 ")
 ;;797
 ;;21,"57866640801 ")
 ;;798
 ;;21,"57866640802 ")
 ;;799
 ;;21,"57866640901 ")
 ;;800
 ;;21,"57866640902 ")
 ;;801
 ;;21,"57866640903 ")
 ;;802
 ;;21,"57866640904 ")
 ;;803
 ;;21,"57866640905 ")
 ;;804
 ;;21,"57866640906 ")
 ;;805
 ;;21,"57866646201 ")
 ;;806
 ;;21,"57866646203 ")
 ;;807
 ;;21,"57866646301 ")
 ;;808
 ;;21,"57866646302 ")
 ;;809
 ;;21,"57866707301 ")
 ;;810
 ;;21,"57866707302 ")
 ;;811
 ;;21,"57866707401 ")
 ;;812
 ;;21,"57866707402 ")
 ;;813
 ;;21,"58016000500 ")
 ;;814
 ;;21,"58016000501 ")
 ;;815
 ;;21,"58016000502 ")
 ;;816
 ;;21,"58016000503 ")
 ;;817
 ;;21,"58016000504 ")
 ;;818
 ;;21,"58016000505 ")
 ;;819
 ;;21,"58016000530 ")
 ;;820
 ;;21,"58016000560 ")
 ;;821
 ;;21,"58016000590 ")
 ;;822
 ;;21,"58016005800 ")
 ;;823
 ;;21,"58016005801 ")
 ;;824
 ;;21,"58016005802 ")
 ;;825
 ;;21,"58016005803 ")
 ;;826
 ;;21,"58016005804 ")
 ;;827
 ;;21,"58016005805 ")
 ;;828
 ;;21,"58016005830 ")
 ;;829
 ;;21,"58016005860 ")
 ;;830
 ;;21,"58016005890 ")
 ;;831
 ;;21,"58016033400 ")
 ;;832
 ;;21,"58016033401 ")
 ;;833
 ;;21,"58016033402 ")
 ;;834
 ;;21,"58016033403 ")
 ;;835
 ;;21,"58016033404 ")
 ;;836
 ;;21,"58016033405 ")
 ;;837
 ;;21,"58016033406 ")
 ;;838
 ;;21,"58016033407 ")
 ;;839
 ;;21,"58016033408 ")
 ;;840
 ;;21,"58016033409 ")
 ;;841
 ;;21,"58016033410 ")
 ;;842
 ;;21,"58016033412 ")
 ;;843
 ;;21,"58016033414 ")
 ;;844
 ;;21,"58016033415 ")
 ;;845
 ;;21,"58016033416 ")
 ;;846
 ;;21,"58016033418 ")
 ;;847
 ;;21,"58016033420 ")
 ;;848
 ;;21,"58016033421 ")
 ;;849
 ;;21,"58016033424 ")
 ;;850
 ;;21,"58016033425 ")
 ;;851
 ;;21,"58016033426 ")
 ;;852
 ;;21,"58016033427 ")
 ;;853
 ;;21,"58016033428 ")
 ;;854
 ;;21,"58016033430 ")
 ;;855
 ;;21,"58016033432 ")
 ;;856
 ;;21,"58016033435 ")
 ;;857
 ;;21,"58016033436 ")
 ;;858
 ;;21,"58016033440 ")
 ;;859
 ;;21,"58016033442 ")
 ;;860
 ;;21,"58016033444 ")
 ;;861
 ;;21,"58016033445 ")
 ;;862
 ;;21,"58016033448 ")
 ;;863
 ;;21,"58016033450 ")
 ;;864
 ;;21,"58016033456 ")
 ;;865
 ;;21,"58016033460 ")
 ;;866
 ;;21,"58016033467 ")
 ;;867
 ;;21,"58016033469 ")
 ;;868
 ;;21,"58016033470 ")
 ;;869
 ;;21,"58016033471 ")
 ;;870
 ;;21,"58016033472 ")
 ;;871
 ;;21,"58016033473 ")
 ;;872
 ;;21,"58016033475 ")
 ;;873
 ;;21,"58016033476 ")
 ;;874
 ;;21,"58016033477 ")
 ;;875
 ;;21,"58016033479 ")
 ;;876
 ;;21,"58016033480 ")
 ;;877
 ;;21,"58016033481 ")
 ;;878
 ;;21,"58016033482 ")
 ;;879
 ;;21,"58016033483 ")
 ;;880
 ;;21,"58016033484 ")
 ;;881
 ;;21,"58016033487 ")
 ;;882
 ;;21,"58016033489 ")
 ;;883
 ;;21,"58016033490 ")
 ;;884
 ;;21,"58016033491 ")
 ;;885
 ;;21,"58016033492 ")
 ;;886
 ;;21,"58016033493 ")
 ;;887
 ;;21,"58016033496 ")
 ;;888
 ;;21,"58016033497 ")
 ;;889
 ;;21,"58016033498 ")
 ;;890
 ;;21,"58016033499 ")
 ;;891
 ;;21,"58016037030 ")
 ;;892
 ;;21,"58016037600 ")
 ;;893
 ;;21,"58016037601 ")
 ;;894
 ;;21,"58016037602 ")
 ;;895
 ;;21,"58016037603 ")
 ;;896
 ;;21,"58016037604 ")
 ;;897
 ;;21,"58016037605 ")
 ;;898
 ;;21,"58016037606 ")
 ;;899
 ;;21,"58016037607 ")
 ;;900
 ;;21,"58016037608 ")
 ;;901
 ;;21,"58016037609 ")
 ;;902
 ;;21,"58016037610 ")
 ;;903
 ;;21,"58016037612 ")
 ;;904
 ;;21,"58016037614 ")
 ;;905
 ;;21,"58016037615 ")
 ;;906
 ;;21,"58016037616 ")
 ;;907
 ;;21,"58016037618 ")
 ;;908
 ;;21,"58016037620 ")
 ;;909
 ;;21,"58016037621 ")
 ;;910
 ;;21,"58016037624 ")
 ;;911
 ;;21,"58016037625 ")
 ;;912
 ;;21,"58016037626 ")
 ;;913
 ;;21,"58016037627 ")
 ;;914
 ;;21,"58016037628 ")
 ;;915
 ;;21,"58016037630 ")
 ;;916
 ;;21,"58016037632 ")
 ;;917
 ;;21,"58016037635 ")
 ;;918
 ;;21,"58016037636 ")
 ;;919
 ;;21,"58016037640 ")
 ;;920
 ;;21,"58016037642 ")
 ;;921
 ;;21,"58016037644 ")
 ;;922
 ;;21,"58016037645 ")
 ;;923
 ;;21,"58016037648 ")
 ;;924
 ;;21,"58016037650 ")
 ;;925
 ;;21,"58016037656 ")
 ;;926
 ;;21,"58016037660 ")
 ;;927
 ;;21,"58016037667 ")
 ;;928
 ;;21,"58016037669 ")
 ;;929
 ;;21,"58016037670 ")
 ;;930
 ;;21,"58016037671 ")
 ;;931
 ;;21,"58016037672 ")
 ;;932
 ;;21,"58016037673 ")
 ;;933
 ;;21,"58016037675 ")
 ;;934
 ;;21,"58016037676 ")
 ;;935
 ;;21,"58016037677 ")
 ;;936
 ;;21,"58016037679 ")
 ;;937
 ;;21,"58016037680 ")
 ;;938
 ;;21,"58016037681 ")
 ;;939
 ;;21,"58016037682 ")
 ;;940
 ;;21,"58016037683 ")
 ;;941
 ;;21,"58016037684 ")
 ;;942
 ;;21,"58016037687 ")
 ;;943
 ;;21,"58016037689 ")
 ;;944
 ;;21,"58016037690 ")
 ;;945
 ;;21,"58016037691 ")
 ;;946
 ;;21,"58016037692 ")
 ;;947
 ;;21,"58016037693 ")
 ;;948
 ;;21,"58016037696 ")
 ;;949
 ;;21,"58016037697 ")
 ;;950
 ;;21,"58016037698 ")
 ;;951
 ;;21,"58016037699 ")
 ;;952
 ;;21,"58016037800 ")
 ;;953
 ;;21,"58016037801 ")
 ;;954
 ;;21,"58016037802 ")
 ;;955
 ;;21,"58016037803 ")
 ;;956
 ;;21,"58016037804 ")
 ;;957
 ;;21,"58016037805 ")
 ;;958
 ;;21,"58016037806 ")
 ;;959
 ;;21,"58016037807 ")
 ;;960
 ;;21,"58016037808 ")
 ;;961
 ;;21,"58016037809 ")
 ;;962
 ;;21,"58016037810 ")
 ;;963
 ;;21,"58016037812 ")
 ;;964
 ;;21,"58016037814 ")
 ;;965
 ;;21,"58016037815 ")
 ;;966
 ;;21,"58016037816 ")
 ;;967
 ;;21,"58016037818 ")
 ;;968
 ;;21,"58016037820 ")
 ;;969
 ;;21,"58016037821 ")
 ;;970
 ;;21,"58016037824 ")
 ;;971
 ;;21,"58016037825 ")
 ;;972
 ;;21,"58016037826 ")
 ;;973
 ;;21,"58016037827 ")
 ;;974
 ;;21,"58016037828 ")
 ;;975
 ;;21,"58016037830 ")
 ;;976
 ;;21,"58016037832 ")
 ;;977
 ;;21,"58016037835 ")
 ;;978
 ;;21,"58016037836 ")
 ;;979
 ;;21,"58016037840 ")
 ;;980
 ;;21,"58016037842 ")
 ;;981
 ;;21,"58016037844 ")
 ;;982
 ;;21,"58016037845 ")
 ;;983
 ;;21,"58016037848 ")
 ;;984
 ;;21,"58016037850 ")
 ;;985
 ;;21,"58016037856 ")
 ;;986
 ;;21,"58016037860 ")
 ;;987
 ;;21,"58016037867 ")
 ;;988
 ;;21,"58016037869 ")
 ;;989
 ;;21,"58016037870 ")
 ;;990
 ;;21,"58016037871 ")
 ;;991
 ;;21,"58016037872 ")
 ;;992
 ;;21,"58016037873 ")
 ;;993
 ;;21,"58016037875 ")
 ;;994
 ;;21,"58016037876 ")
 ;;995
 ;;21,"58016037877 ")
 ;;996
 ;;21,"58016037879 ")
 ;;997
 ;;21,"58016037880 ")
 ;;998
 ;;21,"58016037881 ")
 ;;999
 ;;21,"58016037882 ")
 ;;1000
 ;;21,"58016037883 ")
 ;;1001
 ;;21,"58016037884 ")
 ;;1002
 ;;21,"58016037887 ")
 ;;1003
 ;;21,"58016037889 ")
 ;;1004
 ;;21,"58016037890 ")
 ;;1005
 ;;21,"58016037891 ")
 ;;1006
 ;;21,"58016037892 ")
 ;;1007
 ;;21,"58016037893 ")
 ;;1008
 ;;21,"58016037896 ")
 ;;1009
 ;;21,"58016037897 ")
 ;;1010
 ;;21,"58016037898 ")
 ;;1011
 ;;21,"58016037899 ")
 ;;1012
 ;;21,"58016038300 ")
 ;;1013
 ;;21,"58016038301 ")
 ;;1014
 ;;21,"58016038302 ")
 ;;1015
 ;;21,"58016038303 ")
 ;;1016
 ;;21,"58016038304 ")
 ;;1017
 ;;21,"58016038305 ")
 ;;1018
 ;;21,"58016038306 ")
 ;;1019
 ;;21,"58016038307 ")
 ;;1020
 ;;21,"58016038308 ")
 ;;1021
 ;;21,"58016038309 ")
 ;;1022
 ;;21,"58016038310 ")
 ;;1023
 ;;21,"58016038312 ")
 ;;1024
 ;;21,"58016038314 ")
 ;;1025
 ;;21,"58016038315 ")
 ;;1026
 ;;21,"58016038316 ")
 ;;1027
 ;;21,"58016038318 ")
 ;;1028
 ;;21,"58016038320 ")
 ;;1029
 ;;21,"58016038321 ")
 ;;1030
 ;;21,"58016038324 ")
 ;;1031
 ;;21,"58016038325 ")
 ;;1032
 ;;21,"58016038326 ")
 ;;1033
 ;;21,"58016038327 ")
 ;;1034
 ;;21,"58016038328 ")
 ;;1035