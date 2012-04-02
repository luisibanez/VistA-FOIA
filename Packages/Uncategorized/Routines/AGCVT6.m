AGCVT6 ; IHS/ASDS/EFG - ONE TIME, EXPORT PATIENTS WITH MEDICAID COVERAGE ;  
 ;;7.1;PATIENT REGISTRATION;;AUG 25,2005
 W !,"IF YOU ARE SURE YOU WANT TO RUN THIS ROUTINE",!!,"PLEASE ENTER AT 'ENTRY', I.E. 'D ENTRY^AGCVT6'.",! Q
CHKHRN S DUZ2=DUZ(2)
 Q:$D(^AUPNPAT(DFN,41,DUZ2))  S DUZ2=0 F J=0:0 S DUZ2=$O(^(DUZ2)) Q:'+DUZ2  Q:$P(^AUPNPAT(DFN,41,DUZ2,0),U,2)]""
 Q
ENTRY ;EP
 W $$S^AGVDF("IOF"),!!?5,"THIS REGISTRATION UTILITY READS THRU THE 'B' INDEX OF THE",!!?5,"MEDICAID ELIGIBLE FILE (^AUPNMCD), AND SETS ^AGPATCH SO MEDICAID",!!?5,"ELIGIBLE PATIENTS ARE EXPORTED DURING THE NEXT REGISTRATION EXPORT.",!!
 W ?5,"THE ENTRIES IN ^AGPATCH WILL BE YESTERDAY'S DATE SO YOU CAN RUN",!?5,"THIS ROUTINE AND THE EXPORT ON THE SAME DATE.",!!
 W ?10,"DO YOU WANT TO CONTINUE? (Y/N)  N // " D READ G END:$D(DLOUT)!$D(DUOUT)!$D(DFOUT)!$D(DTOUT)!("Nn"[$E(Y)),ENTRY:$D(DQOUT)!("Yy"'[$E(Y))
USER W !! S DIC="^VA(200,",DIC("A")="Who are you?",DIC(0)="AEFMNQ" D ^DIC G:+Y<0 END S DUZ=+Y
FACILITY W !! S DIC="^AUTTLOC(",DIC(0)="QAZEM",DIC("A")="Set MEDICAID export for which FACILITY? " D ^DIC K DIC("A") G:+Y<0 END S (DUZ2,DUZ(2))=+Y
QUE W !!,"Do you want to q this process? (Y/N)  Y // " D READ S Y=$E(Y_"Y") G END:$D(DTOUT)!$D(DFOUT),FACILITY:$D(DUOUT),START:Y="N" I $D(DQOUT)!("YN"'[Y) W !!,*7,"You can 'q' this process to TaskMan to run at another time.",! G QUE
DEV X ^%ZOSF("UCI") S ZTRTN="START^AGCVT6",ZTUCI=Y,ZTIO="",ZTDESC="Set AGPATCH to export all MEDICAID eligibles." S ZTSAVE=""
 D ^%ZTLOAD G:'$D(ZTSK) QUE W !!,"Task Number = ",ZTSK,!!,"Press RETURN..." D READ K G,ZTDESC,ZTIO,ZTRTN,ZTSAVE,ZTSK,ZTUCI D ^%ZISC Q
START ;EP - TaskMan.
 I '$D(AGDATE) S %DT="",X="T-1" D ^%DT S AGDATE=Y
 S AGTOTAL=0 I '$D(ZTQUEUED) W !! S IOP=ION D ^%ZIS,WAIT^DICD S DX=$X,DY=$Y+1
 F DFN=0:0 S DFN=$O(^AUPNMCD("B",DFN)) Q:'DFN  D CHKHRN I +DUZ2,'$D(^AGPATCH(AGDATE,DUZ2,DFN)) S ^(DFN)="",AGTOTAL=AGTOTAL+1 I '$D(ZTQUEUED) X XY W AGTOTAL
 I '$D(ZTQUEUED) W " MEDICAID's added to ^AGPATCH."
END K %DT,AGDATE,DFN,DFOUT,DLOUT,DQOUT,DTOUT,DUOUT,DUZ2,DX,DY,J,AGTOTAL,X,XY,Y D:$D(ZTQUEUED) KILL^%ZTLOAD
 Q
READ K DFOUT,DTOUT,DUOUT,DQOUT,DLOUT R Y:$S($D(DTIME):DTIME,1:300) I '$T W *7 R Y:5 G READ:Y="." I '$T S (DTOUT,Y)="" Q
 S:Y="/.," (DFOUT,Y)="" S:Y="" DLOUT="" S:Y="^" (DUOUT,Y)="" S:Y?1"?".E!(Y["^") (DQOUT,Y)=""
 Q
COMMENT ;This routine is a one-time-only run.
 ;It reads thru the 'B' index of the MEDICAID ELIGIBLE
 ;file (^AUPNMCD) to look for patients who are eligible for
 ;MEDICAID, flag them for inclusion with next export, to ensure
 ;eligibile patients are recorded at DPSC.
 ;                                    RPMS/GTH
TEST S AGDATE=2890325 K ^AGPATCH(AGDATE) G ENTRY