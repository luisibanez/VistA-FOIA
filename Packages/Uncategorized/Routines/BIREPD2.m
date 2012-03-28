BIREPD2 ;IHS/CMI/MWR - REPORT, ADOLESCENT RATES; MAY 10, 2010
 ;;8.4;IMMUNIZATION;;MAY 10,2010
 ;;* MICHAEL REMILLARD, DDS * CIMARRON MEDICAL INFORMATICS, FOR IHS *
 ;;  VIEW ADOLESCENT IMMUNIZATION RATES REPORT, GATHER DATA.
 ;
 ;
 ;----------
HEAD(BIQDT,BIDAR,BIAGRPS,BICC,BIHCF,BICM,BIBEN,BIUP) ;EP - Header for Adolescent Report.
 ;---> Produce Header array for Adolescent Report.
 ;---> Parameters:
 ;     1 - BIQDT   (req) Quarter Ending Date.
 ;     2 - BIDAR   (req) Adolescent Report Age Range: "11-18^1" (years).
 ;     3 - BIAGRPS (req) String of Age Groups ("1112,1315,1618").
 ;     4 - BICC    (req) Current Community array.
 ;     5 - BIHCF   (req) Health Care Facility array.
 ;     6 - BICM    (req) Case Manager array.
 ;     7 - BIBEN   (req) Beneficiary Type array.
 ;     8 - BIUP    (req) User Population/Group (Registered, Imm, User, Active).
 ;
 ;---> Check for required Variables.
 Q:'$G(BIQDT)
 Q:'$D(BICC)
 Q:'$D(BIHCF)
 Q:'$D(BICM)
 Q:'$D(BIBEN)
 Q:'$D(BIDAR)
 Q:'$G(BIAGRPS)
 Q:'$D(BIUP)
 ;
 K VALMHDR
 N BILINE,X S BILINE=0
 ;
 N X S X=""
 ;---> If Header array is NOT being for Listmananger include version.
 S:'$D(VALM("BM")) X=$$LMVER^BILOGO()
 ;
 D WH^BIW(.BILINE,X)
 S X=$$REPHDR^BIUTL6(DUZ(2)) D CENTERT^BIUTL5(.X)
 D WH^BIW(.BILINE,X)
 ;
 S X="IHS Adolescent Immunization Rates" D CENTERT^BIUTL5(.X)
 D WH^BIW(.BILINE,X)
 ;
 S X="Ages "_$P(BIDAR,"-")_"-17 Years  -  "
 D
 .I BIUP="r" S X=X_"Registered Patients (All)" Q
 .I BIUP="i" S X=X_"Immunization Register Patients (Active)" Q
 .I BIUP="u" S X=X_"User Population (1 visit, 3 yrs)" Q
 .I BIUP="a" S X=X_"Active Users (2+ visits, 3 yrs)" Q
 .S X=X_"error: Unknown Patient Group)" Q
 D CENTERT^BIUTL5(.X)
 D WH^BIW(.BILINE,X,1)
 ;
 S X=" As of: "_$$TXDT1^BIUTL5(BIQDT)_$$SP^BIUTL5(12)
 S X=X_$J("Total Patients: "_$G(BITOTPTS)_"  Total Females: "_$G(BITOTFPT),44)
 D WH^BIW(.BILINE,X)
 S X=$$SP^BIUTL5(79,"-")
 D WH^BIW(.BILINE,X)
 ;
 D
 .;---> If specific Communities were selected (not ALL), then print
 .;---> the Communities in a subheader at the top of the report.
 .D SUBH^BIOUTPT5("BICC","Community",,"^AUTTCOM(",.BILINE,.BIERR,,12)
 .I $G(BIERR) D ERRCD^BIUTL2(BIERR,.X) D WH^BIW(.BILINE,X) Q
 .;
 .;---> If specific Health Care Facilities, print subheader.
 .D SUBH^BIOUTPT5("BIHCF","Facility",,"^DIC(4,",.BILINE,.BIERR,,12)
 .I $G(BIERR) D ERRCD^BIUTL2(BIERR,.X) D WH^BIW(.BILINE,X) Q
 .;
 .;---> If specific Case Managers, print Case Manager subheader.
 .D SUBH^BIOUTPT5("BICM","Case Manager",,"^VA(200,",.BILINE,.BIERR,,12)
 .I $G(BIERR) D ERRCD^BIUTL2(BIERR,.X) D WH^BIW(.BILINE,X) Q
 .;
 .;---> If specific Beneficiary Types, print Beneficiary Type subheader.
 .D SUBH^BIOUTPT5("BIBEN","Beneficiary Type",,"^AUTTBEN(",.BILINE,.BIERR,,12)
 .I $G(BIERR) D ERRCD^BIUTL2(BIERR,.X) D WH^BIW(.BILINE,X) Q
 .;
 .;---> Now write Age Group Denominators subheader.
 .S X="  Age Group      |       11-12yrs      13yrs       13-17yrs"
 .D WH^BIW(.BILINE,X)
 .S X="  Denominators   |     "_$J($G(BITOTPTS(1112)),7)_"      "
 .S X=X_$J($G(BITOTPTS(1313)),7)_"      "_$J($G(BITOTPTS(1317)),7)
 .;S X=X_"      "_$J($G(BITOTPTS(1315))+$G(BITOTPTS(1618)),7)
 .D WH^BIW(.BILINE,X)
 ;
 ;---> If Header array is being built for Listmananger,
 ;---> reset display window margins for Communities, etc.
 D:$D(VALM("BM"))
 .S VALM("TM")=BILINE+3
 .S VALM("LINES")=VALM("BM")-VALM("TM")+1
 .;---> Safeguard to prevent divide/0 error.
 .S:VALM("LINES")<1 VALM("LINES")=1
 Q
 ;
 ;
 ;----------
FEMALES(BILINE,BITOTFPT) ;EP
 ;---> Produce Female Denominators subheader.
 ;---> Parameters:
 ;     1 - BILINE   (req) Line number in ^TMP Listman array.
 ;     2 - BITOTFPT (req) Female Total Patients-Age Group-Stats arrsy.
 ;
 ;---> Break to write Female Denominators subheader.
 S X="  Female         |       11-12yrs      13yrs       13-17yrs"
 D WRITE^BIREPD3(.BILINE,X)
 S X="  Denominators   |     "_$J($G(BITOTFPT(1112)),7)_"      "
 S X=X_$J($G(BITOTFPT(1313)),7)_"      "_$J($G(BITOTFPT(1317)),7)
 ;S X=X_"      "_$J($G(BITOTFPT(1315))+$G(BITOTFPT(1618)),7)
 D WRITE^BIREPD3(.BILINE,X)
 D WRITE^BIREPD3(.BILINE,"                "_$$SP^BIUTL5(63,"-"))
 Q
 ;
 ;
 ;----------
START(BIQDT,BIDAR,BIAGRPS,BICC,BIHCF,BICM,BIBEN,BISITE,BIUP) ;EP
 ;---> Produce array for Report.
 ;---> Parameters:
 ;     1 - BIQDT   (req) Quarter Ending Date.
 ;     2 - BIDAR   (opt) Adolescent Report Age Range: "11-18^1" (years).
 ;     3 - BIAGRPS (req) String of Age Groups ("1112,1315,1618").
 ;     4 - BICC    (req) Current Community array.
 ;     5 - BIHCF   (req) Health Care Facility array.
 ;     6 - BICM    (req) Case Manager array.
 ;     7 - BIBEN   (req) Beneficiary Type array.
 ;     8 - BISITE  (req) Site IEN.
 ;     9 - BIUP    (req) User Population/Group (All, Imm, User, Active).
 ;
 K ^TMP("BIREPD1",$J)
 N BILINE,BITMP,X S BILINE=0
 ;
 ;---> Check for required Variables.
 I '$G(BIQDT) D ERRCD^BIUTL2(623,.X) D WRITE^BIREPD3(.BILINE,X) Q
 I '$D(BIDAR)  D ERRCD^BIUTL2(613,.X) D WRITE^BIREPD3(.BILINE,X) Q
 I '$G(BIAGRPS) D ERRCD^BIUTL2(677,.X) D WRITE^BIREPD3(.BILINE,X) Q
 I '$D(BICC) D ERRCD^BIUTL2(614,.X) D WRITE^BIREPD3(.BILINE,X) Q
 I '$D(BIHCF) D ERRCD^BIUTL2(625,.X) D WRITE^BIREPD3(.BILINE,X) Q
 I '$D(BICM) D ERRCD^BIUTL2(615,.X) D WRITE^BIREPD3(.BILINE,X) Q
 I '$D(BIBEN)  D ERRCD^BIUTL2(662,.X) D WRITE^BIREPD3(.BILINE,X) Q
 I '$G(BISITE) S BISITE=$G(DUZ(2))
 I '$G(BISITE) D ERRCD^BIUTL2(109,.X) D WRITE^BIREPD3(.BILINE,X) Q
 S:$G(BIUP)="" BIUP="u"
 ;
 ;---> Gather data.
 D GETDATA^BIREPD3(.BICC,.BIHCF,.BICM,.BIBEN,BIQDT,BIDAR,BIAGRPS,BISITE,BIUP,.BITMP,.BIERR)
 I $G(BIERR)]"" D WRITE^BIREPD3(.BILINE,BIERR) Q
 ;
 ;
 ;---> BITOTPTS variables (total patients) not newed here because they are
 ;---> also used in the Report Header.
 S BITOTPTS=+$G(BITMP("STATS","TOTLPTS"))
 S BITOTPTS(1112)=+$G(BITMP("STATS","TOTLPTS",1112))
 S BITOTPTS(1313)=+$G(BITMP("STATS","TOTLPTS",1313))
 S BITOTPTS(1317)=+$G(BITMP("STATS","TOTLPTS",1317))
 S BITOTFPT=+$G(BITMP("STATS","TOTLFPTS"))
 S BITOTFPT(1112)=+$G(BITMP("STATS","TOTLFPTS",1112))
 S BITOTFPT(1313)=+$G(BITMP("STATS","TOTLFPTS",1313))
 S BITOTFPT(1317)=+$G(BITMP("STATS","TOTLFPTS",1317))
 ;
 ;
 ;---> VACCINE GROUPS
 ;---> Write Statistics lines for each Vaccine Group (BIVGRP).
 ;---> NOTE: 132 is specific for Var-Hx of Chickenpox.
 ;--->       221 is for the specific vaccine Tdap.
 F BIVGRP=4,6,7,132,221,8,9,16,10 D VGRP^BIREPD3(.BILINE,BIVGRP,BIAGRPS,.BITMP,.BIERR)
 I $G(BIERR)]"" D WRITE^BIREPD3(.BILINE,BIERR) Q
 ;
 ;---> Break to write Female Denominators subheader.
 ;D FEMALES(.BILINE,.BITOTFPT)
 ;
 ;---> Finish writing Statistics lines for Vaccine Groups (BIVGRP=17-HPV).
 ;F BIVGRP=17 D VGRP^BIREPD3(.BILINE,BIVGRP,BIAGRPS,.BITMP,.BIERR)
 ;I $G(BIERR)]"" D WRITE^BIREPD3(.BILINE,BIERR) Q
 ;
 ;
 ;---> VACCINE COMBINATIONS
 ;---> Write Statistics lines for each Vaccine Combinations.
 ;---> NOTE: These Combo strings are also used to set BITMP("STATS"
 ;---> nodes beginning at +130^BIREPD4.
 ;
 ;
 D VCOMB^BIREPD3(.BILINE,"8|1^4|3^6|2^7|1",BIAGRPS,.BITMP,.BIERR)
 D VCOMB^BIREPD3(.BILINE,"8|1^4|3^6|2^16|1^7|2",BIAGRPS,.BITMP,.BIERR)
 ;
 ;---> Break to write Female Denominators subheader.
 D FEMALES(.BILINE,.BITOTFPT)
 ;
 ;---> Write Statistics lines for HPV Vaccine Group (BIVGRP=17-HPV).
 F BIVGRP=17 D VGRP^BIREPD3(.BILINE,BIVGRP,BIAGRPS,.BITMP,.BIERR)
 I $G(BIERR)]"" D WRITE^BIREPD3(.BILINE,BIERR) Q
 ;
 ;---> Now write female combo.
 D VCOMB^BIREPD3(.BILINE,"8|1^4|3^6|2^16|1^7|2^17|3",BIAGRPS,.BITMP,.BIERR)
 ;
 I $G(BIERR)]"" D WRITE^BIREPD3(.BILINE,BIERR) Q
 ;
 ;---> Finish off report with totals lines at the bottom.
 S X=" Total Patients reviewed: "_BITOTPTS
 S X=X_"   Total Females reviewed: "_BITOTFPT
 D WRITE^BIREPD3(.BILINE,X)
 ;D WRITE^BIREPD3(.BILINE,$$SP^BIUTL5(79,"-"))
 ;
 ;---> Now write total patients considered who had refusals.
 N M,N S (M,N)=0 F  S M=$O(BITMP("REFUSALS",M)) Q:'M  S N=N+1
 S X=" Total Patients reviewed who had Refusals on record: "_N
 D WRITE^BIREPD3(.BILINE,X),WRITE^BIREPD3(.BILINE,$$SP^BIUTL5(79,"-"))
 ;
 D
 .I BIUP="r" S X="all Registered Patients who have an active health record." Q
 .I BIUP="i" S X="Immunization Register Patients with a status of Active." Q
 .I BIUP="u" S X="the User Population patients: 1 visit in the past 3 years." Q
 .I BIUP="a" S X="Active Clinical Users: 2 clinical visits in the past 3 years." Q
 ;
 S X=" *Denominators are "_X
 D WRITE^BIREPD3(.BILINE,X)
 S X=" *Patients considered ""Current"" have 1-Td_B, 3-HEPB, 2-MMR, 1-VAR/Hx_Varicella."
 D WRITE^BIREPD3(.BILINE,X)
 D WRITE^BIREPD3(.BILINE,$$SP^BIUTL5(79,"-"))
 ;
 ;---> Set final VALMCNT (Listman line count).
 S VALMCNT=BILINE
 Q
