PSOBPSU1 ;BIRM/MFR - BPS (ECME) Utilities 1 ;10/15/04
 ;;7.0;OUTPATIENT PHARMACY;**148**;DEC 1997
 ;Reference to $$EN^BPSNCPDP supported by IA 4415
 ;References to $$NDCFMT^PSSNDCUT,$$GETNDC^PSSNDCUT supported by IA 4707
 ;References to $$ECMEON^BPSUTIL,$$CMOPON^BPSUTIL supported by IA 4410
 ;References to STORESP^IBNCPDP supported by IA 4299
 ;
ECMESND(RX,RFL,DATE,FROM,NDC,CMOP,RVTX,OVRC,CNDC,RESP,IGSW,ALTX) ; - Sends Rx Release information to ECME/IB and 
 ;                                                       updates NDC in the DRUG/PRESCRIPTION files
 ;Reference to routine EN^BPSNCPDP supported by DBIA #4304
 ;Input: (r) RX   - Rx IEN (#52)
 ;       (o) RFL  - Refill #  (Default: most recent)
 ;       (r) DATE - Date of Service
 ;       (r) FROM - Function within OP (See BWHERE param. in EN^BPSNCPDP api)
 ;       (o) NDC  - NDC Number (If not passed, will be retrieved from DRUG file)
 ;       (o) CMOP - CMOP Prescription (1-YES/0-NO) (Default: 0)
 ;       (o) RVTX - REVERSE text (e.g., RX EDIT, RX RELEASE-NDC CHANGE, etc)
 ;       (o) OVRC - Set of 3 NCPDP override codes separated by "^": 
 ;                  Piece 1: NCPDP Professional Service Code for overriding DUR REJECTS
 ;                  Piece 2: NCPDP Reason for Service Code for overriding DUR REJECTS
 ;                  Piece 3: NCPDP Result of Service Code for overriding DUR REJECTS
 ;       (o) CNDC - Changed NDC? 1 - Yes / 0 - No (Default: NO)
 ;       (o) IGSW - Ignore Switches (Master and CMOP)? 1 - Yes / 0 - No (Default: NO)
 ;       (o) ALTX - Alternative Text to be placed in the Rx ECME Activity Log
 ;Output:    RESP - Response from $$EN^BPSNCPDP api
 ;
 ; - Retrieving the NDC code from the DRUG file if not passed in, then save it in the DRUG file
 N ACT,NDCACT,DA
 ;
 I '$D(RFL) S RFL=$$LSTRFL(RX)
 ;
 ; - ECME is not turned ON for the Rx's Division
 I '$G(IGSW),'$$ECMEON^BPSUTIL($$RXSITE^PSOBPSUT(RX,RFL)) S RESP="-1^ECME SWITCH OFF" Q
 ;
 ; - ECME CMOP is not turned ON for the Rx's Division
 I '$G(IGSW),$G(CMOP),'$$CMOPON^BPSUTIL($$RXSITE^PSOBPSUT(RX,RFL)) S RESP="-1^CMOP SWITCH OFF" Q
 ;
 ; - Saving the NDC to be displayed on the ECME Activity Log
 I $G(CNDC) D
 . I $G(NDC)'="" S NDCACT=NDC Q
 . S NDCACT=$$GETNDC^PSONDCUT(RX,RFL)
 ;
 I $$NDCFMT^PSSNDCUT($G(NDC))="" D
 . S NDC=$$GETNDC^PSSNDCUT($$GET1^DIQ(52,RX,6,"I"),$$RXSITE^PSOBPSUT(RX,RFL),+$G(CMOP))
 . I $G(NDC)'="" D SAVNDC^PSONDCUT(RX,RFL,NDC,+$G(CMOP))
 ;
 ; - Creating ECME Activity Log on the PRESCRIPTION file
 S ACT="Submitted" I $$STATUS^PSOBPSUT(RX,RFL)="E PAYABLE" S ACT="Reversal/Re-submit sent"
 S ACT=ACT_" to ECME:"
 ;
 ; - Marked any 'unresolved' REJECTS as 'resolved' (Reason: 1 - Claim re-submitted)
 D CLSALL^PSOREJU2(RX,RFL,1,"AUTOMATICALLY CLOSED",DUZ)
 ;
 ; - Call to ECME (NEWing STAT because ECME was overwritting it - Important variable for CMOP release PSXVND)
 N STAT
 I $G(RVTX)="",FROM="ED" S RVTX="RX EDITED"
 S RESP=$$EN^BPSNCPDP(RX,RFL,$$DOS(RX,RFL,.DATE),FROM,NDC,$G(RVTX),$G(OVRC))
 ;
 ; - Reseting the Re-transmission flag
 D RETRXF^PSOREJU2(RX,RFL,0)
 ;
 ; - Logging ECME Activity Log to the PRESCRIPTION file
 I $G(ALTX)="" D
 . N X S X=""
 . S:FROM="OF" X="WINDOW FILL(NDC:"_$$GETNDC^PSONDCUT(RX,RFL)_")"
 . S:FROM="RF" X="WINDOW REFILL(NDC:"_$$GETNDC^PSONDCUT(RX,RFL)_")"
 . S:FROM="RN" X="RX RENEWED(NDC:"_$$GETNDC^PSONDCUT(RX,RFL)_")"
 . S:FROM="PL" X="SUSP LABEL PRINTED(NDC:"_$$GETNDC^PSONDCUT(RX,RFL)_")"
 . S:FROM="PE"!(FROM="PP") X="PULLED FROM SUSPENSE(NDC:"_$$GETNDC^PSONDCUT(RX,RFL)_")"
 . S:FROM="PC" X="CMOP TRANSMISSION(NDC:"_$$GETNDC^PSONDCUT(RX,RFL)_")"
 . S:FROM="RRL" X="RELEASED RX PREVIOUSLY REVERSED"
 . S:FROM="ED" X="RX EDITED"
 . S:$G(RVTX)'="" X=RVTX
 . S:$G(OVRC)'="" X="DUR OVERRIDE CODES("_$P(OVRC,"^",1)_"/"_$P(OVRC,"^",2)_"/"_$P(OVRC,"^",3)_")"
 . S:$G(CNDC) X=X_"(NDC:"_NDCACT_")" S ACT=ACT_X
 . S ACT=ACT_$$STS(RX,RFL,RESP)
 I $G(ALTX)'="" S ACT=ACT_ALTX_$$STS(RX,RFL,RESP)
 I +RESP=2,$$STATUS^PSOBPSUT(RX,RFL)="" S ACT="Not ECME Billable: "_$P(RESP,"^",2)
 D ECMEACT(RX,RFL,ACT,DUZ)
 Q
 ;
REVERSE(RX,RFL,FROM,RSN,RTXT,IGRL,NDC) ; - Reverse a claim and close all OPEN/UNRESOLVED Rejects
 ;Input: (r) RX   - Rx IEN (#52)
 ;       (o) RFL  - Refill #  (Default: most recent)
 ;       (r) FROM - Function within OP (See BWHERE param. in EN^BPSNCPDP api)
 ;       (o) RSN  - Close Reason (2:RX ON HOLD;4: RX RETURNED TO STOCK,5:RX DELETED,etc...)
 ;       (o) RTXT - Close Reason TEXT (Usually no passed if RSN is passed)
 ;       (o) IGRL - Ignore RELEASE DATE, reverse anyway  
 ;       (o) NDC  - NDC number related to the reversal (Note: might be an invalid NDC)
 ;
 I '$D(RFL) S RFL=$$LSTRFL(RX)
 ;
 I $$STATUS^PSOBPSUT(RX,RFL)="" Q
 ;
 N RESP,STS,ACT,STAT,DA,STATUS,NOACT S RSN=+$G(RSN),RTXT=$G(RTXT)
 I RTXT="",RSN D
 . S:RSN=2 RTXT="RX PLACED ON HOLD" S:RSN=3 RTXT="RX SUSPENDED" S:RSN=4 RTXT="RX RETURNED TO STOCK"
 . S:RSN=5 RTXT="RX DELETED" S:RSN=7 RTXT="RX DISCONTINUED" S:RSN=8 RTXT="RX EDITED"
 ;
 D CLSALL^PSOREJU2(RX,RFL,RSN,RTXT,DUZ)
 ;
 I '$G(IGRL),$$RXRLDT^PSOBPSUT(RX,RFL) Q
 ;
 ; - Reseting the Re-transmission flag if Rx is being suspended
 I RSN=3!($$GET1^DIQ(52,RX,100,"I")=5) D RETRXF^PSOREJU2(RX,RFL,1)
 ;
 S STATUS=$$STATUS^PSOBPSUT(RX,RFL),NOACT=0
 I STATUS'="E PAYABLE",STATUS'="IN PROGRESS",STATUS'="E REVERSAL REJECTED",STATUS'="E REVERSAL STRANDED",STATUS'="E DUPLICATE" S NOACT=1
 ;
 S RESP=$$EN^BPSNCPDP(RX,RFL,$$DOS(RX,RFL),FROM,$$GETNDC^PSONDCUT(RX,RFL),RTXT)
 ;
 ; - Logging ECME Activity Log
 I '$G(NOACT) D
 . S ACT="Reversal sent to ECME: "_RTXT_$S($G(NDC)'="":" ("_NDC_")",1:"")_$$STS(RX,RFL,+RESP)
 . D ECMEACT(RX,RFL,ACT,DUZ)
 ;
 Q
 ;
DOS(RX,RFL,DATE) ; Return the Date Of Service for ECME
 ;Input: (r) RX   - Rx IEN (#52)
 ;       (o) RFL  - Refill #  (Default: most recent)
 ;       (o) DATE - Possible Date Of Service
 ;Output:    DOS  - Actual Date Of Service
 ;
 I '$D(RFL) S RFL=$$LSTRFL(RX)
 ;
 ; - Retrieving FILL DATE from the PRESCRIPTION file if not passed
 I $G(DATE)="" S DATE=$$RXRLDT^PSOBPSUT(RX,RFL)
 ; - Retrieving FILL DATE from the PRESCRIPTION file if not passed
 I 'DATE S DATE=$$RXFLDT^PSOBPSUT(RX,RFL)
 ; - Future Date not allowed
 I DATE>DT!'DATE S DATE=DT
 ;
 Q (DATE\1)
 ;
RELEASE(RX,RFL,USR) ; - Notifies IB that the Rx was RELEASED
 ;Input: (r) RX   - Rx IEN (#52)
 ;       (o) RFL  - Refill #  (Default: most recent)
 ;       (o) USR  - User responsible for releasing the Rx (Default: .5 - Postmaster)
 ;
 N IBAR,RXAR,FLDT
 ;
 S:'$D(RFL) RFL=$$LSTRFL(RX)
 S:'$D(USR) USR=.5
 ;
 D GETS^DIQ(52,RX_",",".01;2;6;7;8;22","I","RXAR")
 S DFN=+$G(RXAR(52,RX_",",2,"I"))
 S IBAR("PRESCRIPTION")=RX,IBAR("RX NO")=$G(RXAR(52,RX_",",.01,"I"))
 S IBAR("CLAIMID")=$E((RX#10000000)+10000000,2,8),IBAR("USER")=USR
 S IBAR("DRUG")=RXAR(52,RX_",",6,"I"),IBAR("NDC")=$$GETNDC^PSONDCUT(RX,RFL)
 S FLDT=$$RXFLDT^PSOBPSUT(RX,RFL) I FLDT>DT S FLDT=DT
 S IBAR("FILL NUMBER")=RFL,IBAR("FILL DATE")=FLDT
 S IBAR("QTY")=$G(RXAR(52,RX_",",7,"I")),IBAR("DAYS SUPPLY")=$G(RXAR(52,RX_",",8,"I"))
 ;
 I RFL D
 . D GETS^DIQ(52.1,RFL_","_RX_",",".01;1;1.1","I","RFAR")
 . S IBAR("QTY")=$G(RFAR(52.1,RFL_","_RX_",",1,"I"))
 . S IBAR("DAYS SUPPLY")=$G(RFAR(52.1,RFL_","_RX_",",1.1,"I"))
 ;
 S IBAR("STATUS")="RELEASED" D STORESP^IBNCPDP(DFN,.IBAR)
 ;
 Q
 ;
LSTRFL(RX) ;  - Returns the latest fill for the Prescription
 ; Input: (r) RX     - Rx IEN (#52)
 ;Output:     LSTRFL - Most recent refill #
 N I,LSTRFL
 S (I,LSTRFL)=0 F  S I=$O(^PSRX(RX,1,I)) Q:'I  S LSTRFL=I
 Q LSTRFL
 ;
ECMEACT(RX,RFL,COMM,USR) ; - Add an Activity to the ECME Activity Log (PRESCRIPTION file)
 ;Input: (r) RX   - Rx IEN (#52)
 ;       (o) RFL  - Refill #  (Default: most recent)
 ;       (r) COMM - Comments (up to 75 characters)
 ;       (o) USR  - User logging the comments (Default: DUZ)
 ;
 S:'$D(RFL) RFL=$$LSTRFL(RX) S:'$D(USR) USR=DUZ
 S:'$D(^VA(200,+USR,0)) USR=DUZ S COMM=$E($G(COMM),1,75)
 ;
 I COMM="" Q
 I '$D(^PSRX(RX)) Q
 ;
 N DIC,DA,DD,DO,DR,DINUM,Y,DLAYGO
 S DA(1)=RX,DIC="^PSRX("_RX_",""A"",",DLAYGO=52.3,DIC(0)="L"
 S DIC("DR")=".02///M;.03////"_USR_";.04///"_RFL_";.05///"_COMM
 S X=$$NOW^XLFDT() D FILE^DICN
 Q
 ;
STS(RX,RFL,RSP) ; Adds the Status to the ECME Activity Log according to Rx/fill claim status Response
 N STS
 S STS=$S($$STATUS^PSOBPSUT(RX,RFL)'="IN PROGRESS"&($$STATUS^PSOBPSUT(RX,RFL)'=""):"-"_$$STATUS^PSOBPSUT(RX,RFL),1:"")
 S:+RSP=1 STS="-NO SUBMISSION THROUGH ECME" S:+RSP=3 STS="-NO REVERSAL NEEDED" S:+RSP=4 STS="-NOT PROCESSED"
 S:+RSP=5 STS="-SOFTWARE ERROR"
 I +RSP=2,$$STATUS^PSOBPSUT(RX,RFL)'="" S STS="-NOT BILLABLE:"_$P(RSP,"^",2)
 Q STS
