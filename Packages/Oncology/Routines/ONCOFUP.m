ONCOFUP ;WASH ISC/SRR,MLH-FOLLOWUP LETTER; 02/25/00
 ;;2.11;ONCOLOGY;**2,22,25**;Mar 07, 1995
SCL W @IOF,!!?16,"************ PRINT FOLLOW-UP LETTER ************",!!
R D PAT G EX:Y<0!(+Y[U)
FC D LFC G EX:$D(Y) S FC=$P($G(^ONCO(160,D0,1)),U,6) I FC="" W !!?5,"You need to designate a contact before printing a letter!",!! G FC
 D LET^ONCOFUP G R ;Select Patient
 ;
LFC ;last Follow-up contact
 W !!?5,"The letter is sent to 'LAST FOLLOW-UP CONTACT'",!?5,"You may enter a new contact if you wish: ",!
 S DIE="^ONCO(160,",DR="15.1",L=0 D ^DIE
 Q
PAT ;GET PATIENT and INFO/ID
 K DIC S DIC="^ONCO(160,",DIC("A")="        Select Patient: ",DIC(0)="AEMQZ" D ^DIC Q:Y=-1!(+Y[U)  S (ONCOPAT,ONCOD0,DA)=+Y,X=Y(0,0),ONCOVP=$P(Y,U,2),X=$P(X,",",2)_" "_$P(X,",") S ONCONM=$$LCASE^ONCOU(X)
 Q
 ;Entry from ONCOFUL
LET ;Define Screens, Display types of letters from #165.1, Print letter
 I $D(ONCOC0) D  G TP
 .S OLDLFC=$P($G(^ONCO(160,ONCOD0,1)),U,6)
 .K:OLDLFC'="" ^ONCO(160,"AC",OLDLFC,ONCOD0)
 .S $P(^ONCO(160,ONCOD0,1),U,6)=ONCOC0
 .S ^ONCO(160,"AC",ONCOC0,ONCOD0)=""
 .K OLDLFC
 S ONCOC0=$P(^ONCO(160,ONCOD0,1),U,6)
TP S TP="" I ONCOC0 S TP=$P($G(^ONCO(165,ONCOC0,0)),U,2)
 I TP="" W !,"Contact or Contact Type is not defined",! H 3 Q
S ;Define Screens
 K DIC
 I TP<3!(TP=6) S DIC("S")="I $P(^(0),U,2)=TP" G SL
 I TP=3!(TP=5) S DIC("S")="I $P(^(0),U,2)=3" G SL
 I TP=4 S DIC("S")="I $P(^(0),U,2)>3"
SL ;Select letter
 S DIC("A")="     Specify TYPE Contact letter: ",DIC="^ONCO(165.1,",DIC(0)="EZAMQ" W !! D ^DIC S ZZL=+Y I ZZL=-1 W ! Q
 ;Print Letter
 S DIWF="^ONCO(165.1,"_ZZL_",1,",DIWF(1)="160",BY="NUMBER",(FR,TO)=ONCOPAT W !!
 K DIC,ONCONM D EN2^DIWF D ^%ZISC S IOP=ION D ^%ZIS
 Q
 ;
EX ;EXIT ROUTINE
 K CPT,DA,DIC,DIE,ZZL,DIK,ONCOD0,ONCOD1,DR,DIC,ONCOC0,ONCOPAT,ONCOVP,%ZISOS,B
 K FC,M,P,TP,%DT,F,W,ST,STP,D0,DIYS,DNP,DQ,CTP,DA,DIJ,DP,ONCON,ONCOX
 Q
