MAGQBUT5 ;WOIFO/RMP - IMAGE SITE PARAMETERS COMPANION [ 04/01/2003 18:28 ]
 ;;3.0;IMAGING;**19**;Apr 29, 2003
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
 ;Workstation Session and Patient counts
 N DATE,SCNT,SIND,PCNT,ICNT,CCNT,TNODE,TD,TD1,M1,M2,YR,SCNAD,SCNMN,UNSCN,VD,VI,CONS,OCONS
 S (SCNT,PCNT,ICNT,CCNT)=0
 S (VD,VI)="",(ACQPAT,DISPAT,ALLPAT)=0
 S DATE="L"_START
 F  S DATE=$O(^MAG(2006.82,"AC",DATE)) Q:DATE'?1"L"7N1".".4N  Q:($P(DATE,"L",2)>STOP)  Q:($P($P(DATE,"L",2),".")=STOP)  D
 . S SIND=0
 . F  S SIND=$O(^MAG(2006.82,"AC",DATE,SIND)) Q:SIND'?1N.N  D
 . . Q:'$D(^MAG(2006.82,SIND,1))
 . . S SCNT=SCNT+1,TNODE=$G(^MAG(2006.82,SIND,1))
 . . S PCNT=PCNT+$P(TNODE,U,1)
 . . D ACT^MAGQBUT4(SIND,.ICNT,.CCNT,.VD,.VI)
 . . Q
 . Q
 S SIND=0 F  S SIND=$O(^TMP($J,"MAGQ","DISPAT",SIND)) Q:SIND=""  S DISPAT=DISPAT+1
 K ^TMP($J,"MAGQ","VD"),^TMP($J,"MAGQ","VI")
 S CNT=CNT+1,^TMP($J,"MAGQ",CNT)="30 DAY Image Workstation Sessions: "_SCNT
 S CNT=CNT+1,^TMP($J,"MAGQ",CNT)="30 Image Workstation Patients: "_PCNT
 S CNT=CNT+1,^TMP($J,"MAGQ",CNT)="30 DAY Image Workstation Images: "_ICNT
 S CNT=CNT+1,^TMP($J,"MAGQ",CNT)="30 DAY Image Workstation Captures: "_CCNT
 S CNT=CNT+1,^TMP($J,"MAGQ",CNT)="30 DAY VistaRad WS Display: "_VD
 S CNT=CNT+1,^TMP($J,"MAGQ",CNT)="30 DAY VistaRad WS Interpretations: "_VI
 I $T(AVERAGE^MAGBRTLD)'="" D
 . S CNT=CNT+1,^TMP($J,"MAGQ",CNT)="30 DAY average daily routed images: "_$$AVERAGE^MAGBRTLD()
 I $$BPV^MAGQBUT2(.BPV) D LLOAD^MAGQBUT5(.BPV,"BP VERS NUM DATE: ",.CNT) K BPV
 S CNT=CNT+1,^TMP($J,"MAGQ",CNT)="Vista Image Version/Build: "_$$VSTAV^MAGQBUT2()
 I $$DICOMV^MAGQBUT2(.DCV) D LLOAD^MAGQBUT5(.DCV,"DICOM Gateway Version: ",.CNT) K DCV
 S CNT=CNT+1,^TMP($J,"MAGQ",CNT)="Image file namespace(s): "_$$SNS^MAGQBUT2(REC)
 D DCM^MAGQBUT4(.LIST,.CLIN,.NEW,.ACQPAT,START,$$FMADD^XLFDT(STOP,-1),.CONS,.OCONS)
 D LLOAD^MAGQBUT5(.LIST,"DICOM CAPTURE:",.CNT)
 D LLOAD^MAGQBUT5(.CLIN,"CLIN CAPTURE:",.CNT)
 D LLOAD^MAGQBUT5(.OCONS,"OTHER CONSENTS:",.CNT)
 S CNT=CNT+1,^TMP($J,"MAGQ",CNT)="CONSENT FORMS: "_CONS
 S SIND=0 F  S SIND=$O(^TMP($J,"MAGQ","ALLPAT",SIND)) Q:SIND=""  S ALLPAT=ALLPAT+1
 S CNT=CNT+1,^TMP($J,"MAGQ",CNT)="Image file group parents: "_$P(NEW,U)
 S CNT=CNT+1,^TMP($J,"MAGQ",CNT)="Image file objects: "_$P(NEW,U,2)
 S CNT=CNT+1,^TMP($J,"MAGQ",CNT)="Image file deletes: "_$P(NEW,U,3)
 S CNT=CNT+1,^TMP($J,"MAGQ",CNT)="Unique Image patients captured: "_ACQPAT
 S CNT=CNT+1,^TMP($J,"MAGQ",CNT)="Unique Image patients display: "_DISPAT
 S CNT=CNT+1,^TMP($J,"MAGQ",CNT)="Unique Image patients All "_ALLPAT
 K LIST,CLIN,PINDEX,OCONS,^TMP($J,"MAGQ","DISPAT"),^TMP($J,"MAGQ","ACQPAT"),^TMP($J,"MAGQ","ALLPAT")
 D ADCNT^MAGQBUT4(.SCNAD,.SCNMN,.UNSCN,START,STOP,.CNT,"ADVANCE DIRECTIVE") ; Advanced Directives
 D GPACHX^MAGQBUT4(.PV,.CNT)
 Q
PINIT ; Patch 3.0 19 Post init ~ run a mid month
 ; report that matches the last implementation's mid month report
 N START,STOP,TODAY
 S TODAY=$P($$NOW^XLFDT(),".")
 S STOP=$S($E(TODAY,6,7)>15.23000:$E(TODAY,1,5)_"15",1:$E($$FMADD^XLFDT($E(TODAY,1,5)_"01",-1),1,5)_"16")
 S START=$E($$FMADD^XLFDT($E(STOP,1,5)_"01",-1),1,5)_"17"
 D AHISU^MAGUSIT(START,STOP)
 D AHISU^MAGUSIT(3030301,3030331)
 Q
AHOPT ;
 N ST,END,%DT
 S %DT="AEXPT",%DT("A")="Enter starting Date: ",%DT("B")="T-30"
 S %DT(0)="T-30"
 D ^%DT I X="" K %DT(0) Q
 S ST=Y
 S %DT="AEXPT",%DT("A")="Enter ending Date: ",%DT("B")="TODAY"
 S %DT(0)="-NOW"
 D ^%DT I X="" K %DT(0) Q
 S END=Y
 D AHISU^MAGUSIT(ST,END)
 K %DT
 Q
LLOAD(AR,LBL,CNT) ;
 N I
 S I=""
 F  S I=$O(AR(I)) Q:I=""  D
 . S CNT=CNT+1
 . S ^TMP($J,"MAGQ",CNT)=" "_LBL_" "_I_U_AR(I)
 . Q
 Q
 ;
