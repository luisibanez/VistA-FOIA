BJPC2UJE ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON FEB 17, 2009;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"54868-0029-05 ")
 ;;610
 ;;21,"54868-0029-06 ")
 ;;611
 ;;21,"54868-1438-00 ")
 ;;612
 ;;21,"54868-1438-01 ")
 ;;613
 ;;21,"54868-1894-01 ")
 ;;614
 ;;21,"54868-1894-02 ")
 ;;615
 ;;21,"54868-2710-00 ")
 ;;616
 ;;21,"54868-2710-01 ")
 ;;617
 ;;21,"54868-2822-00 ")
 ;;618
 ;;21,"54868-3555-00 ")
 ;;619
 ;;21,"54868-4481-00 ")
 ;;620
 ;;21,"54868-4972-00 ")
 ;;621
 ;;21,"54868-4972-01 ")
 ;;622
 ;;21,"54868-5531-00 ")
 ;;623
 ;;21,"54868-5531-01 ")
 ;;624
 ;;21,"54977-0684-01 ")
 ;;625
 ;;21,"54977-0684-02 ")
 ;;626
 ;;21,"55045-1931-05 ")
 ;;627
 ;;21,"55154-6301-02 ")
 ;;628
 ;;21,"55154-8502-07 ")
 ;;629
 ;;21,"55175-4460-01 ")
 ;;630
 ;;21,"55175-4461-01 ")
 ;;631
 ;;21,"55175-5247-01 ")
 ;;632
 ;;21,"55289-0259-01 ")
 ;;633
 ;;21,"55289-0259-30 ")
 ;;634
 ;;21,"55289-0259-60 ")
 ;;635
 ;;21,"55289-0260-01 ")
 ;;636
 ;;21,"55289-0260-06 ")
 ;;637
 ;;21,"55289-0260-20 ")
 ;;638
 ;;21,"55289-0260-30 ")
 ;;639
 ;;21,"55289-0260-60 ")
 ;;640
 ;;21,"55289-0317-30 ")
 ;;641
 ;;21,"55289-0317-60 ")
 ;;642
 ;;21,"55289-0751-30 ")
 ;;643
 ;;21,"55289-0751-60 ")
 ;;644
 ;;21,"55289-0785-30 ")
 ;;645
 ;;21,"55289-0785-60 ")
 ;;646
 ;;21,"55289-0788-60 ")
 ;;647
 ;;21,"55289-0789-30 ")
 ;;648
 ;;21,"56126-0436-11 ")
 ;;649
 ;;21,"56126-0437-11 ")
 ;;650
 ;;21,"56126-0438-11 ")
 ;;651
 ;;21,"57480-0365-01 ")
 ;;652
 ;;21,"57480-0365-06 ")
 ;;653
 ;;21,"57480-0366-01 ")
 ;;654
 ;;21,"57480-0366-06 ")
 ;;655
 ;;21,"57480-0367-01 ")
 ;;656
 ;;21,"57480-0367-06 ")
 ;;657
 ;;21,"57866-4651-02 ")
 ;;658
 ;;21,"57866-4652-02 ")
 ;;659
 ;;21,"57866-4653-01 ")
 ;;660
 ;;21,"58298-0520-01 ")
 ;;661
 ;;21,"58864-0501-17 ")
 ;;662
 ;;21,"59198-0252-01 ")
 ;;663
 ;;21,"59198-0253-01 ")
 ;;664
 ;;21,"59198-0254-01 ")
 ;;665
 ;;21,"59198-0255-01 ")
 ;;666
 ;;21,"59198-0356-04 ")
 ;;667
 ;;21,"59930-1509-01 ")
 ;;668
 ;;21,"59930-1509-02 ")
 ;;669
 ;;21,"59930-1650-01 ")
 ;;670
 ;;21,"59930-1650-02 ")
 ;;671
 ;;21,"59930-1650-03 ")
 ;;672
 ;;21,"59930-1660-01 ")
 ;;673
 ;;21,"59930-1660-02 ")
 ;;674
 ;;21,"59930-1660-03 ")
 ;;675
 ;;21,"59930-1670-01 ")
 ;;676
 ;;21,"59930-1670-02 ")
 ;;677
 ;;21,"59930-1670-03 ")
 ;;678
 ;;21,"59930-1680-01 ")
 ;;679
 ;;21,"60346-0168-64 ")
 ;;680
 ;;21,"60432-0157-06 ")
 ;;681
 ;;21,"60432-0157-21 ")
 ;;682
 ;;21,"60505-0802-01 ")
 ;;683
 ;;21,"60505-0802-02 ")
 ;;684
 ;;21,"60793-0011-08 ")
 ;;685
 ;;21,"60793-0011-14 ")
 ;;686
 ;;21,"60793-0120-01 ")
 ;;687
 ;;21,"61392-0016-30 ")
 ;;688
 ;;21,"61392-0016-31 ")
 ;;689
 ;;21,"61392-0016-32 ")
 ;;690
 ;;21,"61392-0016-39 ")
 ;;691
 ;;21,"61392-0016-45 ")
 ;;692
 ;;21,"61392-0016-51 ")
 ;;693
 ;;21,"61392-0016-54 ")
 ;;694
 ;;21,"61392-0016-56 ")
 ;;695
 ;;21,"61392-0016-60 ")
 ;;696
 ;;21,"61392-0016-90 ")
 ;;697
 ;;21,"61392-0016-91 ")
 ;;698
 ;;21,"61392-0017-30 ")
 ;;699
 ;;21,"61392-0017-31 ")
 ;;700
 ;;21,"61392-0017-32 ")
 ;;701
 ;;21,"61392-0017-39 ")
 ;;702
 ;;21,"61392-0017-45 ")
 ;;703
 ;;21,"61392-0017-51 ")
 ;;704
 ;;21,"61392-0017-54 ")
 ;;705
 ;;21,"61392-0017-56 ")
 ;;706
 ;;21,"61392-0017-60 ")
 ;;707
 ;;21,"61392-0017-90 ")
 ;;708
 ;;21,"61392-0017-91 ")
 ;;709
 ;;21,"61570-0019-01 ")
 ;;710
 ;;21,"62947-6406-05 ")
 ;;711
 ;;21,"62947-6406-09 ")
 ;;712
 ;;21,"63874-0443-01 ")
 ;;713
 ;;21,"64681-0157-06 ")
 ;;714
 ;;21,"64681-0157-21 ")
 ;;715
 ;;21,"65162-0324-10 ")
 ;;716
 ;;21,"65162-0324-11 ")
 ;;717
 ;;21,"65162-0325-10 ")
 ;;718
 ;;21,"65162-0325-11 ")
 ;;719
 ;;21,"65162-0335-10 ")
 ;;720
 ;;21,"67781-0251-01 ")
 ;;721
 ;;21,"67781-0251-05 ")
 ;;722
 ;;21,"67781-0252-01 ")
 ;;723
 ;;21,"68115-0328-60 ")
 ;;724
 ;;21,"68115-0651-60 ")
 ;;725
 ;;9002226,750,.01)
 ;;BAT ASTHMA CONTROLLER NDC
 ;;9002226,750,.02)
 ;;@
 ;;9002226,750,.04)
 ;;n
 ;;9002226,750,.06)
 ;;@
 ;;9002226,750,.08)
 ;;@
 ;;9002226,750,.09)
 ;;3080528
 ;;9002226,750,.11)
 ;;@
 ;;9002226,750,.12)
 ;;@
 ;;9002226,750,.13)
 ;;1
 ;;9002226,750,.14)
 ;;@
 ;;9002226,750,.15)
 ;;@
 ;;9002226,750,.16)
 ;;@
 ;;9002226,750,.17)
 ;;@
 ;;9002226,750,3101)
 ;;@
 ;;9002226.02101,"750,00005-3076-43 ",.01)
 ;;00005-3076-43
 ;;9002226.02101,"750,00005-3076-43 ",.02)
 ;;00005-3076-43
 ;;9002226.02101,"750,00005-3077-31 ",.01)
 ;;00005-3077-31
 ;;9002226.02101,"750,00005-3077-31 ",.02)
 ;;00005-3077-31
 ;;9002226.02101,"750,00005-3077-43 ",.01)
 ;;00005-3077-43
 ;;9002226.02101,"750,00005-3077-43 ",.02)
 ;;00005-3077-43
 ;;9002226.02101,"750,00005-3078-31 ",.01)
 ;;00005-3078-31
 ;;9002226.02101,"750,00005-3078-31 ",.02)
 ;;00005-3078-31
 ;;9002226.02101,"750,00005-3078-43 ",.01)
 ;;00005-3078-43
 ;;9002226.02101,"750,00005-3078-43 ",.02)
 ;;00005-3078-43
 ;;9002226.02101,"750,00005-4816-72 ",.01)
 ;;00005-4816-72
 ;;9002226.02101,"750,00005-4816-72 ",.02)
 ;;00005-4816-72
 ;;9002226.02101,"750,00014-2832-31 ",.01)
 ;;00014-2832-31
 ;;9002226.02101,"750,00014-2832-31 ",.02)
 ;;00014-2832-31
