BIREPQ4 ;IHS/CMI/MWR - REPORT, QUARTERLY IMM; MAY 10, 2010
 ;;8.4;IMMUNIZATION;;MAY 10,2010
 ;;* MICHAEL REMILLARD, DDS * CIMARRON MEDICAL INFORMATICS, FOR IHS *
 ;;  QUARTERLY IMM REPORT, GATHER/STORE PATIENTS.
 ;
 ;
 ;----------
GETPATS(BIBEGDT,BIENDDT,BIAGRP,BICC,BIHCF,BICM,BIBEN,BIQDT,BIHPV) ;EP
 ;---> Get patients from VA PATIENT File, ^DPT(.
 ;---> Parameters:
 ;     1 - BIBEGDT (req) Begin DOB for this group.
 ;     2 - BIENDDT (req) End DOB for this group.
 ;     3 - BIAGRP  (req) Node/number for this Age Group.
 ;     4 - BICC    (req) Current Community array.
 ;     5 - BIHCF   (req) Health Care Facility array.
 ;     6 - BICM    (req) Case Manager array.
 ;     7 - BIBEN   (req) Beneficiary Type array.
 ;     8 - BIQDT   (req) Quarter Ending Date.
 ;     9 - BIHPV   (req) 1=Include Varicella & Pneumo.
 ;
 ;---> Set begin and end dates for search through PATIENT File.
 ;
 Q:'$G(BIBEGDT)  Q:'$G(BIENDDT)  Q:'$G(BIAGRP)
 ;---> Start 1 day prior to Begin Date and $O into the desired DOB's.
 N N S N=BIBEGDT-1
 F  S N=$O(^DPT("ADOB",N)) Q:(N>BIENDDT!('N))  D
 .S BIDFN=0
 .F  S BIDFN=$O(^DPT("ADOB",N,BIDFN)) Q:'BIDFN  D
 ..D CHKSET(BIDFN,.BICC,.BIHCF,.BICM,.BIBEN,BIAGRP,BIQDT,BIHPV)
 Q
 ;
 ;
 ;----------
CHKSET(BIDFN,BICC,BIHCF,BICM,BIBEN,BIAGRP,BIQDT,BIHPV) ;EP
 ;---> Check if this patient fits criteria; if so, set DFN
 ;---> in ^TMP("BIREPQ1".
 ;---> Parameters:
 ;     1 - BIDFN  (req) Patient IEN.
 ;     2 - BICC   (req) Current Community array.
 ;     3 - BIHCF  (req) Health Care Facility array.
 ;     4 - BICM   (req) Case Manager array.
 ;     5 - BIBEN  (req) Beneficiary Type array.
 ;     6 - BIAGRP (req) Node/number for this Age Group.
 ;     7 - BIQDT  (req) Quarter Ending Date.
 ;     8 - BIHPV  (req) 1=Include Varicella & Pneumo.
 ;
 Q:'$G(BIDFN)
 Q:'$D(BICC)
 Q:'$D(BIHCF)
 Q:'$D(BICM)
 Q:'$D(BIBEN)
 Q:'$G(BIAGRP)
 Q:'$G(BIQDT)
 Q:'$D(BIHPV)
 ;
 ;---> Quit if patient is not in the Register.
 Q:'$D(^BIP(BIDFN,0))
 ;
 ;---> Quit if patient does not have an Active HRCN at one or more
 ;---> of the Health Care Facilities selected.
 Q:$$HRCN^BIEXPRT2(BIDFN,.BIHCF)
 ;
 ;---> Quit if patient became Inactive before the Quarter Ending Date.
 ;
 ;---> Exclude patients whose "Inactive Date"="Not in Register."
 N X S X=$$INACT^BIUTL1(BIDFN) I X]"" Q:X<BIQDT
 ;
 ;---> Quit if patient died before the Quarter Ending Date.
 N X S X=$$DECEASED^BIUTL1(BIDFN,1) I X Q:X<BIQDT
 ;
 ;---> Quit if Current Community doesn't match.
 Q:$$CURCOM^BIEXPRT2(BIDFN,.BICC)
 ;
 ;---> Quit if Case Manager doesn't match.
 Q:$$CMGR^BIDUR(BIDFN,.BICM)
 ;
 ;---> Quit if Beneficiary Type doesn't match.
 Q:$$BENT^BIDUR1(BIDFN,.BIBEN)
 ;
 ;---> Store Patient in Age Group.
 S ^TMP("BIREPQ1",$J,"PATS",BIAGRP,BIDFN)=""
 ;
 ;---> RPC to gather Immunization History.
 N BI31,BIDE,BIRETVAL,BIRETERR,I S BI31=$C(31)_$C(31),BIRETVAL=""
 ;---> 55=Vaccine Group IEN, 56=Date of Visit (Fileman).
 F I=55,56 S BIDE(I)=""
 ;---> Fourth parameter=0: Do not return Skin Tests.
 ;---> Fifth parameter=0: Split out combinations as if given individually.
 D IMMHX^BIRPC(.BIRETVAL,BIDFN,.BIDE,0,0)
 ;
 ;---> If BIRETERR has a value, store it and quit.
 S BIRETERR=$P(BIRETVAL,BI31,2)
 Q:BIRETERR]""
 ;
 ;---> Add refusals, if any.
 N Z D CONTRA^BIUTL11(BIDFN,.Z,1) I $O(Z(0)) S BITMP("REFUSALS",BIDFN)=""
 ;
 ;---> Set BIHX=to a valid Immunization History.
 N BIHX S BIHX=$P(BIRETVAL,BI31,1)
 ;
 ;---> Add this Patient's History to stats.
 N I,Y
 ;---> Loop through "^"-pieces of Imm History, getting data.
 F I=1:1 S Y=$P(BIHX,U,I) Q:Y=""  D
 .;
 .;---> Quit (don't count) if Visit was AFTER Quarter Ending Date.
 .Q:($P(Y,"|",3)>BIQDT)
 .;
 .;---> Set this immunization in the STATS array by:
 .;---> Vaccine Group (V), Dose# (D), and Age (A).
 .N A,D,Q,V S A=BIAGRP,V=$P(Y,"|",2)
 .Q:'V
 .;---> Set Dose# (increment by 1's to assign highest/latest dose#).
 .S D=1,Q=0
 .F  Q:Q  D
 ..I $D(BIHX(V,D)) S D=D+1 Q
 ..S BIHX(V,D)="",Q=1
 .;
 .N Z S Z=$G(BITMP("STATS",V,D,A)) S BITMP("STATS",V,D,A)=Z+1
 ;
 ;
 ;
 ;---> Next Section:
 ;---> If this patient has the minimum required immunizations for
 ;---> his/her Age Group, then increment by 1 the "Appro for Age"
 ;---> tally for that Age Group.
 ;---> The code examines Imm Hx array BIHX(VacGrp,Dose#) for each patient.
 ;---> Each Quit represents a condition that a child in that age group
 ;---> must meet in order to be "appropriate for age."
 ;
 ;---> Following lines matrix: Vaccine Group, Dose#.
 ;
 N X S X=1
 I BIAGRP=1 D  D STOR(BIDFN,BIQDT,X) Q
 .Q:'$D(BIHX(1,1))
 .Q:'$D(BIHX(2,1))
 .Q:'$D(BIHX(3,1))
 .Q:'$D(BIHX(4,1))
 .;Q:'$D(BIHX(15,1))  ;Rotavirus, "not at this time" says Ros Singleton, 4-24-07
 .Q:(($G(BIHPV))&('$D(BIHX(11,1))))
 .D APPRO(BIAGRP) S X=2
 ;
 I BIAGRP=2 D  D STOR(BIDFN,BIQDT,X) Q
 .Q:'$D(BIHX(1,2))
 .Q:'$D(BIHX(2,2))
 .Q:'$D(BIHX(3,2))
 .Q:'$D(BIHX(4,2))
 .;Q:'$D(BIHX(15,2))
 .Q:(($G(BIHPV))&('$D(BIHX(11,2))))
 .D APPRO(BIAGRP) S X=2
 ;
 I BIAGRP=3 D  D STOR(BIDFN,BIQDT,X) Q
 .Q:'$D(BIHX(1,3))
 .Q:'$D(BIHX(2,2))
 .Q:'$D(BIHX(3,2))
 .Q:'$D(BIHX(4,2))
 .;Q:'$D(BIHX(15,3))
 .Q:(($G(BIHPV))&('$D(BIHX(11,3))))
 .D APPRO(BIAGRP) S X=2
 ;
 I BIAGRP=4 D  D STOR(BIDFN,BIQDT,X) Q
 .Q:'$D(BIHX(1,3))
 .Q:'$D(BIHX(2,2))
 .Q:'$D(BIHX(3,3))
 .Q:'$D(BIHX(4,2))
 .Q:'$D(BIHX(6,1))
 .;Q:'$D(BIHX(15,3))
 .Q:(($G(BIHPV))&('$D(BIHX(11,4))))
 .Q:(($G(BIHPV))&('$D(BIHX(7,1))))
 .D APPRO(BIAGRP) S X=2
 ;
 I BIAGRP=5 D  D STOR(BIDFN,BIQDT,X) Q
 .Q:'$D(BIHX(1,4))
 .Q:'$D(BIHX(2,3))
 .Q:'$D(BIHX(3,3))
 .Q:'$D(BIHX(4,3))
 .Q:'$D(BIHX(6,1))
 .;Q:'$D(BIHX(15,3))
 .Q:(($G(BIHPV))&('$D(BIHX(11,4))))
 .Q:(($G(BIHPV))&('$D(BIHX(7,1))))
 .D APPRO(BIAGRP) S X=2
 ;
 I BIAGRP=6 D  D STOR(BIDFN,BIQDT,X) Q
 .Q:'$D(BIHX(1,4))
 .Q:'$D(BIHX(2,3))
 .Q:'$D(BIHX(3,3))
 .Q:'$D(BIHX(4,3))
 .Q:'$D(BIHX(6,1))
 .;Q:'$D(BIHX(15,3))
 .Q:(($G(BIHPV))&('$D(BIHX(11,4))))
 .Q:(($G(BIHPV))&('$D(BIHX(7,1))))
 .;Q:(($G(BIHPV))&('$D(BIHX(9,1))))  ;Never include Hep A.
 .D APPRO(BIAGRP) S X=2
 Q
 ;
 ;
 ;----------
APPRO(BIAGRP) ;EP
 ;---> Store Patient in Appropriate for Age Group.
 ;---> Parameters:
 ;     1 - BIAGRP (req) Node/number for this Age Group.
 ;
 ;---> Store Patient in Age Group.
 N Z S Z=$G(BITMP("STATS","APPRO",BIAGRP))
 S BITMP("STATS","APPRO",BIAGRP)=Z+1
 Q
 ;
 ;
 ;----------
STOR(BIDFN,BIQDT,BIVAL) ;EP
 ;---> Store in ^TMP for displaying List of Patients.
 ;---> Parameters:
 ;     1 - BIDFN  (req) Patient IEN.
 ;     2 - BIQDT  (req) Quarter Ending Date.
 ;     3 - BIVAL  (opt) Value to set ^TMP(Pat...) node equal to.
 ;
 Q:'$G(BIDFN)  S:'$G(BIQDT) BIQDT=DT
 D UPDATE^BIPATUP(BIDFN,DT,,1)
 D STORE^BIDUR1(BIDFN,BIQDT,1,,$G(BIVAL))
 Q
