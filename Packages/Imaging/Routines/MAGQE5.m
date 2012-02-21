MAGQE5 ;WOIFO/RMP - Support for MAG Enterprise ; 05/06/2004  06:32
 ;;3.0;IMAGING;**27,29,8,30**;16-September-2004
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
ISU2 ;
 ; Workstation Session and Patient counts
 N CCNT,D0,DATE,ICNT,M1,M2,PCNT,RES,SCNAD,SCNMN,SCNT,TD,TD1,UNSCN,VD,VI,X1,X2,YR
 S (SCNT,PCNT,ICNT,CCNT)=0
 S (VD,VI)=""
 I '$$CONSOLID() D
 . S DATE="L"_START
 . F  S DATE=$O(^MAG(2006.82,"AC",DATE)) Q:DATE=""  Q:$P(DATE,"L",2)\1>STOP  D
 . . S D0=0 F  S D0=$O(^MAG(2006.82,"AC",DATE,D0)) Q:'D0  D
 . . . Q:'$D(^MAG(2006.82,D0,1))
 . . . S SCNT=SCNT+1
 . . . S PCNT=PCNT+$P($G(^MAG(2006.82,D0,1)),"^",1)
 . . . D ACT^MAGQE3(D0,.ICNT,.CCNT,.VD,.VI,.RES)
 . . . Q
 . . Q
 . Q
 E  D
 . S DATE=START
 . F  S DATE=$O(^MAG(2006.82,"APL",PLACE,DATE)) Q:DATE=""  Q:DATE\1>STOP  D
 . . S D0=0 F  S D0=$O(^MAG(2006.82,"APL",PLACE,DATE,D0)) Q:D0'?1.N  D
 . . . Q:'$D(^MAG(2006.82,D0,1))
 . . . S SCNT=SCNT+1
 . . . S PCNT=PCNT+$P($G(^MAG(2006.82,D0,1)),"^",1)
 . . . D ACT^MAGQE3(D0,.ICNT,.CCNT,.VD,.VI,.RES)
 . . . Q
 . . Q
 . Q
 S X1=START,X2=STOP D ^%DTC S X=$TR(X,"-")+1_" day "
 D MSG^MAGQE2(X_"Image Workstation Sessions: "_SCNT)
 D MSG^MAGQE2(X_"Image Workstation Patients: "_PCNT)
 D MSG^MAGQE2(X_"Image Workstation Images: "_ICNT)
 D MSG^MAGQE2(X_"Image Workstation Captures: "_CCNT)
 D MSG^MAGQE2(X_"VistaRad WS Display: "_VD)
 D MSG^MAGQE2(X_"VistaRad WS Interpretations: "_VI)
 K VD,VI
 I $T(AVERAGE^MAGBRTLD)'="" D
 . D MSG^MAGQE2(X_"average daily routed images: "_$$AVERAGE^MAGBRTLD())
 . Q
 D BPV^MAGQE1(PLACE)
 D MSG^MAGQE2("Vista Image Version/Build: "_$$VSTAV^MAGQE1())
 D DICOMV^MAGQE1()
 D MSG^MAGQE2("Image file namespace(s): "_$$SNS^MAGQE1(PLACE))
 S I="" F  S I=$O(RES(I)) Q:I=""  D
 . S RES="" F  S RES=$O(RES(I,RES)) Q:RES=""  D
 . . S X=$TR(I,"^")_"^"_RES S $P(X,"^",6)=RES(I,RES)
 . . D MSG^MAGQE2(" RESOLUTION: "_X)
 . . Q
 . Q
 K RES
 ;
 D COUNT^MAGQE3(START,STOP,INST)
 ;
 S (I,D0)=0 F  S D0=$O(^TMP($J,"MAGQ","ACQPAT",D0)) Q:D0=""  S I=I+1
 D MSG^MAGQE2("Unique Image patients captured: "_I)
 K ^TMP($J,"MAGQ","ACQPAT")
 S (I,D0)=0 F  S D0=$O(^TMP($J,"MAGQ","DISPAT",D0)) Q:D0=""  S I=I+1
 D MSG^MAGQE2("Unique Image patients display: "_I)
 K ^TMP($J,"MAGQ","DISPAT")
 S (I,D0)=0 F  S D0=$O(^TMP($J,"MAGQ","ALLPAT",D0)) Q:D0=""  S I=I+1
 D MSG^MAGQE2("Unique Image patients All: "_I)
 K ^TMP($J,"MAGQ","ALLPAT")
 ;
 D ADCNT^MAGQE3(START,STOP,INST)
 D GPACHX^MAGQE3()
 D GS1^MAGQE5() ;Get Share data
 Q
 ;
AHOPT ;
 N %DT,START,STOP
 S STOP=$$FMADD^XLFDT($$NOW^XLFDT()\100_"01",-1)
 S START=STOP\100_"01"
 S Y=START D DD^%DT S %DT("B")=Y
 S %DT="AEXP",%DT("A")="Enter starting Date: "
 D ^%DT I ((X="")!(X="^")!($D(DTOUT))) K %DT(0) Q
 S START=Y
 S Y=STOP D DD^%DT S %DT("B")=Y
 S %DT="AEXP",%DT("A")="Enter ending Date: "
 D ^%DT I ((X="")!(X="^")!($D(DTOUT))) K %DT(0) Q
 S STOP=Y
 W !!,"Creating ad-hoc report over the period "
 W $$DT(START)," until ",$$DT(STOP),".",!
 D AHISU^MAGQE2(START,STOP)
 Q
 ;
DT(X) ;
 Q (X\1#100)_"-"_$P("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec"," ",X\100#100)_"-"_(X\10000+1700)
 ;
LLOAD(AR,LBL) ;
 N I
 S I="" F  S I=$O(AR(I)) Q:I=""  D MSG^MAGQE2(" "_LBL_" "_I_"^"_AR(I))
 Q
 ;
GETPLACE(PLACE) ; Validate place
 S PLACE=$S($$CONSOLID():$G(PLACE),1:+$O(^MAG(2006.1," "),-1)) Q:'PLACE 0
 S:$P($G(^MAG(2006.1,PLACE,0)),"^",1)="" PLACE=0
 Q PLACE
 ;
CONSOLID() ;
 ; Return value: 0 = site not consolidated,
 ;               1 = site is consolidated
 N FLDNFO
 D FIELD^DID(2006.1,.01,"","SPECIFIER","FLDNFO")
 I $G(FLDNFO("SPECIFIER"))["P" Q 1
 Q 0
 ;
PLACE(INST) ;
 Q:'$$CONSOLID() +$O(^MAG(2006.1," "),-1)
 Q $$GETPLACE(+$O(^MAG(2006.1,"B",INST,"")))
 ;
QCNT(READY,PLACE) ;
 N D0,FAILED,NEXT,TYPE
 S (READY,FAILED)=0
 I $$CONSOLID() D
 . S TYPE="" F  S TYPE=$O(^MAGQUEUE(2006.031,"C",PLACE,TYPE)) Q:TYPE=""  D
 . . S NEXT=+$O(^MAGQUEUE(2006.031,"C",PLACE,TYPE,""))
 . . S NEXT=+$P($G(^MAGQUEUE(2006.031,NEXT,0)),"^",2)
 . . S D0=0 F  S D0=$O(^MAGQUEUE(2006.03,"C",PLACE,TYPE,D0)) Q:'D0  D
 . . . I D0<NEXT S FAILED=FAILED+1
 . . . E  S READY=READY+1
 . . . Q
 . . Q
 E  D
 . S TYPE="" F  S TYPE=$O(^MAGQUEUE(2006.031,"B",TYPE)) Q:TYPE=""  D
 . . S NEXT=+$O(^MAGQUEUE(2006.031,"B",TYPE,""))
 . . S NEXT=+$P($G(^MAGQUEUE(2006.031,NEXT,0)),"^",2)
 . . S D0=0 F  S D0=$O(^MAGQUEUE(2006.03,"B",TYPE,D0)) Q:'D0  D
 . . . I D0<NEXT S FAILED=FAILED+1
 . . . E  S READY=READY+1
 . . . Q
 . . Q
 . Q
 Q READY+FAILED
 ;
WSP(PLACE) ; Imaging workstations per place
 N COUNT,D0,RD
 S RD=$$FMADD^XLFDT($$NOW^XLFDT,-180,"","","")
 S (D0,COUNT)=0 F  S D0=$O(^MAG(2006.81,"C",PLACE,D0)) Q:'D0  D
 . S:$P(^MAG(2006.81,D0,0),"^",3)'<RD COUNT=COUNT+1
 . Q
 Q COUNT
 ;
MAGDUZ2() Q $G(DUZ(2),$$KSP^XUPARAM("INST"))
 ;
GS1() ; Get local Network location share data
 N I,L,M,MSG,RESULT,TAR
 S RESULT(0)="NETWORK LOCATION^PHYSICAL REFERENCE^TOTAL SPACE^SPACE USED^FREE SPACE^OPERATIONAL STATUS^STORAGE TYPE^HASH"
 D LIST^DIC(2005.2,"","@;.01;1;2;3;4;5;6;7","","","","","","","","TAR","MSG")
 Q:$D(MSG("DIERR"))
 S L=0 F  S L=$O(TAR("DILIST","ID",L)) Q:'L  D
 . S RESULT(L)=$P(TAR("DILIST","ID",L,.01),U,1)
 . F M=1,2,3,4,5,6,7 S RESULT(L)=RESULT(L)_U_$P(TAR("DILIST","ID",L,M),U,1)
 . Q
 S I="" F  S I=$O(RESULT(I)) Q:I=""  D
 . D MSG^MAGQE2("LOCAL NETWORK LOCATIONS: "_I_"^"_RESULT(I))
 . Q
 Q
 ;
