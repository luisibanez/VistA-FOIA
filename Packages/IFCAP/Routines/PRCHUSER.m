PRCHUSER ;WISC/AKS-Add/Edit purchase card user ;9/12/00  22:52
 ;;5.1;IFCAP;**8**;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 N DIC,DA,Y,DIE,DR,PRCF,%,PRCHORIG,PRCRI
 S PRCF("X")="S" D ^PRCFSITE Q:'$D(PRC("SITE"))  Q:$G(X)="^"
MORE S DIC="^PRC(440.5,",DIC(0)="AELQM",DLAYGO=440.5
 S DIC("S")="I $D(PRC(""SITE"")),$P($G(^PRC(440.5,+Y,2)),""^"",3)=PRC(""SITE"")"
 D ^DIC Q:Y'>0  S DA=+Y,PRCRI(440.5)=DA
 N SITECHK S SITECHK=$P($G(^PRC(440.5,DA,2)),U,3) I +SITECHK'=0,SITECHK'=PRC("SITE") W !!,"This card is not entered for this station." H 3 G MORE
 S DIE="^PRC(440.5,",DR="[PRCH PURCHASE CARD]" D ^DIE ;Q:$D(Y)
 D EDIT^PRC0B(.X,"440.5;^PRC(440.5,;"_PRCRI(440.5),"70////P;71////"_DT)
 K PRCHHLDR,PRCHAPP,PRCHALT,PRCHSING,PRCHMNTH
 I '$G(DA) G Q
 S DA(1)=DA S PRCHUSER=$P(^PRC(440.5,DA,0),U,8)
 I $G(PRCHUSER),$G(PRCHORIG),PRCHUSER'=PRCHORIG D
 . S DIK="^PRC(440.5,"_DA(1)_",1,",DA=PRCHORIG D ^DIK K Y,DIK
 I $G(PRCHUSER),'$D(^PRC(440.5,DA,1,PRCHUSER)) D
 . I '$G(^PRC(440.5,DA(1),1,0)) D
 . . S $P(^PRC(440.5,DA(1),1,0),U,2)=$P(^DD(440.5,12,0),U,2)
 . S DIE="^PRC(440.5,"_DA(1)_",1,",DA=PRCHUSER,DR=".01////^S X=PRCHUSER"
 . D ^DIE
 . S $P(^PRC(440.5,DA(1),1,0),U,3)=DA,$P(^(0),U,4)=$P(^(0),U,4)+1
 . K DIE,DR,PRCHUSER
MORES S:'$D(DA(1)) DA(1)=DA S DIC="^PRC(440.5,"_DA(1)_",1,",DIC(0)="AELQ"
 S DIC("S")="I +Y'=$P(^PRC(440.5,DA(1),0),U,8)" D ^DIC G Q:Y'>0  S DA=+Y
 I $P(Y,U,3)'=1 D
 . W !!?5,"Would you like to delete this surrogate user" S %=2 D YN^DICN
 . Q:%<1!(%=2)
 . S DA=+Y,DIK="^PRC(440.5,"_DA(1)_",1,"
 . D ^DIK K Y,DIK
 G MORES
Q W !!?5,"Would you like to register another purchase card" S %=2 D YN^DICN
 W ! G:%=1 MORE I %=0 W !!,"Please answer 'Yes' or 'No'"
 K DLAYGO,DA
 QUIT
INPUT1 ;Input transform for File #440.5, Field #1
 S DIC="^PRC(420,PRC(""SITE""),1,",DIC(0)="QEMNZ" S DIC("S")="I $D(^PRC(420,""C"",PRCHHLDR,PRC(""SITE""),+Y))",D="B^C" D MIX^DIC1 K:Y<0 X K DIC
 Q:'$D(X)  S X=$P(Y(0),U)
 Q
