MAGQE3 ;WOIFO/RMP - Support for MAG Enterprise ; 05/06/2004  06:32
 ;;3.0;IMAGING;**27,29,30**;16-September-2004
 ;; +---------------------------------------------------------------+
 ;; | Property of the US Government.                                |
 ;; | No permission to copy or redistribute this software is given. |
 ;; | Use of unreleased versions of this software requires the user |
 ;; | to execute a written test agreement with the VistA Imaging    |
 ;; | Development Office of the Department of Veterans Affairs,     |
 ;; | telephone (301) 734-0100.                                     |
 ;; |                                                               |
 ;; | The Food and Drug Administration classifies this software as  |
 ;; | a medical device.  As such, it may not be changed in any way. |
 ;; | Modifications to this software may result in an adulterated   |
 ;; | medical device under 21CFR820, the use of which is considered |
 ;; | to be a violation of US Federal Statutes.                     |
 ;; +---------------------------------------------------------------+
 ;;
 Q
 ;
COUNT(SDATE,EDATE,INST) ;
 N CLIN,CONSENTS,CPTR,D0,DAT,DELETED,DICOM,DOC,DOCGRP,DOCUMENT,ED0,GRPPRNT,I,IMAGE,IMPORT,NAME,NODE,OTHER,PCE,PROC,SD0,TRK
 S SD0=$$SDATE^MAGQE1(SDATE,"F")
 S ED0=$$SDATE^MAGQE1(EDATE,"R")
 D MSG^MAGQE2(" From, FileMan Date="""_SDATE_""", D0="""_SD0_""".")
 D MSG^MAGQE2("Until, FileMan Date="""_EDATE_""", D0="""_ED0_""".")
 S D0="" F  S D0=$O(^MAG(2005.02,"B","DOCUMENT",D0)) Q:D0=""  D
 . S:$G(^MAG(2005.02,D0,4))["TIF" DOC(D0)=""
 . Q
 S (CONSENTS,GRPPRNT,IMAGE,DELETED,DOCGRP,DOCUMENT)=0
 S CPTR=$O(^MAG(2005.83,"B","CONSENT",""))
 S D0=SD0 F  S D0=$O(^MAG(2005,D0)) Q:'D0  Q:D0'<ED0  D
 . S X=$P($G(^MAG(2005,D0,2)),"^",1) Q:'X  Q:X<SDATE  Q:X>EDATE
 . S NODE=$G(^MAG(2005,D0,100)),TRK=""
 . S PCE=$P(NODE,"^",3) I PCE Q:PCE'=INST
 . S PCE=$P(NODE,"^",5) I PCE'="" S TRK=$P(TRK,";",1) S:TRK="" TRK="?"
 . S NODE=$G(^MAG(2005,D0,0))
 . I $P(NODE,"^",2)="" D  Q
 . . S GRPPRNT=GRPPRNT+1
 . . S PCE=$P(NODE,"^",8) S:PCE="" PCE="NIL"
 . . S:$D(^MAG(2005,D0,"PACS")) DICOM(PCE,0)=$G(DICOM(PCE,0))+1
 . . S PCE=$P(NODE,"^",6) I PCE,$D(DOC(PCE)) S DOCGRP=DOCGRP+1
 . . S:TRK'="" IMPORT(TRK,0)=$G(IMPORT(TRK,0))+1
 . . Q
 . S:TRK'="" IMPORT(TRK)=$G(IMPORT(TRK))+1
 . I CPTR,$P($G(^MAG(2005,D0,40)),"^",3)=CPTR S CONSENTS=CONSENTS+1
 . E  S PCE=$$UPPER^MAGQE4($P($G(^MAG(2005,D0,2)),"^",4)) S:PCE["CONSENT" OTHER(PCE)=$G(OTHER(PCE))+1
 . S IMAGE=IMAGE+1
 . S PCE=$P(NODE,"^",6) I PCE,$D(DOC(PCE)) S DOCUMENT=DOCUMENT+1
 . S PCE=$P(NODE,"^",7) S:PCE="" PCE="NIL"
 . S ^TMP($J,"MAGQ","ACQPAT",PCE)=""
 . S ^TMP($J,"MAGQ","ALLPAT",PCE)=""
 . S PCE=$P(NODE,"^",8) S:PCE="" PCE="NIL"
 . I $D(^MAG(2005,D0,"PACS")) S DICOM(PCE)=$G(DICOM(PCE))+1
 . E  S CLIN(PCE)=$G(CLIN(PCE))+1
 . Q
 S NAME="" F  S NAME=$O(DICOM(NAME)) Q:NAME=""  D
 . D:$E(NAME,1,4)="RAD "
 . . Q:'$D(DICOM(NAME,0))
 . . S I=$E(NAME,5,$L(NAME)) Q:I=""
 . . Q:$D(DICOM(I,0))
 . . S DICOM(I,0)=DICOM(NAME,0) K DICOM(NAME,0)
 . . Q
 . S PROC=$O(^RAMIS(73.1,"B",NAME,"")) Q:'PROC
 . S $P(DICOM(NAME),"^",2)=$P($G(^RAMIS(73.1,PROC,0)),"^",2)
 . Q
 S D0=SD0 F  S D0=$O(^MAG(2005.1,D0)) Q:'D0  Q:D0'<ED0  D
 . S X=$P($G(^MAG(2005.1,D0,2)),"^",1) Q:'X  Q:X<SDATE  Q:X>EDATE
 . S PCE=$P($G(^MAG(2005.1,D0,100)),"^",3) I PCE Q:PCE'=INST
 . S DELETED=DELETED+1
 . Q
 S I="" F  S I=$O(DICOM(I)) Q:I=""  D
 . S X=" DICOM CAPTURE: "_I_"^"_$G(DICOM(I))
 . S:$G(DICOM(I,0)) $P(X,"^",4)=DICOM(I,0)
 . D MSG^MAGQE2(X)
 . Q
 S I="" F  S I=$O(IMPORT(I)) Q:I=""  D
 . S X=" IMPORT API: "_I_"^"_IMPORT(I)
 . S:$G(IMPORT(I,0)) X=X_"^"_IMPORT(I,0)
 . D MSG^MAGQE2(X)
 . Q
 D LLOAD^MAGQE5(.CLIN,"CLIN CAPTURE:")
 D MSG^MAGQE2("CONSENT FORMS: "_CONSENTS)
 D LLOAD^MAGQE5(.OTHER,"OTHER CONSENTS:")
 D MSG^MAGQE2("Image file group parents: "_GRPPRNT)
 D MSG^MAGQE2("Image file objects: "_IMAGE)
 D MSG^MAGQE2("Image file deletes: "_DELETED)
 D MSG^MAGQE2("Document Images (TIF): "_DOCUMENT)
 D MSG^MAGQE2("Document Groups (TIF): "_DOCGRP)
 Q
 ;
ACT(D0,DIS,CAP,VD,VI,RES) ;
 N ACT,AN,AN2,D1,IMG
 S D1=0 F  S D1=$O(^MAG(2006.82,D0,"ACT",D1)) Q:'D1  D
 . S AN=^MAG(2006.82,D0,"ACT",D1,0)
 . S ACT="^"_$P(AN,"^",1)_"^",AN2=+$P(AN,"^",2)
 . Q:"^LOGON^LOGOFF^PAT^"[ACT
 . I "^SC_BAD^SCR_OK^"[ACT D  Q
 . . S AN=$P(AN,"^",10,14) Q:AN=""
 . . S RES(ACT,AN)=$G(RES(ACT,AN))+1
 . . Q
 . I "^CAP^IMG^"[ACT D  Q
 . . S IMG=+$P(AN,"^",3) Q:'IMG  Q:$P($G(^MAG(2005,IMG,0)),"^",2)=""
 . . I ACT="^CAP^" S CAP=CAP+1 Q
 . . S DIS=DIS+1,^TMP($J,"MAGQ","DISPAT",AN2)="",^TMP($J,"MAGQ","ALLPAT",AN2)=""
 . . Q
 . I "^VR-VW^"[ACT D VRAD(.VD,AN) S ^TMP($J,"MAGQ","DISPAT",AN2)="",^TMP($J,"MAGQ","ALLPAT",AN2)="" Q
 . I "^VR-INT^"[ACT D VRAD(.VI,AN) S ^TMP($J,"MAGQ","DISPAT",AN2)="",^TMP($J,"MAGQ","ALLPAT",AN2)="" Q
 . Q
 Q
 ;
VRAD(ARR,AN) ;
 ;ARR=STUDIES^IMAGES^PATIENTS^User Type(Rad/Non-Rad)^Remotes(Remote/Local)^Modalities
 N P,X
 S $P(ARR,"^",1)=$P($G(ARR),"^",1)+1 ; Studies
 S $P(ARR,"^",2)=$P($G(ARR),"^",2)+$P(AN,"^",6) ; Images
 S $P(ARR,"^",3)=$P($G(ARR),"^",3)+$P(AN,"^",7) ; Patients
 S P=$P(ARR,"^",4)
 I +$P(AN,"^",8)=1 S $P(P,"/",1)=$P(P,"/",1)+1
 E  S $P(P,"/",2)=$P(P,"/",2)+1
 S $P(ARR,"^",4)=P ; User Type
 S P=$P(ARR,"^",5)
 I +$P(AN,"^",9)=1 S $P(P,"/",1)=$P(P,"/",1)+1
 E  S $P(P,"/",2)=$P(P,"/",2)+1
 S $P(ARR,"^",5)=P ; Remotes
 S P=$P(AN,"^",4) S:P="" P="unknown"
 S ARR(P)=$G(ARR(P))+1
 S (P,X)="" F  S P=$O(ARR(P)) Q:P=""  S X=X_"/"_P_"="_ARR(P)
 S $P(ARR,"^",6)=X ; Modalities
 Q
 ;
GPACHX() ; Get Package File Install History of Imaging
 N I,LCNT,MSG,PKG,PKT,PV
 S LCNT=0
 F PKG="IMAGING","MAGJ RADIOLOGY" D
 . N J,K,L,PKNAM,VERS
 . S J=$$FIND1^DIC(9.4,",","MX",PKG) Q:'J
 . I PKG="MAGJ RADIOLOGY" D  Q
 . . N TAR
 . . D LIST^DIC(9.49,","_J_",","@;.01;2;3","","","","","","","","TAR","MSG")
 . . Q:$D(MSG("DIERR"))
 . . S L=0 F  S L=$O(TAR("DILIST","ID",L)) Q:'L  D
 . . . S LCNT=LCNT+1
 . . . S PV(LCNT)=PKG_"^P"_$P(TAR("DILIST","ID",L,".01"),"^",1)
 . . . S PV(LCNT)=PV(LCNT)_"^"_$P(TAR("DILIST","ID",L,"2"),"^",1)
 . . . S PV(LCNT)=PV(LCNT)_"^"_$P(TAR("DILIST","ID",L,"3"),"^",1)
 . . . Q
 . . Q
 . K PKT D LIST^DIC(9.49,","_J_",",.01,"","*","","","B","","","PKT","MSG")
 . S VERS="" F  S VERS=$O(PKT("DILIST",2,VERS)) Q:VERS=""  S K=PKT("DILIST",2,VERS) D
 . . K MSG
 . . D LIST^DIC(9.4901,","_K_","_J_",","@;.01;.02;.03","","","","","","","","TAR","MSG")
 . . Q:$D(MSG("DIERR"))
 . . S L=0 F  S L=$O(TAR("DILIST","ID",L)) Q:'L  D
 . . . S LCNT=LCNT+1
 . . . S PV(LCNT)=PKG_"^"_VERS_"P"_$P(TAR("DILIST","ID",L,".01"),"^",1)
 . . . S PV(LCNT)=PV(LCNT)_"^"_$P(TAR("DILIST","ID",L,".02"),"^",1)
 . . . S PV(LCNT)=PV(LCNT)_"^"_$P(TAR("DILIST","ID",L,".03"),"^",1)
 . . . Q
 . . Q
 . Q
 S I="" F  S I=$O(PV(I)) Q:I=""  D
 . D MSG^MAGQE2("IMAGING PACKAGE INSTALLATION HX: "_I_"^"_PV(I))
 . Q
 Q
 ;
ADCNT(SDATE,EDATE,INST) ;
 ; SAC = Scanned, Administrative Closure
 ; SMC = Scanned, Manual Closure
 ; UMC = Unscanned, Manual Closure
 N ARRY,D0,D1,DATE,DATES,DOC,HLOC,SAC,SCR,SMC,STAT,STATA,STATC,TITLE,TIUDA,UMC
 S STATA="^",D0=0 F  S D0=$O(^TIU(8925.6,"B","AMENDED",D0)) Q:'D0  D
 . S STATA=STATA_D0_"^"
 . Q
 S STATC="^",D0=0 F  S D0=$O(^TIU(8925.6,"B","COMPLETED",D0)) Q:'D0  D
 . S STATC=STATC_D0_"^"
 . Q
 S DOC="ADVANCE DIRECTIVE"
 S D0=0 F  S D0=$O(^TIU(8925.1,"B",DOC,D0)) Q:'D0  D
 . Q:$P($G(^TIU(8925.1,D0,0)),"^",4)'="DC"
 . S D1=0 F  S D1=$O(^TIU(8925.1,D0,10,"B",D1)) Q:'D1  D
 . . S TITLE=$P($G(^TIU(8925.1,+D1,0)),"^",1) S:TITLE="" TITLE=" "
 . . S ARRY(TITLE,D1)=""
 . . Q
 . Q
 S SCR="",(SAC,SMC,UMC)=0
 S TITLE="" F  S TITLE=$O(ARRY(TITLE)) Q:TITLE=""  D
 . S D1="" F  S D1=$O(ARRY(TITLE,D1)) Q:D1=""  D
 . . S TIUDA=0 F  S TIUDA=$O(^TIU(8925,"B",D1,TIUDA)) Q:'TIUDA  D
 . . . N MSG,TARGET
 . . . S SCR="" ; INSTITIUTION screen for consolidation sites only.
 . . . D GETS^DIQ(8925,TIUDA,".05;1205;1501;1507;1603;1606;1613","IE","TARGET","MSG")
 . . . Q:$D(MSG("DIERR"))
 . . . I $$CONSOLID^MAGQE5() D  Q:SCR
 . . . . S HLOC=TARGET(8925,TIUDA_",",1205,"I") ; INSTITIUTION screen - dependent upon TIU*1*113
 . . . . I HLOC="" S SCR=1
 . . . . E  I $P($G(^SC(HLOC,0)),"^",4)'=INST S SCR=1
 . . . . Q
 . . . S STAT="^"_TARGET(8925,TIUDA_",",.05,"I")_"^"
 . . . Q:STATA_STATC'[STAT
 . . . I TARGET(8925,TIUDA_",",1613,"I")="S" D  Q
 . . . . Q:TARGET(8925,TIUDA_",",1606,"I")<SDATE
 . . . . Q:$P(TARGET(8925,TIUDA_",",1606,"I"),".")>EDATE
 . . . . S SAC=SAC+1,SAC(TITLE)=$G(SAC(TITLE))+1
 . . . . Q
 . . . I STATC[STAT D  Q
 . . . . S DATE=TARGET(8925,TIUDA_",",1507,"I")
 . . . . S DATE=$S(DATE?1.N:DATE,1:+TARGET(8925,TIUDA_",",1501,"I"))
 . . . . Q:DATE<SDATE
 . . . . Q:$P(DATE,".")>EDATE
 . . . . I $$SCAN(TIUDA) S SMC=SMC+1,SMC(TITLE)=$G(SMC(TITLE))+1 Q
 . . . . S UMC=UMC+1,UMC(TITLE)=$G(UMC(TITLE))+1
 . . . . Q
 . . . I STATA[STAT D  Q
 . . . . Q:TARGET(8925,TIUDA_",",1603,"I")<SDATE
 . . . . Q:$P(TARGET(8925,TIUDA_",",1603,"I"),".")>EDATE
 . . . . I $$SCAN(TIUDA) S SMC=SMC+1,SMC(TITLE)=$G(SMC(TITLE))+1 Q
 . . . . S UMC=UMC+1,UMC(TITLE)=$G(UMC(TITLE))+1
 . . . . Q
 . . . Q
 . . Q
 . Q
 D MSG^MAGQE2(DOC_" SCANNED ADMINISTRATIVE CLOSURE: "_SAC)
 S TITLE="" F  S TITLE=$O(SAC(TITLE)) Q:TITLE=""  D
 . D MSG^MAGQE2(DOC_" - SAC - "_TITLE_": "_SAC(TITLE))
 . Q
 D MSG^MAGQE2(DOC_" UNSCANNED MANUAL CLOSURE: "_UMC)
 S TITLE="" F  S TITLE=$O(UMC(TITLE)) Q:TITLE=""  D
 . D MSG^MAGQE2(DOC_" - UMC - "_TITLE_": "_UMC(TITLE))
 . Q
 D MSG^MAGQE2(DOC_" SCANNED MANUAL CLOSURE: "_SMC)
 S TITLE="" F  S TITLE=$O(SMC(TITLE)) Q:TITLE=""  D
 . D MSG^MAGQE2(DOC_" - SMC - "_TITLE_": "_SMC(TITLE))
 . Q
 Q
 ;
SCAN(IEN) ;
 N LINK
 S LINK=$O(^TIU(8925.91,"B",IEN,"")) Q:'LINK 0
 Q $S($P($G(^TIU(8925.1,LINK,0)),"^",2)?1.N:0,1:1)
 ;
