BGP9SXIE ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON MAR 25, 2009 ;
 ;;9.0;IHS CLINICAL REPORTING;;JUL 1, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"728,00472-1015-16 ",.01)
 ;;00472-1015-16
 ;;9002226.02101,"728,00472-1015-16 ",.02)
 ;;00472-1015-16
 ;;9002226.02101,"728,00472-1015-28 ",.01)
 ;;00472-1015-28
 ;;9002226.02101,"728,00472-1015-28 ",.02)
 ;;00472-1015-28
 ;;9002226.02101,"728,00536-4224-10 ",.01)
 ;;00536-4224-10
 ;;9002226.02101,"728,00536-4224-10 ",.02)
 ;;00536-4224-10
 ;;9002226.02101,"728,00556-0112-16 ",.01)
 ;;00556-0112-16
 ;;9002226.02101,"728,00556-0112-16 ",.02)
 ;;00556-0112-16
 ;;9002226.02101,"728,00556-0112-28 ",.01)
 ;;00556-0112-28
 ;;9002226.02101,"728,00556-0112-28 ",.02)
 ;;00556-0112-28
 ;;9002226.02101,"728,00603-1508-58 ",.01)
 ;;00603-1508-58
 ;;9002226.02101,"728,00603-1508-58 ",.02)
 ;;00603-1508-58
 ;;9002226.02101,"728,00603-5165-21 ",.01)
 ;;00603-5165-21
 ;;9002226.02101,"728,00603-5165-21 ",.02)
 ;;00603-5165-21
 ;;9002226.02101,"728,00603-5165-32 ",.01)
 ;;00603-5165-32
 ;;9002226.02101,"728,00603-5165-32 ",.02)
 ;;00603-5165-32
 ;;9002226.02101,"728,00603-5166-02 ",.01)
 ;;00603-5166-02
 ;;9002226.02101,"728,00603-5166-02 ",.02)
 ;;00603-5166-02
 ;;9002226.02101,"728,00603-5166-16 ",.01)
 ;;00603-5166-16
 ;;9002226.02101,"728,00603-5166-16 ",.02)
 ;;00603-5166-16
 ;;9002226.02101,"728,00603-5166-20 ",.01)
 ;;00603-5166-20
 ;;9002226.02101,"728,00603-5166-20 ",.02)
 ;;00603-5166-20
 ;;9002226.02101,"728,00603-5166-21 ",.01)
 ;;00603-5166-21
 ;;9002226.02101,"728,00603-5166-21 ",.02)
 ;;00603-5166-21
 ;;9002226.02101,"728,00603-5166-22 ",.01)
 ;;00603-5166-22
 ;;9002226.02101,"728,00603-5166-22 ",.02)
 ;;00603-5166-22
 ;;9002226.02101,"728,00603-5166-32 ",.01)
 ;;00603-5166-32
 ;;9002226.02101,"728,00603-5166-32 ",.02)
 ;;00603-5166-32
 ;;9002226.02101,"728,00603-5167-21 ",.01)
 ;;00603-5167-21
 ;;9002226.02101,"728,00603-5167-21 ",.02)
 ;;00603-5167-21
 ;;9002226.02101,"728,00603-5167-32 ",.01)
 ;;00603-5167-32
 ;;9002226.02101,"728,00603-5167-32 ",.02)
 ;;00603-5167-32
 ;;9002226.02101,"728,00603-5168-21 ",.01)
 ;;00603-5168-21
 ;;9002226.02101,"728,00603-5168-21 ",.02)
 ;;00603-5168-21
 ;;9002226.02101,"728,00603-5168-32 ",.01)
 ;;00603-5168-32
 ;;9002226.02101,"728,00603-5168-32 ",.02)
 ;;00603-5168-32
 ;;9002226.02101,"728,00615-0418-47 ",.01)
 ;;00615-0418-47
 ;;9002226.02101,"728,00615-0418-47 ",.02)
 ;;00615-0418-47
 ;;9002226.02101,"728,00615-0423-47 ",.01)
 ;;00615-0423-47
 ;;9002226.02101,"728,00615-0423-47 ",.02)
 ;;00615-0423-47
 ;;9002226.02101,"728,00641-0476-25 ",.01)
 ;;00641-0476-25
 ;;9002226.02101,"728,00641-0476-25 ",.02)
 ;;00641-0476-25
 ;;9002226.02101,"728,00641-0477-25 ",.01)
 ;;00641-0477-25
 ;;9002226.02101,"728,00641-0477-25 ",.02)
 ;;00641-0477-25
 ;;9002226.02101,"728,00677-0236-10 ",.01)
 ;;00677-0236-10
 ;;9002226.02101,"728,00677-0236-10 ",.02)
 ;;00677-0236-10
 ;;9002226.02101,"728,00677-0237-10 ",.01)
 ;;00677-0237-10
 ;;9002226.02101,"728,00677-0237-10 ",.02)
 ;;00677-0237-10
 ;;9002226.02101,"728,00677-0238-10 ",.01)
 ;;00677-0238-10
 ;;9002226.02101,"728,00677-0238-10 ",.02)
 ;;00677-0238-10
 ;;9002226.02101,"728,00677-0762-10 ",.01)
 ;;00677-0762-10
 ;;9002226.02101,"728,00677-0762-10 ",.02)
 ;;00677-0762-10
 ;;9002226.02101,"728,00677-1666-10 ",.01)
 ;;00677-1666-10
 ;;9002226.02101,"728,00677-1666-10 ",.02)
 ;;00677-1666-10
 ;;9002226.02101,"728,00677-1667-10 ",.01)
 ;;00677-1667-10
 ;;9002226.02101,"728,00677-1667-10 ",.02)
 ;;00677-1667-10
 ;;9002226.02101,"728,00677-1668-10 ",.01)
 ;;00677-1668-10
 ;;9002226.02101,"728,00677-1668-10 ",.02)
 ;;00677-1668-10
 ;;9002226.02101,"728,00677-1669-10 ",.01)
 ;;00677-1669-10
 ;;9002226.02101,"728,00677-1669-10 ",.02)
 ;;00677-1669-10
 ;;9002226.02101,"728,00677-1698-10 ",.01)
 ;;00677-1698-10
 ;;9002226.02101,"728,00677-1698-10 ",.02)
 ;;00677-1698-10
 ;;9002226.02101,"728,00677-1699-10 ",.01)
 ;;00677-1699-10
 ;;9002226.02101,"728,00677-1699-10 ",.02)
 ;;00677-1699-10
 ;;9002226.02101,"728,00677-1731-10 ",.01)
 ;;00677-1731-10
 ;;9002226.02101,"728,00677-1731-10 ",.02)
 ;;00677-1731-10
 ;;9002226.02101,"728,00677-1732-10 ",.01)
 ;;00677-1732-10
 ;;9002226.02101,"728,00677-1732-10 ",.02)
 ;;00677-1732-10
 ;;9002226.02101,"728,00677-1938-10 ",.01)
 ;;00677-1938-10
 ;;9002226.02101,"728,00677-1938-10 ",.02)
 ;;00677-1938-10
 ;;9002226.02101,"728,00677-1939-10 ",.01)
 ;;00677-1939-10
 ;;9002226.02101,"728,00677-1939-10 ",.02)
 ;;00677-1939-10
 ;;9002226.02101,"728,00839-1478-16 ",.01)
 ;;00839-1478-16
 ;;9002226.02101,"728,00839-1478-16 ",.02)
 ;;00839-1478-16
 ;;9002226.02101,"728,00839-1484-16 ",.01)
 ;;00839-1484-16
 ;;9002226.02101,"728,00839-1484-16 ",.02)
 ;;00839-1484-16
 ;;9002226.02101,"728,00839-5154-16 ",.01)
 ;;00839-5154-16
 ;;9002226.02101,"728,00839-5154-16 ",.02)
 ;;00839-5154-16
 ;;9002226.02101,"728,00839-5398-69 ",.01)
 ;;00839-5398-69
 ;;9002226.02101,"728,00839-5398-69 ",.02)
 ;;00839-5398-69
 ;;9002226.02101,"728,00839-6257-16 ",.01)
 ;;00839-6257-16
 ;;9002226.02101,"728,00839-6257-16 ",.02)
 ;;00839-6257-16
 ;;9002226.02101,"728,00879-0049-16 ",.01)
 ;;00879-0049-16
 ;;9002226.02101,"728,00879-0049-16 ",.02)
 ;;00879-0049-16
 ;;9002226.02101,"728,00904-1015-16 ",.01)
 ;;00904-1015-16
 ;;9002226.02101,"728,00904-1015-16 ",.02)
 ;;00904-1015-16
