PRCUPM ;WISC@ALTOONA/CTB/WISC/PLT-IFCAP GENERAL BATCH PROCESS ; 06 Apr 93  12:03 PM
V ;;5.0;IFCAP;;4/21/95
 ;THIS ROUTINE SHOULD BE TASKED TO RUN DAILY AT WHATEVER TIME
 ;THE IRM STAFF FEELS IS APPROPRIATE.  IT SHOULD BE RESCHEDULED
 ;TO RUN DAILY.  ITS JOB IS TO SPAWN THE APPROPRIATE NUMBER OF
 ;'KILLER' JOBS (^PRCUPMK) AS SPECIFIED IN FILE 443.2.
 ;
 ;IF LEFTOVER INPROCESS JOBS REMAIN IN FILE 443.3, AND THEY ARE OVER
 ;   1 DAY OLD, THEY WILL BE ADDED TO FILE 443.1 HERE
 I $O(^PRC(443.3,0)) DO
 . NEW DA,TODAY,NODE,NODE1,ROU,VARIABLE,MSG
 . S TODAY=+$H,DA=0
 . F  S DA=$O(^PRC(443.3,DA)) Q:'DA  DO
 . . S NODE=$G(^PRC(443.3,DA,0)) I NODE="" D REMIP^PRCUPM1(DA) QUIT
 . . S NODE1=$G(^PRC(443.3,DA,1)) I NODE1="" D REMIP^PRCUPM1(DA) QUIT
 . . S ROU=$P(NODE,2,3),VARIABLE=$P(NODE,4) I ROU="" D REMIP^PRCUPM1(DA) QUIT
 . . S DATE=+NODE1 Q:TODAY'>DATE
 . . D ADD^PRCUPM1(ROU,VARIABLE,.MSG)
 . . I 'MSG D REMIP^PRCUPM1(DA)
 . . QUIT
 . QUIT
 ;IT WILL NOT SPAWN 'KILLER' JOBS IF THERE ARE NO ENTRIES IN
 ;FILE 443.1
 I $O(^PRC(443.1,0))=""  W !!,"GENERAL BATCH PROCESS STARTED, NO NEW ENTRIES FOUND IN FILE 443.1.  CHECK IN PROCESSING FILE 443.3."
 S PARAM=^PRC(443.2,1,0)_"^"_$H
 S STOP=$P(PARAM,"^",3),SAT=$P(PARAM,"^",4),SUN=$P(PARAM,"^",5),HOL=$P(PARAM,"^",6),START=$P(PARAM,"^",8),NUMJOB=$P(PARAM,"^",7)
 S:+NUMJOB=0 NUMJOB=1
 S X=DT_"."_STOP D H^%DTC S STOP=%T
 I STOP<$P(START,",",2) S STOP=$P(START,",",1)+1_","_STOP
 E  S STOP=$P(START,",",1)_","_$P(STOP,",",2)
 S %H=STOP D YMD^%DTC
 D NOW^%DTC
 I ((SAT&(Y=6))!(SUN&(Y=7))!(HOL&($D(^HOLIDAY(X))))) S $P(STOP,",",2)=$P(START,",",2)
 F ZII=1:1:NUMJOB D
 . S ZTRTN="PRCUPMK",ZTDESC="IFCAP General Batch Process",ZTIO="",ZTDTH=$H
 . S ZTSAVE("STOP")="",ZTKIL=$H+2_",0"
 . D ^%ZTLOAD W !,ZTSK,!
 . QUIT
 Q
