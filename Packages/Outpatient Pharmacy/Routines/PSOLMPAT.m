PSOLMPAT ;BHAM ISC/SAB - update pharmacy patient data using listman ; 03/08/93 8:35
 ;;7.0;OUTPATIENT PHARMACY;**15,117**;DEC 1997
 ;External reference ^PS(55 supported by DBIA 2228
EN I '$D(PSOPAR) D ^PSOLSET I '$D(PSOPAR) S VALMSG="Site Parameters must be Defined!" G EX
 D HLDHDR^PSOLMUTL S DA=DFN,PI="" G:'$P($G(PSOPAR),"^",22) P55
 S DIE="^DPT(",DR="[PSO OUTPT]" L +^DPT(DA):0 I '$T D MSG G EX
 L +^PS(55,DA):0 I '$T D MSG G EX
 D FULL^VALM1,^DIE L -^DPT(DA)
P55 I '$D(^PS(55,DFN)) K DIC S DIC="^PS(55,",DIC(0)="LZ",(X,DINUM)=DFN K DD,DO D FILE^DICN K DIC
 I $G(DFN),$P($G(^PS(55,DFN,0)),"^")="" S $P(^PS(55,DFN,0),"^")=DFN K DIK S DA=DFN,DIK="^PS(55,",DIK(1)=.01 D EN^DIK K DIK S DA=DFN
 S DIE="^PS(55,",DR=".02;.03;.05;.04;1;3;40:41.1;106;106.1" W !!?5,">>PHARMACY PATIENT DATA<<",! D ^DIE
EX L -^PS(55,DA),-^DPT(DA) D ^PSOORUT2 S VALMBCK="R"
 K DIC,X,Y,DIE,D0,DA,DFN,PI,DR,%,%Y,%X,C,DI,DIPGM,DQ,PSOFROM
 Q
MSG S VALMSG="Patient Data is Being Edited by Another User!" Q
