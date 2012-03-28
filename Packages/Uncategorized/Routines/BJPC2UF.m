BJPC2UF ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON JUN 23, 2008 ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;;SURVEILLANCE SIGMOIDOSCOPY
 ;
 ; This routine loads Taxonomy SURVEILLANCE SIGMOIDOSCOPY
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
 ;;21,"45.21 ")
 ;;1
 ;;21,"48.21 ")
 ;;2
 ;;9002226,204,.01)
 ;;SURVEILLANCE SIGMOIDOSCOPY
 ;;9002226,204,.02)
 ;;USED BY HLTH SUMM SURV
 ;;9002226,204,.04)
 ;;n
 ;;9002226,204,.06)
 ;;@
 ;;9002226,204,.08)
 ;;0
 ;;9002226,204,.09)
 ;;2950829.132847
 ;;9002226,204,.11)
 ;;@
 ;;9002226,204,.12)
 ;;255
 ;;9002226,204,.13)
 ;;1
 ;;9002226,204,.14)
 ;;BA
 ;;9002226,204,.15)
 ;;80.1
 ;;9002226,204,.16)
 ;;@
 ;;9002226,204,.17)
 ;;@
 ;;9002226,204,3101)
 ;;@
 ;;9002226.02101,"204,45.21 ",.01)
 ;;45.21
 ;;9002226.02101,"204,45.21 ",.02)
 ;;45.25
 ;;9002226.02101,"204,48.21 ",.01)
 ;;48.21
 ;;9002226.02101,"204,48.21 ",.02)
 ;;48.24
 ;
OTHER ; OTHER ROUTINES
 Q
