BGP9SXGC ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"558,55289-0961-15 ",.01)
 ;;55289-0961-15
 ;;9002226.02101,"558,55289-0961-15 ",.02)
 ;;55289-0961-15
 ;;9002226.02101,"558,55289-0961-30 ",.01)
 ;;55289-0961-30
 ;;9002226.02101,"558,55289-0961-30 ",.02)
 ;;55289-0961-30
 ;;9002226.02101,"558,55289-0989-21 ",.01)
 ;;55289-0989-21
 ;;9002226.02101,"558,55289-0989-21 ",.02)
 ;;55289-0989-21
 ;;9002226.02101,"558,55289-0989-30 ",.01)
 ;;55289-0989-30
 ;;9002226.02101,"558,55289-0989-30 ",.02)
 ;;55289-0989-30
 ;;9002226.02101,"558,55289-0990-21 ",.01)
 ;;55289-0990-21
 ;;9002226.02101,"558,55289-0990-21 ",.02)
 ;;55289-0990-21
 ;;9002226.02101,"558,55289-0990-30 ",.01)
 ;;55289-0990-30
 ;;9002226.02101,"558,55289-0990-30 ",.02)
 ;;55289-0990-30
 ;;9002226.02101,"558,55887-0120-90 ",.01)
 ;;55887-0120-90
 ;;9002226.02101,"558,55887-0120-90 ",.02)
 ;;55887-0120-90
 ;;9002226.02101,"558,58864-0658-30 ",.01)
 ;;58864-0658-30
 ;;9002226.02101,"558,58864-0658-30 ",.02)
 ;;58864-0658-30
 ;;9002226.02101,"558,58864-0694-30 ",.01)
 ;;58864-0694-30
 ;;9002226.02101,"558,58864-0694-30 ",.02)
 ;;58864-0694-30
 ;;9002226.02101,"558,63629-1639-01 ",.01)
 ;;63629-1639-01
 ;;9002226.02101,"558,63629-1639-01 ",.02)
 ;;63629-1639-01
 ;;9002226.02101,"558,66105-0164-02 ",.01)
 ;;66105-0164-02
 ;;9002226.02101,"558,66105-0164-02 ",.02)
 ;;66105-0164-02
 ;;9002226.02101,"558,66105-0164-03 ",.01)
 ;;66105-0164-03
 ;;9002226.02101,"558,66105-0164-03 ",.02)
 ;;66105-0164-03
 ;;9002226.02101,"558,66105-0164-06 ",.01)
 ;;66105-0164-06
 ;;9002226.02101,"558,66105-0164-06 ",.02)
 ;;66105-0164-06
 ;;9002226.02101,"558,66105-0164-09 ",.01)
 ;;66105-0164-09
 ;;9002226.02101,"558,66105-0164-09 ",.02)
 ;;66105-0164-09
 ;;9002226.02101,"558,66105-0164-10 ",.01)
 ;;66105-0164-10
 ;;9002226.02101,"558,66105-0164-10 ",.02)
 ;;66105-0164-10
 ;;9002226.02101,"558,67801-0305-03 ",.01)
 ;;67801-0305-03
 ;;9002226.02101,"558,67801-0305-03 ",.02)
 ;;67801-0305-03
 ;;9002226.02101,"558,68115-0638-60 ",.01)
 ;;68115-0638-60
 ;;9002226.02101,"558,68115-0638-60 ",.02)
 ;;68115-0638-60
 ;;9002226.02101,"558,68115-0923-30 ",.01)
 ;;68115-0923-30
 ;;9002226.02101,"558,68115-0923-30 ",.02)
 ;;68115-0923-30
 ;;9002226.02101,"558,68115-0923-90 ",.01)
 ;;68115-0923-90
 ;;9002226.02101,"558,68115-0923-90 ",.02)
 ;;68115-0923-90
 ;;9002226.02101,"558,68734-0700-10 ",.01)
 ;;68734-0700-10
 ;;9002226.02101,"558,68734-0700-10 ",.02)
 ;;68734-0700-10
 ;;9002226.02101,"558,68734-0710-10 ",.01)
 ;;68734-0710-10
 ;;9002226.02101,"558,68734-0710-10 ",.02)
 ;;68734-0710-10
