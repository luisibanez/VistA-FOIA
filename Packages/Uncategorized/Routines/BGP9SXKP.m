BGP9SXKP ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"729,54868-0501-00 ",.02)
 ;;54868-0501-00
 ;;9002226.02101,"729,54868-0617-00 ",.01)
 ;;54868-0617-00
 ;;9002226.02101,"729,54868-0617-00 ",.02)
 ;;54868-0617-00
 ;;9002226.02101,"729,54868-0988-00 ",.01)
 ;;54868-0988-00
 ;;9002226.02101,"729,54868-0988-00 ",.02)
 ;;54868-0988-00
 ;;9002226.02101,"729,54868-0988-01 ",.01)
 ;;54868-0988-01
 ;;9002226.02101,"729,54868-0988-01 ",.02)
 ;;54868-0988-01
 ;;9002226.02101,"729,54868-0988-02 ",.01)
 ;;54868-0988-02
 ;;9002226.02101,"729,54868-0988-02 ",.02)
 ;;54868-0988-02
 ;;9002226.02101,"729,54868-0988-05 ",.01)
 ;;54868-0988-05
 ;;9002226.02101,"729,54868-0988-05 ",.02)
 ;;54868-0988-05
 ;;9002226.02101,"729,54868-2126-01 ",.01)
 ;;54868-2126-01
 ;;9002226.02101,"729,54868-2126-01 ",.02)
 ;;54868-2126-01
 ;;9002226.02101,"729,54868-2126-02 ",.01)
 ;;54868-2126-02
 ;;9002226.02101,"729,54868-2126-02 ",.02)
 ;;54868-2126-02
 ;;9002226.02101,"729,54868-2126-03 ",.01)
 ;;54868-2126-03
 ;;9002226.02101,"729,54868-2126-03 ",.02)
 ;;54868-2126-03
 ;;9002226.02101,"729,54868-2126-04 ",.01)
 ;;54868-2126-04
 ;;9002226.02101,"729,54868-2126-04 ",.02)
 ;;54868-2126-04
 ;;9002226.02101,"729,54868-2206-01 ",.01)
 ;;54868-2206-01
 ;;9002226.02101,"729,54868-2206-01 ",.02)
 ;;54868-2206-01
 ;;9002226.02101,"729,54868-2320-01 ",.01)
 ;;54868-2320-01
 ;;9002226.02101,"729,54868-2320-01 ",.02)
 ;;54868-2320-01
 ;;9002226.02101,"729,54868-2320-02 ",.01)
 ;;54868-2320-02
 ;;9002226.02101,"729,54868-2320-02 ",.02)
 ;;54868-2320-02
 ;;9002226.02101,"729,54868-4061-00 ",.01)
 ;;54868-4061-00
 ;;9002226.02101,"729,54868-4061-00 ",.02)
 ;;54868-4061-00
 ;;9002226.02101,"729,54868-4586-00 ",.01)
 ;;54868-4586-00
 ;;9002226.02101,"729,54868-4586-00 ",.02)
 ;;54868-4586-00
 ;;9002226.02101,"729,55045-1171-00 ",.01)
 ;;55045-1171-00
 ;;9002226.02101,"729,55045-1171-00 ",.02)
 ;;55045-1171-00
 ;;9002226.02101,"729,55045-1171-07 ",.01)
 ;;55045-1171-07
 ;;9002226.02101,"729,55045-1171-07 ",.02)
 ;;55045-1171-07
 ;;9002226.02101,"729,55045-1171-08 ",.01)
 ;;55045-1171-08
 ;;9002226.02101,"729,55045-1171-08 ",.02)
 ;;55045-1171-08
 ;;9002226.02101,"729,55045-1171-09 ",.01)
 ;;55045-1171-09
 ;;9002226.02101,"729,55045-1171-09 ",.02)
 ;;55045-1171-09
 ;;9002226.02101,"729,55045-1477-07 ",.01)
 ;;55045-1477-07
 ;;9002226.02101,"729,55045-1477-07 ",.02)
 ;;55045-1477-07
 ;;9002226.02101,"729,55045-1624-08 ",.01)
 ;;55045-1624-08
 ;;9002226.02101,"729,55045-1624-08 ",.02)
 ;;55045-1624-08
 ;;9002226.02101,"729,55045-1624-09 ",.01)
 ;;55045-1624-09
 ;;9002226.02101,"729,55045-1624-09 ",.02)
 ;;55045-1624-09
 ;;9002226.02101,"729,55045-1922-06 ",.01)
 ;;55045-1922-06
 ;;9002226.02101,"729,55045-1922-06 ",.02)
 ;;55045-1922-06
 ;;9002226.02101,"729,55045-2799-01 ",.01)
 ;;55045-2799-01
 ;;9002226.02101,"729,55045-2799-01 ",.02)
 ;;55045-2799-01
 ;;9002226.02101,"729,55289-0091-06 ",.01)
 ;;55289-0091-06
 ;;9002226.02101,"729,55289-0091-06 ",.02)
 ;;55289-0091-06
 ;;9002226.02101,"729,55289-0091-09 ",.01)
 ;;55289-0091-09
 ;;9002226.02101,"729,55289-0091-09 ",.02)
 ;;55289-0091-09
 ;;9002226.02101,"729,55289-0091-10 ",.01)
 ;;55289-0091-10
 ;;9002226.02101,"729,55289-0091-10 ",.02)
 ;;55289-0091-10
 ;;9002226.02101,"729,55289-0091-15 ",.01)
 ;;55289-0091-15
 ;;9002226.02101,"729,55289-0091-15 ",.02)
 ;;55289-0091-15
 ;;9002226.02101,"729,55289-0091-21 ",.01)
 ;;55289-0091-21
 ;;9002226.02101,"729,55289-0091-21 ",.02)
 ;;55289-0091-21
 ;;9002226.02101,"729,55289-0091-30 ",.01)
 ;;55289-0091-30
 ;;9002226.02101,"729,55289-0091-30 ",.02)
 ;;55289-0091-30
 ;;9002226.02101,"729,55289-0091-60 ",.01)
 ;;55289-0091-60
 ;;9002226.02101,"729,55289-0091-60 ",.02)
 ;;55289-0091-60
 ;;9002226.02101,"729,55289-0091-90 ",.01)
 ;;55289-0091-90
 ;;9002226.02101,"729,55289-0091-90 ",.02)
 ;;55289-0091-90
 ;;9002226.02101,"729,55289-0091-97 ",.01)
 ;;55289-0091-97
 ;;9002226.02101,"729,55289-0091-97 ",.02)
 ;;55289-0091-97
 ;;9002226.02101,"729,55289-0092-06 ",.01)
 ;;55289-0092-06
 ;;9002226.02101,"729,55289-0092-06 ",.02)
 ;;55289-0092-06
 ;;9002226.02101,"729,55289-0092-20 ",.01)
 ;;55289-0092-20
 ;;9002226.02101,"729,55289-0092-20 ",.02)
 ;;55289-0092-20
 ;;9002226.02101,"729,55289-0092-25 ",.01)
 ;;55289-0092-25
 ;;9002226.02101,"729,55289-0092-25 ",.02)
 ;;55289-0092-25
 ;;9002226.02101,"729,55289-0092-30 ",.01)
 ;;55289-0092-30
 ;;9002226.02101,"729,55289-0092-30 ",.02)
 ;;55289-0092-30
 ;;9002226.02101,"729,55289-0092-60 ",.01)
 ;;55289-0092-60
 ;;9002226.02101,"729,55289-0092-60 ",.02)
 ;;55289-0092-60
 ;;9002226.02101,"729,55289-0092-90 ",.01)
 ;;55289-0092-90
 ;;9002226.02101,"729,55289-0092-90 ",.02)
 ;;55289-0092-90
 ;;9002226.02101,"729,55289-0092-98 ",.01)
 ;;55289-0092-98
 ;;9002226.02101,"729,55289-0092-98 ",.02)
 ;;55289-0092-98
 ;;9002226.02101,"729,55289-0508-14 ",.01)
 ;;55289-0508-14
 ;;9002226.02101,"729,55289-0508-14 ",.02)
 ;;55289-0508-14
 ;;9002226.02101,"729,55289-0979-20 ",.01)
 ;;55289-0979-20
 ;;9002226.02101,"729,55289-0979-20 ",.02)
 ;;55289-0979-20
 ;;9002226.02101,"729,55289-0979-30 ",.01)
 ;;55289-0979-30
 ;;9002226.02101,"729,55289-0979-30 ",.02)
 ;;55289-0979-30
 ;;9002226.02101,"729,55829-0831-10 ",.01)
 ;;55829-0831-10