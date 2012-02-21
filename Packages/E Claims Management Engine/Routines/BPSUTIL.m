BPSUTIL ;BHAM ISC/FLS - General Utility functions ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
DIC19 ; Convert menu item descriptions to upper case
 N DIC,ENT,GLO,TXT,OPT,VAR,NEW,I
 S DIC=19,GLO="^DIC",TXT="BPS"
 F  S TXT=$O(@GLO@(DIC,"B",TXT)) Q:(TXT]"BPT")!(TXT="")  D
 .  S ENT=$O(@GLO@(DIC,"B",TXT,""))
 .  S VAR=$G(@GLO@(DIC,ENT,0)) Q:VAR=""
 .  S OPT=$P(VAR,"^",2),NEW=OPT
 .  F I=1:1:$L(OPT," ") D
 .  .  S $P(NEW," ",I)=$$MAKEUPR($P(OPT," ",I))
 .  W !,"NEW ",NEW
 .  W !,"OLD ",OPT
 .  Q
 Q
 ;
MAKEUPR(X) ;
 N TST,VAL
 S VAL=X
 S TST=$$UPPER(X)
 I $L(TST)>2,"|THE|FOR|NOW|AND|FOR|"'[("|"_TST_"|") S $E(VAL)=$$UPPER($E(VAL))
 Q VAL
 ;
UPPER(X) ;
 Q $TR(X,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
 ;
ECMEON(SITE) ; - Returns 1 if ECME is turned ON or 0 if not
 ; SITE - Pointer to #59 (OUTPATIENT SITE)
 Q:'$G(SITE) 0
 I $D(^BPS(9002313.56,"C",SITE)) Q 1
 Q 0
 ;
CMOPON(SITE) ; - Returns 1 if CMOP is turned ON for ECME or 0 if not
 ; SITE - Pointer to #59 (OUTPATIENT SITE)
 Q:'$G(SITE) 0
 N PHRM
 S PHRM=$O(^BPS(9002313.56,"C",SITE,0)) I 'PHRM Q 0
 Q $$GET1^DIQ(9002313.56,PHRM,1,"I")
