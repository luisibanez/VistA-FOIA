ABMPT267 ; IHS/SD/SDR - 3P BILLING 2.6 Patch 7 POST INIT ;^
 ;;2.6;IHS Third Party Billing;**7**;NOV 12, 2009
 ;
 Q
POST ;
 S DIE="^ABMMUPRM("
 S DA=1
 S DR=".02////@"
 D ^DIE
 ;
 F ABMI=1:1 S ABMLN=$P($T(PCLASS+ABMI),";;",2) Q:ABMLN="END"  D
 .S DA(1)=1
 .S DIC="^ABMMUPRM("_DA(1)_",2,"
 .S DIC(0)="QLM"
 .S X=$P(ABMLN,U)
 .D ^DIC
 Q
PCLASS ;
 ;;PHYSICIAN^00
 ;;PHYSICIAN ASSISTANT^11
 ;;PEDIATRIC NURSE PRACT.^16
 ;;NURSE MIDWIFE^17
 ;;PHYSICIAN (CONTRACT)^18
 ;;NURSE PRACTICIONER^21
 ;;OB/GYN (CONTRACT)^41
 ;;PHYSICIAN (TRIBAL)^44
 ;;OSTEOPATH^45
 ;;CONTRACT PSYCHIATRIST^49
 ;;DENTIST^52
 ;;NEPHROLOGIST^64
 ;;EMERGENCY ROOM PHYSICIAN^68
 ;;CARDIOLOGIST^70
 ;;INTERNAL MEDICINE^71
 ;;OB/GYN^^72
 ;;ORTHOPEDIST^73
 ;;OTOLARYNGOLOGIST^74
 ;;PEDIATRICIAN^75
 ;;RADIOLOGIST^76
 ;;SURGEON^77
 ;;UROLOGIST^78
 ;;OPHTHALMOLOGIST^79
 ;;FAMILY PRACTICE^80
 ;;PSYCHIATRIST^81
 ;;ANESTHESIOLOGIST^82
 ;;PATHOLOGIST^83
 ;;NEUROLOGIST^85
 ;;DERMATOLOGIST^86
 ;;SPORTS MEDICINE PHYSICIAN^A1
 ;;HEPATOLOGIST^A9
 ;;GASTROENTEROLOGIST^B1
 ;;ENDOCRINOLOGIST^B2
 ;;RHEUMATOLOGIST^B3
 ;;ONCOLOGIST-HEMATOLOGIST^B4
 ;;PULMONOLOGIST^B5
 ;;NEUROSURGEON^B6
 ;;END
