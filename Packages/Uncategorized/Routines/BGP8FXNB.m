BGP8FXNB ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON SEP 28, 2007 ;
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
 ;;9002226.02101,"634,00115-3984-03 ",.01)
 ;;00115-3984-03
 ;;9002226.02101,"634,00115-3984-03 ",.02)
 ;;00115-3984-03
 ;;9002226.02101,"634,00115-3986-01 ",.01)
 ;;00115-3986-01
 ;;9002226.02101,"634,00115-3986-01 ",.02)
 ;;00115-3986-01
 ;;9002226.02101,"634,00115-3986-02 ",.01)
 ;;00115-3986-02
 ;;9002226.02101,"634,00115-3986-02 ",.02)
 ;;00115-3986-02
 ;;9002226.02101,"634,00115-3986-03 ",.01)
 ;;00115-3986-03
 ;;9002226.02101,"634,00115-3986-03 ",.02)
 ;;00115-3986-03
 ;;9002226.02101,"634,00115-4824-01 ",.01)
 ;;00115-4824-01
 ;;9002226.02101,"634,00115-4824-01 ",.02)
 ;;00115-4824-01
 ;;9002226.02101,"634,00115-4824-03 ",.01)
 ;;00115-4824-03
 ;;9002226.02101,"634,00115-4824-03 ",.02)
 ;;00115-4824-03
 ;;9002226.02101,"634,00115-4826-01 ",.01)
 ;;00115-4826-01
 ;;9002226.02101,"634,00115-4826-01 ",.02)
 ;;00115-4826-01
 ;;9002226.02101,"634,00115-4826-03 ",.01)
 ;;00115-4826-03
 ;;9002226.02101,"634,00115-4826-03 ",.02)
 ;;00115-4826-03
 ;;9002226.02101,"634,00115-7037-01 ",.01)
 ;;00115-7037-01
 ;;9002226.02101,"634,00115-7037-01 ",.02)
 ;;00115-7037-01
 ;;9002226.02101,"634,00115-7038-01 ",.01)
 ;;00115-7038-01
 ;;9002226.02101,"634,00115-7038-01 ",.02)
 ;;00115-7038-01
 ;;9002226.02101,"634,00149-0007-05 ",.01)
 ;;00149-0007-05
 ;;9002226.02101,"634,00149-0007-05 ",.02)
 ;;00149-0007-05
 ;;9002226.02101,"634,00149-0008-05 ",.01)
 ;;00149-0008-05
 ;;9002226.02101,"634,00149-0008-05 ",.02)
 ;;00149-0008-05
 ;;9002226.02101,"634,00149-0008-66 ",.01)
 ;;00149-0008-66
 ;;9002226.02101,"634,00149-0008-66 ",.02)
 ;;00149-0008-66
 ;;9002226.02101,"634,00149-0008-67 ",.01)
 ;;00149-0008-67
 ;;9002226.02101,"634,00149-0008-67 ",.02)
 ;;00149-0008-67
 ;;9002226.02101,"634,00149-0008-77 ",.01)
 ;;00149-0008-77
 ;;9002226.02101,"634,00149-0008-77 ",.02)
 ;;00149-0008-77
 ;;9002226.02101,"634,00149-0009-05 ",.01)
 ;;00149-0009-05
 ;;9002226.02101,"634,00149-0009-05 ",.02)
 ;;00149-0009-05
 ;;9002226.02101,"634,00149-0009-66 ",.01)
 ;;00149-0009-66
 ;;9002226.02101,"634,00149-0009-66 ",.02)
 ;;00149-0009-66
 ;;9002226.02101,"634,00149-0009-67 ",.01)
 ;;00149-0009-67
 ;;9002226.02101,"634,00149-0009-67 ",.02)
 ;;00149-0009-67
 ;;9002226.02101,"634,00149-0009-77 ",.01)
 ;;00149-0009-77
 ;;9002226.02101,"634,00149-0009-77 ",.02)
 ;;00149-0009-77
 ;;9002226.02101,"634,00149-0710-01 ",.01)
 ;;00149-0710-01
 ;;9002226.02101,"634,00149-0710-01 ",.02)
 ;;00149-0710-01
 ;;9002226.02101,"634,00149-0735-15 ",.01)
 ;;00149-0735-15
 ;;9002226.02101,"634,00149-0735-15 ",.02)
 ;;00149-0735-15
 ;;9002226.02101,"634,00149-0735-61 ",.01)
 ;;00149-0735-61
 ;;9002226.02101,"634,00149-0735-61 ",.02)
 ;;00149-0735-61
 ;;9002226.02101,"634,00172-2130-60 ",.01)
 ;;00172-2130-60
 ;;9002226.02101,"634,00172-2130-60 ",.02)
 ;;00172-2130-60
 ;;9002226.02101,"634,00172-2130-70 ",.01)
 ;;00172-2130-70
 ;;9002226.02101,"634,00172-2130-70 ",.02)
 ;;00172-2130-70
 ;;9002226.02101,"634,00172-2130-80 ",.01)
 ;;00172-2130-80
 ;;9002226.02101,"634,00172-2130-80 ",.02)
 ;;00172-2130-80
 ;;9002226.02101,"634,00172-2131-60 ",.01)
 ;;00172-2131-60
 ;;9002226.02101,"634,00172-2131-60 ",.02)
 ;;00172-2131-60
 ;;9002226.02101,"634,00172-2131-70 ",.01)
 ;;00172-2131-70
 ;;9002226.02101,"634,00172-2131-70 ",.02)
 ;;00172-2131-70
 ;;9002226.02101,"634,00172-2131-80 ",.01)
 ;;00172-2131-80
 ;;9002226.02101,"634,00172-2131-80 ",.02)
 ;;00172-2131-80
 ;;9002226.02101,"634,00182-0493-10 ",.01)
 ;;00182-0493-10
 ;;9002226.02101,"634,00182-0493-10 ",.02)
 ;;00182-0493-10
 ;;9002226.02101,"634,00182-0494-10 ",.01)
 ;;00182-0494-10
 ;;9002226.02101,"634,00182-0494-10 ",.02)
 ;;00182-0494-10
 ;;9002226.02101,"634,00182-1944-89 ",.01)
 ;;00182-1944-89
 ;;9002226.02101,"634,00182-1944-89 ",.02)
 ;;00182-1944-89
 ;;9002226.02101,"634,00182-1945-89 ",.01)
 ;;00182-1945-89
 ;;9002226.02101,"634,00182-1945-89 ",.02)
 ;;00182-1945-89
 ;;9002226.02101,"634,00185-0122-01 ",.01)
 ;;00185-0122-01
 ;;9002226.02101,"634,00185-0122-01 ",.02)
 ;;00185-0122-01
 ;;9002226.02101,"634,00185-0122-10 ",.01)
 ;;00185-0122-10
 ;;9002226.02101,"634,00185-0122-10 ",.02)
 ;;00185-0122-10
 ;;9002226.02101,"634,00187-0311-01 ",.01)
 ;;00187-0311-01
 ;;9002226.02101,"634,00187-0311-01 ",.02)
 ;;00187-0311-01
 ;;9002226.02101,"634,00187-0311-06 ",.01)
 ;;00187-0311-06
 ;;9002226.02101,"634,00187-0311-06 ",.02)
 ;;00187-0311-06
 ;;9002226.02101,"634,00187-0499-06 ",.01)
 ;;00187-0499-06
 ;;9002226.02101,"634,00187-0499-06 ",.02)
 ;;00187-0499-06
 ;;9002226.02101,"634,00187-0901-01 ",.01)
 ;;00187-0901-01
 ;;9002226.02101,"634,00187-0901-01 ",.02)
 ;;00187-0901-01
 ;;9002226.02101,"634,00187-0902-01 ",.01)
 ;;00187-0902-01
 ;;9002226.02101,"634,00187-0902-01 ",.02)
 ;;00187-0902-01
 ;;9002226.02101,"634,00223-2072-01 ",.01)
 ;;00223-2072-01
 ;;9002226.02101,"634,00223-2072-01 ",.02)
 ;;00223-2072-01
 ;;9002226.02101,"634,00223-2072-02 ",.01)
 ;;00223-2072-02
 ;;9002226.02101,"634,00223-2072-02 ",.02)
 ;;00223-2072-02
 ;;9002226.02101,"634,00223-2074-01 ",.01)
 ;;00223-2074-01
 ;;9002226.02101,"634,00223-2074-01 ",.02)
 ;;00223-2074-01
 ;;9002226.02101,"634,00223-2074-02 ",.01)
 ;;00223-2074-02
 ;;9002226.02101,"634,00223-2074-02 ",.02)
 ;;00223-2074-02
 ;;9002226.02101,"634,00223-2076-01 ",.01)
 ;;00223-2076-01
 ;;9002226.02101,"634,00223-2076-01 ",.02)
 ;;00223-2076-01
 ;;9002226.02101,"634,00223-2076-02 ",.01)
 ;;00223-2076-02
 ;;9002226.02101,"634,00223-2076-02 ",.02)
 ;;00223-2076-02
 ;;9002226.02101,"634,00247-0137-02 ",.01)
 ;;00247-0137-02
 ;;9002226.02101,"634,00247-0137-02 ",.02)
 ;;00247-0137-02
 ;;9002226.02101,"634,00247-0137-04 ",.01)
 ;;00247-0137-04
 ;;9002226.02101,"634,00247-0137-04 ",.02)
 ;;00247-0137-04
 ;;9002226.02101,"634,00247-0137-10 ",.01)
 ;;00247-0137-10
 ;;9002226.02101,"634,00247-0137-10 ",.02)
 ;;00247-0137-10
 ;;9002226.02101,"634,00247-0137-12 ",.01)
 ;;00247-0137-12
 ;;9002226.02101,"634,00247-0137-12 ",.02)
 ;;00247-0137-12
 ;;9002226.02101,"634,00247-0137-14 ",.01)
 ;;00247-0137-14
 ;;9002226.02101,"634,00247-0137-14 ",.02)
 ;;00247-0137-14
 ;;9002226.02101,"634,00247-0137-20 ",.01)
 ;;00247-0137-20
 ;;9002226.02101,"634,00247-0137-20 ",.02)
 ;;00247-0137-20
 ;;9002226.02101,"634,00247-0137-21 ",.01)
 ;;00247-0137-21
 ;;9002226.02101,"634,00247-0137-21 ",.02)
 ;;00247-0137-21
 ;;9002226.02101,"634,00247-0137-28 ",.01)
 ;;00247-0137-28
 ;;9002226.02101,"634,00247-0137-28 ",.02)
 ;;00247-0137-28
 ;;9002226.02101,"634,00247-0137-30 ",.01)
 ;;00247-0137-30
 ;;9002226.02101,"634,00247-0137-30 ",.02)
 ;;00247-0137-30
 ;;9002226.02101,"634,00247-0137-40 ",.01)
 ;;00247-0137-40
 ;;9002226.02101,"634,00247-0137-40 ",.02)
 ;;00247-0137-40
 ;;9002226.02101,"634,00247-0159-10 ",.01)
 ;;00247-0159-10
 ;;9002226.02101,"634,00247-0159-10 ",.02)
 ;;00247-0159-10
 ;;9002226.02101,"634,00247-0159-14 ",.01)
 ;;00247-0159-14
 ;;9002226.02101,"634,00247-0159-14 ",.02)
 ;;00247-0159-14
 ;;9002226.02101,"634,00247-0159-20 ",.01)
 ;;00247-0159-20
 ;;9002226.02101,"634,00247-0159-20 ",.02)
 ;;00247-0159-20
 ;;9002226.02101,"634,00247-0159-21 ",.01)
 ;;00247-0159-21
 ;;9002226.02101,"634,00247-0159-21 ",.02)
 ;;00247-0159-21
 ;;9002226.02101,"634,00247-0159-28 ",.01)
 ;;00247-0159-28
 ;;9002226.02101,"634,00247-0159-28 ",.02)
 ;;00247-0159-28
 ;;9002226.02101,"634,00247-0159-30 ",.01)
 ;;00247-0159-30
 ;;9002226.02101,"634,00247-0159-30 ",.02)
 ;;00247-0159-30
 ;;9002226.02101,"634,00247-0159-40 ",.01)
 ;;00247-0159-40
 ;;9002226.02101,"634,00247-0159-40 ",.02)
 ;;00247-0159-40
 ;;9002226.02101,"634,00247-0164-02 ",.01)
 ;;00247-0164-02
 ;;9002226.02101,"634,00247-0164-02 ",.02)
 ;;00247-0164-02
 ;;9002226.02101,"634,00247-0164-06 ",.01)
 ;;00247-0164-06
 ;;9002226.02101,"634,00247-0164-06 ",.02)
 ;;00247-0164-06
 ;;9002226.02101,"634,00247-0164-10 ",.01)
 ;;00247-0164-10
 ;;9002226.02101,"634,00247-0164-10 ",.02)
 ;;00247-0164-10
 ;;9002226.02101,"634,00247-0164-14 ",.01)
 ;;00247-0164-14
 ;;9002226.02101,"634,00247-0164-14 ",.02)
 ;;00247-0164-14
 ;;9002226.02101,"634,00247-0164-20 ",.01)
 ;;00247-0164-20
 ;;9002226.02101,"634,00247-0164-20 ",.02)
 ;;00247-0164-20
 ;;9002226.02101,"634,00247-0164-21 ",.01)
 ;;00247-0164-21
 ;;9002226.02101,"634,00247-0164-21 ",.02)
 ;;00247-0164-21
 ;;9002226.02101,"634,00247-0164-90 ",.01)
 ;;00247-0164-90
 ;;9002226.02101,"634,00247-0164-90 ",.02)
 ;;00247-0164-90
 ;;9002226.02101,"634,00247-0258-04 ",.01)
 ;;00247-0258-04
 ;;9002226.02101,"634,00247-0258-04 ",.02)
 ;;00247-0258-04
 ;;9002226.02101,"634,00247-0258-06 ",.01)
 ;;00247-0258-06
 ;;9002226.02101,"634,00247-0258-06 ",.02)
 ;;00247-0258-06
 ;;9002226.02101,"634,00247-0258-10 ",.01)
 ;;00247-0258-10
 ;;9002226.02101,"634,00247-0258-10 ",.02)
 ;;00247-0258-10
 ;;9002226.02101,"634,00247-0258-14 ",.01)
 ;;00247-0258-14
 ;;9002226.02101,"634,00247-0258-14 ",.02)
 ;;00247-0258-14
 ;;9002226.02101,"634,00247-0258-20 ",.01)
 ;;00247-0258-20
 ;;9002226.02101,"634,00247-0258-20 ",.02)
 ;;00247-0258-20
 ;;9002226.02101,"634,00247-0258-28 ",.01)
 ;;00247-0258-28
 ;;9002226.02101,"634,00247-0258-28 ",.02)
 ;;00247-0258-28
 ;;9002226.02101,"634,00247-0258-30 ",.01)
 ;;00247-0258-30
 ;;9002226.02101,"634,00247-0258-30 ",.02)
 ;;00247-0258-30
 ;;9002226.02101,"634,00247-0258-40 ",.01)
 ;;00247-0258-40
 ;;9002226.02101,"634,00247-0258-40 ",.02)
 ;;00247-0258-40
 ;;9002226.02101,"634,00247-0258-47 ",.01)
 ;;00247-0258-47
 ;;9002226.02101,"634,00247-0258-47 ",.02)
 ;;00247-0258-47
 ;;9002226.02101,"634,00247-0258-90 ",.01)
 ;;00247-0258-90
 ;;9002226.02101,"634,00247-0258-90 ",.02)
 ;;00247-0258-90
 ;;9002226.02101,"634,00378-1650-01 ",.01)
 ;;00378-1650-01
 ;;9002226.02101,"634,00378-1650-01 ",.02)
 ;;00378-1650-01
 ;;9002226.02101,"634,00378-1650-05 ",.01)
 ;;00378-1650-05
 ;;9002226.02101,"634,00378-1650-05 ",.02)
 ;;00378-1650-05
 ;;9002226.02101,"634,00378-1700-01 ",.01)
 ;;00378-1700-01
 ;;9002226.02101,"634,00378-1700-01 ",.02)
 ;;00378-1700-01
 ;;9002226.02101,"634,00378-1700-05 ",.01)
 ;;00378-1700-05
 ;;9002226.02101,"634,00378-1700-05 ",.02)
 ;;00378-1700-05
 ;;9002226.02101,"634,00378-3422-01 ",.01)
 ;;00378-3422-01
 ;;9002226.02101,"634,00378-3422-01 ",.02)
 ;;00378-3422-01
 ;;9002226.02101,"634,00405-4284-01 ",.01)
 ;;00405-4284-01
 ;;9002226.02101,"634,00405-4284-01 ",.02)
 ;;00405-4284-01
 ;;9002226.02101,"634,00405-4285-01 ",.01)
 ;;00405-4285-01
 ;;9002226.02101,"634,00405-4285-01 ",.02)
 ;;00405-4285-01
 ;;9002226.02101,"634,00405-4699-01 ",.01)
 ;;00405-4699-01
 ;;9002226.02101,"634,00405-4699-01 ",.02)
 ;;00405-4699-01
 ;;9002226.02101,"634,00405-4699-02 ",.01)
 ;;00405-4699-02
 ;;9002226.02101,"634,00405-4699-02 ",.02)
 ;;00405-4699-02
 ;;9002226.02101,"634,00405-4700-01 ",.01)
 ;;00405-4700-01
 ;;9002226.02101,"634,00405-4700-01 ",.02)
 ;;00405-4700-01
 ;;9002226.02101,"634,00456-0457-01 ",.01)
 ;;00456-0457-01
 ;;9002226.02101,"634,00456-0457-01 ",.02)
 ;;00456-0457-01
 ;;9002226.02101,"634,00456-0458-00 ",.01)
 ;;00456-0458-00
 ;;9002226.02101,"634,00456-0458-00 ",.02)
 ;;00456-0458-00
 ;;9002226.02101,"634,00456-0458-01 ",.01)
 ;;00456-0458-01
 ;;9002226.02101,"634,00456-0458-01 ",.02)
 ;;00456-0458-01
 ;;9002226.02101,"634,00456-0458-63 ",.01)
 ;;00456-0458-63
 ;;9002226.02101,"634,00456-0458-63 ",.02)
 ;;00456-0458-63
 ;;9002226.02101,"634,00456-0459-00 ",.01)
 ;;00456-0459-00
 ;;9002226.02101,"634,00456-0459-00 ",.02)
 ;;00456-0459-00
 ;;9002226.02101,"634,00456-0459-01 ",.01)
 ;;00456-0459-01
 ;;9002226.02101,"634,00456-0459-01 ",.02)
 ;;00456-0459-01
 ;;9002226.02101,"634,00456-0459-51 ",.01)
 ;;00456-0459-51
 ;;9002226.02101,"634,00456-0459-51 ",.02)
 ;;00456-0459-51
 ;;9002226.02101,"634,00456-0459-63 ",.01)
 ;;00456-0459-63
 ;;9002226.02101,"634,00456-0459-63 ",.02)
 ;;00456-0459-63
 ;;9002226.02101,"634,00456-0460-01 ",.01)
 ;;00456-0460-01
 ;;9002226.02101,"634,00456-0460-01 ",.02)
 ;;00456-0460-01
 ;;9002226.02101,"634,00456-0461-00 ",.01)
 ;;00456-0461-00
 ;;9002226.02101,"634,00456-0461-00 ",.02)
 ;;00456-0461-00
 ;;9002226.02101,"634,00456-0461-01 ",.01)
 ;;00456-0461-01
 ;;9002226.02101,"634,00456-0461-01 ",.02)
 ;;00456-0461-01
 ;;9002226.02101,"634,00456-0461-63 ",.01)
 ;;00456-0461-63
 ;;9002226.02101,"634,00456-0461-63 ",.02)
 ;;00456-0461-63
 ;;9002226.02101,"634,00456-0462-00 ",.01)
 ;;00456-0462-00
 ;;9002226.02101,"634,00456-0462-00 ",.02)
 ;;00456-0462-00
 ;;9002226.02101,"634,00456-0462-01 ",.01)
 ;;00456-0462-01
 ;;9002226.02101,"634,00456-0462-01 ",.02)
 ;;00456-0462-01
 ;;9002226.02101,"634,00456-0463-01 ",.01)
 ;;00456-0463-01
 ;;9002226.02101,"634,00456-0463-01 ",.02)
 ;;00456-0463-01
 ;;9002226.02101,"634,00456-0464-01 ",.01)
 ;;00456-0464-01
 ;;9002226.02101,"634,00456-0464-01 ",.02)
 ;;00456-0464-01
 ;;9002226.02101,"634,00463-6199-10 ",.01)
 ;;00463-6199-10
 ;;9002226.02101,"634,00463-6199-10 ",.02)
 ;;00463-6199-10
 ;;9002226.02101,"634,00463-6201-10 ",.01)
 ;;00463-6201-10
 ;;9002226.02101,"634,00463-6201-10 ",.02)
 ;;00463-6201-10
 ;;9002226.02101,"634,00463-6203-10 ",.01)
 ;;00463-6203-10
 ;;9002226.02101,"634,00463-6203-10 ",.02)
 ;;00463-6203-10
 ;;9002226.02101,"634,00536-4702-10 ",.01)
 ;;00536-4702-10
 ;;9002226.02101,"634,00536-4702-10 ",.02)
 ;;00536-4702-10
 ;;9002226.02101,"634,00536-5618-01 ",.01)
 ;;00536-5618-01
 ;;9002226.02101,"634,00536-5618-01 ",.02)
 ;;00536-5618-01
 ;;9002226.02101,"634,00536-5619-01 ",.01)
 ;;00536-5619-01
 ;;9002226.02101,"634,00536-5619-01 ",.02)
 ;;00536-5619-01
 ;;9002226.02101,"634,00591-3250-01 ",.01)
 ;;00591-3250-01
