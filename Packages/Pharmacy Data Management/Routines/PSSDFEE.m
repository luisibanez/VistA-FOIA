PSSDFEE ;BIR/ASJ-VARIOUS FILES ENTER EDIT ROUTINE ;01/21/00
 ;;1.0;PHARMACY DATA MANAGEMENT;**38,48**;9/30/97
DF ;Dosage File Enter/Edit
 D ^PSSDEE2 N DIC,PSSDF
 F  W !! S DIC(0)="QEAMZ",DIC="^PS(50.606,",DIC("S")="I '$P(^(0),""^"",2)!($P(^(0),""^"",2)>DT)" D ^DIC S PSSREC=+Y Q:PSSREC<0  W !!,"NAME: ",Y(0,0) D EDT(DIC,PSSREC,"[PSS DOSAGE FORM]",50.606)
 W ! Q
MR ;Medication Routes File Enter/Edit
 D ^PSSDEE2 N DIC,PSSDF,DLAYGO
 F  W !! S DIC(0)="QEAMZIL",DIC="^PS(51.2,",DLAYGO=51.2 D ^DIC Q:Y<0  S PSSREC=+Y D EDT(DIC,PSSREC,"[PSS MEDICATION ROUTES]",51.2)
 W ! Q
CF ;Rx Consult File
 Q
 ; It was decided not to put this functionality in PSS*1*38
 D ^PSSDEE2 N DIC,PSSDF,DLAYGO
 F  W !! S DIC(0)="QEAMZIL",DIC="^PS(54,",DLAYGO=54 D ^DIC Q:Y<0  S PSSREC=+Y D EDT(DIC,PSSREC,"[PSS RX CONSULT]",54)
 W @IOF Q
 ;
EDT(DIE,DA,DR,PSFILE)    ;
 N PSREC S PSREC=DA
 L +^PS(PSFILE,PSREC):0
 I '$T W !,$C(7),"Another person is editing this one." Q
 D ^DIE K DIE,DR,DA,Y
 L -^PS(PSFILE,PSREC)
 Q
