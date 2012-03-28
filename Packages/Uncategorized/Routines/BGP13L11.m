BGP13L11 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"700,66591-0622-41 ",.01)
 ;;66591-0622-41
 ;;9002226.02101,"700,66591-0622-41 ",.02)
 ;;66591-0622-41
 ;;9002226.02101,"700,66591-0631-41 ",.01)
 ;;66591-0631-41
 ;;9002226.02101,"700,66591-0631-41 ",.02)
 ;;66591-0631-41
 ;;9002226.02101,"700,66591-0631-51 ",.01)
 ;;66591-0631-51
 ;;9002226.02101,"700,66591-0631-51 ",.02)
 ;;66591-0631-51
 ;;9002226.02101,"700,66591-0641-41 ",.01)
 ;;66591-0641-41
 ;;9002226.02101,"700,66591-0641-41 ",.02)
 ;;66591-0641-41
 ;;9002226.02101,"700,66591-0641-51 ",.01)
 ;;66591-0641-51
 ;;9002226.02101,"700,66591-0641-51 ",.02)
 ;;66591-0641-51
 ;;9002226.02101,"700,66591-0651-41 ",.01)
 ;;66591-0651-41
 ;;9002226.02101,"700,66591-0651-41 ",.02)
 ;;66591-0651-41
 ;;9002226.02101,"700,66591-0691-41 ",.01)
 ;;66591-0691-41
 ;;9002226.02101,"700,66591-0691-41 ",.02)
 ;;66591-0691-41
 ;;9002226.02101,"700,66591-1622-41 ",.01)
 ;;66591-1622-41
 ;;9002226.02101,"700,66591-1622-41 ",.02)
 ;;66591-1622-41
 ;;9002226.02101,"700,67544-0033-30 ",.01)
 ;;67544-0033-30
 ;;9002226.02101,"700,67544-0033-30 ",.02)
 ;;67544-0033-30
 ;;9002226.02101,"700,67544-0131-30 ",.01)
 ;;67544-0131-30
 ;;9002226.02101,"700,67544-0131-30 ",.02)
 ;;67544-0131-30
 ;;9002226.02101,"700,67544-0138-30 ",.01)
 ;;67544-0138-30
 ;;9002226.02101,"700,67544-0138-30 ",.02)
 ;;67544-0138-30
 ;;9002226.02101,"700,67544-0151-30 ",.01)
 ;;67544-0151-30
 ;;9002226.02101,"700,67544-0151-30 ",.02)
 ;;67544-0151-30
 ;;9002226.02101,"700,67544-0396-30 ",.01)
 ;;67544-0396-30
 ;;9002226.02101,"700,67544-0396-30 ",.02)
 ;;67544-0396-30
 ;;9002226.02101,"700,67544-0497-30 ",.01)
 ;;67544-0497-30
 ;;9002226.02101,"700,67544-0497-30 ",.02)
 ;;67544-0497-30
 ;;9002226.02101,"700,68071-0760-30 ",.01)
 ;;68071-0760-30
 ;;9002226.02101,"700,68071-0760-30 ",.02)
 ;;68071-0760-30
 ;;9002226.02101,"700,68084-0393-01 ",.01)
 ;;68084-0393-01
 ;;9002226.02101,"700,68084-0393-01 ",.02)
 ;;68084-0393-01
 ;;9002226.02101,"700,68115-0305-00 ",.01)
 ;;68115-0305-00
 ;;9002226.02101,"700,68115-0305-00 ",.02)
 ;;68115-0305-00
 ;;9002226.02101,"700,68115-0305-20 ",.01)
 ;;68115-0305-20
 ;;9002226.02101,"700,68115-0305-20 ",.02)
 ;;68115-0305-20
 ;;9002226.02101,"700,68115-0305-25 ",.01)
 ;;68115-0305-25
 ;;9002226.02101,"700,68115-0305-25 ",.02)
 ;;68115-0305-25
 ;;9002226.02101,"700,68115-0305-30 ",.01)
 ;;68115-0305-30
 ;;9002226.02101,"700,68115-0305-30 ",.02)
 ;;68115-0305-30
 ;;9002226.02101,"700,68115-0305-40 ",.01)
 ;;68115-0305-40
 ;;9002226.02101,"700,68115-0305-40 ",.02)
 ;;68115-0305-40
 ;;9002226.02101,"700,68115-0305-60 ",.01)
 ;;68115-0305-60
 ;;9002226.02101,"700,68115-0305-60 ",.02)
 ;;68115-0305-60
 ;;9002226.02101,"700,68115-0305-90 ",.01)
 ;;68115-0305-90
 ;;9002226.02101,"700,68115-0305-90 ",.02)
 ;;68115-0305-90
 ;;9002226.02101,"700,68115-0305-99 ",.01)
 ;;68115-0305-99
 ;;9002226.02101,"700,68115-0305-99 ",.02)
 ;;68115-0305-99
 ;;9002226.02101,"700,68115-0306-12 ",.01)
 ;;68115-0306-12
 ;;9002226.02101,"700,68115-0306-12 ",.02)
 ;;68115-0306-12
 ;;9002226.02101,"700,68115-0306-30 ",.01)
 ;;68115-0306-30
 ;;9002226.02101,"700,68115-0306-30 ",.02)
 ;;68115-0306-30
 ;;9002226.02101,"700,68115-0306-60 ",.01)
 ;;68115-0306-60
 ;;9002226.02101,"700,68115-0306-60 ",.02)
 ;;68115-0306-60
 ;;9002226.02101,"700,68115-0462-30 ",.01)
 ;;68115-0462-30
 ;;9002226.02101,"700,68115-0462-30 ",.02)
 ;;68115-0462-30
 ;;9002226.02101,"700,68115-0462-60 ",.01)
 ;;68115-0462-60
 ;;9002226.02101,"700,68115-0462-60 ",.02)
 ;;68115-0462-60
 ;;9002226.02101,"700,68115-0605-00 ",.01)
 ;;68115-0605-00
 ;;9002226.02101,"700,68115-0605-00 ",.02)
 ;;68115-0605-00
 ;;9002226.02101,"700,68115-0743-00 ",.01)
 ;;68115-0743-00
 ;;9002226.02101,"700,68115-0743-00 ",.02)
 ;;68115-0743-00
 ;;9002226.02101,"700,68115-0815-00 ",.01)
 ;;68115-0815-00
 ;;9002226.02101,"700,68115-0815-00 ",.02)
 ;;68115-0815-00
 ;;9002226.02101,"700,68387-0100-01 ",.01)
 ;;68387-0100-01
 ;;9002226.02101,"700,68387-0100-01 ",.02)
 ;;68387-0100-01
 ;;9002226.02101,"700,68387-0100-12 ",.01)
 ;;68387-0100-12
 ;;9002226.02101,"700,68387-0100-12 ",.02)
 ;;68387-0100-12
 ;;9002226.02101,"700,68387-0100-15 ",.01)
 ;;68387-0100-15
 ;;9002226.02101,"700,68387-0100-15 ",.02)
 ;;68387-0100-15
 ;;9002226.02101,"700,68387-0100-30 ",.01)
 ;;68387-0100-30
 ;;9002226.02101,"700,68387-0100-30 ",.02)
 ;;68387-0100-30
 ;;9002226.02101,"700,68387-0100-40 ",.01)
 ;;68387-0100-40
 ;;9002226.02101,"700,68387-0100-40 ",.02)
 ;;68387-0100-40
 ;;9002226.02101,"700,68387-0100-50 ",.01)
 ;;68387-0100-50
 ;;9002226.02101,"700,68387-0100-50 ",.02)
 ;;68387-0100-50
 ;;9002226.02101,"700,68387-0100-60 ",.01)
 ;;68387-0100-60
 ;;9002226.02101,"700,68387-0100-60 ",.02)
 ;;68387-0100-60
 ;;9002226.02101,"700,68387-0100-90 ",.01)
 ;;68387-0100-90
 ;;9002226.02101,"700,68387-0100-90 ",.02)
 ;;68387-0100-90
 ;;9002226.02101,"700,68387-0531-12 ",.01)
 ;;68387-0531-12
 ;;9002226.02101,"700,68387-0531-12 ",.02)
 ;;68387-0531-12
 ;;9002226.02101,"700,68387-0531-60 ",.01)
 ;;68387-0531-60
 ;;9002226.02101,"700,68387-0531-60 ",.02)
 ;;68387-0531-60
