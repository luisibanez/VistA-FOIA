APCLP17 ; IHS/BJI/GRL - Routine to create bulletin  [ 01/16/05  2:03 PM ]
 ;;3.0;IHS PCC REPORTS;**17**;FEB 15, 1997
 ;;
 ; The following line prevents the "Disable Options..." and "Move
 ; Routines..." questions from being asked during the install.
 F X="XPO1","XPZ1","XPZ2","XPI1" S XPDDIQ(X)=0
 I '$$INSTALLD("ATX*5.1*7") D SORRY(2)
 Q
 ;
PRE ;EP
 F DA=1:1:900 S DIK="^APCLVSTS(" D ^DIK
 ;kill off lister entries
 F DA=1:1:40 S DIK="^APCLRECD(" D ^DIK
 F DA=1:1:10 S DIK="^APCLDMTX(" D ^DIK
 F DA=1:1:40 S DIK="^APCLBMI(" D ^DIK
 F DA=1:1:40 S DIK="^APCLCNTL(" D ^DIK
 F DA=1:1:20 S DIK="^APCLPDES(" D ^DIK
 K ^APCLBMI("H")
 S DA=$O(^DIC(19,"B","APCL DM2005 RUN AUDIT",0)) I DA S DIE="^DIC(19,",DR="2///@" D ^DIE K DIE,DA,DR
 Q
POST ;EP
OPT ;add new options
 NEW X
 S X=$$ADD^XPDMENU("APCL M MAN QUALITY ASSURANCE","APCL P REFUSAL LIST","REF")
 I 'X W "Attempt to add PATIENT REFUSAL LIST report option failed.." H 3
 S X=$$DELETE^XPDMENU("APCL M MAN APC REPORTS/PCC","APCL P APC DX")
 S X=$$ADD^XPDMENU("APCL M MAN PATIENT LISTINGS","APCL M DV REPORTS","DVR")
 I 'X W "Attempt to add DV REPORTS menu option failed.." H 3
 S X=$$ADD^XPDMENU("APCL M DX/PROC COUNT REPORTS","APCL OPERATING PROVIDER REPORT","TOP")
 I 'X W "Attempt to add DV REPORTS menu option failed.." H 3
 S X=$$ADD^XPDMENU("APCL M MAN QUALITY ASSURANCE","APCL P RETURNS TO CLINIC","RT1")
 I 'X W "Attempt to add RETURNS TO CLINIC report option failed.." H 3
 S X=$$ADD^XPDMENU("APCL M DX/PROC COUNT REPORTS","APCL P CPT BY PROVIDER","CPTP")
 I 'X W "Attempt to add CPT BY PROVIDER REPORT menu option failed.." H 3
 S X=$$ADD^XPDMENU("APCL M MAN REPORTS BMI","APCL P BMI MOVE","MBC")
 I 'X W "Attempt to add BMI MOVE menu option failed.." H 3
 S X=$$ADD^XPDMENU("APCL M MAIN DM MENU","APCL DM2005 AUDIT MENU","DM05",2)
 I 'X W "Attempt to add 2005 DM AUDIT menu option failed.." H 3
 S X=$$ADD^XPDMENU("APCL M MAN PATIENT LISTINGS","APCL MENU SUICIDE REPORTS","SUIC")
 I 'X W "Attempt to add SUICIDE REPORTS menu option failed.." H 3
 S X=$$ADD^XPDMENU("APCL M MAN ALL REPORTS","APCL P PCCV TALLY PROV/CLN","TPC")
 I 'X W "Attempt to add TALLY BY PROV/CLINIC menu option failed.." H 3
 S X=$$ADD^XPDMENU("APCL M MAIN DM MENU","APCL DM SELF MONITORING","SMBG")
 I 'X W "Attempt to add Self Monitoring Report failed.." H 3
 S X=$$ADD^XPDMENU("APCL M MAN PATIENT LISTINGS","APCL P PLST DECEASED PTS","DPL")
 I 'X W "Attempt to add DECEASED PTS LISTING menu option failed.." H 3
 S X=$$ADD^XPDMENU("APCL M MAN PATIENT LISTINGS","APCL P PLST THI/NHH","THI")
 I 'X W "Attempt to add TOTAL HOUSEHOLD INCOME LISTING menu option failed.." H 3
 ;
 D DUPE  ;delete out duplicate lab taxonomies
 D LAB
 D ^APCL1TX
 D ^APCL2TX
 D TAXREAD
 ;rename DM AUDIT TROGLITIZONE TO GLITAZONE
 S ATXFLG=1
 S DA=$O(^ATXAX("B","DM AUDIT TROGLITAZONE DRUGS",0))
 I DA S DIE="^ATXAX(",DR=".01///DM AUDIT GLITAZONE DRUGS" D ^DIE,^XBFMK
 ;ADD TAXONOMY TYPE FOR LOINC
 D ^XBFMK
 S APCLDA=$O(^ATXTYPE("B","LOINC CODES",0))
 I 'APCLDA D
 .S DIC="^ATXTYPE(",DIC(0)="L",DIADD=1,DLAYGO=9002229,X="LOINC CODES",DIC("DR")=".02////95.3;.04////1" K DD,DO,D0 D FILE^DICN
 .D ^XBFMK K DIADD,DLAYGO
 .Q
 I '$G(DUZ) W !,"DUZ UNDEFINED OR ZERO.",! Q
 D HOME^%ZIS,DT^DICRW
 ;
 NEW XMSUB,XMDUZ,XMTEXT,XMY,DIFROM
 KILL ^TMP($J,"APCLBUL")
 D WRITEMSG,GETRECIP
 ;Change following lines as desired
SUBJECT S XMSUB="* * * IMPORTANT RPMS INFORMATION * * *"
SENDER S XMDUZ="Cimarron Medical Informatics"
 S XMTEXT="^TMP($J,""APCLBUL"",",XMY(1)="",XMY(DUZ)=""
 I $E(IOST)="C" W !,"Sending Mailman message to holders of the"_" "_APCLKEY_" "_"security key."
 D ^XMD
 KILL ^TMP($J,"APCLBUL"),APCLKEY
 Q
 ;
WRITEMSG ;
 S X=$O(^APCLPDES("B","V3P17",0))
 Q:'X
 S Y=0 F  S Y=$O(^APCLPDES(X,11,Y)) Q:Y'=+Y  S ^TMP($J,"APCLBUL",Y)=^APCLPDES(X,11,Y,0)
 Q
 ;
GETRECIP ;
 ;* * * Define key below to identify recipients * * *
 ;
 S CTR=0,APCLKEY="APCLZMENU"
 F  S CTR=$O(^XUSEC(APCLKEY,CTR)) Q:'CTR  S Y=CTR S XMY(Y)=""
 Q
DUPE ;
 S (APCLX,APCLC)=0 F  S APCLX=$O(^ATXLAB("B","DM AUDIT FASTING GLUCOSE TESTS",APCLX)) Q:APCLX'=+APCLX  S APCLC=APCLC+1 D
 .Q:APCLC=1
 .S DA=APCLX,DIK="^ATXLAB(" D ^DIK
 .Q
 S (APCLX,APCLC)=0 F  S APCLX=$O(^ATXLAB("B","DM AUDIT 75GM 2HR GLUCOSE",APCLX)) Q:APCLX'=+APCLX  S APCLC=APCLC+1 D
 .Q:APCLC=1
 .S DA=APCLX,DIK="^ATXLAB(" D ^DIK
 .Q
 S (APCLX,APCLC)=0 F  S APCLX=$O(^ATXLAB("B","DM AUDIT A/C RATIO TAX",APCLX)) Q:APCLX'=+APCLX  S APCLC=APCLC+1 D
 .Q:APCLC=1
 .S DA=APCLX,DIK="^ATXLAB(" D ^DIK
 .Q
 Q
LAB ;
 S APCLX="DM AUDIT FASTING GLUCOSE TESTS" D LAB1
 S APCLX="DM AUDIT 75GM 2HR GLUCOSE" D LAB1
 S APCLX="DM AUDIT A/C RATIO TAX" D LAB1
 Q
LAB1 ;
 S APCLDA=$O(^ATXLAB("B",APCLX,0))
 I APCLDA S $P(^ATXLAB(APCLDA,0),U,4)="n",$P(^ATXLAB(APCLDA,0),U,22)=0 Q  ;taxonomy already exisits, set nodelete and read only
 W !,"Creating ",APCLX," Taxonomy..."
 S X=APCLX,DIC="^ATXLAB(",DIC(0)="L",DIADD=1,DLAYGO=9002228 D ^DIC K DIC,DA,DIADD,DLAYGO,I
 I Y=-1 W !!,"ERROR IN CREATING ",APCLX," TAX" Q
 S APCLTX=+Y,$P(^ATXLAB(APCLTX,0),U,2)=APCLX,$P(^(0),U,5)=DUZ,$P(^(0),U,6)=DT,$P(^(0),U,8)="B",$P(^(0),U,9)=60,^ATXLAB(APCLTX,21,0)="^9002228.02101PA^0^0"
 S DA=APCLTX,DIK="^ATXAX(" D IX1^DIK
 Q
SETTAXL ;
 Q:'$D(^DD(9002228,4101,0))  ;taxonomy patch not yet installed
 S APCLTEXT="LABTAX" F APCLX=1:1 S APCLDATA=$P($T(@APCLTEXT+APCLX),";;",2) Q:APCLDATA=""  D
 .S APCLDA=$O(^ATXLAB("B",$P(APCLDATA,"|"),0))
 .Q:APCLDA=""
 .S $P(^ATXLAB(APCLDA,0),U,4)="n" W !,$P(APCLDATA,"|")  ;SET NO DELETE
 .S $P(^ATXLAB(APCLDA,0),U,22)=$P(APCLDATA,"|",2) ;set read only
 .;set packages in multiple
 .K DIC,DA,DR
 .S APCLP=$P(APCLDATA,"|",3)
 .F APCLN=1:1 S APCLPP=$P(APCLP,"*",APCLN) Q:APCLPP=""  D
 ..S APCLPI=$O(^DIC(9.4,"C",APCLPP,0))
 ..Q:APCLPI=""  ;NO PACKAGE
 ..S X="`"_APCLPI,DIC="^ATXLAB("_APCLDA_",41,",DIC(0)="L",DIC("P")=$P(^DD(9002228,4101,0),U,2),DA(1)=APCLDA
 ..D ^DIC
 ..I Y=-1 W !,"updating package multiple for ",APCLPP," entry ",$P(^ATXLAB(APCLDA,0),U)," failed"
 ..K DIC,DA,Y,X
 .Q
 Q
INSTALLD(APCLSTAL) ;EP - Determine if patch APCLSTAL was installed, where
 ; APCLSTAL is the name of the INSTALL.  E.g "AG*6.0*11".
 ;
 NEW APCLY,DIC,X,Y
 S X=$P(APCLSTAL,"*",1)
 S DIC="^DIC(9.4,",DIC(0)="FM",D="C"
 D IX^DIC
 I Y<1 D IMES Q 0
 S DIC=DIC_+Y_",22,",X=$P(APCLSTAL,"*",2)
 D ^DIC
 I Y<1 D IMES Q 0
 S DIC=DIC_+Y_",""PAH"",",X=$P(APCLSTAL,"*",3)
 D ^DIC
 S APCLY=Y
 D IMES
 Q $S(APCLY<1:0,1:1)
IMES ;
 D MES^XPDUTL($$CJ^XLFSTR("Patch """_APCLSTAL_""" is"_$S(Y<1:" *NOT*",1:"")_" installed.",IOM))
 Q
SORRY(X) ;
 KILL DIFQ
 I X=3 S XPDQUIT=2 Q
 S XPDQUIT=X
 W *7,!,$$CJ^XLFSTR("Sorry....FIX IT!",IOM)
 Q
LABTAX ;
 ;;DM AUDIT FASTING GLUCOSE TESTS|0|APCL
 ;;DM AUDIT 75GM 2HR GLUCOSE|0|APCL
 ;;
TAXREAD ;
 S ATXPNSP=""
 S APCLTEXT="TAX" F APCLX=1:1 S APCLDATA=$P($T(@APCLTEXT+APCLX),";;",2) Q:APCLDATA=""  D
 .S APCLDA=$O(^ATXAX("B",$P(APCLDATA,"|"),0))
 .Q:APCLDA=""
 .S $P(^ATXAX(APCLDA,0),U,4)="n" W !,$P(APCLDATA,"|")  ;SET NO DELETE
 .S $P(^ATXAX(APCLDA,0),U,22)=$P(APCLDATA,"|",2) ;set read only
 .;set packages in multiple
 .K DIC,DA,DR
 .S APCLP=$P(APCLDATA,"|",3)
 .F APCLN=1:1 S APCLPP=$P(APCLP,"*",APCLN) Q:APCLPP=""  D
 ..S APCLPI=$O(^DIC(9.4,"C",APCLPP,0))
 ..Q:APCLPI=""  ;NO PACKAGE
 ..S X="`"_APCLPI,DIC="^ATXAX("_APCLDA_",41,",DIC(0)="L",DIC("P")=$P(^DD(9002226,4101,0),U,2),DA(1)=APCLDA
 ..D ^DIC
 ..I Y=-1 W !,"updating package multiple for ",APCLPP," entry ",$P(^ATXAX(APCLDA,0),U)," failed"
 ..K DIC,DA,Y,X
 .Q
 Q
SET ;
 S X=0 F  S X=$O(^ATXAX(X)) Q:X'=+X  D
 .S Y=$P(^ATXAX(X,0),U)
 .S L=$L(APCLPNSP)
 .I $E(Y,1,L)=APCLPNSP S $P(^ATXAX(X,0),U,4)="n" W !,Y
 .Q
 Q
TAX ;
 ;;APCL CAR CNM|0|APCL
 ;;APCL CAR DENTISTS|0|APCL
 ;;APCL CAR FNP|0|APCL
 ;;APCL CAR LCSW|0|APCL
 ;;APCL CAR LVN|0|APCL
 ;;APCL CAR OTHER PROVIDERS|0|APCL
 ;;APCL CAR OTHER2|0|APCL
 ;;APCL CAR PA|0|APCL
 ;;APCL CAR PHYSICIANS|0|APCL
 ;;APCL CAR PSYCHIATRIST|0|APCL
 ;;APCL CAR PSYCHOLOGIST|0|APCL
 ;;APCL CAR PT ED|0|APCL
 ;;APCL CAR RDA|0|APCL
 ;;APCL CAR RN|0|APCL
 ;;APCL DIABETES REG COMPLICATION|0|APCL*BDM
 ;;APCL DIABETES REG NEW CASE|0|APCL*BDM
 ;;APCL HRSA TABLE 6 LINE 16|1
 ;;APCL HRSA TABLE 6 LINE 17|1
 ;;APCL HRSA TABLE 6 LINE 20|1
 ;;APCL INJ AIR TRANSPORT|1|APCL
 ;;APCL INJ ANIMAL RELATED|1|APCL
 ;;APCL INJ ASSAULTS|1|APCL
 ;;APCL INJ BATTERED CHILD|1|APCL
 ;;APCL INJ CUT|1|APCL
 ;;APCL INJ DROWNING|1|APCL
 ;;APCL INJ ENVIRONMENTAL FACTORS|1|APCL
 ;;APCL INJ FALLS|1|APCL
 ;;APCL INJ FIRE|1|APCL
 ;;APCL INJ FIREARMS|1|APCL
 ;;APCL INJ MOTOR|1|APCL
 ;;APCL INJ OTHER CAUSES|1|APCL
 ;;APCL INJ POISONING|1|APCL
 ;;APCL INJ SPORTS|1|APCL
 ;;APCL INJ STINGS VENOMS|1|APCL
 ;;APCL INJ SUICIDE|1|APCL
 ;;APCL INJ UNDETERMINED|1|APCL
 ;;APCL INJ WATER TRANSPORT|1|APCL
 ;;DM AUDIT 75GM 2HR LOINC|1|APCL*APCH
 ;;DM AUDIT A/C RATIO LOINC|1|APCL
 ;;DM AUDIT ACARBOSE DRUGS|0|APCL*BDM
 ;;DM AUDIT ACE INHIBITORS|0|APCL*BDM
 ;;DM AUDIT ANTI-PLATELET DRUGS|0|APCL*BDM
 ;;DM AUDIT ASPIRIN DRUGS|0|APCL*BDM
 ;;DM AUDIT CESSATION HLTH FACTOR|0|APCL*BDM
 ;;DM AUDIT DENTAL EXAM ADA CODES|0|APCL*BDM
 ;;DM AUDIT DEPRESSIVE DISORDERS|1|APCL*BDM
 ;;DM AUDIT DIABETES EDUC TOPICS|0|APCL*BDM
 ;;DM AUDIT DIET EDUC TOPICS|0|APCL*BDM
 ;;DM AUDIT EKG CPTS|1|APCL*BDM
 ;;DM AUDIT ESTIMATED GFR LOINC|1|APCL*APCH
 ;;DM AUDIT EXCERCISE EDUC TOPICS|0|APCL
 ;;DM AUDIT EXERCISE EDUC TOPICS|0|APCL
 ;;DM AUDIT EYE EXAM DXS|1|APCL*BDM
 ;;DM AUDIT FASTING GLUC LOINC|1|APCL*APCH
 ;;DM AUDIT FLU CPTS|1|APCL*BDM
 ;;DM AUDIT INSULIN DRUGS|0|APCL*BDM
 ;;DM AUDIT LIPID LOWERING DRUGS|0|APCL*BDM
 ;;DM AUDIT MAMMOGRAM CPTS|1|APCL*BDM
 ;;DM AUDIT METFORMIN DRUGS|0|APCL*BDM
 ;;DM AUDIT ORAL HYPOGLYCEMICS|0|APCL*BDM
 ;;DM AUDIT OTHER EDUC TOPICS|0|APCL*BDM
 ;;DM AUDIT PAP CPTS|1|APCL*BDM
 ;;DM AUDIT PERIDONTAL ADA CODES|0|APCL*BDM
 ;;DM AUDIT PNEUMO CPTS|1|APCL*BDM
 ;;DM AUDIT PRE-DIABETES DXS|1|APCL*BDM*APCH
 ;;DM AUDIT PROBLEM DIABETES DX|1|APCL*BDM
 ;;DM AUDIT PROBLEM HTN DIAGNOSES|1|APCL*BDM
 ;;DM AUDIT PROBLEM SMOKING DXS|1|APCL*BDM
 ;;DM AUDIT PROBLEM TB DXS|1|APCL*BDM
 ;;DM AUDIT SDM PROVIDERS|0|APCL*BDM
 ;;DM AUDIT SELF MONITOR DRUGS|0|APCL*BDM
 ;;DM AUDIT SMOKING CESS EDUC|0|APCL*BDM
 ;;DM AUDIT SMOKING RELATED DXS|1|APCL*BDM
 ;;DM AUDIT STATIN DRUGS|0|APCL*BDM
 ;;DM AUDIT SULFONYLUREA DRUGS|0|APCL*BDM
 ;;DM AUDIT TB HEALTH FACTORS|0|APCL*BDM
 ;;DM AUDIT TD CPTS|1|APCL*BDM
 ;;DM AUDIT TOBACCO HLTH FACTORS|0|APCL*BDM
 ;;DM AUDIT GLITAZONE DRUGS|0|APCL*BDM
 ;;DM AUDIT TYPE I DXS|1|APCL*BDM
 ;;DM AUDIT TYPE II DXS|1|APCL*BDM
 ;;DM AUDIT MICROALBUMIN LOINC CODES|1|APCL
 ;;DM AUDIT URINALYSIS LOINC|1|APCL
 ;;DM AUDIT URINE PROTEIN LOINC|1|APCL
 ;;