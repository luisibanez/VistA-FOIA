BGPMTX ;IHS/MSC/MMT-CREATED BY ^ATXSTX ON FEB 02, 2011;
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 ;
ENV S IN="IHS CLINICAL REPORTING 11.0",INSTDA=""
 I '$D(^XPD(9.7,"B",IN)) D  Q
 .W !,"You must first install the IHS CLINICAL REPORTING 11.0 before installing this patch"
 S INSTDA=$O(^XPD(9.7,"B",IN,INSTDA),-1)
 S STAT=+$P($G(^XPD(9.7,INSTDA,0)),U,9)
 I STAT'=3 D  Q
 .W !,"IHS CLINICAL REPORTING 11.0  must be completely installed before installing this patch"
 S (XPDDIQ("XPZ1"),XPDDIQ("XPZ2"))=0
 Q
 ;
PRE ;PRE-INSTALL ROUTINE
 K ^BGPMUIND(90595.11)
 Q
POST ;Post-Install routine
 S X=$$ADD^XPDMENU("BGP 11 REPORTS MENU","BGPMU MAIN MENU","MUP",50)
 I 'X W "Attempt to add BGPMU MAIN MENU option failed." H 3
 ; See referenced routines to see taxonomies being loaded.
START ;
 D ^BGPMTXA ;   BGPMU BILAT MASTECTOMY ICD
 D ^BGPMTXB ;   BGPMU BMI ENCOUNTER EM
 D ^BGPMTXC ;   BGPMU BMI FOLLOWUP CPTS
 D ^BGPMTXD ;   BGPMU BMI FOLLOWUP ICD
 D ^BGPMTXE ;   BGPMU BMI PERCENTILE ICD
 D ^BGPMTXF ;   BGPMU BP EM
 D ^BGPMTXG ;   BGPMU COLECTOMY CPT
 D ^BGPMTXH ;   BGPMU COLECTOMY ICDS
 D ^BGPMTXI ;   BGPMU COLON CANCER DX
 D ^BGPMTXJ ;   BGPMU COLON CANCER STUDY
 D ^BGPMTXK ;   BGPMU COLON ENC DX
 D ^BGPMTXL ;   BGPMU COLON ENC EM
 D ^BGPMTXM ;   BGPMU COLONOSCOPY CPT
 D ^BGPMTXN ;   BGPMU COLONOSCOPY PROCEDURE
 D ^BGPMTXO ;   BGPMU COUNSELING NUTRITION CPT
 D ^BGPMTXP ;   BGPMU COUNSELING NUTRITION ICD
 D ^BGPMTXQ ;   BGPMU COUNSELING PHYSICAL ACT
 D ^BGPMTXR ;   BGPMU ENC HEALTH AND BEHAVIOR
 D ^BGPMTXS ;   BGPMU ENC OCCUPATIONAL THERAPY
 D ^BGPMTXT ;   BGPMU ENC OFFICE VISIT
 D ^BGPMTXU ;   BGPMU ENC PREV MED GRP COUNSEL
 D ^BGPMTXV ;   BGPMU ENC PREV MED IND COUNSEL
 D ^BGPMTXW ;   BGPMU ENC PREV MED OTHER SVC
 D ^BGPMTXX ;   BGPMU ENC PREV MED SVC 18 UP
 D ^BGPMTXY ;   BGPMU ENC PSYCH AND PSYCH
 D ^BGPMTXZ ;   BGPMU FLU ENCOUNTER EM
 D ^BGPMATXA ;  BGPMU FLU GRP ENCOUNT EM
 D ^BGPMATXB ;  BGPMU FLU IMMUNIZATION CPTS
 D ^BGPMATXC ;  BGPMU FLU IND ENCOUNT EM
 D ^BGPMATXD ;  BGPMU FLU NURS DC ENCOUNT EM
 D ^BGPMATXE ;  BGPMU FLU NURS FAC ENCOUNT EM
 D ^BGPMATXF ;  BGPMU FLU PREV 40 ENCOUNT EM
 D ^BGPMATXG ;  BGPMU FLU PREV OTH ENCOUNT EM
 D ^BGPMATXH ;  BGPMU FOBT CPTS
 D ^BGPMATXI ;  BGPMU FOBT ICD CODES
 D ^BGPMATXJ ;  BGPMU FOBT LOINC
 D ^BGPMATXK ;  BGPMU HYPERTENSION DX
 D ^BGPMATXL ;  BGPMU HYSTERECTOMY CPT
 D ^BGPMATXM ;  BGPMU HYSTERECTOMY DX
 D ^BGPMATXN ;  BGPMU HYSTERECTOMY ICD
 D ^BGPMATXO ;  BGPMU LAB LOINC PAP
 D ^BGPMATXP ;  BGPMU MAMMOGRAM CPTS
 D ^BGPMATXQ ;  BGPMU MAMMOGRAM DX
 D ^BGPMATXR ;  BGPMU MAMMOGRAM DX
 D ^BGPMATXS ;  BGPMU MAMMOGRAM ENC EM
 D ^BGPMATXT ;  BGPMU MAMMOGRAM ENC ICD
 D ^BGPMATXU ;  BGPMU MAMMOGRAM ICD
 D ^BGPMATXV ;  BGPMU MASTECTOMY CPT
 D ^BGPMATXW ;  BGPMU NURSING FAC EM
 D ^BGPMATXX ;  BGPMU NUSING FAC EM
 D ^BGPMATXY ;  BGPMU OBGYN ENC DX
 D ^BGPMATXZ ;  BGPMU PAP CPTS
 D ^BGPMBTXA ;  BGPMU PREGNANCY
 D ^BGPMBTXB ;  BGPMU SIGMOIDOSCOPY CPT
 D ^BGPMBTXC ;  BGPMU SIGMOIDOSCOPY PROCEDURES
 D ^BGPMBTXD ;  BGPMU SMOKING CESSATION AGENTS
 D ^BGPMBTXE ;  BGPMU TERMINAL
 D ^BGPMBTXF ;  BGPMU TOBACCO USE CESS COUNSEL
 D ^BGPMBTXG ;  BGPMU TOBACCO USER HF
 D ^BGPMBTXH ;  BGPMU UNI MASTECTOMY ICDS
 D ^BGPMBTXI ;  BGPMU CIMM ENCOUNTER EM
 D ^BGPMBTXJ ;  BGPMU PREGNANCY ALL ICD
 D ^BGPMCTXB ;  BGPMU BMI ENC PEDS EM
 ;HOSPITAL MEASURES
 ;D START^BGPMHX
 Q