BGP8CXMD ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 28, 2007 ;
 ;;8.0;IHS CLINICAL REPORTING;;MAR 12, 2008
 ;;;BGP6;;SEP 28, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"692,006.6 ",.02)
 ;;006.6 
 ;;9002226.02101,"692,006.8 ",.01)
 ;;006.8 
 ;;9002226.02101,"692,006.8 ",.02)
 ;;006.8 
 ;;9002226.02101,"692,006.9 ",.01)
 ;;006.9 
 ;;9002226.02101,"692,006.9 ",.02)
 ;;006.9 
 ;;9002226.02101,"692,007.0 ",.01)
 ;;007.0 
 ;;9002226.02101,"692,007.0 ",.02)
 ;;007.0 
 ;;9002226.02101,"692,007.1 ",.01)
 ;;007.1 
 ;;9002226.02101,"692,007.1 ",.02)
 ;;007.1 
 ;;9002226.02101,"692,007.2 ",.01)
 ;;007.2 
 ;;9002226.02101,"692,007.2 ",.02)
 ;;007.2 
 ;;9002226.02101,"692,007.3 ",.01)
 ;;007.3 
 ;;9002226.02101,"692,007.3 ",.02)
 ;;007.3 
 ;;9002226.02101,"692,007.4 ",.01)
 ;;007.4 
 ;;9002226.02101,"692,007.4 ",.02)
 ;;007.4 
 ;;9002226.02101,"692,007.5 ",.01)
 ;;007.5 
 ;;9002226.02101,"692,007.5 ",.02)
 ;;007.5 
 ;;9002226.02101,"692,007.8 ",.01)
 ;;007.8 
 ;;9002226.02101,"692,007.8 ",.02)
 ;;007.8 
 ;;9002226.02101,"692,007.9 ",.01)
 ;;007.9 
 ;;9002226.02101,"692,007.9 ",.02)
 ;;007.9 
 ;;9002226.02101,"692,008.00 ",.01)
 ;;008.00 
 ;;9002226.02101,"692,008.00 ",.02)
 ;;008.00 
 ;;9002226.02101,"692,008.01 ",.01)
 ;;008.01 
 ;;9002226.02101,"692,008.01 ",.02)
 ;;008.01 
 ;;9002226.02101,"692,008.02 ",.01)
 ;;008.02 
 ;;9002226.02101,"692,008.02 ",.02)
 ;;008.02 
 ;;9002226.02101,"692,008.03 ",.01)
 ;;008.03 
 ;;9002226.02101,"692,008.03 ",.02)
 ;;008.03 
 ;;9002226.02101,"692,008.04 ",.01)
 ;;008.04 
 ;;9002226.02101,"692,008.04 ",.02)
 ;;008.04 
 ;;9002226.02101,"692,008.09 ",.01)
 ;;008.09 
 ;;9002226.02101,"692,008.09 ",.02)
 ;;008.09 
 ;;9002226.02101,"692,008.1 ",.01)
 ;;008.1 
 ;;9002226.02101,"692,008.1 ",.02)
 ;;008.1 
 ;;9002226.02101,"692,008.2 ",.01)
 ;;008.2 
 ;;9002226.02101,"692,008.2 ",.02)
 ;;008.2 
 ;;9002226.02101,"692,008.3 ",.01)
 ;;008.3 
 ;;9002226.02101,"692,008.3 ",.02)
 ;;008.3 
 ;;9002226.02101,"692,008.41 ",.01)
 ;;008.41 
 ;;9002226.02101,"692,008.41 ",.02)
 ;;008.41 
 ;;9002226.02101,"692,008.42 ",.01)
 ;;008.42 
 ;;9002226.02101,"692,008.42 ",.02)
 ;;008.42 
 ;;9002226.02101,"692,008.43 ",.01)
 ;;008.43 
 ;;9002226.02101,"692,008.43 ",.02)
 ;;008.43 
 ;;9002226.02101,"692,008.44 ",.01)
 ;;008.44 
 ;;9002226.02101,"692,008.44 ",.02)
 ;;008.44 
 ;;9002226.02101,"692,008.45 ",.01)
 ;;008.45 
 ;;9002226.02101,"692,008.45 ",.02)
 ;;008.45 
 ;;9002226.02101,"692,008.46 ",.01)
 ;;008.46 
 ;;9002226.02101,"692,008.46 ",.02)
 ;;008.46 
 ;;9002226.02101,"692,008.47 ",.01)
 ;;008.47 
 ;;9002226.02101,"692,008.47 ",.02)
 ;;008.47 
 ;;9002226.02101,"692,008.49 ",.01)
 ;;008.49 
 ;;9002226.02101,"692,008.49 ",.02)
 ;;008.49 
 ;;9002226.02101,"692,008.5 ",.01)
 ;;008.5 
 ;;9002226.02101,"692,008.5 ",.02)
 ;;008.5 
 ;;9002226.02101,"692,008.8 ",.01)
 ;;008.8 
 ;;9002226.02101,"692,008.8 ",.02)
 ;;008.8 
 ;;9002226.02101,"692,009.0 ",.01)
 ;;009.0 
 ;;9002226.02101,"692,009.0 ",.02)
 ;;009.0 
 ;;9002226.02101,"692,009.1 ",.01)
 ;;009.1 
 ;;9002226.02101,"692,009.1 ",.02)
 ;;009.1 
 ;;9002226.02101,"692,009.2 ",.01)
 ;;009.2 
 ;;9002226.02101,"692,009.2 ",.02)
 ;;009.2 
 ;;9002226.02101,"692,009.3 ",.01)
 ;;009.3 
 ;;9002226.02101,"692,009.3 ",.02)
 ;;009.3 
 ;;9002226.02101,"692,010.00 ",.01)
 ;;010.00 
 ;;9002226.02101,"692,010.00 ",.02)
 ;;010.00 
 ;;9002226.02101,"692,010.01 ",.01)
 ;;010.01 
 ;;9002226.02101,"692,010.01 ",.02)
 ;;010.01 
 ;;9002226.02101,"692,010.02 ",.01)
 ;;010.02 
 ;;9002226.02101,"692,010.02 ",.02)
 ;;010.02 
 ;;9002226.02101,"692,010.03 ",.01)
 ;;010.03 
 ;;9002226.02101,"692,010.03 ",.02)
 ;;010.03 
 ;;9002226.02101,"692,010.04 ",.01)
 ;;010.04 
 ;;9002226.02101,"692,010.04 ",.02)
 ;;010.04 
 ;;9002226.02101,"692,010.05 ",.01)
 ;;010.05 
 ;;9002226.02101,"692,010.05 ",.02)
 ;;010.05 
 ;;9002226.02101,"692,010.06 ",.01)
 ;;010.06 
 ;;9002226.02101,"692,010.06 ",.02)
 ;;010.06 
 ;;9002226.02101,"692,010.10 ",.01)
 ;;010.10 
 ;;9002226.02101,"692,010.10 ",.02)
 ;;010.10 
 ;;9002226.02101,"692,010.11 ",.01)
 ;;010.11 
 ;;9002226.02101,"692,010.11 ",.02)
 ;;010.11 
 ;;9002226.02101,"692,010.12 ",.01)
 ;;010.12 
 ;;9002226.02101,"692,010.12 ",.02)
 ;;010.12 
 ;;9002226.02101,"692,010.13 ",.01)
 ;;010.13 
 ;;9002226.02101,"692,010.13 ",.02)
 ;;010.13 
 ;;9002226.02101,"692,010.14 ",.01)
 ;;010.14 
 ;;9002226.02101,"692,010.14 ",.02)
 ;;010.14 
 ;;9002226.02101,"692,010.15 ",.01)
 ;;010.15 
 ;;9002226.02101,"692,010.15 ",.02)
 ;;010.15 
 ;;9002226.02101,"692,010.16 ",.01)
 ;;010.16 
 ;;9002226.02101,"692,010.16 ",.02)
 ;;010.16 
 ;;9002226.02101,"692,010.80 ",.01)
 ;;010.80 
 ;;9002226.02101,"692,010.80 ",.02)
 ;;010.80 
 ;;9002226.02101,"692,010.81 ",.01)
 ;;010.81 
 ;;9002226.02101,"692,010.81 ",.02)
 ;;010.81 
 ;;9002226.02101,"692,010.82 ",.01)
 ;;010.82 
 ;;9002226.02101,"692,010.82 ",.02)
 ;;010.82 
 ;;9002226.02101,"692,010.83 ",.01)
 ;;010.83 
 ;;9002226.02101,"692,010.83 ",.02)
 ;;010.83 
 ;;9002226.02101,"692,010.84 ",.01)
 ;;010.84 
 ;;9002226.02101,"692,010.84 ",.02)
 ;;010.84 
 ;;9002226.02101,"692,010.85 ",.01)
 ;;010.85 
 ;;9002226.02101,"692,010.85 ",.02)
 ;;010.85 
 ;;9002226.02101,"692,010.86 ",.01)
 ;;010.86 
 ;;9002226.02101,"692,010.86 ",.02)
 ;;010.86 
 ;;9002226.02101,"692,010.90 ",.01)
 ;;010.90 
 ;;9002226.02101,"692,010.90 ",.02)
 ;;010.90 
 ;;9002226.02101,"692,010.91 ",.01)
 ;;010.91 
 ;;9002226.02101,"692,010.91 ",.02)
 ;;010.91 
 ;;9002226.02101,"692,010.92 ",.01)
 ;;010.92 
 ;;9002226.02101,"692,010.92 ",.02)
 ;;010.92 
 ;;9002226.02101,"692,010.93 ",.01)
 ;;010.93 
 ;;9002226.02101,"692,010.93 ",.02)
 ;;010.93 
 ;;9002226.02101,"692,010.94 ",.01)
 ;;010.94 
 ;;9002226.02101,"692,010.94 ",.02)
 ;;010.94 
 ;;9002226.02101,"692,010.95 ",.01)
 ;;010.95 
 ;;9002226.02101,"692,010.95 ",.02)
 ;;010.95 
 ;;9002226.02101,"692,010.96 ",.01)
 ;;010.96 
 ;;9002226.02101,"692,010.96 ",.02)
 ;;010.96 
 ;;9002226.02101,"692,011.00 ",.01)
 ;;011.00 
 ;;9002226.02101,"692,011.00 ",.02)
 ;;011.00 
 ;;9002226.02101,"692,011.01 ",.01)
 ;;011.01 
 ;;9002226.02101,"692,011.01 ",.02)
 ;;011.01 
 ;;9002226.02101,"692,011.02 ",.01)
 ;;011.02 
 ;;9002226.02101,"692,011.02 ",.02)
 ;;011.02 
 ;;9002226.02101,"692,011.03 ",.01)
 ;;011.03 
 ;;9002226.02101,"692,011.03 ",.02)
 ;;011.03 
 ;;9002226.02101,"692,011.04 ",.01)
 ;;011.04 
 ;;9002226.02101,"692,011.04 ",.02)
 ;;011.04 
 ;;9002226.02101,"692,011.05 ",.01)
 ;;011.05 
 ;;9002226.02101,"692,011.05 ",.02)
 ;;011.05 
 ;;9002226.02101,"692,011.06 ",.01)
 ;;011.06 
 ;;9002226.02101,"692,011.06 ",.02)
 ;;011.06 
 ;;9002226.02101,"692,011.10 ",.01)
 ;;011.10 
 ;;9002226.02101,"692,011.10 ",.02)
 ;;011.10 
 ;;9002226.02101,"692,011.11 ",.01)
 ;;011.11 
 ;;9002226.02101,"692,011.11 ",.02)
 ;;011.11 
 ;;9002226.02101,"692,011.12 ",.01)
 ;;011.12 
 ;;9002226.02101,"692,011.12 ",.02)
 ;;011.12 
 ;;9002226.02101,"692,011.13 ",.01)
 ;;011.13 
 ;;9002226.02101,"692,011.13 ",.02)
 ;;011.13 
 ;;9002226.02101,"692,011.14 ",.01)
 ;;011.14 
 ;;9002226.02101,"692,011.14 ",.02)
 ;;011.14 
 ;;9002226.02101,"692,011.15 ",.01)
 ;;011.15 
 ;;9002226.02101,"692,011.15 ",.02)
 ;;011.15 
 ;;9002226.02101,"692,011.16 ",.01)
 ;;011.16 
 ;;9002226.02101,"692,011.16 ",.02)
 ;;011.16 
 ;;9002226.02101,"692,011.20 ",.01)
 ;;011.20 
 ;;9002226.02101,"692,011.20 ",.02)
 ;;011.20 
 ;;9002226.02101,"692,011.21 ",.01)
 ;;011.21 
 ;;9002226.02101,"692,011.21 ",.02)
 ;;011.21 
 ;;9002226.02101,"692,011.22 ",.01)
 ;;011.22 
 ;;9002226.02101,"692,011.22 ",.02)
 ;;011.22 
 ;;9002226.02101,"692,011.23 ",.01)
 ;;011.23 
 ;;9002226.02101,"692,011.23 ",.02)
 ;;011.23 
 ;;9002226.02101,"692,011.24 ",.01)
 ;;011.24 
 ;;9002226.02101,"692,011.24 ",.02)
 ;;011.24 
 ;;9002226.02101,"692,011.25 ",.01)
 ;;011.25 
 ;;9002226.02101,"692,011.25 ",.02)
 ;;011.25 
 ;;9002226.02101,"692,011.26 ",.01)
 ;;011.26 
 ;;9002226.02101,"692,011.26 ",.02)
 ;;011.26 
 ;;9002226.02101,"692,011.30 ",.01)
 ;;011.30 
 ;;9002226.02101,"692,011.30 ",.02)
 ;;011.30 
 ;;9002226.02101,"692,011.31 ",.01)
 ;;011.31 
 ;;9002226.02101,"692,011.31 ",.02)
 ;;011.31 
 ;;9002226.02101,"692,011.32 ",.01)
 ;;011.32 
 ;;9002226.02101,"692,011.32 ",.02)
 ;;011.32 
 ;;9002226.02101,"692,011.33 ",.01)
 ;;011.33 
 ;;9002226.02101,"692,011.33 ",.02)
 ;;011.33 
 ;;9002226.02101,"692,011.34 ",.01)
 ;;011.34 
 ;;9002226.02101,"692,011.34 ",.02)
 ;;011.34 
 ;;9002226.02101,"692,011.35 ",.01)
 ;;011.35 
 ;;9002226.02101,"692,011.35 ",.02)
 ;;011.35 
 ;;9002226.02101,"692,011.36 ",.01)
 ;;011.36 
 ;;9002226.02101,"692,011.36 ",.02)
 ;;011.36 
 ;;9002226.02101,"692,011.40 ",.01)
 ;;011.40 
 ;;9002226.02101,"692,011.40 ",.02)
 ;;011.40 
 ;;9002226.02101,"692,011.41 ",.01)
 ;;011.41 
 ;;9002226.02101,"692,011.41 ",.02)
 ;;011.41 
 ;;9002226.02101,"692,011.42 ",.01)
 ;;011.42 
 ;;9002226.02101,"692,011.42 ",.02)
 ;;011.42 
 ;;9002226.02101,"692,011.43 ",.01)
 ;;011.43 
 ;;9002226.02101,"692,011.43 ",.02)
 ;;011.43 
 ;;9002226.02101,"692,011.44 ",.01)
 ;;011.44 
 ;;9002226.02101,"692,011.44 ",.02)
 ;;011.44 
 ;;9002226.02101,"692,011.45 ",.01)
 ;;011.45 
 ;;9002226.02101,"692,011.45 ",.02)
 ;;011.45 
 ;;9002226.02101,"692,011.46 ",.01)
 ;;011.46 
 ;;9002226.02101,"692,011.46 ",.02)
 ;;011.46 
 ;;9002226.02101,"692,011.50 ",.01)
 ;;011.50 
 ;;9002226.02101,"692,011.50 ",.02)
 ;;011.50 
 ;;9002226.02101,"692,011.51 ",.01)
 ;;011.51 
 ;;9002226.02101,"692,011.51 ",.02)
 ;;011.51 
 ;;9002226.02101,"692,011.52 ",.01)
 ;;011.52 
 ;;9002226.02101,"692,011.52 ",.02)
 ;;011.52 
 ;;9002226.02101,"692,011.53 ",.01)
 ;;011.53 
 ;;9002226.02101,"692,011.53 ",.02)
 ;;011.53 
 ;;9002226.02101,"692,011.54 ",.01)
 ;;011.54 
 ;;9002226.02101,"692,011.54 ",.02)
 ;;011.54 
 ;;9002226.02101,"692,011.55 ",.01)
 ;;011.55 
 ;;9002226.02101,"692,011.55 ",.02)
 ;;011.55 
 ;;9002226.02101,"692,011.56 ",.01)
 ;;011.56 
 ;;9002226.02101,"692,011.56 ",.02)
 ;;011.56 
 ;;9002226.02101,"692,011.60 ",.01)
 ;;011.60 
 ;;9002226.02101,"692,011.60 ",.02)
 ;;011.60 
 ;;9002226.02101,"692,011.61 ",.01)
 ;;011.61 
 ;;9002226.02101,"692,011.61 ",.02)
 ;;011.61 
 ;;9002226.02101,"692,011.62 ",.01)
 ;;011.62 
 ;;9002226.02101,"692,011.62 ",.02)
 ;;011.62 
 ;;9002226.02101,"692,011.63 ",.01)
 ;;011.63 
 ;;9002226.02101,"692,011.63 ",.02)
 ;;011.63 
 ;;9002226.02101,"692,011.64 ",.01)
 ;;011.64 
 ;;9002226.02101,"692,011.64 ",.02)
 ;;011.64 
 ;;9002226.02101,"692,011.65 ",.01)
 ;;011.65 
 ;;9002226.02101,"692,011.65 ",.02)
 ;;011.65 
 ;;9002226.02101,"692,011.66 ",.01)
 ;;011.66 
 ;;9002226.02101,"692,011.66 ",.02)
 ;;011.66 
 ;;9002226.02101,"692,011.70 ",.01)
 ;;011.70 
 ;;9002226.02101,"692,011.70 ",.02)
 ;;011.70 
 ;;9002226.02101,"692,011.71 ",.01)
 ;;011.71 
 ;;9002226.02101,"692,011.71 ",.02)
 ;;011.71 
 ;;9002226.02101,"692,011.72 ",.01)
 ;;011.72 
 ;;9002226.02101,"692,011.72 ",.02)
 ;;011.72 
 ;;9002226.02101,"692,011.73 ",.01)
 ;;011.73 
 ;;9002226.02101,"692,011.73 ",.02)
 ;;011.73 
 ;;9002226.02101,"692,011.74 ",.01)
 ;;011.74 
 ;;9002226.02101,"692,011.74 ",.02)
 ;;011.74 
 ;;9002226.02101,"692,011.75 ",.01)
 ;;011.75 
 ;;9002226.02101,"692,011.75 ",.02)
 ;;011.75 
 ;;9002226.02101,"692,011.76 ",.01)
 ;;011.76 
 ;;9002226.02101,"692,011.76 ",.02)
 ;;011.76 
 ;;9002226.02101,"692,011.80 ",.01)
 ;;011.80 
 ;;9002226.02101,"692,011.80 ",.02)
 ;;011.80 
 ;;9002226.02101,"692,011.81 ",.01)
 ;;011.81 
 ;;9002226.02101,"692,011.81 ",.02)
 ;;011.81 
 ;;9002226.02101,"692,011.82 ",.01)
 ;;011.82 
 ;;9002226.02101,"692,011.82 ",.02)
 ;;011.82 
 ;;9002226.02101,"692,011.83 ",.01)
 ;;011.83 
 ;;9002226.02101,"692,011.83 ",.02)
 ;;011.83 
 ;;9002226.02101,"692,011.84 ",.01)
 ;;011.84 
 ;;9002226.02101,"692,011.84 ",.02)
 ;;011.84 
 ;;9002226.02101,"692,011.85 ",.01)
 ;;011.85 
 ;;9002226.02101,"692,011.85 ",.02)
 ;;011.85 
 ;;9002226.02101,"692,011.86 ",.01)
 ;;011.86 
 ;;9002226.02101,"692,011.86 ",.02)
 ;;011.86 
 ;;9002226.02101,"692,011.90 ",.01)
 ;;011.90 
 ;;9002226.02101,"692,011.90 ",.02)
 ;;011.90 
 ;;9002226.02101,"692,011.91 ",.01)
 ;;011.91 
 ;;9002226.02101,"692,011.91 ",.02)
 ;;011.91 
 ;;9002226.02101,"692,011.92 ",.01)
 ;;011.92 
 ;;9002226.02101,"692,011.92 ",.02)
 ;;011.92 
 ;;9002226.02101,"692,011.93 ",.01)
 ;;011.93 
 ;;9002226.02101,"692,011.93 ",.02)
 ;;011.93 
 ;;9002226.02101,"692,011.94 ",.01)
 ;;011.94 
 ;;9002226.02101,"692,011.94 ",.02)
 ;;011.94 
 ;;9002226.02101,"692,011.95 ",.01)
 ;;011.95 
 ;;9002226.02101,"692,011.95 ",.02)
 ;;011.95 
 ;;9002226.02101,"692,011.96 ",.01)
 ;;011.96 
 ;;9002226.02101,"692,011.96 ",.02)
 ;;011.96 
 ;;9002226.02101,"692,012.00 ",.01)
 ;;012.00 
 ;;9002226.02101,"692,012.00 ",.02)
 ;;012.00 
 ;;9002226.02101,"692,012.01 ",.01)
 ;;012.01 
 ;;9002226.02101,"692,012.01 ",.02)
 ;;012.01 
 ;;9002226.02101,"692,012.02 ",.01)
 ;;012.02 
 ;;9002226.02101,"692,012.02 ",.02)
 ;;012.02 
 ;;9002226.02101,"692,012.03 ",.01)
 ;;012.03 
 ;;9002226.02101,"692,012.03 ",.02)
 ;;012.03 
 ;;9002226.02101,"692,012.04 ",.01)
 ;;012.04 
 ;;9002226.02101,"692,012.04 ",.02)
 ;;012.04 
 ;;9002226.02101,"692,012.05 ",.01)
 ;;012.05 
 ;;9002226.02101,"692,012.05 ",.02)
 ;;012.05 
 ;;9002226.02101,"692,012.06 ",.01)
 ;;012.06 
 ;;9002226.02101,"692,012.06 ",.02)
 ;;012.06 
 ;;9002226.02101,"692,012.10 ",.01)
 ;;012.10 
 ;;9002226.02101,"692,012.10 ",.02)
 ;;012.10 
