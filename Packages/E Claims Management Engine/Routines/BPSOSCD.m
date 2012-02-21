BPSOSCD ;BHAM ISC/FCS/DRS/DLF - Set BPS() "RX" nodes for current medication ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
 ;----------------------------------------------------------------------
 ;Set BPS() "RX" nodes for current medication:
 ;
 ;Parameters:   VMEDINFO  - Contains VMEDIEN,RXIEN,RXRFIEN,VCPTIEN
 ;              MEDN      - Index number indicating what medication is
 ;                          being processed
 ;----------------------------------------------------------------------
 ; Called from BPSOSCA from BPSOSQG from BPSOSQ2,
 ; once for each item in its VMEDS() array.
MEDINFO(VMEDINFO,MEDN,INSPINS) ;EP
 ;Manage local variables
 N VMEDIEN,RXIEN,RXRFIEN,DRUGIEN,PROVIEN,VCPTIEN,RXI,IEN59,PINSTYPE
 N FILLDT
 ;
 ;Parse variables from VMEDINFO variable
 S VMEDIEN=$P(VMEDINFO,U,1)
 S RXIEN=$P(VMEDINFO,U,2)
 S RXRFIEN=$P(VMEDINFO,U,3)
 S VCPTIEN=$P(VMEDINFO,U,4)
 S IEN59=$P(VMEDINFO,U,5) ; 06/23/2000
 D OVERRIDE(IEN59,MEDN) ; overrides stored in 9002313.511
 ;
 ;IHS/SD/lwj 8/20/02  NCPDP 5.1 changes - if a 5.1 claims and
 ; there are DUR values - retrieve them
 I BPS("NCPDP","Version")[5 D DURVALUE(IEN59,MEDN)
 ;
 ;
 S PINSTYPE=$P(INSPINS,",") ; "CAID" will make a difference
 ;
 S DRUGIEN=$P($G(^PSRX(RXIEN,0)),U,6)
 S PROVIEN=$P($G(^PSRX(RXIEN,0)),U,4)
 ;
 S BPS("RX",MEDN,"VCPT IEN")=VCPTIEN
 S BPS("RX",MEDN,"IEN59")=IEN59 ; 06/23/2000
 S (RXI,BPS("RX",MEDN,"RX IEN"))=RXIEN
 S BPS("RX",MEDN,"Date Written")=$P($G(^PSRX(RXIEN,0)),U,13)
 S BPS("RX",MEDN,"RX Number")=RXIEN
 S BPS("RX",MEDN,"New/Refill")=$S(RXRFIEN="":"N",1:"R")
 ;
 ;IHS/SD/lwj 8/30/02  NCPDP 5.1 changes 
 ; Version 3.2 uses field 416 for the prior auth code and number
 ; Version 5.1 will use fields 461 and 462
 ; Below line remarked out, next three lines added
 ;
 S BPS("RX",MEDN,"Preauth #")=$P(^BPST(IEN59,1),U,15)_$P(^BPST(IEN59,1),U,9)
 ;
 ; Get Service Date
 ; It should be in BPS Transaction.  If not, use the established algorithm, which
 ;    is $$DOSDATE^BPSSCRRS
 S FILLDT=$P($G(^BPST(IEN59,12)),U,2)
 I FILLDT="" S FILLDT=$$DOSDATE^BPSSCRRS(RXIEN,RXRFIEN)
 S BPS("RX",MEDN,"Date Filled")=$$FMTHL7^XLFDT(FILLDT)
 S BPS("Claim",MEDN,"Prior Auth Type")=$P(^BPST(IEN59,1),U,15)
 S BPS("Claim",MEDN,"Prior Auth Num Sub")=$P(^BPST(IEN59,1),U,9)
 ;
 I 'RXRFIEN D  ; first fill
 .S BPS("RX",MEDN,"Quantity")=$P($G(^PSRX(RXIEN,0)),U,7)
 .S BPS("RX",MEDN,"Days Supply")=$P($G(^PSRX(RXIEN,0)),U,8)
 .S BPS("RX",MEDN,"DAW")=$P($G(^PSRX(RXIEN,"EPH")),U,1)
 . D NOW^%DTC S TODAY=$P(%,".",1)
 E  D  ; refill
 .S BPS("RX",MEDN,"Quantity")=$P($G(^PSRX(RXIEN,1,RXRFIEN,0)),U,4)
 .S BPS("RX",MEDN,"Days Supply")=$P($G(^PSRX(RXIEN,1,RXRFIEN,0)),U,10)
 .S BPS("RX",MEDN,"DAW")=$P($G(^PSRX(RXIEN,1,RXRFIEN,"EPH")),U,1)
 S BPS("RX",MEDN,"NDC")=$$GETNDC^PSONDCUT(RXIEN,RXRFIEN)
 S BPS("RX",MEDN,"# Refills")=$P($G(^PSRX(RXIEN,0)),U,9)
 S BPS("RX",MEDN,"Refill #")=$$RXRFN(RXIEN,RXRFIEN)
 S BPS("RX",MEDN,"Prescriber IEN")=+PROVIEN
 D STLIC^BPSJPAY(MEDN,PROVIEN,BPS("RX",MEDN,"Date Filled"))
 I PROVIEN'="" D  ;had to do this for certification
 .S BPS("RX",MEDN,"Prescriber Name")=$$GET1^DIQ(200,+PROVIEN,.01) ;LJE;7/7/03
 .S BPS("RX",MEDN,"Prescriber Phone #")=$$GET1^DIQ(200,+PROVIEN,.131) ;LJE;7/7/03
 .I ^BPS(9002313.99,1,"CERTIFIER")=DUZ S BPS("RX",MEDN,"Prescriber DEA #")=$G(BPS("RX",1,"Provider ID"))
 .S BPS("RX",MEDN,"Prescriber DEA #")=$$GET1^DIQ(200,+PROVIEN,53.2)
 .S BPS("RX",MEDN,"Prescriber CAID #")=""
 .S BPS("RX",MEDN,"Prescriber UPIN #")=""
 .S BPS("RX",MEDN,"Prescriber Billing Location")="" ; ANMC only?  not in Sitka's data dic.
 S BPS("RX",MEDN,"Alt. Product Type")="03" ;lje;7/15/03
 S BPS("RX",MEDN,"Gross Amount Due")=$G(VAINFO(9002313.59902,VAINSDA1_","_VAINSDA_",",902.15,"I")) ;LJE
 S BPS("RX",MEDN,"Usual & Customary")=$G(VAINFO(9002313.59902,VAINSDA1_","_VAINSDA_",",902.14,"I")) ;LJE
 S BPS("RX",MEDN,"Basis of Cost Determination")=$G(VAINFO(9002313.59902,VAINSDA1_","_VAINSDA_",",902.13,"I")) ;LJE
 S (VANATURE,VAOIEN)="",VAOIEN=$P($G(^PSRX(RXIEN,"OR1")),"^",2),VANATURE=$$GET1^DIQ(100.008,"1,"_VAOIEN_",","12")
 S BPS("RX",MEDN,"Origin Code")=$S(VANATURE="AUTO":2,VANATURE["ELECTRONIC":3,VANATURE="DUPLICATE":0,VANATURE["TELEPHONE":2,1:1)
 K VANATURE,VAOIEN ;LJE;7/16/03
 D
 . N %
 . I PINSTYPE="CAID" D
 . . S %=BPS("RX",MEDN,"Prescriber CAID #")
 . . I %="" D  ; special for ANMC
 . . . N X1 S X1=BPS("RX",MEDN,"Prescriber Billing Location")
 . . . S %=$S(X1=1665:"MDG275",X1=1946:"MDG867",1:"")
 . . I %="" S %=BPS("Site","Default CAID #")
 . E  D
 . . S %=BPS("RX",MEDN,"Prescriber DEA #")
 . . I %="" S %=BPS("Site","Default DEA #")
 . S BPS("RX",MEDN,"Prescriber ID")=%
 ;
 D:DRUGIEN'=""
 .S BPS("RX",MEDN,"Drug IEN")=DRUGIEN
 .S BPS("RX",MEDN,"Drug Name")=$P($G(^PSDRUG(DRUGIEN,0)),U,1)
 N PRICING S PRICING=^BPST(IEN59,5)
 S BPS("RX",MEDN,"Quantity")=$P(PRICING,U) ; 01/31/2001
 S BPS("RX",MEDN,"Unit Price")=$P(PRICING,U,2)
 S BPS("RX",MEDN,"Ingredient Cost")=$J($P(PRICING,U,2),0,2)
 S BPS("RX",MEDN,"Dispensing Fee")=$J($P(PRICING,U,4),0,2)
 S BPS("Site","Dispensing Fee")=BPS("RX",MEDN,"Dispensing Fee")
 I '$G(VARX) S BPS("RX",MEDN,"Gross Amount Due")=$J($P(PRICING,U,5),0,2) ;LJE;7/21/03
 S BPS("RX",MEDN,"Usual & Customary")=$J($P(PRICING,U,5),0,2)
 I $G(BPS("NCPDP","Add Disp. Fee to Ingr. Cost")) D  ;LJE;ADDED $G
 . N X S X=BPS("RX",MEDN,"Ingredient Cost")
 . S X=X+BPS("RX",MEDN,"Dispensing Fee")
 . S BPS("RX",MEDN,"Ingredient Cost")=X
 ;
 ; Visit-related data
 ;
 I IEN59 D
 . N VSITIEN S VSITIEN=$P(^BPST(IEN59,0),U,7)
 . Q:'VSITIEN
 Q
 ;
 ; $$RXRFN()
 ;Determine RX Refill Number based on prescription record
 ;  It's overly cautious about making sure that the refills are
 ;  counted in date filled order.
 ;
 ;Input Variables:    RXIEN    -  Prescription record IEN (52)
 ;                    RXRFIEN  -  Refill multiple IEN
 ;
 ;Function Returns:   Null  - Could not process request
 ;                    0     - Not a refill
 ;                    N     - Refill number
 ; Copied into here from BPSECD4 so we can remove BPSECD4 from kit.
 ; Also called from BPSOSN3
 ;----------------------------------------------------------------------
RXRFN(RXIEN,RXRFIEN) ;EP
 ;Manage local variables
 N COUNT,DATE,XIEN,STOP
 ;
 ;Make sure input variables are defined
 Q:$G(RXIEN)="" ""
 Q:$G(RXRFIEN)="" ""
 ;
 ;Initialize local variables
 S (COUNT,STOP)=0
 ;
 ;Loop through refill multiple by date
 S DATE=""
 F  D  Q:'+DATE!(STOP)
 .S DATE=$O(^PSRX(RXIEN,1,"B",DATE))
 .Q:'+DATE
 .;
 .;For each sub-record increment refill count
 .S XIEN=""
 .F  D  Q:'+XIEN!(STOP)
 ..S XIEN=$O(^PSRX(RXIEN,1,"B",DATE,XIEN))
 ..Q:'+XIEN
 ..S COUNT=COUNT+1
 ..;
 ..;STOP when you reach the refill record
 ..S:XIEN=RXRFIEN STOP=1
 Q $S(STOP=1:COUNT,1:0)
 ;
 ; Retrieve OVERRIDE nodes and put into BPS array
 ; They will be fetched from BPS("OVERRIDE"
 ; during low-level construction of the actual encoded claim packet.
 ;
OVERRIDE(IEN59,MEDN)    ; set any BPS("OVERRIDE" nodes from 9002313.511 data
 ; BPS("OVERRIDE",field)=value  for fields 101-401
 ; BPS("OVERRIDE","RX",MEDN,field) for med #N, fields 402+
 ; Note that if you have multiple prescriptions bundled, the
 ; union of overrides from 101-401 apply to all; and if there's a 
 ; conflict, the last one overwrites the previous ones.
 N IEN511 S IEN511=$P(^BPST(IEN59,1),U,13) Q:'IEN511
 N RETVAL S RETVAL=$$GET511^BPSOSO2(IEN511,"BPS(""OVERRIDE"")","BPS(""OVERRIDE"",""RX"","_MEDN_")")
CC Q
 ;
DURVALUE(IEN59,MEDN)         ;IHS/SD/lwj 8/20/02 NCPDP 5.1 changes
 ; This subroutine will read in the DUR data from the DUR multiple
 ; in BPS Transactions and store the values into BPS("RX",MEDN,DUR,....)
 ;
 ; (NOTE - unlike most values, these fields are stored by their
 ; field number.  Since they are repeating, it will ease the 
 ; retrieval of them, when we populate the claim.)
 ;
 N DUR,DCNT,DURREC
 ;
 S (DUR,DCNT)=0
 F  S DCNT=$O(^BPST(IEN59,13,DCNT)) Q:'+DCNT  D
 . S DURREC=$G(^BPST(IEN59,13,DCNT,0))
 . I DURREC="" Q
 . S DUR=DUR+1
 . S BPS("RX",MEDN,"DUR",DUR,473)=DUR  ;dur/pps cntr
 . S BPS("RX",MEDN,"DUR",DUR,439)=$P(DURREC,U,2) ;Reason Srv Cd
 . S BPS("RX",MEDN,"DUR",DUR,440)=$P(DURREC,U,3) ;Prof Srv Cd
 . S BPS("RX",MEDN,"DUR",DUR,441)=$P(DURREC,U,4) ;Result Src Cd
 . S BPS("RX",MEDN,"DUR",DUR,474)=""             ;Level of Effort
 . S BPS("RX",MEDN,"DUR",DUR,475)=""             ;Co-agent Qual
 . S BPS("RX",MEDN,"DUR",DUR,476)=""             ;Co-agent ID
 ;
 Q
