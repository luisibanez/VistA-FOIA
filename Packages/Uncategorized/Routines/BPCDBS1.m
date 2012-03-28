BPCDBS1 ; IHS/OIT/MJL - DIABETIC CARE SUMMARY SUPPLEMENT ;
 ;;1.5;BPC;;MAY 26, 2005
 ;;2.0T4;IHS RPMS/PCC Health Summary;;MAR 24, 1997
 ;
 ;
EP ;EP - called from component
 Q:'$G(APCHSPAT)
 I $E(IOST)="C" S DIR(0)="E" D ^DIR
 I $D(DIRUT) S APCHSQIT=1 Q
 D EP2(APCHSPAT)
W ;write out array
 W:$D(IOF) @IOF
 K APCHQUIT
 S APCHX=0 F  S APCHX=$O(^TMP("APCHS",$J,"DCS",APCHX)) Q:APCHX'=+APCHX!($D(APCHQUIT))  D
 .I $Y>(IOSL-3) D HEADER Q:$D(APCHQUIT)
 .W !,^TMP("APCHS",$J,"DCS",APCHX)
 .Q
 I $D(APCHQUIT) S APCHSQIT=1
 D EOJ
 Q
 ;
EOJ ;
 K APCHX,APCHQUIT,APCHY,APCHSDFN,APCHSBEG,APCHSTOB,APCHSUPI,APCHSED,APCHTOBN,APCHTOB
 K N,%,T,F,X,Y,B,C,E,F,H,L,N,P,T,W
 Q
HEADER ;
 I $E(IOST)="C",IO=IO(0) W ! S DIR(0)="EO" D ^DIR K DIR I Y=0!(Y="^")!($D(DTOUT)) S APCHQUIT="" Q
HEAD1 ;
 W:$D(IOF) @IOF
 Q
EP2(APCHSDFN) ;EP - PASS DFN get back array of patient care summary
 ;at this point you are stuck with ^TMP("APCHS",$J,"DCS"
 K ^TMP("APCHS",$J,"DCS")
 S ^TMP("APCHS",$J,"DCS",0)=0
 D SETARRAY
 Q
SETARRAY ;set up array containing dm care summary
 ;CHECK TO SEE IF START1^APCLDF EXISTS
 S X="APCLDF" X ^%ZOSF("TEST") I '$T Q
 S X="DIABETES PATIENT CARE SUMMARY                 Report Date:  "_$$FMTE^XLFDT(DT) D S(X)
 S X="AGE:  "_$$AGE^AUPNPAT(APCHSDFN),$E(X,15)="Sex:  "_$$SEX^AUPNPAT(APCHSDFN),$E(X,31)="Date of DM Onset:  "_$$DOO(APCHSDFN) D S(X,1,"","")
 D GETHWB(APCHSDFN) S X="Last Height:  "_APCHX("HT"),$E(X,31)=APCHX("HTD"),$E(X,50)="BMI:   "_APCHX("BMI") D S(X)
 S X="Last Weight:  "_APCHX("WT"),$E(X,31)=APCHX("WTD") D S(X)
 D TOBACCO
 S X="Tobacco Use:  "_$G(APCHTOB),$E(X,50)="HTN documented (Dx):  "_$$HTN(APCHSDFN) D S(X,1)
 S B=$$BP(APCHSDFN)
 S X="Last 3 BP:  "_$P($G(APCHX(1)),U,2)_"     "_$$FMTE^XLFDT($P($G(APCHX(1)),U))
 D S(X,1)
 S X="" I $D(APCHX(2)) S X="",$E(X,13)=$P(APCHX(2),U,2)_"     "_$$FMTE^XLFDT($P(APCHX(2),U))
 D S(X)
 S X="" I $D(APCHX(3)) S X="",$E(X,13)=$P(APCHX(3),U,2)_"     "_$$FMTE^XLFDT($P(APCHX(3),U))
 D S(X)
M12 ;
 ;determine date range
 S APCHSBEG=$E(DT,1,3)-1_$E(DT,4,7)
 S X="In past 12 months:" D S(X,1)
 S X="Diabetic Foot Exam:",$E(X,27)=$$DFE(APCHSDFN,APCHSBEG) D S(X)
 S X="Diabetic Eye Exam:",$E(X,27)=$$EYE(APCHSDFN,APCHSBEG) D S(X)
 S X="Dental Exam:",$E(X,27)=$$DENTAL(APCHSDFN,APCHSBEG) D S(X)
 S X="Rectal Exam (age>40):",$E(X,27)=$$RECTAL(APCHSDFN,APCHSBEG) D S(X)
 S X="   (Females Only)"  D S(X)
 S X="   Pap Smear:",$E(X,27)=$$PAP(APCHSDFN,APCHSBEG) D S(X)
 S X="   Breast exam:",$E(X,27)=$$BREAST(APCHSDFN,APCHSBEG) D S(X)
 S X="   Last Mammogram:",$E(X,27)=$$MAMMOG(APCHSDFN) D S(X)
 ;D MORE^APCHS9B2
 S X=$P(^DPT(APCHSDFN,0),U),$E(X,35)="DOB: "_$$DOB^AUPNPAT(APCHSDFN,"S"),$E(X,55)="Chart #"_$$HRN^AUPNPAT(APCHSDFN,DUZ(2),2) D S(X,3)
 S X="" D S(X,1)
 Q
S(Y,F,C,T) ;set up array
 I '$G(F) S F=0
 I '$G(T) S T=0
 ;blank lines
 F F=1:1:F S X="" D S1
 S X=Y
 I $G(C) S L=$L(Y),T=(80-L)/2 D  D S1 Q
 .F %=1:1:(T-1) S X=" "_X
 F %=1:1:T S X=" "_Y
 D S1
 Q
S1 ;
 S %=$P(^TMP("APCHS",$J,"DCS",0),U)+1,$P(^TMP("APCHS",$J,"DCS",0),U)=%
 S ^TMP("APCHS",$J,"DCS",%)=X
 Q
HTN(P) ;
 NEW APCHX,X
 S APCHX=""
 S X=P_"^DX [SURVEILLANCE HYPERTENSION" S E=$$START1^APCLDF(X,"APCHX(") I $D(APCHX(1)) S APCHX="Yes"
 I $G(APCHX)="" S APCHX="No"
 Q APCHX
BP(P) ;last 3 BPs
 K APCHX
 S APCHX=""
 S X=P_"^LAST 3 MEASUREMENTS BP" S E=$$START1^APCLDF(X,"APCHX(")
 I '$D(APCHX) S APCHX(1)="None recorded"
 Q APCHX
DOO(P) ;get first dm dx from case management
 NEW APCHX,X
 S APCHX=""
 S X=P_"^PROBLEM [DM AUDIT PROBLEM DIABETES DX" S E=$$START1^APCLDF(X,"APCHX(") I $D(APCHX(1)) S APCHX=$P(^AUPNPROB(+$P(APCHX(1),U,4),0),U,13)
 I APCHX]"" S APCHX=$$FMTE^XLFDT(APCHX)
 Q APCHX
GETHWB(P)  ;get last height, height date, weight, weight date and BMI for patient P, return in APCHX("HT"),APCHX("HTD"),APCHX("WT"),APCHX("WTD"),APCHX("BMI")
 K APCHX
 S APCHX("HT")="",APCHX("HTD")="",APCHX("WT")="",APCHX("WTD")="",APCHX("BMI")=""
LASTHT ;
 Q:'$D(^AUPNVSIT("AC",P))
 Q:'$D(^AUPNVMSR("AC",P))
 NEW APCHY
 S %=P_"^LAST MEAS HT" NEW X S E=$$START1^APCLDF(%,"APCHY(") S APCHX("HT")=$P($G(APCHY(1)),U,2),APCHX("HTD")=$$FMTE^XLFDT($P($G(APCHY(1)),U))
 S APCHX("HT")=$J(APCHX("HT"),2,0)
LASTWT ;
 K APCHY S %=P_"^LAST MEAS WT" NEW X S E=$$START1^APCLDF(%,"APCHY(") S APCHX("WT")=$P($G(APCHY(1)),U,2),APCHX("WTD")=$$FMTE^XLFDT($P($G(APCHY(1)),U))
BMI ;
 I APCHX("WT")=""!('APCHX("HT")) Q
 S %=""
 S W=(APCHX("WT")/5)*2.3,H=(APCHX("HT")*2.5),H=(H*H)/10000,%=(W/H),%=$J(%,4,1)
 S APCHX("BMI")=%
 Q
TOBACCO ;EP
 K APCHTOB
 D TOBACCO3
 I $D(APCHTOB) Q
 D TOBACCO0
 I $D(APCHTOB) Q
 D TOBACCO1 ;check Problem file for tobacco use
 I $D(APCHTOB) Q
 D TOBACCO2 ;check POVs for tobacco use
 I $D(APCHTOB) Q
 S APCHTOB="UNDOCUMENTED",APCHTOB="UNDOCUMENTED"
 Q
TOBACCO0 ;check for tobacco documented in health factors
 K APCH S APCHX=APCHSDFN_"^LAST HEALTH [DM AUDIT TOBACCO HLTH FACTORS" S E=$$START1^APCLDF(APCHX,"APCH(") Q:E  I $D(APCH(1)) D  S APCHTOBN=$O(APCHTOB("")),APCHTOB=APCHTOB(APCHTOBN)
 . I $P(APCH(1),U,3)["NON" S APCHTOB="NO, DOES NOT USE TOBACCO" Q
 . I $P(APCH(1),U,3)["PREVIOUS" S APCHTOB="PAST USE OF TOBACCO" Q
 . S APCHTOB="YES, USES TOBACCO"
 .Q
 Q
TOBACCO3 ;lookup in health status
 S %=$O(^ATXAX("B","DM AUDIT TOBACCO HLTH FACTORS",0))
 Q:'%
 S (X,Y)=0 F  S X=$O(^AUPNHF("AA",APCHSDFN,X)) Q:X'=+X!(Y)  I $D(^ATXAX(%,21,"B",X)) S Y=X
 Q:'Y
 S Y=$P(^AUTTHF(Y,0),U)
 S APCHTOB=Y
 I Y["NON" S APCHTOB="NO, DOES NOT USE TOBACCO" Q
 I Y["PREVIOUS" S APCHTOB="PAST USE OF TOBACCO" Q
 S APCHTOB="YES, USES TOBACCO"
 Q
TOBACCO1 ;check problem file for tobacco use
 K APCH S APCHX=APCHSDFN_"^PROBLEMS [DM AUDIT PROBLEM SMOKING DXS" S E=$$START1^APCLDF(APCHX,"APCH(") Q:E  I $D(APCH(1)) D  S APCHTOBN=$O(APCHTOB("")),APCHTOB=APCHTOB(APCHTOBN)
 . I $P(^ICD9($P(APCH(1),U,2),0),U,1)=305.13 S APCHTOB="PAST USE OF TOBACCO"_" - "_$E($P(^AUTNPOV($P(^AUPNPROB(+$P(APCH(1),U,4),0),U,5),0),U),1,30) Q
 . S APCHTOB="YES, USES TOBACCO - "_$E($P(^AUTNPOV($P(^AUPNPROB(+$P(APCH(1),U,4),0),U,5),0),U),1,30)
 .Q
 Q
TOBACCO2 ;check pov file for TOBACCO USE DOC
 K APCH S APCHX=APCHSDFN_"^LAST DX [DM AUDIT SMOKING RELATED DXS" S E=$$START1^APCLDF(APCHX,"APCH(") Q:E  I $D(APCH(1)) D  S APCHTOBN=$O(APCHTOB("")),APCHTOB=APCHTOB(APCHTOBN)
 . I $P(APCH(1),U,2)=305.13 S APCHTOB="PAST USE OF TOBACCO"_" - "_$E($P(^AUTNPOV($P(^AUPNVPOV(+$P(APCH(1),U,4),0),U,4),0),U),1,30) Q
 . S APCHTOB="YES, USES TOBACCO"_" - "_$E($P(^AUTNPOV($P(^AUPNVPOV(+$P(APCH(1),U,4),0),U,4),0),U),1,30)
 .Q
 Q
 ;
 ;;3.0;IHS PCC REPORTS;;FEB 05, 1997
DFE(P,APCHSED) ;
 NEW APCHY S %=P_"^LAST EXAM DIABETIC FOOT EXAM",E=$$START1^APCLDF(%,"APCHY(")
 I '$D(APCHY) Q "No    <never recorded>"
 I $P(APCHY(1),U)'<APCHSED S APCHX="Yes   "_$$FMTE^XLFDT($P(APCHY(1),U))
 Q "No    "_$$FMTE^XLFDT($P(APCHY(1),U))
EYE(P,APCHSED) ;
 NEW APCHY S %=P_"^LAST EXAM DIABETIC EYE EXAM",E=$$START1^APCLDF(%,"APCHY(")
 I '$D(APCHY) Q "No    <never recorded>"
 I $P(APCHY(1),U)'<APCHSED S APCHX="Yes   "_$$FMTE^XLFDT($P(APCHY(1),U))
 Q "No    "_$$FMTE^XLFDT($P(APCHY(1),U))
DENTAL(P,APCHSED) ;
 NEW APCHY S %=P_"^LAST ADA [DM AUDIT DENTAL EXAM ADA CODES",E=$$START1^APCLDF(%,"APCHX(")
 I E Q "Unable to determine - DM Audit Taxonomy missing"
 I '$D(APCHY) Q "No    <never recorded>"
 I $P(APCHY(1),U)'<APCHSED S APCHX="Yes  "_$$FMTE^XLFDT($P(APCHY(1),U))
 Q "No   "_$$FMTE^XLFDT($P(APCHY(1),U))
RECTAL(P,APCHSED) ;
 I $$AGE^AUPNPAT(P)<41 Q "N/A"
 NEW APCHY S %=P_"^LAST EXAM RECTAL",E=$$START1^APCLDF(%,"APCHY(")
 I '$D(APCHY) Q "No    <never recorded>"
 I $P(APCHY(1),U)'<APCHSED S APCHX="Yes   "_$$FMTE^XLFDT($P(APCHY(1),U))
 Q "No    "_$$FMTE^XLFDT($P(APCHY(1),U))
PAP(P,APCHSED) ;
 I $$SEX^AUPNPAT(P)'="F" Q "N/A"
 NEW APCHY S %=P_"^LAST LAB PAP SMEAR",E=$$START1^APCLDF(%,"APCHY(")
 I '$D(APCHY) Q "No    <never recorded>"
 I $P(APCHY(1),U)'<APCHSED S APCHX="Yes   "_$$FMTE^XLFDT($P(APCHY(1),U))
 Q "No    "_$$FMTE^XLFDT($P(APCHY(1),U))
BREAST(P,APCHSED) ;
 I $$SEX^AUPNPAT(P)'="F" Q "N/A"
 NEW APCHY S %=P_"^LAST EXAM BREAST",E=$$START1^APCLDF(%,"APCHY(")
 I '$D(APCHY) Q "No    <never recorded>"
 I $P(APCHY(1),U)'<APCHSED S APCHX="Yes   "_$$FMTE^XLFDT($P(APCHY(1),U))
 Q "No    "_$$FMTE^XLFDT($P(APCHY(1),U))
MAMMOG(P) ;
 I $$SEX^AUPNPAT(P)'="F" Q "N/A"
 ;NEW APCHY S %=P_"^LAST RAD MAMMOGRAM BILAT",E=$$START1^APCLDF(%,"APCHY(")
 ;I '$D(APCHY) S %=P_"^LAST RAD SCREENING MAMMOGRAM",E=$$START1^APCLDF(%,"APCHY(")
 ;I '$D(APCHY) Q "No    <never recorded>"
 I '$D(^AUPNVRAD("AC",P)) Q "No    <never recorded>"
 S BPCRIEN="",APCHY(1)="" F  S BPCRIEN=$O(^AUPNVRAD("AC",P,BPCRIEN)) Q:BPCRIEN=""  D
 .S BPCRP=$P(^AUPNVRAD(BPCRIEN,0),U,1)
 .S BPCPROC=$P(^RAMIS(71,BPCRP,0),U,1)
 .I BPCPROC["MAMMOGRAM" S APCHY(1)=$P($P(^AUPNVRAD(BPCRIEN,0),U,3),".",1)
 I APCHY(1)="" Q "No    <never recorded>"
 Q "      "_$$FMTE^XLFDT($P(APCHY(1),U))
