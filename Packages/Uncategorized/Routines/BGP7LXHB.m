BGP7LXHB ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON AUG 28, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"625,57480-0324-06 ",.01)
 ;;57480-0324-06
 ;;9002226.02101,"625,57480-0324-06 ",.02)
 ;;57480-0324-06
 ;;9002226.02101,"625,58016-0555-00 ",.01)
 ;;58016-0555-00
 ;;9002226.02101,"625,58016-0555-00 ",.02)
 ;;58016-0555-00
 ;;9002226.02101,"625,58016-0555-12 ",.01)
 ;;58016-0555-12
 ;;9002226.02101,"625,58016-0555-12 ",.02)
 ;;58016-0555-12
 ;;9002226.02101,"625,58016-0555-15 ",.01)
 ;;58016-0555-15
 ;;9002226.02101,"625,58016-0555-15 ",.02)
 ;;58016-0555-15
 ;;9002226.02101,"625,58016-0555-20 ",.01)
 ;;58016-0555-20
 ;;9002226.02101,"625,58016-0555-20 ",.02)
 ;;58016-0555-20
 ;;9002226.02101,"625,58016-0555-30 ",.01)
 ;;58016-0555-30
 ;;9002226.02101,"625,58016-0555-30 ",.02)
 ;;58016-0555-30
 ;;9002226.02101,"625,58016-0712-20 ",.01)
 ;;58016-0712-20
 ;;9002226.02101,"625,58016-0712-20 ",.02)
 ;;58016-0712-20
 ;;9002226.02101,"625,58016-0712-30 ",.01)
 ;;58016-0712-30
 ;;9002226.02101,"625,58016-0712-30 ",.02)
 ;;58016-0712-30
 ;;9002226.02101,"625,60346-0366-90 ",.01)
 ;;60346-0366-90
 ;;9002226.02101,"625,60346-0366-90 ",.02)
 ;;60346-0366-90
 ;;9002226.02101,"625,62584-0370-01 ",.01)
 ;;62584-0370-01
 ;;9002226.02101,"625,62584-0370-01 ",.02)
 ;;62584-0370-01
 ;;9002226.02101,"625,62584-0370-33 ",.01)
 ;;62584-0370-33
 ;;9002226.02101,"625,62584-0370-33 ",.02)
 ;;62584-0370-33
 ;;9002226.02101,"625,63739-0086-01 ",.01)
 ;;63739-0086-01
 ;;9002226.02101,"625,63739-0086-01 ",.02)
 ;;63739-0086-01
 ;;9002226.02101,"625,63739-0086-02 ",.01)
 ;;63739-0086-02
 ;;9002226.02101,"625,63739-0086-02 ",.02)
 ;;63739-0086-02
 ;;9002226.02101,"625,63739-0086-03 ",.01)
 ;;63739-0086-03
 ;;9002226.02101,"625,63739-0086-03 ",.02)
 ;;63739-0086-03
 ;;9002226.02101,"625,68115-0744-00 ",.01)
 ;;68115-0744-00
 ;;9002226.02101,"625,68115-0744-00 ",.02)
 ;;68115-0744-00
 ;;9002226.02101,"625,68453-0410-10 ",.01)
 ;;68453-0410-10
 ;;9002226.02101,"625,68453-0410-10 ",.02)
 ;;68453-0410-10
