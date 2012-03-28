LREPIRP ;DALLAS/SED - EMERGING PATHOGENS HL7 REPORT CONVERSION ; 1/1/98
 ;;5.2T9;LR;**1018**;Nov 17, 2004
 ;;5.2;LAB SERVICE;**132,157,175**;Sep 27, 1994
 Q
PROCESS K ^TMP($J,"MSG")
 S SP="                        ",LRPROT=HL("EID")
 S LRMGP=+$P($G(^LAB(69.4,LRPROT,0)),U,2)
 Q:+LRMGP'>0
 S XMSUB=$P(^LAB(69.4,LRPROT,0),U,5)
 S:XMSUB="" XMSUB="Verification Report"
 S MSGCNT=1,HLFS=HL("FS"),LRCS=$E(HL("ECH"),1,1)
 N I,J,X F I=1:1 X HLNEXT Q:HLQUIT'>0  S LRHL7=HLNODE D
 .S MSG="" S SEG=$P(LRHL7,HLFS,1) I $L($T(@SEG)) D @SEG
 .S ^TMP($J,"MSG",MSGCNT)=MSG,MSGCNT=MSGCNT+1
 S XMDUZ="POSTMASTER"
 S XMY("G."_$P(^XMB(3.8,LRMGP,0),U,1))=""
 S XMTEXT="^TMP("_$J_",""MSG"","
 D ^XMD
 K LRMGP
 Q
MSH ;
 S SITE=$P(LRHL7,HLFS,4),ISITE=""
 S:SITE="" SITE="UNDEFINED"
 S:$D(^DIC(4,"D",SITE)) ISITE=$O(^DIC(4,"D",SITE,0))
 I +ISITE>0,$G(^DIC(4,ISITE,0))'="" S SITE=$P(^DIC(4,SITE,0),U,1)
 S MSG="Message Date/Time  "_$$CDT($P(LRHL7,HLFS,7))
 S MSG=MSG_"           HL7 Message # "_$P(LRHL7,HLFS,10)
 S ^TMP($J,"MSG",MSGCNT)=MSG,MSGCNT=MSGCNT+1,MSG=""
 S ^TMP($J,"MSG",MSGCNT)="Sending Site  "_SITE,MSGCNT=MSGCNT+1
 S ^TMP($J,"MSG",MSGCNT)=MSG,MSGCNT=MSGCNT+1,MSG=""
 Q
NTE ;NOTE AND COMMENTS
 S TYPE=$P($P(LRHL7,HLFS,3),LRCS,1),MSG=""
 I TYPE="T" D
 .S MSG="TOTAL "_$P($P(LRHL7,HLFS,3),LRCS,2)_"  "
 .S MSG=MSG_$P($P(LRHL7,HLFS,3),LRCS,3)_"  "_$P($P(LRHL7,HLFS,3),LRCS,4)
 I +TYPE>0 D
 .S:$G(^TMP($J,"MSG",(MSGCNT-1)))'="" ^TMP($J,"MSG",MSGCNT)="",MSGCNT=MSGCNT+1
 .S MSG="*********  "_TYPE_"  "_$P($P(LRHL7,HLFS,3),LRCS,2)_"  *********"
 I MSG="" D
 .S MSG=$P($P($P(LRHL7,HLFS,3),LRCS,2)," ",1,3)
 .S MSG=MSG_"  "_$$CDT($P($P($P(LRHL7,HLFS,3),LRCS,2)," ",4))
 .S MSG=MSG_"  TO  "_$$CDT($P($P($P(LRHL7,HLFS,3),LRCS,2)," ",6))
 .S MSG=MSG_"    Message Seq # "_$P($P(LRHL7,HLFS,3),LRCS,3)
 .S MSG=MSG_"  "_$S(TYPE="R":"manual",1:"Auto")
 K TYPE
 Q
PID ;PATIENT INFO
 S:$G(^TMP($J,"MSG",(MSGCNT-1)))'="" ^TMP($J,"MSG",MSGCNT)="",MSGCNT=MSGCNT+1
 S NM=$P(LRHL7,HLFS,6),SSN=$P(LRHL7,HLFS,20)
 S SSN=$E(SSN,1,3)_"-"_$E(SSN,4,5)_"-"_$E(SSN,6,9)
 S DOB=$$CDT($P(LRHL7,HLFS,8)),NM=$P(NM,LRCS,2)_" "_$P(NM,LRCS,1)
 S SX=$P(LRHL7,HLFS,9),AD=$P($P(LRHL7,HLFS,12),LRCS,1)
 S ZP=$P($P(LRHL7,HLFS,12),LRCS,2),POS=$P(LRHL7,HLFS,28),POSN=""
 I POS'="",$D(^DIC(21,"D",POS)) S POS=$O(^DIC(21,"D",POS,""))
 S:POS'="" POSN=$P($G(^DIC(21,POS,0)),U,1)
 S MSG=NM_"    "_SSN_"    "_DOB_"    "_SX
 S:POSN'="" MSG=MSG_"   "_POSN
 S MSG=MSG_"   "_AD_"   "_ZP
 S ^TMP($J,"MSG",MSGCNT)="",MSGCNT=MSGCNT+1
 K NM,SSN,DOB,SX,POS,AD,ZP,POSN
 Q
PV1 ;PATIENT VISIT ENCOUNTER
 S TYPE=$P(LRHL7,HLFS,3)
 S ENC=$S(TYPE="O":"Accession ",1:"Admission ")_"Date  "
 S TYPE=$S(TYPE="U":"Update",TYPE="I":"Inpatient ",1:"Outpatient")
 S MSG=TYPE_"  "_ENC_$$CDT($P(LRHL7,HLFS,45))
 S ^TMP($J,"MSG",MSGCNT)=MSG,MSGCNT=MSGCNT+1,MSG=""
 Q:$P(LRHL7,HLFS,46)=""
 S MSG="            Discharge Date  "_$$CDT($P(LRHL7,HLFS,46))
 S MSG=MSG_"  Discharge Disposition  "_$P($P(LRHL7,HLFS,37),LRCS,2)
 K TYPE
 Q
CDT(DATE) ;CONVERTS THE DATE AND TIME
 S X=$E(DATE,5,6)_"-"_$E(DATE,7,8)_"-"_$E(DATE,1,4)
 S:$E(DATE,9,12)'="" X=X_"@"_$E(DATE,9,12)
 S:X="--" X=""
 Q X
DG1 ;DIAGNOSES
 S:$G(^TMP($J,"MSG",(MSGCNT-1)))'="" ^TMP($J,"MSG",MSGCNT)="",MSGCNT=MSGCNT+1
 S MSG=$P($P(LRHL7,HLFS,4),LRCS,1)
 S MSG=MSG_$E(SP,1,(15-$L(MSG)))_$P($P(LRHL7,HLFS,4),LRCS,2)
 Q
OBR ;OBSERVATION REPORTING
 S:$G(^TMP($J,"MSG",(MSGCNT-1)))'="" ^TMP($J,"MSG",MSGCNT)="",MSGCNT=MSGCNT+1
 S TST=$P(LRHL7,HLFS,5),TSTNM=$P(TST,LRCS,2),MSG=""
 S:TSTNM="" TSTNM=$P(TST,LRCS,5)
 S TOP=$P($P(LRHL7,HLFS,16),LRCS,3)
 S ENTRY=$P($P(LRHL7,HLFS,27),LRCS,2)
 S:+ENTRY MSG="ORG # "_ENTRY_"  "
 S MSG=MSG_$$CDT($P(LRHL7,HLFS,8))_"  "
 S:$P(LRHL7,HLFS,19)'="" MSG=MSG_$P(LRHL7,HLFS,19)_"  "
 S MSG=MSG_TSTNM_"  "_TOP
 K TST,TSTNM,TOP,ENTRY
 Q
OBX ;RESULTS
 I $P(LRHL7,HLFS,3)="ST" D
 .S TST=$P(LRHL7,HLFS,4),TSTNM=$P(TST,LRCS,5)
 .;S:TSTNM="" TSTNM=$P(TST,LRCS,5)
 .S OV=$P(LRHL7,HLFS,6)
 I $P(LRHL7,HLFS,3)="CE" D
 .S TSTNM=""
 .S OV=$P($P(LRHL7,HLFS,6),LRCS,2)
 S MSG="",ENTRY=$P(LRHL7,HLFS,5) S:+ENTRY MSG=ENTRY_"  "
 S MSG=MSG_TSTNM_"  "
 S FD=$$CDT($P(LRHL7,HLFS,15)),RR=$P(LRHL7,HLFS,8)
 S UN=$P(LRHL7,HLFS,7),AF=""
 S MSG="     "_MSG_FD_"   "_OV_"  "_UN_"  "_RR
 Q:$P(LRHL7,HLFS,9)=""
 S MSG=MSG_$E(SP,1,(40-$L(MSG)))_$P(LRHL7,HLFS,9)
 Q
 ;
