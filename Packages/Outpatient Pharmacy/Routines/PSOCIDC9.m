PSOCIDC9	;BIR/LE - continuation of activity log corrections ;2/28/05 12:50pm
	;;7.0;OUTPATIENT PHARMACY;**239**;DEC 1997
	;
RPT	;
	N JOBN,NAMSP,ZTDESC,ZTRTN
	S NAMSP=$$NAMSP^PSOCIDC7
	S JOBN="CIDC ACTIVITY LOG CORRECTION"
	L +^XTMP(NAMSP):0 I '$T D  Q
	.W !,JOBN_" job for PSO*7*239 is still running.  Halting..."
	L -^XTMP(NAMSP)
	W !!,"This report reflects all prescriptions where the activity and"
	W !,"copay activity logs were corrected.  For detailed information,"
	W !,"please view the activity and copay logs on the prescriptions."
	;
	W !!,"You may queue the report to print, if you wish.",!
	;
DVC	K %ZIS,POP,IOP S %ZIS="QM" D ^%ZIS I $G(POP) W !!,"Nothing queued to print.",! G DONE
QUEUE	I $D(IO("Q")) S ZTRTN="START^PSOCIDC7",ZTDESC=JOBN_" CIDC Activity Logs Corrections" D ^%ZTLOAD K %ZSI W !,"Report queued to print.",! G DONE
START	;
	U IO
	N BLDT,RXO,NAMSP,PSOFILL,PSODFN,PSONAM,PSOOUT,PSODV,RXP,SSN,PSODIV,PSODV
	N CANCEL,JOBN,PSOPATID,PSOTOT,PSOTOTC
	S NAMSP=$$NAMSP^PSOCIDC7
	;****************************************************** for testing only - next line
	S JOBN="CIDC ACTIVITY LOGS CORRECTION"
	S PSOOUT=0,PSODV=$S($E(IOST)="C":"C",1:"P")
	S PSOPGCT=0,PSOPGLN=IOSL-7,PSOPGCT=1
	S BLDT=$P($G(^XTMP(NAMSP,0,"LAST")),"^",2)
	I '$D(DT) S DT=$$NOW^XLFDT
	D TITLE
	S (PSOTOT,PSOTOTC,PSONAM)=""
	F  S PSONAM=$O(^XTMP(NAMSP,"LOG",PSONAM)) Q:PSONAM=""  D
	.S PSODFN=""
	.F  S PSODFN=$O(^XTMP(NAMSP,"LOG",PSONAM,PSODFN)) Q:PSODFN=""  D
	..S RXP=""
	..F  S RXP=$O(^XTMP(NAMSP,"LOG",PSONAM,PSODFN,RXP)) Q:RXP=""  D
	...D FULL Q:$G(PSOOUT)  S PSONAME=$P($G(^DPT(PSODFN,0)),"^")
	...S CONLY="" I '$D(^XTMP(NAMSP,RXP,"A"))&($D(^XTMP(NAMSP,RXP,"COPAY"))) S CONLY=1
	...I CONLY S PSOTOTC=PSOTOTC+1
	...W !,$E(PSONAME,1,14)
	...D PRTSSN
	...S RXO=$P($G(^PSRX(RXP,0)),"^")
	...W ?41," ",RXO  ;," (",PSOFILL,")"
	W:PSOTOT'="" !,"Total number of prescriptions modified: ",PSOTOT
	G END
	;
FULL	;
	I ($Y+7)>IOSL&('$G(PSOOUT)) D TITLE
	Q
	;
TITLE	;
	I $G(PSODV)="C",$G(PSOPGCT)'=1 W ! K DIR S DIR(0)="E" D ^DIR K DIR I 'Y S PSOOUT=1 Q
	;
	W @IOF D
	. W !,"Patch PSO*7*239 - Corrected Activity and Copay Activity logs",!!
	. W "Note that this report reflects all prescriptions where the activity and/or",!
	. W "copay activity logs were corrected. For detailed information, please view",!
	. W "the activity and copay activity log on the prescription.",!
	;
	S Y=DT X ^DD("DD") W !,"Date printed: ",Y,?70,"Page: ",PSOPGCT,!
	F MJT=1:1:79 W "="
	;W !?55,"Updated",?67,"Updated"
	;W !,?55,"Activity",?67,"COPAY"
	W !,"PATIENT NAME     (SSN)       DIV",?42,"RX# " ;,?55,"Log",?67,"Activity Log"   ;,?55,"RELEASE DATE",?69,"REL   BILL"
	W !,"---------------  -------  --------------",?42,"------------"
	;W ?55,"------------",?67,"-----------"
	S PSOPGCT=PSOPGCT+1
	Q
	;
END	;
	I '$G(PSOOUT),$G(PSODV)="C" W !!,"** End of Report **" K DIR S DIR(0)="E",DIR("A")="Press Return to continue" D ^DIR K DIR
	I $G(PSODV)="C" W !
	E  W @IOF
DONE	;
	K MJT,PSOPGCT,PSOPGLN,Y,DIR,X,IOP,POP,IO("Q"),DIRUT,DUOUT,DTOUT
	D ^%ZISC S:$D(ZTQUEUED) ZTREQ="@"
	Q
	;
PRTSSN	;
	S SSN=$P(^DPT(PSODFN,0),"^",9),SSN=$E(SSN,$L(SSN)-3,$L(SSN))
	S PSOPATID=$E(PSONAM,1)_SSN
	S PSODIV=$P($G(^PSRX(RXP,2)),"^",9)
	S:PSODIV'="" PSODIV=$P($G(^PS(59,PSODIV,0)),"^",1)
	W ?17,"("_PSOPATID_")"_"  "_$E(PSODIV,1,15)
	Q
	;
