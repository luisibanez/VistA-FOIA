PSOREJU2 ;BIRM/MFR - BPS (ECME) - Clinical Rejects Utilites (1) ;10/15/04
 ;;7.0;OUTPATIENT PHARMACY;**148**;DEC 1997
 ;Reference to $$NABP^BPSUTL supported by DBIA 4410
 ;Reference to File 9002313.23 - BPS NCPDP REASON FOR SERVICE CODE supported by DBIA 4714
 ;
GET(RX,RFL,REJDATA,REJID,OKCL,CODE) ;
 ; Input:  (r) RX  - Rx IEN (#52) 
 ;         (o) RFL - Refill # (Default: most recent)
 ;         (r) REJDATA(REJECT IEN,FIELD) - Array where these Reject fields will be returned:
 ;                       "CODE" - Reject Code (79 or 88)
 ;                       "DATE/TIME" - DATE/TIME Reject was detected
 ;                       "PAYER MESSAGE" - Message returned by the payer
 ;                       "REASON" - Reject Reason description (from payer)
 ;                       "INSURANCE NAME" - Patient's Insurance Company Name
 ;                       "GROUP NAME" - Patient's Insurance Group Name
 ;                       "GROUP NUMBER" - Patient's Insurance Group Number
 ;                       "CARDHOLDER ID" - Patient's Insurance Cardholder ID
 ;                       "PLAN CONTACT" - Plan's Contact (eg., "1-800-...")
 ;                       "PLAN PREVIOUS FILL DATE" - Last time Rx was paid by payer
 ;                       "STATUS" - REJECTS status ("OPEN/UNRESOLVED" or "CLOSED/RESOLVED")
 ;                       "DUR TEXT" - Payer's DUR description
 ;                       "OTHER REJECTS" - Other Rejects on the same response
 ;                       "REASON SVC CODE" - Reason for Service Code
 ;                  If REJECT is closed, the following fields will be returned:
 ;                       "CLOSED DATE/TIME" - DATE/TIME Reject was closed
 ;                       "CLOSED BY" - Name of the user responsible for closing Reject
 ;                       "CLOSE REASON" - Reason for closing Reject (text)
 ;                       "CLOSE COMMENTS" - User entered comments
 ;         (o) REJID - REJECT IEN in the PRESCRIPTION file for retrieve this REJECT
 ;         (o) OKCL - If set to 1, CLOSED REJECTs will also be returned
 ;         (o) CODE - Only REJECTs with this CODE should be returned
 ;
 N REJS,ARRAY,REJFLD,IDX
 ;
 I '$D(RFL) S RFL=$$LSTRFL^PSOBPSU1(RX)
 ;
 K REJDATA
 I '$O(^PSRX(RX,"REJ",0)) Q
 ;
 K REJS S RFL=+$G(RFL)
 I $G(REJID) D
 . I +$P($G(^PSRX(RX,"REJ",REJID,0)),"^",4)'=RFL Q
 . I '$G(OKCL),$P($G(^PSRX(RX,"REJ",REJID,0)),"^",5) Q
 . S REJS(REJID)=""
 E  D
 . S IDX=999
 . F  S IDX=$O(^PSRX(RX,"REJ",IDX),-1) Q:'IDX  D
 . . I +$P($G(^PSRX(RX,"REJ",IDX,0)),"^",4)'=RFL Q
 . . I '$G(OKCL),$P($G(^PSRX(RX,"REJ",IDX,0)),"^",5) Q
 . . S REJS(IDX)=""
 I '$D(REJS) Q
 ;
 S IDX=0
 F  S IDX=$O(REJS(IDX)) Q:'IDX  D
 . K ARRAY D GETS^DIQ(52.25,IDX_","_RX_",","*","","ARRAY")
 . K REJFLD M REJFLD=ARRAY(52.25,IDX_","_RX_",")
 . I $G(CODE),REJFLD(.01)'=CODE Q
 . S REJDATA(IDX,"CODE")=$G(REJFLD(.01))
 . S REJDATA(IDX,"DATE/TIME")=$G(REJFLD(1))
 . S REJDATA(IDX,"PAYER MESSAGE")=$G(REJFLD(2))
 . S REJDATA(IDX,"REASON")=$G(REJFLD(3))
 . S REJDATA(IDX,"PHARMACIST")=$G(REJFLD(4))
 . S REJDATA(IDX,"INSURANCE NAME")=$G(REJFLD(20))
 . S REJDATA(IDX,"GROUP NAME")=$G(REJFLD(6))
 . S REJDATA(IDX,"GROUP NUMBER")=$G(REJFLD(21))
 . S REJDATA(IDX,"CARDHOLDER ID")=$G(REJFLD(22))
 . S REJDATA(IDX,"PLAN CONTACT")=$G(REJFLD(7))
 . S REJDATA(IDX,"PLAN PREVIOUS FILL DATE")=$G(REJFLD(8))
 . S REJDATA(IDX,"STATUS")=$G(REJFLD(9))
 . S REJDATA(IDX,"OTHER REJECTS")=$G(REJFLD(17))
 . S REJDATA(IDX,"DUR TEXT")=$G(REJFLD(18))
 . S REJDATA(IDX,"REASON SVC CODE")=$G(REJFLD(14))
 . S REJDATA(IDX,"RESPONSE IEN")=$G(REJFLD(16))
 . I '$G(OKCL) Q
 . S REJDATA(IDX,"CLOSED DATE/TIME")=$G(REJFLD(10))
 . S REJDATA(IDX,"CLOSED BY")=$G(REJFLD(11))
 . S REJDATA(IDX,"CLOSE REASON")=$G(REJFLD(12))
 . S REJDATA(IDX,"CLOSE COMMENTS")=$G(REJFLD(13))
 . S REJDATA(IDX,"COD1")=$G(REJFLD(14))
 . S REJDATA(IDX,"COD2")=$G(REJFLD(15))
 . S REJDATA(IDX,"COD3")=$G(REJFLD(19))
 Q
 ;
HELP(OPTS) ; Display the Help Text for the DUR handling options (OVERRIDE/IGNORE/STOP/QUIT)
 ;
 I OPTS["O" D
 . W !?1,"(O)verride - This option will provide the prompts for the code sets needed to"
 . W !?1,"             override this reject and get a payable 3rd party claim. Before"
 . W !?1,"             you select this option, you may need to call the 3rd party payer"
 . W !?1,"             to determine which code sets are needed to override a particular"
 . W !?1,"             reject. Once the proper override is accepted the label will print"
 . W !?1,"             and the prescription can be filled."
 ;
 I OPTS["I" D
 . W !?1,"(I)gnore   - Choosing Ignore will by-pass 3rd party processing and will allow"
 . W !?1,"             you to print a label and fill the prescription. This essentially"
 . W !?1,"             ignores the clinical safety issues suggested by the 3rd party"
 . W !?1,"             payer and will NOT result in a payable claim."
 ;           
 I OPTS["Q" D
 . W !?1,"(Q)uit     - Choosing Quit will postpone the processing of this prescription"
 . W !?1,"             until this 3rd party reject is resolved. A label will not be"
 . W !?1,"             printed for this prescription and it can not be filled/dispensed"
 . W !?1,"             until this reject is resolved. Rejects can be resolved through"
 . W !?1,"             the Worklist option under the ePharmacy menu."
 ;
 Q
 ;
DVINFO(RX,RFL,LM) ; Returns header displayable Division Information
 ;Input: (r) RX   - Rx IEN (#52)
 ;       (o) RFL  - Refill # (Default: most recent)
 ;       (o) LM   - ListManager format? (1 - Yes / 0 - No) - Default: 0
 N TXT,DVINFO
 S DVINFO="Division : "_$$GET1^DIQ(59,+$$RXSITE^PSOBPSUT(RX,RFL),.01)
 S $E(DVINFO,$S($G(LM):58,1:51))="NCPDP#: "_+$$NABP^BPSBUTL(RX,RFL)
 Q DVINFO
 ;
PTINFO(RX,LM) ; Returns header displayable Patient Information
 ;Input: (r) RX   - Rx IEN (#52)
 ;       (o) LM   - ListManager format? (1 - Yes / 0 - No) - Default: 0
 N DFN,VADM,PTINFO
 S DFN=$$GET1^DIQ(52,RX,2,"I") D DEM^VADPT
 S PTINFO="Patient  : "_$E($G(VADM(1)),1,$S($G(LM):24,1:20))_"("_$P($G(VADM(2)),"^",2)_")"
 S PTINFO=PTINFO_"  Sex: "_$P($G(VADM(5)),"^")
 S $E(PTINFO,$S($G(LM):61,1:54))="DOB: "_$P($G(VADM(3)),"^",2)_"("_$P($G(VADM(4)),"^")_")"
 Q PTINFO
 ;
RETRXF(RX,RFL,ONOFF) ; - Set/Reset the Re-transmission flag
 ;Input: (r) RX    - Rx IEN (#52)
 ;       (r) RFL   - Refill IEN (#52.1)
 ;       (o) ONOFF - Turn flag ON or OFF (1 - ON / 0 - OFF) (Default: OFF) 
 N DA,DIE,DR
 S DR="82///"_$S($G(ONOFF):"YES",1:"@")
 I 'RFL S DA=RX,DIE="^PSRX("
 I RFL S DA(1)=RX,DA=RFL,DIE="^PSRX("_RX_",1,"
 D ^DIE
 Q
 ;
REASON(TXT) ; Extracts the Reason for service code from the REASON text field
 ; Input: (r) TXT  - Reason text (e.g., NN Reason for Service Code Text)
 ;Output:   REASON - NN (if on valid and on file (#9002313.23), null otherwise)
 N REASEON,DIC,X,Y
 S REASON=$P(TXT," ") I $L(REASON)'=2 Q ""
 S DIC=9002313.23,X=REASON D ^DIC I Y<0 Q ""
 Q REASON
 ;
SETOPN(RX,REJ) ; - Set the Reject RE-OPENED flag to YES
 ;Input: (r) RX    - Rx IEN (#52)
 ;       (r) REJ   - Reject IEN (#52.25)
 ;       
 I '$D(^PSRX(RX,"REJ",REJ)) Q
 N DIE,DA,DR
 S DIE="^PSRX("_RX_",""REJ"",",DA(1)=RX,DA=REJ,DR="23///YES" D ^DIE
 Q
 ;
PRT(FIELD,P,L) ; Sets the lines for fields that require text wrapping
 ;Input: FIELD - Subscript name from the DATA(REJ,FIELD) array
 ;         P   - Position where the content should be printed
 ;         L   - Lenght of the text on each line
 N TXT
 S TXT=DATA(REJ,FIELD) I $L(TXT)'>L W ?P,TXT Q
 F I=1:1 Q:TXT=""  D
 . I I=1 W ?P,$E(TXT,1,L),! S TXT=$E(TXT,L+1,999) Q
 . W ?P,$E(TXT,1,L) S TXT=$E(TXT,L+1,999) W:TXT'="" !
 Q
 ;
CLSALL(RX,RFL,REA,COM,USR) ; Close/Resolve All Rejects
 ;Input: (r) RX   - Rx IEN (#52)
 ;       (o) RFL  - Refill # (Default: most recent)
 ;       (r) REA  - Close REASON code
 ;       (o) COM  - Close COMMENTS
 ;       (o) USR  - User DUZ responsible for closing all rejects
 N REJ,REJDATA,DIE,DR,DA
 I '$D(RFL) S RFL=$$LSTRFL^PSOBPSU1(RX)
 ;
 ; - Closing OPEN/UNRESOLVED rejects
 I $$FIND^PSOREJUT(RX,RFL,.REJDATA) D
 . S REJ="" F  S REJ=$O(REJDATA(REJ)) Q:'REJ  D
 . . D CLOSE^PSOREJUT(RX,RFL,REJ,USR,REA,$G(COM))
 ;
 Q
