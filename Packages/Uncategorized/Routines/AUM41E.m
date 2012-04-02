AUM41E ;IHS/ASDST/DMJ,SDR,GTH - ICD 9 CODES FOR FY 2004 ; [ 08/26/2003  8:36 AM ]
 ;;04.1;TABLE MAINTENANCE;;SEP 28,2001
 ;
 ; Update DRGs
 ;
CORRECT ;EP
 K DA
 S DIE="^ICD9("
 F AUMCD="309","309.1","309.21","309.22","309.23","309.24","309.28","309.29","309.3","309.4","309.81","309.82","309.83","309.89","309.9" D
 . S DA=$O(^ICD9("BA",AUMCD,""))
 . Q:DA=""
 . S DR="9999999.01///@"
 . D ^DIE
 Q
DRGS ;EP
 NEW AUMDA,AUMI,AUMLN,DA,DIE,DR
 F AUMI=1:1 S AUMLN=$P($T(DRG+AUMI),";;",2) Q:AUMLN="END"  D
 . S Y=$$IXDIC^AUM41("^ICD(","ILX","B","DRG"_$P(AUMLN,U),80.2)
 . I Y=-1 Q
 . S DA=+Y
 . S DR=".01///DRG"_$P(AUMLN,U)       ;title
 . S DR=DR_";.06///"_$P(AUMLN,U,3)   ;surgery?
 . S DR=DR_";5///"_$P(AUMLN,U,2)     ;MDC
 . S DIE="^ICD("
 . S AUMDA=DA
 . D DIE^AUM41
 . S DA(1)=AUMDA
 . S DIC(0)="LOX"
 . S X=1
 . S DIC("P")=$P(^DD(80.2,1,0),"^",2)
 . S DIC="^ICD("_DA(1)_",1,"
 . S DIC("DR")=".01///"_$P(AUMLN,U,4)  ;description
 . D ^DIC
 Q
DRG ;;DRG^MDC^SURGERY?^DRG TITLE
 ;;511^22^^NON-EXTENSIVE BURNS W/O CC OR SIGNIFICANT TRAUMA
 ;;512^^1^SIMULTANEOUS PANCREAS/KIDNEY TRANSPLANT
 ;;513^^1^PANCREAS TRANSPLANT
 ;;514^5^1^NO LONGER VALID
 ;;515^5^1^CARDIAC DEFIBRILLATOR IMPLANT W/O CARDIAC CATH
 ;;516^5^1^PERCUTANEOUS CARDIOVASC PROC W AMI
 ;;517^5^1^PERC CARDIO PROC W NON-DRUG ELUTING STENT W/O AMI
 ;;518^5^1^PERC CARDIO PROC W/O CORONARY ARTERY STENT OR AMI
 ;;519^8^1^CERVICAL SPINAL FUSION W CC
 ;;520^8^1^CERVICAL SPINAL FUSION W/CC
 ;;521^20^^ALCOHOL/DRUG ABUSE OR DEPENDENCE W CC
 ;;522^20^^ALC/DRUG ABUSE OR DEPEND W REHABILITATION THERAPY W/O CC
 ;;523^20^^ALC/DRUG ABUSE OR DEPEND W/O REHABILITATION THERAPY W/O CC
 ;;524^1^^TRANSIENT ISCHEMIA
 ;;525^5^1^HEART ASSIST SYSTEM IMPLANT
 ;;526^5^1^PERCUTNEOUS CARDIOVASULAR PROC W DRUG ELUTING STENT W AMI
 ;;527^5^1^PERCUTNEOUS CARDIOVASULAR PROC W DRUG ELUTING STENT W/O AMI
 ;;528^1^1^INTRACRANIAL VASCULAR PROC W PDX HEMORRHAGE
 ;;529^1^1^VENTRICULAR SHUNT  PROCEDURES W CC
 ;;530^1^1^VENTRICULAR SHUNT  PROCEDURES W/O CC
 ;;531^1^1^SPINAL PROCEDURES W CC
 ;;532^1^1^SPINAL PROCEDURES W/O CC
 ;;533^1^1^EXTRACRANIAL PROCEDURES W CC
 ;;534^1^1^EXTRACRANIAL PROCEDURES W/O CC
 ;;535^5^1^CARDIAC DEFIB IMPLANT W CARDIAC CATH W AMI/HF/SHOCK
 ;;536^5^1^CARDIAC DEFIB IMPLANT W CARDIAC CATH W/O AMI/HF/SHOCK
 ;;537^8^1^LOCAL EXCIS & REMOV OF INT FIX DEV EXCEPT HIP & FEMUR W CC
 ;;538^8^1^LOCAL EXCIS & REMOV OF INT FIX DEV EXCEPT HIP & FEMUR W/O CC
 ;;539^17^1^LYMPHOMA & LEUKEMIA W MAJOR OR PROCEDURE W CC
 ;;540^17^1^LYMPHOMA & LEUKEMIA W MAJOR OR PROCEDURE W/O CC
 ;;END
 Q