PSJMDIR1 ;BIR/MV-MED DUE WORKSHEET DIR CALLS CONT. ;17 JUN 96 / 1:40 PM
 ;;5.0; INPATIENT MEDICATIONS ;;16 DEC 97
 ;
GWP(PSJMDWS) ;*** Ask for seletion from WARD GROUP,WARD,PATIENT
 ;PSJMDWS=1 when called by Med Due Work Sheet function.
 K DIR S DIR(0)="SAO^G:Ward Group;W:Ward;P:Patient",DIR("A")="Select by WARD GROUP (G), WARD (W), or PATIENT (P): "
 S DIR("?")="To select by PATIENT, enter a 'P'."
 S DIR("?",1)="To select the entire WARD GROUP, enter a 'G'."
 S DIR("?",2)="To select a single WARD, enter a 'W'."
 W !! D ^DIR S PSJSTOP=$S(Y="":1,Y<0:1,$$STOP:1,1:0)
 I 'PSJSTOP S PSGSS=Y D @Y
 Q PSJSTOP
 ;
P ;*** Select by Patient
 ;
 N PSJACNWP,PSGDICA,PAGPAT S PSJACNWP=""
 F PFLG=0:1 S:PFLG PSGDICA="another" D ^PSJMP Q:PSGP<0  S PSGPAT(PPN)=PSGP I PSJMDWS S:'$G(PSJPWDO) (PSGWD,PSJPWDO)=PSJPWD S PSGWD=$S('$G(PSGWD):0,PSJPWDO=PSJPWD:PSJPWD,1:0)
 S PSJSTOP=$S($D(DTOUT):1,$D(DUOUT):1,(Y<0)&'$D(PSGDICA):1,1:0)
 Q
 ;
W ;*** Select by WARD
 ;
 K DIC S DIC="^DIC(42,",DIC(0)="QEAMIZ",DIC("A")="Select a Ward: " W !! D ^DIC
 S PSJSTOP=$S(Y="":1,Y<0:1,$$STOP:1,1:0)
 I 'PSJSTOP S PSGWD=+Y,PSGWN=Y(0,0) D ADMTM^PSJMDIR D:'PSJSTOP&(PSJMDWS) RBADM^PSJMDIR
 Q
 ;
G ;***Select by WARD GROUP
 ;
 K DIC S DIC="^PS(57.5,",DIC(0)="QEAMI",DIC("A")="Select a Ward Group: " W !! D ^DIC Q:$$STOP  S PSGWG=+Y,PSGWGNM=$P(Y,U,2) D:PSJMDWS RBADM^PSJMDIR
 Q
 ;
STOP() ;
 ;
 S PSJSTOP=$S($D(DTOUT):1,$D(DUOUT):1,$D(DIRUT):1,1:0)
 Q PSJSTOP
