PSONDCUT ;BIRM/MFR - NDC Utilities ;10/15/04
 ;;7.0;OUTPATIENT PHARMACY;**148**;DEC 1997
 ;Reference to $$ECMEON^BPSUTIL supported by DBIA 4410
 ;References to $$GETNDC^PSSNDCUT,$$NDCFMT^PSSNDCUT,SAVNDC^PSSNDCUT supported by IA 4707
 ;
CHGNDC(RX,RFL,BCODE)   ; Prompt for NDC code during Rx Release for HIPAA/NCPDP project
 ;Input:  (r) RX     - Rx IEN (#52)
 ;        (o) RFL    - Refill Number (#52.1)
 ;        (o) BCODE  - Displays PID: 999-99-9999/MED: XXXXX XXXXXXXXXXX 999MG in the NDC prompt (1-YES/0-NO)
 ;        
 ;Output: (r) NDCCHG - NDC was changed? (1-YES/0-NO)^New NDC number 
 ;                     OR "^" if no valid NDC or "^" entered
 ;        
 N PSONDC,NEWNDC,SITE
 I '$D(RFL) S RFL=$$LSTRFL^PSOBPSU1(RX)
 S SITE=$$RXSITE^PSOBPSUT(RX,RFL) I '$$ECMEON^BPSUTIL(SITE) Q "^"  ; ECME is not turned ON for the Rx's Division
 ;
 ; - Retrieving Rx NDC and Fill Date
 S PSONDC=$$GETNDC(RX,RFL)
 ;
 ; - Prompts for NDC number
 I $G(BCODE) F I=1:1:5 W $C(7)
 S NEWNDC=PSONDC D NDCEDT(RX,RFL,,SITE,.NEWNDC,$G(BCODE)) I NEWNDC="^"!(NEWNDC="") Q "^"
 ;
 ; - If NDC changed, resubmit to ECME and save new NDC in the DRUG and PRESCRIPTION files
 I PSONDC'=NEWNDC D  Q ("1^"_NEWNDC)
 . D SAVNDC(RX,RFL,NEWNDC,0,1)
 . D ECMESND^PSOBPSU1(RX,RFL,,"ED",NEWNDC,,"RX RELEASE-NDC CHANGE",,1,,1)
 Q 0
 ;
NDCEDT(RX,RFL,DRG,SITE,NDC,BCODE) ; Allows editing of the Rx NDC code
 ; Input: (r) RX    - Rx IEN (#52) 
 ;        (o) RFL   - Refill Number (#52.1)
 ;        (o) DRG   - Drug IEN (#50)
 ;        (o) NDC   - Default NDC Number/Return parameter ("" means no NDC selected)  (Note: REQUIRED for Output value)
 ;        (o) BCODE - Display the PID/Drug Name in the NDC prompt
 ;Output: (r) .NDC  - Selected NDC Number
 ;
 N SNDC,SYN,Z,IDX,I,PID,DFN,DRGNAM,PRPT,DIR
 K ^TMP($J,"PSONDCDP"),^TMP($J,"PSONDCFM")
 I '$G(DRG),$G(RX) S DRG=$$GET1^DIQ(52,RX,6,"I")
 I '$D(RFL) S RFL=$$LSTRFL^PSOBPSU1(RX)
 S IDX=0,SITE=+$G(SITE) I 'SITE,$G(RX) S SITE=$$RXSITE^PSOBPSUT(RX,RFL)
 ;
 ; - Setting the NDC currently on the PRESCRIPTION (passed in)
 I $G(NDC)'="",$$NDCFMT^PSSNDCUT(NDC)'="" S IDX=1,^TMP($J,"PSONDCFM",IDX)=NDC,^TMP($J,"PSONDCDP",NDC)=IDX
 ;
 ; - Retrieving NDC from the PRESCRIPTION file
 I $G(RX) D
 . S NDC=$$GETNDC(RX,RFL)
 . I NDC'="",'$D(^TMP($J,"PSONDCDP",NDC)) D
 . . S IDX=IDX+1,^TMP($J,"PSONDCFM",IDX)=NDC,^TMP($J,"PSONDCDP",NDC)=IDX
 ;
 S:'IDX IDX=1
 ;
 ; - Retrieving NDC from the DRUG/NDF files
 S NDC=$$GETNDC^PSSNDCUT(DRG)
 I NDC'="",'$D(^TMP($J,"PSONDCDP",NDC)) D
 . S IDX=IDX+1,^TMP($J,"PSONDCFM",IDX)=NDC,^TMP($J,"PSONDCDP",NDC)=IDX
 ; 
 ; - Retrieving NDC by OUTPATIENT SITE from the DRUG/NDF files
 S NDC=$$GETNDC^PSSNDCUT(DRG,SITE)
 I NDC'="",'$D(^TMP($J,"PSONDCDP",NDC)) D
 . S IDX=IDX+1,^TMP($J,"PSONDCFM",IDX)=NDC,^TMP($J,"PSONDCDP",NDC)=IDX
 ;
 ; - Retrieving NDCs from SYNONYMS
 S SYN=0
 F  S SYN=$O(^PSDRUG(DRG,1,SYN)) Q:SYN=""  D
 . S Z=$G(^PSDRUG(DRG,1,SYN,0)),SNDC=$$NDCFMT^PSSNDCUT($P(Z,"^",2)) I SNDC="" Q
 . I $D(^TMP($J,"PSONDCDP",SNDC)) Q
 . S IDX=IDX+1,^TMP($J,"PSONDCFM",IDX)=SNDC
 . S ^TMP($J,"PSONDCDP",SNDC)=IDX
 ;
 I '$D(^TMP($J,"PSONDCFM")) D  S NDC="^" G END
 . W !!,"No valid NDC codes found for "_$$GET1^DIQ(50,DRG,.01),$C(7)
 ;
ASK ; Ask for NDC
 S PRPT=""
 I $G(BCODE) D
 . S DFN=$$GET1^DIQ(52,RX,2,"I") D DEM^VADPT S PID=$P(VADM(2),"^",2)
 . S DRGNAM=$E($$GET1^DIQ(50,DRG,.01),1,25),PRPT="PID: "_PID_"/MED: "_DRGNAM_"/"
 K DIR S DIR(0)="FOA^1:15",DIR("A")=PRPT_"NDC: ",DIR("B")=$G(^TMP($J,"PSONDCFM",1)) I DIR("B")="" K DIR("B")
 S DIR("?")="^D NDCHLP^PSONDCUT" D ^DIR I $D(DIRUT) S NDC="^" G END
 I Y'?.N S NDC=Y I '$D(^TMP($J,"PSONDCDP",NDC)) W !,$C(7) D NDCHLP W !,$C(7) G ASK
 I Y?.N D  I NDC="" W !,$C(7) D NDCHLP W !,$C(7) G ASK
 . I $L(Y)=11 S NDC=$$NDCFMT^PSSNDCUT(Y) S:NDC'="" NDC=$S($D(^TMP($J,"PSONDCDP",NDC)):NDC,1:"") Q
 . S NDC=$G(^TMP($J,"PSONDCFM",+Y))
 W " ",NDC
 ;
END K ^TMP($J,"PSONDCDP"),^TMP($J,"PSONDCFM")
 Q
 ;
SAVNDC(RX,RFL,NDC,CMP,DRG) ; Saves the NDC in the PRESCRIPTION and DRUG files
 ; Input: (r) RX - Rx IEN (#52)
 ;        (o) RFL - Refill Number (#52.1)
 ;        (r) NDC - NDC Number
 ;        (o) CMP - CMOP? (1-YES/0-NO)
 ;        (o) DRG - Save in the DRUG file (1-YES/0-NO) ((Def: 0)
 ;
 S NDC=$$NDCFMT^PSSNDCUT(NDC) I NDC="" Q
 ;
 ;- Saving the NDC in the PRESCRIPTION file (#52)
 I '$D(RFL) S RFL=$$LSTRFL^PSOBPSU1(RX)
 ;
 N DA,DIE,DR
 I 'RFL S DIE="^PSRX(",DA=RX,DR="27///"_NDC D ^DIE
 I RFL,$D(^PSRX(RX,1,RFL,0)) S DIE="^PSRX("_RX_",1,",DA(1)=RX,DA=RFL,DR="11///"_NDC D ^DIE
 ;
 ;- Saving the NDC in the DRUG file (#50)
 I $G(DRG) D SAVNDC^PSSNDCUT($$GET1^DIQ(52,RX,6,"I"),$$RXSITE^PSOBPSUT(RX,RFL),NDC,$G(CMP))
 Q
 ;
GETNDC(RX,RFL) ; Returns the Rx NDC #
 ; Input:  (r) RX - Rx IEN (#52)
 ;         (o) RFL - Refill #
 ; Output:     NDC - Rx NDC #
 N NDC,I S NDC=""
 I '$D(RFL) S RFL=$$LSTRFL^PSOBPSU1(RX)
 I RFL S NDC=$$GET1^DIQ(52.1,RFL_","_RX,11)
 I 'RFL!(NDC="") S NDC=$$GET1^DIQ(52,RX,27)
 Q $$NDCFMT^PSSNDCUT(NDC)
 ;
NDCHLP ; Help Text for the NDC Code Selection
 N I
 W !,"Select one of the following valid NDC code(s) below: ",!
 S I=0 F  S I=$O(^TMP($J,"PSONDCFM",I)) Q:'I  D
 . W !?10,$J(I,2)," - ",^TMP($J,"PSONDCFM",I)
 Q
