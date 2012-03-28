BGP9WXW ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;;BGP CMS ECHOCARDIOGRAM PROCS
 ;
 ; This routine loads Taxonomy BGP CMS ECHOCARDIOGRAM PROCS
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
 ;;21,"00.24 ")
 ;;1
 ;;21,"37.28 ")
 ;;2
 ;;21,"88.72 ")
 ;;3
 ;;9002226,854,.01)
 ;;BGP CMS ECHOCARDIOGRAM PROCS
 ;;9002226,854,.02)
 ;;@
 ;;9002226,854,.04)
 ;;n
 ;;9002226,854,.06)
 ;;@
 ;;9002226,854,.08)
 ;;0
 ;;9002226,854,.09)
 ;;3070529
 ;;9002226,854,.11)
 ;;@
 ;;9002226,854,.12)
 ;;255
 ;;9002226,854,.13)
 ;;1
 ;;9002226,854,.14)
 ;;@
 ;;9002226,854,.15)
 ;;80.1
 ;;9002226,854,.16)
 ;;@
 ;;9002226,854,.17)
 ;;@
 ;;9002226,854,3101)
 ;;@
 ;;9002226.02101,"854,00.24 ",.01)
 ;;00.24 
 ;;9002226.02101,"854,00.24 ",.02)
 ;;00.24 
 ;;9002226.02101,"854,37.28 ",.01)
 ;;37.28 
 ;;9002226.02101,"854,37.28 ",.02)
 ;;37.28 
 ;;9002226.02101,"854,88.72 ",.01)
 ;;88.72 
 ;;9002226.02101,"854,88.72 ",.02)
 ;;88.72 
 ;
OTHER ; OTHER ROUTINES
 Q
