BGP7IXSS ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 16, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"635,63874-0347-42 ",.02)
 ;;63874-0347-42
 ;;9002226.02101,"635,63874-0347-45 ",.01)
 ;;63874-0347-45
 ;;9002226.02101,"635,63874-0347-45 ",.02)
 ;;63874-0347-45
 ;;9002226.02101,"635,63874-0347-90 ",.01)
 ;;63874-0347-90
 ;;9002226.02101,"635,63874-0347-90 ",.02)
 ;;63874-0347-90
 ;;9002226.02101,"635,63874-0348-01 ",.01)
 ;;63874-0348-01
 ;;9002226.02101,"635,63874-0348-01 ",.02)
 ;;63874-0348-01
 ;;9002226.02101,"635,63874-0348-10 ",.01)
 ;;63874-0348-10
 ;;9002226.02101,"635,63874-0348-10 ",.02)
 ;;63874-0348-10
 ;;9002226.02101,"635,63874-0348-14 ",.01)
 ;;63874-0348-14
 ;;9002226.02101,"635,63874-0348-14 ",.02)
 ;;63874-0348-14
 ;;9002226.02101,"635,63874-0348-20 ",.01)
 ;;63874-0348-20
 ;;9002226.02101,"635,63874-0348-20 ",.02)
 ;;63874-0348-20
 ;;9002226.02101,"635,63874-0348-30 ",.01)
 ;;63874-0348-30
 ;;9002226.02101,"635,63874-0348-30 ",.02)
 ;;63874-0348-30
 ;;9002226.02101,"635,63874-0348-60 ",.01)
 ;;63874-0348-60
 ;;9002226.02101,"635,63874-0348-60 ",.02)
 ;;63874-0348-60
 ;;9002226.02101,"635,63874-0348-90 ",.01)
 ;;63874-0348-90
 ;;9002226.02101,"635,63874-0348-90 ",.02)
 ;;63874-0348-90
 ;;9002226.02101,"635,63874-0349-01 ",.01)
 ;;63874-0349-01
 ;;9002226.02101,"635,63874-0349-01 ",.02)
 ;;63874-0349-01
 ;;9002226.02101,"635,63874-0349-10 ",.01)
 ;;63874-0349-10
 ;;9002226.02101,"635,63874-0349-10 ",.02)
 ;;63874-0349-10
 ;;9002226.02101,"635,63874-0349-30 ",.01)
 ;;63874-0349-30
 ;;9002226.02101,"635,63874-0349-30 ",.02)
 ;;63874-0349-30
 ;;9002226.02101,"635,63874-0379-10 ",.01)
 ;;63874-0379-10
 ;;9002226.02101,"635,63874-0379-10 ",.02)
 ;;63874-0379-10
 ;;9002226.02101,"635,63874-0379-30 ",.01)
 ;;63874-0379-30
 ;;9002226.02101,"635,63874-0379-30 ",.02)
 ;;63874-0379-30
 ;;9002226.02101,"635,63874-0423-01 ",.01)
 ;;63874-0423-01
 ;;9002226.02101,"635,63874-0423-01 ",.02)
 ;;63874-0423-01
 ;;9002226.02101,"635,63874-0423-07 ",.01)
 ;;63874-0423-07
 ;;9002226.02101,"635,63874-0423-07 ",.02)
 ;;63874-0423-07
 ;;9002226.02101,"635,63874-0423-10 ",.01)
 ;;63874-0423-10
 ;;9002226.02101,"635,63874-0423-10 ",.02)
 ;;63874-0423-10
 ;;9002226.02101,"635,63874-0423-14 ",.01)
 ;;63874-0423-14
 ;;9002226.02101,"635,63874-0423-14 ",.02)
 ;;63874-0423-14
 ;;9002226.02101,"635,63874-0423-20 ",.01)
 ;;63874-0423-20
 ;;9002226.02101,"635,63874-0423-20 ",.02)
 ;;63874-0423-20
 ;;9002226.02101,"635,63874-0423-30 ",.01)
 ;;63874-0423-30
 ;;9002226.02101,"635,63874-0423-30 ",.02)
 ;;63874-0423-30
 ;;9002226.02101,"635,63874-0423-60 ",.01)
 ;;63874-0423-60
 ;;9002226.02101,"635,63874-0423-60 ",.02)
 ;;63874-0423-60
 ;;9002226.02101,"635,63874-0514-01 ",.01)
 ;;63874-0514-01
 ;;9002226.02101,"635,63874-0514-01 ",.02)
 ;;63874-0514-01
 ;;9002226.02101,"635,63874-0514-10 ",.01)
 ;;63874-0514-10
 ;;9002226.02101,"635,63874-0514-10 ",.02)
 ;;63874-0514-10
 ;;9002226.02101,"635,63874-0514-14 ",.01)
 ;;63874-0514-14
 ;;9002226.02101,"635,63874-0514-14 ",.02)
 ;;63874-0514-14
 ;;9002226.02101,"635,63874-0514-15 ",.01)
 ;;63874-0514-15
 ;;9002226.02101,"635,63874-0514-15 ",.02)
 ;;63874-0514-15
 ;;9002226.02101,"635,63874-0514-16 ",.01)
 ;;63874-0514-16
 ;;9002226.02101,"635,63874-0514-16 ",.02)
 ;;63874-0514-16
 ;;9002226.02101,"635,63874-0514-20 ",.01)
 ;;63874-0514-20
 ;;9002226.02101,"635,63874-0514-20 ",.02)
 ;;63874-0514-20
 ;;9002226.02101,"635,63874-0514-28 ",.01)
 ;;63874-0514-28
 ;;9002226.02101,"635,63874-0514-28 ",.02)
 ;;63874-0514-28
 ;;9002226.02101,"635,63874-0514-30 ",.01)
 ;;63874-0514-30
 ;;9002226.02101,"635,63874-0514-30 ",.02)
 ;;63874-0514-30
 ;;9002226.02101,"635,63874-0514-60 ",.01)
 ;;63874-0514-60
 ;;9002226.02101,"635,63874-0514-60 ",.02)
 ;;63874-0514-60
 ;;9002226.02101,"635,63874-0514-90 ",.01)
 ;;63874-0514-90
 ;;9002226.02101,"635,63874-0514-90 ",.02)
 ;;63874-0514-90
 ;;9002226.02101,"635,63874-0522-01 ",.01)
 ;;63874-0522-01
 ;;9002226.02101,"635,63874-0522-01 ",.02)
 ;;63874-0522-01
 ;;9002226.02101,"635,63874-0522-08 ",.01)
 ;;63874-0522-08
 ;;9002226.02101,"635,63874-0522-08 ",.02)
 ;;63874-0522-08
 ;;9002226.02101,"635,63874-0522-10 ",.01)
 ;;63874-0522-10
 ;;9002226.02101,"635,63874-0522-10 ",.02)
 ;;63874-0522-10
 ;;9002226.02101,"635,63874-0522-14 ",.01)
 ;;63874-0522-14
 ;;9002226.02101,"635,63874-0522-14 ",.02)
 ;;63874-0522-14
 ;;9002226.02101,"635,63874-0522-15 ",.01)
 ;;63874-0522-15
 ;;9002226.02101,"635,63874-0522-15 ",.02)
 ;;63874-0522-15
 ;;9002226.02101,"635,63874-0522-20 ",.01)
 ;;63874-0522-20
 ;;9002226.02101,"635,63874-0522-20 ",.02)
 ;;63874-0522-20
 ;;9002226.02101,"635,63874-0522-21 ",.01)
 ;;63874-0522-21
 ;;9002226.02101,"635,63874-0522-21 ",.02)
 ;;63874-0522-21
 ;;9002226.02101,"635,63874-0522-28 ",.01)
 ;;63874-0522-28
 ;;9002226.02101,"635,63874-0522-28 ",.02)
 ;;63874-0522-28
 ;;9002226.02101,"635,63874-0522-30 ",.01)
 ;;63874-0522-30
 ;;9002226.02101,"635,63874-0522-30 ",.02)
 ;;63874-0522-30
 ;;9002226.02101,"635,63874-0522-60 ",.01)
 ;;63874-0522-60
 ;;9002226.02101,"635,63874-0522-60 ",.02)
 ;;63874-0522-60
 ;;9002226.02101,"635,63874-0522-90 ",.01)
 ;;63874-0522-90
 ;;9002226.02101,"635,63874-0522-90 ",.02)
 ;;63874-0522-90
 ;;9002226.02101,"635,63874-0558-01 ",.01)
 ;;63874-0558-01
 ;;9002226.02101,"635,63874-0558-01 ",.02)
 ;;63874-0558-01
 ;;9002226.02101,"635,63874-0558-10 ",.01)
 ;;63874-0558-10
 ;;9002226.02101,"635,63874-0558-10 ",.02)
 ;;63874-0558-10
 ;;9002226.02101,"635,63874-0558-14 ",.01)
 ;;63874-0558-14
 ;;9002226.02101,"635,63874-0558-14 ",.02)
 ;;63874-0558-14
 ;;9002226.02101,"635,63874-0558-16 ",.01)
 ;;63874-0558-16
 ;;9002226.02101,"635,63874-0558-16 ",.02)
 ;;63874-0558-16
 ;;9002226.02101,"635,63874-0558-28 ",.01)
 ;;63874-0558-28
 ;;9002226.02101,"635,63874-0558-28 ",.02)
 ;;63874-0558-28
 ;;9002226.02101,"635,63874-0558-30 ",.01)
 ;;63874-0558-30
 ;;9002226.02101,"635,63874-0558-30 ",.02)
 ;;63874-0558-30
 ;;9002226.02101,"635,63874-0558-60 ",.01)
 ;;63874-0558-60
 ;;9002226.02101,"635,63874-0558-60 ",.02)
 ;;63874-0558-60
 ;;9002226.02101,"635,63874-0581-10 ",.01)
 ;;63874-0581-10
 ;;9002226.02101,"635,63874-0581-10 ",.02)
 ;;63874-0581-10
 ;;9002226.02101,"635,63874-0581-30 ",.01)
 ;;63874-0581-30
 ;;9002226.02101,"635,63874-0581-30 ",.02)
 ;;63874-0581-30
 ;;9002226.02101,"635,63874-0581-90 ",.01)
 ;;63874-0581-90
 ;;9002226.02101,"635,63874-0581-90 ",.02)
 ;;63874-0581-90
 ;;9002226.02101,"635,63874-0655-01 ",.01)
 ;;63874-0655-01
 ;;9002226.02101,"635,63874-0655-01 ",.02)
 ;;63874-0655-01
 ;;9002226.02101,"635,63874-0655-10 ",.01)
 ;;63874-0655-10
 ;;9002226.02101,"635,63874-0655-10 ",.02)
 ;;63874-0655-10
 ;;9002226.02101,"635,63874-0655-14 ",.01)
 ;;63874-0655-14
 ;;9002226.02101,"635,63874-0655-14 ",.02)
 ;;63874-0655-14
 ;;9002226.02101,"635,63874-0655-20 ",.01)
 ;;63874-0655-20
 ;;9002226.02101,"635,63874-0655-20 ",.02)
 ;;63874-0655-20
 ;;9002226.02101,"635,63874-0655-30 ",.01)
 ;;63874-0655-30
 ;;9002226.02101,"635,63874-0655-30 ",.02)
 ;;63874-0655-30
 ;;9002226.02101,"635,63874-0655-60 ",.01)
 ;;63874-0655-60
 ;;9002226.02101,"635,63874-0655-60 ",.02)
 ;;63874-0655-60
 ;;9002226.02101,"635,63874-0987-01 ",.01)
 ;;63874-0987-01
 ;;9002226.02101,"635,63874-0987-01 ",.02)
 ;;63874-0987-01
 ;;9002226.02101,"635,63874-0987-10 ",.01)
 ;;63874-0987-10
 ;;9002226.02101,"635,63874-0987-10 ",.02)
 ;;63874-0987-10
 ;;9002226.02101,"635,63874-0987-14 ",.01)
 ;;63874-0987-14
 ;;9002226.02101,"635,63874-0987-14 ",.02)
 ;;63874-0987-14
 ;;9002226.02101,"635,63874-0987-20 ",.01)
 ;;63874-0987-20
 ;;9002226.02101,"635,63874-0987-20 ",.02)
 ;;63874-0987-20
 ;;9002226.02101,"635,63874-0987-30 ",.01)
 ;;63874-0987-30
 ;;9002226.02101,"635,63874-0987-30 ",.02)
 ;;63874-0987-30
 ;;9002226.02101,"635,63874-0987-60 ",.01)
 ;;63874-0987-60
 ;;9002226.02101,"635,63874-0987-60 ",.02)
 ;;63874-0987-60
 ;;9002226.02101,"635,64455-0140-10 ",.01)
 ;;64455-0140-10
 ;;9002226.02101,"635,64455-0140-10 ",.02)
 ;;64455-0140-10
 ;;9002226.02101,"635,64455-0140-90 ",.01)
 ;;64455-0140-90
 ;;9002226.02101,"635,64455-0140-90 ",.02)
 ;;64455-0140-90
 ;;9002226.02101,"635,64455-0141-10 ",.01)
 ;;64455-0141-10
 ;;9002226.02101,"635,64455-0141-10 ",.02)
 ;;64455-0141-10
 ;;9002226.02101,"635,64455-0141-90 ",.01)
 ;;64455-0141-90
 ;;9002226.02101,"635,64455-0141-90 ",.02)
 ;;64455-0141-90
 ;;9002226.02101,"635,64455-0142-10 ",.01)
 ;;64455-0142-10
 ;;9002226.02101,"635,64455-0142-10 ",.02)
 ;;64455-0142-10
 ;;9002226.02101,"635,64455-0142-90 ",.01)
 ;;64455-0142-90
 ;;9002226.02101,"635,64455-0142-90 ",.02)
 ;;64455-0142-90
 ;;9002226.02101,"635,64455-0143-10 ",.01)
 ;;64455-0143-10
 ;;9002226.02101,"635,64455-0143-10 ",.02)
 ;;64455-0143-10
 ;;9002226.02101,"635,64455-0143-90 ",.01)
 ;;64455-0143-90
 ;;9002226.02101,"635,64455-0143-90 ",.02)
 ;;64455-0143-90
 ;;9002226.02101,"635,64455-0145-01 ",.01)
 ;;64455-0145-01
 ;;9002226.02101,"635,64455-0145-01 ",.02)
 ;;64455-0145-01
 ;;9002226.02101,"635,64455-0146-01 ",.01)
 ;;64455-0146-01
 ;;9002226.02101,"635,64455-0146-01 ",.02)
 ;;64455-0146-01
 ;;9002226.02101,"635,64679-0902-01 ",.01)
 ;;64679-0902-01
 ;;9002226.02101,"635,64679-0902-01 ",.02)
 ;;64679-0902-01
 ;;9002226.02101,"635,64679-0902-02 ",.01)
 ;;64679-0902-02
 ;;9002226.02101,"635,64679-0902-02 ",.02)
 ;;64679-0902-02
 ;;9002226.02101,"635,64679-0903-01 ",.01)
 ;;64679-0903-01
 ;;9002226.02101,"635,64679-0903-01 ",.02)
 ;;64679-0903-01
 ;;9002226.02101,"635,64679-0903-02 ",.01)
 ;;64679-0903-02
 ;;9002226.02101,"635,64679-0903-02 ",.02)
 ;;64679-0903-02
 ;;9002226.02101,"635,64679-0904-01 ",.01)
 ;;64679-0904-01
 ;;9002226.02101,"635,64679-0904-01 ",.02)
 ;;64679-0904-01
 ;;9002226.02101,"635,64679-0904-02 ",.01)
 ;;64679-0904-02
 ;;9002226.02101,"635,64679-0904-02 ",.02)
 ;;64679-0904-02
 ;;9002226.02101,"635,64679-0905-01 ",.01)
 ;;64679-0905-01
 ;;9002226.02101,"635,64679-0905-01 ",.02)
 ;;64679-0905-01
 ;;9002226.02101,"635,64679-0923-02 ",.01)
 ;;64679-0923-02
 ;;9002226.02101,"635,64679-0923-02 ",.02)
 ;;64679-0923-02
 ;;9002226.02101,"635,64679-0923-03 ",.01)
 ;;64679-0923-03
 ;;9002226.02101,"635,64679-0923-03 ",.02)
 ;;64679-0923-03
 ;;9002226.02101,"635,64679-0924-02 ",.01)
 ;;64679-0924-02
 ;;9002226.02101,"635,64679-0924-02 ",.02)
 ;;64679-0924-02
 ;;9002226.02101,"635,64679-0924-03 ",.01)
 ;;64679-0924-03
 ;;9002226.02101,"635,64679-0924-03 ",.02)
 ;;64679-0924-03
 ;;9002226.02101,"635,64679-0925-01 ",.01)
 ;;64679-0925-01
 ;;9002226.02101,"635,64679-0925-01 ",.02)
 ;;64679-0925-01
 ;;9002226.02101,"635,64679-0925-02 ",.01)
 ;;64679-0925-02
 ;;9002226.02101,"635,64679-0925-02 ",.02)
 ;;64679-0925-02
 ;;9002226.02101,"635,64679-0925-03 ",.01)
 ;;64679-0925-03
 ;;9002226.02101,"635,64679-0925-03 ",.02)
 ;;64679-0925-03
 ;;9002226.02101,"635,64679-0926-02 ",.01)
 ;;64679-0926-02
 ;;9002226.02101,"635,64679-0926-02 ",.02)
 ;;64679-0926-02
 ;;9002226.02101,"635,64679-0926-03 ",.01)
 ;;64679-0926-03
 ;;9002226.02101,"635,64679-0926-03 ",.02)
 ;;64679-0926-03
 ;;9002226.02101,"635,66116-0237-30 ",.01)
 ;;66116-0237-30
 ;;9002226.02101,"635,66116-0237-30 ",.02)
 ;;66116-0237-30
 ;;9002226.02101,"635,66116-0279-30 ",.01)
 ;;66116-0279-30
 ;;9002226.02101,"635,66116-0279-30 ",.02)
 ;;66116-0279-30
 ;;9002226.02101,"635,66116-0435-30 ",.01)
 ;;66116-0435-30
 ;;9002226.02101,"635,66116-0435-30 ",.02)
 ;;66116-0435-30
 ;;9002226.02101,"635,66116-0436-30 ",.01)
 ;;66116-0436-30
 ;;9002226.02101,"635,66116-0436-30 ",.02)
 ;;66116-0436-30
 ;;9002226.02101,"635,66267-0253-30 ",.01)
 ;;66267-0253-30
 ;;9002226.02101,"635,66267-0253-30 ",.02)
 ;;66267-0253-30
 ;;9002226.02101,"635,66267-1009-00 ",.01)
 ;;66267-1009-00
 ;;9002226.02101,"635,66267-1009-00 ",.02)
 ;;66267-1009-00
 ;;9002226.02101,"635,68030-4420-01 ",.01)
 ;;68030-4420-01
 ;;9002226.02101,"635,68030-4420-01 ",.02)
 ;;68030-4420-01
 ;;9002226.02101,"635,68030-4421-01 ",.01)
 ;;68030-4421-01
 ;;9002226.02101,"635,68030-4421-01 ",.02)
 ;;68030-4421-01
 ;;9002226.02101,"635,68030-4423-01 ",.01)
 ;;68030-4423-01
 ;;9002226.02101,"635,68030-4423-01 ",.02)
 ;;68030-4423-01
 ;;9002226.02101,"635,68030-4424-01 ",.01)
 ;;68030-4424-01
 ;;9002226.02101,"635,68030-4424-01 ",.02)
 ;;68030-4424-01
 ;;9002226.02101,"635,68030-6700-02 ",.01)
 ;;68030-6700-02
 ;;9002226.02101,"635,68030-6700-02 ",.02)
 ;;68030-6700-02
 ;;9002226.02101,"635,68030-6701-02 ",.01)
 ;;68030-6701-02
 ;;9002226.02101,"635,68030-6701-02 ",.02)
 ;;68030-6701-02
 ;;9002226.02101,"635,68115-0059-00 ",.01)
 ;;68115-0059-00
 ;;9002226.02101,"635,68115-0059-00 ",.02)
 ;;68115-0059-00
 ;;9002226.02101,"635,68115-0059-30 ",.01)
 ;;68115-0059-30
 ;;9002226.02101,"635,68115-0059-30 ",.02)
 ;;68115-0059-30
 ;;9002226.02101,"635,68115-0059-60 ",.01)
 ;;68115-0059-60
 ;;9002226.02101,"635,68115-0059-60 ",.02)
 ;;68115-0059-60
 ;;9002226.02101,"635,68115-0059-90 ",.01)
 ;;68115-0059-90
 ;;9002226.02101,"635,68115-0059-90 ",.02)
 ;;68115-0059-90
 ;;9002226.02101,"635,68115-0060-30 ",.01)
 ;;68115-0060-30
 ;;9002226.02101,"635,68115-0060-30 ",.02)
 ;;68115-0060-30
 ;;9002226.02101,"635,68115-0060-60 ",.01)
 ;;68115-0060-60
 ;;9002226.02101,"635,68115-0060-60 ",.02)
 ;;68115-0060-60
 ;;9002226.02101,"635,68115-0127-15 ",.01)
 ;;68115-0127-15
 ;;9002226.02101,"635,68115-0127-15 ",.02)
 ;;68115-0127-15
 ;;9002226.02101,"635,68115-0127-30 ",.01)
 ;;68115-0127-30
 ;;9002226.02101,"635,68115-0127-30 ",.02)
 ;;68115-0127-30
 ;;9002226.02101,"635,68115-0127-60 ",.01)
 ;;68115-0127-60
