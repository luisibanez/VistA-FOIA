BGP13Z14 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1102,67544-0421-60 ",.02)
 ;;67544-0421-60
 ;;9002226.02101,"1102,67544-0421-80 ",.01)
 ;;67544-0421-80
 ;;9002226.02101,"1102,67544-0421-80 ",.02)
 ;;67544-0421-80
 ;;9002226.02101,"1102,67544-0421-92 ",.01)
 ;;67544-0421-92
 ;;9002226.02101,"1102,67544-0421-92 ",.02)
 ;;67544-0421-92
 ;;9002226.02101,"1102,67544-0422-30 ",.01)
 ;;67544-0422-30
 ;;9002226.02101,"1102,67544-0422-30 ",.02)
 ;;67544-0422-30
 ;;9002226.02101,"1102,67544-0422-53 ",.01)
 ;;67544-0422-53
 ;;9002226.02101,"1102,67544-0422-53 ",.02)
 ;;67544-0422-53
 ;;9002226.02101,"1102,67544-0422-60 ",.01)
 ;;67544-0422-60
 ;;9002226.02101,"1102,67544-0422-60 ",.02)
 ;;67544-0422-60
 ;;9002226.02101,"1102,67544-0422-70 ",.01)
 ;;67544-0422-70
 ;;9002226.02101,"1102,67544-0422-70 ",.02)
 ;;67544-0422-70
 ;;9002226.02101,"1102,67544-0422-75 ",.01)
 ;;67544-0422-75
 ;;9002226.02101,"1102,67544-0422-75 ",.02)
 ;;67544-0422-75
 ;;9002226.02101,"1102,67544-0422-80 ",.01)
 ;;67544-0422-80
 ;;9002226.02101,"1102,67544-0422-80 ",.02)
 ;;67544-0422-80
 ;;9002226.02101,"1102,67544-0422-90 ",.01)
 ;;67544-0422-90
 ;;9002226.02101,"1102,67544-0422-90 ",.02)
 ;;67544-0422-90
 ;;9002226.02101,"1102,67544-0422-92 ",.01)
 ;;67544-0422-92
 ;;9002226.02101,"1102,67544-0422-92 ",.02)
 ;;67544-0422-92
 ;;9002226.02101,"1102,67544-0422-94 ",.01)
 ;;67544-0422-94
 ;;9002226.02101,"1102,67544-0422-94 ",.02)
 ;;67544-0422-94
 ;;9002226.02101,"1102,67544-0422-96 ",.01)
 ;;67544-0422-96
 ;;9002226.02101,"1102,67544-0422-96 ",.02)
 ;;67544-0422-96
 ;;9002226.02101,"1102,67544-0424-30 ",.01)
 ;;67544-0424-30
 ;;9002226.02101,"1102,67544-0424-30 ",.02)
 ;;67544-0424-30
 ;;9002226.02101,"1102,67544-0424-53 ",.01)
 ;;67544-0424-53
 ;;9002226.02101,"1102,67544-0424-53 ",.02)
 ;;67544-0424-53
 ;;9002226.02101,"1102,67544-0424-60 ",.01)
 ;;67544-0424-60
 ;;9002226.02101,"1102,67544-0424-60 ",.02)
 ;;67544-0424-60
 ;;9002226.02101,"1102,67544-0424-70 ",.01)
 ;;67544-0424-70
 ;;9002226.02101,"1102,67544-0424-70 ",.02)
 ;;67544-0424-70
 ;;9002226.02101,"1102,67544-0424-75 ",.01)
 ;;67544-0424-75
 ;;9002226.02101,"1102,67544-0424-75 ",.02)
 ;;67544-0424-75
 ;;9002226.02101,"1102,67544-0424-80 ",.01)
 ;;67544-0424-80
 ;;9002226.02101,"1102,67544-0424-80 ",.02)
 ;;67544-0424-80
 ;;9002226.02101,"1102,67544-0424-90 ",.01)
 ;;67544-0424-90
 ;;9002226.02101,"1102,67544-0424-90 ",.02)
 ;;67544-0424-90
 ;;9002226.02101,"1102,67544-0424-92 ",.01)
 ;;67544-0424-92
 ;;9002226.02101,"1102,67544-0424-92 ",.02)
 ;;67544-0424-92
 ;;9002226.02101,"1102,67544-0424-94 ",.01)
 ;;67544-0424-94
 ;;9002226.02101,"1102,67544-0424-94 ",.02)
 ;;67544-0424-94
 ;;9002226.02101,"1102,67544-0424-96 ",.01)
 ;;67544-0424-96
 ;;9002226.02101,"1102,67544-0424-96 ",.02)
 ;;67544-0424-96
 ;;9002226.02101,"1102,67544-0428-45 ",.01)
 ;;67544-0428-45
 ;;9002226.02101,"1102,67544-0428-45 ",.02)
 ;;67544-0428-45
 ;;9002226.02101,"1102,67544-0428-53 ",.01)
 ;;67544-0428-53
 ;;9002226.02101,"1102,67544-0428-53 ",.02)
 ;;67544-0428-53
 ;;9002226.02101,"1102,67544-0428-60 ",.01)
 ;;67544-0428-60
 ;;9002226.02101,"1102,67544-0428-60 ",.02)
 ;;67544-0428-60
 ;;9002226.02101,"1102,67544-0428-73 ",.01)
 ;;67544-0428-73
 ;;9002226.02101,"1102,67544-0428-73 ",.02)
 ;;67544-0428-73
 ;;9002226.02101,"1102,67544-0428-80 ",.01)
 ;;67544-0428-80
 ;;9002226.02101,"1102,67544-0428-80 ",.02)
 ;;67544-0428-80
 ;;9002226.02101,"1102,67544-0486-53 ",.01)
 ;;67544-0486-53
 ;;9002226.02101,"1102,67544-0486-53 ",.02)
 ;;67544-0486-53
 ;;9002226.02101,"1102,67544-0511-70 ",.01)
 ;;67544-0511-70
 ;;9002226.02101,"1102,67544-0511-70 ",.02)
 ;;67544-0511-70
 ;;9002226.02101,"1102,67544-0596-53 ",.01)
 ;;67544-0596-53
 ;;9002226.02101,"1102,67544-0596-53 ",.02)
 ;;67544-0596-53
 ;;9002226.02101,"1102,67544-0596-60 ",.01)
 ;;67544-0596-60
 ;;9002226.02101,"1102,67544-0596-60 ",.02)
 ;;67544-0596-60
 ;;9002226.02101,"1102,67544-0596-80 ",.01)
 ;;67544-0596-80
 ;;9002226.02101,"1102,67544-0596-80 ",.02)
 ;;67544-0596-80
 ;;9002226.02101,"1102,67544-0596-96 ",.01)
 ;;67544-0596-96
 ;;9002226.02101,"1102,67544-0596-96 ",.02)
 ;;67544-0596-96
 ;;9002226.02101,"1102,67544-1081-80 ",.01)
 ;;67544-1081-80
 ;;9002226.02101,"1102,67544-1081-80 ",.02)
 ;;67544-1081-80
 ;;9002226.02101,"1102,67544-1081-94 ",.01)
 ;;67544-1081-94
 ;;9002226.02101,"1102,67544-1081-94 ",.02)
 ;;67544-1081-94
 ;;9002226.02101,"1102,67544-1129-70 ",.01)
 ;;67544-1129-70
 ;;9002226.02101,"1102,67544-1129-70 ",.02)
 ;;67544-1129-70
 ;;9002226.02101,"1102,67544-1198-53 ",.01)
 ;;67544-1198-53
 ;;9002226.02101,"1102,67544-1198-53 ",.02)
 ;;67544-1198-53
 ;;9002226.02101,"1102,67544-1198-60 ",.01)
 ;;67544-1198-60
 ;;9002226.02101,"1102,67544-1198-60 ",.02)
 ;;67544-1198-60
 ;;9002226.02101,"1102,67544-1198-80 ",.01)
 ;;67544-1198-80
 ;;9002226.02101,"1102,67544-1198-80 ",.02)
 ;;67544-1198-80
 ;;9002226.02101,"1102,67544-1216-53 ",.01)
 ;;67544-1216-53
 ;;9002226.02101,"1102,67544-1216-53 ",.02)
 ;;67544-1216-53
 ;;9002226.02101,"1102,67544-1216-60 ",.01)
 ;;67544-1216-60
 ;;9002226.02101,"1102,67544-1216-60 ",.02)
 ;;67544-1216-60
 ;;9002226.02101,"1102,67544-1216-80 ",.01)
 ;;67544-1216-80
 ;;9002226.02101,"1102,67544-1216-80 ",.02)
 ;;67544-1216-80
 ;;9002226.02101,"1102,67544-1216-92 ",.01)
 ;;67544-1216-92
 ;;9002226.02101,"1102,67544-1216-92 ",.02)
 ;;67544-1216-92
 ;;9002226.02101,"1102,67544-1379-80 ",.01)
 ;;67544-1379-80
 ;;9002226.02101,"1102,67544-1379-80 ",.02)
 ;;67544-1379-80
 ;;9002226.02101,"1102,67544-1383-60 ",.01)
 ;;67544-1383-60
 ;;9002226.02101,"1102,67544-1383-60 ",.02)
 ;;67544-1383-60
 ;;9002226.02101,"1102,67544-1383-80 ",.01)
 ;;67544-1383-80
 ;;9002226.02101,"1102,67544-1383-80 ",.02)
 ;;67544-1383-80
 ;;9002226.02101,"1102,67767-0115-01 ",.01)
 ;;67767-0115-01
 ;;9002226.02101,"1102,67767-0115-01 ",.02)
 ;;67767-0115-01
 ;;9002226.02101,"1102,68071-0028-30 ",.01)
 ;;68071-0028-30
 ;;9002226.02101,"1102,68071-0028-30 ",.02)
 ;;68071-0028-30
 ;;9002226.02101,"1102,68071-0028-60 ",.01)
 ;;68071-0028-60
 ;;9002226.02101,"1102,68071-0028-60 ",.02)
 ;;68071-0028-60
 ;;9002226.02101,"1102,68084-0072-01 ",.01)
 ;;68084-0072-01
 ;;9002226.02101,"1102,68084-0072-01 ",.02)
 ;;68084-0072-01
 ;;9002226.02101,"1102,68084-0072-11 ",.01)
 ;;68084-0072-11
 ;;9002226.02101,"1102,68084-0072-11 ",.02)
 ;;68084-0072-11
 ;;9002226.02101,"1102,68084-0136-01 ",.01)
 ;;68084-0136-01
 ;;9002226.02101,"1102,68084-0136-01 ",.02)
 ;;68084-0136-01
 ;;9002226.02101,"1102,68084-0136-11 ",.01)
 ;;68084-0136-11
 ;;9002226.02101,"1102,68084-0136-11 ",.02)
 ;;68084-0136-11
 ;;9002226.02101,"1102,68084-0137-01 ",.01)
 ;;68084-0137-01
 ;;9002226.02101,"1102,68084-0137-01 ",.02)
 ;;68084-0137-01
 ;;9002226.02101,"1102,68084-0137-11 ",.01)
 ;;68084-0137-11
 ;;9002226.02101,"1102,68084-0137-11 ",.02)
 ;;68084-0137-11
 ;;9002226.02101,"1102,68084-0138-01 ",.01)
 ;;68084-0138-01
 ;;9002226.02101,"1102,68084-0138-01 ",.02)
 ;;68084-0138-01
 ;;9002226.02101,"1102,68084-0138-11 ",.01)
 ;;68084-0138-11
 ;;9002226.02101,"1102,68084-0138-11 ",.02)
 ;;68084-0138-11
 ;;9002226.02101,"1102,68115-0158-30 ",.01)
 ;;68115-0158-30
 ;;9002226.02101,"1102,68115-0158-30 ",.02)
 ;;68115-0158-30
 ;;9002226.02101,"1102,68115-0158-60 ",.01)
 ;;68115-0158-60
 ;;9002226.02101,"1102,68115-0158-60 ",.02)
 ;;68115-0158-60
 ;;9002226.02101,"1102,68115-0159-30 ",.01)
 ;;68115-0159-30
 ;;9002226.02101,"1102,68115-0159-30 ",.02)
 ;;68115-0159-30
 ;;9002226.02101,"1102,68115-0159-60 ",.01)
 ;;68115-0159-60
 ;;9002226.02101,"1102,68115-0159-60 ",.02)
 ;;68115-0159-60
 ;;9002226.02101,"1102,68115-0230-30 ",.01)
 ;;68115-0230-30
 ;;9002226.02101,"1102,68115-0230-30 ",.02)
 ;;68115-0230-30
 ;;9002226.02101,"1102,68115-0230-60 ",.01)
 ;;68115-0230-60
 ;;9002226.02101,"1102,68115-0230-60 ",.02)
 ;;68115-0230-60
 ;;9002226.02101,"1102,68115-0231-00 ",.01)
 ;;68115-0231-00
 ;;9002226.02101,"1102,68115-0231-00 ",.02)
 ;;68115-0231-00
 ;;9002226.02101,"1102,68115-0231-30 ",.01)
 ;;68115-0231-30
 ;;9002226.02101,"1102,68115-0231-30 ",.02)
 ;;68115-0231-30
 ;;9002226.02101,"1102,68115-0231-60 ",.01)
 ;;68115-0231-60
 ;;9002226.02101,"1102,68115-0231-60 ",.02)
 ;;68115-0231-60
 ;;9002226.02101,"1102,68115-0231-90 ",.01)
 ;;68115-0231-90
 ;;9002226.02101,"1102,68115-0231-90 ",.02)
 ;;68115-0231-90
 ;;9002226.02101,"1102,68115-0232-30 ",.01)
 ;;68115-0232-30
 ;;9002226.02101,"1102,68115-0232-30 ",.02)
 ;;68115-0232-30
 ;;9002226.02101,"1102,68115-0232-45 ",.01)
 ;;68115-0232-45
 ;;9002226.02101,"1102,68115-0232-45 ",.02)
 ;;68115-0232-45
 ;;9002226.02101,"1102,68115-0232-60 ",.01)
 ;;68115-0232-60
 ;;9002226.02101,"1102,68115-0232-60 ",.02)
 ;;68115-0232-60
 ;;9002226.02101,"1102,68115-0891-60 ",.01)
 ;;68115-0891-60
 ;;9002226.02101,"1102,68115-0891-60 ",.02)
 ;;68115-0891-60
 ;;9002226.02101,"1102,68258-1016-01 ",.01)
 ;;68258-1016-01
 ;;9002226.02101,"1102,68258-1016-01 ",.02)
 ;;68258-1016-01
 ;;9002226.02101,"1102,68258-1077-01 ",.01)
 ;;68258-1077-01
 ;;9002226.02101,"1102,68258-1077-01 ",.02)
 ;;68258-1077-01
 ;;9002226.02101,"1102,68382-0028-01 ",.01)
 ;;68382-0028-01
 ;;9002226.02101,"1102,68382-0028-01 ",.02)
 ;;68382-0028-01
 ;;9002226.02101,"1102,68382-0028-05 ",.01)
 ;;68382-0028-05
 ;;9002226.02101,"1102,68382-0028-05 ",.02)
 ;;68382-0028-05
 ;;9002226.02101,"1102,68382-0028-10 ",.01)
 ;;68382-0028-10
 ;;9002226.02101,"1102,68382-0028-10 ",.02)
 ;;68382-0028-10
 ;;9002226.02101,"1102,68382-0029-01 ",.01)
 ;;68382-0029-01
 ;;9002226.02101,"1102,68382-0029-01 ",.02)
 ;;68382-0029-01
 ;;9002226.02101,"1102,68382-0029-05 ",.01)
 ;;68382-0029-05
 ;;9002226.02101,"1102,68382-0029-05 ",.02)
 ;;68382-0029-05
 ;;9002226.02101,"1102,68382-0029-10 ",.01)
 ;;68382-0029-10
 ;;9002226.02101,"1102,68382-0029-10 ",.02)
 ;;68382-0029-10
 ;;9002226.02101,"1102,68382-0030-01 ",.01)
 ;;68382-0030-01
 ;;9002226.02101,"1102,68382-0030-01 ",.02)
 ;;68382-0030-01
 ;;9002226.02101,"1102,68382-0030-05 ",.01)
 ;;68382-0030-05
 ;;9002226.02101,"1102,68382-0030-05 ",.02)
 ;;68382-0030-05
 ;;9002226.02101,"1102,68382-0030-10 ",.01)
 ;;68382-0030-10
 ;;9002226.02101,"1102,68382-0030-10 ",.02)
 ;;68382-0030-10
 ;;9002226.02101,"1102,68462-0159-01 ",.01)
 ;;68462-0159-01
 ;;9002226.02101,"1102,68462-0159-01 ",.02)
 ;;68462-0159-01
 ;;9002226.02101,"1102,68462-0159-05 ",.01)
 ;;68462-0159-05
 ;;9002226.02101,"1102,68462-0159-05 ",.02)
 ;;68462-0159-05
 ;;9002226.02101,"1102,68462-0159-10 ",.01)
 ;;68462-0159-10
 ;;9002226.02101,"1102,68462-0159-10 ",.02)
 ;;68462-0159-10
 ;;9002226.02101,"1102,68462-0159-18 ",.01)
 ;;68462-0159-18
 ;;9002226.02101,"1102,68462-0159-18 ",.02)
 ;;68462-0159-18
 ;;9002226.02101,"1102,68462-0159-90 ",.01)
 ;;68462-0159-90
 ;;9002226.02101,"1102,68462-0159-90 ",.02)
 ;;68462-0159-90
 ;;9002226.02101,"1102,68462-0160-01 ",.01)
 ;;68462-0160-01
 ;;9002226.02101,"1102,68462-0160-01 ",.02)
 ;;68462-0160-01
 ;;9002226.02101,"1102,68462-0160-05 ",.01)
 ;;68462-0160-05
 ;;9002226.02101,"1102,68462-0160-05 ",.02)
 ;;68462-0160-05
 ;;9002226.02101,"1102,68462-0160-10 ",.01)
 ;;68462-0160-10
 ;;9002226.02101,"1102,68462-0160-10 ",.02)
 ;;68462-0160-10
 ;;9002226.02101,"1102,68462-0160-18 ",.01)
 ;;68462-0160-18
 ;;9002226.02101,"1102,68462-0160-18 ",.02)
 ;;68462-0160-18
 ;;9002226.02101,"1102,68462-0160-90 ",.01)
 ;;68462-0160-90
 ;;9002226.02101,"1102,68462-0160-90 ",.02)
 ;;68462-0160-90
 ;;9002226.02101,"1102,68462-0161-01 ",.01)
 ;;68462-0161-01
 ;;9002226.02101,"1102,68462-0161-01 ",.02)
 ;;68462-0161-01
 ;;9002226.02101,"1102,68462-0161-05 ",.01)
 ;;68462-0161-05
 ;;9002226.02101,"1102,68462-0161-05 ",.02)
 ;;68462-0161-05
 ;;9002226.02101,"1102,68462-0161-10 ",.01)
 ;;68462-0161-10
 ;;9002226.02101,"1102,68462-0161-10 ",.02)
 ;;68462-0161-10
 ;;9002226.02101,"1102,68462-0161-18 ",.01)
 ;;68462-0161-18
 ;;9002226.02101,"1102,68462-0161-18 ",.02)
 ;;68462-0161-18
 ;;9002226.02101,"1102,68462-0161-90 ",.01)
 ;;68462-0161-90
 ;;9002226.02101,"1102,68462-0161-90 ",.02)
 ;;68462-0161-90
 ;;9002226.02101,"1102,68645-0120-59 ",.01)
 ;;68645-0120-59
 ;;9002226.02101,"1102,68645-0120-59 ",.02)
 ;;68645-0120-59
