APCUTICD ; TEST ROUTINE FOR "AND"ING INVERTED LIST LOOKUP ; [ 11/04/86  2:50 PM ]
 ;
 W !!,"APCUTICD CANNOT BE ENTERED AT THE TOP.",!! Q
 ;
P S APCUTDIC="^ICD0(",APCUTTYP="PROCEDURES" G COMMON
D S APCUTDIC="^ICD9(",APCUTTYP="DIAGNOSES" G COMMON
 ;
COMMON W ! F Q=0:0 R "NARRATIVE: ",L Q:L=""  D LOOKUP
 W !
 K L,Q
 Q
 ;
LOOKUP ;
 I L="^SYN" S DIE="^APCUKWLC(",DR=".011:999",DA=$N(^APCUKWLC("B",APCUTTYP,"")) D ^DIE W ! Q
 I L'?1N.E W ! S L=APCUTTYP_"^20^"_L,DIC=APCUTDIC,DIC("X")="C" D ^APCUKWL Q
 K DIC S DIC=+$P(@(APCUTDIC_"0)"),"^",2),DIC(0)="EQZ",X=L D ^DIC W !
 Q
 ;
ERR K
 I $ZE["<STOR" W !,"Too many hits or partial matches!",!! K  ;G TESTICD
 W !,"Unrecoverable error: ",$ZE,!! Q
