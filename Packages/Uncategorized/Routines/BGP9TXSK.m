BGP9TXSK ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"710,40285-9 ",.02)
 ;;40285-9
 ;;9002226.02101,"710,40286-7 ",.01)
 ;;40286-7
 ;;9002226.02101,"710,40286-7 ",.02)
 ;;40286-7
 ;;9002226.02101,"710,40287-5 ",.01)
 ;;40287-5
 ;;9002226.02101,"710,40287-5 ",.02)
 ;;40287-5
 ;;9002226.02101,"710,40318-8 ",.01)
 ;;40318-8
 ;;9002226.02101,"710,40318-8 ",.02)
 ;;40318-8
 ;;9002226.02101,"710,40319-6 ",.01)
 ;;40319-6
 ;;9002226.02101,"710,40319-6 ",.02)
 ;;40319-6
 ;;9002226.02101,"710,40320-4 ",.01)
 ;;40320-4
 ;;9002226.02101,"710,40320-4 ",.02)
 ;;40320-4
 ;;9002226.02101,"710,40321-2 ",.01)
 ;;40321-2
 ;;9002226.02101,"710,40321-2 ",.02)
 ;;40321-2
 ;;9002226.02101,"710,40322-0 ",.01)
 ;;40322-0
 ;;9002226.02101,"710,40322-0 ",.02)
 ;;40322-0
 ;;9002226.02101,"710,40323-8 ",.01)
 ;;40323-8
 ;;9002226.02101,"710,40323-8 ",.02)
 ;;40323-8
 ;;9002226.02101,"710,40324-6 ",.01)
 ;;40324-6
 ;;9002226.02101,"710,40324-6 ",.02)
 ;;40324-6
 ;;9002226.02101,"710,40858-3 ",.01)
 ;;40858-3
 ;;9002226.02101,"710,40858-3 ",.02)
 ;;40858-3
 ;;9002226.02101,"710,40875-7 ",.01)
 ;;40875-7
 ;;9002226.02101,"710,40875-7 ",.02)
 ;;40875-7
 ;;9002226.02101,"710,41024-1 ",.01)
 ;;41024-1
 ;;9002226.02101,"710,41024-1 ",.02)
 ;;41024-1
 ;;9002226.02101,"710,41604-0 ",.01)
 ;;41604-0
 ;;9002226.02101,"710,41604-0 ",.02)
 ;;41604-0
 ;;9002226.02101,"710,41651-1 ",.01)
 ;;41651-1
 ;;9002226.02101,"710,41651-1 ",.02)
 ;;41651-1
 ;;9002226.02101,"710,41652-9 ",.01)
 ;;41652-9
 ;;9002226.02101,"710,41652-9 ",.02)
 ;;41652-9
 ;;9002226.02101,"710,41653-7 ",.01)
 ;;41653-7
 ;;9002226.02101,"710,41653-7 ",.02)
 ;;41653-7
 ;;9002226.02101,"710,42604-9 ",.01)
 ;;42604-9
 ;;9002226.02101,"710,42604-9 ",.02)
 ;;42604-9
 ;;9002226.02101,"710,42609-8 ",.01)
 ;;42609-8
 ;;9002226.02101,"710,42609-8 ",.02)
 ;;42609-8
 ;;9002226.02101,"710,42615-5 ",.01)
 ;;42615-5
 ;;9002226.02101,"710,42615-5 ",.02)
 ;;42615-5
 ;;9002226.02101,"710,42629-6 ",.01)
 ;;42629-6
 ;;9002226.02101,"710,42629-6 ",.02)
 ;;42629-6
 ;;9002226.02101,"710,42631-2 ",.01)
 ;;42631-2
 ;;9002226.02101,"710,42631-2 ",.02)
 ;;42631-2
 ;;9002226.02101,"710,43740-0 ",.01)
 ;;43740-0
 ;;9002226.02101,"710,43740-0 ",.02)
 ;;43740-0
 ;;9002226.02101,"710,44919-9 ",.01)
 ;;44919-9
 ;;9002226.02101,"710,44919-9 ",.02)
 ;;44919-9
 ;;9002226.02101,"710,45052-8 ",.01)
 ;;45052-8
 ;;9002226.02101,"710,45052-8 ",.02)
 ;;45052-8
 ;;9002226.02101,"710,45053-6 ",.01)
 ;;45053-6
 ;;9002226.02101,"710,45053-6 ",.02)
 ;;45053-6
 ;;9002226.02101,"710,45054-4 ",.01)
 ;;45054-4
 ;;9002226.02101,"710,45054-4 ",.02)
 ;;45054-4
 ;;9002226.02101,"710,45055-1 ",.01)
 ;;45055-1
 ;;9002226.02101,"710,45055-1 ",.02)
 ;;45055-1
 ;;9002226.02101,"710,45056-9 ",.01)
 ;;45056-9
 ;;9002226.02101,"710,45056-9 ",.02)
 ;;45056-9
 ;;9002226.02101,"710,45204-5 ",.01)
 ;;45204-5
 ;;9002226.02101,"710,45204-5 ",.02)
 ;;45204-5
 ;;9002226.02101,"710,45205-2 ",.01)
 ;;45205-2
 ;;9002226.02101,"710,45205-2 ",.02)
 ;;45205-2
 ;;9002226.02101,"710,45206-0 ",.01)
 ;;45206-0
 ;;9002226.02101,"710,45206-0 ",.02)
 ;;45206-0
 ;;9002226.02101,"710,45298-7 ",.01)
 ;;45298-7
 ;;9002226.02101,"710,45298-7 ",.02)
 ;;45298-7
 ;;9002226.02101,"710,45299-5 ",.01)
 ;;45299-5
 ;;9002226.02101,"710,45299-5 ",.02)
 ;;45299-5
 ;;9002226.02101,"710,46222-6 ",.01)
 ;;46222-6
 ;;9002226.02101,"710,46222-6 ",.02)
 ;;46222-6
 ;;9002226.02101,"710,46223-4 ",.01)
 ;;46223-4
 ;;9002226.02101,"710,46223-4 ",.02)
 ;;46223-4
 ;;9002226.02101,"710,47622-6 ",.01)
 ;;47622-6
 ;;9002226.02101,"710,47622-6 ",.02)
 ;;47622-6
 ;;9002226.02101,"710,47859-4 ",.01)
 ;;47859-4
 ;;9002226.02101,"710,47859-4 ",.02)
 ;;47859-4
 ;;9002226.02101,"710,48109-3 ",.01)
 ;;48109-3
 ;;9002226.02101,"710,48109-3 ",.02)
 ;;48109-3
 ;;9002226.02101,"710,48605-0 ",.01)
 ;;48605-0
 ;;9002226.02101,"710,48605-0 ",.02)
 ;;48605-0
 ;;9002226.02101,"710,48606-8 ",.01)
 ;;48606-8
 ;;9002226.02101,"710,48606-8 ",.02)
 ;;48606-8
 ;;9002226.02101,"710,48607-6 ",.01)
 ;;48607-6
 ;;9002226.02101,"710,48607-6 ",.02)
 ;;48607-6
 ;;9002226.02101,"710,48810-6 ",.01)
 ;;48810-6
 ;;9002226.02101,"710,48810-6 ",.02)
 ;;48810-6
 ;;9002226.02101,"710,48983-1 ",.01)
 ;;48983-1
 ;;9002226.02101,"710,48983-1 ",.02)
 ;;48983-1
 ;;9002226.02101,"710,48984-9 ",.01)
 ;;48984-9
 ;;9002226.02101,"710,48984-9 ",.02)
 ;;48984-9
 ;;9002226.02101,"710,48985-6 ",.01)
 ;;48985-6
 ;;9002226.02101,"710,48985-6 ",.02)
 ;;48985-6
 ;;9002226.02101,"710,48986-4 ",.01)
 ;;48986-4
 ;;9002226.02101,"710,48986-4 ",.02)
 ;;48986-4
 ;;9002226.02101,"710,48988-0 ",.01)
 ;;48988-0
 ;;9002226.02101,"710,48988-0 ",.02)
 ;;48988-0
 ;;9002226.02101,"710,48989-8 ",.01)
 ;;48989-8
 ;;9002226.02101,"710,48989-8 ",.02)
 ;;48989-8
 ;;9002226.02101,"710,48990-6 ",.01)
 ;;48990-6
 ;;9002226.02101,"710,48990-6 ",.02)
 ;;48990-6
 ;;9002226.02101,"710,48991-4 ",.01)
 ;;48991-4
 ;;9002226.02101,"710,48991-4 ",.02)
 ;;48991-4
 ;;9002226.02101,"710,48992-2 ",.01)
 ;;48992-2
 ;;9002226.02101,"710,48992-2 ",.02)
 ;;48992-2
 ;;9002226.02101,"710,48993-0 ",.01)
 ;;48993-0
 ;;9002226.02101,"710,48993-0 ",.02)
 ;;48993-0