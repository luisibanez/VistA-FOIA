BGP9XXD ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;;BGP BMD CPTS
 ;
 ; This routine loads Taxonomy BGP BMD CPTS
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
 ;;21,"76070 ")
 ;;1
 ;;21,"76071 ")
 ;;2
 ;;21,"76075 ")
 ;;3
 ;;21,"76076 ")
 ;;4
 ;;21,"76078 ")
 ;;5
 ;;21,"76977 ")
 ;;6
 ;;21,"77078 ")
 ;;7
 ;;21,"77079 ")
 ;;8
 ;;21,"77080 ")
 ;;9
 ;;21,"77081 ")
 ;;10
 ;;21,"77083 ")
 ;;11
 ;;21,"78350 ")
 ;;12
 ;;21,"78351 ")
 ;;13
 ;;21,"G0130 ")
 ;;14
 ;;9002226,464,.01)
 ;;BGP BMD CPTS
 ;;9002226,464,.02)
 ;;@
 ;;9002226,464,.04)
 ;;n
 ;;9002226,464,.06)
 ;;@
 ;;9002226,464,.08)
 ;;0
 ;;9002226,464,.09)
 ;;3070806
 ;;9002226,464,.11)
 ;;@
 ;;9002226,464,.12)
 ;;455
 ;;9002226,464,.13)
 ;;1
 ;;9002226,464,.14)
 ;;@
 ;;9002226,464,.15)
 ;;81
 ;;9002226,464,.16)
 ;;@
 ;;9002226,464,.17)
 ;;@
 ;;9002226,464,3101)
 ;;@
 ;;9002226.02101,"464,76070 ",.01)
 ;;76070 
 ;;9002226.02101,"464,76070 ",.02)
 ;;76070 
 ;;9002226.02101,"464,76071 ",.01)
 ;;76071 
 ;;9002226.02101,"464,76071 ",.02)
 ;;76071 
 ;;9002226.02101,"464,76075 ",.01)
 ;;76075 
 ;;9002226.02101,"464,76075 ",.02)
 ;;76075 
 ;;9002226.02101,"464,76076 ",.01)
 ;;76076 
 ;;9002226.02101,"464,76076 ",.02)
 ;;76076 
 ;;9002226.02101,"464,76078 ",.01)
 ;;76078 
 ;;9002226.02101,"464,76078 ",.02)
 ;;76078 
 ;;9002226.02101,"464,76977 ",.01)
 ;;76977 
 ;;9002226.02101,"464,76977 ",.02)
 ;;76977 
 ;;9002226.02101,"464,77078 ",.01)
 ;;77078 
 ;;9002226.02101,"464,77078 ",.02)
 ;;77078 
 ;;9002226.02101,"464,77079 ",.01)
 ;;77079 
 ;;9002226.02101,"464,77079 ",.02)
 ;;77079 
 ;;9002226.02101,"464,77080 ",.01)
 ;;77080 
 ;;9002226.02101,"464,77080 ",.02)
 ;;77080 
 ;;9002226.02101,"464,77081 ",.01)
 ;;77081 
 ;;9002226.02101,"464,77081 ",.02)
 ;;77081 
 ;;9002226.02101,"464,77083 ",.01)
 ;;77083 
 ;;9002226.02101,"464,77083 ",.02)
 ;;77083 
 ;;9002226.02101,"464,78350 ",.01)
 ;;78350 
 ;;9002226.02101,"464,78350 ",.02)
 ;;78350 
 ;;9002226.02101,"464,78351 ",.01)
 ;;78351 
 ;;9002226.02101,"464,78351 ",.02)
 ;;78351 
 ;;9002226.02101,"464,G0130 ",.01)
 ;;G0130 
 ;;9002226.02101,"464,G0130 ",.02)
 ;;G0130 
 ;
OTHER ; OTHER ROUTINES
 Q