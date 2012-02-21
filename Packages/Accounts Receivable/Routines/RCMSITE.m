RCMSITE ;ALB/RRG - EDIT SITE PARAMETERS ;03/12/02
V ;;4.5;Accounts Receivable;**173,236**;Mar 20, 1995
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
BEG ;Start editing site paramters
 N DIC,DLAYGO,X,Y,DIE,DA,DR
 S DIC="^RC(342,",DIC(0)="QEAML",DLAYGO=342 D ^DIC I Y>0 S DA=+Y,DR=.01,DIE="^RC(342," D ^DIE
 Q
ALC ;Edit ALC parameter
 NEW DIC,DR,DA,Y
 S DIE="^RC(342,",DA=1,DR=".07;31" D ^DIE
 Q
IRS ;Edit IRS OFFSET site parameters
 NEW DIE,DR,DA,Y
 I '$D(^RC(342,1,0)) D BEG G:'$D(^RC(342,1,0)) Q
 S DA=1,DR="[RCMS IRS]",DIE="^RC(342," D ^DIE
Q Q
STAT ;Edit NOTIFICATION site parameters
 NEW DIE,DR,DA,Y
 I '$D(^RC(342,1,0)) D BEG G:'$D(^RC(342,1,0)) Q1
 S DA=1,DR="[RCMS NOTIFICATION]",DIE="^RC(342," D ^DIE
Q1 Q
GRP ;Edit AR Group Parameters
 NEW DIE,DR,DA,Y
 F  W ! S DIC(0)="QEAML",DIC="^RC(342.1,",DLAYGO=342.1 D ^DIC K DIC G:Y<0 Q3 S DA=+Y,DIE="^RC(342.1,",DR=$P($G(^RC(342.2,+$P(^RC(342.1,+Y,0),"^",2),1)),"^") I DR]"" D ^DIE
Q3 Q
DEA ;Deactive an AR group
 NEW DIE,DIC,DA,DR,Y,GRP
 S DIC="^RC(342.1,",DIC(0)="QEAM",DIC("S")="I $P(^(0),""^"",2)'=7" D ^DIC Q:Y<0  S GRP=+Y
 W ! S DIR("A")="Are you sure you want to Deactive Group '"_$P(^RC(342.1,GRP,0),"^")_"'",DIR(0)="Y",DIR("B")="NO" D ^DIR K DIR
 I 'Y W !!,"*** NO ACTION TAKEN ***" Q
 I Y S DIE="^RC(342.1,",DA=GRP,DR=".02////^S X=7" D ^DIE W !!,"*** Group Deactivated ***"
 Q
SITE() ;Return site number
 Q +$G(^DIC(4,+$P($G(^RC(342,1,0)),"^"),99))
INT ;Print Inter/Admin/Pen effective report
 NEW DIC,BY,FR,TO,FLDS,L
 S DIC="^RC(342,",BY=.01,(FR,TO)="",FLDS="[RCMS INT/ADM/PEN]",L=0 D EN1^DIP
 Q
UPINT ;Update Rate site parameters
 NEW DIE,DR,DA,Y,IOP
 S IOP=ION D INT
 I '$D(^RC(342,1,0)) D BEG G:'$D(^RC(342,1,0)) Q4
 F  W ! S DA=1,DR="[RCMS RATES]",DIE="^RC(342," D ^DIE Q:$D(Y)
Q4 Q
 ;
EDILOCK ;Update EDI Lockbox site parameters
 N DIE,DR,DA,Y
 I '$D(^RC(342,1,0)) D BEG G:'$D(^RC(342,1,0)) Q5
 S DA=1,DR="[RCMS EDI LOCKBOX]",DIE="^RC(342," D ^DIE
Q5 Q
 ;
