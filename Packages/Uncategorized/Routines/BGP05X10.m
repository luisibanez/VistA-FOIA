BGP05X10 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"686,54868-5470-00 ",.02)
 ;;54868-5470-00
 ;;9002226.02101,"686,54868-5470-01 ",.01)
 ;;54868-5470-01
 ;;9002226.02101,"686,54868-5470-01 ",.02)
 ;;54868-5470-01
 ;;9002226.02101,"686,54868-5479-00 ",.01)
 ;;54868-5479-00
 ;;9002226.02101,"686,54868-5479-00 ",.02)
 ;;54868-5479-00
 ;;9002226.02101,"686,54868-5479-01 ",.01)
 ;;54868-5479-01
 ;;9002226.02101,"686,54868-5479-01 ",.02)
 ;;54868-5479-01
 ;;9002226.02101,"686,54868-5544-00 ",.01)
 ;;54868-5544-00
 ;;9002226.02101,"686,54868-5544-00 ",.02)
 ;;54868-5544-00
 ;;9002226.02101,"686,54868-5544-01 ",.01)
 ;;54868-5544-01
 ;;9002226.02101,"686,54868-5544-01 ",.02)
 ;;54868-5544-01
 ;;9002226.02101,"686,54868-5544-02 ",.01)
 ;;54868-5544-02
 ;;9002226.02101,"686,54868-5544-02 ",.02)
 ;;54868-5544-02
 ;;9002226.02101,"686,54868-5720-00 ",.01)
 ;;54868-5720-00
 ;;9002226.02101,"686,54868-5720-00 ",.02)
 ;;54868-5720-00
 ;;9002226.02101,"686,54868-5720-01 ",.01)
 ;;54868-5720-01
 ;;9002226.02101,"686,54868-5720-01 ",.02)
 ;;54868-5720-01
 ;;9002226.02101,"686,54868-5832-00 ",.01)
 ;;54868-5832-00
 ;;9002226.02101,"686,54868-5832-00 ",.02)
 ;;54868-5832-00
 ;;9002226.02101,"686,54868-5832-01 ",.01)
 ;;54868-5832-01
 ;;9002226.02101,"686,54868-5832-01 ",.02)
 ;;54868-5832-01
 ;;9002226.02101,"686,55045-1264-08 ",.01)
 ;;55045-1264-08
 ;;9002226.02101,"686,55045-1264-08 ",.02)
 ;;55045-1264-08
 ;;9002226.02101,"686,55045-1283-00 ",.01)
 ;;55045-1283-00
 ;;9002226.02101,"686,55045-1283-00 ",.02)
 ;;55045-1283-00
 ;;9002226.02101,"686,55045-1283-08 ",.01)
 ;;55045-1283-08
 ;;9002226.02101,"686,55045-1283-08 ",.02)
 ;;55045-1283-08
 ;;9002226.02101,"686,55045-1689-08 ",.01)
 ;;55045-1689-08
 ;;9002226.02101,"686,55045-1689-08 ",.02)
 ;;55045-1689-08
 ;;9002226.02101,"686,55045-2954-08 ",.01)
 ;;55045-2954-08
 ;;9002226.02101,"686,55045-2954-08 ",.02)
 ;;55045-2954-08
 ;;9002226.02101,"686,55045-3817-08 ",.01)
 ;;55045-3817-08
 ;;9002226.02101,"686,55045-3817-08 ",.02)
 ;;55045-3817-08
 ;;9002226.02101,"686,55289-0158-90 ",.01)
 ;;55289-0158-90
 ;;9002226.02101,"686,55289-0158-90 ",.02)
 ;;55289-0158-90
 ;;9002226.02101,"686,55289-0300-07 ",.01)
 ;;55289-0300-07
 ;;9002226.02101,"686,55289-0300-07 ",.02)
 ;;55289-0300-07
 ;;9002226.02101,"686,55289-0302-07 ",.01)
 ;;55289-0302-07
 ;;9002226.02101,"686,55289-0302-07 ",.02)
 ;;55289-0302-07
 ;;9002226.02101,"686,55289-0302-14 ",.01)
 ;;55289-0302-14
 ;;9002226.02101,"686,55289-0302-14 ",.02)
 ;;55289-0302-14
 ;;9002226.02101,"686,55289-0302-28 ",.01)
 ;;55289-0302-28
 ;;9002226.02101,"686,55289-0302-28 ",.02)
 ;;55289-0302-28
 ;;9002226.02101,"686,55289-0302-30 ",.01)
 ;;55289-0302-30
 ;;9002226.02101,"686,55289-0302-30 ",.02)
 ;;55289-0302-30
 ;;9002226.02101,"686,55289-0313-07 ",.01)
 ;;55289-0313-07
 ;;9002226.02101,"686,55289-0313-07 ",.02)
 ;;55289-0313-07
 ;;9002226.02101,"686,55289-0313-14 ",.01)
 ;;55289-0313-14
 ;;9002226.02101,"686,55289-0313-14 ",.02)
 ;;55289-0313-14
 ;;9002226.02101,"686,55289-0313-16 ",.01)
 ;;55289-0313-16
 ;;9002226.02101,"686,55289-0313-16 ",.02)
 ;;55289-0313-16
 ;;9002226.02101,"686,55289-0313-21 ",.01)
 ;;55289-0313-21
 ;;9002226.02101,"686,55289-0313-21 ",.02)
 ;;55289-0313-21
 ;;9002226.02101,"686,55289-0313-28 ",.01)
 ;;55289-0313-28
 ;;9002226.02101,"686,55289-0313-28 ",.02)
 ;;55289-0313-28
 ;;9002226.02101,"686,55289-0313-30 ",.01)
 ;;55289-0313-30
 ;;9002226.02101,"686,55289-0313-30 ",.02)
 ;;55289-0313-30
 ;;9002226.02101,"686,55289-0313-60 ",.01)
 ;;55289-0313-60
 ;;9002226.02101,"686,55289-0313-60 ",.02)
 ;;55289-0313-60
 ;;9002226.02101,"686,55289-0368-07 ",.01)
 ;;55289-0368-07
 ;;9002226.02101,"686,55289-0368-07 ",.02)
 ;;55289-0368-07
 ;;9002226.02101,"686,55289-0368-14 ",.01)
 ;;55289-0368-14
 ;;9002226.02101,"686,55289-0368-14 ",.02)
 ;;55289-0368-14
 ;;9002226.02101,"686,55289-0368-30 ",.01)
 ;;55289-0368-30
 ;;9002226.02101,"686,55289-0368-30 ",.02)
 ;;55289-0368-30
 ;;9002226.02101,"686,55289-0379-30 ",.01)
 ;;55289-0379-30
 ;;9002226.02101,"686,55289-0379-30 ",.02)
 ;;55289-0379-30
 ;;9002226.02101,"686,55289-0432-28 ",.01)
 ;;55289-0432-28
 ;;9002226.02101,"686,55289-0432-28 ",.02)
 ;;55289-0432-28
 ;;9002226.02101,"686,55289-0432-56 ",.01)
 ;;55289-0432-56
 ;;9002226.02101,"686,55289-0432-56 ",.02)
 ;;55289-0432-56
 ;;9002226.02101,"686,55289-0432-60 ",.01)
 ;;55289-0432-60
 ;;9002226.02101,"686,55289-0432-60 ",.02)
 ;;55289-0432-60
 ;;9002226.02101,"686,55289-0432-90 ",.01)
 ;;55289-0432-90
 ;;9002226.02101,"686,55289-0432-90 ",.02)
 ;;55289-0432-90
 ;;9002226.02101,"686,55289-0537-30 ",.01)
 ;;55289-0537-30
 ;;9002226.02101,"686,55289-0537-30 ",.02)
 ;;55289-0537-30
 ;;9002226.02101,"686,55289-0624-07 ",.01)
 ;;55289-0624-07
 ;;9002226.02101,"686,55289-0624-07 ",.02)
 ;;55289-0624-07
 ;;9002226.02101,"686,55289-0624-14 ",.01)
 ;;55289-0624-14
 ;;9002226.02101,"686,55289-0624-14 ",.02)
 ;;55289-0624-14
 ;;9002226.02101,"686,55289-0624-28 ",.01)
 ;;55289-0624-28
 ;;9002226.02101,"686,55289-0624-28 ",.02)
 ;;55289-0624-28
 ;;9002226.02101,"686,55289-0624-30 ",.01)
 ;;55289-0624-30
 ;;9002226.02101,"686,55289-0624-30 ",.02)
 ;;55289-0624-30
 ;;9002226.02101,"686,55289-0680-60 ",.01)
 ;;55289-0680-60
 ;;9002226.02101,"686,55289-0680-60 ",.02)
 ;;55289-0680-60
 ;;9002226.02101,"686,55289-0680-90 ",.01)
 ;;55289-0680-90
 ;;9002226.02101,"686,55289-0680-90 ",.02)
 ;;55289-0680-90
 ;;9002226.02101,"686,55289-0700-30 ",.01)
 ;;55289-0700-30
 ;;9002226.02101,"686,55289-0700-30 ",.02)
 ;;55289-0700-30
 ;;9002226.02101,"686,55289-0700-60 ",.01)
 ;;55289-0700-60
 ;;9002226.02101,"686,55289-0700-60 ",.02)
 ;;55289-0700-60
 ;;9002226.02101,"686,55289-0700-90 ",.01)
 ;;55289-0700-90
 ;;9002226.02101,"686,55289-0700-90 ",.02)
 ;;55289-0700-90
 ;;9002226.02101,"686,55289-0701-07 ",.01)
 ;;55289-0701-07
 ;;9002226.02101,"686,55289-0701-07 ",.02)
 ;;55289-0701-07
 ;;9002226.02101,"686,55289-0701-14 ",.01)
 ;;55289-0701-14
 ;;9002226.02101,"686,55289-0701-14 ",.02)
 ;;55289-0701-14
 ;;9002226.02101,"686,55289-0701-15 ",.01)
 ;;55289-0701-15
 ;;9002226.02101,"686,55289-0701-15 ",.02)
 ;;55289-0701-15
 ;;9002226.02101,"686,55289-0701-21 ",.01)
 ;;55289-0701-21
 ;;9002226.02101,"686,55289-0701-21 ",.02)
 ;;55289-0701-21
 ;;9002226.02101,"686,55289-0701-28 ",.01)
 ;;55289-0701-28
 ;;9002226.02101,"686,55289-0701-28 ",.02)
 ;;55289-0701-28
 ;;9002226.02101,"686,55289-0701-30 ",.01)
 ;;55289-0701-30
 ;;9002226.02101,"686,55289-0701-30 ",.02)
 ;;55289-0701-30
 ;;9002226.02101,"686,55289-0701-45 ",.01)
 ;;55289-0701-45
 ;;9002226.02101,"686,55289-0701-45 ",.02)
 ;;55289-0701-45
 ;;9002226.02101,"686,55289-0701-60 ",.01)
 ;;55289-0701-60
 ;;9002226.02101,"686,55289-0701-60 ",.02)
 ;;55289-0701-60
 ;;9002226.02101,"686,55289-0701-90 ",.01)
 ;;55289-0701-90
 ;;9002226.02101,"686,55289-0701-90 ",.02)
 ;;55289-0701-90
 ;;9002226.02101,"686,55289-0701-98 ",.01)
 ;;55289-0701-98
 ;;9002226.02101,"686,55289-0701-98 ",.02)
 ;;55289-0701-98
 ;;9002226.02101,"686,55289-0722-60 ",.01)
 ;;55289-0722-60
 ;;9002226.02101,"686,55289-0722-60 ",.02)
 ;;55289-0722-60
 ;;9002226.02101,"686,55289-0722-90 ",.01)
 ;;55289-0722-90
 ;;9002226.02101,"686,55289-0722-90 ",.02)
 ;;55289-0722-90
 ;;9002226.02101,"686,55289-0791-07 ",.01)
 ;;55289-0791-07
 ;;9002226.02101,"686,55289-0791-07 ",.02)
 ;;55289-0791-07
 ;;9002226.02101,"686,55289-0791-14 ",.01)
 ;;55289-0791-14
 ;;9002226.02101,"686,55289-0791-14 ",.02)
 ;;55289-0791-14
 ;;9002226.02101,"686,55289-0791-15 ",.01)
 ;;55289-0791-15
 ;;9002226.02101,"686,55289-0791-15 ",.02)
 ;;55289-0791-15
 ;;9002226.02101,"686,55289-0791-21 ",.01)
 ;;55289-0791-21
 ;;9002226.02101,"686,55289-0791-21 ",.02)
 ;;55289-0791-21
 ;;9002226.02101,"686,55289-0791-28 ",.01)
 ;;55289-0791-28
 ;;9002226.02101,"686,55289-0791-28 ",.02)
 ;;55289-0791-28
 ;;9002226.02101,"686,55289-0791-30 ",.01)
 ;;55289-0791-30
 ;;9002226.02101,"686,55289-0791-30 ",.02)
 ;;55289-0791-30
 ;;9002226.02101,"686,55289-0791-60 ",.01)
 ;;55289-0791-60
 ;;9002226.02101,"686,55289-0791-60 ",.02)
 ;;55289-0791-60
 ;;9002226.02101,"686,55289-0794-01 ",.01)
 ;;55289-0794-01
 ;;9002226.02101,"686,55289-0794-01 ",.02)
 ;;55289-0794-01
 ;;9002226.02101,"686,55289-0794-07 ",.01)
 ;;55289-0794-07
 ;;9002226.02101,"686,55289-0794-07 ",.02)
 ;;55289-0794-07
 ;;9002226.02101,"686,55289-0794-14 ",.01)
 ;;55289-0794-14
 ;;9002226.02101,"686,55289-0794-14 ",.02)
 ;;55289-0794-14
 ;;9002226.02101,"686,55289-0794-21 ",.01)
 ;;55289-0794-21
 ;;9002226.02101,"686,55289-0794-21 ",.02)
 ;;55289-0794-21
 ;;9002226.02101,"686,55289-0794-28 ",.01)
 ;;55289-0794-28
 ;;9002226.02101,"686,55289-0794-28 ",.02)
 ;;55289-0794-28
 ;;9002226.02101,"686,55289-0794-30 ",.01)
 ;;55289-0794-30
 ;;9002226.02101,"686,55289-0794-30 ",.02)
 ;;55289-0794-30
 ;;9002226.02101,"686,55289-0794-93 ",.01)
 ;;55289-0794-93
 ;;9002226.02101,"686,55289-0794-93 ",.02)
 ;;55289-0794-93
 ;;9002226.02101,"686,55289-0819-30 ",.01)
 ;;55289-0819-30
 ;;9002226.02101,"686,55289-0819-30 ",.02)
 ;;55289-0819-30
 ;;9002226.02101,"686,55289-0819-60 ",.01)
 ;;55289-0819-60
 ;;9002226.02101,"686,55289-0819-60 ",.02)
 ;;55289-0819-60
 ;;9002226.02101,"686,55289-0819-90 ",.01)
 ;;55289-0819-90
 ;;9002226.02101,"686,55289-0819-90 ",.02)
 ;;55289-0819-90
 ;;9002226.02101,"686,55289-0829-30 ",.01)
 ;;55289-0829-30
 ;;9002226.02101,"686,55289-0829-30 ",.02)
 ;;55289-0829-30
 ;;9002226.02101,"686,55289-0829-60 ",.01)
 ;;55289-0829-60
 ;;9002226.02101,"686,55289-0829-60 ",.02)
 ;;55289-0829-60
 ;;9002226.02101,"686,55289-0829-90 ",.01)
 ;;55289-0829-90
 ;;9002226.02101,"686,55289-0829-90 ",.02)
 ;;55289-0829-90
 ;;9002226.02101,"686,55289-0834-07 ",.01)
 ;;55289-0834-07
 ;;9002226.02101,"686,55289-0834-07 ",.02)
 ;;55289-0834-07
 ;;9002226.02101,"686,55289-0834-14 ",.01)
 ;;55289-0834-14
 ;;9002226.02101,"686,55289-0834-14 ",.02)
 ;;55289-0834-14
 ;;9002226.02101,"686,55289-0834-21 ",.01)
 ;;55289-0834-21
 ;;9002226.02101,"686,55289-0834-21 ",.02)
 ;;55289-0834-21
 ;;9002226.02101,"686,55289-0834-28 ",.01)
 ;;55289-0834-28
 ;;9002226.02101,"686,55289-0834-28 ",.02)
 ;;55289-0834-28
 ;;9002226.02101,"686,55289-0834-30 ",.01)
 ;;55289-0834-30
 ;;9002226.02101,"686,55289-0834-30 ",.02)
 ;;55289-0834-30
 ;;9002226.02101,"686,55289-0834-56 ",.01)
 ;;55289-0834-56
 ;;9002226.02101,"686,55289-0834-56 ",.02)
 ;;55289-0834-56
 ;;9002226.02101,"686,55289-0834-60 ",.01)
 ;;55289-0834-60
 ;;9002226.02101,"686,55289-0834-60 ",.02)
 ;;55289-0834-60
 ;;9002226.02101,"686,55289-0834-84 ",.01)
 ;;55289-0834-84
 ;;9002226.02101,"686,55289-0834-84 ",.02)
 ;;55289-0834-84
 ;;9002226.02101,"686,55289-0834-86 ",.01)
 ;;55289-0834-86
 ;;9002226.02101,"686,55289-0834-86 ",.02)
 ;;55289-0834-86
 ;;9002226.02101,"686,55289-0834-88 ",.01)
 ;;55289-0834-88
 ;;9002226.02101,"686,55289-0834-88 ",.02)
 ;;55289-0834-88
 ;;9002226.02101,"686,55289-0834-89 ",.01)
 ;;55289-0834-89
 ;;9002226.02101,"686,55289-0834-89 ",.02)
 ;;55289-0834-89
 ;;9002226.02101,"686,55289-0834-90 ",.01)
 ;;55289-0834-90
 ;;9002226.02101,"686,55289-0834-90 ",.02)
 ;;55289-0834-90
 ;;9002226.02101,"686,55289-0834-93 ",.01)
 ;;55289-0834-93
 ;;9002226.02101,"686,55289-0834-93 ",.02)
 ;;55289-0834-93
 ;;9002226.02101,"686,55289-0834-98 ",.01)
 ;;55289-0834-98
 ;;9002226.02101,"686,55289-0834-98 ",.02)
 ;;55289-0834-98
 ;;9002226.02101,"686,55289-0834-99 ",.01)
 ;;55289-0834-99
 ;;9002226.02101,"686,55289-0834-99 ",.02)
 ;;55289-0834-99
 ;;9002226.02101,"686,55289-0835-30 ",.01)
 ;;55289-0835-30
 ;;9002226.02101,"686,55289-0835-30 ",.02)
 ;;55289-0835-30
 ;;9002226.02101,"686,55289-0835-90 ",.01)
 ;;55289-0835-90
 ;;9002226.02101,"686,55289-0835-90 ",.02)
 ;;55289-0835-90
 ;;9002226.02101,"686,55289-0854-30 ",.01)
 ;;55289-0854-30
 ;;9002226.02101,"686,55289-0854-30 ",.02)
 ;;55289-0854-30
 ;;9002226.02101,"686,55289-0854-90 ",.01)
 ;;55289-0854-90
 ;;9002226.02101,"686,55289-0854-90 ",.02)
 ;;55289-0854-90
 ;;9002226.02101,"686,55289-0859-30 ",.01)
 ;;55289-0859-30
 ;;9002226.02101,"686,55289-0859-30 ",.02)
 ;;55289-0859-30
 ;;9002226.02101,"686,55289-0859-90 ",.01)
 ;;55289-0859-90
 ;;9002226.02101,"686,55289-0859-90 ",.02)
 ;;55289-0859-90
 ;;9002226.02101,"686,55289-0975-90 ",.01)
 ;;55289-0975-90
 ;;9002226.02101,"686,55289-0975-90 ",.02)
 ;;55289-0975-90
 ;;9002226.02101,"686,55499-1082-01 ",.01)
 ;;55499-1082-01
 ;;9002226.02101,"686,55499-1082-01 ",.02)
 ;;55499-1082-01
 ;;9002226.02101,"686,55887-0080-07 ",.01)
 ;;55887-0080-07
 ;;9002226.02101,"686,55887-0080-07 ",.02)
 ;;55887-0080-07
 ;;9002226.02101,"686,55887-0080-30 ",.01)
 ;;55887-0080-30
 ;;9002226.02101,"686,55887-0080-30 ",.02)
 ;;55887-0080-30
 ;;9002226.02101,"686,55887-0080-60 ",.01)
 ;;55887-0080-60
 ;;9002226.02101,"686,55887-0080-60 ",.02)
 ;;55887-0080-60
 ;;9002226.02101,"686,55887-0224-15 ",.01)
 ;;55887-0224-15
 ;;9002226.02101,"686,55887-0224-15 ",.02)
 ;;55887-0224-15
 ;;9002226.02101,"686,55887-0224-30 ",.01)
 ;;55887-0224-30
 ;;9002226.02101,"686,55887-0224-30 ",.02)
 ;;55887-0224-30
 ;;9002226.02101,"686,55887-0225-14 ",.01)
 ;;55887-0225-14
 ;;9002226.02101,"686,55887-0225-14 ",.02)
 ;;55887-0225-14
 ;;9002226.02101,"686,55887-0225-15 ",.01)
 ;;55887-0225-15
 ;;9002226.02101,"686,55887-0225-15 ",.02)
 ;;55887-0225-15
 ;;9002226.02101,"686,55887-0225-21 ",.01)
 ;;55887-0225-21
 ;;9002226.02101,"686,55887-0225-21 ",.02)
 ;;55887-0225-21
 ;;9002226.02101,"686,55887-0225-28 ",.01)
 ;;55887-0225-28
