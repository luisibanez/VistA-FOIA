BGPM5BDE ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON SEP 12, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1044,58016080880 ",.02)
 ;;58016080880
 ;;9002226.02101,"1044,58016080881 ",.01)
 ;;58016080881
 ;;9002226.02101,"1044,58016080881 ",.02)
 ;;58016080881
 ;;9002226.02101,"1044,58016080882 ",.01)
 ;;58016080882
 ;;9002226.02101,"1044,58016080882 ",.02)
 ;;58016080882
 ;;9002226.02101,"1044,58016080883 ",.01)
 ;;58016080883
 ;;9002226.02101,"1044,58016080883 ",.02)
 ;;58016080883
 ;;9002226.02101,"1044,58016080884 ",.01)
 ;;58016080884
 ;;9002226.02101,"1044,58016080884 ",.02)
 ;;58016080884
 ;;9002226.02101,"1044,58016080887 ",.01)
 ;;58016080887
 ;;9002226.02101,"1044,58016080887 ",.02)
 ;;58016080887
 ;;9002226.02101,"1044,58016080889 ",.01)
 ;;58016080889
 ;;9002226.02101,"1044,58016080889 ",.02)
 ;;58016080889
 ;;9002226.02101,"1044,58016080890 ",.01)
 ;;58016080890
 ;;9002226.02101,"1044,58016080890 ",.02)
 ;;58016080890
 ;;9002226.02101,"1044,58016080891 ",.01)
 ;;58016080891
 ;;9002226.02101,"1044,58016080891 ",.02)
 ;;58016080891
 ;;9002226.02101,"1044,58016080892 ",.01)
 ;;58016080892
 ;;9002226.02101,"1044,58016080892 ",.02)
 ;;58016080892
 ;;9002226.02101,"1044,58016080893 ",.01)
 ;;58016080893
 ;;9002226.02101,"1044,58016080893 ",.02)
 ;;58016080893
 ;;9002226.02101,"1044,58016080896 ",.01)
 ;;58016080896
 ;;9002226.02101,"1044,58016080896 ",.02)
 ;;58016080896
 ;;9002226.02101,"1044,58016080897 ",.01)
 ;;58016080897
 ;;9002226.02101,"1044,58016080897 ",.02)
 ;;58016080897
 ;;9002226.02101,"1044,58016080898 ",.01)
 ;;58016080898
 ;;9002226.02101,"1044,58016080898 ",.02)
 ;;58016080898
 ;;9002226.02101,"1044,58016080899 ",.01)
 ;;58016080899
 ;;9002226.02101,"1044,58016080899 ",.02)
 ;;58016080899
 ;;9002226.02101,"1044,58016081300 ",.01)
 ;;58016081300
 ;;9002226.02101,"1044,58016081300 ",.02)
 ;;58016081300
 ;;9002226.02101,"1044,58016081302 ",.01)
 ;;58016081302
 ;;9002226.02101,"1044,58016081302 ",.02)
 ;;58016081302
 ;;9002226.02101,"1044,58016081303 ",.01)
 ;;58016081303
 ;;9002226.02101,"1044,58016081303 ",.02)
 ;;58016081303
 ;;9002226.02101,"1044,58016081310 ",.01)
 ;;58016081310
 ;;9002226.02101,"1044,58016081310 ",.02)
 ;;58016081310
 ;;9002226.02101,"1044,58016081312 ",.01)
 ;;58016081312
 ;;9002226.02101,"1044,58016081312 ",.02)
 ;;58016081312
 ;;9002226.02101,"1044,58016081315 ",.01)
 ;;58016081315
 ;;9002226.02101,"1044,58016081315 ",.02)
 ;;58016081315
 ;;9002226.02101,"1044,58016081320 ",.01)
 ;;58016081320
 ;;9002226.02101,"1044,58016081320 ",.02)
 ;;58016081320
 ;;9002226.02101,"1044,58016081324 ",.01)
 ;;58016081324
 ;;9002226.02101,"1044,58016081324 ",.02)
 ;;58016081324
 ;;9002226.02101,"1044,58016081330 ",.01)
 ;;58016081330
 ;;9002226.02101,"1044,58016081330 ",.02)
 ;;58016081330
 ;;9002226.02101,"1044,58016081350 ",.01)
 ;;58016081350
 ;;9002226.02101,"1044,58016081350 ",.02)
 ;;58016081350
 ;;9002226.02101,"1044,58016081360 ",.01)
 ;;58016081360
 ;;9002226.02101,"1044,58016081360 ",.02)
 ;;58016081360
 ;;9002226.02101,"1044,58016081373 ",.01)
 ;;58016081373
 ;;9002226.02101,"1044,58016081373 ",.02)
 ;;58016081373
 ;;9002226.02101,"1044,58016081389 ",.01)
 ;;58016081389
 ;;9002226.02101,"1044,58016081389 ",.02)
 ;;58016081389
 ;;9002226.02101,"1044,58016081390 ",.01)
 ;;58016081390
 ;;9002226.02101,"1044,58016081390 ",.02)
 ;;58016081390
 ;;9002226.02101,"1044,58016081399 ",.01)
 ;;58016081399
 ;;9002226.02101,"1044,58016081399 ",.02)
 ;;58016081399
 ;;9002226.02101,"1044,58016081400 ",.01)
 ;;58016081400
 ;;9002226.02101,"1044,58016081400 ",.02)
 ;;58016081400
 ;;9002226.02101,"1044,58016081402 ",.01)
 ;;58016081402
 ;;9002226.02101,"1044,58016081402 ",.02)
 ;;58016081402
 ;;9002226.02101,"1044,58016081415 ",.01)
 ;;58016081415
 ;;9002226.02101,"1044,58016081415 ",.02)
 ;;58016081415
 ;;9002226.02101,"1044,58016081420 ",.01)
 ;;58016081420
 ;;9002226.02101,"1044,58016081420 ",.02)
 ;;58016081420
 ;;9002226.02101,"1044,58016081425 ",.01)
 ;;58016081425
 ;;9002226.02101,"1044,58016081425 ",.02)
 ;;58016081425
 ;;9002226.02101,"1044,58016081430 ",.01)
 ;;58016081430
 ;;9002226.02101,"1044,58016081430 ",.02)
 ;;58016081430
 ;;9002226.02101,"1044,58016081440 ",.01)
 ;;58016081440
 ;;9002226.02101,"1044,58016081440 ",.02)
 ;;58016081440
 ;;9002226.02101,"1044,58016081445 ",.01)
 ;;58016081445
 ;;9002226.02101,"1044,58016081445 ",.02)
 ;;58016081445
 ;;9002226.02101,"1044,58016081450 ",.01)
 ;;58016081450
 ;;9002226.02101,"1044,58016081450 ",.02)
 ;;58016081450
 ;;9002226.02101,"1044,58016081460 ",.01)
 ;;58016081460
 ;;9002226.02101,"1044,58016081460 ",.02)
 ;;58016081460
 ;;9002226.02101,"1044,58016081489 ",.01)
 ;;58016081489
 ;;9002226.02101,"1044,58016081489 ",.02)
 ;;58016081489
 ;;9002226.02101,"1044,58016081490 ",.01)
 ;;58016081490
 ;;9002226.02101,"1044,58016081490 ",.02)
 ;;58016081490
 ;;9002226.02101,"1044,58016081499 ",.01)
 ;;58016081499
 ;;9002226.02101,"1044,58016081499 ",.02)
 ;;58016081499
 ;;9002226.02101,"1044,58016081500 ",.01)
 ;;58016081500
 ;;9002226.02101,"1044,58016081500 ",.02)
 ;;58016081500
 ;;9002226.02101,"1044,58016081515 ",.01)
 ;;58016081515
 ;;9002226.02101,"1044,58016081515 ",.02)
 ;;58016081515
 ;;9002226.02101,"1044,58016081520 ",.01)
 ;;58016081520
 ;;9002226.02101,"1044,58016081520 ",.02)
 ;;58016081520
 ;;9002226.02101,"1044,58016081521 ",.01)
 ;;58016081521
 ;;9002226.02101,"1044,58016081521 ",.02)
 ;;58016081521
 ;;9002226.02101,"1044,58016081528 ",.01)
 ;;58016081528
 ;;9002226.02101,"1044,58016081528 ",.02)
 ;;58016081528
 ;;9002226.02101,"1044,58016081530 ",.01)
 ;;58016081530
 ;;9002226.02101,"1044,58016081530 ",.02)
 ;;58016081530
 ;;9002226.02101,"1044,58016081560 ",.01)
 ;;58016081560
 ;;9002226.02101,"1044,58016081560 ",.02)
 ;;58016081560
 ;;9002226.02101,"1044,58016081590 ",.01)
 ;;58016081590
 ;;9002226.02101,"1044,58016081590 ",.02)
 ;;58016081590
 ;;9002226.02101,"1044,58016081599 ",.01)
 ;;58016081599
 ;;9002226.02101,"1044,58016081599 ",.02)
 ;;58016081599
 ;;9002226.02101,"1044,58016081700 ",.01)
 ;;58016081700
 ;;9002226.02101,"1044,58016081700 ",.02)
 ;;58016081700
 ;;9002226.02101,"1044,58016081701 ",.01)
 ;;58016081701
 ;;9002226.02101,"1044,58016081701 ",.02)
 ;;58016081701
 ;;9002226.02101,"1044,58016081702 ",.01)
 ;;58016081702
 ;;9002226.02101,"1044,58016081702 ",.02)
 ;;58016081702
 ;;9002226.02101,"1044,58016081703 ",.01)
 ;;58016081703
 ;;9002226.02101,"1044,58016081703 ",.02)
 ;;58016081703
 ;;9002226.02101,"1044,58016081704 ",.01)
 ;;58016081704
 ;;9002226.02101,"1044,58016081704 ",.02)
 ;;58016081704
 ;;9002226.02101,"1044,58016081705 ",.01)
 ;;58016081705
 ;;9002226.02101,"1044,58016081705 ",.02)
 ;;58016081705
 ;;9002226.02101,"1044,58016081706 ",.01)
 ;;58016081706
 ;;9002226.02101,"1044,58016081706 ",.02)
 ;;58016081706
 ;;9002226.02101,"1044,58016081707 ",.01)
 ;;58016081707
 ;;9002226.02101,"1044,58016081707 ",.02)
 ;;58016081707
 ;;9002226.02101,"1044,58016081708 ",.01)
 ;;58016081708
 ;;9002226.02101,"1044,58016081708 ",.02)
 ;;58016081708
 ;;9002226.02101,"1044,58016081709 ",.01)
 ;;58016081709
 ;;9002226.02101,"1044,58016081709 ",.02)
 ;;58016081709
 ;;9002226.02101,"1044,58016081710 ",.01)
 ;;58016081710
 ;;9002226.02101,"1044,58016081710 ",.02)
 ;;58016081710
 ;;9002226.02101,"1044,58016081712 ",.01)
 ;;58016081712
 ;;9002226.02101,"1044,58016081712 ",.02)
 ;;58016081712
 ;;9002226.02101,"1044,58016081714 ",.01)
 ;;58016081714
 ;;9002226.02101,"1044,58016081714 ",.02)
 ;;58016081714
 ;;9002226.02101,"1044,58016081715 ",.01)
 ;;58016081715
 ;;9002226.02101,"1044,58016081715 ",.02)
 ;;58016081715
 ;;9002226.02101,"1044,58016081716 ",.01)
 ;;58016081716
 ;;9002226.02101,"1044,58016081716 ",.02)
 ;;58016081716
 ;;9002226.02101,"1044,58016081718 ",.01)
 ;;58016081718
 ;;9002226.02101,"1044,58016081718 ",.02)
 ;;58016081718
 ;;9002226.02101,"1044,58016081720 ",.01)
 ;;58016081720
 ;;9002226.02101,"1044,58016081720 ",.02)
 ;;58016081720
 ;;9002226.02101,"1044,58016081721 ",.01)
 ;;58016081721
 ;;9002226.02101,"1044,58016081721 ",.02)
 ;;58016081721
 ;;9002226.02101,"1044,58016081724 ",.01)
 ;;58016081724
 ;;9002226.02101,"1044,58016081724 ",.02)
 ;;58016081724
 ;;9002226.02101,"1044,58016081725 ",.01)
 ;;58016081725
 ;;9002226.02101,"1044,58016081725 ",.02)
 ;;58016081725
 ;;9002226.02101,"1044,58016081726 ",.01)
 ;;58016081726
 ;;9002226.02101,"1044,58016081726 ",.02)
 ;;58016081726
 ;;9002226.02101,"1044,58016081727 ",.01)
 ;;58016081727
 ;;9002226.02101,"1044,58016081727 ",.02)
 ;;58016081727
 ;;9002226.02101,"1044,58016081728 ",.01)
 ;;58016081728
 ;;9002226.02101,"1044,58016081728 ",.02)
 ;;58016081728
 ;;9002226.02101,"1044,58016081730 ",.01)
 ;;58016081730
 ;;9002226.02101,"1044,58016081730 ",.02)
 ;;58016081730
 ;;9002226.02101,"1044,58016081732 ",.01)
 ;;58016081732
 ;;9002226.02101,"1044,58016081732 ",.02)
 ;;58016081732
 ;;9002226.02101,"1044,58016081735 ",.01)
 ;;58016081735
 ;;9002226.02101,"1044,58016081735 ",.02)
 ;;58016081735
 ;;9002226.02101,"1044,58016081736 ",.01)
 ;;58016081736
 ;;9002226.02101,"1044,58016081736 ",.02)
 ;;58016081736
 ;;9002226.02101,"1044,58016081740 ",.01)
 ;;58016081740
 ;;9002226.02101,"1044,58016081740 ",.02)
 ;;58016081740
 ;;9002226.02101,"1044,58016081742 ",.01)
 ;;58016081742
 ;;9002226.02101,"1044,58016081742 ",.02)
 ;;58016081742
 ;;9002226.02101,"1044,58016081744 ",.01)
 ;;58016081744
 ;;9002226.02101,"1044,58016081744 ",.02)
 ;;58016081744
 ;;9002226.02101,"1044,58016081745 ",.01)
 ;;58016081745
 ;;9002226.02101,"1044,58016081745 ",.02)
 ;;58016081745
 ;;9002226.02101,"1044,58016081748 ",.01)
 ;;58016081748
 ;;9002226.02101,"1044,58016081748 ",.02)
 ;;58016081748
 ;;9002226.02101,"1044,58016081750 ",.01)
 ;;58016081750
 ;;9002226.02101,"1044,58016081750 ",.02)
 ;;58016081750
 ;;9002226.02101,"1044,58016081756 ",.01)
 ;;58016081756
 ;;9002226.02101,"1044,58016081756 ",.02)
 ;;58016081756
 ;;9002226.02101,"1044,58016081760 ",.01)
 ;;58016081760
 ;;9002226.02101,"1044,58016081760 ",.02)
 ;;58016081760
 ;;9002226.02101,"1044,58016081767 ",.01)
 ;;58016081767
 ;;9002226.02101,"1044,58016081767 ",.02)
 ;;58016081767
 ;;9002226.02101,"1044,58016081769 ",.01)
 ;;58016081769
 ;;9002226.02101,"1044,58016081769 ",.02)
 ;;58016081769
 ;;9002226.02101,"1044,58016081770 ",.01)
 ;;58016081770
 ;;9002226.02101,"1044,58016081770 ",.02)
 ;;58016081770
 ;;9002226.02101,"1044,58016081771 ",.01)
 ;;58016081771
 ;;9002226.02101,"1044,58016081771 ",.02)
 ;;58016081771
 ;;9002226.02101,"1044,58016081772 ",.01)
 ;;58016081772
 ;;9002226.02101,"1044,58016081772 ",.02)
 ;;58016081772
 ;;9002226.02101,"1044,58016081773 ",.01)
 ;;58016081773
 ;;9002226.02101,"1044,58016081773 ",.02)
 ;;58016081773
 ;;9002226.02101,"1044,58016081775 ",.01)
 ;;58016081775
 ;;9002226.02101,"1044,58016081775 ",.02)
 ;;58016081775
 ;;9002226.02101,"1044,58016081776 ",.01)
 ;;58016081776
 ;;9002226.02101,"1044,58016081776 ",.02)
 ;;58016081776
 ;;9002226.02101,"1044,58016081777 ",.01)
 ;;58016081777
 ;;9002226.02101,"1044,58016081777 ",.02)
 ;;58016081777
 ;;9002226.02101,"1044,58016081779 ",.01)
 ;;58016081779
 ;;9002226.02101,"1044,58016081779 ",.02)
 ;;58016081779
 ;;9002226.02101,"1044,58016081780 ",.01)
 ;;58016081780
 ;;9002226.02101,"1044,58016081780 ",.02)
 ;;58016081780
 ;;9002226.02101,"1044,58016081781 ",.01)
 ;;58016081781
 ;;9002226.02101,"1044,58016081781 ",.02)
 ;;58016081781
 ;;9002226.02101,"1044,58016081782 ",.01)
 ;;58016081782
 ;;9002226.02101,"1044,58016081782 ",.02)
 ;;58016081782
 ;;9002226.02101,"1044,58016081783 ",.01)
 ;;58016081783
 ;;9002226.02101,"1044,58016081783 ",.02)
 ;;58016081783