ABPAROCC ;RE-OPEN CLOSED PATIENT BILL;[ 07/25/91  8:06 AM ]
 ;;1.4;AO PVT-INS TRACKING;*0*;IHS-OKC/KJR;JULY 25, 1991
 W !!,"<<< NOT AN ENTRY POINT - ACCESS DENIED >>>",!! Q
START ;ENTRY POINT
 ;PROCEDURE TO RE-OPEN A CLOSED PATIENT BILL;REMOVES WRITE-OFF AMOUNTS
 D XIT,DT^DICRW S ABPAHD1="Delete Current Write-offs"
 D HEADER^ABPAMAIN W !! D ^ABPAPATL I $D(ABPATDFN)'=1 G XIT
 K DIC,DA S DIC="^ABPVAO("_ABPATDFN_",1,",DIC(0)="AEQZ",DA(1)=ABPATDFN
 S DIC("S")="I $P(^ABPVAO(DA(1),1,+Y,0),U,17)=""C"""
 W ! D ^DIC G:+Y'>0 START S ABPA("WO")=$P(Y(0),"^",3),ABPACDFN=+Y
 S ABPAFRDT=+Y(0),ABPATODT=ABPAFRDT,$P(ABPAXX,"=",81)="" D ^ABPAPD2C
 I ABPA("WO")>0 D  G PAUSE
 .W *7,!,"I am going to remove the $",$J(ABPA("WO"),8,2)," write-off."
 .K DIR S DIR(0)="Y",DIR("A")="Is this O.K.",DIR("B")="YES" D ^DIR
 .I 'Y W " ... Bill not re-opened!" Q
 .K DIC,DIE,DA,DR S DIE="^ABPVAO("_ABPATDFN_",1,",DR=".03///0;.18///PA"
 .S DA(1)=ABPATDFN,DA=ABPACDFN D ^DIE W " ... Bill re-opened!"
 K ABPAMESS S ABPAMESS="There is no write-off to delete!"
 S ABPAMESS(2)="... Press any key to continue ... "
PAUSE D PAUSE^ABPAMAIN
XIT K DIC,DIE,DA,DR,X,Y,ABPATDFN,DIR,ABPACDFN