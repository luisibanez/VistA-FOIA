BGP9RXB ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;;BGP HEDIS VASODILATOR NDC
 ;
 ; This routine loads Taxonomy BGP HEDIS VASODILATOR NDC
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
 ;;21,"00005-3743-23 ")
 ;;1
 ;;21,"00005-3743-31 ")
 ;;2
 ;;21,"00005-3790-23 ")
 ;;3
 ;;21,"00005-3791-23 ")
 ;;4
 ;;21,"00005-3791-31 ")
 ;;5
 ;;21,"00074-2043-02 ")
 ;;6
 ;;21,"00074-2043-10 ")
 ;;7
 ;;21,"00087-0543-01 ")
 ;;8
 ;;21,"00087-0544-01 ")
 ;;9
 ;;21,"00182-1055-01 ")
 ;;10
 ;;21,"00182-1055-10 ")
 ;;11
 ;;21,"00182-1056-01 ")
 ;;12
 ;;21,"00182-1056-10 ")
 ;;13
 ;;21,"00182-1568-89 ")
 ;;14
 ;;21,"00182-1569-89 ")
 ;;15
 ;;21,"00182-1570-89 ")
 ;;16
 ;;21,"00185-0530-01 ")
 ;;17
 ;;21,"00185-0530-10 ")
 ;;18
 ;;21,"00185-0531-01 ")
 ;;19
 ;;21,"00185-0531-10 ")
 ;;20
 ;;21,"00223-0837-01 ")
 ;;21
 ;;21,"00223-0837-02 ")
 ;;22
 ;;21,"00228-2183-10 ")
 ;;23
 ;;21,"00228-2183-96 ")
 ;;24
 ;;21,"00228-2185-10 ")
 ;;25
 ;;21,"00228-2185-96 ")
 ;;26
 ;;21,"00228-2193-10 ")
 ;;27
 ;;21,"00228-2193-96 ")
 ;;28
 ;;21,"00302-2290-01 ")
 ;;29
 ;;21,"00405-4350-01 ")
 ;;30
 ;;21,"00405-4350-03 ")
 ;;31
 ;;21,"00405-4351-01 ")
 ;;32
 ;;21,"00405-4351-03 ")
 ;;33
 ;;21,"00405-4352-01 ")
 ;;34
 ;;21,"00405-4352-03 ")
 ;;35
 ;;21,"00405-4575-01 ")
 ;;36
 ;;21,"00405-4575-03 ")
 ;;37
 ;;21,"00405-4576-01 ")
 ;;38
 ;;21,"00405-4576-03 ")
 ;;39
 ;;21,"00405-5350-01 ")
 ;;40
 ;;21,"00405-5350-03 ")
 ;;41
 ;;21,"00405-5351-01 ")
 ;;42
 ;;21,"00405-5352-01 ")
 ;;43
 ;;21,"00405-5352-03 ")
 ;;44
 ;;21,"00409-2043-02 ")
 ;;45
 ;;21,"00463-6336-10 ")
 ;;46
 ;;21,"00555-0252-02 ")
 ;;47
 ;;21,"00555-0252-04 ")
 ;;48
 ;;21,"00555-0252-05 ")
 ;;49
 ;;21,"00555-0285-02 ")
 ;;50
 ;;21,"00555-0285-04 ")
 ;;51
 ;;21,"00555-0285-05 ")
 ;;52
 ;;21,"00555-0286-02 ")
 ;;53
 ;;21,"00555-0286-04 ")
 ;;54
 ;;21,"00555-0286-05 ")
 ;;55
 ;;21,"00590-0302-21 ")
 ;;56
 ;;21,"00590-0302-54 ")
 ;;57
 ;;21,"00597-0017-01 ")
 ;;58
 ;;21,"00597-0018-01 ")
 ;;59
 ;;21,"00597-0019-01 ")
 ;;60
 ;;21,"00615-1543-01 ")
 ;;61
 ;;21,"00615-1543-10 ")
 ;;62
 ;;21,"00615-1543-13 ")
 ;;63
 ;;21,"00615-1573-01 ")
 ;;64
 ;;21,"00615-1573-10 ")
 ;;65
 ;;21,"00615-1573-32 ")
 ;;66
 ;;21,"00615-1573-43 ")
 ;;67
 ;;21,"00615-1574-01 ")
 ;;68
 ;;21,"00615-1574-05 ")
 ;;69
 ;;21,"00615-1574-10 ")
 ;;70
 ;;21,"00615-1574-32 ")
 ;;71
 ;;21,"00641-1138-34 ")
 ;;72
 ;;21,"00641-1139-31 ")
 ;;73
 ;;21,"00641-2569-44 ")
 ;;74
 ;;21,"00686-0068-20 ")
 ;;75
 ;;21,"00686-0069-20 ")
 ;;76
 ;;21,"00686-0070-20 ")
 ;;77
 ;;21,"00703-1652-02 ")
 ;;78
 ;;21,"00703-1654-02 ")
 ;;79
 ;;21,"00781-1678-13 ")
 ;;80
 ;;21,"00781-1840-01 ")
 ;;81
 ;;21,"00781-1840-10 ")
 ;;82
 ;;21,"00781-1842-01 ")
 ;;83
 ;;21,"00781-1842-10 ")
 ;;84
 ;;21,"00839-1382-06 ")
 ;;85
 ;;21,"00839-1382-16 ")
 ;;86
 ;;21,"00839-6182-06 ")
 ;;87
 ;;21,"00839-6182-16 ")
 ;;88
 ;;21,"00839-6327-06 ")
 ;;89
 ;;21,"00839-6327-16 ")
 ;;90
 ;;21,"00839-6429-06 ")
 ;;91
 ;;21,"00839-6429-16 ")
 ;;92
 ;;21,"00839-6494-06 ")
 ;;93
 ;;21,"00839-6494-16 ")
 ;;94
 ;;21,"00839-7918-06 ")
 ;;95
 ;;21,"00839-7918-16 ")
 ;;96
 ;;21,"00839-7919-06 ")
 ;;97
 ;;21,"00839-7919-16 ")
 ;;98
 ;;21,"00839-7920-06 ")
 ;;99
 ;;21,"00839-7920-16 ")
 ;;100
 ;;21,"00904-0635-60 ")
 ;;101
 ;;21,"00904-0635-61 ")
 ;;102
 ;;21,"00904-0635-80 ")
 ;;103
 ;;21,"00904-0636-60 ")
 ;;104
 ;;21,"00904-0636-61 ")
 ;;105
 ;;21,"00904-0636-80 ")
 ;;106
 ;;21,"00904-1083-60 ")
 ;;107
 ;;21,"00904-1083-80 ")
 ;;108
 ;;21,"00904-1084-60 ")
 ;;109
 ;;21,"00904-1084-80 ")
 ;;110
 ;;21,"00904-1085-60 ")
 ;;111
 ;;21,"00904-1085-80 ")
 ;;112
 ;;21,"00904-1086-60 ")
 ;;113
 ;;21,"00904-1086-61 ")
 ;;114
 ;;21,"00904-1086-80 ")
 ;;115
 ;;21,"00904-1087-60 ")
 ;;116
 ;;21,"00904-1087-61 ")
 ;;117
 ;;21,"00904-1087-80 ")
 ;;118
 ;;21,"00904-1088-60 ")
 ;;119
 ;;21,"00904-1088-61 ")
 ;;120
 ;;21,"00904-1088-80 ")
 ;;121
 ;;21,"11994-0005-05 ")
 ;;122
 ;;21,"11994-0005-25 ")
 ;;123
 ;;21,"11994-0005-60 ")
 ;;124
 ;;21,"11994-0005-65 ")
 ;;125
 ;;21,"51079-0068-20 ")
 ;;126
 ;;21,"51079-0069-20 ")
 ;;127
 ;;21,"51079-0070-20 ")
 ;;128
 ;;21,"52152-0009-02 ")
 ;;129
 ;;21,"52152-0009-05 ")
 ;;130
 ;;21,"52152-0010-02 ")
 ;;131
 ;;21,"52152-0010-05 ")
 ;;132
 ;;21,"52152-0265-02 ")
 ;;133
 ;;21,"52152-0265-05 ")
 ;;134
 ;;21,"52152-0266-02 ")
 ;;135
 ;;21,"52152-0266-05 ")
 ;;136
 ;;21,"52152-0267-02 ")
 ;;137
 ;;21,"52152-0267-05 ")
 ;;138
 ;;21,"54569-0466-00 ")
 ;;139
 ;;21,"54569-0468-01 ")
 ;;140
 ;;21,"54569-0470-00 ")
 ;;141
 ;;21,"54868-1288-00 ")
 ;;142
 ;;21,"54868-1464-00 ")
 ;;143
 ;;21,"55289-0679-01 ")
 ;;144
 ;;21,"55289-0748-01 ")
 ;;145
 ;;21,"55289-0748-97 ")
 ;;146
 ;;21,"55370-0151-07 ")
 ;;147
 ;;21,"55370-0151-09 ")
 ;;148
 ;;21,"55370-0152-07 ")
 ;;149
 ;;21,"55370-0152-09 ")
 ;;150
 ;
OTHER ; OTHER ROUTINES
 D ^BGP9RXBB
 D ^BGP9RXBC
 D ^BGP9RXBD
 D ^BGP9RXBE
 D ^BGP9RXBF
 Q
