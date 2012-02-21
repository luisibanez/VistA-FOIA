MDRPCOP ; HOIFO/DP - Object RPCs (TMDPatient) ; [01-09-2003 15:21]
 ;;1.0;CLINICAL PROCEDURES;;Apr 01, 2004
 ; Integration Agreements:
 ; IA# 3027 [Supported] Calls to DGSEC4
 ; IA# 2981 [Subscription] Calls to GUI~GMRCP5
 ; IA# 2548 [Supported] ACRP Interface Toolkit APIs.
 ; IA# 2552 [Supported] AIT API to provide outpatient encounter data.
 ; IA# 10061 [Supported] VADPT calls.
 ; IA# 3468 [Subscription] Use GMRCCP APIs.
 ; IA# 3266 [Subscription] Call to DPTLK1
 ; IA# 10103 [Supported] Call to XLFDT
 ; IA# 10039 [Supported] Ward Location File (#42) Access.
 ; IA# 10035 [Supported] DPT references
 ; IA# 3267 [Subscription] Call to DPTLK1
 ; IA# 3593 [Supported] Access to routine DPTLK6 utilities for lookup
 ; IA# 3613 [Private] GETVST^MDRPCOP API call
 ; IA# 10099 [Supported] GMRADPT call
 ; IA# 1096 [Controlled Subscription] ^DGPM("ATID1" x-ref loop
 ;
ADD(X) ; [Procedure] Add line to @RESULTS@(...
 S @RESULTS@(+$O(@RESULTS@(""),-1)+1)=X
 Q
 ;
ALLERGY ; [Procedure] Return Allergies
 D EN1^GMRADPT I '$O(GMRAL(0)) D  Q
 .I $G(GMRAL)="" S @RESULTS@(0)="No Allergy Assessment"
 .I $G(GMRAL)=0 S @RESULTS@(0)="No Known Allergies"
 S @RESULTS@(0)="This patient has the following allergy(ies): "
 F X=0:0 S X=$O(GMRAL(X)) Q:'X  D
 .S @RESULTS@(X)=$P($G(GMRAL(X)),U,2)
 Q
 ;
CHKIN ; [Procedure] Check In Study
 F X=2:1:5 D
 .I $P(DATA,U,X)]"" S MDFDA(702,$P(DATA,U,1),$P("^.04^.05^.11^.07",U,X))=$P(DATA,U,X)
 S MDFDA(702,$P(DATA,U,1),.09)=4  ; Status = Checked-In
 I $P(DATA,U,1)="+1," D
 .S MDFDA(702,"+1,",.01)=DFN
 .S MDFDA(702,"+1,",.02)=$$NOW^XLFDT()
 .S MDFDA(702,"+1,",.03)=DUZ
 .D UPDATE^DIE("","MDFDA","MDIEN","MDERR") Q:$D(MDERR)
 .S MDIENS=MDIEN(1)_",",MDHL7=$$SUB^MDHL7B(MDIEN(1))
 .I +MDHL7=-1 S MDFDA(702,MDIENS,.09)=2,MDFDA(702,MDIENS,.08)=$P(MDHL7,U,2)
 .I +MDHL7=1 S MDFDA(702,MDIENS,.09)=5,MDFDA(702,MDIENS,.08)=""
 .D:$D(MDFDA) FILE^DIE("","MDFDA","MDERR")
 I $P(DATA,U,1)'="+1," D
 .D FILE^DIE("","MDFDA","MDERR") Q:$D(MDERR)
 .S MDIENS=+DATA_","
 .S MDHL7=$$SUB^MDHL7B(+MDIENS)
 .I +MDHL7=-1 S MDFDA(702,MDIENS,.09)=2,MDFDA(702,MDIENS,.08)=$P(MDHL7,U,2)
 .I +MDHL7=1 S MDFDA(702,MDIENS,.09)=5,MDFDA(702,MDIENS,.08)=""
 .D:$D(MDFDA) FILE^DIE("","MDFDA","MDERR")
 I '$D(MDERR) S @RESULTS@(0)="1^OK" Q
 D ERROR^MDRPCU(RESULTS,.MDERR)
 Q
 ;
DISPCON ; [Procedure] Display a consult
 K ^TMP("GMRC",$J)
 D GUI^GMRCP5(.RESULTS,DATA)
 Q
 ;
GETCONS ; [Procedure] Get available consults for patient
 K ^TMP("MDTMP",$J)
 D CPLIST^GMRCCP(DFN,,$NA(^TMP("MDTMP",$J)))
 S MDX=0
 F  S MDX=$O(^TMP("MDTMP",$J,MDX)) Q:'MDX  D:"saprc"[$P(^(MDX),U,4)
 .S Y="123;"_$P(^TMP("MDTMP",$J,MDX),U,5)
 .F X=2,3,4,1,6,5 S Y=Y_U_$P(^TMP("MDTMP",$J,MDX),U,X)
 .S Y=Y_U_+$O(^MDD(702,"ACON",+$P(^TMP("MDTMP",$J,MDX),U,5)))
 .D ADD(Y)
 S @RESULTS@(0)=+$O(@RESULTS@(""),-1)
 K ^TMP("MDTMP",$J)
 Q
 ;
GETHDR ; [Procedure] Get Pt Header
 S DFNIENS=DFN_","
 S @RESULTS@(0)=$$GET1^DIQ(2,DFNIENS,.01)_"  "_$$GET1^DIQ(2,DFNIENS,.1)_" "_$$GET1^DIQ(2,DFNIENS,.101)
 S @RESULTS@(1)=$$GET1^DIQ(2,DFNIENS,.09)_"  "_$$GET1^DIQ(2,DFNIENS,.02)_"  "_$$GET1^DIQ(2,DFNIENS,.03)_" ("_$$GET1^DIQ(2,DFNIENS,.033)_")"
 Q
 ;
GETOBJ ; [Procedure] Get information for TMDPATIENT object
 D DEM^VADPT,INP^VADPT
 S @RESULTS@(0)=DFN
 S @RESULTS@(1)=VADM(1)
 S @RESULTS@(2)=$P(VADM(2),U,2)
 S @RESULTS@(3)=$P(VADM(3),U,2)
 S @RESULTS@(4)=VADM(4)
 S @RESULTS@(5)=$P(VADM(5),U,2)
 I VAIN(4)]"" S @RESULTS@(6)="Ward: "_$P(VAIN(4),U,2)_" Rm: "_VAIN(5)
 E  S @RESULTS@(6)=""
 Q
 ;
GETRES ; [Procedure] Get results report
 F MDX=0:0 S MDX=$O(^MDD(703.1,"ADFN",DFN,MDX)) Q:'MDX  D
 .S MDINST=+$P($G(^MDD(703.1,MDX,0)),U,4)
 .I $G(DATA) Q:'$D(^MDS(702.01,DATA,.1,"B",MDINST))
 .S MDY=$O(@RESULTS@(""),-1)+1
 .S @RESULTS@(MDY)="703.1;"_MDX_U_^MDD(703.1,MDX,0)
 .S Y=$P(^MDD(703.1,MDX,0),U,3) D D^DIQ
 .S $P(@RESULTS@(MDY),U,11)=Y
 .S Y=$P($G(^MDS(702.09,+$P(^MDD(703.1,MDX,0),U,4),0)),U)
 .S $P(@RESULTS@(MDY),U,12)=Y
 S @RESULTS@(0)=+$O(@RESULTS@(""),-1)
 Q
 ;
GETTRAN ; [Procedure] Get a patients transactions
 F MDX=0:0 S MDX=$O(^MDD(702,"B",DFN,+MDX))_"," Q:'MDX  D
 .S Z=$$GET1^DIQ(702,MDX,".04:.02","I")_U_$$GET1^DIQ(702,MDX,.04)_U_$$GET1^DIQ(702,MDX,.02,"I")_U_$$GET1^DIQ(702,MDX,.09)_U_$$GET1^DIQ(702,MDX,.11)_U_$$GET1^DIQ(702,MDX,.991)
 .S Y=$O(@RESULTS@(""),-1)+1
 .S @RESULTS@(Y)="702;"_+MDX_U_Z
 S @RESULTS@(0)=+$O(@RESULTS@(""),-1)
 Q
 ;
GETVST ; [Procedure] Return list of visits
 N BEG,END,VAERR,VASD,BDT,DTM,EDT,LOC,NOW,MDQUERY,MDLST,STI,STS,TODAY,I,J,K,XI,XE,X
 S NOW=$$NOW^XLFDT(),TODAY=$P(NOW,".",1)
 S BEG=$$X2FM("T-200"),END=$$X2FM("T")+0.2359
 S MDLST="",MDSTOP=""
 I END>NOW D   ; get future encounters, past cancels/no-shows from VADPT
 .S VASD("F")=BEG
 .S VASD("T")=END
 .S VASD("W")="123456789"
 .D SDA^VADPT
 .S I=0 F  S I=$O(^UTILITY("VASD",$J,I)) Q:'I  D
 ..S XI=^UTILITY("VASD",$J,I,"I"),XE=^("E")
 ..S DTM=$P(XI,U),IEN=$P(XI,U,2),STI=$P(XI,U,3)
 ..S LOC=$P(XE,U,2),STS=$P(XE,U,3)
 ..I DTM<TODAY,(STI=""!(STI["I")!(STI="NT")) Q  ; no prior kept appts
 ..S MDLST(DTM,"A",1)="A;"_DTM_";"_IEN_U_DTM_U_LOC_U_STS
 .K ^UTILITY("VASD",$J)
 I BEG'>NOW D  ;past encounters from ACRP Toolkit - set in CALLBACK
 .S BDT=BEG
 .S EDT=$S(END<NOW:END,1:NOW)
 .D OPEN^SDQ(.MDQUERY)
 .I '$$ERRCHK^SDQUT() D INDEX^SDQ(.MDQUERY,"PATIENT/DATE","SET")
 .I '$$ERRCHK^SDQUT() D PAT^SDQ(.MDQUERY,DFN,"SET")
 .I '$$ERRCHK^SDQUT() D DATE^SDQ(.MDQUERY,BDT,EDT,"SET")
 .I '$$ERRCHK^SDQUT() D
 ..D SCANCB^SDQ(.MDQUERY,"D CALLBACK^ORWCV(Y,Y0,$NA(MDLST),.MDSTOP)","SET")
 .I '$$ERRCHK^SDQUT() D ACTIVE^SDQ(.MDQUERY,"TRUE","SET")
 .I '$$ERRCHK^SDQUT() D SCAN^SDQ(.MDQUERY,"FORWARD")
 .D CLOSE^SDQ(.MDQUERY)
 N TIM,MOV,MDX0,Y,MTIM,XTYP,XLOC,XLOCI,HLOC,EARLY,DONE ; admits
 S EARLY=BEG,DONE=0
 S TIM="" F  S TIM=$O(^DGPM("ATID1",DFN,TIM)) Q:TIM'>0  D  Q:DONE
 .S MOV=0  F  S MOV=$O(^DGPM("ATID1",DFN,TIM,MOV)) Q:MOV'>0  D  Q:DONE
 ..D GETS^DIQ(405,+MOV_",","*","IE","MDX0") S MTIM=$G(MDX0(405,MOV_",",".01","I"))
 ..S XTYP=$G(MDX0(405,+MOV_",",".04","E"))
 ..S XLOC=$G(MDX0(405,+MOV_",",".06","E"))
 ..S XLOCI=+$G(MDX0(405,+MOV_",",".06","I")),HLOC=+$G(^DIC(42,+XLOCI,44))
 ..S MDLST(MTIM,"I",1)="I;"_MTIM_";"_HLOC_U_MTIM_U_"Inpatient Stay"_U_XLOC_U_XTYP
 ..S DONE=1  ; Not sure if I should include all stays <DRP@Hines>
 S I=0 F  S I=$O(MDLST(I)) Q:'I  D
 .S J="" F  S J=$O(MDLST(I,J)) Q:J=""  D
 ..S K=0 F  S K=$O(MDLST(I,J,K)) Q:'K  D
 ...S @RESULTS@($O(@RESULTS@(""),-1)+1)=MDLST(I,J,K)
 S @RESULTS@(0)=+$O(@RESULTS@(""),-1)_U_($$GET1^DIQ(2,DFN_",",.1)]"")
 Q
 ;
LOGSEC ; [Procedure] Log Security
 D NOTICE^DGSEC4(.RESULTS,DFN,DATA,1)
 S @RESULTS@(0)=$S(RESULTS:"1^Logged",1:"-1^Unable to log")
 Q
 ;
RPC(RESULTS,OPTION,DFN,DATA) ; [Procedure] Main RPC call tag
 NEW DFNIENS,GMRAL,GMVALG,GN,IENS,MDDFN,MDERR,MDFDA,MDFLD,MDHL7,MDID,MDIDS,MDIEN,MDIENS,MDRET,MDX,MDY,VA,VADM,VAERR,VAIN,Z
 S RESULTS=$NA(^TMP($J)) K @RESULTS
 D:$T(@OPTION)]"" @OPTION
 D:'$D(@RESULTS) BADRPC^MDRPCU("MD TMDPATIENT","MDRPCOP",OPTION)
 D CLEAN^DILF
 Q
 ;
SELECT ; [Procedure] Select patient
 I '$D(^DPT(+$G(DFN),0))#2 S @RESULTS@(0)="-1^No such patient" Q
 S @RESULTS@(0)="1^Required Identifiers & messages"
 S IENS=DFN_","
 D FILE^DID(2,,"REQUIRED IDENTIFIERS","MDIDS")
 F MDX=0:0 S MDX=$O(MDIDS("REQUIRED IDENTIFIERS",MDX)) Q:'MDX  D
 .S MDFLD=MDIDS("REQUIRED IDENTIFIERS",MDX,"FIELD")
 .S MDID="$$PTID^"_$$GET1^DID(2,MDFLD,"","LABEL")
 .S MDID=MDID_U_$$GET1^DIQ(2,IENS,MDFLD)
 .D:MDFLD=.03
 ..S MDID=MDID_" ("_$$GET1^DIQ(2,IENS,.033)_")"
 ..S MDID=MDID_U_$$DOB^DPTLK1(+IENS)
 .D:MDFLD=.09
 ..S X=$P(MDID,U,3),X=$E(X,1,3)_"-"_$E(X,4,5)_"-"_$E(X,6,10)
 ..S $P(MDID,U,3)=X,$P(MDID,U,4)=$$SSN^DPTLK1(+IENS)
 .S @RESULTS@($O(@RESULTS@(""),-1)+1)=MDID
 S MDID="$$PTID^"_$$GET1^DID(2,.1,"","LABEL")
 S MDID=MDID_U_$$GET1^DIQ(2,IENS,.1)
 S @RESULTS@($O(@RESULTS@(""),-1)+1)=MDID
 S MDID="$$PTID^"_$$GET1^DID(2,.101,"","LABEL")
 S MDID=MDID_U_$$GET1^DIQ(2,IENS,.101)
 S @RESULTS@($O(@RESULTS@(""),-1)+1)=MDID
 K MDRET
 D GUIBS5A^DPTLK6(.MDRET,DFN) D:MDRET(1)=1
 .D ADD("$$MSGHDR^2^SAME LAST NAME AND LAST 4")
 .S MDX=1
 .F  S MDX=$O(MDRET(MDX)) Q:'MDX!(+$G(MDRET(MDX)))  D
 ..D ADD($P(MDRET(MDX),U,2))
 .D ADD(" ")
 .S MDX=1
 .F  S MDX=$O(MDRET(MDX)) Q:'MDX  D:+MDRET(MDX)
 ..S MDDFN=+$P(MDRET(MDX),U,2)
 ..D ADD($$GET1^DIQ(2,MDDFN_",",.01)_"    "_$$DOB^DPTLK1(MDDFN)_"    "_$$SSN^DPTLK1(MDDFN))
 .D ADD(" ")
 .D ADD("Please review carefully before continuing")
 .D ADD("$$MSGEND")
 K MDRET
 D PTSEC^DGSEC4(.MDRET,DFN) D:MDRET(1)'=0
 .D:MDRET(1)=3
 ..D ADD("$$MSGHDR^0^CAN'T ACCESS YOUR OWN RECORD!!")
 .D:MDRET(1)=-1
 ..D ADD("$$MSGHDR^0^INCOMPLETE INFORMATION - CAN'T PROCEED")
 .D:MDRET(1)=1
 ..D ADD("$$MSGHDR^1^SENSITIVE RECORD ACCESS")
 .D:MDRET(1)'=-1&(MDRET(1)'=3)&(MDRET(1)'=1)
 ..D ADD("$$MSGHDR^3^SENSITIVE RECORD ACCESS")
 .S MDX=1
 .F  S MDX=$O(MDRET(MDX)) Q:'MDX  D ADD($TR(MDRET(MDX),"*"," "))
 .D ADD("$$MSGEND")
 D GUIMTD^DPTLK6(.MDRET,DFN) D:MDRET(1)=1
 .D ADD("$$MSGHDR^1^NOTICE")
 .F MDX=1:0 S MDX=$O(MDRET(MDX)) Q:'MDX  D ADD(MDRET(MDX))
 .D ADD("$$MSGEND")
 Q
 ;
X2FM(X) ; [Function] return FM date given relative date
 N %DT S %DT="TS" D ^%DT
 Q Y
 ;
