BGP06A8 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"52959-0021-15 ")
 ;;2725
 ;;21,"52959-0021-20 ")
 ;;2726
 ;;21,"52959-0021-21 ")
 ;;2727
 ;;21,"52959-0021-30 ")
 ;;2728
 ;;21,"52959-0022-30 ")
 ;;2729
 ;;21,"52959-0029-20 ")
 ;;2730
 ;;21,"52959-0029-24 ")
 ;;2731
 ;;21,"52959-0030-01 ")
 ;;2732
 ;;21,"52959-0030-20 ")
 ;;2733
 ;;21,"52959-0030-24 ")
 ;;2734
 ;;21,"52959-0030-28 ")
 ;;2735
 ;;21,"52959-0030-30 ")
 ;;2736
 ;;21,"52959-0030-40 ")
 ;;2737
 ;;21,"52959-0030-56 ")
 ;;2738
 ;;21,"52959-0031-04 ")
 ;;2739
 ;;21,"52959-0031-08 ")
 ;;2740
 ;;21,"52959-0031-10 ")
 ;;2741
 ;;21,"52959-0031-12 ")
 ;;2742
 ;;21,"52959-0031-14 ")
 ;;2743
 ;;21,"52959-0031-15 ")
 ;;2744
 ;;21,"52959-0031-20 ")
 ;;2745
 ;;21,"52959-0031-21 ")
 ;;2746
 ;;21,"52959-0031-24 ")
 ;;2747
 ;;21,"52959-0031-28 ")
 ;;2748
 ;;21,"52959-0031-30 ")
 ;;2749
 ;;21,"52959-0031-40 ")
 ;;2750
 ;;21,"52959-0031-60 ")
 ;;2751
 ;;21,"52959-0032-14 ")
 ;;2752
 ;;21,"52959-0032-20 ")
 ;;2753
 ;;21,"52959-0032-28 ")
 ;;2754
 ;;21,"52959-0032-40 ")
 ;;2755
 ;;21,"52959-0032-42 ")
 ;;2756
 ;;21,"52959-0036-06 ")
 ;;2757
 ;;21,"52959-0036-10 ")
 ;;2758
 ;;21,"52959-0036-14 ")
 ;;2759
 ;;21,"52959-0036-15 ")
 ;;2760
 ;;21,"52959-0036-20 ")
 ;;2761
 ;;21,"52959-0036-28 ")
 ;;2762
 ;;21,"52959-0036-30 ")
 ;;2763
 ;;21,"52959-0037-14 ")
 ;;2764
 ;;21,"52959-0037-20 ")
 ;;2765
 ;;21,"52959-0046-10 ")
 ;;2766
 ;;21,"52959-0046-14 ")
 ;;2767
 ;;21,"52959-0046-20 ")
 ;;2768
 ;;21,"52959-0048-20 ")
 ;;2769
 ;;21,"52959-0048-28 ")
 ;;2770
 ;;21,"52959-0048-30 ")
 ;;2771
 ;;21,"52959-0048-40 ")
 ;;2772
 ;;21,"52959-0048-41 ")
 ;;2773
 ;;21,"52959-0049-20 ")
 ;;2774
 ;;21,"52959-0049-28 ")
 ;;2775
 ;;21,"52959-0049-30 ")
 ;;2776
 ;;21,"52959-0049-40 ")
 ;;2777
 ;;21,"52959-0055-00 ")
 ;;2778
 ;;21,"52959-0055-06 ")
 ;;2779
 ;;21,"52959-0055-10 ")
 ;;2780
 ;;21,"52959-0055-14 ")
 ;;2781
 ;;21,"52959-0055-15 ")
 ;;2782
 ;;21,"52959-0055-20 ")
 ;;2783
 ;;21,"52959-0055-28 ")
 ;;2784
 ;;21,"52959-0055-30 ")
 ;;2785
 ;;21,"52959-0056-10 ")
 ;;2786
 ;;21,"52959-0056-14 ")
 ;;2787
 ;;21,"52959-0056-20 ")
 ;;2788
 ;;21,"52959-0057-28 ")
 ;;2789
 ;;21,"52959-0057-40 ")
 ;;2790
 ;;21,"52959-0058-15 ")
 ;;2791
 ;;21,"52959-0058-20 ")
 ;;2792
 ;;21,"52959-0058-21 ")
 ;;2793
 ;;21,"52959-0058-30 ")
 ;;2794
 ;;21,"52959-0058-40 ")
 ;;2795
 ;;21,"52959-0060-20 ")
 ;;2796
 ;;21,"52959-0060-28 ")
 ;;2797
 ;;21,"52959-0060-30 ")
 ;;2798
 ;;21,"52959-0060-40 ")
 ;;2799
 ;;21,"52959-0060-56 ")
 ;;2800
 ;;21,"52959-0061-15 ")
 ;;2801
 ;;21,"52959-0061-18 ")
 ;;2802
 ;;21,"52959-0061-20 ")
 ;;2803
 ;;21,"52959-0061-21 ")
 ;;2804
 ;;21,"52959-0061-24 ")
 ;;2805
 ;;21,"52959-0061-28 ")
 ;;2806
 ;;21,"52959-0061-30 ")
 ;;2807
 ;;21,"52959-0061-40 ")
 ;;2808
 ;;21,"52959-0061-42 ")
 ;;2809
 ;;21,"52959-0062-20 ")
 ;;2810
 ;;21,"52959-0062-28 ")
 ;;2811
 ;;21,"52959-0062-30 ")
 ;;2812
 ;;21,"52959-0062-40 ")
 ;;2813
 ;;21,"52959-0062-56 ")
 ;;2814
 ;;21,"52959-0063-21 ")
 ;;2815
 ;;21,"52959-0063-28 ")
 ;;2816
 ;;21,"52959-0063-30 ")
 ;;2817
 ;;21,"52959-0063-40 ")
 ;;2818
 ;;21,"52959-0064-20 ")
 ;;2819
 ;;21,"52959-0064-28 ")
 ;;2820
 ;;21,"52959-0064-40 ")
 ;;2821
 ;;21,"52959-0086-20 ")
 ;;2822
 ;;21,"52959-0087-20 ")
 ;;2823
 ;;21,"52959-0087-40 ")
 ;;2824
 ;;21,"52959-0130-03 ")
 ;;2825
 ;;21,"52959-0144-06 ")
 ;;2826
 ;;21,"52959-0144-10 ")
 ;;2827
 ;;21,"52959-0144-14 ")
 ;;2828
 ;;21,"52959-0144-20 ")
 ;;2829
 ;;21,"52959-0144-21 ")
 ;;2830
 ;;21,"52959-0144-28 ")
 ;;2831
 ;;21,"52959-0144-30 ")
 ;;2832
 ;;21,"52959-0164-03 ")
 ;;2833
 ;;21,"52959-0164-06 ")
 ;;2834
 ;;21,"52959-0171-06 ")
 ;;2835
 ;;21,"52959-0171-10 ")
 ;;2836
 ;;21,"52959-0171-14 ")
 ;;2837
 ;;21,"52959-0171-20 ")
 ;;2838
 ;;21,"52959-0181-01 ")
 ;;2839
 ;;21,"52959-0200-01 ")
 ;;2840
 ;;21,"52959-0200-02 ")
 ;;2841
 ;;21,"52959-0204-05 ")
 ;;2842
 ;;21,"52959-0204-07 ")
 ;;2843
 ;;21,"52959-0204-10 ")
 ;;2844
 ;;21,"52959-0213-20 ")
 ;;2845
 ;;21,"52959-0213-24 ")
 ;;2846
 ;;21,"52959-0213-28 ")
 ;;2847
 ;;21,"52959-0213-30 ")
 ;;2848
 ;;21,"52959-0213-40 ")
 ;;2849
 ;;21,"52959-0216-10 ")
 ;;2850
 ;;21,"52959-0216-14 ")
 ;;2851
 ;;21,"52959-0216-20 ")
 ;;2852
 ;;21,"52959-0240-10 ")
 ;;2853
 ;;21,"52959-0242-03 ")
 ;;2854
 ;;21,"52959-0246-19 ")
 ;;2855
 ;;21,"52959-0246-21 ")
 ;;2856
 ;;21,"52959-0246-30 ")
 ;;2857
 ;;21,"52959-0277-02 ")
 ;;2858
 ;;21,"52959-0283-00 ")
 ;;2859
 ;;21,"52959-0283-12 ")
 ;;2860
 ;;21,"52959-0283-20 ")
 ;;2861
 ;;21,"52959-0283-28 ")
 ;;2862
 ;;21,"52959-0283-40 ")
 ;;2863
 ;;21,"52959-0294-03 ")
 ;;2864
 ;;21,"52959-0303-00 ")
 ;;2865
 ;;21,"52959-0303-03 ")
 ;;2866
 ;;21,"52959-0304-01 ")
 ;;2867
 ;;21,"52959-0304-02 ")
 ;;2868
 ;;21,"52959-0305-00 ")
 ;;2869
 ;;21,"52959-0305-01 ")
 ;;2870
 ;;21,"52959-0308-20 ")
 ;;2871
 ;;21,"52959-0308-40 ")
 ;;2872
 ;;21,"52959-0310-01 ")
 ;;2873
 ;;21,"52959-0310-02 ")
 ;;2874
 ;;21,"52959-0313-15 ")
 ;;2875
 ;;21,"52959-0333-20 ")
 ;;2876
 ;;21,"52959-0333-24 ")
 ;;2877
 ;;21,"52959-0333-28 ")
 ;;2878
 ;;21,"52959-0333-30 ")
 ;;2879
 ;;21,"52959-0333-40 ")
 ;;2880
 ;;21,"52959-0336-14 ")
 ;;2881
 ;;21,"52959-0336-20 ")
 ;;2882
 ;;21,"52959-0336-28 ")
 ;;2883
 ;;21,"52959-0336-30 ")
 ;;2884
 ;;21,"52959-0336-40 ")
 ;;2885
 ;;21,"52959-0336-56 ")
 ;;2886
 ;;21,"52959-0336-90 ")
 ;;2887
 ;;21,"52959-0341-40 ")
 ;;2888
 ;;21,"52959-0341-60 ")
 ;;2889
 ;;21,"52959-0343-09 ")
 ;;2890
 ;;21,"52959-0343-15 ")
 ;;2891
 ;;21,"52959-0343-21 ")
 ;;2892
 ;;21,"52959-0343-30 ")
 ;;2893
 ;;21,"52959-0349-20 ")
 ;;2894
 ;;21,"52959-0367-00 ")
 ;;2895
 ;;21,"52959-0367-14 ")
 ;;2896
 ;;21,"52959-0367-15 ")
 ;;2897
 ;;21,"52959-0367-20 ")
 ;;2898
 ;;21,"52959-0367-21 ")
 ;;2899
 ;;21,"52959-0367-30 ")
 ;;2900
 ;;21,"52959-0367-40 ")
 ;;2901
 ;;21,"52959-0368-10 ")
 ;;2902
 ;;21,"52959-0368-14 ")
 ;;2903
 ;;21,"52959-0368-20 ")
 ;;2904
 ;;21,"52959-0368-30 ")
 ;;2905
 ;;21,"52959-0389-20 ")
 ;;2906
 ;;21,"52959-0389-28 ")
 ;;2907
 ;;21,"52959-0389-30 ")
 ;;2908
 ;;21,"52959-0389-40 ")
 ;;2909
 ;;21,"52959-0427-28 ")
 ;;2910
 ;;21,"52959-0427-40 ")
 ;;2911
 ;;21,"52959-0428-10 ")
 ;;2912
 ;;21,"52959-0428-14 ")
 ;;2913
 ;;21,"52959-0428-16 ")
 ;;2914
 ;;21,"52959-0428-18 ")
 ;;2915
 ;;21,"52959-0428-20 ")
 ;;2916
 ;;21,"52959-0470-30 ")
 ;;2917
 ;;21,"52959-0474-14 ")
 ;;2918
 ;;21,"52959-0474-20 ")
 ;;2919
 ;;21,"52959-0478-10 ")
 ;;2920
 ;;21,"52959-0478-14 ")
 ;;2921
 ;;21,"52959-0478-15 ")
 ;;2922
 ;;21,"52959-0478-20 ")
 ;;2923
 ;;21,"52959-0492-01 ")
 ;;2924
 ;;21,"52959-0492-06 ")
 ;;2925
 ;;21,"52959-0492-07 ")
 ;;2926
 ;;21,"52959-0492-10 ")
 ;;2927
 ;;21,"52959-0492-12 ")
 ;;2928
 ;;21,"52959-0492-14 ")
 ;;2929
 ;;21,"52959-0492-30 ")
 ;;2930
 ;;21,"52959-0504-40 ")
 ;;2931
 ;;21,"52959-0505-06 ")
 ;;2932
 ;;21,"52959-0560-00 ")
 ;;2933
 ;;21,"52959-0613-02 ")
 ;;2934
 ;;21,"52959-0613-03 ")
 ;;2935
 ;;21,"52959-0614-01 ")
 ;;2936
 ;;21,"52959-0614-02 ")
 ;;2937
 ;;21,"52959-0614-03 ")
 ;;2938
 ;;21,"52959-0616-00 ")
 ;;2939
 ;;21,"52959-0616-01 ")
 ;;2940
 ;;21,"52959-0616-02 ")
 ;;2941
 ;;21,"52959-0620-01 ")
 ;;2942
 ;;21,"52959-0657-03 ")
 ;;2943
 ;;21,"52959-0657-06 ")
 ;;2944
 ;;21,"52959-0660-20 ")
 ;;2945
 ;;21,"52959-0664-05 ")
 ;;2946
 ;;21,"52959-0664-10 ")
 ;;2947
 ;;21,"52959-0690-07 ")
 ;;2948
 ;;21,"52959-0702-04 ")
 ;;2949
 ;;21,"52959-0702-09 ")
 ;;2950
 ;;21,"52959-0702-12 ")
 ;;2951
 ;;21,"52959-0702-14 ")
 ;;2952
 ;;21,"52959-0702-15 ")
 ;;2953
 ;;21,"52959-0702-20 ")
 ;;2954
 ;;21,"52959-0702-21 ")
 ;;2955
 ;;21,"52959-0702-30 ")
 ;;2956
 ;;21,"52959-0702-40 ")
 ;;2957
 ;;21,"52959-0707-10 ")
 ;;2958
 ;;21,"52959-0707-14 ")
 ;;2959
 ;;21,"52959-0707-15 ")
 ;;2960
 ;;21,"52959-0707-20 ")
 ;;2961
 ;;21,"52959-0730-00 ")
 ;;2962
 ;;21,"52959-0730-06 ")
 ;;2963
 ;;21,"52959-0730-10 ")
 ;;2964
 ;;21,"52959-0730-14 ")
 ;;2965
 ;;21,"52959-0730-15 ")
 ;;2966
 ;;21,"52959-0730-20 ")
 ;;2967
 ;;21,"52959-0730-21 ")
 ;;2968
 ;;21,"52959-0730-28 ")
 ;;2969
 ;;21,"52959-0730-30 ")
 ;;2970
 ;;21,"52959-0734-20 ")
 ;;2971
 ;;21,"52959-0793-28 ")
 ;;2972
 ;;21,"52959-0796-10 ")
 ;;2973
 ;;21,"52959-0816-20 ")
 ;;2974
 ;;21,"52959-0816-28 ")
 ;;2975
 ;;21,"52959-0816-30 ")
 ;;2976
 ;;21,"52959-0838-06 ")
 ;;2977
 ;;21,"52959-1005-01 ")
 ;;2978
 ;;21,"52959-1005-02 ")
 ;;2979
 ;;21,"52959-1005-03 ")
 ;;2980
 ;;21,"52959-1006-01 ")
 ;;2981
 ;;21,"52959-1006-02 ")
 ;;2982
 ;;21,"52959-1006-03 ")
 ;;2983
 ;;21,"52959-1012-00 ")
 ;;2984
 ;;21,"52959-1012-01 ")
 ;;2985
 ;;21,"52959-1023-01 ")
 ;;2986
 ;;21,"52959-1023-03 ")
 ;;2987
 ;;21,"52959-1023-05 ")
 ;;2988
 ;;21,"52959-1023-07 ")
 ;;2989
 ;;21,"52959-1023-09 ")
 ;;2990
 ;;21,"52959-1029-00 ")
 ;;2991
 ;;21,"52959-1029-01 ")
 ;;2992
 ;;21,"52959-1172-01 ")
 ;;2993
 ;;21,"52959-1172-02 ")
 ;;2994
 ;;21,"52959-1399-03 ")
 ;;2995
 ;;21,"52959-1430-00 ")
 ;;2996
 ;;21,"52959-1431-00 ")
 ;;2997
 ;;21,"52959-1453-02 ")
 ;;2998
 ;;21,"52959-1463-03 ")
 ;;2999
 ;;21,"53489-0118-02 ")
 ;;3000
 ;;21,"53489-0118-05 ")
 ;;3001
 ;;21,"53489-0119-02 ")
 ;;3002
 ;;21,"53489-0119-05 ")
 ;;3003
 ;;21,"53489-0120-02 ")
 ;;3004
 ;;21,"53489-0120-05 ")
 ;;3005
 ;;21,"53489-0145-01 ")
 ;;3006
 ;;21,"53489-0145-05 ")
 ;;3007
 ;;21,"53489-0146-01 ")
 ;;3008
 ;;21,"53489-0146-05 ")
 ;;3009
 ;;21,"53489-0550-01 ")
 ;;3010
 ;;21,"53489-0550-05 ")
 ;;3011
 ;;21,"53489-0647-01 ")
 ;;3012
 ;;21,"53746-0272-10 ")
 ;;3013
 ;;21,"53978-1257-05 ")
 ;;3014
 ;;21,"53978-5002-05 ")
 ;;3015
 ;;21,"53978-5003-05 ")
 ;;3016
 ;;21,"53978-5020-06 ")
 ;;3017
 ;;21,"53978-5021-06 ")
 ;;3018
 ;;21,"53978-5029-06 ")
 ;;3019
 ;;21,"53978-5042-06 ")
 ;;3020
 ;;21,"53978-5048-06 ")
 ;;3021
 ;;21,"53978-5048-09 ")
 ;;3022
 ;;21,"53978-5055-06 ")
 ;;3023
 ;;21,"54569-0075-00 ")
 ;;3024
 ;;21,"54569-0075-01 ")
 ;;3025
 ;;21,"54569-0075-02 ")
 ;;3026
 ;;21,"54569-0075-03 ")
 ;;3027
 ;;21,"54569-0075-05 ")
 ;;3028
 ;;21,"54569-0075-07 ")
 ;;3029
 ;;21,"54569-0075-09 ")
 ;;3030
 ;;21,"54569-0093-00 ")
 ;;3031
 ;;21,"54569-0094-00 ")
 ;;3032
 ;;21,"54569-0103-00 ")
 ;;3033
 ;;21,"54569-0108-01 ")
 ;;3034
 ;;21,"54569-0108-02 ")
 ;;3035
 ;;21,"54569-0109-00 ")
 ;;3036
 ;;21,"54569-0110-02 ")
 ;;3037
 ;;21,"54569-0110-04 ")
 ;;3038
 ;;21,"54569-0117-00 ")
 ;;3039
 ;;21,"54569-0118-00 ")
 ;;3040
 ;;21,"54569-0118-01 ")
 ;;3041
 ;;21,"54569-0118-02 ")
 ;;3042
 ;;21,"54569-0118-03 ")
 ;;3043
 ;;21,"54569-0118-05 ")
 ;;3044
 ;;21,"54569-0118-06 ")
 ;;3045
 ;;21,"54569-0118-08 ")
 ;;3046
 ;;21,"54569-0118-09 ")
 ;;3047
 ;;21,"54569-0120-00 ")
 ;;3048
 ;;21,"54569-0121-00 ")
 ;;3049
 ;;21,"54569-0121-01 ")
 ;;3050
 ;;21,"54569-0121-03 ")
 ;;3051
 ;;21,"54569-0123-00 ")
 ;;3052
 ;;21,"54569-0123-02 ")
 ;;3053
 ;;21,"54569-0123-03 ")
 ;;3054
 ;;21,"54569-0123-05 ")
 ;;3055
 ;;21,"54569-0124-00 ")
 ;;3056
 ;;21,"54569-0124-01 ")
 ;;3057
 ;;21,"54569-0124-02 ")
 ;;3058
 ;;21,"54569-0124-03 ")
 ;;3059
 ;;21,"54569-0124-05 ")
 ;;3060
 ;;21,"54569-0124-06 ")
 ;;3061
 ;;21,"54569-0124-07 ")
 ;;3062
 ;;21,"54569-0124-08 ")
 ;;3063
 ;;21,"54569-0124-09 ")
 ;;3064
 ;;21,"54569-0125-00 ")
 ;;3065
 ;;21,"54569-0125-01 ")
 ;;3066
 ;;21,"54569-0125-02 ")
 ;;3067
 ;;21,"54569-0125-03 ")
 ;;3068
 ;;21,"54569-0125-04 ")
 ;;3069
 ;;21,"54569-0125-05 ")
 ;;3070
 ;;21,"54569-0125-06 ")
 ;;3071
 ;;21,"54569-0127-00 ")
 ;;3072
 ;;21,"54569-0127-02 ")
 ;;3073
 ;;21,"54569-0127-03 ")
 ;;3074
 ;;21,"54569-0127-05 ")
 ;;3075
 ;;21,"54569-0128-00 ")
 ;;3076
 ;;21,"54569-0129-02 ")
 ;;3077
 ;;21,"54569-0129-03 ")
 ;;3078
 ;;21,"54569-0129-09 ")
 ;;3079
 ;;21,"54569-0131-01 ")
 ;;3080
 ;;21,"54569-0131-02 ")
 ;;3081
 ;;21,"54569-0132-00 ")
 ;;3082
 ;;21,"54569-0134-00 ")
 ;;3083
 ;;21,"54569-0135-00 ")
 ;;3084
 ;;21,"54569-0136-01 ")
 ;;3085
 ;;21,"54569-0136-03 ")
 ;;3086
 ;;21,"54569-0137-00 ")
 ;;3087
 ;;21,"54569-0142-01 ")
 ;;3088
 ;;21,"54569-0147-01 ")
 ;;3089
 ;;21,"54569-0147-02 ")
 ;;3090
 ;;21,"54569-0147-04 ")
 ;;3091
 ;;21,"54569-0157-02 ")
 ;;3092
 ;;21,"54569-0179-00 ")
 ;;3093
 ;;21,"54569-0231-01 ")
 ;;3094
 ;;21,"54569-0231-02 ")
 ;;3095
 ;;21,"54569-0269-00 ")
 ;;3096
 ;;21,"54569-0298-00 ")
 ;;3097
 ;;21,"54569-0298-01 ")
 ;;3098
 ;;21,"54569-0304-02 ")
 ;;3099
 ;;21,"54569-0304-03 ")
 ;;3100
 ;;21,"54569-0304-04 ")
 ;;3101
 ;;21,"54569-0304-05 ")
 ;;3102
 ;;21,"54569-0304-06 ")
 ;;3103
 ;;21,"54569-0304-08 ")
 ;;3104
 ;;21,"54569-0305-00 ")
 ;;3105
 ;;21,"54569-0305-01 ")
 ;;3106
 ;;21,"54569-0305-02 ")
 ;;3107
 ;;21,"54569-0305-03 ")
 ;;3108
 ;;21,"54569-0305-05 ")
 ;;3109
 ;;21,"54569-0305-06 ")
 ;;3110
