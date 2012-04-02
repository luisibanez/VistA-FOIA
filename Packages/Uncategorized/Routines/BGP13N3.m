BGP13N3 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"718,00247-0258-14 ",.02)
 ;;00247-0258-14
 ;;9002226.02101,"718,00247-0258-20 ",.01)
 ;;00247-0258-20
 ;;9002226.02101,"718,00247-0258-20 ",.02)
 ;;00247-0258-20
 ;;9002226.02101,"718,00247-0258-28 ",.01)
 ;;00247-0258-28
 ;;9002226.02101,"718,00247-0258-28 ",.02)
 ;;00247-0258-28
 ;;9002226.02101,"718,00247-0258-30 ",.01)
 ;;00247-0258-30
 ;;9002226.02101,"718,00247-0258-30 ",.02)
 ;;00247-0258-30
 ;;9002226.02101,"718,00247-0258-40 ",.01)
 ;;00247-0258-40
 ;;9002226.02101,"718,00247-0258-40 ",.02)
 ;;00247-0258-40
 ;;9002226.02101,"718,00247-0258-47 ",.01)
 ;;00247-0258-47
 ;;9002226.02101,"718,00247-0258-47 ",.02)
 ;;00247-0258-47
 ;;9002226.02101,"718,00247-0258-90 ",.01)
 ;;00247-0258-90
 ;;9002226.02101,"718,00247-0258-90 ",.02)
 ;;00247-0258-90
 ;;9002226.02101,"718,00247-0696-10 ",.01)
 ;;00247-0696-10
 ;;9002226.02101,"718,00247-0696-10 ",.02)
 ;;00247-0696-10
 ;;9002226.02101,"718,00247-0696-14 ",.01)
 ;;00247-0696-14
 ;;9002226.02101,"718,00247-0696-14 ",.02)
 ;;00247-0696-14
 ;;9002226.02101,"718,00247-0696-20 ",.01)
 ;;00247-0696-20
 ;;9002226.02101,"718,00247-0696-20 ",.02)
 ;;00247-0696-20
 ;;9002226.02101,"718,00247-0696-28 ",.01)
 ;;00247-0696-28
 ;;9002226.02101,"718,00247-0696-28 ",.02)
 ;;00247-0696-28
 ;;9002226.02101,"718,00247-0696-30 ",.01)
 ;;00247-0696-30
 ;;9002226.02101,"718,00247-0696-30 ",.02)
 ;;00247-0696-30
 ;;9002226.02101,"718,00247-1872-00 ",.01)
 ;;00247-1872-00
 ;;9002226.02101,"718,00247-1872-00 ",.02)
 ;;00247-1872-00
 ;;9002226.02101,"718,00247-2071-00 ",.01)
 ;;00247-2071-00
 ;;9002226.02101,"718,00247-2071-00 ",.02)
 ;;00247-2071-00
 ;;9002226.02101,"718,00247-2071-02 ",.01)
 ;;00247-2071-02
 ;;9002226.02101,"718,00247-2071-02 ",.02)
 ;;00247-2071-02
 ;;9002226.02101,"718,00247-2071-03 ",.01)
 ;;00247-2071-03
 ;;9002226.02101,"718,00247-2071-03 ",.02)
 ;;00247-2071-03
 ;;9002226.02101,"718,00247-2071-04 ",.01)
 ;;00247-2071-04
 ;;9002226.02101,"718,00247-2071-04 ",.02)
 ;;00247-2071-04
 ;;9002226.02101,"718,00247-2071-06 ",.01)
 ;;00247-2071-06
 ;;9002226.02101,"718,00247-2071-06 ",.02)
 ;;00247-2071-06
 ;;9002226.02101,"718,00247-2071-10 ",.01)
 ;;00247-2071-10
 ;;9002226.02101,"718,00247-2071-10 ",.02)
 ;;00247-2071-10
 ;;9002226.02101,"718,00247-2071-14 ",.01)
 ;;00247-2071-14
 ;;9002226.02101,"718,00247-2071-14 ",.02)
 ;;00247-2071-14
 ;;9002226.02101,"718,00247-2071-28 ",.01)
 ;;00247-2071-28
 ;;9002226.02101,"718,00247-2071-28 ",.02)
 ;;00247-2071-28
 ;;9002226.02101,"718,00378-1650-01 ",.01)
 ;;00378-1650-01
 ;;9002226.02101,"718,00378-1650-01 ",.02)
 ;;00378-1650-01
 ;;9002226.02101,"718,00378-1650-05 ",.01)
 ;;00378-1650-05
 ;;9002226.02101,"718,00378-1650-05 ",.02)
 ;;00378-1650-05
 ;;9002226.02101,"718,00378-1700-01 ",.01)
 ;;00378-1700-01
 ;;9002226.02101,"718,00378-1700-01 ",.02)
 ;;00378-1700-01
 ;;9002226.02101,"718,00378-1700-05 ",.01)
 ;;00378-1700-05
 ;;9002226.02101,"718,00378-1700-05 ",.02)
 ;;00378-1700-05
 ;;9002226.02101,"718,00378-3422-01 ",.01)
 ;;00378-3422-01
 ;;9002226.02101,"718,00378-3422-01 ",.02)
 ;;00378-3422-01
 ;;9002226.02101,"718,00440-7866-14 ",.01)
 ;;00440-7866-14
 ;;9002226.02101,"718,00440-7866-14 ",.02)
 ;;00440-7866-14
 ;;9002226.02101,"718,00456-0457-01 ",.01)
 ;;00456-0457-01
 ;;9002226.02101,"718,00456-0457-01 ",.02)
 ;;00456-0457-01
 ;;9002226.02101,"718,00456-0458-00 ",.01)
 ;;00456-0458-00
 ;;9002226.02101,"718,00456-0458-00 ",.02)
 ;;00456-0458-00
 ;;9002226.02101,"718,00456-0458-01 ",.01)
 ;;00456-0458-01
 ;;9002226.02101,"718,00456-0458-01 ",.02)
 ;;00456-0458-01
 ;;9002226.02101,"718,00456-0458-11 ",.01)
 ;;00456-0458-11
 ;;9002226.02101,"718,00456-0458-11 ",.02)
 ;;00456-0458-11
 ;;9002226.02101,"718,00456-0458-63 ",.01)
 ;;00456-0458-63
 ;;9002226.02101,"718,00456-0458-63 ",.02)
 ;;00456-0458-63
 ;;9002226.02101,"718,00456-0459-00 ",.01)
 ;;00456-0459-00
 ;;9002226.02101,"718,00456-0459-00 ",.02)
 ;;00456-0459-00
 ;;9002226.02101,"718,00456-0459-01 ",.01)
 ;;00456-0459-01
 ;;9002226.02101,"718,00456-0459-01 ",.02)
 ;;00456-0459-01
 ;;9002226.02101,"718,00456-0459-11 ",.01)
 ;;00456-0459-11
 ;;9002226.02101,"718,00456-0459-11 ",.02)
 ;;00456-0459-11
 ;;9002226.02101,"718,00456-0459-63 ",.01)
 ;;00456-0459-63
 ;;9002226.02101,"718,00456-0459-63 ",.02)
 ;;00456-0459-63
 ;;9002226.02101,"718,00456-0460-01 ",.01)
 ;;00456-0460-01
 ;;9002226.02101,"718,00456-0460-01 ",.02)
 ;;00456-0460-01
 ;;9002226.02101,"718,00456-0461-00 ",.01)
 ;;00456-0461-00
 ;;9002226.02101,"718,00456-0461-00 ",.02)
 ;;00456-0461-00
 ;;9002226.02101,"718,00456-0461-01 ",.01)
 ;;00456-0461-01
 ;;9002226.02101,"718,00456-0461-01 ",.02)
 ;;00456-0461-01
 ;;9002226.02101,"718,00456-0461-63 ",.01)
 ;;00456-0461-63
 ;;9002226.02101,"718,00456-0461-63 ",.02)
 ;;00456-0461-63
 ;;9002226.02101,"718,00456-0462-00 ",.01)
 ;;00456-0462-00
 ;;9002226.02101,"718,00456-0462-00 ",.02)
 ;;00456-0462-00
 ;;9002226.02101,"718,00456-0462-01 ",.01)
 ;;00456-0462-01
 ;;9002226.02101,"718,00456-0462-01 ",.02)
 ;;00456-0462-01
 ;;9002226.02101,"718,00456-0463-01 ",.01)
 ;;00456-0463-01
 ;;9002226.02101,"718,00456-0463-01 ",.02)
 ;;00456-0463-01
 ;;9002226.02101,"718,00456-0464-01 ",.01)
 ;;00456-0464-01
 ;;9002226.02101,"718,00456-0464-01 ",.02)
 ;;00456-0464-01
 ;;9002226.02101,"718,00463-6199-10 ",.01)
 ;;00463-6199-10
 ;;9002226.02101,"718,00463-6199-10 ",.02)
 ;;00463-6199-10
 ;;9002226.02101,"718,00463-6201-10 ",.01)
 ;;00463-6201-10
 ;;9002226.02101,"718,00463-6201-10 ",.02)
 ;;00463-6201-10
 ;;9002226.02101,"718,00463-6203-10 ",.01)
 ;;00463-6203-10
 ;;9002226.02101,"718,00463-6203-10 ",.02)
 ;;00463-6203-10
 ;;9002226.02101,"718,00536-4702-10 ",.01)
 ;;00536-4702-10
 ;;9002226.02101,"718,00536-4702-10 ",.02)
 ;;00536-4702-10
 ;;9002226.02101,"718,00591-3250-01 ",.01)
 ;;00591-3250-01
 ;;9002226.02101,"718,00591-3250-01 ",.02)
 ;;00591-3250-01
 ;;9002226.02101,"718,00591-3253-01 ",.01)
 ;;00591-3253-01
 ;;9002226.02101,"718,00591-3253-01 ",.02)
 ;;00591-3253-01
 ;;9002226.02101,"718,00591-3254-01 ",.01)
 ;;00591-3254-01
 ;;9002226.02101,"718,00591-3254-01 ",.02)
 ;;00591-3254-01
 ;;9002226.02101,"718,00603-4776-21 ",.01)
 ;;00603-4776-21
 ;;9002226.02101,"718,00603-4776-21 ",.02)
 ;;00603-4776-21
 ;;9002226.02101,"718,00603-4777-21 ",.01)
 ;;00603-4777-21
 ;;9002226.02101,"718,00603-4777-21 ",.02)
 ;;00603-4777-21
 ;;9002226.02101,"718,00603-6050-21 ",.01)
 ;;00603-6050-21
 ;;9002226.02101,"718,00603-6050-21 ",.02)
 ;;00603-6050-21
 ;;9002226.02101,"718,00603-6051-21 ",.01)
 ;;00603-6051-21
 ;;9002226.02101,"718,00603-6051-21 ",.02)
 ;;00603-6051-21
 ;;9002226.02101,"718,00603-6051-32 ",.01)
 ;;00603-6051-32
 ;;9002226.02101,"718,00603-6051-32 ",.02)
 ;;00603-6051-32
 ;;9002226.02101,"718,00603-6052-21 ",.01)
 ;;00603-6052-21
 ;;9002226.02101,"718,00603-6052-21 ",.02)
 ;;00603-6052-21
 ;;9002226.02101,"718,00603-6052-32 ",.01)
 ;;00603-6052-32
 ;;9002226.02101,"718,00603-6052-32 ",.02)
 ;;00603-6052-32
 ;;9002226.02101,"718,00603-6053-21 ",.01)
 ;;00603-6053-21
 ;;9002226.02101,"718,00603-6053-21 ",.02)
 ;;00603-6053-21
 ;;9002226.02101,"718,00603-6053-32 ",.01)
 ;;00603-6053-32
 ;;9002226.02101,"718,00603-6053-32 ",.02)
 ;;00603-6053-32
 ;;9002226.02101,"718,00603-6054-21 ",.01)
 ;;00603-6054-21
 ;;9002226.02101,"718,00603-6054-21 ",.02)
 ;;00603-6054-21
 ;;9002226.02101,"718,00603-6054-32 ",.01)
 ;;00603-6054-32
 ;;9002226.02101,"718,00603-6054-32 ",.02)
 ;;00603-6054-32
 ;;9002226.02101,"718,00603-6055-21 ",.01)
 ;;00603-6055-21
 ;;9002226.02101,"718,00603-6055-21 ",.02)
 ;;00603-6055-21
 ;;9002226.02101,"718,00603-6055-32 ",.01)
 ;;00603-6055-32
 ;;9002226.02101,"718,00603-6055-32 ",.02)
 ;;00603-6055-32
 ;;9002226.02101,"718,00603-6056-21 ",.01)
 ;;00603-6056-21
 ;;9002226.02101,"718,00603-6056-21 ",.02)
 ;;00603-6056-21
 ;;9002226.02101,"718,00603-6057-21 ",.01)
 ;;00603-6057-21
 ;;9002226.02101,"718,00603-6057-21 ",.02)
 ;;00603-6057-21
 ;;9002226.02101,"718,00615-1308-13 ",.01)
 ;;00615-1308-13
 ;;9002226.02101,"718,00615-1308-13 ",.02)
 ;;00615-1308-13
 ;;9002226.02101,"718,00781-2502-01 ",.01)
 ;;00781-2502-01
 ;;9002226.02101,"718,00781-2502-01 ",.02)
 ;;00781-2502-01
 ;;9002226.02101,"718,00781-2502-05 ",.01)
 ;;00781-2502-05
 ;;9002226.02101,"718,00781-2502-05 ",.02)
 ;;00781-2502-05
 ;;9002226.02101,"718,00781-2502-10 ",.01)
 ;;00781-2502-10
 ;;9002226.02101,"718,00781-2502-10 ",.02)
 ;;00781-2502-10
 ;;9002226.02101,"718,00781-2503-01 ",.01)
 ;;00781-2503-01
 ;;9002226.02101,"718,00781-2503-01 ",.02)
 ;;00781-2503-01
 ;;9002226.02101,"718,00904-0761-60 ",.01)
 ;;00904-0761-60
 ;;9002226.02101,"718,00904-0761-60 ",.02)
 ;;00904-0761-60
 ;;9002226.02101,"718,00904-0761-80 ",.01)
 ;;00904-0761-80
 ;;9002226.02101,"718,00904-0761-80 ",.02)
 ;;00904-0761-80
 ;;9002226.02101,"718,00904-0762-60 ",.01)
 ;;00904-0762-60
 ;;9002226.02101,"718,00904-0762-60 ",.02)
 ;;00904-0762-60
 ;;9002226.02101,"718,00904-0762-80 ",.01)
 ;;00904-0762-80
 ;;9002226.02101,"718,00904-0762-80 ",.02)
 ;;00904-0762-80
 ;;9002226.02101,"718,00904-0763-60 ",.01)
 ;;00904-0763-60
 ;;9002226.02101,"718,00904-0763-60 ",.02)
 ;;00904-0763-60
 ;;9002226.02101,"718,00904-0808-60 ",.01)
 ;;00904-0808-60
 ;;9002226.02101,"718,00904-0808-60 ",.02)
 ;;00904-0808-60
 ;;9002226.02101,"718,00904-0809-60 ",.01)
 ;;00904-0809-60
 ;;9002226.02101,"718,00904-0809-60 ",.02)
 ;;00904-0809-60
 ;;9002226.02101,"718,00904-0809-80 ",.01)
 ;;00904-0809-80
 ;;9002226.02101,"718,00904-0809-80 ",.02)
 ;;00904-0809-80
 ;;9002226.02101,"718,00904-7721-40 ",.01)
 ;;00904-7721-40
 ;;9002226.02101,"718,00904-7721-40 ",.02)
 ;;00904-7721-40
 ;;9002226.02101,"718,00904-7721-60 ",.01)
 ;;00904-7721-60
 ;;9002226.02101,"718,00904-7721-60 ",.02)
 ;;00904-7721-60
 ;;9002226.02101,"718,00904-7722-40 ",.01)
 ;;00904-7722-40
 ;;9002226.02101,"718,00904-7722-40 ",.02)
 ;;00904-7722-40
 ;;9002226.02101,"718,00904-7722-60 ",.01)
 ;;00904-7722-60
 ;;9002226.02101,"718,00904-7722-60 ",.02)
 ;;00904-7722-60
 ;;9002226.02101,"718,00904-7865-60 ",.01)
 ;;00904-7865-60
 ;;9002226.02101,"718,00904-7865-60 ",.02)
 ;;00904-7865-60
 ;;9002226.02101,"718,00904-7865-80 ",.01)
 ;;00904-7865-80
 ;;9002226.02101,"718,00904-7865-80 ",.02)
 ;;00904-7865-80
 ;;9002226.02101,"718,12280-0130-00 ",.01)
 ;;12280-0130-00
 ;;9002226.02101,"718,12280-0130-00 ",.02)
 ;;12280-0130-00
 ;;9002226.02101,"718,12280-0131-00 ",.01)
 ;;12280-0131-00
 ;;9002226.02101,"718,12280-0131-00 ",.02)
 ;;12280-0131-00
 ;;9002226.02101,"718,12280-0131-30 ",.01)
 ;;12280-0131-30
 ;;9002226.02101,"718,12280-0131-30 ",.02)
 ;;12280-0131-30
 ;;9002226.02101,"718,12280-0204-00 ",.01)
 ;;12280-0204-00
 ;;9002226.02101,"718,12280-0204-00 ",.02)
 ;;12280-0204-00
 ;;9002226.02101,"718,16590-0380-14 ",.01)
 ;;16590-0380-14
 ;;9002226.02101,"718,16590-0380-14 ",.02)
 ;;16590-0380-14
 ;;9002226.02101,"718,21695-0300-14 ",.01)
 ;;21695-0300-14
 ;;9002226.02101,"718,21695-0300-14 ",.02)
 ;;21695-0300-14
 ;;9002226.02101,"718,21695-0300-20 ",.01)
 ;;21695-0300-20
 ;;9002226.02101,"718,21695-0300-20 ",.02)
 ;;21695-0300-20
 ;;9002226.02101,"718,23490-5994-00 ",.01)
 ;;23490-5994-00
 ;;9002226.02101,"718,23490-5994-00 ",.02)
 ;;23490-5994-00
 ;;9002226.02101,"718,23490-5994-01 ",.01)
 ;;23490-5994-01
 ;;9002226.02101,"718,23490-5994-01 ",.02)
 ;;23490-5994-01
 ;;9002226.02101,"718,23490-5994-02 ",.01)
 ;;23490-5994-02
 ;;9002226.02101,"718,23490-5994-02 ",.02)
 ;;23490-5994-02
 ;;9002226.02101,"718,23490-5994-03 ",.01)
 ;;23490-5994-03
 ;;9002226.02101,"718,23490-5994-03 ",.02)
 ;;23490-5994-03
 ;;9002226.02101,"718,23490-6374-01 ",.01)
 ;;23490-6374-01
 ;;9002226.02101,"718,23490-6374-01 ",.02)
 ;;23490-6374-01
 ;;9002226.02101,"718,23490-6377-01 ",.01)
 ;;23490-6377-01
 ;;9002226.02101,"718,23490-6377-01 ",.02)
 ;;23490-6377-01
 ;;9002226.02101,"718,23490-6377-02 ",.01)
 ;;23490-6377-02
 ;;9002226.02101,"718,23490-6377-02 ",.02)
 ;;23490-6377-02
 ;;9002226.02101,"718,23490-6840-01 ",.01)
 ;;23490-6840-01
 ;;9002226.02101,"718,23490-6840-01 ",.02)
 ;;23490-6840-01
 ;;9002226.02101,"718,23490-6840-02 ",.01)
 ;;23490-6840-02
 ;;9002226.02101,"718,23490-6840-02 ",.02)
 ;;23490-6840-02
 ;;9002226.02101,"718,23490-6840-03 ",.01)
 ;;23490-6840-03
 ;;9002226.02101,"718,23490-6840-03 ",.02)
 ;;23490-6840-03
 ;;9002226.02101,"718,23490-6840-04 ",.01)
 ;;23490-6840-04
 ;;9002226.02101,"718,23490-6840-04 ",.02)
 ;;23490-6840-04
 ;;9002226.02101,"718,33358-0265-14 ",.01)
 ;;33358-0265-14
 ;;9002226.02101,"718,33358-0265-14 ",.02)
 ;;33358-0265-14