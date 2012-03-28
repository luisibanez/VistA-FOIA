AGMCRP6 ; IHS/ASDS/EFG - PRINT ALPHA LIST OF MEDICARE/MEDICAID HOLDERS ;   
 ;;7.1;PATIENT REGISTRATION;**4**;MAR 25,2008
 S AGIO=IO,AG("HAT")=""
PTS ;
 S DIR(0)="S^B:ALL BENEFICIARIES;A:ACTIVE PATIENTS ONLY;D:DECEASED AND INACTIVE PATIENTS ONLY"
 S DIR("A")="SELECT DESIRED ACCOUNTS"
 D ^DIR K DIR
 S AGPTS=Y
 Q:$D(DTOUT)!(Y="^")!(Y="/.,")!(Y="^^")
DEV S %ZIS="OPQ" D ^%ZIS I POP S IOP=ION D ^%ZIS Q
 G:'$D(IO("Q")) START K IO("Q") I $D(IO("S"))!($E(IOST)'="P") W *7,!,"Please queue to system printers." D ^%ZISC G DEV
 X ^%ZOSF("UCI") S ZTRTN="START^AGMCRP6",ZTUCI=Y,ZTIO="",ZTDESC="Alpha List MEDICARE/MEDICAID Holders for "_$P(^AUTTLOC(DUZ(2),0),U,2)_".",AGQIO=IO F G="AGQIO" S ZTSAVE(G)=""
 D ^%ZTLOAD G:'$D(ZTSK) DEV K AG,AGIO,AGQIO,G,ZTDESC,ZTIO,ZTRTN,ZTSK,ZTUCI D ^%ZISC
 Q
START ;EP - From TaskMan.
 S (DFN,AGTOT)=0 K ^TMP($J)
 F  S DFN=$O(^AUPNMCR(DFN)) Q:+DFN<1  D
 .S AGFLAG=0
 .;if there is an HRN for this person and data in VA PATIENT
 .I $D(^AUPNPAT(DFN,41,DUZ(2))),$D(^DPT(DFN,0)) D
 ..I AGPTS="A" D   ;active people only
 ...I $P($G(^AUPNPAT(DFN,41,DUZ(2),0)),U,3)="",$P($G(^DPT(DFN,.35)),U)="" S AGFLAG=1
 ..I AGPTS="D" D   ;deceased/inactive only
 ...I $P($G(^AUPNPAT(DFN,41,DUZ(2),0)),U,3)'=""!($P($G(^DPT(DFN,.35)),U)'="") S AGFLAG=1
 ..I AGPTS="B" S AGFLAG=1
 ..I AGFLAG S ^TMP($J,$P(^DPT(DFN,0),U),DFN)="",AGTOT=AGTOT+1
 I $D(AGQIO) F AGZ("I")=1:1 S IOP=AGQIO D ^%ZIS Q:'POP  H 30
 X ^%ZOSF("UCI") S X="UCI: "_$P(Y,",",1)
 D CTR^AG
 S AGUCI=X,AGPGPG=0,AG("LOC")=$P(^DIC(4,DUZ(2),0),U),AG("USR")=$P(^VA(200,DUZ,0),U),AG("USRLOC")=AG("USR")_$J("",40-($L(AG("LOC"))\2)-$L(AG("USR")))_AG("LOC"),AGBM=IOSL-10
 I $D(AGIO),AGIO=IO S AGBM=IOSL-4
 K AG("LOC"),AG("USR") D LINES^AG,NOW^AG S AGNM="",X="as of "_AGTIME D CTR^AG S AGTIME=X U IO D HDR
 S AGSTOP=""
 F  S AGNM=$O(^TMP($J,AGNM)) Q:AGNM=""  D  Q:AGSTOP
 .S DFN=0
 .F  S DFN=$O(^TMP($J,AGNM,DFN)) Q:DFN=""  D  Q:AGSTOP
 ..D PRINT
 ..I $Y>AGBM D
 ...D RTRN^AG
 ...I $D(DUOUT)!$D(DTOUT)!$D(DFOUT) S AGSTOP=1 G END1
 ...D HDR
 I 'AGSTOP D END
 Q
END W !!!,"TOTAL MEDICARE A & B PATIENTS: ",AGTOT K AG("HAT") D RTRN^AG W $$S^AGVDF("IOF")
END1 D ^%ZISC K ^TMP($J),A,AG,AGBM,AGDOB,AGIO,AGTIME,DA,AG("DENT"),DIC,DFN,DR,G,AGL,I,AG("LKDATA"),AG("LKPRINT"),AGNEW,AGNM,AGPCC,AGPGPG,AGTOT,AGUCI,AG("USRLOC"),X,Y D:$D(ZTQUEUED) KILL^%ZTLOAD
 Q
PRINT ;Print a Patient's MEDICARE file.
 ;DO THEY HAVE BOTH?
 Q:'$D(^AUPNMCR(DFN))!('$$MCDDATES(DFN))
 W "(REG) ",AGNM,?36,$P($G(^AUPNPAT(DFN,41,DUZ(2),0)),U,2)
 S Y=$$GET1^DIQ(2,DFN_",",.03,"I") X ^DD("DD") W ?64,Y
 W !,"(MCR) " W $$GET1^DIQ(9000003,DFN_",",2101)
 W ?49,$$GET1^DIQ(9000003,DFN_",",.03),$$GET1^DIQ(9000003,DFN_",",.04)
 W ?64,$$GET1^DIQ(9000003,DFN_",",2102)
 S REC=0
 F  S REC=$O(^AUPNMCR(DFN,11,REC)) Q:'REC  D
 .W !,"(MCR) " W ?14,$$GET1^DIQ(9000003.11,REC_","_DFN_",",.01)
 .W ?37,$$GET1^DIQ(9000003.11,REC_","_DFN_",",.03)
 .W ?49,$$GET1^DIQ(9000003.11,REC_","_DFN_",",.02)
 ;PRINT MCD INFO
 S REC=""
 F  S REC=$O(^AUPNMCD("B",DFN,REC)) Q:'REC  D
 .S AGMCDNM=$$GET1^DIQ(9000004,REC_",",2101)
 .S AGMCDDOB=$$GET1^DIQ(9000004,REC_",",2102)
 .S AGMCDNUM=$$GET1^DIQ(9000004,REC_",",.03)
 .W !!,"(MCD) ",AGMCDNM,?49,AGMCDNUM,?64,AGMCDDOB
 .S ELIGDT=0
 .F  S ELIGDT=$O(^AUPNMCD(REC,11,ELIGDT)) Q:'ELIGDT  D
 ..W !,"(MCD) "
 ..W ?14,$$GET1^DIQ(9000004.11,ELIGDT_","_REC_",",.01)
 ..W ?37,$$GET1^DIQ(9000004.11,ELIGDT_","_REC_",",.03)
 ..W ?49,$$GET1^DIQ(9000004.11,ELIGDT_","_REC_",",.02)
 W !,AG("-"),!
 Q
 ;
MCDDATES(DFN)  ;EP - CHECK FOR ANY MCD DATES
 N REC,EDT,MCDFLAG
 S MCDFLAG=0
 S REC=""
 F  S REC=$O(^AUPNMCD("B",DFN,REC)) Q:'REC  D
 .S EDT=0
 .Q:'$O(^AUPNMCD(REC,11,EDT))  ;NO DATE ENTRIES
 .S MCDFLAG=1
 Q MCDFLAG
 ;
HDR S AGPGPG=AGPGPG+1
 W $$S^AGVDF("IOF"),!!,AG("USRLOC"),?72,"page ",AGPGPG
 W !?17,"REGISTERED PATIENTS - MEDICARE/MEDICAID ACCOUNTS"
 W !,AGUCI,!,AGTIME
 W !!?17,"REPORT CONTAINS "_$S(AGPTS="B":"ALL BENEFICIARIES",AGPTS="A":"ACTIVE PATIENTS ONLY",AGPTS="D":"DECEASED AND INACTIVE PATIENTS ONLY")
 W !,"        NAME",?36,"CHART #",?49,"POL. NUMBER",!,"(TYPE)"
 W ?14,"ELIG DATE",?34,"COVERAGE",?49,"ELIG END DATE",?64,"DATE OF BIRTH"
 W !,AG("="),!
 Q
