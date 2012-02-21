ECXPURG ;BIR/CML-Driver for Purge of DSS Data from Local Extract & Holding Files ; [ 12/03/96  5:19 PM ]
 ;;3.0;DSS EXTRACTS;**9,24,33,35,49**;Dec 22, 1997
EN ;entry point from option
 W @IOF,!!,"This option will allow you to purge:"
 W !,"1. individual or a range of DSS extracts, or"
 W !,"2. data that resides in the ""holding files"" for the IVP and UDP extracts."
 W !!,"Care must be taken for several reasons:"
 W !!,"-  You can purge ANY existing extract.  This includes transmitted and non-"
 W !,"   transmitted extracts as well as extracts that did not run to completion"
 W !,"   due to errors or system problems."
 W !,"-  Choosing a range of extracts (or a broad date range for the ""holding"
 W !,"   files"") could mean an excessively large number of records and be very"
 W !,"   CPU intensive.  Please be sure to queue this purge for off-hours and"
 W !,"   limit the number of extracts to be purged per a single queued session."
 W !,"-  The IVP and UDP ""holding"" files are intermediate files that are"
 W !,"   populated ""realtime"" by inpatient pharmacy activity.  These files are"
 W !,"   then used to generate the IVP and UDP extracts and CANNOT be recreated."
 W !,"   Once they are purged for a date range, extracts can no longer be"
 W !,"   generated for that time period."
 ;
 K DIR W !
 S DIR(0)="SAM^E:Extract Files;I:IVP Holding File;U:UDP Holding File"
 S DIR("A")="Purge (E)xtract files, (I)VP data, or (U)DP data? "
 D ^DIR K DIR G:$D(DIRUT) QUIT S ECY=Y
 I ECY="E" D ^ECXPURG1 I $D(ECLOC) S ZTSAVE("ECLOC(")="",ZTIO="",ZTRTN="PUR1^ECXPURG",ZTDESC="DSS - Purge of Extract Files" D QUE
 I ECY="I" D DATES^ECXPURG1 I $D(ECBDT)&($D(ECEDT)) S (ZTSAVE("ECBDT"),ZTSAVE("ECEDT"))="",ZTIO="",ZTRTN="PUR2^ECXPURG",ZTDESC="DSS - Purge of IVP Holding File" D QUE
 I ECY="U" D DATES^ECXPURG1 I $D(ECBDT)&($D(ECEDT)) S (ZTSAVE("ECBDT"),ZTSAVE("ECEDT"))="",ZTIO="",ZTRTN="PUR3^ECXPURG",ZTDESC="DSS - Purge of UDP Holding File" D QUE
QUIT ;
 K %X,%Y,EC,ECBDT,ECDATE,ECDT,ECEDT,ECEX,ECFR,ECLOC,ECRC,ECTO,ECTRN,ECTYP,ECY,HDT,HI,JJ,LN,LO,PG,QFLG,SS,X,Y,ZTSK
 K ECXDIV
 S:$D(ZTQUEUED) ZTREQ="@"
 Q
QUE W $C(7),$C(7),!!?3,"<<This purge should be queued to run during non-peak hours.>>",!
 D ^%ZTLOAD
 I $D(ZTSK) W !,"Request queued as Task #",ZTSK,".",!
 Q
 ;
PUR1 ; entry point for queued purge job of extract files
 S ECDA=0 F  S ECDA=$O(ECLOC(ECDA)) Q:'ECDA  D
 .S ECFILE=^ECX(727,ECDA,"FILE"),ECJ=0
 .I ECFILE=727.827 D
 ..S DA(1)=1
 ..S DA=$O(^ECX(728,DA(1),"CBOC","B",ECDA,0))
 ..S DIK="^ECX(728,"_DA(1)_","_"""CBOC"""_","
 ..I DA'="" D ^DIK K DIK,DA
 .F  S ECJ=$O(^ECX(ECFILE,"AC",ECDA,ECJ)) Q:'ECJ  D
 ..S DIK="^ECX("_ECFILE_",",DA=ECJ D ^DIK K DIK,DA
 .I ECFILE=727.816 S ECFILE=727.818,ECJ=0 D
 ..F  S ECJ=$O(^ECX(ECFILE,"AC",ECDA,ECJ)) Q:'ECJ  D
 ...S DIK="^ECX("_ECFILE_",",DA=ECJ D ^DIK K DIK,DA
 .S ^ECX(727,ECDA,"PURG")=DT
 D QUIT
 Q
 ;
PUR2 ; entry point for queued purge job of IVP holding file (#728.113)
 F ECDT=ECBDT-1:0 S ECDT=$O(^ECX(728.113,"A",ECDT)) Q:'ECDT  Q:ECDT>ECEDT  S ECPT=0 F  S ECPT=$O(^ECX(728.113,"A",ECDT,ECPT)) Q:'ECPT  D
 .S ECOR=0 F  S ECOR=$O(^ECX(728.113,"A",ECDT,ECPT,ECOR)) Q:'ECOR  D
 ..S ECREC=0 F  S ECREC=$O(^ECX(728.113,"A",ECDT,ECPT,ECOR,ECREC)) Q:'ECREC  D
 ...S DIK="^ECX(728.113,",DA=ECREC D ^DIK K DIK,DA
 D QUIT
 Q
 ;
PUR3 ; entry point for queued purge job of UDP holding file (#728.904)
 F ECDT=ECBDT-1:0 S ECDT=$O(^ECX(728.904,"A",ECDT)) Q:'ECDT  Q:ECDT>ECEDT  D
 .S ECREC=0 F  S ECREC=$O(^ECX(728.904,"A",ECDT,ECREC)) Q:'ECREC  D
 ..S DIK="^ECX(728.904,",DA=ECREC D ^DIK K DIK,DA
 D QUIT
 Q
