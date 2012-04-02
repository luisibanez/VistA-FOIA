BGPMTXM ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON FEB 02, 2011;
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 ;;BGPMU COLONOSCOPY CPT
 ;
 ; This routine loads Taxonomy BGPMU COLONOSCOPY CPT
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
 ;;21,"44388 ")
 ;;1
 ;;21,"45355 ")
 ;;2
 ;;21,"45378 ")
 ;;3
 ;;21,"45391 ")
 ;;4
 ;;21,"G0105 ")
 ;;5
 ;;21,"G0121 ")
 ;;6
 ;;9002226,722,.01)
 ;;BGPMU COLONOSCOPY CPT
 ;;9002226,722,.02)
 ;;Colonoscopy CPT Codes
 ;;9002226,722,.04)
 ;;n
 ;;9002226,722,.06)
 ;;@
 ;;9002226,722,.08)
 ;;@
 ;;9002226,722,.09)
 ;;3110107
 ;;9002226,722,.11)
 ;;@
 ;;9002226,722,.12)
 ;;@
 ;;9002226,722,.13)
 ;;@
 ;;9002226,722,.14)
 ;;@
 ;;9002226,722,.15)
 ;;81
 ;;9002226,722,.16)
 ;;1
 ;;9002226,722,.17)
 ;;@
 ;;9002226,722,3101)
 ;;@
 ;;9002226.02101,"722,44388 ",.01)
 ;;44388
 ;;9002226.02101,"722,44388 ",.02)
 ;;44397
 ;;9002226.02101,"722,45355 ",.01)
 ;;45355
 ;;9002226.02101,"722,45355 ",.02)
 ;;45355
 ;;9002226.02101,"722,45378 ",.01)
 ;;45378
 ;;9002226.02101,"722,45378 ",.02)
 ;;45387
 ;;9002226.02101,"722,45391 ",.01)
 ;;45391
 ;;9002226.02101,"722,45391 ",.02)
 ;;45392
 ;;9002226.02101,"722,G0105 ",.01)
 ;;G0105
 ;;9002226.02101,"722,G0105 ",.02)
 ;;G0105
 ;;9002226.02101,"722,G0121 ",.01)
 ;;G0121
 ;;9002226.02101,"722,G0121 ",.02)
 ;;G0121
 ;
OTHER ; OTHER ROUTINES
 Q