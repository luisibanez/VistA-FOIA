BGP13I3 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"698,51991-0079-01 ",.01)
 ;;51991-0079-01
 ;;9002226.02101,"698,51991-0079-01 ",.02)
 ;;51991-0079-01
 ;;9002226.02101,"698,52959-0222-00 ",.01)
 ;;52959-0222-00
 ;;9002226.02101,"698,52959-0222-00 ",.02)
 ;;52959-0222-00
 ;;9002226.02101,"698,52959-0223-00 ",.01)
 ;;52959-0223-00
 ;;9002226.02101,"698,52959-0223-00 ",.02)
 ;;52959-0223-00
 ;;9002226.02101,"698,52959-0223-30 ",.01)
 ;;52959-0223-30
 ;;9002226.02101,"698,52959-0223-30 ",.02)
 ;;52959-0223-30
 ;;9002226.02101,"698,52959-0326-10 ",.01)
 ;;52959-0326-10
 ;;9002226.02101,"698,52959-0326-10 ",.02)
 ;;52959-0326-10
 ;;9002226.02101,"698,53746-0077-01 ",.01)
 ;;53746-0077-01
 ;;9002226.02101,"698,53746-0077-01 ",.02)
 ;;53746-0077-01
 ;;9002226.02101,"698,53746-0078-01 ",.01)
 ;;53746-0078-01
 ;;9002226.02101,"698,53746-0078-01 ",.02)
 ;;53746-0078-01
 ;;9002226.02101,"698,54569-0811-01 ",.01)
 ;;54569-0811-01
 ;;9002226.02101,"698,54569-0811-01 ",.02)
 ;;54569-0811-01
 ;;9002226.02101,"698,54569-0812-00 ",.01)
 ;;54569-0812-00
 ;;9002226.02101,"698,54569-0812-00 ",.02)
 ;;54569-0812-00
 ;;9002226.02101,"698,54569-0812-01 ",.01)
 ;;54569-0812-01
 ;;9002226.02101,"698,54569-0812-01 ",.02)
 ;;54569-0812-01
 ;;9002226.02101,"698,54569-0812-02 ",.01)
 ;;54569-0812-02
 ;;9002226.02101,"698,54569-0812-02 ",.02)
 ;;54569-0812-02
 ;;9002226.02101,"698,54569-0812-05 ",.01)
 ;;54569-0812-05
 ;;9002226.02101,"698,54569-0812-05 ",.02)
 ;;54569-0812-05
 ;;9002226.02101,"698,54569-0813-00 ",.01)
 ;;54569-0813-00
 ;;9002226.02101,"698,54569-0813-00 ",.02)
 ;;54569-0813-00
 ;;9002226.02101,"698,54569-0813-01 ",.01)
 ;;54569-0813-01
 ;;9002226.02101,"698,54569-0813-01 ",.02)
 ;;54569-0813-01
 ;;9002226.02101,"698,54569-0849-00 ",.01)
 ;;54569-0849-00
 ;;9002226.02101,"698,54569-0849-00 ",.02)
 ;;54569-0849-00
 ;;9002226.02101,"698,54569-0849-01 ",.01)
 ;;54569-0849-01
 ;;9002226.02101,"698,54569-0849-01 ",.02)
 ;;54569-0849-01
 ;;9002226.02101,"698,54569-4354-01 ",.01)
 ;;54569-4354-01
 ;;9002226.02101,"698,54569-4354-01 ",.02)
 ;;54569-4354-01
 ;;9002226.02101,"698,54569-4618-00 ",.01)
 ;;54569-4618-00
 ;;9002226.02101,"698,54569-4618-00 ",.02)
 ;;54569-4618-00
 ;;9002226.02101,"698,54569-4673-00 ",.01)
 ;;54569-4673-00
 ;;9002226.02101,"698,54569-4673-00 ",.02)
 ;;54569-4673-00
 ;;9002226.02101,"698,54569-4925-00 ",.01)
 ;;54569-4925-00
 ;;9002226.02101,"698,54569-4925-00 ",.02)
 ;;54569-4925-00
 ;;9002226.02101,"698,54569-8006-00 ",.01)
 ;;54569-8006-00
 ;;9002226.02101,"698,54569-8006-00 ",.02)
 ;;54569-8006-00
 ;;9002226.02101,"698,54569-8006-01 ",.01)
 ;;54569-8006-01
 ;;9002226.02101,"698,54569-8006-01 ",.02)
 ;;54569-8006-01
 ;;9002226.02101,"698,54569-8006-02 ",.01)
 ;;54569-8006-02
 ;;9002226.02101,"698,54569-8006-02 ",.02)
 ;;54569-8006-02
 ;;9002226.02101,"698,54569-8014-00 ",.01)
 ;;54569-8014-00
 ;;9002226.02101,"698,54569-8014-00 ",.02)
 ;;54569-8014-00
 ;;9002226.02101,"698,54569-8500-00 ",.01)
 ;;54569-8500-00
 ;;9002226.02101,"698,54569-8500-00 ",.02)
 ;;54569-8500-00
 ;;9002226.02101,"698,54569-8500-01 ",.01)
 ;;54569-8500-01
 ;;9002226.02101,"698,54569-8500-01 ",.02)
 ;;54569-8500-01
 ;;9002226.02101,"698,54569-8500-02 ",.01)
 ;;54569-8500-02
 ;;9002226.02101,"698,54569-8500-02 ",.02)
 ;;54569-8500-02
 ;;9002226.02101,"698,54569-8505-00 ",.01)
 ;;54569-8505-00
 ;;9002226.02101,"698,54569-8505-00 ",.02)
 ;;54569-8505-00
 ;;9002226.02101,"698,54569-8505-01 ",.01)
 ;;54569-8505-01
 ;;9002226.02101,"698,54569-8505-01 ",.02)
 ;;54569-8505-01
 ;;9002226.02101,"698,54569-8505-02 ",.01)
 ;;54569-8505-02
 ;;9002226.02101,"698,54569-8505-02 ",.02)
 ;;54569-8505-02
 ;;9002226.02101,"698,54569-8517-00 ",.01)
 ;;54569-8517-00
 ;;9002226.02101,"698,54569-8517-00 ",.02)
 ;;54569-8517-00
 ;;9002226.02101,"698,54569-8517-01 ",.01)
 ;;54569-8517-01
 ;;9002226.02101,"698,54569-8517-01 ",.02)
 ;;54569-8517-01
 ;;9002226.02101,"698,54569-8518-00 ",.01)
 ;;54569-8518-00
 ;;9002226.02101,"698,54569-8518-00 ",.02)
 ;;54569-8518-00
 ;;9002226.02101,"698,54569-8518-01 ",.01)
 ;;54569-8518-01
 ;;9002226.02101,"698,54569-8518-01 ",.02)
 ;;54569-8518-01
 ;;9002226.02101,"698,54569-8525-00 ",.01)
 ;;54569-8525-00
 ;;9002226.02101,"698,54569-8525-00 ",.02)
 ;;54569-8525-00
 ;;9002226.02101,"698,54569-8551-00 ",.01)
 ;;54569-8551-00
 ;;9002226.02101,"698,54569-8551-00 ",.02)
 ;;54569-8551-00
 ;;9002226.02101,"698,54868-0365-00 ",.01)
 ;;54868-0365-00
 ;;9002226.02101,"698,54868-0365-00 ",.02)
 ;;54868-0365-00
 ;;9002226.02101,"698,54868-0365-02 ",.01)
 ;;54868-0365-02
 ;;9002226.02101,"698,54868-0365-02 ",.02)
 ;;54868-0365-02
 ;;9002226.02101,"698,54868-0365-03 ",.01)
 ;;54868-0365-03
 ;;9002226.02101,"698,54868-0365-03 ",.02)
 ;;54868-0365-03
 ;;9002226.02101,"698,54868-0451-00 ",.01)
 ;;54868-0451-00
 ;;9002226.02101,"698,54868-0451-00 ",.02)
 ;;54868-0451-00
 ;;9002226.02101,"698,54868-0451-01 ",.01)
 ;;54868-0451-01
 ;;9002226.02101,"698,54868-0451-01 ",.02)
 ;;54868-0451-01
 ;;9002226.02101,"698,54868-0451-02 ",.01)
 ;;54868-0451-02
 ;;9002226.02101,"698,54868-0451-02 ",.02)
 ;;54868-0451-02
 ;;9002226.02101,"698,54868-0451-03 ",.01)
 ;;54868-0451-03
 ;;9002226.02101,"698,54868-0451-03 ",.02)
 ;;54868-0451-03
 ;;9002226.02101,"698,54868-0451-06 ",.01)
 ;;54868-0451-06
 ;;9002226.02101,"698,54868-0451-06 ",.02)
 ;;54868-0451-06
 ;;9002226.02101,"698,54868-0451-07 ",.01)
 ;;54868-0451-07
 ;;9002226.02101,"698,54868-0451-07 ",.02)
 ;;54868-0451-07
 ;;9002226.02101,"698,54868-0452-03 ",.01)
 ;;54868-0452-03
 ;;9002226.02101,"698,54868-0452-03 ",.02)
 ;;54868-0452-03
 ;;9002226.02101,"698,54868-0453-00 ",.01)
 ;;54868-0453-00
 ;;9002226.02101,"698,54868-0453-00 ",.02)
 ;;54868-0453-00
 ;;9002226.02101,"698,54868-0453-01 ",.01)
 ;;54868-0453-01
 ;;9002226.02101,"698,54868-0453-01 ",.02)
 ;;54868-0453-01
 ;;9002226.02101,"698,54868-0453-02 ",.01)
 ;;54868-0453-02
 ;;9002226.02101,"698,54868-0453-02 ",.02)
 ;;54868-0453-02
 ;;9002226.02101,"698,54868-0453-04 ",.01)
 ;;54868-0453-04
 ;;9002226.02101,"698,54868-0453-04 ",.02)
 ;;54868-0453-04
 ;;9002226.02101,"698,54868-0453-05 ",.01)
 ;;54868-0453-05
 ;;9002226.02101,"698,54868-0453-05 ",.02)
 ;;54868-0453-05
 ;;9002226.02101,"698,54868-0453-06 ",.01)
 ;;54868-0453-06
 ;;9002226.02101,"698,54868-0453-06 ",.02)
 ;;54868-0453-06
 ;;9002226.02101,"698,54868-1261-00 ",.01)
 ;;54868-1261-00
 ;;9002226.02101,"698,54868-1261-00 ",.02)
 ;;54868-1261-00
 ;;9002226.02101,"698,54868-1262-00 ",.01)
 ;;54868-1262-00
 ;;9002226.02101,"698,54868-1262-00 ",.02)
 ;;54868-1262-00
 ;;9002226.02101,"698,54868-1262-01 ",.01)
 ;;54868-1262-01
 ;;9002226.02101,"698,54868-1262-01 ",.02)
 ;;54868-1262-01
 ;;9002226.02101,"698,54868-1262-02 ",.01)
 ;;54868-1262-02
 ;;9002226.02101,"698,54868-1262-02 ",.02)
 ;;54868-1262-02
 ;;9002226.02101,"698,54868-1432-00 ",.01)
 ;;54868-1432-00
 ;;9002226.02101,"698,54868-1432-00 ",.02)
 ;;54868-1432-00
 ;;9002226.02101,"698,54868-1432-01 ",.01)
 ;;54868-1432-01
 ;;9002226.02101,"698,54868-1432-01 ",.02)
 ;;54868-1432-01
 ;;9002226.02101,"698,54868-2702-00 ",.01)
 ;;54868-2702-00
 ;;9002226.02101,"698,54868-2702-00 ",.02)
 ;;54868-2702-00
 ;;9002226.02101,"698,54868-2702-01 ",.01)
 ;;54868-2702-01
 ;;9002226.02101,"698,54868-2702-01 ",.02)
 ;;54868-2702-01
 ;;9002226.02101,"698,54868-2702-02 ",.01)
 ;;54868-2702-02
 ;;9002226.02101,"698,54868-2702-02 ",.02)
 ;;54868-2702-02
 ;;9002226.02101,"698,54868-2702-03 ",.01)
 ;;54868-2702-03
 ;;9002226.02101,"698,54868-2702-03 ",.02)
 ;;54868-2702-03
 ;;9002226.02101,"698,54868-2702-04 ",.01)
 ;;54868-2702-04
 ;;9002226.02101,"698,54868-2702-04 ",.02)
 ;;54868-2702-04
 ;;9002226.02101,"698,54868-3114-00 ",.01)
 ;;54868-3114-00
 ;;9002226.02101,"698,54868-3114-00 ",.02)
 ;;54868-3114-00
 ;;9002226.02101,"698,54868-3114-01 ",.01)
 ;;54868-3114-01
 ;;9002226.02101,"698,54868-3114-01 ",.02)
 ;;54868-3114-01
 ;;9002226.02101,"698,54868-3564-00 ",.01)
 ;;54868-3564-00
 ;;9002226.02101,"698,54868-3564-00 ",.02)
 ;;54868-3564-00
 ;;9002226.02101,"698,54868-3564-01 ",.01)
 ;;54868-3564-01
 ;;9002226.02101,"698,54868-3564-01 ",.02)
 ;;54868-3564-01
 ;;9002226.02101,"698,54868-3564-02 ",.01)
 ;;54868-3564-02
 ;;9002226.02101,"698,54868-3564-02 ",.02)
 ;;54868-3564-02
 ;;9002226.02101,"698,54868-3565-00 ",.01)
 ;;54868-3565-00
 ;;9002226.02101,"698,54868-3565-00 ",.02)
 ;;54868-3565-00
 ;;9002226.02101,"698,54868-3565-01 ",.01)
 ;;54868-3565-01
 ;;9002226.02101,"698,54868-3565-01 ",.02)
 ;;54868-3565-01
 ;;9002226.02101,"698,54868-3565-02 ",.01)
 ;;54868-3565-02
 ;;9002226.02101,"698,54868-3565-02 ",.02)
 ;;54868-3565-02
 ;;9002226.02101,"698,54868-3653-00 ",.01)
 ;;54868-3653-00
 ;;9002226.02101,"698,54868-3653-00 ",.02)
 ;;54868-3653-00
 ;;9002226.02101,"698,54868-3799-00 ",.01)
 ;;54868-3799-00
 ;;9002226.02101,"698,54868-3799-00 ",.02)
 ;;54868-3799-00
 ;;9002226.02101,"698,54868-3800-00 ",.01)
 ;;54868-3800-00
 ;;9002226.02101,"698,54868-3800-00 ",.02)
 ;;54868-3800-00
 ;;9002226.02101,"698,54868-4149-00 ",.01)
 ;;54868-4149-00
 ;;9002226.02101,"698,54868-4149-00 ",.02)
 ;;54868-4149-00
 ;;9002226.02101,"698,54868-4149-01 ",.01)
 ;;54868-4149-01
 ;;9002226.02101,"698,54868-4149-01 ",.02)
 ;;54868-4149-01
 ;;9002226.02101,"698,54868-4761-01 ",.01)
 ;;54868-4761-01
 ;;9002226.02101,"698,54868-4761-01 ",.02)
 ;;54868-4761-01
 ;;9002226.02101,"698,54868-4761-02 ",.01)
 ;;54868-4761-02
 ;;9002226.02101,"698,54868-4761-02 ",.02)
 ;;54868-4761-02
 ;;9002226.02101,"698,54868-4771-00 ",.01)
 ;;54868-4771-00
 ;;9002226.02101,"698,54868-4771-00 ",.02)
 ;;54868-4771-00
 ;;9002226.02101,"698,54868-4771-01 ",.01)
 ;;54868-4771-01
 ;;9002226.02101,"698,54868-4771-01 ",.02)
 ;;54868-4771-01
 ;;9002226.02101,"698,54868-4771-02 ",.01)
 ;;54868-4771-02
 ;;9002226.02101,"698,54868-4771-02 ",.02)
 ;;54868-4771-02
 ;;9002226.02101,"698,54868-4865-00 ",.01)
 ;;54868-4865-00
 ;;9002226.02101,"698,54868-4865-00 ",.02)
 ;;54868-4865-00
 ;;9002226.02101,"698,54868-4865-01 ",.01)
 ;;54868-4865-01
 ;;9002226.02101,"698,54868-4865-01 ",.02)
 ;;54868-4865-01
 ;;9002226.02101,"698,54868-4866-00 ",.01)
 ;;54868-4866-00
 ;;9002226.02101,"698,54868-4866-00 ",.02)
 ;;54868-4866-00
 ;;9002226.02101,"698,54868-4879-00 ",.01)
 ;;54868-4879-00
 ;;9002226.02101,"698,54868-4879-00 ",.02)
 ;;54868-4879-00
 ;;9002226.02101,"698,54868-4879-01 ",.01)
 ;;54868-4879-01
 ;;9002226.02101,"698,54868-4879-01 ",.02)
 ;;54868-4879-01
 ;;9002226.02101,"698,54868-4879-02 ",.01)
 ;;54868-4879-02
 ;;9002226.02101,"698,54868-4879-02 ",.02)
 ;;54868-4879-02
 ;;9002226.02101,"698,54868-5047-00 ",.01)
 ;;54868-5047-00
 ;;9002226.02101,"698,54868-5047-00 ",.02)
 ;;54868-5047-00
 ;;9002226.02101,"698,54868-5415-00 ",.01)
 ;;54868-5415-00
 ;;9002226.02101,"698,54868-5415-00 ",.02)
 ;;54868-5415-00
 ;;9002226.02101,"698,54868-5415-01 ",.01)
 ;;54868-5415-01
 ;;9002226.02101,"698,54868-5415-01 ",.02)
 ;;54868-5415-01
 ;;9002226.02101,"698,54868-5540-00 ",.01)
 ;;54868-5540-00
 ;;9002226.02101,"698,54868-5540-00 ",.02)
 ;;54868-5540-00
 ;;9002226.02101,"698,54868-5934-00 ",.01)
 ;;54868-5934-00
 ;;9002226.02101,"698,54868-5934-00 ",.02)
 ;;54868-5934-00
 ;;9002226.02101,"698,54868-5934-01 ",.01)
 ;;54868-5934-01
 ;;9002226.02101,"698,54868-5934-01 ",.02)
 ;;54868-5934-01
 ;;9002226.02101,"698,55045-3480-01 ",.01)
 ;;55045-3480-01
 ;;9002226.02101,"698,55045-3480-01 ",.02)
 ;;55045-3480-01
 ;;9002226.02101,"698,55289-0047-25 ",.01)
 ;;55289-0047-25
 ;;9002226.02101,"698,55289-0047-25 ",.02)
 ;;55289-0047-25
 ;;9002226.02101,"698,55289-0047-30 ",.01)
 ;;55289-0047-30
 ;;9002226.02101,"698,55289-0047-30 ",.02)
 ;;55289-0047-30
 ;;9002226.02101,"698,55289-0047-42 ",.01)
 ;;55289-0047-42
 ;;9002226.02101,"698,55289-0047-42 ",.02)
 ;;55289-0047-42
 ;;9002226.02101,"698,55289-0047-90 ",.01)
 ;;55289-0047-90
 ;;9002226.02101,"698,55289-0047-90 ",.02)
 ;;55289-0047-90
 ;;9002226.02101,"698,55289-0123-30 ",.01)
 ;;55289-0123-30
 ;;9002226.02101,"698,55289-0123-30 ",.02)
 ;;55289-0123-30
 ;;9002226.02101,"698,55289-0943-07 ",.01)
 ;;55289-0943-07
 ;;9002226.02101,"698,55289-0943-07 ",.02)
 ;;55289-0943-07
 ;;9002226.02101,"698,55289-0943-25 ",.01)
 ;;55289-0943-25
 ;;9002226.02101,"698,55289-0943-25 ",.02)
 ;;55289-0943-25
 ;;9002226.02101,"698,55289-0943-28 ",.01)
 ;;55289-0943-28
 ;;9002226.02101,"698,55289-0943-28 ",.02)
 ;;55289-0943-28
 ;;9002226.02101,"698,55289-0943-30 ",.01)
 ;;55289-0943-30
 ;;9002226.02101,"698,55289-0943-30 ",.02)
 ;;55289-0943-30
 ;;9002226.02101,"698,55887-0324-30 ",.01)
 ;;55887-0324-30
