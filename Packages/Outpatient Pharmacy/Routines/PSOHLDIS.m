PSOHLDIS ;BIR/PWC,SAB - Automated Dispense Completion HL7 v.2.4 ;01/05/04
 ;;7.0;OUTPATIENT PHARMACY;**156,189,193,209,148**;DEC 1997
 ;Reference to ^PSDRUG supported by DBIA #221
 ;Reference to $$NDCFMT^PSSNDCUT supported by IA 4707
 ;This routine is called by FACK1^PSOHLDS
 K OK
 F I=0:0 S I=$O(PSOMSG(I)) Q:'I  D
 .I $P(PSOMSG(I),"|")="MSH" S NODE1=PSOMSG(I) Q
 .I $P(PSOMSG(I),"|")="MSA" S NODE2=PSOMSG(I) Q
 .I $P(PSOMSG(I),"|")="PID" S NODE3=PSOMSG(I) Q
 .I $P(PSOMSG(I),"|")="ORC" S NODE4=PSOMSG(I) Q
 .I $P(PSOMSG(I),"|")="RXD" S NODE5=PSOMSG(I) Q
 ;PID segment
 S PID=$P($G(NODE3),"|",4)   ;this contains all the patient id numbers
 F XX=1:1 S PIDD=$P(PID,"^",XX) Q:PIDD=""  D
 . S PIDID=$P(PIDD,"~",5)
 . I PIDID="NI" S PICN=$P(PIDD,"~",1)   ;ICN #
 . I PIDID="SS" S PSSN=$P(PIDD,"~",1)   ;SSN #
 . I PIDID="PI" S PPID=$P(PIDD,"~",1)   ;patient ID
 . I PIDID="PN" S PCLM=$P(PIDD,"~",1)   ;claim #
 ;ORC segment
 S RXID=$P($P($G(NODE4),"|",3),"^")    ;RX #
 S DFN=$P(^PSRX(RXID,0),"^",2) D DEM^VADPT
 S NAME=VADM(1),DOB=$P(VADM(3),"^"),SEX=$P(VADM(5),"^") K VADM
 S FPER=$P($P($G(NODE4),"|",11),"~")   ;filling person
 K DIC,X,Y S DIC="^VA(200,",DIC(0)="N,Z",X=+FPER D
 .D ^DIC I +Y>0 S FPER=+Y,FPERN=$P(Y,"^",2) Q
 .S FPER="",FPERN="UNKNOWN"
 S CPHARM=$P($P($G(NODE4),"|",12),"~") ;checking pharmacist
 K DIC,X,Y S DIC="^VA(200,",DIC(0)="N,Z",X=+CPHARM D  K DIC,X,Y
 .D ^DIC I +Y>0 S CPHARM=+Y,CPHARMN=$P(Y,"^",2) Q
 .S CPHARM="",CPHARMN="UNKNOWN"
 ;RXD segment
 S FILL=$P($P($G(NODE5),"|",2),"^")         ;fill #
 S GIVECOD=$P($P($G(NODE5),"|",3),"^")      ;give code
 S X=$P($P($G(NODE5),"|",4),"^"),DISPDT=$$FMDATE^HLFNC(X) K X  ;dispense date
 S PSORX=$P($P($G(NODE5),"|",8),"^")        ;prescription #
 S NDC=$P($P($G(NODE5),"|",10),"^")  ;NDC #
 K F I NDC]"" D  K L,F
 .S F=""
 .F L=1:1:$L(NDC,"^") I $P(NDC,"^",L)'=""  S F=$G(F)_$P(NDC,"^",L)_$S($P(NDC,"^",(L+1))]"":",",1:"")
 .S NDC=F
 S X=$P($P($G(NODE5),"|",10),"^",2),RELDT=$S($$FMDATE^HLFNC(X)>0:$$FMDATE^HLFNC(X),1:"") K X  ;release dt
 S PRT=$S($P($P($G(NODE5),"|",10),"^",3)=1:1,$P($P($G(NODE5),"|",10),"^",3)=2:1,1:0)  ;label printed by vendor
 S MEDDISP=$S($P($P($G(NODE5),"|",10),"^",3)=1:1,$P($P($G(NODE5),"|",10),"^",3)=4:1,1:0)  ;med dispensed by vendor
 S RPHARM=$P($P($G(NODE5),"|",11),"~",1)      ;releasing pharmacist
 K DIC,X,Y S DIC="^VA(200,",DIC(0)="N,Z",X=+RPHARM D
 .D ^DIC I +Y>0 S RPHARM=+Y Q
 .S RPHARM=""
 S LOT=$P($G(NODE5),"|",19)
 I LOT]"" D  K L,F
 .S F=""
 .F L=1:1:$L(LOT,"^") I $P(LOT,"^",L)'=""  S F=$G(F)_$P(LOT,"^",L)_$S($P(LOT,"^",(L+1))]"":",",1:"")
 .S LOT=F
 S X=$P($P($G(NODE5),"|",20),"^"),EXPDT=$S($$FMDATE^HLFNC(X)>0:$$FMDATE^HLFNC(X),1:"") K X   ;expiration date
 S MFG=$P($P($G(NODE5),"|",21),"^")         ;manufacturer
 K F I MFG]"" D  K L,F
 .F L=1:1:$L(MFG) Q:$P(MFG,"^",L)=""  S F=$G(F)_$P(MFG,"^",L)_$S($P(MFG,"^",(L+1))]"":",",1:"")
 .S MFG=F
 S EXRX=^PS(52.51,EIN,0)
 S IRX=$P(EXRX,"^"),FLL=$P(EXRX,"^",8),FLLN=$P(EXRX,"^",9),RPT=$P(EXRX,"^",5),(DIV,PSOSITE)=$P(EXRX,"^",11),PSOPAR=$G(^PS(59,DIV,0))
 S PSOPAR7=$G(^PS(59,PSOSITE,"IB")),PSOSYS=$G(^PS(59.7,1,40.1))
 S RXN=$P(^PSRX(IRX,0),"^"),DRG=$P(^(0),"^",6),QTY=$P(^(0),"^",7)
 I MEDDISP,FLL="F" D      ;PSO*209
 .I 'FLLN D  Q            ;No fill# = orig fill
 ..S $P(^PSRX(IRX,2),"^",4)=LOT,$P(^(2),"^",8)=MFG,$P(^(2),"^",11)=EXPDT,$P(^PSRX(IRX,"OR1"),"^",6)=FPER,$P(^("OR1"),"^",7)=CPHARM
 ..S:$G(^PSDRUG(DRG,660.1))]"" ^PSDRUG(DRG,660.1)=^PSDRUG(DRG,660.1)-QTY
 ..I $P($G(^PS(59,DIV,"DISP")),"^",2),$G(RELDT) D
 ...S DIE="^PSRX(",DA=IRX,DR="31///"_RELDT_";23////"_RPHARM_";32.1///@;32.2///@" D ^DIE K DIE,DR,DA
 ...I $P(^PSRX(IRX,0),"^",11)["W" S BRT="W",BNAM=$P(^PSRX(IRX,0),"^",2),BDIV=$P(^(2),"^",9) S:BDIV'="" BGRP=$P($G(^PS(59,BDIV,1)),"^",20)
 ...S PSOCPRX=$P(^PSRX(IRX,0),"^"),RXP=IRX D CP^PSOCP
 ...D EN^PSOHLSN1(IRX,"ZD"),AUTOREL^PSOBPSUT(IRX,FLLN,RELDT,NDC,"A",,30)
 ..E  I $$NDCFMT^PSSNDCUT(NDC)'="",$$STATUS^PSOBPSUT(IRX,FLLN)="" D SAVNDC^PSONDCUT(IRX,FLLN,NDC)
 .I FLLN D
 ..S $P(^PSRX(IRX,1,FLLN,0),"^",6)=LOT,$P(^(0),"^",14)=MFG,$P(^(0),"^",15)=EXPDT,$P(^(1),"^",4)=FPER,$P(^(1),"^",5)=CPHARM
 ..S:$G(^PSDRUG(DRG,660.1))]"" ^PSDRUG(DRG,660.1)=^PSDRUG(DRG,660.1)-$P(^PSRX(IRX,1,FLLN,0),"^",4)
 ..I $P($G(^PS(59,DIV,"DISP")),"^",2),$G(RELDT) D
 ...S DIE="^PSRX("_IRX_","""_1_""",",DA(1)=IRX,DA=FLLN
 ...S DR="17///"_RELDT_";4////"_RPHARM D ^DIE K DIE,DR,DA
 ...I $P(^PSRX(IRX,1,FLLN,0),"^",2)["W" S BRT="W",BDIV=$P(^PSRX(IRX,1,FLLN,0),"^",9),BNAM=$P(^PSRX(IRX,0),"^",2) S:BDIV'="" BGRP=$P($G(^PS(59,BDIV,1)),"^",20)
 ...N YY S YY=FLLN        ;PSO*209
 ...S PSOCPRX=$P(^PSRX(IRX,0),"^"),RXP=IRX D CP^PSOCP
 ...D EN^PSOHLSN1(IRX,"ZD"),AUTOREL^PSOBPSUT(IRX,FLLN,RELDT,NDC,"A",,30)
 ..E  I $$NDCFMT^PSSNDCUT(NDC)'="",$$STATUS^PSOBPSUT(IRX,FLLN)="" D SAVNDC^PSONDCUT(IRX,FLLN,NDC)
 ;partial
 I MEDDISP,FLL="P" D      ;PSO*209
 .S $P(^PSRX(IRX,"P",FLLN,0),"^",6)=LOT,$P(^(0),"^",12)=NDC,$P(^PSRX(IRX,"P",FLLN,1),"^")=MFG,$P(^(1),"^",3)=FPER,$P(^(1),"^",4)=CPHARM
 .S:$G(^PSDRUG(DRG,660.1))]"" ^PSDRUG(DRG,660.1)=^PSDRUG(DRG,660.1)-$P(^PSRX(IRX,"P",FLLN,0),"^",4)
 .I $P($G(^PS(59,DIV,"DISP")),"^",2),$G(RELDT) D
 ..S DIE="^PSRX("_IRX_","""_"P"_""",",DA(1)=IRX,DA=FLLN
 ..S DR="8///"_RELDT_";.05////"_RPHARM D ^DIE K DIE,DR,DA
 ..I $P(^PSRX(IRX,"P",FLLN,0),"^",2)["W" S BRT="W",BDIV=$P(^PSRX(IRX,"P",FLLN,0),"^",9),BNAM=$P(^PSRX(IRX,0),"^",2) S:BDIV'="" BGRP=$P($G(^PS(59,BDIV,1)),"^",20)
 S RXF=0 F I=0:0 S I=$O(^PSRX(RXID,1,I)) Q:'I  S RXF=I S:I>5 RXF=I+1
 S ACL=0 F I=0:0 S I=$O(^PSRX(RXID,"A",I)) Q:'I  S ACL=(ACL+1)
 D NOW^%DTC S NOW=%,ACL=ACL+1,^PSRX(RXID,"A",0)="^52.3DA^"_ACL_"^"_ACL
 S ^PSRX(RXID,"A",ACL,0)=NOW_"^N^"_RPHARM_"^"_RXF_"^"_$S(MEDDISP:"External Interface Dispensing is Complete.",1:"Medication WAS NOT Dispensed through Interface!")
 I MEDDISP D
 .S ^PSRX(RXID,"A",ACL,2,0)="^52.34A^2^2"
 .S ^PSRX(RXID,"A",ACL,2,1,0)="Filled By: "_FPERN
 .S ^PSRX(RXID,"A",ACL,2,2,0)="Checking Pharmacist: "_CPHARMN
 .D DRGACCT(RXID)         ;PSO*209
 I PRT D
 .S LBI=0 F LB=0:0 S LB=$O(^PSRX(RXID,"L",LB)) Q:'LB  S LBI=LBI+1
 .S LBI=LBI+1,^PSRX(RXID,"L",0)="^52.032DA^"_LBI_"^"_LBI
 .S ^PSRX(RXID,"L",LBI,0)=NOW_"^"_$S(FLL="F":FLLN,1:(99-FLLN))_"^"_"From Rx # "_$P(^PSRX(RXID,0),"^")_$S(FLL="P":" (Partial)",1:"")_$S($G(HLRPT):" (Reprint)",1:"")_" (External Interface)"_"^"_HLUSER
 K ACL,I,NOW,LBI,LB,PRT,MEDDISP
 I $D(BGRP),$D(BNAM),$D(BDIV) D REL
 ;
END K ADA,BDA,BDIV,BNGRXP,BNGSUS,BNAME,BRX,CNT1,CT,DA,DD,DIC,DIE,DIK,DIR,DO,DR,DTOUT,DUOUT,GRP,GRTP,JOES
 K NAM,NDA,NFLAG,NME,ODA,PSZ,RXO,SSN,TDFN,TFLAG,TIC,TICK,TIEN,TM,TM1,TSSN,X,Y,XX,BNAM,BRT,BGRP
 K Y,OK,XQADATA,SITEN,RDOM,CMOP,REQT,RTDTM,SITENUM,XQSOP,XQMSG,SITEN,NAME,XQAMSG,SITEN
 K XQAROU,XQAID,RDTM,NODE1,NODE2,NODE3,NODE4,NODE5,PIDID,PIDD,PICN,PSSN,PPID,PCLM
 K CPHARM,CPHARMN,FPER,FPERN,RPHARM
 Q
REL ;displays to bingo board
 N NAM,NAME,RXO,SSN S ADA="",BRXP=RXID
 F XX=0:0 S XX=$O(^PS(52.11,"B",BNAM,XX)) Q:'XX  D
 .F BRX=0:0 S BRX=$O(^PS(52.11,XX,2,"B",BRX)) Q:'BRX  I BRX=BRXP S (DA,ODA)=XX
 Q:'$D(DA)
 I $P($G(^PS(52.11,DA,0)),"^",7)]"" Q
 I $P($P($G(^PS(52.11,DA,0)),"^",5),".")'=DT S DIK="^PS(52.11," D ^DIK K DIK Q
 N TM,TM1 D NOW^%DTC S TM=$E(%,1,12),TM1=$P(TM,".",2)
 S NM=$P(^DPT($P(^PS(52.11,DA,0),"^"),0),"^"),DR="6////"_$E(TM1_"0000",1,4)_";8////"_NM_"",DIE="^PS(52.11,"
 L +^PS(52.11,DA):2 E  Q
 D ^DIE L -^PS(52.11,DA) I $G(X)="" S DIK="^PS(52.11," D ^DIK K DIK Q
 S RX0=^PS(52.11,DA,0),JOES=$P(RX0,"^",4),TICK=+$P($G(RX0),"^",2),GRP=$P($G(^PS(59.3,$P($G(^PS(52.11,DA,0)),"^",3),0)),"^",2)
 I GRP="T",'$G(TICK) S DIK="^PS(52.11," D ^DIK K DIK
 Q:'$G(DA)
 S PSZ=0 I '$D(^PS(59.2,DT,0)) K DD,DIC,DO,DA S X=DT,DIC="^PS(59.2,",DIC(0)="",DINUM=X D FILE^DICN S PSZ=1 Q:Y'>0 
 I PSZ=1 S DA(1)=+Y,DIC=DIC_DA(1)_",1,",(DINUM,X)=JOES,DIC(0)="",DIC("P")=$P(^DD(59.2,1,0),"^",2) K DD,DO D FILE^DICN K DIC,DA Q:Y'>0
 I PSZ=0 K DD,DIC,DO,DA S DA(1)=DT,(DINUM,X)=JOES,DIC="^PS(59.2,"_DT_",1,",DIC(0)="LZ" D FILE^DICN K DIC,DA,DO
 S DA=ODA D STATS1^PSOBRPRT,WTIME^PSOBING1
 Q
ERROR ;sends the error message back to the sending station
 ;parse the data from the msh segment in order to send back the error message
 ;OK=1 - segment missing
 ;OK=2 - Rx does not exists
 D NOW^%DTC
 S REJ=$S(OK=1:"MISSING SEGMENT(S)",OK=2:"PRESCRIPTION "_$S($G(PSORX):"#: "_PSORX,1:"")_" DOES NOT EXISTS",1:"")
 S ACKDATE=$P($$FMTHL7^XLFDT(%),"-",1)
 S ^TMP("PSO2",$J,1)="MSH|^~\&|PSO VISTA||PSO DISPENSE||"_$G(ACKDATE)_"||RDS^013|10001|P|2.4|||NE|NE"
 ;S ^TMP("PSO2",$J,2)="MFE|MUP|"_$G(J)_"|"_$G(ACKDATE)_"|"_$G(SITE)_"|CE"
 ;S ^TMP("PSO2",$J,3)="ZLF|4|^"_$G(USER)_"||"_$G(REJ)
 K %,ACKDATE,USER,Y,REJ,OK
 Q
DRGACCT(RXP) ;update Drug Accountability Package                      ;PSO*209
 S RXP=+$G(RXP) Q:'RXP
 N PSA,DIC,DA,X,Y,DIQ,PSODA,PSOSITE,QDRUG,JOB192 S (JOB192,PSODA)=0
 ;check for Drug Acct background job
 S X="PSA IV ALL LOCATIONS",DIC(0)="MZ",DIC=19.2 D ^DIC S JOB192=Y
 I JOB192>0,$P($G(Y(0)),U,2)>DT D
 . S PSODA=1
 . S:'$P($G(^XTMP("PSA",0)),U,2) $P(^(0),U,2)=DT
 I JOB192'>0 D             ;check old way of scheduling
 . S X="PSA IV ALL LOCATIONS",DIC(0)="MZ",DIC=19 D ^DIC
 . K DIQ,PSA S DA=+Y,DIC=19,DIQ="PSA",DR=200,DIQ(0)="IN" D EN^DIQ1
 . I $G(PSA(19,DA,200,"I"))>DT D
 . . S PSODA=1
 . . S:'$P($G(^XTMP("PSA",0)),U,2) $P(^(0),U,2)=DT
 ;drug stocked in Drug Acct Location?
 S PSOSITE=+$O(^PS(59,0))
 S PSODA(1)=$S($D(^PSD(58.8,+$O(^PSD(58.8,"AOP",PSOSITE,0)),1,+$P(^PSRX(RXP,0),U,6))):1,1:0)
 ;if appropriate update ^XTMP("PSA", for Drug Acct
 S QTY=$P($G(^PSRX(RXP,0)),"^",7)
 S QDRUG=+$P($G(^PSRX(RXP,0)),"^",6)
 Q:'QDRUG
 I $G(PSODA),$G(PSODA(1)),'$D(^PSRX("AR",$$NOW^XLFDT,RXP,0)) S ^XTMP("PSA",PSOSITE,QDRUG,DT)=$G(^XTMP("PSA",PSOSITE,QDRUG,DT))+QTY
 Q
