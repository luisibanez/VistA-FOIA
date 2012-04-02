BGP13E ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;;BGP HEDIS ANTIPSYCHOTIC NDC
 ;
 ; This routine loads Taxonomy BGP HEDIS ANTIPSYCHOTIC NDC
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
 ;;21,"00223-2131-02 ")
 ;;1
 ;;21,"00223-2132-01 ")
 ;;2
 ;;21,"00223-2132-02 ")
 ;;3
 ;;21,"00223-2133-01 ")
 ;;4
 ;;21,"00223-2133-02 ")
 ;;5
 ;;21,"00223-2134-01 ")
 ;;6
 ;;21,"00223-2134-02 ")
 ;;7
 ;;21,"00247-0800-07 ")
 ;;8
 ;;21,"00247-0800-14 ")
 ;;9
 ;;21,"00247-0800-30 ")
 ;;10
 ;;21,"00247-0801-07 ")
 ;;11
 ;;21,"00247-0801-14 ")
 ;;12
 ;;21,"00247-0801-30 ")
 ;;13
 ;;21,"00247-0802-07 ")
 ;;14
 ;;21,"00247-0802-14 ")
 ;;15
 ;;21,"00247-0802-30 ")
 ;;16
 ;;21,"00247-0803-07 ")
 ;;17
 ;;21,"00247-0803-14 ")
 ;;18
 ;;21,"00247-0803-30 ")
 ;;19
 ;;21,"00247-0804-07 ")
 ;;20
 ;;21,"00247-0804-14 ")
 ;;21
 ;;21,"00247-0804-30 ")
 ;;22
 ;;21,"00247-0805-07 ")
 ;;23
 ;;21,"00247-0805-14 ")
 ;;24
 ;;21,"00247-0805-30 ")
 ;;25
 ;;21,"00378-0612-01 ")
 ;;26
 ;;21,"00378-0612-10 ")
 ;;27
 ;;21,"00378-0614-01 ")
 ;;28
 ;;21,"00378-0614-10 ")
 ;;29
 ;;21,"00378-0616-01 ")
 ;;30
 ;;21,"00378-0616-10 ")
 ;;31
 ;;21,"00378-0618-01 ")
 ;;32
 ;;21,"00378-0618-10 ")
 ;;33
 ;;21,"00615-2504-43 ")
 ;;34
 ;;21,"00615-2504-53 ")
 ;;35
 ;;21,"00615-2504-63 ")
 ;;36
 ;;21,"00615-2505-53 ")
 ;;37
 ;;21,"00615-2506-43 ")
 ;;38
 ;;21,"00615-2506-53 ")
 ;;39
 ;;21,"00615-2506-63 ")
 ;;40
 ;;21,"00615-2507-43 ")
 ;;41
 ;;21,"00615-2507-53 ")
 ;;42
 ;;21,"00615-2507-63 ")
 ;;43
 ;;21,"00615-2508-13 ")
 ;;44
 ;;21,"00615-2508-43 ")
 ;;45
 ;;21,"00615-2508-53 ")
 ;;46
 ;;21,"00615-2509-53 ")
 ;;47
 ;;21,"00615-2510-53 ")
 ;;48
 ;;21,"00677-0823-01 ")
 ;;49
 ;;21,"00677-0824-01 ")
 ;;50
 ;;21,"00677-0824-10 ")
 ;;51
 ;;21,"00677-0825-01 ")
 ;;52
 ;;21,"00677-0832-01 ")
 ;;53
 ;;21,"00677-0832-06 ")
 ;;54
 ;;21,"00781-0268-06 ")
 ;;55
 ;;21,"00781-1604-01 ")
 ;;56
 ;;21,"00781-1614-01 ")
 ;;57
 ;;21,"00781-1624-01 ")
 ;;58
 ;;21,"00781-1624-10 ")
 ;;59
 ;;21,"00781-1634-01 ")
 ;;60
 ;;21,"00781-1644-01 ")
 ;;61
 ;;21,"00781-1664-01 ")
 ;;62
 ;;21,"00781-1674-01 ")
 ;;63
 ;;21,"00781-6150-04 ")
 ;;64
 ;;21,"00904-1614-60 ")
 ;;65
 ;;21,"00904-1614-80 ")
 ;;66
 ;;21,"00904-1615-60 ")
 ;;67
 ;;21,"00904-1616-60 ")
 ;;68
 ;;21,"00904-1616-80 ")
 ;;69
 ;;21,"00904-1617-60 ")
 ;;70
 ;;21,"00904-1617-80 ")
 ;;71
 ;;21,"00904-1618-40 ")
 ;;72
 ;;21,"00904-1618-60 ")
 ;;73
 ;;21,"00904-1618-80 ")
 ;;74
 ;;21,"00904-1793-60 ")
 ;;75
 ;;21,"00904-1793-61 ")
 ;;76
 ;;21,"00904-1793-80 ")
 ;;77
 ;;21,"00904-1794-60 ")
 ;;78
 ;;21,"00904-1795-60 ")
 ;;79
 ;;21,"00904-1795-61 ")
 ;;80
 ;;21,"00904-1795-80 ")
 ;;81
 ;;21,"00904-1796-60 ")
 ;;82
 ;;21,"00904-1796-61 ")
 ;;83
 ;;21,"00904-1796-80 ")
 ;;84
 ;;21,"00904-1797-60 ")
 ;;85
 ;;21,"00904-1797-61 ")
 ;;86
 ;;21,"00904-1798-61 ")
 ;;87
 ;;21,"00904-1799-40 ")
 ;;88
 ;;21,"00904-1799-60 ")
 ;;89
 ;;21,"00904-1800-61 ")
 ;;90
 ;;21,"00904-1801-80 ")
 ;;91
 ;;21,"00904-1802-61 ")
 ;;92
 ;;21,"00904-1803-61 ")
 ;;93
 ;;21,"00904-1804-61 ")
 ;;94
 ;;21,"00904-1805-61 ")
 ;;95
 ;;21,"00904-1806-61 ")
 ;;96
 ;;21,"00904-1808-20 ")
 ;;97
 ;;21,"00904-1809-20 ")
 ;;98
 ;;21,"00904-5240-60 ")
 ;;99
 ;;21,"00904-5241-60 ")
 ;;100
 ;;21,"00904-5242-60 ")
 ;;101
 ;;21,"00904-7649-60 ")
 ;;102
 ;;21,"17236-0301-01 ")
 ;;103
 ;;21,"17236-0301-10 ")
 ;;104
 ;;21,"17236-0302-01 ")
 ;;105
 ;;21,"17236-0302-10 ")
 ;;106
 ;;21,"17236-0305-01 ")
 ;;107
 ;;21,"17236-0305-10 ")
 ;;108
 ;;21,"17236-0318-01 ")
 ;;109
 ;;21,"17236-0318-10 ")
 ;;110
 ;;21,"51079-0565-01 ")
 ;;111
 ;;21,"51079-0565-20 ")
 ;;112
 ;;21,"51079-0566-01 ")
 ;;113
 ;;21,"51079-0566-20 ")
 ;;114
 ;;21,"51079-0567-01 ")
 ;;115
 ;;21,"51079-0567-20 ")
 ;;116
 ;;21,"51079-0580-01 ")
 ;;117
 ;;21,"51079-0580-20 ")
 ;;118
 ;;21,"53489-0148-01 ")
 ;;119
 ;;21,"53489-0148-10 ")
 ;;120
 ;;21,"53489-0149-01 ")
 ;;121
 ;;21,"53489-0149-10 ")
 ;;122
 ;;21,"53489-0150-01 ")
 ;;123
 ;;21,"53489-0150-10 ")
 ;;124
 ;;21,"53489-0500-01 ")
 ;;125
 ;;21,"54868-0067-00 ")
 ;;126
 ;;21,"54868-0067-04 ")
 ;;127
 ;;21,"54868-0067-05 ")
 ;;128
 ;;21,"54868-1828-00 ")
 ;;129
 ;;21,"54868-1828-02 ")
 ;;130
 ;;21,"54868-1832-00 ")
 ;;131
 ;;21,"54868-1832-02 ")
 ;;132
 ;;21,"54868-1832-03 ")
 ;;133
 ;;21,"57866-1042-01 ")
 ;;134
 ;;21,"57866-4642-03 ")
 ;;135
 ;;21,"57866-4643-01 ")
 ;;136
 ;;21,"57866-4644-01 ")
 ;;137
 ;;21,"61392-0462-15 ")
 ;;138
 ;;21,"61392-0462-30 ")
 ;;139
 ;;21,"61392-0462-31 ")
 ;;140
 ;;21,"61392-0462-32 ")
 ;;141
 ;;21,"61392-0462-39 ")
 ;;142
 ;;21,"61392-0462-45 ")
 ;;143
 ;;21,"61392-0462-51 ")
 ;;144
 ;;21,"61392-0462-54 ")
 ;;145
 ;;21,"61392-0462-56 ")
 ;;146
 ;;21,"61392-0462-60 ")
 ;;147
 ;;21,"61392-0462-90 ")
 ;;148
 ;;21,"61392-0462-91 ")
 ;;149
 ;;21,"61392-0463-30 ")
 ;;150
 ;;21,"61392-0463-31 ")
 ;;151
 ;;21,"61392-0463-32 ")
 ;;152
 ;;21,"61392-0463-39 ")
 ;;153
 ;;21,"61392-0463-45 ")
 ;;154
 ;;21,"61392-0463-51 ")
 ;;155
 ;;21,"61392-0463-54 ")
 ;;156
 ;;21,"61392-0463-60 ")
 ;;157
 ;;21,"61392-0463-90 ")
 ;;158
 ;;21,"61392-0463-91 ")
 ;;159
 ;;21,"61392-0464-30 ")
 ;;160
 ;;21,"61392-0464-31 ")
 ;;161
 ;;21,"61392-0464-32 ")
 ;;162
 ;;21,"61392-0464-39 ")
 ;;163
 ;;21,"61392-0464-45 ")
 ;;164
 ;;21,"61392-0464-51 ")
 ;;165
 ;;21,"61392-0464-54 ")
 ;;166
 ;;21,"61392-0464-60 ")
 ;;167
 ;;21,"61392-0464-90 ")
 ;;168
 ;;21,"61392-0464-91 ")
 ;;169
 ;;21,"61392-0465-30 ")
 ;;170
 ;;21,"61392-0465-31 ")
 ;;171
 ;;21,"61392-0465-32 ")
 ;;172
 ;;21,"61392-0465-39 ")
 ;;173
 ;;21,"61392-0465-45 ")
 ;;174
 ;;21,"61392-0465-51 ")
 ;;175
 ;;21,"61392-0465-54 ")
 ;;176
 ;;21,"61392-0465-60 ")
 ;;177
 ;;21,"61392-0465-90 ")
 ;;178
 ;;21,"61392-0465-91 ")
 ;;179
 ;;9002226,990,.01)
 ;;BGP HEDIS ANTIPSYCHOTIC NDC
 ;;9002226,990,.02)
 ;;@
 ;;9002226,990,.04)
 ;;n
 ;;9002226,990,.06)
 ;;@
 ;;9002226,990,.08)
 ;;@
 ;;9002226,990,.09)
 ;;@
 ;;9002226,990,.11)
 ;;@
 ;;9002226,990,.12)
 ;;@
 ;;9002226,990,.13)
 ;;1
 ;;9002226,990,.14)
 ;;@
 ;;9002226,990,.15)
 ;;@
 ;;9002226,990,.16)
 ;;@
 ;;9002226,990,.17)
 ;;@
 ;;9002226,990,3101)
 ;;@
 ;;9002226.02101,"990,00223-2131-02 ",.01)
 ;;00223-2131-02
 ;;9002226.02101,"990,00223-2131-02 ",.02)
 ;;00223-2131-02
 ;;9002226.02101,"990,00223-2132-01 ",.01)
 ;;00223-2132-01
 ;;9002226.02101,"990,00223-2132-01 ",.02)
 ;;00223-2132-01
 ;;9002226.02101,"990,00223-2132-02 ",.01)
 ;;00223-2132-02
 ;;9002226.02101,"990,00223-2132-02 ",.02)
 ;;00223-2132-02
 ;;9002226.02101,"990,00223-2133-01 ",.01)
 ;;00223-2133-01
 ;;9002226.02101,"990,00223-2133-01 ",.02)
 ;;00223-2133-01
 ;;9002226.02101,"990,00223-2133-02 ",.01)
 ;;00223-2133-02
 ;;9002226.02101,"990,00223-2133-02 ",.02)
 ;;00223-2133-02
 ;;9002226.02101,"990,00223-2134-01 ",.01)
 ;;00223-2134-01
 ;;9002226.02101,"990,00223-2134-01 ",.02)
 ;;00223-2134-01
 ;;9002226.02101,"990,00223-2134-02 ",.01)
 ;;00223-2134-02
 ;;9002226.02101,"990,00223-2134-02 ",.02)
 ;;00223-2134-02
 ;;9002226.02101,"990,00247-0800-07 ",.01)
 ;;00247-0800-07
 ;;9002226.02101,"990,00247-0800-07 ",.02)
 ;;00247-0800-07
 ;;9002226.02101,"990,00247-0800-14 ",.01)
 ;;00247-0800-14
 ;;9002226.02101,"990,00247-0800-14 ",.02)
 ;;00247-0800-14
 ;;9002226.02101,"990,00247-0800-30 ",.01)
 ;;00247-0800-30
 ;;9002226.02101,"990,00247-0800-30 ",.02)
 ;;00247-0800-30
 ;;9002226.02101,"990,00247-0801-07 ",.01)
 ;;00247-0801-07
 ;;9002226.02101,"990,00247-0801-07 ",.02)
 ;;00247-0801-07
 ;;9002226.02101,"990,00247-0801-14 ",.01)
 ;;00247-0801-14
 ;;9002226.02101,"990,00247-0801-14 ",.02)
 ;;00247-0801-14
 ;;9002226.02101,"990,00247-0801-30 ",.01)
 ;;00247-0801-30
 ;;9002226.02101,"990,00247-0801-30 ",.02)
 ;;00247-0801-30
 ;;9002226.02101,"990,00247-0802-07 ",.01)
 ;;00247-0802-07
 ;;9002226.02101,"990,00247-0802-07 ",.02)
 ;;00247-0802-07
 ;;9002226.02101,"990,00247-0802-14 ",.01)
 ;;00247-0802-14
 ;;9002226.02101,"990,00247-0802-14 ",.02)
 ;;00247-0802-14
 ;;9002226.02101,"990,00247-0802-30 ",.01)
 ;;00247-0802-30
 ;;9002226.02101,"990,00247-0802-30 ",.02)
 ;;00247-0802-30
 ;;9002226.02101,"990,00247-0803-07 ",.01)
 ;;00247-0803-07
 ;;9002226.02101,"990,00247-0803-07 ",.02)
 ;;00247-0803-07
 ;;9002226.02101,"990,00247-0803-14 ",.01)
 ;;00247-0803-14
 ;;9002226.02101,"990,00247-0803-14 ",.02)
 ;;00247-0803-14
 ;;9002226.02101,"990,00247-0803-30 ",.01)
 ;;00247-0803-30
 ;;9002226.02101,"990,00247-0803-30 ",.02)
 ;;00247-0803-30
 ;;9002226.02101,"990,00247-0804-07 ",.01)
 ;;00247-0804-07
 ;;9002226.02101,"990,00247-0804-07 ",.02)
 ;;00247-0804-07
 ;;9002226.02101,"990,00247-0804-14 ",.01)
 ;;00247-0804-14
 ;;9002226.02101,"990,00247-0804-14 ",.02)
 ;;00247-0804-14
 ;;9002226.02101,"990,00247-0804-30 ",.01)
 ;;00247-0804-30
 ;;9002226.02101,"990,00247-0804-30 ",.02)
 ;;00247-0804-30
 ;;9002226.02101,"990,00247-0805-07 ",.01)
 ;;00247-0805-07
 ;;9002226.02101,"990,00247-0805-07 ",.02)
 ;;00247-0805-07
 ;;9002226.02101,"990,00247-0805-14 ",.01)
 ;;00247-0805-14
 ;;9002226.02101,"990,00247-0805-14 ",.02)
 ;;00247-0805-14
 ;;9002226.02101,"990,00247-0805-30 ",.01)
 ;;00247-0805-30
 ;;9002226.02101,"990,00247-0805-30 ",.02)
 ;;00247-0805-30
 ;;9002226.02101,"990,00378-0612-01 ",.01)
 ;;00378-0612-01
 ;;9002226.02101,"990,00378-0612-01 ",.02)
 ;;00378-0612-01
 ;;9002226.02101,"990,00378-0612-10 ",.01)
 ;;00378-0612-10
 ;;9002226.02101,"990,00378-0612-10 ",.02)
 ;;00378-0612-10
 ;;9002226.02101,"990,00378-0614-01 ",.01)
 ;;00378-0614-01
 ;;9002226.02101,"990,00378-0614-01 ",.02)
 ;;00378-0614-01
 ;;9002226.02101,"990,00378-0614-10 ",.01)
 ;;00378-0614-10
 ;;9002226.02101,"990,00378-0614-10 ",.02)
 ;;00378-0614-10
 ;;9002226.02101,"990,00378-0616-01 ",.01)
 ;;00378-0616-01
 ;;9002226.02101,"990,00378-0616-01 ",.02)
 ;;00378-0616-01
 ;;9002226.02101,"990,00378-0616-10 ",.01)
 ;;00378-0616-10
 ;;9002226.02101,"990,00378-0616-10 ",.02)
 ;;00378-0616-10
 ;;9002226.02101,"990,00378-0618-01 ",.01)
 ;;00378-0618-01
 ;;9002226.02101,"990,00378-0618-01 ",.02)
 ;;00378-0618-01
 ;;9002226.02101,"990,00378-0618-10 ",.01)
 ;;00378-0618-10
 ;;9002226.02101,"990,00378-0618-10 ",.02)
 ;;00378-0618-10
 ;;9002226.02101,"990,00615-2504-43 ",.01)
 ;;00615-2504-43
 ;;9002226.02101,"990,00615-2504-43 ",.02)
 ;;00615-2504-43
 ;;9002226.02101,"990,00615-2504-53 ",.01)
 ;;00615-2504-53
 ;;9002226.02101,"990,00615-2504-53 ",.02)
 ;;00615-2504-53
 ;;9002226.02101,"990,00615-2504-63 ",.01)
 ;;00615-2504-63
 ;;9002226.02101,"990,00615-2504-63 ",.02)
 ;;00615-2504-63
 ;;9002226.02101,"990,00615-2505-53 ",.01)
 ;;00615-2505-53
 ;;9002226.02101,"990,00615-2505-53 ",.02)
 ;;00615-2505-53
 ;;9002226.02101,"990,00615-2506-43 ",.01)
 ;;00615-2506-43
 ;;9002226.02101,"990,00615-2506-43 ",.02)
 ;;00615-2506-43
 ;;9002226.02101,"990,00615-2506-53 ",.01)
 ;;00615-2506-53
 ;;9002226.02101,"990,00615-2506-53 ",.02)
 ;;00615-2506-53
 ;;9002226.02101,"990,00615-2506-63 ",.01)
 ;;00615-2506-63
 ;;9002226.02101,"990,00615-2506-63 ",.02)
 ;;00615-2506-63
 ;;9002226.02101,"990,00615-2507-43 ",.01)
 ;;00615-2507-43
 ;;9002226.02101,"990,00615-2507-43 ",.02)
 ;;00615-2507-43
 ;;9002226.02101,"990,00615-2507-53 ",.01)
 ;;00615-2507-53
 ;;9002226.02101,"990,00615-2507-53 ",.02)
 ;;00615-2507-53
 ;;9002226.02101,"990,00615-2507-63 ",.01)
 ;;00615-2507-63
 ;;9002226.02101,"990,00615-2507-63 ",.02)
 ;;00615-2507-63
 ;;9002226.02101,"990,00615-2508-13 ",.01)
 ;;00615-2508-13
 ;;9002226.02101,"990,00615-2508-13 ",.02)
 ;;00615-2508-13
 ;;9002226.02101,"990,00615-2508-43 ",.01)
 ;;00615-2508-43
 ;;9002226.02101,"990,00615-2508-43 ",.02)
 ;;00615-2508-43
 ;;9002226.02101,"990,00615-2508-53 ",.01)
 ;;00615-2508-53
 ;;9002226.02101,"990,00615-2508-53 ",.02)
 ;;00615-2508-53
 ;;9002226.02101,"990,00615-2509-53 ",.01)
 ;;00615-2509-53
 ;;9002226.02101,"990,00615-2509-53 ",.02)
 ;;00615-2509-53
 ;;9002226.02101,"990,00615-2510-53 ",.01)
 ;;00615-2510-53
 ;;9002226.02101,"990,00615-2510-53 ",.02)
 ;;00615-2510-53
 ;;9002226.02101,"990,00677-0823-01 ",.01)
 ;;00677-0823-01
 ;;9002226.02101,"990,00677-0823-01 ",.02)
 ;;00677-0823-01
 ;
OTHER ; OTHER ROUTINES
 D ^BGP13E2
 D ^BGP13E3
 Q