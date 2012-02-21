PXRMGECT ;SLC/JVS GEC-Queued Reports-cont'd ;6/19/03  20:58
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 Q
CTL ;Referrals Counts by Location
 N LOC,TOTAL,ACCTOT
 S ACCTOT=0
 S REF="^TMP(""PXRMGEC"",$J)"
 D E^PXRMGECV("CTL",1,BDT,EDT,"F",0)
 I FORMAT="D" S FOR=0
 I FORMAT="F" S FOR=1
 W @IOF
 W "=============================================================================="
 W !,"Referral Count by Location"
 W !,"From: "_$$FMTE^XLFDT(BDT,"5ZM")_" To: "_$$FMTE^XLFDT(EDT,"5ZM")
 W !,"Report Displays Counts of Complete Referrals Only"
 I FOR W !,"Location",?25,"Total Count"
 I 'FOR W !,"Location^Total Count"
 W !,"=============================================================================="
 ;TMP("PXRMGEC",$J,"REFLOCC",LOC)="3"
 W !
 S LOC=0 F  S LOC=$O(@REF@("REFLOCC",LOC)) Q:LOC=""  D
 .S TOTAL=$G(@REF@("REFLOCC",LOC)) S ACCTOT=ACCTOT+TOTAL
 .I FOR W !,LOC,?25,$J(TOTAL,3)
 .I 'FOR W !,LOC,"^",TOTAL
 I FOR W !,"_____________________________"
 I FOR W !,"Total Referrals",?25,$J(ACCTOT,3)
 K ^TMP("PXRMGEC",$J)
 Q
 ;______________________________________________________________
CTDR ;Referrals Counts by Provider
 N DOC,TOTAL,ACCTOT,DIEN
 S ACCTOT=0
 D E^PXRMGECV("CTDR",1,BDT,EDT,"F",0)
 I FORMAT="F" S FOR=1
 I FORMAT="D" S FOR=0
 W @IOF
 W "=============================================================================="
 W !,"Referral Count by Provider"
 W !,"From: "_$$FMTE^XLFDT(BDT,"5ZM")_" To: "_$$FMTE^XLFDT(EDT,"5ZM")
 W !,"Report Displays Counts of Complete Referrals Only"
 I FOR W !,"Provider",?37,"Total Count"
 I 'FOR W !,"Provider^IEN^Total Count"
 W !,"=============================================================================="
 ;TMP("PXRMGEC",$J,"REFDOCC",DOC)="3"
 W !
 S DOC=0 F  S DOC=$O(^TMP("PXRMGEC",$J,"REFDOCC",DOC)) Q:DOC=""  D
 .S DIEN=0 F  S DIEN=$O(^TMP("PXRMGEC",$J,"REFDOCC",DOC,DIEN)) Q:DIEN=""  D
 ..S TOTAL=$G(^TMP("PXRMGEC",$J,"REFDOCC",DOC,DIEN)) S ACCTOT=ACCTOT+TOTAL
 ..I FOR W !,DOC," ("_DIEN_")",?37,$J(TOTAL,3)
 ..I 'FOR W !,DOC,"^",DIEN,"^",TOTAL
 I FOR W !,"_____________________________"
 I FOR W !,"Total Referrals",?37,$J(ACCTOT,3)
 K ^TMP("PXRMGEC",$J)
 Q
 ;______________________________________________________________
CTP ;Referrals Counts by Patient
 N PATIENT,TOTAL,ACCTOT,SSN
 S ACCTOT=0
 D E^PXRMGECV("CTP",1,BDT,EDT,"F",0)
 I FORMAT="F" S FOR=1
 I FORMAT="D" S FOR=0
 W @IOF
 W "=============================================================================="
 W !,"Referral Count by Date"
 W !,"From: "_$$FMTE^XLFDT(BDT,"5ZM")_" To: "_$$FMTE^XLFDT(EDT,"5ZM")
 W !,"Report Displays Counts of Complete Referrals Only"
 I FOR W !,"Patient",?37,"Total Count"
 I 'FOR W !,"Patient^SSN^Total Count"
 W !,"=============================================================================="
 ;TMP("PXRMGEC",$J,"REFDFNN,PATIENT)="3"
 W !
 S PATIENT=0 F  S PATIENT=$O(^TMP("PXRMGEC",$J,"REFDFNN",PATIENT)) Q:PATIENT=""  D
 .S SSN=0 F  S SSN=$O(^TMP("PXRMGEC",$J,"REFDFNN",PATIENT,SSN)) Q:SSN=""   D
 ..S TOTAL=$G(^TMP("PXRMGEC",$J,"REFDFNN",PATIENT)) S ACCTOT=ACCTOT+TOTAL
 ..I FOR W !,PATIENT,?25,SSN,?37,$J(TOTAL,3)
 ..I 'FOR W !,PATIENT,"^",SSN,"^",TOTAL
 I FOR W !,"_____________________________"
 I FOR W !,"Total Referrals",?25,SSN,?37,$J(ACCTOT,3)
 K ^TMP("PXRMGEC",$J)
 Q
 ;______________________________________________________________
CTD ;Referrals Counts by Date
 N DATE,TOTAL,ACCTOT
 S ACCTOT=0
 D E^PXRMGECV("CTD",1,BDT,EDT,"F",0)
 I FORMAT="F" S FOR=1
 I FORMAT="D" S FOR=0
 W @IOF
 W "=============================================================================="
 W !,"Referral Count by Date"
 W !,"From: "_$$FMTE^XLFDT(BDT,"5ZM")_" To: "_$$FMTE^XLFDT(EDT,"5ZM")
 W !,"Report Displays Counts of Complete Referrals Only"
 I FOR W !,"Date",?25,"Total Count"
 I 'FOR W !,"Date^Total Count"
 W !,"=============================================================================="
 ;TMP("PXRMGEC",$J,"REFDATE",DATE)="3"
 W !
 S DATE=0 F  S DATE=$O(^TMP("PXRMGEC",$J,"REFDATE",DATE)) Q:DATE=""  D
 .S TOTAL=$G(^TMP("PXRMGEC",$J,"REFDATE",DATE)) S ACCTOT=ACCTOT+TOTAL
 .I FOR W !,$$FMTE^XLFDT(DATE,"5ZM"),?25,$J(TOTAL,3)
 .I 'FOR W !,$$FMTE^XLFDT(DATE,"5ZM"),"^",TOTAL
 I FOR W !,"_____________________________"
 I FOR W !,"Total Referrals",?25,$J(ACCTOT,3)
 K ^TMP("PXRMGEC",$J)
 Q
 ;______________________________________________________________
