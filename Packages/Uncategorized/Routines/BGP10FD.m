BGP10FD ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON NOV 17, 2010 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"491,653.83 ",.02)
 ;;653.83 
 ;;9002226.02101,"491,653.93 ",.01)
 ;;653.93 
 ;;9002226.02101,"491,653.93 ",.02)
 ;;653.93 
 ;;9002226.02101,"491,654.03 ",.01)
 ;;654.03 
 ;;9002226.02101,"491,654.03 ",.02)
 ;;654.03 
 ;;9002226.02101,"491,654.13 ",.01)
 ;;654.13 
 ;;9002226.02101,"491,654.13 ",.02)
 ;;654.13 
 ;;9002226.02101,"491,654.23 ",.01)
 ;;654.23 
 ;;9002226.02101,"491,654.23 ",.02)
 ;;654.23 
 ;;9002226.02101,"491,654.33 ",.01)
 ;;654.33 
 ;;9002226.02101,"491,654.33 ",.02)
 ;;654.33 
 ;;9002226.02101,"491,654.43 ",.01)
 ;;654.43 
 ;;9002226.02101,"491,654.43 ",.02)
 ;;654.43 
 ;;9002226.02101,"491,654.53 ",.01)
 ;;654.53 
 ;;9002226.02101,"491,654.53 ",.02)
 ;;654.53 
 ;;9002226.02101,"491,654.63 ",.01)
 ;;654.63 
 ;;9002226.02101,"491,654.63 ",.02)
 ;;654.63 
 ;;9002226.02101,"491,654.73 ",.01)
 ;;654.73 
 ;;9002226.02101,"491,654.73 ",.02)
 ;;654.73 
 ;;9002226.02101,"491,654.83 ",.01)
 ;;654.83 
 ;;9002226.02101,"491,654.83 ",.02)
 ;;654.83 
 ;;9002226.02101,"491,654.93 ",.01)
 ;;654.93 
 ;;9002226.02101,"491,654.93 ",.02)
 ;;654.93 
 ;;9002226.02101,"491,655.03 ",.01)
 ;;655.03 
 ;;9002226.02101,"491,655.03 ",.02)
 ;;655.03 
 ;;9002226.02101,"491,655.13 ",.01)
 ;;655.13 
 ;;9002226.02101,"491,655.13 ",.02)
 ;;655.13 
 ;;9002226.02101,"491,655.23 ",.01)
 ;;655.23 
 ;;9002226.02101,"491,655.23 ",.02)
 ;;655.23 
 ;;9002226.02101,"491,655.33 ",.01)
 ;;655.33 
 ;;9002226.02101,"491,655.33 ",.02)
 ;;655.33 
 ;;9002226.02101,"491,655.43 ",.01)
 ;;655.43 
 ;;9002226.02101,"491,655.43 ",.02)
 ;;655.43 
 ;;9002226.02101,"491,655.53 ",.01)
 ;;655.53 
 ;;9002226.02101,"491,655.53 ",.02)
 ;;655.53 
 ;;9002226.02101,"491,655.63 ",.01)
 ;;655.63 
 ;;9002226.02101,"491,655.63 ",.02)
 ;;655.63 
 ;;9002226.02101,"491,655.73 ",.01)
 ;;655.73 
 ;;9002226.02101,"491,655.73 ",.02)
 ;;655.73 
 ;;9002226.02101,"491,655.83 ",.01)
 ;;655.83 
 ;;9002226.02101,"491,655.83 ",.02)
 ;;655.83 
 ;;9002226.02101,"491,655.93 ",.01)
 ;;655.93 
 ;;9002226.02101,"491,655.93 ",.02)
 ;;655.93 
 ;;9002226.02101,"491,656.03 ",.01)
 ;;656.03 
 ;;9002226.02101,"491,656.03 ",.02)
 ;;656.03 
 ;;9002226.02101,"491,656.13 ",.01)
 ;;656.13 
 ;;9002226.02101,"491,656.13 ",.02)
 ;;656.13 
 ;;9002226.02101,"491,656.23 ",.01)
 ;;656.23 
 ;;9002226.02101,"491,656.23 ",.02)
 ;;656.23 
 ;;9002226.02101,"491,656.33 ",.01)
 ;;656.33 
 ;;9002226.02101,"491,656.33 ",.02)
 ;;656.33 
 ;;9002226.02101,"491,656.43 ",.01)
 ;;656.43 
 ;;9002226.02101,"491,656.43 ",.02)
 ;;656.43 
 ;;9002226.02101,"491,656.53 ",.01)
 ;;656.53 
 ;;9002226.02101,"491,656.53 ",.02)
 ;;656.53 
 ;;9002226.02101,"491,656.63 ",.01)
 ;;656.63 
 ;;9002226.02101,"491,656.63 ",.02)
 ;;656.63 
 ;;9002226.02101,"491,656.73 ",.01)
 ;;656.73 
 ;;9002226.02101,"491,656.73 ",.02)
 ;;656.73 
 ;;9002226.02101,"491,656.83 ",.01)
 ;;656.83 
 ;;9002226.02101,"491,656.83 ",.02)
 ;;656.83 
 ;;9002226.02101,"491,656.93 ",.01)
 ;;656.93 
 ;;9002226.02101,"491,656.93 ",.02)
 ;;656.93 
 ;;9002226.02101,"491,657.03 ",.01)
 ;;657.03 
 ;;9002226.02101,"491,657.03 ",.02)
 ;;657.03 
 ;;9002226.02101,"491,658.03 ",.01)
 ;;658.03 
 ;;9002226.02101,"491,658.03 ",.02)
 ;;658.03 
 ;;9002226.02101,"491,658.13 ",.01)
 ;;658.13 
 ;;9002226.02101,"491,658.13 ",.02)
 ;;658.13 
 ;;9002226.02101,"491,658.23 ",.01)
 ;;658.23 
 ;;9002226.02101,"491,658.23 ",.02)
 ;;658.23 
 ;;9002226.02101,"491,658.33 ",.01)
 ;;658.33 
 ;;9002226.02101,"491,658.33 ",.02)
 ;;658.33 
 ;;9002226.02101,"491,658.43 ",.01)
 ;;658.43 
 ;;9002226.02101,"491,658.43 ",.02)
 ;;658.43 
 ;;9002226.02101,"491,658.83 ",.01)
 ;;658.83 
 ;;9002226.02101,"491,658.83 ",.02)
 ;;658.83 
 ;;9002226.02101,"491,658.93 ",.01)
 ;;658.93 
 ;;9002226.02101,"491,658.93 ",.02)
 ;;658.93 
 ;;9002226.02101,"491,659.03 ",.01)
 ;;659.03 
 ;;9002226.02101,"491,659.03 ",.02)
 ;;659.03 
 ;;9002226.02101,"491,659.13 ",.01)
 ;;659.13 
 ;;9002226.02101,"491,659.13 ",.02)
 ;;659.13 
 ;;9002226.02101,"491,659.23 ",.01)
 ;;659.23 
 ;;9002226.02101,"491,659.23 ",.02)
 ;;659.23 
 ;;9002226.02101,"491,659.33 ",.01)
 ;;659.33 
 ;;9002226.02101,"491,659.33 ",.02)
 ;;659.33 
 ;;9002226.02101,"491,659.43 ",.01)
 ;;659.43 
 ;;9002226.02101,"491,659.43 ",.02)
 ;;659.43 
 ;;9002226.02101,"491,659.53 ",.01)
 ;;659.53 
 ;;9002226.02101,"491,659.53 ",.02)
 ;;659.53 
 ;;9002226.02101,"491,659.63 ",.01)
 ;;659.63 
 ;;9002226.02101,"491,659.63 ",.02)
 ;;659.63 
 ;;9002226.02101,"491,659.73 ",.01)
 ;;659.73 
 ;;9002226.02101,"491,659.73 ",.02)
 ;;659.73 
 ;;9002226.02101,"491,659.83 ",.01)
 ;;659.83 
 ;;9002226.02101,"491,659.83 ",.02)
 ;;659.83 
 ;;9002226.02101,"491,659.93 ",.01)
 ;;659.93 
 ;;9002226.02101,"491,659.93 ",.02)
 ;;659.93 
 ;;9002226.02101,"491,660.03 ",.01)
 ;;660.03 
 ;;9002226.02101,"491,660.03 ",.02)
 ;;660.03 
 ;;9002226.02101,"491,660.13 ",.01)
 ;;660.13 
 ;;9002226.02101,"491,660.13 ",.02)
 ;;660.13 
 ;;9002226.02101,"491,660.23 ",.01)
 ;;660.23 
 ;;9002226.02101,"491,660.23 ",.02)
 ;;660.23 
 ;;9002226.02101,"491,660.33 ",.01)
 ;;660.33 
 ;;9002226.02101,"491,660.33 ",.02)
 ;;660.33 
