AICDGRP ; IHS/OHPRD/GIS - SUPERGROUPER: GROUPER WITH SMART DX AND OP LOOKUP AND PRIORITIZED DISPLAY OF ALL DRG DIAGNOSES ;  [ 01/09/2003  4:09 PM ]
 ;;3.51;IHS ICD/CPT lookup & grouper;**2,6**;MAY 30, 1991
 ;
 ; TAKEN FROM ADT VERSION 3.3 ;JAN 11 1985
 ;
 S IOP=$I D ^%ZIS X ("W "_IOF)
 S LINE="W ! S S=S+1 Q:S<22  W ""'^' TO HALT: "" R W#3:DTIME S:'$T W=U Q:W=U  W *13,$J("""",40),*13 S S=0"
 S:'$D(DTIME) DTIME=300
 S U="^",X="T",%DT="" D ^%DT S DT=Y W !!?21,"DRG PRIORITIZER    VERSION 1.0",!!!
PAT ;EP ;AICD*3.51*6
 D KILLS ;AICD*3.51*6
 S DGQU=0 S PT="N" D ^AICDGRP2 W !
 I $D(AICDQUIT) K AICDQUIT G Q
 I $D(AGE),AGE="^"!(AGE="") G Q
 K NOR,NSD,NDR,RG,CC,ORG,DIC
DXS ;EP ;AICD*3.51*6
 G DXS^AICDGRP1 ; *2* ;AICD*3.51*6
Q ;EP ;AICD*3.51*6
 D KILLS ;AICD*3.51*6
 W !!,"Leaving DRG Grouper.",!
 Q
KILLS K AICDDX,AICDE,AICDI,AICDJ,AICDK,AICDL,AICDN,AICDTOT
 K DGQU,DGFLG,DAM,AICDPRMT,PT,Q,RG,SD,SD1,T,TAC,Y,DIC,DRGCAL,I,L,MDC,NDR,NOR,OR,PD,%,%DT,%Y,SEX,AGE,EXP,ORG,TRS,NSD,ELIM,C,POP,WD2,W,S
 Q
NOTES ; CALLS %ZIS,%DT,%DTC,DGDRG*,DIC,AICDGRP2
 ; BE SURE TO INCLUDE THE ROUTINE AICDGRP2 TO STREAMLINE THE DATA ENTRY PROCESS
 ; SUGGEST YOU SET AICDHLIM TO LIMIT SEARCH TO 20 CHOICES TO AVOID CONFUSION
 ; MORE+6 FIXED ON 4/6/88 TO PREVENT UNDEF ERROR [TAC]
 ; MODIFIED AGAIN BY GIS/TPA 6/6/88 TO PREVENT UNDEF ERROR WHEN MULTIPLE PROCEDURES ARE ENTERED (468+1)
