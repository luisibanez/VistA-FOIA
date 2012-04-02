BGPM5ABC ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON JUL 22, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;;BGPMU STEROID DIABETES DX
 ;
 ; This routine loads Taxonomy BGPMU STEROID DIABETES DX
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
 ;;21,"249 ")
 ;;1
 ;;21,"249.10 ")
 ;;4
 ;;21,"249.2 ")
 ;;5
 ;;21,"249.3 ")
 ;;6
 ;;21,"249.4 ")
 ;;7
 ;;21,"249.5 ")
 ;;8
 ;;21,"249.6 ")
 ;;9
 ;;21,"249.7 ")
 ;;10
 ;;21,"249.8 ")
 ;;11
 ;;21,"249.9 ")
 ;;12
 ;;21,"251.8 ")
 ;;2
 ;;21,"962.0 ")
 ;;3
 ;;9002226,857,.01)
 ;;BGPMU STEROID DIABETES DX
 ;;9002226,857,.02)
 ;;ICD9 Steroid induced diabetes
 ;;9002226,857,.04)
 ;;n
 ;;9002226,857,.06)
 ;;@
 ;;9002226,857,.08)
 ;;@
 ;;9002226,857,.09)
 ;;3110310
 ;;9002226,857,.11)
 ;;@
 ;;9002226,857,.12)
 ;;@
 ;;9002226,857,.13)
 ;;@
 ;;9002226,857,.14)
 ;;@
 ;;9002226,857,.15)
 ;;80
 ;;9002226,857,.16)
 ;;1
 ;;9002226,857,.17)
 ;;@
 ;;9002226,857,3101)
 ;;@
 ;;9002226.02101,"857,249 ",.01)
 ;;249
 ;;9002226.02101,"857,249 ",.02)
 ;;249.1
 ;;9002226.02101,"857,249.10 ",.01)
 ;;249.10
 ;;9002226.02101,"857,249.10 ",.02)
 ;;249.11
 ;;9002226.02101,"857,249.2 ",.01)
 ;;249.2
 ;;9002226.02101,"857,249.2 ",.02)
 ;;249.21
 ;;9002226.02101,"857,249.3 ",.01)
 ;;249.3
 ;;9002226.02101,"857,249.3 ",.02)
 ;;249.31
 ;;9002226.02101,"857,249.4 ",.01)
 ;;249.4
 ;;9002226.02101,"857,249.4 ",.02)
 ;;249.41
 ;;9002226.02101,"857,249.5 ",.01)
 ;;249.5
 ;;9002226.02101,"857,249.5 ",.02)
 ;;249.51
 ;;9002226.02101,"857,249.6 ",.01)
 ;;249.6
 ;;9002226.02101,"857,249.6 ",.02)
 ;;249.61
 ;;9002226.02101,"857,249.7 ",.01)
 ;;249.7
 ;;9002226.02101,"857,249.7 ",.02)
 ;;249.71
 ;;9002226.02101,"857,249.8 ",.01)
 ;;249.8
 ;;9002226.02101,"857,249.8 ",.02)
 ;;249.81
 ;;9002226.02101,"857,249.9 ",.01)
 ;;249.9
 ;;9002226.02101,"857,249.9 ",.02)
 ;;249.91
 ;;9002226.02101,"857,251.8 ",.01)
 ;;251.8
 ;;9002226.02101,"857,251.8 ",.02)
 ;;251.8
 ;;9002226.02101,"857,962.0 ",.01)
 ;;962.0
 ;;9002226.02101,"857,962.0 ",.02)
 ;;962.0
 ;
OTHER ; OTHER ROUTINES
 Q