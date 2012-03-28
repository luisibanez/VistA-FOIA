BGP6GXQE ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON JAN 06, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;;BGP6;;JAN 06, 2006
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"352,00597-0071-75 ",.01)
 ;;00597-0071-75
 ;;9002226.02101,"352,00597-0071-75 ",.02)
 ;;00597-0071-75
 ;;9002226.02101,"352,00597-0075-06 ",.01)
 ;;00597-0075-06
 ;;9002226.02101,"352,00597-0075-06 ",.02)
 ;;00597-0075-06
 ;;9002226.02101,"352,00597-0075-37 ",.01)
 ;;00597-0075-37
 ;;9002226.02101,"352,00597-0075-37 ",.02)
 ;;00597-0075-37
 ;;9002226.02101,"352,00597-0078-62 ",.01)
 ;;00597-0078-62
 ;;9002226.02101,"352,00597-0078-62 ",.02)
 ;;00597-0078-62
 ;;9002226.02101,"352,00597-0080-62 ",.01)
 ;;00597-0080-62
 ;;9002226.02101,"352,00597-0080-62 ",.02)
 ;;00597-0080-62
 ;;9002226.02101,"352,00597-0082-14 ",.01)
 ;;00597-0082-14
 ;;9002226.02101,"352,00597-0082-14 ",.02)
 ;;00597-0082-14
 ;;9002226.02101,"352,00597-0082-18 ",.01)
 ;;00597-0082-18
 ;;9002226.02101,"352,00597-0082-18 ",.02)
 ;;00597-0082-18
 ;;9002226.02101,"352,00603-1004-75 ",.01)
 ;;00603-1004-75
 ;;9002226.02101,"352,00603-1004-75 ",.02)
 ;;00603-1004-75
 ;;9002226.02101,"352,00603-1004-99 ",.01)
 ;;00603-1004-99
 ;;9002226.02101,"352,00603-1004-99 ",.02)
 ;;00603-1004-99
 ;;9002226.02101,"352,00603-1005-40 ",.01)
 ;;00603-1005-40
 ;;9002226.02101,"352,00603-1005-40 ",.02)
 ;;00603-1005-40
 ;;9002226.02101,"352,00603-1006-43 ",.01)
 ;;00603-1006-43
 ;;9002226.02101,"352,00603-1006-43 ",.02)
 ;;00603-1006-43
 ;;9002226.02101,"352,00603-1420-45 ",.01)
 ;;00603-1420-45
 ;;9002226.02101,"352,00603-1420-45 ",.02)
 ;;00603-1420-45
 ;;9002226.02101,"352,00677-1521-22 ",.01)
 ;;00677-1521-22
 ;;9002226.02101,"352,00677-1521-22 ",.02)
 ;;00677-1521-22
 ;;9002226.02101,"352,00677-1522-72 ",.01)
 ;;00677-1522-72
 ;;9002226.02101,"352,00677-1522-72 ",.02)
 ;;00677-1522-72
 ;;9002226.02101,"352,00677-1522-73 ",.01)
 ;;00677-1522-73
 ;;9002226.02101,"352,00677-1522-73 ",.02)
 ;;00677-1522-73
 ;;9002226.02101,"352,00677-1549-70 ",.01)
 ;;00677-1549-70
 ;;9002226.02101,"352,00677-1549-70 ",.02)
 ;;00677-1549-70
 ;;9002226.02101,"352,00677-1549-71 ",.01)
 ;;00677-1549-71
 ;;9002226.02101,"352,00677-1549-71 ",.02)
 ;;00677-1549-71
 ;;9002226.02101,"352,00686-0057-12 ",.01)
 ;;00686-0057-12
 ;;9002226.02101,"352,00686-0057-12 ",.02)
 ;;00686-0057-12
 ;;9002226.02101,"352,00686-0829-05 ",.01)
 ;;00686-0829-05
 ;;9002226.02101,"352,00686-0829-05 ",.02)
 ;;00686-0829-05
 ;;9002226.02101,"352,00719-4460-71 ",.01)
 ;;00719-4460-71
 ;;9002226.02101,"352,00719-4460-71 ",.02)
 ;;00719-4460-71
 ;;9002226.02101,"352,00719-4460-87 ",.01)
 ;;00719-4460-87
 ;;9002226.02101,"352,00719-4460-87 ",.02)
 ;;00719-4460-87
 ;;9002226.02101,"352,00719-4485-70 ",.01)
 ;;00719-4485-70
 ;;9002226.02101,"352,00719-4485-70 ",.02)
 ;;00719-4485-70
 ;;9002226.02101,"352,00719-4552-83 ",.01)
 ;;00719-4552-83
 ;;9002226.02101,"352,00719-4552-83 ",.02)
 ;;00719-4552-83
 ;;9002226.02101,"352,00719-4552-97 ",.01)
 ;;00719-4552-97
 ;;9002226.02101,"352,00719-4552-97 ",.02)
 ;;00719-4552-97
 ;;9002226.02101,"352,00781-7502-87 ",.01)
 ;;00781-7502-87
 ;;9002226.02101,"352,00781-7502-87 ",.02)
 ;;00781-7502-87
 ;;9002226.02101,"352,00781-7502-88 ",.01)
 ;;00781-7502-88
 ;;9002226.02101,"352,00781-7502-88 ",.02)
 ;;00781-7502-88
 ;;9002226.02101,"352,00781-7535-80 ",.01)
 ;;00781-7535-80
 ;;9002226.02101,"352,00781-7535-80 ",.02)
 ;;00781-7535-80
 ;;9002226.02101,"352,00781-9150-93 ",.01)
 ;;00781-9150-93
 ;;9002226.02101,"352,00781-9150-93 ",.02)
 ;;00781-9150-93
 ;;9002226.02101,"352,00801-0060-37 ",.01)
 ;;00801-0060-37
 ;;9002226.02101,"352,00801-0060-37 ",.02)
 ;;00801-0060-37
 ;;9002226.02101,"352,00801-0060-39 ",.01)
 ;;00801-0060-39
 ;;9002226.02101,"352,00801-0060-39 ",.02)
 ;;00801-0060-39
 ;;9002226.02101,"352,00832-8676-30 ",.01)
 ;;00832-8676-30
 ;;9002226.02101,"352,00832-8676-30 ",.02)
 ;;00832-8676-30
 ;;9002226.02101,"352,00839-6403-61 ",.01)
 ;;00839-6403-61
 ;;9002226.02101,"352,00839-6403-61 ",.02)
 ;;00839-6403-61
 ;;9002226.02101,"352,00839-7532-36 ",.01)
 ;;00839-7532-36
 ;;9002226.02101,"352,00839-7532-36 ",.02)
 ;;00839-7532-36
 ;;9002226.02101,"352,00839-7580-36 ",.01)
 ;;00839-7580-36
 ;;9002226.02101,"352,00839-7580-36 ",.02)
 ;;00839-7580-36
 ;;9002226.02101,"352,00839-7608-07 ",.01)
 ;;00839-7608-07
 ;;9002226.02101,"352,00839-7608-07 ",.02)
 ;;00839-7608-07
 ;;9002226.02101,"352,00839-7608-80 ",.01)
 ;;00839-7608-80
 ;;9002226.02101,"352,00839-7608-80 ",.02)
 ;;00839-7608-80
 ;;9002226.02101,"352,00839-7639-07 ",.01)
 ;;00839-7639-07
 ;;9002226.02101,"352,00839-7639-07 ",.02)
 ;;00839-7639-07
 ;;9002226.02101,"352,00839-7640-07 ",.01)
 ;;00839-7640-07
 ;;9002226.02101,"352,00839-7640-07 ",.02)
 ;;00839-7640-07
 ;;9002226.02101,"352,00839-7730-97 ",.01)
 ;;00839-7730-97
 ;;9002226.02101,"352,00839-7730-97 ",.02)
 ;;00839-7730-97
 ;;9002226.02101,"352,00839-7816-10 ",.01)
 ;;00839-7816-10
 ;;9002226.02101,"352,00839-7816-10 ",.02)
 ;;00839-7816-10
 ;;9002226.02101,"352,00839-7860-18 ",.01)
 ;;00839-7860-18
 ;;9002226.02101,"352,00839-7860-18 ",.02)
 ;;00839-7860-18
 ;;9002226.02101,"352,00839-7860-35 ",.01)
 ;;00839-7860-35
 ;;9002226.02101,"352,00839-7860-35 ",.02)
 ;;00839-7860-35
 ;;9002226.02101,"352,00839-7861-97 ",.01)
 ;;00839-7861-97
 ;;9002226.02101,"352,00839-7861-97 ",.02)
 ;;00839-7861-97
 ;;9002226.02101,"352,00904-2353-10 ",.01)
 ;;00904-2353-10
 ;;9002226.02101,"352,00904-2353-10 ",.02)
 ;;00904-2353-10
 ;;9002226.02101,"352,00904-2353-30 ",.01)
 ;;00904-2353-30
 ;;9002226.02101,"352,00904-2353-30 ",.02)
 ;;00904-2353-30
 ;;9002226.02101,"352,00904-2671-35 ",.01)
 ;;00904-2671-35
 ;;9002226.02101,"352,00904-2671-35 ",.02)
 ;;00904-2671-35
 ;;9002226.02101,"352,00904-2875-34 ",.01)
 ;;00904-2875-34
 ;;9002226.02101,"352,00904-2875-34 ",.02)
 ;;00904-2875-34
 ;;9002226.02101,"352,00904-2875-57 ",.01)
 ;;00904-2875-57
 ;;9002226.02101,"352,00904-2875-57 ",.02)
 ;;00904-2875-57
 ;;9002226.02101,"352,00904-2881-30 ",.01)
 ;;00904-2881-30
 ;;9002226.02101,"352,00904-2881-30 ",.02)
 ;;00904-2881-30
 ;;9002226.02101,"352,00904-2882-17 ",.01)
 ;;00904-2882-17
 ;;9002226.02101,"352,00904-2882-17 ",.02)
 ;;00904-2882-17
 ;;9002226.02101,"352,00904-5078-34 ",.01)
 ;;00904-5078-34
 ;;9002226.02101,"352,00904-5078-34 ",.02)
 ;;00904-5078-34
 ;;9002226.02101,"352,00904-5078-68 ",.01)
 ;;00904-5078-68
 ;;9002226.02101,"352,00904-5078-68 ",.02)
 ;;00904-5078-68
 ;;9002226.02101,"352,00904-5079-34 ",.01)
 ;;00904-5079-34
 ;;9002226.02101,"352,00904-5079-34 ",.02)
 ;;00904-5079-34
 ;;9002226.02101,"352,00904-7658-55 ",.01)
 ;;00904-7658-55
 ;;9002226.02101,"352,00904-7658-55 ",.02)
 ;;00904-7658-55
 ;;9002226.02101,"352,00904-7731-17 ",.01)
 ;;00904-7731-17
 ;;9002226.02101,"352,00904-7731-17 ",.02)
 ;;00904-7731-17
 ;;9002226.02101,"352,11517-3169-01 ",.01)
 ;;11517-3169-01
 ;;9002226.02101,"352,11517-3169-01 ",.02)
 ;;11517-3169-01
 ;;9002226.02101,"352,11517-3169-02 ",.01)
 ;;11517-3169-02
 ;;9002226.02101,"352,11517-3169-02 ",.02)
 ;;11517-3169-02
 ;;9002226.02101,"352,11517-3169-09 ",.01)
 ;;11517-3169-09
 ;;9002226.02101,"352,11517-3169-09 ",.02)
 ;;11517-3169-09
 ;;9002226.02101,"352,11845-0433-15 ",.01)
 ;;11845-0433-15
 ;;9002226.02101,"352,11845-0433-15 ",.02)
 ;;11845-0433-15
 ;;9002226.02101,"352,12280-0173-60 ",.01)
 ;;12280-0173-60
 ;;9002226.02101,"352,12280-0173-60 ",.02)
 ;;12280-0173-60
 ;;9002226.02101,"352,12525-0675-01 ",.01)
 ;;12525-0675-01
 ;;9002226.02101,"352,12525-0675-01 ",.02)
 ;;12525-0675-01
 ;;9002226.02101,"352,12525-0675-02 ",.01)
 ;;12525-0675-02
 ;;9002226.02101,"352,12525-0675-02 ",.02)
 ;;12525-0675-02
 ;;9002226.02101,"352,12525-0675-99 ",.01)
 ;;12525-0675-99
 ;;9002226.02101,"352,12525-0675-99 ",.02)
 ;;12525-0675-99
 ;;9002226.02101,"352,17022-2686-00 ",.01)
 ;;17022-2686-00
 ;;9002226.02101,"352,17022-2686-00 ",.02)
 ;;17022-2686-00
 ;;9002226.02101,"352,17236-0828-98 ",.01)
 ;;17236-0828-98
 ;;9002226.02101,"352,17236-0828-98 ",.02)
 ;;17236-0828-98
 ;;9002226.02101,"352,17236-0945-94 ",.01)
 ;;17236-0945-94
 ;;9002226.02101,"352,17236-0945-94 ",.02)
 ;;17236-0945-94
 ;;9002226.02101,"352,17236-0971-93 ",.01)
 ;;17236-0971-93
 ;;9002226.02101,"352,17236-0971-93 ",.02)
 ;;17236-0971-93
 ;;9002226.02101,"352,17270-0574-37 ",.01)
 ;;17270-0574-37
 ;;9002226.02101,"352,17270-0574-37 ",.02)
 ;;17270-0574-37
 ;;9002226.02101,"352,17270-0574-39 ",.01)
 ;;17270-0574-39
 ;;9002226.02101,"352,17270-0574-39 ",.02)
 ;;17270-0574-39
 ;;9002226.02101,"352,17270-0721-01 ",.01)
 ;;17270-0721-01
 ;;9002226.02101,"352,17270-0721-01 ",.02)
 ;;17270-0721-01
 ;;9002226.02101,"352,19458-0718-01 ",.01)
 ;;19458-0718-01
 ;;9002226.02101,"352,19458-0718-01 ",.02)
 ;;19458-0718-01
 ;;9002226.02101,"352,24208-0347-20 ",.01)
 ;;24208-0347-20
 ;;9002226.02101,"352,24208-0347-20 ",.02)
 ;;24208-0347-20
 ;;9002226.02101,"352,24208-0373-60 ",.01)
 ;;24208-0373-60
 ;;9002226.02101,"352,24208-0373-60 ",.02)
 ;;24208-0373-60
 ;;9002226.02101,"352,24208-0373-62 ",.01)
 ;;24208-0373-62
 ;;9002226.02101,"352,24208-0373-62 ",.02)
 ;;24208-0373-62
 ;;9002226.02101,"352,38245-0640-09 ",.01)
 ;;38245-0640-09
 ;;9002226.02101,"352,38245-0640-09 ",.02)
 ;;38245-0640-09
 ;;9002226.02101,"352,38245-0669-17 ",.01)
 ;;38245-0669-17
 ;;9002226.02101,"352,38245-0669-17 ",.02)
 ;;38245-0669-17
 ;;9002226.02101,"352,47202-1288-03 ",.01)
 ;;47202-1288-03
 ;;9002226.02101,"352,47202-1288-03 ",.02)
 ;;47202-1288-03
 ;;9002226.02101,"352,47202-1293-01 ",.01)
 ;;47202-1293-01
 ;;9002226.02101,"352,47202-1293-01 ",.02)
 ;;47202-1293-01
 ;;9002226.02101,"352,48879-0673-02 ",.01)
 ;;48879-0673-02
 ;;9002226.02101,"352,48879-0673-02 ",.02)
 ;;48879-0673-02
 ;;9002226.02101,"352,48879-0673-03 ",.01)
 ;;48879-0673-03
 ;;9002226.02101,"352,48879-0673-03 ",.02)
 ;;48879-0673-03
 ;;9002226.02101,"352,48879-0673-99 ",.01)
 ;;48879-0673-99
 ;;9002226.02101,"352,48879-0673-99 ",.02)
 ;;48879-0673-99
 ;;9002226.02101,"352,48879-0996-02 ",.01)
 ;;48879-0996-02
 ;;9002226.02101,"352,48879-0996-02 ",.02)
 ;;48879-0996-02
 ;;9002226.02101,"352,48879-0996-03 ",.01)
 ;;48879-0996-03
 ;;9002226.02101,"352,48879-0996-03 ",.02)
 ;;48879-0996-03
 ;;9002226.02101,"352,49502-0052-12 ",.01)
 ;;49502-0052-12
 ;;9002226.02101,"352,49502-0052-12 ",.02)
 ;;49502-0052-12
 ;;9002226.02101,"352,49502-0052-14 ",.01)
 ;;49502-0052-14
 ;;9002226.02101,"352,49502-0052-14 ",.02)
 ;;49502-0052-14
 ;;9002226.02101,"352,49502-0052-20 ",.01)
 ;;49502-0052-20
 ;;9002226.02101,"352,49502-0052-20 ",.02)
 ;;49502-0052-20
 ;;9002226.02101,"352,49502-0055-13 ",.01)
 ;;49502-0055-13
 ;;9002226.02101,"352,49502-0055-13 ",.02)
 ;;49502-0055-13
 ;;9002226.02101,"352,49502-0055-30 ",.01)
 ;;49502-0055-30
 ;;9002226.02101,"352,49502-0055-30 ",.02)
 ;;49502-0055-30
 ;;9002226.02101,"352,49502-0056-12 ",.01)
 ;;49502-0056-12
 ;;9002226.02101,"352,49502-0056-12 ",.02)
 ;;49502-0056-12
 ;;9002226.02101,"352,49502-0056-14 ",.01)
 ;;49502-0056-14
 ;;9002226.02101,"352,49502-0056-14 ",.02)
 ;;49502-0056-14
 ;;9002226.02101,"352,49502-0057-12 ",.01)
 ;;49502-0057-12
 ;;9002226.02101,"352,49502-0057-12 ",.02)
 ;;49502-0057-12
 ;;9002226.02101,"352,49502-0059-02 ",.01)
 ;;49502-0059-02
 ;;9002226.02101,"352,49502-0059-02 ",.02)
 ;;49502-0059-02
 ;;9002226.02101,"352,49502-0064-05 ",.01)
 ;;49502-0064-05
 ;;9002226.02101,"352,49502-0064-05 ",.02)
 ;;49502-0064-05
 ;;9002226.02101,"352,49502-0105-01 ",.01)
 ;;49502-0105-01
 ;;9002226.02101,"352,49502-0105-01 ",.02)
 ;;49502-0105-01
 ;;9002226.02101,"352,49502-0155-30 ",.01)
 ;;49502-0155-30
 ;;9002226.02101,"352,49502-0155-30 ",.02)
 ;;49502-0155-30
 ;;9002226.02101,"352,49502-0196-20 ",.01)
 ;;49502-0196-20
 ;;9002226.02101,"352,49502-0196-20 ",.02)
 ;;49502-0196-20
 ;;9002226.02101,"352,49502-0303-17 ",.01)
 ;;49502-0303-17
 ;;9002226.02101,"352,49502-0303-17 ",.02)
 ;;49502-0303-17
 ;;9002226.02101,"352,49502-0303-27 ",.01)
 ;;49502-0303-27
 ;;9002226.02101,"352,49502-0303-27 ",.02)
 ;;49502-0303-27
 ;;9002226.02101,"352,49502-0333-17 ",.01)
 ;;49502-0333-17
 ;;9002226.02101,"352,49502-0333-17 ",.02)
 ;;49502-0333-17
 ;;9002226.02101,"352,49502-0333-27 ",.01)
 ;;49502-0333-27
 ;;9002226.02101,"352,49502-0333-27 ",.02)
 ;;49502-0333-27
 ;;9002226.02101,"352,49502-0659-02 ",.01)
 ;;49502-0659-02
 ;;9002226.02101,"352,49502-0659-02 ",.02)
 ;;49502-0659-02
 ;;9002226.02101,"352,49502-0664-05 ",.01)
 ;;49502-0664-05
 ;;9002226.02101,"352,49502-0664-05 ",.02)
 ;;49502-0664-05
 ;;9002226.02101,"352,49502-0672-30 ",.01)
 ;;49502-0672-30
 ;;9002226.02101,"352,49502-0672-30 ",.02)
 ;;49502-0672-30
 ;;9002226.02101,"352,49502-0672-60 ",.01)
 ;;49502-0672-60
 ;;9002226.02101,"352,49502-0672-60 ",.02)
 ;;49502-0672-60
 ;;9002226.02101,"352,49502-0676-03 ",.01)
 ;;49502-0676-03
 ;;9002226.02101,"352,49502-0676-03 ",.02)
 ;;49502-0676-03
 ;;9002226.02101,"352,49502-0676-24 ",.01)
 ;;49502-0676-24
 ;;9002226.02101,"352,49502-0676-24 ",.02)
 ;;49502-0676-24
 ;;9002226.02101,"352,49502-0678-03 ",.01)
 ;;49502-0678-03
 ;;9002226.02101,"352,49502-0678-03 ",.02)
 ;;49502-0678-03
 ;;9002226.02101,"352,49502-0678-24 ",.01)
 ;;49502-0678-24
 ;;9002226.02101,"352,49502-0678-24 ",.02)
 ;;49502-0678-24
 ;;9002226.02101,"352,49502-0685-03 ",.01)
 ;;49502-0685-03
 ;;9002226.02101,"352,49502-0685-03 ",.02)
 ;;49502-0685-03
 ;;9002226.02101,"352,49502-0685-24 ",.01)
 ;;49502-0685-24
 ;;9002226.02101,"352,49502-0685-24 ",.02)
 ;;49502-0685-24
 ;;9002226.02101,"352,49502-0685-29 ",.01)
 ;;49502-0685-29
 ;;9002226.02101,"352,49502-0685-29 ",.02)
 ;;49502-0685-29
 ;;9002226.02101,"352,49502-0685-33 ",.01)
 ;;49502-0685-33
