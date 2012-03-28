BGP06A48 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"974,54868-0025-08 ",.01)
 ;;54868-0025-08
 ;;9002226.02101,"974,54868-0025-08 ",.02)
 ;;54868-0025-08
 ;;9002226.02101,"974,54868-0153-00 ",.01)
 ;;54868-0153-00
 ;;9002226.02101,"974,54868-0153-00 ",.02)
 ;;54868-0153-00
 ;;9002226.02101,"974,54868-0153-01 ",.01)
 ;;54868-0153-01
 ;;9002226.02101,"974,54868-0153-01 ",.02)
 ;;54868-0153-01
 ;;9002226.02101,"974,54868-0153-03 ",.01)
 ;;54868-0153-03
 ;;9002226.02101,"974,54868-0153-03 ",.02)
 ;;54868-0153-03
 ;;9002226.02101,"974,54868-0153-05 ",.01)
 ;;54868-0153-05
 ;;9002226.02101,"974,54868-0153-05 ",.02)
 ;;54868-0153-05
 ;;9002226.02101,"974,54868-0153-08 ",.01)
 ;;54868-0153-08
 ;;9002226.02101,"974,54868-0153-08 ",.02)
 ;;54868-0153-08
 ;;9002226.02101,"974,54868-0154-00 ",.01)
 ;;54868-0154-00
 ;;9002226.02101,"974,54868-0154-00 ",.02)
 ;;54868-0154-00
 ;;9002226.02101,"974,54868-0154-01 ",.01)
 ;;54868-0154-01
 ;;9002226.02101,"974,54868-0154-01 ",.02)
 ;;54868-0154-01
 ;;9002226.02101,"974,54868-0154-02 ",.01)
 ;;54868-0154-02
 ;;9002226.02101,"974,54868-0154-02 ",.02)
 ;;54868-0154-02
 ;;9002226.02101,"974,54868-0154-03 ",.01)
 ;;54868-0154-03
 ;;9002226.02101,"974,54868-0154-03 ",.02)
 ;;54868-0154-03
 ;;9002226.02101,"974,54868-0154-04 ",.01)
 ;;54868-0154-04
 ;;9002226.02101,"974,54868-0154-04 ",.02)
 ;;54868-0154-04
 ;;9002226.02101,"974,54868-0154-07 ",.01)
 ;;54868-0154-07
 ;;9002226.02101,"974,54868-0154-07 ",.02)
 ;;54868-0154-07
 ;;9002226.02101,"974,54868-0154-08 ",.01)
 ;;54868-0154-08
 ;;9002226.02101,"974,54868-0154-08 ",.02)
 ;;54868-0154-08
 ;;9002226.02101,"974,54868-0154-09 ",.01)
 ;;54868-0154-09
 ;;9002226.02101,"974,54868-0154-09 ",.02)
 ;;54868-0154-09
 ;;9002226.02101,"974,54868-0155-01 ",.01)
 ;;54868-0155-01
 ;;9002226.02101,"974,54868-0155-01 ",.02)
 ;;54868-0155-01
 ;;9002226.02101,"974,54868-0157-01 ",.01)
 ;;54868-0157-01
 ;;9002226.02101,"974,54868-0157-01 ",.02)
 ;;54868-0157-01
 ;;9002226.02101,"974,54868-0191-01 ",.01)
 ;;54868-0191-01
 ;;9002226.02101,"974,54868-0191-01 ",.02)
 ;;54868-0191-01
 ;;9002226.02101,"974,54868-0191-02 ",.01)
 ;;54868-0191-02
 ;;9002226.02101,"974,54868-0191-02 ",.02)
 ;;54868-0191-02
 ;;9002226.02101,"974,54868-0191-04 ",.01)
 ;;54868-0191-04
 ;;9002226.02101,"974,54868-0191-04 ",.02)
 ;;54868-0191-04
 ;;9002226.02101,"974,54868-0193-01 ",.01)
 ;;54868-0193-01
 ;;9002226.02101,"974,54868-0193-01 ",.02)
 ;;54868-0193-01
 ;;9002226.02101,"974,54868-0195-01 ",.01)
 ;;54868-0195-01
 ;;9002226.02101,"974,54868-0195-01 ",.02)
 ;;54868-0195-01
 ;;9002226.02101,"974,54868-0195-02 ",.01)
 ;;54868-0195-02
 ;;9002226.02101,"974,54868-0195-02 ",.02)
 ;;54868-0195-02
 ;;9002226.02101,"974,54868-0196-01 ",.01)
 ;;54868-0196-01
 ;;9002226.02101,"974,54868-0196-01 ",.02)
 ;;54868-0196-01
 ;;9002226.02101,"974,54868-0196-02 ",.01)
 ;;54868-0196-02
 ;;9002226.02101,"974,54868-0196-02 ",.02)
 ;;54868-0196-02
 ;;9002226.02101,"974,54868-0199-02 ",.01)
 ;;54868-0199-02
 ;;9002226.02101,"974,54868-0199-02 ",.02)
 ;;54868-0199-02
 ;;9002226.02101,"974,54868-0199-03 ",.01)
 ;;54868-0199-03
 ;;9002226.02101,"974,54868-0199-03 ",.02)
 ;;54868-0199-03
 ;;9002226.02101,"974,54868-0200-01 ",.01)
 ;;54868-0200-01
 ;;9002226.02101,"974,54868-0200-01 ",.02)
 ;;54868-0200-01
 ;;9002226.02101,"974,54868-0224-01 ",.01)
 ;;54868-0224-01
 ;;9002226.02101,"974,54868-0224-01 ",.02)
 ;;54868-0224-01
 ;;9002226.02101,"974,54868-0224-03 ",.01)
 ;;54868-0224-03
 ;;9002226.02101,"974,54868-0224-03 ",.02)
 ;;54868-0224-03
 ;;9002226.02101,"974,54868-0224-04 ",.01)
 ;;54868-0224-04
 ;;9002226.02101,"974,54868-0224-04 ",.02)
 ;;54868-0224-04
 ;;9002226.02101,"974,54868-0224-06 ",.01)
 ;;54868-0224-06
 ;;9002226.02101,"974,54868-0224-06 ",.02)
 ;;54868-0224-06
 ;;9002226.02101,"974,54868-0225-00 ",.01)
 ;;54868-0225-00
 ;;9002226.02101,"974,54868-0225-00 ",.02)
 ;;54868-0225-00
 ;;9002226.02101,"974,54868-0225-01 ",.01)
 ;;54868-0225-01
 ;;9002226.02101,"974,54868-0225-01 ",.02)
 ;;54868-0225-01
 ;;9002226.02101,"974,54868-0276-01 ",.01)
 ;;54868-0276-01
 ;;9002226.02101,"974,54868-0276-01 ",.02)
 ;;54868-0276-01
 ;;9002226.02101,"974,54868-0302-01 ",.01)
 ;;54868-0302-01
 ;;9002226.02101,"974,54868-0302-01 ",.02)
 ;;54868-0302-01
 ;;9002226.02101,"974,54868-0302-02 ",.01)
 ;;54868-0302-02
 ;;9002226.02101,"974,54868-0302-02 ",.02)
 ;;54868-0302-02
 ;;9002226.02101,"974,54868-0314-01 ",.01)
 ;;54868-0314-01
 ;;9002226.02101,"974,54868-0314-01 ",.02)
 ;;54868-0314-01
 ;;9002226.02101,"974,54868-0315-01 ",.01)
 ;;54868-0315-01
 ;;9002226.02101,"974,54868-0315-01 ",.02)
 ;;54868-0315-01
 ;;9002226.02101,"974,54868-0315-05 ",.01)
 ;;54868-0315-05
 ;;9002226.02101,"974,54868-0315-05 ",.02)
 ;;54868-0315-05
 ;;9002226.02101,"974,54868-0333-01 ",.01)
 ;;54868-0333-01
 ;;9002226.02101,"974,54868-0333-01 ",.02)
 ;;54868-0333-01
 ;;9002226.02101,"974,54868-0333-02 ",.01)
 ;;54868-0333-02
 ;;9002226.02101,"974,54868-0333-02 ",.02)
 ;;54868-0333-02
 ;;9002226.02101,"974,54868-0333-04 ",.01)
 ;;54868-0333-04
 ;;9002226.02101,"974,54868-0333-04 ",.02)
 ;;54868-0333-04
 ;;9002226.02101,"974,54868-0333-06 ",.01)
 ;;54868-0333-06
 ;;9002226.02101,"974,54868-0333-06 ",.02)
 ;;54868-0333-06
 ;;9002226.02101,"974,54868-0333-07 ",.01)
 ;;54868-0333-07
 ;;9002226.02101,"974,54868-0333-07 ",.02)
 ;;54868-0333-07
 ;;9002226.02101,"974,54868-0337-00 ",.01)
 ;;54868-0337-00
 ;;9002226.02101,"974,54868-0337-00 ",.02)
 ;;54868-0337-00
 ;;9002226.02101,"974,54868-0348-01 ",.01)
 ;;54868-0348-01
 ;;9002226.02101,"974,54868-0348-01 ",.02)
 ;;54868-0348-01
 ;;9002226.02101,"974,54868-0348-02 ",.01)
 ;;54868-0348-02
 ;;9002226.02101,"974,54868-0348-02 ",.02)
 ;;54868-0348-02
 ;;9002226.02101,"974,54868-0387-00 ",.01)
 ;;54868-0387-00
 ;;9002226.02101,"974,54868-0387-00 ",.02)
 ;;54868-0387-00
 ;;9002226.02101,"974,54868-0387-01 ",.01)
 ;;54868-0387-01
 ;;9002226.02101,"974,54868-0387-01 ",.02)
 ;;54868-0387-01
 ;;9002226.02101,"974,54868-0387-02 ",.01)
 ;;54868-0387-02
 ;;9002226.02101,"974,54868-0387-02 ",.02)
 ;;54868-0387-02
 ;;9002226.02101,"974,54868-0387-03 ",.01)
 ;;54868-0387-03
 ;;9002226.02101,"974,54868-0387-03 ",.02)
 ;;54868-0387-03
 ;;9002226.02101,"974,54868-0388-00 ",.01)
 ;;54868-0388-00
 ;;9002226.02101,"974,54868-0388-00 ",.02)
 ;;54868-0388-00
 ;;9002226.02101,"974,54868-0388-01 ",.01)
 ;;54868-0388-01
 ;;9002226.02101,"974,54868-0388-01 ",.02)
 ;;54868-0388-01
 ;;9002226.02101,"974,54868-0388-02 ",.01)
 ;;54868-0388-02
 ;;9002226.02101,"974,54868-0388-02 ",.02)
 ;;54868-0388-02
 ;;9002226.02101,"974,54868-0388-04 ",.01)
 ;;54868-0388-04
 ;;9002226.02101,"974,54868-0388-04 ",.02)
 ;;54868-0388-04
 ;;9002226.02101,"974,54868-0388-05 ",.01)
 ;;54868-0388-05
 ;;9002226.02101,"974,54868-0388-05 ",.02)
 ;;54868-0388-05
 ;;9002226.02101,"974,54868-0407-01 ",.01)
 ;;54868-0407-01
 ;;9002226.02101,"974,54868-0407-01 ",.02)
 ;;54868-0407-01
 ;;9002226.02101,"974,54868-0407-03 ",.01)
 ;;54868-0407-03
 ;;9002226.02101,"974,54868-0407-03 ",.02)
 ;;54868-0407-03
 ;;9002226.02101,"974,54868-0407-04 ",.01)
 ;;54868-0407-04
 ;;9002226.02101,"974,54868-0407-04 ",.02)
 ;;54868-0407-04
 ;;9002226.02101,"974,54868-0413-02 ",.01)
 ;;54868-0413-02
 ;;9002226.02101,"974,54868-0413-02 ",.02)
 ;;54868-0413-02
 ;;9002226.02101,"974,54868-0413-04 ",.01)
 ;;54868-0413-04
 ;;9002226.02101,"974,54868-0413-04 ",.02)
 ;;54868-0413-04
 ;;9002226.02101,"974,54868-0413-07 ",.01)
 ;;54868-0413-07
 ;;9002226.02101,"974,54868-0413-07 ",.02)
 ;;54868-0413-07
 ;;9002226.02101,"974,54868-0413-08 ",.01)
 ;;54868-0413-08
 ;;9002226.02101,"974,54868-0413-08 ",.02)
 ;;54868-0413-08
 ;;9002226.02101,"974,54868-0425-01 ",.01)
 ;;54868-0425-01
 ;;9002226.02101,"974,54868-0425-01 ",.02)
 ;;54868-0425-01
 ;;9002226.02101,"974,54868-0472-01 ",.01)
 ;;54868-0472-01
 ;;9002226.02101,"974,54868-0472-01 ",.02)
 ;;54868-0472-01
 ;;9002226.02101,"974,54868-0538-01 ",.01)
 ;;54868-0538-01
 ;;9002226.02101,"974,54868-0538-01 ",.02)
 ;;54868-0538-01
 ;;9002226.02101,"974,54868-0538-02 ",.01)
 ;;54868-0538-02
 ;;9002226.02101,"974,54868-0538-02 ",.02)
 ;;54868-0538-02
 ;;9002226.02101,"974,54868-0559-00 ",.01)
 ;;54868-0559-00
 ;;9002226.02101,"974,54868-0559-00 ",.02)
 ;;54868-0559-00
 ;;9002226.02101,"974,54868-0737-00 ",.01)
 ;;54868-0737-00
 ;;9002226.02101,"974,54868-0737-00 ",.02)
 ;;54868-0737-00
 ;;9002226.02101,"974,54868-0737-01 ",.01)
 ;;54868-0737-01
 ;;9002226.02101,"974,54868-0737-01 ",.02)
 ;;54868-0737-01
 ;;9002226.02101,"974,54868-0807-01 ",.01)
 ;;54868-0807-01
 ;;9002226.02101,"974,54868-0807-01 ",.02)
 ;;54868-0807-01
 ;;9002226.02101,"974,54868-0840-00 ",.01)
 ;;54868-0840-00
 ;;9002226.02101,"974,54868-0840-00 ",.02)
 ;;54868-0840-00
 ;;9002226.02101,"974,54868-0840-01 ",.01)
 ;;54868-0840-01
 ;;9002226.02101,"974,54868-0840-01 ",.02)
 ;;54868-0840-01
 ;;9002226.02101,"974,54868-0840-02 ",.01)
 ;;54868-0840-02
 ;;9002226.02101,"974,54868-0840-02 ",.02)
 ;;54868-0840-02
 ;;9002226.02101,"974,54868-0840-03 ",.01)
 ;;54868-0840-03
 ;;9002226.02101,"974,54868-0840-03 ",.02)
 ;;54868-0840-03
 ;;9002226.02101,"974,54868-0840-04 ",.01)
 ;;54868-0840-04
 ;;9002226.02101,"974,54868-0840-04 ",.02)
 ;;54868-0840-04
 ;;9002226.02101,"974,54868-0934-00 ",.01)
 ;;54868-0934-00
 ;;9002226.02101,"974,54868-0934-00 ",.02)
 ;;54868-0934-00
 ;;9002226.02101,"974,54868-0937-00 ",.01)
 ;;54868-0937-00
 ;;9002226.02101,"974,54868-0937-00 ",.02)
 ;;54868-0937-00
 ;;9002226.02101,"974,54868-0937-01 ",.01)
 ;;54868-0937-01
 ;;9002226.02101,"974,54868-0937-01 ",.02)
 ;;54868-0937-01
 ;;9002226.02101,"974,54868-0937-02 ",.01)
 ;;54868-0937-02
 ;;9002226.02101,"974,54868-0937-02 ",.02)
 ;;54868-0937-02
 ;;9002226.02101,"974,54868-0939-00 ",.01)
 ;;54868-0939-00
 ;;9002226.02101,"974,54868-0939-00 ",.02)
 ;;54868-0939-00
 ;;9002226.02101,"974,54868-0939-01 ",.01)
 ;;54868-0939-01
 ;;9002226.02101,"974,54868-0939-01 ",.02)
 ;;54868-0939-01
 ;;9002226.02101,"974,54868-0939-02 ",.01)
 ;;54868-0939-02
 ;;9002226.02101,"974,54868-0939-02 ",.02)
 ;;54868-0939-02
 ;;9002226.02101,"974,54868-0939-03 ",.01)
 ;;54868-0939-03
 ;;9002226.02101,"974,54868-0939-03 ",.02)
 ;;54868-0939-03
 ;;9002226.02101,"974,54868-0939-05 ",.01)
 ;;54868-0939-05
 ;;9002226.02101,"974,54868-0939-05 ",.02)
 ;;54868-0939-05
 ;;9002226.02101,"974,54868-0939-06 ",.01)
 ;;54868-0939-06
 ;;9002226.02101,"974,54868-0939-06 ",.02)
 ;;54868-0939-06
 ;;9002226.02101,"974,54868-0939-07 ",.01)
 ;;54868-0939-07
 ;;9002226.02101,"974,54868-0939-07 ",.02)
 ;;54868-0939-07
 ;;9002226.02101,"974,54868-0971-00 ",.01)
 ;;54868-0971-00
 ;;9002226.02101,"974,54868-0971-00 ",.02)
 ;;54868-0971-00
 ;;9002226.02101,"974,54868-0971-01 ",.01)
 ;;54868-0971-01
 ;;9002226.02101,"974,54868-0971-01 ",.02)
 ;;54868-0971-01
 ;;9002226.02101,"974,54868-0985-01 ",.01)
 ;;54868-0985-01
 ;;9002226.02101,"974,54868-0985-01 ",.02)
 ;;54868-0985-01
 ;;9002226.02101,"974,54868-0990-00 ",.01)
 ;;54868-0990-00
 ;;9002226.02101,"974,54868-0990-00 ",.02)
 ;;54868-0990-00
 ;;9002226.02101,"974,54868-0990-01 ",.01)
 ;;54868-0990-01
 ;;9002226.02101,"974,54868-0990-01 ",.02)
 ;;54868-0990-01
 ;;9002226.02101,"974,54868-0990-02 ",.01)
 ;;54868-0990-02
 ;;9002226.02101,"974,54868-0990-02 ",.02)
 ;;54868-0990-02
 ;;9002226.02101,"974,54868-0990-04 ",.01)
 ;;54868-0990-04
 ;;9002226.02101,"974,54868-0990-04 ",.02)
 ;;54868-0990-04
 ;;9002226.02101,"974,54868-0990-05 ",.01)
 ;;54868-0990-05
 ;;9002226.02101,"974,54868-0990-05 ",.02)
 ;;54868-0990-05
 ;;9002226.02101,"974,54868-1044-01 ",.01)
 ;;54868-1044-01
 ;;9002226.02101,"974,54868-1044-01 ",.02)
 ;;54868-1044-01
 ;;9002226.02101,"974,54868-1047-00 ",.01)
 ;;54868-1047-00
 ;;9002226.02101,"974,54868-1047-00 ",.02)
 ;;54868-1047-00
 ;;9002226.02101,"974,54868-1047-01 ",.01)
 ;;54868-1047-01
 ;;9002226.02101,"974,54868-1047-01 ",.02)
 ;;54868-1047-01
 ;;9002226.02101,"974,54868-1047-02 ",.01)
 ;;54868-1047-02
 ;;9002226.02101,"974,54868-1047-02 ",.02)
 ;;54868-1047-02
 ;;9002226.02101,"974,54868-1047-03 ",.01)
 ;;54868-1047-03
 ;;9002226.02101,"974,54868-1047-03 ",.02)
 ;;54868-1047-03
 ;;9002226.02101,"974,54868-1047-04 ",.01)
 ;;54868-1047-04
 ;;9002226.02101,"974,54868-1047-04 ",.02)
 ;;54868-1047-04
 ;;9002226.02101,"974,54868-1048-01 ",.01)
 ;;54868-1048-01
 ;;9002226.02101,"974,54868-1048-01 ",.02)
 ;;54868-1048-01
 ;;9002226.02101,"974,54868-1048-02 ",.01)
 ;;54868-1048-02
 ;;9002226.02101,"974,54868-1048-02 ",.02)
 ;;54868-1048-02
 ;;9002226.02101,"974,54868-1048-03 ",.01)
 ;;54868-1048-03
 ;;9002226.02101,"974,54868-1048-03 ",.02)
 ;;54868-1048-03
 ;;9002226.02101,"974,54868-1080-00 ",.01)
 ;;54868-1080-00
 ;;9002226.02101,"974,54868-1080-00 ",.02)
 ;;54868-1080-00
 ;;9002226.02101,"974,54868-1080-01 ",.01)
 ;;54868-1080-01
 ;;9002226.02101,"974,54868-1080-01 ",.02)
 ;;54868-1080-01
 ;;9002226.02101,"974,54868-1080-03 ",.01)
 ;;54868-1080-03
 ;;9002226.02101,"974,54868-1080-03 ",.02)
 ;;54868-1080-03
 ;;9002226.02101,"974,54868-1112-01 ",.01)
 ;;54868-1112-01
 ;;9002226.02101,"974,54868-1112-01 ",.02)
 ;;54868-1112-01
 ;;9002226.02101,"974,54868-1112-02 ",.01)
 ;;54868-1112-02
 ;;9002226.02101,"974,54868-1112-02 ",.02)
 ;;54868-1112-02
 ;;9002226.02101,"974,54868-1146-00 ",.01)
 ;;54868-1146-00
 ;;9002226.02101,"974,54868-1146-00 ",.02)
 ;;54868-1146-00
 ;;9002226.02101,"974,54868-1171-00 ",.01)
 ;;54868-1171-00
 ;;9002226.02101,"974,54868-1171-00 ",.02)
 ;;54868-1171-00
