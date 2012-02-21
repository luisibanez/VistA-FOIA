IBCEP5D ;ALB/JEH - EDI UTILITIES - for State License ;29-MAR-01
 ;;2.0;INTEGRATED BILLING;**137**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
 ; STATE LICENSE # ADD/EDIT DBIA ==> DBIA 224
EN ;Add/edit state and license number
 N IBDA,DIR,DIC,DD,DA,DR,IBSTAT,IBLIC,IBQ,Y
 D FULL^VALM1
 I '$G(IBPRV) D  G:IBQ STATQ
 . S IBQ=0
 . S DIC="^VA(200,",DIC(0)="AEMQ",DIC("A")="Select VA Provider: " D ^DIC K DIC
 . I $D(DTOUT)!$D(DUOUT)!(Y<0) S IBQ=1 Q
 . S IBDA=+Y
 I $G(IBPRV)["VA" S IBDA=+IBPRV
 I $G(IBPRV),$G(IBPRV)'["VA" D  G STATQ
 . S DIR("A",1)="You have selected a Non-VA provider"
 . S DIR("A",2)="State license # can only be entered for VA providers"
 . S DIR("A",3)=""
 . S DIR("A")="Press enter to continue"
 . S DIR(0)="EA" W ! D ^DIR K DIR W !
STALIC ;Add/edit file 200 field 54.1 multiple,state(.01) and license#(1) - DBIA 224
 ;
 S DA(1)=IBDA,DIC="^VA(200,"_DA(1)_",""PS1"",",DIC(0)="QEAL"
 D ^DIC I Y=-1 K DIC,DA G STATQ
 F Z=1:1:3 L +^VA(200,IBDA):5 Q:$T
 I '$T D  G STATQ
 . W !,"Another user is editing this entry.  Try again later"
 . S DIR(0)="EA",DIR("A")="Press enter to continue"
 . W ! D ^DIR K DIR W !
 S DIE=DIC K DIC S DA=+Y,DR=".01;1"
 D ^DIE K DIE,DR,DA,Y
 L -^VA(200,IBDA)
STATQ ;
 S VALMBCK="R"
 Q
 ;
GETLIC(IBPRV) ; Get license # for provider in file 200 IBPRV
 ; Pass IBPRV by reference to retrieve #'s by state
 ; IBPRV(state ien)=id
 ; Returns 0 if no license # found
 N Z
 S Z=0 F  S Z=$O(^VA(200,IBPRV,"PS1",Z)) Q:'Z  S Z0=$G(^(Z,0)) I $P(Z0,U,2)'="" S IBPRV(+Z0)=$P(Z0,U,2)
 Q +$O(IBPRV(0))
 ;
