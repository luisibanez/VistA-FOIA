AUM111D ;IHS/SD/RNB - ICD 9 CODES FOR FY 2011 ; [ 09/09/2010   8:30 AM ]
 ;;11.0;TABLE MAINTENANCE;;OCT 15,2010
 ;
 ;
ICD9PNEW ;;ICD OPERATION/PROCEDURE, NEW PROCEDURE CODES: CODE NUMBER(#.01)^OPERATION/PROCEDURE(#4)^DESCRIPTION(#10)^Use with Sex(#9.5)^MDC(#80.12)-DRG(#80.12,1-6) (multiples are separated by "~"
 ;;00.60^Insert drg-elut stent superficial femoral artery^Insertion of drug-eluting stent(s) of superficial femoral artery^^^^
 ;;01.20^Cranial implan/repla neurostimulator pulse genera^Cranial implantation or replacement of neurostimulator pulse generator^^1-23,24,40,41,42^^
 ;;01.29^Remove of cranial neurostimulator pulse generator^Removal of cranial neurostimulator pulse generator^^1-40,41,42^^
 ;;17.71^Non-coronary intra-operative fluorescence IFVA^Non-coronary intra-operative fluorescence vascular angiography [IFVA]^^^^
 ;;32.27^Bronchoscop bronchial thermoplas, ablation airway^Bronchoscopic bronchial thermoplasty, ablation of airway^^4-163,164,165^^
 ;;35.97^Percutaneous mitral valve repair with implant^Percutaneous mitral valve repair with implant^^5-231,232,246,247,248,249,250,251^^
 ;;37.37^Excise/destruct oth heart les/tis, thoracosopic ap^Excision or destruction of other lesion or tissue of heart, thoracoscopic approach^^5-228,229,230^^
 ;;38.97^Central venous catheter placement with guidance^Central venous catheter placement with guidance^^^^
 ;;39.81^Implant/repla carotid sinus stimul devic, totl sys^Implantation or replacement of carotid sinus stimulation device, total system^^5-252,253,254^^
 ;;39.82^Implant/replac carotid sinus stimul lead(s) only^Implantation or replacement of carotid sinus stimulation lead(s) only^^5-252,253,254^^
 ;;39.83^Implant/replac carotid sinus stimul pulse gen only^Implantation or replacement of carotid sinus stimulation pulse generator only^^5-252,253,254^^
 ;;39.84^Revision carotid sinus stimulation lead(s) only^Revision of carotid sinus stimulation lead(s) only^^5-252,253,254^^
 ;;39.85^Revision carotid sinus stimul pulse generator^Revision of carotid sinus stimulation pulse generator^^5-252,253,254^^
 ;;39.86^Removal carotid sinus stimul device, total system^Removal of carotid sinus stimulation device, total system^^5-252,253,254^^
 ;;39.87^Removal of carotid sinus stimulation lead(s) only^Removal of carotid sinus stimulation lead(s) only^^5-252,253,254^^
 ;;39.88^Removal carotid sinus stimulation pulse gen only^Removal of carotid sinus stimulation pulse generator only^^5-252,253,254^^
 ;;39.89^Oth opers carotid body, sinus, oth vascul bodies^Other operations on carotid body, carotid sinus and other vascular bodies^^5-252,253,254^^
 ;;81.88^Reverse total shoulder replacement^Reverse total shoulder replacement^^8-483,484~21-907,908,909~24-957,958,959^^
 ;;84.94^Insert sternal fixation device with rigid plates^Insertion of sternal fixation device with rigid plates^^4-166,167,168~5-264~8-515,516,517~21-907,908,909^^
 ;;85.55^Fat graft to breast^Fat graft to breast^^9-584,585^^
 ;;86.87^Fat graft of skin and subcutaneous tissue^Fat graft of skin and subcutaneous tissue^^3-133,134~9-579,580,521~10-619,620,621~21-907,908,909~24-957,958,959^^
 ;;86.90^Extraction of fat for graft or banking^Extraction of fat for graft or banking^^9-579,580,581^^
 ;;END
ICD9DINA ;;ICD 9 DIAGNOSIS, INACTIVE CODES: CODE NUMBER(#.01)^DESCRIPTION(#10)^INACTIVE DATE(#102)
 ;;275.0^Disorders of iron metabolism^OCT 1, 2010
 ;;276.6^Fluid overload^OCT 1, 2010
 ;;287.4^Secondary thrombocytopenia^OCT 1, 2010
 ;;488.0^Influenza due to identified avian influenza virus^OCT 1, 2010
 ;;488.1^Influenza due to identified novel H1N1 influenza virus^OCT 1, 2010
 ;;752.3^Other anomalies of uterus^OCT 1, 2010
 ;;786.3^Hemoptysis^OCT 1, 2010
 ;;787.6^Incontinence of feces^OCT 1, 2010
 ;;970.8^Poisoning by other specified central nervous system stimulants^OCT 1, 2010
 ;;999.6^ABO incompatibility reaction^OCT 1, 2010
 ;;999.7^Rh incompatibility reaction^OCT 1, 2010
 ;;V25.1^Encounter for insertion of intrauterine contraceptive device^OCT 1, 2010
 ;;V85.4^Body Mass Index 40 and over, adult^OCT 1, 2010
 ;;END
ICD9EINA ;;ICD 9 DIAGNOSIS, INACTIVATED E-CODES: CODE NUMBER(#.01)^DESCRIPTION(#10)^INACTIVE DATE(#102)
 ;;E992.^Injury due to war operations by explosion of marine weapons^OCT 1, 2009
 ;;E998.^Injury due to war operations but occurring after cessation of hostilities^OCT 1, 2009
 ;;END
 ;
ICD9OINA ;;ICD 9 DIAGNOSIS, OTHER INACTIVATED CODES: CODE NUMBER(#.01)^DESCRIPTION(#10)^INACTIVE DATE(#102)
 ;;END
PRNT ;
 S U="^"
 W !," CODE",?10,"DIAGNOSIS",!?10,"DESCRIPTION",!," -----",?10,"-----------"
 NEW X,Y,P2,P3
 F X=1:1 S Y=$P($T(ICD9NEW+X),";;",3),P2=$P(Y,U,2),P3=$P(Y,U,3) Q:Y="END"  W !," ",$P(Y,U,1),?10,$S($L(P3):P3,1:P2),!?10,P2
 Q
