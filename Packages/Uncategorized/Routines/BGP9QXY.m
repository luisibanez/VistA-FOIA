BGP9QXY ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;;BGP OPT MH VISIT POVS
 ;
 ; This routine loads Taxonomy BGP OPT MH VISIT POVS
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
 ;;21,"290.0 ")
 ;;1
 ;;21,"293.0 ")
 ;;2
 ;;21,"306.0 ")
 ;;3
 ;;9002226,523,.01)
 ;;BGP OPT MH VISIT POVS
 ;;9002226,523,.02)
 ;;@
 ;;9002226,523,.04)
 ;;n
 ;;9002226,523,.06)
 ;;@
 ;;9002226,523,.08)
 ;;0
 ;;9002226,523,.09)
 ;;3050803
 ;;9002226,523,.11)
 ;;@
 ;;9002226,523,.12)
 ;;31
 ;;9002226,523,.13)
 ;;1
 ;;9002226,523,.14)
 ;;@
 ;;9002226,523,.15)
 ;;80
 ;;9002226,523,.16)
 ;;@
 ;;9002226,523,.17)
 ;;@
 ;;9002226,523,3101)
 ;;@
 ;;9002226.02101,"523,290.0 ",.01)
 ;;290.0 
 ;;9002226.02101,"523,290.0 ",.02)
 ;;290.9 
 ;;9002226.02101,"523,293.0 ",.01)
 ;;293.0 
 ;;9002226.02101,"523,293.0 ",.02)
 ;;302.9 
 ;;9002226.02101,"523,306.0 ",.01)
 ;;306.0 
 ;;9002226.02101,"523,306.0 ",.02)
 ;;316. 
 ;
OTHER ; OTHER ROUTINES
 Q
