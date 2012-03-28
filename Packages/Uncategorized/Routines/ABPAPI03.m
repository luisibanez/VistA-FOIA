ABPAPI03 ;POST INITIALIZATION TASKS - PART 3; [ 07/25/91  4:18 PM ]
 ;;1.4;AO PVT-INS TRACKING;*0*;IHS-OKC/KJR;JULY 25, 1991
 ;---------------------------------------------------------------------
TITLPG ;PROCEDURE TO PRINT DOCUMENTATION TITLE PAGES
 S IOP=+ABPAIO D ^%ZIS I 'POP D
 .U IO W @IOF F I=1:1:18 U IO W !
 .U IO W ?(40-($L(ABPATITL)/2)),ABPATITL,! X ^%ZIS("C")
 Q
 ;---------------------------------------------------------------------
KEYS ;PROCEDURE TO CHECK FOR AND REMOVE UNUSED SECURITY KEYS
 W !!,"   Checking for old, unused security keys..."
 S DIK="^DIC(19.1,",MSG="none found!" F I=1:1 D  Q:ABPAKEY']""
 .S ABPAKEY=$P($T(KEYTEXT+I),";;",2) Q:ABPAKEY']""
 .I $D(^DIC(19.1,"B",ABPAKEY))'=0 K MSG D
 ..S DA=$O(^DIC(19.1,"B",ABPAKEY,"")) Q:+DA'>0
 ..Q:$D(^DIC(19.1,DA,0))'=1
 ..W !,"      Removing the '",ABPAKEY,"' key!"
 ..D ^DIK H 1
 I $D(MSG)=1 W MSG
 Q
 ;---------------------------------------------------------------------
DOCS ;PROCEDURE TO LIST SOME INSTALLATION DOCUMENTATION
 S DIC=9.2,DIC(0)="Z",X="ABPA/INSTALL/GUIDE" D ^DIC I +Y>0 D
 .S XQHFY=+Y,Y=XQHFY,XQFMT=-1 D INIT^XQH4,SET^XQH4
 .S IOP=+ABPAIO D ^%ZIS Q:POP  U IO
 .D LIST^XQH5 X ^%ZIS("C")
 K L,DIC,BY,IOP,X,Y,XQHFY,XQFMT
 S ABPAKVER=$O(^DIC(9.4,"B","KERNEL",""))
 I ABPAKVER]"" I $D(^DIC(9.4,ABPAKVER,"VERSION"))=1 D
 .S ABPAKVER=^("VERSION")
 S ABPATLE="AO PRIVATE INSURANCE TRACKING "
 I $D(DIFROM(0))&($D(DIFQ)) D
 .S ABPATLE=ABPATLE_"V."_DIFROM
 S ABPATITL=ABPATLE_" - SYSTEM MENU TREE" D TITLPG
 S IOP=+ABPAIO_";80;60" D ^%ZIS I 'POP D
 .D INIT^XQ4 K DIC S DIC=19,DIC(0)="Z",X="ABPAMENU" D ^DIC I +Y>0 D
 ..S D0=+Y,MQ=$P(Y(0),"^"),XQ4=0 U IO W @IOF
 ..D:ABPAKVER<6 E^XQ4 D:ABPAKVER>5.99 E^XQ41
 ..D GO^XQ4
 .X ^%ZIS("C") K L,DIC,D0,MQ,X,Y,IOP
 S ABPATITL=ABPATLE_" - SYSTEM OPTIONS" D TITLPG
 S L=0,DIC=19,BY="[ABPA/OPTION/LIST]",IOP=+ABPAIO_";80;60" D EN^DIP
 S ABPATITL=ABPATLE_" - SYSTEM SORT TEMPLATES" D TITLPG
 S L=0,DIC=.401,BY="[ABPA/SORT/TEMPLATE/LIST]",IOP=+ABPAIO_";80;60"
 D EN^DIP
 S L=0,DIC=.401,BY="[ABPA/SORT/TEMPLATE/DOC]",IOP=+ABPAIO_";80;60"
 D EN^DIP
 S ABPATITL=ABPATLE_" - SYSTEM PRINT TEMPLATES" D TITLPG
 S L=0,DIC=.4,BY="[ABPA/PRINT/TEMPLATE/LIST]",IOP=+ABPAIO_";80;60"
 D EN^DIP
 S L=0,DIC=.4,BY="[ABPA/PRINT/TEMPLATE/DOC]",IOP=+ABPAIO_";80;60"
 D EN^DIP
 S IOP=+ABPAIO_";80;60" D ^%ZIS
 Q
 ;---------------------------------------------------------------------
 ;DATA TEXT LINES USED DURING SUB-ROUTINE EXECUTION
KEYTEXT ;;INVALID SECURITY KEY NAMES
 ;;ABPAZEXP
 ;;ABPAZIPD
 ;;ABPAZLPD
 ;;
