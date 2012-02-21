BPSNCPD3 ;BHAM ISC/LJE - Continuation of BPSNCPDP - DUR HANDLING ;06/16/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;Reference to ^PSRX supported by DBIA 1977
 ;
 ; Phase IV comments
 ;   DUR handled by PSO, not in here.
 ;   DDUR, DDUR2, DUR, and REJ should probably be removed in Phase IV
 ;   DUR1 is called by PSO to get the reject info so that should NOT be removed
 ;
 ; DDUR - Display DUR information
 ; There were two calls to this from BPSNCPDP but they are commented out
 ; There are no other references to this in BPS so I do not think it is used
 ; Variables RESPONSE, CLMSTAT, and DURCALL are expected by BPSNCPDP, if the
 ;   calls were not commented out and they are newed by BPSNCPD
DDUR ; 
 N PNAME,DFILL,DURIEN,DURINFO,ERROR,COUNT,I,J,PREVFILL,CONT,DURRESP
 S PNAME=""
 I $G(DFN) S PNAME=$P(^DPT(DFN,0),"^",1)
 W !!,"For "_PNAME_", prescription # "_$P(^PSRX(BRXIEN,0),"^",1)_" and fill # "_BFILL_":"
 W !!,"The 3rd Party Insurance Payer has reported a Drug Interaction or other problem,",!,"and the Drug Use Review (DUR) information is: ",!
 S DFILL="",DFILL=$E($TR($J("",4-$L(BFILL))," ","0")_BFILL,1,4)_1
 S DURIEN="",DURIEN=$P(^BPST(BRXIEN_"."_DFILL,0),"^",5)
 D GETS^DIQ(9002313.0301,"1,"_DURIEN_",","567.01*","E","DURINFO","ERROR")
 I $D(ERROR("DIERR")) W !!,"An error has occurred while retrieving the response information.  Probably DUR occurred.  See ECME."
 S COUNT=1,(I,J)="" F  S I=$O(DURINFO(9002313.1101,I)) Q:I=""  D
 . W:COUNT'=1 !!,"# "_COUNT_" DUR Response:"
 . F  S J=$O(DURINFO(9002313.1101,I,J)) Q:J=""  D
 . . I J=439,$D(DURINFO(9002313.1101,I,J,"E")) W:DURINFO(9002313.1101,I,J,"E")'="" !,"Reason for Service Code: ",DURINFO(9002313.1101,I,J,"E") Q
 . . I J=528,$D(DURINFO(9002313.1101,I,J,"E")) W:DURINFO(9002313.1101,I,J,"E")'="" !,"Clinical Significance: ",DURINFO(9002313.1101,I,J,"E") Q
 . . I J=529,$D(DURINFO(9002313.1101,I,J,"E")) W:DURINFO(9002313.1101,I,J,"E")'="" !,"Other Pharmacy Indicator: ",DURINFO(9002313.1101,I,J,"E") Q
 . . I J=530,$D(DURINFO(9002313.1101,I,J,"E")) D  Q
 . . . S PREVFILL="",PREVFILL=$E(DURINFO(9002313.1101,I,J,"E"),5,6)_"/"_$E(DURINFO(9002313.1101,I,J,"E"),7,8)_"/"_$E(DURINFO(9002313.1101,I,J,"E"),1,4)
 . . . W:DURINFO(9002313.1101,I,J,"E")'="" !,"Previous Date of Fill: ",PREVFILL
 . . I J=531,$D(DURINFO(9002313.1101,I,J,"E")) W:DURINFO(9002313.1101,I,J,"E")'="" !,"Quantity of Previous Fill: ",DURINFO(9002313.1101,I,J,"E") Q
 . . I J=532,$D(DURINFO(9002313.1101,I,J,"E")) W:DURINFO(9002313.1101,I,J,"E")'="" !,"Database Indicator: ",DURINFO(9002313.1101,I,J,"E") Q
 . . I J=533,$D(DURINFO(9002313.1101,I,J,"E")) W:DURINFO(9002313.1101,I,J,"E")'="" !,"Other Prescriber Indicator: ",DURINFO(9002313.1101,I,J,"E") Q
 . . I J=544,$D(DURINFO(9002313.1101,I,J,"E")) W:DURINFO(9002313.1101,I,J,"E")'="" !,"DUR Free Text Information: ",DURINFO(9002313.1101,I,J,"E") Q
 . S COUNT=COUNT+1,CONT="" R !,"Enter to continue . . . ",CONT:180
 . D REJ
 ;
DDUR2 ;
 S CONT="" R !,"Do you wish to fill the prescription anyway?  ",CONT:120
 I CONT'="Y"&(CONT'="N") W !,"You must enter Y for Yes or N for No." G DDUR2
 ;here is where an xref or something needs to be set until the DUR is resolved, then send user back to enter/edit RX.
 I CONT="N" S RESPONSE=4,CLMSTAT=CLMSTAT_"  Pharmacist elected to not fill Prescription based on DUR." Q
 E  D  S DURCALL=0
 . S DURRESP="",DURRESP=$$DURBRIEF^BPSOS6G(BRXIEN_"."_DFILL)
 .S RESPONSE=5,DURCALL=1,CLMSTAT=CLMSTAT_" Pharmacist "_DUZ_" chose to override the DUR from payer and fill prescription. (DUR: "_DURRESP_")"
 Q
 ;
 ; DUR - Here is where an xref or something needs to be set until the DUR is resolved, then send user back to enter/edit RX.
 ;   This is done by PSO. 
DUR ; 
 ;
 Q
 ;
 ; REJ - Display Reject information
 ; Input:
 ;   DURIEN - It is assumed that this will be defined.  It is set in BPSNCPDP.
 ; Output:
 ;   Data will be displayed to the user screen
 ;   
REJ ;
 N REJARY,ERR,ADDINFO,MADDINFO,CONT
 D GETS^DIQ(9002313.03511,"1,1,"_DURIEN_",","*","","REJARY","ERR")
 S ADDINFO="",ADDINFO=$$GET1^DIQ(9002313.0301,"1,"_DURIEN_",","526")
 S MADDINFO=$$GET1^DIQ(9002313.03,DURIEN_",","504")
 I $D(REJARY) W !!,"Claim Rejected by the Payer for the following reason(s):",! D
 .W !,"Reject code: ",REJARY(9002313.03511,"1,1,"_DURIEN_",",.01)
 .W !,"Reject Fld Occurrence Indicator: ",REJARY(9002313.03511,"1,1,"_DURIEN_",",546)
 .W !,"Additional Information:"
 E  W !!,"Payer additional information: ",!
 W !,MADDINFO
 W:$E(ADDINFO,1,77)'="" !?3,$E(ADDINFO,1,77) W:$E(ADDINFO,78,157)'="" !?3,$E(ADDINFO,78,157),!
 W:$E(ADDINFO,158,237)'="" !?3,$E(ADDINFO,158,237) W:$E(ADDINFO,238,256)'="" !?3,$E(ADDINFO,238,256),!!
 R !!,"Enter to continue . . . ",CONT:180
 Q
 ;
 ; Function call for DUR INFORMATION 
 ; Parameters: BRXIEN = Prescription IEN
 ;             BFILL = fill number
 ;             DUR = DUR info passed back
 ;             ERROR = error passed back
 ; Note:
 ;    DUR("BILLED")=0 if ecme off for pharmacy or no transaction in ECME
 ;    DUR(<Insurance counter>,"BILLED")=1 if billed through ecme
DUR1(BRXIEN,BFILL,DUR,ERROR) ;
 N SITE,DFILL,TRANIEN,JJ,DUR1,DURIEN,I
 ;
 ; Get Site info and check is ECME is turned on
 ; If not, set DUR("BILLED")=0 and quit
 I '$G(BFILL) S SITE=$$GET1^DIQ(52,BRXIEN,20,"I")
 I $G(BFILL) S SITE=$$GET1^DIQ(52.1,BFILL_","_BRXIEN,8,"I")
 I '$$ECMEON^BPSUTIL(SITE) S DUR("BILLED")=0 Q
 ;
 ; Set up the Transaction IEN
 S DFILL="",DFILL=$E($TR($J("",4-$L(BFILL))," ","0")_BFILL,1,4)_1
 S TRANIEN=BRXIEN_"."_DFILL
 ;
 ; If the transaction record does not exist, set DUR("BILLED")=0 and quit
 I '$D(^BPST(TRANIEN)) S DUR("BILLED")=0 Q
 ;
 ; Loop through the insurance multiple and set DUR array
 S JJ=0
 F  S JJ=$O(^BPST(TRANIEN,10,JJ)) Q:JJ=""!(JJ'?1N.N)  D
 . ;
 . ; We are good so set Billed
 . S DUR(JJ,"BILLED")=1
 . ;
 . ; Get Insurance Info and set into DUR array
 . D GETS^DIQ(9002313.59902,JJ_","_TRANIEN_",","902.05;902.06;902.24;902.25;902.26","E","DUR1","ERROR")
 . S DUR(JJ,"INSURANCE NAME")=$G(DUR1(9002313.59902,JJ_","_TRANIEN_",",902.24,"E"))  ; Insurance Company Name
 . S DUR(JJ,"GROUP NUMBER")=$G(DUR1(9002313.59902,JJ_","_TRANIEN_",",902.05,"E"))    ; Insurance Group Number
 . S DUR(JJ,"GROUP NAME")=$G(DUR1(9002313.59902,JJ_","_TRANIEN_",",902.25,"E"))      ; Insurance Group Name
 . S DUR(JJ,"PLAN CONTACT")=$G(DUR1(9002313.59902,JJ_","_TRANIEN_",",902.26,"E"))    ; Insurance Contact Number
 . S DUR(JJ,"CARDHOLDER ID")=$G(DUR1(9002313.59902,JJ_","_TRANIEN_",",902.06,"E"))   ; Cardholder ID
 . ;
 . ; Get Response IEN and Data
 . S DURIEN="",DURIEN=$P(^BPST(TRANIEN,0),"^",5)                             ;Note: in future will need to store/get DURIEN for each insurance
 . S DUR(JJ,"RESPONSE IEN")=DURIEN
 . D GETS^DIQ(9002313.0301,"1,"_DURIEN_",","501;567.01*;526","E","DUR1","ERROR")
 . S DUR(JJ,"PAYER MESSAGE")=$G(DUR1(9002313.0301,"1,"_DURIEN_",",526,"E"))           ;Additional free text message info from payer
 . S DUR(JJ,"STATUS")=$G(DUR1(9002313.0301,"1,"_DURIEN_",",501,"E"))                  ;Status of Response
 . S DUR(JJ,"REASON")=$G(DUR1(9002313.1101,"1,1,"_DURIEN_",",439,"E"))                ;Reason of Service Code
 . S DUR(JJ,"CLIN SIGNIFICANCE")=$G(DUR1(9002313.1101,"1,1,"_DURIEN_",",528,"E"))     ;Clinical Significance Code
 . S DUR(JJ,"OTH PHARM IND")=$G(DUR1(9002313.1101,"1,1,"_DURIEN_",",529,"E"))         ;Other Pharmacy Indicator Code
 . S DUR(JJ,"PREV FILL DATE")=$G(DUR1(9002313.1101,"1,1,"_DURIEN_",",530,"E"))        ;Previous Date of Fill
 . S DUR(JJ,"QTY OF PREV FILL")=$G(DUR1(9002313.1101,"1,1,"_DURIEN_",",531,"E"))      ;Quantity of Previous Fill
 . S DUR(JJ,"DATABASE IND")=$G(DUR1(9002313.1101,"1,1,"_DURIEN_",",532,"E"))          ;Database Indicator
 . S DUR(JJ,"OTH PRESCRIBER IND")=$G(DUR1(9002313.1101,"1,1,"_DURIEN_",",533,"E"))    ;Other Prescriber Indicator
 . S DUR(JJ,"DUR FREE TEXT DESC")=$G(DUR1(9002313.1101,"1,1,"_DURIEN_",",544,"E"))    ;DUR Free Text Message from Payer
 . ;
 . ; Get DUR reject codes and description and store in DUR 
 . D GETS^DIQ(9002313.0301,"1,"_DURIEN_",","511*","I","DUR1","ERROR")                 ;get DUR codes and descriptions
 . S DUR(JJ,"REJ CODE LST")=""
 . F I=1:1 Q:'$D(DUR1(9002313.03511,I_",1,"_DURIEN_","))  D
 .. S DUR(JJ,"REJ CODES",I,DUR1(9002313.03511,I_",1,"_DURIEN_",",.01,"I"))=$$GET1^DIQ(9002313.93,DUR1(9002313.03511,I_",1,"_DURIEN_",",.01,"I"),".02")
 .. S DUR(JJ,"REJ CODE LST")=DUR(JJ,"REJ CODE LST")_","_DUR1(9002313.03511,I_",1,"_DURIEN_",",.01,"I")
 . S DUR(JJ,"REJ CODE LST")=$E(DUR(JJ,"REJ CODE LST"),2,9999)
 Q
