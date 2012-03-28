BGP06P4 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"700,00247-0818-25 ",.02)
 ;;00247-0818-25
 ;;9002226.02101,"700,00247-0818-30 ",.01)
 ;;00247-0818-30
 ;;9002226.02101,"700,00247-0818-30 ",.02)
 ;;00247-0818-30
 ;;9002226.02101,"700,00247-0971-20 ",.01)
 ;;00247-0971-20
 ;;9002226.02101,"700,00247-0971-20 ",.02)
 ;;00247-0971-20
 ;;9002226.02101,"700,00247-0971-28 ",.01)
 ;;00247-0971-28
 ;;9002226.02101,"700,00247-0971-28 ",.02)
 ;;00247-0971-28
 ;;9002226.02101,"700,00247-1037-12 ",.01)
 ;;00247-1037-12
 ;;9002226.02101,"700,00247-1037-12 ",.02)
 ;;00247-1037-12
 ;;9002226.02101,"700,00247-1037-20 ",.01)
 ;;00247-1037-20
 ;;9002226.02101,"700,00247-1037-20 ",.02)
 ;;00247-1037-20
 ;;9002226.02101,"700,00247-1037-90 ",.01)
 ;;00247-1037-90
 ;;9002226.02101,"700,00247-1037-90 ",.02)
 ;;00247-1037-90
 ;;9002226.02101,"700,00247-1038-90 ",.01)
 ;;00247-1038-90
 ;;9002226.02101,"700,00247-1038-90 ",.02)
 ;;00247-1038-90
 ;;9002226.02101,"700,00247-1441-01 ",.01)
 ;;00247-1441-01
 ;;9002226.02101,"700,00247-1441-01 ",.02)
 ;;00247-1441-01
 ;;9002226.02101,"700,00247-1441-04 ",.01)
 ;;00247-1441-04
 ;;9002226.02101,"700,00247-1441-04 ",.02)
 ;;00247-1441-04
 ;;9002226.02101,"700,00247-1441-05 ",.01)
 ;;00247-1441-05
 ;;9002226.02101,"700,00247-1441-05 ",.02)
 ;;00247-1441-05
 ;;9002226.02101,"700,00247-1441-20 ",.01)
 ;;00247-1441-20
 ;;9002226.02101,"700,00247-1441-20 ",.02)
 ;;00247-1441-20
 ;;9002226.02101,"700,00247-2124-00 ",.01)
 ;;00247-2124-00
 ;;9002226.02101,"700,00247-2124-00 ",.02)
 ;;00247-2124-00
 ;;9002226.02101,"700,00254-5112-28 ",.01)
 ;;00254-5112-28
 ;;9002226.02101,"700,00254-5112-28 ",.02)
 ;;00254-5112-28
 ;;9002226.02101,"700,00254-5112-35 ",.01)
 ;;00254-5112-35
 ;;9002226.02101,"700,00254-5112-35 ",.02)
 ;;00254-5112-35
 ;;9002226.02101,"700,00254-5112-38 ",.01)
 ;;00254-5112-38
 ;;9002226.02101,"700,00254-5112-38 ",.02)
 ;;00254-5112-38
 ;;9002226.02101,"700,00254-5113-28 ",.01)
 ;;00254-5113-28
 ;;9002226.02101,"700,00254-5113-28 ",.02)
 ;;00254-5113-28
 ;;9002226.02101,"700,00254-5113-35 ",.01)
 ;;00254-5113-35
 ;;9002226.02101,"700,00254-5113-35 ",.02)
 ;;00254-5113-35
 ;;9002226.02101,"700,00254-5113-38 ",.01)
 ;;00254-5113-38
 ;;9002226.02101,"700,00254-5113-38 ",.02)
 ;;00254-5113-38
 ;;9002226.02101,"700,00254-5114-35 ",.01)
 ;;00254-5114-35
 ;;9002226.02101,"700,00254-5114-35 ",.02)
 ;;00254-5114-35
 ;;9002226.02101,"700,00254-5114-38 ",.01)
 ;;00254-5114-38
 ;;9002226.02101,"700,00254-5114-38 ",.02)
 ;;00254-5114-38
 ;;9002226.02101,"700,00338-2691-75 ",.01)
 ;;00338-2691-75
 ;;9002226.02101,"700,00338-2691-75 ",.02)
 ;;00338-2691-75
 ;;9002226.02101,"700,00338-9370-41 ",.01)
 ;;00338-9370-41
 ;;9002226.02101,"700,00338-9370-41 ",.02)
 ;;00338-9370-41
 ;;9002226.02101,"700,00338-9372-48 ",.01)
 ;;00338-9372-48
 ;;9002226.02101,"700,00338-9372-48 ",.02)
 ;;00338-9372-48
 ;;9002226.02101,"700,00338-9373-48 ",.01)
 ;;00338-9373-48
 ;;9002226.02101,"700,00338-9373-48 ",.02)
 ;;00338-9373-48
 ;;9002226.02101,"700,00378-0130-01 ",.01)
 ;;00378-0130-01
 ;;9002226.02101,"700,00378-0130-01 ",.02)
 ;;00378-0130-01
 ;;9002226.02101,"700,00378-0130-05 ",.01)
 ;;00378-0130-05
 ;;9002226.02101,"700,00378-0130-05 ",.02)
 ;;00378-0130-05
 ;;9002226.02101,"700,00378-0131-05 ",.01)
 ;;00378-0131-05
 ;;9002226.02101,"700,00378-0131-05 ",.02)
 ;;00378-0131-05
 ;;9002226.02101,"700,00378-0155-01 ",.01)
 ;;00378-0155-01
 ;;9002226.02101,"700,00378-0155-01 ",.02)
 ;;00378-0155-01
 ;;9002226.02101,"700,00378-0155-05 ",.01)
 ;;00378-0155-05
 ;;9002226.02101,"700,00378-0155-05 ",.02)
 ;;00378-0155-05
 ;;9002226.02101,"700,00378-7065-01 ",.01)
 ;;00378-7065-01
 ;;9002226.02101,"700,00378-7065-01 ",.02)
 ;;00378-7065-01
 ;;9002226.02101,"700,00378-7065-05 ",.01)
 ;;00378-7065-05
 ;;9002226.02101,"700,00378-7065-05 ",.02)
 ;;00378-7065-05
 ;;9002226.02101,"700,00406-1721-01 ",.01)
 ;;00406-1721-01
 ;;9002226.02101,"700,00406-1721-01 ",.02)
 ;;00406-1721-01
 ;;9002226.02101,"700,00406-1721-05 ",.01)
 ;;00406-1721-05
 ;;9002226.02101,"700,00406-1721-05 ",.02)
 ;;00406-1721-05
 ;;9002226.02101,"700,00406-1721-10 ",.01)
 ;;00406-1721-10
 ;;9002226.02101,"700,00406-1721-10 ",.02)
 ;;00406-1721-10
 ;;9002226.02101,"700,00406-1721-91 ",.01)
 ;;00406-1721-91
 ;;9002226.02101,"700,00406-1721-91 ",.02)
 ;;00406-1721-91
 ;;9002226.02101,"700,00406-1772-01 ",.01)
 ;;00406-1772-01
 ;;9002226.02101,"700,00406-1772-01 ",.02)
 ;;00406-1772-01
 ;;9002226.02101,"700,00406-1772-03 ",.01)
 ;;00406-1772-03
 ;;9002226.02101,"700,00406-1772-03 ",.02)
 ;;00406-1772-03
 ;;9002226.02101,"700,00406-1772-05 ",.01)
 ;;00406-1772-05
 ;;9002226.02101,"700,00406-1772-05 ",.02)
 ;;00406-1772-05
 ;;9002226.02101,"700,00406-1772-10 ",.01)
 ;;00406-1772-10
 ;;9002226.02101,"700,00406-1772-10 ",.02)
 ;;00406-1772-10
 ;;9002226.02101,"700,00406-1772-12 ",.01)
 ;;00406-1772-12
 ;;9002226.02101,"700,00406-1772-12 ",.02)
 ;;00406-1772-12
 ;;9002226.02101,"700,00406-1772-33 ",.01)
 ;;00406-1772-33
 ;;9002226.02101,"700,00406-1772-33 ",.02)
 ;;00406-1772-33
 ;;9002226.02101,"700,00406-1772-60 ",.01)
 ;;00406-1772-60
 ;;9002226.02101,"700,00406-1772-60 ",.02)
 ;;00406-1772-60
 ;;9002226.02101,"700,00406-1772-62 ",.01)
 ;;00406-1772-62
 ;;9002226.02101,"700,00406-1772-62 ",.02)
 ;;00406-1772-62
 ;;9002226.02101,"700,00406-1772-90 ",.01)
 ;;00406-1772-90
 ;;9002226.02101,"700,00406-1772-90 ",.02)
 ;;00406-1772-90
 ;;9002226.02101,"700,00406-1772-91 ",.01)
 ;;00406-1772-91
 ;;9002226.02101,"700,00406-1772-91 ",.02)
 ;;00406-1772-91
 ;;9002226.02101,"700,00406-3118-01 ",.01)
 ;;00406-3118-01
 ;;9002226.02101,"700,00406-3118-01 ",.02)
 ;;00406-3118-01
 ;;9002226.02101,"700,00406-7113-01 ",.01)
 ;;00406-7113-01
 ;;9002226.02101,"700,00406-7113-01 ",.02)
 ;;00406-7113-01
 ;;9002226.02101,"700,00406-7115-01 ",.01)
 ;;00406-7115-01
 ;;9002226.02101,"700,00406-7115-01 ",.02)
 ;;00406-7115-01
 ;;9002226.02101,"700,00409-1176-30 ",.01)
 ;;00409-1176-30
 ;;9002226.02101,"700,00409-1176-30 ",.02)
 ;;00409-1176-30
 ;;9002226.02101,"700,00409-1178-30 ",.01)
 ;;00409-1178-30
 ;;9002226.02101,"700,00409-1178-30 ",.02)
 ;;00409-1178-30
 ;;9002226.02101,"700,00409-1179-30 ",.01)
 ;;00409-1179-30
 ;;9002226.02101,"700,00409-1179-30 ",.02)
 ;;00409-1179-30
 ;;9002226.02101,"700,00409-1180-69 ",.01)
 ;;00409-1180-69
 ;;9002226.02101,"700,00409-1180-69 ",.02)
 ;;00409-1180-69
 ;;9002226.02101,"700,00409-1181-30 ",.01)
 ;;00409-1181-30
 ;;9002226.02101,"700,00409-1181-30 ",.02)
 ;;00409-1181-30
 ;;9002226.02101,"700,00409-1201-20 ",.01)
 ;;00409-1201-20
 ;;9002226.02101,"700,00409-1201-20 ",.02)
 ;;00409-1201-20
 ;;9002226.02101,"700,00409-1203-01 ",.01)
 ;;00409-1203-01
 ;;9002226.02101,"700,00409-1203-01 ",.02)
 ;;00409-1203-01
 ;;9002226.02101,"700,00409-1253-01 ",.01)
 ;;00409-1253-01
 ;;9002226.02101,"700,00409-1253-01 ",.02)
 ;;00409-1253-01
 ;;9002226.02101,"700,00409-1254-01 ",.01)
 ;;00409-1254-01
 ;;9002226.02101,"700,00409-1254-01 ",.02)
 ;;00409-1254-01
 ;;9002226.02101,"700,00409-1255-02 ",.01)
 ;;00409-1255-02
 ;;9002226.02101,"700,00409-1255-02 ",.02)
 ;;00409-1255-02
 ;;9002226.02101,"700,00409-1256-01 ",.01)
 ;;00409-1256-01
 ;;9002226.02101,"700,00409-1256-01 ",.02)
 ;;00409-1256-01
 ;;9002226.02101,"700,00409-1920-10 ",.01)
 ;;00409-1920-10
 ;;9002226.02101,"700,00409-1920-10 ",.02)
 ;;00409-1920-10
 ;;9002226.02101,"700,00409-1941-01 ",.01)
 ;;00409-1941-01
 ;;9002226.02101,"700,00409-1941-01 ",.02)
 ;;00409-1941-01
 ;;9002226.02101,"700,00409-6030-04 ",.01)
 ;;00409-6030-04
 ;;9002226.02101,"700,00409-6030-04 ",.02)
 ;;00409-6030-04
 ;;9002226.02101,"700,00555-0381-02 ",.01)
 ;;00555-0381-02
 ;;9002226.02101,"700,00555-0381-02 ",.02)
 ;;00555-0381-02
 ;;9002226.02101,"700,00555-0382-02 ",.01)
 ;;00555-0382-02
 ;;9002226.02101,"700,00555-0382-02 ",.02)
 ;;00555-0382-02
 ;;9002226.02101,"700,00574-7040-12 ",.01)
 ;;00574-7040-12
 ;;9002226.02101,"700,00574-7040-12 ",.02)
 ;;00574-7040-12
 ;;9002226.02101,"700,00574-7045-12 ",.01)
 ;;00574-7045-12
 ;;9002226.02101,"700,00574-7045-12 ",.02)
 ;;00574-7045-12
 ;;9002226.02101,"700,00591-0395-01 ",.01)
 ;;00591-0395-01
 ;;9002226.02101,"700,00591-0395-01 ",.02)
 ;;00591-0395-01
 ;;9002226.02101,"700,00591-0396-01 ",.01)
 ;;00591-0396-01
 ;;9002226.02101,"700,00591-0396-01 ",.02)
 ;;00591-0396-01
 ;;9002226.02101,"700,00591-0714-01 ",.01)
 ;;00591-0714-01
 ;;9002226.02101,"700,00591-0714-01 ",.02)
 ;;00591-0714-01
 ;;9002226.02101,"700,00591-0714-05 ",.01)
 ;;00591-0714-05
 ;;9002226.02101,"700,00591-0714-05 ",.02)
 ;;00591-0714-05
 ;;9002226.02101,"700,00591-0726-01 ",.01)
 ;;00591-0726-01
 ;;9002226.02101,"700,00591-0726-01 ",.02)
 ;;00591-0726-01
 ;;9002226.02101,"700,00591-0727-01 ",.01)
 ;;00591-0727-01
 ;;9002226.02101,"700,00591-0727-01 ",.02)
 ;;00591-0727-01
 ;;9002226.02101,"700,00603-4415-21 ",.01)
 ;;00603-4415-21
 ;;9002226.02101,"700,00603-4415-21 ",.02)
 ;;00603-4415-21
 ;;9002226.02101,"700,00603-4416-21 ",.01)
 ;;00603-4416-21
 ;;9002226.02101,"700,00603-4416-21 ",.02)
 ;;00603-4416-21
 ;;9002226.02101,"700,00603-4424-21 ",.01)
 ;;00603-4424-21
 ;;9002226.02101,"700,00603-4424-21 ",.02)
 ;;00603-4424-21
 ;;9002226.02101,"700,00603-5110-21 ",.01)
 ;;00603-5110-21
 ;;9002226.02101,"700,00603-5110-21 ",.02)
 ;;00603-5110-21
 ;;9002226.02101,"700,00603-5459-21 ",.01)
 ;;00603-5459-21
 ;;9002226.02101,"700,00603-5459-21 ",.02)
 ;;00603-5459-21
 ;;9002226.02101,"700,00603-5459-28 ",.01)
 ;;00603-5459-28
 ;;9002226.02101,"700,00603-5459-28 ",.02)
 ;;00603-5459-28
 ;;9002226.02101,"700,00603-5460-21 ",.01)
 ;;00603-5460-21
 ;;9002226.02101,"700,00603-5460-21 ",.02)
 ;;00603-5460-21
 ;;9002226.02101,"700,00603-5460-28 ",.01)
 ;;00603-5460-28
 ;;9002226.02101,"700,00603-5460-28 ",.02)
 ;;00603-5460-28
 ;;9002226.02101,"700,00603-5462-21 ",.01)
 ;;00603-5462-21
 ;;9002226.02101,"700,00603-5462-21 ",.02)
 ;;00603-5462-21
 ;;9002226.02101,"700,00603-5462-28 ",.01)
 ;;00603-5462-28
 ;;9002226.02101,"700,00603-5462-28 ",.02)
 ;;00603-5462-28
 ;;9002226.02101,"700,00603-5463-28 ",.01)
 ;;00603-5463-28
 ;;9002226.02101,"700,00603-5463-28 ",.02)
 ;;00603-5463-28
 ;;9002226.02101,"700,00603-5465-21 ",.01)
 ;;00603-5465-21
 ;;9002226.02101,"700,00603-5465-21 ",.02)
 ;;00603-5465-21
 ;;9002226.02101,"700,00603-5466-21 ",.01)
 ;;00603-5466-21
 ;;9002226.02101,"700,00603-5466-21 ",.02)
 ;;00603-5466-21
 ;;9002226.02101,"700,00603-5466-28 ",.01)
 ;;00603-5466-28
 ;;9002226.02101,"700,00603-5466-28 ",.02)
 ;;00603-5466-28
 ;;9002226.02101,"700,00603-5466-32 ",.01)
 ;;00603-5466-32
 ;;9002226.02101,"700,00603-5466-32 ",.02)
 ;;00603-5466-32
 ;;9002226.02101,"700,00603-5467-16 ",.01)
 ;;00603-5467-16
 ;;9002226.02101,"700,00603-5467-16 ",.02)
 ;;00603-5467-16
 ;;9002226.02101,"700,00603-5467-21 ",.01)
 ;;00603-5467-21
 ;;9002226.02101,"700,00603-5467-21 ",.02)
 ;;00603-5467-21
 ;;9002226.02101,"700,00603-5467-28 ",.01)
 ;;00603-5467-28
 ;;9002226.02101,"700,00603-5467-28 ",.02)
 ;;00603-5467-28
 ;;9002226.02101,"700,00603-5467-32 ",.01)
 ;;00603-5467-32
 ;;9002226.02101,"700,00603-5467-32 ",.02)
 ;;00603-5467-32
 ;;9002226.02101,"700,00603-5468-16 ",.01)
 ;;00603-5468-16
 ;;9002226.02101,"700,00603-5468-16 ",.02)
 ;;00603-5468-16
 ;;9002226.02101,"700,00603-5468-19 ",.01)
 ;;00603-5468-19
 ;;9002226.02101,"700,00603-5468-19 ",.02)
 ;;00603-5468-19
 ;;9002226.02101,"700,00603-5468-21 ",.01)
 ;;00603-5468-21
 ;;9002226.02101,"700,00603-5468-21 ",.02)
 ;;00603-5468-21
 ;;9002226.02101,"700,00603-5468-28 ",.01)
 ;;00603-5468-28
 ;;9002226.02101,"700,00603-5468-28 ",.02)
 ;;00603-5468-28
 ;;9002226.02101,"700,00603-5468-32 ",.01)
 ;;00603-5468-32
 ;;9002226.02101,"700,00603-5468-32 ",.02)
 ;;00603-5468-32
 ;;9002226.02101,"700,00641-1130-25 ",.01)
 ;;00641-1130-25
 ;;9002226.02101,"700,00641-1130-25 ",.02)
 ;;00641-1130-25
 ;;9002226.02101,"700,00641-1140-25 ",.01)
 ;;00641-1140-25
 ;;9002226.02101,"700,00641-1140-25 ",.02)
 ;;00641-1140-25
 ;;9002226.02101,"700,00677-0356-01 ",.01)
 ;;00677-0356-01
 ;;9002226.02101,"700,00677-0356-01 ",.02)
 ;;00677-0356-01
 ;;9002226.02101,"700,00677-0356-05 ",.01)
 ;;00677-0356-05
 ;;9002226.02101,"700,00677-0356-05 ",.02)
 ;;00677-0356-05
 ;;9002226.02101,"700,00781-1378-13 ",.01)
 ;;00781-1378-13
 ;;9002226.02101,"700,00781-1378-13 ",.02)
 ;;00781-1378-13
 ;;9002226.02101,"700,00781-2140-01 ",.01)
 ;;00781-2140-01
 ;;9002226.02101,"700,00781-2140-01 ",.02)
 ;;00781-2140-01
 ;;9002226.02101,"700,00781-2140-10 ",.01)
 ;;00781-2140-10
 ;;9002226.02101,"700,00781-2140-10 ",.02)
 ;;00781-2140-10
 ;;9002226.02101,"700,00781-2367-01 ",.01)
 ;;00781-2367-01
 ;;9002226.02101,"700,00781-2367-01 ",.02)
 ;;00781-2367-01
 ;;9002226.02101,"700,00781-2367-10 ",.01)
 ;;00781-2367-10
 ;;9002226.02101,"700,00781-2367-10 ",.02)
 ;;00781-2367-10
 ;;9002226.02101,"700,00904-1977-60 ",.01)
 ;;00904-1977-60
 ;;9002226.02101,"700,00904-1977-60 ",.02)
 ;;00904-1977-60
 ;;9002226.02101,"700,00904-1978-60 ",.01)
 ;;00904-1978-60
 ;;9002226.02101,"700,00904-1978-60 ",.02)
 ;;00904-1978-60
 ;;9002226.02101,"700,00904-2280-60 ",.01)
 ;;00904-2280-60
 ;;9002226.02101,"700,00904-2280-60 ",.02)
 ;;00904-2280-60
 ;;9002226.02101,"700,00904-2281-40 ",.01)
 ;;00904-2281-40
 ;;9002226.02101,"700,00904-2281-40 ",.02)
 ;;00904-2281-40
 ;;9002226.02101,"700,00904-2281-60 ",.01)
 ;;00904-2281-60
 ;;9002226.02101,"700,00904-2281-60 ",.02)
 ;;00904-2281-60
 ;;9002226.02101,"700,00904-7700-40 ",.01)
 ;;00904-7700-40
