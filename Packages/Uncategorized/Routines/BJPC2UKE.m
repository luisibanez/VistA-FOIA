BJPC2UKE ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON FEB 17, 2009;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"751,58016-6207-01 ",.02)
 ;;58016-6207-01
 ;;9002226.02101,"751,58087-0317-20 ",.01)
 ;;58087-0317-20
 ;;9002226.02101,"751,58087-0317-20 ",.02)
 ;;58087-0317-20
 ;;9002226.02101,"751,59310-0175-40 ",.01)
 ;;59310-0175-40
 ;;9002226.02101,"751,59310-0175-40 ",.02)
 ;;59310-0175-40
 ;;9002226.02101,"751,59310-0175-41 ",.01)
 ;;59310-0175-41
 ;;9002226.02101,"751,59310-0175-41 ",.02)
 ;;59310-0175-41
 ;;9002226.02101,"751,59310-0177-80 ",.01)
 ;;59310-0177-80
 ;;9002226.02101,"751,59310-0177-80 ",.02)
 ;;59310-0177-80
 ;;9002226.02101,"751,59310-0177-81 ",.01)
 ;;59310-0177-81
 ;;9002226.02101,"751,59310-0177-81 ",.02)
 ;;59310-0177-81
 ;;9002226.02101,"751,60346-0180-46 ",.01)
 ;;60346-0180-46
 ;;9002226.02101,"751,60346-0180-46 ",.02)
 ;;60346-0180-46
 ;;9002226.02101,"751,60346-0226-76 ",.01)
 ;;60346-0226-76
 ;;9002226.02101,"751,60346-0226-76 ",.02)
 ;;60346-0226-76
 ;;9002226.02101,"751,60346-0282-74 ",.01)
 ;;60346-0282-74
 ;;9002226.02101,"751,60346-0282-74 ",.02)
 ;;60346-0282-74
 ;;9002226.02101,"751,60346-0420-84 ",.01)
 ;;60346-0420-84
 ;;9002226.02101,"751,60346-0420-84 ",.02)
 ;;60346-0420-84
 ;;9002226.02101,"751,60937-0504-00 ",.01)
 ;;60937-0504-00
 ;;9002226.02101,"751,60937-0504-00 ",.02)
 ;;60937-0504-00
 ;;9002226.02101,"751,60937-0509-01 ",.01)
 ;;60937-0509-01
 ;;9002226.02101,"751,60937-0509-01 ",.02)
 ;;60937-0509-01
 ;;9002226.02101,"751,60937-0510-00 ",.01)
 ;;60937-0510-00
 ;;9002226.02101,"751,60937-0510-00 ",.02)
 ;;60937-0510-00
 ;;9002226.02101,"751,60937-0511-00 ",.01)
 ;;60937-0511-00
 ;;9002226.02101,"751,60937-0511-00 ",.02)
 ;;60937-0511-00
 ;;9002226.02101,"751,62301-0045-45 ",.01)
 ;;62301-0045-45
 ;;9002226.02101,"751,62301-0045-45 ",.02)
 ;;62301-0045-45
 ;;9002226.02101,"751,68115-0637-13 ",.01)
 ;;68115-0637-13
 ;;9002226.02101,"751,68115-0637-13 ",.02)
 ;;68115-0637-13
 ;;9002226.02101,"751,68115-0657-01 ",.01)
 ;;68115-0657-01
 ;;9002226.02101,"751,68115-0657-01 ",.02)
 ;;68115-0657-01
 ;;9002226.02101,"751,68115-0760-01 ",.01)
 ;;68115-0760-01
 ;;9002226.02101,"751,68115-0760-01 ",.02)
 ;;68115-0760-01
 ;;9002226.02101,"751,68115-0775-07 ",.01)
 ;;68115-0775-07
 ;;9002226.02101,"751,68115-0775-07 ",.02)
 ;;68115-0775-07
 ;;9002226.02101,"751,68115-0924-60 ",.01)
 ;;68115-0924-60
 ;;9002226.02101,"751,68115-0924-60 ",.02)
 ;;68115-0924-60
