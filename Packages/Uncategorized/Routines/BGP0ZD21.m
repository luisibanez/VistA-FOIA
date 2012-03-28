BGP0ZD21 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"976,54569-4321-01 ",.02)
 ;;54569-4321-01
 ;;9002226.02101,"976,54569-4321-02 ",.01)
 ;;54569-4321-02
 ;;9002226.02101,"976,54569-4321-02 ",.02)
 ;;54569-4321-02
 ;;9002226.02101,"976,54569-4321-03 ",.01)
 ;;54569-4321-03
 ;;9002226.02101,"976,54569-4321-03 ",.02)
 ;;54569-4321-03
 ;;9002226.02101,"976,54569-4416-00 ",.01)
 ;;54569-4416-00
 ;;9002226.02101,"976,54569-4416-00 ",.02)
 ;;54569-4416-00
 ;;9002226.02101,"976,54569-4464-00 ",.01)
 ;;54569-4464-00
 ;;9002226.02101,"976,54569-4464-00 ",.02)
 ;;54569-4464-00
 ;;9002226.02101,"976,54569-4468-00 ",.01)
 ;;54569-4468-00
 ;;9002226.02101,"976,54569-4468-00 ",.02)
 ;;54569-4468-00
 ;;9002226.02101,"976,54569-4468-01 ",.01)
 ;;54569-4468-01
 ;;9002226.02101,"976,54569-4468-01 ",.02)
 ;;54569-4468-01
 ;;9002226.02101,"976,54569-4468-02 ",.01)
 ;;54569-4468-02
 ;;9002226.02101,"976,54569-4468-02 ",.02)
 ;;54569-4468-02
 ;;9002226.02101,"976,54569-4468-05 ",.01)
 ;;54569-4468-05
 ;;9002226.02101,"976,54569-4468-05 ",.02)
 ;;54569-4468-05
 ;;9002226.02101,"976,54569-4494-00 ",.01)
 ;;54569-4494-00
 ;;9002226.02101,"976,54569-4494-00 ",.02)
 ;;54569-4494-00
 ;;9002226.02101,"976,54569-4494-01 ",.01)
 ;;54569-4494-01
 ;;9002226.02101,"976,54569-4494-01 ",.02)
 ;;54569-4494-01
 ;;9002226.02101,"976,54569-4494-02 ",.01)
 ;;54569-4494-02
 ;;9002226.02101,"976,54569-4494-02 ",.02)
 ;;54569-4494-02
 ;;9002226.02101,"976,54569-4520-00 ",.01)
 ;;54569-4520-00
 ;;9002226.02101,"976,54569-4520-00 ",.02)
 ;;54569-4520-00
 ;;9002226.02101,"976,54569-4520-01 ",.01)
 ;;54569-4520-01
 ;;9002226.02101,"976,54569-4520-01 ",.02)
 ;;54569-4520-01
 ;;9002226.02101,"976,54569-4523-00 ",.01)
 ;;54569-4523-00
 ;;9002226.02101,"976,54569-4523-00 ",.02)
 ;;54569-4523-00
 ;;9002226.02101,"976,54569-4545-00 ",.01)
 ;;54569-4545-00
 ;;9002226.02101,"976,54569-4545-00 ",.02)
 ;;54569-4545-00
 ;;9002226.02101,"976,54569-4545-01 ",.01)
 ;;54569-4545-01
 ;;9002226.02101,"976,54569-4545-01 ",.02)
 ;;54569-4545-01
 ;;9002226.02101,"976,54569-4579-00 ",.01)
 ;;54569-4579-00
 ;;9002226.02101,"976,54569-4579-00 ",.02)
 ;;54569-4579-00
 ;;9002226.02101,"976,54569-4630-00 ",.01)
 ;;54569-4630-00
 ;;9002226.02101,"976,54569-4630-00 ",.02)
 ;;54569-4630-00
 ;;9002226.02101,"976,54569-4630-03 ",.01)
 ;;54569-4630-03
 ;;9002226.02101,"976,54569-4630-03 ",.02)
 ;;54569-4630-03
 ;;9002226.02101,"976,54569-4630-04 ",.01)
 ;;54569-4630-04
 ;;9002226.02101,"976,54569-4630-04 ",.02)
 ;;54569-4630-04
 ;;9002226.02101,"976,54569-4671-00 ",.01)
 ;;54569-4671-00
 ;;9002226.02101,"976,54569-4671-00 ",.02)
 ;;54569-4671-00
 ;;9002226.02101,"976,54569-4671-01 ",.01)
 ;;54569-4671-01
 ;;9002226.02101,"976,54569-4671-01 ",.02)
 ;;54569-4671-01
 ;;9002226.02101,"976,54569-4671-02 ",.01)
 ;;54569-4671-02
 ;;9002226.02101,"976,54569-4671-02 ",.02)
 ;;54569-4671-02
 ;;9002226.02101,"976,54569-4671-04 ",.01)
 ;;54569-4671-04
 ;;9002226.02101,"976,54569-4671-04 ",.02)
 ;;54569-4671-04
 ;;9002226.02101,"976,54569-4672-00 ",.01)
 ;;54569-4672-00
 ;;9002226.02101,"976,54569-4672-00 ",.02)
 ;;54569-4672-00
 ;;9002226.02101,"976,54569-4672-01 ",.01)
 ;;54569-4672-01
 ;;9002226.02101,"976,54569-4672-01 ",.02)
 ;;54569-4672-01
 ;;9002226.02101,"976,54569-4672-02 ",.01)
 ;;54569-4672-02
 ;;9002226.02101,"976,54569-4672-02 ",.02)
 ;;54569-4672-02
 ;;9002226.02101,"976,54569-4672-04 ",.01)
 ;;54569-4672-04
 ;;9002226.02101,"976,54569-4672-04 ",.02)
 ;;54569-4672-04
 ;;9002226.02101,"976,54569-4672-05 ",.01)
 ;;54569-4672-05
 ;;9002226.02101,"976,54569-4672-05 ",.02)
 ;;54569-4672-05
 ;;9002226.02101,"976,54569-4672-06 ",.01)
 ;;54569-4672-06
 ;;9002226.02101,"976,54569-4672-06 ",.02)
 ;;54569-4672-06
 ;;9002226.02101,"976,54569-4770-00 ",.01)
 ;;54569-4770-00
 ;;9002226.02101,"976,54569-4770-00 ",.02)
 ;;54569-4770-00
 ;;9002226.02101,"976,54569-4770-01 ",.01)
 ;;54569-4770-01
 ;;9002226.02101,"976,54569-4770-01 ",.02)
 ;;54569-4770-01
 ;;9002226.02101,"976,54569-5121-00 ",.01)
 ;;54569-5121-00
 ;;9002226.02101,"976,54569-5121-00 ",.02)
 ;;54569-5121-00
 ;;9002226.02101,"976,54569-5121-01 ",.01)
 ;;54569-5121-01
 ;;9002226.02101,"976,54569-5121-01 ",.02)
 ;;54569-5121-01
 ;;9002226.02101,"976,54569-5121-02 ",.01)
 ;;54569-5121-02
 ;;9002226.02101,"976,54569-5121-02 ",.02)
 ;;54569-5121-02
 ;;9002226.02101,"976,54569-5174-00 ",.01)
 ;;54569-5174-00
 ;;9002226.02101,"976,54569-5174-00 ",.02)
 ;;54569-5174-00
 ;;9002226.02101,"976,54569-5179-00 ",.01)
 ;;54569-5179-00
 ;;9002226.02101,"976,54569-5179-00 ",.02)
 ;;54569-5179-00
 ;;9002226.02101,"976,54569-5179-01 ",.01)
 ;;54569-5179-01
 ;;9002226.02101,"976,54569-5179-01 ",.02)
 ;;54569-5179-01
 ;;9002226.02101,"976,54569-5179-02 ",.01)
 ;;54569-5179-02
 ;;9002226.02101,"976,54569-5179-02 ",.02)
 ;;54569-5179-02
 ;;9002226.02101,"976,54569-5212-00 ",.01)
 ;;54569-5212-00
 ;;9002226.02101,"976,54569-5212-00 ",.02)
 ;;54569-5212-00
 ;;9002226.02101,"976,54569-5212-01 ",.01)
 ;;54569-5212-01
 ;;9002226.02101,"976,54569-5212-01 ",.02)
 ;;54569-5212-01
 ;;9002226.02101,"976,54569-5212-02 ",.01)
 ;;54569-5212-02
 ;;9002226.02101,"976,54569-5212-02 ",.02)
 ;;54569-5212-02
 ;;9002226.02101,"976,54569-5212-03 ",.01)
 ;;54569-5212-03
 ;;9002226.02101,"976,54569-5212-03 ",.02)
 ;;54569-5212-03
 ;;9002226.02101,"976,54569-5212-04 ",.01)
 ;;54569-5212-04
 ;;9002226.02101,"976,54569-5212-04 ",.02)
 ;;54569-5212-04
 ;;9002226.02101,"976,54569-5303-00 ",.01)
 ;;54569-5303-00
 ;;9002226.02101,"976,54569-5303-00 ",.02)
 ;;54569-5303-00
 ;;9002226.02101,"976,54569-5303-01 ",.01)
 ;;54569-5303-01
 ;;9002226.02101,"976,54569-5303-01 ",.02)
 ;;54569-5303-01
 ;;9002226.02101,"976,54569-5303-02 ",.01)
 ;;54569-5303-02
 ;;9002226.02101,"976,54569-5303-02 ",.02)
 ;;54569-5303-02
 ;;9002226.02101,"976,54569-5303-04 ",.01)
 ;;54569-5303-04
 ;;9002226.02101,"976,54569-5303-04 ",.02)
 ;;54569-5303-04
 ;;9002226.02101,"976,54569-5303-05 ",.01)
 ;;54569-5303-05
 ;;9002226.02101,"976,54569-5303-05 ",.02)
 ;;54569-5303-05
 ;;9002226.02101,"976,54569-5303-07 ",.01)
 ;;54569-5303-07
 ;;9002226.02101,"976,54569-5303-07 ",.02)
 ;;54569-5303-07
 ;;9002226.02101,"976,54569-5429-00 ",.01)
 ;;54569-5429-00
 ;;9002226.02101,"976,54569-5429-00 ",.02)
 ;;54569-5429-00
 ;;9002226.02101,"976,54569-5429-02 ",.01)
 ;;54569-5429-02
 ;;9002226.02101,"976,54569-5429-02 ",.02)
 ;;54569-5429-02
 ;;9002226.02101,"976,54569-8521-00 ",.01)
 ;;54569-8521-00
 ;;9002226.02101,"976,54569-8521-00 ",.02)
 ;;54569-8521-00
 ;;9002226.02101,"976,54569-8529-00 ",.01)
 ;;54569-8529-00
 ;;9002226.02101,"976,54569-8529-00 ",.02)
 ;;54569-8529-00
 ;;9002226.02101,"976,54569-8535-00 ",.01)
 ;;54569-8535-00
 ;;9002226.02101,"976,54569-8535-00 ",.02)
 ;;54569-8535-00
 ;;9002226.02101,"976,54569-8538-00 ",.01)
 ;;54569-8538-00
 ;;9002226.02101,"976,54569-8538-00 ",.02)
 ;;54569-8538-00
 ;;9002226.02101,"976,54569-8547-00 ",.01)
 ;;54569-8547-00
 ;;9002226.02101,"976,54569-8547-00 ",.02)
 ;;54569-8547-00
 ;;9002226.02101,"976,54569-8560-00 ",.01)
 ;;54569-8560-00
 ;;9002226.02101,"976,54569-8560-00 ",.02)
 ;;54569-8560-00
 ;;9002226.02101,"976,54569-8581-00 ",.01)
 ;;54569-8581-00
 ;;9002226.02101,"976,54569-8581-00 ",.02)
 ;;54569-8581-00
 ;;9002226.02101,"976,54569-8582-00 ",.01)
 ;;54569-8582-00
 ;;9002226.02101,"976,54569-8582-00 ",.02)
 ;;54569-8582-00
 ;;9002226.02101,"976,54569-8588-00 ",.01)
 ;;54569-8588-00
 ;;9002226.02101,"976,54569-8588-00 ",.02)
 ;;54569-8588-00
 ;;9002226.02101,"976,54569-8615-00 ",.01)
 ;;54569-8615-00
 ;;9002226.02101,"976,54569-8615-00 ",.02)
 ;;54569-8615-00
 ;;9002226.02101,"976,54838-0522-70 ",.01)
 ;;54838-0522-70
 ;;9002226.02101,"976,54838-0522-70 ",.02)
 ;;54838-0522-70
 ;;9002226.02101,"976,54868-0074-00 ",.01)
 ;;54868-0074-00
 ;;9002226.02101,"976,54868-0074-00 ",.02)
 ;;54868-0074-00
 ;;9002226.02101,"976,54868-0074-02 ",.01)
 ;;54868-0074-02
 ;;9002226.02101,"976,54868-0074-02 ",.02)
 ;;54868-0074-02
 ;;9002226.02101,"976,54868-0074-03 ",.01)
 ;;54868-0074-03
 ;;9002226.02101,"976,54868-0074-03 ",.02)
 ;;54868-0074-03
 ;;9002226.02101,"976,54868-0074-04 ",.01)
 ;;54868-0074-04
 ;;9002226.02101,"976,54868-0074-04 ",.02)
 ;;54868-0074-04
 ;;9002226.02101,"976,54868-0074-05 ",.01)
 ;;54868-0074-05
 ;;9002226.02101,"976,54868-0074-05 ",.02)
 ;;54868-0074-05
 ;;9002226.02101,"976,54868-0074-07 ",.01)
 ;;54868-0074-07
 ;;9002226.02101,"976,54868-0074-07 ",.02)
 ;;54868-0074-07
 ;;9002226.02101,"976,54868-0079-00 ",.01)
 ;;54868-0079-00
 ;;9002226.02101,"976,54868-0079-00 ",.02)
 ;;54868-0079-00
 ;;9002226.02101,"976,54868-0079-02 ",.01)
 ;;54868-0079-02
 ;;9002226.02101,"976,54868-0079-02 ",.02)
 ;;54868-0079-02
 ;;9002226.02101,"976,54868-0079-04 ",.01)
 ;;54868-0079-04
 ;;9002226.02101,"976,54868-0079-04 ",.02)
 ;;54868-0079-04
 ;;9002226.02101,"976,54868-0079-05 ",.01)
 ;;54868-0079-05
 ;;9002226.02101,"976,54868-0079-05 ",.02)
 ;;54868-0079-05
 ;;9002226.02101,"976,54868-0079-07 ",.01)
 ;;54868-0079-07
 ;;9002226.02101,"976,54868-0079-07 ",.02)
 ;;54868-0079-07
 ;;9002226.02101,"976,54868-0079-08 ",.01)
 ;;54868-0079-08
 ;;9002226.02101,"976,54868-0079-08 ",.02)
 ;;54868-0079-08
 ;;9002226.02101,"976,54868-0079-09 ",.01)
 ;;54868-0079-09
 ;;9002226.02101,"976,54868-0079-09 ",.02)
 ;;54868-0079-09
 ;;9002226.02101,"976,54868-0080-00 ",.01)
 ;;54868-0080-00
 ;;9002226.02101,"976,54868-0080-00 ",.02)
 ;;54868-0080-00
 ;;9002226.02101,"976,54868-0080-01 ",.01)
 ;;54868-0080-01
 ;;9002226.02101,"976,54868-0080-01 ",.02)
 ;;54868-0080-01
 ;;9002226.02101,"976,54868-0080-02 ",.01)
 ;;54868-0080-02
 ;;9002226.02101,"976,54868-0080-02 ",.02)
 ;;54868-0080-02
 ;;9002226.02101,"976,54868-0080-03 ",.01)
 ;;54868-0080-03
 ;;9002226.02101,"976,54868-0080-03 ",.02)
 ;;54868-0080-03
 ;;9002226.02101,"976,54868-0080-04 ",.01)
 ;;54868-0080-04
 ;;9002226.02101,"976,54868-0080-04 ",.02)
 ;;54868-0080-04
 ;;9002226.02101,"976,54868-0080-05 ",.01)
 ;;54868-0080-05
 ;;9002226.02101,"976,54868-0080-05 ",.02)
 ;;54868-0080-05
 ;;9002226.02101,"976,54868-0080-06 ",.01)
 ;;54868-0080-06
 ;;9002226.02101,"976,54868-0080-06 ",.02)
 ;;54868-0080-06
 ;;9002226.02101,"976,54868-0080-08 ",.01)
 ;;54868-0080-08
 ;;9002226.02101,"976,54868-0080-08 ",.02)
 ;;54868-0080-08
 ;;9002226.02101,"976,54868-0080-09 ",.01)
 ;;54868-0080-09
 ;;9002226.02101,"976,54868-0080-09 ",.02)
 ;;54868-0080-09
 ;;9002226.02101,"976,54868-0133-00 ",.01)
 ;;54868-0133-00
 ;;9002226.02101,"976,54868-0133-00 ",.02)
 ;;54868-0133-00
 ;;9002226.02101,"976,54868-0133-01 ",.01)
 ;;54868-0133-01
 ;;9002226.02101,"976,54868-0133-01 ",.02)
 ;;54868-0133-01
 ;;9002226.02101,"976,54868-0133-02 ",.01)
 ;;54868-0133-02
 ;;9002226.02101,"976,54868-0133-02 ",.02)
 ;;54868-0133-02
 ;;9002226.02101,"976,54868-0133-03 ",.01)
 ;;54868-0133-03
 ;;9002226.02101,"976,54868-0133-03 ",.02)
 ;;54868-0133-03
 ;;9002226.02101,"976,54868-0133-04 ",.01)
 ;;54868-0133-04
 ;;9002226.02101,"976,54868-0133-04 ",.02)
 ;;54868-0133-04
 ;;9002226.02101,"976,54868-0133-05 ",.01)
 ;;54868-0133-05
 ;;9002226.02101,"976,54868-0133-05 ",.02)
 ;;54868-0133-05
 ;;9002226.02101,"976,54868-0133-06 ",.01)
 ;;54868-0133-06
 ;;9002226.02101,"976,54868-0133-06 ",.02)
 ;;54868-0133-06
 ;;9002226.02101,"976,54868-0133-08 ",.01)
 ;;54868-0133-08
 ;;9002226.02101,"976,54868-0133-08 ",.02)
 ;;54868-0133-08
 ;;9002226.02101,"976,54868-0197-02 ",.01)
 ;;54868-0197-02
 ;;9002226.02101,"976,54868-0197-02 ",.02)
 ;;54868-0197-02
 ;;9002226.02101,"976,54868-0197-03 ",.01)
 ;;54868-0197-03
 ;;9002226.02101,"976,54868-0197-03 ",.02)
 ;;54868-0197-03
 ;;9002226.02101,"976,54868-0197-04 ",.01)
 ;;54868-0197-04
 ;;9002226.02101,"976,54868-0197-04 ",.02)
 ;;54868-0197-04
 ;;9002226.02101,"976,54868-0300-00 ",.01)
 ;;54868-0300-00
 ;;9002226.02101,"976,54868-0300-00 ",.02)
 ;;54868-0300-00
 ;;9002226.02101,"976,54868-0300-04 ",.01)
 ;;54868-0300-04
 ;;9002226.02101,"976,54868-0300-04 ",.02)
 ;;54868-0300-04
 ;;9002226.02101,"976,54868-0437-00 ",.01)
 ;;54868-0437-00
 ;;9002226.02101,"976,54868-0437-00 ",.02)
 ;;54868-0437-00
 ;;9002226.02101,"976,54868-0437-03 ",.01)
 ;;54868-0437-03
 ;;9002226.02101,"976,54868-0437-03 ",.02)
 ;;54868-0437-03
 ;;9002226.02101,"976,54868-0437-04 ",.01)
 ;;54868-0437-04
 ;;9002226.02101,"976,54868-0437-04 ",.02)
 ;;54868-0437-04
 ;;9002226.02101,"976,54868-0438-00 ",.01)
 ;;54868-0438-00
 ;;9002226.02101,"976,54868-0438-00 ",.02)
 ;;54868-0438-00
 ;;9002226.02101,"976,54868-0439-03 ",.01)
 ;;54868-0439-03
 ;;9002226.02101,"976,54868-0439-03 ",.02)
 ;;54868-0439-03
 ;;9002226.02101,"976,54868-0439-04 ",.01)
 ;;54868-0439-04
 ;;9002226.02101,"976,54868-0439-04 ",.02)
 ;;54868-0439-04
 ;;9002226.02101,"976,54868-0449-01 ",.01)
 ;;54868-0449-01
 ;;9002226.02101,"976,54868-0449-01 ",.02)
 ;;54868-0449-01
 ;;9002226.02101,"976,54868-0449-02 ",.01)
 ;;54868-0449-02
 ;;9002226.02101,"976,54868-0449-02 ",.02)
 ;;54868-0449-02
 ;;9002226.02101,"976,54868-0474-01 ",.01)
 ;;54868-0474-01
 ;;9002226.02101,"976,54868-0474-01 ",.02)
 ;;54868-0474-01
 ;;9002226.02101,"976,54868-0738-02 ",.01)
 ;;54868-0738-02
 ;;9002226.02101,"976,54868-0738-02 ",.02)
 ;;54868-0738-02
 ;;9002226.02101,"976,54868-0775-03 ",.01)
 ;;54868-0775-03
 ;;9002226.02101,"976,54868-0775-03 ",.02)
 ;;54868-0775-03
 ;;9002226.02101,"976,54868-0856-00 ",.01)
 ;;54868-0856-00
 ;;9002226.02101,"976,54868-0856-00 ",.02)
 ;;54868-0856-00
 ;;9002226.02101,"976,54868-0856-01 ",.01)
 ;;54868-0856-01
