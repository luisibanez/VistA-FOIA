BGP8CXML ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 28, 2007 ;
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
 ;;9002226.02101,"692,562.13 ",.02)
 ;;562.13 
 ;;9002226.02101,"692,566 ",.01)
 ;;566 
 ;;9002226.02101,"692,566 ",.02)
 ;;566 
 ;;9002226.02101,"692,567.21 ",.01)
 ;;567.21 
 ;;9002226.02101,"692,567.21 ",.02)
 ;;567.21 
 ;;9002226.02101,"692,567.22 ",.01)
 ;;567.22 
 ;;9002226.02101,"692,567.22 ",.02)
 ;;567.22 
 ;;9002226.02101,"692,567.23 ",.01)
 ;;567.23 
 ;;9002226.02101,"692,567.23 ",.02)
 ;;567.23 
 ;;9002226.02101,"692,567.29 ",.01)
 ;;567.29 
 ;;9002226.02101,"692,567.29 ",.02)
 ;;567.29 
 ;;9002226.02101,"692,567.31 ",.01)
 ;;567.31 
 ;;9002226.02101,"692,567.31 ",.02)
 ;;567.31 
 ;;9002226.02101,"692,567.38 ",.01)
 ;;567.38 
 ;;9002226.02101,"692,567.38 ",.02)
 ;;567.38 
 ;;9002226.02101,"692,567.39 ",.01)
 ;;567.39 
 ;;9002226.02101,"692,567.39 ",.02)
 ;;567.39 
 ;;9002226.02101,"692,567.81 ",.01)
 ;;567.81 
 ;;9002226.02101,"692,567.81 ",.02)
 ;;567.81 
 ;;9002226.02101,"692,567.82 ",.01)
 ;;567.82 
 ;;9002226.02101,"692,567.82 ",.02)
 ;;567.82 
 ;;9002226.02101,"692,567.89 ",.01)
 ;;567.89 
 ;;9002226.02101,"692,567.89 ",.02)
 ;;567.89 
 ;;9002226.02101,"692,567.9 ",.01)
 ;;567.9 
 ;;9002226.02101,"692,567.9 ",.02)
 ;;567.9 
 ;;9002226.02101,"692,569.5 ",.01)
 ;;569.5 
 ;;9002226.02101,"692,569.5 ",.02)
 ;;569.5 
 ;;9002226.02101,"692,569.61 ",.01)
 ;;569.61 
 ;;9002226.02101,"692,569.61 ",.02)
 ;;569.61 
 ;;9002226.02101,"692,575.0 ",.01)
 ;;575.0 
 ;;9002226.02101,"692,575.0 ",.02)
 ;;575.0 
 ;;9002226.02101,"692,590.00 ",.01)
 ;;590.00 
 ;;9002226.02101,"692,590.00 ",.02)
 ;;590.00 
 ;;9002226.02101,"692,590.01 ",.01)
 ;;590.01 
 ;;9002226.02101,"692,590.01 ",.02)
 ;;590.01 
 ;;9002226.02101,"692,590.10 ",.01)
 ;;590.10 
 ;;9002226.02101,"692,590.10 ",.02)
 ;;590.10 
 ;;9002226.02101,"692,590.11 ",.01)
 ;;590.11 
 ;;9002226.02101,"692,590.11 ",.02)
 ;;590.11 
 ;;9002226.02101,"692,590.2 ",.01)
 ;;590.2 
 ;;9002226.02101,"692,590.2 ",.02)
 ;;590.2 
 ;;9002226.02101,"692,590.3 ",.01)
 ;;590.3 
 ;;9002226.02101,"692,590.3 ",.02)
 ;;590.3 
 ;;9002226.02101,"692,590.80 ",.01)
 ;;590.80 
 ;;9002226.02101,"692,590.80 ",.02)
 ;;590.80 
 ;;9002226.02101,"692,590.81 ",.01)
 ;;590.81 
 ;;9002226.02101,"692,590.81 ",.02)
 ;;590.81 
 ;;9002226.02101,"692,590.9 ",.01)
 ;;590.9 
 ;;9002226.02101,"692,590.9 ",.02)
 ;;590.9 
 ;;9002226.02101,"692,595.0 ",.01)
 ;;595.0 
 ;;9002226.02101,"692,595.0 ",.02)
 ;;595.0 
 ;;9002226.02101,"692,599.0 ",.01)
 ;;599.0 
 ;;9002226.02101,"692,599.0 ",.02)
 ;;599.0 
 ;;9002226.02101,"692,601.0 ",.01)
 ;;601.0 
 ;;9002226.02101,"692,601.0 ",.02)
 ;;601.0 
 ;;9002226.02101,"692,601.1 ",.01)
 ;;601.1 
 ;;9002226.02101,"692,601.1 ",.02)
 ;;601.1 
 ;;9002226.02101,"692,601.2 ",.01)
 ;;601.2 
 ;;9002226.02101,"692,601.2 ",.02)
 ;;601.2 
 ;;9002226.02101,"692,601.3 ",.01)
 ;;601.3 
 ;;9002226.02101,"692,601.3 ",.02)
 ;;601.3 
 ;;9002226.02101,"692,601.4 ",.01)
 ;;601.4 
 ;;9002226.02101,"692,601.4 ",.02)
 ;;601.4 
 ;;9002226.02101,"692,601.8 ",.01)
 ;;601.8 
 ;;9002226.02101,"692,601.8 ",.02)
 ;;601.8 
 ;;9002226.02101,"692,601.9 ",.01)
 ;;601.9 
 ;;9002226.02101,"692,601.9 ",.02)
 ;;601.9 
 ;;9002226.02101,"692,608.83 ",.01)
 ;;608.83 
 ;;9002226.02101,"692,608.83 ",.02)
 ;;608.83 
 ;;9002226.02101,"692,614.0 ",.01)
 ;;614.0 
 ;;9002226.02101,"692,614.0 ",.02)
 ;;614.0 
 ;;9002226.02101,"692,614.1 ",.01)
 ;;614.1 
 ;;9002226.02101,"692,614.1 ",.02)
 ;;614.1 
 ;;9002226.02101,"692,614.2 ",.01)
 ;;614.2 
 ;;9002226.02101,"692,614.2 ",.02)
 ;;614.2 
 ;;9002226.02101,"692,614.3 ",.01)
 ;;614.3 
 ;;9002226.02101,"692,614.3 ",.02)
 ;;614.3 
 ;;9002226.02101,"692,614.4 ",.01)
 ;;614.4 
 ;;9002226.02101,"692,614.4 ",.02)
 ;;614.4 
 ;;9002226.02101,"692,614.5 ",.01)
 ;;614.5 
 ;;9002226.02101,"692,614.5 ",.02)
 ;;614.5 
 ;;9002226.02101,"692,614.6 ",.01)
 ;;614.6 
 ;;9002226.02101,"692,614.6 ",.02)
 ;;614.6 
 ;;9002226.02101,"692,614.7 ",.01)
 ;;614.7 
 ;;9002226.02101,"692,614.7 ",.02)
 ;;614.7 
 ;;9002226.02101,"692,614.8 ",.01)
 ;;614.8 
 ;;9002226.02101,"692,614.8 ",.02)
 ;;614.8 
 ;;9002226.02101,"692,614.9 ",.01)
 ;;614.9 
 ;;9002226.02101,"692,614.9 ",.02)
 ;;614.9 
 ;;9002226.02101,"692,616.0 ",.01)
 ;;616.0 
 ;;9002226.02101,"692,616.0 ",.02)
 ;;616.0 
 ;;9002226.02101,"692,616.10 ",.01)
 ;;616.10 
 ;;9002226.02101,"692,616.10 ",.02)
 ;;616.10 
 ;;9002226.02101,"692,616.11 ",.01)
 ;;616.11 
 ;;9002226.02101,"692,616.11 ",.02)
 ;;616.11 
 ;;9002226.02101,"692,616.2 ",.01)
 ;;616.2 
 ;;9002226.02101,"692,616.2 ",.02)
 ;;616.2 
 ;;9002226.02101,"692,616.3 ",.01)
 ;;616.3 
 ;;9002226.02101,"692,616.3 ",.02)
 ;;616.3 
 ;;9002226.02101,"692,616.4 ",.01)
 ;;616.4 
 ;;9002226.02101,"692,616.4 ",.02)
 ;;616.4 
 ;;9002226.02101,"692,639.0 ",.01)
 ;;639.0 
 ;;9002226.02101,"692,639.0 ",.02)
 ;;639.0 
 ;;9002226.02101,"692,646.60 ",.01)
 ;;646.60 
 ;;9002226.02101,"692,646.60 ",.02)
 ;;646.60 
 ;;9002226.02101,"692,646.61 ",.01)
 ;;646.61 
 ;;9002226.02101,"692,646.61 ",.02)
 ;;646.61 
 ;;9002226.02101,"692,646.62 ",.01)
 ;;646.62 
 ;;9002226.02101,"692,646.62 ",.02)
 ;;646.62 
 ;;9002226.02101,"692,646.63 ",.01)
 ;;646.63 
 ;;9002226.02101,"692,646.63 ",.02)
 ;;646.63 
 ;;9002226.02101,"692,646.64 ",.01)
 ;;646.64 
 ;;9002226.02101,"692,646.64 ",.02)
 ;;646.64 
 ;;9002226.02101,"692,670.00 ",.01)
 ;;670.00 
 ;;9002226.02101,"692,670.00 ",.02)
 ;;670.00 
 ;;9002226.02101,"692,670.02 ",.01)
 ;;670.02 
 ;;9002226.02101,"692,670.02 ",.02)
 ;;670.02 
 ;;9002226.02101,"692,670.04 ",.01)
 ;;670.04 
 ;;9002226.02101,"692,670.04 ",.02)
 ;;670.04 
 ;;9002226.02101,"692,674.30 ",.01)
 ;;674.30 
 ;;9002226.02101,"692,674.30 ",.02)
 ;;674.30 
 ;;9002226.02101,"692,674.32 ",.01)
 ;;674.32 
 ;;9002226.02101,"692,674.32 ",.02)
 ;;674.32 
 ;;9002226.02101,"692,674.34 ",.01)
 ;;674.34 
 ;;9002226.02101,"692,674.34 ",.02)
 ;;674.34 
 ;;9002226.02101,"692,680.0 ",.01)
 ;;680.0 
 ;;9002226.02101,"692,680.0 ",.02)
 ;;680.0 
 ;;9002226.02101,"692,680.1 ",.01)
 ;;680.1 
 ;;9002226.02101,"692,680.1 ",.02)
 ;;680.1 
 ;;9002226.02101,"692,680.2 ",.01)
 ;;680.2 
 ;;9002226.02101,"692,680.2 ",.02)
 ;;680.2 
 ;;9002226.02101,"692,680.3 ",.01)
 ;;680.3 
 ;;9002226.02101,"692,680.3 ",.02)
 ;;680.3 
 ;;9002226.02101,"692,680.4 ",.01)
 ;;680.4 
 ;;9002226.02101,"692,680.4 ",.02)
 ;;680.4 
 ;;9002226.02101,"692,680.5 ",.01)
 ;;680.5 
 ;;9002226.02101,"692,680.5 ",.02)
 ;;680.5 
 ;;9002226.02101,"692,680.6 ",.01)
 ;;680.6 
 ;;9002226.02101,"692,680.6 ",.02)
 ;;680.6 
 ;;9002226.02101,"692,680.7 ",.01)
 ;;680.7 
 ;;9002226.02101,"692,680.7 ",.02)
 ;;680.7 
 ;;9002226.02101,"692,680.8 ",.01)
 ;;680.8 
 ;;9002226.02101,"692,680.8 ",.02)
 ;;680.8 
 ;;9002226.02101,"692,680.9 ",.01)
 ;;680.9 
 ;;9002226.02101,"692,680.9 ",.02)
 ;;680.9 
 ;;9002226.02101,"692,681.00 ",.01)
 ;;681.00 
 ;;9002226.02101,"692,681.00 ",.02)
 ;;681.00 
 ;;9002226.02101,"692,681.01 ",.01)
 ;;681.01 
 ;;9002226.02101,"692,681.01 ",.02)
 ;;681.01 
 ;;9002226.02101,"692,681.02 ",.01)
 ;;681.02 
 ;;9002226.02101,"692,681.02 ",.02)
 ;;681.02 
 ;;9002226.02101,"692,681.10 ",.01)
 ;;681.10 
 ;;9002226.02101,"692,681.10 ",.02)
 ;;681.10 
 ;;9002226.02101,"692,681.11 ",.01)
 ;;681.11 
 ;;9002226.02101,"692,681.11 ",.02)
 ;;681.11 
 ;;9002226.02101,"692,681.9 ",.01)
 ;;681.9 
 ;;9002226.02101,"692,681.9 ",.02)
 ;;681.9 
 ;;9002226.02101,"692,682.0 ",.01)
 ;;682.0 
 ;;9002226.02101,"692,682.0 ",.02)
 ;;682.0 
 ;;9002226.02101,"692,682.1 ",.01)
 ;;682.1 
 ;;9002226.02101,"692,682.1 ",.02)
 ;;682.1 
 ;;9002226.02101,"692,682.2 ",.01)
 ;;682.2 
 ;;9002226.02101,"692,682.2 ",.02)
 ;;682.2 
 ;;9002226.02101,"692,682.3 ",.01)
 ;;682.3 
 ;;9002226.02101,"692,682.3 ",.02)
 ;;682.3 
 ;;9002226.02101,"692,682.4 ",.01)
 ;;682.4 
 ;;9002226.02101,"692,682.4 ",.02)
 ;;682.4 
 ;;9002226.02101,"692,682.5 ",.01)
 ;;682.5 
 ;;9002226.02101,"692,682.5 ",.02)
 ;;682.5 
 ;;9002226.02101,"692,682.6 ",.01)
 ;;682.6 
 ;;9002226.02101,"692,682.6 ",.02)
 ;;682.6 
 ;;9002226.02101,"692,682.7 ",.01)
 ;;682.7 
 ;;9002226.02101,"692,682.7 ",.02)
 ;;682.7 
 ;;9002226.02101,"692,682.8 ",.01)
 ;;682.8 
 ;;9002226.02101,"692,682.8 ",.02)
 ;;682.8 
 ;;9002226.02101,"692,682.9 ",.01)
 ;;682.9 
 ;;9002226.02101,"692,682.9 ",.02)
 ;;682.9 
 ;;9002226.02101,"692,683 ",.01)
 ;;683 
 ;;9002226.02101,"692,683 ",.02)
 ;;683 
 ;;9002226.02101,"692,684 ",.01)
 ;;684 
 ;;9002226.02101,"692,684 ",.02)
 ;;684 
 ;;9002226.02101,"692,685.0 ",.01)
 ;;685.0 
 ;;9002226.02101,"692,685.0 ",.02)
 ;;685.0 
 ;;9002226.02101,"692,685.1 ",.01)
 ;;685.1 
 ;;9002226.02101,"692,685.1 ",.02)
 ;;685.1 
 ;;9002226.02101,"692,686.00 ",.01)
 ;;686.00 
 ;;9002226.02101,"692,686.00 ",.02)
 ;;686.00 
 ;;9002226.02101,"692,686.01 ",.01)
 ;;686.01 
 ;;9002226.02101,"692,686.01 ",.02)
 ;;686.01 
 ;;9002226.02101,"692,686.09 ",.01)
 ;;686.09 
 ;;9002226.02101,"692,686.09 ",.02)
 ;;686.09 
 ;;9002226.02101,"692,686.1 ",.01)
 ;;686.1 
 ;;9002226.02101,"692,686.1 ",.02)
 ;;686.1 
 ;;9002226.02101,"692,686.8 ",.01)
 ;;686.8 
 ;;9002226.02101,"692,686.8 ",.02)
 ;;686.8 
 ;;9002226.02101,"692,686.9 ",.01)
 ;;686.9 
 ;;9002226.02101,"692,686.9 ",.02)
 ;;686.9 
 ;;9002226.02101,"692,711.90 ",.01)
 ;;711.90 
 ;;9002226.02101,"692,711.90 ",.02)
 ;;711.90 
 ;;9002226.02101,"692,711.91 ",.01)
 ;;711.91 
 ;;9002226.02101,"692,711.91 ",.02)
 ;;711.91 
 ;;9002226.02101,"692,711.92 ",.01)
 ;;711.92 
 ;;9002226.02101,"692,711.92 ",.02)
 ;;711.92 
 ;;9002226.02101,"692,711.93 ",.01)
 ;;711.93 
 ;;9002226.02101,"692,711.93 ",.02)
 ;;711.93 
 ;;9002226.02101,"692,711.94 ",.01)
 ;;711.94 
 ;;9002226.02101,"692,711.94 ",.02)
 ;;711.94 
 ;;9002226.02101,"692,711.95 ",.01)
 ;;711.95 
 ;;9002226.02101,"692,711.95 ",.02)
 ;;711.95 
 ;;9002226.02101,"692,711.96 ",.01)
 ;;711.96 
 ;;9002226.02101,"692,711.96 ",.02)
 ;;711.96 
 ;;9002226.02101,"692,711.97 ",.01)
 ;;711.97 
 ;;9002226.02101,"692,711.97 ",.02)
 ;;711.97 
 ;;9002226.02101,"692,711.98 ",.01)
 ;;711.98 
 ;;9002226.02101,"692,711.98 ",.02)
 ;;711.98 
 ;;9002226.02101,"692,711.99 ",.01)
 ;;711.99 
 ;;9002226.02101,"692,711.99 ",.02)
 ;;711.99 
 ;;9002226.02101,"692,730.00 ",.01)
 ;;730.00 
 ;;9002226.02101,"692,730.00 ",.02)
 ;;730.00 
 ;;9002226.02101,"692,730.01 ",.01)
 ;;730.01 
 ;;9002226.02101,"692,730.01 ",.02)
 ;;730.01 
 ;;9002226.02101,"692,730.02 ",.01)
 ;;730.02 
 ;;9002226.02101,"692,730.02 ",.02)
 ;;730.02 
 ;;9002226.02101,"692,730.03 ",.01)
 ;;730.03 
 ;;9002226.02101,"692,730.03 ",.02)
 ;;730.03 
 ;;9002226.02101,"692,730.04 ",.01)
 ;;730.04 
 ;;9002226.02101,"692,730.04 ",.02)
 ;;730.04 
 ;;9002226.02101,"692,730.05 ",.01)
 ;;730.05 
 ;;9002226.02101,"692,730.05 ",.02)
 ;;730.05 
 ;;9002226.02101,"692,730.06 ",.01)
 ;;730.06 
 ;;9002226.02101,"692,730.06 ",.02)
 ;;730.06 
 ;;9002226.02101,"692,730.07 ",.01)
 ;;730.07 
 ;;9002226.02101,"692,730.07 ",.02)
 ;;730.07 
 ;;9002226.02101,"692,730.08 ",.01)
 ;;730.08 
 ;;9002226.02101,"692,730.08 ",.02)
 ;;730.08 
 ;;9002226.02101,"692,730.09 ",.01)
 ;;730.09 
 ;;9002226.02101,"692,730.09 ",.02)
 ;;730.09 
 ;;9002226.02101,"692,730.10 ",.01)
 ;;730.10 
 ;;9002226.02101,"692,730.10 ",.02)
 ;;730.10 
 ;;9002226.02101,"692,730.11 ",.01)
 ;;730.11 
 ;;9002226.02101,"692,730.11 ",.02)
 ;;730.11 
 ;;9002226.02101,"692,730.12 ",.01)
 ;;730.12 
 ;;9002226.02101,"692,730.12 ",.02)
 ;;730.12 
 ;;9002226.02101,"692,730.13 ",.01)
 ;;730.13 
 ;;9002226.02101,"692,730.13 ",.02)
 ;;730.13 
 ;;9002226.02101,"692,730.14 ",.01)
 ;;730.14 
 ;;9002226.02101,"692,730.14 ",.02)
 ;;730.14 
 ;;9002226.02101,"692,730.15 ",.01)
 ;;730.15 
 ;;9002226.02101,"692,730.15 ",.02)
 ;;730.15 
 ;;9002226.02101,"692,730.16 ",.01)
 ;;730.16 
 ;;9002226.02101,"692,730.16 ",.02)
 ;;730.16 
 ;;9002226.02101,"692,730.17 ",.01)
 ;;730.17 
 ;;9002226.02101,"692,730.17 ",.02)
 ;;730.17 
 ;;9002226.02101,"692,730.18 ",.01)
 ;;730.18 
 ;;9002226.02101,"692,730.18 ",.02)
 ;;730.18 
 ;;9002226.02101,"692,730.19 ",.01)
 ;;730.19 
 ;;9002226.02101,"692,730.19 ",.02)
 ;;730.19 
 ;;9002226.02101,"692,730.20 ",.01)
 ;;730.20 
 ;;9002226.02101,"692,730.20 ",.02)
 ;;730.20 
 ;;9002226.02101,"692,730.21 ",.01)
 ;;730.21 
 ;;9002226.02101,"692,730.21 ",.02)
 ;;730.21 
 ;;9002226.02101,"692,730.22 ",.01)
 ;;730.22 
 ;;9002226.02101,"692,730.22 ",.02)
 ;;730.22 
 ;;9002226.02101,"692,730.23 ",.01)
 ;;730.23 
 ;;9002226.02101,"692,730.23 ",.02)
 ;;730.23 
 ;;9002226.02101,"692,730.24 ",.01)
 ;;730.24 
 ;;9002226.02101,"692,730.24 ",.02)
 ;;730.24 
 ;;9002226.02101,"692,730.25 ",.01)
 ;;730.25 
 ;;9002226.02101,"692,730.25 ",.02)
 ;;730.25 
 ;;9002226.02101,"692,730.26 ",.01)
 ;;730.26 
 ;;9002226.02101,"692,730.26 ",.02)
 ;;730.26 
 ;;9002226.02101,"692,730.27 ",.01)
 ;;730.27 
 ;;9002226.02101,"692,730.27 ",.02)
 ;;730.27 
 ;;9002226.02101,"692,730.28 ",.01)
 ;;730.28 
 ;;9002226.02101,"692,730.28 ",.02)
 ;;730.28 
 ;;9002226.02101,"692,730.29 ",.01)
 ;;730.29 
 ;;9002226.02101,"692,730.29 ",.02)
 ;;730.29 
 ;;9002226.02101,"692,730.30 ",.01)
 ;;730.30 
 ;;9002226.02101,"692,730.30 ",.02)
 ;;730.30 
 ;;9002226.02101,"692,730.31 ",.01)
 ;;730.31 
 ;;9002226.02101,"692,730.31 ",.02)
 ;;730.31 
 ;;9002226.02101,"692,730.32 ",.01)
 ;;730.32 
