MDAPI ; HOIFO/DP/NCA - CP API Calls ; [05-05-2003 10:28]
 ;;1.0;CLINICAL PROCEDURES;;Apr 01, 2004
 ; Description:
 ; These API's are for use by external packages communicating with CP.
 ;
 ; Integration Agreements:
 ; IA# 3378 [Restricted] Documents the APIs that external packages use to communicate with CP.
 ; IA# 3468 [Subscription] Use GMRCCP APIs.
 ;
EXTDATA(MDPROC) ; [Procedure] 
 ; Returns 0/1 for external data needed
 ; Called by Consults to determine status of consult ordered
 ;
 ; Input parameters
 ;  1. MDPROC [Literal/Required] CP Definition IEN
 ;
 Q:'$D(^MDS(702.01,+$G(MDPROC),0)) 0
 I +$P(^MDS(702.01,+$G(MDPROC),0),U,3)!($O(^(.1,0))) Q 1
 E  Q 0
 ;
ISTAT(MDARR) ; [Procedure] Called by Imaging to update status
 ; Input parameters
 ;  1. MDARR [Literal/Required] Array from Imaging
 ;
 ; Input: MDARR(0)="0^error message" or "1^success message"
 ;        MDARR(1)=TrackID  (CP;Transaction IEN)
 ;        MDARR(2)=Queue Number
 ;        MDARR(3..N)=Warnings
 N MDCON,MDCR,MDIEN,MDIENS,MDLP,MDSTAT,MDSTR,MDTIU,RESULTS
 Q:$G(MDARR(0))=""
 Q:$G(MDARR(1))=""
 Q:$P(MDARR(1),";")'="CP"
 Q:'(+$P(MDARR(1),";",2))
 S MDIEN=+$P(MDARR(1),";",2),MDIENS=MDIEN_","
 S MDSTAT=+$P(MDARR(0),"^")
 S DATA("TRANSACTION")=MDIEN
 ; Is it in error?
 I 'MDSTAT D  Q
 .D STATUS^MDRPCOT(MDIENS,2,$P(MDARR(0),"^",2))
 .S DATA("PKG")="IMAGING"
 .S DATA("MESSAGE")=$P(MDARR(0),"^",2) D RPC^MDRPCOT(.RESULTS,"ADDMSG",.DATA)
 .F MDLP=2:0 S MDLP=$O(MDARR(MDLP)) Q:'MDLP  I $G(MDARR(MDLP))'="" D
 ..S DATA("MESSAGE")=$$TRANS(MDARR(MDLP)) D RPC^MDRPCOT(.RESULTS,"ADDMSG",.DATA)
 .D IMGSTAT^MDRPCOT1(+MDIENS,2) Q
 ; Call Consults that Partial Result ready
 S MDCON=+$P(^MDD(702,MDIEN,0),"^",5),MDTIU=+$P(^(0),"^",6)
 S MDCR=$$UPDCONS^MDRPCOT1(MDCON,MDTIU)
 I +MDCR<0 D  Q
 .D STATUS^MDRPCOT(MDIENS,2,$P(MDCR,"^",2))
 .S DATA("PKG")="CONSULTS",DATA("MESSAGE")=$P(MDCR,"^",2)
 .D RPC^MDRPCOT(.RESULTS,"ADDMSG",.DATA)
 .Q
 ; Closeout the record
 D STATUS^MDRPCOT(MDIENS,3,"")
 ; Update Images Status
 D IMGSTAT^MDRPCOT1(+MDIENS,3)
 Q
 ;
ITIU(RESULTS,DFN,CONSULT,VSTRING) ; [Procedure] API for Vista Imaging
 ; This API enables VistA Imaging to retrieve/create a TIU note for
 ; a consult for attaching images to.
 ; 
 ; RESULTS(0) will equal one of the following
 ;   IEN of the TIU note if successful
 ;   or on failure one of the following status messages
 ;   -1^No patient DFN
 ;   -1^No Consult IEN
 ;   -1^No VString
 ;   -1^Error in CP transaction
 ;   -1^Unable to create CP transaction
 ;   -1^Unable to create the TIU document
 ;   -1^No such consult for this patient.
 ;
 ; Input parameters
 ;  1. RESULTS [Reference/Required] Return array
 ;  2. DFN [Literal/Required] Patient IEN
 ;  3. CONSULT [Literal/Required] Consult IEN
 ;  4. VSTRING [Literal/Optional] VString data for TIU Note (Required to create new TIU note)
 ;
 ; Variables:
 ;  MDIEN: [Private] Returns IEN from UPDATE~DIE call
 ;  MDIENS: [Private] Scratch
 ;  MDNOTE: [Private] Scratch
 ;  MDTRANS: [Private] Contains IEN of CP transaction
 ;
 ; New private variables
 NEW MDIEN,MDIENS,MDNOTE,MDTRANS
 K ^TMP($J),^TMP("MDTIUST",$J)
 N MDD,MDN,MDTIUER,MDTST,MDNEWV,MDTIUD S (MDTIUD,MDTIUER,MDTST)=""
 I '$G(DFN) S RESULTS(0)="-1^No patient DFN" Q
 I '$G(CONSULT) S RESULTS(0)="-1^No Consult IEN" Q
 ; Look for existing transaction
 S MDTIUD=$$PREV^MDRPCOT(+CONSULT,"")
 I +MDTIUD S RESULTS(0)=+MDTIUD Q
 ; No transaction, must create one for this consult
 I $G(VSTRING)="" S RESULTS(0)="-1^No VString" Q
 D CPLIST^GMRCCP(DFN,,$NA(^TMP($J)))
 S MDX="" F  S MDX=$O(^TMP($J,MDX)) Q:'MDX  I $P(^(MDX),U,5)=CONSULT D  Q
 .D NOW^%DTC S MDD=%
 .S:$L(VSTRING,";")=1 VSTRING=";"_VSTRING
 .S MDNEWV=$$GETVSTR^MDRPCOT1(DFN,VSTRING,$P(^TMP($J,MDX),U,6),MDD)
 .S MDFDA(702,"+1,",.01)=DFN
 .S MDFDA(702,"+1,",.02)=MDD
 .S MDFDA(702,"+1,",.03)=DUZ
 .S MDFDA(702,"+1,",.04)=$P(^TMP($J,MDX),U,6)
 .S MDFDA(702,"+1,",.05)=CONSULT
 .S MDFDA(702,"+1,",.07)=$P(MDNEWV,";",3)_";"_$P(MDNEWV,";",2)_";"_$P(MDNEWV,";")
 .S MDFDA(702,"+1,",.09)=0
 .;Create the new transaction
 .D UPDATE^DIE("","MDFDA","MDIEN") I '$G(MDIEN(1)) D  Q
 ..S RESULTS(0)="-1^Unable to create CP transaction"
 .
 .;Create the new TIU Note
 .S MDIENS=MDIEN(1)_","
 .S MDN=$$NEWTIUN^MDRPCOT(+MDIENS)
 .S MDNOTE=$S(MDN:$$GET1^DIQ(702,+MDIENS,.06,"I"),1:0)
 .I 'MDNOTE D  Q
 ..N DA,DIK
 ..S RESULTS(0)="-1^Unable to create the TIU document"
 ..S DA=+MDIENS,DIK="^MDD(702," D ^DIK
 .S RESULTS(0)=MDNOTE
 Q
 ;
TIUCOMP(MDNOTE) ; [Procedure] Post Signature action to complete transaction
 ; Input parameters
 ;  1. MDNOTE [Literal/Required] TIU IEN
 ;
 N MDFDA,MDRES
 S MDRES=$O(^MDD(702,"ATIU",MDNOTE,0))
 I $G(^MDD(702,+MDRES,0))="" Q 0
 I $P($G(^MDD(702,+MDRES,0)),"^",9)=3 Q 1
 S MDFDA(702,MDRES_",",.09)=3
 D FILE^DIE("","MDFDA")
 Q 1
 ;
TIUDEL(MDNOTE) ; [Procedure] TIU Note deletion Update
 ; Input parameters
 ;  1. MDNOTE [Literal/Required] TIU IEN
 ;
 N MDRES,MDFDA,RESULTS
 S MDRES="" F  S MDRES=$O(^MDD(702,"ATIU",MDNOTE,MDRES)) Q:'MDRES  D
 .Q:$G(^MDD(702,+MDRES,0))=""
 .S MDFDA(702,MDRES_",",.05)=""
 .S MDFDA(702,MDRES_",",.06)=""
 .D FILE^DIE("","MDFDA")
 .D STATUS^MDRPCOT(MDRES_",",2,"TIU note deleted.")
 .S DATA("TRANSACTION")=MDRES,DATA("PKG")="TIU"
 .S DATA("MESSAGE")="TIU note deleted." D RPC^MDRPCOT(.RESULTS,"ADDMSG",.DATA)
 Q 1
 ;
TIUREAS(MDFN,MDOLDC,MDANOTE,MDNDFN,MDNEWC,MDNEWV,MDNTIU) ; [Function] This is an API to clean up and update TIU note re-assignment.
 ; Input parameters
 ;  1. MDFN [Literal/Required] The Patient DFN whose TIU document is being re-assigned.
 ;  2. MDOLDC [Literal/Required] The Consult that the note is being re-assigned from.
 ;  3. MDANOTE [Literal/Required] The TIU Document IEN that is being re-assigned.
 ;  4. MDNDFN [Literal/Required] The Patient DFN who will be re-assigned the TIU document.
 ;  5. MDNEWC [Literal/Required] The consult number that will be assignment the TIU document.
 ;  6. MDNEWV [Literal/Required] The new visit for the TIU document assignment.
 ;  7. MDNTIU [Literal/Required] The new reassigned TIU document IEN.
 ;
 N MDD,MDTRAN,MDCHK,MDLP,MDPPR,MDREAS,MDTRANI,MDX
 I '$G(MDFN) Q "0^No DFN for the TIU note re-assignment."
 I '$G(MDOLDC) Q "0^No Old Consult # for the note re-assignment."
 I '$G(MDANOTE) Q "0^No TIU Note IEN."
 I '$G(MDNDFN) Q "0^No New DFN for the note assignment."
 I '$G(MDNEWC) Q "0^No New Consult # for the note assignment."
 I '$G(MDNTIU) Q "0^No New Reassigned TIU IEN."
 S (MDD,MDCHK,MDREAS,MDTRAN)="",MDPPR=0 K ^TMP("MDTMP",$J)
 F  S MDTRAN=$O(^MDD(702,"ACON",MDOLDC,MDTRAN)) Q:'MDTRAN  D
 .S MDCHK=$G(^MDD(702,MDTRAN,0)),MDTRANI=MDTRAN_","
 .I $P(MDCHK,U,5)=MDOLDC&($P(MDCHK,U,6)=MDANOTE) D
 ..S:'MDPPR MDPPR=$P(MDCHK,U,4)
 ..N DA,DIK S DA=+MDTRAN,DIK="^MDD(702," D ^DIK
 I 'MDPPR D
 .D CPLIST^GMRCCP(MDNDFN,,$NA(^TMP("MDTMP",$J)))
 .S MDX=""
 .F  S MDX=$O(^TMP("MDTMP",$J,MDX)) Q:'MDX  S:$P(^(MDX),U,5)=MDNEWC MDPPR=$P(^(MDX),U,6)
 K ^TMP("MDTMP",$J)
 I 'MDPPR Q 1
 D NOW^%DTC S MDD=%
 S MDREAS=$P(MDNEWV,";",3)_";"_$P(MDNEWV,";",2)_";"_$P(MDNEWV,";")
 S MDNEWV=$$GETVSTR^MDRPCOT1(MDNDFN,MDREAS,MDPPR,MDD)
 S MDFDA(702,"+1,",.01)=MDNDFN
 S MDFDA(702,"+1,",.02)=MDD
 S MDFDA(702,"+1,",.03)=DUZ
 S MDFDA(702,"+1,",.04)=MDPPR
 S MDFDA(702,"+1,",.05)=MDNEWC
 S MDFDA(702,"+1,",.06)=MDNTIU
 S MDFDA(702,"+1,",.07)=$P(MDNEWV,";",3)_";"_$P(MDNEWV,";",2)_";"_$P(MDNEWV,";")
 S MDFDA(702,"+1,",.09)=0
 D UPDATE^DIE("","MDFDA","MDTRANI") Q:'$G(MDTRANI(1)) 1
 Q 1
 ;
TRANS(STR) ; [Function] Translate the upper arrows to blanks
 ; Input parameters
 ;  1. STR [Literal/Required] Input: Text with upper arrows that needs to be removed
 ;
 I STR["^" Q $TR(STR,"^"," ")
 Q STR
 ;
