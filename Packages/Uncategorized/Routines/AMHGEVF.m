AMHGEVF ; IHS/CMI/MAW - AMH GUI Visit Form Data Edits (frmVisitDataEntry) 2/13/2009 8:54:11 AM ;
 ;;4.0;IHS BEHAVIORAL HEALTH;**1**;JUN 18, 2010;Build 8
 ;
 ;
 ;
 Q
 ;
ADDPOV(PI,P,R,PN) ;EP -- add a pov
 N AMHFDA,AMHIENS,AMHERRR,AMHPIEN
 S APCDOVRR=1
 S AMHIENS="+1,"
 S AMHFDA(9002011.01,AMHIENS,.01)=PI
 S AMHFDA(9002011.01,AMHIENS,.02)=P
 S AMHFDA(9002011.01,AMHIENS,.03)=R
 S AMHFDA(9002011.01,AMHIENS,.04)=PN
 D UPDATE^DIE("","AMHFDA","AMHIENS","AMHERRR(1)")
 I $D(AMHERRR) S AMHER="0~Add Axis II"
 S AMHPIEN=$G(AMHIENS(1))
 Q
 ;
EDITPOV(REC,PN) ;EP -- edit a pov
 N AMHFDA,AMHIENS,AMHERRR,AMHPIEN
 S APCDOVRR=1
 S AMHIENS=REC_","
 S AMHFDA(9002011.01,AMHIENS,.04)=PN
 D FILE^DIE("K","AMHFDA","AMHERRR(1)")
 I $D(AMHERRR) S AMHER="0~Edit Axis II"
 I '$D(AMHERRR(1)) S AMHPIEN=REC
 Q
 ;
DELPOV(REC,A2) ;EP -- check to see if any POV records were deleted during edit
 N ADA,R,A
 S R="~"
 S ADA=0 F  S ADA=$O(A2(ADA)) Q:'ADA  D
 . N A2IEN
 . S A2IEN=$P(A2(ADA),R)
 . S A(A2IEN)=A2IEN
 N IEN
 S IEN=0 F  S IEN=$O(^AMHRPRO("AD",REC,IEN)) Q:'IEN  D
 . N POVI
 . S POVI=$P(^AMHRPRO(IEN,0),U)
 . I '$G(A(POVI)) D
 .. S DIK="^AMHRPRO(",DA=IEN D ^DIK
 Q
 ;
ADDAXIS4(PI,P,R,PN) ;EP -- add axis 4
 N AMHFDA,AMHIENS,AMHERRR,AMHAIEN
 S AMHIENS="+2,"_R_","
 S AMHFDA(9002011.06101,AMHIENS,.01)=PI
 D UPDATE^DIE("","AMHFDA","AMHIENS","AMHERRR(1)")
 I $D(AMHERRR) S AMHER="0~Add Axis IV"
 I '$D(AMHERRR) S AMHAIEN=$G(AMHIENS(1))
 Q
 ;
EDAXIS4(REC,A4) ;EP -- check to see if any axis 4 records were deleted during edit
 D CLNA4(REC)
 N ADA,R,A
 S R="~"
 S ADA=0 F  S ADA=$O(A4(ADA)) Q:'ADA  D
 . N A4IEN
 . S A4IEN=$P(A4(ADA),R)
 . S A(A4IEN)=A4IEN
 N IEN
 S IEN=0 F  S IEN=$O(^AMHREC(REC,61,IEN)) Q:'IEN  D
 . N AXIS4
 . S AXIS4=$P(^AMHREC(REC,61,IEN,0),U)
 . I '$G(A(AXIS4)) D
 .. S DA(1)=REC,DA=IEN,DIK="^AMHREC("_DA(1)_",61," D ^DIK
 Q
 ;
CLNA4(RC) ;EP -- clean axis 4 and repopulate
 N IEN
 S IEN=0 F  S IEN=$O(^AMHREC(RC,61,IEN)) Q:'IEN  D
 . S DA(1)=RC,DA=IEN,DIK="^AMHREC("_DA(1)_",61," D ^DIK
 Q
 ;
MODV(AMHIEN,DM,REC,PP,PRO,CLN,TOC,ARR,EDT,LOC,AW,COM,P,GN,TIG,ATG) ;EP -- add/update MHSS RECORD entry
 N AMHFDA,AMHIENS,AMHERRR
 I DM="E",REC="" S DM="A"
 S AMHIENS=$S(DM="A":"+1,",1:REC_",")
 S AMHFDA(9002011,AMHIENS,.01)=EDT
 S AMHFDA(9002011,AMHIENS,.02)=PRO
 S AMHFDA(9002011,AMHIENS,.25)=CLN
 S AMHFDA(9002011,AMHIENS,.07)=TOC
 S AMHFDA(9002011,AMHIENS,.04)=LOC
 S AMHFDA(9002011,AMHIENS,.11)=AW
 S AMHFDA(9002011,AMHIENS,.05)=COM
 S AMHFDA(9002011,AMHIENS,.19)=DUZ
 S AMHFDA(9002011,AMHIENS,.33)="R"
 I $G(GN)]"" D
 . S AMHFDA(9002011,AMHIENS,.12)=$G(ATG)  ;activity time/pts
 . S AMHFDA(9002011,AMHIENS,.34)=1
 . S AMHFDA(9002011,AMHIENS,1109)=GN
 . S AMHFDA(9002011,AMHIENS,1104)=TIG
 I DM="A" D  Q
 . ;S AMHFDA(9002011,AMHIENS,.01)=EDT
 . S AMHFDA(9002011,AMHIENS,.03)=DT
 . S AMHFDA(9002011,AMHIENS,.08)=P
 . ;S AMHFDA(9002011,AMHIENS,.17)="A"
 . S AMHFDA(9002011,AMHIENS,.19)=DUZ
 . S AMHFDA(9002011,AMHIENS,.22)="A"
 . S AMHFDA(9002011,AMHIENS,1111)=1
 . S AMHFDA(9002011.5101,"+2,"_AMHIENS,.01)=$$NOW^XLFDT
 . S AMHFDA(9002011.5101,"+2,"_AMHIENS,.02)=DUZ
 . D UPDATE^DIE("","AMHFDA","AMHIENS","AMHERRR(1)")
 . I $D(AMHERRR) S AMHER="0~Add Visit"
 . S AMHIEN=+$G(AMHIENS(1))
 . D MODPRV(PP,DM,AMHIEN,P,"P")
 I DM="E" D  Q
 . S AMHIENS(1)=REC
 . ;S AMHFDA(9002011,AMHIENS,.17)="E"
 . S AMHFDA(9002011,AMHIENS,.21)=DT
 . S AMHFDA(9002011,AMHIENS,.22)="M"
 . S AMHFDA(9002011,AMHIENS,.28)=DUZ
 . D FILE^DIE("K","AMHFDA","AMHERRR(1)")
 . I $D(AMHERRR) S AMHER="0~Edit Visit"
 . S AMHIEN=REC
 . D MODPRV(PP,DM,AMHIEN,P,"P")
 . D VAUD(REC)  ;update the audit log
 Q
 ;
MODPRV(P,D,R,PAT,TYP) ;EP -- modify the provider based on data mode
 N AMHFDA,AMHIENS,AMHERRR,AMHPIEN
 Q:$$FNDPRV^AMHGU(R,TYP,P)
 S AMHIENS="+1,"
 S AMHFDA(9002011.02,AMHIENS,.01)=P
 S AMHFDA(9002011.02,AMHIENS,.02)=PAT
 S AMHFDA(9002011.02,AMHIENS,.03)=R
 S AMHFDA(9002011.02,AMHIENS,.04)=TYP
 D UPDATE^DIE("","AMHFDA","AMHIENS","AMHERRR(1)")
 I $D(AMHERRR) S AMHER="0~Add "_$G(TYP)_" Provider"
 S AMHPIEN=$G(AMHIENS(1))
 Q
 ;
DELPRV(REC,PRV,TYP) ;EP -- delete a provider
 N ADA,R,P
 S R="~"
 S ADA=0 F  S ADA=$O(PRV(ADA)) Q:'ADA  D
 . N PRVIEN
 . S PRVIEN=$P(PRV(ADA),R)
 . S P(PRVIEN)=PRVIEN
 N IEN
 S IEN=0 F  S IEN=$O(^AMHRPROV("AD",REC,IEN)) Q:'IEN  D
 . N PRVI
 . S PRVI=$P(^AMHRPROV(IEN,0),U)
 . S PTYP=$P(^AMHRPROV(IEN,0),U,4)
 . I '$G(P(PRVI)) D
 .. Q:PTYP'=TYP
 .. S DIK="^AMHRPROV(",DA=IEN D ^DIK
 Q
 ;
VAUD(RC) ;EP -- update the audit log
 N AMHFDA,AMHIENS,AMHERRR
 S AMHIENS=""
 S AMHFDA(9002011,RC_",",.21)=DT
 S AMHFDA(9002011,RC_",",.28)=DUZ
 S AMHFDA(9002011.5101,"+2,"_RC_",",.01)=$$NOW^XLFDT
 S AMHFDA(9002011.5101,"+2,"_RC_",",.02)=DUZ
 D UPDATE^DIE("","AMHFDA","AMHIENS","AMHERRR(1)")
 Q
 ;
ACT(AMHIEN,DM,REC,ACT,VF,AT,IU,LSS,NS,P) ;EP -- file activity
 N AMHFDA,AMHIENS,AMHERRR
 S AMHIENS=REC_","
 S AMHFDA(9002011,AMHIENS,.06)=ACT
 S AMHFDA(9002011,AMHIENS,.27)=VF
 S AMHFDA(9002011,AMHIENS,.12)=AT
 S AMHFDA(9002011,AMHIENS,.15)=IU
 S AMHFDA(9002011,AMHIENS,.31)=LSS
 S AMHFDA(9002011,AMHIENS,.09)=NS
 S AMHIENS(1)=REC
 D FILE^DIE("K","AMHFDA","AMHERRR(1)")
 I $D(AMHERRR) S AMHER="0~Add Activity"
 S AMHIEN=REC
 Q
 ;
MODCPT(CI,P,R) ;EP -- add a cpt
 Q:$$FNDCPT^AMHGU(R,CI)
 N AMHFDA,AMHIENS,AMHERRR,AMHPIEN
 S AMHIENS="+1,"
 S AMHFDA(9002011.04,AMHIENS,.01)=CI
 S AMHFDA(9002011.04,AMHIENS,.02)=P
 S AMHFDA(9002011.04,AMHIENS,.03)=R
 D UPDATE^DIE("","AMHFDA","AMHIENS","AMHERRR(1)")
 I $D(AMHERRR) S AMHER="0~Add Activity CPT"
 S AMHPIEN=$G(AMHIENS(1))
 Q
 ;
DELCPT(REC,CP) ;EP -- check to see if any cpt records were deleted during edit
 N ADA,R,C
 S R="~"
 S ADA=0 F  S ADA=$O(CP(ADA)) Q:'ADA  D
 . N CPIEN
 . S CPIEN=$P(CP(ADA),R)
 . S C(CPIEN)=CPIEN
 N IEN
 S IEN=0 F  S IEN=$O(^AMHRPROC("AD",REC,IEN)) Q:'IEN  D
 . N CPTI
 . S CPTI=$P(^AMHRPROC(IEN,0),U)
 . I '$G(C(CPTI)) D
 .. S DIK="^AMHRPROC(",DA=IEN D ^DIK
 Q
 ;
CCPD(D,RC,CC,PD,PLN,P) ;EP -- file the chief complaint
 N AMHFDA,AMHIENS,AMHERRR
 S AMHIENS=RC_","
 S AMHFDA(9002011,AMHIENS,2101)=CC
 S AMHFDA(9002011,AMHIENS,.17)=PD
 S AMHFDA(9002011,AMHIENS,.18)=PLN
 D FILE^DIE("","AMHFDA","AMHERRR(1)")
 I $D(AMHERRR) S AMHER="0~Update Chief Complaint"
 Q
 ;
PN(D,RC,PN,P) ;EP -- file the progress notes
 ;Q:$G(PN)=""
 ;D CLNWP^AMHGUA(9002011,31,RC)
 N AMHWP
 D ARRAYT^AMHGU(.AMHWP,PN)  ;parse the text into an array
 N AMHFDA,AMHIENS,AMHERRR
 S AMHIENS=RC_","
 D WP^AMHGU(.AMHERRR,9002011,AMHIENS,3101,.AMHWP)
 Q
 ;
CMT(D,RC,CMT,P) ;EP -- file the comment next appointment
 ;Q:$G(CMT)=""
 N AMHWP
 D ARRAYT^AMHGU(.AMHWP,CMT)  ;parse the text into an array
 N AMHFDA,AMHIENS,AMHERRR
 S AMHIENS=RC_","
 D WP^AMHGU(.AMHERRR,9002011,AMHIENS,8101,.AMHWP)
 Q
 ;
RX(D,RC,RX,P) ;EP -- file the rx entry
 ;Q:$G(RX)=""
 N AMHWP
 D ARRAYT^AMHGU(.AMHWP,RX)  ;parse the text into an array
 N AMHFDA,AMHIENS,AMHERRR
 S AMHIENS=RC_","
 D WP^AMHGU(.AMHERRR,9002011,AMHIENS,4101,.AMHWP)
 Q
 ;
MODEDU(D,RC,P,ED,TS,L,CM,CP,ST,G,I,REA,PRV) ;EP -- file the education topics
 N EDREC
 S EDREC=$$FNDEDU^AMHGU(RC,ED)
 N AMHFDA,AMHIENS,AMHERRR
 S AMHIENS=$S($G(EDREC):EDREC_",",1:"+1,")
 S AMHFDA(9002011.05,AMHIENS,.04)=PRV
 S AMHFDA(9002011.05,AMHIENS,.05)=I
 S AMHFDA(9002011.05,AMHIENS,.06)=TS
 S AMHFDA(9002011.05,AMHIENS,.07)=CP
 S AMHFDA(9002011.05,AMHIENS,.08)=L
 S AMHFDA(9002011.05,AMHIENS,.09)=G
 S AMHFDA(9002011.05,AMHIENS,.11)=ST
 S AMHFDA(9002011.05,AMHIENS,1101)=CM
 S AMHFDA(9002011.05,AMHIENS,1102)=REA
 I $G(EDREC),+$G(TS)=0 D  Q
 . S DIK="^AMHREDU(",DA=EDREC D ^DIK
 I $G(EDREC) D  Q
 . S AMHIENS=EDREC_","
 . D FILE^DIE("K","AMHFDA","AMHERRR")
 . I $D(AMHERRR) S AMHER="0~Edit Education Topic"
 S AMHFDA(9002011.05,AMHIENS,.01)=ED
 S AMHFDA(9002011.05,AMHIENS,.02)=P
 S AMHFDA(9002011.05,AMHIENS,.03)=RC
 D UPDATE^DIE("","AMHFDA","AMHIENS","AMHERRR(1)")
 I $D(AMHERRR) S AMHER="0~Add Education Topic"
 Q
 ;
DELEDU(REC,ED) ;EP -- delete an education topic if removed from the client side
 N ADA,R,E
 S R="~"
 S ADA=0 F  S ADA=$O(ED(ADA)) Q:'ADA  D
 . N EDIEN,EDE
 . S EDE=$P(ED(ADA),R)
 . S EDIEN=$O(^AUTTEDT("B",EDE,0))
 . S E(EDIEN)=EDIEN
 N IEN
 S IEN=0 F  S IEN=$O(^AMHREDU("AD",REC,IEN)) Q:'IEN  D
 . N EDUI
 . S EDUI=$P(^AMHREDU(IEN,0),U)
 . I '$G(E(EDUI)) D
 .. S DIK="^AMHREDU(",DA=IEN D ^DIK
 Q
 ;
MODHF(D,RC,P,HF,LS,Q,CM) ;EP -- file the health factors
 N HFREC
 S HFREC=$$FNDHF^AMHGU(RC,HF)
 N AMHFDA,AMHIENS,AMHERRR
 S AMHIENS=$S($G(HFREC):HFREC_",",1:"+1,")
 S AMHFDA(9002011.08,AMHIENS,.04)=LS
 S AMHFDA(9002011.08,AMHIENS,.05)=DUZ
 S AMHFDA(9002011.08,AMHIENS,.06)=QTY
 S AMHFDA(9002011.08,AMHIENS,81101)=CMT
 I $G(HFREC) D  Q
 . S AMHIENS=HFREC_","
 . D FILE^DIE("K","AMHFDA","AMHERRR")
 . I $D(AMHERRR) S AMHER="0~Edit Health Factor"
 S AMHFDA(9002011.08,AMHIENS,.01)=HF
 S AMHFDA(9002011.08,AMHIENS,.02)=P
 S AMHFDA(9002011.08,AMHIENS,.03)=RC
 D UPDATE^DIE("","AMHFDA","AMHIENS","AMHERRR(1)")
 I $D(AMHERRR) S AMHER="0~Add Health Factor"
 Q
 ;
DELHF(REC,HF) ;EP -- delete a health factor if removed from the client side
 N ADA,R,H
 S R="~"
 S ADA=0 F  S ADA=$O(HF(ADA)) Q:'ADA  D
 . N HFIEN,HFE
 . S HFE=$P(HF(ADA),R)
 . S HFIEN=$O(^AUTTHF("B",HFE,0))
 . S H(HFIEN)=HFIEN
 N IEN
 S IEN=0 F  S IEN=$O(^AMHRHF("AD",REC,IEN)) Q:'IEN  D
 . N HFI
 . S HFI=$P(^AMHRHF(IEN,0),U)
 . I '$G(H(HFI)) D
 .. S DIK="^AMHRHF(",DA=IEN D ^DIK
 Q
 ;
SCREEN(D,RC,P,PP,A,AC,DP,DPC,IP,IPC,APRV,DPRV,IPRV) ;EP -- file screening
 N AMHFDA,AMHIENS,AMHERRR
 S AMHIENS=RC_","
 ;I $G(IP)]"" D
 S AMHFDA(9002011,AMHIENS,1401)=IP
 S AMHFDA(9002011,AMHIENS,1402)=IPRV
 ;I $G(A)]"" D
 S AMHFDA(9002011,AMHIENS,1403)=A
 S AMHFDA(9002011,AMHIENS,1404)=APRV
 ;I $G(DP)]"" D
 S AMHFDA(9002011,AMHIENS,1405)=DP
 S AMHFDA(9002011,AMHIENS,1406)=DPRV
 S AMHFDA(9002011,AMHIENS,1601)=AC
 S AMHFDA(9002011,AMHIENS,1701)=DPC
 S AMHFDA(9002011,AMHIENS,1501)=IPC
 D FILE^DIE("K","AMHFDA","AMHERRR(1)")
 I $D(AMHERRR) S AMHER="0~Edit Screening"
 Q
 ;
MODMSR(D,RC,P,MS,V,PR) ;EP -- file the measurements
 N MSRREC
 S MSRREC=$$FNDMSR^AMHGU(RC,MS)
 N AMHFDA,AMHIENS,AMHERRR
 S AMHIENS=$S($G(MSRREC):MSRREC_",",1:"+1,")
 S AMHFDA(9002011.12,AMHIENS,.04)=V
 S AMHFDA(9002011.12,AMHIENS,1204)=PR
 I $G(MSRREC) D  Q
 . S AMHIENS=MSRREC_","
 . D FILE^DIE("K","AMHFDA","AMHERRR")
 . I $D(AMHERRR) S AMHER="0~Edit Measurement"
 S AMHFDA(9002011.12,AMHIENS,.01)=MS
 S AMHFDA(9002011.12,AMHIENS,.02)=P
 S AMHFDA(9002011.12,AMHIENS,.03)=RC
 D UPDATE^DIE("","AMHFDA","AMHIENS","AMHERRR(1)")
 I $D(AMHERRR) S AMHER="0~Add Measurement"
 Q
 ;
DELMSR(REC,MSR) ;EP -- delete a measurement if removed from the client side
 N ADA,R,M
 S R="~"
 S ADA=0 F  S ADA=$O(MSR(ADA)) Q:'ADA  D
 . N MSRIEN,MSRE
 . S MSRE=$P(MSR(ADA),R)
 . S MSRIEN=$O(^AUTTMSR("B",MSRE,0))
 . S M(MSRIEN)=MSRIEN
 N IEN
 S IEN=0 F  S IEN=$O(^AMHRMSR("AD",REC,IEN)) Q:'IEN  D
 . N MSRI
 . S MSRI=$P(^AMHRMSR(IEN,0),U)
 . I '$G(M(MSRI)) D
 .. S DIK="^AMHRMSR(",DA=IEN D ^DIK
 Q
 ;
ASS(D,RC,A,P,IT,PP,PRG,EDT) ;EP -- file assessment
 ;Q:$G(A)=""
 I $G(D)="A",$G(A)="" Q
 ;I '$O(^AMHRINTK("AD",RC,0)),$G(A)="" Q
 N AMHWP
 D ARRAYT^AMHGU(.AMHWP,A)  ;parse the text into an array
 N AMHFDA,AMHIENS,AMHERRR,AMHIT
 S AMHIENS=""
 ;S AMHIENS(1)=P
 I $G(IT) D
 . S AMHIENS=IT_","
 . S AMHIT=IT
 . S AMHFDA(9002011.13,AMHIENS,.06)=PP
 . S AMHFDA(9002011.13,AMHIENS,.07)=DT
 . D FILE^DIE("K","AMHFDA","AMHERRR(1)")
 . Q:$O(^AMHRINTK(IT,11,RC,"B",0))
 . N AMHFDA,AMHIENS,AMHERRR
 . S AMHIENS="+2,"_IT_","
 . S AMHFDA(9002011.1311,AMHIENS,.01)=RC
 . I '$D(^AMHRINTK(IT,11)) S AMHFDA(9002011.1311,AMHIENS,.02)=1
 . D UPDATE^DIE("","AMHFDA","AMHIENS","AMHERRR(1)")
 . I $D(AMHERRR) S AMHER="0~Edit Assessment"
 I '$G(IT) D
 . S AMHFDA(9002011.13,"+1,",.01)=EDT
 . S AMHFDA(9002011.13,"+1,",.02)=P
 . S AMHFDA(9002011.13,"+1,",.03)=RC
 . S AMHFDA(9002011.13,"+1,",.04)=PP
 . S AMHFDA(9002011.13,"+1,",.05)=PRG
 . S AMHFDA(9002011.13,"+1,",.06)=PP
 . S AMHFDA(9002011.13,"+1,",.07)=DT
 . S AMHFDA(9002011.13,"+1,",.09)="I"
 . D UPDATE^DIE("","AMHFDA","AMHIENS","AMHERRR(1)")
 . I $D(AMHERRR) S AMHER="0~Add Assessment" Q
 . S AMHIT=$G(AMHIENS(1))
 . N AMHVFDA,AMHVIENS,AMHVERR,AMHVRS
 . S AMHVIENS="+2,+1,"
 . S AMHVFDA(9002011.1311,"+2,"_AMHIT_",",.01)=RC
 . S AMHVFDA(9002011.1311,"+2,"_AMHIT_",",.02)=1
 . D UPDATE^DIE("","AMHVFDA","AMHVIENS","AMHVERR")
 . S AMHVRS=$G(AMHVIENS(2))
 N AMHFDA,AMHIENS,AMHERRR
 S AMHIENS=AMHIT_","
 D WP^AMHGU(.AMHERRR,9002011.13,AMHIENS,4100,.AMHWP)
 Q
 ;
CD(D,RC,P,CDC,CDT,TOC,DRT,DIA) ;EP -- file CD data
 N AMHFDA,AMHIENS,AMHERRR
 S AMHIENS=RC_","
 S AMHFDA(9002011,AMHIENS,1101)=CDC
 S AMHFDA(9002011,AMHIENS,1105)=CDT
 S AMHFDA(9002011,AMHIENS,.32)=TOC
 S AMHFDA(9002011,AMHIENS,1102)=DRT
 S AMHFDA(9002011,AMHIENS,1103)=DIA
 D FILE^DIE("K","AMHFDA","AMHERRR(1)")
 I $D(AMHERRR) S AMHER="0~Edit CD Data"
 Q
 ;