MAGDHWS ;WOIFO/PMK - Capture Consult/GMRC data ; 24 Feb 2004  9:50 AM
 ;;3.0;IMAGING;**10,11**;14-April-2004
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
ENTRY ; entry point from scheduling package
 N %,AFTERSTS,APTNUMB,APTSCHED,CLINIC,CONSULTM,CUTOFF,DATETIME
 N DEL,DEL2,DEL3,DEL4,DEL5,DFN,DIVISION,DONE,FILLER1,FMDATE,FMDATETM
 N GMRCIEN,HL,IGNORE,IREQ,ITYPCODE,ITYPNAME,MSGTYPE,REQUEST
 N SERVICE,STATUS,UNKNOWN,X,Y,Z
 S APTNUMB=$P(SDATA,"^",1) I APTNUMB<1 Q  ; not a valid appointment
 D INIT^MAGDHW0 ; initialize variables
 D NOW^%DTC S FMDATE=%\1,FMDATETM=%
 S %H=%H-90 D TT^%DTC S CUTOFF=X ; cutoff date is 90 days ago
 S DFN=$P(SDATA,"^",2),DATETIME=$P(SDATA,"^",3),CLINIC=$P(SDATA,"^",4)
 S APTSCHED("CLINIC IEN")=CLINIC,APTSCHED("FM DATETIME")=DATETIME
 S AFTERSTS=SDATA("AFTER","STATUS"),X=$P(AFTERSTS,"^",3)
 ; appointment management transactions from ^SD(409.63)
 I X["CHECKED IN" S FILLER1="SDAM-CHECKIN"
 E  I X["CHECKED OUT" S FILLER1="SDAM-CHECKOUT"
 E  I X["AUTO RE-BOOK" S FILLER1="SDAM-SCHEDULED"
 E  I X["ACTION REQUIRED" S FILLER1="SDAM-SCHEDULED"
 E  I X["NON-COUNT" S FILLER1="SDAM-SCHEDULED"
 E  I X["CANCELLED" S FILLER1="SDAM-CANCELLED"
 E  I X["NO-SHOW" S FILLER1="SDAM-CANCELLED"
 E  I X["DELETED" S FILLER1="SDAM-CANCELLED"
 E  I X="FUTURE" S FILLER1="SDAM-FUTURE"
 E  I X="INPATIENT APPOINTMENT" S FILLER1="SDAM-SCHEDULED"
 E  I X["NO ACTION TAKEN" S FILLER1="SDAM-SCHEDULED"
 I  D  ; if one of the above condititions, do the following
 . S APTSCHED("CLINIC NAME")=$S(CLINIC:$$GET1^DIQ(44,CLINIC,.01),1:"")
 . Q
 E  D  Q
 . W !!,"Unknown Status: """,$P(AFTERSTS,"^",3),""""
 . W !,"Please notify the Imaging Project"
 . R !,"Push <Enter> to continue",X:$G(DTIME,300)
 . Q
 ;
 ; find requests that can be perfomed in this clinic
 D SEARCH^MAGDGMRC(DFN,CUTOFF,CLINIC,.REQUEST)
 ;
 ; output an HL7 message for each request related to this appointment
 F IREQ=1:1:REQUEST D
 . S GMRCIEN=$P(REQUEST(IREQ),"^",1),SERVICE=$P(REQUEST(IREQ),"^",2)
 . S STATUS=$P(REQUEST(IREQ),"^",3)
 . S IGNORE=1 D SERVICE^MAGDHWC Q:IGNORE  ; not a service of interest
 . ; if {pending, active, scheduled, partially resulted, or complete}
 . I "^p^a^s^pr^c^"[("^"_STATUS_"^") D
 . . ; completed requests can only be checked out or cancelled
 . . I STATUS="c","SDAM-CHECKOUT^SDAM-CANCELLED"'[FILLER1 Q
 . . D MESSAGE("S")
 . . Q
 . Q
 Q
 ;
MESSAGE(MSGTYPE) ; invoked above and also from ^MAGDHWC for the initial order
 N CONSULT,HL7,MSG,NEXT,OBXSEGNO,ORCTRL,ORSTATUS
 I MSGTYPE="O" D  ; ordered - set in ^MAGDHWC
 . S MSGTYPE="ORDERED"
 . S ORCTRL="NW" ; order control
 . S ORSTATUS="IP" ; order status
 . Q
 E  D
 . S MSGTYPE="SCHEDULED"
 . S ORCTRL="SC" ; order control -- status changed
 . S ORSTATUS="ZC" ; scheduling
 . Q
 D MSH^HLFNC2(.HL,100000,.MSG) S $P(MSG,DEL,9)="ORM"
 S NEXT=0
 S NEXT=NEXT+1,HL7(NEXT)=MSG D MSH^MAGDHWA
 S NEXT=NEXT+1,HL7(NEXT)="PID",$P(HL7(NEXT),DEL,1+3)=DFN
 S NEXT=NEXT+1,HL7(NEXT)="PV1"
 D PID^MAGDHWA ; generate PID and PV1 segments
 S NEXT=NEXT+1,HL7(NEXT)=$$ORC D ORC^MAGDHWA
 S NEXT=NEXT+1,HL7(NEXT)=$$OBR D OBR^MAGDHWA
 S NEXT=NEXT+1,HL7(NEXT)=$$ZSV D ZSV^MAGDHWA
 S NEXT=NEXT+1,NEXT=$$OBX(NEXT)
 D ALLERGY^MAGDHWA,POSTINGS^MAGDHWA
 D OUTPUT^MAGDHW0
 Q
 ;
PV1() ; build a PV1 segement
 N X,Z
 S FROM=$$GET1^DIQ(123,GMRCIEN,.04,"I") ; patient location
 S Z=FROM_DEL3_$S(FROM:$$GET1^DIQ(44,FROM,.01),1:"")_DEL3_SERVICE
 S $P(X,DEL,10)=Z
 Q "PV1"_DEL_X
 ;
ORC() ; build an ORC segment
 N ORC,ORCPLCR,ORURG
 S ORCPLCR=$$GET1^DIQ(123,GMRCIEN,10,"I") ; sending provider
 D ORC^GMRCHL7(GMRCIEN,ORCTRL,ORCPLCR,,FMDATETM)
 S $P(ORC,DEL,5+1)=ORSTATUS
 Q ORC
 ;
ZSV() ; build a ZSV segment
 N ZSV
 D ZSV^GMRCHL7(GMRCIEN)
 Q ZSV
 ;
OBR() ; build an OBR segment
 N NOTIFY,OBR
 D OBR^GMRCHL72(GMRCIEN,"",FMDATETM)
 Q OBR
 ;
OBX(NEXT) ; build one or more OBX segments
 N GMRCND,GMRCND1,I,J,OBX,X
 D OBX^GMRCHL72(GMRCIEN)
 S OBXSEGNO=0
 F I=1:1 Q:'$D(OBX(I))  D
 . D OBX1(OBX(I))
 . I $D(OBX(I,1)) S X=$P(OBX(I),DEL,1,5) F J=1:1 Q:'$D(OBX(I,J))  D
 . . D OBX1(X_DEL_OBX(I,J))
 . . Q
 . Q
 Q NEXT
 ;
OBX1(RECORD) ; store one OBX segment into the HL7 array
 S HL7(NEXT)=RECORD
 S OBXSEGNO=$P(RECORD,DEL,2) ; get the highest value of OBXSEGNO
 S NEXT=NEXT+1
 Q
