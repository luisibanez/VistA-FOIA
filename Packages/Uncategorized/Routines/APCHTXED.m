APCHTXED ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON JUN 23, 2005;
 ;;2.0;IHS RPMS/PCC Health Summary;**14**;JUN 24, 1997
 ;;;APCH;;JUN 23, 2005
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"418,21310-8 ",.02)
 ;;21310-8
 ;;9002226.02101,"418,2339-0 ",.01)
 ;;2339-0
 ;;9002226.02101,"418,2339-0 ",.02)
 ;;2339-0
 ;;9002226.02101,"418,2340-8 ",.01)
 ;;2340-8
 ;;9002226.02101,"418,2340-8 ",.02)
 ;;2340-8
 ;;9002226.02101,"418,2341-6 ",.01)
 ;;2341-6
 ;;9002226.02101,"418,2341-6 ",.02)
 ;;2341-6
 ;;9002226.02101,"418,2345-7 ",.01)
 ;;2345-7
 ;;9002226.02101,"418,2345-7 ",.02)
 ;;2345-7
 ;;9002226.02101,"418,25663-6 ",.01)
 ;;25663-6
 ;;9002226.02101,"418,25663-6 ",.02)
 ;;25663-6
 ;;9002226.02101,"418,25665-1 ",.01)
 ;;25665-1
 ;;9002226.02101,"418,25665-1 ",.02)
 ;;25665-1
 ;;9002226.02101,"418,25666-9 ",.01)
 ;;25666-9
 ;;9002226.02101,"418,25666-9 ",.02)
 ;;25666-9
 ;;9002226.02101,"418,25668-5 ",.01)
 ;;25668-5
 ;;9002226.02101,"418,25668-5 ",.02)
 ;;25668-5
 ;;9002226.02101,"418,25669-3 ",.01)
 ;;25669-3
 ;;9002226.02101,"418,25669-3 ",.02)
 ;;25669-3
 ;;9002226.02101,"418,25671-9 ",.01)
 ;;25671-9
 ;;9002226.02101,"418,25671-9 ",.02)
 ;;25671-9
 ;;9002226.02101,"418,25672-7 ",.01)
 ;;25672-7
 ;;9002226.02101,"418,25672-7 ",.02)
 ;;25672-7
 ;;9002226.02101,"418,25673-5 ",.01)
 ;;25673-5
 ;;9002226.02101,"418,25673-5 ",.02)
 ;;25673-5
 ;;9002226.02101,"418,25674-3 ",.01)
 ;;25674-3
 ;;9002226.02101,"418,25674-3 ",.02)
 ;;25674-3
 ;;9002226.02101,"418,25676-8 ",.01)
 ;;25676-8
 ;;9002226.02101,"418,25676-8 ",.02)
 ;;25676-8
 ;;9002226.02101,"418,25677-6 ",.01)
 ;;25677-6
 ;;9002226.02101,"418,25677-6 ",.02)
 ;;25677-6
 ;;9002226.02101,"418,25679-2 ",.01)
 ;;25679-2
 ;;9002226.02101,"418,25679-2 ",.02)
 ;;25679-2
 ;;9002226.02101,"418,25680-0 ",.01)
 ;;25680-0
 ;;9002226.02101,"418,25680-0 ",.02)
 ;;25680-0
 ;;9002226.02101,"418,26539-7 ",.01)
 ;;26539-7
 ;;9002226.02101,"418,26539-7 ",.02)
 ;;26539-7
 ;;9002226.02101,"418,26541-3 ",.01)
 ;;26541-3
 ;;9002226.02101,"418,26541-3 ",.02)
 ;;26541-3
 ;;9002226.02101,"418,26543-9 ",.01)
 ;;26543-9
 ;;9002226.02101,"418,26543-9 ",.02)
 ;;26543-9
 ;;9002226.02101,"418,26544-7 ",.01)
 ;;26544-7
 ;;9002226.02101,"418,26544-7 ",.02)
 ;;26544-7
 ;;9002226.02101,"418,26554-6 ",.01)
 ;;26554-6
 ;;9002226.02101,"418,26554-6 ",.02)
 ;;26554-6
 ;;9002226.02101,"418,26555-3 ",.01)
 ;;26555-3
 ;;9002226.02101,"418,26555-3 ",.02)
 ;;26555-3
 ;;9002226.02101,"418,26695-7 ",.01)
 ;;26695-7
 ;;9002226.02101,"418,26695-7 ",.02)
 ;;26695-7
 ;;9002226.02101,"418,26777-3 ",.01)
 ;;26777-3
 ;;9002226.02101,"418,26777-3 ",.02)
 ;;26777-3
 ;;9002226.02101,"418,26778-1 ",.01)
 ;;26778-1
 ;;9002226.02101,"418,26778-1 ",.02)
 ;;26778-1
 ;;9002226.02101,"418,26779-9 ",.01)
 ;;26779-9
 ;;9002226.02101,"418,26779-9 ",.02)
 ;;26779-9
 ;;9002226.02101,"418,26780-7 ",.01)
 ;;26780-7
 ;;9002226.02101,"418,26780-7 ",.02)
 ;;26780-7
 ;;9002226.02101,"418,26781-5 ",.01)
 ;;26781-5
 ;;9002226.02101,"418,26781-5 ",.02)
 ;;26781-5
 ;;9002226.02101,"418,26782-3 ",.01)
 ;;26782-3
 ;;9002226.02101,"418,26782-3 ",.02)
 ;;26782-3
 ;;9002226.02101,"418,26783-1 ",.01)
 ;;26783-1
 ;;9002226.02101,"418,26783-1 ",.02)
 ;;26783-1
 ;;9002226.02101,"418,26817-7 ",.01)
 ;;26817-7
 ;;9002226.02101,"418,26817-7 ",.02)
 ;;26817-7
 ;;9002226.02101,"418,26853-2 ",.01)
 ;;26853-2
 ;;9002226.02101,"418,26853-2 ",.02)
 ;;26853-2
 ;;9002226.02101,"418,26854-0 ",.01)
 ;;26854-0
 ;;9002226.02101,"418,26854-0 ",.02)
 ;;26854-0
 ;;9002226.02101,"418,27432-4 ",.01)
 ;;27432-4
 ;;9002226.02101,"418,27432-4 ",.02)
 ;;27432-4
 ;;9002226.02101,"418,29329-0 ",.01)
 ;;29329-0
 ;;9002226.02101,"418,29329-0 ",.02)
 ;;29329-0
 ;;9002226.02101,"418,29330-8 ",.01)
 ;;29330-8
 ;;9002226.02101,"418,29330-8 ",.02)
 ;;29330-8
 ;;9002226.02101,"418,29331-6 ",.01)
 ;;29331-6
 ;;9002226.02101,"418,29331-6 ",.02)
 ;;29331-6
 ;;9002226.02101,"418,29332-4 ",.01)
 ;;29332-4
 ;;9002226.02101,"418,29332-4 ",.02)
 ;;29332-4
 ;;9002226.02101,"418,29412-4 ",.01)
 ;;29412-4
 ;;9002226.02101,"418,29412-4 ",.02)
 ;;29412-4
 ;;9002226.02101,"418,30251-3 ",.01)
 ;;30251-3
 ;;9002226.02101,"418,30251-3 ",.02)
 ;;30251-3
 ;;9002226.02101,"418,30252-1 ",.01)
 ;;30252-1
 ;;9002226.02101,"418,30252-1 ",.02)
 ;;30252-1
 ;;9002226.02101,"418,30253-9 ",.01)
 ;;30253-9
 ;;9002226.02101,"418,30253-9 ",.02)
 ;;30253-9
 ;;9002226.02101,"418,30263-8 ",.01)
 ;;30263-8
 ;;9002226.02101,"418,30263-8 ",.02)
 ;;30263-8
 ;;9002226.02101,"418,30264-6 ",.01)
 ;;30264-6
 ;;9002226.02101,"418,30264-6 ",.02)
 ;;30264-6
 ;;9002226.02101,"418,30265-3 ",.01)
 ;;30265-3
 ;;9002226.02101,"418,30265-3 ",.02)
 ;;30265-3
 ;;9002226.02101,"418,30266-1 ",.01)
 ;;30266-1
 ;;9002226.02101,"418,30266-1 ",.02)
 ;;30266-1
 ;;9002226.02101,"418,30267-9 ",.01)
 ;;30267-9
 ;;9002226.02101,"418,30267-9 ",.02)
 ;;30267-9
 ;;9002226.02101,"418,30344-6 ",.01)
 ;;30344-6
 ;;9002226.02101,"418,30344-6 ",.02)
 ;;30344-6
 ;;9002226.02101,"418,30345-3 ",.01)
 ;;30345-3
 ;;9002226.02101,"418,30345-3 ",.02)
 ;;30345-3
 ;;9002226.02101,"418,30346-1 ",.01)
 ;;30346-1
 ;;9002226.02101,"418,30346-1 ",.02)
 ;;30346-1
 ;;9002226.02101,"418,32016-8 ",.01)
 ;;32016-8
 ;;9002226.02101,"418,32016-8 ",.02)
 ;;32016-8
 ;;9002226.02101,"418,32319-6 ",.01)
 ;;32319-6
