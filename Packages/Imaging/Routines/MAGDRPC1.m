MAGDRPC1 ;WOIFO/EdM - Imaging RPCs ; 09/03/2004  06:44
 ;;3.0;IMAGING;**11,30**;16-September-2004
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
DOMAIN(OUT) ; RPC = MAG DICOM GET DOMAIN
 N X
 I $T(WHERE^XUPARAM)'="" S OUT=$$KSP^XUPARAM("WHERE") Q
 ; The coding standards frown upon the line below,
 ; but it is the best we can do when the line above cannot be used.
 S X=^DD("SITE") S:X'[".VA.GOV" X=X_".VA.GOV"
 S OUT=X
 Q
 ;
INFO(OUT,LOCATION) ; RPC = MAG DICOM ET PHONE HOME
 N FST,N,X
 K OUT
 S X1=DT,X2=-25 D C^%DTC S FST=X
 S N=2
 ;
 ; Site-ID
 D DOMAIN(.X)
 S OUT(N)=X
 ;
 D ROUTEDAY^MAGDRPC2 ; Get routing statistics
 ;
 D  ; Text Gateway Statistics
 . N A,C,D0,D2,M,X
 . S A=0,D0=FST F  S D0=$O(^MAGDAUDT(2006.5761,D0)) Q:'D0  D
 . . S D2=0 F  S D2=$O(^MAGDAUDT(2006.5761,D0,1,LOCATION,1,D2)) Q:'D2  D
 . . . S X=$G(^MAGDAUDT(2006.5761,D0,1,LOCATION,1,D2,0))
 . . . S M=$P(X,"^",2) Q:'M
 . . . S:'A N=N+1,OUT(N)="Audit",A=1
 . . . S N=N+1,OUT(N)="STTX="_D0_"^"_$P(X,"^",1)_"^"_M
 . . . Q
 . . Q
 . Q
 ;
 S OUT(1)=N-1
 Q
 ;
STATION(OUT,STATION,VERSION) ; RPC = MAG DICOM WORKSTATION VERSION
 N %,D0,%H,%I,X
 I $G(STATION)="" S OUT="-1,No Station Identifier Specified" Q
 ;
 S D0=$O(^MAG(2006.83,"B",STATION,"")) D:'D0
 . L +^MAG(2006.83,0):1E9 ; Background process must wait for LOCK
 . S X=$G(^MAG(2006.83,0))
 . S $P(X,"^",1,2)="DICOM WORKSTATION^2006.83"
 . S D0=$O(^MAG(2006.83," "),-1)+1
 . S $P(X,"^",3)=D0
 . S $P(X,"^",4)=$P(X,"^",4)+1
 . S ^MAG(2006.83,0)=X,^MAG(2006.83,D0,0)=STATION
 . S ^MAG(2006.83,"B",STATION,D0)=""
 . L -^MAG(2006.83,0)
 . Q
 S $P(^MAG(2006.83,D0,0),"^",3)=VERSION
 S X=$P(^MAG(2006.83,D0,0),"^",2)
 D NOW^%DTC
 S $P(^MAG(2006.83,D0,0),"^",2)=%
 S OUT=D0
 Q
 ;
FMGET(OUT,FILE,D0,FIELD) ; RPC = MAG DICOM FILEMAN GET
 ; Get the value of a data field
 S OUT=$$GET1^DIQ(FILE,D0,FIELD)
 Q
 ;
CUTOFF(OUT,D0) ; RPC = MAG DICOM PACS CUTOFF DATE
 ; Retention Period for PACS
 N X
 I $E($O(^MAG(2006.1," ")),1)="A" D  Q
 . ; Non-consolidated site
 . I '$D(^MAG(2006.1,"APACS")) S OUT="-2,No PACS Installed" Q
 . ;
 . S X=$G(^MAG(2006.1,"AIMDELPACS"))
 . I X="" S OUT="-3,PACS Retention Parameter not defined" Q
 . S OUT=X
 . Q
 ; Consolidated site:
 I '$P($G(^MAG(2006.1,D0,"PACS")),"^",1) S OUT="-2,No PACS Installed" Q
 ;
 S X=$P($G(^MAG(2006.1,D0,1)),"^",5)
 I X="" S OUT="-3,PACS Retention Parameter not defined" Q
 S OUT=X
 Q
 ;
MINSPACE(OUT,D0) ; RPC = MAG DICOM PACS MINIMUM SPACE
 ; Minimum Percentage of Free Disk Space
 N X
 I $E($O(^MAG(2006.1," ")),1)="A" D  Q
 . ; Non-consolidated site
 . I '$D(^MAG(2006.1,"APACS")) S OUT="-2,No PACS Installed" Q
 . ;
 . S X=$G(^MAG(2006.1,"AIMDELPACS2"))
 . I X="" S OUT="-3,PACS Minimum Space Percentage Parameter not defined" Q
 . S OUT=X
 . Q
 ; Consolidated site:
 I '$P($G(^MAG(2006.1,D0,"PACS")),"^",1) S OUT="-2,No PACS Installed" Q
 ;
 S X=$P($G(^MAG(2006.1,D0,3)),"^",5)
 I X="" S OUT="-3,PACS Minimum Space Percentage Parameter not defined" Q
 S OUT=X
 Q
 ;
HL7PURGE(OUT,CUTOFF) ; RPC = MAG DICOM PURGE HL7
 ; Purge HL7 transactions
 N D,D0,P,T,X
 S OUT=0
 S D="" F  S D=$O(^MAGDHL7(2006.5,"B",D)) Q:'D  Q:D'<CUTOFF  D
 . S D0="" F  S D0=$O(^MAGDHL7(2006.5,"B",D,D0)) Q:'D0  D
 . . S X=$G(^MAGDHL7(2006.5,D0,0)),P=$P(X,"^",4),T=$P(X,"^",3)
 . . K ^MAGDHL7(2006.5,D0)
 . . K ^MAGDHL7(2006.5,"B",D,D0)
 . . K:T'="" ^MAGDHL7(2006.5,"C",T,D0)
 . . K:P'="" ^MAGDHL7(2006.5,"D",P,D0)
 . . S OUT=OUT+1
 . . Q
 . Q
 D:OUT
 . L +^MAGDHL7(2006.5,0):1E9
 . S X=$G(^MAGDHL7(2006.5,0))
 . S $P(X,"^",1,2)="PACS MESSAGES^2006.5D"
 . S $P(X,"^",4)=$P(X,"^",4)-OUT
 . S ^MAGDHL7(2006.5,0)=X
 . L -^MAGDHL7(2006.5,0)
 . Q
 Q
 ;
VALDEST(OUT,NAME) ; RPC = MAG DICOM ROUTE VALID DEST
 N D0,PLACE,X
 ; This function is also called from various routines
 ; that belong to automated routing.
 ;
 S OUT="-1,"""_NAME_""" is not a valid destination"
 ;
 I $D(^MAG(2005.2,"B")) D  Q
 . S D0=$O(^MAG(2005.2,"B",NAME,"")) Q:'D0
 . S:$P($G(^MAG(2005.2,D0,0)),"^",9) OUT=D0
 . Q 
 ;
 S D0=""
 S PLACE="" F  S PLACE=$O(^MAG(2005.2,"D",PLACE)) Q:PLACE=""  D  Q:OUT>0
 . S D0=$O(^MAG(2005.2,"D",PLACE,NAME,""))
 . S:$P($G(^MAG(2005.2,D0,0)),"^",9) OUT=D0
 . Q
 Q
 ;
PAT(OUT,DFN) ; RPC = MAG DICOM GET PATIENT
 N DIQUIET,I,N,VADM,VAIN,VAPA,VASD
 K OUT
 I '$G(DFN) S OUT(1)="-1,No Patient Identified" Q
 S N=1,DIQUIET=1
 D DEM^VADPT
 S I="" F  S I=$O(VADM(I)) Q:I=""  S:VADM(I)'="" N=N+1,OUT(N)="DEM^"_I_"^"_VADM(I)
 D ADD^VADPT
 S I="" F  S I=$O(VAPA(I)) Q:I=""  S:VAPA(I)'="" N=N+1,OUT(N)="ADD^"_I_"^"_VAPA(I)
 D INP^VADPT
 S I="" F  S I=$O(VAIN(I)) Q:I=""  S:VAIN(I)'="" N=N+1,OUT(N)="INP^"_I_"^"_VAIN(I)
 D SDA^VADPT
 S I="" F  S I=$O(VASD(I)) Q:I=""  S:VASD(I)'="" N=N+1,OUT(N)="SDA^"_I_"^"_VASD(I)
 S OUT(1)=N-1
 Q
 ;
RARPTO(OUT,TYPE,D0,F,D1) ; RPC = MAG DICOM GET RAD RPT INFO
 S TYPE=$G(TYPE),D0=$G(D0),F=$G(F,1),D1=+$G(D1)
 I TYPE="O1" S OUT=+$O(^RARPT(D0),F) Q
 I TYPE="O2" S OUT=+$O(^RARPT(D0,F,D1)) Q
 I TYPE="G1" S OUT=$G(^RARPT(D0,0)) Q
 I TYPE="G2" S OUT=$G(^RARPT(D0,F,D1,0)) Q
 S OUT="-1,Invalid request type ("""_TYPE_""")"
 Q
 ;
