BGP9VXIL ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"862,37.33 ",.01)
 ;;37.33 
 ;;9002226.02101,"862,37.33 ",.02)
 ;;37.33 
 ;;9002226.02101,"862,37.34 ",.01)
 ;;37.34 
 ;;9002226.02101,"862,37.34 ",.02)
 ;;37.34 
 ;;9002226.02101,"862,37.35 ",.01)
 ;;37.35 
 ;;9002226.02101,"862,37.35 ",.02)
 ;;37.35 
 ;;9002226.02101,"862,37.41 ",.01)
 ;;37.41 
 ;;9002226.02101,"862,37.41 ",.02)
 ;;37.41 
 ;;9002226.02101,"862,37.49 ",.01)
 ;;37.49 
 ;;9002226.02101,"862,37.49 ",.02)
 ;;37.49 
 ;;9002226.02101,"862,37.51 ",.01)
 ;;37.51 
 ;;9002226.02101,"862,37.51 ",.02)
 ;;37.51 
 ;;9002226.02101,"862,37.52 ",.01)
 ;;37.52 
 ;;9002226.02101,"862,37.52 ",.02)
 ;;37.52 
 ;;9002226.02101,"862,37.53 ",.01)
 ;;37.53 
 ;;9002226.02101,"862,37.53 ",.02)
 ;;37.53 
 ;;9002226.02101,"862,37.54 ",.01)
 ;;37.54 
 ;;9002226.02101,"862,37.54 ",.02)
 ;;37.54 
 ;;9002226.02101,"862,37.62 ",.01)
 ;;37.62 
 ;;9002226.02101,"862,37.62 ",.02)
 ;;37.62 
 ;;9002226.02101,"862,37.63 ",.01)
 ;;37.63 
 ;;9002226.02101,"862,37.63 ",.02)
 ;;37.63 
 ;;9002226.02101,"862,37.64 ",.01)
 ;;37.64 
 ;;9002226.02101,"862,37.64 ",.02)
 ;;37.64 
 ;;9002226.02101,"862,37.66 ",.01)
 ;;37.66 
 ;;9002226.02101,"862,37.66 ",.02)
 ;;37.66 
 ;;9002226.02101,"862,37.67 ",.01)
 ;;37.67 
 ;;9002226.02101,"862,37.67 ",.02)
 ;;37.67 
 ;;9002226.02101,"862,37.91 ",.01)
 ;;37.91 
 ;;9002226.02101,"862,37.91 ",.02)
 ;;37.91 
 ;;9002226.02101,"862,38.10 ",.01)
 ;;38.10 
 ;;9002226.02101,"862,38.10 ",.02)
 ;;38.10 
 ;;9002226.02101,"862,38.11 ",.01)
 ;;38.11 
 ;;9002226.02101,"862,38.11 ",.02)
 ;;38.11 
 ;;9002226.02101,"862,38.12 ",.01)
 ;;38.12 
 ;;9002226.02101,"862,38.12 ",.02)
 ;;38.12 
 ;;9002226.02101,"862,38.13 ",.01)
 ;;38.13 
 ;;9002226.02101,"862,38.13 ",.02)
 ;;38.13 
 ;;9002226.02101,"862,38.14 ",.01)
 ;;38.14 
 ;;9002226.02101,"862,38.14 ",.02)
 ;;38.14 
 ;;9002226.02101,"862,38.15 ",.01)
 ;;38.15 
 ;;9002226.02101,"862,38.15 ",.02)
 ;;38.15 
 ;;9002226.02101,"862,38.16 ",.01)
 ;;38.16 
 ;;9002226.02101,"862,38.16 ",.02)
 ;;38.16 
 ;;9002226.02101,"862,38.18 ",.01)
 ;;38.18 
 ;;9002226.02101,"862,38.18 ",.02)
 ;;38.18 
 ;;9002226.02101,"862,38.30 ",.01)
 ;;38.30 
 ;;9002226.02101,"862,38.30 ",.02)
 ;;38.30 
 ;;9002226.02101,"862,38.31 ",.01)
 ;;38.31 
 ;;9002226.02101,"862,38.31 ",.02)
 ;;38.31 
 ;;9002226.02101,"862,38.32 ",.01)
 ;;38.32 
 ;;9002226.02101,"862,38.32 ",.02)
 ;;38.32 
 ;;9002226.02101,"862,38.33 ",.01)
 ;;38.33 
 ;;9002226.02101,"862,38.33 ",.02)
 ;;38.33 
 ;;9002226.02101,"862,38.34 ",.01)
 ;;38.34 
 ;;9002226.02101,"862,38.34 ",.02)
 ;;38.34 
 ;;9002226.02101,"862,38.35 ",.01)
 ;;38.35 
 ;;9002226.02101,"862,38.35 ",.02)
 ;;38.35 
 ;;9002226.02101,"862,38.36 ",.01)
 ;;38.36 
 ;;9002226.02101,"862,38.36 ",.02)
 ;;38.36 
 ;;9002226.02101,"862,38.37 ",.01)
 ;;38.37 
 ;;9002226.02101,"862,38.37 ",.02)
 ;;38.37 
 ;;9002226.02101,"862,38.38 ",.01)
 ;;38.38 
 ;;9002226.02101,"862,38.38 ",.02)
 ;;38.38 
 ;;9002226.02101,"862,38.39 ",.01)
 ;;38.39 
 ;;9002226.02101,"862,38.39 ",.02)
 ;;38.39 
 ;;9002226.02101,"862,38.40 ",.01)
 ;;38.40 
 ;;9002226.02101,"862,38.40 ",.02)
 ;;38.40 
 ;;9002226.02101,"862,38.41 ",.01)
 ;;38.41 
 ;;9002226.02101,"862,38.41 ",.02)
 ;;38.41 
 ;;9002226.02101,"862,38.42 ",.01)
 ;;38.42 
 ;;9002226.02101,"862,38.42 ",.02)
 ;;38.42 
 ;;9002226.02101,"862,38.43 ",.01)
 ;;38.43 
 ;;9002226.02101,"862,38.43 ",.02)
 ;;38.43 
 ;;9002226.02101,"862,38.44 ",.01)
 ;;38.44 
 ;;9002226.02101,"862,38.44 ",.02)
 ;;38.44 
 ;;9002226.02101,"862,38.45 ",.01)
 ;;38.45 
 ;;9002226.02101,"862,38.45 ",.02)
 ;;38.45 
 ;;9002226.02101,"862,38.46 ",.01)
 ;;38.46 
 ;;9002226.02101,"862,38.46 ",.02)
 ;;38.46 
 ;;9002226.02101,"862,38.47 ",.01)
 ;;38.47 
 ;;9002226.02101,"862,38.47 ",.02)
 ;;38.47 
 ;;9002226.02101,"862,38.48 ",.01)
 ;;38.48 
 ;;9002226.02101,"862,38.48 ",.02)
 ;;38.48 
 ;;9002226.02101,"862,38.49 ",.01)
 ;;38.49 
 ;;9002226.02101,"862,38.49 ",.02)
 ;;38.49 
 ;;9002226.02101,"862,38.64 ",.01)
 ;;38.64 
 ;;9002226.02101,"862,38.64 ",.02)
 ;;38.64 
 ;;9002226.02101,"862,38.7 ",.01)
 ;;38.7 
 ;;9002226.02101,"862,38.7 ",.02)
 ;;38.7 
 ;;9002226.02101,"862,38.80 ",.01)
 ;;38.80 
 ;;9002226.02101,"862,38.80 ",.02)
 ;;38.80 
 ;;9002226.02101,"862,38.81 ",.01)
 ;;38.81 
 ;;9002226.02101,"862,38.81 ",.02)
 ;;38.81 
 ;;9002226.02101,"862,38.82 ",.01)
 ;;38.82 
 ;;9002226.02101,"862,38.82 ",.02)
 ;;38.82 
 ;;9002226.02101,"862,38.84 ",.01)
 ;;38.84 
 ;;9002226.02101,"862,38.84 ",.02)
 ;;38.84 
 ;;9002226.02101,"862,38.85 ",.01)
 ;;38.85 
 ;;9002226.02101,"862,38.85 ",.02)
 ;;38.85 
 ;;9002226.02101,"862,38.86 ",.01)
 ;;38.86 
 ;;9002226.02101,"862,38.86 ",.02)
 ;;38.86 
 ;;9002226.02101,"862,38.87 ",.01)
 ;;38.87 
 ;;9002226.02101,"862,38.87 ",.02)
 ;;38.87 
 ;;9002226.02101,"862,38.88 ",.01)
 ;;38.88 
 ;;9002226.02101,"862,38.88 ",.02)
 ;;38.88 
 ;;9002226.02101,"862,39.0 ",.01)
 ;;39.0 
 ;;9002226.02101,"862,39.0 ",.02)
 ;;39.0 
 ;;9002226.02101,"862,39.1 ",.01)
 ;;39.1 
 ;;9002226.02101,"862,39.1 ",.02)
 ;;39.1 
 ;;9002226.02101,"862,39.21 ",.01)
 ;;39.21 
