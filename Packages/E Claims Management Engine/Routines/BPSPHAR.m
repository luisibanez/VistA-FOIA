BPSPHAR ;BHAM ISC/BEE - ECME MGR PHAR OPTION ;14-FEB-05
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;; Per VHA Directive 10-93-142, this routine should not be modified.
 ;
 ;This routine is called by the [BPS SETUP PHARMACY] menu option. It updates
 ;several fields in the [BPS PHARMACIES] file.
 ;
 Q
 ;
EN N D0,DA,DI,DIC,DLAYGO,DIE,DIRUT,DQ,DR,DTOUT,DUOUT,X,Y
 ;
 ;First select the pharmacy or enter a new one
 W !! S DIC(0)="QEALM",(DLAYGO,DIC)=9002313.56,DIC("A")="Select BPS PHARMACIES NAME: "
 D ^DIC
 ;
 ;Check for "^", timeout, or blank entry
 I ($G(DUOUT)=1)!($G(DTOUT)=1)!($G(Y)=-1) Q
 ;
 ;Pull internal entry
 S DA=$P($G(Y),U) Q:'$G(Y)
 ;
 ;Now edit OUTPATIENT SITE, NCPDP #, CMOP SWITCH, AUTO-REVERSE PARAMETER, and
 ;the DEFAULT DEA #
 S DIE=9002313.56
 S DR="13800;.02;1;.09;.03"
 S DR(2,9002313.5601)=".01"
 D ^DIE
 ;
 Q
