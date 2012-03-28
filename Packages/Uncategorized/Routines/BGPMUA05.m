BGPMUA05 ; IHS/MSC/MGH - MI measure NQF0013 ;22-Mar-2011 10:16;DU
 ;;11.0;IHS CLINICAL REPORTING;**4**;JAN 06, 2011;Build 84
 ;Code to collect meaningful use report for hypertension and BP reading
ENTRY ;EP
 N START,END,BGPNUM,BGPDEN,AENC,BENC,STRING,STRING1,STRING2,BGPHYPER,BGPHYPL
 N IEN,INV,VISIT,WTIEN,DATA,VDATE,VALUE,EXCEPT,FIRST,REF,VIEN,EXCEPT,RESULT
 N BGPN1,BGPN3,RETVAL,BGPBII,BGPUNII,BGPMAS,AENC,BENC,CENC,CNT
 N BGPENC,ENSTRING,BGPBIRTH,BGPHYS2,BGPHYS1,BGPHYS3,BGPHYS4
 S (BGPDEN,NUM,RESULT)=0
 S START=9999999-BGPBDATE,END=9999999-BGPEDATE,VALUE=0
 S RETVAL=""     ;Return value
 S (STRING,STRING2)=""
 ;Pts must be >18
 ;No need to check further if no age match
 Q:BGPAGEE<18
 S CNT=0
 S FIRST=END-1 F  S FIRST=$O(^AUPNVSIT("AA",DFN,FIRST)) Q:FIRST=""!($P(FIRST,".",1)>START)  D
 .S IEN=0 F  S IEN=$O(^AUPNVSIT("AA",DFN,FIRST,IEN)) Q:'+IEN  D
 ..;Check provider, Only visits for chosen provider
 ..Q:'$$PRV^BGPMUUT1(IEN,BGPPROV)
 ..;If the right provider, check and see if an appropriate CPT code exists
 ..S AENC=$$VSTCPT^BGPMUUT1(DFN,IEN,"BGPMU BP EM")
 ..S BENC=$$VSTCPT^BGPMUUT1(DFN,IEN,"BGPMU NURSING FAC EM")
 ..I (+AENC=1)!(+BENC=1) D
 ...S CNT=CNT+1
 ...S VDATE=$P($G(^AUPNVSIT(IEN,0)),U,1)
 ...S VIEN(CNT)=IEN_U_VDATE
 I CNT>1 D
 .;Patient Must have active DX of hypertension, EVER
 .;Check POV codes
 .S (STRING1,STRING2,ENSTRING)=""
 .S BGPBIRTH=$P(^DPT(DFN,0),U,3)
 .S BGPHYPER=$$LASTDX^BGPMUUT2(DFN,BGPBIRTH,BGPBDATE,"BGPMU HYPERTENSION DX")
 .I +BGPHYPER S VALUE=1,STRING1=$P(BGPHYPER,U,2)_" "_$$DATE^BGPMUUTL($P(BGPHYPER,U,3))
 .;Check problem list
 .N PDATE
 .S BGPHYPL=$$PLTAX^BGPMUUT1(DFN,"BGPMU HYPERTENSION DX","C")
 .I +BGPHYPL D
 ..S PDATE=$P(BGPHYPL,U,3)
 ..I PDATE<BGPBDATE S VALUE=1,STRING2=$P(BGPHYPL,U,2)_" "_$$DATE^BGPMUUTL($P(BGPHYPL,U,3))
 .;Patient has hypertension and 2 or more visits, now check for BP
 .I +VALUE D
 ..I STRING2'="" S ENSTRING=STRING2
 ..I STRING1'="" S ENSTRING=STRING1
 ..D BP(DFN,CNT,.ENSTRING,.VIEN,.BGPNUM)
 ..D TOTAL(DFN,ENSTRING,BGPNUM)
 Q
BP(DFN,CNT,ENSTRING,VIEN,NUM) ;Find is pt has a BP on the chosen visits
 N IEN,MSR,MTYP,BP,BPCNT,SAVE,ARRAY,VST,VCNT
 S BP="",BPCNT=0,VCNT=0
 S MTYP="" S MTYP=$O(^AUTTMSR("B","BP",MTYP))
 Q:MTYP="" 0
 S NUM=0 F  S NUM=$O(VIEN(NUM)) Q:NUM=""!(BPCNT>1)  D
 .S IEN=$P(VIEN(NUM),U,1),SAVE=0
 .S MSR="" F  S MSR=$O(^AUPNVMSR("AD",IEN,MSR)) Q:MSR=""!(+SAVE)  D
 ..I $P($G(^AUPNVMSR(MSR,0)),U,1)=MTYP D
 ...S BPCNT=BPCNT+1,SAVE=1
 ...S ARRAY(IEN)=""
 ...I BPCNT=1 S BP="BP:"_$P($G(^AUPNVMSR(MSR,0)),U,4)_" "_$$DATE^BGPMUUTL($P($G(^AUPNVMSR(MSR,12)),U,1))
 ...I BPCNT=2 S BP=BP_";BP:"_$P($G(^AUPNVMSR(MSR,0)),U,4)_" "_$$DATE^BGPMUUTL($P($G(^AUPNVMSR(MSR,12)),U,1))
 ...S ENSTRING=ENSTRING_";EN:"_$$DATE^BGPMUUTL($P(VIEN(NUM),U,2))
 I BPCNT=2 S NUM=1_U_"M:"_BP
 I BPCNT<2 D
 .S NUM=0_U_"NM:"_BP
 .N CNT
 .I BPCNT=1 D
 ..S CNT=1
 ..S VST=0 F  S VST=$O(VIEN(VST)) Q:VST=""!(CNT>1)  D
 ...S IEN=$P(VIEN(VST),U,1)
 ...I '$D(ARRAY(IEN)) D
 ....S CNT=CNT+1
 ....S ENSTRING=ENSTRING_";EN:"_$$DATE^BGPMUUTL($P(VIEN(VST),U,2))
 .I BPCNT=0 D
 ..S CNT=0
 ..S VST=0 F  S VST=$O(VIEN(VST)) Q:VST=""!(CNT>1)  D
 ...S IEN=$P(VIEN(VST),U,1)
 ...S CNT=CNT+1
 ...S ENSTRING=ENSTRING_";EN:"_$$DATE^BGPMUUTL($P(VIEN(VST),U,2))
 Q
TOTAL(DFN,ENSTRING,BGPNUM) ;See where this patient ends up
 N PTCNT,EXCCT,DENCT,NUMCT,TOTALS,NOTCT
 S TOTALS=$G(^TMP("BGPMU0013",$J,BGPMUTF,"TOT"))
 S DENCT=+$G(^TMP("BGPMU0013",$J,BGPMUTF,"DEN"))
 S NUMCT=+$G(^TMP("BGPMU0013",$J,BGPMUTF,"NUM"))
 S NOTCT=+$G(^TMP("BGPMU0013",$J,BGPMUTF,"NOT"))
 S PTCNT=TOTALS
 S PTCNT=PTCNT+1
 S DENCT=DENCT+1 S ^TMP("BGPMU0013",$J,BGPMUTF,"DEN")=DENCT
 I +BGPNUM D
 .S NUMCT=NUMCT+1 S ^TMP("BGPMU0013",$J,BGPMUTF,"NUM")=NUMCT
 .I BGPMUTF="C" S ^TMP("BGPMU0013",$J,"PAT",BGPMUTF,"NUM",PTCNT)=DFN_U_ENSTRING_U_$P(BGPNUM,U,2)
 I '+BGPNUM D
 .S NOTCT=NOTCT+1 S ^TMP("BGPMU0013",$J,BGPMUTF,"NOT")=NOTCT
 .I BGPMUTF="C" S ^TMP("BGPMU0013",$J,"PAT",BGPMUTF,"NOT",PTCNT)=DFN_U_ENSTRING_U_$P(BGPNUM,U,2)
 S ^TMP("BGPMU0013",$J,BGPMUTF,"TOT")=PTCNT
 ;Setup iCare array for patient
 S BGPICARE("MU.EP.0013.1",BGPMUTF)=1_U_+BGPNUM_U_""_U_$G(ENSTRING)_";"_$P(BGPNUM,U,2)
 Q
