APCPHOSP ; IHS/TUCSON/LAB - VISIT REVIEW - HOSPITALIZATIONS AUGUST 14, 1992 ; [ 04/03/98  08:39 AM ]
 ;;2.0;IHS PCC DATA EXTRACTION SYSTEM;;APR 03, 1998
CHKHOSP ;
 Q:"C"[$P(APCPV("V REC"),U,3)
 I '$D(^AUPNVINP("AD",APCP("V DFN"))) S APCPE("ERROR")="E302" G XIT
 S APCPH("VINP PTR")=$O(^AUPNVINP("AD",APCP("V DFN"),""))
 I $P(^AUPNVINP(APCPH("VINP PTR"),0),U,15) S APCPE("ERROR")="E337" G XIT
 D GETACC^APCPHOS2
 D GETTS
 G:$D(APCPE("ERROR")) XIT
 D GETPOVS
 I '$D(APCPH("POV","P")) S APCPE("ERROR")="E300" G XIT
 I APCP3>1 S APCPE("ERROR")="E301" G XIT
 G:$D(APCPE("ERROR")) XIT
 D ^APCPHOS2
 G:$D(APCPE("ERROR")) XIT
 D CHECKPVS
 I $D(APCPE) S APCPE("FILE")=9000010,APCPE("EDFN")=APCP("V DFN") G XIT
 D ^APCPHOS1
XIT ;
 K APCP1,APCP2,APCP3,APCPSC,APCPPREC
 Q
GETTS ;
 S APCPH("VINP PTR")=$O(^AUPNVINP("AD",APCP("V DFN"),"")),APCPH("VINP REC")=^AUPNVINP(APCPH("VINP PTR"),0),APCPH("A TS CODE")=$P(APCPH("VINP REC"),U,4),APCPH("D TS CODE")=$P(APCPH("VINP REC"),U,5)
 I APCPH("A TS CODE")="" S APCPE("ERROR")="E303" Q
 I APCPH("D TS CODE")="" S APCPE("ERROR")="E304" Q
 S APCPH("A TS CODE")=$P(^DIC(45.7,APCPH("A TS CODE"),9999999),U),APCPH("D TS CODE")=$P(^DIC(45.7,APCPH("D TS CODE"),9999999),U)
 I APCPH("A TS CODE")="" S APCPE("ERROR")="E305"
 I APCPH("D TS CODE")="" S APCPE("ERROR")="E306"
 Q
GETPOVS ;
 S (APCP1,APCP2,APCP3)=0 F  S APCP2=$O(^AUPNVPOV("AD",APCP("V DFN"),APCP2)) Q:APCP2=""  S APCP1=APCP1+1 D SETPOV
 Q
SETPOV ;
 S APCPPREC=^AUPNVPOV(APCP2,0)
 S APCPSC=$P(APCPPREC,U,12) S:APCPSC="" APCPSC="S"
 I APCPSC="P" S APCP3=APCP3+1,APCPH("POV","P")=$P(^ICD9($P(APCPPREC,U),0),U)_"^"_$P(APCPPREC,U)_"^"_APCP2 Q
 S APCPH("POV",APCPSC,APCP1)=$P(^ICD9($P(APCPPREC,U),0),U)_"^"_$P(APCPPREC,U)_"^"_APCP2
 Q
CHECKPVS ;
C2 ;CERTAIN "V" CODES CANNOT BE PRIMARY DXS
 I $D(^APCDINPT(2,11,"AC",$P(APCPH("POV","P"),U))) S APCPE("ERROR")="E307" Q
C1 ;IF PRIMARY DX IS A "V" CODE SECONDARY MUST BE "V" CODE ALSO
 ;WITH EXCEPTIONS
 I $E($P(APCPH("POV","P"),U))="V",'$D(^APCDINPT(1,11,"AC",$P(APCPH("POV","P"),U))) D
 .S APCP1=0 F  S APCP1=$O(APCPH("POV","S",APCP1)) Q:APCP1'=+APCP1  D
 ..I $E($P(APCPH("POV","S",APCP1),U))'="V" S APCPE("ERROR")="E308"
 ..Q
 .Q
 Q:$D(APCPE("ERROR"))
E1 ;CERTAIN CODES REQUIRE AN ACCEPT COMMAND
 I $D(^APCDINPT(8,11,"AC",$P(APCPH("POV","P"),U))),'$D(APCPV("ACC")) S APCPE("ERROR")="E309" Q
 S APCP1=0 F  S APCP1=$O(APCPH("POV","S",APCP1)) Q:APCP1'=+APCP1  D E11
 Q:$D(APCPE("ERROR"))
 ;
E2 ;IF CODE V30-V39 (.0) ADM SRV MUST BE NEWBORN
 I $D(^APCDINPT(4,11,"AC",$P(APCPH("POV","P"),U))),APCPH("A TS CODE")'="07" S APCPE("ERROR")="E311" Q
 I '$D(^APCDINPT(4,11,"AC",$P(APCPH("POV","P"),U))),APCPH("A TS CODE")="07" S APCPE("ERROR")="E331" Q
E3 ;IF PRIMARY DX IS V30-V39(.1) ADM SRV MUST BE ,11
 I $D(^APCDINPT(3,11,"AC",$P(APCPH("POV","P"),U))),APCPH("A TS CODE")'=11 S APCPE("ERROR")="E312" Q
E4 ;IF PRIM DX (V30-V39 (.0 OR ,.1)) AGE CANNOT BE > 3 DAYS
 I (($D(^APCDINPT(4,11,"AC",$P(APCPH("POV","P"),U))))!($D(^APCDINPT(3,11,"AC",$P(APCPH("POV","P"),U))))),AUPNDAYS>3 S APCPE("ERROR")="E313" Q
 Q
E11 ;
 I $D(^APCDINPT(8,11,"AC",$P(APCPH("POV","S",APCP1),U))),'$D(APCPV("ACC")) S APCPE("ERROR")="E309" Q
 Q
