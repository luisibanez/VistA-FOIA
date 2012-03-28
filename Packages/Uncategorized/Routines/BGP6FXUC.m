BGP6FXUC ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON DEC 12, 2005 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;;;BGP6;;DEC 12, 2005
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"563,00046-1104-91 ",.01)
 ;;00046-1104-91
 ;;9002226.02101,"563,00046-1104-91 ",.02)
 ;;00046-1104-91
 ;;9002226.02101,"563,00046-2572-01 ",.01)
 ;;00046-2572-01
 ;;9002226.02101,"563,00046-2572-01 ",.02)
 ;;00046-2572-01
 ;;9002226.02101,"563,00046-2573-01 ",.01)
 ;;00046-2573-01
 ;;9002226.02101,"563,00046-2573-01 ",.02)
 ;;00046-2573-01
 ;;9002226.02101,"563,00046-2573-02 ",.01)
 ;;00046-2573-02
 ;;9002226.02101,"563,00046-2573-02 ",.02)
 ;;00046-2573-02
 ;;9002226.02101,"563,00046-2573-05 ",.01)
 ;;00046-2573-05
 ;;9002226.02101,"563,00046-2573-05 ",.02)
 ;;00046-2573-05
 ;;9002226.02101,"563,00046-2573-06 ",.01)
 ;;00046-2573-06
 ;;9002226.02101,"563,00046-2573-06 ",.02)
 ;;00046-2573-06
 ;;9002226.02101,"563,00046-3867-81 ",.01)
 ;;00046-3867-81
 ;;9002226.02101,"563,00046-3867-81 ",.02)
 ;;00046-3867-81
 ;;9002226.02101,"563,00062-1800-01 ",.01)
 ;;00062-1800-01
 ;;9002226.02101,"563,00062-1800-01 ",.02)
 ;;00062-1800-01
 ;;9002226.02101,"563,00062-1801-01 ",.01)
 ;;00062-1801-01
 ;;9002226.02101,"563,00062-1801-01 ",.02)
 ;;00062-1801-01
 ;;9002226.02101,"563,00062-1840-01 ",.01)
 ;;00062-1840-01
 ;;9002226.02101,"563,00062-1840-01 ",.02)
 ;;00062-1840-01
 ;;9002226.02101,"563,00062-1840-15 ",.01)
 ;;00062-1840-15
 ;;9002226.02101,"563,00062-1840-15 ",.02)
 ;;00062-1840-15
 ;;9002226.02101,"563,00070-4492-01 ",.01)
 ;;00070-4492-01
 ;;9002226.02101,"563,00070-4492-01 ",.02)
 ;;00070-4492-01
 ;;9002226.02101,"563,00071-0144-23 ",.01)
 ;;00071-0144-23
 ;;9002226.02101,"563,00071-0144-23 ",.02)
 ;;00071-0144-23
 ;;9002226.02101,"563,00071-0144-45 ",.01)
 ;;00071-0144-45
 ;;9002226.02101,"563,00071-0144-45 ",.02)
 ;;00071-0144-45
 ;;9002226.02101,"563,00071-3006-03 ",.01)
 ;;00071-3006-03
 ;;9002226.02101,"563,00071-3006-03 ",.02)
 ;;00071-3006-03
 ;;9002226.02101,"563,00075-0514-08 ",.01)
 ;;00075-0514-08
 ;;9002226.02101,"563,00075-0514-08 ",.02)
 ;;00075-0514-08
 ;;9002226.02101,"563,00075-0525-08 ",.01)
 ;;00075-0525-08
 ;;9002226.02101,"563,00075-0525-08 ",.02)
 ;;00075-0525-08
 ;;9002226.02101,"563,00075-1306-01 ",.01)
 ;;00075-1306-01
 ;;9002226.02101,"563,00075-1306-01 ",.02)
 ;;00075-1306-01
 ;;9002226.02101,"563,00078-0149-23 ",.01)
 ;;00078-0149-23
 ;;9002226.02101,"563,00078-0149-23 ",.02)
 ;;00078-0149-23
 ;;9002226.02101,"563,00078-0311-54 ",.01)
 ;;00078-0311-54
 ;;9002226.02101,"563,00078-0311-54 ",.02)
 ;;00078-0311-54
 ;;9002226.02101,"563,00078-0311-90 ",.01)
 ;;00078-0311-90
 ;;9002226.02101,"563,00078-0311-90 ",.02)
 ;;00078-0311-90
 ;;9002226.02101,"563,00078-0343-42 ",.01)
 ;;00078-0343-42
 ;;9002226.02101,"563,00078-0343-42 ",.02)
 ;;00078-0343-42
 ;;9002226.02101,"563,00078-0343-45 ",.01)
 ;;00078-0343-45
 ;;9002226.02101,"563,00078-0343-45 ",.02)
 ;;00078-0343-45
 ;;9002226.02101,"563,00078-0344-42 ",.01)
 ;;00078-0344-42
 ;;9002226.02101,"563,00078-0344-42 ",.02)
 ;;00078-0344-42
 ;;9002226.02101,"563,00078-0344-45 ",.01)
 ;;00078-0344-45
 ;;9002226.02101,"563,00078-0344-45 ",.02)
 ;;00078-0344-45
 ;;9002226.02101,"563,00078-0345-42 ",.01)
 ;;00078-0345-42
 ;;9002226.02101,"563,00078-0345-42 ",.02)
 ;;00078-0345-42
 ;;9002226.02101,"563,00078-0345-45 ",.01)
 ;;00078-0345-45
 ;;9002226.02101,"563,00078-0345-45 ",.02)
 ;;00078-0345-45
 ;;9002226.02101,"563,00078-0346-42 ",.01)
 ;;00078-0346-42
 ;;9002226.02101,"563,00078-0346-42 ",.02)
 ;;00078-0346-42
 ;;9002226.02101,"563,00078-0346-45 ",.01)
 ;;00078-0346-45
 ;;9002226.02101,"563,00078-0346-45 ",.02)
 ;;00078-0346-45
 ;;9002226.02101,"563,00078-0348-42 ",.01)
 ;;00078-0348-42
 ;;9002226.02101,"563,00078-0348-42 ",.02)
 ;;00078-0348-42
 ;;9002226.02101,"563,00078-0348-44 ",.01)
 ;;00078-0348-44
 ;;9002226.02101,"563,00078-0348-44 ",.02)
 ;;00078-0348-44
 ;;9002226.02101,"563,00078-0348-62 ",.01)
 ;;00078-0348-62
 ;;9002226.02101,"563,00078-0348-62 ",.02)
 ;;00078-0348-62
 ;;9002226.02101,"563,00078-0365-42 ",.01)
 ;;00078-0365-42
 ;;9002226.02101,"563,00078-0365-42 ",.02)
 ;;00078-0365-42
 ;;9002226.02101,"563,00078-0365-45 ",.01)
 ;;00078-0365-45
 ;;9002226.02101,"563,00078-0365-45 ",.02)
 ;;00078-0365-45
 ;;9002226.02101,"563,00078-0377-42 ",.01)
 ;;00078-0377-42
 ;;9002226.02101,"563,00078-0377-42 ",.02)
 ;;00078-0377-42
 ;;9002226.02101,"563,00078-0377-45 ",.01)
 ;;00078-0377-45
 ;;9002226.02101,"563,00078-0377-45 ",.02)
 ;;00078-0377-45
 ;;9002226.02101,"563,00078-0377-62 ",.01)
 ;;00078-0377-62
 ;;9002226.02101,"563,00078-0377-62 ",.02)
 ;;00078-0377-62
 ;;9002226.02101,"563,00078-0378-42 ",.01)
 ;;00078-0378-42
 ;;9002226.02101,"563,00078-0378-42 ",.02)
 ;;00078-0378-42
 ;;9002226.02101,"563,00078-0378-45 ",.01)
 ;;00078-0378-45
 ;;9002226.02101,"563,00078-0378-45 ",.02)
 ;;00078-0378-45
 ;;9002226.02101,"563,00078-0378-62 ",.01)
 ;;00078-0378-62
 ;;9002226.02101,"563,00078-0378-62 ",.02)
 ;;00078-0378-62
 ;;9002226.02101,"563,00083-2310-01 ",.01)
 ;;00083-2310-01
 ;;9002226.02101,"563,00083-2310-01 ",.02)
 ;;00083-2310-01
 ;;9002226.02101,"563,00083-2310-08 ",.01)
 ;;00083-2310-08
 ;;9002226.02101,"563,00083-2310-08 ",.02)
 ;;00083-2310-08
 ;;9002226.02101,"563,00083-2310-62 ",.01)
 ;;00083-2310-62
 ;;9002226.02101,"563,00083-2310-62 ",.02)
 ;;00083-2310-62
 ;;9002226.02101,"563,00083-2320-01 ",.01)
 ;;00083-2320-01
 ;;9002226.02101,"563,00083-2320-01 ",.02)
 ;;00083-2320-01
 ;;9002226.02101,"563,00083-2320-08 ",.01)
 ;;00083-2320-08
 ;;9002226.02101,"563,00083-2320-08 ",.02)
 ;;00083-2320-08
 ;;9002226.02101,"563,00083-2320-62 ",.01)
 ;;00083-2320-62
 ;;9002226.02101,"563,00083-2320-62 ",.02)
 ;;00083-2320-62
 ;;9002226.02101,"563,00083-2325-01 ",.01)
 ;;00083-2325-01
 ;;9002226.02101,"563,00083-2325-01 ",.02)
 ;;00083-2325-01
 ;;9002226.02101,"563,00083-2325-08 ",.01)
 ;;00083-2325-08
 ;;9002226.02101,"563,00083-2325-08 ",.02)
 ;;00083-2325-08
 ;;9002226.02101,"563,00083-2325-62 ",.01)
 ;;00083-2325-62
 ;;9002226.02101,"563,00083-2325-62 ",.02)
 ;;00083-2325-62
 ;;9002226.02101,"563,00083-2326-01 ",.01)
 ;;00083-2326-01
 ;;9002226.02101,"563,00083-2326-01 ",.02)
 ;;00083-2326-01
 ;;9002226.02101,"563,00083-2326-08 ",.01)
 ;;00083-2326-08
 ;;9002226.02101,"563,00083-2326-08 ",.02)
 ;;00083-2326-08
 ;;9002226.02101,"563,00083-2326-25 ",.01)
 ;;00083-2326-25
 ;;9002226.02101,"563,00083-2326-25 ",.02)
 ;;00083-2326-25
 ;;9002226.02101,"563,00083-2326-62 ",.01)
 ;;00083-2326-62
 ;;9002226.02101,"563,00083-2326-62 ",.02)
 ;;00083-2326-62
 ;;9002226.02101,"563,00083-2327-01 ",.01)
 ;;00083-2327-01
 ;;9002226.02101,"563,00083-2327-01 ",.02)
 ;;00083-2327-01
 ;;9002226.02101,"563,00083-2327-08 ",.01)
 ;;00083-2327-08
 ;;9002226.02101,"563,00083-2327-08 ",.02)
 ;;00083-2327-08
 ;;9002226.02101,"563,00083-2327-25 ",.01)
 ;;00083-2327-25
 ;;9002226.02101,"563,00083-2327-25 ",.02)
 ;;00083-2327-25
 ;;9002226.02101,"563,00083-2327-62 ",.01)
 ;;00083-2327-62
 ;;9002226.02101,"563,00083-2327-62 ",.02)
 ;;00083-2327-62
 ;;9002226.02101,"563,00083-2328-01 ",.01)
 ;;00083-2328-01
 ;;9002226.02101,"563,00083-2328-01 ",.02)
 ;;00083-2328-01
 ;;9002226.02101,"563,00083-2328-08 ",.01)
 ;;00083-2328-08
 ;;9002226.02101,"563,00083-2328-08 ",.02)
 ;;00083-2328-08
 ;;9002226.02101,"563,00083-2328-25 ",.01)
 ;;00083-2328-25
 ;;9002226.02101,"563,00083-2328-25 ",.02)
 ;;00083-2328-25
 ;;9002226.02101,"563,00083-2328-62 ",.01)
 ;;00083-2328-62
 ;;9002226.02101,"563,00083-2328-62 ",.02)
 ;;00083-2328-62
 ;;9002226.02101,"563,00085-0070-03 ",.01)
 ;;00085-0070-03
 ;;9002226.02101,"563,00085-0070-03 ",.02)
 ;;00085-0070-03
 ;;9002226.02101,"563,00085-0070-06 ",.01)
 ;;00085-0070-06
 ;;9002226.02101,"563,00085-0070-06 ",.02)
 ;;00085-0070-06
 ;;9002226.02101,"563,00085-0150-03 ",.01)
 ;;00085-0150-03
 ;;9002226.02101,"563,00085-0150-03 ",.02)
 ;;00085-0150-03
 ;;9002226.02101,"563,00085-0298-03 ",.01)
 ;;00085-0298-03
 ;;9002226.02101,"563,00085-0298-03 ",.02)
 ;;00085-0298-03
 ;;9002226.02101,"563,00085-0298-06 ",.01)
 ;;00085-0298-06
 ;;9002226.02101,"563,00085-0298-06 ",.02)
 ;;00085-0298-06
 ;;9002226.02101,"563,00087-0021-41 ",.01)
 ;;00087-0021-41
 ;;9002226.02101,"563,00087-0021-41 ",.02)
 ;;00087-0021-41
 ;;9002226.02101,"563,00087-0755-01 ",.01)
 ;;00087-0755-01
 ;;9002226.02101,"563,00087-0755-01 ",.02)
 ;;00087-0755-01
 ;;9002226.02101,"563,00087-0755-48 ",.01)
 ;;00087-0755-48
 ;;9002226.02101,"563,00087-0755-48 ",.02)
 ;;00087-0755-48
 ;;9002226.02101,"563,00087-0756-01 ",.01)
 ;;00087-0756-01
 ;;9002226.02101,"563,00087-0756-01 ",.02)
 ;;00087-0756-01
 ;;9002226.02101,"563,00087-0756-48 ",.01)
 ;;00087-0756-48
 ;;9002226.02101,"563,00087-0756-48 ",.02)
 ;;00087-0756-48
 ;;9002226.02101,"563,00093-1057-01 ",.01)
 ;;00093-1057-01
 ;;9002226.02101,"563,00093-1057-01 ",.02)
 ;;00093-1057-01
 ;;9002226.02101,"563,00093-1058-01 ",.01)
 ;;00093-1058-01
 ;;9002226.02101,"563,00093-1058-01 ",.02)
 ;;00093-1058-01
 ;;9002226.02101,"563,00093-1059-01 ",.01)
 ;;00093-1059-01
 ;;9002226.02101,"563,00093-1059-01 ",.02)
 ;;00093-1059-01
 ;;9002226.02101,"563,00149-0470-01 ",.01)
 ;;00149-0470-01
 ;;9002226.02101,"563,00149-0470-01 ",.02)
 ;;00149-0470-01
 ;;9002226.02101,"563,00149-0470-03 ",.01)
 ;;00149-0470-03
 ;;9002226.02101,"563,00149-0470-03 ",.02)
 ;;00149-0470-03
 ;;9002226.02101,"563,00149-0471-01 ",.01)
 ;;00149-0471-01
 ;;9002226.02101,"563,00149-0471-01 ",.02)
 ;;00149-0471-01
 ;;9002226.02101,"563,00149-0471-03 ",.01)
 ;;00149-0471-03
 ;;9002226.02101,"563,00149-0471-03 ",.02)
 ;;00149-0471-03
 ;;9002226.02101,"563,00149-0472-01 ",.01)
 ;;00149-0472-01
 ;;9002226.02101,"563,00149-0472-01 ",.02)
 ;;00149-0472-01
 ;;9002226.02101,"563,00149-0491-01 ",.01)
 ;;00149-0491-01
 ;;9002226.02101,"563,00149-0491-01 ",.02)
 ;;00149-0491-01
 ;;9002226.02101,"563,00149-0491-03 ",.01)
 ;;00149-0491-03
 ;;9002226.02101,"563,00149-0491-03 ",.02)
 ;;00149-0491-03
 ;;9002226.02101,"563,00149-0491-04 ",.01)
 ;;00149-0491-04
 ;;9002226.02101,"563,00149-0491-04 ",.02)
 ;;00149-0491-04
 ;;9002226.02101,"563,00149-0491-05 ",.01)
 ;;00149-0491-05
 ;;9002226.02101,"563,00149-0491-05 ",.02)
 ;;00149-0491-05
 ;;9002226.02101,"563,00149-0491-07 ",.01)
 ;;00149-0491-07
 ;;9002226.02101,"563,00149-0491-07 ",.02)
 ;;00149-0491-07
 ;;9002226.02101,"563,00149-0492-01 ",.01)
 ;;00149-0492-01
 ;;9002226.02101,"563,00149-0492-01 ",.02)
 ;;00149-0492-01
 ;;9002226.02101,"563,00149-0492-04 ",.01)
 ;;00149-0492-04
 ;;9002226.02101,"563,00149-0492-04 ",.02)
 ;;00149-0492-04
 ;;9002226.02101,"563,00149-0493-01 ",.01)
 ;;00149-0493-01
 ;;9002226.02101,"563,00149-0493-01 ",.02)
 ;;00149-0493-01
 ;;9002226.02101,"563,00149-0493-04 ",.01)
 ;;00149-0493-04
 ;;9002226.02101,"563,00149-0493-04 ",.02)
 ;;00149-0493-04
 ;;9002226.02101,"563,00169-5174-01 ",.01)
 ;;00169-5174-01
 ;;9002226.02101,"563,00169-5174-01 ",.02)
 ;;00169-5174-01
 ;;9002226.02101,"563,00182-1976-01 ",.01)
 ;;00182-1976-01
 ;;9002226.02101,"563,00182-1976-01 ",.02)
 ;;00182-1976-01
 ;;9002226.02101,"563,00182-1977-01 ",.01)
 ;;00182-1977-01
 ;;9002226.02101,"563,00182-1977-01 ",.02)
 ;;00182-1977-01
 ;;9002226.02101,"563,00182-1978-01 ",.01)
 ;;00182-1978-01
 ;;9002226.02101,"563,00182-1978-01 ",.02)
 ;;00182-1978-01
 ;;9002226.02101,"563,00182-2648-01 ",.01)
 ;;00182-2648-01
 ;;9002226.02101,"563,00182-2648-01 ",.02)
 ;;00182-2648-01
 ;;9002226.02101,"563,00182-2649-01 ",.01)
 ;;00182-2649-01
 ;;9002226.02101,"563,00182-2649-01 ",.02)
 ;;00182-2649-01
 ;;9002226.02101,"563,00182-2650-01 ",.01)
 ;;00182-2650-01
 ;;9002226.02101,"563,00182-2650-01 ",.02)
 ;;00182-2650-01
 ;;9002226.02101,"563,00245-0008-35 ",.01)
 ;;00245-0008-35
 ;;9002226.02101,"563,00245-0008-35 ",.02)
 ;;00245-0008-35
 ;;9002226.02101,"563,00247-0242-30 ",.01)
 ;;00247-0242-30
 ;;9002226.02101,"563,00247-0242-30 ",.02)
 ;;00247-0242-30
 ;;9002226.02101,"563,00247-0243-21 ",.01)
 ;;00247-0243-21
 ;;9002226.02101,"563,00247-0243-21 ",.02)
 ;;00247-0243-21
 ;;9002226.02101,"563,00247-0243-30 ",.01)
 ;;00247-0243-30
 ;;9002226.02101,"563,00247-0243-30 ",.02)
 ;;00247-0243-30
 ;;9002226.02101,"563,00247-0249-00 ",.01)
 ;;00247-0249-00
 ;;9002226.02101,"563,00247-0249-00 ",.02)
 ;;00247-0249-00
 ;;9002226.02101,"563,00247-0249-30 ",.01)
 ;;00247-0249-30
 ;;9002226.02101,"563,00247-0249-30 ",.02)
 ;;00247-0249-30
 ;;9002226.02101,"563,00247-0250-00 ",.01)
 ;;00247-0250-00
 ;;9002226.02101,"563,00247-0250-00 ",.02)
 ;;00247-0250-00
 ;;9002226.02101,"563,00247-0250-28 ",.01)
 ;;00247-0250-28
 ;;9002226.02101,"563,00247-0250-28 ",.02)
 ;;00247-0250-28
 ;;9002226.02101,"563,00247-0250-30 ",.01)
 ;;00247-0250-30
 ;;9002226.02101,"563,00247-0250-30 ",.02)
 ;;00247-0250-30
 ;;9002226.02101,"563,00247-0251-00 ",.01)
 ;;00247-0251-00
 ;;9002226.02101,"563,00247-0251-00 ",.02)
 ;;00247-0251-00
 ;;9002226.02101,"563,00247-0251-30 ",.01)
 ;;00247-0251-30
 ;;9002226.02101,"563,00247-0251-30 ",.02)
 ;;00247-0251-30
 ;;9002226.02101,"563,00247-0251-60 ",.01)
 ;;00247-0251-60
 ;;9002226.02101,"563,00247-0251-60 ",.02)
 ;;00247-0251-60
 ;;9002226.02101,"563,00247-0251-90 ",.01)
 ;;00247-0251-90
 ;;9002226.02101,"563,00247-0251-90 ",.02)
 ;;00247-0251-90
 ;;9002226.02101,"563,00247-1226-30 ",.01)
 ;;00247-1226-30
 ;;9002226.02101,"563,00247-1226-30 ",.02)
 ;;00247-1226-30
 ;;9002226.02101,"563,00339-5981-12 ",.01)
 ;;00339-5981-12
 ;;9002226.02101,"563,00339-5981-12 ",.02)
 ;;00339-5981-12
 ;;9002226.02101,"563,00339-5983-12 ",.01)
 ;;00339-5983-12
 ;;9002226.02101,"563,00339-5983-12 ",.02)
 ;;00339-5983-12
 ;;9002226.02101,"563,00339-5985-12 ",.01)
 ;;00339-5985-12
