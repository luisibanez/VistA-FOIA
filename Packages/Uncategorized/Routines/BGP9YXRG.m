BGP9YXRG ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"461,59930-1670-03 ",.01)
 ;;59930-1670-03
 ;;9002226.02101,"461,59930-1670-03 ",.02)
 ;;59930-1670-03
 ;;9002226.02101,"461,59930-1680-01 ",.01)
 ;;59930-1680-01
 ;;9002226.02101,"461,59930-1680-01 ",.02)
 ;;59930-1680-01
 ;;9002226.02101,"461,60432-0019-16 ",.01)
 ;;60432-0019-16
 ;;9002226.02101,"461,60432-0019-16 ",.02)
 ;;60432-0019-16
 ;;9002226.02101,"461,60432-0019-28 ",.01)
 ;;60432-0019-28
 ;;9002226.02101,"461,60432-0019-28 ",.02)
 ;;60432-0019-28
 ;;9002226.02101,"461,60432-0157-06 ",.01)
 ;;60432-0157-06
 ;;9002226.02101,"461,60432-0157-06 ",.02)
 ;;60432-0157-06
 ;;9002226.02101,"461,61392-0016-30 ",.01)
 ;;61392-0016-30
 ;;9002226.02101,"461,61392-0016-30 ",.02)
 ;;61392-0016-30
 ;;9002226.02101,"461,61392-0016-45 ",.01)
 ;;61392-0016-45
 ;;9002226.02101,"461,61392-0016-45 ",.02)
 ;;61392-0016-45
 ;;9002226.02101,"461,61392-0016-51 ",.01)
 ;;61392-0016-51
 ;;9002226.02101,"461,61392-0016-51 ",.02)
 ;;61392-0016-51
 ;;9002226.02101,"461,61392-0016-54 ",.01)
 ;;61392-0016-54
 ;;9002226.02101,"461,61392-0016-54 ",.02)
 ;;61392-0016-54
 ;;9002226.02101,"461,61392-0016-56 ",.01)
 ;;61392-0016-56
 ;;9002226.02101,"461,61392-0016-56 ",.02)
 ;;61392-0016-56
 ;;9002226.02101,"461,61392-0016-60 ",.01)
 ;;61392-0016-60
 ;;9002226.02101,"461,61392-0016-60 ",.02)
 ;;61392-0016-60
 ;;9002226.02101,"461,61392-0016-90 ",.01)
 ;;61392-0016-90
 ;;9002226.02101,"461,61392-0016-90 ",.02)
 ;;61392-0016-90
 ;;9002226.02101,"461,61392-0016-91 ",.01)
 ;;61392-0016-91
 ;;9002226.02101,"461,61392-0016-91 ",.02)
 ;;61392-0016-91
 ;;9002226.02101,"461,61392-0017-30 ",.01)
 ;;61392-0017-30
 ;;9002226.02101,"461,61392-0017-30 ",.02)
 ;;61392-0017-30
 ;;9002226.02101,"461,61392-0017-51 ",.01)
 ;;61392-0017-51
 ;;9002226.02101,"461,61392-0017-51 ",.02)
 ;;61392-0017-51
 ;;9002226.02101,"461,61392-0017-54 ",.01)
 ;;61392-0017-54
 ;;9002226.02101,"461,61392-0017-54 ",.02)
 ;;61392-0017-54
 ;;9002226.02101,"461,61392-0017-56 ",.01)
 ;;61392-0017-56
 ;;9002226.02101,"461,61392-0017-56 ",.02)
 ;;61392-0017-56
 ;;9002226.02101,"461,61392-0017-60 ",.01)
 ;;61392-0017-60
 ;;9002226.02101,"461,61392-0017-60 ",.02)
 ;;61392-0017-60
 ;;9002226.02101,"461,61392-0017-90 ",.01)
 ;;61392-0017-90
 ;;9002226.02101,"461,61392-0017-90 ",.02)
 ;;61392-0017-90
 ;;9002226.02101,"461,61392-0017-91 ",.01)
 ;;61392-0017-91
 ;;9002226.02101,"461,61392-0017-91 ",.02)
 ;;61392-0017-91
 ;;9002226.02101,"461,61570-0019-01 ",.01)
 ;;61570-0019-01
 ;;9002226.02101,"461,61570-0019-01 ",.02)
 ;;61570-0019-01
 ;;9002226.02101,"461,61570-0020-01 ",.01)
 ;;61570-0020-01
 ;;9002226.02101,"461,61570-0020-01 ",.02)
 ;;61570-0020-01
 ;;9002226.02101,"461,64032-0157-21 ",.01)
 ;;64032-0157-21
 ;;9002226.02101,"461,64032-0157-21 ",.02)
 ;;64032-0157-21
