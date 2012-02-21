BPSOSCC ;BHAM ISC/FCS/DRS/DLF - Set up BPS() ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
GETINFO(DIALOUT,PATIEN,VSTIEN,PINS,INSIEN,VAINFO) ;EP;LJE;6/30/03 ADD VAINFO
 N XDATA,NRECIEN
 N PINSDA,PINSDA1,PINSTYPE S PINSDA=$P(PINS,",",2),PINSTYPE=$P(PINS,",")
 I PINSTYPE="PRVT"!(PINSTYPE="VA3PTY") S PINSDA1=$P(PINS,",",3) ; else PINSDA1 undef
 S BPS("VisitIEN")=VSTIEN
 S (VAINSDA,VAINSDA1)="" S VAINSDA=PINSDA,VAINSDA1=PINSDA1
 S BPS("Site","IEN")=DIALOUT
 S BPS("Site","Switch Type")=$$SWTYPE(DIALOUT)
 N PHARMACY
 D
 . N ABSBRXI S ABSBRXI=$O(RXILIST(""))
 . S PHARMACY=$P(^BPST(ABSBRXI,1),U,7)
 . S XDATA=^BPS(9002313.56,PHARMACY,0)
 . S BPS("Site","NABP #")=$P(XDATA,U,2)
 . S BPS("Site","Default DEA #")=$P(XDATA,U,3)
 . S BPS("Envoy Terminal ID")=$P(XDATA,U,6)
 . S XDATA=$G(^BPS(9002313.56,PHARMACY,"CAID"))
 . S BPS("Site","Medicaid Pharmacy #")=$P(XDATA,U)
 . S BPS("Site","Default CAID #")=$P(XDATA,U,2)
 . S XDATA=$G(^BPS(9002313.56,PHARMACY,"NDC"))
 . S BPS("Site","NDC ID")=$P(XDATA,U)
 ;
 I $P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) D
 . S XDATA=^DPT(PATIEN,0)
 . S BPS("Patient","IEN")=PATIEN
 . D  ; Patient,Name
 .. N % I PINSTYPE="CAID" D
 .. . S %=$$CAIDNAME
 .. E  I PINSTYPE="CARE" D
 .. . S %=$$CARENAME
 .. E  S %=""
 .. I %="" S %=$P(XDATA,U)
 .. S BPS("Patient","Name")=%
 . S BPS("Patient","Sex")=$P(XDATA,U,2)
 . S BPS("Patient","DOB")=$P(XDATA,U,3)
 . S BPS("Patient","SSN")=$P(XDATA,U,9)
 E  S DFN=PATIEN D DEM^VADPT,ADD^VADPT D  ;LJE;06/30/03;VA doesn't BILL medicare/medicaid
 . S BPS("Patient","IEN")=PATIEN
 . S BPS("Patient","Name")=$G(VADM(1))
 . S BPS("Patient","Sex")=$P($G(VADM(5)),"^",1)
 . S BPS("Patient","DOB")=$P($G(VADM(3)),"^",1)
 . S BPS("Patient","DOB")=($E(BPS("Patient","DOB"),1,3)+1700)_$E(BPS("Patient","DOB"),4,7)
 . S BPS("Patient","SSN")=$P($G(VADM(2)),"^",1)
 . S BPS("Patient","State")=$P($G(VAPA(5)),"^",1)
 . I BPS("Patient","State")'="" S BPS("Patient","State")=$P($G(^DIC(5,BPS("Patient","State"),0)),"^",2)
 . S BPS("Patient","Street Address")=$G(VAPA(1))
 . S BPS("Patient","City")=$G(VAPA(4))
 . S BPS("Patient","Zip")=$G(VAPA(6))
 . S BPS("Patient","Phone #")=$P($G(VAPA(8)),"^",1)
 . S BPS("Patient","Phone #")=$TR(BPS("Patient","Phone #"),"()-/*# ")
 . 
 S (INSIEN,BPS("Insurer","IEN"))=INSIEN   ;$$INSIEN
 S VARX=0
 I '$P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) D  G VASKIP  ;LJE;7/3/03
 . S VARX=1
 . S BPS("Insurer","Relationship")=$G(VAINFO(9002313.59902,PINSDA1_","_PINSDA_",",902.07,"I"))
 . S BPS("Insurer","Administrative Fee")=$G(VAINFO(9002313.59902,PINSDA1_","_PINSDA_",",902.16,"I"))
 . I BPS("Insurer","Administrative Fee")'=""&(BPS("Insurer","Administrative Fee")'=0) S BPS("Insurer","Other Amt Claim Sub Qual")="04"
 . E  S BPS("Insurer","Other Amt Claim Sub Qual")=""
 . I BPS("Insurer","Relationship")="" S BPS("Insurer","Relationship")=0 ;if not there, mark it as unspecified.
 . S BPS("Patient","Primary Care Prov Location Code")=$G(VAINFO(9002313.59902,PINSDA1_","_PINSDA_",",902.11,"I"))  ;LJE;7/7/03
 . S BPS("Insurer","Person Code")=$S(BPS("Insurer","Relationship")=1:"01",BPS("Insurer","Relationship")=2:"02",BPS("Insurer","Relationship")=3:03,1:"")
 . S BPS("Insurer","Group #")=$G(VAINFO(9002313.59902,PINSDA1_","_PINSDA_",",902.05,"I"))
 . S BPS("Insurer","Policy #")=$G(VAINFO(9002313.59902,PINSDA1_","_PINSDA_",",902.06,"I"))  ;CARDHOLDER ID
 . S BPS("Insurer","Full Policy #")=BPS("Insurer","Policy #")
 . S BPS("Insurer","VA PLAN IEN")=$G(VAINFO(9002313.59902,PINSDA1_","_PINSDA_",",.01,"I"))
 . S:'$D(BPS("Insurer","Percent Sales Tax Rate Sub")) BPS("Insurer","Percent Sales Tax Rate Sub")=""
 . S:'$D(BPS("Insurer","Percent Sales Tax Basis Sub")) BPS("Insurer","Percent Sales Tax Basis Sub")=""
 . S BPS("Cardholder","First Name")=$G(VAINFO(9002313.59902,PINSDA1_","_PINSDA_",",902.08,"I"))
 . S BPS("Cardholder","Last Name")=$G(VAINFO(9002313.59902,PINSDA1_","_PINSDA_",",902.09,"I"))
 . S BPS("Home Plan")=$G(VAINFO(9002313.59902,PINSDA1_","_PINSDA_",",902.11,"I"))
 . S BPS("Site","Pharmacy #")=BPS("Site","NABP #")
 . I $D(^BPS(9002313.56,PHARMACY,"INSURER-ASSIGNED #","B",INSIEN)) D
 . . N X S X=$O(^BPS(9002313.56,PHARMACY,"INSURER-ASSIGNED #","B",INSIEN,0))
 . . S BPS("Site","Pharmacy #")=$P(^BPS(9002313.56,PHARMACY,"INSURER-ASSIGNED #",X,0),U,2)
 . S BPS("NCPDP","BIN Number")=$G(VAINFO(9002313.59902,PINSDA1_","_PINSDA_",",902.03,"I"))
 . S XDATA=""
 . I $G(VAINFO(9002313.59902,PINSDA1_","_PINSDA_",",902.02,"I")) S XDATA=$G(^BPSF(9002313.92,VAINFO(9002313.59902,PINSDA1_","_PINSDA_",",902.02,"I"),1))
 . I XDATA="" D IMPOSS^BPSOSUE("DB","TI","VA - Payer sheet info missing.",,"BPS NCPDP FORMATS",$T(+0))
 . S BPS("NCPDP","Version")=$P(XDATA,U,2)
 . S BPS("NCPDP","# Meds/Claim")=$P(XDATA,U,3)
 . S BPS("NCPDP","PCN")=$G(VAINFO(9002313.59902,PINSDA1_","_PINSDA_",",902.04,"I"))
 . I $P(XDATA,U,8)="" S $P(XDATA,U,8)=1
 . S (INSIEN,BPS("Insurer","IEN"))=$P(INSIEN,"^",2)
 . S NRECIEN=INSIEN ;LJE;7/2/03;PAYER SHEET IEN
 ;
 S BPS("Insurer","Relationship")=$$INSREL
 S BPS("Insurer","Person Code")=$$PERSON
 S BPS("Insurer","Group #")=$$INSGRP
 S BPS("Insurer","Policy #")=$TR($$INSPOL,"- /.","") ; BPS*1.0T7*3
 ;
 ; IHS/SD/lwj 03/12/02  some insurers require the entire, untranslated
 ; value as the cardholder ID - added new array bucket to hold
 S BPS("Insurer","Full Policy #")=$$INSPOL ;IHS/SD/lwj 03/12/02
 ;
 ; Pharmacy number:  usually NABP #, but sometimes the insurer demands
 ; their own insurer-assigned pharmacy number.  Especially with Medicaid
 S BPS("Site","Pharmacy #")=BPS("Site","NABP #")
 I $D(^BPS(9002313.56,PHARMACY,"INSURER-ASSIGNED #","B",INSIEN)) D
 . N X S X=$O(^BPS(9002313.56,PHARMACY,"INSURER-ASSIGNED #","B",INSIEN,0))
 . S BPS("Site","Pharmacy #")=$P(^BPS(9002313.56,PHARMACY,"INSURER-ASSIGNED #",X,0),U,2)
 ; Anachronism:  Medicaid Pharmacy # is a special field,
 ; properly, it belongs in the INSURER-ASSIGNED #
 ; But that Medicaid Pharmacy # will overwrite the in INS.-ASSIGNED #
 I PINSTYPE="CAID",BPS("Site","Medicaid Pharmacy #")]"" D
 . S BPS("Site","Pharmacy #")=BPS("Site","Medicaid Pharmacy #")
 ;"NCPDP" nodes
 S NRECIEN=$P($G(^BPSEI(INSIEN,100)),U,1)
VASKIP ;LJE;7/2/03
 S BPS("Insurer","Percentage Sales Tax Amt Sub")=0
 S BPS("Insurer","Flat Sales Tax Amount Sub")=0
 D:NRECIEN'=""
 .S BPS("NCPDP","IEN")=NRECIEN
 .S XDATA=$G(^BPSF(9002313.92,NRECIEN,1))
 .S:BPS("NCPDP","BIN Number")="" BPS("NCPDP","BIN Number")=$P(XDATA,U,1)
 .S BPS("NCPDP","Version")=$P(XDATA,U,2)
 .S BPS("NCPDP","# Meds/Claim")=$P(XDATA,U,3)
 .S BPS("NCPDP","Envoy Plan Number")=$P(XDATA,U,4)
 .S BPS("NCPDP","Software Vendor/Cert ID")=$P(XDATA,U,13)
 .I $P(XDATA,U,8)="" S $P(XDATA,U,8)=1  ;LJE;7/15/03
 .I '$G(VARX) S BPS("NCPDP","Add Disp. Fee to Ingr. Cost")=$P(XDATA,U,8) ;LJE;7/15/03
 Q
 ; $$INSxxx functions - given PINSTYPE, PINSDA, PINSDA1
INSIEN() ; get pointer to ^AUTNINS
 ; (But shouldn't we directly get this from the IEN59?)
 Q 0
INSREL() ; a single digit, 1, 2, 3, 4 = self,spouse,child,other
 Q 0
AUTTRLSH()         ; relationship - pointer to ^AUTTRLSH
 Q 0
ELGCLAR()          ; Eligibility clarification code
 Q ""
PERSON() ; Person Code
 N X
 I X="" S X="0"_$$INSREL
 Q X
INSGRP() I PINSTYPE'="PRVT" Q ""
 N X S X=$$INS3PPH Q:'X ""
 Q 0
INS3PPH()           Q 0
INSPOL() ;
 Q 0
CAIDNAME()         Q 0
CARENAME()         Q 0
SWTYPE(D)          ;EP - from BPSOSC4 - given pointer to dial-out
 ; Is it NDC or ENVOY?
 I '$P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) Q "VA"  ;LJE;6/30/03
 N X S X=^BPS(9002313.55,D,0)
 I $P(X,U,3)]"" Q $P(X,U,3)
 I $P(X,U)["NDC" Q "NDC"
 I $P(X,U)["ENVOY" Q "ENVOY"
 D IMPOSS^BPSOSUE("P","TI","Bad switch type for dialout "_D,,"SWTYPE",$T(+0))
 Q "" ; should never happen
