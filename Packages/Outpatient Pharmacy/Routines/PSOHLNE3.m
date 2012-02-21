PSOHLNE3	;BIR/LE - Process Edit Information from CPRS ;02/27/04
	;;7.0;OUTPATIENT PHARMACY;**143,239**;DEC 1997
	;External reference to ^OR(100 private DBIA 2219
	;External reference VADPT supported by DBIA 10061
	;This API is used to update the prescription file when ICD-9 diagnosis and SC/EI's are updated as a result of an e-sig in CPRS.  
	;
EN(DFN,ORITEM,ORIEN,ORDX,ORSCEI)	;DBIA 4666
	;DFN = Patient IEN
	;ORITEM = Package reference number from file 100
	;ORIEN = ien from file 100
	;ORDX(1)= (pointer to file 80) up to 8 accepted and first is primary ICD
	;ORDX(2)= (pointer to file 80)
	;ORSCEI=  seven pieces - where 1=yes, 0=no, null or ? =not asked
	;ORSCEI=AO^IR^SC^EC^MST^HNC^CV
	N DX,DX2,DX3,RXN,PSOSCP,PSOX,ORDPROV,PSOSCP2,DA,RET,PSOANSQ,PSORX,PTSTATUS,ARRAY,PSOOI,ORITEM2,ORID,OICHK,PSORENW
	N PSODCPY,PSONEW,PSOOIBQ,PSOFLD,PSODCZ,PSOSTAZ,PREA,PSOPIBQ,PSOIBQC,PSOSCA,PSOPICD,PSOCICD,PSODGUP,PSOOICD
	N PSODD,PSOSI
	S:'$D(ORIEN) ORIEN="" S:'$D(ORSCEI) ORSCEI="" S:'$D(ORITEM) ORITEM=""
	;
	;validate prescription IEN with DFN, ord item, and placer#
	S RET=1,PSODCZ=",12,14,15,"
	S RXN=ORITEM I '$D(^PSRX(RXN)) S RET="0^1" Q RET  ;invalid RX ien
	I $D(^PSRX(RXN,"STA")) S PSOSTAZ=^PSRX(RXN,"STA")
	; get prescription file patient ien, drug, and placer order #
	D GETS^DIQ(52,RXN_",","2;6;39.3","I","ARRAY")
	I '$D(ARRAY(52,RXN_",",2,"I")) S RET="0^3" Q RET  ;quit if you don't have a patient ien
	I ARRAY(52,RXN_",",2,"I")'=DFN S RET="0^3" Q RET  ;quit if patient dfn is differnt
	I '$D(ARRAY(52,RXN_",",39.3,"I")) S ARRAY(52,RXN_",",39.3,"I")=""  ;if don't have it; treat is as null
	I ARRAY(52,RXN_",",39.3,"I")'="" I ARRAY(52,RXN_",",39.3,"I")'=ORIEN S RET="0^5" Q RET  ;placer # is different
	I ARRAY(52,RXN_",",39.3,"I")="" S OICHK=0 D CHKOI I OICHK S RET="0^4" Q RET  ;quit if placer # is null and orderable item is different or null.
	;end of validation process
	;
	S PSODD=$$GET1^DIQ(52,RXN_",",6,"I") S:($P($G(^PSDRUG(PSODD,0)),"^",3)["S")!($P($G(^(0)),"^",3)["I") PSOSI=1
	S PSOPIBQ=$G(^PSRX(RXN,"IBQ")),PSOPICD=$P($G(^PSRX(RXN,"ICD",1,0)),"^",2,7)
	S PSOX("IRXN")=RXN,PSORENW("IRXN")=RXN
	S (PSONEW("PATIENT STATUS"),PTSTATUS)=$$GET1^DIQ(52,RXN_",","3","I")
	I '$D(PTSTATUS) S (PSONEW("PATIENT STATUS"),PTSTATUS)=""
	;if patient status is null, treat same as PSONEW2, PSORN52, PSONEWG, AND PSONEWF.  If piece 7 of ^PS(53 doesn't equal 1, it's not exempt from copay.
	I ORSCEI["?" S ORSCEI=$TR(ORSCEI,"?","")
	D SCP^PSORN52D
	S PSOANSQ(PSOX("IRXN"),"VEH")=$P(ORSCEI,U,1)
	S PSOANSQ(PSOX("IRXN"),"RAD")=$P(ORSCEI,U,2)
	I PSOSCP<50&($P($G(^PS(53,+$G(PTSTATUS),0)),"^",7)'=1) S PSOANSQ(PSOX("IRXN"),"SC")=$P(ORSCEI,U,3),PSOANSQ("SC")=$P(ORSCEI,U,3)
	I PSOSCP>49!($P($G(^PS(53,+$G(PTSTATUS),0)),"^",7)=1) S PSOANSQ(PSOX("IRXN"),"SC>50")=$P(ORSCEI,U,3),PSOANSQ("SC>50")=$P(ORSCEI,U,3)
	I PSOSCP=""&('$D(PSOANSQ("SC")))&($D(^PSRX(RXN,"ICD",1))) S PSOANSQ("SC")=$P(^PSRX(RXN,"ICD",1,0),"^",4),PSOANSQ(PSOX("IRXN"),"SC")=PSOANSQ("SC")  ;for SC with no percentage defined/ legacy
	S PSOANSQ(PSOX("IRXN"),"PGW")=$P(ORSCEI,U,4)
	S PSOANSQ(PSOX("IRXN"),"MST")=$P(ORSCEI,U,5)
	S PSOANSQ(PSOX("IRXN"),"HNC")=$P(ORSCEI,U,6)
	S PSOANSQ(PSOX("IRXN"),"CV")=$P(ORSCEI,U,7)
	; 
	S DX="",DX2=0 F  S DX=$O(ORDX(DX)) Q:DX=""  S DX2=DX2+1,PSORX("ICD",DX2)=ORDX(DX)  ;Multi signed Rx's come in consecutively and the diagnosis subscript doesn't start with 1 for each Rx
	S PSOSCP2=1
	;
ICD2	;Check to see if SC/EI changed during CPRS sign order
	D GETS^DIQ(52,PSOX("IRXN")_",","52311*","I","PSOOICD")
	S PSODCPY=0,PSOFLD=""
	F TYPE="VEH","RAD","SC>50","PGW","MST","HNC","CV" Q:PSODCPY  F PSOFLD=1:1:7 D  Q:PSODCPY
	. I TYPE="VEH"&(PSOFLD=1) D CHOC
	. I TYPE="RAD"&(PSOFLD=2) D CHOC
	. I TYPE="SC>50"&(PSOFLD=3)&($D(PSOANSQ(PSOX("IRXN"),TYPE))) D CHOC
	. I TYPE="PGW"&(PSOFLD=4) D CHOC
	. I TYPE="MST"&(PSOFLD=5) D CHOC
	. I TYPE="HNC"&(PSOFLD=6) D CHOC
	. I TYPE="CV"&(PSOFLD=7) D CHOC
	I $D(PSOANSQ("SC")) S PSOFLD=3 S:PSOANSQ("SC")'=PSOOICD(52.052311,1_","_PSOX("IRXN")_",",PSOFLD,"I") PSODCPY=1,PSOFLD=""
	; IF NO SC/EI DIFFERENCES, CHECK FOR ICD CHANGES.  If there were SC/EI difference, don't need to check ICD because they are sent anyway when copay update is done.
	I '$G(PSODCPY) D
	.I '$D(PSORX("ICD"))&($G(PSOOICD(52.052311,1_","_RXN_",",.01,"I"))) S PSODGUP=1 Q  ;if no ICD's passed and ICD's defined in 52, CPRS overrides OP
	.S (DX3,DX2,DX)="" F  S DX=$O(PSOOICD(52.052311,DX)) Q:DX=""  S DX2=+DX  ;get last entry for file 52
	.S DX="" F  S DX=$O(PSORX("ICD",DX)) Q:DX=""  S DX3=DX D  ;get last entry for new ICD's from CPRS
	.. I $G(PSOOICD(52.052311,DX_","_PSOX("IRXN")_",",.01,"I"))'=PSORX("ICD",DX) S PSODGUP=1  ;if ICD'S changed or more new ICD's than old ones.
	.I DX2>DX3 S PSODGUP=1  ;if more old ICD's than new ones
	Q:'$G(PSODCPY)&('$G(PSODGUP)) 1
	D FILE2^PSORN52D  ;file SC/EI/ICD'S into Rx file
	S PSOCIDC=$P($G(^PSRX(RXN,"ICD",1,0)),"^",2,7)
	;only do copay if SC/EI changed and SC is less than 50%.
	I PSODCZ[(","_$G(PSOSTAZ)_",") S RET="0^6" Q RET  ;discontinue's no copay changes allowed.
	S PSOIBQC=$G(^PSRX(RXN,"IBQ"))
	I PSOPIBQ[1&(PSOIBQC'[1)&(PSOSCP<50) S $P(^PSRX(RXN,"IB"),"^",1)=1 D  Q RET  ;don't do no copay to copay bills, but update status
	. D ALOG
	. Q:($P($G(^PS(53,+$G(PTSTATUS),0)),"^",7)=1)
	. S PSOOLD="No Copay",PSONW="Copay",PREA="R",PSODA=RXN D:'$G(PSOSI) ACTLOG^PSOCPA
	I $G(PSODCPY)&(PSOSCP<50) D COPAY
	I ($G(PSODCPY)!($G(PSODGUP))) D ALOG
	Q RET
CHOC	;check outpatient classifications
	S:PSOANSQ(PSOX("IRXN"),TYPE)'=PSOOICD(52.052311,1_","_PSOX("IRXN")_",",PSOFLD,"I") PSODCPY=1
	Q
ALOG	;set activity log with edit info from cprs
	N ACNT,SUB,RF,RFCNT
	S ACNT=0 F SUB=0:0 S SUB=$O(^PSRX(RXN,"A",SUB)) Q:'SUB  S ACNT=SUB
	S RFCNT=0 F RF=0:0 S RF=$O(^PSRX(RXN,1,RF)) Q:'RF  S RFCNT=RF S:RF>5 RFCNT=RF+1
	D NOW^%DTC S ACNT=ACNT+1
	S ^PSRX(RXN,"A",0)="^52.3DA^"_ACNT_"^"_ACNT S ^PSRX(RXN,"A",ACNT,0)=%_"^"_"E"_"^^"_RFCNT_"^Clinical Indicators and SC/EI's were updated from a CPRS e-sig edit at "_$E($P(%,".",2),1,2)_":"_$E($P(%,".",2),3,4)_"."
	Q
COPAY	;cancel copay charges if SC<50% and SC/EI changed and released
	;  must have PSODA,PSO,PSODAYS,PSOFLAG,PSOREF,PSOIB,PSOPAR7,PSOOLD,PSONW before call to PSOCPA
	Q:($P($G(^PS(53,+$G(PTSTATUS),0)),"^",7)=1)
	N PSODA,PSO,PSODAYS,PSOFLAG,PSOREF,PSOIB,PSZ,PSOPAR7,PSOCSEQ,PSZ1,PSZ2,RELDAT,PSOOLD,PSONW,PSOSITE
	S PSODA=RXN,PSO=3,PSODAYS=$$GET1^DIQ(52,PSODA_",","8")
	S PSOOLD="Copay"
	S PSONW="No Copay"
	S PSOSITE=$P(^PSRX(PSODA,2),"^",9)
	S PSOPAR7=$G(^PS(59,PSOSITE,"IB"))
	S PSOFLAG=1  ;1 used here to eliminate display/print of messages.
CSORT	; get orig fill copay info if released.
	S RELDAT=$$GET1^DIQ(52,PSODA_",","31","I")
	I RELDAT'="" S PSOCSEQ("A",0)=$G(^PSRX(PSODA,"IB"))
	I RELDAT="" S PREA="R" D:(PSOIBQC[1&(PSOPIBQ'[1)) ACTLOG^PSOCPA G SET ;set act log when unreleased, but SC/EI changed copay
	; get copay info for all released refills; if any
	F PSZ=0:0 S PSZ=$O(^PSRX(PSODA,1,PSZ)) Q:PSZ'>0  D
	. S RELDAT="",RELDAT=$$GET1^DIQ(52.1,PSZ_","_PSODA_",","17","I")
	. Q:RELDAT=""
	. S PSOCSEQ("A",PSZ)=$G(^PSRX(PSODA,1,PSZ,"IB"))
	; Sort potential refills to be cancelled first starting with last fill
	;    then orig fill then the rest of the entries.
	S (PSZ1,PSZ2,PSZ)="" F  S PSZ=$O(PSOCSEQ("A",PSZ),-1) Q:PSZ=""  D
	. I PSZ>0&($P(PSOCSEQ("A",PSZ),"^",2)'="") S PSZ1=PSZ1+1,PSOCSEQ("B",PSZ1,PSZ)="" Q
	. I PSZ>0&($P(PSOCSEQ("A",PSZ),"^",2)="") S PSZ2=PSZ2+1000,PSOCSEQ("B",PSZ2,PSZ)="" Q
	. I PSZ=0&($P(PSOCSEQ("A",PSZ),"^",4)'="") S PSZ1=PSZ1+1,PSOCSEQ("B",PSZ1,PSZ)="" Q
	. I PSZ=0&($P(PSOCSEQ("A",PSZ),"^",4)="") S PSZ2=PSZ2+1000,PSOCSEQ("B",PSZ2,PSZ)="" Q
	;
	S (PSZ,PSZ1)="",PREA="R" D:'$G(PSOSI)&(PSOIBQC[1&(PSOPIBQ'[1)) ACTLOG^PSOCPA F  S PSZ1=$O(PSOCSEQ("B",PSZ1)) Q:PSZ1=""  D
	. F  S PSZ=$O(PSOCSEQ("B",PSZ1,PSZ)) Q:PSZ=""  D
	.. S (PSOREF,PSOIB)="",PREA="C",(PSOOLD,PSONW)=""
	.. S PSOREF=PSZ,PSOIB=PSOCSEQ("A",PSZ) D RXED^PSOCPA
SET	S:$D(^PSRX(PSODA,"IB"))&($TR($G(^PSRX(PSODA,"IBQ")),"^")[1) $P(^PSRX(PSODA,"IB"),"^",1)=""
	Q
CHKOI	;get and compare orderable items in file #100 and #52; don't process
	;  if it's different and the placer # is null.
	I '$D(ARRAY(52,RXN_",",6,"I")) S OICHK=1 Q
	D GETS^DIQ(50,ARRAY(52,RXN_",",6,"I")_",","2.1","I","PSOOI")
	S ORITEM2=$$GET1^DIQ(100.001,"1,"_ORIEN_",",".01","I")
	S ORID=$$GET1^DIQ(101.43,ORITEM2_",","2","I") S ORID=$P(ORID,";",1)
	I PSOOI(50,ARRAY(52,RXN_",",6,"I")_",",2.1,"I")'="" I PSOOI(50,ARRAY(52,RXN_",",6,"I")_",",2.1,"I")'=ORID S OICHK=1
	Q
TEST(ORIEN)	;manually test an individual order record
	N I,X,ORSCEIS,ORSCEI,ORDX,EDFLG,ORITEM,DFN,JJ
	S (JJ,I)=0 F  S I=$O(^OR(100,ORIEN,5.1,I)) Q:I=""!(I'?1N.NN)  S JJ=JJ+1,ORDX(JJ)=$G(^OR(100,ORIEN,5.1,I,0))
	S ORSCEIS=^OR(100,ORIEN,5.2),ORITEM=$P($G(^OR(100,ORIEN,4)),"^",1)
	S ORSCEI="" F I=3,4,1,5,2,6,7 S ORSCEI=ORSCEI_"^"_$P(ORSCEIS,"^",I)
	S ORSCEI=$E(ORSCEI,2,99)
	S RXN=ORITEM,DFN=$P($P(^OR(100,ORIEN,0),"^",2),";",1)
	D EN^PSOHLNE3(DFN,ORITEM,ORIEN,.ORDX,ORSCEI)
	Q
