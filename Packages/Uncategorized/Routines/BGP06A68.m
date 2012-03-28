BGP06A68 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"974,63874-0238-40 ",.01)
 ;;63874-0238-40
 ;;9002226.02101,"974,63874-0238-40 ",.02)
 ;;63874-0238-40
 ;;9002226.02101,"974,63874-0239-01 ",.01)
 ;;63874-0239-01
 ;;9002226.02101,"974,63874-0239-01 ",.02)
 ;;63874-0239-01
 ;;9002226.02101,"974,63874-0239-20 ",.01)
 ;;63874-0239-20
 ;;9002226.02101,"974,63874-0239-20 ",.02)
 ;;63874-0239-20
 ;;9002226.02101,"974,63874-0239-30 ",.01)
 ;;63874-0239-30
 ;;9002226.02101,"974,63874-0239-30 ",.02)
 ;;63874-0239-30
 ;;9002226.02101,"974,63874-0240-01 ",.01)
 ;;63874-0240-01
 ;;9002226.02101,"974,63874-0240-01 ",.02)
 ;;63874-0240-01
 ;;9002226.02101,"974,63874-0240-20 ",.01)
 ;;63874-0240-20
 ;;9002226.02101,"974,63874-0240-20 ",.02)
 ;;63874-0240-20
 ;;9002226.02101,"974,63874-0240-30 ",.01)
 ;;63874-0240-30
 ;;9002226.02101,"974,63874-0240-30 ",.02)
 ;;63874-0240-30
 ;;9002226.02101,"974,63874-0240-50 ",.01)
 ;;63874-0240-50
 ;;9002226.02101,"974,63874-0240-50 ",.02)
 ;;63874-0240-50
 ;;9002226.02101,"974,63874-0246-04 ",.01)
 ;;63874-0246-04
 ;;9002226.02101,"974,63874-0246-04 ",.02)
 ;;63874-0246-04
 ;;9002226.02101,"974,63874-0246-06 ",.01)
 ;;63874-0246-06
 ;;9002226.02101,"974,63874-0246-06 ",.02)
 ;;63874-0246-06
 ;;9002226.02101,"974,63874-0246-10 ",.01)
 ;;63874-0246-10
 ;;9002226.02101,"974,63874-0246-10 ",.02)
 ;;63874-0246-10
 ;;9002226.02101,"974,63874-0246-15 ",.01)
 ;;63874-0246-15
 ;;9002226.02101,"974,63874-0246-15 ",.02)
 ;;63874-0246-15
 ;;9002226.02101,"974,63874-0249-10 ",.01)
 ;;63874-0249-10
 ;;9002226.02101,"974,63874-0249-10 ",.02)
 ;;63874-0249-10
 ;;9002226.02101,"974,63874-0249-20 ",.01)
 ;;63874-0249-20
 ;;9002226.02101,"974,63874-0249-20 ",.02)
 ;;63874-0249-20
 ;;9002226.02101,"974,63874-0249-30 ",.01)
 ;;63874-0249-30
 ;;9002226.02101,"974,63874-0249-30 ",.02)
 ;;63874-0249-30
 ;;9002226.02101,"974,63874-0533-01 ",.01)
 ;;63874-0533-01
 ;;9002226.02101,"974,63874-0533-01 ",.02)
 ;;63874-0533-01
 ;;9002226.02101,"974,63874-0533-04 ",.01)
 ;;63874-0533-04
 ;;9002226.02101,"974,63874-0533-04 ",.02)
 ;;63874-0533-04
 ;;9002226.02101,"974,63874-0533-10 ",.01)
 ;;63874-0533-10
 ;;9002226.02101,"974,63874-0533-10 ",.02)
 ;;63874-0533-10
 ;;9002226.02101,"974,63874-0533-12 ",.01)
 ;;63874-0533-12
 ;;9002226.02101,"974,63874-0533-12 ",.02)
 ;;63874-0533-12
 ;;9002226.02101,"974,63874-0533-14 ",.01)
 ;;63874-0533-14
 ;;9002226.02101,"974,63874-0533-14 ",.02)
 ;;63874-0533-14
 ;;9002226.02101,"974,63874-0533-15 ",.01)
 ;;63874-0533-15
 ;;9002226.02101,"974,63874-0533-15 ",.02)
 ;;63874-0533-15
 ;;9002226.02101,"974,63874-0533-20 ",.01)
 ;;63874-0533-20
 ;;9002226.02101,"974,63874-0533-20 ",.02)
 ;;63874-0533-20
 ;;9002226.02101,"974,63874-0533-25 ",.01)
 ;;63874-0533-25
 ;;9002226.02101,"974,63874-0533-25 ",.02)
 ;;63874-0533-25
 ;;9002226.02101,"974,63874-0533-28 ",.01)
 ;;63874-0533-28
 ;;9002226.02101,"974,63874-0533-28 ",.02)
 ;;63874-0533-28
 ;;9002226.02101,"974,63874-0533-30 ",.01)
 ;;63874-0533-30
 ;;9002226.02101,"974,63874-0533-30 ",.02)
 ;;63874-0533-30
 ;;9002226.02101,"974,63874-0533-40 ",.01)
 ;;63874-0533-40
 ;;9002226.02101,"974,63874-0533-40 ",.02)
 ;;63874-0533-40
 ;;9002226.02101,"974,63874-0533-60 ",.01)
 ;;63874-0533-60
 ;;9002226.02101,"974,63874-0533-60 ",.02)
 ;;63874-0533-60
 ;;9002226.02101,"974,63874-0533-72 ",.01)
 ;;63874-0533-72
 ;;9002226.02101,"974,63874-0533-72 ",.02)
 ;;63874-0533-72
 ;;9002226.02101,"974,63874-0533-74 ",.01)
 ;;63874-0533-74
 ;;9002226.02101,"974,63874-0533-74 ",.02)
 ;;63874-0533-74
 ;;9002226.02101,"974,63874-0533-77 ",.01)
 ;;63874-0533-77
 ;;9002226.02101,"974,63874-0533-77 ",.02)
 ;;63874-0533-77
 ;;9002226.02101,"974,63874-0533-90 ",.01)
 ;;63874-0533-90
 ;;9002226.02101,"974,63874-0533-90 ",.02)
 ;;63874-0533-90
 ;;9002226.02101,"974,63874-1086-01 ",.01)
 ;;63874-1086-01
 ;;9002226.02101,"974,63874-1086-01 ",.02)
 ;;63874-1086-01
 ;;9002226.02101,"974,63874-1086-02 ",.01)
 ;;63874-1086-02
 ;;9002226.02101,"974,63874-1086-02 ",.02)
 ;;63874-1086-02
 ;;9002226.02101,"974,63874-1086-03 ",.01)
 ;;63874-1086-03
 ;;9002226.02101,"974,63874-1086-03 ",.02)
 ;;63874-1086-03
 ;;9002226.02101,"974,63874-1086-04 ",.01)
 ;;63874-1086-04
 ;;9002226.02101,"974,63874-1086-04 ",.02)
 ;;63874-1086-04
 ;;9002226.02101,"974,63874-1086-05 ",.01)
 ;;63874-1086-05
 ;;9002226.02101,"974,63874-1086-05 ",.02)
 ;;63874-1086-05
 ;;9002226.02101,"974,63874-1086-06 ",.01)
 ;;63874-1086-06
 ;;9002226.02101,"974,63874-1086-06 ",.02)
 ;;63874-1086-06
 ;;9002226.02101,"974,63874-1112-02 ",.01)
 ;;63874-1112-02
 ;;9002226.02101,"974,63874-1112-02 ",.02)
 ;;63874-1112-02
 ;;9002226.02101,"974,64248-0004-10 ",.01)
 ;;64248-0004-10
 ;;9002226.02101,"974,64248-0004-10 ",.02)
 ;;64248-0004-10
 ;;9002226.02101,"974,64248-0117-10 ",.01)
 ;;64248-0117-10
 ;;9002226.02101,"974,64248-0117-10 ",.02)
 ;;64248-0117-10
 ;;9002226.02101,"974,64455-0691-01 ",.01)
 ;;64455-0691-01
 ;;9002226.02101,"974,64455-0691-01 ",.02)
 ;;64455-0691-01
 ;;9002226.02101,"974,64455-0691-02 ",.01)
 ;;64455-0691-02
 ;;9002226.02101,"974,64455-0691-02 ",.02)
 ;;64455-0691-02
 ;;9002226.02101,"974,64455-0777-01 ",.01)
 ;;64455-0777-01
 ;;9002226.02101,"974,64455-0777-01 ",.02)
 ;;64455-0777-01
 ;;9002226.02101,"974,64455-0777-02 ",.01)
 ;;64455-0777-02
 ;;9002226.02101,"974,64455-0777-02 ",.02)
 ;;64455-0777-02
 ;;9002226.02101,"974,64455-0777-03 ",.01)
 ;;64455-0777-03
 ;;9002226.02101,"974,64455-0777-03 ",.02)
 ;;64455-0777-03
 ;;9002226.02101,"974,64455-0777-04 ",.01)
 ;;64455-0777-04
 ;;9002226.02101,"974,64455-0777-04 ",.02)
 ;;64455-0777-04
 ;;9002226.02101,"974,64679-0921-01 ",.01)
 ;;64679-0921-01
 ;;9002226.02101,"974,64679-0921-01 ",.02)
 ;;64679-0921-01
 ;;9002226.02101,"974,64679-0921-02 ",.01)
 ;;64679-0921-02
 ;;9002226.02101,"974,64679-0921-02 ",.02)
 ;;64679-0921-02
 ;;9002226.02101,"974,64679-0922-01 ",.01)
 ;;64679-0922-01
 ;;9002226.02101,"974,64679-0922-01 ",.02)
 ;;64679-0922-01
 ;;9002226.02101,"974,64679-0922-02 ",.01)
 ;;64679-0922-02
 ;;9002226.02101,"974,64679-0922-02 ",.02)
 ;;64679-0922-02
 ;;9002226.02101,"974,64682-0008-02 ",.01)
 ;;64682-0008-02
 ;;9002226.02101,"974,64682-0008-02 ",.02)
 ;;64682-0008-02
 ;;9002226.02101,"974,64682-0009-01 ",.01)
 ;;64682-0009-01
 ;;9002226.02101,"974,64682-0009-01 ",.02)
 ;;64682-0009-01
 ;;9002226.02101,"974,64860-0104-07 ",.01)
 ;;64860-0104-07
 ;;9002226.02101,"974,64860-0104-07 ",.02)
 ;;64860-0104-07
 ;;9002226.02101,"974,64860-0104-08 ",.01)
 ;;64860-0104-08
 ;;9002226.02101,"974,64860-0104-08 ",.02)
 ;;64860-0104-08
 ;;9002226.02101,"974,64860-0105-07 ",.01)
 ;;64860-0105-07
 ;;9002226.02101,"974,64860-0105-07 ",.02)
 ;;64860-0105-07
 ;;9002226.02101,"974,64860-0105-08 ",.01)
 ;;64860-0105-08
 ;;9002226.02101,"974,64860-0105-08 ",.02)
 ;;64860-0105-08
 ;;9002226.02101,"974,64860-0306-13 ",.01)
 ;;64860-0306-13
 ;;9002226.02101,"974,64860-0306-13 ",.02)
 ;;64860-0306-13
 ;;9002226.02101,"974,64860-0306-40 ",.01)
 ;;64860-0306-40
 ;;9002226.02101,"974,64860-0306-40 ",.02)
 ;;64860-0306-40
 ;;9002226.02101,"974,64860-0307-13 ",.01)
 ;;64860-0307-13
 ;;9002226.02101,"974,64860-0307-13 ",.02)
 ;;64860-0307-13
 ;;9002226.02101,"974,64860-0307-40 ",.01)
 ;;64860-0307-40
 ;;9002226.02101,"974,64860-0307-40 ",.02)
 ;;64860-0307-40
 ;;9002226.02101,"974,65162-0313-01 ",.01)
 ;;65162-0313-01
 ;;9002226.02101,"974,65162-0313-01 ",.02)
 ;;65162-0313-01
 ;;9002226.02101,"974,65162-0313-02 ",.01)
 ;;65162-0313-02
 ;;9002226.02101,"974,65162-0313-02 ",.02)
 ;;65162-0313-02
 ;;9002226.02101,"974,65162-0313-08 ",.01)
 ;;65162-0313-08
 ;;9002226.02101,"974,65162-0313-08 ",.02)
 ;;65162-0313-08
 ;;9002226.02101,"974,65162-0313-14 ",.01)
 ;;65162-0313-14
 ;;9002226.02101,"974,65162-0313-14 ",.02)
 ;;65162-0313-14
 ;;9002226.02101,"974,65162-0527-05 ",.01)
 ;;65162-0527-05
 ;;9002226.02101,"974,65162-0527-05 ",.02)
 ;;65162-0527-05
 ;;9002226.02101,"974,65162-0527-14 ",.01)
 ;;65162-0527-14
 ;;9002226.02101,"974,65162-0527-14 ",.02)
 ;;65162-0527-14
 ;;9002226.02101,"974,65162-0527-28 ",.01)
 ;;65162-0527-28
 ;;9002226.02101,"974,65162-0527-28 ",.02)
 ;;65162-0527-28
 ;;9002226.02101,"974,65162-0527-50 ",.01)
 ;;65162-0527-50
 ;;9002226.02101,"974,65162-0527-50 ",.02)
 ;;65162-0527-50
 ;;9002226.02101,"974,65862-0034-20 ",.01)
 ;;65862-0034-20
 ;;9002226.02101,"974,65862-0034-20 ",.02)
 ;;65862-0034-20
 ;;9002226.02101,"974,65939-0387-00 ",.01)
 ;;65939-0387-00
 ;;9002226.02101,"974,65939-0387-00 ",.02)
 ;;65939-0387-00
 ;;9002226.02101,"974,65939-0387-01 ",.01)
 ;;65939-0387-01
 ;;9002226.02101,"974,65939-0387-01 ",.02)
 ;;65939-0387-01
 ;;9002226.02101,"974,65939-0387-42 ",.01)
 ;;65939-0387-42
 ;;9002226.02101,"974,65939-0387-42 ",.02)
 ;;65939-0387-42
 ;;9002226.02101,"974,65939-0394-00 ",.01)
 ;;65939-0394-00
 ;;9002226.02101,"974,65939-0394-00 ",.02)
 ;;65939-0394-00
 ;;9002226.02101,"974,65939-0394-01 ",.01)
 ;;65939-0394-01
 ;;9002226.02101,"974,65939-0394-01 ",.02)
 ;;65939-0394-01
 ;;9002226.02101,"974,65939-0394-42 ",.01)
 ;;65939-0394-42
 ;;9002226.02101,"974,65939-0394-42 ",.02)
 ;;65939-0394-42
 ;;9002226.02101,"974,65939-0395-01 ",.01)
 ;;65939-0395-01
 ;;9002226.02101,"974,65939-0395-01 ",.02)
 ;;65939-0395-01
 ;;9002226.02101,"974,65939-0406-00 ",.01)
 ;;65939-0406-00
 ;;9002226.02101,"974,65939-0406-00 ",.02)
 ;;65939-0406-00
 ;;9002226.02101,"974,65939-0554-00 ",.01)
 ;;65939-0554-00
 ;;9002226.02101,"974,65939-0554-00 ",.02)
 ;;65939-0554-00
 ;;9002226.02101,"974,65939-0555-00 ",.01)
 ;;65939-0555-00
 ;;9002226.02101,"974,65939-0555-00 ",.02)
 ;;65939-0555-00
 ;;9002226.02101,"974,66116-0221-10 ",.01)
 ;;66116-0221-10
 ;;9002226.02101,"974,66116-0221-10 ",.02)
 ;;66116-0221-10
 ;;9002226.02101,"974,66116-0221-14 ",.01)
 ;;66116-0221-14
 ;;9002226.02101,"974,66116-0221-14 ",.02)
 ;;66116-0221-14
 ;;9002226.02101,"974,66116-0221-20 ",.01)
 ;;66116-0221-20
 ;;9002226.02101,"974,66116-0221-20 ",.02)
 ;;66116-0221-20
 ;;9002226.02101,"974,66116-0221-28 ",.01)
 ;;66116-0221-28
 ;;9002226.02101,"974,66116-0221-28 ",.02)
 ;;66116-0221-28
 ;;9002226.02101,"974,66116-0240-30 ",.01)
 ;;66116-0240-30
 ;;9002226.02101,"974,66116-0240-30 ",.02)
 ;;66116-0240-30
 ;;9002226.02101,"974,66116-0243-30 ",.01)
 ;;66116-0243-30
 ;;9002226.02101,"974,66116-0243-30 ",.02)
 ;;66116-0243-30
 ;;9002226.02101,"974,66116-0244-40 ",.01)
 ;;66116-0244-40
 ;;9002226.02101,"974,66116-0244-40 ",.02)
 ;;66116-0244-40
 ;;9002226.02101,"974,66116-0249-28 ",.01)
 ;;66116-0249-28
 ;;9002226.02101,"974,66116-0249-28 ",.02)
 ;;66116-0249-28
 ;;9002226.02101,"974,66116-0255-28 ",.01)
 ;;66116-0255-28
 ;;9002226.02101,"974,66116-0255-28 ",.02)
 ;;66116-0255-28
 ;;9002226.02101,"974,66116-0255-40 ",.01)
 ;;66116-0255-40
 ;;9002226.02101,"974,66116-0255-40 ",.02)
 ;;66116-0255-40
 ;;9002226.02101,"974,66116-0262-30 ",.01)
 ;;66116-0262-30
 ;;9002226.02101,"974,66116-0262-30 ",.02)
 ;;66116-0262-30
 ;;9002226.02101,"974,66116-0272-30 ",.01)
 ;;66116-0272-30
 ;;9002226.02101,"974,66116-0272-30 ",.02)
 ;;66116-0272-30
 ;;9002226.02101,"974,66116-0274-60 ",.01)
 ;;66116-0274-60
 ;;9002226.02101,"974,66116-0274-60 ",.02)
 ;;66116-0274-60
 ;;9002226.02101,"974,66116-0275-10 ",.01)
 ;;66116-0275-10
 ;;9002226.02101,"974,66116-0275-10 ",.02)
 ;;66116-0275-10
 ;;9002226.02101,"974,66116-0289-30 ",.01)
 ;;66116-0289-30
 ;;9002226.02101,"974,66116-0289-30 ",.02)
 ;;66116-0289-30
 ;;9002226.02101,"974,66116-0301-20 ",.01)
 ;;66116-0301-20
 ;;9002226.02101,"974,66116-0301-20 ",.02)
 ;;66116-0301-20
 ;;9002226.02101,"974,66267-0021-21 ",.01)
 ;;66267-0021-21
 ;;9002226.02101,"974,66267-0021-21 ",.02)
 ;;66267-0021-21
 ;;9002226.02101,"974,66267-0021-30 ",.01)
 ;;66267-0021-30
 ;;9002226.02101,"974,66267-0021-30 ",.02)
 ;;66267-0021-30
 ;;9002226.02101,"974,66267-0022-30 ",.01)
 ;;66267-0022-30
 ;;9002226.02101,"974,66267-0022-30 ",.02)
 ;;66267-0022-30
 ;;9002226.02101,"974,66267-0023-21 ",.01)
 ;;66267-0023-21
 ;;9002226.02101,"974,66267-0023-21 ",.02)
 ;;66267-0023-21
 ;;9002226.02101,"974,66267-0023-30 ",.01)
 ;;66267-0023-30
 ;;9002226.02101,"974,66267-0023-30 ",.02)
 ;;66267-0023-30
 ;;9002226.02101,"974,66267-0023-40 ",.01)
 ;;66267-0023-40
 ;;9002226.02101,"974,66267-0023-40 ",.02)
 ;;66267-0023-40
 ;;9002226.02101,"974,66267-0045-10 ",.01)
 ;;66267-0045-10
 ;;9002226.02101,"974,66267-0045-10 ",.02)
 ;;66267-0045-10
 ;;9002226.02101,"974,66267-0045-20 ",.01)
 ;;66267-0045-20
 ;;9002226.02101,"974,66267-0045-20 ",.02)
 ;;66267-0045-20
 ;;9002226.02101,"974,66267-0045-24 ",.01)
 ;;66267-0045-24
 ;;9002226.02101,"974,66267-0045-24 ",.02)
 ;;66267-0045-24
 ;;9002226.02101,"974,66267-0049-12 ",.01)
 ;;66267-0049-12
 ;;9002226.02101,"974,66267-0049-12 ",.02)
 ;;66267-0049-12
 ;;9002226.02101,"974,66267-0049-20 ",.01)
 ;;66267-0049-20
 ;;9002226.02101,"974,66267-0049-20 ",.02)
 ;;66267-0049-20
 ;;9002226.02101,"974,66267-0049-28 ",.01)
 ;;66267-0049-28
 ;;9002226.02101,"974,66267-0049-28 ",.02)
 ;;66267-0049-28
 ;;9002226.02101,"974,66267-0049-30 ",.01)
 ;;66267-0049-30
 ;;9002226.02101,"974,66267-0049-30 ",.02)
 ;;66267-0049-30
 ;;9002226.02101,"974,66267-0049-40 ",.01)
 ;;66267-0049-40
 ;;9002226.02101,"974,66267-0049-40 ",.02)
 ;;66267-0049-40
 ;;9002226.02101,"974,66267-0050-10 ",.01)
 ;;66267-0050-10
 ;;9002226.02101,"974,66267-0050-10 ",.02)
 ;;66267-0050-10
 ;;9002226.02101,"974,66267-0050-14 ",.01)
 ;;66267-0050-14
 ;;9002226.02101,"974,66267-0050-14 ",.02)
 ;;66267-0050-14
