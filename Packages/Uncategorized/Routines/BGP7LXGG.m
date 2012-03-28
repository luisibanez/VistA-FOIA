BGP7LXGG ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON AUG 28, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"624,00378-4430-05 ",.02)
 ;;00378-4430-05
 ;;9002226.02101,"624,00402-0849-30 ",.01)
 ;;00402-0849-30
 ;;9002226.02101,"624,00402-0849-30 ",.02)
 ;;00402-0849-30
 ;;9002226.02101,"624,00403-0105-18 ",.01)
 ;;00403-0105-18
 ;;9002226.02101,"624,00403-0105-18 ",.02)
 ;;00403-0105-18
 ;;9002226.02101,"624,00403-0107-30 ",.01)
 ;;00403-0107-30
 ;;9002226.02101,"624,00403-0107-30 ",.02)
 ;;00403-0107-30
 ;;9002226.02101,"624,00403-0108-30 ",.01)
 ;;00403-0108-30
 ;;9002226.02101,"624,00403-0108-30 ",.02)
 ;;00403-0108-30
 ;;9002226.02101,"624,00403-0503-18 ",.01)
 ;;00403-0503-18
 ;;9002226.02101,"624,00403-0503-18 ",.02)
 ;;00403-0503-18
 ;;9002226.02101,"624,00405-0040-01 ",.01)
 ;;00405-0040-01
 ;;9002226.02101,"624,00405-0040-01 ",.02)
 ;;00405-0040-01
 ;;9002226.02101,"624,00405-0040-02 ",.01)
 ;;00405-0040-02
 ;;9002226.02101,"624,00405-0040-02 ",.02)
 ;;00405-0040-02
 ;;9002226.02101,"624,00405-0041-01 ",.01)
 ;;00405-0041-01
 ;;9002226.02101,"624,00405-0041-01 ",.02)
 ;;00405-0041-01
 ;;9002226.02101,"624,00405-0041-03 ",.01)
 ;;00405-0041-03
 ;;9002226.02101,"624,00405-0041-03 ",.02)
 ;;00405-0041-03
 ;;9002226.02101,"624,00405-0042-01 ",.01)
 ;;00405-0042-01
 ;;9002226.02101,"624,00405-0042-01 ",.02)
 ;;00405-0042-01
 ;;9002226.02101,"624,00405-0042-02 ",.01)
 ;;00405-0042-02
 ;;9002226.02101,"624,00405-0042-02 ",.02)
 ;;00405-0042-02
 ;;9002226.02101,"624,00405-0068-01 ",.01)
 ;;00405-0068-01
 ;;9002226.02101,"624,00405-0068-01 ",.02)
 ;;00405-0068-01
 ;;9002226.02101,"624,00405-0068-02 ",.01)
 ;;00405-0068-02
 ;;9002226.02101,"624,00405-0068-02 ",.02)
 ;;00405-0068-02
 ;;9002226.02101,"624,00405-0068-03 ",.01)
 ;;00405-0068-03
 ;;9002226.02101,"624,00405-0068-03 ",.02)
 ;;00405-0068-03
 ;;9002226.02101,"624,00405-0069-01 ",.01)
 ;;00405-0069-01
 ;;9002226.02101,"624,00405-0069-01 ",.02)
 ;;00405-0069-01
 ;;9002226.02101,"624,00405-0069-02 ",.01)
 ;;00405-0069-02
 ;;9002226.02101,"624,00405-0069-02 ",.02)
 ;;00405-0069-02
 ;;9002226.02101,"624,00405-0069-03 ",.01)
 ;;00405-0069-03
 ;;9002226.02101,"624,00405-0069-03 ",.02)
 ;;00405-0069-03
 ;;9002226.02101,"624,00405-0070-01 ",.01)
 ;;00405-0070-01
 ;;9002226.02101,"624,00405-0070-01 ",.02)
 ;;00405-0070-01
 ;;9002226.02101,"624,00405-0070-02 ",.01)
 ;;00405-0070-02
 ;;9002226.02101,"624,00405-0070-02 ",.02)
 ;;00405-0070-02
 ;;9002226.02101,"624,00405-0085-01 ",.01)
 ;;00405-0085-01
 ;;9002226.02101,"624,00405-0085-01 ",.02)
 ;;00405-0085-01
 ;;9002226.02101,"624,00405-0085-02 ",.01)
 ;;00405-0085-02
 ;;9002226.02101,"624,00405-0085-02 ",.02)
 ;;00405-0085-02
 ;;9002226.02101,"624,00405-0086-01 ",.01)
 ;;00405-0086-01
 ;;9002226.02101,"624,00405-0086-01 ",.02)
 ;;00405-0086-01
 ;;9002226.02101,"624,00405-0086-02 ",.01)
 ;;00405-0086-02
 ;;9002226.02101,"624,00405-0086-02 ",.02)
 ;;00405-0086-02
 ;;9002226.02101,"624,00405-4522-01 ",.01)
 ;;00405-4522-01
 ;;9002226.02101,"624,00405-4522-01 ",.02)
 ;;00405-4522-01
 ;;9002226.02101,"624,00409-3213-02 ",.01)
 ;;00409-3213-02
 ;;9002226.02101,"624,00409-3213-02 ",.02)
 ;;00409-3213-02
 ;;9002226.02101,"624,00440-7250-30 ",.01)
 ;;00440-7250-30
 ;;9002226.02101,"624,00440-7250-30 ",.02)
 ;;00440-7250-30
 ;;9002226.02101,"624,00440-7251-30 ",.01)
 ;;00440-7251-30
 ;;9002226.02101,"624,00440-7251-30 ",.02)
 ;;00440-7251-30
 ;;9002226.02101,"624,00440-7252-30 ",.01)
 ;;00440-7252-30
 ;;9002226.02101,"624,00440-7252-30 ",.02)
 ;;00440-7252-30
 ;;9002226.02101,"624,00440-7375-30 ",.01)
 ;;00440-7375-30
 ;;9002226.02101,"624,00440-7375-30 ",.02)
 ;;00440-7375-30
 ;;9002226.02101,"624,00440-7376-30 ",.01)
 ;;00440-7376-30
 ;;9002226.02101,"624,00440-7376-30 ",.02)
 ;;00440-7376-30
 ;;9002226.02101,"624,00440-7376-60 ",.01)
 ;;00440-7376-60
 ;;9002226.02101,"624,00440-7376-60 ",.02)
 ;;00440-7376-60
 ;;9002226.02101,"624,00440-7376-90 ",.01)
 ;;00440-7376-90
 ;;9002226.02101,"624,00440-7376-90 ",.02)
 ;;00440-7376-90
 ;;9002226.02101,"624,00440-7376-91 ",.01)
 ;;00440-7376-91
 ;;9002226.02101,"624,00440-7376-91 ",.02)
 ;;00440-7376-91
 ;;9002226.02101,"624,00440-7377-30 ",.01)
 ;;00440-7377-30
 ;;9002226.02101,"624,00440-7377-30 ",.02)
 ;;00440-7377-30
 ;;9002226.02101,"624,00440-7377-60 ",.01)
 ;;00440-7377-60
 ;;9002226.02101,"624,00440-7377-60 ",.02)
 ;;00440-7377-60
 ;;9002226.02101,"624,00440-7377-90 ",.01)
 ;;00440-7377-90
 ;;9002226.02101,"624,00440-7377-90 ",.02)
 ;;00440-7377-90
 ;;9002226.02101,"624,00440-7377-91 ",.01)
 ;;00440-7377-91
 ;;9002226.02101,"624,00440-7377-91 ",.02)
 ;;00440-7377-91
 ;;9002226.02101,"624,00440-7377-93 ",.01)
 ;;00440-7377-93
 ;;9002226.02101,"624,00440-7377-93 ",.02)
 ;;00440-7377-93
 ;;9002226.02101,"624,00440-8085-30 ",.01)
 ;;00440-8085-30
 ;;9002226.02101,"624,00440-8085-30 ",.02)
 ;;00440-8085-30
 ;;9002226.02101,"624,00440-8085-91 ",.01)
 ;;00440-8085-91
 ;;9002226.02101,"624,00440-8085-91 ",.02)
 ;;00440-8085-91
 ;;9002226.02101,"624,00440-8085-92 ",.01)
 ;;00440-8085-92
 ;;9002226.02101,"624,00440-8085-92 ",.02)
 ;;00440-8085-92
 ;;9002226.02101,"624,00440-8085-94 ",.01)
 ;;00440-8085-94
 ;;9002226.02101,"624,00440-8085-94 ",.02)
 ;;00440-8085-94
 ;;9002226.02101,"624,00440-8085-95 ",.01)
 ;;00440-8085-95
 ;;9002226.02101,"624,00440-8085-95 ",.02)
 ;;00440-8085-95
 ;;9002226.02101,"624,00463-2017-10 ",.01)
 ;;00463-2017-10
 ;;9002226.02101,"624,00463-2017-10 ",.02)
 ;;00463-2017-10
 ;;9002226.02101,"624,00463-6054-10 ",.01)
 ;;00463-6054-10
 ;;9002226.02101,"624,00463-6054-10 ",.02)
 ;;00463-6054-10
 ;;9002226.02101,"624,00463-6181-10 ",.01)
 ;;00463-6181-10
 ;;9002226.02101,"624,00463-6181-10 ",.02)
 ;;00463-6181-10
 ;;9002226.02101,"624,00472-0933-28 ",.01)
 ;;00472-0933-28
 ;;9002226.02101,"624,00472-0933-28 ",.02)
 ;;00472-0933-28
 ;;9002226.02101,"624,00472-0981-04 ",.01)
 ;;00472-0981-04
 ;;9002226.02101,"624,00472-0981-04 ",.02)
 ;;00472-0981-04
 ;;9002226.02101,"624,00472-0981-16 ",.01)
 ;;00472-0981-16
 ;;9002226.02101,"624,00472-0981-16 ",.02)
 ;;00472-0981-16
 ;;9002226.02101,"624,00472-0981-28 ",.01)
 ;;00472-0981-28
 ;;9002226.02101,"624,00472-0981-28 ",.02)
 ;;00472-0981-28
 ;;9002226.02101,"624,00517-1058-69 ",.01)
 ;;00517-1058-69
 ;;9002226.02101,"624,00517-1058-69 ",.02)
 ;;00517-1058-69
 ;;9002226.02101,"624,00517-1065-71 ",.01)
 ;;00517-1065-71
 ;;9002226.02101,"624,00517-1065-71 ",.02)
 ;;00517-1065-71
 ;;9002226.02101,"624,00517-3501-25 ",.01)
 ;;00517-3501-25
 ;;9002226.02101,"624,00517-3501-25 ",.02)
 ;;00517-3501-25
 ;;9002226.02101,"624,00517-3601-25 ",.01)
 ;;00517-3601-25
 ;;9002226.02101,"624,00517-3601-25 ",.02)
 ;;00517-3601-25
 ;;9002226.02101,"624,00536-0100-90 ",.01)
 ;;00536-0100-90
 ;;9002226.02101,"624,00536-0100-90 ",.02)
 ;;00536-0100-90
 ;;9002226.02101,"624,00536-3402-10 ",.01)
 ;;00536-3402-10
 ;;9002226.02101,"624,00536-3402-10 ",.02)
 ;;00536-3402-10
 ;;9002226.02101,"624,00536-3487-05 ",.01)
 ;;00536-3487-05
 ;;9002226.02101,"624,00536-3487-05 ",.02)
 ;;00536-3487-05
 ;;9002226.02101,"624,00536-3489-05 ",.01)
 ;;00536-3489-05
 ;;9002226.02101,"624,00536-3489-05 ",.02)
 ;;00536-3489-05
 ;;9002226.02101,"624,00536-3796-01 ",.01)
 ;;00536-3796-01
 ;;9002226.02101,"624,00536-3796-01 ",.02)
 ;;00536-3796-01
 ;;9002226.02101,"624,00536-3796-05 ",.01)
 ;;00536-3796-05
 ;;9002226.02101,"624,00536-3796-05 ",.02)
 ;;00536-3796-05
 ;;9002226.02101,"624,00536-4647-01 ",.01)
 ;;00536-4647-01
 ;;9002226.02101,"624,00536-4647-01 ",.02)
 ;;00536-4647-01
 ;;9002226.02101,"624,00555-0033-02 ",.01)
 ;;00555-0033-02
 ;;9002226.02101,"624,00555-0033-02 ",.02)
 ;;00555-0033-02
 ;;9002226.02101,"624,00555-0033-05 ",.01)
 ;;00555-0033-05
 ;;9002226.02101,"624,00555-0033-05 ",.02)
 ;;00555-0033-05
 ;;9002226.02101,"624,00555-0158-02 ",.01)
 ;;00555-0158-02
 ;;9002226.02101,"624,00555-0158-02 ",.02)
 ;;00555-0158-02
 ;;9002226.02101,"624,00555-0158-04 ",.01)
 ;;00555-0158-04
 ;;9002226.02101,"624,00555-0158-04 ",.02)
 ;;00555-0158-04
 ;;9002226.02101,"624,00555-0159-02 ",.01)
 ;;00555-0159-02
 ;;9002226.02101,"624,00555-0159-02 ",.02)
 ;;00555-0159-02
 ;;9002226.02101,"624,00555-0159-04 ",.01)
 ;;00555-0159-04
 ;;9002226.02101,"624,00555-0159-04 ",.02)
 ;;00555-0159-04
 ;;9002226.02101,"624,00555-0163-02 ",.01)
 ;;00555-0163-02
 ;;9002226.02101,"624,00555-0163-02 ",.02)
 ;;00555-0163-02
 ;;9002226.02101,"624,00555-0163-05 ",.01)
 ;;00555-0163-05
 ;;9002226.02101,"624,00555-0163-05 ",.02)
 ;;00555-0163-05
 ;;9002226.02101,"624,00555-0164-02 ",.01)
 ;;00555-0164-02
 ;;9002226.02101,"624,00555-0164-02 ",.02)
 ;;00555-0164-02
 ;;9002226.02101,"624,00555-0164-05 ",.01)
 ;;00555-0164-05
 ;;9002226.02101,"624,00555-0164-05 ",.02)
 ;;00555-0164-05
 ;;9002226.02101,"624,00555-0363-02 ",.01)
 ;;00555-0363-02
 ;;9002226.02101,"624,00555-0363-02 ",.02)
 ;;00555-0363-02
 ;;9002226.02101,"624,00555-0363-05 ",.01)
 ;;00555-0363-05
 ;;9002226.02101,"624,00555-0363-05 ",.02)
 ;;00555-0363-05
 ;;9002226.02101,"624,00556-0054-01 ",.01)
 ;;00556-0054-01
 ;;9002226.02101,"624,00556-0054-01 ",.02)
 ;;00556-0054-01
 ;;9002226.02101,"624,00556-0054-10 ",.01)
 ;;00556-0054-10
 ;;9002226.02101,"624,00556-0054-10 ",.02)
 ;;00556-0054-10
 ;;9002226.02101,"624,00556-0054-50 ",.01)
 ;;00556-0054-50
 ;;9002226.02101,"624,00556-0054-50 ",.02)
 ;;00556-0054-50
 ;;9002226.02101,"624,00556-0079-01 ",.01)
 ;;00556-0079-01
 ;;9002226.02101,"624,00556-0079-01 ",.02)
 ;;00556-0079-01
 ;;9002226.02101,"624,00556-0079-10 ",.01)
 ;;00556-0079-10
 ;;9002226.02101,"624,00556-0079-10 ",.02)
 ;;00556-0079-10
 ;;9002226.02101,"624,00556-0081-01 ",.01)
 ;;00556-0081-01
 ;;9002226.02101,"624,00556-0081-01 ",.02)
 ;;00556-0081-01
 ;;9002226.02101,"624,00556-0081-10 ",.01)
 ;;00556-0081-10
 ;;9002226.02101,"624,00556-0081-10 ",.02)
 ;;00556-0081-10
 ;;9002226.02101,"624,00556-0355-01 ",.01)
 ;;00556-0355-01
 ;;9002226.02101,"624,00556-0355-01 ",.02)
 ;;00556-0355-01
 ;;9002226.02101,"624,00556-0355-10 ",.01)
 ;;00556-0355-10
 ;;9002226.02101,"624,00556-0355-10 ",.02)
 ;;00556-0355-10
 ;;9002226.02101,"624,00556-0356-10 ",.01)
 ;;00556-0356-10
 ;;9002226.02101,"624,00556-0356-10 ",.02)
 ;;00556-0356-10
 ;;9002226.02101,"624,00556-0371-01 ",.01)
 ;;00556-0371-01
 ;;9002226.02101,"624,00556-0371-01 ",.02)
 ;;00556-0371-01
 ;;9002226.02101,"624,00556-0371-10 ",.01)
 ;;00556-0371-10
 ;;9002226.02101,"624,00556-0371-10 ",.02)
 ;;00556-0371-10
 ;;9002226.02101,"624,00556-0372-01 ",.01)
 ;;00556-0372-01
 ;;9002226.02101,"624,00556-0372-01 ",.02)
 ;;00556-0372-01
 ;;9002226.02101,"624,00556-0372-10 ",.01)
 ;;00556-0372-10
 ;;9002226.02101,"624,00556-0372-10 ",.02)
 ;;00556-0372-10
 ;;9002226.02101,"624,00591-0785-01 ",.01)
 ;;00591-0785-01
 ;;9002226.02101,"624,00591-0785-01 ",.02)
 ;;00591-0785-01
 ;;9002226.02101,"624,00591-0785-05 ",.01)
 ;;00591-0785-05
 ;;9002226.02101,"624,00591-0785-05 ",.02)
 ;;00591-0785-05
 ;;9002226.02101,"624,00591-0786-01 ",.01)
 ;;00591-0786-01
 ;;9002226.02101,"624,00591-0786-01 ",.02)
 ;;00591-0786-01
 ;;9002226.02101,"624,00591-0786-05 ",.01)
 ;;00591-0786-05
 ;;9002226.02101,"624,00591-0786-05 ",.02)
 ;;00591-0786-05
 ;;9002226.02101,"624,00591-0786-10 ",.01)
 ;;00591-0786-10
 ;;9002226.02101,"624,00591-0786-10 ",.02)
 ;;00591-0786-10
 ;;9002226.02101,"624,00591-0787-01 ",.01)
 ;;00591-0787-01
 ;;9002226.02101,"624,00591-0787-01 ",.02)
 ;;00591-0787-01
 ;;9002226.02101,"624,00591-0787-05 ",.01)
 ;;00591-0787-05
 ;;9002226.02101,"624,00591-0787-05 ",.02)
 ;;00591-0787-05
 ;;9002226.02101,"624,00591-5476-04 ",.01)
 ;;00591-5476-04
 ;;9002226.02101,"624,00591-5476-04 ",.02)
 ;;00591-5476-04
 ;;9002226.02101,"624,00591-5478-01 ",.01)
 ;;00591-5478-01
 ;;9002226.02101,"624,00591-5478-01 ",.02)
 ;;00591-5478-01
 ;;9002226.02101,"624,00591-5478-04 ",.01)
 ;;00591-5478-04
 ;;9002226.02101,"624,00591-5478-04 ",.02)
 ;;00591-5478-04
 ;;9002226.02101,"624,00591-5569-01 ",.01)
 ;;00591-5569-01
 ;;9002226.02101,"624,00591-5569-01 ",.02)
 ;;00591-5569-01
 ;;9002226.02101,"624,00591-5569-03 ",.01)
 ;;00591-5569-03
 ;;9002226.02101,"624,00591-5569-03 ",.02)
 ;;00591-5569-03
 ;;9002226.02101,"624,00591-5572-01 ",.01)
 ;;00591-5572-01
 ;;9002226.02101,"624,00591-5572-01 ",.02)
 ;;00591-5572-01
 ;;9002226.02101,"624,00591-5580-01 ",.01)
 ;;00591-5580-01
 ;;9002226.02101,"624,00591-5580-01 ",.02)
 ;;00591-5580-01
 ;;9002226.02101,"624,00591-5581-01 ",.01)
 ;;00591-5581-01
 ;;9002226.02101,"624,00591-5581-01 ",.02)
 ;;00591-5581-01
 ;;9002226.02101,"624,00591-5619-01 ",.01)
 ;;00591-5619-01
 ;;9002226.02101,"624,00591-5619-01 ",.02)
 ;;00591-5619-01
 ;;9002226.02101,"624,00591-5619-05 ",.01)
 ;;00591-5619-05
 ;;9002226.02101,"624,00591-5619-05 ",.02)
 ;;00591-5619-05
 ;;9002226.02101,"624,00591-5619-10 ",.01)
 ;;00591-5619-10
 ;;9002226.02101,"624,00591-5619-10 ",.02)
 ;;00591-5619-10
 ;;9002226.02101,"624,00591-5620-01 ",.01)
 ;;00591-5620-01
 ;;9002226.02101,"624,00591-5620-01 ",.02)
 ;;00591-5620-01
 ;;9002226.02101,"624,00591-5620-05 ",.01)
 ;;00591-5620-05
 ;;9002226.02101,"624,00591-5620-05 ",.02)
 ;;00591-5620-05
 ;;9002226.02101,"624,00591-5620-10 ",.01)
 ;;00591-5620-10
 ;;9002226.02101,"624,00591-5620-10 ",.02)
 ;;00591-5620-10
 ;;9002226.02101,"624,00591-5621-01 ",.01)
 ;;00591-5621-01
 ;;9002226.02101,"624,00591-5621-01 ",.02)
 ;;00591-5621-01
 ;;9002226.02101,"624,00591-5621-05 ",.01)
 ;;00591-5621-05
 ;;9002226.02101,"624,00591-5621-05 ",.02)
 ;;00591-5621-05
 ;;9002226.02101,"624,00591-5621-10 ",.01)
 ;;00591-5621-10
