BGP13P2 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"701,00615-1573-43 ",.02)
 ;;00615-1573-43
 ;;9002226.02101,"701,00615-1574-01 ",.01)
 ;;00615-1574-01
 ;;9002226.02101,"701,00615-1574-01 ",.02)
 ;;00615-1574-01
 ;;9002226.02101,"701,00615-1574-05 ",.01)
 ;;00615-1574-05
 ;;9002226.02101,"701,00615-1574-05 ",.02)
 ;;00615-1574-05
 ;;9002226.02101,"701,00615-1574-10 ",.01)
 ;;00615-1574-10
 ;;9002226.02101,"701,00615-1574-10 ",.02)
 ;;00615-1574-10
 ;;9002226.02101,"701,00615-1574-32 ",.01)
 ;;00615-1574-32
 ;;9002226.02101,"701,00615-1574-32 ",.02)
 ;;00615-1574-32
 ;;9002226.02101,"701,00615-1585-01 ",.01)
 ;;00615-1585-01
 ;;9002226.02101,"701,00615-1585-01 ",.02)
 ;;00615-1585-01
 ;;9002226.02101,"701,00615-1585-05 ",.01)
 ;;00615-1585-05
 ;;9002226.02101,"701,00615-1585-05 ",.02)
 ;;00615-1585-05
 ;;9002226.02101,"701,00615-1585-10 ",.01)
 ;;00615-1585-10
 ;;9002226.02101,"701,00615-1585-10 ",.02)
 ;;00615-1585-10
 ;;9002226.02101,"701,00615-1586-01 ",.01)
 ;;00615-1586-01
 ;;9002226.02101,"701,00615-1586-01 ",.02)
 ;;00615-1586-01
 ;;9002226.02101,"701,00615-1586-13 ",.01)
 ;;00615-1586-13
 ;;9002226.02101,"701,00615-1586-13 ",.02)
 ;;00615-1586-13
 ;;9002226.02101,"701,00615-1587-01 ",.01)
 ;;00615-1587-01
 ;;9002226.02101,"701,00615-1587-01 ",.02)
 ;;00615-1587-01
 ;;9002226.02101,"701,00615-1587-05 ",.01)
 ;;00615-1587-05
 ;;9002226.02101,"701,00615-1587-05 ",.02)
 ;;00615-1587-05
 ;;9002226.02101,"701,00615-1587-10 ",.01)
 ;;00615-1587-10
 ;;9002226.02101,"701,00615-1587-10 ",.02)
 ;;00615-1587-10
 ;;9002226.02101,"701,00615-1587-13 ",.01)
 ;;00615-1587-13
 ;;9002226.02101,"701,00615-1587-13 ",.02)
 ;;00615-1587-13
 ;;9002226.02101,"701,00677-0782-01 ",.01)
 ;;00677-0782-01
 ;;9002226.02101,"701,00677-0782-01 ",.02)
 ;;00677-0782-01
 ;;9002226.02101,"701,00677-0782-05 ",.01)
 ;;00677-0782-05
 ;;9002226.02101,"701,00677-0782-05 ",.02)
 ;;00677-0782-05
 ;;9002226.02101,"701,00781-1678-13 ",.01)
 ;;00781-1678-13
 ;;9002226.02101,"701,00781-1678-13 ",.02)
 ;;00781-1678-13
 ;;9002226.02101,"701,00781-1840-01 ",.01)
 ;;00781-1840-01
 ;;9002226.02101,"701,00781-1840-01 ",.02)
 ;;00781-1840-01
 ;;9002226.02101,"701,00781-1840-10 ",.01)
 ;;00781-1840-10
 ;;9002226.02101,"701,00781-1840-10 ",.02)
 ;;00781-1840-10
 ;;9002226.02101,"701,00781-1842-01 ",.01)
 ;;00781-1842-01
 ;;9002226.02101,"701,00781-1842-01 ",.02)
 ;;00781-1842-01
 ;;9002226.02101,"701,00781-1842-10 ",.01)
 ;;00781-1842-10
 ;;9002226.02101,"701,00781-1842-10 ",.02)
 ;;00781-1842-10
 ;;9002226.02101,"701,00904-0336-60 ",.01)
 ;;00904-0336-60
 ;;9002226.02101,"701,00904-0336-60 ",.02)
 ;;00904-0336-60
 ;;9002226.02101,"701,00904-0635-60 ",.01)
 ;;00904-0635-60
 ;;9002226.02101,"701,00904-0635-60 ",.02)
 ;;00904-0635-60
 ;;9002226.02101,"701,00904-0635-61 ",.01)
 ;;00904-0635-61
 ;;9002226.02101,"701,00904-0635-61 ",.02)
 ;;00904-0635-61
 ;;9002226.02101,"701,00904-0635-80 ",.01)
 ;;00904-0635-80
 ;;9002226.02101,"701,00904-0635-80 ",.02)
 ;;00904-0635-80
 ;;9002226.02101,"701,00904-0636-60 ",.01)
 ;;00904-0636-60
 ;;9002226.02101,"701,00904-0636-60 ",.02)
 ;;00904-0636-60
 ;;9002226.02101,"701,00904-0636-61 ",.01)
 ;;00904-0636-61
 ;;9002226.02101,"701,00904-0636-61 ",.02)
 ;;00904-0636-61
 ;;9002226.02101,"701,00904-0636-80 ",.01)
 ;;00904-0636-80
 ;;9002226.02101,"701,00904-0636-80 ",.02)
 ;;00904-0636-80
 ;;9002226.02101,"701,00904-1083-60 ",.01)
 ;;00904-1083-60
 ;;9002226.02101,"701,00904-1083-60 ",.02)
 ;;00904-1083-60
 ;;9002226.02101,"701,00904-1083-80 ",.01)
 ;;00904-1083-80
 ;;9002226.02101,"701,00904-1083-80 ",.02)
 ;;00904-1083-80
 ;;9002226.02101,"701,00904-1086-60 ",.01)
 ;;00904-1086-60
 ;;9002226.02101,"701,00904-1086-60 ",.02)
 ;;00904-1086-60
 ;;9002226.02101,"701,00904-1086-61 ",.01)
 ;;00904-1086-61
 ;;9002226.02101,"701,00904-1086-61 ",.02)
 ;;00904-1086-61
 ;;9002226.02101,"701,00904-1087-60 ",.01)
 ;;00904-1087-60
 ;;9002226.02101,"701,00904-1087-60 ",.02)
 ;;00904-1087-60
 ;;9002226.02101,"701,00904-1087-61 ",.01)
 ;;00904-1087-61
 ;;9002226.02101,"701,00904-1087-61 ",.02)
 ;;00904-1087-61
 ;;9002226.02101,"701,00904-1087-80 ",.01)
 ;;00904-1087-80
 ;;9002226.02101,"701,00904-1087-80 ",.02)
 ;;00904-1087-80
 ;;9002226.02101,"701,00904-1088-60 ",.01)
 ;;00904-1088-60
 ;;9002226.02101,"701,00904-1088-60 ",.02)
 ;;00904-1088-60
 ;;9002226.02101,"701,00904-1088-61 ",.01)
 ;;00904-1088-61
 ;;9002226.02101,"701,00904-1088-61 ",.02)
 ;;00904-1088-61
 ;;9002226.02101,"701,00904-1088-80 ",.01)
 ;;00904-1088-80
 ;;9002226.02101,"701,00904-1088-80 ",.02)
 ;;00904-1088-80
 ;;9002226.02101,"701,10135-0536-10 ",.01)
 ;;10135-0536-10
 ;;9002226.02101,"701,10135-0536-10 ",.02)
 ;;10135-0536-10
 ;;9002226.02101,"701,10135-0537-10 ",.01)
 ;;10135-0537-10
 ;;9002226.02101,"701,10135-0537-10 ",.02)
 ;;10135-0537-10
 ;;9002226.02101,"701,10135-0538-10 ",.01)
 ;;10135-0538-10
 ;;9002226.02101,"701,10135-0538-10 ",.02)
 ;;10135-0538-10
 ;;9002226.02101,"701,51079-0068-01 ",.01)
 ;;51079-0068-01
 ;;9002226.02101,"701,51079-0068-01 ",.02)
 ;;51079-0068-01
 ;;9002226.02101,"701,51079-0068-20 ",.01)
 ;;51079-0068-20
 ;;9002226.02101,"701,51079-0068-20 ",.02)
 ;;51079-0068-20
 ;;9002226.02101,"701,51079-0069-01 ",.01)
 ;;51079-0069-01
 ;;9002226.02101,"701,51079-0069-01 ",.02)
 ;;51079-0069-01
 ;;9002226.02101,"701,51079-0069-20 ",.01)
 ;;51079-0069-20
 ;;9002226.02101,"701,51079-0069-20 ",.02)
 ;;51079-0069-20
 ;;9002226.02101,"701,51079-0070-01 ",.01)
 ;;51079-0070-01
 ;;9002226.02101,"701,51079-0070-01 ",.02)
 ;;51079-0070-01
 ;;9002226.02101,"701,51079-0070-20 ",.01)
 ;;51079-0070-20
 ;;9002226.02101,"701,51079-0070-20 ",.02)
 ;;51079-0070-20
 ;;9002226.02101,"701,52152-0009-02 ",.01)
 ;;52152-0009-02
 ;;9002226.02101,"701,52152-0009-02 ",.02)
 ;;52152-0009-02
 ;;9002226.02101,"701,52152-0009-05 ",.01)
 ;;52152-0009-05
 ;;9002226.02101,"701,52152-0009-05 ",.02)
 ;;52152-0009-05
 ;;9002226.02101,"701,52152-0010-02 ",.01)
 ;;52152-0010-02
 ;;9002226.02101,"701,52152-0010-02 ",.02)
 ;;52152-0010-02
 ;;9002226.02101,"701,52152-0010-05 ",.01)
 ;;52152-0010-05
 ;;9002226.02101,"701,52152-0010-05 ",.02)
 ;;52152-0010-05
 ;;9002226.02101,"701,52152-0265-02 ",.01)
 ;;52152-0265-02
 ;;9002226.02101,"701,52152-0265-02 ",.02)
 ;;52152-0265-02
 ;;9002226.02101,"701,52152-0265-05 ",.01)
 ;;52152-0265-05
 ;;9002226.02101,"701,52152-0265-05 ",.02)
 ;;52152-0265-05
 ;;9002226.02101,"701,52152-0266-02 ",.01)
 ;;52152-0266-02
 ;;9002226.02101,"701,52152-0266-02 ",.02)
 ;;52152-0266-02
 ;;9002226.02101,"701,52152-0266-05 ",.01)
 ;;52152-0266-05
 ;;9002226.02101,"701,52152-0266-05 ",.02)
 ;;52152-0266-05
 ;;9002226.02101,"701,52152-0267-02 ",.01)
 ;;52152-0267-02
 ;;9002226.02101,"701,52152-0267-02 ",.02)
 ;;52152-0267-02
 ;;9002226.02101,"701,52152-0267-05 ",.01)
 ;;52152-0267-05
 ;;9002226.02101,"701,52152-0267-05 ",.02)
 ;;52152-0267-05
 ;;9002226.02101,"701,53489-0281-01 ",.01)
 ;;53489-0281-01
 ;;9002226.02101,"701,53489-0281-01 ",.02)
 ;;53489-0281-01
 ;;9002226.02101,"701,53489-0281-05 ",.01)
 ;;53489-0281-05
 ;;9002226.02101,"701,53489-0281-05 ",.02)
 ;;53489-0281-05
 ;;9002226.02101,"701,53489-0281-10 ",.01)
 ;;53489-0281-10
 ;;9002226.02101,"701,53489-0281-10 ",.02)
 ;;53489-0281-10
 ;;9002226.02101,"701,54569-0466-00 ",.01)
 ;;54569-0466-00
 ;;9002226.02101,"701,54569-0466-00 ",.02)
 ;;54569-0466-00
 ;;9002226.02101,"701,54569-0468-01 ",.01)
 ;;54569-0468-01
 ;;9002226.02101,"701,54569-0468-01 ",.02)
 ;;54569-0468-01
 ;;9002226.02101,"701,54569-0470-00 ",.01)
 ;;54569-0470-00
 ;;9002226.02101,"701,54569-0470-00 ",.02)
 ;;54569-0470-00
 ;;9002226.02101,"701,54868-0042-01 ",.01)
 ;;54868-0042-01
 ;;9002226.02101,"701,54868-0042-01 ",.02)
 ;;54868-0042-01
 ;;9002226.02101,"701,54868-0042-04 ",.01)
 ;;54868-0042-04
 ;;9002226.02101,"701,54868-0042-04 ",.02)
 ;;54868-0042-04
 ;;9002226.02101,"701,54868-0043-00 ",.01)
 ;;54868-0043-00
 ;;9002226.02101,"701,54868-0043-00 ",.02)
 ;;54868-0043-00
 ;;9002226.02101,"701,54868-0043-01 ",.01)
 ;;54868-0043-01
 ;;9002226.02101,"701,54868-0043-01 ",.02)
 ;;54868-0043-01
 ;;9002226.02101,"701,54868-0043-02 ",.01)
 ;;54868-0043-02
 ;;9002226.02101,"701,54868-0043-02 ",.02)
 ;;54868-0043-02
 ;;9002226.02101,"701,54868-0043-03 ",.01)
 ;;54868-0043-03
 ;;9002226.02101,"701,54868-0043-03 ",.02)
 ;;54868-0043-03
 ;;9002226.02101,"701,54868-0044-00 ",.01)
 ;;54868-0044-00
 ;;9002226.02101,"701,54868-0044-00 ",.02)
 ;;54868-0044-00
 ;;9002226.02101,"701,54868-0044-02 ",.01)
 ;;54868-0044-02
 ;;9002226.02101,"701,54868-0044-02 ",.02)
 ;;54868-0044-02
 ;;9002226.02101,"701,54868-0899-00 ",.01)
 ;;54868-0899-00
 ;;9002226.02101,"701,54868-0899-00 ",.02)
 ;;54868-0899-00
 ;;9002226.02101,"701,54868-1288-00 ",.01)
 ;;54868-1288-00
 ;;9002226.02101,"701,54868-1288-00 ",.02)
 ;;54868-1288-00
 ;;9002226.02101,"701,54868-1464-00 ",.01)
 ;;54868-1464-00
 ;;9002226.02101,"701,54868-1464-00 ",.02)
 ;;54868-1464-00
 ;;9002226.02101,"701,55289-0748-97 ",.01)
 ;;55289-0748-97
 ;;9002226.02101,"701,55289-0748-97 ",.02)
 ;;55289-0748-97
 ;;9002226.02101,"701,59743-0086-10 ",.01)
 ;;59743-0086-10
 ;;9002226.02101,"701,59743-0086-10 ",.02)
 ;;59743-0086-10
 ;;9002226.02101,"701,61392-0111-30 ",.01)
 ;;61392-0111-30
 ;;9002226.02101,"701,61392-0111-30 ",.02)
 ;;61392-0111-30
 ;;9002226.02101,"701,61392-0111-31 ",.01)
 ;;61392-0111-31
 ;;9002226.02101,"701,61392-0111-31 ",.02)
 ;;61392-0111-31
 ;;9002226.02101,"701,61392-0111-32 ",.01)
 ;;61392-0111-32
 ;;9002226.02101,"701,61392-0111-32 ",.02)
 ;;61392-0111-32
 ;;9002226.02101,"701,61392-0111-39 ",.01)
 ;;61392-0111-39
 ;;9002226.02101,"701,61392-0111-39 ",.02)
 ;;61392-0111-39
 ;;9002226.02101,"701,61392-0111-45 ",.01)
 ;;61392-0111-45
 ;;9002226.02101,"701,61392-0111-45 ",.02)
 ;;61392-0111-45
 ;;9002226.02101,"701,61392-0111-51 ",.01)
 ;;61392-0111-51
 ;;9002226.02101,"701,61392-0111-51 ",.02)
 ;;61392-0111-51
 ;;9002226.02101,"701,61392-0111-54 ",.01)
 ;;61392-0111-54
 ;;9002226.02101,"701,61392-0111-54 ",.02)
 ;;61392-0111-54
 ;;9002226.02101,"701,61392-0111-60 ",.01)
 ;;61392-0111-60
 ;;9002226.02101,"701,61392-0111-60 ",.02)
 ;;61392-0111-60
 ;;9002226.02101,"701,61392-0111-90 ",.01)
 ;;61392-0111-90
 ;;9002226.02101,"701,61392-0111-90 ",.02)
 ;;61392-0111-90
 ;;9002226.02101,"701,61392-0111-91 ",.01)
 ;;61392-0111-91
 ;;9002226.02101,"701,61392-0111-91 ",.02)
 ;;61392-0111-91
 ;;9002226.02101,"701,61392-0549-30 ",.01)
 ;;61392-0549-30
 ;;9002226.02101,"701,61392-0549-30 ",.02)
 ;;61392-0549-30
 ;;9002226.02101,"701,61392-0549-31 ",.01)
 ;;61392-0549-31
 ;;9002226.02101,"701,61392-0549-31 ",.02)
 ;;61392-0549-31
 ;;9002226.02101,"701,61392-0549-32 ",.01)
 ;;61392-0549-32
 ;;9002226.02101,"701,61392-0549-32 ",.02)
 ;;61392-0549-32
 ;;9002226.02101,"701,61392-0549-34 ",.01)
 ;;61392-0549-34
 ;;9002226.02101,"701,61392-0549-34 ",.02)
 ;;61392-0549-34
 ;;9002226.02101,"701,61392-0549-39 ",.01)
 ;;61392-0549-39
 ;;9002226.02101,"701,61392-0549-39 ",.02)
 ;;61392-0549-39
 ;;9002226.02101,"701,61392-0549-45 ",.01)
 ;;61392-0549-45
 ;;9002226.02101,"701,61392-0549-45 ",.02)
 ;;61392-0549-45
 ;;9002226.02101,"701,61392-0549-51 ",.01)
 ;;61392-0549-51
 ;;9002226.02101,"701,61392-0549-51 ",.02)
 ;;61392-0549-51
 ;;9002226.02101,"701,61392-0549-54 ",.01)
 ;;61392-0549-54
 ;;9002226.02101,"701,61392-0549-54 ",.02)
 ;;61392-0549-54
 ;;9002226.02101,"701,61392-0549-56 ",.01)
 ;;61392-0549-56
 ;;9002226.02101,"701,61392-0549-56 ",.02)
 ;;61392-0549-56
 ;;9002226.02101,"701,61392-0549-60 ",.01)
 ;;61392-0549-60
 ;;9002226.02101,"701,61392-0549-60 ",.02)
 ;;61392-0549-60
 ;;9002226.02101,"701,61392-0549-90 ",.01)
 ;;61392-0549-90
 ;;9002226.02101,"701,61392-0549-90 ",.02)
 ;;61392-0549-90
 ;;9002226.02101,"701,61392-0549-91 ",.01)
 ;;61392-0549-91
 ;;9002226.02101,"701,61392-0549-91 ",.02)
 ;;61392-0549-91
 ;;9002226.02101,"701,61392-0552-30 ",.01)
 ;;61392-0552-30
 ;;9002226.02101,"701,61392-0552-30 ",.02)
 ;;61392-0552-30
 ;;9002226.02101,"701,61392-0552-31 ",.01)
 ;;61392-0552-31
 ;;9002226.02101,"701,61392-0552-31 ",.02)
 ;;61392-0552-31
 ;;9002226.02101,"701,61392-0552-32 ",.01)
 ;;61392-0552-32
 ;;9002226.02101,"701,61392-0552-32 ",.02)
 ;;61392-0552-32
 ;;9002226.02101,"701,61392-0552-39 ",.01)
 ;;61392-0552-39
 ;;9002226.02101,"701,61392-0552-39 ",.02)
 ;;61392-0552-39
 ;;9002226.02101,"701,61392-0552-45 ",.01)
 ;;61392-0552-45
 ;;9002226.02101,"701,61392-0552-45 ",.02)
 ;;61392-0552-45
 ;;9002226.02101,"701,61392-0552-51 ",.01)
 ;;61392-0552-51
 ;;9002226.02101,"701,61392-0552-51 ",.02)
 ;;61392-0552-51
