BGP14F6 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1108,55289-0259-60 ",.01)
 ;;55289-0259-60
 ;;9002226.02101,"1108,55289-0259-60 ",.02)
 ;;55289-0259-60
 ;;9002226.02101,"1108,55289-0260-01 ",.01)
 ;;55289-0260-01
 ;;9002226.02101,"1108,55289-0260-01 ",.02)
 ;;55289-0260-01
 ;;9002226.02101,"1108,55289-0260-06 ",.01)
 ;;55289-0260-06
 ;;9002226.02101,"1108,55289-0260-06 ",.02)
 ;;55289-0260-06
 ;;9002226.02101,"1108,55289-0260-20 ",.01)
 ;;55289-0260-20
 ;;9002226.02101,"1108,55289-0260-20 ",.02)
 ;;55289-0260-20
 ;;9002226.02101,"1108,55289-0260-30 ",.01)
 ;;55289-0260-30
 ;;9002226.02101,"1108,55289-0260-30 ",.02)
 ;;55289-0260-30
 ;;9002226.02101,"1108,55289-0260-60 ",.01)
 ;;55289-0260-60
 ;;9002226.02101,"1108,55289-0260-60 ",.02)
 ;;55289-0260-60
 ;;9002226.02101,"1108,55289-0260-97 ",.01)
 ;;55289-0260-97
 ;;9002226.02101,"1108,55289-0260-97 ",.02)
 ;;55289-0260-97
 ;;9002226.02101,"1108,55289-0317-30 ",.01)
 ;;55289-0317-30
 ;;9002226.02101,"1108,55289-0317-30 ",.02)
 ;;55289-0317-30
 ;;9002226.02101,"1108,55289-0317-60 ",.01)
 ;;55289-0317-60
 ;;9002226.02101,"1108,55289-0317-60 ",.02)
 ;;55289-0317-60
 ;;9002226.02101,"1108,55289-0751-30 ",.01)
 ;;55289-0751-30
 ;;9002226.02101,"1108,55289-0751-30 ",.02)
 ;;55289-0751-30
 ;;9002226.02101,"1108,55289-0751-60 ",.01)
 ;;55289-0751-60
 ;;9002226.02101,"1108,55289-0751-60 ",.02)
 ;;55289-0751-60
 ;;9002226.02101,"1108,55289-0785-30 ",.01)
 ;;55289-0785-30
 ;;9002226.02101,"1108,55289-0785-30 ",.02)
 ;;55289-0785-30
 ;;9002226.02101,"1108,55289-0785-60 ",.01)
 ;;55289-0785-60
 ;;9002226.02101,"1108,55289-0785-60 ",.02)
 ;;55289-0785-60
 ;;9002226.02101,"1108,55289-0788-60 ",.01)
 ;;55289-0788-60
 ;;9002226.02101,"1108,55289-0788-60 ",.02)
 ;;55289-0788-60
 ;;9002226.02101,"1108,55289-0789-30 ",.01)
 ;;55289-0789-30
 ;;9002226.02101,"1108,55289-0789-30 ",.02)
 ;;55289-0789-30
 ;;9002226.02101,"1108,55289-0961-15 ",.01)
 ;;55289-0961-15
 ;;9002226.02101,"1108,55289-0961-15 ",.02)
 ;;55289-0961-15
 ;;9002226.02101,"1108,55289-0961-30 ",.01)
 ;;55289-0961-30
 ;;9002226.02101,"1108,55289-0961-30 ",.02)
 ;;55289-0961-30
 ;;9002226.02101,"1108,55289-0989-21 ",.01)
 ;;55289-0989-21
 ;;9002226.02101,"1108,55289-0989-21 ",.02)
 ;;55289-0989-21
 ;;9002226.02101,"1108,55289-0989-30 ",.01)
 ;;55289-0989-30
 ;;9002226.02101,"1108,55289-0989-30 ",.02)
 ;;55289-0989-30
 ;;9002226.02101,"1108,55289-0990-21 ",.01)
 ;;55289-0990-21
 ;;9002226.02101,"1108,55289-0990-21 ",.02)
 ;;55289-0990-21
 ;;9002226.02101,"1108,55289-0990-30 ",.01)
 ;;55289-0990-30
 ;;9002226.02101,"1108,55289-0990-30 ",.02)
 ;;55289-0990-30
 ;;9002226.02101,"1108,55887-0079-60 ",.01)
 ;;55887-0079-60
 ;;9002226.02101,"1108,55887-0079-60 ",.02)
 ;;55887-0079-60
 ;;9002226.02101,"1108,55887-0120-90 ",.01)
 ;;55887-0120-90
 ;;9002226.02101,"1108,55887-0120-90 ",.02)
 ;;55887-0120-90
 ;;9002226.02101,"1108,55887-0726-20 ",.01)
 ;;55887-0726-20
 ;;9002226.02101,"1108,55887-0726-20 ",.02)
 ;;55887-0726-20
 ;;9002226.02101,"1108,57866-4651-02 ",.01)
 ;;57866-4651-02
 ;;9002226.02101,"1108,57866-4651-02 ",.02)
 ;;57866-4651-02
 ;;9002226.02101,"1108,57866-4652-02 ",.01)
 ;;57866-4652-02
 ;;9002226.02101,"1108,57866-4652-02 ",.02)
 ;;57866-4652-02
 ;;9002226.02101,"1108,57866-4653-01 ",.01)
 ;;57866-4653-01
 ;;9002226.02101,"1108,57866-4653-01 ",.02)
 ;;57866-4653-01
 ;;9002226.02101,"1108,58016-4604-01 ",.01)
 ;;58016-4604-01
 ;;9002226.02101,"1108,58016-4604-01 ",.02)
 ;;58016-4604-01
 ;;9002226.02101,"1108,58016-4812-01 ",.01)
 ;;58016-4812-01
 ;;9002226.02101,"1108,58016-4812-01 ",.02)
 ;;58016-4812-01
 ;;9002226.02101,"1108,58016-4813-01 ",.01)
 ;;58016-4813-01
 ;;9002226.02101,"1108,58016-4813-01 ",.02)
 ;;58016-4813-01
 ;;9002226.02101,"1108,58864-0501-17 ",.01)
 ;;58864-0501-17
 ;;9002226.02101,"1108,58864-0501-17 ",.02)
 ;;58864-0501-17
 ;;9002226.02101,"1108,58864-0658-30 ",.01)
 ;;58864-0658-30
 ;;9002226.02101,"1108,58864-0658-30 ",.02)
 ;;58864-0658-30
 ;;9002226.02101,"1108,58864-0694-30 ",.01)
 ;;58864-0694-30
 ;;9002226.02101,"1108,58864-0694-30 ",.02)
 ;;58864-0694-30
 ;;9002226.02101,"1108,59310-0175-40 ",.01)
 ;;59310-0175-40
 ;;9002226.02101,"1108,59310-0175-40 ",.02)
 ;;59310-0175-40
 ;;9002226.02101,"1108,59310-0177-80 ",.01)
 ;;59310-0177-80
 ;;9002226.02101,"1108,59310-0177-80 ",.02)
 ;;59310-0177-80
 ;;9002226.02101,"1108,59930-1507-01 ",.01)
 ;;59930-1507-01
 ;;9002226.02101,"1108,59930-1507-01 ",.02)
 ;;59930-1507-01
 ;;9002226.02101,"1108,59930-1507-02 ",.01)
 ;;59930-1507-02
 ;;9002226.02101,"1108,59930-1507-02 ",.02)
 ;;59930-1507-02
 ;;9002226.02101,"1108,59930-1608-01 ",.01)
 ;;59930-1608-01
 ;;9002226.02101,"1108,59930-1608-01 ",.02)
 ;;59930-1608-01
 ;;9002226.02101,"1108,60346-0596-00 ",.01)
 ;;60346-0596-00
 ;;9002226.02101,"1108,60346-0596-00 ",.02)
 ;;60346-0596-00
 ;;9002226.02101,"1108,60346-0596-06 ",.01)
 ;;60346-0596-06
 ;;9002226.02101,"1108,60346-0596-06 ",.02)
 ;;60346-0596-06
 ;;9002226.02101,"1108,60346-0596-14 ",.01)
 ;;60346-0596-14
 ;;9002226.02101,"1108,60346-0596-14 ",.02)
 ;;60346-0596-14
 ;;9002226.02101,"1108,60346-0596-20 ",.01)
 ;;60346-0596-20
 ;;9002226.02101,"1108,60346-0596-20 ",.02)
 ;;60346-0596-20
 ;;9002226.02101,"1108,60346-0596-25 ",.01)
 ;;60346-0596-25
 ;;9002226.02101,"1108,60346-0596-25 ",.02)
 ;;60346-0596-25
 ;;9002226.02101,"1108,60346-0596-30 ",.01)
 ;;60346-0596-30
 ;;9002226.02101,"1108,60346-0596-30 ",.02)
 ;;60346-0596-30
 ;;9002226.02101,"1108,60346-0596-60 ",.01)
 ;;60346-0596-60
 ;;9002226.02101,"1108,60346-0596-60 ",.02)
 ;;60346-0596-60
 ;;9002226.02101,"1108,60346-0596-90 ",.01)
 ;;60346-0596-90
 ;;9002226.02101,"1108,60346-0596-90 ",.02)
 ;;60346-0596-90
 ;;9002226.02101,"1108,60346-0669-00 ",.01)
 ;;60346-0669-00
 ;;9002226.02101,"1108,60346-0669-00 ",.02)
 ;;60346-0669-00
 ;;9002226.02101,"1108,60346-0669-20 ",.01)
 ;;60346-0669-20
 ;;9002226.02101,"1108,60346-0669-20 ",.02)
 ;;60346-0669-20
 ;;9002226.02101,"1108,60346-0669-30 ",.01)
 ;;60346-0669-30
 ;;9002226.02101,"1108,60346-0669-30 ",.02)
 ;;60346-0669-30
 ;;9002226.02101,"1108,60346-0669-44 ",.01)
 ;;60346-0669-44
 ;;9002226.02101,"1108,60346-0669-44 ",.02)
 ;;60346-0669-44
 ;;9002226.02101,"1108,60346-0669-60 ",.01)
 ;;60346-0669-60
 ;;9002226.02101,"1108,60346-0669-60 ",.02)
 ;;60346-0669-60
 ;;9002226.02101,"1108,60346-0669-90 ",.01)
 ;;60346-0669-90
 ;;9002226.02101,"1108,60346-0669-90 ",.02)
 ;;60346-0669-90
 ;;9002226.02101,"1108,60346-0713-30 ",.01)
 ;;60346-0713-30
 ;;9002226.02101,"1108,60346-0713-30 ",.02)
 ;;60346-0713-30
 ;;9002226.02101,"1108,60346-0713-60 ",.01)
 ;;60346-0713-60
 ;;9002226.02101,"1108,60346-0713-60 ",.02)
 ;;60346-0713-60
 ;;9002226.02101,"1108,60346-0717-30 ",.01)
 ;;60346-0717-30
 ;;9002226.02101,"1108,60346-0717-30 ",.02)
 ;;60346-0717-30
 ;;9002226.02101,"1108,60598-0061-60 ",.01)
 ;;60598-0061-60
 ;;9002226.02101,"1108,60598-0061-60 ",.02)
 ;;60598-0061-60
 ;;9002226.02101,"1108,60793-0011-08 ",.01)
 ;;60793-0011-08
 ;;9002226.02101,"1108,60793-0011-08 ",.02)
 ;;60793-0011-08
 ;;9002226.02101,"1108,60793-0011-14 ",.01)
 ;;60793-0011-14
 ;;9002226.02101,"1108,60793-0011-14 ",.02)
 ;;60793-0011-14
 ;;9002226.02101,"1108,60793-0120-01 ",.01)
 ;;60793-0120-01
 ;;9002226.02101,"1108,60793-0120-01 ",.02)
 ;;60793-0120-01
 ;;9002226.02101,"1108,61570-0019-01 ",.01)
 ;;61570-0019-01
 ;;9002226.02101,"1108,61570-0019-01 ",.02)
 ;;61570-0019-01
 ;;9002226.02101,"1108,63402-0711-01 ",.01)
 ;;63402-0711-01
 ;;9002226.02101,"1108,63402-0711-01 ",.02)
 ;;63402-0711-01
 ;;9002226.02101,"1108,63402-0712-01 ",.01)
 ;;63402-0712-01
 ;;9002226.02101,"1108,63402-0712-01 ",.02)
 ;;63402-0712-01
 ;;9002226.02101,"1108,63629-1639-01 ",.01)
 ;;63629-1639-01
 ;;9002226.02101,"1108,63629-1639-01 ",.02)
 ;;63629-1639-01
 ;;9002226.02101,"1108,63629-1639-02 ",.01)
 ;;63629-1639-02
 ;;9002226.02101,"1108,63629-1639-02 ",.02)
 ;;63629-1639-02
 ;;9002226.02101,"1108,63629-1639-03 ",.01)
 ;;63629-1639-03
 ;;9002226.02101,"1108,63629-1639-03 ",.02)
 ;;63629-1639-03
 ;;9002226.02101,"1108,63629-2792-01 ",.01)
 ;;63629-2792-01
 ;;9002226.02101,"1108,63629-2792-01 ",.02)
 ;;63629-2792-01
 ;;9002226.02101,"1108,63629-2792-02 ",.01)
 ;;63629-2792-02
 ;;9002226.02101,"1108,63629-2792-02 ",.02)
 ;;63629-2792-02
 ;;9002226.02101,"1108,63629-3551-01 ",.01)
 ;;63629-3551-01
 ;;9002226.02101,"1108,63629-3551-01 ",.02)
 ;;63629-3551-01
 ;;9002226.02101,"1108,65162-0324-10 ",.01)
 ;;65162-0324-10
 ;;9002226.02101,"1108,65162-0324-10 ",.02)
 ;;65162-0324-10
 ;;9002226.02101,"1108,65162-0324-11 ",.01)
 ;;65162-0324-11
 ;;9002226.02101,"1108,65162-0324-11 ",.02)
 ;;65162-0324-11
 ;;9002226.02101,"1108,65162-0325-10 ",.01)
 ;;65162-0325-10
 ;;9002226.02101,"1108,65162-0325-10 ",.02)
 ;;65162-0325-10
 ;;9002226.02101,"1108,65162-0325-11 ",.01)
 ;;65162-0325-11
 ;;9002226.02101,"1108,65162-0325-11 ",.02)
 ;;65162-0325-11
 ;;9002226.02101,"1108,65162-0335-10 ",.01)
 ;;65162-0335-10
 ;;9002226.02101,"1108,65162-0335-10 ",.02)
 ;;65162-0335-10
 ;;9002226.02101,"1108,65243-0279-18 ",.01)
 ;;65243-0279-18
 ;;9002226.02101,"1108,65243-0279-18 ",.02)
 ;;65243-0279-18
 ;;9002226.02101,"1108,66105-0164-02 ",.01)
 ;;66105-0164-02
 ;;9002226.02101,"1108,66105-0164-02 ",.02)
 ;;66105-0164-02
 ;;9002226.02101,"1108,66105-0164-03 ",.01)
 ;;66105-0164-03
 ;;9002226.02101,"1108,66105-0164-03 ",.02)
 ;;66105-0164-03
 ;;9002226.02101,"1108,66105-0164-06 ",.01)
 ;;66105-0164-06
 ;;9002226.02101,"1108,66105-0164-06 ",.02)
 ;;66105-0164-06
 ;;9002226.02101,"1108,66105-0164-09 ",.01)
 ;;66105-0164-09
 ;;9002226.02101,"1108,66105-0164-09 ",.02)
 ;;66105-0164-09
 ;;9002226.02101,"1108,66105-0164-10 ",.01)
 ;;66105-0164-10
 ;;9002226.02101,"1108,66105-0164-10 ",.02)
 ;;66105-0164-10
 ;;9002226.02101,"1108,66267-1300-00 ",.01)
 ;;66267-1300-00
 ;;9002226.02101,"1108,66267-1300-00 ",.02)
 ;;66267-1300-00
 ;;9002226.02101,"1108,66336-0596-30 ",.01)
 ;;66336-0596-30
 ;;9002226.02101,"1108,66336-0596-30 ",.02)
 ;;66336-0596-30
 ;;9002226.02101,"1108,67781-0251-01 ",.01)
 ;;67781-0251-01
 ;;9002226.02101,"1108,67781-0251-01 ",.02)
 ;;67781-0251-01
 ;;9002226.02101,"1108,67781-0251-05 ",.01)
 ;;67781-0251-05
 ;;9002226.02101,"1108,67781-0251-05 ",.02)
 ;;67781-0251-05
 ;;9002226.02101,"1108,67781-0252-01 ",.01)
 ;;67781-0252-01
 ;;9002226.02101,"1108,67781-0252-01 ",.02)
 ;;67781-0252-01
 ;;9002226.02101,"1108,68115-0328-60 ",.01)
 ;;68115-0328-60
 ;;9002226.02101,"1108,68115-0328-60 ",.02)
 ;;68115-0328-60
 ;;9002226.02101,"1108,68115-0547-20 ",.01)
 ;;68115-0547-20
 ;;9002226.02101,"1108,68115-0547-20 ",.02)
 ;;68115-0547-20
 ;;9002226.02101,"1108,68115-0637-13 ",.01)
 ;;68115-0637-13
 ;;9002226.02101,"1108,68115-0637-13 ",.02)
 ;;68115-0637-13
 ;;9002226.02101,"1108,68115-0638-60 ",.01)
 ;;68115-0638-60
 ;;9002226.02101,"1108,68115-0638-60 ",.02)
 ;;68115-0638-60
 ;;9002226.02101,"1108,68115-0651-60 ",.01)
 ;;68115-0651-60
 ;;9002226.02101,"1108,68115-0651-60 ",.02)
 ;;68115-0651-60
 ;;9002226.02101,"1108,68115-0652-01 ",.01)
 ;;68115-0652-01
 ;;9002226.02101,"1108,68115-0652-01 ",.02)
 ;;68115-0652-01
 ;;9002226.02101,"1108,68115-0653-01 ",.01)
 ;;68115-0653-01
 ;;9002226.02101,"1108,68115-0653-01 ",.02)
 ;;68115-0653-01
 ;;9002226.02101,"1108,68115-0657-01 ",.01)
 ;;68115-0657-01
 ;;9002226.02101,"1108,68115-0657-01 ",.02)
 ;;68115-0657-01
 ;;9002226.02101,"1108,68115-0760-01 ",.01)
 ;;68115-0760-01
 ;;9002226.02101,"1108,68115-0760-01 ",.02)
 ;;68115-0760-01
 ;;9002226.02101,"1108,68115-0775-07 ",.01)
 ;;68115-0775-07
 ;;9002226.02101,"1108,68115-0775-07 ",.02)
 ;;68115-0775-07
 ;;9002226.02101,"1108,68115-0923-30 ",.01)
 ;;68115-0923-30
 ;;9002226.02101,"1108,68115-0923-30 ",.02)
 ;;68115-0923-30
 ;;9002226.02101,"1108,68115-0923-90 ",.01)
 ;;68115-0923-90
 ;;9002226.02101,"1108,68115-0923-90 ",.02)
 ;;68115-0923-90
 ;;9002226.02101,"1108,68115-0924-60 ",.01)
 ;;68115-0924-60
 ;;9002226.02101,"1108,68115-0924-60 ",.02)
 ;;68115-0924-60
 ;;9002226.02101,"1108,68258-3032-03 ",.01)
 ;;68258-3032-03
 ;;9002226.02101,"1108,68258-3032-03 ",.02)
 ;;68258-3032-03
 ;;9002226.02101,"1108,68258-3033-03 ",.01)
 ;;68258-3033-03
 ;;9002226.02101,"1108,68258-3033-03 ",.02)
 ;;68258-3033-03
 ;;9002226.02101,"1108,68462-0356-01 ",.01)
 ;;68462-0356-01
 ;;9002226.02101,"1108,68462-0356-01 ",.02)
 ;;68462-0356-01
 ;;9002226.02101,"1108,68462-0380-01 ",.01)
 ;;68462-0380-01
 ;;9002226.02101,"1108,68462-0380-01 ",.02)
 ;;68462-0380-01
 ;;9002226.02101,"1108,68734-0700-10 ",.01)
 ;;68734-0700-10
 ;;9002226.02101,"1108,68734-0700-10 ",.02)
 ;;68734-0700-10