BGP8GXY ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 28, 2007 ;
 ;;8.0;IHS CLINICAL REPORTING;;MAR 12, 2008
 ;;;BGP6;;SEP 28, 2007
 ;;BGP MMR CONTRAINDICATIONS
 ;
 ; This routine loads Taxonomy BGP MMR CONTRAINDICATIONS
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
 ;;21,"042. ")
 ;;1
 ;;21,"200.00 ")
 ;;2
 ;;21,"203.0 ")
 ;;3
 ;;21,"204.0 ")
 ;;4
 ;;21,"279.00 ")
 ;;5
 ;;21,"V08. ")
 ;;6
 ;;9002226,358,.01)
 ;;BGP MMR CONTRAINDICATIONS
 ;;9002226,358,.02)
 ;;@
 ;;9002226,358,.04)
 ;;n
 ;;9002226,358,.06)
 ;;@
 ;;9002226,358,.08)
 ;;0
 ;;9002226,358,.09)
 ;;3050225
 ;;9002226,358,.11)
 ;;@
 ;;9002226,358,.12)
 ;;31
 ;;9002226,358,.13)
 ;;1
 ;;9002226,358,.14)
 ;;@
 ;;9002226,358,.15)
 ;;80
 ;;9002226,358,.16)
 ;;@
 ;;9002226,358,.17)
 ;;@
 ;;9002226,358,3101)
 ;;@
 ;;9002226.02101,"358,042. ",.01)
 ;;042. 
 ;;9002226.02101,"358,042. ",.02)
 ;;042.9 
 ;;9002226.02101,"358,200.00 ",.01)
 ;;200.00 
 ;;9002226.02101,"358,200.00 ",.02)
 ;;202.98 
 ;;9002226.02101,"358,203.0 ",.01)
 ;;203.0 
 ;;9002226.02101,"358,203.0 ",.02)
 ;;203.81 
 ;;9002226.02101,"358,204.0 ",.01)
 ;;204.0 
 ;;9002226.02101,"358,204.0 ",.02)
 ;;208.91 
 ;;9002226.02101,"358,279.00 ",.01)
 ;;279.00 
 ;;9002226.02101,"358,279.00 ",.02)
 ;;279.9 
 ;;9002226.02101,"358,V08. ",.01)
 ;;V08. 
 ;;9002226.02101,"358,V08. ",.02)
 ;;V08. 
 ;
OTHER ; OTHER ROUTINES
 Q
