BGP13X34 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1100,55045-2376-00 ",.01)
 ;;55045-2376-00
 ;;9002226.02101,"1100,55045-2376-00 ",.02)
 ;;55045-2376-00
 ;;9002226.02101,"1100,55045-2376-08 ",.01)
 ;;55045-2376-08
 ;;9002226.02101,"1100,55045-2376-08 ",.02)
 ;;55045-2376-08
 ;;9002226.02101,"1100,55045-2376-09 ",.01)
 ;;55045-2376-09
 ;;9002226.02101,"1100,55045-2376-09 ",.02)
 ;;55045-2376-09
 ;;9002226.02101,"1100,55045-2424-00 ",.01)
 ;;55045-2424-00
 ;;9002226.02101,"1100,55045-2424-00 ",.02)
 ;;55045-2424-00
 ;;9002226.02101,"1100,55045-2424-06 ",.01)
 ;;55045-2424-06
 ;;9002226.02101,"1100,55045-2424-06 ",.02)
 ;;55045-2424-06
 ;;9002226.02101,"1100,55045-2799-00 ",.01)
 ;;55045-2799-00
 ;;9002226.02101,"1100,55045-2799-00 ",.02)
 ;;55045-2799-00
 ;;9002226.02101,"1100,55045-2827-00 ",.01)
 ;;55045-2827-00
 ;;9002226.02101,"1100,55045-2827-00 ",.02)
 ;;55045-2827-00
 ;;9002226.02101,"1100,55045-2827-08 ",.01)
 ;;55045-2827-08
 ;;9002226.02101,"1100,55045-2827-08 ",.02)
 ;;55045-2827-08
 ;;9002226.02101,"1100,55045-2832-00 ",.01)
 ;;55045-2832-00
 ;;9002226.02101,"1100,55045-2832-00 ",.02)
 ;;55045-2832-00
 ;;9002226.02101,"1100,55045-2832-08 ",.01)
 ;;55045-2832-08
 ;;9002226.02101,"1100,55045-2832-08 ",.02)
 ;;55045-2832-08
 ;;9002226.02101,"1100,55045-2929-06 ",.01)
 ;;55045-2929-06
 ;;9002226.02101,"1100,55045-2929-06 ",.02)
 ;;55045-2929-06
 ;;9002226.02101,"1100,55045-2929-08 ",.01)
 ;;55045-2929-08
 ;;9002226.02101,"1100,55045-2929-08 ",.02)
 ;;55045-2929-08
 ;;9002226.02101,"1100,55045-2936-00 ",.01)
 ;;55045-2936-00
 ;;9002226.02101,"1100,55045-2936-00 ",.02)
 ;;55045-2936-00
 ;;9002226.02101,"1100,55045-2937-00 ",.01)
 ;;55045-2937-00
 ;;9002226.02101,"1100,55045-2937-00 ",.02)
 ;;55045-2937-00
 ;;9002226.02101,"1100,55045-2938-00 ",.01)
 ;;55045-2938-00
 ;;9002226.02101,"1100,55045-2938-00 ",.02)
 ;;55045-2938-00
 ;;9002226.02101,"1100,55045-2938-08 ",.01)
 ;;55045-2938-08
 ;;9002226.02101,"1100,55045-2938-08 ",.02)
 ;;55045-2938-08
 ;;9002226.02101,"1100,55045-2975-00 ",.01)
 ;;55045-2975-00
 ;;9002226.02101,"1100,55045-2975-00 ",.02)
 ;;55045-2975-00
 ;;9002226.02101,"1100,55045-2975-06 ",.01)
 ;;55045-2975-06
 ;;9002226.02101,"1100,55045-2975-06 ",.02)
 ;;55045-2975-06
 ;;9002226.02101,"1100,55045-2975-08 ",.01)
 ;;55045-2975-08
 ;;9002226.02101,"1100,55045-2975-08 ",.02)
 ;;55045-2975-08
 ;;9002226.02101,"1100,55045-3000-00 ",.01)
 ;;55045-3000-00
 ;;9002226.02101,"1100,55045-3000-00 ",.02)
 ;;55045-3000-00
 ;;9002226.02101,"1100,55045-3059-00 ",.01)
 ;;55045-3059-00
 ;;9002226.02101,"1100,55045-3059-00 ",.02)
 ;;55045-3059-00
 ;;9002226.02101,"1100,55045-3059-08 ",.01)
 ;;55045-3059-08
 ;;9002226.02101,"1100,55045-3059-08 ",.02)
 ;;55045-3059-08
 ;;9002226.02101,"1100,55045-3159-00 ",.01)
 ;;55045-3159-00
 ;;9002226.02101,"1100,55045-3159-00 ",.02)
 ;;55045-3159-00
 ;;9002226.02101,"1100,55045-3225-06 ",.01)
 ;;55045-3225-06
 ;;9002226.02101,"1100,55045-3225-06 ",.02)
 ;;55045-3225-06
 ;;9002226.02101,"1100,55045-3373-08 ",.01)
 ;;55045-3373-08
 ;;9002226.02101,"1100,55045-3373-08 ",.02)
 ;;55045-3373-08
 ;;9002226.02101,"1100,55045-3401-08 ",.01)
 ;;55045-3401-08
 ;;9002226.02101,"1100,55045-3401-08 ",.02)
 ;;55045-3401-08
 ;;9002226.02101,"1100,55045-3409-09 ",.01)
 ;;55045-3409-09
 ;;9002226.02101,"1100,55045-3409-09 ",.02)
 ;;55045-3409-09
 ;;9002226.02101,"1100,55045-3772-08 ",.01)
 ;;55045-3772-08
 ;;9002226.02101,"1100,55045-3772-08 ",.02)
 ;;55045-3772-08
 ;;9002226.02101,"1100,55111-0133-01 ",.01)
 ;;55111-0133-01
 ;;9002226.02101,"1100,55111-0133-01 ",.02)
 ;;55111-0133-01
 ;;9002226.02101,"1100,55111-0134-01 ",.01)
 ;;55111-0134-01
 ;;9002226.02101,"1100,55111-0134-01 ",.02)
 ;;55111-0134-01
 ;;9002226.02101,"1100,55111-0338-01 ",.01)
 ;;55111-0338-01
 ;;9002226.02101,"1100,55111-0338-01 ",.02)
 ;;55111-0338-01
 ;;9002226.02101,"1100,55111-0339-01 ",.01)
 ;;55111-0339-01
 ;;9002226.02101,"1100,55111-0339-01 ",.02)
 ;;55111-0339-01
 ;;9002226.02101,"1100,55111-0339-05 ",.01)
 ;;55111-0339-05
 ;;9002226.02101,"1100,55111-0339-05 ",.02)
 ;;55111-0339-05
 ;;9002226.02101,"1100,55111-0340-01 ",.01)
 ;;55111-0340-01
 ;;9002226.02101,"1100,55111-0340-01 ",.02)
 ;;55111-0340-01
 ;;9002226.02101,"1100,55111-0340-05 ",.01)
 ;;55111-0340-05
 ;;9002226.02101,"1100,55111-0340-05 ",.02)
 ;;55111-0340-05
 ;;9002226.02101,"1100,55111-0341-01 ",.01)
 ;;55111-0341-01
 ;;9002226.02101,"1100,55111-0341-01 ",.02)
 ;;55111-0341-01
 ;;9002226.02101,"1100,55111-0341-05 ",.01)
 ;;55111-0341-05
 ;;9002226.02101,"1100,55111-0341-05 ",.02)
 ;;55111-0341-05
 ;;9002226.02101,"1100,55111-0438-90 ",.01)
 ;;55111-0438-90
 ;;9002226.02101,"1100,55111-0438-90 ",.02)
 ;;55111-0438-90
 ;;9002226.02101,"1100,55111-0439-05 ",.01)
 ;;55111-0439-05
 ;;9002226.02101,"1100,55111-0439-05 ",.02)
 ;;55111-0439-05
 ;;9002226.02101,"1100,55111-0439-90 ",.01)
 ;;55111-0439-90
 ;;9002226.02101,"1100,55111-0439-90 ",.02)
 ;;55111-0439-90
 ;;9002226.02101,"1100,55111-0440-05 ",.01)
 ;;55111-0440-05
 ;;9002226.02101,"1100,55111-0440-05 ",.02)
 ;;55111-0440-05
 ;;9002226.02101,"1100,55111-0440-90 ",.01)
 ;;55111-0440-90
 ;;9002226.02101,"1100,55111-0440-90 ",.02)
 ;;55111-0440-90
 ;;9002226.02101,"1100,55111-0441-05 ",.01)
 ;;55111-0441-05
 ;;9002226.02101,"1100,55111-0441-05 ",.02)
 ;;55111-0441-05
 ;;9002226.02101,"1100,55111-0441-90 ",.01)
 ;;55111-0441-90
 ;;9002226.02101,"1100,55111-0441-90 ",.02)
 ;;55111-0441-90
 ;;9002226.02101,"1100,55111-0621-90 ",.01)
 ;;55111-0621-90
 ;;9002226.02101,"1100,55111-0621-90 ",.02)
 ;;55111-0621-90
 ;;9002226.02101,"1100,55111-0622-90 ",.01)
 ;;55111-0622-90
 ;;9002226.02101,"1100,55111-0622-90 ",.02)
 ;;55111-0622-90
 ;;9002226.02101,"1100,55111-0623-90 ",.01)
 ;;55111-0623-90
 ;;9002226.02101,"1100,55111-0623-90 ",.02)
 ;;55111-0623-90
 ;;9002226.02101,"1100,55111-0624-90 ",.01)
 ;;55111-0624-90
 ;;9002226.02101,"1100,55111-0624-90 ",.02)
 ;;55111-0624-90
 ;;9002226.02101,"1100,55289-0039-30 ",.01)
 ;;55289-0039-30
 ;;9002226.02101,"1100,55289-0039-30 ",.02)
 ;;55289-0039-30
 ;;9002226.02101,"1100,55289-0086-30 ",.01)
 ;;55289-0086-30
 ;;9002226.02101,"1100,55289-0086-30 ",.02)
 ;;55289-0086-30
 ;;9002226.02101,"1100,55289-0096-30 ",.01)
 ;;55289-0096-30
 ;;9002226.02101,"1100,55289-0096-30 ",.02)
 ;;55289-0096-30
 ;;9002226.02101,"1100,55289-0106-30 ",.01)
 ;;55289-0106-30
 ;;9002226.02101,"1100,55289-0106-30 ",.02)
 ;;55289-0106-30
 ;;9002226.02101,"1100,55289-0109-30 ",.01)
 ;;55289-0109-30
 ;;9002226.02101,"1100,55289-0109-30 ",.02)
 ;;55289-0109-30
 ;;9002226.02101,"1100,55289-0109-97 ",.01)
 ;;55289-0109-97
 ;;9002226.02101,"1100,55289-0109-97 ",.02)
 ;;55289-0109-97
 ;;9002226.02101,"1100,55289-0212-30 ",.01)
 ;;55289-0212-30
 ;;9002226.02101,"1100,55289-0212-30 ",.02)
 ;;55289-0212-30
 ;;9002226.02101,"1100,55289-0212-90 ",.01)
 ;;55289-0212-90
 ;;9002226.02101,"1100,55289-0212-90 ",.02)
 ;;55289-0212-90
 ;;9002226.02101,"1100,55289-0238-30 ",.01)
 ;;55289-0238-30
 ;;9002226.02101,"1100,55289-0238-30 ",.02)
 ;;55289-0238-30
 ;;9002226.02101,"1100,55289-0344-30 ",.01)
 ;;55289-0344-30
 ;;9002226.02101,"1100,55289-0344-30 ",.02)
 ;;55289-0344-30
 ;;9002226.02101,"1100,55289-0344-90 ",.01)
 ;;55289-0344-90
 ;;9002226.02101,"1100,55289-0344-90 ",.02)
 ;;55289-0344-90
 ;;9002226.02101,"1100,55289-0436-30 ",.01)
 ;;55289-0436-30
 ;;9002226.02101,"1100,55289-0436-30 ",.02)
 ;;55289-0436-30
 ;;9002226.02101,"1100,55289-0443-30 ",.01)
 ;;55289-0443-30
 ;;9002226.02101,"1100,55289-0443-30 ",.02)
 ;;55289-0443-30
 ;;9002226.02101,"1100,55289-0483-30 ",.01)
 ;;55289-0483-30
 ;;9002226.02101,"1100,55289-0483-30 ",.02)
 ;;55289-0483-30
 ;;9002226.02101,"1100,55289-0484-30 ",.01)
 ;;55289-0484-30
 ;;9002226.02101,"1100,55289-0484-30 ",.02)
 ;;55289-0484-30
 ;;9002226.02101,"1100,55289-0506-30 ",.01)
 ;;55289-0506-30
 ;;9002226.02101,"1100,55289-0506-30 ",.02)
 ;;55289-0506-30
 ;;9002226.02101,"1100,55289-0506-97 ",.01)
 ;;55289-0506-97
 ;;9002226.02101,"1100,55289-0506-97 ",.02)
 ;;55289-0506-97
 ;;9002226.02101,"1100,55289-0509-30 ",.01)
 ;;55289-0509-30
 ;;9002226.02101,"1100,55289-0509-30 ",.02)
 ;;55289-0509-30
 ;;9002226.02101,"1100,55289-0522-30 ",.01)
 ;;55289-0522-30
 ;;9002226.02101,"1100,55289-0522-30 ",.02)
 ;;55289-0522-30
 ;;9002226.02101,"1100,55289-0552-30 ",.01)
 ;;55289-0552-30
 ;;9002226.02101,"1100,55289-0552-30 ",.02)
 ;;55289-0552-30
 ;;9002226.02101,"1100,55289-0553-30 ",.01)
 ;;55289-0553-30
 ;;9002226.02101,"1100,55289-0553-30 ",.02)
 ;;55289-0553-30
 ;;9002226.02101,"1100,55289-0554-30 ",.01)
 ;;55289-0554-30
 ;;9002226.02101,"1100,55289-0554-30 ",.02)
 ;;55289-0554-30
 ;;9002226.02101,"1100,55289-0555-30 ",.01)
 ;;55289-0555-30
 ;;9002226.02101,"1100,55289-0555-30 ",.02)
 ;;55289-0555-30
 ;;9002226.02101,"1100,55289-0573-30 ",.01)
 ;;55289-0573-30
 ;;9002226.02101,"1100,55289-0573-30 ",.02)
 ;;55289-0573-30
 ;;9002226.02101,"1100,55289-0577-30 ",.01)
 ;;55289-0577-30
 ;;9002226.02101,"1100,55289-0577-30 ",.02)
 ;;55289-0577-30
 ;;9002226.02101,"1100,55289-0591-30 ",.01)
 ;;55289-0591-30
 ;;9002226.02101,"1100,55289-0591-30 ",.02)
 ;;55289-0591-30
 ;;9002226.02101,"1100,55289-0591-90 ",.01)
 ;;55289-0591-90
 ;;9002226.02101,"1100,55289-0591-90 ",.02)
 ;;55289-0591-90
 ;;9002226.02101,"1100,55289-0622-03 ",.01)
 ;;55289-0622-03
 ;;9002226.02101,"1100,55289-0622-03 ",.02)
 ;;55289-0622-03
 ;;9002226.02101,"1100,55289-0622-30 ",.01)
 ;;55289-0622-30
 ;;9002226.02101,"1100,55289-0622-30 ",.02)
 ;;55289-0622-30
 ;;9002226.02101,"1100,55289-0638-01 ",.01)
 ;;55289-0638-01
 ;;9002226.02101,"1100,55289-0638-01 ",.02)
 ;;55289-0638-01
 ;;9002226.02101,"1100,55289-0638-12 ",.01)
 ;;55289-0638-12
 ;;9002226.02101,"1100,55289-0638-12 ",.02)
 ;;55289-0638-12
 ;;9002226.02101,"1100,55289-0638-14 ",.01)
 ;;55289-0638-14
 ;;9002226.02101,"1100,55289-0638-14 ",.02)
 ;;55289-0638-14
 ;;9002226.02101,"1100,55289-0638-30 ",.01)
 ;;55289-0638-30
 ;;9002226.02101,"1100,55289-0638-30 ",.02)
 ;;55289-0638-30
 ;;9002226.02101,"1100,55289-0638-90 ",.01)
 ;;55289-0638-90
 ;;9002226.02101,"1100,55289-0638-90 ",.02)
 ;;55289-0638-90
 ;;9002226.02101,"1100,55289-0638-98 ",.01)
 ;;55289-0638-98
 ;;9002226.02101,"1100,55289-0638-98 ",.02)
 ;;55289-0638-98
 ;;9002226.02101,"1100,55289-0694-10 ",.01)
 ;;55289-0694-10
 ;;9002226.02101,"1100,55289-0694-10 ",.02)
 ;;55289-0694-10
 ;;9002226.02101,"1100,55289-0694-30 ",.01)
 ;;55289-0694-30
 ;;9002226.02101,"1100,55289-0694-30 ",.02)
 ;;55289-0694-30
 ;;9002226.02101,"1100,55289-0694-90 ",.01)
 ;;55289-0694-90
 ;;9002226.02101,"1100,55289-0694-90 ",.02)
 ;;55289-0694-90
 ;;9002226.02101,"1100,55289-0696-14 ",.01)
 ;;55289-0696-14
 ;;9002226.02101,"1100,55289-0696-14 ",.02)
 ;;55289-0696-14
 ;;9002226.02101,"1100,55289-0696-30 ",.01)
 ;;55289-0696-30
 ;;9002226.02101,"1100,55289-0696-30 ",.02)
 ;;55289-0696-30
 ;;9002226.02101,"1100,55289-0696-90 ",.01)
 ;;55289-0696-90
 ;;9002226.02101,"1100,55289-0696-90 ",.02)
 ;;55289-0696-90
 ;;9002226.02101,"1100,55289-0696-98 ",.01)
 ;;55289-0696-98
 ;;9002226.02101,"1100,55289-0696-98 ",.02)
 ;;55289-0696-98
 ;;9002226.02101,"1100,55289-0815-30 ",.01)
 ;;55289-0815-30
 ;;9002226.02101,"1100,55289-0815-30 ",.02)
 ;;55289-0815-30
 ;;9002226.02101,"1100,55289-0817-30 ",.01)
 ;;55289-0817-30
 ;;9002226.02101,"1100,55289-0817-30 ",.02)
 ;;55289-0817-30
 ;;9002226.02101,"1100,55289-0820-30 ",.01)
 ;;55289-0820-30
 ;;9002226.02101,"1100,55289-0820-30 ",.02)
 ;;55289-0820-30
 ;;9002226.02101,"1100,55289-0825-30 ",.01)
 ;;55289-0825-30
 ;;9002226.02101,"1100,55289-0825-30 ",.02)
 ;;55289-0825-30
 ;;9002226.02101,"1100,55289-0838-30 ",.01)
 ;;55289-0838-30
 ;;9002226.02101,"1100,55289-0838-30 ",.02)
 ;;55289-0838-30
 ;;9002226.02101,"1100,55289-0867-30 ",.01)
 ;;55289-0867-30
 ;;9002226.02101,"1100,55289-0867-30 ",.02)
 ;;55289-0867-30
 ;;9002226.02101,"1100,55289-0876-30 ",.01)
 ;;55289-0876-30
 ;;9002226.02101,"1100,55289-0876-30 ",.02)
 ;;55289-0876-30
 ;;9002226.02101,"1100,55289-0878-30 ",.01)
 ;;55289-0878-30
 ;;9002226.02101,"1100,55289-0878-30 ",.02)
 ;;55289-0878-30
 ;;9002226.02101,"1100,55289-0884-30 ",.01)
 ;;55289-0884-30
 ;;9002226.02101,"1100,55289-0884-30 ",.02)
 ;;55289-0884-30
 ;;9002226.02101,"1100,55289-0884-90 ",.01)
 ;;55289-0884-90
 ;;9002226.02101,"1100,55289-0884-90 ",.02)
 ;;55289-0884-90
 ;;9002226.02101,"1100,55289-0917-30 ",.01)
 ;;55289-0917-30
 ;;9002226.02101,"1100,55289-0917-30 ",.02)
 ;;55289-0917-30
 ;;9002226.02101,"1100,55289-0917-90 ",.01)
 ;;55289-0917-90
 ;;9002226.02101,"1100,55289-0917-90 ",.02)
 ;;55289-0917-90