APCLAP1 ; IHS/CMI/LAB - APC visit counts by selected vars ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;
START ; 
 I '$G(DUZ(2)) W $C(7),$C(7),!!,"SITE NOT SET IN DUZ(2) - NOTIFY SITE MANAGER!!",!! Q
 S APCLSITE=DUZ(2)
 I '$D(APCLRPT) W !,$C(7),$C(7),"REPORT TYPE MISSING!!  NOTIFY PROGRAMMER",! K APCLSITE Q
 D GETINFO^APCLAP0 G:$D(APCLQUIT) XIT
 S APCLJOB=$J,APCLBTH=$H
 D INFORM
CHECK ;
 I APCLRPT'="P"&(APCLRPT'="DIS") G GETDATES
 S DIR(0)="SO^P:Primary Provider Only;A:All Providers (Primary and Secondary)",DIR("A")="Report should include"
 S DIR("?")="If you wish to count only the primary provider of service enter a 'P'.  To include ALL providers enter an 'A'." D ^DIR K DIR
 G:$D(DIRUT) XIT
 I Y="A" S APCLRPT=$S(APCLRPT="DIS":"ALLDISC",1:"ALLP")
 I Y="P" S APCLRPT=$S(APCLRPT="P":"PROV",1:"DISC")
 D GETINFO^APCLAP0
GETDATES ;
BD ;get beginning date
 W ! S DIR(0)="D^:DT:EP",DIR("A")="Enter beginning Visit Date for Search" D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 I $D(DIRUT) G XIT
 S APCLBD=Y
ED ;get ending date
 W ! S DIR(0)="DA^"_APCLBD_":DT:EP",DIR("A")="Enter ending Visit Date for Search:  " S Y=APCLBD D DD^%DT S Y="" D ^DIR K DIR S:$D(DUOUT) DIRUT=1
 I $D(DIRUT) G BD
 S APCLED=Y
 S X1=APCLBD,X2=-1 D C^%DTC S APCLSD=X
 ;
LOC I APCLRPT="LOS" S APCLLOC=0 G DEF
 S APCLLOC=$$GETLOC^APCLOCCK
 I APCLLOC=-1 G BD
DEF S X=25,DIC(0)="M",DIC="^DIC(40.7," D ^DIC K DIC,X I Y=-1 W !!,"CLINIC CODE 25 - OTHER MISSING FROM FILE - NOTIFY YOUR SITE MANAGER!!" G XIT
 S APCLOTHC=+Y
 S X=39,DIC(0)="M",DIC="^DIC(40.7," D ^DIC K DIC I Y=-1 W !!,"PHARMACY CLINIC CODE 39 NOT IN FILE - NOTIFY SITE MANAGER!!" G XIT
 S APCLRXCL=+Y
DEMO ;
 D DEMOCHK^APCLUTL(.APCLDEMO)
 I APCLDEMO=-1 G LOC
ZIS ;call to XBDBQUE
 S XBRP="^APCLAP1P",XBRC="^APCLAP11",XBRX="XIT^APCLAP1",XBNS="APCL"
 D ^XBDBQUE
 D XIT
 Q
XIT ;
 K APCLSITE,APCLRPT,APCLINFO,APCLSORT,APCLPROC,APCLINF,APCLBD,APCLED,APCLSD,APCLDT,APCLLOC,APCLODAT,APCLVDFN,APCLVLOC,APCLVREC,APCLCLIN,APCLSKIP,APCL1,APCL2,APCLAP,APCLDISC,APCLPPOV,APCLX,APCLHIGH,APCLDATE,APCLPRNT,APCLJOB,APCLAPCC
 K APCLDX,APCLLOW,APCLICD,APCLDA1,APCLDA2,APCLY,APCLTITL,APCL80S,APCLEDD,APCLHD1,APCLHD2,APCLLENG,APCLLOCT,APCLPG,APCLSRT2,APCLTOT,APCLBDD,APCLPROV,APCLSEC,APCLZ,APCLADIS,APCLQUIT,APCLLOCC,APCLBT,APCLBTH
 K APCLJOB,APCLRXCL,APCLOTHC
 K X,X1,X2,IO("Q"),%,Y,POP,DIRUT,ZTSK,ZTQUEUED,H,S,TS,M
 Q
INFORM ;
 W:$D(IOF) @IOF
 W !,"***** APC VISIT COUNTS BY ",APCLTITL," *****",!
 W !,"This report will generate a count of visits by ",APCLINF,!,"for a date range that you specify.",!
 W "The only visits included in this report are those that are considered",!,"APC workload reportable.",!
 Q
 ;
