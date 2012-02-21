PSIVLBRP ;BIR/MV - REPRINT LABELS FOR AN ORDER ;15 May 2001  3:29 PM
 ;;5.0; INPATIENT MEDICATIONS ;**58,97**;16 DEC 97
 ;
 ; Reference to ^PS(55 is supported by DBIA 2191.
 ;
EN(PSJIDLST) ;
 I '$D(PSJIDLST) W !,"No labels are available" D PAUSE^VALM1 Q
 NEW DIR,PSIVCTD
 S PSIVCT=1
 W !!,"Count as daily usage" S %=1 D YN^DICN Q:%=-1  S PSIVCTD=$S(%=1:1,1:0)
 I PSIVCTD=1 K PSIVCT
 S PSJY=$$PROMPT()
 Q:PSJY=""
 D PRT
 Q
PROMPT() ;
 W !
 S DIR(0)="LOA^1:"_PSJIDLST,DIR("A")="Select from 1 - "_PSJIDLST_" or <RETURN> to select by BCMA ID: " D ^DIR
 K DIR
 S PSJY=Y
 I PSJY="" S DIR(0)="FOA^1:50^S X=$$UP^XLFSTR(X) K:'$D(PSJIDLST(X)) X",DIR("A")="Enter a BCMA ID: " D ^DIR S PSJY=$$UP^XLFSTR(Y)
 K DIR
 W !!
 Q PSJY
DEQIA ;
 S PSIVNOL=0
 F PSJSEL=1:1 S PSJSEL1=$P(PSJY,",",PSJSEL) Q:PSJSEL1=""  S PSIVNOL=PSIVNOL+1
 F PSJSEL=1:1 S PSJSEL1=$P(PSJY,",",PSJSEL) Q:PSJSEL1=""  D
 . S:'PSIVCTD PSIVCT=1
 . S PSJID=$G(PSJIDLST(PSJSEL1)) Q:PSJID=""  D REPRT(PSJID)
 K PSJRPHD
 Q
REPRT(PSJID) ;
 S PSJNEWID=$$BCMA^PSIVBCID(DFN,ON,$D(PSIVCT),$G(PSIV1),$G(PSIV2),$G(PSIVNOL))
 I PSJNEWID="" W !,"Can't get a new BCMA ID.  Try again" Q
 S PSJIDNO=$P(PSJID,"V",2)
 S PSIVBAG=$P($G(^PS(55,DFN,"IVBCMA",PSJIDNO,0)),U,8)
 N DA,DR,DIE,DIC
 ;S DIC(0)="L",DA=Y,DA(1)=DFN,X=PSJNEWID,DIC="^PS(55,"_DA(1)_",""IVBCMA""," D FILE^DICN
 K DA,DR,DIE S DIE="^PS(55,"_DFN_",""IVBCMA"",",DA=$P(PSJNEWID,"V",2),DA(1)=DFN D NOW^%DTC
 ;S DR=".02////"_+ON_";3////"_PSIVCTD_";4////"_$E(%,1,12)_";6////"_PSIVBAG D ^DIE
 S DR="6////"_PSIVBAG D ^DIE
 K DA,DR,DIE,DIC
 S PSJNEWID=$P(PSJNEWID,"V",2)
 F PSJAD=0:0 S PSJAD=$O(^PS(55,DFN,"IVBCMA",PSJIDNO,"AD",PSJAD)) Q:'PSJAD  D
 . S PSJADX=$G(^PS(55,DFN,"IVBCMA",PSJIDNO,"AD",PSJAD,0))
 . D UP2^PSIVBCID(DFN,PSJNEWID,PSJAD,PSJADX)
 F PSJSOL=0:0 S PSJSOL=$O(^PS(55,DFN,"IVBCMA",PSJIDNO,"SOL",PSJSOL)) Q:'PSJSOL  D
 . S PSJSOLX=$G(^PS(55,DFN,"IVBCMA",PSJIDNO,"SOL",PSJSOL,0))
 . D UP3^PSIVBCID(DFN,PSJNEWID,PSJSOL,PSJSOLX)
 K DA,DR,DIE,DIC
 S DA=PSJIDNO,DA(1)=DFN,DIE="^PS(55,"_DA(1)_",""IVBCMA"","
 S DR="5////RP" D ^DIE
 K DA,DR,DIE,DIC
 D ^PSIVHYPR:P(4)="H",^PSIVLABR:"APSC"[P(4) S:$D(ZTQUEUED) ZTREQ="@"
 ;PSJRPHD is defined so ^PSIVLABR won't print the header for sub-labels.
 S PSJRPHD=1
 ;If reprinting from war/man list, store new BCMA ID.
 S:$G(PSIVWMFL) PSIVID(PSJNEWID)=""
 Q
PRT ;
 S IONOFF="",IOP=PSIVPL,%ZIS="NQ" D ^%ZIS G:POP Q I IO=IO(0),($E(IOST)="C") W !!! D DEQIA,Q D HOME^%ZIS Q
 D HOME^%ZIS
 W ! S ZTDTH=$H,ZTIO=PSIVPL,ZTDESC="REPRINT INDIVIDUAL IV LABELS",ZTRTN="DEQIA^PSIVLBRP" F X="IONOFF","P16","PSIVAC","PSIVSN","PSIVSITE","DFN","ON","PSJSYSW0","PSJSYSU","PSJSYSP0","PSJIDLST(","P(","PSJY","PSIVCTD" S ZTSAVE(X)=""
 S:$D(PSIVCT) ZTSAVE("PSIVCT")="" D ^%ZTLOAD W:$D(ZTSK) !,"Queued."
 Q
Q ;
 Q
