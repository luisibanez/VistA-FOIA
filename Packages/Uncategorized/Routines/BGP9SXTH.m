BGP9SXTH ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"720,52959-0406-30 ",.02)
 ;;52959-0406-30
 ;;9002226.02101,"720,53191-0289-01 ",.01)
 ;;53191-0289-01
 ;;9002226.02101,"720,53191-0289-01 ",.02)
 ;;53191-0289-01
 ;;9002226.02101,"720,53191-0289-10 ",.01)
 ;;53191-0289-10
 ;;9002226.02101,"720,53191-0289-10 ",.02)
 ;;53191-0289-10
 ;;9002226.02101,"720,53191-0290-01 ",.01)
 ;;53191-0290-01
 ;;9002226.02101,"720,53191-0290-01 ",.02)
 ;;53191-0290-01
 ;;9002226.02101,"720,53191-0290-10 ",.01)
 ;;53191-0290-10
 ;;9002226.02101,"720,53191-0290-10 ",.02)
 ;;53191-0290-10
 ;;9002226.02101,"720,53191-0291-01 ",.01)
 ;;53191-0291-01
 ;;9002226.02101,"720,53191-0291-01 ",.02)
 ;;53191-0291-01
 ;;9002226.02101,"720,53191-0291-10 ",.01)
 ;;53191-0291-10
 ;;9002226.02101,"720,53191-0291-10 ",.02)
 ;;53191-0291-10
 ;;9002226.02101,"720,53191-0292-01 ",.01)
 ;;53191-0292-01
 ;;9002226.02101,"720,53191-0292-01 ",.02)
 ;;53191-0292-01
 ;;9002226.02101,"720,53191-0292-10 ",.01)
 ;;53191-0292-10
 ;;9002226.02101,"720,53191-0292-10 ",.02)
 ;;53191-0292-10
 ;;9002226.02101,"720,53191-0293-01 ",.01)
 ;;53191-0293-01
 ;;9002226.02101,"720,53191-0293-01 ",.02)
 ;;53191-0293-01
 ;;9002226.02101,"720,53191-0293-10 ",.01)
 ;;53191-0293-10
 ;;9002226.02101,"720,53191-0293-10 ",.02)
 ;;53191-0293-10
 ;;9002226.02101,"720,53191-0294-01 ",.01)
 ;;53191-0294-01
 ;;9002226.02101,"720,53191-0294-01 ",.02)
 ;;53191-0294-01
 ;;9002226.02101,"720,53191-0294-10 ",.01)
 ;;53191-0294-10
 ;;9002226.02101,"720,53191-0294-10 ",.02)
 ;;53191-0294-10
 ;;9002226.02101,"720,53191-0296-01 ",.01)
 ;;53191-0296-01
 ;;9002226.02101,"720,53191-0296-01 ",.02)
 ;;53191-0296-01
 ;;9002226.02101,"720,53191-0296-10 ",.01)
 ;;53191-0296-10
 ;;9002226.02101,"720,53191-0296-10 ",.02)
 ;;53191-0296-10
 ;;9002226.02101,"720,53191-0297-01 ",.01)
 ;;53191-0297-01
 ;;9002226.02101,"720,53191-0297-01 ",.02)
 ;;53191-0297-01
 ;;9002226.02101,"720,53191-0297-10 ",.01)
 ;;53191-0297-10
 ;;9002226.02101,"720,53191-0297-10 ",.02)
 ;;53191-0297-10
 ;;9002226.02101,"720,53191-0298-01 ",.01)
 ;;53191-0298-01
 ;;9002226.02101,"720,53191-0298-01 ",.02)
 ;;53191-0298-01
 ;;9002226.02101,"720,53191-0298-10 ",.01)
 ;;53191-0298-10
 ;;9002226.02101,"720,53191-0298-10 ",.02)
 ;;53191-0298-10
 ;;9002226.02101,"720,54569-0181-00 ",.01)
 ;;54569-0181-00
 ;;9002226.02101,"720,54569-0181-00 ",.02)
 ;;54569-0181-00
 ;;9002226.02101,"720,54569-0181-01 ",.01)
 ;;54569-0181-01
 ;;9002226.02101,"720,54569-0181-01 ",.02)
 ;;54569-0181-01
 ;;9002226.02101,"720,54569-0181-02 ",.01)
 ;;54569-0181-02
 ;;9002226.02101,"720,54569-0181-02 ",.02)
 ;;54569-0181-02
 ;;9002226.02101,"720,54569-0181-04 ",.01)
 ;;54569-0181-04
 ;;9002226.02101,"720,54569-0181-04 ",.02)
 ;;54569-0181-04
 ;;9002226.02101,"720,54569-0841-00 ",.01)
 ;;54569-0841-00
 ;;9002226.02101,"720,54569-0841-00 ",.02)
 ;;54569-0841-00
 ;;9002226.02101,"720,54569-0917-00 ",.01)
 ;;54569-0917-00
 ;;9002226.02101,"720,54569-0917-00 ",.02)
 ;;54569-0917-00
 ;;9002226.02101,"720,54569-0918-00 ",.01)
 ;;54569-0918-00
 ;;9002226.02101,"720,54569-0918-00 ",.02)
 ;;54569-0918-00
 ;;9002226.02101,"720,54569-0919-00 ",.01)
 ;;54569-0919-00
 ;;9002226.02101,"720,54569-0919-00 ",.02)
 ;;54569-0919-00
 ;;9002226.02101,"720,54569-0920-00 ",.01)
 ;;54569-0920-00
 ;;9002226.02101,"720,54569-0920-00 ",.02)
 ;;54569-0920-00
 ;;9002226.02101,"720,54569-1969-00 ",.01)
 ;;54569-1969-00
 ;;9002226.02101,"720,54569-1969-00 ",.02)
 ;;54569-1969-00
 ;;9002226.02101,"720,54569-1969-01 ",.01)
 ;;54569-1969-01
 ;;9002226.02101,"720,54569-1969-01 ",.02)
 ;;54569-1969-01
 ;;9002226.02101,"720,54569-1969-02 ",.01)
 ;;54569-1969-02
 ;;9002226.02101,"720,54569-1969-02 ",.02)
 ;;54569-1969-02
 ;;9002226.02101,"720,54569-3179-03 ",.01)
 ;;54569-3179-03
 ;;9002226.02101,"720,54569-3179-03 ",.02)
 ;;54569-3179-03
 ;;9002226.02101,"720,54569-3179-04 ",.01)
 ;;54569-3179-04
 ;;9002226.02101,"720,54569-3179-04 ",.02)
 ;;54569-3179-04
 ;;9002226.02101,"720,54569-3180-00 ",.01)
 ;;54569-3180-00
 ;;9002226.02101,"720,54569-3180-00 ",.02)
 ;;54569-3180-00
 ;;9002226.02101,"720,54569-3180-01 ",.01)
 ;;54569-3180-01
 ;;9002226.02101,"720,54569-3180-01 ",.02)
 ;;54569-3180-01
 ;;9002226.02101,"720,54569-3180-02 ",.01)
 ;;54569-3180-02
 ;;9002226.02101,"720,54569-3180-02 ",.02)
 ;;54569-3180-02
 ;;9002226.02101,"720,54569-3180-05 ",.01)
 ;;54569-3180-05
 ;;9002226.02101,"720,54569-3180-05 ",.02)
 ;;54569-3180-05
 ;;9002226.02101,"720,54569-3181-01 ",.01)
 ;;54569-3181-01
 ;;9002226.02101,"720,54569-3181-01 ",.02)
 ;;54569-3181-01
 ;;9002226.02101,"720,54569-3544-00 ",.01)
 ;;54569-3544-00
 ;;9002226.02101,"720,54569-3544-00 ",.02)
 ;;54569-3544-00
 ;;9002226.02101,"720,54569-3544-01 ",.01)
 ;;54569-3544-01
 ;;9002226.02101,"720,54569-3544-01 ",.02)
 ;;54569-3544-01
 ;;9002226.02101,"720,54569-3544-02 ",.01)
 ;;54569-3544-02
 ;;9002226.02101,"720,54569-3544-02 ",.02)
 ;;54569-3544-02
 ;;9002226.02101,"720,54569-3544-03 ",.01)
 ;;54569-3544-03
 ;;9002226.02101,"720,54569-3544-03 ",.02)
 ;;54569-3544-03
 ;;9002226.02101,"720,54569-3544-04 ",.01)
 ;;54569-3544-04
 ;;9002226.02101,"720,54569-3544-04 ",.02)
 ;;54569-3544-04
 ;;9002226.02101,"720,54569-4471-00 ",.01)
 ;;54569-4471-00
