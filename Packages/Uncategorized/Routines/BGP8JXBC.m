BGP8JXBC ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON NOV 27, 2007 ;
 ;;8.0;IHS CLINICAL REPORTING;;MAR 12, 2008
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"633,61392-0549-39 ",.02)
 ;;61392-0549-39
 ;;9002226.02101,"633,61392-0549-45 ",.01)
 ;;61392-0549-45
 ;;9002226.02101,"633,61392-0549-45 ",.02)
 ;;61392-0549-45
 ;;9002226.02101,"633,61392-0549-51 ",.01)
 ;;61392-0549-51
 ;;9002226.02101,"633,61392-0549-51 ",.02)
 ;;61392-0549-51
 ;;9002226.02101,"633,61392-0549-54 ",.01)
 ;;61392-0549-54
 ;;9002226.02101,"633,61392-0549-54 ",.02)
 ;;61392-0549-54
 ;;9002226.02101,"633,61392-0549-56 ",.01)
 ;;61392-0549-56
 ;;9002226.02101,"633,61392-0549-56 ",.02)
 ;;61392-0549-56
 ;;9002226.02101,"633,61392-0549-60 ",.01)
 ;;61392-0549-60
 ;;9002226.02101,"633,61392-0549-60 ",.02)
 ;;61392-0549-60
 ;;9002226.02101,"633,61392-0549-90 ",.01)
 ;;61392-0549-90
 ;;9002226.02101,"633,61392-0549-90 ",.02)
 ;;61392-0549-90
 ;;9002226.02101,"633,61392-0549-91 ",.01)
 ;;61392-0549-91
 ;;9002226.02101,"633,61392-0549-91 ",.02)
 ;;61392-0549-91
 ;;9002226.02101,"633,61392-0552-30 ",.01)
 ;;61392-0552-30
 ;;9002226.02101,"633,61392-0552-30 ",.02)
 ;;61392-0552-30
 ;;9002226.02101,"633,61392-0552-31 ",.01)
 ;;61392-0552-31
 ;;9002226.02101,"633,61392-0552-31 ",.02)
 ;;61392-0552-31
 ;;9002226.02101,"633,61392-0552-32 ",.01)
 ;;61392-0552-32
 ;;9002226.02101,"633,61392-0552-32 ",.02)
 ;;61392-0552-32
 ;;9002226.02101,"633,61392-0552-39 ",.01)
 ;;61392-0552-39
 ;;9002226.02101,"633,61392-0552-39 ",.02)
 ;;61392-0552-39
 ;;9002226.02101,"633,61392-0552-45 ",.01)
 ;;61392-0552-45
 ;;9002226.02101,"633,61392-0552-45 ",.02)
 ;;61392-0552-45
 ;;9002226.02101,"633,61392-0552-51 ",.01)
 ;;61392-0552-51
 ;;9002226.02101,"633,61392-0552-51 ",.02)
 ;;61392-0552-51
 ;;9002226.02101,"633,61392-0552-54 ",.01)
 ;;61392-0552-54
 ;;9002226.02101,"633,61392-0552-54 ",.02)
 ;;61392-0552-54
 ;;9002226.02101,"633,61392-0552-56 ",.01)
 ;;61392-0552-56
 ;;9002226.02101,"633,61392-0552-56 ",.02)
 ;;61392-0552-56
 ;;9002226.02101,"633,61392-0552-60 ",.01)
 ;;61392-0552-60
 ;;9002226.02101,"633,61392-0552-60 ",.02)
 ;;61392-0552-60
 ;;9002226.02101,"633,61392-0552-90 ",.01)
 ;;61392-0552-90
 ;;9002226.02101,"633,61392-0552-90 ",.02)
 ;;61392-0552-90
 ;;9002226.02101,"633,61392-0552-91 ",.01)
 ;;61392-0552-91
 ;;9002226.02101,"633,61392-0552-91 ",.02)
 ;;61392-0552-91
 ;;9002226.02101,"633,63323-0613-02 ",.01)
 ;;63323-0613-02
 ;;9002226.02101,"633,63323-0613-02 ",.02)
 ;;63323-0613-02
 ;;9002226.02101,"633,63323-0613-10 ",.01)
 ;;63323-0613-10
 ;;9002226.02101,"633,63323-0613-10 ",.02)
 ;;63323-0613-10
 ;;9002226.02101,"633,64731-0575-01 ",.01)
 ;;64731-0575-01
 ;;9002226.02101,"633,64731-0575-01 ",.02)
 ;;64731-0575-01
 ;;9002226.02101,"633,64731-0575-10 ",.01)
 ;;64731-0575-10
 ;;9002226.02101,"633,64731-0575-10 ",.02)
 ;;64731-0575-10
 ;;9002226.02101,"633,64731-0576-01 ",.01)
 ;;64731-0576-01
 ;;9002226.02101,"633,64731-0576-01 ",.02)
 ;;64731-0576-01
 ;;9002226.02101,"633,64731-0576-10 ",.01)
 ;;64731-0576-10
 ;;9002226.02101,"633,64731-0576-10 ",.02)
 ;;64731-0576-10
 ;;9002226.02101,"633,68115-0663-00 ",.01)
 ;;68115-0663-00
 ;;9002226.02101,"633,68115-0663-00 ",.02)
 ;;68115-0663-00
