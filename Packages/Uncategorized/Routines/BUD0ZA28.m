BUD0ZA28 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON DEC 13, 2010;
 ;;5.0;IHS/RPMS UNIFORM DATA SYSTEM;;JAN 18, 2011;Build 12
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1062,54569-3841-02 ",.01)
 ;;54569-3841-02
 ;;9002226.02101,"1062,54569-3841-02 ",.02)
 ;;54569-3841-02
 ;;9002226.02101,"1062,54569-3842-00 ",.01)
 ;;54569-3842-00
 ;;9002226.02101,"1062,54569-3842-00 ",.02)
 ;;54569-3842-00
 ;;9002226.02101,"1062,54569-3842-01 ",.01)
 ;;54569-3842-01
 ;;9002226.02101,"1062,54569-3842-01 ",.02)
 ;;54569-3842-01
 ;;9002226.02101,"1062,54569-3842-02 ",.01)
 ;;54569-3842-02
 ;;9002226.02101,"1062,54569-3842-02 ",.02)
 ;;54569-3842-02
 ;;9002226.02101,"1062,54569-3842-04 ",.01)
 ;;54569-3842-04
 ;;9002226.02101,"1062,54569-3842-04 ",.02)
 ;;54569-3842-04
 ;;9002226.02101,"1062,54569-3937-00 ",.01)
 ;;54569-3937-00
 ;;9002226.02101,"1062,54569-3937-00 ",.02)
 ;;54569-3937-00
 ;;9002226.02101,"1062,54569-3938-00 ",.01)
 ;;54569-3938-00
 ;;9002226.02101,"1062,54569-3938-00 ",.02)
 ;;54569-3938-00
 ;;9002226.02101,"1062,54569-3938-01 ",.01)
 ;;54569-3938-01
 ;;9002226.02101,"1062,54569-3938-01 ",.02)
 ;;54569-3938-01
 ;;9002226.02101,"1062,54569-4453-00 ",.01)
 ;;54569-4453-00
 ;;9002226.02101,"1062,54569-4453-00 ",.02)
 ;;54569-4453-00
 ;;9002226.02101,"1062,54569-4453-01 ",.01)
 ;;54569-4453-01
 ;;9002226.02101,"1062,54569-4453-01 ",.02)
 ;;54569-4453-01
 ;;9002226.02101,"1062,54569-4501-00 ",.01)
 ;;54569-4501-00
 ;;9002226.02101,"1062,54569-4501-00 ",.02)
 ;;54569-4501-00
 ;;9002226.02101,"1062,54569-4801-00 ",.01)
 ;;54569-4801-00
 ;;9002226.02101,"1062,54569-4801-00 ",.02)
 ;;54569-4801-00
 ;;9002226.02101,"1062,54569-4802-00 ",.01)
 ;;54569-4802-00
 ;;9002226.02101,"1062,54569-4802-00 ",.02)
 ;;54569-4802-00
 ;;9002226.02101,"1062,54569-4803-00 ",.01)
 ;;54569-4803-00
 ;;9002226.02101,"1062,54569-4803-00 ",.02)
 ;;54569-4803-00
 ;;9002226.02101,"1062,54569-4880-00 ",.01)
 ;;54569-4880-00
 ;;9002226.02101,"1062,54569-4880-00 ",.02)
 ;;54569-4880-00
 ;;9002226.02101,"1062,54569-4881-00 ",.01)
 ;;54569-4881-00
 ;;9002226.02101,"1062,54569-4881-00 ",.02)
 ;;54569-4881-00
 ;;9002226.02101,"1062,54569-4882-00 ",.01)
 ;;54569-4882-00
 ;;9002226.02101,"1062,54569-4882-00 ",.02)
 ;;54569-4882-00
 ;;9002226.02101,"1062,54569-5547-00 ",.01)
 ;;54569-5547-00
 ;;9002226.02101,"1062,54569-5547-00 ",.02)
 ;;54569-5547-00
 ;;9002226.02101,"1062,54569-5547-01 ",.01)
 ;;54569-5547-01
 ;;9002226.02101,"1062,54569-5547-01 ",.02)
 ;;54569-5547-01
 ;;9002226.02101,"1062,54569-5548-00 ",.01)
 ;;54569-5548-00
 ;;9002226.02101,"1062,54569-5548-00 ",.02)
 ;;54569-5548-00
 ;;9002226.02101,"1062,54569-5548-01 ",.01)
 ;;54569-5548-01
 ;;9002226.02101,"1062,54569-5548-01 ",.02)
 ;;54569-5548-01
 ;;9002226.02101,"1062,54569-5605-00 ",.01)
 ;;54569-5605-00
 ;;9002226.02101,"1062,54569-5605-00 ",.02)
 ;;54569-5605-00
 ;;9002226.02101,"1062,54569-5618-00 ",.01)
 ;;54569-5618-00
 ;;9002226.02101,"1062,54569-5618-00 ",.02)
 ;;54569-5618-00
 ;;9002226.02101,"1062,54569-5618-01 ",.01)
 ;;54569-5618-01
 ;;9002226.02101,"1062,54569-5618-01 ",.02)
 ;;54569-5618-01
 ;;9002226.02101,"1062,54569-5619-00 ",.01)
 ;;54569-5619-00
 ;;9002226.02101,"1062,54569-5619-00 ",.02)
 ;;54569-5619-00
 ;;9002226.02101,"1062,54569-5619-01 ",.01)
 ;;54569-5619-01
 ;;9002226.02101,"1062,54569-5619-01 ",.02)
 ;;54569-5619-01
 ;;9002226.02101,"1062,54569-5855-00 ",.01)
 ;;54569-5855-00
 ;;9002226.02101,"1062,54569-5855-00 ",.02)
 ;;54569-5855-00
 ;;9002226.02101,"1062,54569-5991-00 ",.01)
 ;;54569-5991-00
 ;;9002226.02101,"1062,54569-5991-00 ",.02)
 ;;54569-5991-00
 ;;9002226.02101,"1062,54569-5992-00 ",.01)
 ;;54569-5992-00
 ;;9002226.02101,"1062,54569-5992-00 ",.02)
 ;;54569-5992-00
 ;;9002226.02101,"1062,54569-5993-00 ",.01)
 ;;54569-5993-00
 ;;9002226.02101,"1062,54569-5993-00 ",.02)
 ;;54569-5993-00
 ;;9002226.02101,"1062,54569-8556-00 ",.01)
 ;;54569-8556-00
 ;;9002226.02101,"1062,54569-8556-00 ",.02)
 ;;54569-8556-00
 ;;9002226.02101,"1062,54569-8556-01 ",.01)
 ;;54569-8556-01
 ;;9002226.02101,"1062,54569-8556-01 ",.02)
 ;;54569-8556-01
 ;;9002226.02101,"1062,54569-8556-02 ",.01)
 ;;54569-8556-02
 ;;9002226.02101,"1062,54569-8556-02 ",.02)
 ;;54569-8556-02
 ;;9002226.02101,"1062,54569-8556-03 ",.01)
 ;;54569-8556-03
 ;;9002226.02101,"1062,54569-8556-03 ",.02)
 ;;54569-8556-03
 ;;9002226.02101,"1062,54569-8565-00 ",.01)
 ;;54569-8565-00
 ;;9002226.02101,"1062,54569-8565-00 ",.02)
 ;;54569-8565-00
 ;;9002226.02101,"1062,54569-8601-00 ",.01)
 ;;54569-8601-00
 ;;9002226.02101,"1062,54569-8601-00 ",.02)
 ;;54569-8601-00
 ;;9002226.02101,"1062,54569-8601-01 ",.01)
 ;;54569-8601-01
 ;;9002226.02101,"1062,54569-8601-01 ",.02)
 ;;54569-8601-01
 ;;9002226.02101,"1062,54569-8601-02 ",.01)
 ;;54569-8601-02
 ;;9002226.02101,"1062,54569-8601-02 ",.02)
 ;;54569-8601-02
 ;;9002226.02101,"1062,54569-8601-03 ",.01)
 ;;54569-8601-03
 ;;9002226.02101,"1062,54569-8601-03 ",.02)
 ;;54569-8601-03
 ;;9002226.02101,"1062,54868-0036-00 ",.01)
 ;;54868-0036-00
 ;;9002226.02101,"1062,54868-0036-00 ",.02)
 ;;54868-0036-00
 ;;9002226.02101,"1062,54868-0036-02 ",.01)
 ;;54868-0036-02
 ;;9002226.02101,"1062,54868-0036-02 ",.02)
 ;;54868-0036-02
 ;;9002226.02101,"1062,54868-0036-04 ",.01)
 ;;54868-0036-04
 ;;9002226.02101,"1062,54868-0036-04 ",.02)
 ;;54868-0036-04
 ;;9002226.02101,"1062,54868-0373-01 ",.01)
 ;;54868-0373-01
