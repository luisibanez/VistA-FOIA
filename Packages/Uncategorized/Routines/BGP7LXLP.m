BGP7LXLP ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON AUG 29, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"629,55175-2780-04 ",.01)
 ;;55175-2780-04
 ;;9002226.02101,"629,55175-2780-04 ",.02)
 ;;55175-2780-04
 ;;9002226.02101,"629,55175-2780-05 ",.01)
 ;;55175-2780-05
 ;;9002226.02101,"629,55175-2780-05 ",.02)
 ;;55175-2780-05
 ;;9002226.02101,"629,55175-2780-06 ",.01)
 ;;55175-2780-06
 ;;9002226.02101,"629,55175-2780-06 ",.02)
 ;;55175-2780-06
 ;;9002226.02101,"629,55175-2780-07 ",.01)
 ;;55175-2780-07
 ;;9002226.02101,"629,55175-2780-07 ",.02)
 ;;55175-2780-07
 ;;9002226.02101,"629,55175-4087-01 ",.01)
 ;;55175-4087-01
 ;;9002226.02101,"629,55175-4087-01 ",.02)
 ;;55175-4087-01
 ;;9002226.02101,"629,55175-4087-02 ",.01)
 ;;55175-4087-02
 ;;9002226.02101,"629,55175-4087-02 ",.02)
 ;;55175-4087-02
 ;;9002226.02101,"629,55175-4087-03 ",.01)
 ;;55175-4087-03
 ;;9002226.02101,"629,55175-4087-03 ",.02)
 ;;55175-4087-03
 ;;9002226.02101,"629,55175-4087-04 ",.01)
 ;;55175-4087-04
 ;;9002226.02101,"629,55175-4087-04 ",.02)
 ;;55175-4087-04
 ;;9002226.02101,"629,55175-4087-05 ",.01)
 ;;55175-4087-05
 ;;9002226.02101,"629,55175-4087-05 ",.02)
 ;;55175-4087-05
 ;;9002226.02101,"629,55175-4087-06 ",.01)
 ;;55175-4087-06
 ;;9002226.02101,"629,55175-4087-06 ",.02)
 ;;55175-4087-06
 ;;9002226.02101,"629,55175-4087-07 ",.01)
 ;;55175-4087-07
 ;;9002226.02101,"629,55175-4087-07 ",.02)
 ;;55175-4087-07
 ;;9002226.02101,"629,55175-4087-08 ",.01)
 ;;55175-4087-08
 ;;9002226.02101,"629,55175-4087-08 ",.02)
 ;;55175-4087-08
 ;;9002226.02101,"629,55175-4087-09 ",.01)
 ;;55175-4087-09
 ;;9002226.02101,"629,55175-4087-09 ",.02)
 ;;55175-4087-09
 ;;9002226.02101,"629,55175-4088-02 ",.01)
 ;;55175-4088-02
 ;;9002226.02101,"629,55175-4088-02 ",.02)
 ;;55175-4088-02
 ;;9002226.02101,"629,55175-4088-03 ",.01)
 ;;55175-4088-03
 ;;9002226.02101,"629,55175-4088-03 ",.02)
 ;;55175-4088-03
 ;;9002226.02101,"629,55175-4088-04 ",.01)
 ;;55175-4088-04
 ;;9002226.02101,"629,55175-4088-04 ",.02)
 ;;55175-4088-04
 ;;9002226.02101,"629,55175-4088-05 ",.01)
 ;;55175-4088-05
 ;;9002226.02101,"629,55175-4088-05 ",.02)
 ;;55175-4088-05
 ;;9002226.02101,"629,55175-5180-03 ",.01)
 ;;55175-5180-03
 ;;9002226.02101,"629,55175-5180-03 ",.02)
 ;;55175-5180-03
 ;;9002226.02101,"629,55289-0017-20 ",.01)
 ;;55289-0017-20
 ;;9002226.02101,"629,55289-0017-20 ",.02)
 ;;55289-0017-20
 ;;9002226.02101,"629,55289-0017-40 ",.01)
 ;;55289-0017-40
 ;;9002226.02101,"629,55289-0017-40 ",.02)
 ;;55289-0017-40
 ;;9002226.02101,"629,55289-0049-01 ",.01)
 ;;55289-0049-01
 ;;9002226.02101,"629,55289-0049-01 ",.02)
 ;;55289-0049-01
 ;;9002226.02101,"629,55289-0049-10 ",.01)
 ;;55289-0049-10
 ;;9002226.02101,"629,55289-0049-10 ",.02)
 ;;55289-0049-10
 ;;9002226.02101,"629,55289-0049-14 ",.01)
 ;;55289-0049-14
 ;;9002226.02101,"629,55289-0049-14 ",.02)
 ;;55289-0049-14
 ;;9002226.02101,"629,55289-0049-15 ",.01)
 ;;55289-0049-15
 ;;9002226.02101,"629,55289-0049-15 ",.02)
 ;;55289-0049-15
 ;;9002226.02101,"629,55289-0049-20 ",.01)
 ;;55289-0049-20
 ;;9002226.02101,"629,55289-0049-20 ",.02)
 ;;55289-0049-20
 ;;9002226.02101,"629,55289-0049-21 ",.01)
 ;;55289-0049-21
 ;;9002226.02101,"629,55289-0049-21 ",.02)
 ;;55289-0049-21
 ;;9002226.02101,"629,55289-0049-24 ",.01)
 ;;55289-0049-24
 ;;9002226.02101,"629,55289-0049-24 ",.02)
 ;;55289-0049-24
 ;;9002226.02101,"629,55289-0049-30 ",.01)
 ;;55289-0049-30
 ;;9002226.02101,"629,55289-0049-30 ",.02)
 ;;55289-0049-30
 ;;9002226.02101,"629,55289-0049-40 ",.01)
 ;;55289-0049-40
 ;;9002226.02101,"629,55289-0049-40 ",.02)
 ;;55289-0049-40
 ;;9002226.02101,"629,55289-0049-60 ",.01)
 ;;55289-0049-60
 ;;9002226.02101,"629,55289-0049-60 ",.02)
 ;;55289-0049-60
 ;;9002226.02101,"629,55289-0049-90 ",.01)
 ;;55289-0049-90
 ;;9002226.02101,"629,55289-0049-90 ",.02)
 ;;55289-0049-90
 ;;9002226.02101,"629,55289-0115-15 ",.01)
 ;;55289-0115-15
 ;;9002226.02101,"629,55289-0115-15 ",.02)
 ;;55289-0115-15
 ;;9002226.02101,"629,55289-0115-21 ",.01)
 ;;55289-0115-21
 ;;9002226.02101,"629,55289-0115-21 ",.02)
 ;;55289-0115-21
 ;;9002226.02101,"629,55289-0115-30 ",.01)
 ;;55289-0115-30
 ;;9002226.02101,"629,55289-0115-30 ",.02)
 ;;55289-0115-30
 ;;9002226.02101,"629,55289-0128-01 ",.01)
 ;;55289-0128-01
 ;;9002226.02101,"629,55289-0128-01 ",.02)
 ;;55289-0128-01
 ;;9002226.02101,"629,55289-0128-30 ",.01)
 ;;55289-0128-30
 ;;9002226.02101,"629,55289-0128-30 ",.02)
 ;;55289-0128-30
 ;;9002226.02101,"629,55289-0164-01 ",.01)
 ;;55289-0164-01
 ;;9002226.02101,"629,55289-0164-01 ",.02)
 ;;55289-0164-01
 ;;9002226.02101,"629,55289-0164-10 ",.01)
 ;;55289-0164-10
 ;;9002226.02101,"629,55289-0164-10 ",.02)
 ;;55289-0164-10
 ;;9002226.02101,"629,55289-0164-15 ",.01)
 ;;55289-0164-15
 ;;9002226.02101,"629,55289-0164-15 ",.02)
 ;;55289-0164-15
 ;;9002226.02101,"629,55289-0164-20 ",.01)
 ;;55289-0164-20
 ;;9002226.02101,"629,55289-0164-20 ",.02)
 ;;55289-0164-20
 ;;9002226.02101,"629,55289-0164-24 ",.01)
 ;;55289-0164-24
 ;;9002226.02101,"629,55289-0164-24 ",.02)
 ;;55289-0164-24
 ;;9002226.02101,"629,55289-0164-28 ",.01)
 ;;55289-0164-28
 ;;9002226.02101,"629,55289-0164-28 ",.02)
 ;;55289-0164-28
 ;;9002226.02101,"629,55289-0164-30 ",.01)
 ;;55289-0164-30
 ;;9002226.02101,"629,55289-0164-30 ",.02)
 ;;55289-0164-30
 ;;9002226.02101,"629,55289-0164-40 ",.01)
 ;;55289-0164-40
 ;;9002226.02101,"629,55289-0164-40 ",.02)
 ;;55289-0164-40
 ;;9002226.02101,"629,55289-0164-60 ",.01)
 ;;55289-0164-60
 ;;9002226.02101,"629,55289-0164-60 ",.02)
 ;;55289-0164-60
 ;;9002226.02101,"629,55289-0316-20 ",.01)
 ;;55289-0316-20
 ;;9002226.02101,"629,55289-0316-20 ",.02)
 ;;55289-0316-20
 ;;9002226.02101,"629,55289-0316-25 ",.01)
 ;;55289-0316-25
 ;;9002226.02101,"629,55289-0316-25 ",.02)
 ;;55289-0316-25
 ;;9002226.02101,"629,55289-0316-30 ",.01)
 ;;55289-0316-30
 ;;9002226.02101,"629,55289-0316-30 ",.02)
 ;;55289-0316-30
 ;;9002226.02101,"629,55289-0316-40 ",.01)
 ;;55289-0316-40
 ;;9002226.02101,"629,55289-0316-40 ",.02)
 ;;55289-0316-40
 ;;9002226.02101,"629,55289-0316-56 ",.01)
 ;;55289-0316-56
 ;;9002226.02101,"629,55289-0316-56 ",.02)
 ;;55289-0316-56
 ;;9002226.02101,"629,55289-0316-60 ",.01)
 ;;55289-0316-60
 ;;9002226.02101,"629,55289-0316-60 ",.02)
 ;;55289-0316-60
 ;;9002226.02101,"629,55289-0376-20 ",.01)
 ;;55289-0376-20
 ;;9002226.02101,"629,55289-0376-20 ",.02)
 ;;55289-0376-20
 ;;9002226.02101,"629,55289-0376-40 ",.01)
 ;;55289-0376-40
 ;;9002226.02101,"629,55289-0376-40 ",.02)
 ;;55289-0376-40
 ;;9002226.02101,"629,55289-0496-30 ",.01)
 ;;55289-0496-30
 ;;9002226.02101,"629,55289-0496-30 ",.02)
 ;;55289-0496-30
 ;;9002226.02101,"629,55289-0567-10 ",.01)
 ;;55289-0567-10
 ;;9002226.02101,"629,55289-0567-10 ",.02)
 ;;55289-0567-10
 ;;9002226.02101,"629,55289-0567-12 ",.01)
 ;;55289-0567-12
 ;;9002226.02101,"629,55289-0567-12 ",.02)
 ;;55289-0567-12
 ;;9002226.02101,"629,55289-0567-14 ",.01)
 ;;55289-0567-14
 ;;9002226.02101,"629,55289-0567-14 ",.02)
 ;;55289-0567-14
 ;;9002226.02101,"629,55289-0567-15 ",.01)
 ;;55289-0567-15
 ;;9002226.02101,"629,55289-0567-15 ",.02)
 ;;55289-0567-15
 ;;9002226.02101,"629,55289-0567-17 ",.01)
 ;;55289-0567-17
 ;;9002226.02101,"629,55289-0567-17 ",.02)
 ;;55289-0567-17
 ;;9002226.02101,"629,55289-0567-18 ",.01)
 ;;55289-0567-18
 ;;9002226.02101,"629,55289-0567-18 ",.02)
 ;;55289-0567-18
 ;;9002226.02101,"629,55289-0567-20 ",.01)
 ;;55289-0567-20
 ;;9002226.02101,"629,55289-0567-20 ",.02)
 ;;55289-0567-20
 ;;9002226.02101,"629,55289-0567-21 ",.01)
 ;;55289-0567-21
 ;;9002226.02101,"629,55289-0567-21 ",.02)
 ;;55289-0567-21
 ;;9002226.02101,"629,55289-0567-30 ",.01)
 ;;55289-0567-30
 ;;9002226.02101,"629,55289-0567-30 ",.02)
 ;;55289-0567-30
 ;;9002226.02101,"629,55289-0567-42 ",.01)
 ;;55289-0567-42
 ;;9002226.02101,"629,55289-0567-42 ",.02)
 ;;55289-0567-42
 ;;9002226.02101,"629,55289-0567-60 ",.01)
 ;;55289-0567-60
 ;;9002226.02101,"629,55289-0567-60 ",.02)
 ;;55289-0567-60
 ;;9002226.02101,"629,55289-0567-90 ",.01)
 ;;55289-0567-90
 ;;9002226.02101,"629,55289-0567-90 ",.02)
 ;;55289-0567-90
 ;;9002226.02101,"629,55289-0578-20 ",.01)
 ;;55289-0578-20
 ;;9002226.02101,"629,55289-0578-20 ",.02)
 ;;55289-0578-20
 ;;9002226.02101,"629,55289-0578-40 ",.01)
 ;;55289-0578-40
 ;;9002226.02101,"629,55289-0578-40 ",.02)
 ;;55289-0578-40
 ;;9002226.02101,"629,55289-0633-08 ",.01)
 ;;55289-0633-08
 ;;9002226.02101,"629,55289-0633-08 ",.02)
 ;;55289-0633-08
 ;;9002226.02101,"629,55289-0633-10 ",.01)
 ;;55289-0633-10
 ;;9002226.02101,"629,55289-0633-10 ",.02)
 ;;55289-0633-10
 ;;9002226.02101,"629,55289-0633-17 ",.01)
 ;;55289-0633-17
 ;;9002226.02101,"629,55289-0633-17 ",.02)
 ;;55289-0633-17
 ;;9002226.02101,"629,55289-0633-20 ",.01)
 ;;55289-0633-20
 ;;9002226.02101,"629,55289-0633-20 ",.02)
 ;;55289-0633-20
 ;;9002226.02101,"629,55289-0633-24 ",.01)
 ;;55289-0633-24
 ;;9002226.02101,"629,55289-0633-24 ",.02)
 ;;55289-0633-24
 ;;9002226.02101,"629,55289-0633-28 ",.01)
 ;;55289-0633-28
 ;;9002226.02101,"629,55289-0633-28 ",.02)
 ;;55289-0633-28
 ;;9002226.02101,"629,55289-0633-30 ",.01)
 ;;55289-0633-30
 ;;9002226.02101,"629,55289-0633-30 ",.02)
 ;;55289-0633-30
 ;;9002226.02101,"629,55289-0633-40 ",.01)
 ;;55289-0633-40
 ;;9002226.02101,"629,55289-0633-40 ",.02)
 ;;55289-0633-40
 ;;9002226.02101,"629,55289-0633-97 ",.01)
 ;;55289-0633-97
 ;;9002226.02101,"629,55289-0633-97 ",.02)
 ;;55289-0633-97
 ;;9002226.02101,"629,55289-0646-14 ",.01)
 ;;55289-0646-14
 ;;9002226.02101,"629,55289-0646-14 ",.02)
 ;;55289-0646-14
 ;;9002226.02101,"629,55289-0646-15 ",.01)
 ;;55289-0646-15
 ;;9002226.02101,"629,55289-0646-15 ",.02)
 ;;55289-0646-15
 ;;9002226.02101,"629,55289-0646-20 ",.01)
 ;;55289-0646-20
 ;;9002226.02101,"629,55289-0646-20 ",.02)
 ;;55289-0646-20
 ;;9002226.02101,"629,55289-0670-01 ",.01)
 ;;55289-0670-01
 ;;9002226.02101,"629,55289-0670-01 ",.02)
 ;;55289-0670-01
 ;;9002226.02101,"629,55289-0670-10 ",.01)
 ;;55289-0670-10
 ;;9002226.02101,"629,55289-0670-10 ",.02)
 ;;55289-0670-10
 ;;9002226.02101,"629,55289-0670-14 ",.01)
 ;;55289-0670-14
 ;;9002226.02101,"629,55289-0670-14 ",.02)
 ;;55289-0670-14
 ;;9002226.02101,"629,55289-0670-20 ",.01)
 ;;55289-0670-20
 ;;9002226.02101,"629,55289-0670-20 ",.02)
 ;;55289-0670-20
 ;;9002226.02101,"629,55289-0670-28 ",.01)
 ;;55289-0670-28
 ;;9002226.02101,"629,55289-0670-28 ",.02)
 ;;55289-0670-28
 ;;9002226.02101,"629,55289-0670-40 ",.01)
 ;;55289-0670-40
 ;;9002226.02101,"629,55289-0670-40 ",.02)
 ;;55289-0670-40
 ;;9002226.02101,"629,55289-0695-28 ",.01)
 ;;55289-0695-28
 ;;9002226.02101,"629,55289-0695-28 ",.02)
 ;;55289-0695-28
 ;;9002226.02101,"629,55289-0695-40 ",.01)
 ;;55289-0695-40
 ;;9002226.02101,"629,55289-0695-40 ",.02)
 ;;55289-0695-40
 ;;9002226.02101,"629,55289-0736-10 ",.01)
 ;;55289-0736-10
 ;;9002226.02101,"629,55289-0736-10 ",.02)
 ;;55289-0736-10
 ;;9002226.02101,"629,55289-0736-20 ",.01)
 ;;55289-0736-20
 ;;9002226.02101,"629,55289-0736-20 ",.02)
 ;;55289-0736-20
 ;;9002226.02101,"629,55289-0736-30 ",.01)
 ;;55289-0736-30
 ;;9002226.02101,"629,55289-0736-30 ",.02)
 ;;55289-0736-30
 ;;9002226.02101,"629,55289-0745-10 ",.01)
 ;;55289-0745-10
 ;;9002226.02101,"629,55289-0745-10 ",.02)
 ;;55289-0745-10
 ;;9002226.02101,"629,55289-0846-20 ",.01)
 ;;55289-0846-20
 ;;9002226.02101,"629,55289-0846-20 ",.02)
 ;;55289-0846-20
 ;;9002226.02101,"629,55289-0877-14 ",.01)
 ;;55289-0877-14
 ;;9002226.02101,"629,55289-0877-14 ",.02)
 ;;55289-0877-14
 ;;9002226.02101,"629,55289-0888-24 ",.01)
 ;;55289-0888-24
 ;;9002226.02101,"629,55289-0888-24 ",.02)
 ;;55289-0888-24
 ;;9002226.02101,"629,55370-0801-08 ",.01)
 ;;55370-0801-08
 ;;9002226.02101,"629,55370-0801-08 ",.02)
 ;;55370-0801-08
 ;;9002226.02101,"629,55390-0059-10 ",.01)
 ;;55390-0059-10
 ;;9002226.02101,"629,55390-0059-10 ",.02)
 ;;55390-0059-10
 ;;9002226.02101,"629,55553-0129-10 ",.01)
 ;;55553-0129-10
 ;;9002226.02101,"629,55553-0129-10 ",.02)
 ;;55553-0129-10
 ;;9002226.02101,"629,55829-0372-10 ",.01)
 ;;55829-0372-10
 ;;9002226.02101,"629,55829-0372-10 ",.02)
 ;;55829-0372-10
 ;;9002226.02101,"629,55887-0435-15 ",.01)
 ;;55887-0435-15
 ;;9002226.02101,"629,55887-0435-15 ",.02)
 ;;55887-0435-15
 ;;9002226.02101,"629,55887-0435-20 ",.01)
 ;;55887-0435-20
 ;;9002226.02101,"629,55887-0435-20 ",.02)
 ;;55887-0435-20
 ;;9002226.02101,"629,55887-0435-30 ",.01)
 ;;55887-0435-30
 ;;9002226.02101,"629,55887-0435-30 ",.02)
 ;;55887-0435-30
 ;;9002226.02101,"629,55887-0435-60 ",.01)
 ;;55887-0435-60
 ;;9002226.02101,"629,55887-0435-60 ",.02)
 ;;55887-0435-60
 ;;9002226.02101,"629,55887-0435-82 ",.01)
 ;;55887-0435-82
 ;;9002226.02101,"629,55887-0435-82 ",.02)
 ;;55887-0435-82
 ;;9002226.02101,"629,55887-0435-90 ",.01)
 ;;55887-0435-90
 ;;9002226.02101,"629,55887-0435-90 ",.02)
 ;;55887-0435-90
 ;;9002226.02101,"629,55887-0631-20 ",.01)
 ;;55887-0631-20
 ;;9002226.02101,"629,55887-0631-20 ",.02)
 ;;55887-0631-20
 ;;9002226.02101,"629,55887-0631-30 ",.01)
 ;;55887-0631-30
 ;;9002226.02101,"629,55887-0631-30 ",.02)
 ;;55887-0631-30
 ;;9002226.02101,"629,55887-0631-60 ",.01)
 ;;55887-0631-60
 ;;9002226.02101,"629,55887-0631-60 ",.02)
 ;;55887-0631-60
 ;;9002226.02101,"629,55887-0631-82 ",.01)
 ;;55887-0631-82
 ;;9002226.02101,"629,55887-0631-82 ",.02)
 ;;55887-0631-82
 ;;9002226.02101,"629,55887-0631-90 ",.01)
 ;;55887-0631-90
 ;;9002226.02101,"629,55887-0631-90 ",.02)
 ;;55887-0631-90
 ;;9002226.02101,"629,55887-0670-12 ",.01)
 ;;55887-0670-12
 ;;9002226.02101,"629,55887-0670-12 ",.02)
 ;;55887-0670-12
