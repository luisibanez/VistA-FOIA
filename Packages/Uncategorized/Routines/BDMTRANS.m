BDMTRANS ; cmi/anch/maw - CONTROL TRANSFER OF PATIENTS TO CMS ;
 ;;2.0;DIABETES MANAGEMENT SYSTEM;;AUG 11, 2006
 ;UTILITY TO TRANSFER CLIENTS FROM PCC REGISTERS, TAXONOMIES AND
 ;SEARCH TEMPLATES TO THE CMS
 ;;EP;ENTRY POINT
EN I '$G(BDMRDA) D REG^BDMFUTIL
 Q:'$G(BDMRDA)
 D PCC:'$D(BDMQUIT)
EXIT K BDMRG,BDMRGNA,BDMU,BDMTRN,BDMTRNA,BDMTRNX,BDMRGTP,BDMX,BDMI,BDMSLCT
 K BDMQUIT,BDM1,BDM2,BDM3,BDMGLB,BDMGLB1
 Q
 ;
PCC D TLOOK
 Q:Y<1
 S BDMRG=BDMRDA
 S BDMSTAT="A",BDMSTAT(0)="ACTIVE"
 W !!?10,"The following transfer has been selected:",!!?10,"From SEARCH TEMPLATE: "
 W ?30,BDMTRNA,!?12,"To CMS register:",?30,BDMREGNM,!?10,"Transfer Status: ",?30,BDMSTAT," - ",BDMSTAT(0),!!,?10,"Is that what you want"
 S %=2 D YN^DICN
 I %<1!(%=2) D EXIT Q
 I %=1 D TRANS
MESS W !!?10,"Transfer of patients is complete."
 W !?10,"All patients should be reviewed and all"
 W !?10,"patient data updated in the ",BDMREGNM," register."
 W !
 D PAUSE^BDMFMENU
 Q
TRANS S $P(^ACM(41.1,BDMRG,0),U,9)=1
 S BDMGLB="^DIBT("_BDMTRN_",1)"
 S BDMU=0
 F  S BDMU=$O(@BDMGLB@(BDMU)) Q:BDMU=""  D:'$D(^ACM(41,"AC",BDMU,BDMRG)) MOVE
 S $P(^ACM(41.1,BDMRG,0),U,9)=""
 K BDMRG,BDMRGNA,BDMU,BDMTRN,BDMTRNA,BDMTRNX,BDMRGTP,BDMX,BDMI,BDMSLCT,DIC,DIE,DA,DR,DD
 S ZTREQ="@"
 Q
MOVE Q:$D(^ACM(41,"AC",BDMU,BDMRG))
 S:$P(^ACM(41.1,BDMRG,0),U,9)="" $P(^(0),U,9)=1
 S DIC="^ACM(41,"
 S DIC(0)="L"
 S DIC("DR")=".02////"_BDMU_";1////"_BDMSTAT_";2////"_DT_";4////"_DT
 S X=BDMRG
 D FILE^BDMFDIC
 W "."
 Q
TSK S ZTRTN="TRANS^BDMTRANS",ZTDESC="TRANSFER PCC REGISTER OR TAXONOMY DATA TO CMS REGISTER",ZTSAVE("BDM*")="",ZTIO="",ZTDTH=$H
 D ^%ZTLOAD
 Q
TLOOK W @IOF
 W !?20,"Select SEARCH TEMPLATE to transfer"
 W !?20,"patients to the Diabetes Register"
 W !!
 K DIC
 S DIC="^DIBT("
 S DIC(0)="AEQZ"
 S DIC("A")="Which SEARCH TEMPLATE: "
 S DIC("S")="I (($P(^(0),U,4)=2!($P(^(0),U,4)=9000001))) Q:'$D(DS(2))  I $D(^DIBT(DS(2),1))"
 D ^DIC
 K DIC,DA,DR
 Q:+Y<1
 W !
 S BDMTRN=+Y,BDMTRNA=$P(Y,U,2),(BDMRGTP,BDMI)=""
 F BDMYI=1:1 S BDMI=$O(^DIBT(BDMTRN,1,BDMI)) Q:BDMI=""
 W !!?10,"There are ",BDMYI-1," patients in this SEARCH TEMPLATE."
 K BDMI,BDMYI
 W !
 S BDMYI=0
 F  S BDMYI=$O(^DIBT(BDMTRN,"%D",BDMYI)) Q:'BDMYI  W !,?3,^(BDMYI,0)
 K BDMYI
 W !
 Q
