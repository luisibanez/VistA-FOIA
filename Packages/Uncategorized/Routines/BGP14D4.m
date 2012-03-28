BGP14D4 ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON APR 14, 2011 ;
 ;;11.1;IHS CLINICAL REPORTING SYSTEM;;JUN 27, 2011;Build 33
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"1106,52959-0507-30 ",.02)
 ;;52959-0507-30
 ;;9002226.02101,"1106,52959-0508-02 ",.01)
 ;;52959-0508-02
 ;;9002226.02101,"1106,52959-0508-02 ",.02)
 ;;52959-0508-02
 ;;9002226.02101,"1106,52959-0508-04 ",.01)
 ;;52959-0508-04
 ;;9002226.02101,"1106,52959-0508-04 ",.02)
 ;;52959-0508-04
 ;;9002226.02101,"1106,52959-0508-06 ",.01)
 ;;52959-0508-06
 ;;9002226.02101,"1106,52959-0508-06 ",.02)
 ;;52959-0508-06
 ;;9002226.02101,"1106,52959-0508-08 ",.01)
 ;;52959-0508-08
 ;;9002226.02101,"1106,52959-0508-08 ",.02)
 ;;52959-0508-08
 ;;9002226.02101,"1106,52959-0508-14 ",.01)
 ;;52959-0508-14
 ;;9002226.02101,"1106,52959-0508-14 ",.02)
 ;;52959-0508-14
 ;;9002226.02101,"1106,52959-0508-15 ",.01)
 ;;52959-0508-15
 ;;9002226.02101,"1106,52959-0508-15 ",.02)
 ;;52959-0508-15
 ;;9002226.02101,"1106,52959-0508-60 ",.01)
 ;;52959-0508-60
 ;;9002226.02101,"1106,52959-0508-60 ",.02)
 ;;52959-0508-60
 ;;9002226.02101,"1106,52959-0509-06 ",.01)
 ;;52959-0509-06
 ;;9002226.02101,"1106,52959-0509-06 ",.02)
 ;;52959-0509-06
 ;;9002226.02101,"1106,52959-0509-12 ",.01)
 ;;52959-0509-12
 ;;9002226.02101,"1106,52959-0509-12 ",.02)
 ;;52959-0509-12
 ;;9002226.02101,"1106,52959-0509-18 ",.01)
 ;;52959-0509-18
 ;;9002226.02101,"1106,52959-0509-18 ",.02)
 ;;52959-0509-18
 ;;9002226.02101,"1106,52959-0509-20 ",.01)
 ;;52959-0509-20
 ;;9002226.02101,"1106,52959-0509-20 ",.02)
 ;;52959-0509-20
 ;;9002226.02101,"1106,52959-0509-24 ",.01)
 ;;52959-0509-24
 ;;9002226.02101,"1106,52959-0509-24 ",.02)
 ;;52959-0509-24
 ;;9002226.02101,"1106,52959-0509-28 ",.01)
 ;;52959-0509-28
 ;;9002226.02101,"1106,52959-0509-28 ",.02)
 ;;52959-0509-28
 ;;9002226.02101,"1106,52959-0509-30 ",.01)
 ;;52959-0509-30
 ;;9002226.02101,"1106,52959-0509-30 ",.02)
 ;;52959-0509-30
 ;;9002226.02101,"1106,52959-0546-02 ",.01)
 ;;52959-0546-02
 ;;9002226.02101,"1106,52959-0546-02 ",.02)
 ;;52959-0546-02
 ;;9002226.02101,"1106,52959-0546-03 ",.01)
 ;;52959-0546-03
 ;;9002226.02101,"1106,52959-0546-03 ",.02)
 ;;52959-0546-03
 ;;9002226.02101,"1106,52959-0546-04 ",.01)
 ;;52959-0546-04
 ;;9002226.02101,"1106,52959-0546-04 ",.02)
 ;;52959-0546-04
 ;;9002226.02101,"1106,52959-0546-06 ",.01)
 ;;52959-0546-06
 ;;9002226.02101,"1106,52959-0546-06 ",.02)
 ;;52959-0546-06
 ;;9002226.02101,"1106,52959-0546-08 ",.01)
 ;;52959-0546-08
 ;;9002226.02101,"1106,52959-0546-08 ",.02)
 ;;52959-0546-08
 ;;9002226.02101,"1106,52959-0546-10 ",.01)
 ;;52959-0546-10
 ;;9002226.02101,"1106,52959-0546-10 ",.02)
 ;;52959-0546-10
 ;;9002226.02101,"1106,52959-0546-14 ",.01)
 ;;52959-0546-14
 ;;9002226.02101,"1106,52959-0546-14 ",.02)
 ;;52959-0546-14
 ;;9002226.02101,"1106,52959-0546-15 ",.01)
 ;;52959-0546-15
 ;;9002226.02101,"1106,52959-0546-15 ",.02)
 ;;52959-0546-15
 ;;9002226.02101,"1106,52959-0546-20 ",.01)
 ;;52959-0546-20
 ;;9002226.02101,"1106,52959-0546-20 ",.02)
 ;;52959-0546-20
 ;;9002226.02101,"1106,52959-0546-28 ",.01)
 ;;52959-0546-28
 ;;9002226.02101,"1106,52959-0546-28 ",.02)
 ;;52959-0546-28
 ;;9002226.02101,"1106,52959-0968-12 ",.01)
 ;;52959-0968-12
 ;;9002226.02101,"1106,52959-0968-12 ",.02)
 ;;52959-0968-12
 ;;9002226.02101,"1106,52959-0969-03 ",.01)
 ;;52959-0969-03
 ;;9002226.02101,"1106,52959-0969-03 ",.02)
 ;;52959-0969-03
 ;;9002226.02101,"1106,54348-0618-09 ",.01)
 ;;54348-0618-09
 ;;9002226.02101,"1106,54348-0618-09 ",.02)
 ;;54348-0618-09
 ;;9002226.02101,"1106,54348-0619-02 ",.01)
 ;;54348-0619-02
 ;;9002226.02101,"1106,54348-0619-02 ",.02)
 ;;54348-0619-02
 ;;9002226.02101,"1106,54569-4053-00 ",.01)
 ;;54569-4053-00
 ;;9002226.02101,"1106,54569-4053-00 ",.02)
 ;;54569-4053-00
 ;;9002226.02101,"1106,54569-4054-00 ",.01)
 ;;54569-4054-00
 ;;9002226.02101,"1106,54569-4054-00 ",.02)
 ;;54569-4054-00
 ;;9002226.02101,"1106,54569-4221-00 ",.01)
 ;;54569-4221-00
 ;;9002226.02101,"1106,54569-4221-00 ",.02)
 ;;54569-4221-00
 ;;9002226.02101,"1106,54569-4333-00 ",.01)
 ;;54569-4333-00
 ;;9002226.02101,"1106,54569-4333-00 ",.02)
 ;;54569-4333-00
 ;;9002226.02101,"1106,54569-4524-00 ",.01)
 ;;54569-4524-00
 ;;9002226.02101,"1106,54569-4524-00 ",.02)
 ;;54569-4524-00
 ;;9002226.02101,"1106,54569-4524-01 ",.01)
 ;;54569-4524-01
 ;;9002226.02101,"1106,54569-4524-01 ",.02)
 ;;54569-4524-01
 ;;9002226.02101,"1106,54569-4524-02 ",.01)
 ;;54569-4524-02
 ;;9002226.02101,"1106,54569-4524-02 ",.02)
 ;;54569-4524-02
 ;;9002226.02101,"1106,54569-4538-00 ",.01)
 ;;54569-4538-00
 ;;9002226.02101,"1106,54569-4538-00 ",.02)
 ;;54569-4538-00
 ;;9002226.02101,"1106,54569-4543-03 ",.01)
 ;;54569-4543-03
 ;;9002226.02101,"1106,54569-4543-03 ",.02)
 ;;54569-4543-03
 ;;9002226.02101,"1106,54569-4561-00 ",.01)
 ;;54569-4561-00
 ;;9002226.02101,"1106,54569-4561-00 ",.02)
 ;;54569-4561-00
 ;;9002226.02101,"1106,54569-4611-00 ",.01)
 ;;54569-4611-00
 ;;9002226.02101,"1106,54569-4611-00 ",.02)
 ;;54569-4611-00
 ;;9002226.02101,"1106,54569-4883-00 ",.01)
 ;;54569-4883-00
 ;;9002226.02101,"1106,54569-4883-00 ",.02)
 ;;54569-4883-00
 ;;9002226.02101,"1106,54569-5142-00 ",.01)
 ;;54569-5142-00
 ;;9002226.02101,"1106,54569-5142-00 ",.02)
 ;;54569-5142-00
 ;;9002226.02101,"1106,54569-5176-00 ",.01)
 ;;54569-5176-00
 ;;9002226.02101,"1106,54569-5176-00 ",.02)
 ;;54569-5176-00
 ;;9002226.02101,"1106,54569-5191-00 ",.01)
 ;;54569-5191-00
 ;;9002226.02101,"1106,54569-5191-00 ",.02)
 ;;54569-5191-00
 ;;9002226.02101,"1106,54569-5334-00 ",.01)
 ;;54569-5334-00
 ;;9002226.02101,"1106,54569-5334-00 ",.02)
 ;;54569-5334-00
 ;;9002226.02101,"1106,54569-5374-00 ",.01)
 ;;54569-5374-00
 ;;9002226.02101,"1106,54569-5374-00 ",.02)
 ;;54569-5374-00
 ;;9002226.02101,"1106,54569-5390-00 ",.01)
 ;;54569-5390-00
 ;;9002226.02101,"1106,54569-5390-00 ",.02)
 ;;54569-5390-00
 ;;9002226.02101,"1106,54569-5480-00 ",.01)
 ;;54569-5480-00
 ;;9002226.02101,"1106,54569-5480-00 ",.02)
 ;;54569-5480-00
 ;;9002226.02101,"1106,54569-5501-00 ",.01)
 ;;54569-5501-00
 ;;9002226.02101,"1106,54569-5501-00 ",.02)
 ;;54569-5501-00
 ;;9002226.02101,"1106,54569-5504-00 ",.01)
 ;;54569-5504-00
 ;;9002226.02101,"1106,54569-5504-00 ",.02)
 ;;54569-5504-00
 ;;9002226.02101,"1106,54569-5521-00 ",.01)
 ;;54569-5521-00
 ;;9002226.02101,"1106,54569-5521-00 ",.02)
 ;;54569-5521-00
 ;;9002226.02101,"1106,54569-5525-00 ",.01)
 ;;54569-5525-00
 ;;9002226.02101,"1106,54569-5525-00 ",.02)
 ;;54569-5525-00
 ;;9002226.02101,"1106,54569-5530-00 ",.01)
 ;;54569-5530-00
 ;;9002226.02101,"1106,54569-5530-00 ",.02)
 ;;54569-5530-00
 ;;9002226.02101,"1106,54569-5532-00 ",.01)
 ;;54569-5532-00
 ;;9002226.02101,"1106,54569-5532-00 ",.02)
 ;;54569-5532-00
 ;;9002226.02101,"1106,54569-5550-00 ",.01)
 ;;54569-5550-00
 ;;9002226.02101,"1106,54569-5550-00 ",.02)
 ;;54569-5550-00
 ;;9002226.02101,"1106,54569-5573-00 ",.01)
 ;;54569-5573-00
 ;;9002226.02101,"1106,54569-5573-00 ",.02)
 ;;54569-5573-00
 ;;9002226.02101,"1106,54569-5588-00 ",.01)
 ;;54569-5588-00
 ;;9002226.02101,"1106,54569-5588-00 ",.02)
 ;;54569-5588-00
 ;;9002226.02101,"1106,54569-5594-00 ",.01)
 ;;54569-5594-00
 ;;9002226.02101,"1106,54569-5594-00 ",.02)
 ;;54569-5594-00
 ;;9002226.02101,"1106,54569-5602-00 ",.01)
 ;;54569-5602-00
 ;;9002226.02101,"1106,54569-5602-00 ",.02)
 ;;54569-5602-00
 ;;9002226.02101,"1106,54569-5642-00 ",.01)
 ;;54569-5642-00
 ;;9002226.02101,"1106,54569-5642-00 ",.02)
 ;;54569-5642-00
 ;;9002226.02101,"1106,54569-5643-00 ",.01)
 ;;54569-5643-00
 ;;9002226.02101,"1106,54569-5643-00 ",.02)
 ;;54569-5643-00
 ;;9002226.02101,"1106,54569-5656-00 ",.01)
 ;;54569-5656-00
 ;;9002226.02101,"1106,54569-5656-00 ",.02)
 ;;54569-5656-00
 ;;9002226.02101,"1106,54569-5664-00 ",.01)
 ;;54569-5664-00
 ;;9002226.02101,"1106,54569-5664-00 ",.02)
 ;;54569-5664-00
 ;;9002226.02101,"1106,54569-5752-00 ",.01)
 ;;54569-5752-00
 ;;9002226.02101,"1106,54569-5752-00 ",.02)
 ;;54569-5752-00
 ;;9002226.02101,"1106,54569-5781-00 ",.01)
 ;;54569-5781-00
 ;;9002226.02101,"1106,54569-5781-00 ",.02)
 ;;54569-5781-00
 ;;9002226.02101,"1106,54569-5805-00 ",.01)
 ;;54569-5805-00
 ;;9002226.02101,"1106,54569-5805-00 ",.02)
 ;;54569-5805-00
 ;;9002226.02101,"1106,54569-5814-00 ",.01)
 ;;54569-5814-00
 ;;9002226.02101,"1106,54569-5814-00 ",.02)
 ;;54569-5814-00
 ;;9002226.02101,"1106,54569-5864-00 ",.01)
 ;;54569-5864-00
 ;;9002226.02101,"1106,54569-5864-00 ",.02)
 ;;54569-5864-00
 ;;9002226.02101,"1106,54569-6034-00 ",.01)
 ;;54569-6034-00
 ;;9002226.02101,"1106,54569-6034-00 ",.02)
 ;;54569-6034-00
 ;;9002226.02101,"1106,54569-6086-00 ",.01)
 ;;54569-6086-00
 ;;9002226.02101,"1106,54569-6086-00 ",.02)
 ;;54569-6086-00
 ;;9002226.02101,"1106,54569-6102-00 ",.01)
 ;;54569-6102-00
 ;;9002226.02101,"1106,54569-6102-00 ",.02)
 ;;54569-6102-00
 ;;9002226.02101,"1106,54569-6122-00 ",.01)
 ;;54569-6122-00
 ;;9002226.02101,"1106,54569-6122-00 ",.02)
 ;;54569-6122-00
 ;;9002226.02101,"1106,54569-6123-00 ",.01)
 ;;54569-6123-00
 ;;9002226.02101,"1106,54569-6123-00 ",.02)
 ;;54569-6123-00
 ;;9002226.02101,"1106,54569-6143-00 ",.01)
 ;;54569-6143-00
 ;;9002226.02101,"1106,54569-6143-00 ",.02)
 ;;54569-6143-00
 ;;9002226.02101,"1106,54569-6159-00 ",.01)
 ;;54569-6159-00
 ;;9002226.02101,"1106,54569-6159-00 ",.02)
 ;;54569-6159-00
 ;;9002226.02101,"1106,54569-6170-00 ",.01)
 ;;54569-6170-00
 ;;9002226.02101,"1106,54569-6170-00 ",.02)
 ;;54569-6170-00
 ;;9002226.02101,"1106,54569-6171-00 ",.01)
 ;;54569-6171-00
 ;;9002226.02101,"1106,54569-6171-00 ",.02)
 ;;54569-6171-00
 ;;9002226.02101,"1106,54569-6199-00 ",.01)
 ;;54569-6199-00
 ;;9002226.02101,"1106,54569-6199-00 ",.02)
 ;;54569-6199-00
 ;;9002226.02101,"1106,54569-8620-00 ",.01)
 ;;54569-8620-00
 ;;9002226.02101,"1106,54569-8620-00 ",.02)
 ;;54569-8620-00
 ;;9002226.02101,"1106,54868-0117-00 ",.01)
 ;;54868-0117-00
 ;;9002226.02101,"1106,54868-0117-00 ",.02)
 ;;54868-0117-00
 ;;9002226.02101,"1106,54868-1974-00 ",.01)
 ;;54868-1974-00
 ;;9002226.02101,"1106,54868-1974-00 ",.02)
 ;;54868-1974-00
 ;;9002226.02101,"1106,54868-1974-02 ",.01)
 ;;54868-1974-02
 ;;9002226.02101,"1106,54868-1974-02 ",.02)
 ;;54868-1974-02
 ;;9002226.02101,"1106,54868-1974-03 ",.01)
 ;;54868-1974-03
 ;;9002226.02101,"1106,54868-1974-03 ",.02)
 ;;54868-1974-03
 ;;9002226.02101,"1106,54868-2499-01 ",.01)
 ;;54868-2499-01
 ;;9002226.02101,"1106,54868-2499-01 ",.02)
 ;;54868-2499-01
 ;;9002226.02101,"1106,54868-2500-01 ",.01)
 ;;54868-2500-01
 ;;9002226.02101,"1106,54868-2500-01 ",.02)
 ;;54868-2500-01
 ;;9002226.02101,"1106,54868-2500-02 ",.01)
 ;;54868-2500-02
 ;;9002226.02101,"1106,54868-2500-02 ",.02)
 ;;54868-2500-02
 ;;9002226.02101,"1106,54868-2504-01 ",.01)
 ;;54868-2504-01
 ;;9002226.02101,"1106,54868-2504-01 ",.02)
 ;;54868-2504-01
 ;;9002226.02101,"1106,54868-3352-00 ",.01)
 ;;54868-3352-00
 ;;9002226.02101,"1106,54868-3352-00 ",.02)
 ;;54868-3352-00
 ;;9002226.02101,"1106,54868-3352-01 ",.01)
 ;;54868-3352-01
 ;;9002226.02101,"1106,54868-3352-01 ",.02)
 ;;54868-3352-01
 ;;9002226.02101,"1106,54868-3353-00 ",.01)
 ;;54868-3353-00
 ;;9002226.02101,"1106,54868-3353-00 ",.02)
 ;;54868-3353-00
 ;;9002226.02101,"1106,54868-3360-00 ",.01)
 ;;54868-3360-00
 ;;9002226.02101,"1106,54868-3360-00 ",.02)
 ;;54868-3360-00
 ;;9002226.02101,"1106,54868-3448-00 ",.01)
 ;;54868-3448-00
 ;;9002226.02101,"1106,54868-3448-00 ",.02)
 ;;54868-3448-00
 ;;9002226.02101,"1106,54868-3693-00 ",.01)
 ;;54868-3693-00
 ;;9002226.02101,"1106,54868-3693-00 ",.02)
 ;;54868-3693-00
 ;;9002226.02101,"1106,54868-3693-02 ",.01)
 ;;54868-3693-02
 ;;9002226.02101,"1106,54868-3693-02 ",.02)
 ;;54868-3693-02
 ;;9002226.02101,"1106,54868-3699-00 ",.01)
 ;;54868-3699-00
 ;;9002226.02101,"1106,54868-3699-00 ",.02)
 ;;54868-3699-00
 ;;9002226.02101,"1106,54868-3699-01 ",.01)
 ;;54868-3699-01
 ;;9002226.02101,"1106,54868-3699-01 ",.02)
 ;;54868-3699-01
 ;;9002226.02101,"1106,54868-3699-02 ",.01)
 ;;54868-3699-02
 ;;9002226.02101,"1106,54868-3699-02 ",.02)
 ;;54868-3699-02
 ;;9002226.02101,"1106,54868-3782-01 ",.01)
 ;;54868-3782-01
 ;;9002226.02101,"1106,54868-3782-01 ",.02)
 ;;54868-3782-01
 ;;9002226.02101,"1106,54868-3782-02 ",.01)
 ;;54868-3782-02
 ;;9002226.02101,"1106,54868-3782-02 ",.02)
 ;;54868-3782-02
 ;;9002226.02101,"1106,54868-3782-03 ",.01)
 ;;54868-3782-03
 ;;9002226.02101,"1106,54868-3782-03 ",.02)
 ;;54868-3782-03
 ;;9002226.02101,"1106,54868-3844-00 ",.01)
 ;;54868-3844-00
 ;;9002226.02101,"1106,54868-3844-00 ",.02)
 ;;54868-3844-00
 ;;9002226.02101,"1106,54868-3844-01 ",.01)
 ;;54868-3844-01
 ;;9002226.02101,"1106,54868-3844-01 ",.02)
 ;;54868-3844-01
 ;;9002226.02101,"1106,54868-3947-00 ",.01)
 ;;54868-3947-00
