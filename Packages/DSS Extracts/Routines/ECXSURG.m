ECXSURG ;ALB/JA,BIR/DMA,PTD-Surgery Extract for DSS ; 9/15/05 2:49pm
 ;;3.0;DSS EXTRACTS;**1,11,8,13,25,24,33,39,41,42,46,50,71,84**;Dec 22, 1997
BEG ;entry point from option
 D SETUP I ECFILE="" Q
 D ^ECXTRAC,^ECXKILL
 Q
 ;
START ;
 S QFLG=0,ECED=ECED+.3,ECD=ECSD1
 F  S ECD=$O(^SRF("AC",ECD)),ECD0=0 Q:('ECD)!(ECD>ECED)!(QFLG)  D
 .F  S ECD0=$O(^SRF("AC",ECD,ECD0)) Q:'ECD0  D
 ..I $D(^SRF(ECD0,0)) S ECXDFN=+$P(^(0),U,1) D STUFF Q:QFLG
 Q
 ;
STUFF ;gather data
 N J,X,Y,PP,DATA1,DATA2,DATAOP,ARR,ERR,SUB,MOD,ECXNONL,ECXSTOP,TIMEDIF
 N ECPRO,ECXORCT,ECXPTHA,ECXNPRFI,ECXPA,ECXPAPC,ECSRPC,ECATPC,ECSAPC
 S ECXDATE=ECD,ECXERR=0,ECXQ=""
 Q:'$$PATDEM^ECXUTL2(ECXDFN,ECXDATE,"1;2;3;5;")
 I ECXADMDT="" S ECXADD=ECXADMDT
 I ECXADMDT'="" S ECXADD=$$ECXDATE^ECXUTL(ECXADMDT,ECXYM)
 S EC0=^SRF(ECD0,0)
 S DATA1=$S($D(^SRF(ECD0,.1)):^(.1),1:"")
 S DATA2=$S($D(^SRF(ECD0,.2)):^(.2),1:"")
 S DATAOP=$S($D(^SRF(ECD0,"OP")):^("OP"),1:"")
 S ECNO=$G(^SRF(ECD0,"NON"))
 ;get data
 S ECSR=$P(DATA1,U,4),(ECATNPI,ECSANPI,ECSRNPI)="",ECAT=$P(DATA1,U,13)
 ;-Time patient in OR room (Nurse Time)
 S ECXTM=$$ECXTIME^ECXUTL($P(DATA2,U,10))
 S ECXDIV=$S($D(^SRF(ECD0,8)):^(8),1:ECINST)
 N ECXPDIV S ECXPDIV=$$RADDIV^ECXDEPT(ECXDIV)  ;Production Division
 S ECSA=$P($G(^SRF(ECD0,.3)),U,4),ECO=$P(EC0,U,2)
 ;get principle anesthetist and person class DBIA #103
 S ECXPA=$P($G(^SRF(ECD0,.3)),U,1)
 S ECXPAPC=$$PRVCLASS^ECXUTL(ECXPA,ECXDATE)
 S ECORTY=$P($G(^SRS(+ECO,2)),U),ECO=$P($G(^SRS(+ECO,0)),U)
 S ECSS=$P($G(^SRO(137.45,+$P(EC0,U,4),0)),U,2)
 S ECSS=$$RJ^XLFSTR($P($G(^DIC(45.3,+ECSS,0)),U),3,0)
 S:ECSS="000" ECSS="999"
 ; - Head and Neck Cancer Indicator
 S ECXHNCI=$$HNCI^ECXUTL4(ECXDFN)
 ;look for non-OR
 S (ECNT,ECNL,ECXDSSD,ECXNONL,ECXSTOP)=""
 I $P(ECNO,U)="Y" D
 .S ECSR=$P(ECNO,U,6),ECAT=$P(ECNO,U,7)
 .S ECXTM=$$ECXTIME^ECXUTL($P(ECNO,U,4))
 .S A1=$P(ECNO,U,5),A2=$P(ECNO,U,4),TIME="##" D:(A1&A2) TIME S ECNT=TIME
 .S (ECXNONL,ECNL)=+$P(ECNO,U,2),ECNL=$P($G(^ECX(728.44,ECNL,0)),U,9)
 .S:ECNL="" ECNL="UNKNOWN"
 .;
 .;- Get DSS Stop Code to use in encounter number
 .S ECXSTOP=$P($G(^ECX(728.44,ECXNONL,0)),U,4)
 ;
 ;- If surgery cancelled/aborted quit and go to next record
 S ECCAN=$P($G(^SRF(ECD0,30)),U)
 I +ECCAN S ECCAN=$$CANC^ECXUTL4(ECNL,$P(DATA2,U,10))
 ;on hold for ECXDSSD and ECXDSSP I $P($G(^SRF(ECD0,30)),U) Q
 ;get service of attending surgeon
 S ECATSV=$P($G(^DIC(49,+$G(^VA(200,+ECAT,5)),730)),U)
 ;
 ;get surgeon, attending and anesthesia super person classes
 S ECSRPC=$$PRVCLASS^ECXUTL(ECSR,ECXDATE)
 S ECATPC=$$PRVCLASS^ECXUTL(ECAT,ECXDATE)
 S ECSAPC=$$PRVCLASS^ECXUTL(ECSA,ECXDATE)
 ;
 ;add leading 2s for pointer to 200
 S:ECAT ECAT="2"_ECAT S:ECSR ECSR="2"_ECSR S:ECSA ECSA="2"_ECSA
 ;add leading 2 to principle anesthetist IEN
 S:ECXPA ECXPA="2"_ECXPA
 ;anesthesia technique
 S ECANE="",PP=""
 I $D(^SRF(ECD0,6,0)) S ECXJ=0 D
 .F  S ECXJ=$O(^SRF(ECD0,6,ECXJ)) Q:('ECXJ)!(ECANE]"")  D
 ..S PP=$P($G(^(ECXJ,0)),U,3) S:PP="Y" ECANE=$P(^(0),U,1)
 .I ECANE="" S ECXJ=$O(^SRF(ECD0,6,0)) I ECXJ S ECANE=$P(^SRF(ECD0,6,ECXJ,0),U,1)
 ;get primary procedure
 ;ecode0=p^cpt code^^patient time^operation time^anesthesia time
 S ECPT=+$P(DATAOP,U,2),ECXCMOD=""
 K ARR,ERR D FIELD^DID(130,28,,"LABEL","ARR","ERR") I $D(ARR("LABEL")) D
 .K ARR,ERR D FIELD^DID(130,28,,"GLOBAL SUBSCRIPT LOCATION","ARR","ERR")
 .Q:$D(ERR("DIERR"))
 .S SUB=$P(ARR("GLOBAL SUBSCRIPT LOCATION"),";"),MOD=0
 .F  S MOD=$O(^SRF(ECD0,SUB,MOD)) Q:MOD'>0  D
 ..S ECXCMOD=ECXCMOD_$P(^(MOD,0),U)_";"
 S ECXCPT=$$CPT^ECXUTL3(ECPT,ECXCMOD)
 S ECODE0="P"_U_U  ;ECPT_U
 F J="10,12","2,3","1,4" D
 .N ECNTIME,ECSTIME,ECATIME
 .S A2=$P(DATA2,U,$P(J,",")),A1=$P(DATA2,U,$P(J,",",2)),TIME="##"
 .I (A1&A2)&(+J=10) D TIME  S ECNTIME=TIME
 .I (A1&A2)&(+J=1) D TIME  S ECATIME=TIME
 .I (A1&A2)&(+J=2) D
 ..;
 ..;-Operation Time (Surgeon Time)
 ..;-Get time diff (in secs) & set to .5 if < 7.5 minutes (rounds to 1)
 ..S TIMEDIF=$$FMDIFF^XLFDT(A1,A2,2)/900
 ..S TIMEDIF=$S(TIMEDIF>0&(TIMEDIF<.5):.5,1:TIMEDIF)
 ..S TIME=$TR($J(TIMEDIF,4,0)," ")
 ..S:TIME<0 TIME="###"
 ..S:TIME ECSTIME=TIME
 .S ECODE0=ECODE0_U_TIME K TIME
 ; -Recovery Room Time
 S ECRR=""
 I $D(^SRF(ECD0,1.1)) D
 .S A1=$P(^(1.1),U,8),A2=$P(^(1.1),U,7),TIME="##" D:(A1&A2) TIME
 .S ECRR=TIME K TIME
 I ECNL]"" S $P(ECODE0,U,5)=ECNT
 ;
 ; -OR Clean Time in 15 min increments DBIA #103
 S ECXORCT=($$FMDIFF^XLFDT($P($G(DATA2),U,14),$P($G(DATA2),U,13),2)/60)/15
 ; -If no OR clean time recorded set it to 2
 I ECXORCT'>0 S ECXORCT=2
 ;
 ; -PT in hold area time in 15 min increments DBIA #103
 I $P($G(DATA2),U,10),$P($G(DATA2),U,15) D
 .S ECXPTHA=($$FMDIFF^XLFDT($P($G(DATA2),U,10),$P($G(DATA2),U,15),2)/60)/15
 .S CON=$P($G(^SRF(ECD0,"CON")),U)
 .I CON S ECXPTHA=ECXPTHA/2
 .S ECXPTHA=$TR($J(ECXPTHA,3,0)," ")
 ; -If hold time is =<0 set it to ""
 S:$G(ECXPTHA)'>0 ECXPTHA=""
 ;
 ;- Observation Patient Indicator (yes/no)
 S ECXOBS=$$OBSPAT^ECXUTL4(ECXA,ECXTS,ECNL)
 ;
 ;- set national patient record flag if exist
 D NPRF^ECXUTL5
 ;
 ;- If no encounter number don't file record
 S ECXENC=$$ENCNUM^ECXUTL4(ECXA,ECXSSN,ECXADMDT,ECXDATE,ECXTS,ECXOBS,ECHEAD,ECXSTOP,ECSS) Q:ECXENC=""
 ;
 D FILE
 ;get secondary procedures
 ;ecode0=s^cpt code
 S ECXJ=0
 F  S ECXJ=$O(^SRF(ECD0,13,ECXJ)) Q:'ECXJ  I $D(^(ECXJ,0)),$D(^(2)),$P(^(2),U)]"" D
 .S ECPT=$P(^SRF(ECD0,13,ECXJ,2),U),ECXCMOD=""
 .K ARR,ERR
 .D FIELD^DID(130.16,4,,"LABEL","ARR","ERR") I $D(ARR("LABEL")) D
 ..K ARR,ERR
 ..D FIELD^DID(130.16,4,,"GLOBAL SUBSCRIPT LOCATION","ARR","ERR")
 ..Q:$D(ERR("DIERR"))
 ..S SUB=$P(ARR("GLOBAL SUBSCRIPT LOCATION"),";"),MOD=0
 ..F  S MOD=$O(^SRF(ECD0,13,ECXJ,SUB,MOD)) Q:MOD'>0  S ECXCMOD=ECXCMOD_$P(^(MOD,0),U)_";"
 .S ECXCPT=$$CPT^ECXUTL3(ECPT,ECXCMOD)
 .S ECODE0="S"_U   ;_ECPT
 .D FILE
 ;get prostheses
 ;ecode0=i^^^^^^prosthesis^old qty field (null)
 S ECXJ=0
 F  S ECXJ=$O(^SRF(ECD0,1,ECXJ)) Q:'ECXJ  I $D(^(ECXJ,0)) D
 .S ECXP=+^SRF(ECD0,1,ECXJ,0),ECXQ=$P($G(^(1)),U,2) S:'ECXQ ECXQ=1
 .S ECODE0="I"_U_U_U_U_U_U_ECXP_U_U
 .D FILE
 Q
 ;
FILE ;file record
 ;node0
 ;division^dfn^ssn^name^in/out (ECXA)^day^case #^
 ;surg specialty^or room #^
 ;surgeon^attending^anesthesia supervisor^anesthesia technique^
 ;primary/secondary/prostheses^cpt^^pt time^op time^anes time^
 ;prostheses^qty^^
 ;movement number^treating specialty^cancel/abort (ECCAN)^time^or type^
 ;attending's service^non-or dss id^recovery room time^^
 ;primary care team^primary care provider^admission date
 ;node1
 ;mpi^dss dept ECXDSSD^surgeon npi^attending npi^anes supervisor npi^
 ;pc provider npi^pc prov person class^
 ;assoc pc provider^assoc pc prov person class^assoc pc prov npi^
 ;cpt&modifiers ECXCPT^dom ECXDOM^enrollment category ECXCAT^
 ;enrollment status ECXSTAT^enrollment priority ECXPRIOR^
 ;period of service ECXPOS^purple heart indicator ECXPHI^
 ;observ pat ind ECXOBS^encounter num ECXENC^ao loc ECXAOL^
 ;production division ECXPDIV^head & neck canc ind ECXHNCI^
 ;ethnicity ECXETH^race1 ECXRC1^new quantity ECXQ^
 ;^user enrollee ECXUESTA^patient type ECXPTYPE^combat vet elig
 ;ECXCVE^combat vet elig end date ECXCVEDT^enc cv eligible ECXCVENC
 ;or clean time ECXORCT^time pt in hold area ECXPTHA^national patient
 ;record flag ECXNPRFI^princ anesthetist ECXPA^princ anesthetist PC
 ;ECXPAPC^surgeon person class ECSRPC^attending person class ECATPC
 ;^anesthesia super person class ECSAPC
 N DA,DIK,STR
 S EC7=$O(^ECX(ECFILE,999999999),-1),EC7=EC7+1
 S ECODE=EC7_U_EC23_U_ECXDIV_U_ECXDFN_U_ECXSSN_U_ECXPNM_U_ECXA_U
 S ECODE=ECODE_$$ECXDATE^ECXUTL(ECXDATE,ECXYM)_U_ECD0_U_ECSS_U_ECO_U
 S ECODE=ECODE_ECSR_U_ECAT_U_ECSA_U_ECANE_U_ECODE0_U
 S STR=ECXMN_U_ECXTS_U_$S(ECCAN'="":ECCAN,1:"")_U_ECXTM_U_ECORTY_U
 S STR=STR_ECATSV_U_ECNL_U_ECRR_U_U_ECPTTM_U_ECPTPR_U_ECXADD_U
 S $P(ECODE,U,26,38)=STR
 S ECODE1=ECXMPI_U_ECXDSSD_U_ECSRNPI_U_ECATNPI_U_ECSANPI_U_ECPTNPI_U
 S ECODE1=ECODE1_ECCLAS_U_ECASPR_U_ECCLAS2_U_ECASNPI_U_ECXCPT_U_ECXDOM_U
 S ECODE1=ECODE1_ECXCAT_U_ECXSTAT_U_$S(ECXLOGIC<2005:ECXPRIOR,1:"")_U_ECXPOS_U_ECXPHI_U
 S ECODE1=ECODE1_ECXOBS_U_ECXENC_U_ECXAOL_U_ECXPDIV_U_ECXHNCI_U
 S ECODE1=ECODE1_ECXETH_U_ECXRC1_U_ECXQ_U
 I ECXLOGIC>2004 S ECODE1=ECODE1_U_ECXPRIOR_ECXSBGRP_U_ECXUESTA_U_ECXPTYPE_U_ECXCVE_U_ECXCVEDT_U_ECXCVENC_U_ECXORCT_U_ECXPTHA_U_ECXNPRFI
 I ECXLOGIC>2005 S ECODE1=ECODE1_U_ECXPA_U_ECSRPC_U,ECODE2=ECATPC_U_ECSAPC_U_ECXPAPC
 S ^ECX(ECFILE,EC7,0)=ECODE,^ECX(ECFILE,EC7,1)=ECODE1,^ECX(ECFILE,EC7,2)=ECODE2,ECRN=ECRN+1
 S DA=EC7,DIK="^ECX("_ECFILE_"," D IX1^DIK K DIK,DA
 I $D(ZTQUEUED),$$S^%ZTLOAD S QFLG=1
 ;
TIME ; given date/time get increment
 ;A1=later, A2=earlier, TIME=difference
 N CON,TIMEDIF
 S CON=$P($G(^SRF(ECD0,"CON")),U)
 ;
 ;-Get time diff (in secs) & set to .5 if < 7.5 minutes (rounds to 1)
 S TIMEDIF=$$FMDIFF^XLFDT(A1,A2,2)/900
 S TIMEDIF=$S(TIMEDIF>0&(TIMEDIF<.5):.5,1:TIMEDIF)
 I 'CON D
 .S TIME=$J($TR($J(TIMEDIF,4,0)," "),2,1)
 .S:TIME>"99.0" TIME="99.0"
 I CON D
 .S TIME=$J(($TR($J(TIMEDIF,4,0)," ")/2),2,1)
 .S:TIME>"99.5" TIME="99.5"
 S:TIME<0 TIME="###"
 Q
 ;
SETUP ;Set required input for ECXTRAC
 S ECHEAD="SUR"
 D ECXDEF^ECXUTL2(ECHEAD,.ECPACK,.ECGRP,.ECFILE,.ECRTN,.ECPIECE,.ECVER)
 Q
 ;
QUE ; entry point for the background requeuing handled by ECXTAUTO
 D SETUP,QUE^ECXTAUTO,^ECXKILL Q
