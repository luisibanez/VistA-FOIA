BGPMUAP1 ; IHS/MSC/MGH - MU EP  measures NQF0421 and NQF0013 ;22-Mar-2011 10:06;DU
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 ;This rouine does the printed output of these 2 EP measures
BMI ;EP
 D P1
 ;I BGPMUDET="D" D
 ;.D P2
 K ^TMP("BGPMU0421")
 Q
P1 ;Write individual measure
 N X,Y,Z,LIST1,LIST2,LIST3
 N DEN1,NUM1,DEN2,NUM2,PC1,PC2,EXC1,EXC2,STRING1,STRING2,STRING3,SUMCT
 N PRD1,PRD2,PRD3,PRD4,PRD5,PRD6,PRN1,PRN2,PRN3,PRN4,PRN5,PRN6,PRD7,PRD8,PRN7,PRN8
 S SUMCT=0
 S STRING1=$$421("C")
 S STRING2=$$421("P")
 S STRING3=$$421("B")
 D SUMMARY1(STRING1,STRING2,STRING3)
 ;First population
 S PRD1=$P(STRING1,U,5)-$P(STRING2,U,5)
 S PRD2=$P(STRING1,U,6)-$P(STRING2,U,6)
 S PRD3=$P(STRING1,U,7)-$P(STRING2,U,7)
 S PRD7=$P(STRING1,U,16)-$P(STRING2,U,16)
 S PRN1=$P(STRING1,U,5)-$P(STRING3,U,5)
 S PRN2=$P(STRING1,U,6)-$P(STRING3,U,6)
 S PRN3=$P(STRING1,U,7)-$P(STRING3,U,7)
 S PRN7=$P(STRING1,U,16)-$P(STRING3,U,16)
 ;second population
 S PRD4=$P(STRING1,U,12)-$P(STRING2,U,12)
 S PRD5=$P(STRING1,U,13)-$P(STRING2,U,13)
 S PRD6=$P(STRING1,U,14)-$P(STRING2,U,14)
 S PRD8=$P(STRING1,U,18)-$P(STRING2,U,18)
 S PRN4=$P(STRING1,U,12)-$P(STRING3,U,12)
 S PRN5=$P(STRING1,U,13)-$P(STRING3,U,13)
 S PRN6=$P(STRING1,U,14)-$P(STRING3,U,14)
 S PRN8=$P(STRING1,U,18)-$P(STRING3,U,18)
 D HEADER^BGPMUPH Q:BGPQUIT
 D HDRBLK^BGPMUPH
 ;W !,"Patients with visit and wt >65yrs of age"
 W !,"Denominator 1"
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH,HDRBLK^BGPMUPH Q:BGPQUIT
 W !,"Pts 65+",?33,$P(STRING1,U,1),?44,($P(STRING2,U,1)+$P(STRING2,U,4)),?64,$P(STRING3,U,1)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH,HDRBLK^BGPMUPH Q:BGPQUIT
 W !,"# Excluded (Exc)",?33,$P(STRING1,U,4),?44,$P(STRING2,U,4),?64,$P(STRING3,U,4)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH,HDRBLK^BGPMUPH Q:BGPQUIT
 W !,"Pts 65+ less Exc",?33,$P(STRING1,U,3),?44,$P(STRING2,U,3),?64,$P(STRING3,U,3)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH,HDRBLK^BGPMUPH Q:BGPQUIT
 W !!,"# w/BMI + plan if req",?33,$P(STRING1,U,2),?38,$J($P(STRING1,U,5),5,1),?44,$P(STRING2,U,2),?49,$J($P(STRING2,U,5),5,1),?56,$J($FN(PRD1,",+",1),6),?64,$P(STRING3,U,2),?68,$J($P(STRING3,U,5),5,1),?74,$J($FN(PRN1,",+",1),6)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH,HDRBLK^BGPMUPH Q:BGPQUIT
 W !,"# w/o BMI or no plan if req",?33,$P(STRING1,U,15),?38,$J($P(STRING1,U,16),5,1),?44,$P(STRING2,U,15),?49,$J($P(STRING2,U,16),5,1),?56,$J($FN(PRD7,",+",1),6),?64,$P(STRING3,U,15),?68,$J($P(STRING3,U,16),5,1),?74,$J($FN(PRN7,",+",1),6)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH,HDRBLK^BGPMUPH Q:BGPQUIT
 ;
 W !!,"Denominator 2"
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH,HDRBLK^BGPMUPH Q:BGPQUIT
 W !,"Pts 18-64",?33,$P(STRING1,U,8),?44,$P(STRING2,U,8),?64,$P(STRING3,U,8)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH,HDRBLK^BGPMUPH Q:BGPQUIT
 W !,"# Excluded (Exc)",?33,$P(STRING1,U,11),?44,$P(STRING2,U,11),?64,$P(STRING3,U,11)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH,HDRBLK^BGPMUPH Q:BGPQUIT
 W !,"Pts 18-64 less Exc",?33,$P(STRING1,U,10),?44,$P(STRING2,U,10),?64,$P(STRING3,U,10)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH,HDRBLK^BGPMUPH Q:BGPQUIT
 W !!,"# w/BMI + plan if req",?33,$P(STRING1,U,9),?38,$J($P(STRING1,U,12),5,1),?44,$P(STRING2,U,9),?49,$J($P(STRING2,U,12),5,1),?56,$J($FN(PRD4,",+",1),6),?64,$P(STRING3,U,9),?68,$J($P(STRING3,U,12),5,1),?74,$J($FN(PRN4,",+",1),6)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH,HDRBLK^BGPMUPH Q:BGPQUIT
 W !,"# w/o BMI or no plan if req",?33,$P(STRING1,U,17),?38,$J($P(STRING1,U,18),5,1),?44,$P(STRING2,U,17),?49,$J($P(STRING2,U,18),5,1),?56,$J($FN(PRD8,",+",1),6),?64,$P(STRING3,U,17),?68,$J($P(STRING3,U,18),5,1),?74,$J($FN(PRN8,",+",1),6)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH,HDRBLK^BGPMUPH Q:BGPQUIT
 I $D(BGPLIST(BGPIC)) D P2
 Q
421(TF) ;Get the numbers for this measure
 N ARRAY,DEN1,NUM1,EXC1,DEN2,NUM2,EXC2,NOT1,NOT2,PC1,PC11,PC2,PC21,PC13,PC23,NNUM1,NNUM2,PC14,PC24
 S DEN1=+$G(^TMP("BGPMU0421",$J,TF,"DEN",1))
 S NUM1=+$G(^TMP("BGPMU0421",$J,TF,"NUM",1))
 S NOT1=+$G(^TMP("BGPMU0421",$J,TF,"NOT",1))
 S EXC1=+$G(^TMP("BGPMU0421",$J,TF,"EXC",1))
 S DEN2=+$G(^TMP("BGPMU0421",$J,TF,"DEN",2))
 S NUM2=+$G(^TMP("BGPMU0421",$J,TF,"NUM",2))
 S NOT2=+$G(^TMP("BGPMU0421",$J,TF,"NOT",2))
 S EXC2=+$G(^TMP("BGPMU0421",$J,TF,"EXC",2))
 S NNUM1=DEN1-EXC1
 S NNUM2=DEN2-EXC2
 I DEN1=0 S (PC1,PC11,PC13,PC14)=0
 I DEN1>0 D
 .S PC1=$$ROUND^BGPMUA01((NUM1/NNUM1),3)*100
 .S PC11=$$ROUND^BGPMUA01((NNUM1/DEN1),3)*100
 .S PC13=$$ROUND^BGPMUA01((EXC1/DEN1),3)*100
 .S PC14=$$ROUND^BGPMUA01((NOT1/NNUM1),3)*100
 I DEN2=0 S (PC2,PC21,PC23,PC24)=0
 I DEN2>0 D
 .S PC2=$$ROUND^BGPMUA01((NUM2/NNUM2),3)*100
 .S PC21=$$ROUND^BGPMUA01((NNUM2/DEN2),3)*100
 .S PC23=$$ROUND^BGPMUA01((EXC2/DEN2),3)*100
 .S PC24=$$ROUND^BGPMUA01((NOT2/NNUM2),3)*100
 S ARRAY=DEN1_U_NUM1_U_NNUM1_U_EXC1_U_PC1_U_PC11_U_PC13_U_DEN2_U_NUM2_U_NNUM2_U_EXC2_U_PC2_U_PC21_U_PC23
 S ARRAY=ARRAY_U_NOT1_U_PC14_U_NOT2_U_PC24
 Q ARRAY
P2 ;Do the Details
 N PT,NODE,NAME,VST,BMI,FOL,X,PTCT,BGPARR,LINE
 S PTCT=0
 D HEADERL^BGPMUPH
 S X="Patients 18+ with at least 1 encounter with the EP during the reporting period," D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="with documented BMI and follow-up, if any." D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="Patients who do not meet the numerator criteria are listed first (NM:), followed" D W^BGPMUPP(X,0,2,BGPPTYPE)
 S X="by patients who do meet the numerator criteria (M:)." D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="The following are the abbreviations used in the denominator column:" D W^BGPMUPP(X,0,2,BGPPTYPE)
 S X="EN=Encounter" D W^BGPMUPP(X,0,1,BGPPTYPE)
 W !!
 I $Y>(BGPIOSL-5) D HEADERL^BGPMUPH Q:BGPQUIT
 W "Patients 65+"
 W !!,"PATIENT NAME",?23,"HRN",?30,"COMMUNITY",?42,"SEX",?46,"AGE",?50,"DENOMINATOR",?63,"NUMERATOR"
 S LINE="",$P(LINE,"-",81)="" W !,LINE
 I BGPLIST="D"!(BGPLIST="A") D
 .K BGPARR
 .D PTLSORT^BGPMUUTL(.BGPARR,"^TMP(""BGPMU0421"","_$J_",""PAT"",""C"",1,""NOT"")")
 .S PT=0 F  S PT=$O(BGPARR(PT)) Q:PT=""  D
 ..S PTCT=PTCT+1
 ..S NODE=$G(BGPARR(PT))
 ..D DATA(NODE)
 I BGPLIST="N"!(BGPLIST="A") D
 .K BGPARR
 .D PTLSORT^BGPMUUTL(.BGPARR,"^TMP(""BGPMU0421"","_$J_",""PAT"",""C"",1,""NUM"")")
 .S PT=0 F  S PT=$O(BGPARR(PT)) Q:PT=""  D
 ..S PTCT=PTCT+1
 ..S NODE=$G(BGPARR(PT))
 ..D DATA(NODE)
 I BGPLIST="A" D
 .K BGPARR
 .D PTLSORT^BGPMUUTL(.BGPARR,"^TMP(""BGPMU0421"","_$J_",""PAT"",""C"",1,""EXC"")")
 .S PT=0 F  S PT=$O(BGPARR(PT)) Q:PT=""  D
 ..S PTCT=PTCT+1
 ..S NODE=$G(BGPARR(PT))
 ..D DATA(NODE)
 W !!,"Total # of patients on list: "_PTCT
 I $Y>(BGPIOSL-7) D HEADERL^BGPMUPH Q:BGPQUIT
 S PTCT=0
 W !!,"Patients 18-64"
 W !!,"PATIENT NAME",?23,"HRN",?30,"COMMUNITY",?42,"SEX",?46,"AGE",?50,"DENOMINATOR",?63,"NUMERATOR"
 S LINE="",$P(LINE,"-",81)="" W !,LINE
 I BGPLIST="D"!(BGPLIST="A") D
 .K BGPARR
 .D PTLSORT^BGPMUUTL(.BGPARR,"^TMP(""BGPMU0421"","_$J_",""PAT"",""C"",2,""NOT"")")
 .S PT=0 F  S PT=$O(BGPARR(PT)) Q:PT=""  D
 ..S PTCT=PTCT+1
 ..S NODE=$G(BGPARR(PT))
 ..D DATA(NODE)
 I BGPLIST="N"!(BGPLIST="A") D
 .K BGPARR
 .D PTLSORT^BGPMUUTL(.BGPARR,"^TMP(""BGPMU0421"","_$J_",""PAT"",""C"",2,""NUM"")")
 .S PT=0 F  S PT=$O(BGPARR(PT)) Q:PT=""  D
 ..S PTCT=PTCT+1
 ..S NODE=$G(BGPARR(PT))
 ..D DATA(NODE)
 I BGPLIST="A" D
 .K BGPARR
 .D PTLSORT^BGPMUUTL(.BGPARR,"^TMP(""BGPMU0421"","_$J_",""PAT"",""C"",2,""EXC"")")
 .S PT=0 F  S PT=$O(BGPARR(PT)) Q:PT=""  D
 ..S PTCT=PTCT+1
 ..S NODE=$G(BGPARR(PT))
 ..D DATA(NODE)
 W !!,"Total # of patients on list: "_PTCT
 Q
DATA(NODE) ;GET DATA
 N NAME,HRN,DEN,NUM,AGE,DFN,SEX,COMM,NUM1,NUM2,DEN1,DEN2,LINE
 S DFN=$P(NODE,U,1)
 S NAME=$E($$GET1^DIQ(2,$P(NODE,U,1),.01),1,22)
 S HRN=$$HRN^AUPNPAT(DFN,DUZ(2))
 S AGE=$$AGE^AUPNPAT(DFN,BGPED)
 S DEN=$P(NODE,U,2),NUM=$P(NODE,U,4)
 S COMM=$E($$GET1^DIQ(9000001,DFN,1118),1,11)
 S SEX=$P(^DPT(DFN,0),U,2)
 I $Y>(BGPIOSL-2) D
 .D HEADERL^BGPMUPH Q:BGPQUIT
 .W !,"PATIENT NAME",?23,"HRN",?30,"COMMUNITY",?42,"SEX",?46,"AGE",?50,"DENOMINATOR",?63,"NUMERATOR"
 .S LINE="",$P(LINE,"-",81)="" W !,LINE
 S NUM2=""
 S NUM1=$P(NUM,";",1),NUM2=$P(NUM,";",2)
 W !,NAME,?23,HRN,?30,COMM,?43,SEX,?46,AGE,?50,DEN,?63,NUM1
 I NUM2'="" D
 .W !,?65,NUM2
 Q
DATA2(NODE) ;GET DATA
 N NAME,HRN,DEN,SEX,COMM,DEN1,DEN2,DEN3,NUM1,NUM2,LINE
 S DFN=$P(NODE,U,1)
 S NAME=$E($$GET1^DIQ(2,$P(NODE,U,1),.01),1,18)
 S HRN=$$HRN^AUPNPAT(DFN,DUZ(2))
 S AGE=$$AGE^AUPNPAT(DFN,BGPED)
 S SEX=$P(^DPT(DFN,0),U,2)
 S COMM=$E($$GET1^DIQ(9000001,DFN,1118),1,11)
 S DEN=$P(NODE,U,2)
 S DEN1=$P(DEN,";",1),DEN2=$P(DEN,";",2),DEN3=$P(DEN,";",3)
 S NUM=$P(NODE,U,3)
 S NUM1=$P(NUM,";",1),NUM2=$P(NUM,";",2)
 I $Y>(BGPIOSL-2) D
 .D HEADERL^BGPMUPH Q:BGPQUIT
 .W !,"PATIENT NAME",?20,"HRN",?26,"COMMUNITY",?37,"SEX",?42,"AGE",?46,"DENOMINATOR",?59,"NUMERATOR"
 .S LINE="",$P(LINE,"-",81)="" W !,LINE
 W !,NAME,?20,HRN,?26,COMM,?38,SEX,?42,AGE,?46,DEN1
 I NUM1'="" W !,?46,DEN2,?59,NUM1
 I NUM1=""&(DEN2'="")  W !,?46,DEN2
 I NUM2'="" W !,?46,DEN3,?59,NUM2
 I NUM2=""&(DEN3'="") W !,?46,DEN3
 Q
 ;Get printout for BP measure
BLOODP ;EP
 D BP1
 ;I BGPMUDET="D" D BP2
 K ^TMP("BGPMU0013")
 Q
BP1 ;Write individual measure
 N X,Y,Z,DEN,NUM,PC,STRING1,STRING2,PRD,PRN,PRN1,PRD1
 S STRING1=$$0013("C")
 S STRING2=$$0013("P")
 S STRING3=$$0013("B")
 D SUMMARY2(STRING1,STRING2,STRING3)
 S PRD=$P(STRING1,U,4)-$P(STRING2,U,4)
 S PRD1=$P(STRING1,U,5)-$P(STRING2,U,5)
 S PRN=$P(STRING1,U,4)-$P(STRING3,U,4)
 S PRN1=$P(STRING1,U,5)-$P(STRING3,U,5)
 D HEADER^BGPMUPH Q:BGPQUIT
 D HDRBLK^BGPMUPH
 W !,"Pts 18+ w/HTN",?33,$P(STRING1,U,1),?44,$P(STRING2,U,1),?64,$P(STRING3,U,1)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH,HDRBLK^BGPMUPH Q:BGPQUIT
 W !!,"# w/=>2 BP recorded",?33,$P(STRING1,U,2),?38,$J($P(STRING1,U,4),5,1),?44,$P(STRING2,U,2),?49,$J($P(STRING2,U,4),5,1),?56,$J($FN(PRD,",+",1),6),?64,$P(STRING3,U,2),?68,$J($P(STRING3,U,4),5,1),?74,$J($FN(PRN,",+",1),6)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH,HDRBLK^BGPMUPH Q:BGPQUIT
 W !,"# w/o=> 2 BP recorded",?33,$P(STRING1,U,3),?38,$J($P(STRING1,U,5),5,1),?44,$P(STRING2,U,3),?49,$J($P(STRING2,U,5),5,1),?56,$J($FN(PRD1,",+",1),6),?64,$P(STRING3,U,3),?68,$J($P(STRING3,U,5),5,1),?74,$J($FN(PRN1,",+",1),6)
 I $Y>(BGPIOSL-3) D HEADER^BGPMUPH,HDRBLK^BGPMUPH Q:BGPQUIT
 I $D(BGPLIST(BGPIC)) D BP2
 Q
0013(TF) ;Get the numbers for this measure
 N ARRAY,DEN,NUM,PC1,PC2,NOT
 S DEN=+$G(^TMP("BGPMU0013",$J,TF,"DEN"))
 S NUM=+$G(^TMP("BGPMU0013",$J,TF,"NUM"))
 S NOT=+$G(^TMP("BGPMU0013",$J,TF,"NOT"))
 I DEN=0 S (PC1,PC2)=0
 I DEN>0 D
 .S PC1=$$ROUND^BGPMUA01((NUM/DEN),3)*100
 .S PC2=100-PC1
 S ARRAY=DEN_U_NUM_U_NOT_U_PC1_U_PC2
 Q ARRAY
BP2 ;Do the Details
 N PT,NODE,NAME,BP,PTCT,BGPARR,LINE
 D HEADERL^BGPMUPH
 S X="Hypertensive patients 18+ with at least 2 encounters with the EP during the" D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="reporting period, with 2 documented BPs during the encounters, if any." D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="Patients who do not meet the numerator criteria are listed first (NM:)," D W^BGPMUPP(X,0,2,BGPPTYPE)
 S X="followed by patients who do meet the numerator criteria (M:)." D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="The following are the abbreviations used in the denominator column:" D W^BGPMUPP(X,0,2,BGPPTYPE)
 S X="ICD-9 Code=Hypertension Diagnosis" D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X="EN=Encounter" D W^BGPMUPP(X,0,1,BGPPTYPE)
 S X=""  D W^BGPMUPP(X,0,1,BGPPTYPE)
 S PTCT=0
 I $Y>(BGPIOSL-5) D HEADERL^BGPMUPH Q:BGPQUIT
 W !,"PATIENT NAME",?20,"HRN",?26,"COMMUNITY",?37,"SEX",?42,"AGE",?46,"DENOMINATOR",?59,"NUMERATOR"
 S LINE="",$P(LINE,"-",81)="" W !,LINE
 I BGPLIST="D"!(BGPLIST="A") D
 .K BGPARR
 .D PTLSORT^BGPMUUTL(.BGPARR,"^TMP(""BGPMU0013"","_$J_",""PAT"",""C"",""NOT"")")
 .S PT=0 F  S PT=$O(BGPARR(PT)) Q:PT=""  D
 ..S PTCT=PTCT+1
 ..S NODE=$G(BGPARR(PT))
 ..D DATA2(NODE)
 I BGPLIST="N"!(BGPLIST="A") D
 .K BGPARR
 .D PTLSORT^BGPMUUTL(.BGPARR,"^TMP(""BGPMU0013"","_$J_",""PAT"",""C"",""NUM"")")
 .S PT=0 F  S PT=$O(BGPARR(PT)) Q:PT=""  D
 ..S PTCT=PTCT+1
 ..S NODE=$G(BGPARR(PT))
 ..D DATA2(NODE)
 W !!,"Total # of patients on list: "_PTCT
 Q
SUMMARY1(STRING1,STRING2,STRING3,CT) ;Summmary setup
 N DESC,DESC2,LINE
 K ^TMP("BGPMU SUMMARY",$J,BGPIC)
 S ^TMP("BGPMU SUMMARY",$J,BGPIC)="0421^128"
 S DESC="65+ w/BMI+Plan if req"
 S DESC2="18-64 w/BMI+Plan if req"
 S LINE=""
 S LINE="MU.EP.0421.1"_U_DESC_U_$P(STRING1,U,4)_U_$P(STRING1,U,3)_U_$P(STRING1,U,2)_U_$P(STRING1,U,5)_U_U_U_U_U
 S LINE=LINE_$P(STRING2,U,4)_U_$P(STRING2,U,3)_U_$P(STRING2,U,2)_U_$P(STRING2,U,5)_U_$P(STRING3,U,4)_U_$P(STRING3,U,3)_U_$P(STRING3,U,2)_U_$P(STRING3,U,5)
 S ^TMP("BGPMU SUMMARY",$J,BGPIC,1)=LINE
 S LINE=""
 S LINE="MU.EP.0421.2"_U_DESC2_U_$P(STRING1,U,11)_U_$P(STRING1,U,10)_U_$P(STRING1,U,9)_U_$P(STRING1,U,12)_U_U_U_U_U
 S LINE=LINE_$P(STRING2,U,11)_U_$P(STRING2,U,10)_U_$P(STRING2,U,9)_U_$P(STRING2,U,12)_U_$P(STRING3,U,11)_U_$P(STRING3,U,10)_U_$P(STRING3,U,9)_U_$P(STRING3,U,12)
 S ^TMP("BGPMU SUMMARY",$J,BGPIC,2)=LINE
 Q
SUMMARY2(STRING1,STRING2,STRING3) ;Summary setup
 N DESC
 K ^TMP("BGPMU SUMMARY",$J,BGPIC)
 S ^TMP("BGPMU SUMMARY",$J,BGPIC)="0013^237"
 S DESC="18+ w/2 BP Recorded"
 S LINE="MU.EP.0013.1"_U_DESC_U_U_$P(STRING1,U,1)_U_$P(STRING1,U,2)_U_$P(STRING1,U,4)_U_U_U_U_U
 S LINE=LINE_U_$P(STRING2,U,1)_U_$P(STRING2,U,2)_U_$P(STRING2,U,4)_U_U_$P(STRING3,U,1)_U_$P(STRING3,U,2)_U_$P(STRING3,U,4)
 S ^TMP("BGPMU SUMMARY",$J,BGPIC,1)=LINE
 Q
DATE(D) ;EP
 I D="" Q ""
 Q $E(D,4,5)_"/"_$E(D,6,7)_"/"_$E(D,2,3)
