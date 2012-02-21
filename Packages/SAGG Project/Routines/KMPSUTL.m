KMPSUTL ;OAK/KAK - SAGG Utilities ;01 SEP 97 11:15 am
 ;;1.8;SAGG PROJECT;**1,2,3**;Jul 26, 2004
 ;
STAT() ;-- check SAGG environment
 ;---------------------------------------------------------------------
 ;
 N ACTV,CURSTAT,DASH,DOW,DX,DY,FREQ,HORDT,LOC,MSG,NEED,OPT,OUT,PKGNMSPC
 N PLTFRM,POP,PROD,PTCH,RTN,SESSNUM,SITNUM,STAT,USER,VOL,VOLDA,X,Y
 ;
 D HOME^%ZIS
 W @IOF
 S (DX,DY)=0 X ^%ZOSF("XY")
 W ?31,"SAGG Environment",!
 S X="Version "_$P($T(+2),";",3)
 W ?(80-$L(X)\2),X,!!
 S (MSG,OUT)=0,SITNUM=$P($$SITE^VASITE(),U,3)
 S OPT="KMPS SAGG REPORT",STAT=$$TSKSTAT^KMPSUTL1(OPT),CURSTAT=$$CURSTAT(STAT)
 W ?5,"Current Status:",?35,$P(CURSTAT,U,2),!!
 I $D(^XTMP("KMPS",SITNUM,0)) D
 .S SESSNUM=^XTMP("KMPS",SITNUM,0),STRTDT=$P(SESSNUM,U,4),SESSNUM=+SESSNUM
 .W ?5,"Session Number:",?35,SESSNUM,!
 .S DOW=$$DOW^XLFDT(STRTDT)
 .W ?5,"Start Date:",?35,$$FMTE^XLFDT(STRTDT,"P")," (",DOW,")",!!
 ;
 W ?5,"SAGG Master Background Task:  ",OPT
 ; missing
 I +STAT=3 W " option is missing !",*7,!
 E  D
 .W !,?5,"Queued to run at:",?35
 .; not scheduled
 .I +STAT=1 W $P(STAT,U,2)
 .E  W $P(STAT,U,3)
 .W !,?5,"Rescheduling frequency:",?35
 .W $P(STAT,U,5)
 .; check to see if SAGG is not running on the weekend (Fri-Sun)
 .S DOW=$P(STAT,U,4),FREQ=$P(STAT,U,6)
 .I (DOW<0)!((DOW>0)&(DOW<5))!(FREQ<0)!(FREQ'="28D") D
 ..S MSG=1
 ..W !,?5,"***It is STRONGLY recommended that this job be rescheduled to run",!
 ..W ?8,"over the weekend every 28 days.***",!
 .W !,?5,"Task ID:",?35,$P(STAT,U,7)
 .W !,?5,"Queued by:",?35,$P(STAT,U,8),!
 .I $P(STAT,U,9)="NOT ACTIVE" D
 ..S MSG=1
 ..W ?5,"***The user that originally queued this task is no longer active.",!
 ..W ?8,"Therefore the 'SAGG Master Background Task' [KMPS SAGG REPORT]",!
 ..W ?8,"must be scheduled again by an active user.***",!
 ;
 W !,?5,"Temporary collection global",!,?7,"^XTMP(""KMPS""):"
 W ?35,$S($D(^XTMP("KMPS",SITNUM,0)):"DATA PRESENT",1:"EMPTY"),!
 S PLTFRM=$$MPLTF^KMPSUTL1,PROD=$P(^%ZOSF("PROD"),",")
 I PLTFRM="DSM" D
 .S LOC=$G(^KMPS(8970.1,1,0))
 .W ?7,"Global Location:"
 .W ?35,$S($P(LOC,U,3)="":PROD,1:$P(LOC,U,3))
 .W ",",$S($P(LOC,U,2)="":"UNKNOWN",1:$P(LOC,U,2)),!
 W !
 ;
 ; show members that will receive SAGG messages
 D MAILGRP
 ;
 Q:$$CONT^KMPSUTL1(1)
 ;
 W @IOF
 S (DX,DY)=0 X ^%ZOSF("XY")
 W ?27,"SAGG Environment (cont.)",!!
 W ?5,"SAGG Project collection routines will monitor the following:",!!,?7
 S DASH=0,VOL=""
 F  S VOL=$O(^KMPS(8970.1,1,1,"B",VOL)) Q:VOL=""  D
 .S VOLDA=$O(^KMPS(8970.1,1,1,"B",VOL,0))
 .S LOC=$P(^KMPS(8970.1,1,1,VOLDA,0),U,2)
 .S:LOC="" LOC=PROD
 .W:DASH " - "
 .W $S(PLTFRM="DSM":LOC_",",1:""),VOL
 .S DASH=1
 .I $X>60 S DASH=0 W !,?7
 W !!
 ;
 I $Y>(IOSL-3) Q:$$CONT^KMPSUTL1(1)  W @IOF S (DX,DY)=0 X ^%ZOSF("XY") W ?27,"SAGG Environment (cont.)",!!
 ;
 I '+CURSTAT&$D(^XTMP("KMPS","START")) D  W !!
 .W ?5,"SAGG Project collection routines are still running on:",!!,?7
 .S DASH=0,VOL=""
 .F  S VOL=$O(^XTMP("KMPS","START",VOL)) Q:VOL=""  D
 ..W:DASH " - "
 ..W VOL
 ..S DASH=1
 ..I $X>60 S DASH=0 W !,?7
 ;
 ; check for any reported errors
 I $D(^XTMP("KMPS","ERROR")) D  W !!
 .W ?5,"SAGG Project collection routines have recorded an error on",!
 .W ?5,"the following Volume Set(s):",!!,?7
 .S DASH=0,VOL=""
 .F  S VOL=$O(^XTMP("KMPS","ERROR",VOL)) Q:VOL=""  D
 ..W:DASH " - "
 ..W VOL
 ..S DASH=1
 ..I $X>60 S DASH=0 W !,?7
 ;
 ; check to see if SAGG was told to stop or has reported errors
 I +CURSTAT>3 Q:$$CONT^KMPSUTL1(1)  D
 .W @IOF
 .S (DX,DY)=0 X ^%ZOSF("XY")
 .W ?27,"SAGG Environment (cont.)",!!!!
 .I +CURSTAT=4 D
 ..W ?5,"SAGG has been running over a day. Use ^%S",$S(PLTFRM="DSM":"Y",1:"S")," and check to see if",!
 ..W ?5,"the KMPSGE routine is still running.",!!
 .W ?5,"NOTE:  Any incomplete data that has been collected will be",!
 .W ?12,"deleted automatically the next time that SAGG runs.",!
 .I $D(^XTMP("KMPS","ERROR")) W ?12,"First determine the cause of any volume set errors.",!
 .W ?12,"Reschedule SAGG to collect global data if necessary.",!
 ;
 Q:$$CONT^KMPSUTL1(1)
 ;
 W @IOF
 S (DX,DY)=0 X ^%ZOSF("XY")
 W ?27,"SAGG Environment (cont.)",!,?32,"Patch Status",!!
 D VERPTCH^KMPSUTL1("S",.PTCH)
 I +$G(PTCH)=-1 W "<No routine patch information available>",! Q
 W ?20,"Currently",?51,"Need to",!
 W ?2,"Routine",?20,"Installed",?51,"Install",!
 S RTN=0,DASH=$$REPEAT^XLFSTR("-",IOM)
 W DASH,!!
 F  S RTN=$O(PTCH(RTN)) Q:RTN=""  D  W !
 .N REL,SITE
 .S REL=$P(PTCH(RTN),U,6)_"*"_$P(PTCH(RTN),U,2)_" "_$P(PTCH(RTN),U,3)
 .S NEED=$P(PTCH(RTN),U,6)_"*"_$P(PTCH(RTN),U,2)_" **"_$P(PTCH(RTN),U,7)_"**"
 .S SITE=$P(PTCH(RTN),U,6)_"*"_$P(PTCH(RTN),U,4)_" "_$P(PTCH(RTN),U,5)
 .W ?2,RTN
 .I +PTCH(RTN)=2 W ?15,"<<<missing routine>>>"
 .E  W ?14,SITE
 .I +PTCH(RTN) W ?48,NEED
 .E  W ?54,"Ok"
 .W !
 W DASH,!
 S X=$$CONT^KMPSUTL1()
 Q
 ;
CURSTAT(STAT)   ;-- current status
 ;---------------------------------------------------------------------
 ; input:  STAT (optional) = data from $$TSKSTAT^KMPSUTL1
 ; output: See codes below
 ;---------------------------------------------------------------------
 ;
 N RESULT,SITNUM,STRTDT
 ;
 S RESULT="",SITNUM=^DD("SITE",1),STRTDT=$G(^XTMP("KMPS",SITNUM,0))
 ;
 I $D(^XTMP("KMPS","ERROR")) Q "6^ERRORS RECORDED"
 I $D(^XTMP("KMPS","STOP")) Q "7^STOPPING"
 I $D(^XTMP("KMPS","START")) L +^XTMP("KMPS"):0 I $T L -^XTMP("KMPS") Q "5^DID NOT COMPLETE"
 I +STRTDT I +$H-STRTDT>2 Q "5^DID NOT COMPLETE"
 I +STRTDT I +$H-STRTDT>1 Q "4^RUNNING TOO LONG"
 I $D(^XTMP("KMPS","START")) Q "0^RUNNING"
 I $D(STAT) Q $P(STAT,U,1,2)
 E  Q "3^NOT RUNNING"
 Q "9^UNKNOWN"
 ;
STOP ;-- stop SAGG collection routines
 ;
 N DIR,X,Y
 ;
 I '$D(^XTMP("KMPS","START")) D  Q
 .W !!,?5,"The SAGG Project collection routines are not running.",!
 E  W !!,"Current status of SAGG is ",$P($$CURSTAT(),U,2),!
 S DIR("A")="Do you wish to manually STOP the SAGG Project collection routines (Y/N)",DIR("B")="N",DIR(0)="Y"
 D ^DIR W !
 I Y D
 .S ^XTMP("KMPS","STOP")=1
 .W !,?5,"The SAGG Project collection routines have been notified to begin an"
 .W !,?5,"orderly shut-down process.",!
 Q
 ;
FILE ;-- modifies data in the SAGG PROJECT file #8970.1
 ;
 N DA,DIC,DIE,DLAYGO,DR,PLTFRM,X
 ;
 S PLTFRM=$$MPLTF^KMPSUTL1
 I PLTFRM="DSM" D
 .W !!,"Please specify the Volume Set and UCI which will hold the ^XTMP(""KMPS"") global.",!
 .S DIE="^KMPS(8970.1,",DLAYGO=8970.1,DA=1,DR=".02;.025"
 .D ^DIE
 W !!,"Specify the ",$S(PLTFRM="DSM":"Volume Sets",1:"Directories")
 W " which hold your VistA production globals.",!!,"For example:",!!,?5
 I PLTFRM="CWINNT" W "Cache for Windows NT =>  W:\VAA, W:\VBB, W:\VCC ... V:\Vxx"
 I PLTFRM="CVMS" W "Cache for OpenVMS =>  _$1$DKAn:[CACHSYS.VAA] ... _$1$DKAx:[CACHSYS.Vxx]"
 I PLTFRM="DSM" W "DSM =>  ROU, VAA, VBB, VCC ... Vxx"
 I PLTFRM="UNK" W "Specify all locations of VistA globals"
 W !!,"Do NOT specify 'test/training' ",$S(PLTFRM="DSM":"Volume Sets",1:"Directories")," (i.e., UTL,TST, etc.).",!
 S DIE="^KMPS(8970.1,",DA=1,DR=.03
 S:PLTFRM'="DSM" DR(2,8970.11)=.01
 D ^DIE
 Q
 ;
MAILGRP ;-- display mail group members that will receive mail messages
 ;
 N DA,MEMGDA
 ;
 W ?5,"KMP-CAPMAN mail group:"
 S DA=$O(^XMB(3.8,"B","KMP-CAPMAN",0))
 I '+DA W "MISSING",! Q
 D MEMBER(DA,35)
 ; check MEMBER GROUPS field #11
 S MEMGDA=0
 F  S MEMGDA=$O(^XMB(3.8,DA,5,"B",MEMGDA)) Q:'MEMGDA  D
 .S MEMGRPNM=$P($G(^XMB(3.8,MEMGDA,0)),U)
 .W ?35,"G.",MEMGRPNM," (MEMBER GROUP)",!
 .D MEMBER(MEMGDA,37)
 ; check MEMBERS - REMOTE field #12
 S MEMREM=""
 F  S MEMREM=$O(^XMB(3.8,DA,6,"B",MEMREM)) Q:MEMREM=""  D
 .W ?35,MEMREM," (REMOTE)",!
 ; check DISTRIBUTION LIST field #13
 S DISLSTDA=0
 F  S DISLSTDA=$O(^XMB(3.8,DA,7,"B",DISLSTDA)) Q:'DISLSTDA  D
 .S DISLIST=$P($G(^XMB(3.816,DISLSTDA,0)),U)
 .W ?35,DISLIST," (DISTRIBUTION LIST)",!
 ; check FAX RECIPIENT field #14
 S FAXRDA=0
 F  S FAXRDA=$O(^XMB(3.8,DA,8,"B",FAXRDA)) Q:'FAXRDA  D
 .S FAXRCPT=$P($G(^AKF("FAXR",FAXRDA,0)),U)
 .W ?35,FAXRCPT," (FAX RECEIPIENT)",!
 ; check FAX GROUP field #15
 S FAXGRPDA=0
 F  S FAXGRPDA=$O(^XMB(3.8,DA,9,"B",FAXGRPDA)) Q:'FAXGRPDA  D
 .S FAXGRP=$P($G(^AKF("FAXG",FAXGRPDA,0)),U)
 .W ?35,FAXGRP," (FAX GROUP)",!
 Q
 ;
MEMBER(IEN,TAB) ;-- display mail group members
 ;---------------------------------------------------------------------
 ; input: IEN = entry number of mail group
 ;---------------------------------------------------------------------
 ;
 N NAME,NMARRY,USER
 ;
 ; check MEMBER field #2
 S USER=0
 F  S USER=$O(^XMB(3.8,DA,1,"B",USER)) Q:'USER  D
 .S NAME=$P($G(^VA(200,USER,0)),U)
 .I NAME'="" S NMARRY(NAME)=USER
 I '$D(NMARRY) W ?35,"NO USERS",! Q
 S NAME=""
 F  S NAME=$O(NMARRY(NAME)) Q:NAME=""  D
 .S USER=NMARRY(NAME)
 .W ?TAB,NAME
 .S USER=$$ACTIVE^XUSER(USER) I '+USER W " (",$P(USER,U,2),")"
 .W !
 Q
 ;
HELP ;-- extended help for SAGG PROJECT file VOLUME SET TO MONITOR (.01) field
 ;
 N PLTFRM
 ;
 S PLTFRM=$$MPLTF^KMPSUTL1
 W !," This field will contain the name of the ",$S(PLTFRM="DSM":"Volume Sets",1:"Directories")
 W " that the site wants",!," to monitor with the SAGG Project collection routines. The site should",!
 W " specify only the ",$S(PLTFRM="DSM":"Volume Sets",1:"Directories")
 W " which hold their VistA production globals:",!!
 W " For example:",!!
 I PLTFRM="CWINNT" W "    Cache for Windows NT =>  W:\VAA, W:\VBB, W:\VCC ... V:\Vxx",!!
 I PLTFRM="CVMS" W "    Cache for OpenVMS =>  _$1$DKAn:[CACHSYS.VAA] ... _$1$DKAx:[CACHSYS.Vxx]",!!
 I PLTFRM="DSM" W "    DSM =>  ROU, VAA, VBB ... Vxx",!!
 W " Do NOT specify 'test/training' ",$S(PLTFRM="DSM":"Volume Sets",1:"Directories")," (e.g., UTL, TST, etc.).",!
 Q
 ;
PTCHINFO        ; -- patch information: routine name ^ current version ^ current patch(es) ^ package namespace
 ;;KMPSGE^1.8^**1,2,3**^KMPS
 ;;KMPSLK^1.8^**1,2,3**^KMPS
 ;;KMPSUTL^1.8^**1,2,3**^KMPS
 ;;KMPSUTL1^1.8^**1,2,3**^KMPS
 ;;%ZOSVKSD^8.0^**121,197,268**^XU
 ;;%ZOSVKSE^8.0^**90,94,197,268**^XU
 ;;%ZOSVKSS^8.0^**90,94,197,268**^XU
 ;;
 
