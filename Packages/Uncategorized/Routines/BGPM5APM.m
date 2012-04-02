BGPM5APM ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON AUG 12, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;;BGPMU POAG NERVE EVAL CPT
 ;
 ; This routine loads Taxonomy BGPMU POAG NERVE EVAL CPT
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
 ;;21,"92081 ")
 ;;1
 ;;21,"92082 ")
 ;;3
 ;;21,"92083 ")
 ;;4
 ;;21,"92135 ")
 ;;2
 ;;9002226,1001,.01)
 ;;BGPMU POAG NERVE EVAL CPT
 ;;9002226,1001,.02)
 ;;POAG Optic Nerve Procedures
 ;;9002226,1001,.04)
 ;;@
 ;;9002226,1001,.06)
 ;;@
 ;;9002226,1001,.08)
 ;;@
 ;;9002226,1001,.09)
 ;;@
 ;;9002226,1001,.11)
 ;;@
 ;;9002226,1001,.12)
 ;;@
 ;;9002226,1001,.13)
 ;;@
 ;;9002226,1001,.14)
 ;;@
 ;;9002226,1001,.15)
 ;;81
 ;;9002226,1001,.16)
 ;;@
 ;;9002226,1001,.17)
 ;;@
 ;;9002226,1001,3101)
 ;;@
 ;;9002226.02101,"1001,92081 ",.01)
 ;;92081
 ;;9002226.02101,"1001,92081 ",.02)
 ;;92081
 ;;9002226.02101,"1001,92082 ",.01)
 ;;92082
 ;;9002226.02101,"1001,92082 ",.02)
 ;;92082
 ;;9002226.02101,"1001,92083 ",.01)
 ;;92083
 ;;9002226.02101,"1001,92083 ",.02)
 ;;92083
 ;;9002226.02101,"1001,92135 ",.01)
 ;;92135
 ;;9002226.02101,"1001,92135 ",.02)
 ;;92135
 ;
OTHER ; OTHER ROUTINES
 Q