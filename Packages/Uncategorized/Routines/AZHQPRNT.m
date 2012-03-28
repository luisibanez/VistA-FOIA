AZHQPRNT ;IHS/OIRM/DSD/AEF - DOCUMENT PRINT DIAGNOSTIC ROUTINE [ 08/16/2001  5:33 PM ]
 ;V1.0;SPECIAL DIAGNOSTIC ROUTINES
 ;
EN(ACRDOCDA,ACRREF)         ;EP
 ;----- SET UP ZTIO VARIABLES FOR PRINTING DOCUMENTS
 ;
 ;      INPUT:
 ;      ACRDOCDA  =  INTERNAL DOCUMENT NUMBER TO BE PRINTED
 ;
 D ARRAYS
 S ACRDOC0=$G(^ACRDOC(ACRDOCDA,0))
 W !!,"DOCUMENT: "_$P(ACRDOC0,U)_"  "_$P(ACRDOC0,U,2)
 W "  REFERENCE CODE: "_ACRREF
 ;ADD DEPARTMENT AND IEN
 ;ADD PURCHASING OFFICE AND IEN
 I $P(^ACRDOC(ACRDOCDA,0),U,4)=35 D  Q
 . W !?8,"IS A CREDIT CARD PURCHASE"
 I $P(ACRDOC0,U,19),ACRREF=103 D
 .S ACRREFXX=103
 .S ACRREF=116
 .;SHIFT REF CODE SO APPROVED BPA CALL IS PRINTED AS REQUISITION
 ;
 S ACRDEPT=$P(ACRDOC0,U,6) ;DEPT ACCT IEN
 I ACRDEPT S ACRDEPTN=$P($G(^ACRLOCB(ACRDEPT,0)),U,5)
 I ACRDEPTN S ACRDEPTN=$P($G(^AUTTPRG(ACRDEPTN,0)),U) ;DEPT ACCNT NAME
 S ACRPODA=$P(ACRDOC0,U,8)
 S ACRPON=$P($G(^ACRPO(ACRPODA,0)),U)
 I ACRPON S ACRPON=$P($G(^AUTTLOC(ACRPON,0)),U)
 I ACRPON S ACRPON=$P($G(^DIC(4,ACRPON,0)),U) ;PURCHASING OFFICE NAME
 S ACRFIN=$P(^ACRPO(ACRPODA,0),U,8)
 S ACRFIN=$P($G(^AUTTPRG(ACRFIN,0)),U) ;FINANCE OFFICE NAME
 ;
 S (ACRPO0,X)=^ACRPO(ACRPODA,0)
 S ACRPODT=^ACRPO(ACRPODA,"DT")
 S ACRPOC=$P(ACRPODT,U,11)
 S ACRTOC=$P(ACRPODT,U,12)
 S ACRTROC=$P(ACRPODT,U,13)
 S ZTIO2=$P(X,U,8)
 S ZTIO7=$P(X,U,16)
 S ZTIO8=$P(X,U,17)
 S ZTIO9=$P(X,U,18)
 S ZTIO2=$P(^AUTTPRG(ZTIO2,"DT"),U,10)
 S ZTIO1=$P(ACRPO0,U,2)
 S ZTIO5=$P(ACRPO0,U,14)
 S ACRCOPY=$P(ACRPODT,U,6)
 S:ZTIO7 ZTIO7=$P(^AUTTPRG(ZTIO7,"DT"),U,10)
 S ZTIO6=$P(^ACRPO(1,0),U,15)
 S ACRLBDA=$P(ACRDOC0,U,6)
 S (ZTIO3,ZTIO4)=""
 S X=$G(^ACRLOCB(+ACRLBDA,0))
 S (ACRDPTDA,X)=$P(X,U,5)
 S X=$G(^AUTTPRG(+X,"DT"))
 S ZTIO3=$P(X,U,10)
 S ZTIO4=$P(X,U,12)
 ;
 S ZTIO1N="PURCHASING OFFICE PRINTER"
 S ZTIO2N="FINANCE OFFICE PRINTER"
 S ZTIO3N="DEPARTMENT PRINTER"
 S ZTIO4N="NOT USED"
 S ZTIO5N="TRAVEL ORDER PRINTER"
 S ZTIO6N="AREA PROPERTY OFFICE PRINTER"
 S ZTIO7N="REGIONAL FINANCE OFFICE PRINTER"
 S ZTIO8N="SUPPLY OFFICE PRINTER"
 S ZTIO9N="PERSONNEL OFFICE PRINTER"
 ;
 I $G(ZTIO1) S ZTIO1N=ZTIO1N_U_$P($G(^%ZIS(1,ZTIO1,0)),U)
 I $G(ZTIO2) S ZTIO2N=ZTIO2N_U_$P($G(^%ZIS(1,ZTIO2,0)),U)
 I $G(ZTIO3) S ZTIO3N=ZTIO3N_U_$P($G(^%ZIS(1,ZTIO3,0)),U) 
 I $G(ZTIO4) S ZTIO4N=ZTIO4N_U_$P($G(^%ZIS(1,ZTIO4,0)),U)
 I $G(ZTIO5) S ZTIO5N=ZTIO5N_U_$P($G(^%ZIS(1,ZTIO5,0)),U)
 I $G(ZTIO6) S ZTIO6N=ZTIO6N_U_$P($G(^%ZIS(1,ZTIO6,0)),U)
 I $G(ZTIO7) S ZTIO7N=ZTIO7N_U_$P($G(^%ZIS(1,ZTIO7,0)),U)
 I $G(ZTIO8) S ZTIO8N=ZTIO8N_U_$P($G(^%ZIS(1,ZTIO8,0)),U)
 I $G(ZTIO9) S ZTIO9N=ZTIO9N_U_$P($G(^%ZIS(1,ZTIO9,0)),U)
 ;
 W !,"DEPARTMENT ACCOUNT: "_ACRDEPT_"  "_ACRDEPTN
 W !,"PURCHASING OFFICE : "_ACRPON
 ;
 D LSET1
 D LSET2
 D LSET3
 D LSET4
 D LSET5
 D LSET6
 D LSET7
 D LSET8
 D LSET9
 D LSET10
 D LSET11
 D LSET12
 D LSET13
 Q
LSET1 ;----- LOGIC SET #1
 ;      SEND REQUISITIONS AND PO'S TO PROCUREMENT
 ;
 N ACRMES
 W !!,?5,"LOGIC SET #1"
 W !,?5,"SEND REQS AND PO'S TO PROCUREMENT"
 I "^116^204^103^349^326^210^"'[(U_ACRREF_U) D
 . S ACRMES(1)="NOT APPLICABLE - THIS IS NOT A REQUISITION OR PO"
 I "^116^204^103^349^326^210^"[(U_ACRREF_U) D
 . I ACRPOC=0 D
 . . S ACRMES(2)="PO PRINT CONTROL = 0:NO AUTO PRINT"
 . I ACRPOC,ACRPOC'[1 D
 . . S ACRMES(3)="PO PRINT CONTROL DOES NOT CONTAIN 1:PURCHASING"
 I '$G(ZTIO1) D
 . S ACRMES(4)="PURCHASING OFFICE PRINTER IS NULL"
 I '$D(ACRMES) D
 . S ACRMES(99)="SHOULD PRINT TO "_$P($G(ZTIO1N),U,2)
 D MESS(.ACRMES)
 Q
 ;
LSET2 ;----- LOGIC SET #2
 ;      SEND REQUISITIONS AND PO'S TO THE ORIGINATING DEPARTMENT IF
 ;      PRINTER DIFFERENT FROM PROCUREMENT OFFICE PRINTER
 ;
 N ACRMES
 W !!?5,"LOGIC SET #2"
 W !?5,"SEND REQUISITIONS AND PO'S TO THE ORIGINATING DEPARTMENT IF"
 W !?5,"PRINTER DIFFERENT FROM PROCUREMENT OFFICE PRINTER"
 ;
 I "^116^204^103^349^326^210^"'[(U_ACRREF_U) D
 . S ACRMES(1)="NOT APPLICABLE - THIS IS NOT A REQUISITION OR PO"
 I ZTIO3=ZTIO1 D
 . S ACRMES(2)="WON'T PRINT TO DEPARTMENT PRINTER BECAUSE DEPARTMENT"
 . S ACRMES(3)="PRINTER IS THE SAME AS THE PURCHASING OFFICE PRINTER"
 I "^116^204^103^349^326^210^"[(U_ACRREF_U),ZTIO3'=ZTIO1 D
 . I ACRPOC=0 D
 . . S ACRMES(4)="PO PRINT CONTROL = 0:NO AUTO PRINT"
 . I ACRPOC,ACRPOC'[3 D
 . . S ACRMES(5)="PO PRINT CONTROL DOES NOT CONTAIN 3:DEPARTMENT"
 I '$G(ZTIO3) D
 . S ACRMES(6)="DEPARTMENT ACCOUNT PRINTER ID IS NULL"
 I '$D(ACRMES) D
 . S ACRMES(99)="SHOULD PRINT TO PRINTER "_$P($G(ZTIO3N),U,2)
 D MESS(.ACRMES)
 Q
LSET3 ;----- LOGIC SET #3
 ;      SEND TRAVEL ORDER TO ORIGINATING DEPARTMENT
 ;
 N ACRMES
 W !!?5,"LOGIC SET #3"
 W !?5,"SEND TRAVEL ORDER TO ORIGINATING DEPARTMENT"
 ;
 I "^130^148^"'[(U_ACRREF_U) D
 . S ACRMES(1)="NOT APPLICABLE - NOT A TRAVEL OR TRAINING ORDER"
 I ACRREF=130!(ACRREF=148) D
 . I ACRREF=130,ACRTOC=0 D
 . . S ACRMES(2)="TO PRINT CONTROL = 0:NO AUTO PRINT"
 . I ACRREF=130,ACRTOC,ACRTOC'[3 D
 . . S ACRMES(3)="TO PRINT CONTROL DOES NOT CONTAIN 3:DEPARTMENT"
 . I ACRREF=148,ACRTROC=0 D
 . . S ACRMES(4)="350 PRINT CONTROL = 0:NO AUTO PRINT"
 . I ACRREF=148,ACRTROC,ACRTROC'[3 D
 . . S ACRMES(5)="350 PRINT CONTROL DOES NOT CONTAIN 3:DEPARTMENT"
 I '$G(ZTIO3) D
 . S ACRMES(6)="DEPARTMENT ACCOUNT PRINTER ID FIELD IS NULL"
 I '$D(ACRMES) D
 . S ACRMES(99)="SHOULD PRINT TO PRINTER "_$P($G(ZTIO3N),U,2)
 D MESS(.ACRMES)
 Q
LSET4 ;----- LOGIC SET #4
 ;      SEND TRAVEL ORDER TO CENTRAL PRINTER
 ;
 N ACRMES
 W !!?5,"LOGIC SET #4"
 W !?5,"SEND TRAVEL ORDER TO CENTRAL PRINTER"
 ;
 I ACRREF'=130 D
 . S ACRMES(1)="NOT APPLICABLE - THIS IS NOT A TRAVEL ORDER"
 I '$G(ZTIO5) D
 . S ACRMES(2)="TRAVEL ORDER PRINTER IS NULL"
 I $G(ZTIO3)=$G(ZTIO5) D
 . S ACRMES(3)="DEPARTMENT PRINTER IS SAME AS TRAVEL ORDER PRINTER"
 I ACRREF=130,ZTIO5,ZTIO3'=ZTIO5 D
 .I ACRTOC=0 D
 . . S ACRMES(4)="TO PRINT CONTROL = 0:NO AUTO PRINT"
 .I ACRTOC,ACRTOC'[1 D
 . . S ACRMES(5)="TO PRINT CONTROL DOES NOT CONTAIN TRAVEL PRINTER"
 I '$D(ACRMES) D
 . S ACRMES(99)="SHOULD PRINT TO PRINTER "_$P($G(ZTIO5N),U,2)
 D MESS(.ACRMES)
 Q
LSET5 ;----- LOGIC SET #5
 ;      SEND TRAVEL ORDER TO FINANCE IF FINANCE PRINTER DIFFERENT FROM
 ;      DEPARTMENT OR CENTRAL PRINTER
 ;
 N ACRMES
 W !!?5,"LOGIC SET 5"
 W !?5,"SEND TRAVEL ORDER TO FINANCE IF FINANCE PRINTER DIFFERENT FROM"
 W !?5,"DEPARTMENT OR CENTRAL PRINTER"
 ;
 I "^130^148^"'[(U_ACRREF_U) D
 . S ACRMES(1)="NOT APPLICABLE - NOT A TRAVEL OR TRAINING ORDER"
 I ACRREF=130&(ZTIO2=ZTIO5) D
 . S ACRMES(2)="FINANCE OFFICE PRINTER IS SAME AS TRAVEL ORDER PRINTER"
 I ACRREF=148&(ZTIO2=ZTIO3) D
 . S ACRMES(3)="FINANCE OFFICE PRINTER IS SAME AS DEPARTMENT PRNITER"
 I ACRREF=130!(ACRREF=148),ZTIO2'=$S(ACRREF=130&+ZTIO5:ZTIO5,1:ZTIO3) D
 .I ACRREF=130,ACRTOC=0 D
 . . S ACRMES(4)="TO PRINT CONTROL = 0:NO AUTO PRINT"
 .I ACRREF=130,ACRTOC,ACRTOC'[2 D
 . . S ACRMES(5)="TO PRINT CONTROL DOES NOT CONTAIN FINANCE"
 .I ACRREF=148,ACRTROC=0 D
 . . S ACRMES(6)="350 PRINT CONTROL = 0:NO AUTO PRINT"
 .I ACRREF=148,ACRTROC,ACRTROC'[2 D
 . . S ACRMES(7)="350 PRINT CONTROL DOES NOT CONTAIN FINANCE"
 I '$G(ZTIO2) D
 . S ACRMES(8)="FINANCE OFFICE PRINTER IS NULL"
 I '$D(ACRMES) D
 . S ACRMES(99)="SHOULD PRINT TO PRINTER "_$P($G(ZTIO2N),U,2)
 D MESS(.ACRMES)
 Q
LSET6 ;----- LOGIC SET #6
 ;      SEND TRAVEL ORDER TO REGIONAL FINANCE OFF IF REGIONAL FINANCE
 ;      OFFICE PRINTER DIFFERENT FROM FINANCE OFFICE, DEPARTMENT OR
 ;      CENTRAL PRINTER
 ;
 N ACRMES
 W !!?5,"LOGIC SET 6"
 W !?5,"SEND TRAVEL ORDER TO REGIONAL FINANCE OFF IF REGIONAL FINANCE"
 W !?5,"OFFICE PRINTER DIFFERENT FROM FINANCE OFFICE, DEPARTMENT OR"
 W !?5,"CENTRAL PRINTER"
 ;
 I "^130^148^"'[(U_ACRREF_U) D
 . S ACRMES(1)="NOT APPLICABLE - NOT A TRAVEL OR TRAINING ORDER"
 I $G(ZTIO7)']"" D
 . S ACRMES(2)="REGIONAL FINANCE OFFICE PRINTER IS NULL"
 I $G(ZTIO7)=$G(ZTIO2) D
 . S ACRMES(3)="REGIONAL FINANCE OFFICE PRINTER IS SAME AS FINANCE OFFICE PRINTER"
 I ACRREF=130&($G(ZTIO5))&($G(ZTIO7)=$G(ZTIO5)) D
 . S ACRMES(4)="REGIONAL FINANCE OFFICE PRINTER IS SAME AS TRAVEL ORDER PRINTER" 
 I ACRREF=130&('$G(ZTIO5))&($G(ZTIO7)=$G(ZTIO3)) D
 . S ACRMES(5)="REGIONAL FINANCE OFFICE PRINTER IS SAME AS DEPARTMENT PRINTER"
 I ACRREF=130!(ACRREF=148),ZTIO7]"",ZTIO7'=ZTIO2,ZTIO7'=$S(ACRREF=130&+ZTIO5:ZTIO5,1:ZTIO3) D
 .I ACRREF=130,ACRTOC=0 D
 . . S ACRMES(6)="TRAVEL ORDER PRINT CONTROL = 0:NO AUTO PRINT"
 .I ACRREF=130,ACRTOC,ACRTOC'[2 D
 . . S ACRMES(7)="TRAVEL ORDER PRINT CONTROL DOES NOT CONTAIN FINANCE"
 .I ACRREF=148,ACRTROC=0 D
 . . S ACRMES(8)="350 PRINT CONTROL = 0:NO AUTO PRINT"
 .I ACRREF=148,ACRTROC,ACRTROC'[2 D
 . . S ACRMES(9)="350 PRINT CONTROL DOES NOT CONTAIN FINANCE"
 I '$D(ACRMES) D
 . S ACRMES(99)="SHOULD PRINT TO PRINTER "_$P($G(ZTIO7N),U,2)
 D MESS(.ACRMES)
 Q
LSET7 ;----- LOGIC SET #7
 ;      SEND PURCHASE ORDER AND TRAVEL VOUCHER TO FINANCE
 ;
 N ACRMES
 W !!?5,"LOGIC SET 7"
 W !?5,"SEND PURCHASE ORDER AND TRAVEL VOUCHER TO FINANCE"
 ;
 I ACRREF=116&$P(^ACRDOC(ACRDOCDA,0),U,19) D
 . S ACRMES(1)="NOT APPLICABLE - THIS IS A BLANKET PURCHASE ORDER"
 I "^103^349^326^210^600^"'[(U_ACRREF_U) D
 . S ACRMES(2)="NOT APPLICABLE - NOT A PURCHASE ORDER OR TRAVEL VOUCHER"
 I "^103^349^326^210^600^"[(U_ACRREF_U)!(ACRREF=116&$P(^ACRDOC(ACRDOCDA,0),U,19)) D
 .I ACRPOC=0 D
 . . S ACRMES(3)="PURCHASE ORDER PRINT CONTROL = 0:NO AUTO PRINT"
 .I "^103^349^326^210^"[(U_ACRREF_U),ACRPOC,ACRPOC'[2 D
 . . S ACRMES(4)="PURCHASE ORDER PRINT CONTROL DOES NOT CONTAIN FINANCE"
 I '$G(ZTIO2) D
 . S ACRMES(5)="FINANCE OFFICE PRINTER IS NULL"
 I '$D(ACRMES) D
 . S ACRMES(99)="SHOULD PRINT TO PRINTER "_$P($G(ZTIO2N),U,2)
 D MESS(.ACRMES)
 Q
LSET8 ;----- LOGIC SET #8
 ;      SEND REQUISITION TO FINANCE IF INDICATED FOR THE PURCHASING
 ;      OFFICE
 ;
 N ACRMES
 W !!?5,"LOGIC SET 8"
 W !?5,"SEND REQUISITION TO FINANCE IF INDICATED FOR THE PURCHASING OFFICE"
 ;
 I ACRREF'=116 D
 . S ACRMES(1)="NOT APPLICABLE - NOT A REQUISITION"
 I ACRREF=116,'$P(^ACRPO(ACRPODA,"DT"),U,9) D
 . S ACRMES(2)="PURCHASING OFFICE PARAMETER 'PRINT REQ IN FINANCE' = 'NO'"
 I '$G(ZTIO2) D
 . S ACRMES(3)="FINANCE OFFICE PRINTER IS NULL"
 I '$D(ACRMES) D
 . S ACRMES(99)="SHOULD PRINT TO PRINTER "_$P($G(ZTIO2N),U,2)
 D MESS(.ACRMES)
 ;
LSET9 ;----- LOGIC SET #9
 ;      SEND PURCHASE ORDER AND TRAVEL VOUCHER TO REGIONAL FINANCE
 ;      OFFICE
 ;
 N ACRMES
 W !!?5,"LOGIC SET 9"
 W !?5,"SEND PURCHASE ORDER AND TRAVEL VOUCHER TO REGIONAL FINANCE OFFICE"
 ;
 I "^103^349^329^210^600^"'[(U_ACRREF_U)!'(ACRREF=116&($P(^ACRDOC(ACRDOCDA,0),U,19))) D
 . S ACRMES(1)="NOT APPLICABLE - NOT A PURCHASE ORDER, TRAVEL VOUCHER OR BPA"
 I $G(ZTIO7)']"" D
 . S ACRMES(2)="REGIONAL FINANCE OFFICE PRINTER IS NULL"
 I $G(ZTIO7)=$G(ZTIO2) D
 . S ACRMES(3)="REGIONAL FINANCE OFFICE PRINTER IS SAME AS FINANCE OFFICE PRINTER"
 I '$D(ACRMES) D
 . S ACRMES(99)="SHOULD PRINT TO PRINTER "_$P($G(ZTIO7N),U,2)
 D MESS(.ACRMES)
 Q
 ;
LSET10 ;----- LOGIC SET #10
 ;      SEND THE TRAVEL VOUCHER TO DEPARTMENT
 ;
 N ACRMES
 W !!?5,"LOGIC SET 10"
 W !?5,"SEND TRAVEL VOUCHER TO DEPARTMENT"
 ;
 I ACRREF='600 D
 . S ACRMES(1)="NO APPLICABLE - NOT A TRAVEL VOUCHER"
 I '$G(ZTIO3) D
 . S ACRMES(2)="DEPARTMENT PRINTER IS NULL"
 I '$D(ACRMES) D
 . S ACRMES(99)="SHOULD PRINT TO PRINTER "_$P($G(ZTIO3N),U,2)
 D MESS(.ACRMES)
 Q
LSET11 ;----- LOGIC SET #11
 ;      SEND REQUISITIONS AND PO'S TO AREA PROPERTY IF PRINTER
 ;      DIFFERENT FROM PROCUREMENT OFFICE PRINTER AND PROPERTY ITEMS
 ;      PURCHASED
 ;
 N ACRMES
 W !!?5,"LOGIC SET 11"
 W !?5,"SEND REQUISITIONS AND PO'S TO AREA PROPERTY IF PRINTER"
 W !?5,"DIFFERENT FROM PROCUREMENT OFFICE PRINTER AND PROPERTY ITEMS"
 W !?5,"PURCHASED"
 ;
 I "^116^204^103^349^326^210^"'[(U_ACRREF_U) D
 . S ACRMES(1)="NOT APPLICABLE - NOT A REQUISITION OR PURCHASE ORDER"
 I '$G(ZTIO6) D
 . S ACRMES(2)="AREA PROPERTY PRINTER IS NULL"
 I $G(ZTIO6)=$G(ZTIO1) D
 . S ACRMES(3)="AREA PROPERTY PRINTER IS SAME AS PURCHASING OFFICE PRINTER"
 I "^116^204^103^349^326^210^"[(U_ACRREF_U) D
 . S ZTIO=ZTIO6
 . D PROP
 . I '$D(ACRQUIT) D
 . . S ACRMES(4)="NOT EQUIPMENT OR REPAIR ORDER"
 I '$D(ACRMES) D
 . S ACRMES(99)="SHOULD PRINT ON PRINTER "_$P($G(ZTIO6N),U,2)
 D MESS(.ACRMES)
 Q
LSET12 ;----- LOGIC SET #12
 ;      SEND REQUISITIONS AND PO'S TO AREA SUPPLY IF PRINTER
 ;      DIFFERENT FROM PROCUREMENT OFFICE PRINTER AND SUPPLY ITEMS
 ;      PURCHASED
 ;
 N ACRMES
 W !!?5,"LOGIC SET 12"
 W !?5,"SEND REQUISITIONS AND PO'S TO AREA SUPPLY IF PRINTER"
 W !?5,"DIFFERENT FROM PROCUREMENT OFFICE PRINTER & SUPPLY ITEMS"
 W !?5,"PURCHASED"
 ;
 I "^116^204^103^349^326^210^"'[(U_ACRREF_U) D
 . S ACRMES(1)="NOT APPLICABLE - NOT A REQUISITION OR PURCHASE ORDER"
 I '$G(ZTIO8) D
 . S ACRMES(2)="SUPPLY OFFICE PRINTER IS NULL"
 I $G(ZTIO8)=$G(ZTIO1) D
 . S ACRMES(3)="SUPPLY OFFICE PRINTER IS SAME AS PURCHASING OFFICE PRINTER"
 I "^116^204^103^349^326^210^"[(U_ACRREF_U),ZTIO8,ZTIO8'=ZTIO1 D
 .S ZTIO=ZTIO8
 .D SUPP
 . I '$D(ACRQUIT) D
 . . S ACRMES(4)="NOT SUPPLIES OR MATERIALS ORDER"
 I '$D(ACRMES) D
 . S ACRMES(99)="SHOULD PRINT ON PRINTER "_$P($G(ZTIO8N),U,2)
 D MESS(.ACRMES)
 Q
LSET13 ;----- LOGIC SET #13
 ;      SEND TRAINING REQUEST TO AREA PERSONNEL PRINTER
 ;      DIFFERENT FROM PROCUREMENT OFFICE PRINTER
 ;
 N ACRMES
 W !!?5,"LOGIC SET 13"
 W !?5,"SEND TRAINING REQUEST TO AREA PERSONNEL PRINTER IF DIFFERENT"
 W !?5,"FROM PROCUREMENT OFFICE PRINTER"
 ;
 I ACRREF'=148 D
 . S ACRMES(1)="NOT APPLICABLE - NOT A TRAINING REQUEST"
 I '$G(ZTIO9) D
 . S ACRMES(2)="PERSONNEL OFFICE PRINTER IS NULL"
 I $G(ZTIO9)=$G(ZTIO1) D
 . S ACRMES(3)="PESONNEL OFFICE PRINTER IS SAME AS PURCHASING OFFICE PRINTER"
 I ACRREF=148,ZTIO9,ZTIO9'=ZTIO1 D
 .I ACRREF=148,ACRTROC=0 D
 . . S ACRMES(4)="350 PRINT CONTROL = 0:NO AUTO PRINT"
 .I ACRREF=148,ACRTROC,ACRTROC'[1 D
 . . S ACRMES(5)="350 PRINT CONTROL DOES NOT CONTAIN PERSONNEL"
 I '$D(ACRMES) D
 . S ACRMES(99)="SHOULD PRINT ON PRINTER "_$P($G(ZTIO9N),U,2)
 D MESS(.ACRMES)
 Q
PROP ;PRINT TO AREA PROPERTY
 Q
 K ACRQUIT
 D PROP^ACRFRRPT
 ;I $D(ACRQUIT),ZTIO]"" D SEND
 K ACRQUIT
 Q
SUPP ;EP;TO PRINT REPORT TO SUPPLY OFFICE PRINTER
 Q
 K ACRQUIT
 N ACRSSDA
 S ACRSSDA=0
 F  S ACRSSDA=$O(^ACRSS("J",ACRDOCDA,ACRSSDA)) Q:'ACRSSDA!$D(ACRQUIT)  I $D(^ACRSS(ACRSSDA,0)) S ACROBJDA=$P(^(0),U,4) I ACROBJDA,$D(^AUTTOBJC(ACROBJDA,0)),$E(^(0),1,2)="26" S ACRQUIT="" Q
 Q
MESS(ACRMES)       ;
 ;----- PRINT MESSAGES
 ;
 N ACR
 S ACR=0
 F  S ACR=$O(ACRMES(ACR)) Q:'ACR  D
 . W !?8,ACRMES(ACR)
 Q
ARRAYS ;----- SET TO AND PO PRINT CONTROL ARRAYS
 ;
 S ACRTOC(0)="NO AUTO PRINT"
 S ACRTOC(1)="TRAVEL PRINTER ONLY"
 S ACRTOC(2)="FINANCE ONLY"
 S ACRTOC(3)="DEPARTMENT ONLY"
 S ACRTOC(12)="TRAVEL PRINTER & FINANCE"
 S ACRTOC(13)="TRAVEL PRINTER & DEPARTMENT"
 S ACRTOC(23)="FINANCE & DEPARTMENT"
 S ACRTOC(123)="TRAVEL PRINTER, FINANCE & DEPARTMENT"
 S ACRPOC(0)="NO AUTO PRINT"
 S ACRPOC(1)="PURCHASING ONLY"
 S ACRPOC(2)="FINANCE ONLY"
 S ACRPOC(3)="DEPARTMENT ONLY"
 S ACRPOC(12)="PURCHASING & FINANCE"
 S ACRPOC(13)="PURCHASING & DEPARTMENT"
 S ACRPOC(23)="FINANCE & DEPARTMENT"
 S ACRPOC(123)="PURCHASING, FINANCE, & DEPARTMENT"
 Q
