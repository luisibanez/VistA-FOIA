BPSOSC2 ;BHAM ISC/FCS/DRS - certification testing ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ; see remarks in BPSOSC1 too
 Q
 ; ^BPS(9002313.31, has data for test claims
 ; Now construct packets
ALL ; Construct packets for all entries in 9002313.31
 D IMPOSS^BPSOSUE("P","TI","Development utility - incomplete",,"ALL",$T(+0))
 Q
 ;
TEST(ENTRY)       ;
 K BPS
 S:'$D(ZREVERSE) ZREVERSE=0
 S BPS51=1
 S VARX=0 I '$P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) S VARX=1
 I ^BPS(9002313.99,1,"CERTIFIER")=DUZ S CERTIFY=1
 W "Testing in ",$T(+0),!
 I 'VARX I '$P(^BPS(9002313.31,ENTRY,0),U,4) D  Q
 . W "Field .04 in 9002313.31 needs to have pointer to insurer.",!
 N DIALOUT S DIALOUT=$$DIALOUT
 N X S X=$$PACKET(ENTRY,DIALOUT,2) ; ^TMP($J gets copy of BPS() data
 W "Input: 9002313.31 entry `",ENTRY,!
 W "Output: 9002313.02 entry `",X,!
 W !,"To send this claim, DO SEND^BPSOSC2(",ENTRY,")",!
 Q
REVERSAL(ENTRY,N)    ; construct the reversal packet for this 9002313.31 entry
 I ^BPS(9002313.99,1,"CERTIFIER")=DUZ S CERTIFY=1
 K BPS
 S ZREVERSE=1
 D LOG^BPSOSL("Reversal claim `"_ENTRY_" "_$P(^BPSC(ENTRY,0),U))
 ; for the N'th prescription therein - N defaults to 1
 ; First construct the original version.
 D TEST(ENTRY)
 N ORIG K WP S ORIG=$P(^BPS(9002313.31,ENTRY,0),U,3)
 I 'ORIG D  Q
 . D IMPOSS^BPSOSUE("DB,P","TRI","Error constructing original claim",,"REVERSAL - 1",$T(+0))
 N REVERSAL S REVERSAL=$$REVERSE^BPSECA8(ORIG,$S($G(N):N,1:1))
 W "Reversal: 9002313.02 entry `",REVERSAL,!
 I 'REVERSAL D  Q  ; error during construction of reversal
 . D IMPOSS^BPSOSUE("DB,P","TRI","Error constructing reversal claim",,"REVERSAL - 2",$T(+0))
 ; Now construct the data packet
 N COUNT,DIALOUT,CLAIMIEN S COUNT=0
 S DIALOUT=$$DIALOUT,CLAIMIEN=REVERSAL D PASCII1^BPSOSQH
 ; ORIG is obsolete, orphaned
 ; Overwrite the pointer to 9002313.02 with the Reversal packet
 N DIE S DIE=9002313.31,DA=ENTRY,DR=".03////"_REVERSAL D ^DIE
 ; Now SEND^BPSOSC2(ENTRY) will send the reversal
 Q
DIALOUT()          ;
 I VARX Q "1VA"  ;LJE
 Q $O(^BPS(9002313.55,"B","RESERVED - DO NOT USE",0))
SEND(ENTRY)        ; 
 N IEN02 S IEN02=$P(^BPS(9002313.31,ENTRY,0),U,3)
 D RUNTEST^BPSOSC3($$DIALOUT,IEN02)
 W "The log file can be viewed by DO LOG^",$T(+0),!
 Q
LOG ;EP -
 W !,"At the prompt, just type RES to get the RESERVED - DO NOT USE",!
 D COMMSLOG^BPSOSU6
 Q
PRINT(IEN31,FLAG) ;
 W "IEN31=",IEN31,!
 N CLAIM S CLAIM=$P(^BPS(9002313.31,IEN31,0),U,3)
 I 'CLAIM W "No claim for IEN31=",IEN31,! Q
 I $G(FLAG)=0 G P12
 D PRINT02^BPSOSAY(CLAIM)
P12 N RESP S RESP=$O(^BPSR("B",CLAIM,""),-1)  ; get the most recent resp.
 I 'RESP W "No response for CLAIM=",CLAIM,! Q
 D PRINT03^BPSOSAY(RESP)
 Q
PRINTR(IEN31) ;
 D PRINT(IEN31,0)
 Q
SAVEBPS K ^TMP($J,$T(+0))
 N % S %="BPS"
 F  S %=$Q(@%) Q:%=""  S ^TMP($J,$T(+0),%)=@%
 Q
PACKET(ENTRY,DIALOUT,DUMPBPS)      ; EP - from BPSOSC4
 N BPS
 D SETBPS(ENTRY) ; construct the BPS(*) array
 I $G(DUMPBPS)[1 D ZWRITE^BPSOS("BPS") ;ZW BPS
 I $G(DUMPBPS)[2 D SAVEBPS
 N N S N=$P(^BPS(9002313.31,ENTRY,2,0),U,3)
 D NEWCLAIM^BPSOSCE(1,N,N) ; builds a 9002313.02 record
 N CLAIMIEN S CLAIMIEN=$P(^BPSC(0),U,3)
 N COUNT S COUNT=0 ; this variable is used by PASCII1^BPSOSQH
 D PASCII1^BPSOSQH ; construct the data packet
 N DA,DIE,DR S DIE=9002313.31,DA=ENTRY,DR=".03////"_CLAIMIEN D ^DIE
 Q CLAIMIEN
SETBPS(ENTRY) ; Construct packet for just one entry in 9002313.31
 W "Create 9002313.02 claim for "
 W $P(^BPS(9002313.31,ENTRY,0),U),!
 S BPS("Insurer","IEN")=$P(^BPS(9002313.31,ENTRY,0),U,4)
 S BPS("Site","Switch Type")=$P(^BPS(9002313.31,ENTRY,0),U,5)
 I BPS("Site","Switch Type")=""  S BPS("Site","Switch Type")="ENVOY"
 I VARX S BPS("Site","Switch Type")="VA"
 I 'VARX S BPS("NCPDP","IEN")=$P(^BPSEI(BPS("Insurer","IEN"),100),U)
 E  S BPS("NCPDP","IEN")=$P(^BPS(9002313.31,ENTRY,4),"^",1)
 S BPS("NCPDP","BIN Number")=$P(^BPSF(9002313.92,BPS("NCPDP","IEN"),1),U)
 S BPS("NCPDP","Envoy Plan Number")=$P(^BPSF(9002313.92,BPS("NCPDP","IEN"),1),U,4)
 S BPS("NCPDP","Version")=$P(^BPSF(9002313.92,BPS("NCPDP","IEN"),1),U,2)
 S BPS("Envoy Terminal ID")=$P(^BPS(9002313.56,1,0),U,6)
 S BPS("Patient","SSN")=""
 ;
 I $G(ZREVERSE) D
 .S BPS("RX",1,"RX IEN")=1
 .S BPS("RX",1,"IEN59")="999991.00001",BPS("RX","0")=1,BPS("RX",BPS("RX","0"),"Date Filled")=20011206,IEN59="999991.00001"
 ;
 I '$G(BPS("RX",1,"RX IEN")) S BPS("RX",1,"RX IEN")=1,(IEN59,BPS("RX",1,"IEN59"))="999"_ENTRY_".00001"
 ;
 ;for advancepcs - second bin number and hardcoded rx number.
 S BPS("RX",1,"CERT RX IEN")=BPS("RX",1,"RX IEN")
 I ",20,21,22,23,15,16,"[(","_ENTRY_",") S BPS("RX",1,"CERT RX IEN")=$P(^BPS(9002313.31,ENTRY,2,1,1,8,0),"^",2)
 ;
 S BPS("Site","Pharmacy #")=10
 S DFN=$P(^BPS(9002313.31,ENTRY,4),"^",2)
 N A,N S A=0 ; Loop through claim header fields
 F  S A=$O(^BPS(9002313.31,ENTRY,1,A)) Q:'A  D
 . ; Set the Claim Header fields
 . N X S X=^BPS(9002313.31,ENTRY,1,A,0)
 . N FIELD S FIELD=$P(^BPSF(9002313.91,$P(X,U),0),U)
 . W !,FIELD,?30,$P(X,U,2)
 . D SETBPS1(FIELD,$P(X,U,2))
 S N=0 ; Loop through prescription fields
 F  S N=$O(^BPS(9002313.31,ENTRY,2,N)) Q:'N  D
 . N A S A=0
 . F  S A=$O(^BPS(9002313.31,ENTRY,2,N,1,A)) Q:'A  D
 . . S X=^BPS(9002313.31,ENTRY,2,N,1,A,0)
 . . N FIELD S FIELD=$P(^BPSF(9002313.91,$P(X,U),0),U)
 . . W !,FIELD,?30,$P(X,U,2),?50,N
 . . D SETBPS1(FIELD,$P(X,U,2),N)
 . ; Construct a few other fields that weren't already set
 . ; Need this IEN59 for logging some stuff.
 . ; call it 9999991.00001, 9999992.00001, etc.
 . I '$D(^PSRX(BPS("RX",1,"RX IEN"))) S BPS("RX",N,"IEN59")=$$MYIEN59(ENTRY)  ;LJE N TO ENTRY
 . I '$D(^PSRX(BPS("RX",1,"RX IEN"))) D INIT^BPSOSL(BPS("RX",N,"IEN59"))
 ; Construct a few other fields that weren't already set.
 S BPS("Patient","Name")=$G(BPS("Patient","Last Name"))_","_$G(BPS("Patient","First Name"))
 I '$D(BPS("RX",1,"Quantity")) S BPS("RX",1,"Quantity")=$G(BPS("RX",1,"Metric Decimal Quantity"))
 ;
 S BPS("RX",1,"Date Filled")=BPS("RX","Date Filled")
 I ENTRY=9 S BPS("RX",ENTRY,"Date Filled")=20040107,BPS("RX","Date Filled")=20040107
 S BPS("RX","0")=1
 I ENTRY=53 S BPS("RX",ENTRY,"Prescriber ID Qualifier")=12
 Q
PRINTLOG(N) ; print the log file for test claim number N
 D PRINTLOG^BPSOSL($$MYIEN59(N)) Q
MYIEN59(N) ; a fake number
 Q "999999"_N_".00001"
SETBPS1(FIELD,VALUE,N)         ; store values in Claim Header's BPS(*)
 N OK S OK=0
 N I F I=1:1 Q:$T(TABLE+I)=" ;*"  D  Q:OK
 . N X S X=$T(TABLE+I)
 . I $P(X,";",2)'=FIELD Q
 . S @("BPS("_$P(X,";",3)_")=VALUE")
 . S OK=1
 I 'OK W !,"Failed to find field ",FIELD," in TABLE^",$T(+0),!
 Q
TABLE ;
 ;101;"NCPDP","Envoy Plan Number"
 ;102;"NCPDP","Version"
 ;103;"Transaction Code"
 ;104;"NCPDP","PCN"
 ;109;"Transaction Count"
 ;110;"NCPDP","Software Vendor/Cert ID"
 ;111;"NCPDP","Segment Identification"
 ;201;"Site","Pharmacy #"
 ;202;"Service Provider ID Qual"
 ;301;"Insurer","Group #"
 ;302;"Insurer","Policy #"
 ;303;"Insurer","Person Code"
 ;304;"Patient","DOB"
 ;305;"Patient","Sex"
 ;306;"Insurer","Relationship"
 ;308;"Patient","Other Coverage Code"
 ;307;"Customer Location"
 ;309;"Eligibility Clarification Code"
 ;310;"Patient","First Name"
 ;311;"Patient","Last Name"
 ;312;"Cardholder","First Name"
 ;313;"Cardholder","Last Name"
 ;322;"Patient","Street Address"
 ;323;"Patient","City"
 ;324;"Patient","State"
 ;325;"Patient","Zip"
 ;331;"Patient","Patient ID Qualifier"
 ;332;"Patient","SSN"
 ;326;"Patient","Phone #"
 ;401;"RX","Date Filled"
 ;402;"RX",N,"RX Number"
 ;403;"RX",N,"Refill #"
 ;404;"RX",N,"Quantity"
 ;405;"RX",N,"Days Supply"
 ;406;"RX",N,"Compound Code"
 ;407;"RX",N,"NDC"
 ;408;"RX",N,"DAW"
 ;409;"RX",N,"Ingredient Cost"
 ;410;"RX",N,"Sales Tax"
 ;411;"RX",N,"Prescriber ID"
 ;412;"RX",N,"Dispensing Fee"
 ;414;"RX",N,"Date Written"
 ;415;"RX",N,"# Refills"
 ;416;"RX",N,"Preauth #"
 ;418;"RX",N,"Level of Service"
 ;419;"RX",N,"Origin Code"
 ;420;"RX",N,"Clarification"
 ;421;"RX",N,"Primary Prescriber"
 ;422;"RX",N,"Clinic ID"
 ;423;"RX",N,"Basis of Cost Determination"
 ;424;"RX",N,"Diagnosis Code"
 ;426;"RX",N,"Usual & Customary"
 ;427;"RX",N,"Prescriber Last Name"
 ;429;"RX",N,"Unit Dose Indicator"
 ;430;"RX",N,"Gross Amount Due"
 ;431;"RX",N,"Other Payor Amount"
 ;433;"RX",N,"Patient Paid Amount"
 ;436;"RX",N,"Alt. Product Type"
 ;438;"RX",N,"Incentive Amount"
 ;439;"RX",N,"DUR","DUR Conflict Code",439
 ;440;"RX",N,"DUR","DUR Intervention Code",440
 ;441;"RX",N,"DUR","DUR Outcome Code",441
 ;442;"RX",N,"Metric Decimal Quantity"
 ;443;"RX",N,"Primary Payor Denial Date"
 ;444;"RX",N,"Provider ID"
 ;455;"RX",N,"Rx/Service Ref Num Qual"
 ;460;"RX",N,"Quantity"
 ;461;"Claim",N,"Prior Auth Type"
 ;462;"Claim",N,"Prior Auth Num Sub"
 ;465;"RX",N,"Provider ID"
 ;466;"RX",N,"Prescriber ID Qualifier"
 ;467;"RX",N,"Prescriber Location Code"
 ;468;"RX",N,"Primary Care Prov ID Qual"
 ;469;"RX",N,"Primary Care Prov ID"
 ;470;"RX",N,"Primary Care Prov Last Name"
 ;473;"RX",N,"DUR","DUR/PPS CODE COUNTER",473
 ;478;"Insurer","Other Amt Claim Sub Cnt"
 ;479;"Insurer","Other Amt Claim Sub Qual"
 ;480;"Insurer","Other Amt Claim Submitted"
 ;481;"Insurer","Flat Sales Tax Amt Sub"
 ;482;"Insurer","Percentage Sales Tax Amt Sub"
 ;483;"Insurer","Percent Sales Tax Rate Sub"
 ;484;"Insurer","Percent Sales Tax Basis Sub"
 ;498;"RX",N,"Prescriber Phone #"
 ;*
