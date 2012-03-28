BGP13V8 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"368,54868-4149-00 ",.02)
 ;;54868-4149-00
 ;;9002226.02101,"368,54868-4149-01 ",.01)
 ;;54868-4149-01
 ;;9002226.02101,"368,54868-4149-01 ",.02)
 ;;54868-4149-01
 ;;9002226.02101,"368,54868-4170-00 ",.01)
 ;;54868-4170-00
 ;;9002226.02101,"368,54868-4170-00 ",.02)
 ;;54868-4170-00
 ;;9002226.02101,"368,54868-4170-01 ",.01)
 ;;54868-4170-01
 ;;9002226.02101,"368,54868-4170-01 ",.02)
 ;;54868-4170-01
 ;;9002226.02101,"368,54868-4241-00 ",.01)
 ;;54868-4241-00
 ;;9002226.02101,"368,54868-4241-00 ",.02)
 ;;54868-4241-00
 ;;9002226.02101,"368,54868-4242-00 ",.01)
 ;;54868-4242-00
 ;;9002226.02101,"368,54868-4242-00 ",.02)
 ;;54868-4242-00
 ;;9002226.02101,"368,54868-4243-00 ",.01)
 ;;54868-4243-00
 ;;9002226.02101,"368,54868-4243-00 ",.02)
 ;;54868-4243-00
 ;;9002226.02101,"368,54868-4244-00 ",.01)
 ;;54868-4244-00
 ;;9002226.02101,"368,54868-4244-00 ",.02)
 ;;54868-4244-00
 ;;9002226.02101,"368,54868-4269-00 ",.01)
 ;;54868-4269-00
 ;;9002226.02101,"368,54868-4269-00 ",.02)
 ;;54868-4269-00
 ;;9002226.02101,"368,54868-4370-00 ",.01)
 ;;54868-4370-00
 ;;9002226.02101,"368,54868-4370-00 ",.02)
 ;;54868-4370-00
 ;;9002226.02101,"368,54868-4370-01 ",.01)
 ;;54868-4370-01
 ;;9002226.02101,"368,54868-4370-01 ",.02)
 ;;54868-4370-01
 ;;9002226.02101,"368,54868-4384-00 ",.01)
 ;;54868-4384-00
 ;;9002226.02101,"368,54868-4384-00 ",.02)
 ;;54868-4384-00
 ;;9002226.02101,"368,54868-4386-00 ",.01)
 ;;54868-4386-00
 ;;9002226.02101,"368,54868-4386-00 ",.02)
 ;;54868-4386-00
 ;;9002226.02101,"368,54868-4462-00 ",.01)
 ;;54868-4462-00
 ;;9002226.02101,"368,54868-4462-00 ",.02)
 ;;54868-4462-00
 ;;9002226.02101,"368,54868-4463-00 ",.01)
 ;;54868-4463-00
 ;;9002226.02101,"368,54868-4463-00 ",.02)
 ;;54868-4463-00
 ;;9002226.02101,"368,54868-4671-00 ",.01)
 ;;54868-4671-00
 ;;9002226.02101,"368,54868-4671-00 ",.02)
 ;;54868-4671-00
 ;;9002226.02101,"368,54868-4679-00 ",.01)
 ;;54868-4679-00
 ;;9002226.02101,"368,54868-4679-00 ",.02)
 ;;54868-4679-00
 ;;9002226.02101,"368,54868-4761-01 ",.01)
 ;;54868-4761-01
 ;;9002226.02101,"368,54868-4761-01 ",.02)
 ;;54868-4761-01
 ;;9002226.02101,"368,54868-4761-02 ",.01)
 ;;54868-4761-02
 ;;9002226.02101,"368,54868-4761-02 ",.02)
 ;;54868-4761-02
 ;;9002226.02101,"368,54868-4811-00 ",.01)
 ;;54868-4811-00
 ;;9002226.02101,"368,54868-4811-00 ",.02)
 ;;54868-4811-00
 ;;9002226.02101,"368,54868-4813-00 ",.01)
 ;;54868-4813-00
 ;;9002226.02101,"368,54868-4813-00 ",.02)
 ;;54868-4813-00
 ;;9002226.02101,"368,54868-4830-00 ",.01)
 ;;54868-4830-00
 ;;9002226.02101,"368,54868-4830-00 ",.02)
 ;;54868-4830-00
 ;;9002226.02101,"368,54868-4831-00 ",.01)
 ;;54868-4831-00
 ;;9002226.02101,"368,54868-4831-00 ",.02)
 ;;54868-4831-00
 ;;9002226.02101,"368,54868-4862-00 ",.01)
 ;;54868-4862-00
 ;;9002226.02101,"368,54868-4862-00 ",.02)
 ;;54868-4862-00
 ;;9002226.02101,"368,54868-4865-00 ",.01)
 ;;54868-4865-00
 ;;9002226.02101,"368,54868-4865-00 ",.02)
 ;;54868-4865-00
 ;;9002226.02101,"368,54868-4865-01 ",.01)
 ;;54868-4865-01
 ;;9002226.02101,"368,54868-4865-01 ",.02)
 ;;54868-4865-01
 ;;9002226.02101,"368,54868-4866-00 ",.01)
 ;;54868-4866-00
 ;;9002226.02101,"368,54868-4866-00 ",.02)
 ;;54868-4866-00
 ;;9002226.02101,"368,54868-4879-00 ",.01)
 ;;54868-4879-00
 ;;9002226.02101,"368,54868-4879-00 ",.02)
 ;;54868-4879-00
 ;;9002226.02101,"368,54868-4879-01 ",.01)
 ;;54868-4879-01
 ;;9002226.02101,"368,54868-4879-01 ",.02)
 ;;54868-4879-01
 ;;9002226.02101,"368,54868-4879-02 ",.01)
 ;;54868-4879-02
 ;;9002226.02101,"368,54868-4879-02 ",.02)
 ;;54868-4879-02
 ;;9002226.02101,"368,54868-4900-00 ",.01)
 ;;54868-4900-00
 ;;9002226.02101,"368,54868-4900-00 ",.02)
 ;;54868-4900-00
 ;;9002226.02101,"368,54868-4901-00 ",.01)
 ;;54868-4901-00
 ;;9002226.02101,"368,54868-4901-00 ",.02)
 ;;54868-4901-00
 ;;9002226.02101,"368,54868-4920-00 ",.01)
 ;;54868-4920-00
 ;;9002226.02101,"368,54868-4920-00 ",.02)
 ;;54868-4920-00
 ;;9002226.02101,"368,54868-5008-00 ",.01)
 ;;54868-5008-00
 ;;9002226.02101,"368,54868-5008-00 ",.02)
 ;;54868-5008-00
 ;;9002226.02101,"368,54868-5009-00 ",.01)
 ;;54868-5009-00
 ;;9002226.02101,"368,54868-5009-00 ",.02)
 ;;54868-5009-00
 ;;9002226.02101,"368,54868-5047-00 ",.01)
 ;;54868-5047-00
 ;;9002226.02101,"368,54868-5047-00 ",.02)
 ;;54868-5047-00
 ;;9002226.02101,"368,54868-5322-00 ",.01)
 ;;54868-5322-00
 ;;9002226.02101,"368,54868-5322-00 ",.02)
 ;;54868-5322-00
 ;;9002226.02101,"368,54868-5322-01 ",.01)
 ;;54868-5322-01
 ;;9002226.02101,"368,54868-5322-01 ",.02)
 ;;54868-5322-01
 ;;9002226.02101,"368,54868-5371-00 ",.01)
 ;;54868-5371-00
 ;;9002226.02101,"368,54868-5371-00 ",.02)
 ;;54868-5371-00
 ;;9002226.02101,"368,54868-5406-00 ",.01)
 ;;54868-5406-00
 ;;9002226.02101,"368,54868-5406-00 ",.02)
 ;;54868-5406-00
 ;;9002226.02101,"368,54868-5415-00 ",.01)
 ;;54868-5415-00
 ;;9002226.02101,"368,54868-5415-00 ",.02)
 ;;54868-5415-00
 ;;9002226.02101,"368,54868-5415-01 ",.01)
 ;;54868-5415-01
 ;;9002226.02101,"368,54868-5415-01 ",.02)
 ;;54868-5415-01
 ;;9002226.02101,"368,54868-5480-00 ",.01)
 ;;54868-5480-00
 ;;9002226.02101,"368,54868-5480-00 ",.02)
 ;;54868-5480-00
 ;;9002226.02101,"368,54868-5499-00 ",.01)
 ;;54868-5499-00
 ;;9002226.02101,"368,54868-5499-00 ",.02)
 ;;54868-5499-00
 ;;9002226.02101,"368,54868-5518-00 ",.01)
 ;;54868-5518-00
 ;;9002226.02101,"368,54868-5518-00 ",.02)
 ;;54868-5518-00
 ;;9002226.02101,"368,54868-5540-00 ",.01)
 ;;54868-5540-00
 ;;9002226.02101,"368,54868-5540-00 ",.02)
 ;;54868-5540-00
 ;;9002226.02101,"368,54868-5570-00 ",.01)
 ;;54868-5570-00
 ;;9002226.02101,"368,54868-5570-00 ",.02)
 ;;54868-5570-00
 ;;9002226.02101,"368,54868-5823-00 ",.01)
 ;;54868-5823-00
 ;;9002226.02101,"368,54868-5823-00 ",.02)
 ;;54868-5823-00
 ;;9002226.02101,"368,54868-5860-00 ",.01)
 ;;54868-5860-00
 ;;9002226.02101,"368,54868-5860-00 ",.02)
 ;;54868-5860-00
 ;;9002226.02101,"368,54868-5861-00 ",.01)
 ;;54868-5861-00
 ;;9002226.02101,"368,54868-5861-00 ",.02)
 ;;54868-5861-00
 ;;9002226.02101,"368,54868-5862-00 ",.01)
 ;;54868-5862-00
 ;;9002226.02101,"368,54868-5862-00 ",.02)
 ;;54868-5862-00
 ;;9002226.02101,"368,54868-5934-00 ",.01)
 ;;54868-5934-00
 ;;9002226.02101,"368,54868-5934-00 ",.02)
 ;;54868-5934-00
 ;;9002226.02101,"368,54868-5934-01 ",.01)
 ;;54868-5934-01
 ;;9002226.02101,"368,54868-5934-01 ",.02)
 ;;54868-5934-01
 ;;9002226.02101,"368,54868-6030-00 ",.01)
 ;;54868-6030-00
 ;;9002226.02101,"368,54868-6030-00 ",.02)
 ;;54868-6030-00
 ;;9002226.02101,"368,55045-2739-00 ",.01)
 ;;55045-2739-00
 ;;9002226.02101,"368,55045-2739-00 ",.02)
 ;;55045-2739-00
 ;;9002226.02101,"368,55045-2850-00 ",.01)
 ;;55045-2850-00
 ;;9002226.02101,"368,55045-2850-00 ",.02)
 ;;55045-2850-00
 ;;9002226.02101,"368,55045-3134-04 ",.01)
 ;;55045-3134-04
 ;;9002226.02101,"368,55045-3134-04 ",.02)
 ;;55045-3134-04
 ;;9002226.02101,"368,55045-3908-01 ",.01)
 ;;55045-3908-01
 ;;9002226.02101,"368,55045-3908-01 ",.02)
 ;;55045-3908-01
 ;;9002226.02101,"368,55111-0588-01 ",.01)
 ;;55111-0588-01
 ;;9002226.02101,"368,55111-0588-01 ",.02)
 ;;55111-0588-01
 ;;9002226.02101,"368,55111-0588-30 ",.01)
 ;;55111-0588-30
 ;;9002226.02101,"368,55111-0588-30 ",.02)
 ;;55111-0588-30
 ;;9002226.02101,"368,55111-0589-01 ",.01)
 ;;55111-0589-01
 ;;9002226.02101,"368,55111-0589-01 ",.02)
 ;;55111-0589-01
 ;;9002226.02101,"368,55111-0589-30 ",.01)
 ;;55111-0589-30
 ;;9002226.02101,"368,55111-0589-30 ",.02)
 ;;55111-0589-30
 ;;9002226.02101,"368,55111-0590-48 ",.01)
 ;;55111-0590-48
 ;;9002226.02101,"368,55111-0590-48 ",.02)
 ;;55111-0590-48
 ;;9002226.02101,"368,55111-0592-48 ",.01)
 ;;55111-0592-48
 ;;9002226.02101,"368,55111-0592-48 ",.02)
 ;;55111-0592-48
 ;;9002226.02101,"368,55289-0047-25 ",.01)
 ;;55289-0047-25
 ;;9002226.02101,"368,55289-0047-25 ",.02)
 ;;55289-0047-25
 ;;9002226.02101,"368,55289-0047-30 ",.01)
 ;;55289-0047-30
 ;;9002226.02101,"368,55289-0047-30 ",.02)
 ;;55289-0047-30
 ;;9002226.02101,"368,55289-0047-42 ",.01)
 ;;55289-0047-42
 ;;9002226.02101,"368,55289-0047-42 ",.02)
 ;;55289-0047-42
 ;;9002226.02101,"368,55289-0047-90 ",.01)
 ;;55289-0047-90
 ;;9002226.02101,"368,55289-0047-90 ",.02)
 ;;55289-0047-90
 ;;9002226.02101,"368,55289-0101-30 ",.01)
 ;;55289-0101-30
 ;;9002226.02101,"368,55289-0101-30 ",.02)
 ;;55289-0101-30
 ;;9002226.02101,"368,55289-0101-50 ",.01)
 ;;55289-0101-50
 ;;9002226.02101,"368,55289-0101-50 ",.02)
 ;;55289-0101-50
 ;;9002226.02101,"368,55289-0123-30 ",.01)
 ;;55289-0123-30
 ;;9002226.02101,"368,55289-0123-30 ",.02)
 ;;55289-0123-30
 ;;9002226.02101,"368,55289-0266-30 ",.01)
 ;;55289-0266-30
 ;;9002226.02101,"368,55289-0266-30 ",.02)
 ;;55289-0266-30
 ;;9002226.02101,"368,55289-0396-30 ",.01)
 ;;55289-0396-30
 ;;9002226.02101,"368,55289-0396-30 ",.02)
 ;;55289-0396-30
 ;;9002226.02101,"368,55289-0603-07 ",.01)
 ;;55289-0603-07
 ;;9002226.02101,"368,55289-0603-07 ",.02)
 ;;55289-0603-07
 ;;9002226.02101,"368,55289-0603-21 ",.01)
 ;;55289-0603-21
 ;;9002226.02101,"368,55289-0603-21 ",.02)
 ;;55289-0603-21
 ;;9002226.02101,"368,55289-0603-30 ",.01)
 ;;55289-0603-30
 ;;9002226.02101,"368,55289-0603-30 ",.02)
 ;;55289-0603-30
 ;;9002226.02101,"368,55289-0603-90 ",.01)
 ;;55289-0603-90
 ;;9002226.02101,"368,55289-0603-90 ",.02)
 ;;55289-0603-90
 ;;9002226.02101,"368,55289-0761-30 ",.01)
 ;;55289-0761-30
 ;;9002226.02101,"368,55289-0761-30 ",.02)
 ;;55289-0761-30
 ;;9002226.02101,"368,55289-0943-07 ",.01)
 ;;55289-0943-07
 ;;9002226.02101,"368,55289-0943-07 ",.02)
 ;;55289-0943-07
 ;;9002226.02101,"368,55289-0943-25 ",.01)
 ;;55289-0943-25
 ;;9002226.02101,"368,55289-0943-25 ",.02)
 ;;55289-0943-25
 ;;9002226.02101,"368,55289-0943-28 ",.01)
 ;;55289-0943-28
 ;;9002226.02101,"368,55289-0943-28 ",.02)
 ;;55289-0943-28
 ;;9002226.02101,"368,55289-0943-30 ",.01)
 ;;55289-0943-30
 ;;9002226.02101,"368,55289-0943-30 ",.02)
 ;;55289-0943-30
 ;;9002226.02101,"368,55553-0244-10 ",.01)
 ;;55553-0244-10
 ;;9002226.02101,"368,55553-0244-10 ",.02)
 ;;55553-0244-10
 ;;9002226.02101,"368,55553-0254-10 ",.01)
 ;;55553-0254-10
 ;;9002226.02101,"368,55553-0254-10 ",.02)
 ;;55553-0254-10
 ;;9002226.02101,"368,55887-0106-04 ",.01)
 ;;55887-0106-04
 ;;9002226.02101,"368,55887-0106-04 ",.02)
 ;;55887-0106-04
 ;;9002226.02101,"368,55887-0266-30 ",.01)
 ;;55887-0266-30
 ;;9002226.02101,"368,55887-0266-30 ",.02)
 ;;55887-0266-30
 ;;9002226.02101,"368,55887-0266-90 ",.01)
 ;;55887-0266-90
 ;;9002226.02101,"368,55887-0266-90 ",.02)
 ;;55887-0266-90
 ;;9002226.02101,"368,55887-0324-30 ",.01)
 ;;55887-0324-30
 ;;9002226.02101,"368,55887-0324-30 ",.02)
 ;;55887-0324-30
 ;;9002226.02101,"368,55887-0342-01 ",.01)
 ;;55887-0342-01
 ;;9002226.02101,"368,55887-0342-01 ",.02)
 ;;55887-0342-01
 ;;9002226.02101,"368,55887-0342-30 ",.01)
 ;;55887-0342-30
 ;;9002226.02101,"368,55887-0342-30 ",.02)
 ;;55887-0342-30
 ;;9002226.02101,"368,55887-0342-90 ",.01)
 ;;55887-0342-90
 ;;9002226.02101,"368,55887-0342-90 ",.02)
 ;;55887-0342-90
 ;;9002226.02101,"368,55887-0516-20 ",.01)
 ;;55887-0516-20
 ;;9002226.02101,"368,55887-0516-20 ",.02)
 ;;55887-0516-20
 ;;9002226.02101,"368,55887-0516-30 ",.01)
 ;;55887-0516-30
 ;;9002226.02101,"368,55887-0516-30 ",.02)
 ;;55887-0516-30
 ;;9002226.02101,"368,55887-0516-60 ",.01)
 ;;55887-0516-60
 ;;9002226.02101,"368,55887-0516-60 ",.02)
 ;;55887-0516-60
 ;;9002226.02101,"368,55887-0516-82 ",.01)
 ;;55887-0516-82
 ;;9002226.02101,"368,55887-0516-82 ",.02)
 ;;55887-0516-82
 ;;9002226.02101,"368,55887-0516-90 ",.01)
 ;;55887-0516-90
 ;;9002226.02101,"368,55887-0516-90 ",.02)
 ;;55887-0516-90
 ;;9002226.02101,"368,55887-0641-03 ",.01)
 ;;55887-0641-03
 ;;9002226.02101,"368,55887-0641-03 ",.02)
 ;;55887-0641-03
 ;;9002226.02101,"368,55887-0685-04 ",.01)
 ;;55887-0685-04
 ;;9002226.02101,"368,55887-0685-04 ",.02)
 ;;55887-0685-04
 ;;9002226.02101,"368,55887-0702-30 ",.01)
 ;;55887-0702-30
 ;;9002226.02101,"368,55887-0702-30 ",.02)
 ;;55887-0702-30
 ;;9002226.02101,"368,55887-0863-30 ",.01)
 ;;55887-0863-30
 ;;9002226.02101,"368,55887-0863-30 ",.02)
 ;;55887-0863-30
 ;;9002226.02101,"368,57866-6681-01 ",.01)
 ;;57866-6681-01
 ;;9002226.02101,"368,57866-6681-01 ",.02)
 ;;57866-6681-01
 ;;9002226.02101,"368,57866-6681-02 ",.01)
 ;;57866-6681-02
 ;;9002226.02101,"368,57866-6681-02 ",.02)
 ;;57866-6681-02
 ;;9002226.02101,"368,57866-6681-03 ",.01)
 ;;57866-6681-03
 ;;9002226.02101,"368,57866-6681-03 ",.02)
 ;;57866-6681-03
 ;;9002226.02101,"368,57866-6682-01 ",.01)
 ;;57866-6682-01
 ;;9002226.02101,"368,57866-6682-01 ",.02)
 ;;57866-6682-01
