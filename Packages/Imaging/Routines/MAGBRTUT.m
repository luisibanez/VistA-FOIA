MAGBRTUT ;WOIFO/EdM - Routing Utilities ; 06/08/2004  08:00
 ;;3.0;IMAGING;**9,11,30**;16-September-2004
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
SEND(IMAGE,LOC,PRI,MECH,FROM,ID) ; Enter image into Routing Queue
 ; IMAGE ;---- Internal Entry Number in Image FIle
 ; LOC ;------ Internal Entry Number in either Network Location file
 ;             or SCU_List file
 ; PRI ;------ Priority
 ; MECHanism = 1: Send using MS-DOS-Copy
 ;           = 2: Send using DICOM_Send
 ; FROM ;----- Location from which request originates
 ; ID ;------- Transaction ID
 N D0 ;------- Internal Entry number
 N FLAG ;----- List of file-types to transmit
 N I ;-------- Scratch and loop counter
 N ORIGIN ;--- Location from which image is being sent (IEN in Institution file)
 N QQ ;------- List of queue-entries created
 ;
 S QQ="",MECH=$G(MECH) S:'MECH MECH=1
 I '$D(^MAG(2005,+$G(IMAGE))) Q:$Q QQ Q
 I MECH=1,'$D(^MAG(2005.2,+$G(LOC))) Q:$Q QQ Q
 I MECH=2,'$D(^MAG(2006.587,+$G(LOC))) Q:$Q QQ Q
 I MECH'=1,MECH'=2 Q:$Q QQ Q
 ;
 S ORIGIN=$G(FROM) D:'ORIGIN
 . S ORIGIN=$P($G(^MAG(2005,IMAGE,100)),"^",3)
 . S:'ORIGIN ORIGIN=$G(DUZ(2))
 . S:'ORIGIN ORIGIN=$$KSP^XUPARAM("INST")
 . Q
 ;
 S PRI=$G(PRI,500),ID=$G(ID)
 S FLAG=$G(^MAG(2005.2,+LOC,1)) S:MECH=2 FLAG="^^^^5"
 ;
 I MECH=2 D  Q:$Q QQ Q
 . ; Stopgap until "native DICOM" storage is supported
 . N APPNAM
 . S APPNAM=$P($G(^MAG(2006.587,LOC,0)),"^",1)
 . D QUEUE^MAGDRPC3(.QQ,IMAGE,APPNAM,ORIGIN,"","6: Copy to HIPAA Compliant Storage")
 . Q
 ;
 F I=1:1:5 D:$P(FLAG,"^",I)
 . N D0,T,X
 . S T=$P("ABSTRACT FULL BIG TEXT DICOM"," ",I)
 . ;
 . S D0=$O(^MAGQUEUE(2006.035,"DEST",LOC,"WAITING",IMAGE,T,"")) I D0 D  Q
 . . N O,P,T,X0,X1
 . . S X0=$G(^MAGQUEUE(2006.035,D0,0)),O=$P(X0,"^",5),T=$P(X0,"^",6)
 . . S X1=$G(^MAGQUEUE(2006.035,D0,1)),P=$P(X1,"^",2)
 . . ; Don't send multiple copies, but do increase priority if needed
 . . Q:PRI'>P
 . . S $P(X0,"^",5)=ORIGIN,^MAGQUEUE(2006.035,D0,0)=X0
 . . I T'=ID,ID'="" D
 . . . S $P(X0,"^",6)=ID
 . . . S ^MAGQUEUE(2006.035,D0,0)=X0
 . . . K:O'="" ^MAGQUEUE(2006.035,"ID",T,D0)
 . . . S ^MAGQUEUE(2006.035,"ID",ID,D0)=""
 . . . Q
 . . S $P(X1,"^",2)=PRI,^MAGQUEUE(2006.035,D0,1)=X1
 . . K:O ^MAGQUEUE(2006.035,"STS",O,"WAITING",P,LOC,D0)
 . . S ^MAGQUEUE(2006.035,"STS",ORIGIN,"WAITING",PRI,LOC,D0)=""
 . . Q
 . ;
 . L +^MAGQUEUE(2006.035,0)
 . S D0=$O(^MAGQUEUE(2006.035," "),-1)+1
 . S X=$G(^MAGQUEUE(2006.035,0))
 . S $P(X,"^",1,2)="IMAGE ROUTING QUEUE^2006.035"
 . S $P(X,"^",3)=D0
 . S $P(X,"^",4)=$P(X,"^",4)+1
 . S ^MAGQUEUE(2006.035,0)=X
 . S X=IMAGE_"^"_LOC_"^"_T_"^"_MECH_"^"_ORIGIN_"^"_ID
 . S:ID'="" ^MAGQUEUE(2006.035,"ID",ID,D0)=""
 . S ^MAGQUEUE(2006.035,D0,0)=X
 . D NOW^%DTC
 . S ^MAGQUEUE(2006.035,D0,1)="WAITING^"_PRI_"^"_%
 . S ^MAGQUEUE(2006.035,"STS",ORIGIN,"WAITING",PRI,LOC,D0)=""
 . S ^MAGQUEUE(2006.035,"DEST",LOC,"WAITING",IMAGE,T,D0)=""
 . L -^MAGQUEUE(2006.035,0)
 . S QQ=QQ_D0_"^"
 . Q
 Q:$Q QQ Q
 ;
DCMLIST(OUT,LOCATION) N D0,LO,LST,N,NM,X
 S LOCATION=+$G(LOCATION)
 S D0=0 F  S D0=$O(^MAG(2006.587,D0)) Q:'D0  D
 . S X=$G(^MAG(2006.587,D0,0))
 . S NM=$P(X,"^",1),LO=$P(X,"^",7) Q:NM=""
 . I LOCATION,LO,LO'=LOCATION Q
 . S LST(NM,LO)=D0
 . Q
 S N=1,NM="" F  S NM=$O(LST(NM)) Q:NM=""  D
 . S LO="",X=0 F  S LO=$O(LST(NM,LO)) Q:LO=""  S X=X+1,D0=LST(NM,LO)
 . I X=1 S N=N+1,OUT(N)=NM_"^"_D0 Q
 . S LO="" F  S LO=$O(LST(NM,LO)) Q:LO=""  S N=N+1,OUT(N)=NM_" ("_LO_")^"_LST(NM,LO)
 . Q
 S OUT(1)=N-1
 Q
 ;
