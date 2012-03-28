BIREPL3 ;IHS/CMI/MWR - REPORT, ADULT IMM; OCT 15, 2010
 ;;8.4;IMMUNIZATION;**2**;MAY 10,2010
 ;;* MICHAEL REMILLARD, DDS * CIMARRON MEDICAL INFORMATICS, FOR IHS *
 ;;  GATHER DATA FOR ADULT IMMUNIZATION REPORT.
 ;;  PATCH 1:  Commented out for ref to ICPT for Code Set versioning. LASTFLU+25
 ;;  PATCH 2: Filter for Active Clinical, using new standard $$ACTCLIN^BIUTL6 call.
 ;;           GETSTATS+60
 ;
 ;
 ;----------
GETSTATS(BIQDT,BICC,BIHCF,BIBEN,BICPTI,BITOTS) ;EP
 ;---> Lori's code to Produce array for ADULT Immunization Report.
 ;---> Parameters:
 ;     1 - BIQDT  (req) Quarter Ending Date.
 ;     2 - BICC   (req) Current Community array.
 ;     3 - BIHCF  (req) Health Care Facility array.
 ;     4 - BIBEN  (req) Beneficiary Type array.
 ;     5 - BICPTI (opt) 1=Include CPT Coded Visits, 0=Ignore CPT (default).
 ;     6 - BITOTS (ret) Totals delimited by "^":
 ;                      Pc   Variable
 ;                       1 - BI50=Total over 50
 ;                       2 - BIT50 = Number over 50 w/Tetanus past 10 years.
 ;                       3 - BIF50 = Number over 50 w/Influenza past year.
 ;                       4 - BIP50 = Number over 50 w/Pneumo ever.
 ;                       5 - BIP506 = Number over 50 w/Pneumo past 6 years.
 ;                       6 - BIZ50 = Number over 50 w/Zoster ever.
 ;                       7 - BI65=Total over 65
 ;                       8 - BIT65 = Number over 65 w/Tetanus past 10 years.
 ;                       9 - BIF65 = Number over 65 w/Influenza past year.
 ;                      10 - BIP65 = Number over 65 w/Pneumo ever.
 ;                      11 - BIP656 = Number over 65 w/Pneumo past 6 years.
 ;                      12 - BIZ65 = Number over 65 w/Zoster ever.
 ;
 N BIADOB,BIADOBE,BI50,BIT50,BIF50,BIP50,BIP506,BIZ50
 N BI65,BIT65,BIF65,BIP65,BIP656,BIZ65
 S (BI50,BI65)=0
 S:('$D(BICPTI)) BICPTI=0
 S:('$G(BIQDT)) BIQDT=$G(DT)
 ;
 ;---> Loop through Patient global looking for visits and immunizations.
 ;---> DOB must be at least 50 years before Quarter Ending Date.
 S BIADOB=0,BIADOBE=BIQDT-500000
 F  S BIADOB=$O(^DPT("ADOB",BIADOB)) Q:(BIADOB>BIADOBE)  D
 .N BIDFN S BIDFN=0
 .F  S BIDFN=$O(^DPT("ADOB",BIADOB,BIDFN)) Q:'BIDFN  D
 ..;
 ..;---> Quit if patient died before the Quarter Ending Date.
 ..N X S X=$$DECEASED^BIUTL1(BIDFN,1) I X Q:X<BIQDT
 ..;
 ..;---> Get Age in Years for Stats.
 ..N BIAGE S BIAGE=$$AGE^BIUTL1(BIDFN,1,BIQDT)
 ..;---> Quit if under age 50 on the Quarter Ending Date.
 ..Q:BIAGE<50
 ..;
 ..;---> Quit if patient does not have an Active HRCN at one or more
 ..;---> of the Health Care Facilities selected.
 ..Q:$$HRCN^BIEXPRT2(BIDFN,.BIHCF)
 ..;
 ..;---> Quit if Beneficiary Type doesn't match.
 ..Q:$$BENT^BIDUR1(BIDFN,.BIBEN)
 ..;
 ..;---> Quit if Current Community doesn't match.
 ..Q:$$CURCOM^BIEXPRT2(BIDFN,.BICC)
 ..;
 ..;---> Quit did not have 2 (real) visits in the last 3 years.
 ..;---> Comment out next line for testing.  ;MWRZZZ
 ..;
 ..;********** PATCH 2, v8.4, OCT 15,2010, IHS/CMI/MWR
 ..;---> Filter for Active Clinical, using standard $$ACTCLIN^BIUTL6 call.
 ..;Q:'$$LASTVD(BIDFN,$$FMADD^XLFDT(BIQDT,(-365*3)),BIQDT)
 ..Q:'$$ACTCLIN^BIUTL6(BIDFN,BIQDT)
 ..;**********
 ..;
 ..;---> Set patient as Not Due, BIVAL=2
 ..;---> If patient is due (change below), set BIVAL=1.
 ..S BIVAL=2
 ..;
 ..;---> Set totals.
 ..S BI50=BI50+1 S:BIAGE>64 BI65=BI65+1
 ..;
 ..;---> Tetanus Stats.
 ..D
 ...I $$TD(BIDFN,BICPTI,BIQDT) D  Q
 ....S BIT50=$G(BIT50)+1 S:BIAGE>64 BIT65=$G(BIT65)+1
 ...;
 ...;---> Patient is/was due for Tetanus.
 ...S BIVAL=1
 ..;
 ..;---> Flu Stats.
 ..D
 ...I $$FLU(BIDFN,BICPTI,BIQDT) D  Q
 ....S BIF50=$G(BIF50)+1 S:BIAGE>64 BIF65=$G(BIF65)+1
 ....;
 ...;---> Patient is due for Influenza.
 ...S BIVAL=1
 ..;
 ..;---> Pneumo Stats.
 ..N BIPNEU
 ..S BIPNEU=$$PNEU(BIDFN,BICPTI)
 ..I $P(BIPNEU,U) S BIP50=$G(BIP50)+1 S:BIAGE>64 BIP65=$G(BIP65)+1
 ..I $P(BIPNEU,U,2) S BIP506=$G(BIP506)+1 S:BIAGE>64 BIP656=$G(BIP656)+1
 ..;---> If pc22=1, forecast Pneumo every 6 years.
 ..D
 ...;---> If Y=1, forecast Pneumo every 6 years.
 ...N Y S Y=$P($G(^BISITE(+$G(DUZ(2)),0)),U,22)
 ...;---> If "forc q6y" and <6y, quit.
 ...I Y&($P(BIPNEU,U,2)) Q
 ...;---> If "do not forc q6y" and pt has had one, then quit.
 ...I 'Y&($P(BIPNEU,U,1)) Q
 ...;---> Patient is due for Pneumo.
 ...S BIVAL=1
 ..;
 ..;
 ..;---> Zostavax Stats.
 ..D
 ...I $$OZSTER(BIDFN,BICPTI,BIQDT) D  Q
 ....S BIZ50=$G(BIZ50)+1 S:BIAGE>64 BIZ65=$G(BIZ65)+1
 ...;
 ...;---> Patient is/was due for Zostervax if 60+ years on QDT.
 ...S:BIAGE>59 BIVAL=1
 ..;
 ..;---> Will Set ^TMP("BIDUL",$J,CURCOM,1,HRCN,BIDFN)=$G(BIVAL)
 ..D STORE^BIDUR1(BIDFN,DT,9,,$G(BIVAL))
 ..;
 ..;---> Add refusals, if any.
 ..N Z D CONTRA^BIUTL11(BIDFN,.Z,1) I $O(Z(0)) S BITMP("REFUSALS",BIDFN)=""
 ;
 ;---> Now piece together the totals.
 S BITOTS=$G(BI50)_U_$G(BIT50)_U_$G(BIF50)_U_$G(BIP50)_U_$G(BIP506)_U_$G(BIZ50)
 S BITOTS=BITOTS_U_$G(BI65)_U_$G(BIT65)_U_$G(BIF65)_U_$G(BIP65)_U_$G(BIP656)_U_$G(BIZ65)
 Q
 ;
 ;
 ;----------
LASTVD(BIDFN,BIBEGDT,BIENDDT) ;EP
 ;---> Lori's code to return 1 if the patient had 2 (real) visits
 ;---> between the dates given.
 ;---> Parameters:
 ;     1 - BIDFN    (req) Patient DFN
 ;     2 - BIBEGDT  (req) Begin Date
 ;     3 - BIENDDT  (req) End Date
 ;
 NEW X,G,F,S,A,B,V
 K ^TMP($J,"A")
 S A="^TMP($J,""A"","
 S B=BIDFN_"^ALL VISITS;DURING "_$$FMTE^XLFDT(BIBEGDT)_"-"_$$FMTE^XLFDT(BIENDDT)
 S E=$$START1^APCLDF(B,A)
 I '$D(^TMP($J,"A",1)) Q 0  ;patient has no visits in date range
 S (X,G,F,S)=0 F  S X=$O(^TMP($J,"A",X)) Q:X'=+X!(F)  S V=$P(^TMP($J,"A",X),U,5) D
 .N BIVSIT S BIVSIT=$G(^AUPNVSIT(V,0))
 .Q:BIVSIT=""
 .Q:'$P(BIVSIT,U,9)
 .Q:$P(BIVSIT,U,11)
 .;---> No provider, therefore it's NOT a complete Visit.
 .Q:'$D(^AUPNVPRV("AD",V))
 .;---> Must be ambulatory, day surgery, hospitalization or observation.
 .Q:"SAHO"'[$P(BIVSIT,U,7)
 .Q:"V"[$P(BIVSIT,U,3)
 .;
 .;---> If CRS 6.0 is present, use it.
 .I $D(^BGPCTRL(4)) D  Q
 ..;---> Get Clinic Code.
 ..S B=$$CLINIC^APCLV(V,"C")
 ..Q:B=""
 ..;---> Must be a primary clinic S G=V.
 ..I 'G,$D(^BGPCTRL(4,11,"B",B)) S G=V
 ..I V'=G,$D(^BGPCTRL(4,12,"B",B)) S S=1
 ..I G,S S F=1
 .;
 .;---> If CRS 5.X is present, use it.
 .I $D(^BGPCTRL(3)) D  Q
 ..;---> Get Clinic Code.
 ..S B=$$CLINIC^APCLV(V,"C")
 ..Q:B=""
 ..;---> Must be a primary clinic S G=V.
 ..I 'G,$D(^BGPCTRL(3,11,"B",B)) S G=V
 ..I V'=G,$D(^BGPCTRL(3,12,"B",B)) S S=1
 ..I G,S S F=1
 .;
 .;---> Recent CRS not present, skip Clinic Code check.
 .S F=1
 .Q
 Q $S(F:1,1:0)
 ;
 ;
 ;----------
TD(BIDFN,BICPTI,BIQDT) ;EP
 ;---> Return 1 if patient received TD during 10 years prior to QDT.
 ;---> Parameters:
 ;     1 - BIDFN  (req) Patient DFN
 ;     2 - BICPTI (opt) 1=Include CPT Coded Visits, 0=Ignore CPT.
 ;     3 - BIQDT  (opt) Quarter Ending Date (ignore Visits after this date).
 ;
 ;---> Check V Imms for TD's.
 N BICVXS,BIDATE
 S BIDATE=0 S:('$G(BIQDT)) BIQDT=$G(DT)
 S BICVXS="1,9,20,22,28,50,106,107,110,113,115"
 S BIDATE=$$LASTIMM^BIUTL11(BIDFN,BICVXS,BIQDT)
 ;
 ;---> So, BIDATE is the latest TD in V Imm (but not after the QDT).
 ;
 ;---> Check (if requested) V CPTs for TD's.
 D:$G(BICPTI)
 .N BICPTS,Y
 .S BICPTS="90701,90718,90700,90720,90702,90703,90721,90723"
 .S Y=$$LASTCPT^BIUTL11(BIDFN,BICPTS,BIQDT)
 .S:Y>$G(BIDATE) BIDATE=Y
 ;
 ;---> Return 0 if last Td was MORE than 10 yrs prior to QDT (or never);
 ;---> otherwise return 1.
 Q $S((BIDATE+100000)<BIQDT:0,1:1)
 ;
 ;
 ;----------
FLU(BIDFN,BICPTI,BIQDT) ;EP
 ;---> Return 1 if patient received Flu within one year prior to the QDT.
 ;---> Parameters:
 ;     1 - BIDFN  (req) Patient DFN
 ;     2 - BICPTI (opt) 1=Include CPT Coded Visits, 0=Ignore CPT.
 ;     3 - BIQDT  (opt) Quarter Ending Date (ignore Visits after this date).
 ;
 ;---> Check V Imms for FLU's.
 N BICVXS,BIDATE
 S BIDATE=0 S:('$G(BIQDT)) BIQDT=$G(DT)
 S BICVXS="15,16,88,111,135"
 S BIDATE=$$LASTIMM^BIUTL11(BIDFN,BICVXS,BIQDT)
 ;
 ;---> So, BIDATE is the latest FLU in V Imm (but not after the QDT).
 ;
 ;---> Check (if requested) V CPTs for FLU's.
 D:$G(BICPTI)
 .N BICPTS,Y
 .S BICPTS="90655,90657,90658,90659,90660,90661,90662,90724"
 .S Y=$$LASTCPT^BIUTL11(BIDFN,BICPTS,BIQDT)
 .S:Y>$G(BIDATE) BIDATE=Y
 ;
 ;---> Return 0 if last Flu was MORE than 1 year prior to QDT or never;
 ;---> otherwise 1.
 Q $S((BIDATE+10000)<BIQDT:0,1:1)
 ;
 ;
 ;----------
PNEU(BIDFN,BICPTI,BIQDT) ;EP
 ;---> Return data if patient received Pneumo.
 ;---> First pc="" if patient never received Pneumo.
 ;---> First pc=1 if patient has ever received Pneumo.
 ;---> Second pc=1 if patient has received Pneumo within the last 6 years.
 ;---> Parameters:
 ;     1 - BIDFN  (req) Patient DFN
 ;     2 - BICPTI (opt) 1=Include CPT Coded Visits, 0=Ignore CPT.
 ;     3 - BIQDT  (opt) Quarter Ending Date (ignore Visits after this date)
 ;
 ;---> Check V Imms for PNEU's.
 N BICVXS,BIDATE
 S BIDATE=0 S:('$G(BIQDT)) BIQDT=$G(DT)
 S BICVXS="33,100,109"
 S BIDATE=$$LASTIMM^BIUTL11(BIDFN,BICVXS,BIQDT)
 ;
 ;---> So, BIDATE is the latest PNEU in V Imm (but not after the QDT).
 ;
 ;---> Check (if requested) V CPTs for FLU's.
 D:$G(BICPTI)
 .N BICPTS,Y
 .S BICPTS="90732,90669"
 .S Y=$$LASTCPT^BIUTL11(BIDFN,BICPTS,BIQDT)
 .S:Y>$G(BIDATE) BIDATE=Y
 ;
 ;---> Return "" if patient never received Pneumo.
 Q:'BIDATE 0
 S BIDATE=BIDATE+60000
 ;---> Quit 2nd pc="" if last Pneumo was more than 6 yrs ago; otherwise 2nd pc=1.
 Q 1_U_$S((BIDATE<BIQDT):0,1:1)
 ;
 ;
 ;----------
OZSTER(BIDFN,BICPTI,BIQDT) ;EP
 ;---> NOTE: "O" and "Z" reversed to avoid SACC trigger of $Z violation.
 ;---> Return 1 if patient ever received Zostavax prior to the QDT.
 ;---> Parameters:
 ;     1 - BIDFN  (req) Patient DFN
 ;     2 - BICPTI (opt) 1=Include CPT Coded Visits, 0=Ignore CPT.
 ;     3 - BIQDT  (opt) Quarter Ending Date (ignore Visits after this date).
 ;
 ;---> Check V Imms for Zostavax's.
 N BICVXS,BIDATE
 S BIDATE=0 S:('$G(BIQDT)) BIQDT=$G(DT)
 S BICVXS="121"
 S BIDATE=$$LASTIMM^BIUTL11(BIDFN,BICVXS,BIQDT)
 ;
 ;---> So, BIDATE is the latest Zostavax in V Imm (but not after the QDT).
 ;
 ;---> Check (if requested) V CPTs for Zostavax's.
 D:$G(BICPTI)
 .N BICPTS,Y
 .S BICPTS="90736"
 .S Y=$$LASTCPT^BIUTL11(BIDFN,BICPTS,BIQDT)
 .S:Y>$G(BIDATE) BIDATE=Y
 ;
 ;---> Return 0 if last Zostavax was MORE than 1 year prior to QDT or never;
 ;---> otherwise 1.
 Q $S(BIDATE:1,1:0)
 ;
 ;
 ;----------
LASTFLU(P,C) ;EP
 ;---> *** NOT USED. ***
 ;---> Lori's code: return last flu shot date based on ICD's and CPT's.
 ;---> Parameters:
 ;     1 - P  (req) Patient DFN
 ;
 NEW BIY,%,LFLU,T,E
 K BIY S %=P_"^LAST DX V04.8",E=$$START1^APCLDF(%,"BIY(")
 I $D(BIY(1)) D
 .Q:LFLU>$P(BIY(1),U)
 .S LFLU=$P(BIY(1),U)
 K BIY S %=P_"^LAST DX V06.6",E=$$START1^APCLDF(%,"BIY(")
 I $D(BIY(1)) D
 .Q:LFLU>$P(BIY(1),U)
 .S LFLU=$P(BIY(1),U)
 K BIY S %=P_"^LAST PROCEDURE 99.52",E=$$START1^APCLDF(%,"BIY(")
 I $D(BIY(1)) D
 .Q:LFLU>$P(BIY(1),U)
 .S LFLU=$P(BIY(1),U)
 ;
 K BIY NEW %
 F %=1:1 S T=$T(FLUCPTS+%) Q:$P(T,";;",2)=""  D
 .;
 .;********** PATCH 1, v8.2.1, FEB 01,2008, IHS/CMI/MWR
 .;---> Not used.  Commented out for Code Set versioning compatibility.
 .;S T=$P(T,";;",2),T=$O(^ICPT("B",T,0))
 .;**********
 .;
 .I T S BIY(1)=$O(^AUPNVCPT("AA",P,T,0)) I BIY(1) S BIY(1)=9999999-BIY(1) D
 ..Q:LFLU>$P(BIY(1),U)
 ..S LFLU=$P(BIY(1),U)
 Q $G(LFLU)
 ;
 ;
 ;----------
FLUCPTS ;;
 ;;90657
 ;;90658
 ;;90659
 ;;90660
