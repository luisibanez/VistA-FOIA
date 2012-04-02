BGP8EXWH ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 28, 2007 ;
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
 ;;9002226.02101,"635,00185-0172-10 ",.01)
 ;;00185-0172-10
 ;;9002226.02101,"635,00185-0172-10 ",.02)
 ;;00185-0172-10
 ;;9002226.02101,"635,00185-0173-01 ",.01)
 ;;00185-0173-01
 ;;9002226.02101,"635,00185-0173-01 ",.02)
 ;;00185-0173-01
 ;;9002226.02101,"635,00185-0173-10 ",.01)
 ;;00185-0173-10
 ;;9002226.02101,"635,00185-0173-10 ",.02)
 ;;00185-0173-10
 ;;9002226.02101,"635,00185-0204-01 ",.01)
 ;;00185-0204-01
 ;;9002226.02101,"635,00185-0204-01 ",.02)
 ;;00185-0204-01
 ;;9002226.02101,"635,00185-0211-01 ",.01)
 ;;00185-0211-01
 ;;9002226.02101,"635,00185-0211-01 ",.02)
 ;;00185-0211-01
 ;;9002226.02101,"635,00185-0214-01 ",.01)
 ;;00185-0214-01
 ;;9002226.02101,"635,00185-0214-01 ",.02)
 ;;00185-0214-01
 ;;9002226.02101,"635,00185-0214-10 ",.01)
 ;;00185-0214-10
 ;;9002226.02101,"635,00185-0214-10 ",.02)
 ;;00185-0214-10
 ;;9002226.02101,"635,00185-0214-50 ",.01)
 ;;00185-0214-50
 ;;9002226.02101,"635,00185-0214-50 ",.02)
 ;;00185-0214-50
 ;;9002226.02101,"635,00185-0277-01 ",.01)
 ;;00185-0277-01
 ;;9002226.02101,"635,00185-0277-01 ",.02)
 ;;00185-0277-01
 ;;9002226.02101,"635,00185-0341-01 ",.01)
 ;;00185-0341-01
 ;;9002226.02101,"635,00185-0341-01 ",.02)
 ;;00185-0341-01
 ;;9002226.02101,"635,00185-0342-01 ",.01)
 ;;00185-0342-01
 ;;9002226.02101,"635,00185-0342-01 ",.02)
 ;;00185-0342-01
 ;;9002226.02101,"635,00185-0471-01 ",.01)
 ;;00185-0471-01
 ;;9002226.02101,"635,00185-0471-01 ",.02)
 ;;00185-0471-01
 ;;9002226.02101,"635,00185-0471-10 ",.01)
 ;;00185-0471-10
 ;;9002226.02101,"635,00185-0471-10 ",.02)
 ;;00185-0471-10
 ;;9002226.02101,"635,00185-0505-01 ",.01)
 ;;00185-0505-01
 ;;9002226.02101,"635,00185-0505-01 ",.02)
 ;;00185-0505-01
 ;;9002226.02101,"635,00185-0505-05 ",.01)
 ;;00185-0505-05
 ;;9002226.02101,"635,00185-0505-05 ",.02)
 ;;00185-0505-05
 ;;9002226.02101,"635,00185-0591-01 ",.01)
 ;;00185-0591-01
 ;;9002226.02101,"635,00185-0591-01 ",.02)
 ;;00185-0591-01
 ;;9002226.02101,"635,00185-0591-05 ",.01)
 ;;00185-0591-05
 ;;9002226.02101,"635,00185-0591-05 ",.02)
 ;;00185-0591-05
 ;;9002226.02101,"635,00185-0591-10 ",.01)
 ;;00185-0591-10
 ;;9002226.02101,"635,00185-0591-10 ",.02)
 ;;00185-0591-10
 ;;9002226.02101,"635,00185-0808-01 ",.01)
 ;;00185-0808-01
 ;;9002226.02101,"635,00185-0808-01 ",.02)
 ;;00185-0808-01
 ;;9002226.02101,"635,00185-0808-05 ",.01)
 ;;00185-0808-05
 ;;9002226.02101,"635,00185-0808-05 ",.02)
 ;;00185-0808-05
 ;;9002226.02101,"635,00185-0820-01 ",.01)
 ;;00185-0820-01
 ;;9002226.02101,"635,00185-0820-01 ",.02)
 ;;00185-0820-01
 ;;9002226.02101,"635,00185-0820-05 ",.01)
 ;;00185-0820-05
 ;;9002226.02101,"635,00185-0820-05 ",.02)
 ;;00185-0820-05
 ;;9002226.02101,"635,00185-5400-01 ",.01)
 ;;00185-5400-01
 ;;9002226.02101,"635,00185-5400-01 ",.02)
 ;;00185-5400-01
 ;;9002226.02101,"635,00185-5400-10 ",.01)
 ;;00185-5400-10
 ;;9002226.02101,"635,00185-5400-10 ",.02)
 ;;00185-5400-10
 ;;9002226.02101,"635,00185-7100-01 ",.01)
 ;;00185-7100-01
 ;;9002226.02101,"635,00185-7100-01 ",.02)
 ;;00185-7100-01
 ;;9002226.02101,"635,00185-7100-10 ",.01)
 ;;00185-7100-10
 ;;9002226.02101,"635,00185-7100-10 ",.02)
 ;;00185-7100-10
 ;;9002226.02101,"635,00186-0001-31 ",.01)
 ;;00186-0001-31
 ;;9002226.02101,"635,00186-0001-31 ",.02)
 ;;00186-0001-31
 ;;9002226.02101,"635,00186-0001-68 ",.01)
 ;;00186-0001-68
 ;;9002226.02101,"635,00186-0001-68 ",.02)
 ;;00186-0001-68
 ;;9002226.02101,"635,00186-0002-31 ",.01)
 ;;00186-0002-31
 ;;9002226.02101,"635,00186-0002-31 ",.02)
 ;;00186-0002-31
 ;;9002226.02101,"635,00228-2658-11 ",.01)
 ;;00228-2658-11
 ;;9002226.02101,"635,00228-2658-11 ",.02)
 ;;00228-2658-11
 ;;9002226.02101,"635,00228-2658-96 ",.01)
 ;;00228-2658-96
 ;;9002226.02101,"635,00228-2658-96 ",.02)
 ;;00228-2658-96
 ;;9002226.02101,"635,00228-2659-11 ",.01)
 ;;00228-2659-11
 ;;9002226.02101,"635,00228-2659-11 ",.02)
 ;;00228-2659-11
 ;;9002226.02101,"635,00228-2659-96 ",.01)
 ;;00228-2659-96
 ;;9002226.02101,"635,00228-2659-96 ",.02)
 ;;00228-2659-96
 ;;9002226.02101,"635,00228-2660-11 ",.01)
 ;;00228-2660-11
 ;;9002226.02101,"635,00228-2660-11 ",.02)
 ;;00228-2660-11
 ;;9002226.02101,"635,00228-2660-96 ",.01)
 ;;00228-2660-96
 ;;9002226.02101,"635,00228-2660-96 ",.02)
 ;;00228-2660-96
 ;;9002226.02101,"635,00228-2661-11 ",.01)
 ;;00228-2661-11
 ;;9002226.02101,"635,00228-2661-11 ",.02)
 ;;00228-2661-11
 ;;9002226.02101,"635,00228-2661-96 ",.01)
 ;;00228-2661-96
 ;;9002226.02101,"635,00228-2661-96 ",.02)
 ;;00228-2661-96
 ;;9002226.02101,"635,00228-2706-03 ",.01)
 ;;00228-2706-03
 ;;9002226.02101,"635,00228-2706-03 ",.02)
 ;;00228-2706-03
 ;;9002226.02101,"635,00228-2706-11 ",.01)
 ;;00228-2706-11
 ;;9002226.02101,"635,00228-2706-11 ",.02)
 ;;00228-2706-11
 ;;9002226.02101,"635,00228-2707-03 ",.01)
 ;;00228-2707-03
 ;;9002226.02101,"635,00228-2707-03 ",.02)
 ;;00228-2707-03
 ;;9002226.02101,"635,00228-2707-11 ",.01)
 ;;00228-2707-11
 ;;9002226.02101,"635,00228-2707-11 ",.02)
 ;;00228-2707-11
 ;;9002226.02101,"635,00228-2708-03 ",.01)
 ;;00228-2708-03
 ;;9002226.02101,"635,00228-2708-03 ",.02)
 ;;00228-2708-03
 ;;9002226.02101,"635,00228-2708-11 ",.01)
 ;;00228-2708-11
 ;;9002226.02101,"635,00228-2708-11 ",.02)
 ;;00228-2708-11
 ;;9002226.02101,"635,00310-0130-10 ",.01)
 ;;00310-0130-10
 ;;9002226.02101,"635,00310-0130-10 ",.02)
 ;;00310-0130-10
 ;;9002226.02101,"635,00310-0130-34 ",.01)
 ;;00310-0130-34
 ;;9002226.02101,"635,00310-0130-34 ",.02)
 ;;00310-0130-34
 ;;9002226.02101,"635,00310-0130-39 ",.01)
 ;;00310-0130-39
 ;;9002226.02101,"635,00310-0130-39 ",.02)
 ;;00310-0130-39
 ;;9002226.02101,"635,00310-0131-10 ",.01)
 ;;00310-0131-10
 ;;9002226.02101,"635,00310-0131-10 ",.02)
 ;;00310-0131-10
 ;;9002226.02101,"635,00310-0131-34 ",.01)
 ;;00310-0131-34
 ;;9002226.02101,"635,00310-0131-34 ",.02)
 ;;00310-0131-34
 ;;9002226.02101,"635,00310-0131-39 ",.01)
 ;;00310-0131-39
 ;;9002226.02101,"635,00310-0131-39 ",.02)
 ;;00310-0131-39
 ;;9002226.02101,"635,00310-0131-73 ",.01)
 ;;00310-0131-73
 ;;9002226.02101,"635,00310-0131-73 ",.02)
 ;;00310-0131-73
 ;;9002226.02101,"635,00310-0132-10 ",.01)
 ;;00310-0132-10
 ;;9002226.02101,"635,00310-0132-10 ",.02)
 ;;00310-0132-10
 ;;9002226.02101,"635,00310-0132-34 ",.01)
 ;;00310-0132-34
 ;;9002226.02101,"635,00310-0132-34 ",.02)
 ;;00310-0132-34
 ;;9002226.02101,"635,00310-0132-39 ",.01)
 ;;00310-0132-39
 ;;9002226.02101,"635,00310-0132-39 ",.02)
 ;;00310-0132-39
 ;;9002226.02101,"635,00310-0132-73 ",.01)
 ;;00310-0132-73
 ;;9002226.02101,"635,00310-0132-73 ",.02)
 ;;00310-0132-73
 ;;9002226.02101,"635,00310-0133-10 ",.01)
 ;;00310-0133-10
 ;;9002226.02101,"635,00310-0133-10 ",.02)
 ;;00310-0133-10
 ;;9002226.02101,"635,00310-0134-10 ",.01)
 ;;00310-0134-10
 ;;9002226.02101,"635,00310-0134-10 ",.02)
 ;;00310-0134-10
 ;;9002226.02101,"635,00310-0135-10 ",.01)
 ;;00310-0135-10
 ;;9002226.02101,"635,00310-0135-10 ",.02)
 ;;00310-0135-10
 ;;9002226.02101,"635,00310-0141-10 ",.01)
 ;;00310-0141-10
 ;;9002226.02101,"635,00310-0141-10 ",.02)
 ;;00310-0141-10
 ;;9002226.02101,"635,00310-0142-10 ",.01)
 ;;00310-0142-10
 ;;9002226.02101,"635,00310-0142-10 ",.02)
 ;;00310-0142-10
 ;;9002226.02101,"635,00310-0145-10 ",.01)
 ;;00310-0145-10
 ;;9002226.02101,"635,00310-0145-10 ",.02)
 ;;00310-0145-10
 ;;9002226.02101,"635,00364-2698-01 ",.01)
 ;;00364-2698-01
 ;;9002226.02101,"635,00364-2698-01 ",.02)
 ;;00364-2698-01
 ;;9002226.02101,"635,00364-2698-02 ",.01)
 ;;00364-2698-02
 ;;9002226.02101,"635,00364-2698-02 ",.02)
 ;;00364-2698-02
 ;;9002226.02101,"635,00364-2701-01 ",.01)
 ;;00364-2701-01
 ;;9002226.02101,"635,00364-2701-01 ",.02)
 ;;00364-2701-01
 ;;9002226.02101,"635,00364-2701-02 ",.01)
 ;;00364-2701-02
 ;;9002226.02101,"635,00364-2701-02 ",.02)
 ;;00364-2701-02
 ;;9002226.02101,"635,00364-2727-01 ",.01)
 ;;00364-2727-01
 ;;9002226.02101,"635,00364-2727-01 ",.02)
 ;;00364-2727-01
 ;;9002226.02101,"635,00364-2727-02 ",.01)
 ;;00364-2727-02
 ;;9002226.02101,"635,00364-2727-02 ",.02)
 ;;00364-2727-02
 ;;9002226.02101,"635,00364-2734-01 ",.01)
 ;;00364-2734-01
 ;;9002226.02101,"635,00364-2734-01 ",.02)
 ;;00364-2734-01
 ;;9002226.02101,"635,00364-2734-02 ",.01)
 ;;00364-2734-02
 ;;9002226.02101,"635,00364-2734-02 ",.02)
 ;;00364-2734-02
 ;;9002226.02101,"635,00378-0017-77 ",.01)
 ;;00378-0017-77
 ;;9002226.02101,"635,00378-0017-77 ",.02)
 ;;00378-0017-77
 ;;9002226.02101,"635,00378-0081-01 ",.01)
 ;;00378-0081-01
 ;;9002226.02101,"635,00378-0081-01 ",.02)
 ;;00378-0081-01
 ;;9002226.02101,"635,00378-0083-01 ",.01)
 ;;00378-0083-01
 ;;9002226.02101,"635,00378-0083-01 ",.02)
 ;;00378-0083-01
 ;;9002226.02101,"635,00378-0084-01 ",.01)
 ;;00378-0084-01
 ;;9002226.02101,"635,00378-0084-01 ",.02)
 ;;00378-0084-01
 ;;9002226.02101,"635,00378-0086-01 ",.01)
 ;;00378-0086-01
 ;;9002226.02101,"635,00378-0086-01 ",.02)
 ;;00378-0086-01
 ;;9002226.02101,"635,00378-0226-77 ",.01)
 ;;00378-0226-77
 ;;9002226.02101,"635,00378-0226-77 ",.02)
 ;;00378-0226-77
 ;;9002226.02101,"635,00378-0254-77 ",.01)
 ;;00378-0254-77
 ;;9002226.02101,"635,00378-0254-77 ",.02)
 ;;00378-0254-77
 ;;9002226.02101,"635,00378-0272-77 ",.01)
 ;;00378-0272-77
 ;;9002226.02101,"635,00378-0272-77 ",.02)
 ;;00378-0272-77
 ;;9002226.02101,"635,00378-0441-01 ",.01)
 ;;00378-0441-01
 ;;9002226.02101,"635,00378-0441-01 ",.02)
 ;;00378-0441-01
 ;;9002226.02101,"635,00378-0443-01 ",.01)
 ;;00378-0443-01
 ;;9002226.02101,"635,00378-0443-01 ",.02)
 ;;00378-0443-01
 ;;9002226.02101,"635,00378-0444-01 ",.01)
 ;;00378-0444-01
 ;;9002226.02101,"635,00378-0444-01 ",.02)
 ;;00378-0444-01
 ;;9002226.02101,"635,00378-0447-01 ",.01)
 ;;00378-0447-01
 ;;9002226.02101,"635,00378-0447-01 ",.02)
 ;;00378-0447-01
 ;;9002226.02101,"635,00378-0712-01 ",.01)
 ;;00378-0712-01
 ;;9002226.02101,"635,00378-0712-01 ",.02)
 ;;00378-0712-01
 ;;9002226.02101,"635,00378-0723-01 ",.01)
 ;;00378-0723-01
 ;;9002226.02101,"635,00378-0723-01 ",.02)
 ;;00378-0723-01
 ;;9002226.02101,"635,00378-1012-01 ",.01)
 ;;00378-1012-01
 ;;9002226.02101,"635,00378-1012-01 ",.02)
 ;;00378-1012-01
 ;;9002226.02101,"635,00378-1051-01 ",.01)
 ;;00378-1051-01
 ;;9002226.02101,"635,00378-1051-01 ",.02)
 ;;00378-1051-01
 ;;9002226.02101,"635,00378-1051-05 ",.01)
 ;;00378-1051-05
 ;;9002226.02101,"635,00378-1051-05 ",.02)
 ;;00378-1051-05
 ;;9002226.02101,"635,00378-1052-01 ",.01)
 ;;00378-1052-01
 ;;9002226.02101,"635,00378-1052-01 ",.02)
 ;;00378-1052-01
 ;;9002226.02101,"635,00378-1052-10 ",.01)
 ;;00378-1052-10
 ;;9002226.02101,"635,00378-1052-10 ",.02)
 ;;00378-1052-10
 ;;9002226.02101,"635,00378-1053-01 ",.01)
 ;;00378-1053-01
 ;;9002226.02101,"635,00378-1053-01 ",.02)
 ;;00378-1053-01
 ;;9002226.02101,"635,00378-1053-10 ",.01)
 ;;00378-1053-10
 ;;9002226.02101,"635,00378-1053-10 ",.02)
 ;;00378-1053-10
 ;;9002226.02101,"635,00378-1054-01 ",.01)
 ;;00378-1054-01
 ;;9002226.02101,"635,00378-1054-01 ",.02)
 ;;00378-1054-01
 ;;9002226.02101,"635,00378-1054-05 ",.01)
 ;;00378-1054-05
 ;;9002226.02101,"635,00378-1054-05 ",.02)
 ;;00378-1054-05
 ;;9002226.02101,"635,00378-2012-01 ",.01)
 ;;00378-2012-01
 ;;9002226.02101,"635,00378-2012-01 ",.02)
 ;;00378-2012-01
 ;;9002226.02101,"635,00378-2025-01 ",.01)
 ;;00378-2025-01
 ;;9002226.02101,"635,00378-2025-01 ",.02)
 ;;00378-2025-01
 ;;9002226.02101,"635,00378-2072-01 ",.01)
 ;;00378-2072-01
 ;;9002226.02101,"635,00378-2072-01 ",.02)
 ;;00378-2072-01
 ;;9002226.02101,"635,00378-2073-01 ",.01)
 ;;00378-2073-01
 ;;9002226.02101,"635,00378-2073-01 ",.02)
 ;;00378-2073-01
 ;;9002226.02101,"635,00378-2073-10 ",.01)
 ;;00378-2073-10
 ;;9002226.02101,"635,00378-2073-10 ",.02)
 ;;00378-2073-10
 ;;9002226.02101,"635,00378-2074-01 ",.01)
 ;;00378-2074-01
 ;;9002226.02101,"635,00378-2074-01 ",.02)
 ;;00378-2074-01
 ;;9002226.02101,"635,00378-2074-10 ",.01)
 ;;00378-2074-10
 ;;9002226.02101,"635,00378-2074-10 ",.02)
 ;;00378-2074-10
 ;;9002226.02101,"635,00378-2075-01 ",.01)
 ;;00378-2075-01
 ;;9002226.02101,"635,00378-2075-01 ",.02)
 ;;00378-2075-01
 ;;9002226.02101,"635,00378-2075-10 ",.01)
 ;;00378-2075-10
 ;;9002226.02101,"635,00378-2075-10 ",.02)
 ;;00378-2075-10
 ;;9002226.02101,"635,00378-2076-01 ",.01)
 ;;00378-2076-01
 ;;9002226.02101,"635,00378-2076-01 ",.02)
 ;;00378-2076-01
 ;;9002226.02101,"635,00378-2077-01 ",.01)
 ;;00378-2077-01
 ;;9002226.02101,"635,00378-2077-01 ",.02)
 ;;00378-2077-01
 ;;9002226.02101,"635,00378-3007-01 ",.01)
 ;;00378-3007-01
 ;;9002226.02101,"635,00378-3007-01 ",.02)
 ;;00378-3007-01
 ;;9002226.02101,"635,00378-3007-10 ",.01)
 ;;00378-3007-10
 ;;9002226.02101,"635,00378-3007-10 ",.02)
 ;;00378-3007-10
 ;;9002226.02101,"635,00378-3012-01 ",.01)
 ;;00378-3012-01
 ;;9002226.02101,"635,00378-3012-01 ",.02)
 ;;00378-3012-01
 ;;9002226.02101,"635,00378-3012-10 ",.01)
 ;;00378-3012-10
 ;;9002226.02101,"635,00378-3012-10 ",.02)
 ;;00378-3012-10
 ;;9002226.02101,"635,00378-3017-01 ",.01)
 ;;00378-3017-01
 ;;9002226.02101,"635,00378-3017-01 ",.02)
 ;;00378-3017-01
 ;;9002226.02101,"635,00378-3017-10 ",.01)
 ;;00378-3017-10
 ;;9002226.02101,"635,00378-3017-10 ",.02)
 ;;00378-3017-10
 ;;9002226.02101,"635,00378-3022-01 ",.01)
 ;;00378-3022-01
 ;;9002226.02101,"635,00378-3022-01 ",.02)
 ;;00378-3022-01
 ;;9002226.02101,"635,00378-4725-01 ",.01)
 ;;00378-4725-01
 ;;9002226.02101,"635,00378-4725-01 ",.02)
 ;;00378-4725-01
 ;;9002226.02101,"635,00378-4735-01 ",.01)
 ;;00378-4735-01
 ;;9002226.02101,"635,00378-4735-01 ",.02)
 ;;00378-4735-01
 ;;9002226.02101,"635,00378-4745-01 ",.01)
 ;;00378-4745-01