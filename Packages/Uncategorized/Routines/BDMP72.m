BDMP72 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 30, 2000 ;
 ;;2.0;DIABETES MANAGEMENT SYSTEM;**2**;JUN 14, 2007
 ;;;BDM;;MAR 30, 2000
 ;;DM AUDIT PROBLEM SMOKING DXS
 ;
 ; This routine loads Taxonomy DM AUDIT PROBLEM SMOKING DXS
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
 ;;21,"305.1 ")
 ;;1
 ;;21,"V15.82 ")
 ;;2
 ;;9002226,234,.01)
 ;;DM AUDIT PROBLEM SMOKING DXS
 ;;9002226,234,.02)
 ;;DM AUDIT PROBLEM SMOKING DXS
 ;;9002226,234,.04)
 ;;@
 ;;9002226,234,.06)
 ;;@
 ;;9002226,234,.08)
 ;;0
 ;;9002226,234,.09)
 ;;2930811
 ;;9002226,234,.11)
 ;;@
 ;;9002226,234,.12)
 ;;266
 ;;9002226,234,.13)
 ;;1
 ;;9002226,234,.14)
 ;;@
 ;;9002226,234,.15)
 ;;80
 ;;9002226,234,.16)
 ;;@
 ;;9002226,234,.17)
 ;;@
 ;;9002226,234,3101)
 ;;@
 ;;9002226.02101,"234,305.1 ",.01)
 ;;305.1
 ;;9002226.02101,"234,305.1 ",.02)
 ;;305.13
 ;;9002226.02101,"234,V15.82 ",.01)
 ;;V15.82
 ;;9002226.02101,"234,V15.82 ",.02)
 ;;V15.82
 ;
OTHER ; OTHER ROUTINES
 Q
