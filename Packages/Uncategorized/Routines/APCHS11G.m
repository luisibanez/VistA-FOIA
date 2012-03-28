APCHS11G ; IHS/CMI/LAB - HEALTH SUMMARY SURVEILLANCE ;
 ;;2.0;IHS PCC SUITE;;MAY 14, 2009
 ;PATCH 2 commented out writing of date
 ;
 ;
 ; *All DM surveillances use the data fetcher for value.  Data is
 ;  returned in array APCHS(1)
 ;
 ; ******** SURVEILLANCE - HARD CODE (for DM patients) ****************
DMFOOT ;ENTRY POINT - diabetic foot exam
 K APCHSEXD,APCHSDF1,APCHSTEX,APCHSTAX
 D DMCHK ;                      is patient diabetic?
 Q:'APCHDMPT
 K APCHS
 S APCHSERR=$$START1^APCLDF(APCHSPAT_"^LAST EXAM DIABETIC FOOT EXAM","APCHS(")
 G:APCHSERR DMFOOTX
 ; *array APCHS(1)="DATE^RESULT^EXAM^VXAM IEN^AUPNVXAM^VISIT IEN"
 K APCHSERR
 S APCHSDIS="DM FOOT EXAM, COMPLETE"
 S APCHSINT=365
 S APCHSEXD=$O(^AUTTEXAM("B","DIABETIC FOOT EXAM, COMPLETE",0))
 S APCHSDF1=9999999.15
 S APCHSIVD=$S($D(APCHS(1)):9999999-$P($P(APCHS(1),U,1),".",1),1:"")
 D DFSURV^APCHS11 ;            computes/print exam due date
DMFOOTX ;
 K APCHDMPT,APCHS,APCHSDF1,APCHSEXD,APCHSTAX,APCHSTEX
 Q
 ;
 ;
DMEYE ;ENTRY POINT - diabetic eye exam
 K APCHSEXD,APCHSDF1,APCHSTEX,APCHSTAX
 D DMCHK ;                      is patient diabetic?
 Q:'APCHDMPT
 K APCHS
 S APCHSERR=$$START1^APCLDF(APCHSPAT_"^LAST EXAM DIABETIC EYE EXAM","APCHS(")
 G:APCHSERR DMEYEX
 ; *array APCHS(1)="DATE^RESULT^EXAM^VXAM IEN^AUPNVXAM^VISIT IEN"
 K APCHSERR
 S APCHSDIS="DM EYE EXAM"
 S APCHSINT=365
 S APCHSEXD=$O(^AUTTEXAM("B","DIABETIC EYE EXAM",0))
 S APCHSDF1=9999999.15
 S APCHSIVD=$S($D(APCHS(1)):9999999-$P($P(APCHS(1),U,1),".",1),1:"")
 D DFSURV^APCHS11 ;            computes/print exam due date
DMEYEX ;
 K APCHDMPT,APCHS,APCHSDF1,APCHSEXD,APCHSTAX,APCHSTEX
 Q
 ;
 ;
DMCHOL ;ENTRY POINT - diabetic CHOLESTEROL lab
 K APCHSEXD,APCHSDF1,APCHSTEX,APCHSTAX
 D DMCHK
 Q:'APCHDMPT
 K APCHS
 S APCHSERR=$$START1^APCLDF(APCHSPAT_"^LAST LAB [DM AUDIT CHOLESTEROL TAX;","APCHS(")
 I APCHSERR D
 .  S:APCHSERR=7 APCHSTEX(1)="DM AUDIT CHOLESTEROL TAXONOMY does not",APCHSTEX(2)=" exist!  Unable to determine Cholesterol",APCHSTEX(3)=" status for this patient.",APCHSTEX(4)=" Notify Site Manager."
 .  S:APCHSERR'=7 APCHSTEX(1)="Unable to determine Cholesterol status",APCHSTEX(2)=" for this patient.  Notify Site Manager."
 .  Q
 ; *array APCHS(1)="DATE^RESULT^LAB TEST^VLAB IEN^AUPNVLAB^VISIT IEN"
 K APCHSERR
 S APCHSDIS="DM CHOLESTEROL"
 S APCHSINT=365
 S APCHSIVD=$S($D(APCHS(1)):9999999-$P($P(APCHS(1),U,1),".",1),1:"")
 S APCHSDF1=60,APCHSTAX=$O(^ATXLAB("B","DM AUDIT CHOLESTEROL TAX",0))
 D DFSURV^APCHS11 ;            computes/print cholesterol due date
DMCHOLX ;
 K APCHDMPT,APCHS,APCHSDF1,APCHSEXD,APCHSTAX,APCHSTEX
 Q
 ;
 ;
DMUPRO ;ENTRY POINT - diabetic urine protein
 K APCHSEXD,APCHSDF1,APCHSTEX,APCHSTAX
 D DMCHK
 Q:'APCHDMPT
 K APCHS
 S APCHSERR=$$START1^APCLDF(APCHSPAT_"^LAST LAB [DM AUDIT URINE PROTEIN TAX;","APCHS(")
 I APCHSERR D
 .  S:APCHSERR=7 APCHSTEX(1)="DM AUDIT URINE PROTEIN TAXONOMY does not",APCHSTEX(2)=" exist!  Unable to determine Urine Protein",APCHSTEX(3)=" status for this patient.",APCHSTEX(4)=" Notify Site Manager."
 .  S:APCHSERR'=7 APCHSTEX(1)="Unable to determine Urine Protein status",APCHSTEX(2)=" for this patient.  Notify Site Manager."
 .  Q
 ; *array APCHS(1)="DATE^RESULT^LAB TEST^VLAB IEN^AUPNVLAB^VISIT IEN"
 K APCHSERR
 S APCHSDIS="DM URINE PROTEIN"
 S APCHSINT=365
 S APCHSIVD=$S($D(APCHS(1)):9999999-$P($P(APCHS(1),U,1),".",1),1:"")
 S APCHSDF1=60,APCHSTAX=$O(^ATXLAB("B","DM AUDIT URINE PROTEIN TAX",0))
 D DFSURV^APCHS11 ;            computes/print cholesterol due date
 D DMCHK
 Q:'APCHDMPT
 K APCHS
DMUPROX ;
 K APCHDMPT,APCHS,APCHSDF1,APCHSEXD,APCHSTAX,APCHSTEX
 Q
 ;IHS/CMI/LAB moved line below from above
DMCREAT ;ENTRY POINT - diabetic CREATININE lab
 K APCHSEXD,APCHSDF1,APCHSTEX,APCHSTAX
 D DMCHK
 Q:'APCHDMPT
 K APCHS
 S APCHSERR=$$START1^APCLDF(APCHSPAT_"^LAST LAB [DM AUDIT CREATININE TAX;","APCHS(")
 I APCHSERR D
 .  S:APCHSERR=7 APCHSTEX(1)="DM AUDIT CREATININE TAXONOMY does not",APCHSTEX(2)=" exist!  Unable to determine Creatinine",APCHSTEX(3)=" status for this patient.",APCHSTEX(4)=" Notify Site Manager."
 .  S:APCHSERR'=7 APCHSTEX(1)="Unable to determine Creatinine status",APCHSTEX(2)=" for this patient.  Notify Site Manager."
 .  Q
 ; *array APCHS(1)="DATE^RESULT^LAB TEST^VLAB IEN^AUPNVLAB^VISIT IEN"
 K APCHSERR
 S APCHSDIS="DM CREATININE"
 S APCHSINT=365
 S APCHSIVD=$S($D(APCHS(1)):9999999-$P($P(APCHS(1),U,1),".",1),1:"")
 S APCHSDF1=60,APCHSTAX=$O(^ATXLAB("B","DM AUDIT CREATININE TAX",0))
 D DFSURV^APCHS11 ;            computes/print creatinine due date
DMCREATX ;
 K APCHDMPT,APCHS,APCHSDF1,APCHSEXD,APCHSTAX,APCHSTEX
 Q
 ;
 ;
DMTRIGL ;ENTRY POINT - diabetic TRIGLYCERIDE lab
 K APCHSEXD,APCHSDF1,APCHSTEX,APCHSTAX
 D DMCHK
 Q:'APCHDMPT
 K APCHS
 S APCHSERR=$$START1^APCLDF(APCHSPAT_"^LAST LAB [DM AUDIT TRIGLYCERIDE TAX;","APCHS(")
 I APCHSERR D
 .  S:APCHSERR=7 APCHSTEX(1)="DM AUDIT TRIGLYCERIDE TAXONOMY does not",APCHSTEX(2)=" exist!  Unable to determine Triglyceride",APCHSTEX(3)=" status for this patient.",APCHSTEX(4)=" Notify Site Manager."
 .  S:APCHSERR'=7 APCHSTEX(1)="Unable to determine Triglyceride status",APCHSTEX(2)=" for this patient.  Notify Site Manager."
 .  Q
 ; *array APCHS(1)="DATE^RESULT^LAB TEST^VLAB IEN^AUPNVLAB^VISIT IEN"
 K APCHSERR
 S APCHSDIS="DM TRIGLYCERIDE"
 S APCHSINT=365
 S APCHSIVD=$S($D(APCHS(1)):9999999-$P($P(APCHS(1),U,1),".",1),1:"")
 S APCHSDF1=60,APCHSTAX=$O(^ATXLAB("B","DM AUDIT TRIGLYCERIDE TAX",0))
 D DFSURV^APCHS11 ;            computes/print triglyceride due date
DMTRIGLX ;
 K APCHDMPT,APCHS,APCHSDF1,APCHSEXD,APCHSTAX,APCHSTEX
 Q
 ;
 ;
DMDENTL ;ENTRY POINT - diabetic DENTAL exam
 ;IHS/CMI/LAB - modified this sub routine
 K APCHSEXD,APCHSDF1,APCHSTEX,APCHSTAX
 D DMCHK
 Q:'APCHDMPT
 K APCHS
 S APCHSERR=$$START1^APCLDF(APCHSPAT_"^LAST ADA [DM AUDIT DENTAL EXAM ADA CODES;","APCHS(")
 I APCHSERR D
 .  S:APCHSERR=7 APCHSTEX(1)="DM AUDIT DENTAL EXAM TAXONOMY does not",APCHSTEX(2)=" exist!  Unable to determine Dental Exam",APCHSTEX(3)=" status for this patient.",APCHSTEX(4)=" Notify Site Manager."
 .  S:APCHSERR'=7 APCHSTEX(1)="Unable to determine Dental Exam status",APCHSTEX(2)=" for this patient.  Notify Site Manager."
 .  Q
 ; *array APCHS(1)="DATE^ADA CODE^ADA CODE^VDEN IEN^AUPNVDEN^VISIT IEN"
 K APCHSERR
 NEW DENTDATE S DENTDATE=$P($G(APCHS(1)),U)
 K APCHS
 NEW % S %=APCHSPAT_"^LAST EXAM DENTAL",E=$$START1^APCLDF(%,"APCHS(")
 S %=$P($G(APCHS(1)),U)
 S DENTDATE=$S(DENTDATE>%:DENTDATE,1:%)
 S APCHSEXD=$O(^AUTTEXAM("B","DENTAL EXAM",0))
 S APCHSDF1=9999999.15
 S APCHSDIS="DM DENTAL EXAM"
 S APCHSINT=365
 S APCHSIVD=$S(DENTDATE]"":9999999-DENTDATE,1:"")
 D DFSURV^APCHS11 ;            computes/print dental exam due date
DMDENTLX ;
 K APCHDMPT,APCHS,APCHSDF1,APCHSEXD,APCHSTAX,APCHSTEX
 Q
 ;
 ;
DMCHK ;is pt diabetic?             YES - APCHDMPT=1   NO - APCHDMPT=0
 S APCHDMPT=0
 D SURVDM ;                   is pt on SURVEILLANCE DIABETES taxonomy?
 G:APCHDMPT DMCHKX
 D PBLIST ;                  does a problem DM dx exist for pt?
 G:APCHDMPT DMCHKX
 D DMPOV ;                    does a DM pov exit for pt?
DMCHKX ;exit out of dm pt check
 Q
 ;
SURVDM ;check SURVEILLANCE DIABETES taxonomy for pt
 S APCHSURD=$O(^ATXAX("B","SURVEILLANCE DIABETES",""))
 Q:'APCHSURD
 S:$D(^ATXPAT(APCHSURD,11,APCHSPAT)) APCHDMPT=1
SURVDMX ;
 Q
 ;
PBLIST ;get first dm dx from problem list
 K APCHS
 S APCHSERR=$$START1^APCLDF(APCHSPAT_"^FIRST PROBLEM [DM AUDIT PROBLEM DIABETES DX","APCHS(")
 G:APCHSERR PBLISTX
 S:$D(APCHS(1)) APCHDMPT=1
PBLISTX ;
 Q
 ;
DMPOV ;does pt have a DM pov?
 K APCHS
 S APCHSERR=$$START1^APCLDF(APCHSPAT_"^LAST DX [SURVEILLANCE DIABETES","APCHS(")
 G:APCHSERR DMPOVX
 S:$D(APCHS(1)) APCHDMPT=1
DMPOVX ;
 Q
 ;
