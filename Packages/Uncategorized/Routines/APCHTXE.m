APCHTXE ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON JUN 23, 2005;
 ;;2.0;IHS RPMS/PCC Health Summary;**14**;JUN 24, 1997
 ;;;APCH;;JUN 23, 2005
 ;;APCH GLUCOSE SCREENING LOINC
 ;
 ; This routine loads Taxonomy APCH GLUCOSE SCREENING LOINC
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
 ;;21,"12611-0 ")
 ;;184
 ;;21,"14743-9 ")
 ;;185
 ;;21,"14749-6 ")
 ;;186
 ;;21,"14753-8 ")
 ;;1
 ;;21,"14754-6 ")
 ;;2
 ;;21,"14755-3 ")
 ;;3
 ;;21,"14756-1 ")
 ;;4
 ;;21,"14757-9 ")
 ;;5
 ;;21,"14758-7 ")
 ;;6
 ;;21,"14759-5 ")
 ;;7
 ;;21,"14760-3 ")
 ;;8
 ;;21,"14761-1 ")
 ;;9
 ;;21,"14762-9 ")
 ;;10
 ;;21,"14763-7 ")
 ;;11
 ;;21,"14764-5 ")
 ;;12
 ;;21,"14765-2 ")
 ;;13
 ;;21,"14766-0 ")
 ;;14
 ;;21,"14767-8 ")
 ;;15
 ;;21,"14768-6 ")
 ;;16
 ;;21,"14769-4 ")
 ;;17
 ;;21,"14770-2 ")
 ;;18
 ;;21,"14771-0 ")
 ;;19
 ;;21,"1492-8 ")
 ;;34
 ;;21,"1493-6 ")
 ;;35
 ;;21,"1494-4 ")
 ;;36
 ;;21,"1496-9 ")
 ;;37
 ;;21,"1499-3 ")
 ;;38
 ;;21,"14995-5 ")
 ;;39
 ;;21,"14996-3 ")
 ;;33
 ;;21,"1500-8 ")
 ;;41
 ;;21,"1501-6 ")
 ;;42
 ;;21,"1502-4 ")
 ;;43
 ;;21,"1504-0 ")
 ;;44
 ;;21,"1506-5 ")
 ;;45
 ;;21,"1507-3 ")
 ;;46
 ;;21,"15074-8 ")
 ;;187
 ;;21,"1508-1 ")
 ;;47
 ;;21,"1510-7 ")
 ;;48
 ;;21,"1511-5 ")
 ;;49
 ;;21,"1512-3 ")
 ;;50
 ;;21,"1513-1 ")
 ;;51
 ;;21,"1514-9 ")
 ;;52
 ;;21,"1515-6 ")
 ;;53
 ;;21,"1517-2 ")
 ;;54
 ;;21,"1518-0 ")
 ;;55
 ;;21,"1519-8 ")
 ;;56
 ;;21,"1521-4 ")
 ;;57
 ;;21,"1522-2 ")
 ;;58
 ;;21,"1523-0 ")
 ;;59
 ;;21,"1524-8 ")
 ;;60
 ;;21,"1525-5 ")
 ;;61
 ;;21,"1527-1 ")
 ;;62
 ;;21,"1528-9 ")
 ;;63
 ;;21,"1529-7 ")
 ;;64
 ;;21,"1530-5 ")
 ;;65
 ;;21,"1531-3 ")
 ;;66
 ;;21,"1533-9 ")
 ;;67
 ;;21,"1534-7 ")
 ;;68
 ;;21,"1535-4 ")
 ;;69
 ;;21,"1536-2 ")
 ;;70
 ;;21,"1537-0 ")
 ;;71
 ;;21,"1539-6 ")
 ;;72
 ;;21,"1540-4 ")
 ;;73
 ;;21,"1542-0 ")
 ;;74
 ;;21,"1543-8 ")
 ;;75
 ;;21,"1544-6 ")
 ;;76
 ;;21,"1545-3 ")
 ;;77
 ;;21,"1547-9 ")
 ;;78
 ;;21,"1548-7 ")
 ;;79
 ;;21,"1549-5 ")
 ;;22
 ;;21,"1550-3 ")
 ;;23
 ;;21,"1551-1 ")
 ;;24
 ;;21,"1552-9 ")
 ;;25
 ;;21,"1553-7 ")
 ;;26
 ;;21,"1554-5 ")
 ;;27
 ;;21,"1556-0 ")
 ;;29
 ;;21,"1557-8 ")
 ;;30
 ;;21,"1558-6 ")
 ;;31
 ;;21,"16165-3 ")
 ;;89
 ;;21,"16166-1 ")
 ;;90
 ;;21,"16167-9 ")
 ;;91
 ;;21,"16168-7 ")
 ;;92
 ;;21,"16169-5 ")
 ;;93
 ;;21,"16170-3 ")
 ;;94
 ;;21,"16914-4 ")
 ;;95
 ;;21,"16915-1 ")
 ;;96
 ;;21,"17865-7 ")
 ;;28
 ;;21,"18296-4 ")
 ;;98
 ;;21,"18342-6 ")
 ;;99
 ;;21,"18353-3 ")
 ;;100
 ;;21,"18354-1 ")
 ;;101
 ;;21,"19104-9 ")
 ;;102
 ;;21,"19105-6 ")
 ;;103
 ;;21,"20436-2 ")
 ;;104
 ;;21,"20437-0 ")
 ;;105
 ;;21,"20438-8 ")
 ;;106
 ;;21,"20439-6 ")
 ;;107
 ;;21,"20440-4 ")
 ;;108
 ;;21,"20441-2 ")
 ;;109
 ;;21,"21004-7 ")
 ;;110
 ;;21,"21308-2 ")
 ;;111
 ;;21,"21309-0 ")
 ;;112
 ;;21,"21310-8 ")
 ;;113
 ;;21,"2339-0 ")
 ;;188
 ;;21,"2340-8 ")
 ;;189
 ;;21,"2341-6 ")
 ;;190
 ;;21,"2345-7 ")
 ;;191
 ;;21,"25663-6 ")
 ;;114
 ;;21,"25665-1 ")
 ;;115
 ;;21,"25666-9 ")
 ;;116
 ;;21,"25668-5 ")
 ;;117
 ;;21,"25669-3 ")
 ;;118
 ;;21,"25671-9 ")
 ;;119
 ;;21,"25672-7 ")
 ;;120
 ;;21,"25673-5 ")
 ;;121
 ;;21,"25674-3 ")
 ;;122
 ;;21,"25676-8 ")
 ;;123
 ;;21,"25677-6 ")
 ;;124
 ;;21,"25679-2 ")
 ;;125
 ;;21,"25680-0 ")
 ;;126
 ;;21,"26539-7 ")
 ;;127
 ;;21,"26541-3 ")
 ;;128
 ;;21,"26543-9 ")
 ;;129
 ;;21,"26544-7 ")
 ;;130
 ;;21,"26554-6 ")
 ;;131
 ;;21,"26555-3 ")
 ;;132
 ;;21,"26695-7 ")
 ;;133
 ;;21,"26777-3 ")
 ;;134
 ;;21,"26778-1 ")
 ;;135
 ;;21,"26779-9 ")
 ;;136
 ;;21,"26780-7 ")
 ;;137
 ;;21,"26781-5 ")
 ;;138
 ;;21,"26782-3 ")
 ;;139
 ;;21,"26783-1 ")
 ;;140
 ;;21,"26817-7 ")
 ;;141
 ;;21,"26853-2 ")
 ;;142
 ;;21,"26854-0 ")
 ;;143
 ;;21,"27432-4 ")
 ;;144
 ;;21,"29329-0 ")
 ;;148
 ;;21,"29330-8 ")
 ;;149
 ;;21,"29331-6 ")
 ;;150
 ;;21,"29332-4 ")
 ;;151
 ;;21,"29412-4 ")
 ;;152
 ;;21,"30251-3 ")
 ;;145
 ;;21,"30252-1 ")
 ;;146
 ;;21,"30253-9 ")
 ;;147
 ;;21,"30263-8 ")
 ;;153
 ;;21,"30264-6 ")
 ;;154
 ;;21,"30265-3 ")
 ;;155
 ;;21,"30266-1 ")
 ;;156
 ;;21,"30267-9 ")
 ;;157
 ;;21,"30344-6 ")
 ;;158
 ;;21,"30345-3 ")
 ;;159
 ;;21,"30346-1 ")
 ;;160
 ;;21,"32016-8 ")
 ;;192
 ;;21,"32319-6 ")
 ;;161
 ;;21,"32320-4 ")
 ;;162
 ;;21,"32321-2 ")
 ;;163
 ;;21,"32322-0 ")
 ;;164
 ;;21,"32359-2 ")
 ;;165
 ;;21,"32820-3 ")
 ;;166
 ;;21,"33024-1 ")
 ;;167
 ;;21,"34056-2 ")
 ;;168
 ;;21,"34057-0 ")
 ;;169
 ;;21,"34058-8 ")
 ;;170
 ;;21,"34059-6 ")
 ;;171
 ;;21,"34060-4 ")
 ;;172
 ;;21,"35184-1 ")
 ;;32
 ;;21,"35211-2 ")
 ;;193
 ;;21,"5914-7 ")
 ;;194
 ;;21,"6689-4 ")
 ;;177
 ;;21,"6749-6 ")
 ;;174
 ;;21,"6752-0 ")
 ;;175
 ;;21,"6756-1 ")
 ;;176
 ;;21,"6760-3 ")
 ;;178
 ;;21,"6762-9 ")
 ;;179
 ;;21,"6777-7 ")
 ;;195
 ;;21,"9375-7 ")
 ;;180
 ;;21,"9376-5 ")
 ;;181
 ;;21,"9377-3 ")
 ;;182
 ;;21,"9378-1 ")
 ;;183
 ;
OTHER ; OTHER ROUTINES
 D ^APCHTXEB
 D ^APCHTXEC
 D ^APCHTXED
 D ^APCHTXEE
 Q
