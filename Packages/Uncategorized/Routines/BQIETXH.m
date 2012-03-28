BQIETXH ;PRXM/HC/ALA-CREATED BY ^ATXSTX ON OCT 01, 2007;
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 ;;DM AUDIT FASTING GLUC LOINC
 ;
 ; This routine loads Taxonomy DM AUDIT FASTING GLUC LOINC
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 D OTHER
 I $O(^TMP("ATX",$J,3.6,0)) D BULL^ATXSTX2
 I $O(^TMP("ATX",$J,9002226,0)) D TAX^ATXSTX2
 D KILL^ATXSTX2
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"10450-5 ")
 ;;1
 ;;21,"12638-3 ")
 ;;2
 ;;21,"14769-4 ")
 ;;3
 ;;21,"14770-2 ")
 ;;4
 ;;21,"14771-0 ")
 ;;5
 ;;21,"14996-3 ")
 ;;6
 ;;21,"1548-7 ")
 ;;7
 ;;21,"1549-5 ")
 ;;8
 ;;21,"1550-3 ")
 ;;9
 ;;21,"1551-1 ")
 ;;10
 ;;21,"1552-9 ")
 ;;11
 ;;21,"1553-7 ")
 ;;12
 ;;21,"1554-5 ")
 ;;13
 ;;21,"1556-0 ")
 ;;14
 ;;21,"1557-8 ")
 ;;15
 ;;21,"1558-6 ")
 ;;16
 ;;21,"16913-6 ")
 ;;17
 ;;21,"17865-7 ")
 ;;18
 ;;21,"25680-0 ")
 ;;19
 ;;21,"35184-1 ")
 ;;20
 ;;21,"39997-2 ")
 ;;21
 ;;21,"40148-9 ")
 ;;22
 ;;21,"40193-5 ")
 ;;23
 ;;21,"40196-8 ")
 ;;24
 ;;21,"40318-8 ")
 ;;25
 ;;21,"41604-0 ")
 ;;26
 ;;21,"6764-5 ")
 ;;27
 ;;9002226,544,.01)
 ;;DM AUDIT FASTING GLUC LOINC
 ;;9002226,544,.02)
 ;;@
 ;;9002226,544,.04)
 ;;n
 ;;9002226,544,.06)
 ;;@
 ;;9002226,544,.08)
 ;;@
 ;;9002226,544,.09)
 ;;@
 ;;9002226,544,.11)
 ;;@
 ;;9002226,544,.12)
 ;;@
 ;;9002226,544,.13)
 ;;1
 ;;9002226,544,.14)
 ;;FIHS
 ;;9002226,544,.15)
 ;;95.3
 ;;9002226,544,.16)
 ;;@
 ;;9002226,544,.17)
 ;;@
 ;;9002226,544,3101)
 ;;@
 ;;9002226.02101,"544,10450-5 ",.01)
 ;;10450-5
 ;;9002226.02101,"544,10450-5 ",.02)
 ;;10450-5
 ;;9002226.02101,"544,12638-3 ",.01)
 ;;12638-3
 ;;9002226.02101,"544,12638-3 ",.02)
 ;;12638-3
 ;;9002226.02101,"544,14769-4 ",.01)
 ;;14769-4
 ;;9002226.02101,"544,14769-4 ",.02)
 ;;14769-4
 ;;9002226.02101,"544,14770-2 ",.01)
 ;;14770-2
 ;;9002226.02101,"544,14770-2 ",.02)
 ;;14770-2
 ;;9002226.02101,"544,14771-0 ",.01)
 ;;14771-0
 ;;9002226.02101,"544,14771-0 ",.02)
 ;;14771-0
 ;;9002226.02101,"544,14996-3 ",.01)
 ;;14996-3
 ;;9002226.02101,"544,14996-3 ",.02)
 ;;14996-3
 ;;9002226.02101,"544,1548-7 ",.01)
 ;;1548-7
 ;;9002226.02101,"544,1548-7 ",.02)
 ;;1548-7
 ;;9002226.02101,"544,1549-5 ",.01)
 ;;1549-5
 ;;9002226.02101,"544,1549-5 ",.02)
 ;;1549-5
 ;;9002226.02101,"544,1550-3 ",.01)
 ;;1550-3
 ;;9002226.02101,"544,1550-3 ",.02)
 ;;1550-3
 ;;9002226.02101,"544,1551-1 ",.01)
 ;;1551-1
 ;;9002226.02101,"544,1551-1 ",.02)
 ;;1551-1
 ;;9002226.02101,"544,1552-9 ",.01)
 ;;1552-9
 ;;9002226.02101,"544,1552-9 ",.02)
 ;;1552-9
 ;;9002226.02101,"544,1553-7 ",.01)
 ;;1553-7
 ;;9002226.02101,"544,1553-7 ",.02)
 ;;1553-7
 ;;9002226.02101,"544,1554-5 ",.01)
 ;;1554-5
 ;;9002226.02101,"544,1554-5 ",.02)
 ;;1554-5
 ;;9002226.02101,"544,1556-0 ",.01)
 ;;1556-0
 ;;9002226.02101,"544,1556-0 ",.02)
 ;;1556-0
 ;;9002226.02101,"544,1557-8 ",.01)
 ;;1557-8
 ;;9002226.02101,"544,1557-8 ",.02)
 ;;1557-8
 ;;9002226.02101,"544,1558-6 ",.01)
 ;;1558-6
 ;;9002226.02101,"544,1558-6 ",.02)
 ;;1558-6
 ;;9002226.02101,"544,16913-6 ",.01)
 ;;16913-6
 ;;9002226.02101,"544,16913-6 ",.02)
 ;;16913-6
 ;;9002226.02101,"544,17865-7 ",.01)
 ;;17865-7
 ;;9002226.02101,"544,17865-7 ",.02)
 ;;17865-7
 ;;9002226.02101,"544,25680-0 ",.01)
 ;;25680-0
 ;;9002226.02101,"544,25680-0 ",.02)
 ;;25680-0
 ;;9002226.02101,"544,35184-1 ",.01)
 ;;35184-1
 ;;9002226.02101,"544,35184-1 ",.02)
 ;;35184-1
 ;;9002226.02101,"544,39997-2 ",.01)
 ;;39997-2
 ;;9002226.02101,"544,39997-2 ",.02)
 ;;39997-2
 ;;9002226.02101,"544,40148-9 ",.01)
 ;;40148-9
 ;;9002226.02101,"544,40148-9 ",.02)
 ;;40148-9
 ;;9002226.02101,"544,40193-5 ",.01)
 ;;40193-5
 ;;9002226.02101,"544,40193-5 ",.02)
 ;;40193-5
 ;;9002226.02101,"544,40196-8 ",.01)
 ;;40196-8
 ;;9002226.02101,"544,40196-8 ",.02)
 ;;40196-8
 ;;9002226.02101,"544,40318-8 ",.01)
 ;;40318-8
 ;;9002226.02101,"544,40318-8 ",.02)
 ;;40318-8
 ;;9002226.02101,"544,41604-0 ",.01)
 ;;41604-0
 ;;9002226.02101,"544,41604-0 ",.02)
 ;;41604-0
 ;;9002226.02101,"544,6764-5 ",.01)
 ;;6764-5
 ;;9002226.02101,"544,6764-5 ",.02)
 ;;6764-5
 ;
OTHER ; OTHER ROUTINES
 Q
