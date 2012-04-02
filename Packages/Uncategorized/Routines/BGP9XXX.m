BGP9XXX ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;;BGP CMS ALLERGY POV DXS
 ;
 ; This routine loads Taxonomy BGP CMS ALLERGY POV DXS
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
 ;;21,"692.0 ")
 ;;1
 ;;21,"693.0 ")
 ;;2
 ;;21,"989.5 ")
 ;;3
 ;;21,"989.82 ")
 ;;4
 ;;21,"995.0 ")
 ;;5
 ;;21,"995.2 ")
 ;;6
 ;;21,"999.4 ")
 ;;7
 ;;21,"V14.0 ")
 ;;8
 ;;9002226,892,.01)
 ;;BGP CMS ALLERGY POV DXS
 ;;9002226,892,.02)
 ;;@
 ;;9002226,892,.04)
 ;;n
 ;;9002226,892,.06)
 ;;@
 ;;9002226,892,.08)
 ;;0
 ;;9002226,892,.09)
 ;;3071114
 ;;9002226,892,.11)
 ;;@
 ;;9002226,892,.12)
 ;;31
 ;;9002226,892,.13)
 ;;1
 ;;9002226,892,.14)
 ;;@
 ;;9002226,892,.15)
 ;;80
 ;;9002226,892,.16)
 ;;@
 ;;9002226,892,.17)
 ;;@
 ;;9002226,892,3101)
 ;;@
 ;;9002226.02101,"892,692.0 ",.01)
 ;;692.0 
 ;;9002226.02101,"892,692.0 ",.02)
 ;;692.89 
 ;;9002226.02101,"892,693.0 ",.01)
 ;;693.0 
 ;;9002226.02101,"892,693.0 ",.02)
 ;;693.9 
 ;;9002226.02101,"892,989.5 ",.01)
 ;;989.5 
 ;;9002226.02101,"892,989.5 ",.02)
 ;;989.5 
 ;;9002226.02101,"892,989.82 ",.01)
 ;;989.82 
 ;;9002226.02101,"892,989.82 ",.02)
 ;;989.82 
 ;;9002226.02101,"892,995.0 ",.01)
 ;;995.0 
 ;;9002226.02101,"892,995.0 ",.02)
 ;;995.0 
 ;;9002226.02101,"892,995.2 ",.01)
 ;;995.2 
 ;;9002226.02101,"892,995.2 ",.02)
 ;;995.3 
 ;;9002226.02101,"892,999.4 ",.01)
 ;;999.4 
 ;;9002226.02101,"892,999.4 ",.02)
 ;;999.8 
 ;;9002226.02101,"892,V14.0 ",.01)
 ;;V14.0 
 ;;9002226.02101,"892,V14.0 ",.02)
 ;;V15.09 
 ;
OTHER ; OTHER ROUTINES
 Q