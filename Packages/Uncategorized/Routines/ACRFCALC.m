ACRFCALC ;IHS/OIRM/DSD/THL,AEF - SELECTED FINANCIAL CALCULATIONS;  [ 11/01/2001   9:44 AM ]
 ;;2.1;ADMIN RESOURCE MGT SYSTEM;;NOV 05, 2001
 ;;ROUTINE USED TO RECALCULATE ALL FINANCIAL TRANSACTIONS
EN ;EP;TO RECALCULATE DATABASE
 D ^XBKVAR
 D EN1
EXIT K ACRY,ACRDA,ACRQUIT,DIE,DA,DR,ACR2,ACRREQ,ACROBL,ACRSPT,ACRX,ACR,ACRDA
 Q
EN1 W @IOF
 W !,"Recalculation of the database can take from several minutes."
 W !
 S DIR(0)="Y"
 S DIR("A")="Sure you want to recalculate"
 S DIR("B")="NO"
 D DIR^ACRFDIC
 I ACRY'=1!$D(ACRQUIT)!$D(ACROUT) D  Q
 .W !!,"NO RECALCULATION HAS TAKEN PLACE."
 .H 2
 ;SYNCHRONIZE OBLIGATIONS, DISAPPROVAL/CANCELLATIONS
 W !!
 S ACRX=0
 F  S ACRX=$O(^ACROBL(ACRX)) Q:'ACRX  D
 .S X=$G(^ACROBL(ACRX,"APV"))
 .S ACR=0
 .F  S ACR=$O(^ACRSS("J",ACRX,ACR)) Q:'ACR  D
 ..S Y=$G(^ACRSS(ACR,"DT"))
 ..S Z=Y
 ..I $E(X)'="A" D
 ...S:$P(Y,U,9) $P(Y,U,9)=0
 ...S:$P(Y,U,21) $P(Y,U,21)=0
 ...I $E(X)="C"!($E(X)="D")!($P(X,U,3)="C")!($P(X,U,3)="D") D
 ....S $P(Y,U,4)=0,$P(Y,U,7)=0,$P(Y,U,21)=0
 ....Q:'$D(^ACRAL("E",ACRX))
 ....S ACRAL=0
 ....F  S ACRAL=$O(^ACRAL("E",ACRX,ACRAL)) Q:'ACRAL  I $P($G(^ACRAL(ACRAL,"DT")),U,9) S $P(^("DT"),U,9)="" W "*"
 ..Q:Z=Y
 ..W "."
 ..S ^ACRSS(ACR,"DT")=Y
 D ^ACRFCAL1
 I $E($G(IOST),1,2)="C-" W !,"Recalculating Requests.  Please wait."
 D ALBOBL
 I $E($G(IOST),1,2)="C-" W !,"Recalculating Sub-Allowances.  Please wait."
 D ALCOBL
 I $E($G(IOST),1,2)="C-" W !,"Recalculating Allowances.  Please wait."
 D ALLTOBL
 I $E($G(IOST),1,2)="C-" W !,"Recalculating Allotments.  Please wait."
 D APPOBL
 I $E($G(IOST),1,2)="C-" W !!,"RECALCULATION COMPLETED" H 2
 Q
APPOBL ;RECALCULATES ALL APPROPRIATIONS
 S ACRDA=0,DIE="^ACRAPP("
 F  S ACRDA=$O(^ACRAPP(ACRDA)) Q:'ACRDA  D
 .S ACR2=0
 .S (ACROBL,ACRREQ,ACRSPT)=0
 .F  S ACR2=$O(^ACROBL("PROP",ACRDA,ACR2)) Q:'ACR2  D
 ..S ACRREQ=ACRREQ+$G(^ACROBL(ACR2,0))
 ..S X=$G(^ACROBL(ACR2,"DT"))
 ..S ACRSPT=ACRSPT+$P(X,U,2)
 ..S ACROBL=ACROBL+$P(X,U,4)
 .L +^ACRAPP(ACRDA,"BA"):4 Q:'$T
 .S X=$G(^ACRAPP(ACRDA,"BA"))
 .S $P(X,U,2)=ACRREQ
 .S $P(X,U,3)=ACRSPT
 .S $P(X,U,7)=ACROBL
 .S ^ACRAPP(ACRDA,"BA")=X
 .L -^ACRAPP(ACRDA,"BA"):0
 Q
ALLTOBL ;RECALCULATES ALL ALLOWANCES
 S ACRDA=0,DIE="^ACRALW("
 F  S ACRDA=$O(^ACRALW(ACRDA)) Q:'ACRDA  D
 .S ACR2=0
 .S (ACROBL,ACRREQ,ACRSPT)=0
 .F  S ACR2=$O(^ACRSS("H",ACRDA,ACR2)) Q:'ACR2  D
 ..S X=$G(^ACRSS(ACR2,"DT"))
 ..S ACRREQ=ACRREQ+$P(X,U,4)
 ..S ACRSPT=ACRSPT+$P(X,U,21)
 ..S ACROBL=ACROBL+$P(X,U,9)
 .L +^ACRALW(ACRDA,"BA"):4 Q:'$T
 .S X=$G(^ACRALW(ACRDA,"BA"))
 .S $P(X,U,2)=ACRREQ
 .S $P(X,U,3)=ACRSPT
 .S $P(X,U,7)=ACROBL
 .S ^ACRALW(ACRDA,"BA")=X
 .L -^ACRALW(ACRDA,"BA"):0
 Q
ALCOBL ;RECALCULATES ALL SUB-ALLOWANCES
 S ACRDA=0,DIE="^ACRALC("
 F  S ACRDA=$O(^ACRALC(ACRDA)) Q:'ACRDA  D
 .S ACR2=0
 .S (ACROBL,ACRREQ,ACRSPT)=0
 .F  S ACR2=$O(^ACRSS("G",ACRDA,ACR2)) Q:'ACR2  D
 ..S X=$G(^ACRSS(ACR2,"DT"))
 ..S ACRREQ=ACRREQ+$P(X,U,4)
 ..S ACRSPT=ACRSPT+$P(X,U,21)
 ..S ACROBL=ACROBL+$P(X,U,9)
 .L +^ACRALC(ACRDA,"BA"):4 Q:'$T
 .S X=$G(^ACRALC(ACRDA,"BA"))
 .S $P(X,U,2)=ACRREQ
 .S $P(X,U,3)=ACRSPT
 .S $P(X,U,7)=ACROBL
 .S ^ACRALC(ACRDA,"BA")=X
 .L -^ACRALC(ACRDA,"BA"):0
 Q
ALBOBL ;RECALCULATES ALL DEPARTMENT ACCOUNTS
 S ACRDA=0,DIE="^ACRLOCB("
 F  S ACRDA=$O(^ACRLOCB(ACRDA)) Q:'ACRDA  D
 .S ACR2=0
 .S (ACROBL,ACRREQ,ACRSPT)=0
 .F  S ACR2=$O(^ACRSS("F",ACRDA,ACR2)) Q:'ACR2  D
 ..S X=$G(^ACRSS(ACR2,"DT"))
 ..S ACRREQ=ACRREQ+$P(X,U,4)
 ..S ACRSPT=ACRSPT+$P(X,U,21)
 ..S ACROBL=ACROBL+$P(X,U,9)
 .L +^ACRLOCB(ACRDA,"BA"):4 Q:'$T
 .S X=$G(^ACRLOCB(ACRDA,"BA"))
 .S $P(X,U,2)=ACRREQ
 .S $P(X,U,3)=ACRSPT
 .S $P(X,U,7)=ACROBL
 .S ^ACRLOCB(ACRDA,"BA")=X
 .L -^ACRLOCB(ACRDA,"BA"):0
 Q
