BUD0ZA20 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON DEC 13, 2010;
 ;;5.0;IHS/RPMS UNIFORM DATA SYSTEM;;JAN 18, 2011;Build 12
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1062,00405-4205-02 ",.01)
 ;;00405-4205-02
 ;;9002226.02101,"1062,00405-4205-02 ",.02)
 ;;00405-4205-02
 ;;9002226.02101,"1062,00405-4206-01 ",.01)
 ;;00405-4206-01
 ;;9002226.02101,"1062,00405-4206-01 ",.02)
 ;;00405-4206-01
 ;;9002226.02101,"1062,00405-4206-03 ",.01)
 ;;00405-4206-03
 ;;9002226.02101,"1062,00405-4206-03 ",.02)
 ;;00405-4206-03
 ;;9002226.02101,"1062,00405-5024-01 ",.01)
 ;;00405-5024-01
 ;;9002226.02101,"1062,00405-5024-01 ",.02)
 ;;00405-5024-01
 ;;9002226.02101,"1062,00405-5025-01 ",.01)
 ;;00405-5025-01
 ;;9002226.02101,"1062,00405-5025-01 ",.02)
 ;;00405-5025-01
 ;;9002226.02101,"1062,00405-5025-03 ",.01)
 ;;00405-5025-03
 ;;9002226.02101,"1062,00405-5025-03 ",.02)
 ;;00405-5025-03
 ;;9002226.02101,"1062,00405-5026-01 ",.01)
 ;;00405-5026-01
 ;;9002226.02101,"1062,00405-5026-01 ",.02)
 ;;00405-5026-01
 ;;9002226.02101,"1062,00405-5031-01 ",.01)
 ;;00405-5031-01
 ;;9002226.02101,"1062,00405-5031-01 ",.02)
 ;;00405-5031-01
 ;;9002226.02101,"1062,00405-5031-03 ",.01)
 ;;00405-5031-03
 ;;9002226.02101,"1062,00405-5031-03 ",.02)
 ;;00405-5031-03
 ;;9002226.02101,"1062,00405-5374-01 ",.01)
 ;;00405-5374-01
 ;;9002226.02101,"1062,00405-5374-01 ",.02)
 ;;00405-5374-01
 ;;9002226.02101,"1062,00405-5375-01 ",.01)
 ;;00405-5375-01
 ;;9002226.02101,"1062,00405-5375-01 ",.02)
 ;;00405-5375-01
 ;;9002226.02101,"1062,00405-5376-01 ",.01)
 ;;00405-5376-01
 ;;9002226.02101,"1062,00405-5376-01 ",.02)
 ;;00405-5376-01
 ;;9002226.02101,"1062,00405-5376-03 ",.01)
 ;;00405-5376-03
 ;;9002226.02101,"1062,00405-5376-03 ",.02)
 ;;00405-5376-03
 ;;9002226.02101,"1062,00405-5380-01 ",.01)
 ;;00405-5380-01
 ;;9002226.02101,"1062,00405-5380-01 ",.02)
 ;;00405-5380-01
 ;;9002226.02101,"1062,00405-5380-02 ",.01)
 ;;00405-5380-02
 ;;9002226.02101,"1062,00405-5380-02 ",.02)
 ;;00405-5380-02
 ;;9002226.02101,"1062,00405-5381-01 ",.01)
 ;;00405-5381-01
 ;;9002226.02101,"1062,00405-5381-01 ",.02)
 ;;00405-5381-01
 ;;9002226.02101,"1062,00405-5381-02 ",.01)
 ;;00405-5381-02
 ;;9002226.02101,"1062,00405-5381-02 ",.02)
 ;;00405-5381-02
 ;;9002226.02101,"1062,00536-3462-05 ",.01)
 ;;00536-3462-05
 ;;9002226.02101,"1062,00536-3462-05 ",.02)
 ;;00536-3462-05
 ;;9002226.02101,"1062,00536-5702-01 ",.01)
 ;;00536-5702-01
 ;;9002226.02101,"1062,00536-5702-01 ",.02)
 ;;00536-5702-01
 ;;9002226.02101,"1062,00536-5751-01 ",.01)
 ;;00536-5751-01
 ;;9002226.02101,"1062,00536-5751-01 ",.02)
 ;;00536-5751-01
 ;;9002226.02101,"1062,00536-5752-01 ",.01)
 ;;00536-5752-01
 ;;9002226.02101,"1062,00536-5752-01 ",.02)
 ;;00536-5752-01
 ;;9002226.02101,"1062,00555-0442-02 ",.01)
 ;;00555-0442-02
 ;;9002226.02101,"1062,00555-0442-02 ",.02)
 ;;00555-0442-02
 ;;9002226.02101,"1062,00555-0443-02 ",.01)
 ;;00555-0443-02
 ;;9002226.02101,"1062,00555-0443-02 ",.02)
 ;;00555-0443-02
 ;;9002226.02101,"1062,00555-0625-02 ",.01)
 ;;00555-0625-02
 ;;9002226.02101,"1062,00555-0625-02 ",.02)
 ;;00555-0625-02
 ;;9002226.02101,"1062,00555-0626-02 ",.01)
 ;;00555-0626-02
 ;;9002226.02101,"1062,00555-0626-02 ",.02)
 ;;00555-0626-02
 ;;9002226.02101,"1062,00555-0627-02 ",.01)
 ;;00555-0627-02
 ;;9002226.02101,"1062,00555-0627-02 ",.02)
 ;;00555-0627-02
 ;;9002226.02101,"1062,00591-0460-01 ",.01)
 ;;00591-0460-01
 ;;9002226.02101,"1062,00591-0460-01 ",.02)
 ;;00591-0460-01
 ;;9002226.02101,"1062,00591-0460-05 ",.01)
 ;;00591-0460-05
 ;;9002226.02101,"1062,00591-0460-05 ",.02)
 ;;00591-0460-05
 ;;9002226.02101,"1062,00591-0460-10 ",.01)
 ;;00591-0460-10
 ;;9002226.02101,"1062,00591-0460-10 ",.02)
 ;;00591-0460-10
 ;;9002226.02101,"1062,00591-0461-01 ",.01)
 ;;00591-0461-01
 ;;9002226.02101,"1062,00591-0461-01 ",.02)
 ;;00591-0461-01
 ;;9002226.02101,"1062,00591-0461-05 ",.01)
 ;;00591-0461-05
 ;;9002226.02101,"1062,00591-0461-05 ",.02)
 ;;00591-0461-05
 ;;9002226.02101,"1062,00591-0461-10 ",.01)
 ;;00591-0461-10
 ;;9002226.02101,"1062,00591-0461-10 ",.02)
 ;;00591-0461-10
 ;;9002226.02101,"1062,00591-0844-01 ",.01)
 ;;00591-0844-01
 ;;9002226.02101,"1062,00591-0844-01 ",.02)
 ;;00591-0844-01
 ;;9002226.02101,"1062,00591-0844-10 ",.01)
 ;;00591-0844-10
 ;;9002226.02101,"1062,00591-0844-10 ",.02)
 ;;00591-0844-10
 ;;9002226.02101,"1062,00591-0844-15 ",.01)
 ;;00591-0844-15
 ;;9002226.02101,"1062,00591-0844-15 ",.02)
 ;;00591-0844-15
 ;;9002226.02101,"1062,00591-0845-01 ",.01)
 ;;00591-0845-01
 ;;9002226.02101,"1062,00591-0845-01 ",.02)
 ;;00591-0845-01
 ;;9002226.02101,"1062,00591-0845-10 ",.01)
 ;;00591-0845-10
 ;;9002226.02101,"1062,00591-0845-10 ",.02)
 ;;00591-0845-10
 ;;9002226.02101,"1062,00591-0845-15 ",.01)
 ;;00591-0845-15
 ;;9002226.02101,"1062,00591-0845-15 ",.02)
 ;;00591-0845-15
 ;;9002226.02101,"1062,00591-0900-30 ",.01)
 ;;00591-0900-30
 ;;9002226.02101,"1062,00591-0900-30 ",.02)
 ;;00591-0900-30
 ;;9002226.02101,"1062,00591-3971-01 ",.01)
 ;;00591-3971-01
 ;;9002226.02101,"1062,00591-3971-01 ",.02)
 ;;00591-3971-01
 ;;9002226.02101,"1062,00591-3972-01 ",.01)
 ;;00591-3972-01
 ;;9002226.02101,"1062,00591-3972-01 ",.02)
 ;;00591-3972-01
 ;;9002226.02101,"1062,00591-3973-01 ",.01)
 ;;00591-3973-01
 ;;9002226.02101,"1062,00591-3973-01 ",.02)
 ;;00591-3973-01
 ;;9002226.02101,"1062,00603-2835-28 ",.01)
 ;;00603-2835-28
