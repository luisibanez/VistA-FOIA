BGP7LXJD ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON AUG 29, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"627,54569-0417-06 ",.02)
 ;;54569-0417-06
 ;;9002226.02101,"627,54569-0417-07 ",.01)
 ;;54569-0417-07
 ;;9002226.02101,"627,54569-0417-07 ",.02)
 ;;54569-0417-07
 ;;9002226.02101,"627,54569-0418-00 ",.01)
 ;;54569-0418-00
 ;;9002226.02101,"627,54569-0418-00 ",.02)
 ;;54569-0418-00
 ;;9002226.02101,"627,54569-0419-00 ",.01)
 ;;54569-0419-00
 ;;9002226.02101,"627,54569-0419-00 ",.02)
 ;;54569-0419-00
 ;;9002226.02101,"627,54569-0419-02 ",.01)
 ;;54569-0419-02
 ;;9002226.02101,"627,54569-0419-02 ",.02)
 ;;54569-0419-02
 ;;9002226.02101,"627,54569-0419-04 ",.01)
 ;;54569-0419-04
 ;;9002226.02101,"627,54569-0419-04 ",.02)
 ;;54569-0419-04
 ;;9002226.02101,"627,54569-0419-07 ",.01)
 ;;54569-0419-07
 ;;9002226.02101,"627,54569-0419-07 ",.02)
 ;;54569-0419-07
 ;;9002226.02101,"627,54569-2046-00 ",.01)
 ;;54569-2046-00
 ;;9002226.02101,"627,54569-2046-00 ",.02)
 ;;54569-2046-00
 ;;9002226.02101,"627,54868-0033-07 ",.01)
 ;;54868-0033-07
 ;;9002226.02101,"627,54868-0033-07 ",.02)
 ;;54868-0033-07
 ;;9002226.02101,"627,54868-0067-00 ",.01)
 ;;54868-0067-00
 ;;9002226.02101,"627,54868-0067-00 ",.02)
 ;;54868-0067-00
 ;;9002226.02101,"627,54868-0392-01 ",.01)
 ;;54868-0392-01
 ;;9002226.02101,"627,54868-0392-01 ",.02)
 ;;54868-0392-01
 ;;9002226.02101,"627,54868-3146-00 ",.01)
 ;;54868-3146-00
 ;;9002226.02101,"627,54868-3146-00 ",.02)
 ;;54868-3146-00
 ;;9002226.02101,"627,54902-0073-01 ",.01)
 ;;54902-0073-01
 ;;9002226.02101,"627,54902-0073-01 ",.02)
 ;;54902-0073-01
 ;;9002226.02101,"627,54902-0074-01 ",.01)
 ;;54902-0074-01
 ;;9002226.02101,"627,54902-0074-01 ",.02)
 ;;54902-0074-01
 ;;9002226.02101,"627,54902-0074-05 ",.01)
 ;;54902-0074-05
 ;;9002226.02101,"627,54902-0074-05 ",.02)
 ;;54902-0074-05
 ;;9002226.02101,"627,54902-0074-52 ",.01)
 ;;54902-0074-52
 ;;9002226.02101,"627,54902-0074-52 ",.02)
 ;;54902-0074-52
 ;;9002226.02101,"627,55045-2031-08 ",.01)
 ;;55045-2031-08
 ;;9002226.02101,"627,55045-2031-08 ",.02)
 ;;55045-2031-08
 ;;9002226.02101,"627,55045-2032-08 ",.01)
 ;;55045-2032-08
 ;;9002226.02101,"627,55045-2032-08 ",.02)
 ;;55045-2032-08
 ;;9002226.02101,"627,55053-0290-12 ",.01)
 ;;55053-0290-12
 ;;9002226.02101,"627,55053-0290-12 ",.02)
 ;;55053-0290-12
 ;;9002226.02101,"627,55053-0525-30 ",.01)
 ;;55053-0525-30
 ;;9002226.02101,"627,55053-0525-30 ",.02)
 ;;55053-0525-30
 ;;9002226.02101,"627,55289-0095-17 ",.01)
 ;;55289-0095-17
 ;;9002226.02101,"627,55289-0095-17 ",.02)
 ;;55289-0095-17
 ;;9002226.02101,"627,55289-0095-20 ",.01)
 ;;55289-0095-20
 ;;9002226.02101,"627,55289-0095-20 ",.02)
 ;;55289-0095-20
 ;;9002226.02101,"627,55289-0095-30 ",.01)
 ;;55289-0095-30
 ;;9002226.02101,"627,55289-0095-30 ",.02)
 ;;55289-0095-30
 ;;9002226.02101,"627,55289-0095-60 ",.01)
 ;;55289-0095-60
 ;;9002226.02101,"627,55289-0095-60 ",.02)
 ;;55289-0095-60
 ;;9002226.02101,"627,55289-0923-20 ",.01)
 ;;55289-0923-20
 ;;9002226.02101,"627,55289-0923-20 ",.02)
 ;;55289-0923-20
 ;;9002226.02101,"627,55289-0923-30 ",.01)
 ;;55289-0923-30
 ;;9002226.02101,"627,55289-0923-30 ",.02)
 ;;55289-0923-30
 ;;9002226.02101,"627,55370-0854-07 ",.01)
 ;;55370-0854-07
 ;;9002226.02101,"627,55370-0854-07 ",.02)
 ;;55370-0854-07
 ;;9002226.02101,"627,55370-0854-09 ",.01)
 ;;55370-0854-09
 ;;9002226.02101,"627,55370-0854-09 ",.02)
 ;;55370-0854-09
 ;;9002226.02101,"627,55370-0879-07 ",.01)
 ;;55370-0879-07
 ;;9002226.02101,"627,55370-0879-07 ",.02)
 ;;55370-0879-07
 ;;9002226.02101,"627,55370-0879-09 ",.01)
 ;;55370-0879-09
 ;;9002226.02101,"627,55370-0879-09 ",.02)
 ;;55370-0879-09
 ;;9002226.02101,"627,55370-0926-07 ",.01)
 ;;55370-0926-07
 ;;9002226.02101,"627,55370-0926-07 ",.02)
 ;;55370-0926-07
 ;;9002226.02101,"627,55370-0926-09 ",.01)
 ;;55370-0926-09
 ;;9002226.02101,"627,55370-0926-09 ",.02)
 ;;55370-0926-09
 ;;9002226.02101,"627,55390-0066-10 ",.01)
 ;;55390-0066-10
 ;;9002226.02101,"627,55390-0066-10 ",.02)
 ;;55390-0066-10
 ;;9002226.02101,"627,55887-0909-10 ",.01)
 ;;55887-0909-10
 ;;9002226.02101,"627,55887-0909-10 ",.02)
 ;;55887-0909-10
 ;;9002226.02101,"627,55887-0909-15 ",.01)
 ;;55887-0909-15
 ;;9002226.02101,"627,55887-0909-15 ",.02)
 ;;55887-0909-15
 ;;9002226.02101,"627,55887-0909-20 ",.01)
 ;;55887-0909-20
 ;;9002226.02101,"627,55887-0909-20 ",.02)
 ;;55887-0909-20
 ;;9002226.02101,"627,55887-0909-30 ",.01)
 ;;55887-0909-30
 ;;9002226.02101,"627,55887-0909-30 ",.02)
 ;;55887-0909-30
 ;;9002226.02101,"627,55887-0909-60 ",.01)
 ;;55887-0909-60
 ;;9002226.02101,"627,55887-0909-60 ",.02)
 ;;55887-0909-60
 ;;9002226.02101,"627,55887-0909-90 ",.01)
 ;;55887-0909-90
 ;;9002226.02101,"627,55887-0909-90 ",.02)
 ;;55887-0909-90
 ;;9002226.02101,"627,55953-0555-80 ",.01)
 ;;55953-0555-80
 ;;9002226.02101,"627,55953-0555-80 ",.02)
 ;;55953-0555-80
 ;;9002226.02101,"627,57866-0170-01 ",.01)
 ;;57866-0170-01
 ;;9002226.02101,"627,57866-0170-01 ",.02)
 ;;57866-0170-01
 ;;9002226.02101,"627,57866-3367-03 ",.01)
 ;;57866-3367-03
 ;;9002226.02101,"627,57866-3367-03 ",.02)
 ;;57866-3367-03
 ;;9002226.02101,"627,57866-3377-04 ",.01)
 ;;57866-3377-04
 ;;9002226.02101,"627,57866-3377-04 ",.02)
 ;;57866-3377-04
 ;;9002226.02101,"627,57866-3388-07 ",.01)
 ;;57866-3388-07
 ;;9002226.02101,"627,57866-3388-07 ",.02)
 ;;57866-3388-07
 ;;9002226.02101,"627,58016-0702-12 ",.01)
 ;;58016-0702-12
 ;;9002226.02101,"627,58016-0702-12 ",.02)
 ;;58016-0702-12
 ;;9002226.02101,"627,58016-0702-30 ",.01)
 ;;58016-0702-30
 ;;9002226.02101,"627,58016-0702-30 ",.02)
 ;;58016-0702-30
 ;;9002226.02101,"627,58016-0703-00 ",.01)
 ;;58016-0703-00
 ;;9002226.02101,"627,58016-0703-00 ",.02)
 ;;58016-0703-00
 ;;9002226.02101,"627,58016-0703-12 ",.01)
 ;;58016-0703-12
 ;;9002226.02101,"627,58016-0703-12 ",.02)
 ;;58016-0703-12
 ;;9002226.02101,"627,58016-0703-30 ",.01)
 ;;58016-0703-30
 ;;9002226.02101,"627,58016-0703-30 ",.02)
 ;;58016-0703-30
 ;;9002226.02101,"627,58634-0027-02 ",.01)
 ;;58634-0027-02
 ;;9002226.02101,"627,58634-0027-02 ",.02)
 ;;58634-0027-02
 ;;9002226.02101,"627,58634-0027-04 ",.01)
 ;;58634-0027-04
 ;;9002226.02101,"627,58634-0027-04 ",.02)
 ;;58634-0027-04
 ;;9002226.02101,"627,58634-0027-08 ",.01)
 ;;58634-0027-08
 ;;9002226.02101,"627,58634-0027-08 ",.02)
 ;;58634-0027-08
 ;;9002226.02101,"627,58914-0012-10 ",.01)
 ;;58914-0012-10
 ;;9002226.02101,"627,58914-0012-10 ",.02)
 ;;58914-0012-10
 ;;9002226.02101,"627,58914-0013-10 ",.01)
 ;;58914-0013-10
 ;;9002226.02101,"627,58914-0013-10 ",.02)
 ;;58914-0013-10
 ;;9002226.02101,"627,58914-0015-16 ",.01)
 ;;58914-0015-16
 ;;9002226.02101,"627,58914-0015-16 ",.02)
 ;;58914-0015-16
 ;;9002226.02101,"627,58914-0080-52 ",.01)
 ;;58914-0080-52
 ;;9002226.02101,"627,58914-0080-52 ",.02)
 ;;58914-0080-52
 ;;9002226.02101,"627,59492-0117-21 ",.01)
 ;;59492-0117-21
 ;;9002226.02101,"627,59492-0117-21 ",.02)
 ;;59492-0117-21
 ;;9002226.02101,"627,59741-0315-15 ",.01)
 ;;59741-0315-15
 ;;9002226.02101,"627,59741-0315-15 ",.02)
 ;;59741-0315-15
 ;;9002226.02101,"627,60104-4008-02 ",.01)
 ;;60104-4008-02
 ;;9002226.02101,"627,60104-4008-02 ",.02)
 ;;60104-4008-02
 ;;9002226.02101,"627,60104-4008-08 ",.01)
 ;;60104-4008-08
 ;;9002226.02101,"627,60104-4008-08 ",.02)
 ;;60104-4008-08
 ;;9002226.02101,"627,60346-0838-30 ",.01)
 ;;60346-0838-30
 ;;9002226.02101,"627,60346-0838-30 ",.02)
 ;;60346-0838-30
 ;;9002226.02101,"627,60346-0839-30 ",.01)
 ;;60346-0839-30
 ;;9002226.02101,"627,60346-0839-30 ",.02)
 ;;60346-0839-30
 ;;9002226.02101,"627,60346-0840-30 ",.01)
 ;;60346-0840-30
 ;;9002226.02101,"627,60346-0840-30 ",.02)
 ;;60346-0840-30
 ;;9002226.02101,"627,60951-0615-70 ",.01)
 ;;60951-0615-70
 ;;9002226.02101,"627,60951-0615-70 ",.02)
 ;;60951-0615-70
 ;;9002226.02101,"627,60951-0615-90 ",.01)
 ;;60951-0615-90
 ;;9002226.02101,"627,60951-0615-90 ",.02)
 ;;60951-0615-90
 ;;9002226.02101,"627,60951-0616-70 ",.01)
 ;;60951-0616-70
 ;;9002226.02101,"627,60951-0616-70 ",.02)
 ;;60951-0616-70
 ;;9002226.02101,"627,60951-0616-90 ",.01)
 ;;60951-0616-90
 ;;9002226.02101,"627,60951-0616-90 ",.02)
 ;;60951-0616-90
 ;;9002226.02101,"627,61392-0041-30 ",.01)
 ;;61392-0041-30
 ;;9002226.02101,"627,61392-0041-30 ",.02)
 ;;61392-0041-30
 ;;9002226.02101,"627,61392-0041-31 ",.01)
 ;;61392-0041-31
 ;;9002226.02101,"627,61392-0041-31 ",.02)
 ;;61392-0041-31
 ;;9002226.02101,"627,61392-0041-32 ",.01)
 ;;61392-0041-32
 ;;9002226.02101,"627,61392-0041-32 ",.02)
 ;;61392-0041-32
 ;;9002226.02101,"627,61392-0041-39 ",.01)
 ;;61392-0041-39
 ;;9002226.02101,"627,61392-0041-39 ",.02)
 ;;61392-0041-39
 ;;9002226.02101,"627,61392-0041-45 ",.01)
 ;;61392-0041-45
 ;;9002226.02101,"627,61392-0041-45 ",.02)
 ;;61392-0041-45
 ;;9002226.02101,"627,61392-0041-51 ",.01)
 ;;61392-0041-51
 ;;9002226.02101,"627,61392-0041-51 ",.02)
 ;;61392-0041-51
 ;;9002226.02101,"627,61392-0041-54 ",.01)
 ;;61392-0041-54
 ;;9002226.02101,"627,61392-0041-54 ",.02)
 ;;61392-0041-54
 ;;9002226.02101,"627,61392-0041-56 ",.01)
 ;;61392-0041-56
 ;;9002226.02101,"627,61392-0041-56 ",.02)
 ;;61392-0041-56
 ;;9002226.02101,"627,61392-0041-60 ",.01)
 ;;61392-0041-60
 ;;9002226.02101,"627,61392-0041-60 ",.02)
 ;;61392-0041-60
 ;;9002226.02101,"627,61392-0041-90 ",.01)
 ;;61392-0041-90
 ;;9002226.02101,"627,61392-0041-90 ",.02)
 ;;61392-0041-90
 ;;9002226.02101,"627,61392-0041-91 ",.01)
 ;;61392-0041-91
 ;;9002226.02101,"627,61392-0041-91 ",.02)
 ;;61392-0041-91
 ;;9002226.02101,"627,62584-0873-01 ",.01)
 ;;62584-0873-01
 ;;9002226.02101,"627,62584-0873-01 ",.02)
 ;;62584-0873-01
 ;;9002226.02101,"627,62584-0874-01 ",.01)
 ;;62584-0874-01
 ;;9002226.02101,"627,62584-0874-01 ",.02)
 ;;62584-0874-01
 ;;9002226.02101,"627,63868-0751-24 ",.01)
 ;;63868-0751-24
 ;;9002226.02101,"627,63868-0751-24 ",.02)
 ;;63868-0751-24
 ;;9002226.02101,"627,64899-0097-24 ",.01)
 ;;64899-0097-24
 ;;9002226.02101,"627,64899-0097-24 ",.02)
 ;;64899-0097-24
 ;;9002226.02101,"627,66267-0074-30 ",.01)
 ;;66267-0074-30
 ;;9002226.02101,"627,66267-0074-30 ",.02)
 ;;66267-0074-30
 ;;9002226.02101,"627,68115-0106-20 ",.01)
 ;;68115-0106-20
 ;;9002226.02101,"627,68115-0106-20 ",.02)
 ;;68115-0106-20
 ;;9002226.02101,"627,68115-0106-30 ",.01)
 ;;68115-0106-30
 ;;9002226.02101,"627,68115-0106-30 ",.02)
 ;;68115-0106-30
 ;;9002226.02101,"627,68115-0106-60 ",.01)
 ;;68115-0106-60
 ;;9002226.02101,"627,68115-0106-60 ",.02)
 ;;68115-0106-60
 ;;9002226.02101,"627,68115-0107-30 ",.01)
 ;;68115-0107-30
 ;;9002226.02101,"627,68115-0107-30 ",.02)
 ;;68115-0107-30
 ;;9002226.02101,"627,97807-0070-93 ",.01)
 ;;97807-0070-93
 ;;9002226.02101,"627,97807-0070-93 ",.02)
 ;;97807-0070-93
