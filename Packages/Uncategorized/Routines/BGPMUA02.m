BGPMUA02 ; IHS/MSC/MGH - MI measure NQF0034 ;01-Mar-2011 15:36;MGH
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 ;Code to collect meaningful use report for colorectal screening
ENTRY ;EP
 N START,END,BGPNUM,BGPDEN,BGPNUM,AENC,BENC,BGPBIRTH,COLLECT
 N IEN,INV,VISIT,WTIEN,DATA,VDATE,VALUE,EXCEPT,FIRST,REF,VIEN,EXCEPT,AENC,BENC
 N BGPN1,BGPN3,RETVAL,BGPCOLI,BGPCOLP,BGPSIGI,BGPSIGP,BGPFOBTI,BGPCAPR,BGPFOBTC,BGPFOBTI,BGPDSTR,BGPNSTR
 N BGPFOBTP,BGPFOBTL,BGPCADXI,BGPCADXP,BGPCARMC,BGPCARMP,BGPENC,BGPFOBT,BGPSIG,BGPCOL,STRING1,STRING2
 S (BGPDEN,BGPNUM)=0
 ;Set a new begin date of 2 years prior to the reporting period end date
 N X1,X2,X S X1=BGPEDATE,X2=-720 D C^%DTC S BGPENC=X
 S START=9999999-BGPENC,END=9999999-BGPEDATE,VALUE=0,EXCEPT=0,COLLECT=0
 S BGPBIRTH=$P(^DPT(DFN,0),U,3)
 I BGPBIRTH="" S BGPBIRTH=BGPENC
 S RETVAL="",VIEN=""     ;Return value
 S (STRING1,STRING2,BGPDSTR,BGPNSTR)=""
 ;Pts must be 50-74
 ;No need to check further if no age match
 Q:(BGPAGEE<50)!(BGPAGEE>74)
 ;Quit if the patient has a total colectomy by ICD0 or CPT
 S BGPCARMC=$$CPT^BGPMUUT1(DFN,BGPBIRTH,BGPEDATE,"BGPMU COLECTOMY CPT")
 Q:+BGPCARMC
 S BGPCARMP=$$LASTPRC^BGPMUUT2(DFN,BGPBIRTH,BGPEDATE,"BGPMU COLECTOMY ICDS")
 Q:+BGPCARMP
 S FIRST=END-1 F  S FIRST=$O(^AUPNVSIT("AA",DFN,FIRST)) Q:FIRST=""!($P(FIRST,".",1)>START)!(RETVAL]"")  D
 .S IEN=0 F  S IEN=$O(^AUPNVSIT("AA",DFN,FIRST,IEN)) Q:'+IEN!(RETVAL]"")  D
 ..;Check provider, Only visits for chosen provider
 ..Q:'$$PRV^BGPMUUT1(IEN,BGPPROV)
 ..;Quit if any visit in the last 2 years does not have a valid E&M code
 ..S AENC=$$VSTCPT^BGPMUUT1(DFN,IEN,"BGPMU COLON ENC EM")
 ..S BENC=$$VSTPOV^BGPMUUT3(DFN,IEN,"BGPMU COLON ENC DX")
 ..Q:(AENC=0)&(BENC=0)
 ..I +AENC S STRING1="ENCC:"_$P(AENC,U,2)
 ..I +BENC S STRING1="ENCC:"_$P(BENC,U,2)
 ..S DATA=$G(^AUPNVSIT(IEN,0))
 ..S VDATE=$P($G(^AUPNVSIT(IEN,0)),U,1),VIEN=IEN
 I +VIEN D
 .S BGPDSTR=$P(VDATE,".",1)
 .S STRING2=""
 .;Set a new begin date of 2 years prior to the visit
 .;N X1,X2,X S X1=VDATE,X2=-720 D C^%DTC S BGPENC=X
 .;Set a new begin date of 10 years prior to the visit for colonoscopy
 .N X1,X2,X S X1=VDATE,X2=-3650 D C^%DTC S BGPCOL=X
 .;Set a new begin date of 5 years prior to the visit to find sigmoidoscopy
 .N X1,X2,X S X1=VDATE,X2=-1825 D C^%DTC S BGPSIG=X
 .;Set a new begin date of 1 year prior to the visit to find FOBT
 .N X1,X2,X S X1=VDATE,X2=-365 D C^%DTC S BGPFOBT=X
 .;Check for colonoscopy in the last 10 years
 .S BGPCOLP=$$CPT^BGPMUUT1(DFN,BGPCOL,BGPEDATE,"BGPMU COLONOSCOPY CPT")
 .I +BGPCOLP=1 S VALUE=BGPCOLP,STRING2="COLC:"_$P(BGPCOLP,U,2),BGPNSTR=$P(BGPCOLP,U,2)_";"_$P($P(BGPCOLP,U,3),".",1)
 .S BGPCOLI=$$LASTPRC^BGPMUUT2(DFN,BGPCOL,BGPEDATE,"BGPMU COLONOSCOPY PROCEDURE")
 .I +BGPCOLI=1 S VALUE=BGPCOLI,STRING2="COLI:"_$P(BGPCOLI,U,2),BGPNSTR=$P(BGPCOLI,U,2)_";"_$P($P(BGPCOLI,U,3),".",1)
 .;Check for sigmoidoscopy in the last 5 years
 .S BGPSIGP=$$CPT^BGPMUUT1(DFN,BGPSIG,BGPEDATE,"BGPMU SIGMOIDOSCOPY CPT")
 .I +BGPSIGP=1 S VALUE=BGPSIGP,STRING2=STRING2_";SIGC:"_$P(BGPSIGP,U,2),BGPNSTR=$P(BGPSIGP,U,2)_";"_$P($P(BGPSIGP,U,3),".",1)
 .S BGPSIGI=$$LASTPRC^BGPMUUT2(DFN,BGPSIG,BGPEDATE,"BGPMU SIGMOIDOSCOPY PROCEDURES")
 .I +BGPSIGI=1 S VALUE=BGPSIGI,STRING2=STRING2_";SIGI:"_$P(BGPSIGI,U,2),BGPNSTR=$P(BGPSIGI,U,2)_";"_$P($P(BGPSIGI,U,3),".",1)
 .;Check for FOBT in the last year
 .S BGPFOBTC=$$CPT^BGPMUUT1(DFN,BGPFOBT,BGPEDATE,"BGPMU FOBT CPTS")
 .I +BGPFOBTC=1 S VALUE=BGPFOBTC,STRING2=STRING2_";FOBC:"_$P(BGPFOBTC,U,2),BGPNSTR=$P(BGPFOBTC,U,2)_";"_$P($P(BGPFOBTC,U,3),".",1)
 .S BGPFOBTI=$$LASTPRC^BGPMUUT2(DFN,BGPFOBT,BGPEDATE,"BGPMU FOBT ICD CODES")
 .I +BGPFOBTI=1 S VALUE=BGPFOBTI,STRING2=STRING2_";FOBI:"_$P(BGPFOBTI,U,2),BGPNSTR=$P(BGPFOBTI,U,2)_";"_$P($P(BGPFOBTI,U,3),".",1)
 .S BGPFOBTL=$$LOINC^BGPMUUT2(DFN,BGPFOBT,BGPEDATE,"BGPMU FOBT LOINC")
 .I +BGPFOBTL S VALUE="1^"_BGPFOBTL,STRING2=STRING2_";FOBL:"_$P(BGPFOBTL,U,2),BGPNSTR=$P(BGPFOBTL,U,2)_";"_$P($P(BGPFOBTL,U,1),".",1)
 .;Exclude if the patient has a colon cancer diagnosis
 .;Colon cancer is by ICD or CPT code
 .I '+VALUE D
 ..S BGPCADXI=$$LASTDX^BGPMUUT2(DFN,BGPBIRTH,BGPEDATE,"BGPMU COLON CANCER DX")
 ..I +BGPCADXI=1 S EXCEPT=BGPCADXI,STRING1=STRING1_";CCD:"_$P(BGPCADXI,U,2)
 ..S BGPCADXP=$$CPT^BGPMUUT1(DFN,BGPBIRTH,BGPEDATE,"BGPMU COLON CANCER STUDY")
 ..I +BGPCADXP=1 S EXCEPT=BGPCADXP,STRING1=STRING1_";CCS:"_$P(BGPCADXP,U,2)
 ..S BGPCAPR=$$PLTAX^BGPMUUT1(DFN,"BGPMU COLON CANCER DX")
 ..I +BGPCAPR=1 S EXCEPT=BGPCAPR,STRING1=STRING1_";CCP:"_$P(BGPCAPR,U,2)
 .D TOTAL(DFN,VIEN,BGPDSTR,BGPNSTR)
 Q
TOTAL(DFN,VIEN,BGPDSTR,BGPNSTR) ;See where this patient ends up
 N PTCNT,EXCCT,DENCT,NUMCT,TOTALS
 S TOTALS=$G(^TMP("BGPMU0034",$J,BGPMUTF,"TOT"))
 S EXCCT=+$G(^TMP("BGPMU0034",$J,BGPMUTF,"EXC"))
 S DENCT=+$G(^TMP("BGPMU0034",$J,BGPMUTF,"DEN"))
 S NUMCT=+$G(^TMP("BGPMU0034",$J,BGPMUTF,"NUM"))
 S PTCNT=TOTALS
 S PTCNT=PTCNT+1
 ;Do not include those with total colectomy in the denomiator
 ;Q:+COLLECT
 S DENCT=DENCT+1 S ^TMP("BGPMU0034",$J,BGPMUTF,"DEN")=DENCT
 ;If Colon Cancer Dx, put in exception list
 I +EXCEPT D
 .S EXCCT=EXCCT+1 S ^TMP("BGPMU0034",$J,BGPMUTF,"EXC")=EXCCT
 .I BGPMUTF="C" S ^TMP("BGPMU0034",$J,"PAT",BGPMUTF,"EXC",PTCNT)=DFN_U_STRING1_U_STRING2_U_$G(BGPDSTR)_U_"Excluded"
 E  D
 .I +VALUE D
 ..S NUMCT=NUMCT+1 S ^TMP("BGPMU0034",$J,BGPMUTF,"NUM")=NUMCT
 ..I BGPMUTF="C" S ^TMP("BGPMU0034",$J,"PAT",BGPMUTF,"NUM",PTCNT)=DFN_U_STRING1_U_STRING2_U_$G(BGPDSTR)_U_$G(BGPNSTR)
 .E  I BGPMUTF="C" S ^TMP("BGPMU0034",$J,"PAT",BGPMUTF,"DEN",PTCNT)=DFN_U_STRING1_U_STRING2_U_$G(BGPDSTR)_U_$G(BGPNSTR)
 S ^TMP("BGPMU0034",$J,BGPMUTF,"TOT")=PTCNT
 ;Setup iCare array for patient
 S BGPICARE("MU.EP.0034.1",BGPMUTF)='EXCEPT_U_+VALUE_U_+EXCEPT_U_$G(BGPDSTR)_";"_$G(BGPNSTR)_U_$P(EXCEPT,U,2)
 Q
