BGPM5AJY ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON JUL 15, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"889,58016052807 ",.01)
 ;;58016052807
 ;;9002226.02101,"889,58016052807 ",.02)
 ;;58016052807
 ;;9002226.02101,"889,58016052808 ",.01)
 ;;58016052808
 ;;9002226.02101,"889,58016052808 ",.02)
 ;;58016052808
 ;;9002226.02101,"889,58016052809 ",.01)
 ;;58016052809
 ;;9002226.02101,"889,58016052809 ",.02)
 ;;58016052809
 ;;9002226.02101,"889,58016052810 ",.01)
 ;;58016052810
 ;;9002226.02101,"889,58016052810 ",.02)
 ;;58016052810
 ;;9002226.02101,"889,58016052812 ",.01)
 ;;58016052812
 ;;9002226.02101,"889,58016052812 ",.02)
 ;;58016052812
 ;;9002226.02101,"889,58016052814 ",.01)
 ;;58016052814
 ;;9002226.02101,"889,58016052814 ",.02)
 ;;58016052814
 ;;9002226.02101,"889,58016052815 ",.01)
 ;;58016052815
 ;;9002226.02101,"889,58016052815 ",.02)
 ;;58016052815
 ;;9002226.02101,"889,58016052816 ",.01)
 ;;58016052816
 ;;9002226.02101,"889,58016052816 ",.02)
 ;;58016052816
 ;;9002226.02101,"889,58016052818 ",.01)
 ;;58016052818
 ;;9002226.02101,"889,58016052818 ",.02)
 ;;58016052818
 ;;9002226.02101,"889,58016052820 ",.01)
 ;;58016052820
 ;;9002226.02101,"889,58016052820 ",.02)
 ;;58016052820
 ;;9002226.02101,"889,58016052821 ",.01)
 ;;58016052821
 ;;9002226.02101,"889,58016052821 ",.02)
 ;;58016052821
 ;;9002226.02101,"889,58016052824 ",.01)
 ;;58016052824
 ;;9002226.02101,"889,58016052824 ",.02)
 ;;58016052824
 ;;9002226.02101,"889,58016052825 ",.01)
 ;;58016052825
 ;;9002226.02101,"889,58016052825 ",.02)
 ;;58016052825
 ;;9002226.02101,"889,58016052826 ",.01)
 ;;58016052826
 ;;9002226.02101,"889,58016052826 ",.02)
 ;;58016052826
 ;;9002226.02101,"889,58016052827 ",.01)
 ;;58016052827
 ;;9002226.02101,"889,58016052827 ",.02)
 ;;58016052827
 ;;9002226.02101,"889,58016052828 ",.01)
 ;;58016052828
 ;;9002226.02101,"889,58016052828 ",.02)
 ;;58016052828
 ;;9002226.02101,"889,58016052830 ",.01)
 ;;58016052830
 ;;9002226.02101,"889,58016052830 ",.02)
 ;;58016052830
 ;;9002226.02101,"889,58016052832 ",.01)
 ;;58016052832
 ;;9002226.02101,"889,58016052832 ",.02)
 ;;58016052832
 ;;9002226.02101,"889,58016052835 ",.01)
 ;;58016052835
 ;;9002226.02101,"889,58016052835 ",.02)
 ;;58016052835
 ;;9002226.02101,"889,58016052836 ",.01)
 ;;58016052836
 ;;9002226.02101,"889,58016052836 ",.02)
 ;;58016052836
 ;;9002226.02101,"889,58016052840 ",.01)
 ;;58016052840
 ;;9002226.02101,"889,58016052840 ",.02)
 ;;58016052840
 ;;9002226.02101,"889,58016052842 ",.01)
 ;;58016052842
 ;;9002226.02101,"889,58016052842 ",.02)
 ;;58016052842
 ;;9002226.02101,"889,58016052844 ",.01)
 ;;58016052844
 ;;9002226.02101,"889,58016052844 ",.02)
 ;;58016052844
 ;;9002226.02101,"889,58016052845 ",.01)
 ;;58016052845
 ;;9002226.02101,"889,58016052845 ",.02)
 ;;58016052845
 ;;9002226.02101,"889,58016052848 ",.01)
 ;;58016052848
 ;;9002226.02101,"889,58016052848 ",.02)
 ;;58016052848
 ;;9002226.02101,"889,58016052850 ",.01)
 ;;58016052850
 ;;9002226.02101,"889,58016052850 ",.02)
 ;;58016052850
 ;;9002226.02101,"889,58016052856 ",.01)
 ;;58016052856
 ;;9002226.02101,"889,58016052856 ",.02)
 ;;58016052856
 ;;9002226.02101,"889,58016052860 ",.01)
 ;;58016052860
 ;;9002226.02101,"889,58016052860 ",.02)
 ;;58016052860
 ;;9002226.02101,"889,58016052867 ",.01)
 ;;58016052867
 ;;9002226.02101,"889,58016052867 ",.02)
 ;;58016052867
 ;;9002226.02101,"889,58016052869 ",.01)
 ;;58016052869
 ;;9002226.02101,"889,58016052869 ",.02)
 ;;58016052869
 ;;9002226.02101,"889,58016052870 ",.01)
 ;;58016052870
 ;;9002226.02101,"889,58016052870 ",.02)
 ;;58016052870
 ;;9002226.02101,"889,58016052871 ",.01)
 ;;58016052871
 ;;9002226.02101,"889,58016052871 ",.02)
 ;;58016052871
 ;;9002226.02101,"889,58016052872 ",.01)
 ;;58016052872
 ;;9002226.02101,"889,58016052872 ",.02)
 ;;58016052872
 ;;9002226.02101,"889,58016052873 ",.01)
 ;;58016052873
 ;;9002226.02101,"889,58016052873 ",.02)
 ;;58016052873
 ;;9002226.02101,"889,58016052875 ",.01)
 ;;58016052875
 ;;9002226.02101,"889,58016052875 ",.02)
 ;;58016052875
 ;;9002226.02101,"889,58016052876 ",.01)
 ;;58016052876
 ;;9002226.02101,"889,58016052876 ",.02)
 ;;58016052876
 ;;9002226.02101,"889,58016052877 ",.01)
 ;;58016052877
 ;;9002226.02101,"889,58016052877 ",.02)
 ;;58016052877
 ;;9002226.02101,"889,58016052879 ",.01)
 ;;58016052879
 ;;9002226.02101,"889,58016052879 ",.02)
 ;;58016052879
 ;;9002226.02101,"889,58016052880 ",.01)
 ;;58016052880
 ;;9002226.02101,"889,58016052880 ",.02)
 ;;58016052880
 ;;9002226.02101,"889,58016052881 ",.01)
 ;;58016052881
 ;;9002226.02101,"889,58016052881 ",.02)
 ;;58016052881
 ;;9002226.02101,"889,58016052882 ",.01)
 ;;58016052882
 ;;9002226.02101,"889,58016052882 ",.02)
 ;;58016052882
 ;;9002226.02101,"889,58016052883 ",.01)
 ;;58016052883
 ;;9002226.02101,"889,58016052883 ",.02)
 ;;58016052883
 ;;9002226.02101,"889,58016052884 ",.01)
 ;;58016052884
 ;;9002226.02101,"889,58016052884 ",.02)
 ;;58016052884
 ;;9002226.02101,"889,58016052887 ",.01)
 ;;58016052887
 ;;9002226.02101,"889,58016052887 ",.02)
 ;;58016052887
 ;;9002226.02101,"889,58016052889 ",.01)
 ;;58016052889
 ;;9002226.02101,"889,58016052889 ",.02)
 ;;58016052889
 ;;9002226.02101,"889,58016052890 ",.01)
 ;;58016052890
 ;;9002226.02101,"889,58016052890 ",.02)
 ;;58016052890
 ;;9002226.02101,"889,58016052891 ",.01)
 ;;58016052891
 ;;9002226.02101,"889,58016052891 ",.02)
 ;;58016052891
 ;;9002226.02101,"889,58016052892 ",.01)
 ;;58016052892
 ;;9002226.02101,"889,58016052892 ",.02)
 ;;58016052892
 ;;9002226.02101,"889,58016052893 ",.01)
 ;;58016052893
 ;;9002226.02101,"889,58016052893 ",.02)
 ;;58016052893
 ;;9002226.02101,"889,58016052896 ",.01)
 ;;58016052896
 ;;9002226.02101,"889,58016052896 ",.02)
 ;;58016052896
 ;;9002226.02101,"889,58016052897 ",.01)
 ;;58016052897
 ;;9002226.02101,"889,58016052897 ",.02)
 ;;58016052897
 ;;9002226.02101,"889,58016052898 ",.01)
 ;;58016052898
 ;;9002226.02101,"889,58016052898 ",.02)
 ;;58016052898
 ;;9002226.02101,"889,58016052899 ",.01)
 ;;58016052899
 ;;9002226.02101,"889,58016052899 ",.02)
 ;;58016052899
 ;;9002226.02101,"889,58016052900 ",.01)
 ;;58016052900
 ;;9002226.02101,"889,58016052900 ",.02)
 ;;58016052900
 ;;9002226.02101,"889,58016052910 ",.01)
 ;;58016052910
 ;;9002226.02101,"889,58016052910 ",.02)
 ;;58016052910
 ;;9002226.02101,"889,58016052930 ",.01)
 ;;58016052930
 ;;9002226.02101,"889,58016052930 ",.02)
 ;;58016052930
 ;;9002226.02101,"889,58016052950 ",.01)
 ;;58016052950
 ;;9002226.02101,"889,58016052950 ",.02)
 ;;58016052950
 ;;9002226.02101,"889,58016053100 ",.01)
 ;;58016053100
 ;;9002226.02101,"889,58016053100 ",.02)
 ;;58016053100
 ;;9002226.02101,"889,58016053101 ",.01)
 ;;58016053101
 ;;9002226.02101,"889,58016053101 ",.02)
 ;;58016053101
 ;;9002226.02101,"889,58016053102 ",.01)
 ;;58016053102
 ;;9002226.02101,"889,58016053102 ",.02)
 ;;58016053102
 ;;9002226.02101,"889,58016053103 ",.01)
 ;;58016053103
 ;;9002226.02101,"889,58016053103 ",.02)
 ;;58016053103
 ;;9002226.02101,"889,58016053104 ",.01)
 ;;58016053104
 ;;9002226.02101,"889,58016053104 ",.02)
 ;;58016053104
 ;;9002226.02101,"889,58016053105 ",.01)
 ;;58016053105
 ;;9002226.02101,"889,58016053105 ",.02)
 ;;58016053105
 ;;9002226.02101,"889,58016053106 ",.01)
 ;;58016053106
 ;;9002226.02101,"889,58016053106 ",.02)
 ;;58016053106
 ;;9002226.02101,"889,58016053107 ",.01)
 ;;58016053107
 ;;9002226.02101,"889,58016053107 ",.02)
 ;;58016053107
 ;;9002226.02101,"889,58016053108 ",.01)
 ;;58016053108
 ;;9002226.02101,"889,58016053108 ",.02)
 ;;58016053108
 ;;9002226.02101,"889,58016053109 ",.01)
 ;;58016053109
 ;;9002226.02101,"889,58016053109 ",.02)
 ;;58016053109
 ;;9002226.02101,"889,58016053110 ",.01)
 ;;58016053110
 ;;9002226.02101,"889,58016053110 ",.02)
 ;;58016053110
 ;;9002226.02101,"889,58016053112 ",.01)
 ;;58016053112
 ;;9002226.02101,"889,58016053112 ",.02)
 ;;58016053112
 ;;9002226.02101,"889,58016053114 ",.01)
 ;;58016053114
 ;;9002226.02101,"889,58016053114 ",.02)
 ;;58016053114
 ;;9002226.02101,"889,58016053115 ",.01)
 ;;58016053115
 ;;9002226.02101,"889,58016053115 ",.02)
 ;;58016053115
 ;;9002226.02101,"889,58016053116 ",.01)
 ;;58016053116
 ;;9002226.02101,"889,58016053116 ",.02)
 ;;58016053116
 ;;9002226.02101,"889,58016053118 ",.01)
 ;;58016053118
 ;;9002226.02101,"889,58016053118 ",.02)
 ;;58016053118
 ;;9002226.02101,"889,58016053120 ",.01)
 ;;58016053120
 ;;9002226.02101,"889,58016053120 ",.02)
 ;;58016053120
 ;;9002226.02101,"889,58016053121 ",.01)
 ;;58016053121
 ;;9002226.02101,"889,58016053121 ",.02)
 ;;58016053121
 ;;9002226.02101,"889,58016053124 ",.01)
 ;;58016053124
 ;;9002226.02101,"889,58016053124 ",.02)
 ;;58016053124
 ;;9002226.02101,"889,58016053125 ",.01)
 ;;58016053125
 ;;9002226.02101,"889,58016053125 ",.02)
 ;;58016053125
 ;;9002226.02101,"889,58016053126 ",.01)
 ;;58016053126
 ;;9002226.02101,"889,58016053126 ",.02)
 ;;58016053126
 ;;9002226.02101,"889,58016053127 ",.01)
 ;;58016053127
 ;;9002226.02101,"889,58016053127 ",.02)
 ;;58016053127
 ;;9002226.02101,"889,58016053128 ",.01)
 ;;58016053128
 ;;9002226.02101,"889,58016053128 ",.02)
 ;;58016053128
 ;;9002226.02101,"889,58016053130 ",.01)
 ;;58016053130
 ;;9002226.02101,"889,58016053130 ",.02)
 ;;58016053130
 ;;9002226.02101,"889,58016053132 ",.01)
 ;;58016053132
 ;;9002226.02101,"889,58016053132 ",.02)
 ;;58016053132
 ;;9002226.02101,"889,58016053135 ",.01)
 ;;58016053135
 ;;9002226.02101,"889,58016053135 ",.02)
 ;;58016053135
 ;;9002226.02101,"889,58016053136 ",.01)
 ;;58016053136
 ;;9002226.02101,"889,58016053136 ",.02)
 ;;58016053136
 ;;9002226.02101,"889,58016053140 ",.01)
 ;;58016053140
 ;;9002226.02101,"889,58016053140 ",.02)
 ;;58016053140
 ;;9002226.02101,"889,58016053142 ",.01)
 ;;58016053142
 ;;9002226.02101,"889,58016053142 ",.02)
 ;;58016053142
 ;;9002226.02101,"889,58016053144 ",.01)
 ;;58016053144
 ;;9002226.02101,"889,58016053144 ",.02)
 ;;58016053144
 ;;9002226.02101,"889,58016053145 ",.01)
 ;;58016053145
 ;;9002226.02101,"889,58016053145 ",.02)
 ;;58016053145
 ;;9002226.02101,"889,58016053148 ",.01)
 ;;58016053148
 ;;9002226.02101,"889,58016053148 ",.02)
 ;;58016053148
 ;;9002226.02101,"889,58016053150 ",.01)
 ;;58016053150
 ;;9002226.02101,"889,58016053150 ",.02)
 ;;58016053150
 ;;9002226.02101,"889,58016053156 ",.01)
 ;;58016053156
 ;;9002226.02101,"889,58016053156 ",.02)
 ;;58016053156
 ;;9002226.02101,"889,58016053160 ",.01)
 ;;58016053160
 ;;9002226.02101,"889,58016053160 ",.02)
 ;;58016053160
 ;;9002226.02101,"889,58016053167 ",.01)
 ;;58016053167
 ;;9002226.02101,"889,58016053167 ",.02)
 ;;58016053167
 ;;9002226.02101,"889,58016053169 ",.01)
 ;;58016053169
 ;;9002226.02101,"889,58016053169 ",.02)
 ;;58016053169
 ;;9002226.02101,"889,58016053170 ",.01)
 ;;58016053170
 ;;9002226.02101,"889,58016053170 ",.02)
 ;;58016053170
 ;;9002226.02101,"889,58016053171 ",.01)
 ;;58016053171
 ;;9002226.02101,"889,58016053171 ",.02)
 ;;58016053171
 ;;9002226.02101,"889,58016053172 ",.01)
 ;;58016053172
 ;;9002226.02101,"889,58016053172 ",.02)
 ;;58016053172
 ;;9002226.02101,"889,58016053173 ",.01)
 ;;58016053173
 ;;9002226.02101,"889,58016053173 ",.02)
 ;;58016053173
 ;;9002226.02101,"889,58016053175 ",.01)
 ;;58016053175
 ;;9002226.02101,"889,58016053175 ",.02)
 ;;58016053175
 ;;9002226.02101,"889,58016053176 ",.01)
 ;;58016053176
 ;;9002226.02101,"889,58016053176 ",.02)
 ;;58016053176
 ;;9002226.02101,"889,58016053177 ",.01)
 ;;58016053177
 ;;9002226.02101,"889,58016053177 ",.02)
 ;;58016053177
 ;;9002226.02101,"889,58016053179 ",.01)
 ;;58016053179
 ;;9002226.02101,"889,58016053179 ",.02)
 ;;58016053179
