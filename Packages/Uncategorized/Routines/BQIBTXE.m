BQIBTXE ;VNGT/HS/ALA-CREATED BY ^ATXSTX ON JUN 18, 2008;
 ;;2.1;ICARE MANAGEMENT SYSTEM;;Feb 07, 2011
 ;;BKMV II MED NDCS
 ;
 ; This routine loads Taxonomy BKMV II MED NDCS
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
 ;;21,"00006-0227-61 ")
 ;;1
 ;;9002226,1072,.01)
 ;;BKMV II MED NDCS
 ;;9002226,1072,.02)
 ;;II MED NDCS
 ;;9002226,1072,.04)
 ;;@
 ;;9002226,1072,.06)
 ;;@
 ;;9002226,1072,.08)
 ;;0
 ;;9002226,1072,.09)
 ;;3080613
 ;;9002226,1072,.11)
 ;;@
 ;;9002226,1072,.12)
 ;;145
 ;;9002226,1072,.13)
 ;;1
 ;;9002226,1072,.14)
 ;;@
 ;;9002226,1072,.15)
 ;;2
 ;;9002226,1072,.16)
 ;;@
 ;;9002226,1072,.17)
 ;;@
 ;;9002226,1072,3101)
 ;;@
 ;;9002226.02101,"1072,00006-0227-61 ",.01)
 ;;00006-0227-61
 ;;9002226.02101,"1072,00006-0227-61 ",.02)
 ;;00006-0227-61
 ;
OTHER ; OTHER ROUTINES
 Q
