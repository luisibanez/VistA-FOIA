BGPUXAH ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON JUL 05, 2004 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"801,13763-8 ",.01)
 ;;13763-8
 ;;9002226.02101,"801,13763-8 ",.02)
 ;;13763-8
 ;;9002226.02101,"801,13764-6 ",.01)
 ;;13764-6
 ;;9002226.02101,"801,13764-6 ",.02)
 ;;13764-6
 ;;9002226.02101,"801,13765-3 ",.01)
 ;;13765-3
 ;;9002226.02101,"801,13765-3 ",.02)
 ;;13765-3
 ;;9002226.02101,"801,13766-1 ",.01)
 ;;13766-1
 ;;9002226.02101,"801,13766-1 ",.02)
 ;;13766-1
 ;;9002226.02101,"801,13767-9 ",.01)
 ;;13767-9
 ;;9002226.02101,"801,13767-9 ",.02)
 ;;13767-9
 ;;9002226.02101,"801,13768-7 ",.01)
 ;;13768-7
 ;;9002226.02101,"801,13768-7 ",.02)
 ;;13768-7
 ;;9002226.02101,"801,13769-5 ",.01)
 ;;13769-5
 ;;9002226.02101,"801,13769-5 ",.02)
 ;;13769-5
 ;;9002226.02101,"801,13770-3 ",.01)
 ;;13770-3
 ;;9002226.02101,"801,13770-3 ",.02)
 ;;13770-3
 ;;9002226.02101,"801,13771-1 ",.01)
 ;;13771-1
 ;;9002226.02101,"801,13771-1 ",.02)
 ;;13771-1
 ;;9002226.02101,"801,13772-9 ",.01)
 ;;13772-9
 ;;9002226.02101,"801,13772-9 ",.02)
 ;;13772-9
 ;;9002226.02101,"801,13773-7 ",.01)
 ;;13773-7
 ;;9002226.02101,"801,13773-7 ",.02)
 ;;13773-7
 ;;9002226.02101,"801,13774-5 ",.01)
 ;;13774-5
 ;;9002226.02101,"801,13774-5 ",.02)
 ;;13774-5
 ;;9002226.02101,"801,13775-2 ",.01)
 ;;13775-2
 ;;9002226.02101,"801,13775-2 ",.02)
 ;;13775-2
 ;;9002226.02101,"801,13776-0 ",.01)
 ;;13776-0
 ;;9002226.02101,"801,13776-0 ",.02)
 ;;13776-0
 ;;9002226.02101,"801,13777-8 ",.01)
 ;;13777-8
 ;;9002226.02101,"801,13777-8 ",.02)
 ;;13777-8
 ;;9002226.02101,"801,13778-6 ",.01)
 ;;13778-6
 ;;9002226.02101,"801,13778-6 ",.02)
 ;;13778-6
 ;;9002226.02101,"801,13779-4 ",.01)
 ;;13779-4
 ;;9002226.02101,"801,13779-4 ",.02)
 ;;13779-4
 ;;9002226.02101,"801,13780-2 ",.01)
 ;;13780-2
 ;;9002226.02101,"801,13780-2 ",.02)
 ;;13780-2
 ;;9002226.02101,"801,13781-0 ",.01)
 ;;13781-0
 ;;9002226.02101,"801,13781-0 ",.02)
 ;;13781-0
 ;;9002226.02101,"801,13782-8 ",.01)
 ;;13782-8
 ;;9002226.02101,"801,13782-8 ",.02)
 ;;13782-8
 ;;9002226.02101,"801,13783-6 ",.01)
 ;;13783-6
 ;;9002226.02101,"801,13783-6 ",.02)
 ;;13783-6
 ;;9002226.02101,"801,13784-4 ",.01)
 ;;13784-4
 ;;9002226.02101,"801,13784-4 ",.02)
 ;;13784-4
 ;;9002226.02101,"801,13785-1 ",.01)
 ;;13785-1
 ;;9002226.02101,"801,13785-1 ",.02)
 ;;13785-1
 ;;9002226.02101,"801,13786-9 ",.01)
 ;;13786-9
 ;;9002226.02101,"801,13786-9 ",.02)
 ;;13786-9
 ;;9002226.02101,"801,13787-7 ",.01)
 ;;13787-7
 ;;9002226.02101,"801,13787-7 ",.02)
 ;;13787-7
 ;;9002226.02101,"801,13788-5 ",.01)
 ;;13788-5
 ;;9002226.02101,"801,13788-5 ",.02)
 ;;13788-5
 ;;9002226.02101,"801,13789-3 ",.01)
 ;;13789-3
 ;;9002226.02101,"801,13789-3 ",.02)
 ;;13789-3
 ;;9002226.02101,"801,13790-1 ",.01)
 ;;13790-1
 ;;9002226.02101,"801,13790-1 ",.02)
 ;;13790-1
 ;;9002226.02101,"801,13791-9 ",.01)
 ;;13791-9
 ;;9002226.02101,"801,13791-9 ",.02)
 ;;13791-9
 ;;9002226.02101,"801,13792-7 ",.01)
 ;;13792-7
 ;;9002226.02101,"801,13792-7 ",.02)
 ;;13792-7
 ;;9002226.02101,"801,13793-5 ",.01)
 ;;13793-5
 ;;9002226.02101,"801,13793-5 ",.02)
 ;;13793-5
 ;;9002226.02101,"801,13794-3 ",.01)
 ;;13794-3
 ;;9002226.02101,"801,13794-3 ",.02)
 ;;13794-3
 ;;9002226.02101,"801,13795-0 ",.01)
 ;;13795-0
 ;;9002226.02101,"801,13795-0 ",.02)
 ;;13795-0
 ;;9002226.02101,"801,13796-8 ",.01)
 ;;13796-8
 ;;9002226.02101,"801,13796-8 ",.02)
 ;;13796-8
 ;;9002226.02101,"801,13797-6 ",.01)
 ;;13797-6
 ;;9002226.02101,"801,13797-6 ",.02)
 ;;13797-6
 ;;9002226.02101,"801,13798-4 ",.01)
 ;;13798-4
 ;;9002226.02101,"801,13798-4 ",.02)
 ;;13798-4
 ;;9002226.02101,"801,13799-2 ",.01)
 ;;13799-2
 ;;9002226.02101,"801,13799-2 ",.02)
 ;;13799-2
 ;;9002226.02101,"801,13800-8 ",.01)
 ;;13800-8
 ;;9002226.02101,"801,13800-8 ",.02)
 ;;13800-8
 ;;9002226.02101,"801,13801-6 ",.01)
 ;;13801-6
 ;;9002226.02101,"801,13801-6 ",.02)
 ;;13801-6
 ;;9002226.02101,"801,13802-4 ",.01)
 ;;13802-4
 ;;9002226.02101,"801,13802-4 ",.02)
 ;;13802-4
 ;;9002226.02101,"801,13803-2 ",.01)
 ;;13803-2
 ;;9002226.02101,"801,13803-2 ",.02)
 ;;13803-2
 ;;9002226.02101,"801,13804-0 ",.01)
 ;;13804-0
 ;;9002226.02101,"801,13804-0 ",.02)
 ;;13804-0
 ;;9002226.02101,"801,13805-7 ",.01)
 ;;13805-7
 ;;9002226.02101,"801,13805-7 ",.02)
 ;;13805-7
 ;;9002226.02101,"801,13806-5 ",.01)
 ;;13806-5
 ;;9002226.02101,"801,13806-5 ",.02)
 ;;13806-5
 ;;9002226.02101,"801,13807-3 ",.01)
 ;;13807-3
 ;;9002226.02101,"801,13807-3 ",.02)
 ;;13807-3
 ;;9002226.02101,"801,13808-1 ",.01)
 ;;13808-1
 ;;9002226.02101,"801,13808-1 ",.02)
 ;;13808-1
 ;;9002226.02101,"801,13809-9 ",.01)
 ;;13809-9
 ;;9002226.02101,"801,13809-9 ",.02)
 ;;13809-9
 ;;9002226.02101,"801,13810-7 ",.01)
 ;;13810-7
 ;;9002226.02101,"801,13810-7 ",.02)
 ;;13810-7
 ;;9002226.02101,"801,13811-5 ",.01)
 ;;13811-5
 ;;9002226.02101,"801,13811-5 ",.02)
 ;;13811-5
 ;;9002226.02101,"801,13812-3 ",.01)
 ;;13812-3
 ;;9002226.02101,"801,13812-3 ",.02)
 ;;13812-3
 ;;9002226.02101,"801,13813-1 ",.01)
 ;;13813-1
 ;;9002226.02101,"801,13813-1 ",.02)
 ;;13813-1
 ;;9002226.02101,"801,13814-9 ",.01)
 ;;13814-9
 ;;9002226.02101,"801,13814-9 ",.02)
 ;;13814-9
 ;;9002226.02101,"801,13815-6 ",.01)
 ;;13815-6
