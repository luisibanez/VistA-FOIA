BGPUTXD ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 21, 2005 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;;BGPU;;APR 21, 2005
 ;;BGP CMS EJECTION FRACTION CPTS
 ;
 ; This routine loads Taxonomy BGP CMS EJECTION FRACTION CPTS
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
 ;;21,"78414 ")
 ;;1
 ;;21,"78468 ")
 ;;2
 ;;21,"78472 ")
 ;;3
 ;;21,"78480 ")
 ;;4
 ;;21,"78494 ")
 ;;5
 ;;21,"93303 ")
 ;;6
 ;;21,"93307 ")
 ;;7
 ;;21,"93312 ")
 ;;8
 ;;21,"93314 ")
 ;;9
 ;;21,"93317 ")
 ;;10
 ;;21,"93350 ")
 ;;11
 ;;21,"93543 ")
 ;;12
 ;;21,"93555 ")
 ;;13
 ;;9002226,261,.01)
 ;;BGP CMS EJECTION FRACTION CPTS
 ;;9002226,261,.02)
 ;;@
 ;;9002226,261,.04)
 ;;n
 ;;9002226,261,.06)
 ;;@
 ;;9002226,261,.08)
 ;;0
 ;;9002226,261,.09)
 ;;3050104
 ;;9002226,261,.11)
 ;;@
 ;;9002226,261,.12)
 ;;455
 ;;9002226,261,.13)
 ;;1
 ;;9002226,261,.14)
 ;;@
 ;;9002226,261,.15)
 ;;81
 ;;9002226,261,.16)
 ;;@
 ;;9002226,261,.17)
 ;;@
 ;;9002226,261,3101)
 ;;@
 ;;9002226.02101,"261,78414 ",.01)
 ;;78414 
 ;;9002226.02101,"261,78414 ",.02)
 ;;78414 
 ;;9002226.02101,"261,78468 ",.01)
 ;;78468 
 ;;9002226.02101,"261,78468 ",.02)
 ;;78468 
 ;;9002226.02101,"261,78472 ",.01)
 ;;78472 
 ;;9002226.02101,"261,78472 ",.02)
 ;;78473 
 ;;9002226.02101,"261,78480 ",.01)
 ;;78480 
 ;;9002226.02101,"261,78480 ",.02)
 ;;78483 
 ;;9002226.02101,"261,78494 ",.01)
 ;;78494 
 ;;9002226.02101,"261,78494 ",.02)
 ;;78494 
 ;;9002226.02101,"261,93303 ",.01)
 ;;93303 
 ;;9002226.02101,"261,93303 ",.02)
 ;;93304 
 ;;9002226.02101,"261,93307 ",.01)
 ;;93307 
 ;;9002226.02101,"261,93307 ",.02)
 ;;93308 
 ;;9002226.02101,"261,93312 ",.01)
 ;;93312 
 ;;9002226.02101,"261,93312 ",.02)
 ;;93312 
 ;;9002226.02101,"261,93314 ",.01)
 ;;93314 
 ;;9002226.02101,"261,93314 ",.02)
 ;;93315 
 ;;9002226.02101,"261,93317 ",.01)
 ;;93317 
 ;;9002226.02101,"261,93317 ",.02)
 ;;93317 
 ;;9002226.02101,"261,93350 ",.01)
 ;;93350 
 ;;9002226.02101,"261,93350 ",.02)
 ;;93350 
 ;;9002226.02101,"261,93543 ",.01)
 ;;93543 
 ;;9002226.02101,"261,93543 ",.02)
 ;;93543 
 ;;9002226.02101,"261,93555 ",.01)
 ;;93555 
 ;;9002226.02101,"261,93555 ",.02)
 ;;93555 
 ;
OTHER ; OTHER ROUTINES
 Q
