BGP6JXU ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 27, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;;BGP6;;MAR 27, 2006
 ;;BGP CMS ABG LOINC
 ;
 ; This routine loads Taxonomy BGP CMS ABG LOINC
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
 ;;21,"19214-6 ")
 ;;3
 ;;21,"19218-7 ")
 ;;4
 ;;21,"1922-4 ")
 ;;5
 ;;21,"19230-2 ")
 ;;6
 ;;21,"19235-1 ")
 ;;7
 ;;21,"1925-7 ")
 ;;2
 ;;21,"19255-9 ")
 ;;1
 ;;21,"24336-0 ")
 ;;8
 ;;21,"24341-0 ")
 ;;9
 ;;21,"2703-7 ")
 ;;10
 ;;21,"32771-8 ")
 ;;11
 ;;21,"33254-4 ")
 ;;12
 ;;9002226,508,.01)
 ;;BGP CMS ABG LOINC
 ;;9002226,508,.02)
 ;;ABG LOINC CODES
 ;;9002226,508,.04)
 ;;@
 ;;9002226,508,.06)
 ;;@
 ;;9002226,508,.08)
 ;;@
 ;;9002226,508,.09)
 ;;@
 ;;9002226,508,.11)
 ;;@
 ;;9002226,508,.12)
 ;;@
 ;;9002226,508,.13)
 ;;1
 ;;9002226,508,.14)
 ;;FIHS
 ;;9002226,508,.15)
 ;;95.3
 ;;9002226,508,.16)
 ;;@
 ;;9002226,508,.17)
 ;;@
 ;;9002226,508,3101)
 ;;@
 ;;9002226.02101,"508,19214-6 ",.01)
 ;;19214-6
 ;;9002226.02101,"508,19214-6 ",.02)
 ;;19214-6
 ;;9002226.02101,"508,19218-7 ",.01)
 ;;19218-7
 ;;9002226.02101,"508,19218-7 ",.02)
 ;;19218-7
 ;;9002226.02101,"508,1922-4 ",.01)
 ;;1922-4
 ;;9002226.02101,"508,1922-4 ",.02)
 ;;1922-4
 ;;9002226.02101,"508,19230-2 ",.01)
 ;;19230-2
 ;;9002226.02101,"508,19230-2 ",.02)
 ;;19230-2
 ;;9002226.02101,"508,19235-1 ",.01)
 ;;19235-1
 ;;9002226.02101,"508,19235-1 ",.02)
 ;;19235-1
 ;;9002226.02101,"508,1925-7 ",.01)
 ;;1925-7
 ;;9002226.02101,"508,1925-7 ",.02)
 ;;1925-7
 ;;9002226.02101,"508,19255-9 ",.01)
 ;;19255-9
 ;;9002226.02101,"508,19255-9 ",.02)
 ;;19255-9
 ;;9002226.02101,"508,24336-0 ",.01)
 ;;24336-0
 ;;9002226.02101,"508,24336-0 ",.02)
 ;;24336-0
 ;;9002226.02101,"508,24341-0 ",.01)
 ;;24341-0
 ;;9002226.02101,"508,24341-0 ",.02)
 ;;24341-0
 ;;9002226.02101,"508,2703-7 ",.01)
 ;;2703-7
 ;;9002226.02101,"508,2703-7 ",.02)
 ;;2703-7
 ;;9002226.02101,"508,32771-8 ",.01)
 ;;32771-8
 ;;9002226.02101,"508,32771-8 ",.02)
 ;;32771-8
 ;;9002226.02101,"508,33254-4 ",.01)
 ;;33254-4
 ;;9002226.02101,"508,33254-4 ",.02)
 ;;33254-4
 ;
OTHER ; OTHER ROUTINES
 Q
