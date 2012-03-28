BGP7LXGE ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON AUG 28, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"624,00140-0015-01 ",.02)
 ;;00140-0015-01
 ;;9002226.02101,"624,00140-0065-01 ",.01)
 ;;00140-0065-01
 ;;9002226.02101,"624,00140-0065-01 ",.02)
 ;;00140-0065-01
 ;;9002226.02101,"624,00140-0065-14 ",.01)
 ;;00140-0065-14
 ;;9002226.02101,"624,00140-0065-14 ",.02)
 ;;00140-0065-14
 ;;9002226.02101,"624,00140-0066-01 ",.01)
 ;;00140-0066-01
 ;;9002226.02101,"624,00140-0066-01 ",.02)
 ;;00140-0066-01
 ;;9002226.02101,"624,00140-0066-14 ",.01)
 ;;00140-0066-14
 ;;9002226.02101,"624,00140-0066-14 ",.02)
 ;;00140-0066-14
 ;;9002226.02101,"624,00140-0070-01 ",.01)
 ;;00140-0070-01
 ;;9002226.02101,"624,00140-0070-01 ",.02)
 ;;00140-0070-01
 ;;9002226.02101,"624,00140-0070-49 ",.01)
 ;;00140-0070-49
 ;;9002226.02101,"624,00140-0070-49 ",.02)
 ;;00140-0070-49
 ;;9002226.02101,"624,00140-0071-01 ",.01)
 ;;00140-0071-01
 ;;9002226.02101,"624,00140-0071-01 ",.02)
 ;;00140-0071-01
 ;;9002226.02101,"624,00140-0071-49 ",.01)
 ;;00140-0071-49
 ;;9002226.02101,"624,00140-0071-49 ",.02)
 ;;00140-0071-49
 ;;9002226.02101,"624,00140-1931-06 ",.01)
 ;;00140-1931-06
 ;;9002226.02101,"624,00140-1931-06 ",.02)
 ;;00140-1931-06
 ;;9002226.02101,"624,00140-1932-06 ",.01)
 ;;00140-1932-06
 ;;9002226.02101,"624,00140-1932-06 ",.02)
 ;;00140-1932-06
 ;;9002226.02101,"624,00140-1933-06 ",.01)
 ;;00140-1933-06
 ;;9002226.02101,"624,00140-1933-06 ",.02)
 ;;00140-1933-06
 ;;9002226.02101,"624,00143-1140-25 ",.01)
 ;;00143-1140-25
 ;;9002226.02101,"624,00143-1140-25 ",.02)
 ;;00143-1140-25
 ;;9002226.02101,"624,00143-3367-01 ",.01)
 ;;00143-3367-01
 ;;9002226.02101,"624,00143-3367-01 ",.02)
 ;;00143-3367-01
 ;;9002226.02101,"624,00143-3367-05 ",.01)
 ;;00143-3367-05
 ;;9002226.02101,"624,00143-3367-05 ",.02)
 ;;00143-3367-05
 ;;9002226.02101,"624,00143-3370-01 ",.01)
 ;;00143-3370-01
 ;;9002226.02101,"624,00143-3370-01 ",.02)
 ;;00143-3370-01
 ;;9002226.02101,"624,00143-3370-05 ",.01)
 ;;00143-3370-05
 ;;9002226.02101,"624,00143-3370-05 ",.02)
 ;;00143-3370-05
 ;;9002226.02101,"624,00172-3925-60 ",.01)
 ;;00172-3925-60
 ;;9002226.02101,"624,00172-3925-60 ",.02)
 ;;00172-3925-60
 ;;9002226.02101,"624,00172-3925-70 ",.01)
 ;;00172-3925-70
 ;;9002226.02101,"624,00172-3925-70 ",.02)
 ;;00172-3925-70
 ;;9002226.02101,"624,00172-3925-80 ",.01)
 ;;00172-3925-80
 ;;9002226.02101,"624,00172-3925-80 ",.02)
 ;;00172-3925-80
 ;;9002226.02101,"624,00172-3926-60 ",.01)
 ;;00172-3926-60
 ;;9002226.02101,"624,00172-3926-60 ",.02)
 ;;00172-3926-60
 ;;9002226.02101,"624,00172-3926-70 ",.01)
 ;;00172-3926-70
 ;;9002226.02101,"624,00172-3926-70 ",.02)
 ;;00172-3926-70
 ;;9002226.02101,"624,00172-3926-80 ",.01)
 ;;00172-3926-80
 ;;9002226.02101,"624,00172-3926-80 ",.02)
 ;;00172-3926-80
 ;;9002226.02101,"624,00172-3927-60 ",.01)
 ;;00172-3927-60
 ;;9002226.02101,"624,00172-3927-60 ",.02)
 ;;00172-3927-60
 ;;9002226.02101,"624,00172-3927-70 ",.01)
 ;;00172-3927-70
 ;;9002226.02101,"624,00172-3927-70 ",.02)
 ;;00172-3927-70
 ;;9002226.02101,"624,00172-3927-80 ",.01)
 ;;00172-3927-80
 ;;9002226.02101,"624,00172-3927-80 ",.02)
 ;;00172-3927-80
 ;;9002226.02101,"624,00182-0129-10 ",.01)
 ;;00182-0129-10
 ;;9002226.02101,"624,00182-0129-10 ",.02)
 ;;00182-0129-10
 ;;9002226.02101,"624,00182-0977-01 ",.01)
 ;;00182-0977-01
 ;;9002226.02101,"624,00182-0977-01 ",.02)
 ;;00182-0977-01
 ;;9002226.02101,"624,00182-0977-89 ",.01)
 ;;00182-0977-89
 ;;9002226.02101,"624,00182-0977-89 ",.02)
 ;;00182-0977-89
 ;;9002226.02101,"624,00182-0978-01 ",.01)
 ;;00182-0978-01
 ;;9002226.02101,"624,00182-0978-01 ",.02)
 ;;00182-0978-01
 ;;9002226.02101,"624,00182-0978-05 ",.01)
 ;;00182-0978-05
 ;;9002226.02101,"624,00182-0978-05 ",.02)
 ;;00182-0978-05
 ;;9002226.02101,"624,00182-0978-10 ",.01)
 ;;00182-0978-10
 ;;9002226.02101,"624,00182-0978-10 ",.02)
 ;;00182-0978-10
 ;;9002226.02101,"624,00182-0978-89 ",.01)
 ;;00182-0978-89
 ;;9002226.02101,"624,00182-0978-89 ",.02)
 ;;00182-0978-89
 ;;9002226.02101,"624,00182-0979-01 ",.01)
 ;;00182-0979-01
 ;;9002226.02101,"624,00182-0979-01 ",.02)
 ;;00182-0979-01
 ;;9002226.02101,"624,00182-0979-89 ",.01)
 ;;00182-0979-89
 ;;9002226.02101,"624,00182-0979-89 ",.02)
 ;;00182-0979-89
 ;;9002226.02101,"624,00182-1755-01 ",.01)
 ;;00182-1755-01
 ;;9002226.02101,"624,00182-1755-01 ",.02)
 ;;00182-1755-01
 ;;9002226.02101,"624,00182-1755-05 ",.01)
 ;;00182-1755-05
 ;;9002226.02101,"624,00182-1755-05 ",.02)
 ;;00182-1755-05
 ;;9002226.02101,"624,00182-1755-89 ",.01)
 ;;00182-1755-89
 ;;9002226.02101,"624,00182-1755-89 ",.02)
 ;;00182-1755-89
 ;;9002226.02101,"624,00182-1756-01 ",.01)
 ;;00182-1756-01
 ;;9002226.02101,"624,00182-1756-01 ",.02)
 ;;00182-1756-01
 ;;9002226.02101,"624,00182-1756-05 ",.01)
 ;;00182-1756-05
 ;;9002226.02101,"624,00182-1756-05 ",.02)
 ;;00182-1756-05
 ;;9002226.02101,"624,00182-1756-10 ",.01)
 ;;00182-1756-10
 ;;9002226.02101,"624,00182-1756-10 ",.02)
 ;;00182-1756-10
 ;;9002226.02101,"624,00182-1756-89 ",.01)
 ;;00182-1756-89
 ;;9002226.02101,"624,00182-1756-89 ",.02)
 ;;00182-1756-89
 ;;9002226.02101,"624,00182-1757-01 ",.01)
 ;;00182-1757-01
 ;;9002226.02101,"624,00182-1757-01 ",.02)
 ;;00182-1757-01
 ;;9002226.02101,"624,00182-1757-05 ",.01)
 ;;00182-1757-05
 ;;9002226.02101,"624,00182-1757-05 ",.02)
 ;;00182-1757-05
 ;;9002226.02101,"624,00182-1757-10 ",.01)
 ;;00182-1757-10
 ;;9002226.02101,"624,00182-1757-10 ",.02)
 ;;00182-1757-10
 ;;9002226.02101,"624,00182-1757-89 ",.01)
 ;;00182-1757-89
 ;;9002226.02101,"624,00182-1757-89 ",.02)
 ;;00182-1757-89
 ;;9002226.02101,"624,00182-1817-01 ",.01)
 ;;00182-1817-01
 ;;9002226.02101,"624,00182-1817-01 ",.02)
 ;;00182-1817-01
 ;;9002226.02101,"624,00182-1817-05 ",.01)
 ;;00182-1817-05
 ;;9002226.02101,"624,00182-1817-05 ",.02)
 ;;00182-1817-05
 ;;9002226.02101,"624,00182-1818-01 ",.01)
 ;;00182-1818-01
 ;;9002226.02101,"624,00182-1818-01 ",.02)
 ;;00182-1818-01
 ;;9002226.02101,"624,00182-1818-05 ",.01)
 ;;00182-1818-05
 ;;9002226.02101,"624,00182-1818-05 ",.02)
 ;;00182-1818-05
 ;;9002226.02101,"624,00182-2657-01 ",.01)
 ;;00182-2657-01
 ;;9002226.02101,"624,00182-2657-01 ",.02)
 ;;00182-2657-01
 ;;9002226.02101,"624,00187-3750-10 ",.01)
 ;;00187-3750-10
 ;;9002226.02101,"624,00187-3750-10 ",.02)
 ;;00187-3750-10
 ;;9002226.02101,"624,00187-3751-10 ",.01)
 ;;00187-3751-10
 ;;9002226.02101,"624,00187-3751-10 ",.02)
 ;;00187-3751-10
 ;;9002226.02101,"624,00187-3755-74 ",.01)
 ;;00187-3755-74
 ;;9002226.02101,"624,00187-3755-74 ",.02)
 ;;00187-3755-74
 ;;9002226.02101,"624,00187-3758-10 ",.01)
 ;;00187-3758-10
 ;;9002226.02101,"624,00187-3758-10 ",.02)
 ;;00187-3758-10
 ;;9002226.02101,"624,00187-3805-10 ",.01)
 ;;00187-3805-10
 ;;9002226.02101,"624,00187-3805-10 ",.02)
 ;;00187-3805-10
 ;;9002226.02101,"624,00187-3806-10 ",.01)
 ;;00187-3806-10
 ;;9002226.02101,"624,00187-3806-10 ",.02)
 ;;00187-3806-10
 ;;9002226.02101,"624,00187-4051-10 ",.01)
 ;;00187-4051-10
 ;;9002226.02101,"624,00187-4051-10 ",.02)
 ;;00187-4051-10
 ;;9002226.02101,"624,00187-4052-10 ",.01)
 ;;00187-4052-10
 ;;9002226.02101,"624,00187-4052-10 ",.02)
 ;;00187-4052-10
 ;;9002226.02101,"624,00223-2129-00 ",.01)
 ;;00223-2129-00
 ;;9002226.02101,"624,00223-2129-00 ",.02)
 ;;00223-2129-00
 ;;9002226.02101,"624,00223-2129-05 ",.01)
 ;;00223-2129-05
 ;;9002226.02101,"624,00223-2129-05 ",.02)
 ;;00223-2129-05
 ;;9002226.02101,"624,00223-2132-00 ",.01)
 ;;00223-2132-00
 ;;9002226.02101,"624,00223-2132-00 ",.02)
 ;;00223-2132-00
 ;;9002226.02101,"624,00223-2132-05 ",.01)
 ;;00223-2132-05
 ;;9002226.02101,"624,00223-2132-05 ",.02)
 ;;00223-2132-05
 ;;9002226.02101,"624,00223-2133-00 ",.01)
 ;;00223-2133-00
 ;;9002226.02101,"624,00223-2133-00 ",.02)
 ;;00223-2133-00
 ;;9002226.02101,"624,00223-2133-05 ",.01)
 ;;00223-2133-05
 ;;9002226.02101,"624,00223-2133-05 ",.02)
 ;;00223-2133-05
 ;;9002226.02101,"624,00223-2134-00 ",.01)
 ;;00223-2134-00
 ;;9002226.02101,"624,00223-2134-00 ",.02)
 ;;00223-2134-00
 ;;9002226.02101,"624,00223-2134-05 ",.01)
 ;;00223-2134-05
 ;;9002226.02101,"624,00223-2134-05 ",.02)
 ;;00223-2134-05
 ;;9002226.02101,"624,00223-6291-01 ",.01)
 ;;00223-6291-01
 ;;9002226.02101,"624,00223-6291-01 ",.02)
 ;;00223-6291-01
 ;;9002226.02101,"624,00223-6291-02 ",.01)
 ;;00223-6291-02
 ;;9002226.02101,"624,00223-6291-02 ",.02)
 ;;00223-6291-02
 ;;9002226.02101,"624,00223-7192-01 ",.01)
 ;;00223-7192-01
 ;;9002226.02101,"624,00223-7192-01 ",.02)
 ;;00223-7192-01
 ;;9002226.02101,"624,00223-7195-20 ",.01)
 ;;00223-7195-20
 ;;9002226.02101,"624,00223-7195-20 ",.02)
 ;;00223-7195-20
 ;;9002226.02101,"624,00223-7200-01 ",.01)
 ;;00223-7200-01
 ;;9002226.02101,"624,00223-7200-01 ",.02)
 ;;00223-7200-01
 ;;9002226.02101,"624,00223-7203-05 ",.01)
 ;;00223-7203-05
 ;;9002226.02101,"624,00223-7203-05 ",.02)
 ;;00223-7203-05
 ;;9002226.02101,"624,00223-8298-01 ",.01)
 ;;00223-8298-01
 ;;9002226.02101,"624,00223-8298-01 ",.02)
 ;;00223-8298-01
 ;;9002226.02101,"624,00223-8413-01 ",.01)
 ;;00223-8413-01
 ;;9002226.02101,"624,00223-8413-01 ",.02)
 ;;00223-8413-01
 ;;9002226.02101,"624,00228-2051-10 ",.01)
 ;;00228-2051-10
 ;;9002226.02101,"624,00228-2051-10 ",.02)
 ;;00228-2051-10
 ;;9002226.02101,"624,00228-2051-50 ",.01)
 ;;00228-2051-50
 ;;9002226.02101,"624,00228-2051-50 ",.02)
 ;;00228-2051-50
 ;;9002226.02101,"624,00228-2052-10 ",.01)
 ;;00228-2052-10
 ;;9002226.02101,"624,00228-2052-10 ",.02)
 ;;00228-2052-10
 ;;9002226.02101,"624,00228-2052-50 ",.01)
 ;;00228-2052-50
 ;;9002226.02101,"624,00228-2052-50 ",.02)
 ;;00228-2052-50
 ;;9002226.02101,"624,00228-2052-96 ",.01)
 ;;00228-2052-96
 ;;9002226.02101,"624,00228-2052-96 ",.02)
 ;;00228-2052-96
 ;;9002226.02101,"624,00228-2053-10 ",.01)
 ;;00228-2053-10
 ;;9002226.02101,"624,00228-2053-10 ",.02)
 ;;00228-2053-10
 ;;9002226.02101,"624,00228-2053-50 ",.01)
 ;;00228-2053-50
 ;;9002226.02101,"624,00228-2053-50 ",.02)
 ;;00228-2053-50
 ;;9002226.02101,"624,00228-2118-96 ",.01)
 ;;00228-2118-96
 ;;9002226.02101,"624,00228-2118-96 ",.02)
 ;;00228-2118-96
 ;;9002226.02101,"624,00228-2417-10 ",.01)
 ;;00228-2417-10
 ;;9002226.02101,"624,00228-2417-10 ",.02)
 ;;00228-2417-10
 ;;9002226.02101,"624,00247-0138-04 ",.01)
 ;;00247-0138-04
 ;;9002226.02101,"624,00247-0138-04 ",.02)
 ;;00247-0138-04
 ;;9002226.02101,"624,00247-0138-08 ",.01)
 ;;00247-0138-08
 ;;9002226.02101,"624,00247-0138-08 ",.02)
 ;;00247-0138-08
 ;;9002226.02101,"624,00247-0138-10 ",.01)
 ;;00247-0138-10
 ;;9002226.02101,"624,00247-0138-10 ",.02)
 ;;00247-0138-10
 ;;9002226.02101,"624,00247-0138-12 ",.01)
 ;;00247-0138-12
 ;;9002226.02101,"624,00247-0138-12 ",.02)
 ;;00247-0138-12
 ;;9002226.02101,"624,00247-0138-15 ",.01)
 ;;00247-0138-15
 ;;9002226.02101,"624,00247-0138-15 ",.02)
 ;;00247-0138-15
 ;;9002226.02101,"624,00247-0138-16 ",.01)
 ;;00247-0138-16
 ;;9002226.02101,"624,00247-0138-16 ",.02)
 ;;00247-0138-16
 ;;9002226.02101,"624,00247-0138-20 ",.01)
 ;;00247-0138-20
 ;;9002226.02101,"624,00247-0138-20 ",.02)
 ;;00247-0138-20
 ;;9002226.02101,"624,00247-0138-24 ",.01)
 ;;00247-0138-24
 ;;9002226.02101,"624,00247-0138-24 ",.02)
 ;;00247-0138-24
 ;;9002226.02101,"624,00247-0138-28 ",.01)
 ;;00247-0138-28
 ;;9002226.02101,"624,00247-0138-28 ",.02)
 ;;00247-0138-28
 ;;9002226.02101,"624,00247-0138-30 ",.01)
 ;;00247-0138-30
 ;;9002226.02101,"624,00247-0138-30 ",.02)
 ;;00247-0138-30
 ;;9002226.02101,"624,00247-0138-40 ",.01)
 ;;00247-0138-40
 ;;9002226.02101,"624,00247-0138-40 ",.02)
 ;;00247-0138-40
 ;;9002226.02101,"624,00247-0187-00 ",.01)
 ;;00247-0187-00
 ;;9002226.02101,"624,00247-0187-00 ",.02)
 ;;00247-0187-00
 ;;9002226.02101,"624,00247-0187-02 ",.01)
 ;;00247-0187-02
 ;;9002226.02101,"624,00247-0187-02 ",.02)
 ;;00247-0187-02
 ;;9002226.02101,"624,00247-0187-03 ",.01)
 ;;00247-0187-03
 ;;9002226.02101,"624,00247-0187-03 ",.02)
 ;;00247-0187-03
 ;;9002226.02101,"624,00247-0187-04 ",.01)
 ;;00247-0187-04
 ;;9002226.02101,"624,00247-0187-04 ",.02)
 ;;00247-0187-04
 ;;9002226.02101,"624,00247-0187-06 ",.01)
 ;;00247-0187-06
 ;;9002226.02101,"624,00247-0187-06 ",.02)
 ;;00247-0187-06
 ;;9002226.02101,"624,00247-0187-07 ",.01)
 ;;00247-0187-07
 ;;9002226.02101,"624,00247-0187-07 ",.02)
 ;;00247-0187-07
 ;;9002226.02101,"624,00247-0187-10 ",.01)
 ;;00247-0187-10
 ;;9002226.02101,"624,00247-0187-10 ",.02)
 ;;00247-0187-10
 ;;9002226.02101,"624,00247-0187-12 ",.01)
 ;;00247-0187-12
 ;;9002226.02101,"624,00247-0187-12 ",.02)
 ;;00247-0187-12
 ;;9002226.02101,"624,00247-0187-14 ",.01)
 ;;00247-0187-14
 ;;9002226.02101,"624,00247-0187-14 ",.02)
 ;;00247-0187-14
 ;;9002226.02101,"624,00247-0187-15 ",.01)
 ;;00247-0187-15
 ;;9002226.02101,"624,00247-0187-15 ",.02)
 ;;00247-0187-15
 ;;9002226.02101,"624,00247-0187-20 ",.01)
 ;;00247-0187-20
 ;;9002226.02101,"624,00247-0187-20 ",.02)
 ;;00247-0187-20
 ;;9002226.02101,"624,00247-0187-21 ",.01)
 ;;00247-0187-21
 ;;9002226.02101,"624,00247-0187-21 ",.02)
 ;;00247-0187-21
 ;;9002226.02101,"624,00247-0187-28 ",.01)
 ;;00247-0187-28
 ;;9002226.02101,"624,00247-0187-28 ",.02)
 ;;00247-0187-28
 ;;9002226.02101,"624,00247-0187-30 ",.01)
 ;;00247-0187-30
 ;;9002226.02101,"624,00247-0187-30 ",.02)
 ;;00247-0187-30
 ;;9002226.02101,"624,00247-0187-50 ",.01)
 ;;00247-0187-50
 ;;9002226.02101,"624,00247-0187-50 ",.02)
 ;;00247-0187-50
 ;;9002226.02101,"624,00247-0187-60 ",.01)
 ;;00247-0187-60
 ;;9002226.02101,"624,00247-0187-60 ",.02)
 ;;00247-0187-60
 ;;9002226.02101,"624,00247-0187-98 ",.01)
 ;;00247-0187-98
