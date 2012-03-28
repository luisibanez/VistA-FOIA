BGPPOST1 ; IHS/CMI/LAB - NO DESCRIPTION PROVIDED 28 Jan 2005 1:34 PM ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
 ;
DRUGS ;EP set up drug taxonomies
 S ATXFLG=1
 S BGPX="BGP CMS WARFARIN MEDS",BGPTAX="",BGPNDCT="" D DRUG1 D
 .S BGPTX=$O(^ATXAX("B","BGP CMS WARFARIN MEDS",0))
 .Q:'BGPTX
 .S A=0,B="" F  S A=$O(^ATXAX(BGPTX,21,A)) Q:A'=+A  S B=A
 .S BGPC=B
 .S J=0 F  S J=$O(^PSDRUG(J)) Q:J'=+J  S C=$P(^PSDRUG(J,0),U,1) I C["WARFARIN" D
 ..Q:$D(^ATXAX(BGPTX,21,"B",J))
 ..S BGPC=BGPC+1,^ATXAX(BGPTX,21,BGPC,0)=J_U_J,^ATXAX(BGPTX,21,0)="^9002226.02101A^"_BGPC_U_BGPC
 .S DA=BGPTX,DIK="^ATXAX(" D IX1^DIK
 S BGPX="BGP CMS ACEI MEDS",BGPTAX="BGP CMS ACEI MEDS CLASS",BGPNDCT="" D DRUG1
 S BGPX="BGP CMS BETA BLOCKER MEDS",BGPTAX="BGP CMS BETA BLOCKER CLASS",BGPNDCT="BGP CMS BETA BLOCKER NDC" D DRUG1
 S BGPX="BGP CMS ANTIBIOTIC MEDS",BGPTAX="BGP CMS ANTIBIOTICS MEDS CLASS",BGPNDCT="" D DRUG1
 S BGPX="BGP CMS ARB MEDS",BGPTAX="BGP CMS ARB MEDS CLASS",BGPNDCT="" D DRUG1
 S BGPX="DM AUDIT ASPIRIN DRUGS",BGPTAX="",BGPNDCT="" D DRUG1
 S BGPX="DM AUDIT ANTI-PLATELET DRUGS",BGPTAX="BGP CMS ANTI-PLATELET CLASS",BGPNDCT="" D DRUG1
 S BGPX="BGP HEDIS OSTEOPOROSIS DRUGS",BGPTAX="",BGPNDCT="BGP HEDIS OSTEOPOROSIS NDC" D DRUG1
 S BGPX="BGP ASTHMA CONTROLLERS",BGPTAX="",BGPNDCT="BGP ASTHMA CONTROLLER NDC" D DRUG1
 S BGPX="BGP ASTHMA INHALED STEROIDS",BGPTAX="",BGPNDCT="BGP ASTHMA INHALED STEROID NDC" D DRUG1
 S BGPX="BGP ASTHMA LEUKOTRIENE",BGPTAX="",BGPNDCT="BGP ASTHMA LEUKOTRIENE NDC" D DRUG1
 S BGPX="BGP HEDIS ANTIDEPRESSANT MEDS",BGPTAX="",BGPNDCT="BGP HEDIS ANTIDEPRESSANT NDC" D DRUG1
 S BGPX="BGP RA OA NSAID MEDS",BGPTAX="",BGPNDCT="BGP RA OA NSAID NDC" D DRUG1
 S BGPX="BGP OA GLUCOCORTICOIDS MEDS",BGPTAX="BGP OA GLUCOCORTICOIDS CLASS",BGPNDCT="" D DRUG1
 S BGPX="BGP HEDIS ANTIBIOTICS MEDS",BGPTAX="",BGPNDCT="BGP HEDIS ANTIBIOTICS NDC" D DRUG1
 S BGPX="BGP HEDIS ASTHMA LEUK MEDS",BGPTAX="",BGPNDCT="BGP HEDIS ASTHMA LEUK NDC" D DRUG1
 S BGPX="BGP HEDIS ASTHMA MEDS",BGPTAX="",BGPNDCT="BGP HEDIS ASTHMA NDC" D DRUG1
 S BGPX="BGP HEDIS PRIMARY ASTHMA MEDS",BGPTAX="",BGPNDCT="BGP HEDIS PRIMARY ASTHMA NDC" D DRUG1
 S BGPX="BGP HEDIS ASTHMA INHALED MEDS",BGPTAX="",BGPNDCT="BGP HEDIS ASTHMA INHALED NDC" D DRUG1
 S BGPX="BGP HEDIS BETA BLOCKER MEDS",BGPTAX="",BGPNDCT="BGP HEDIS BETA BLOCKER NDC" D DRUG1
 S BGPX="BGP RA IM GOLD MEDS",BGPTAX="",BGPNDCT="BGP RA IM GOLD NDC" D DRUG1
 S BGPX="BGP RA AZATHIOPRINE MEDS",BGPTAX="",BGPNDCT="BGP RA AZATHIOPRINE NDC" D DRUG1
 S BGPX="BGP RA LEFLUNOMIDE MEDS",BGPTAX="",BGPNDCT="BGP RA LEFLUNOMIDE NDC" D DRUG1
 S BGPX="BGP RA ORAL GOLD MEDS",BGPTAX="",BGPNDCT="" D DRUG1
 S BGPX="BGP RA CYCLOSPORINE MEDS",BGPTAX="",BGPNDCT="BGP RA CYCLOSPORINE NDC" D DRUG1
 S BGPX="BGP RA METHOTREXATE MEDS",BGPTAX="",BGPNDCT="BGP RA METHOTREXATE NDC" D DRUG1
 S BGPX="BGP RA MYCOPHENOLATE MEDS",BGPTAX="",BGPNDCT="BGP RA MYCOPHENOLATE NDC" D DRUG1
 S BGPX="BGP RA PENICILLAMINE MEDS",BGPTAX="",BGPNDCT="BGP RA PENICILLAMINE NDC" D DRUG1
 S BGPX="BGP RA SULFASALAZINE MEDS",BGPTAX="",BGPNDCT="BGP RA SULFASALAZINE NDC" D DRUG1
T S BGPX="BGP CMS THROMBOLYTIC MEDS",BGPTAX="BGP THROMBOLYTIC AGENT CLASS",BGPNDCT="" D DRUG1
FIXA ;TAKE OUT ARB'S FROM ASPIRIN TAXONOMY
 S BGPT=$O(^ATXAX("B","DM AUDIT ASPIRIN DRUGS",0))
 I BGPT D
 .S BGPX=0 F  S BGPX=$O(^ATXAX(BGPT,21,BGPX)) Q:BGPX'=+BGPX  D
 ..S BGPY=$P(^ATXAX(BGPT,21,BGPX,0),U)
 ..I $P($G(^PSDRUG(BGPY,0)),U,2)="CV805" D
 ...K ^ATXAX(BGPT,21,"B",BGPY),^ATXAX(BGPT,21,"AA",BGPY),^ATXAX(BGPT,21,BGPX,0)
 K ATXFLG,BGPX,BGPDA,BGPTX
 Q
DRUG1 ;
 W !,"Creating ",BGPX," Taxonomy..."
 S BGPTX=$O(^ATXAX("B",BGPX,0))
 I 'BGPTX D
 .S X=BGPX,DIC="^ATXAX(",DIC(0)="L",DIADD=1,DLAYGO=9002226 D ^DIC K DIC,DA,DIADD,DLAYGO,I
 .I Y=-1 W !!,"ERROR IN CREATING ",BGPX," TAX" Q
 .S BGPTX=+Y,$P(^ATXAX(BGPTX,0),U,2)=BGPX,$P(^(0),U,8)=0,$P(^(0),U,9)=DT,$P(^(0),U,12)=173,$P(^(0),U,13)=0,$P(^(0),U,15)=50,^ATXAX(BGPTX,21,0)="^9002226.02101A^0^0"
 S DA=BGPTX,DIK="^ATXAX(" D IX1^DIK
 I $G(BGPTAX)]"" D
 .S A=0,B="" F  S A=$O(^ATXAX(BGPTX,21,A)) Q:A'=+A  S B=A
 .S BGPC=B
 .S ^ATXAX(BGPTX,21,0)="^9002226.02101A^"_B_U_B
 .S Z=$O(^ATXAX("B",BGPTAX,0))
 .S J=0 F  S J=$O(^PSDRUG(J)) Q:J'=+J  S C=$P(^PSDRUG(J,0),U,2) I C]"",$D(^ATXAX(Z,21,"B",C)) D
 ..Q:$D(^ATXAX(BGPTX,21,"B",J))
 ..S BGPC=BGPC+1,^ATXAX(BGPTX,21,BGPC,0)=J_U_J
 I $G(BGPNDCT)]"" D
 .S A=0,B="" F  S A=$O(^ATXAX(BGPTX,21,A)) Q:A'=+A  S B=A
 .S BGPC=B
 .S ^ATXAX(BGPTX,21,0)="^9002226.02101A^"_B_U_B
 .S Z=$O(^ATXAX("B",BGPNDCT,0))
 .S J=0 F  S J=$O(^PSDRUG(J)) Q:J'=+J  S C=$P($G(^PSDRUG(J,2)),U,4) I C]"",$D(^ATXAX(Z,21,"B",C)) D
 ..Q:$D(^ATXAX(BGPTX,21,"B",J))
 ..S BGPC=BGPC+1,^ATXAX(BGPTX,21,BGPC,0)=J_U_J
 S DA=BGPTX,DIK="^ATXAX(" D IX1^DIK
 Q
 ;
LAB ;EP
 S BGPX=$O(^ATXLAB("B","BGP PCR TAX",0))
 I BGPX S DA=BGPX,DR=".01///BGP HIV VIRAL LOAD TAX",DIE="^ATXLAB(" D ^DIE K DA,DR,DIE,DIV,DIU,DIC
 S BGPX="BGP CD4 TAX" D LAB1
 S BGPX="BGP CHLAMYDIA TESTS TAX" D LAB1
 S BGPX="BGP CMS ABG TESTS" D LAB1
 S BGPX="BGP GPRA ESTIMATED GFR TAX" D LAB1
 S BGPX="BGP GPRA FOB TESTS" D LAB1
 S BGPX="BGP HIV TEST TAX" D LAB1
 S BGPX="BGP HIV VIRAL LOAD TAX" D LAB1
 S BGPX="BGP PAP SMEAR TAX" D LAB1
 S BGPX="DM AUDIT A/C RATIO TAX" D LAB1
 S BGPX="DM AUDIT CHOLESTEROL TAX" D LAB1
 S BGPX="DM AUDIT CREATININE TAX" D LAB1
 S BGPX="DM AUDIT FASTING GLUCOSE TESTS" D LAB1
 S BGPX="DM AUDIT HDL TAX" D LAB1
 S BGPX="DM AUDIT HGB A1C TAX" D LAB1
 S BGPX="DM AUDIT LIPID PROFILE TAX" D LAB1
 S BGPX="DM AUDIT LDL CHOLESTEROL TAX" D LAB1
 S BGPX="DM AUDIT MICROALBUMINURIA TAX" D LAB1
 S BGPX="DM AUDIT TRIGLYCERIDE TAX" D LAB1
 S BGPX="DM AUDIT URINE PROTEIN TAX" D LAB1
 S BGPX="BGP CBC TESTS" D LAB1
 S BGPX="DM AUDIT URINALYSIS TAX" D LAB1
 S BGPX="DM AUDIT AST TAX" D LAB1
 S BGPX="DM AUDIT ALT TAX" D LAB1
 S BGPX="BGP GROUP A STREP TESTS" D LAB1
 S BGPX="BGP LIVER FUNCTION TESTS" D LAB1
 S BGPX="BGP URINE GLUCOSE" D LAB1
 S BGPX="BGP POTASSIUM TESTS" D LAB1
 S BGPX="BGP CMS BLOOD CULTURE" D LAB1
 Q
LAB1 ;
 S BGPDA=$O(^ATXLAB("B",BGPX,0))
 Q:BGPDA  ;taxonomy already exisits
 W !,"Creating ",BGPX," Taxonomy..."
 S X=BGPX,DIC="^ATXLAB(",DIC(0)="L",DIADD=1,DLAYGO=9002228 D ^DIC K DIC,DA,DIADD,DLAYGO,I
 I Y=-1 W !!,"ERROR IN CREATING ",BGPX," TAX" Q
 S BGPTX=+Y,$P(^ATXLAB(BGPTX,0),U,2)=BGPX,$P(^(0),U,5)=DUZ,$P(^(0),U,6)=DT,$P(^(0),U,8)="B",$P(^(0),U,9)=60,^ATXLAB(BGPTX,21,0)="^9002228.02101PA^0^0"
 S DA=BGPTX,DIK="^ATXAX(" D IX1^DIK
 Q
 ;
CLTAX ;EP
 W !,"Creating Primary Care Clinics taxonomy..."
 S BGPDA=0 S BGPDA=$O(^ATXAX("B","BGP PRIMARY CARE CLINICS",BGPDA)) I BGPDA S DA=BGPDA S DIK="^ATXAX(" D ^DIK K DA,DIK
 S X="BGP PRIMARY CARE CLINICS",DIC="^ATXAX(",DIC(0)="L",DIADD=1,DLAYGO=9002226 D ^DIC K DIC,DA,DIADD,DLAYGO,I
 I Y=-1 W !!,"ERROR IN CREATING BGP PRIMARY CARE CLINICS TAX" Q
 S BGPTX=+Y,$P(^ATXAX(BGPTX,0),U,2)="BGP PRIMARY CARE CLINICS",$P(^(0),U,5)=DUZ,$P(^(0),U,8)=0,$P(^(0),U,9)=DT,$P(^(0),U,12)=172,$P(^(0),U,13)=0,$P(^(0),U,15)=40.7,^ATXAX(BGPTX,21,0)="^9002226.02101A^0^0"
 D ^XBFMK K DIADD,DLAYGO S BGPTEXT="CLINICS" F BGPX=1:1:6 S X=$P($T(@BGPTEXT+BGPX),";;",2),Y=$O(^DIC(40.7,"C",X,0)) I Y D
 .S ^ATXAX(BGPTX,21,BGPX,0)=+Y,$P(^ATXAX(BGPTX,21,0),U,3)=BGPX,$P(^(0),U,4)=BGPX,^ATXAX(BGPTX,21,"AA",+Y,+Y)=""
 .Q
 S DA=BGPTX,DIK="^ATXAX(" D IX1^DIK
 Q
 ;
PRVTAX ;EP
 S ATXFLG=1
 W !,"Creating Prescribing provider taxonomy..."
 S BGPDA=0 S BGPDA=$O(^ATXAX("B","BGP PRESCRIBING PROVIDER CLASS",BGPDA)) I BGPDA S DA=BGPDA S DIK="^ATXAX(" D ^DIK K DA,DIK
 S X="BGP PRESCRIBING PROVIDER CLASS",DIC="^ATXAX(",DIC(0)="L",DIADD=1,DLAYGO=9002226 D ^DIC K DIC,DA,DIADD,DLAYGO,I
 I Y=-1 W !!,"ERROR IN CREATING BGP PRESCRIBING PROVIDER CLASS TAX" Q
 S BGPTX=+Y,$P(^ATXAX(BGPTX,0),U,2)="BGP PRESCRIBING PROVIDER CLASS",$P(^(0),U,5)=DUZ,$P(^(0),U,8)=0,$P(^(0),U,9)=DT,$P(^(0),U,12)=210,$P(^(0),U,13)=0,$P(^(0),U,15)=7,^ATXAX(BGPTX,21,0)="^9002226.02101A^0^0"
 D ^XBFMK K DIADD,DLAYGO S BGPTEXT="PREPROV" F BGPX=1:1:43 S X=$P($T(@BGPTEXT+BGPX),";;",2),Y=$O(^DIC(7,"D",X,0)) I Y D
 .S ^ATXAX(BGPTX,21,BGPX,0)=+Y,$P(^ATXAX(BGPTX,21,0),U,3)=BGPX,$P(^(0),U,4)=BGPX,^ATXAX(BGPTX,21,"AA",+Y,+Y)=""
 .Q
 S DA=BGPTX,DIK="^ATXAX(" D IX1^DIK
 Q
 ;
MHTAX ;EP
 S ATXFLG=1
 W !,"Creating Mental Health provider taxonomy..."
 S BGPDA=0 S BGPDA=$O(^ATXAX("B","BGP MENTAL HEALTH PROV CLASS",BGPDA)) I BGPDA S DA=BGPDA S DIK="^ATXAX(" D ^DIK K DA,DIK
 S X="BGP MENTAL HEALTH PROV CLASS",DIC="^ATXAX(",DIC(0)="L",DIADD=1,DLAYGO=9002226 D ^DIC K DIC,DA,DIADD,DLAYGO,I
 I Y=-1 W !!,"ERROR IN CREATING BGP MENTAL HEALTH PROV CLASS TAX" Q
 S BGPTX=+Y,$P(^ATXAX(BGPTX,0),U,2)="BGP MENTAL HEALTH PROV CLASS",$P(^(0),U,5)=DUZ,$P(^(0),U,8)=0,$P(^(0),U,9)=DT,$P(^(0),U,12)=210,$P(^(0),U,13)=0,$P(^(0),U,15)=7,^ATXAX(BGPTX,21,0)="^9002226.02101A^0^0"
 D ^XBFMK K DIADD,DLAYGO S BGPTEXT="MHPROV" F BGPX=1:1:14 S X=$P($T(@BGPTEXT+BGPX),";;",2),Y=$O(^DIC(7,"D",X,0)) I Y D
 .S ^ATXAX(BGPTX,21,BGPX,0)=+Y,$P(^ATXAX(BGPTX,21,0),U,3)=BGPX,$P(^(0),U,4)=BGPX,^ATXAX(BGPTX,21,"AA",+Y,+Y)=""
 .Q
 S DA=BGPTX,DIK="^ATXAX(" D IX1^DIK
 Q
 ;
MHPROV ;
 ;;06
 ;;12
 ;;19
 ;;48
 ;;49
 ;;50
 ;;62
 ;;63
 ;;81
 ;;92
 ;;93
 ;;94
 ;;95
 ;;96
 ;;
CLINICS ;
 ;;01
 ;;06
 ;;13
 ;;20
 ;;24
 ;;28
 ;;
PRVS ;
 ;;00
 ;;11
 ;;16
 ;;17
 ;;18
 ;;21
 ;;25
 ;;33
 ;;41
 ;;44
 ;;45
 ;;49
 ;;64
 ;;68
 ;;69
 ;;70
 ;;71
 ;;72
 ;;73
 ;;74
 ;;75
 ;;76
 ;;77
 ;;78
 ;;79
 ;;80
 ;;81
 ;;82
 ;;83
 ;;84
 ;;85
 ;;86
 ;;A1
 ;;
PREPROV ;;
 ;;00
 ;;08
 ;;11
 ;;16
 ;;17
 ;;18
 ;;21
 ;;24
 ;;25
 ;;30
 ;;33
 ;;41
 ;;44
 ;;45
 ;;47
 ;;49
 ;;64
 ;;67
 ;;68
 ;;70
 ;;71
 ;;72
 ;;73
 ;;74
 ;;75
 ;;76
 ;;77
 ;;78
 ;;79
 ;;80
 ;;81
 ;;82
 ;;83
 ;;85
 ;;86
 ;;A1
 ;;A9
 ;;B1
 ;;B2
 ;;B3
 ;;B4
 ;;B5
 ;;B6
 ;;
PRE ;EP;CHANGE PACKAGE FILE NAME
 S DA=$O(^DIC(9.4,"C","BGP",0))
 I DA S DIE="^DIC(9.4,",DR=".01///IHS CLINICAL REPORTING" D ^DIE K DIE,DA,DR,DIU,DIV
 F BGPX=1:1:2500 S DA=BGPX,DIK="^BGPELIS(" D ^DIK
 F BGPX=1:1:2500 S DA=BGPX,DIK="^BGPELIIS(" D ^DIK
 F BGPX=1:1:25 S DA=BGPX,DIK="^BGPCMSIS(" D ^DIK
 F BGPX=1:1:2500 S DA=BGPX,DIK="^BGPSNPL(" D ^DIK
 F BGPX=1:1:2500 S DA=BGPX,DIK="^BGPHEIS(" D ^DIK
 F BGPX=1:1:2500 S DA=BGPX,DIK="^BGPHEIIS(" D ^DIK
 F BGPX=1:1:2500 S DA=BGPX,DIK="^BGPINDSC(" D ^DIK
 F BGPX=1:1:50 S DA=BGPX,DIK="^BGPINDS(" D ^DIK
 F BGPX=1:1:1000 S DA=BGPX,DIK="^BGPTAXS(" D ^DIK
 F BGPX=1:1:1000 S DA=BGPX,DIK="^BGPTAXTM(" D ^DIK
 F BGPX=1:1:2500 S DA=BGPX,DIK="^BGPELIV(" D ^DIK
 F BGPX=1:1:2500 S DA=BGPX,DIK="^BGPELIIV(" D ^DIK
 F BGPX=1:1:25 S DA=BGPX,DIK="^BGPCMSIF(" D ^DIK
 F BGPX=1:1:2500 S DA=BGPX,DIK="^BGPVNPL(" D ^DIK
 F BGPX=1:1:2500 S DA=BGPX,DIK="^BGPHEIV(" D ^DIK
 F BGPX=1:1:2500 S DA=BGPX,DIK="^BGPHEIIV(" D ^DIK
 F BGPX=1:1:2500 S DA=BGPX,DIK="^BGPINDVC(" D ^DIK
 F BGPX=1:1:50 S DA=BGPX,DIK="^BGPINDV(" D ^DIK
 F BGPX=1:1:2500 S DA=BGPX,DIK="^BGPHEIF(" D ^DIK
 F BGPX=1:1:2500 S DA=BGPX,DIK="^BGPHEIIF(" D ^DIK
 F BGPX=1:1:2500 S DA=BGPX,DIK="^BGPINDFC(" D ^DIK
 F BGPX=1:1:50 S DA=BGPX,DIK="^BGPINDF(" D ^DIK
 F BGPX=1:1:2500 S DA=BGPX,DIK="^BGPINDC(" D ^DIK
 F BGPX=1:1:50 S DA=BGPX,DIK="^BGPIND(" D ^DIK
 F BGPX=1:1:20 S DA=BGPX,DIK="^BGPCTRL(" D ^DIK
 F BGPX=1:1:300 S DA=BGPX,DIK="^BGPTAXV(" D ^DIK
 S X=0 F  S X=$O(^BGPSITE(X)) Q:X'=+X  S $P(^BGPSITE(X,0),U,3)=""
 Q
