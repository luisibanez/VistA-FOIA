ECXPLBB ;DALOI/KML - DSS BLOOD BANK PRE-EXTRACT AUDIT REPORT ;12/10/2004
 ;;3.0;DSS EXTRACTS;**78**;Dec 22, 1997
 ;Per VHA Directive 97-033 this routine should not be modified.  Medical Device # BK970021
 ;entry point from option
 D SETUP^ECXLBB I ECFILE="" Q
 N ECXINST
 D DATES
 Q:ECED']""&(ECSD']"")
 N ECXPOP S ECXPOP=0 D QUE Q:ECXPOP
 ;
START ;  entry point from tasked job
 ; get LAB DATA and build temporary global ^TMP("ECXLBB",$J)
 N ECTRSP,ECADMT,ECTODT,ECXRPT,ECOUT,ECXSTR,ECRDT,ECLINE,ECPG,ECQUIT
 N ECD,ECXDFN,ECARRY,EC66,ECERR,ECTRFDT,ECTRFTM,ECX,ECINOUT,ECXJOB
 S ECXJOB=$J
 K ^TMP("ECXLBB",ECXJOB)
 U IO
 I $E(IOST,1,2)="C-" W !,"Retrieving records... "
 S ECXRPT=1 D AUDRPT^ECXLBB
OUTPUT ; entry point called by EN tag
 I '$D(^TMP("ECXLBB",ECXJOB)) W !,"There were no records that met the date range criteria" Q
 S (ECPG,ECDATE,ECQUIT,ECXDFN)=0,ECLINE="",$P(ECLINE,"=",80)="="
 S ECSDN=$$FMTE^XLFDT(ECSD,9),ECEDN=$$FMTE^XLFDT(ECED,9),ECRDT=$$FMTE^XLFDT(DT,9)
 W:$E(IOST,1,2)="C-" @IOF D HED
 F  S ECXDFN=$O(^TMP("ECXLBB",ECXJOB,ECXDFN)) Q:'ECXDFN  F  S ECDATE=$O(^TMP("ECXLBB",ECXJOB,ECXDFN,ECDATE))  Q:'ECDATE  Q:ECQUIT  S ECXSTR=^(ECDATE) D PRINT
 D ^ECXKILL
 Q
 ;
PRINT ;
 I $Y+5>IOSL D  Q:ECQUIT
 . I $E(IOST,1,2)["C-" S DIR(0)="E" D ^DIR K DIR I 'Y S ECQUIT=1 Q
 . W @IOF D HED
 W !,$P(ECXSTR,"^",5),?7,$P(ECXSTR,"^",4),?19,$P(ECXSTR,"^",16)
 W ?27,$$FMTE^XLFDT($$HL7TFM^XLFDT($P(ECXSTR,"^",8)),2)
 W ?36,$P(ECXSTR,"^",11),?47,$J(+$P(ECXSTR,"^",12),2),?54
 W $P(ECXSTR,"^",17),?67,$P(ECXSTR,"^",18)
 Q
 ;
HED ;
 S ECPG=ECPG+1
 W !,"LBB Pre-Extract Audit Report",?72,"Page",$J(ECPG,3)
 W !,ECSDN," - ",ECEDN,?58,"Run Date:",$J(ECRDT,12)
 W !,?27,"Transf",?44,"Number"
 W !,"Name",?10,"SSN",?18,"FDR LOC",?27,"Date",?36,"COMP"
 W ?44,"of Units",?54,"IPD",?67,"IP"
 W !,ECLINE
 Q
DATES ;
 N OUT,CHKFLG
 I '$D(ECNODE) S ECNODE=7
 I '$D(ECHEAD) S ECHEAD=" "
 W @IOF,!,"LBB Pre-Extract Audit Report Information for DSS",!!
 S:'$D(ECINST) ECINST=+$P(^ECX(728,1,0),U)
 S ECXINST=ECINST
 K ECXDIC S DA=ECINST,DIC="^DIC(4,",DIQ(0)="I",DIQ="ECXDIC",DR=".01;99"
 D EN^DIQ1 S ECINST=$G(ECXDIC(4,DA,99,"I")) K DIC,DIQ,DA,DR,ECXDIC
 S ECLDT=$S($D(^ECX(728,1,ECNODE)):$P(^(ECNODE),U,ECPIECE),1:2610624)
 S:ECLDT="" ECLDT=2610624
 S ECOUT=0 F  S (ECED,ECSD)="" D  Q:ECOUT
 . K %DT S %DT="AEX",%DT("A")="Starting with Date: " D ^%DT
 . I Y<0 S ECOUT=1 Q
 . S ECSD=Y
 . K %DT S %DT="AEX",%DT("A")="Ending with Date: " D ^%DT
 . I Y<0 S ECOUT=1 Q
 . I Y<ECSD W !!,"The ending date cannot be earlier than the starting date.",!,"Please try again.",!! Q
 . I $E(Y,1,5)'=$E(ECSD,1,5) W !!,"Beginning and ending dates must be in the same month and year.",!,"Please try again.",!! Q
 . S ECED=Y
 . I ECLDT'<ECSD W !!,"The Blood Bank information has already been extracted through ",$$FMTE^XLFDT(ECLDT),".",!,"Please enter a new date range.",!! Q
 . S ECOUT=1
 Q
 ;
QUE ;
 K ZTSAVE
 S ECSDN=$$FMTE^XLFDT(ECSD),ECEDN=$$FMTE^XLFDT(ECED),ECSD1=ECSD-.1
 K ZTSAVE
 F X="ECINST","ECED","ECSD","ECSD1","ECEDN","ECSDN" S ZTSAVE(X)=""
 F X="ECPACK","ECPIECE","ECRTN","ECGRP","ECNODE" S ZTSAVE(X)=""
 F X="ECFILE","ECHEAD","ECVER","ECINST","ECXINST" S ZTSAVE(X)=""
 F X="ECXLOGIC","ECXDATES" S ZTSAVE(X)=""
 S ZTDESC=ECPACK_" PRE-EXTRACT AUDIT REPORT: "_ECSDN_" TO "_ECEDN,ZTRTN="START^ECXPLBB",ZTIO=""
 S IOP="Q" W ! S %ZIS="QMP" D ^%ZIS S:POP ECXPOP=1 Q:POP  I $D(IO("Q")) K IO("Q"),ZTIO D ^%ZTLOAD W:$D(ZTSK) !,$C(7),"REQUEST QUEUED",!,"Task #: ",$G(ZTSK) K I,ZTSK,ZTIO,ZTSAVE,ZTRTN D HOME^%ZIS S ECXPOP=1
 Q
 ;
EN(ECXJOB,ECSD,ECED) ; entry point used primarily for testing
 ; input:
 ;        ECXJOB = $J that is assigned to the 2nd subscript of 
 ;                 the temporary global array containing the 
 ;                 extracted data that feeds the pre-extract
 ;                 audit report
 ;        ECSD   = starting date range representing the FM
 ;                 date used to retrieve data from file #63
 ;        ECED   = ending date range representing the FM date
 ;                 used to retrieve data from file #63
 ; syntax  of the call: D EN^ECXPLBB(541571372,3000101,3000131)
 D OUTPUT
 Q
 ;
 ;ECXPLBB
