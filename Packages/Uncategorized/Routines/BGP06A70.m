BGP06A70 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"974,66336-0435-40 ",.01)
 ;;66336-0435-40
 ;;9002226.02101,"974,66336-0435-40 ",.02)
 ;;66336-0435-40
 ;;9002226.02101,"974,66336-0435-60 ",.01)
 ;;66336-0435-60
 ;;9002226.02101,"974,66336-0435-60 ",.02)
 ;;66336-0435-60
 ;;9002226.02101,"974,66336-0441-03 ",.01)
 ;;66336-0441-03
 ;;9002226.02101,"974,66336-0441-03 ",.02)
 ;;66336-0441-03
 ;;9002226.02101,"974,66336-0441-06 ",.01)
 ;;66336-0441-06
 ;;9002226.02101,"974,66336-0441-06 ",.02)
 ;;66336-0441-06
 ;;9002226.02101,"974,66336-0441-08 ",.01)
 ;;66336-0441-08
 ;;9002226.02101,"974,66336-0441-08 ",.02)
 ;;66336-0441-08
 ;;9002226.02101,"974,66336-0441-20 ",.01)
 ;;66336-0441-20
 ;;9002226.02101,"974,66336-0441-20 ",.02)
 ;;66336-0441-20
 ;;9002226.02101,"974,66336-0441-28 ",.01)
 ;;66336-0441-28
 ;;9002226.02101,"974,66336-0441-28 ",.02)
 ;;66336-0441-28
 ;;9002226.02101,"974,66336-0441-30 ",.01)
 ;;66336-0441-30
 ;;9002226.02101,"974,66336-0441-30 ",.02)
 ;;66336-0441-30
 ;;9002226.02101,"974,66336-0441-40 ",.01)
 ;;66336-0441-40
 ;;9002226.02101,"974,66336-0441-40 ",.02)
 ;;66336-0441-40
 ;;9002226.02101,"974,66336-0480-20 ",.01)
 ;;66336-0480-20
 ;;9002226.02101,"974,66336-0480-20 ",.02)
 ;;66336-0480-20
 ;;9002226.02101,"974,66336-0480-28 ",.01)
 ;;66336-0480-28
 ;;9002226.02101,"974,66336-0480-28 ",.02)
 ;;66336-0480-28
 ;;9002226.02101,"974,66336-0480-40 ",.01)
 ;;66336-0480-40
 ;;9002226.02101,"974,66336-0480-40 ",.02)
 ;;66336-0480-40
 ;;9002226.02101,"974,66336-0580-28 ",.01)
 ;;66336-0580-28
 ;;9002226.02101,"974,66336-0580-28 ",.02)
 ;;66336-0580-28
 ;;9002226.02101,"974,66336-0580-30 ",.01)
 ;;66336-0580-30
 ;;9002226.02101,"974,66336-0580-30 ",.02)
 ;;66336-0580-30
 ;;9002226.02101,"974,66336-0593-30 ",.01)
 ;;66336-0593-30
 ;;9002226.02101,"974,66336-0593-30 ",.02)
 ;;66336-0593-30
 ;;9002226.02101,"974,66336-0593-40 ",.01)
 ;;66336-0593-40
 ;;9002226.02101,"974,66336-0593-40 ",.02)
 ;;66336-0593-40
 ;;9002226.02101,"974,66336-0609-06 ",.01)
 ;;66336-0609-06
 ;;9002226.02101,"974,66336-0609-06 ",.02)
 ;;66336-0609-06
 ;;9002226.02101,"974,66336-0609-12 ",.01)
 ;;66336-0609-12
 ;;9002226.02101,"974,66336-0609-12 ",.02)
 ;;66336-0609-12
 ;;9002226.02101,"974,66336-0609-20 ",.01)
 ;;66336-0609-20
 ;;9002226.02101,"974,66336-0609-20 ",.02)
 ;;66336-0609-20
 ;;9002226.02101,"974,66336-0609-28 ",.01)
 ;;66336-0609-28
 ;;9002226.02101,"974,66336-0609-28 ",.02)
 ;;66336-0609-28
 ;;9002226.02101,"974,66336-0609-30 ",.01)
 ;;66336-0609-30
 ;;9002226.02101,"974,66336-0609-30 ",.02)
 ;;66336-0609-30
 ;;9002226.02101,"974,66336-0609-40 ",.01)
 ;;66336-0609-40
 ;;9002226.02101,"974,66336-0609-40 ",.02)
 ;;66336-0609-40
 ;;9002226.02101,"974,66336-0634-08 ",.01)
 ;;66336-0634-08
 ;;9002226.02101,"974,66336-0634-08 ",.02)
 ;;66336-0634-08
 ;;9002226.02101,"974,66336-0634-15 ",.01)
 ;;66336-0634-15
 ;;9002226.02101,"974,66336-0634-15 ",.02)
 ;;66336-0634-15
 ;;9002226.02101,"974,66336-0634-21 ",.01)
 ;;66336-0634-21
 ;;9002226.02101,"974,66336-0634-21 ",.02)
 ;;66336-0634-21
 ;;9002226.02101,"974,66336-0634-30 ",.01)
 ;;66336-0634-30
 ;;9002226.02101,"974,66336-0634-30 ",.02)
 ;;66336-0634-30
 ;;9002226.02101,"974,66336-0634-40 ",.01)
 ;;66336-0634-40
 ;;9002226.02101,"974,66336-0634-40 ",.02)
 ;;66336-0634-40
 ;;9002226.02101,"974,66336-0634-42 ",.01)
 ;;66336-0634-42
 ;;9002226.02101,"974,66336-0634-42 ",.02)
 ;;66336-0634-42
 ;;9002226.02101,"974,66336-0655-21 ",.01)
 ;;66336-0655-21
 ;;9002226.02101,"974,66336-0655-21 ",.02)
 ;;66336-0655-21
 ;;9002226.02101,"974,66336-0655-30 ",.01)
 ;;66336-0655-30
 ;;9002226.02101,"974,66336-0655-30 ",.02)
 ;;66336-0655-30
 ;;9002226.02101,"974,66685-1001-00 ",.01)
 ;;66685-1001-00
 ;;9002226.02101,"974,66685-1001-00 ",.02)
 ;;66685-1001-00
 ;;9002226.02101,"974,66685-1002-00 ",.01)
 ;;66685-1002-00
 ;;9002226.02101,"974,66685-1002-00 ",.02)
 ;;66685-1002-00
 ;;9002226.02101,"974,66685-1002-02 ",.01)
 ;;66685-1002-02
 ;;9002226.02101,"974,66685-1002-02 ",.02)
 ;;66685-1002-02
 ;;9002226.02101,"974,66685-1011-00 ",.01)
 ;;66685-1011-00
 ;;9002226.02101,"974,66685-1011-00 ",.02)
 ;;66685-1011-00
 ;;9002226.02101,"974,66685-1011-01 ",.01)
 ;;66685-1011-01
 ;;9002226.02101,"974,66685-1011-01 ",.02)
 ;;66685-1011-01
 ;;9002226.02101,"974,66685-1011-02 ",.01)
 ;;66685-1011-02
 ;;9002226.02101,"974,66685-1011-02 ",.02)
 ;;66685-1011-02
 ;;9002226.02101,"974,66685-1012-00 ",.01)
 ;;66685-1012-00
 ;;9002226.02101,"974,66685-1012-00 ",.02)
 ;;66685-1012-00
 ;;9002226.02101,"974,66685-1012-01 ",.01)
 ;;66685-1012-01
 ;;9002226.02101,"974,66685-1012-01 ",.02)
 ;;66685-1012-01
 ;;9002226.02101,"974,66685-1012-02 ",.01)
 ;;66685-1012-02
 ;;9002226.02101,"974,66685-1012-02 ",.02)
 ;;66685-1012-02
 ;;9002226.02101,"974,66814-0601-20 ",.01)
 ;;66814-0601-20
 ;;9002226.02101,"974,66814-0601-20 ",.02)
 ;;66814-0601-20
 ;;9002226.02101,"974,66814-0601-60 ",.01)
 ;;66814-0601-60
 ;;9002226.02101,"974,66814-0601-60 ",.02)
 ;;66814-0601-60
 ;;9002226.02101,"974,66814-0602-20 ",.01)
 ;;66814-0602-20
 ;;9002226.02101,"974,66814-0602-20 ",.02)
 ;;66814-0602-20
 ;;9002226.02101,"974,66814-0602-60 ",.01)
 ;;66814-0602-60
 ;;9002226.02101,"974,66814-0602-60 ",.02)
 ;;66814-0602-60
 ;;9002226.02101,"974,66814-0610-70 ",.01)
 ;;66814-0610-70
 ;;9002226.02101,"974,66814-0610-70 ",.02)
 ;;66814-0610-70
 ;;9002226.02101,"974,66814-0611-70 ",.01)
 ;;66814-0611-70
 ;;9002226.02101,"974,66814-0611-70 ",.02)
 ;;66814-0611-70
 ;;9002226.02101,"974,66814-0620-70 ",.01)
 ;;66814-0620-70
 ;;9002226.02101,"974,66814-0620-70 ",.02)
 ;;66814-0620-70
 ;;9002226.02101,"974,66814-0620-80 ",.01)
 ;;66814-0620-80
 ;;9002226.02101,"974,66814-0620-80 ",.02)
 ;;66814-0620-80
 ;;9002226.02101,"974,66814-0621-70 ",.01)
 ;;66814-0621-70
 ;;9002226.02101,"974,66814-0621-70 ",.02)
 ;;66814-0621-70
 ;;9002226.02101,"974,66814-0621-80 ",.01)
 ;;66814-0621-80
 ;;9002226.02101,"974,66814-0621-80 ",.02)
 ;;66814-0621-80
 ;;9002226.02101,"974,66860-0001-03 ",.01)
 ;;66860-0001-03
 ;;9002226.02101,"974,66860-0001-03 ",.02)
 ;;66860-0001-03
 ;;9002226.02101,"974,66860-0002-03 ",.01)
 ;;66860-0002-03
 ;;9002226.02101,"974,66860-0002-03 ",.02)
 ;;66860-0002-03
 ;;9002226.02101,"974,66860-0003-02 ",.01)
 ;;66860-0003-02
 ;;9002226.02101,"974,66860-0003-02 ",.02)
 ;;66860-0003-02
 ;;9002226.02101,"974,66860-0030-03 ",.01)
 ;;66860-0030-03
 ;;9002226.02101,"974,66860-0030-03 ",.02)
 ;;66860-0030-03
 ;;9002226.02101,"974,66860-0031-03 ",.01)
 ;;66860-0031-03
 ;;9002226.02101,"974,66860-0031-03 ",.02)
 ;;66860-0031-03
 ;;9002226.02101,"974,66860-0032-02 ",.01)
 ;;66860-0032-02
 ;;9002226.02101,"974,66860-0032-02 ",.02)
 ;;66860-0032-02
 ;;9002226.02101,"974,67046-0020-21 ",.01)
 ;;67046-0020-21
 ;;9002226.02101,"974,67046-0020-21 ",.02)
 ;;67046-0020-21
 ;;9002226.02101,"974,67046-0020-30 ",.01)
 ;;67046-0020-30
 ;;9002226.02101,"974,67046-0020-30 ",.02)
 ;;67046-0020-30
 ;;9002226.02101,"974,67046-0090-21 ",.01)
 ;;67046-0090-21
 ;;9002226.02101,"974,67046-0090-21 ",.02)
 ;;67046-0090-21
 ;;9002226.02101,"974,67046-0090-28 ",.01)
 ;;67046-0090-28
 ;;9002226.02101,"974,67046-0090-28 ",.02)
 ;;67046-0090-28
 ;;9002226.02101,"974,67046-0090-30 ",.01)
 ;;67046-0090-30
 ;;9002226.02101,"974,67046-0090-30 ",.02)
 ;;67046-0090-30
 ;;9002226.02101,"974,67046-0135-14 ",.01)
 ;;67046-0135-14
 ;;9002226.02101,"974,67046-0135-14 ",.02)
 ;;67046-0135-14
 ;;9002226.02101,"974,67046-0135-20 ",.01)
 ;;67046-0135-20
 ;;9002226.02101,"974,67046-0135-20 ",.02)
 ;;67046-0135-20
 ;;9002226.02101,"974,67046-0135-30 ",.01)
 ;;67046-0135-30
 ;;9002226.02101,"974,67046-0135-30 ",.02)
 ;;67046-0135-30
 ;;9002226.02101,"974,67046-0576-21 ",.01)
 ;;67046-0576-21
 ;;9002226.02101,"974,67046-0576-21 ",.02)
 ;;67046-0576-21
 ;;9002226.02101,"974,67046-0576-28 ",.01)
 ;;67046-0576-28
 ;;9002226.02101,"974,67046-0576-28 ",.02)
 ;;67046-0576-28
 ;;9002226.02101,"974,67046-0576-30 ",.01)
 ;;67046-0576-30
 ;;9002226.02101,"974,67046-0576-30 ",.02)
 ;;67046-0576-30
 ;;9002226.02101,"974,67046-0728-30 ",.01)
 ;;67046-0728-30
 ;;9002226.02101,"974,67046-0728-30 ",.02)
 ;;67046-0728-30
 ;;9002226.02101,"974,67253-0140-10 ",.01)
 ;;67253-0140-10
 ;;9002226.02101,"974,67253-0140-10 ",.02)
 ;;67253-0140-10
 ;;9002226.02101,"974,67253-0140-50 ",.01)
 ;;67253-0140-50
 ;;9002226.02101,"974,67253-0140-50 ",.02)
 ;;67253-0140-50
 ;;9002226.02101,"974,67253-0141-10 ",.01)
 ;;67253-0141-10
 ;;9002226.02101,"974,67253-0141-10 ",.02)
 ;;67253-0141-10
 ;;9002226.02101,"974,67253-0141-50 ",.01)
 ;;67253-0141-50
 ;;9002226.02101,"974,67253-0141-50 ",.02)
 ;;67253-0141-50
 ;;9002226.02101,"974,67253-0142-08 ",.01)
 ;;67253-0142-08
 ;;9002226.02101,"974,67253-0142-08 ",.02)
 ;;67253-0142-08
 ;;9002226.02101,"974,67253-0142-10 ",.01)
 ;;67253-0142-10
 ;;9002226.02101,"974,67253-0142-10 ",.02)
 ;;67253-0142-10
 ;;9002226.02101,"974,67253-0142-15 ",.01)
 ;;67253-0142-15
 ;;9002226.02101,"974,67253-0142-15 ",.02)
 ;;67253-0142-15
 ;;9002226.02101,"974,67253-0143-08 ",.01)
 ;;67253-0143-08
 ;;9002226.02101,"974,67253-0143-08 ",.02)
 ;;67253-0143-08
 ;;9002226.02101,"974,67253-0143-10 ",.01)
 ;;67253-0143-10
 ;;9002226.02101,"974,67253-0143-10 ",.02)
 ;;67253-0143-10
 ;;9002226.02101,"974,67253-0143-15 ",.01)
 ;;67253-0143-15
 ;;9002226.02101,"974,67253-0143-15 ",.02)
 ;;67253-0143-15
 ;;9002226.02101,"974,67253-0180-10 ",.01)
 ;;67253-0180-10
 ;;9002226.02101,"974,67253-0180-10 ",.02)
 ;;67253-0180-10
 ;;9002226.02101,"974,67253-0180-50 ",.01)
 ;;67253-0180-50
 ;;9002226.02101,"974,67253-0180-50 ",.02)
 ;;67253-0180-50
 ;;9002226.02101,"974,67253-0181-10 ",.01)
 ;;67253-0181-10
 ;;9002226.02101,"974,67253-0181-10 ",.02)
 ;;67253-0181-10
 ;;9002226.02101,"974,67253-0181-50 ",.01)
 ;;67253-0181-50
 ;;9002226.02101,"974,67253-0181-50 ",.02)
 ;;67253-0181-50
 ;;9002226.02101,"974,67253-0182-10 ",.01)
 ;;67253-0182-10
 ;;9002226.02101,"974,67253-0182-10 ",.02)
 ;;67253-0182-10
 ;;9002226.02101,"974,67253-0182-20 ",.01)
 ;;67253-0182-20
 ;;9002226.02101,"974,67253-0182-20 ",.02)
 ;;67253-0182-20
 ;;9002226.02101,"974,67253-0183-10 ",.01)
 ;;67253-0183-10
 ;;9002226.02101,"974,67253-0183-10 ",.02)
 ;;67253-0183-10
 ;;9002226.02101,"974,67253-0183-20 ",.01)
 ;;67253-0183-20
 ;;9002226.02101,"974,67253-0183-20 ",.02)
 ;;67253-0183-20
 ;;9002226.02101,"974,67253-0200-10 ",.01)
 ;;67253-0200-10
 ;;9002226.02101,"974,67253-0200-10 ",.02)
 ;;67253-0200-10
 ;;9002226.02101,"974,67253-0200-11 ",.01)
 ;;67253-0200-11
 ;;9002226.02101,"974,67253-0200-11 ",.02)
 ;;67253-0200-11
 ;;9002226.02101,"974,67253-0201-10 ",.01)
 ;;67253-0201-10
 ;;9002226.02101,"974,67253-0201-10 ",.02)
 ;;67253-0201-10
 ;;9002226.02101,"974,67253-0201-50 ",.01)
 ;;67253-0201-50
 ;;9002226.02101,"974,67253-0201-50 ",.02)
 ;;67253-0201-50
 ;;9002226.02101,"974,67253-0202-10 ",.01)
 ;;67253-0202-10
 ;;9002226.02101,"974,67253-0202-10 ",.02)
 ;;67253-0202-10
 ;;9002226.02101,"974,67253-0202-20 ",.01)
 ;;67253-0202-20
 ;;9002226.02101,"974,67253-0202-20 ",.02)
 ;;67253-0202-20
 ;;9002226.02101,"974,67253-0203-10 ",.01)
 ;;67253-0203-10
 ;;9002226.02101,"974,67253-0203-10 ",.02)
 ;;67253-0203-10
 ;;9002226.02101,"974,67253-0203-20 ",.01)
 ;;67253-0203-20
 ;;9002226.02101,"974,67253-0203-20 ",.02)
 ;;67253-0203-20
 ;;9002226.02101,"974,67253-0300-10 ",.01)
 ;;67253-0300-10
 ;;9002226.02101,"974,67253-0300-10 ",.02)
 ;;67253-0300-10
 ;;9002226.02101,"974,67253-0300-50 ",.01)
 ;;67253-0300-50
 ;;9002226.02101,"974,67253-0300-50 ",.02)
 ;;67253-0300-50
 ;;9002226.02101,"974,67253-0301-10 ",.01)
 ;;67253-0301-10
 ;;9002226.02101,"974,67253-0301-10 ",.02)
 ;;67253-0301-10
 ;;9002226.02101,"974,67253-0301-50 ",.01)
 ;;67253-0301-50
 ;;9002226.02101,"974,67253-0301-50 ",.02)
 ;;67253-0301-50
 ;;9002226.02101,"974,67253-0780-02 ",.01)
 ;;67253-0780-02
 ;;9002226.02101,"974,67253-0780-02 ",.02)
 ;;67253-0780-02
 ;;9002226.02101,"974,67253-0781-02 ",.01)
 ;;67253-0781-02
 ;;9002226.02101,"974,67253-0781-02 ",.02)
 ;;67253-0781-02
 ;;9002226.02101,"974,67767-0137-01 ",.01)
 ;;67767-0137-01
 ;;9002226.02101,"974,67767-0137-01 ",.02)
 ;;67767-0137-01
 ;;9002226.02101,"974,67767-0138-01 ",.01)
 ;;67767-0138-01
 ;;9002226.02101,"974,67767-0138-01 ",.02)
 ;;67767-0138-01
 ;;9002226.02101,"974,67767-0139-11 ",.01)
 ;;67767-0139-11
 ;;9002226.02101,"974,67767-0139-11 ",.02)
 ;;67767-0139-11
 ;;9002226.02101,"974,67781-0181-60 ",.01)
 ;;67781-0181-60
 ;;9002226.02101,"974,67781-0181-60 ",.02)
 ;;67781-0181-60
 ;;9002226.02101,"974,67870-0109-50 ",.01)
 ;;67870-0109-50
 ;;9002226.02101,"974,67870-0109-50 ",.02)
 ;;67870-0109-50
 ;;9002226.02101,"974,67870-0110-05 ",.01)
 ;;67870-0110-05
 ;;9002226.02101,"974,67870-0110-05 ",.02)
 ;;67870-0110-05
 ;;9002226.02101,"974,67870-0110-50 ",.01)
 ;;67870-0110-50
 ;;9002226.02101,"974,67870-0110-50 ",.02)
 ;;67870-0110-50
 ;;9002226.02101,"974,67870-0112-05 ",.01)
 ;;67870-0112-05
 ;;9002226.02101,"974,67870-0112-05 ",.02)
 ;;67870-0112-05
 ;;9002226.02101,"974,67870-0112-50 ",.01)
 ;;67870-0112-50
 ;;9002226.02101,"974,67870-0112-50 ",.02)
 ;;67870-0112-50
 ;;9002226.02101,"974,68084-0069-01 ",.01)
 ;;68084-0069-01
 ;;9002226.02101,"974,68084-0069-01 ",.02)
 ;;68084-0069-01
 ;;9002226.02101,"974,68084-0070-01 ",.01)
 ;;68084-0070-01
 ;;9002226.02101,"974,68084-0070-01 ",.02)
 ;;68084-0070-01
 ;;9002226.02101,"974,68084-0071-01 ",.01)
 ;;68084-0071-01
 ;;9002226.02101,"974,68084-0071-01 ",.02)
 ;;68084-0071-01
