BGPTXTC ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 19, 2004 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"805,16602-5 ",.01)
 ;;16602-5
 ;;9002226.02101,"805,16602-5 ",.02)
 ;;16602-5
 ;;9002226.02101,"805,18490-3 ",.01)
 ;;18490-3
 ;;9002226.02101,"805,18490-3 ",.02)
 ;;18490-3
 ;;9002226.02101,"805,18491-1 ",.01)
 ;;18491-1
 ;;9002226.02101,"805,18491-1 ",.02)
 ;;18491-1
 ;;9002226.02101,"805,18492-9 ",.01)
 ;;18492-9
 ;;9002226.02101,"805,18492-9 ",.02)
 ;;18492-9
 ;;9002226.02101,"805,20755-5 ",.01)
 ;;20755-5
 ;;9002226.02101,"805,20755-5 ",.02)
 ;;20755-5
 ;;9002226.02101,"805,20756-3 ",.01)
 ;;20756-3
 ;;9002226.02101,"805,20756-3 ",.02)
 ;;20756-3
 ;;9002226.02101,"805,20757-1 ",.01)
 ;;20757-1
 ;;9002226.02101,"805,20757-1 ",.02)
 ;;20757-1
 ;;9002226.02101,"805,20993-2 ",.01)
 ;;20993-2
 ;;9002226.02101,"805,20993-2 ",.02)
 ;;20993-2
 ;;9002226.02101,"805,21185-4 ",.01)
 ;;21185-4
 ;;9002226.02101,"805,21185-4 ",.02)
 ;;21185-4
 ;;9002226.02101,"805,21186-2 ",.01)
 ;;21186-2
 ;;9002226.02101,"805,21186-2 ",.02)
 ;;21186-2
 ;;9002226.02101,"805,21187-0 ",.01)
 ;;21187-0
 ;;9002226.02101,"805,21187-0 ",.02)
 ;;21187-0
 ;;9002226.02101,"805,21188-8 ",.01)
 ;;21188-8
 ;;9002226.02101,"805,21188-8 ",.02)
 ;;21188-8
 ;;9002226.02101,"805,21189-6 ",.01)
 ;;21189-6
 ;;9002226.02101,"805,21189-6 ",.02)
 ;;21189-6
 ;;9002226.02101,"805,21190-4 ",.01)
 ;;21190-4
 ;;9002226.02101,"805,21190-4 ",.02)
 ;;21190-4
 ;;9002226.02101,"805,21191-2 ",.01)
 ;;21191-2
 ;;9002226.02101,"805,21191-2 ",.02)
 ;;21191-2
 ;;9002226.02101,"805,21192-0 ",.01)
 ;;21192-0
 ;;9002226.02101,"805,21192-0 ",.02)
 ;;21192-0
 ;;9002226.02101,"805,21613-5 ",.01)
 ;;21613-5
 ;;9002226.02101,"805,21613-5 ",.02)
 ;;21613-5
 ;;9002226.02101,"805,22182-0 ",.01)
 ;;22182-0
 ;;9002226.02101,"805,22182-0 ",.02)
 ;;22182-0
 ;;9002226.02101,"805,22183-8 ",.01)
 ;;22183-8
 ;;9002226.02101,"805,22183-8 ",.02)
 ;;22183-8
 ;;9002226.02101,"805,22184-6 ",.01)
 ;;22184-6
 ;;9002226.02101,"805,22184-6 ",.02)
 ;;22184-6
 ;;9002226.02101,"805,22185-3 ",.01)
 ;;22185-3
 ;;9002226.02101,"805,22185-3 ",.02)
 ;;22185-3
 ;;9002226.02101,"805,22186-1 ",.01)
 ;;22186-1
 ;;9002226.02101,"805,22186-1 ",.02)
 ;;22186-1
 ;;9002226.02101,"805,22187-9 ",.01)
 ;;22187-9
 ;;9002226.02101,"805,22187-9 ",.02)
 ;;22187-9
 ;;9002226.02101,"805,22188-7 ",.01)
 ;;22188-7
 ;;9002226.02101,"805,22188-7 ",.02)
 ;;22188-7
 ;;9002226.02101,"805,22189-5 ",.01)
 ;;22189-5
 ;;9002226.02101,"805,22189-5 ",.02)
 ;;22189-5
 ;;9002226.02101,"805,22190-3 ",.01)
 ;;22190-3
 ;;9002226.02101,"805,22190-3 ",.02)
 ;;22190-3
 ;;9002226.02101,"805,22191-1 ",.01)
 ;;22191-1
 ;;9002226.02101,"805,22191-1 ",.02)
 ;;22191-1
 ;;9002226.02101,"805,22192-9 ",.01)
 ;;22192-9
 ;;9002226.02101,"805,22192-9 ",.02)
 ;;22192-9
 ;;9002226.02101,"805,22193-7 ",.01)
 ;;22193-7
 ;;9002226.02101,"805,22193-7 ",.02)
 ;;22193-7
 ;;9002226.02101,"805,22194-5 ",.01)
 ;;22194-5
 ;;9002226.02101,"805,22194-5 ",.02)
 ;;22194-5
 ;;9002226.02101,"805,22195-2 ",.01)
 ;;22195-2
 ;;9002226.02101,"805,22195-2 ",.02)
 ;;22195-2
 ;;9002226.02101,"805,22196-0 ",.01)
 ;;22196-0
 ;;9002226.02101,"805,22196-0 ",.02)
 ;;22196-0
 ;;9002226.02101,"805,22197-8 ",.01)
 ;;22197-8
 ;;9002226.02101,"805,22197-8 ",.02)
 ;;22197-8
 ;;9002226.02101,"805,22198-6 ",.01)
 ;;22198-6
 ;;9002226.02101,"805,22198-6 ",.02)
 ;;22198-6
 ;;9002226.02101,"805,22199-4 ",.01)
 ;;22199-4
 ;;9002226.02101,"805,22199-4 ",.02)
 ;;22199-4
 ;;9002226.02101,"805,22200-0 ",.01)
 ;;22200-0
 ;;9002226.02101,"805,22200-0 ",.02)
 ;;22200-0
 ;;9002226.02101,"805,22201-8 ",.01)
 ;;22201-8
 ;;9002226.02101,"805,22201-8 ",.02)
 ;;22201-8
 ;;9002226.02101,"805,22202-6 ",.01)
 ;;22202-6
 ;;9002226.02101,"805,22202-6 ",.02)
 ;;22202-6
 ;;9002226.02101,"805,23838-6 ",.01)
 ;;23838-6
 ;;9002226.02101,"805,23838-6 ",.02)
 ;;23838-6
 ;;9002226.02101,"805,23967-3 ",.01)
 ;;23967-3
 ;;9002226.02101,"805,23967-3 ",.02)
 ;;23967-3
 ;;9002226.02101,"805,23990-5 ",.01)
 ;;23990-5
 ;;9002226.02101,"805,23990-5 ",.02)
 ;;23990-5
 ;;9002226.02101,"805,24005-1 ",.01)
 ;;24005-1
 ;;9002226.02101,"805,24005-1 ",.02)
 ;;24005-1
 ;;9002226.02101,"805,24238-8 ",.01)
 ;;24238-8
 ;;9002226.02101,"805,24238-8 ",.02)
 ;;24238-8
 ;;9002226.02101,"805,24239-6 ",.01)
 ;;24239-6
 ;;9002226.02101,"805,24239-6 ",.02)
 ;;24239-6
 ;;9002226.02101,"805,25369-0 ",.01)
 ;;25369-0
 ;;9002226.02101,"805,25369-0 ",.02)
 ;;25369-0
 ;;9002226.02101,"805,26626-2 ",.01)
 ;;26626-2
 ;;9002226.02101,"805,26626-2 ",.02)
 ;;26626-2
 ;;9002226.02101,"805,26663-5 ",.01)
 ;;26663-5
 ;;9002226.02101,"805,26663-5 ",.02)
 ;;26663-5
 ;;9002226.02101,"805,26664-3 ",.01)
 ;;26664-3
 ;;9002226.02101,"805,26664-3 ",.02)
 ;;26664-3
 ;;9002226.02101,"805,26665-0 ",.01)
 ;;26665-0
 ;;9002226.02101,"805,26665-0 ",.02)
 ;;26665-0
 ;;9002226.02101,"805,26666-8 ",.01)
 ;;26666-8
 ;;9002226.02101,"805,26666-8 ",.02)
 ;;26666-8
 ;;9002226.02101,"805,26667-6 ",.01)
 ;;26667-6
 ;;9002226.02101,"805,26667-6 ",.02)
 ;;26667-6
 ;;9002226.02101,"805,26668-4 ",.01)
 ;;26668-4
 ;;9002226.02101,"805,26668-4 ",.02)
 ;;26668-4
 ;;9002226.02101,"805,26715-3 ",.01)
 ;;26715-3
