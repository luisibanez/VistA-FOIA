BIREPVP ;IHS/CMI/MWR - REPORT, VIEW PATIENTS IN REPORT.; MAY 10, 2010
 ;;8.4;IMMUNIZATION;;MAY 10,2010
 ;;* MICHAEL REMILLARD, DDS * CIMARRON MEDICAL INFORMATICS, FOR IHS *
 ;;  REPORTS, VIEW LIST OF PATIENTS IN REPORT: REJECTED, APPROPRIATE, OR ALL.
 ;
 ;---> Called by Protocols BI REPORT GEN PATIENTS - NOT APPRO, - APPRO,
 ;---> and - ALL, on the Protocol Menu BI MENU REPORT GEN PATIENTS VIEW.
 ;---> Assumption is that a list of patients is sitting out in ^TMP("BIDUL",$J.
 ;
 ;----------
MAIN(BIVAL,BIRTN,BITITL,BIRPDT) ;
 ;W !,"JUST CALLED BIREPVP, PASSED BIRTN: ",BIRTN R ZZZ
 ;---> Display Patients.
 ;---> Parameters:
 ;     1 - BIVAL  (opt) Value indicates which patients:
 ;                      0=All, 1=Due only, 2=Appropriate only.
 ;     2 - BIRTN  (req) Routine to make Init call when returning.
 ;     3 - BITITL (opt) Report Name
 ;     4 - BIRPDT (opt) Report Date: Today unless passed from reports
 ;                                   (e.g., Quarterly Report).
 ;
 ;---> If <STKOV> errors appear here, increase STACK in SYSGEN,
 ;---> System Configuration Parameters.
 ;
 S:(($G(BIVAL)<1)!($G(BIVAL)>2)) BIVAL=0
 S BITITL=$S($G(BITITL)]"":BITITL_" ",1:"")
 S:'$G(BIRPDT) BIRPDT=DT
 ;
 D
 .N BIAGRPS,BIBEN,BICC,BICM,BICPT,BICPTI,BIDAR,BIFDT,BIFH,BIHCF,BIHPV,BILOT,BIMD
 .N BIMMD,BIMMR,BINFO,BINFO1,BIORD,BIPG,BIQDT,BIRTN,BISITE,BIT,BITAR,BITOTPTS,BIUP,BIYEAR
 .D START(BIVAL,BITITL,BIRPDT)
 ;
 Q:$G(BIRTN)=""
 D TITLE^BIUTL5("RETURNING TO THE "_BITITL_"REPORT"),TEXT4
 N DIR S DIR("A")="     Update Report now (Yes/No)",DIR(0)="Y",DIR("B")="NO"
 S DIR("?")="       Enter YES to update the report, enter NO to save time."
 D ^DIR W !
 Q:$D(DIRUT)!('Y)
 D @("INIT^"_BIRTN)
 Q
 ;
 ;
 ;----------
START(BIVAL,BITITL,BIRPDT) ;EP
 ;---> Display Patients.
 ;---> Parameters:
 ;     1 - BIVAL (opt) Value indicates which patients:
 ;                     0=All, 1=Due only, 2=Appropriate only.
 ;     2 - BITITL (opt) Report Name
 ;     3 - BIRPDT (opt) Report Date: Today unless passed from reports
 ;                                   (e.g., Quarterly Report).
 ;
 ;---> If Vaccine Table is not standard, display Error Text and quit.
 I $D(^BISITE(-1)) D ERRCD^BIUTL2(503,,1) Q
 D SETVARS^BIUTL5
 ;
 N BIPOP
 D  D DIRZ^BIUTL3(.BIPOP)
 .I $G(BIVAL)=1 D  Q
 ..D TITLE^BIUTL5("VIEW PATIENTS NOT CURRENT IN "_BITITL_"REPORT"),TEXT1 Q
 .I $G(BIVAL)=2 D  Q
 ..D TITLE^BIUTL5("VIEW PATIENTS CURRENT IN "_BITITL_"REPORT"),TEXT2
 .D TITLE^BIUTL5("VIEW ALL PATIENTS REVIEWED IN "_BITITL_"REPORT"),TEXT3 Q
 Q:$G(BIPOP)
 W !!?5,"Please hold...",!
 ;
 ;---> Get Total Patients from ^TMP("BIDUL",$J,CURCOM,1,HRCN,BIDFN)
 N BIT S BIT=0
 D
 .N BIDFN,N,M,P
 .S N=0
 .F  S N=$O(^TMP("BIDUL",$J,N)) Q:N=""  D
 ..S M=0
 ..F  S M=$O(^TMP("BIDUL",$J,N,M)) Q:M=""  D
 ...S P=0
 ...F  S P=$O(^TMP("BIDUL",$J,N,M,P)) Q:P=""  D
 ....N BIVAL1
 ....S BIDFN=0
 ....F  S BIDFN=$O(^TMP("BIDUL",$J,N,M,P,BIDFN)) Q:'BIDFN  S BIVAL1=^(BIDFN) D
 .....;---> BIVAL=0=All (no filter), 1=Not Appro, 2=Appropriate.
 .....I $G(BIVAL) Q:BIVAL'=BIVAL1
 .....S BIT=BIT+1
 ;
 ;---> For now, comment out any additional info, per Group's request v8.0.
 ;N BINFO S BINFO="1,2,3,5,7,8"
 N BIPG S BIPG="Report - "_$S(BIVAL=1:"Not Current",BIVAL=2:"Current",1:"Both Groups")
 ;---> Second piece of Age: 0 or null=months, 1=years.
 K ^TMP("BIDULV",$J)
 D START^BIDUVLS1(+$G(DT),,BIPG,$G(BIAG),BIT,BIVAL,1,BITITL,BIRPDT)
 Q
 ;
 ;
 ;----------
TEXT1 ;EP
 ;;This action will display a List of the patients who were NOT within
 ;;the recommended guidelines for immunizations for their age.
 ;;
 D PRINTX("TEXT1")
 Q
 ;
 ;
 ;----------
TEXT2 ;EP
 ;;This action will display a List of the patients who were WITHIN
 ;;the recommended guidelines for immunizations for their age.
 ;;
 ;;
 D PRINTX("TEXT2")
 Q
 ;
 ;
 ;----------
TEXT3 ;EP
 ;;This action will display a list of ALL the patients who were
 ;;considered in this report.
 ;;
 ;;
 D PRINTX("TEXT3")
 Q
 ;
 ;
 ;----------
TEXT4 ;EP
 ;;You are about to return to the report that included these patients.
 ;;If you made changes to the patient you were just viewing, it is possible
 ;;that the changes have affected the report.
 ;;
 ;;At this point you have two options:
 ;;
 ;;  1) You may re-run the report to reflect any updated information you
 ;;     have entered.  HOWEVER, be aware that re-running the report may take
 ;;     considerable time, depending on the amount of data in your database.
 ;;
 ;;  2) You may return to the report and select other patients, without
 ;;     taking time to update the report immediately.  This would save time,
 ;;     allowing you to continue working with a series of patients more
 ;;     efficiently and updating the report only when you're done.
 ;;
 ;;Do you wish to update the report now, before returning to it?
 ;;
 D PRINTX("TEXT4")
 Q
 ;
 ;
 ;----------
PRINTX(BILINL,BITAB) ;EP
 Q:$G(BILINL)=""
 N I,T,X S T="" S:'$D(BITAB) BITAB=5 F I=1:1:BITAB S T=T_" "
 F I=1:1 S X=$T(@BILINL+I) Q:X'[";;"  W !,T,$P(X,";;",2)
 Q
