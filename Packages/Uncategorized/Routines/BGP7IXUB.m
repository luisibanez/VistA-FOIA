BGP7IXUB ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 16, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"637,00003-5183-11 ",.02)
 ;;00003-5183-11
 ;;9002226.02101,"637,00003-5184-11 ",.01)
 ;;00003-5184-11
 ;;9002226.02101,"637,00003-5184-11 ",.02)
 ;;00003-5184-11
 ;;9002226.02101,"637,00003-5194-10 ",.01)
 ;;00003-5194-10
 ;;9002226.02101,"637,00003-5194-10 ",.02)
 ;;00003-5194-10
 ;;9002226.02101,"637,00003-5194-33 ",.01)
 ;;00003-5194-33
 ;;9002226.02101,"637,00003-5194-33 ",.02)
 ;;00003-5194-33
 ;;9002226.02101,"637,00003-5195-10 ",.01)
 ;;00003-5195-10
 ;;9002226.02101,"637,00003-5195-10 ",.02)
 ;;00003-5195-10
 ;;9002226.02101,"637,00003-5195-33 ",.01)
 ;;00003-5195-33
 ;;9002226.02101,"637,00003-5195-33 ",.02)
 ;;00003-5195-33
 ;;9002226.02101,"637,00006-0543-28 ",.01)
 ;;00006-0543-28
 ;;9002226.02101,"637,00006-0543-28 ",.02)
 ;;00006-0543-28
 ;;9002226.02101,"637,00006-0543-31 ",.01)
 ;;00006-0543-31
 ;;9002226.02101,"637,00006-0543-31 ",.02)
 ;;00006-0543-31
 ;;9002226.02101,"637,00006-0543-54 ",.01)
 ;;00006-0543-54
 ;;9002226.02101,"637,00006-0543-54 ",.02)
 ;;00006-0543-54
 ;;9002226.02101,"637,00006-0543-61 ",.01)
 ;;00006-0543-61
 ;;9002226.02101,"637,00006-0543-61 ",.02)
 ;;00006-0543-61
 ;;9002226.02101,"637,00006-0543-82 ",.01)
 ;;00006-0543-82
 ;;9002226.02101,"637,00006-0543-82 ",.02)
 ;;00006-0543-82
 ;;9002226.02101,"637,00006-0726-28 ",.01)
 ;;00006-0726-28
 ;;9002226.02101,"637,00006-0726-28 ",.02)
 ;;00006-0726-28
 ;;9002226.02101,"637,00006-0726-31 ",.01)
 ;;00006-0726-31
 ;;9002226.02101,"637,00006-0726-31 ",.02)
 ;;00006-0726-31
 ;;9002226.02101,"637,00006-0726-54 ",.01)
 ;;00006-0726-54
 ;;9002226.02101,"637,00006-0726-54 ",.02)
 ;;00006-0726-54
 ;;9002226.02101,"637,00006-0726-61 ",.01)
 ;;00006-0726-61
 ;;9002226.02101,"637,00006-0726-61 ",.02)
 ;;00006-0726-61
 ;;9002226.02101,"637,00006-0726-82 ",.01)
 ;;00006-0726-82
 ;;9002226.02101,"637,00006-0726-82 ",.02)
 ;;00006-0726-82
 ;;9002226.02101,"637,00006-0730-61 ",.01)
 ;;00006-0730-61
 ;;9002226.02101,"637,00006-0730-61 ",.02)
 ;;00006-0730-61
 ;;9002226.02101,"637,00006-0731-28 ",.01)
 ;;00006-0731-28
 ;;9002226.02101,"637,00006-0731-28 ",.02)
 ;;00006-0731-28
 ;;9002226.02101,"637,00006-0731-61 ",.01)
 ;;00006-0731-61
 ;;9002226.02101,"637,00006-0731-61 ",.02)
 ;;00006-0731-61
 ;;9002226.02101,"637,00006-0731-82 ",.01)
 ;;00006-0731-82
 ;;9002226.02101,"637,00006-0731-82 ",.02)
 ;;00006-0731-82
 ;;9002226.02101,"637,00006-0731-87 ",.01)
 ;;00006-0731-87
 ;;9002226.02101,"637,00006-0731-87 ",.02)
 ;;00006-0731-87
 ;;9002226.02101,"637,00006-0731-94 ",.01)
 ;;00006-0731-94
 ;;9002226.02101,"637,00006-0731-94 ",.02)
 ;;00006-0731-94
 ;;9002226.02101,"637,00006-0732-61 ",.01)
 ;;00006-0732-61
 ;;9002226.02101,"637,00006-0732-61 ",.02)
 ;;00006-0732-61
 ;;9002226.02101,"637,00006-0732-82 ",.01)
 ;;00006-0732-82
 ;;9002226.02101,"637,00006-0732-82 ",.02)
 ;;00006-0732-82
 ;;9002226.02101,"637,00006-0732-87 ",.01)
 ;;00006-0732-87
 ;;9002226.02101,"637,00006-0732-87 ",.02)
 ;;00006-0732-87
 ;;9002226.02101,"637,00006-0732-94 ",.01)
 ;;00006-0732-94
 ;;9002226.02101,"637,00006-0732-94 ",.02)
 ;;00006-0732-94
 ;;9002226.02101,"637,00006-0735-28 ",.01)
 ;;00006-0735-28
 ;;9002226.02101,"637,00006-0735-28 ",.02)
 ;;00006-0735-28
 ;;9002226.02101,"637,00006-0735-31 ",.01)
 ;;00006-0735-31
 ;;9002226.02101,"637,00006-0735-31 ",.02)
 ;;00006-0735-31
 ;;9002226.02101,"637,00006-0735-54 ",.01)
 ;;00006-0735-54
 ;;9002226.02101,"637,00006-0735-54 ",.02)
 ;;00006-0735-54
 ;;9002226.02101,"637,00006-0735-61 ",.01)
 ;;00006-0735-61
 ;;9002226.02101,"637,00006-0735-61 ",.02)
 ;;00006-0735-61
 ;;9002226.02101,"637,00006-0735-82 ",.01)
 ;;00006-0735-82
 ;;9002226.02101,"637,00006-0735-82 ",.02)
 ;;00006-0735-82
 ;;9002226.02101,"637,00006-0735-87 ",.01)
 ;;00006-0735-87
 ;;9002226.02101,"637,00006-0735-87 ",.02)
 ;;00006-0735-87
 ;;9002226.02101,"637,00006-0740-28 ",.01)
 ;;00006-0740-28
 ;;9002226.02101,"637,00006-0740-28 ",.02)
 ;;00006-0740-28
 ;;9002226.02101,"637,00006-0740-31 ",.01)
 ;;00006-0740-31
 ;;9002226.02101,"637,00006-0740-31 ",.02)
 ;;00006-0740-31
 ;;9002226.02101,"637,00006-0740-54 ",.01)
 ;;00006-0740-54
 ;;9002226.02101,"637,00006-0740-54 ",.02)
 ;;00006-0740-54
 ;;9002226.02101,"637,00006-0740-61 ",.01)
 ;;00006-0740-61
 ;;9002226.02101,"637,00006-0740-61 ",.02)
 ;;00006-0740-61
 ;;9002226.02101,"637,00006-0740-82 ",.01)
 ;;00006-0740-82
 ;;9002226.02101,"637,00006-0740-82 ",.02)
 ;;00006-0740-82
 ;;9002226.02101,"637,00006-0740-87 ",.01)
 ;;00006-0740-87
 ;;9002226.02101,"637,00006-0740-87 ",.02)
 ;;00006-0740-87
 ;;9002226.02101,"637,00006-0749-28 ",.01)
 ;;00006-0749-28
 ;;9002226.02101,"637,00006-0749-28 ",.02)
 ;;00006-0749-28
 ;;9002226.02101,"637,00006-0749-31 ",.01)
 ;;00006-0749-31
 ;;9002226.02101,"637,00006-0749-31 ",.02)
 ;;00006-0749-31
 ;;9002226.02101,"637,00006-0749-54 ",.01)
 ;;00006-0749-54
 ;;9002226.02101,"637,00006-0749-54 ",.02)
 ;;00006-0749-54
 ;;9002226.02101,"637,00006-0749-61 ",.01)
 ;;00006-0749-61
 ;;9002226.02101,"637,00006-0749-61 ",.02)
 ;;00006-0749-61
 ;;9002226.02101,"637,00006-0749-82 ",.01)
 ;;00006-0749-82
 ;;9002226.02101,"637,00006-0749-82 ",.02)
 ;;00006-0749-82
 ;;9002226.02101,"637,00069-2150-30 ",.01)
 ;;00069-2150-30
 ;;9002226.02101,"637,00069-2150-30 ",.02)
 ;;00069-2150-30
 ;;9002226.02101,"637,00069-2160-30 ",.01)
 ;;00069-2160-30
 ;;9002226.02101,"637,00069-2160-30 ",.02)
 ;;00069-2160-30
 ;;9002226.02101,"637,00069-2170-30 ",.01)
 ;;00069-2170-30
 ;;9002226.02101,"637,00069-2170-30 ",.02)
 ;;00069-2170-30
 ;;9002226.02101,"637,00069-2180-30 ",.01)
 ;;00069-2180-30
 ;;9002226.02101,"637,00069-2180-30 ",.02)
 ;;00069-2180-30
 ;;9002226.02101,"637,00069-2190-30 ",.01)
 ;;00069-2190-30
 ;;9002226.02101,"637,00069-2190-30 ",.02)
 ;;00069-2190-30
 ;;9002226.02101,"637,00069-2250-30 ",.01)
 ;;00069-2250-30
 ;;9002226.02101,"637,00069-2250-30 ",.02)
 ;;00069-2250-30
 ;;9002226.02101,"637,00069-2260-30 ",.01)
 ;;00069-2260-30
 ;;9002226.02101,"637,00069-2260-30 ",.02)
 ;;00069-2260-30
 ;;9002226.02101,"637,00069-2270-30 ",.01)
 ;;00069-2270-30
 ;;9002226.02101,"637,00069-2270-30 ",.02)
 ;;00069-2270-30
 ;;9002226.02101,"637,00069-2960-30 ",.01)
 ;;00069-2960-30
 ;;9002226.02101,"637,00069-2960-30 ",.02)
 ;;00069-2960-30
 ;;9002226.02101,"637,00069-2970-30 ",.01)
 ;;00069-2970-30
 ;;9002226.02101,"637,00069-2970-30 ",.02)
 ;;00069-2970-30
 ;;9002226.02101,"637,00069-2980-30 ",.01)
 ;;00069-2980-30
 ;;9002226.02101,"637,00069-2980-30 ",.02)
 ;;00069-2980-30
 ;;9002226.02101,"637,00071-0155-23 ",.01)
 ;;00071-0155-23
 ;;9002226.02101,"637,00071-0155-23 ",.02)
 ;;00071-0155-23
 ;;9002226.02101,"637,00071-0155-34 ",.01)
 ;;00071-0155-34
 ;;9002226.02101,"637,00071-0155-34 ",.02)
 ;;00071-0155-34
 ;;9002226.02101,"637,00071-0155-40 ",.01)
 ;;00071-0155-40
 ;;9002226.02101,"637,00071-0155-40 ",.02)
 ;;00071-0155-40
 ;;9002226.02101,"637,00071-0156-23 ",.01)
 ;;00071-0156-23
 ;;9002226.02101,"637,00071-0156-23 ",.02)
 ;;00071-0156-23
 ;;9002226.02101,"637,00071-0156-40 ",.01)
 ;;00071-0156-40
 ;;9002226.02101,"637,00071-0156-40 ",.02)
 ;;00071-0156-40
 ;;9002226.02101,"637,00071-0156-94 ",.01)
 ;;00071-0156-94
 ;;9002226.02101,"637,00071-0156-94 ",.02)
 ;;00071-0156-94
 ;;9002226.02101,"637,00071-0157-23 ",.01)
 ;;00071-0157-23
 ;;9002226.02101,"637,00071-0157-23 ",.02)
 ;;00071-0157-23
 ;;9002226.02101,"637,00071-0157-73 ",.01)
 ;;00071-0157-73
 ;;9002226.02101,"637,00071-0157-73 ",.02)
 ;;00071-0157-73
 ;;9002226.02101,"637,00071-0158-23 ",.01)
 ;;00071-0158-23
 ;;9002226.02101,"637,00071-0158-23 ",.02)
 ;;00071-0158-23
 ;;9002226.02101,"637,00071-0158-73 ",.01)
 ;;00071-0158-73
 ;;9002226.02101,"637,00071-0158-73 ",.02)
 ;;00071-0158-73
 ;;9002226.02101,"637,00078-0176-05 ",.01)
 ;;00078-0176-05
 ;;9002226.02101,"637,00078-0176-05 ",.02)
 ;;00078-0176-05
 ;;9002226.02101,"637,00078-0176-15 ",.01)
 ;;00078-0176-15
 ;;9002226.02101,"637,00078-0176-15 ",.02)
 ;;00078-0176-15
 ;;9002226.02101,"637,00078-0234-05 ",.01)
 ;;00078-0234-05
 ;;9002226.02101,"637,00078-0234-05 ",.02)
 ;;00078-0234-05
 ;;9002226.02101,"637,00078-0234-15 ",.01)
 ;;00078-0234-15
 ;;9002226.02101,"637,00078-0234-15 ",.02)
 ;;00078-0234-15
 ;;9002226.02101,"637,00078-0354-05 ",.01)
 ;;00078-0354-05
 ;;9002226.02101,"637,00078-0354-05 ",.02)
 ;;00078-0354-05
 ;;9002226.02101,"637,00078-0354-15 ",.01)
 ;;00078-0354-15
 ;;9002226.02101,"637,00078-0354-15 ",.02)
 ;;00078-0354-15
 ;;9002226.02101,"637,00093-0576-06 ",.01)
 ;;00093-0576-06
 ;;9002226.02101,"637,00093-0576-06 ",.02)
 ;;00093-0576-06
 ;;9002226.02101,"637,00093-0576-10 ",.01)
 ;;00093-0576-10
 ;;9002226.02101,"637,00093-0576-10 ",.02)
 ;;00093-0576-10
 ;;9002226.02101,"637,00093-0926-06 ",.01)
 ;;00093-0926-06
 ;;9002226.02101,"637,00093-0926-06 ",.02)
 ;;00093-0926-06
 ;;9002226.02101,"637,00093-0926-10 ",.01)
 ;;00093-0926-10
 ;;9002226.02101,"637,00093-0926-10 ",.02)
 ;;00093-0926-10
 ;;9002226.02101,"637,00093-0928-06 ",.01)
 ;;00093-0928-06
 ;;9002226.02101,"637,00093-0928-06 ",.02)
 ;;00093-0928-06
 ;;9002226.02101,"637,00093-0928-10 ",.01)
 ;;00093-0928-10
 ;;9002226.02101,"637,00093-0928-10 ",.02)
 ;;00093-0928-10
 ;;9002226.02101,"637,00185-0070-01 ",.01)
 ;;00185-0070-01
 ;;9002226.02101,"637,00185-0070-01 ",.02)
 ;;00185-0070-01
 ;;9002226.02101,"637,00185-0070-10 ",.01)
 ;;00185-0070-10
 ;;9002226.02101,"637,00185-0070-10 ",.02)
 ;;00185-0070-10
 ;;9002226.02101,"637,00185-0070-60 ",.01)
 ;;00185-0070-60
 ;;9002226.02101,"637,00185-0070-60 ",.02)
 ;;00185-0070-60
 ;;9002226.02101,"637,00185-0072-01 ",.01)
 ;;00185-0072-01
 ;;9002226.02101,"637,00185-0072-01 ",.02)
 ;;00185-0072-01
 ;;9002226.02101,"637,00185-0072-10 ",.01)
 ;;00185-0072-10
 ;;9002226.02101,"637,00185-0072-10 ",.02)
 ;;00185-0072-10
 ;;9002226.02101,"637,00185-0072-60 ",.01)
 ;;00185-0072-60
 ;;9002226.02101,"637,00185-0072-60 ",.02)
 ;;00185-0072-60
 ;;9002226.02101,"637,00185-0074-01 ",.01)
 ;;00185-0074-01
 ;;9002226.02101,"637,00185-0074-01 ",.02)
 ;;00185-0074-01
 ;;9002226.02101,"637,00185-0074-10 ",.01)
 ;;00185-0074-10
 ;;9002226.02101,"637,00185-0074-10 ",.02)
 ;;00185-0074-10
 ;;9002226.02101,"637,00185-0074-60 ",.01)
 ;;00185-0074-60
 ;;9002226.02101,"637,00185-0074-60 ",.02)
 ;;00185-0074-60
 ;;9002226.02101,"637,00228-2633-06 ",.01)
 ;;00228-2633-06
 ;;9002226.02101,"637,00228-2633-06 ",.02)
 ;;00228-2633-06
 ;;9002226.02101,"637,00228-2633-50 ",.01)
 ;;00228-2633-50
 ;;9002226.02101,"637,00228-2633-50 ",.02)
 ;;00228-2633-50
 ;;9002226.02101,"637,00228-2634-06 ",.01)
 ;;00228-2634-06
 ;;9002226.02101,"637,00228-2634-06 ",.02)
 ;;00228-2634-06
 ;;9002226.02101,"637,00228-2634-50 ",.01)
 ;;00228-2634-50
 ;;9002226.02101,"637,00228-2634-50 ",.02)
 ;;00228-2634-50
 ;;9002226.02101,"637,00228-2635-06 ",.01)
 ;;00228-2635-06
 ;;9002226.02101,"637,00228-2635-06 ",.02)
 ;;00228-2635-06
 ;;9002226.02101,"637,00228-2635-50 ",.01)
 ;;00228-2635-50
 ;;9002226.02101,"637,00228-2635-50 ",.02)
 ;;00228-2635-50
 ;;9002226.02101,"637,00247-1139-30 ",.01)
 ;;00247-1139-30
 ;;9002226.02101,"637,00247-1139-30 ",.02)
 ;;00247-1139-30
 ;;9002226.02101,"637,00247-1139-60 ",.01)
 ;;00247-1139-60
 ;;9002226.02101,"637,00247-1139-60 ",.02)
 ;;00247-1139-60
 ;;9002226.02101,"637,00247-1140-30 ",.01)
 ;;00247-1140-30
 ;;9002226.02101,"637,00247-1140-30 ",.02)
 ;;00247-1140-30
 ;;9002226.02101,"637,00247-1152-30 ",.01)
 ;;00247-1152-30
 ;;9002226.02101,"637,00247-1152-30 ",.02)
 ;;00247-1152-30
 ;;9002226.02101,"637,00247-1152-60 ",.01)
 ;;00247-1152-60
 ;;9002226.02101,"637,00247-1152-60 ",.02)
 ;;00247-1152-60
 ;;9002226.02101,"637,00247-1153-30 ",.01)
 ;;00247-1153-30
 ;;9002226.02101,"637,00247-1153-30 ",.02)
 ;;00247-1153-30
 ;;9002226.02101,"637,00247-1153-60 ",.01)
 ;;00247-1153-60
 ;;9002226.02101,"637,00247-1153-60 ",.02)
 ;;00247-1153-60
 ;;9002226.02101,"637,00247-1276-30 ",.01)
 ;;00247-1276-30
 ;;9002226.02101,"637,00247-1276-30 ",.02)
 ;;00247-1276-30
 ;;9002226.02101,"637,00310-0751-39 ",.01)
 ;;00310-0751-39
 ;;9002226.02101,"637,00310-0751-39 ",.02)
 ;;00310-0751-39
 ;;9002226.02101,"637,00310-0751-90 ",.01)
 ;;00310-0751-90
 ;;9002226.02101,"637,00310-0751-90 ",.02)
 ;;00310-0751-90
 ;;9002226.02101,"637,00310-0752-39 ",.01)
 ;;00310-0752-39
 ;;9002226.02101,"637,00310-0752-39 ",.02)
 ;;00310-0752-39
 ;;9002226.02101,"637,00310-0752-90 ",.01)
 ;;00310-0752-90
 ;;9002226.02101,"637,00310-0752-90 ",.02)
 ;;00310-0752-90
 ;;9002226.02101,"637,00310-0754-30 ",.01)
 ;;00310-0754-30
 ;;9002226.02101,"637,00310-0754-30 ",.02)
 ;;00310-0754-30
 ;;9002226.02101,"637,00310-0755-90 ",.01)
 ;;00310-0755-90
 ;;9002226.02101,"637,00310-0755-90 ",.02)
 ;;00310-0755-90
 ;;9002226.02101,"637,00378-6510-91 ",.01)
 ;;00378-6510-91
 ;;9002226.02101,"637,00378-6510-91 ",.02)
 ;;00378-6510-91
 ;;9002226.02101,"637,00378-6520-05 ",.01)
 ;;00378-6520-05
 ;;9002226.02101,"637,00378-6520-05 ",.02)
 ;;00378-6520-05
 ;;9002226.02101,"637,00378-6520-91 ",.01)
 ;;00378-6520-91
 ;;9002226.02101,"637,00378-6520-91 ",.02)
 ;;00378-6520-91
 ;;9002226.02101,"637,00378-6540-05 ",.01)
 ;;00378-6540-05
 ;;9002226.02101,"637,00378-6540-05 ",.02)
 ;;00378-6540-05
 ;;9002226.02101,"637,00378-6540-91 ",.01)
 ;;00378-6540-91
 ;;9002226.02101,"637,00378-6540-91 ",.02)
 ;;00378-6540-91
 ;;9002226.02101,"637,00781-1210-10 ",.01)
 ;;00781-1210-10
 ;;9002226.02101,"637,00781-1210-10 ",.02)
 ;;00781-1210-10
 ;;9002226.02101,"637,00781-1210-60 ",.01)
 ;;00781-1210-60
