APCH20P9 ; IHS/TUCSON/LAB - PCC HEALTH SUMMARY POST INIT PATCH 9 ;  [ 08/31/02  4:53 PM ]
 ;;2.0;IHS RPMS/PCC Health Summary;**9**;JUN 24, 1997
 ;
 ;
 ; The following line prevents the "Disable Options..." and "Move
 ; Routines..." questions from being asked during the install.
 I $G(XPDENV)=1 S (XPDDIQ("XPZ1"),XPDDIQ("XPZ2"))=0
 ;
 Q
PRE ;EP - pre init
 S DA=$O(^APCHSCMP("B","REFERRED CARE",0)) I DA D
 .S $P(^APCHSCMP(DA,0),U,3)="Y"
 I '$O(^APCHSCMP("B","MICROBIOLOGY",0)) D
 .D ^XBFMK S DIC="^APCHSCMP(",X="MICROBIOLOGY",DIC("DR")="2////Y",DIC(0)="L" K DD,DO,D0 D FILE^DICN
 .I Y=-1 W !!,"adding health summary component MICROBIOLOGY failed." D ^XBFMK Q
 .S $P(^APCHSCMP(+Y,0),U,2)="MIC;APCHS3E"
 .S $P(^APCHSCMP(+Y,0),U,4)="MICROBIOLOGY - See Lab for History and Details"
 I '$O(^APCHSCMP("B","BLOOD BANK - MOST RECENT",0)) D
 .D ^XBFMK S DIC="^APCHSCMP(",X="BLOOD BANK - MOST RECENT",DIC("DR")="2////Y",DIC(0)="L" K DD,DO,D0 D FILE^DICN
 .I Y=-1 W !!,"adding health summary component BLOOD BANK failed." D ^XBFMK Q
 .S $P(^APCHSCMP(+Y,0),U,2)="MRL;APCHS3F"
 .S $P(^APCHSCMP(+Y,0),U,4)="BLOOD BANK (MOST RECENT) - See Lab for History and Details"
 I '$O(^APCHSCMP("B","PATIENT ED - MOST RECENT BY TOPIC",0)) D
 .D ^XBFMK S DIC="^APCHSCMP(",X="PATIENT ED - MOST RECENT BY TOPIC",DIC("DR")="2////Y",DIC(0)="L" K DD,DO,D0 D FILE^DICN
 .I Y=-1 W !!,"adding health summary component PATIENT ED - MOST RECENT BY TOPIC failed." D ^XBFMK Q
 .S $P(^APCHSCMP(+Y,0),U,2)="MRPE;APCHS10"
 I '$O(^APCHSCMP("B","MEDS - CHRONIC EXCLUDING D/C'ED MEDS",0)) D
 .D ^XBFMK S DIC="^APCHSCMP(",X="MEDS - CHRONIC EXCLUDING D/C'ED MEDS",DIC("DR")="2////Y",DIC(0)="L" K DD,DO,D0 D FILE^DICN
 .I Y=-1 W !!,"adding health summary component MEDS - CHRONIC EXCLUDING D/C'ED MEDS failed." D ^XBFMK Q
 .S $P(^APCHSCMP(+Y,0),U,2)="MEDSCHR1;APCHS7"
 .S $P(^APCHSCMP(+Y,0),U,4)="CHRONIC MEDS (AS INDICATED BY PHARMACIST)-EXCL D/C'ed MEDS"
 S DA=$O(^APCHSCTL("B","PATIENT MERGE (COMPLETE)",0))
 I DA K ^APCHSCTL(DA,1)
 Q
POST ;
DMADA ;
 S ATXFLG=1
 W !,"Updating APCH ADA Codes Taxonomy..."
 S APCHTX=0 S APCHTX=$O(^ATXAX("B","APCH DM ADA EXAMS",APCHTX))
 I APCHTX G TX1
 S X="APCH DM ADA EXAMS",DIC="^ATXAX(",DIC(0)="L",DIADD=1,DLAYGO=9002226 D ^DIC K DIC,DA,DIADD,DLAYGO,I I Y=-1 W !!,"ERROR IN CREATING APCH DM ADA EXAMS TAXONOMY" G BUL
 S APCHTX=+Y,$P(^ATXAX(APCHTX,0),U,2)="ADA CODES FOR DM EXAM",$P(^(0),U,5)=DUZ,$P(^(0),U,8)=0,$P(^(0),U,9)=DT,$P(^(0),U,12)=174,$P(^(0),U,13)=0,$P(^(0),U,15)=9999999.31,^ATXAX(APCHTX,21,0)="^9002226.02101A^0^0"
TX1 S APCHTEXT="ADA" F APCHX=1:1:5 S X=$P($T(@APCHTEXT+APCHX),";;",2),DIC="^AUTTADA(",DIC(0)="M" D ^DIC K DIC,DA,DR,DIADD,DLAYGO,DQ,DI,D1,D0 I $P(Y,U)>0 D
 .S Y=+Y Q:$D(^ATXAX(APCHTX,21,"B",Y))  ;this code is already there.
 .S APCHY=0 F  S APCHY=$O(^ATXAX(APCHTX,21,APCHY)) Q:APCHY'=+APCHY  S APCHL=APCHY
 .S APCHL=APCHL+1,^ATXAX(APCHTX,21,APCHL,0)=Y,$P(^ATXAX(APCHTX,21,APCHL,0),U,2)=Y,$P(^ATXAX(APCHTX,21,0),U,3)=APCHL,$P(^(0),U,4)=APCHL,^ATXAX(APCHTX,21,"AA",Y,Y)="",^ATXAX(APCHTX,21,"B",Y,APCHL)=""
 .Q
 S DA=APCHTX,DIK="^ATXAX(" D IX1^DIK
 K APCHTX,APCHDA,APCHTEXT,ATXFLG
 D ^XBFMK
BUL ;
 D ^APCHBUL9
 Q
 ;
ADA ;
 ;;0120
 ;;0150
 ;;0114
 ;;9320
 ;;9321
 ;;
