BGPM5AYA ;IHS/MSC/SAT-CREATED BY ^ATXSTX ON AUG 31, 2011;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;**1**;JUN 27, 2011;Build 106
 ;;BGPMU LAB LOINC SEX ACTIVE FEM
 ;
 ; This routine loads Taxonomy BGPMU LAB LOINC SEX ACTIVE FEM
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
 ;;21,"10705-2 ")
 ;;29
 ;;21,"11083-3 ")
 ;;30
 ;;21,"11084-1 ")
 ;;31
 ;;21,"11481-9 ")
 ;;32
 ;;21,"11597-2 ")
 ;;33
 ;;21,"12222-6 ")
 ;;34
 ;;21,"12223-4 ")
 ;;35
 ;;21,"14499-8 ")
 ;;36
 ;;21,"14500-3 ")
 ;;37
 ;;21,"14502-9 ")
 ;;38
 ;;21,"14503-7 ")
 ;;39
 ;;21,"14504-5 ")
 ;;40
 ;;21,"14506-0 ")
 ;;41
 ;;21,"15019-3 ")
 ;;42
 ;;21,"16280-0 ")
 ;;43
 ;;21,"17398-9 ")
 ;;44
 ;;21,"17399-7 ")
 ;;45
 ;;21,"17400-3 ")
 ;;46
 ;;21,"17401-1 ")
 ;;47
 ;;21,"17402-9 ")
 ;;48
 ;;21,"17403-7 ")
 ;;49
 ;;21,"17404-5 ")
 ;;50
 ;;21,"17405-2 ")
 ;;51
 ;;21,"17406-0 ")
 ;;52
 ;;21,"17407-8 ")
 ;;53
 ;;21,"17408-6 ")
 ;;54
 ;;21,"17409-4 ")
 ;;55
 ;;21,"17410-2 ")
 ;;56
 ;;21,"17411-0 ")
 ;;57
 ;;21,"17412-8 ")
 ;;58
 ;;21,"17723-8 ")
 ;;59
 ;;21,"17724-6 ")
 ;;60
 ;;21,"17725-3 ")
 ;;61
 ;;21,"17726-1 ")
 ;;62
 ;;21,"17727-9 ")
 ;;63
 ;;21,"17728-7 ")
 ;;64
 ;;21,"17729-5 ")
 ;;65
 ;;21,"1832-5 ")
 ;;10
 ;;21,"1834-1 ")
 ;;11
 ;;21,"19080-1 ")
 ;;66
 ;;21,"19171-8 ")
 ;;67
 ;;21,"19176-7 ")
 ;;68
 ;;21,"19177-5 ")
 ;;69
 ;;21,"20403-2 ")
 ;;70
 ;;21,"20404-0 ")
 ;;71
 ;;21,"20415-6 ")
 ;;72
 ;;21,"20507-0 ")
 ;;73
 ;;21,"20508-8 ")
 ;;74
 ;;21,"21414-8 ")
 ;;75
 ;;21,"21415-5 ")
 ;;76
 ;;21,"21416-3 ")
 ;;77
 ;;21,"21440-3 ")
 ;;78
 ;;21,"21441-1 ")
 ;;79
 ;;21,"22461-8 ")
 ;;80
 ;;21,"22462-6 ")
 ;;81
 ;;21,"22587-0 ")
 ;;82
 ;;21,"22590-4 ")
 ;;83
 ;;21,"22592-0 ")
 ;;84
 ;;21,"22594-6 ")
 ;;85
 ;;21,"24110-9 ")
 ;;86
 ;;21,"24111-7 ")
 ;;87
 ;;21,"24312-1 ")
 ;;88
 ;;21,"26009-1 ")
 ;;89
 ;;21,"29311-8 ")
 ;;90
 ;;21,"30167-1 ")
 ;;91
 ;;21,"31147-2 ")
 ;;92
 ;;21,"31905-3 ")
 ;;93
 ;;21,"31906-1 ")
 ;;94
 ;;21,"31993-9 ")
 ;;95
 ;;21,"32198-4 ")
 ;;96
 ;;21,"32199-2 ")
 ;;97
 ;;21,"32705-6 ")
 ;;98
 ;;21,"34147-9 ")
 ;;99
 ;;21,"34382-2 ")
 ;;100
 ;;21,"34493-7 ")
 ;;101
 ;;21,"34656-9 ")
 ;;102
 ;;21,"34718-7 ")
 ;;103
 ;;21,"35457-1 ")
 ;;104
 ;;21,"36902-5 ")
 ;;105
 ;;21,"36903-3 ")
 ;;106
 ;;21,"38372-9 ")
 ;;107
 ;;21,"40679-3 ")
 ;;108
 ;;21,"40680-1 ")
 ;;109
 ;;21,"41273-4 ")
 ;;110
 ;;21,"41274-2 ")
 ;;111
 ;;21,"42316-0 ")
 ;;112
 ;;21,"42481-2 ")
 ;;113
 ;;21,"42931-6 ")
 ;;114
 ;;21,"43304-5 ")
 ;;115
 ;;21,"43305-2 ")
 ;;116
 ;;21,"43403-5 ")
 ;;117
 ;;21,"43404-3 ")
 ;;118
 ;;21,"43406-8 ")
 ;;119
 ;;21,"43798-8 ")
 ;;120
 ;;21,"44543-7 ")
 ;;121
 ;;21,"44544-5 ")
 ;;122
 ;;21,"44546-0 ")
 ;;123
 ;;21,"44547-8 ")
 ;;124
 ;;21,"44549-4 ")
 ;;125
 ;;21,"44550-2 ")
 ;;126
 ;;21,"44806-8 ")
 ;;127
 ;;21,"44807-6 ")
 ;;128
 ;;21,"45067-6 ")
 ;;129
 ;;21,"45068-4 ")
 ;;130
 ;;21,"45069-2 ")
 ;;131
 ;;21,"45070-0 ")
 ;;132
 ;;21,"45074-2 ")
 ;;133
 ;;21,"45076-7 ")
 ;;134
 ;;21,"45078-3 ")
 ;;135
 ;;21,"45080-9 ")
 ;;136
 ;;21,"45084-1 ")
 ;;137
 ;;21,"45091-6 ")
 ;;138
 ;;21,"45095-7 ")
 ;;139
 ;;21,"45098-1 ")
 ;;140
 ;;21,"45100-5 ")
 ;;141
 ;;21,"45327-4 ")
 ;;142
 ;;21,"45331-6 ")
 ;;143
 ;;21,"45332-4 ")
 ;;144
 ;;21,"46731-6 ")
 ;;145
 ;;21,"46989-0 ")
 ;;146
 ;;21,"47211-8 ")
 ;;147
 ;;21,"47212-6 ")
 ;;148
 ;;21,"47236-5 ")
 ;;149
 ;;21,"47237-3 ")
 ;;150
 ;;21,"47238-1 ")
 ;;151
 ;;21,"47387-6 ")
 ;;152
 ;;21,"48030-1 ")
 ;;153
 ;;21,"48039-2 ")
 ;;154
 ;;21,"48560-7 ")
 ;;155
 ;;21,"48781-9 ")
 ;;156
 ;;21,"49096-1 ")
 ;;157
 ;;21,"49246-2 ")
 ;;158
 ;;21,"49318-9 ")
 ;;159
 ;;21,"49891-5 ")
 ;;160
 ;;21,"49896-4 ")
 ;;161
 ;;21,"5028-6 ")
 ;;12
 ;;21,"50388-8 ")
 ;;162
 ;;21,"50690-7 ")
 ;;163
 ;;21,"51838-1 ")
 ;;164
 ;;21,"51839-9 ")
 ;;165
 ;;21,"5291-0 ")
 ;;13
 ;;21,"5292-8 ")
 ;;14
 ;;21,"53605-2 ")
 ;;166
 ;;21,"53762-1 ")
 ;;167
 ;;21,"53879-3 ")
 ;;168
 ;;21,"5392-6 ")
 ;;15
 ;;21,"53927-0 ")
 ;;169
 ;;21,"5393-4 ")
 ;;16
 ;;21,"5394-2 ")
 ;;17
 ;;21,"55299-2 ")
 ;;170
 ;;21,"557-9 ")
 ;;1
 ;;21,"560-3 ")
 ;;2
 ;;21,"6487-3 ")
 ;;18
 ;;21,"6488-1 ")
 ;;19
 ;;21,"6489-9 ")
 ;;20
 ;;21,"6510-2 ")
 ;;21
 ;;21,"6511-0 ")
 ;;22
 ;;21,"6514-4 ")
 ;;23
 ;;21,"6516-9 ")
 ;;24
 ;;21,"6561-5 ")
 ;;25
 ;;21,"6562-3 ")
 ;;26
 ;;21,"660-1 ")
 ;;3
 ;;21,"688-2 ")
 ;;4
 ;;21,"690-8 ")
 ;;5
 ;;21,"691-6 ")
 ;;6
 ;;21,"692-4 ")
 ;;7
 ;;21,"693-2 ")
 ;;8
 ;;21,"698-1 ")
 ;;9
 ;;21,"7975-6 ")
 ;;27
 ;;21,"8041-6 ")
 ;;28
 ;;9002226,1016,.01)
 ;;BGPMU LAB LOINC SEX ACTIVE FEM
 ;;9002226,1016,.02)
 ;;LOINC FOR SEX ACTIVE FEM
 ;;9002226,1016,.04)
 ;;@
 ;;9002226,1016,.06)
 ;;@
 ;;9002226,1016,.08)
 ;;@
 ;;9002226,1016,.09)
 ;;3110824
 ;;9002226,1016,.11)
 ;;@
 ;;9002226,1016,.12)
 ;;@
 ;;9002226,1016,.13)
 ;;@
 ;;9002226,1016,.14)
 ;;@
 ;;9002226,1016,.15)
 ;;95.3
 ;;9002226,1016,.16)
 ;;1
 ;;9002226,1016,.17)
 ;;@
 ;;9002226,1016,3101)
 ;;@
 ;;9002226.02101,"1016,10705-2 ",.01)
 ;;10705-2
 ;;9002226.02101,"1016,10705-2 ",.02)
 ;;10705-2
 ;;9002226.02101,"1016,11083-3 ",.01)
 ;;11083-3
 ;;9002226.02101,"1016,11083-3 ",.02)
 ;;11083-3
 ;;9002226.02101,"1016,11084-1 ",.01)
 ;;11084-1
 ;;9002226.02101,"1016,11084-1 ",.02)
 ;;11084-1
 ;;9002226.02101,"1016,11481-9 ",.01)
 ;;11481-9
 ;;9002226.02101,"1016,11481-9 ",.02)
 ;;11481-9
 ;;9002226.02101,"1016,11597-2 ",.01)
 ;;11597-2
 ;;9002226.02101,"1016,11597-2 ",.02)
 ;;11597-2
 ;;9002226.02101,"1016,12222-6 ",.01)
 ;;12222-6
 ;;9002226.02101,"1016,12222-6 ",.02)
 ;;12222-6
 ;;9002226.02101,"1016,12223-4 ",.01)
 ;;12223-4
 ;;9002226.02101,"1016,12223-4 ",.02)
 ;;12223-4
 ;;9002226.02101,"1016,14499-8 ",.01)
 ;;14499-8
 ;;9002226.02101,"1016,14499-8 ",.02)
 ;;14499-8
 ;;9002226.02101,"1016,14500-3 ",.01)
 ;;14500-3
 ;;9002226.02101,"1016,14500-3 ",.02)
 ;;14500-3
 ;;9002226.02101,"1016,14502-9 ",.01)
 ;;14502-9
 ;;9002226.02101,"1016,14502-9 ",.02)
 ;;14502-9
 ;;9002226.02101,"1016,14503-7 ",.01)
 ;;14503-7
 ;;9002226.02101,"1016,14503-7 ",.02)
 ;;14503-7
 ;;9002226.02101,"1016,14504-5 ",.01)
 ;;14504-5
 ;;9002226.02101,"1016,14504-5 ",.02)
 ;;14504-5
 ;;9002226.02101,"1016,14506-0 ",.01)
 ;;14506-0
 ;;9002226.02101,"1016,14506-0 ",.02)
 ;;14506-0
 ;;9002226.02101,"1016,15019-3 ",.01)
 ;;15019-3
 ;;9002226.02101,"1016,15019-3 ",.02)
 ;;15019-3
 ;;9002226.02101,"1016,16280-0 ",.01)
 ;;16280-0
 ;;9002226.02101,"1016,16280-0 ",.02)
 ;;16280-0
 ;;9002226.02101,"1016,17398-9 ",.01)
 ;;17398-9
 ;;9002226.02101,"1016,17398-9 ",.02)
 ;;17398-9
 ;;9002226.02101,"1016,17399-7 ",.01)
 ;;17399-7
 ;;9002226.02101,"1016,17399-7 ",.02)
 ;;17399-7
 ;;9002226.02101,"1016,17400-3 ",.01)
 ;;17400-3
 ;;9002226.02101,"1016,17400-3 ",.02)
 ;;17400-3
 ;;9002226.02101,"1016,17401-1 ",.01)
 ;;17401-1
 ;;9002226.02101,"1016,17401-1 ",.02)
 ;;17401-1
 ;;9002226.02101,"1016,17402-9 ",.01)
 ;;17402-9
 ;;9002226.02101,"1016,17402-9 ",.02)
 ;;17402-9
 ;;9002226.02101,"1016,17403-7 ",.01)
 ;;17403-7
 ;;9002226.02101,"1016,17403-7 ",.02)
 ;;17403-7
 ;;9002226.02101,"1016,17404-5 ",.01)
 ;;17404-5
 ;;9002226.02101,"1016,17404-5 ",.02)
 ;;17404-5
 ;;9002226.02101,"1016,17405-2 ",.01)
 ;;17405-2
 ;;9002226.02101,"1016,17405-2 ",.02)
 ;;17405-2
 ;;9002226.02101,"1016,17406-0 ",.01)
 ;;17406-0
 ;;9002226.02101,"1016,17406-0 ",.02)
 ;;17406-0
 ;;9002226.02101,"1016,17407-8 ",.01)
 ;;17407-8
 ;;9002226.02101,"1016,17407-8 ",.02)
 ;;17407-8
 ;;9002226.02101,"1016,17408-6 ",.01)
 ;;17408-6
 ;;9002226.02101,"1016,17408-6 ",.02)
 ;;17408-6
 ;;9002226.02101,"1016,17409-4 ",.01)
 ;;17409-4
 ;;9002226.02101,"1016,17409-4 ",.02)
 ;;17409-4
 ;;9002226.02101,"1016,17410-2 ",.01)
 ;;17410-2
 ;;9002226.02101,"1016,17410-2 ",.02)
 ;;17410-2
 ;;9002226.02101,"1016,17411-0 ",.01)
 ;;17411-0
 ;;9002226.02101,"1016,17411-0 ",.02)
 ;;17411-0
 ;;9002226.02101,"1016,17412-8 ",.01)
 ;;17412-8
 ;;9002226.02101,"1016,17412-8 ",.02)
 ;;17412-8
 ;;9002226.02101,"1016,17723-8 ",.01)
 ;;17723-8
 ;;9002226.02101,"1016,17723-8 ",.02)
 ;;17723-8
 ;;9002226.02101,"1016,17724-6 ",.01)
 ;;17724-6
 ;;9002226.02101,"1016,17724-6 ",.02)
 ;;17724-6
 ;;9002226.02101,"1016,17725-3 ",.01)
 ;;17725-3
 ;;9002226.02101,"1016,17725-3 ",.02)
 ;;17725-3
 ;;9002226.02101,"1016,17726-1 ",.01)
 ;;17726-1
 ;;9002226.02101,"1016,17726-1 ",.02)
 ;;17726-1
 ;;9002226.02101,"1016,17727-9 ",.01)
 ;;17727-9
 ;;9002226.02101,"1016,17727-9 ",.02)
 ;;17727-9
 ;;9002226.02101,"1016,17728-7 ",.01)
 ;;17728-7
 ;;9002226.02101,"1016,17728-7 ",.02)
 ;;17728-7
 ;;9002226.02101,"1016,17729-5 ",.01)
 ;;17729-5
 ;;9002226.02101,"1016,17729-5 ",.02)
 ;;17729-5
 ;;9002226.02101,"1016,1832-5 ",.01)
 ;;1832-5
 ;;9002226.02101,"1016,1832-5 ",.02)
 ;;1832-5
 ;;9002226.02101,"1016,1834-1 ",.01)
 ;;1834-1
 ;;9002226.02101,"1016,1834-1 ",.02)
 ;;1834-1
 ;;9002226.02101,"1016,19080-1 ",.01)
 ;;19080-1
 ;;9002226.02101,"1016,19080-1 ",.02)
 ;;19080-1
 ;;9002226.02101,"1016,19171-8 ",.01)
 ;;19171-8
 ;;9002226.02101,"1016,19171-8 ",.02)
 ;;19171-8
 ;;9002226.02101,"1016,19176-7 ",.01)
 ;;19176-7
 ;;9002226.02101,"1016,19176-7 ",.02)
 ;;19176-7
 ;;9002226.02101,"1016,19177-5 ",.01)
 ;;19177-5
 ;;9002226.02101,"1016,19177-5 ",.02)
 ;;19177-5
 ;;9002226.02101,"1016,20403-2 ",.01)
 ;;20403-2
 ;;9002226.02101,"1016,20403-2 ",.02)
 ;;20403-2
 ;;9002226.02101,"1016,20404-0 ",.01)
 ;;20404-0
 ;;9002226.02101,"1016,20404-0 ",.02)
 ;;20404-0
 ;;9002226.02101,"1016,20415-6 ",.01)
 ;;20415-6
 ;;9002226.02101,"1016,20415-6 ",.02)
 ;;20415-6
 ;;9002226.02101,"1016,20507-0 ",.01)
 ;;20507-0
 ;;9002226.02101,"1016,20507-0 ",.02)
 ;;20507-0
 ;;9002226.02101,"1016,20508-8 ",.01)
 ;;20508-8
 ;;9002226.02101,"1016,20508-8 ",.02)
 ;;20508-8
 ;;9002226.02101,"1016,21414-8 ",.01)
 ;;21414-8
 ;;9002226.02101,"1016,21414-8 ",.02)
 ;;21414-8
 ;;9002226.02101,"1016,21415-5 ",.01)
 ;;21415-5
 ;;9002226.02101,"1016,21415-5 ",.02)
 ;;21415-5
 ;;9002226.02101,"1016,21416-3 ",.01)
 ;;21416-3
 ;;9002226.02101,"1016,21416-3 ",.02)
 ;;21416-3
 ;;9002226.02101,"1016,21440-3 ",.01)
 ;;21440-3
 ;;9002226.02101,"1016,21440-3 ",.02)
 ;;21440-3
 ;;9002226.02101,"1016,21441-1 ",.01)
 ;;21441-1
 ;;9002226.02101,"1016,21441-1 ",.02)
 ;;21441-1
 ;;9002226.02101,"1016,22461-8 ",.01)
 ;;22461-8
 ;;9002226.02101,"1016,22461-8 ",.02)
 ;;22461-8
 ;;9002226.02101,"1016,22462-6 ",.01)
 ;;22462-6
 ;;9002226.02101,"1016,22462-6 ",.02)
 ;;22462-6
 ;;9002226.02101,"1016,22587-0 ",.01)
 ;;22587-0
 ;;9002226.02101,"1016,22587-0 ",.02)
 ;;22587-0
 ;;9002226.02101,"1016,22590-4 ",.01)
 ;;22590-4
 ;;9002226.02101,"1016,22590-4 ",.02)
 ;;22590-4
 ;;9002226.02101,"1016,22592-0 ",.01)
 ;;22592-0
 ;;9002226.02101,"1016,22592-0 ",.02)
 ;;22592-0
 ;;9002226.02101,"1016,22594-6 ",.01)
 ;;22594-6
 ;;9002226.02101,"1016,22594-6 ",.02)
 ;;22594-6
 ;;9002226.02101,"1016,24110-9 ",.01)
 ;;24110-9
 ;;9002226.02101,"1016,24110-9 ",.02)
 ;;24110-9
 ;;9002226.02101,"1016,24111-7 ",.01)
 ;;24111-7
 ;;9002226.02101,"1016,24111-7 ",.02)
 ;;24111-7
 ;;9002226.02101,"1016,24312-1 ",.01)
 ;;24312-1
 ;;9002226.02101,"1016,24312-1 ",.02)
 ;;24312-1
 ;
OTHER ; OTHER ROUTINES
 D ^BGPM5AYB
 Q
