BGPMUAP2 ; IHS/MSC/MGH - Print MU EP measures NQF0031,NQF0032,NQF0034 ;01-Mar-2011 15:43;MGH
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 ;Printed output reports for these 3 measures
COLON ;EP
 D P1
 ;I BGPMUDET="D" D P2
 K ^TMP("BGPMU0034")
 Q
P1 ;Write individual measure
 N X,Y,Z,DEN,NUM,PC1,STRING1,STRING2,STRING3,PRD,PRN,PRD2,PRN2
 S STRING1=$$0034("C")
 S STRING2=$$0034("P")
 S STRING3=$$0034("B")
 S PRD=$P(STRING1,U,4)-$P(STRING2,U,4)
 S PRD1=$P(STRING1,U,5)-$P(STRING2,U,5)
 S PRD2=$P(STRING1,U,7)-$P(STRING2,U,7)
 S PRN=$P(STRING1,U,4)-$P(STRING3,U,4)
 S PRN1=$P(STRING1,U,5)-$P(STRING3,U,5)
 S PRN2=$P(STRING1,U,7)-$P(STRING3,U,7)
 D HEADER^BGPMUPH Q:BGPQUIT
 D HDRBLK^BGPMUPH
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH Q:BGPQUIT
 W !,"Pts 50-74",?33,($P(STRING1,U,1)+$P(STRING1,U,6)),?44,($P(STRING2,U,1)+$P(STRING2,U,6)),?64,($P(STRING3,U,1)+$P(STRING3,U,6))
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH Q:BGPQUIT
 W !,"# Excluded (Exc)",?33,$P(STRING1,U,6),?44,$P(STRING2,U,6),?64,$P(STRING3,U,6)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH Q:BGPQUIT
 W !,"Pts 50-74 less Exc",?33,$P(STRING1,U,1),?44,$P(STRING2,U,1),?64,$P(STRING3,U,1)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH Q:BGPQUIT
 W !!,"# w/colon screen",?33,$P(STRING1,U,2),?38,$J($P(STRING1,U,4),5,1),?44,$P(STRING2,U,2),?49,$J($P(STRING2,U,4),5,1),?56,$J($FN(PRD,",+",1),6),?64,$P(STRING3,U,2),?68,$J($P(STRING3,U,4),5,1),?74,$J($FN(PRN,",+",1),6)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH Q:BGPQUIT
 W !,"# w/o colon screen",?33,$P(STRING1,U,3),?38,$J($P(STRING1,U,5),5,1),?44,$P(STRING2,U,3),?49,$J($P(STRING2,U,5),5,1),?56,$J($FN(PRD1,",+",1),6),?64,$P(STRING3,U,3),?68,$J($P(STRING3,U,5),5,1),?74,$J($FN(PRN1,",+",1),6)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH Q:BGPQUIT
 I $D(BGPLIST(BGPIC)) D P2
 D SUM34
 Q
0034(TF) ;Get the numbers for this measure
 N ARRAY,DEN,NUM,EXC,PC1,PC2,PC3,NNUM
 S DEN=+$G(^TMP("BGPMU0034",$J,TF,"DEN"))
 S NUM=+$G(^TMP("BGPMU0034",$J,TF,"NUM"))
 S EXC=+$G(^TMP("BGPMU0034",$J,TF,"EXC"))
 S NNUM=(DEN-NUM)-EXC
 I DEN=0 S (PC1,PC2,PC3)=0
 I DEN>0 D
 .S PC1=$$ROUND^BGPMUA01((NUM/DEN),3)*100
 .S PC2=$$ROUND^BGPMUA01((NNUM/DEN),3)*100
 .S PC3=$$ROUND^BGPMUA01((EXC/DEN),3)*100
 S ARRAY=DEN_U_NUM_U_NNUM_U_PC1_U_PC2_U_EXC_U_PC3
 Q ARRAY
P2 ;Do the Details
 N PT,NODE,NAME,VST,COLON,FOL,BGPARR,PTCT,LINE
 D HEADERL^BGPMUPH
 S X="Patients 50-74 with at least 1 encounter with the EP within the last 2 years" D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="who have never had a total colectomy, with documented colorectal cancer screening," D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="if any." D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="Patients who do not meet the numerator criteria are listed first (NM:)," D W^BGPMUPP(X,0,2,BGPPTYPE)
 S X="followed by patients who do meet the numerator criteria (M:)." D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="The following are the abbreviations used in the denominator column:" D W^BGPMUPP(X,0,2,BGPPTYPE)
 S X="EN=Encounter" D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="" D W^BGPMUPP(X,0,1,BGPPTYPE)
 S PTCT=0
 I $Y>(BGPIOSL-5) D HEADERL^BGPMUPH Q:BGPQUIT
 W !,"PATIENT NAME",?23,"HRN",?30,"COMMUNITY",?42,"SEX",?46,"AGE",?50,"DENOMINATOR",?63,"NUMERATOR"
 S LINE="",$P(LINE,"-",81)="" W !,LINE
 I BGPLIST="D"!(BGPLIST="A") D
 .K BGPARR
 .D PTLSORT^BGPMUUTL(.BGPARR,"^TMP(""BGPMU0034"","_$J_",""PAT"",""C"",""DEN"")")
 .S PT=0 F  S PT=$O(BGPARR(PT)) Q:PT=""  D
 ..S PTCT=PTCT+1
 ..S NODE=$G(BGPARR(PT))
 ..D DATA(NODE)
 I BGPLIST="N"!(BGPLIST="A") D
 .K BGPARR
 .D PTLSORT^BGPMUUTL(.BGPARR,"^TMP(""BGPMU0034"","_$J_",""PAT"",""C"",""NUM"")")
 .S PT=0 F  S PT=$O(BGPARR(PT)) Q:PT=""  D
 ..S PTCT=PTCT+1
 ..S NODE=$G(BGPARR(PT))
 ..D DATA(NODE)
 I BGPLIST="A" D
 .K BGPARR
 .D PTLSORT^BGPMUUTL(.BGPARR,"^TMP(""BGPMU0034"","_$J_",""PAT"",""C"",""EXC"")")
 .S PT=0 F  S PT=$O(BGPARR(PT)) Q:PT=""  D
 ..S PTCT=PTCT+1
 ..S NODE=$G(BGPARR(PT))
 ..D DATA(NODE)
 W !!,"Total # of patients on list: "_PTCT
 Q
 ;Print results of breast cancer screen
BREAST ;EP
 D B1
 ;I BGPMUDET="D" D B2
 K ^TMP("BGPMU0031")
 Q
B1 ;Write individual measure
 N X,Y,Z,DEN,NUM,PC,STRING1,STRING2,STRING3,PRD,PRN,PRD1,PRN1
 S STRING1=$$0031("C")
 S STRING2=$$0031("P")
 S STRING3=$$0031("B")
 S PRD=$P(STRING1,U,4)-$P(STRING2,U,4)
 S PRD1=$P(STRING1,U,5)-$P(STRING2,U,5)
 S PRN=$P(STRING1,U,4)-$P(STRING3,U,4)
 S PRN1=$P(STRING1,U,5)-$P(STRING3,U,5)
 D HEADER^BGPMUPH Q:BGPQUIT
 D HDRBLK^BGPMUPH
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH Q:BGPQUIT
 W !,"Pts 41-68",?33,$P(STRING1,U,1),?44,$P(STRING2,U,1),?64,$P(STRING3,U,1)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH Q:BGPQUIT
 W !!,"# w/mammogram",?33,$P(STRING1,U,2),?38,$J($P(STRING1,U,4),5,1),?44,$P(STRING2,U,2),?49,$J($P(STRING2,U,4),5,1),?56,$J($FN(PRD,",+",1),6),?64,$P(STRING3,U,2),?68,$J($P(STRING3,U,4),5,1),?74,$J($FN(PRN,",+",1),6)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH Q:BGPQUIT
 W !,"# w/o mammogram",?33,$P(STRING1,U,3),?38,$J($P(STRING1,U,5),5,1),?44,$P(STRING2,U,3),?49,$J($P(STRING2,U,5),5,1),?56,$J($FN(PRD1,",+",1),6),?64,$P(STRING3,U,3),?68,$J($P(STRING3,U,5),5,1),?74,$J($FN(PRN1,",+",1),6)
 I $D(BGPLIST(BGPIC)) D B2
 D SUM31
 Q
0031(TF) ;Get the numbers for this measure
 N ARRAY,DEN,NUM,ARRAY,NNUM,PC1,PC2
 S DEN=+$G(^TMP("BGPMU0031",$J,TF,"DEN"))
 S NUM=+$G(^TMP("BGPMU0031",$J,TF,"NUM"))
 S NNUM=DEN-NUM
 I DEN=0 S (PC1,PC2)=0
 I DEN>0 D
 .S PC1=$$ROUND^BGPMUA01((NUM/DEN),3)*100
 .S PC2=100-PC1
 S ARRAY=DEN_U_NUM_U_NNUM_U_PC1_U_PC2
 Q ARRAY
B2 ;Do the Details
 N PT,NODE,NAME,VST,BREAST,LINE,PTCT
 D HEADERL^BGPMUPH Q:BGPQUIT
 S X="Female patients 41-68 with at least 1 encounter with the EP within 2 years of" D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="the reporting period end date and who have never had a bilateral mastectomy" D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="or 2 unilateral mastectomies, with documented mammogram, if any." D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="Patients who do not meet the numerator criteria are listed first (NM:)," D W^BGPMUPP(X,0,2,BGPPTYPE)
 S X="followed by patients who do meet the numerator criteria (M:)." D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="The following are the abbreviations used in the denominator column:" D W^BGPMUPP(X,0,2,BGPPTYPE)
 S X="EN=Encounter" D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X=""  D W^BGPMUPP(X,0,1,BGPPTYPE)
 S PTCT=0
 I $Y>(BGPIOSL-5) D HEADERL^BGPMUPH Q:BGPQUIT
 W !,"PATIENT NAME",?23,"HRN",?30,"COMMUNITY",?42,"SEX",?46,"AGE",?50,"DENOMINATOR",?63,"NUMERATOR"
 S LINE="",$P(LINE,"-",81)="" W !,LINE
 I BGPLIST="D"!(BGPLIST="A") D
 .K BGPARR
 .D PTLSORT^BGPMUUTL(.BGPARR,"^TMP(""BGPMU0031"","_$J_",""PAT"",""C"",""NOT"")")
 .S PT=0 F  S PT=$O(BGPARR(PT)) Q:PT=""  D
 ..S PTCT=PTCT+1
 ..S NODE=$G(BGPARR(PT))
 ..D DATA(NODE)
 I BGPLIST="N"!(BGPLIST="A") D
 .K BGPARR
 .D PTLSORT^BGPMUUTL(.BGPARR,"^TMP(""BGPMU0031"","_$J_",""PAT"",""C"",""NUM"")")
 .S PT=0 F  S PT=$O(BGPARR(PT)) Q:PT=""  D
 ..S PTCT=PTCT+1
 ..S NODE=$G(BGPARR(PT))
 ..D DATA(NODE)
 W !!,"Total # of patients on list: "_PTCT
 Q
 ;
DATA(NODE) ;GET DATA
 N NAME,HRN,DEN,NUM,AGE,DFN,SEX,COMM,DEN1,DEN2,LINE
 S DFN=$P(NODE,U,1)
 S NAME=$E($$GET1^DIQ(2,$P(NODE,U,1),.01),1,22)
 S HRN=$$HRN^AUPNPAT(DFN,DUZ(2))
 S AGE=$$AGE^AUPNPAT(DFN,BGPED)
 S DEN=$P(NODE,U,4)
 S NUM=$P(NODE,U,5)
 S COMM=$E($$GET1^DIQ(9000001,DFN,1118),1,11)
 S SEX=$P(^DPT(DFN,0),U,2)
 I $Y>(BGPIOSL-2) D
 .D HEADERL^BGPMUPH Q:BGPQUIT
 .W !,"PATIENT NAME",?23,"HRN",?30,"COMMUNITY",?42,"SEX",?46,"AGE",?50,"DENOMINATOR",?63,"NUMERATOR"
 .S LINE="",$P(LINE,"-",81)="" W !,LINE
 W !,NAME,?23,HRN,?30,COMM,?42,SEX,?46,AGE,?50,"EN:"_$P($$FMTE^XLFDT(DEN,2),".",1),?63,$S(NUM="":"NM: ",1:"M:"_$P(NUM,";",1)_" "_$P($$FMTE^XLFDT($P(NUM,";",2),2),".",1))
 Q
 ;Get results of cervical cancer screen
PAP ;EP
 D C1
 ;I BGPMUDET="D" D C2
 K ^TMP("BGPMU0032")
 Q
C1 ;Write individual measure
 N X,Y,Z,DEN,NUM,PC,STRING1,STRING2,STRING3,PRD,PRN,PRN1,PRN2
 S STRING1=$$0032("C")
 S STRING2=$$0032("P")
 S STRING3=$$0032("B")
 S PRD=$P(STRING1,U,4)-$P(STRING2,U,4)
 S PRD1=$P(STRING1,U,5)-$P(STRING2,U,5)
 S PRN=$P(STRING1,U,4)-$P(STRING3,U,4)
 S PRN1=$P(STRING1,U,5)-$P(STRING3,U,5)
 D HEADER^BGPMUPH Q:BGPQUIT
 D HDRBLK^BGPMUPH
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH Q:BGPQUIT
 W !,"Pts 23-63:",?33,$P(STRING1,U,1),?44,$P(STRING2,U,1),?64,$P(STRING3,U,1)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH Q:BGPQUIT
 W !!,"# w/pap test",?33,$P(STRING1,U,2),?38,$J($P(STRING1,U,4),5,1),?44,$P(STRING2,U,2),?49,$J($P(STRING2,U,4),5,1),?56,$J($FN(PRD,",+",1),6),?64,$P(STRING3,U,2),?68,$J($P(STRING3,U,4),5,1),?74,$J($FN(PRN,",+",1),6)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH Q:BGPQUIT
 W !,"# w/o pap test",?33,$P(STRING1,U,3),?38,$J($P(STRING1,U,5),5,1),?44,$P(STRING2,U,3),?49,$J($P(STRING2,U,5),5,1),?56,$J($FN(PRD1,",+",1),6),?64,$P(STRING3,U,3),?68,$J($P(STRING3,U,5),5,1),?74,$J($FN(PRN1,",+",1),6)
 I $D(BGPLIST(BGPIC)) D C2
 D SUM32
 Q
0032(TF) ;Get the numbers for this measure
 N ARRAY,DEN,NUM,PC1,NNUM,PC2
 S DEN=+$G(^TMP("BGPMU0032",$J,TF,"DEN"))
 S NUM=+$G(^TMP("BGPMU0032",$J,TF,"NUM"))
 S NNUM=DEN-NUM
 I DEN=0 S (PC1,PC2)=0
 I DEN>0 D
 .S PC1=$$ROUND^BGPMUA01((NUM/DEN),3)*100
 .S PC2=$$ROUND^BGPMUA01((NNUM/DEN),3)*100
 S ARRAY=DEN_U_NUM_U_NNUM_U_PC1_U_PC2
 Q ARRAY
C2 ;Do the Details
 N PT,NODE,NAME,VST,CERV,LINE,PTCT
 D HEADERL^BGPMUPH
 S X="Female patients 23-63 with at least 1 encounter with the EP within the last " D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="2 years who have never had a hysterectomy, with documented pap test, if any." D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="" D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="Patients who do not meet the numerator criteria are listed first (NM:)," D W^BGPMUPP(X,0,2,BGPPTYPE)
 S X="followed by patients who do meet the numerator criteria (M:)." D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="" D W^BGPMUPP(X,0,2,BGPPTYPE)
 S X="The following are the abbreviations used in the denominator column:" D W^BGPMUPP(X,0,2,BGPPTYPE)
 S X="EN=Encounter" D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="" D W^BGPMUPP(X,0,1,BGPPTYPE)
 S PTCT=0
 I $Y>(BGPIOSL-5) D HEADERL^BGPMUPH Q:BGPQUIT
 W !,"PATIENT NAME",?23,"HRN",?30,"COMMUNITY",?42,"SEX",?46,"AGE",?50,"DENOMINATOR",?63,"NUMERATOR"
 S LINE="",$P(LINE,"-",81)="" W !,LINE
 I BGPLIST="D"!(BGPLIST="A") D
 .K BGPARR
 .D PTLSORT^BGPMUUTL(.BGPARR,"^TMP(""BGPMU0032"","_$J_",""PAT"",""C"",""DEN"")")
 .S PT=0 F  S PT=$O(BGPARR(PT)) Q:PT=""  D
 ..S PTCT=PTCT+1
 ..S NODE=$G(BGPARR(PT))
 ..D DATA(NODE)
 I BGPLIST="N"!(BGPLIST="A") D
 .K BGPARR
 .D PTLSORT^BGPMUUTL(.BGPARR,"^TMP(""BGPMU0032"","_$J_",""PAT"",""C"",""NUM"")")
 .S PT=0 F  S PT=$O(BGPARR(PT)) Q:PT=""  D
 ..S PTCT=PTCT+1
 ..S NODE=$G(BGPARR(PT))
 ..D DATA(NODE)
 W !!,"Total # of patients on list: "_PTCT
 Q
 ;
SUM31 ;Populate "BGPMU SUMMARY" for Breast Cancer Screening
 ;Initialize iCare/summary global
 N BGPDNCNT,BGPSSTR,N
 S BGPDNCNT=0
 K ^TMP("BGPMU SUMMARY",$J,BGPIC)
 S ^TMP("BGPMU SUMMARY",$J,BGPIC)="0031"_U_"112"
 S N=1 ;only 1 numerator
 ;Setup summary page/iCare ^TMP global
 S CDEN1CT=+$G(^TMP("BGPMU0031",$J,"C","DEN"))                 ;current
 S CNUM1CT=+$G(^TMP("BGPMU0031",$J,"C","NUM"))
 S CMP=$S(CDEN1CT>0:$$ROUND^BGPMUA01(CNUM1CT/CDEN1CT,3)*100,1:0)
 S PDEN1CT=+$G(^TMP("BGPMU0031",$J,"P","DEN"))                 ;previous
 S PNUM1CT=+$G(^TMP("BGPMU0031",$J,"P","NUM"))
 S PMP=$S(PDEN1CT>0:$$ROUND^BGPMUA01(PNUM1CT/PDEN1CT,3)*100,1:0)
 S BDEN1CT=+$G(^TMP("BGPMU0031",$J,"B","DEN"))                 ;baseline
 S BNUM1CT=+$G(^TMP("BGPMU0031",$J,"B","NUM"))
 S BMP=$S(BDEN1CT>0:$$ROUND^BGPMUA01(BNUM1CT/BDEN1CT,3)*100,1:0)
 S BGPDNCNT=BGPDNCNT+1
 S BGPSSTR="MU.EP.0031."_N_U_"41-68 w/mammogram"_U_""_U_CDEN1CT_U_CNUM1CT_U_CMP_U_U_U_U
 ; 11 12 13 14
 S BGPSSTR=BGPSSTR_U_""_U_PDEN1CT_U_PNUM1CT_U_PMP
 ; 15 16 17 18
 S BGPSSTR=BGPSSTR_U_""_U_BDEN1CT_U_BNUM1CT_U_BMP
 S ^TMP("BGPMU SUMMARY",$J,BGPIC,BGPDNCNT)=BGPSSTR
 Q
SUM32 ;Populate "BGPMU SUMMARY" for Cervical Cancer Screening
 ;Initialize iCare/summary global
 N BGPDNCNT,BGPSSTR,J,N
 S BGPDNCNT=0
 K ^TMP("BGPMU SUMMARY",$J,BGPIC)
 S ^TMP("BGPMU SUMMARY",$J,BGPIC)="0032"_U_"N/A"
 S N=1 ;only 1 numerator
 ;Setup summary page/iCare ^TMP global
 S CDEN1CT=+$G(^TMP("BGPMU0032",$J,"C","DEN"))                 ;current
 S CNUM1CT=+$G(^TMP("BGPMU0032",$J,"C","NUM"))
 S CMP=$S(CDEN1CT>0:$$ROUND^BGPMUA01(CNUM1CT/CDEN1CT,3)*100,1:0)
 S PDEN1CT=+$G(^TMP("BGPMU0032",$J,"P","DEN"))                 ;previous
 S PNUM1CT=+$G(^TMP("BGPMU0032",$J,"P","NUM"))
 S PMP=$S(PDEN1CT>0:$$ROUND^BGPMUA01(PNUM1CT/PDEN1CT,3)*100,1:0)
 S BDEN1CT=+$G(^TMP("BGPMU0032",$J,"B","DEN"))                 ;baseline
 S BNUM1CT=+$G(^TMP("BGPMU0032",$J,"B","NUM"))
 S BMP=$S(BDEN1CT>0:$$ROUND^BGPMUA01(BNUM1CT/BDEN1CT,3)*100,1:0)
 S BGPDNCNT=BGPDNCNT+1
 S BGPSSTR="MU.EP.0032."_N_U_"23-63 w/pap test"_U_""_U_CDEN1CT_U_CNUM1CT_U_CMP_U_U_U_U
 ; 11 12 13 14
 S BGPSSTR=BGPSSTR_U_""_U_PDEN1CT_U_PNUM1CT_U_PMP
 ; 15 16 17 18
 S BGPSSTR=BGPSSTR_U_""_U_BDEN1CT_U_BNUM1CT_U_BMP
 S ^TMP("BGPMU SUMMARY",$J,BGPIC,BGPDNCNT)=BGPSSTR
 Q
SUM34 ;Populate "BGPMU SUMMARY" for Colorectal Cancer
 ;Initialize iCare/summary global
 N BGPDNCNT,BGPSSTR,J,N
 S BGPDNCNT=0
 K ^TMP("BGPMU SUMMARY",$J,BGPIC)
 S ^TMP("BGPMU SUMMARY",$J,BGPIC)="0034"_U_"113"
 S N=1 ;only 1 numerator
 ;Setup summary page/iCare ^TMP global
 S CDEN1CT=+$G(^TMP("BGPMU0034",$J,"C","DEN"))                 ;current
 S CNUM1CT=+$G(^TMP("BGPMU0034",$J,"C","NUM"))
 S CEXC1CT=+$G(^TMP("BGPMU0034",$J,"C","EXC"))
 S CMP=$S(CDEN1CT>0:$$ROUND^BGPMUA01(CNUM1CT/CDEN1CT,3)*100,1:0)
 S PDEN1CT=+$G(^TMP("BGPMU0034",$J,"P","DEN"))                 ;previous
 S PNUM1CT=+$G(^TMP("BGPMU0034",$J,"P","NUM"))
 S PEXC1CT=+$G(^TMP("BGPMU0034",$J,"P","EXC"))
 S PMP=$S(PDEN1CT>0:$$ROUND^BGPMUA01(PNUM1CT/PDEN1CT,3)*100,1:0)
 S BDEN1CT=+$G(^TMP("BGPMU0034",$J,"B","DEN"))                 ;baseline
 S BNUM1CT=+$G(^TMP("BGPMU0034",$J,"B","NUM"))
 S BEXC1CT=+$G(^TMP("BGPMU0034",$J,"B","EXC"))
 S BMP=$S(BDEN1CT>0:$$ROUND^BGPMUA01(BNUM1CT/BDEN1CT,3)*100,1:0)
 S BGPDNCNT=BGPDNCNT+1
 S BGPSSTR="MU.EP.0034."_N_U_"50-74 w/screening"_U_CEXC1CT_U_CDEN1CT_U_CNUM1CT_U_CMP_U_U_U_U
 ; 11 12 13 14
 S BGPSSTR=BGPSSTR_U_PEXC1CT_U_PDEN1CT_U_PNUM1CT_U_PMP
 ; 15 16 17 18
 S BGPSSTR=BGPSSTR_U_BEXC1CT_U_BDEN1CT_U_BNUM1CT_U_BMP
 S ^TMP("BGPMU SUMMARY",$J,BGPIC,BGPDNCNT)=BGPSSTR
 Q
