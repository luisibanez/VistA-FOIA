BGPM5ARP ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON AUG 16, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1005,58016058124 ",.01)
 ;;58016058124
 ;;9002226.02101,"1005,58016058124 ",.02)
 ;;58016058124
 ;;9002226.02101,"1005,58016058125 ",.01)
 ;;58016058125
 ;;9002226.02101,"1005,58016058125 ",.02)
 ;;58016058125
 ;;9002226.02101,"1005,58016058126 ",.01)
 ;;58016058126
 ;;9002226.02101,"1005,58016058126 ",.02)
 ;;58016058126
 ;;9002226.02101,"1005,58016058127 ",.01)
 ;;58016058127
 ;;9002226.02101,"1005,58016058127 ",.02)
 ;;58016058127
 ;;9002226.02101,"1005,58016058128 ",.01)
 ;;58016058128
 ;;9002226.02101,"1005,58016058128 ",.02)
 ;;58016058128
 ;;9002226.02101,"1005,58016058130 ",.01)
 ;;58016058130
 ;;9002226.02101,"1005,58016058130 ",.02)
 ;;58016058130
 ;;9002226.02101,"1005,58016058132 ",.01)
 ;;58016058132
 ;;9002226.02101,"1005,58016058132 ",.02)
 ;;58016058132
 ;;9002226.02101,"1005,58016058135 ",.01)
 ;;58016058135
 ;;9002226.02101,"1005,58016058135 ",.02)
 ;;58016058135
 ;;9002226.02101,"1005,58016058136 ",.01)
 ;;58016058136
 ;;9002226.02101,"1005,58016058136 ",.02)
 ;;58016058136
 ;;9002226.02101,"1005,58016058140 ",.01)
 ;;58016058140
 ;;9002226.02101,"1005,58016058140 ",.02)
 ;;58016058140
 ;;9002226.02101,"1005,58016058142 ",.01)
 ;;58016058142
 ;;9002226.02101,"1005,58016058142 ",.02)
 ;;58016058142
 ;;9002226.02101,"1005,58016058144 ",.01)
 ;;58016058144
 ;;9002226.02101,"1005,58016058144 ",.02)
 ;;58016058144
 ;;9002226.02101,"1005,58016058145 ",.01)
 ;;58016058145
 ;;9002226.02101,"1005,58016058145 ",.02)
 ;;58016058145
 ;;9002226.02101,"1005,58016058148 ",.01)
 ;;58016058148
 ;;9002226.02101,"1005,58016058148 ",.02)
 ;;58016058148
 ;;9002226.02101,"1005,58016058150 ",.01)
 ;;58016058150
 ;;9002226.02101,"1005,58016058150 ",.02)
 ;;58016058150
 ;;9002226.02101,"1005,58016058156 ",.01)
 ;;58016058156
 ;;9002226.02101,"1005,58016058156 ",.02)
 ;;58016058156
 ;;9002226.02101,"1005,58016058160 ",.01)
 ;;58016058160
 ;;9002226.02101,"1005,58016058160 ",.02)
 ;;58016058160
 ;;9002226.02101,"1005,58016058167 ",.01)
 ;;58016058167
 ;;9002226.02101,"1005,58016058167 ",.02)
 ;;58016058167
 ;;9002226.02101,"1005,58016058169 ",.01)
 ;;58016058169
 ;;9002226.02101,"1005,58016058169 ",.02)
 ;;58016058169
 ;;9002226.02101,"1005,58016058170 ",.01)
 ;;58016058170
 ;;9002226.02101,"1005,58016058170 ",.02)
 ;;58016058170
 ;;9002226.02101,"1005,58016058171 ",.01)
 ;;58016058171
 ;;9002226.02101,"1005,58016058171 ",.02)
 ;;58016058171
 ;;9002226.02101,"1005,58016058172 ",.01)
 ;;58016058172
 ;;9002226.02101,"1005,58016058172 ",.02)
 ;;58016058172
 ;;9002226.02101,"1005,58016058173 ",.01)
 ;;58016058173
 ;;9002226.02101,"1005,58016058173 ",.02)
 ;;58016058173
 ;;9002226.02101,"1005,58016058175 ",.01)
 ;;58016058175
 ;;9002226.02101,"1005,58016058175 ",.02)
 ;;58016058175
 ;;9002226.02101,"1005,58016058176 ",.01)
 ;;58016058176
 ;;9002226.02101,"1005,58016058176 ",.02)
 ;;58016058176
 ;;9002226.02101,"1005,58016058177 ",.01)
 ;;58016058177
 ;;9002226.02101,"1005,58016058177 ",.02)
 ;;58016058177
 ;;9002226.02101,"1005,58016058179 ",.01)
 ;;58016058179
 ;;9002226.02101,"1005,58016058179 ",.02)
 ;;58016058179
 ;;9002226.02101,"1005,58016058180 ",.01)
 ;;58016058180
 ;;9002226.02101,"1005,58016058180 ",.02)
 ;;58016058180
 ;;9002226.02101,"1005,58016058181 ",.01)
 ;;58016058181
 ;;9002226.02101,"1005,58016058181 ",.02)
 ;;58016058181
 ;;9002226.02101,"1005,58016058182 ",.01)
 ;;58016058182
 ;;9002226.02101,"1005,58016058182 ",.02)
 ;;58016058182
 ;;9002226.02101,"1005,58016058183 ",.01)
 ;;58016058183
 ;;9002226.02101,"1005,58016058183 ",.02)
 ;;58016058183
 ;;9002226.02101,"1005,58016058184 ",.01)
 ;;58016058184
 ;;9002226.02101,"1005,58016058184 ",.02)
 ;;58016058184
 ;;9002226.02101,"1005,58016058187 ",.01)
 ;;58016058187
 ;;9002226.02101,"1005,58016058187 ",.02)
 ;;58016058187
 ;;9002226.02101,"1005,58016058189 ",.01)
 ;;58016058189
 ;;9002226.02101,"1005,58016058189 ",.02)
 ;;58016058189
 ;;9002226.02101,"1005,58016058190 ",.01)
 ;;58016058190
 ;;9002226.02101,"1005,58016058190 ",.02)
 ;;58016058190
 ;;9002226.02101,"1005,58016058191 ",.01)
 ;;58016058191
 ;;9002226.02101,"1005,58016058191 ",.02)
 ;;58016058191
 ;;9002226.02101,"1005,58016058192 ",.01)
 ;;58016058192
 ;;9002226.02101,"1005,58016058192 ",.02)
 ;;58016058192
 ;;9002226.02101,"1005,58016058193 ",.01)
 ;;58016058193
 ;;9002226.02101,"1005,58016058193 ",.02)
 ;;58016058193
 ;;9002226.02101,"1005,58016058196 ",.01)
 ;;58016058196
 ;;9002226.02101,"1005,58016058196 ",.02)
 ;;58016058196
 ;;9002226.02101,"1005,58016058197 ",.01)
 ;;58016058197
 ;;9002226.02101,"1005,58016058197 ",.02)
 ;;58016058197
 ;;9002226.02101,"1005,58016058198 ",.01)
 ;;58016058198
 ;;9002226.02101,"1005,58016058198 ",.02)
 ;;58016058198
 ;;9002226.02101,"1005,58016058199 ",.01)
 ;;58016058199
 ;;9002226.02101,"1005,58016058199 ",.02)
 ;;58016058199
 ;;9002226.02101,"1005,58016060601 ",.01)
 ;;58016060601
 ;;9002226.02101,"1005,58016060601 ",.02)
 ;;58016060601
 ;;9002226.02101,"1005,58016060602 ",.01)
 ;;58016060602
 ;;9002226.02101,"1005,58016060602 ",.02)
 ;;58016060602
 ;;9002226.02101,"1005,58016060603 ",.01)
 ;;58016060603
 ;;9002226.02101,"1005,58016060603 ",.02)
 ;;58016060603
 ;;9002226.02101,"1005,58016060604 ",.01)
 ;;58016060604
 ;;9002226.02101,"1005,58016060604 ",.02)
 ;;58016060604
 ;;9002226.02101,"1005,58016060605 ",.01)
 ;;58016060605
 ;;9002226.02101,"1005,58016060605 ",.02)
 ;;58016060605
 ;;9002226.02101,"1005,58016060606 ",.01)
 ;;58016060606
 ;;9002226.02101,"1005,58016060606 ",.02)
 ;;58016060606
 ;;9002226.02101,"1005,58016060607 ",.01)
 ;;58016060607
 ;;9002226.02101,"1005,58016060607 ",.02)
 ;;58016060607
 ;;9002226.02101,"1005,58016060608 ",.01)
 ;;58016060608
 ;;9002226.02101,"1005,58016060608 ",.02)
 ;;58016060608
 ;;9002226.02101,"1005,58016060609 ",.01)
 ;;58016060609
 ;;9002226.02101,"1005,58016060609 ",.02)
 ;;58016060609
 ;;9002226.02101,"1005,58016060610 ",.01)
 ;;58016060610
 ;;9002226.02101,"1005,58016060610 ",.02)
 ;;58016060610
 ;;9002226.02101,"1005,58016060614 ",.01)
 ;;58016060614
 ;;9002226.02101,"1005,58016060614 ",.02)
 ;;58016060614
 ;;9002226.02101,"1005,58016060616 ",.01)
 ;;58016060616
 ;;9002226.02101,"1005,58016060616 ",.02)
 ;;58016060616
 ;;9002226.02101,"1005,58016060618 ",.01)
 ;;58016060618
 ;;9002226.02101,"1005,58016060618 ",.02)
 ;;58016060618
 ;;9002226.02101,"1005,58016060621 ",.01)
 ;;58016060621
 ;;9002226.02101,"1005,58016060621 ",.02)
 ;;58016060621
 ;;9002226.02101,"1005,58016060624 ",.01)
 ;;58016060624
 ;;9002226.02101,"1005,58016060624 ",.02)
 ;;58016060624
 ;;9002226.02101,"1005,58016060625 ",.01)
 ;;58016060625
 ;;9002226.02101,"1005,58016060625 ",.02)
 ;;58016060625
 ;;9002226.02101,"1005,58016060626 ",.01)
 ;;58016060626
 ;;9002226.02101,"1005,58016060626 ",.02)
 ;;58016060626
 ;;9002226.02101,"1005,58016060627 ",.01)
 ;;58016060627
 ;;9002226.02101,"1005,58016060627 ",.02)
 ;;58016060627
 ;;9002226.02101,"1005,58016060628 ",.01)
 ;;58016060628
 ;;9002226.02101,"1005,58016060628 ",.02)
 ;;58016060628
 ;;9002226.02101,"1005,58016060632 ",.01)
 ;;58016060632
 ;;9002226.02101,"1005,58016060632 ",.02)
 ;;58016060632
 ;;9002226.02101,"1005,58016060635 ",.01)
 ;;58016060635
 ;;9002226.02101,"1005,58016060635 ",.02)
 ;;58016060635
 ;;9002226.02101,"1005,58016060636 ",.01)
 ;;58016060636
 ;;9002226.02101,"1005,58016060636 ",.02)
 ;;58016060636
 ;;9002226.02101,"1005,58016060640 ",.01)
 ;;58016060640
 ;;9002226.02101,"1005,58016060640 ",.02)
 ;;58016060640
 ;;9002226.02101,"1005,58016060642 ",.01)
 ;;58016060642
 ;;9002226.02101,"1005,58016060642 ",.02)
 ;;58016060642
 ;;9002226.02101,"1005,58016060644 ",.01)
 ;;58016060644
 ;;9002226.02101,"1005,58016060644 ",.02)
 ;;58016060644
 ;;9002226.02101,"1005,58016060645 ",.01)
 ;;58016060645
 ;;9002226.02101,"1005,58016060645 ",.02)
 ;;58016060645
 ;;9002226.02101,"1005,58016060648 ",.01)
 ;;58016060648
 ;;9002226.02101,"1005,58016060648 ",.02)
 ;;58016060648
 ;;9002226.02101,"1005,58016060650 ",.01)
 ;;58016060650
 ;;9002226.02101,"1005,58016060650 ",.02)
 ;;58016060650
 ;;9002226.02101,"1005,58016060656 ",.01)
 ;;58016060656
 ;;9002226.02101,"1005,58016060656 ",.02)
 ;;58016060656
 ;;9002226.02101,"1005,58016060660 ",.01)
 ;;58016060660
 ;;9002226.02101,"1005,58016060660 ",.02)
 ;;58016060660
 ;;9002226.02101,"1005,58016060667 ",.01)
 ;;58016060667
 ;;9002226.02101,"1005,58016060667 ",.02)
 ;;58016060667
 ;;9002226.02101,"1005,58016060669 ",.01)
 ;;58016060669
 ;;9002226.02101,"1005,58016060669 ",.02)
 ;;58016060669
 ;;9002226.02101,"1005,58016060670 ",.01)
 ;;58016060670
 ;;9002226.02101,"1005,58016060670 ",.02)
 ;;58016060670
 ;;9002226.02101,"1005,58016060671 ",.01)
 ;;58016060671
 ;;9002226.02101,"1005,58016060671 ",.02)
 ;;58016060671
 ;;9002226.02101,"1005,58016060672 ",.01)
 ;;58016060672
 ;;9002226.02101,"1005,58016060672 ",.02)
 ;;58016060672
 ;;9002226.02101,"1005,58016060673 ",.01)
 ;;58016060673
 ;;9002226.02101,"1005,58016060673 ",.02)
 ;;58016060673
 ;;9002226.02101,"1005,58016060675 ",.01)
 ;;58016060675
 ;;9002226.02101,"1005,58016060675 ",.02)
 ;;58016060675
 ;;9002226.02101,"1005,58016060676 ",.01)
 ;;58016060676
 ;;9002226.02101,"1005,58016060676 ",.02)
 ;;58016060676
 ;;9002226.02101,"1005,58016060677 ",.01)
 ;;58016060677
 ;;9002226.02101,"1005,58016060677 ",.02)
 ;;58016060677
 ;;9002226.02101,"1005,58016060679 ",.01)
 ;;58016060679
 ;;9002226.02101,"1005,58016060679 ",.02)
 ;;58016060679
 ;;9002226.02101,"1005,58016060680 ",.01)
 ;;58016060680
 ;;9002226.02101,"1005,58016060680 ",.02)
 ;;58016060680
 ;;9002226.02101,"1005,58016060681 ",.01)
 ;;58016060681
 ;;9002226.02101,"1005,58016060681 ",.02)
 ;;58016060681
 ;;9002226.02101,"1005,58016060682 ",.01)
 ;;58016060682
 ;;9002226.02101,"1005,58016060682 ",.02)
 ;;58016060682
 ;;9002226.02101,"1005,58016060683 ",.01)
 ;;58016060683
 ;;9002226.02101,"1005,58016060683 ",.02)
 ;;58016060683
 ;;9002226.02101,"1005,58016060684 ",.01)
 ;;58016060684
 ;;9002226.02101,"1005,58016060684 ",.02)
 ;;58016060684
 ;;9002226.02101,"1005,58016060687 ",.01)
 ;;58016060687
 ;;9002226.02101,"1005,58016060687 ",.02)
 ;;58016060687
 ;;9002226.02101,"1005,58016060689 ",.01)
 ;;58016060689
 ;;9002226.02101,"1005,58016060689 ",.02)
 ;;58016060689
 ;;9002226.02101,"1005,58016060691 ",.01)
 ;;58016060691
 ;;9002226.02101,"1005,58016060691 ",.02)
 ;;58016060691
 ;;9002226.02101,"1005,58016060692 ",.01)
 ;;58016060692
 ;;9002226.02101,"1005,58016060692 ",.02)
 ;;58016060692
 ;;9002226.02101,"1005,58016060693 ",.01)
 ;;58016060693
 ;;9002226.02101,"1005,58016060693 ",.02)
 ;;58016060693
 ;;9002226.02101,"1005,58016060696 ",.01)
 ;;58016060696
 ;;9002226.02101,"1005,58016060696 ",.02)
 ;;58016060696
 ;;9002226.02101,"1005,58016060697 ",.01)
 ;;58016060697
 ;;9002226.02101,"1005,58016060697 ",.02)
 ;;58016060697
 ;;9002226.02101,"1005,58016060698 ",.01)
 ;;58016060698
 ;;9002226.02101,"1005,58016060698 ",.02)
 ;;58016060698
 ;;9002226.02101,"1005,58016060699 ",.01)
 ;;58016060699
 ;;9002226.02101,"1005,58016060699 ",.02)
 ;;58016060699
 ;;9002226.02101,"1005,58016064600 ",.01)
 ;;58016064600
 ;;9002226.02101,"1005,58016064600 ",.02)
 ;;58016064600
 ;;9002226.02101,"1005,58016064630 ",.01)
 ;;58016064630
 ;;9002226.02101,"1005,58016064630 ",.02)
 ;;58016064630
 ;;9002226.02101,"1005,58016064660 ",.01)
 ;;58016064660
 ;;9002226.02101,"1005,58016064660 ",.02)
 ;;58016064660
 ;;9002226.02101,"1005,58016064690 ",.01)
 ;;58016064690
 ;;9002226.02101,"1005,58016064690 ",.02)
 ;;58016064690
 ;;9002226.02101,"1005,58016076000 ",.01)
 ;;58016076000
