AFSLEAPR ;IHS/OIRM/DSD/JDM,HJT - EDIT PAYMENT APPROPRIATION; [ 10/27/2004   4:21 PM ]
 ;;3.0t1;1166 APPROVALS FOR PAYMENT;**13**;
 ;ACR*2.1*13.02 IM13574   REMOVED REDUNDANT CODE FOR CACHE' COMPLIANCE
 ;Edit payment appropriation number.
READX ;EP;TO EDIT PAYMENT APPROPRIATION NUMBER
 D EXIT
 F  D R1 Q:$D(AFSQUIT)
EXIT K AFSLFYR,AFSLSCHD,AFSLSQNO,AFSQUIT,AFSLANSD,AFSLIFLG,AFSLNFND,AFSLNOD2,AFSLNZRO,AFSLSFND,AFSLSZRO,AFSLYFND,AFSLYZRO,AFSLFYR,AFSLSCHD,AFSLSQNO,AFSLYNOD,AFSLSNOD,AFSLNNOD,DIR,DR,DIE,C,D,C0,DA,DI,DIC,X
 Q
R1 K DIR
 ;Begin Y2k fix
 S DIR(0)="FO^4:4"   ;Y2000
 ;S DIR(0)="FO^2:2"
 S DIR("A")="Which FISCAL YEAR"
 W !
 D ^DIR
 K DIR
 ;I Y'?2N D  Q
 I Y'?4N D  Q    ;Y2000
 .;End Y2k fix
 .W !,"No FISCAL YEAR selected."
 .H 2
 .S AFSQUIT=""
 S AFSLYNOD=$O(^AFSLAFP("B",Y,0))
 I 'AFSLYNOD W !,"FISCAL YEAR not found." Q
 F  D R2 Q:$D(AFSQUIT)
 K AFSQUIT
 Q
R2 S DIC="^AFSLAFP("_AFSLYNOD_",1,"
 S DA(1)=AFSLYNOD
 S DIC(0)="AEMQZ"
 S DIC("A")="Which BATCH NO..."
 D ^DIC
 I +Y<1 D  Q
 .W !,"No BATCH NUMBER selected."
 .H 2
 .S AFSQUIT=""
 S AFSLSNOD=+Y
 F  D R3 Q:$D(AFSQUIT)
 K AFSQUIT
 Q
R3 S DIC="^AFSLAFP("_AFSLYNOD_",1,"_AFSLSNOD_",1,"
 S DA(2)=AFSLYNOD
 S DA(1)=AFSLSNOD
 S DIC(0)="AEMQZ"
 S DIC("A")="Which SEQUENDE NO"
 D ^DIC
 I +Y<1 D  Q
 .W !,"No SEQUENCE NUMBER selected."
 .H 2
 .S AFSQUIT=""
 S AFSLNNOD=+Y
 S DIE="^AFSLAFP("_AFSLYNOD_",1,"_AFSLSNOD_",1,",DA=AFSLNNOD,DA(1)=AFSLSNOD,DA(2)=AFSLYNOD
 S DR="57T"
 D ^DIE
 Q
