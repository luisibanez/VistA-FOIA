BGP13P3 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"701,61392-0552-54 ",.01)
 ;;61392-0552-54
 ;;9002226.02101,"701,61392-0552-54 ",.02)
 ;;61392-0552-54
 ;;9002226.02101,"701,61392-0552-56 ",.01)
 ;;61392-0552-56
 ;;9002226.02101,"701,61392-0552-56 ",.02)
 ;;61392-0552-56
 ;;9002226.02101,"701,61392-0552-60 ",.01)
 ;;61392-0552-60
 ;;9002226.02101,"701,61392-0552-60 ",.02)
 ;;61392-0552-60
 ;;9002226.02101,"701,61392-0552-90 ",.01)
 ;;61392-0552-90
 ;;9002226.02101,"701,61392-0552-90 ",.02)
 ;;61392-0552-90
 ;;9002226.02101,"701,61392-0552-91 ",.01)
 ;;61392-0552-91
 ;;9002226.02101,"701,61392-0552-91 ",.02)
 ;;61392-0552-91
 ;;9002226.02101,"701,64980-0133-01 ",.01)
 ;;64980-0133-01
 ;;9002226.02101,"701,64980-0133-01 ",.02)
 ;;64980-0133-01
 ;;9002226.02101,"701,64980-0133-10 ",.01)
 ;;64980-0133-10
 ;;9002226.02101,"701,64980-0133-10 ",.02)
 ;;64980-0133-10
 ;;9002226.02101,"701,64980-0134-01 ",.01)
 ;;64980-0134-01
 ;;9002226.02101,"701,64980-0134-01 ",.02)
 ;;64980-0134-01
 ;;9002226.02101,"701,64980-0134-10 ",.01)
 ;;64980-0134-10
 ;;9002226.02101,"701,64980-0134-10 ",.02)
 ;;64980-0134-10
 ;;9002226.02101,"701,64980-0135-01 ",.01)
 ;;64980-0135-01
 ;;9002226.02101,"701,64980-0135-01 ",.02)
 ;;64980-0135-01
 ;;9002226.02101,"701,64980-0135-10 ",.01)
 ;;64980-0135-10
 ;;9002226.02101,"701,64980-0135-10 ",.02)
 ;;64980-0135-10
 ;;9002226.02101,"701,68115-0663-00 ",.01)
 ;;68115-0663-00
 ;;9002226.02101,"701,68115-0663-00 ",.02)
 ;;68115-0663-00
 ;;9002226.02101,"701,68382-0187-01 ",.01)
 ;;68382-0187-01
 ;;9002226.02101,"701,68382-0187-01 ",.02)
 ;;68382-0187-01
 ;;9002226.02101,"701,68382-0187-10 ",.01)
 ;;68382-0187-10
 ;;9002226.02101,"701,68382-0187-10 ",.02)
 ;;68382-0187-10
 ;;9002226.02101,"701,68382-0188-01 ",.01)
 ;;68382-0188-01
 ;;9002226.02101,"701,68382-0188-01 ",.02)
 ;;68382-0188-01
 ;;9002226.02101,"701,68382-0188-10 ",.01)
 ;;68382-0188-10
 ;;9002226.02101,"701,68382-0188-10 ",.02)
 ;;68382-0188-10
 ;;9002226.02101,"701,68382-0189-01 ",.01)
 ;;68382-0189-01
 ;;9002226.02101,"701,68382-0189-01 ",.02)
 ;;68382-0189-01
 ;;9002226.02101,"701,68382-0189-10 ",.01)
 ;;68382-0189-10
 ;;9002226.02101,"701,68382-0189-10 ",.02)
 ;;68382-0189-10
 ;;9002226.02101,"701,68462-0116-01 ",.01)
 ;;68462-0116-01
 ;;9002226.02101,"701,68462-0116-01 ",.02)
 ;;68462-0116-01
 ;;9002226.02101,"701,68462-0116-10 ",.01)
 ;;68462-0116-10
 ;;9002226.02101,"701,68462-0116-10 ",.02)
 ;;68462-0116-10
 ;;9002226.02101,"701,68462-0117-01 ",.01)
 ;;68462-0117-01
 ;;9002226.02101,"701,68462-0117-01 ",.02)
 ;;68462-0117-01
 ;;9002226.02101,"701,68462-0117-10 ",.01)
 ;;68462-0117-10
 ;;9002226.02101,"701,68462-0117-10 ",.02)
 ;;68462-0117-10
 ;;9002226.02101,"701,68462-0118-01 ",.01)
 ;;68462-0118-01
 ;;9002226.02101,"701,68462-0118-01 ",.02)
 ;;68462-0118-01
 ;;9002226.02101,"701,68462-0118-10 ",.01)
 ;;68462-0118-10
 ;;9002226.02101,"701,68462-0118-10 ",.02)
 ;;68462-0118-10
