BGP6AXG ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON AUG 21, 2005 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;;BGP6;;AUG 21, 2005
 ;;BGP ASTHMA CONTROLLER NDC
 ;
 ; This routine loads Taxonomy BGP ASTHMA CONTROLLER NDC
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
 ;;21,"00006-0117-28 ")
 ;;1
 ;;21,"00006-0117-31 ")
 ;;2
 ;;21,"00006-0117-54 ")
 ;;3
 ;;21,"00006-0275-28 ")
 ;;4
 ;;21,"00006-0275-31 ")
 ;;5
 ;;21,"00006-0275-54 ")
 ;;6
 ;;21,"00006-0711-28 ")
 ;;7
 ;;21,"00006-0711-31 ")
 ;;8
 ;;21,"00006-0711-54 ")
 ;;9
 ;;21,"00034-7004-70 ")
 ;;10
 ;;21,"00034-7004-80 ")
 ;;11
 ;;21,"00034-7006-80 ")
 ;;12
 ;;21,"00034-7102-80 ")
 ;;13
 ;;21,"00054-3841-63 ")
 ;;14
 ;;21,"00054-8167-21 ")
 ;;15
 ;;21,"00054-8167-23 ")
 ;;16
 ;;21,"00054-8845-04 ")
 ;;17
 ;;21,"00054-8848-16 ")
 ;;18
 ;;21,"00074-7665-03 ")
 ;;19
 ;;21,"00074-7665-09 ")
 ;;20
 ;;21,"00074-7666-03 ")
 ;;21
 ;;21,"00074-7666-62 ")
 ;;22
 ;;21,"00074-7668-23 ")
 ;;23
 ;;21,"00074-7677-13 ")
 ;;24
 ;;21,"00074-7677-23 ")
 ;;25
 ;;21,"00074-7705-62 ")
 ;;26
 ;;21,"00089-0342-10 ")
 ;;27
 ;;21,"00089-0344-10 ")
 ;;28
 ;;21,"00172-6406-49 ")
 ;;29
 ;;21,"00172-6406-59 ")
 ;;30
 ;;21,"00182-1400-89 ")
 ;;31
 ;;21,"00182-1589-89 ")
 ;;32
 ;;21,"00182-1590-89 ")
 ;;33
 ;;21,"00223-6308-01 ")
 ;;34
 ;;21,"00223-6308-02 ")
 ;;35
 ;;21,"00223-6623-01 ")
 ;;36
 ;;21,"00256-0114-01 ")
 ;;37
 ;;21,"00256-0115-01 ")
 ;;38
 ;;21,"00256-0150-01 ")
 ;;39
 ;;21,"00258-3581-01 ")
 ;;40
 ;;21,"00258-3581-05 ")
 ;;41
 ;;21,"00258-3581-10 ")
 ;;42
 ;;21,"00258-3583-01 ")
 ;;43
 ;;21,"00258-3583-05 ")
 ;;44
 ;;21,"00258-3583-10 ")
 ;;45
 ;;21,"00258-3584-01 ")
 ;;46
 ;;21,"00258-3584-05 ")
 ;;47
 ;;21,"00258-3614-01 ")
 ;;48
 ;;21,"00258-3625-01 ")
 ;;49
 ;;21,"00258-3634-01 ")
 ;;50
 ;;21,"00258-3638-01 ")
 ;;51
 ;;21,"00310-0401-60 ")
 ;;52
 ;;21,"00310-0402-39 ")
 ;;53
 ;;21,"00310-0402-60 ")
 ;;54
 ;;21,"00338-0437-04 ")
 ;;55
 ;;21,"00338-0439-03 ")
 ;;56
 ;;21,"00338-0439-04 ")
 ;;57
 ;;21,"00338-0441-02 ")
 ;;58
 ;;21,"00338-0441-03 ")
 ;;59
 ;;21,"00338-0443-48 ")
 ;;60
 ;;21,"00338-0444-02 ")
 ;;61
 ;;21,"00338-0445-41 ")
 ;;62
 ;;21,"00338-0445-48 ")
 ;;63
 ;;21,"00456-0644-16 ")
 ;;64
 ;;21,"00456-4310-01 ")
 ;;65
 ;;21,"00456-4310-02 ")
 ;;66
 ;;21,"00456-4320-00 ")
 ;;67
 ;;21,"00456-4320-01 ")
 ;;68
 ;;21,"00456-4320-02 ")
 ;;69
 ;;21,"00456-4330-00 ")
 ;;70
 ;;21,"00456-4330-01 ")
 ;;71
 ;;21,"00456-4330-02 ")
 ;;72
 ;;21,"00463-9031-16 ")
 ;;73
 ;;21,"00472-0750-21 ")
 ;;74
 ;;21,"00472-0750-60 ")
 ;;75
 ;;21,"00472-1444-16 ")
 ;;76
 ;;21,"00585-0673-02 ")
 ;;77
 ;;21,"00585-0673-03 ")
 ;;78
 ;;21,"00585-0675-01 ")
 ;;79
 ;;21,"00585-0675-02 ")
 ;;80
 ;;21,"00585-0685-02 ")
 ;;81
 ;;21,"00603-5747-21 ")
 ;;82
 ;;21,"00603-5944-21 ")
 ;;83
 ;;21,"00603-5944-28 ")
 ;;84
 ;;21,"00603-5945-21 ")
 ;;85
 ;;21,"00603-5945-28 ")
 ;;86
 ;;21,"00603-5945-32 ")
 ;;87
 ;;21,"00603-5946-21 ")
 ;;88
 ;;21,"00603-5946-28 ")
 ;;89
 ;;21,"00603-5946-32 ")
 ;;90
 ;;21,"00603-5950-21 ")
 ;;91
 ;;21,"00603-5951-21 ")
 ;;92
 ;;21,"00603-5952-21 ")
 ;;93
 ;;21,"00677-0817-01 ")
 ;;94
 ;;21,"00677-0817-05 ")
 ;;95
 ;;21,"00677-0846-01 ")
 ;;96
 ;;21,"00677-0846-05 ")
 ;;97
 ;;21,"00904-1610-60 ")
 ;;98
 ;;21,"00904-1610-61 ")
 ;;99
 ;;21,"00904-1611-40 ")
 ;;100
 ;;21,"00904-1611-60 ")
 ;;101
 ;;21,"00904-1611-61 ")
 ;;102
 ;;21,"00904-1611-80 ")
 ;;103
 ;;21,"00904-1612-40 ")
 ;;104
 ;;21,"00904-1612-60 ")
 ;;105
 ;;21,"00904-1612-61 ")
 ;;106
 ;;21,"00904-1612-80 ")
 ;;107
 ;;21,"00904-7849-60 ")
 ;;108
 ;;21,"05324-5309-35 ")
 ;;109
 ;;21,"05324-5309-45 ")
 ;;110
 ;;21,"17236-0324-01 ")
 ;;111
 ;;21,"17236-0324-10 ")
 ;;112
 ;;21,"17236-0325-01 ")
 ;;113
 ;;21,"17236-0325-05 ")
 ;;114
 ;;21,"17236-0325-10 ")
 ;;115
 ;;21,"17236-0335-01 ")
 ;;116
 ;;21,"17317-0571-01 ")
 ;;117
 ;;21,"17317-0571-04 ")
 ;;118
 ;;21,"17317-0571-05 ")
 ;;119
 ;;21,"17317-0571-08 ")
 ;;120
 ;;21,"24208-0373-60 ")
 ;;121
 ;;21,"24208-0373-62 ")
 ;;122
 ;;21,"45902-0689-12 ")
 ;;123
 ;;21,"49452-7720-01 ")
 ;;124
 ;;21,"49452-7720-02 ")
 ;;125
 ;;21,"49452-7720-03 ")
 ;;126
 ;;21,"49502-0689-02 ")
 ;;127
 ;;21,"50111-0459-01 ")
 ;;128
 ;;21,"50111-0459-02 ")
 ;;129
 ;;21,"50111-0459-03 ")
 ;;130
 ;;21,"50111-0482-01 ")
 ;;131
 ;;21,"50111-0482-02 ")
 ;;132
 ;;21,"50111-0482-03 ")
 ;;133
 ;;21,"50111-0483-01 ")
 ;;134
 ;;21,"50111-0483-02 ")
 ;;135
 ;;21,"50111-0483-03 ")
 ;;136
 ;;21,"50111-0518-01 ")
 ;;137
 ;;21,"50474-0100-01 ")
 ;;138
 ;;21,"50474-0200-01 ")
 ;;139
 ;;21,"50474-0200-50 ")
 ;;140
 ;;21,"50474-0200-60 ")
 ;;141
 ;;21,"50474-0300-01 ")
 ;;142
 ;;21,"50474-0300-50 ")
 ;;143
 ;;21,"50474-0300-60 ")
 ;;144
 ;;21,"50474-0400-01 ")
 ;;145
 ;;21,"51552-0487-99 ")
 ;;146
 ;;21,"52959-0279-30 ")
 ;;147
 ;;21,"54569-0048-00 ")
 ;;148
 ;;21,"54569-0049-00 ")
 ;;149
 ;;21,"54569-0065-01 ")
 ;;150
 ;;21,"54569-0065-02 ")
 ;;151
 ;;21,"54569-0065-05 ")
 ;;152
 ;;21,"54569-1012-00 ")
 ;;153
 ;;21,"54569-2032-00 ")
 ;;154
 ;;21,"54569-2482-00 ")
 ;;155
 ;;21,"54569-2482-01 ")
 ;;156
 ;;21,"54569-2482-05 ")
 ;;157
 ;;21,"54569-2483-00 ")
 ;;158
 ;;21,"54569-2483-01 ")
 ;;159
 ;;21,"54569-2483-02 ")
 ;;160
 ;;21,"54569-2483-03 ")
 ;;161
 ;;21,"54569-4605-00 ")
 ;;162
 ;;21,"54569-4736-00 ")
 ;;163
 ;;21,"54569-5167-00 ")
 ;;164
 ;;21,"54868-0028-00 ")
 ;;165
 ;;21,"54868-0028-01 ")
 ;;166
 ;;21,"54868-0028-02 ")
 ;;167
 ;;21,"54868-0028-03 ")
 ;;168
 ;;21,"54868-0028-05 ")
 ;;169
 ;;21,"54868-0029-00 ")
 ;;170
 ;;21,"54868-0029-02 ")
 ;;171
 ;;21,"54868-0029-03 ")
 ;;172
 ;;21,"54868-0029-05 ")
 ;;173
 ;;21,"54868-0029-06 ")
 ;;174
 ;;21,"54868-1849-02 ")
 ;;175
 ;;21,"54868-3283-00 ")
 ;;176
 ;;21,"54868-3283-01 ")
 ;;177
 ;;21,"54868-3283-02 ")
 ;;178
 ;;21,"55289-0259-01 ")
 ;;179
 ;;21,"55289-0259-30 ")
 ;;180
 ;;21,"55289-0259-60 ")
 ;;181
 ;;21,"55289-0260-01 ")
 ;;182
 ;;21,"55289-0260-06 ")
 ;;183
 ;;21,"55289-0260-20 ")
 ;;184
 ;;21,"55289-0260-30 ")
 ;;185
 ;;21,"55289-0260-60 ")
 ;;186
 ;;21,"59930-1509-01 ")
 ;;187
 ;;21,"59930-1509-02 ")
 ;;188
 ;;21,"59930-1660-01 ")
 ;;189
 ;;21,"59930-1660-02 ")
 ;;190
 ;;21,"59930-1660-03 ")
 ;;191
 ;;21,"59930-1670-01 ")
 ;;192
 ;;21,"59930-1670-02 ")
 ;;193
 ;;21,"59930-1670-03 ")
 ;;194
 ;;21,"59930-1680-01 ")
 ;;195
 ;;21,"60432-0019-16 ")
 ;;196
 ;;21,"60432-0019-28 ")
 ;;197
 ;;21,"60432-0157-06 ")
 ;;198
 ;;21,"61392-0016-30 ")
 ;;199
 ;;21,"61392-0016-45 ")
 ;;200
 ;;21,"61392-0016-51 ")
 ;;201
 ;;21,"61392-0016-54 ")
 ;;202
 ;;21,"61392-0016-56 ")
 ;;203
 ;;21,"61392-0016-60 ")
 ;;204
 ;;21,"61392-0016-90 ")
 ;;205
 ;;21,"61392-0016-91 ")
 ;;206
 ;;21,"61392-0017-30 ")
 ;;207
 ;;21,"61392-0017-51 ")
 ;;208
 ;;21,"61392-0017-54 ")
 ;;209
 ;;21,"61392-0017-56 ")
 ;;210
 ;;21,"61392-0017-60 ")
 ;;211
 ;;21,"61392-0017-90 ")
 ;;212
 ;;21,"61392-0017-91 ")
 ;;213
 ;;21,"61570-0019-01 ")
 ;;214
 ;;21,"61570-0020-01 ")
 ;;215
 ;;21,"64032-0157-21 ")
 ;;216
 ;;9002226,346,.01)
 ;;BGP ASTHMA CONTROLLER NDC
 ;;9002226,346,.02)
 ;;@
 ;;9002226,346,.04)
 ;;n
 ;;9002226,346,.06)
 ;;@
 ;;9002226,346,.08)
 ;;@
 ;;9002226,346,.09)
 ;;@
 ;;9002226,346,.11)
 ;;@
 ;;9002226,346,.12)
 ;;@
 ;;9002226,346,.13)
 ;;1
 ;;9002226,346,.14)
 ;;@
 ;;9002226,346,.15)
 ;;@
 ;;9002226,346,.16)
 ;;@
 ;;9002226,346,.17)
 ;;@
 ;;9002226,346,3101)
 ;;@
 ;;9002226.02101,"346,00006-0117-28 ",.01)
 ;;00006-0117-28
 ;;9002226.02101,"346,00006-0117-28 ",.02)
 ;;00006-0117-28
 ;;9002226.02101,"346,00006-0117-31 ",.01)
 ;;00006-0117-31
 ;;9002226.02101,"346,00006-0117-31 ",.02)
 ;;00006-0117-31
 ;;9002226.02101,"346,00006-0117-54 ",.01)
 ;;00006-0117-54
 ;;9002226.02101,"346,00006-0117-54 ",.02)
 ;;00006-0117-54
 ;;9002226.02101,"346,00006-0275-28 ",.01)
 ;;00006-0275-28
 ;;9002226.02101,"346,00006-0275-28 ",.02)
 ;;00006-0275-28
 ;;9002226.02101,"346,00006-0275-31 ",.01)
 ;;00006-0275-31
 ;;9002226.02101,"346,00006-0275-31 ",.02)
 ;;00006-0275-31
 ;;9002226.02101,"346,00006-0275-54 ",.01)
 ;;00006-0275-54
 ;;9002226.02101,"346,00006-0275-54 ",.02)
 ;;00006-0275-54
 ;;9002226.02101,"346,00006-0711-28 ",.01)
 ;;00006-0711-28
 ;;9002226.02101,"346,00006-0711-28 ",.02)
 ;;00006-0711-28
 ;;9002226.02101,"346,00006-0711-31 ",.01)
 ;;00006-0711-31
 ;;9002226.02101,"346,00006-0711-31 ",.02)
 ;;00006-0711-31
 ;;9002226.02101,"346,00006-0711-54 ",.01)
 ;;00006-0711-54
 ;;9002226.02101,"346,00006-0711-54 ",.02)
 ;;00006-0711-54
 ;;9002226.02101,"346,00034-7004-70 ",.01)
 ;;00034-7004-70
 ;;9002226.02101,"346,00034-7004-70 ",.02)
 ;;00034-7004-70
 ;;9002226.02101,"346,00034-7004-80 ",.01)
 ;;00034-7004-80
 ;;9002226.02101,"346,00034-7004-80 ",.02)
 ;;00034-7004-80
 ;;9002226.02101,"346,00034-7006-80 ",.01)
 ;;00034-7006-80
 ;;9002226.02101,"346,00034-7006-80 ",.02)
 ;;00034-7006-80
 ;;9002226.02101,"346,00034-7102-80 ",.01)
 ;;00034-7102-80
 ;;9002226.02101,"346,00034-7102-80 ",.02)
 ;;00034-7102-80
 ;;9002226.02101,"346,00054-3841-63 ",.01)
 ;;00054-3841-63
 ;;9002226.02101,"346,00054-3841-63 ",.02)
 ;;00054-3841-63
 ;;9002226.02101,"346,00054-8167-21 ",.01)
 ;;00054-8167-21
 ;;9002226.02101,"346,00054-8167-21 ",.02)
 ;;00054-8167-21
 ;;9002226.02101,"346,00054-8167-23 ",.01)
 ;;00054-8167-23
 ;;9002226.02101,"346,00054-8167-23 ",.02)
 ;;00054-8167-23
 ;;9002226.02101,"346,00054-8845-04 ",.01)
 ;;00054-8845-04
 ;;9002226.02101,"346,00054-8845-04 ",.02)
 ;;00054-8845-04
 ;;9002226.02101,"346,00054-8848-16 ",.01)
 ;;00054-8848-16
 ;;9002226.02101,"346,00054-8848-16 ",.02)
 ;;00054-8848-16
 ;;9002226.02101,"346,00074-7665-03 ",.01)
 ;;00074-7665-03
 ;;9002226.02101,"346,00074-7665-03 ",.02)
 ;;00074-7665-03
 ;;9002226.02101,"346,00074-7665-09 ",.01)
 ;;00074-7665-09
 ;;9002226.02101,"346,00074-7665-09 ",.02)
 ;;00074-7665-09
 ;;9002226.02101,"346,00074-7666-03 ",.01)
 ;;00074-7666-03
 ;;9002226.02101,"346,00074-7666-03 ",.02)
 ;;00074-7666-03
 ;;9002226.02101,"346,00074-7666-62 ",.01)
 ;;00074-7666-62
 ;;9002226.02101,"346,00074-7666-62 ",.02)
 ;;00074-7666-62
 ;;9002226.02101,"346,00074-7668-23 ",.01)
 ;;00074-7668-23
 ;;9002226.02101,"346,00074-7668-23 ",.02)
 ;;00074-7668-23
 ;;9002226.02101,"346,00074-7677-13 ",.01)
 ;;00074-7677-13
 ;;9002226.02101,"346,00074-7677-13 ",.02)
 ;;00074-7677-13
 ;;9002226.02101,"346,00074-7677-23 ",.01)
 ;;00074-7677-23
 ;;9002226.02101,"346,00074-7677-23 ",.02)
 ;;00074-7677-23
 ;;9002226.02101,"346,00074-7705-62 ",.01)
 ;;00074-7705-62
 ;;9002226.02101,"346,00074-7705-62 ",.02)
 ;;00074-7705-62
 ;;9002226.02101,"346,00089-0342-10 ",.01)
 ;;00089-0342-10
 ;;9002226.02101,"346,00089-0342-10 ",.02)
 ;;00089-0342-10
 ;;9002226.02101,"346,00089-0344-10 ",.01)
 ;;00089-0344-10
 ;;9002226.02101,"346,00089-0344-10 ",.02)
 ;;00089-0344-10
 ;;9002226.02101,"346,00172-6406-49 ",.01)
 ;;00172-6406-49
 ;;9002226.02101,"346,00172-6406-49 ",.02)
 ;;00172-6406-49
 ;;9002226.02101,"346,00172-6406-59 ",.01)
 ;;00172-6406-59
 ;;9002226.02101,"346,00172-6406-59 ",.02)
 ;;00172-6406-59
 ;;9002226.02101,"346,00182-1400-89 ",.01)
 ;;00182-1400-89
 ;;9002226.02101,"346,00182-1400-89 ",.02)
 ;;00182-1400-89
 ;;9002226.02101,"346,00182-1589-89 ",.01)
 ;;00182-1589-89
 ;;9002226.02101,"346,00182-1589-89 ",.02)
 ;;00182-1589-89
 ;;9002226.02101,"346,00182-1590-89 ",.01)
 ;;00182-1590-89
 ;;9002226.02101,"346,00182-1590-89 ",.02)
 ;;00182-1590-89
 ;;9002226.02101,"346,00223-6308-01 ",.01)
 ;;00223-6308-01
 ;;9002226.02101,"346,00223-6308-01 ",.02)
 ;;00223-6308-01
 ;;9002226.02101,"346,00223-6308-02 ",.01)
 ;;00223-6308-02
 ;;9002226.02101,"346,00223-6308-02 ",.02)
 ;;00223-6308-02
 ;;9002226.02101,"346,00223-6623-01 ",.01)
 ;;00223-6623-01
 ;;9002226.02101,"346,00223-6623-01 ",.02)
 ;;00223-6623-01
 ;;9002226.02101,"346,00256-0114-01 ",.01)
 ;;00256-0114-01
 ;;9002226.02101,"346,00256-0114-01 ",.02)
 ;;00256-0114-01
 ;;9002226.02101,"346,00256-0115-01 ",.01)
 ;;00256-0115-01
 ;;9002226.02101,"346,00256-0115-01 ",.02)
 ;;00256-0115-01
 ;;9002226.02101,"346,00256-0150-01 ",.01)
 ;;00256-0150-01
 ;;9002226.02101,"346,00256-0150-01 ",.02)
 ;;00256-0150-01
 ;;9002226.02101,"346,00258-3581-01 ",.01)
 ;;00258-3581-01
 ;;9002226.02101,"346,00258-3581-01 ",.02)
 ;;00258-3581-01
 ;;9002226.02101,"346,00258-3581-05 ",.01)
 ;;00258-3581-05
 ;;9002226.02101,"346,00258-3581-05 ",.02)
 ;;00258-3581-05
 ;;9002226.02101,"346,00258-3581-10 ",.01)
 ;;00258-3581-10
 ;;9002226.02101,"346,00258-3581-10 ",.02)
 ;;00258-3581-10
 ;;9002226.02101,"346,00258-3583-01 ",.01)
 ;;00258-3583-01
 ;;9002226.02101,"346,00258-3583-01 ",.02)
 ;;00258-3583-01
 ;;9002226.02101,"346,00258-3583-05 ",.01)
 ;;00258-3583-05
 ;;9002226.02101,"346,00258-3583-05 ",.02)
 ;;00258-3583-05
 ;;9002226.02101,"346,00258-3583-10 ",.01)
 ;;00258-3583-10
 ;;9002226.02101,"346,00258-3583-10 ",.02)
 ;;00258-3583-10
 ;;9002226.02101,"346,00258-3584-01 ",.01)
 ;;00258-3584-01
 ;;9002226.02101,"346,00258-3584-01 ",.02)
 ;;00258-3584-01
 ;;9002226.02101,"346,00258-3584-05 ",.01)
 ;;00258-3584-05
 ;
OTHER ; OTHER ROUTINES
 D ^BGP6AXGB
 D ^BGP6AXGC
 Q