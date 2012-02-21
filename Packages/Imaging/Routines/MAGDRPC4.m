MAGDRPC4 ;WOIFO/EdM - Imaging RPCs ; 09/08/2004  06:44
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
LOOKUP(OUT,NUMBER) ; RPC = MAG DICOM LOOKUP STUDY
 ; Look Up for both Radiology and Consults
 N ACCNUM ;--- Accession Number
 N CPTCODE ;-- CPT code for the procedure
 N CPTNAME ;-- CPT name for the procedure
 N DFN ;------ Patient pointer
 N EXAMSTS ;-- Exam status (don't post images to CANCELLED exams)
 N EXAMTYP ;-- Type of exam (Rad or Con)
 N GMRCIEN ;-- Pointer for GMRC
 N PROCDESC ;- Procedure description
 N PROCIEN ;-- Radiology procedure IEN in ^RAMIS(71)
 N RAIX ;----- cross reference subscript for case number lookup
 N RADFN ;---- first level subscript in ^RADPT
 N RADTI ;---- second level subscript in ^RADPT (after "DT")
 N RACNI ;---- third level subscript in ^RADPT (after "P")
 N RARPT ;---- Radiology Report pointer
 N I,LIST,NOUT,X,Z
 ;
 K OUT S NOUT=1
 I $G(NUMBER)="" S OUT(1)="-1,No Case or Consult Number Specified" Q
 ;
 S EXAMTYP=$E(NUMBER,1)
 I "RC"[EXAMTYP S NUMBER=$E(NUMBER,2,$L(NUMBER))
 E  S EXAMTYP=""
 K DFN
 D  ; First try Radiology candidates
 . I EXAMTYP'="",EXAMTYP'="R" Q
 . D  ; Look for the patient/study in ^RADPT using the Radiology Case Number
 . . N RAIX ;----- cross reference subscript for case number lookup
 . . S RAIX=$S($D(^RADPT("C")):"C",1:"AE") ; for Radiology Patch RA*5*7
 . . S RAIX=$S(NUMBER["-":"ADC",1:RAIX) ; select the cross-reference
 . . S RADFN=$O(^RADPT(RAIX,NUMBER,"")) I 'RADFN D  Q:'RADFN
 . . . I NUMBER'["-" S OUT(1)="-2,No Study Date Specified" Q
 . . . S X=$P(NUMBER,"-",1)
 . . . I $L(X)'=6 S OUT(1)="-3,Invalid study date """_X_"""." Q
 . . . S SDATE=$S($E(X,5,6)<30:3,1:2)_$E(X,5,6)_$E(X,1,4)
 . . . D:SDATE
 . . . . ; Search 1-3 days prior the study date OR a day in advance but only
 . . . . ; if the study date is not equal to today or greater than today.
 . . . . ; Has to be long case number or must have an image study date
 . . . . N %,%I,II,RCASE,TODAY,X,Y
 . . . . S RCASE=$S(NUMBER["-":$P(NUMBER,"-",2),1:NUMBER) Q:'RCASE
 . . . . D NOW^%DTC S TODAY=X
 . . . . ;
 . . . . ;  1-3 days prior study date
 . . . . F II=1:1:3 S RADFN=$$FIND(SDATE,RCASE,-II) Q:RADFN
 . . . . Q:RADFN
 . . . . ;
 . . . . ; Wild goose chase but check for today's case
 . . . . S RADFN=$O(^RADPT("ADC",$$MMDDYY(TODAY)_"-"_RCASE,"")) Q:RADFN
 . . . . ;
 . . . . Q:SDATE'<TODAY
 . . . . S RADFN=$$FIND(SDATE,RCASE,1) Q:RADFN  ; Advance a day
 . . . . ;
 . . . . ; Finally just check the "C" or "AE" x-reference for the case number
 . . . . ; based on RA*5*7 patch
 . . . . S RADFN=$O(^RADPT($S($O(^RADPT("C","")):"C",1:"AE"),RCASE,""))
 . . . . Q
 . . . Q
 . . S RADTI=$O(^RADPT(RAIX,NUMBER,RADFN,"")) Q:'RADTI
 . . S RACNI=$O(^RADPT(RAIX,NUMBER,RADFN,RADTI,"")) Q:'RACNI
 . . Q:'$D(^RADPT(RADFN,0))  ; No patient demographics file pointer
 . . S DFN=$P(^RADPT(RADFN,0),"^",1)
 . . Q
 . Q:'$G(DFN)
 . Q:'$D(^RADPT(DFN,"DT",RADTI,0))
 . S RARPT=$P($G(^RADPT(DFN,"DT",RADTI,"P",RACNI,0)),"^",17) Q:'RARPT
 . S ACCNUM=$P($G(^RARPT(RARPT,0)),"^",1)
 . S I=0 F  S I=$O(^RARPT(RARPT,2005,I)) Q:'I  D
 . . S X="74^"_RARPT_"^"_$P($G(^RARPT(RARPT,2005,I,0)),"^",1)_"^"_ACCNUM
 . . S NOUT=NOUT+1,OUT(NOUT)=X
 . . Q
 . Q
 ;
 K DFN
 D  ; Now look for any consults that might qualify
 . N ACCNUM,MAGIEN,MAGPTR,REPORTF,REPORTI,TIUIEN,TIUPTR,TIUXIEN
 . I EXAMTYP'="",EXAMTYP'="C" Q
 . S ACCNUM="GMRC-"_$S(NUMBER?1"GMRC-"1.N:$P(NUMBER,"GMRC-",2),1:NUMBER)
 . S GMRCIEN=$P(ACCNUM,"-",2)
 . D
 . . N D0,Z
 . . S D0=$P(ACCNUM,"-",2)
 . . S DFN=$$GET1^DIQ(123,D0,.02,"I") Q:'DFN
 . . S EXAMSTS=$$GET1^DIQ(123,D0,8) ; check for cancelled exam
 . . I EXAMSTS="CANCELLED" S OUT(1)="-4,Consult is cancelled" Q
 . . S PROCDESC=$$GET1^DIQ(123,D0,1)
 . . S Z=$$GET1^DIQ(123,D0,13,"I") ; request type
 . . Q
 . I '$G(DFN) S OUT(1)="-5,Consult/procedure not on file" Q
 . ; Find the images - they can be linked to TIU or imaging file 2006.5839
 . S MAGPTR=$O(^MAG(2006.5839,"C",123,GMRCIEN,0))
 . I MAGPTR D  Q  ; Found it in ^MAG(2006.5839 - not in ^TIU yet
 . . S X=^MAG(2006.5839,MAGPTR,0)
 . . S X=$P(X,"^",1)_"^"_$P(X,"^",2)_"^^"_$P(X,"^",3)
 . . S NOUT=NOUT+1,OUT(NOUT)=X
 . . Q
 . D  ; Otherwise find images in ^TIU
 . . N I,X
 . . D TIUALL^MAGDGMRC(GMRCIEN,.RESULT)
 . . S I="" F  S I=$O(RESULT(I)) Q:I=""  D
 . . . S X="8925^"_$P(RESULT(I),"^",1)_"^"_$P(RESULT(I),"^",3)_"^"_$P(RESULT(I),"^",2)
 . . . S NOUT=NOUT+1,OUT(NOUT)=X
 . . . Q
 . . Q
 . Q
 S OUT(1)=NOUT-1
 Q
 ;
NEXTIMG(OUT,FROM,D0,D1,SENT) ; RPC = MAG DICOM GET NEXT QUEUE ENTRY
 ; Get next file to be DICOM transmitted
 N H,F1,F2,F3,I,N,S0,S1,TYPE,X
 I $G(FROM)="" S OUT(1)="-1,No Origin Specified"
 ; First clean up transmitted queue entries
 S I="" F  S I=$O(SENT(I)) Q:I=""  D
 . S S0=$P(SENT(I),"^",1),S1=$P(SENT(I),"^",2)
 . Q:'$D(^MAGDOUTP(2006.574,S0,1,S1))
 . L +^MAGDOUTP(2006.574,S0,1,0):1E9 ; Background process MUST wait
 . K ^MAGDOUTP(2006.574,S0,1,S1)
 . S X=$G(^MAGDOUTP(2006.574,S0,1,0))
 . S $P(X,"^",4)=$P(X,"^",4)-1
 . S ^MAGDOUTP(2006.574,S0,1,0)=X
 . L -^MAGDOUTP(2006.574,S0,1,0)
 . Q:$O(^MAGDOUTP(2006.574,S0,1,0))
 . L +^MAGDOUTP(2006.574,0):1E9 ; Background process MUST wait
 . K ^MAGDOUTP(2006.574,S0)
 . K ^MAGDOUTP(2006.574,"C",FROM,S0)
 . S X=$G(^MAGDOUTP(2006.574,0))
 . S $P(X,"^",4)=$P(X,"^",4)-1
 . S ^MAGDOUTP(2006.574,0)=X
 . L -^MAGDOUTP(2006.574,0)
 . Q
 S D0=+$G(D0)
 S D1=+$G(D1)
 S OUT(1)="" F  D  Q:OUT(1)'=""
 . S S0=$O(^MAGDOUTP(2006.574,"C",FROM,"")) S:S0>D0 D0=S0,D1=0
 . I 'S0 S OUT(1)="-2,No studies to be transmitted" Q
 . S D1=$O(^MAGDOUTP(2006.574,D0,1,D1)) D:'D1
 . . S D0=$O(^MAGDOUTP(2006.574,"C",FROM,D0)) Q:'D0
 . . S D1=$O(^MAGDOUTP(2006.574,D0,1,0))
 . . Q
 . I 'D0 S OUT(1)="-3,No files to be transmitted" Q
 . I 'D1 D  Q
 . . S X=$G(^MAGDOUTP(2006,574,D0,1,0))
 . . S H=$P(X,"^",5) I H="" S $P(X,"^",5)=$H Q
 . . S N=$H,N=N*86400+$P(N,",",2),H=H*86400+$P(H,",",2)
 . . I N-H<300 S OUT(1)="-3,No files to be transmitted" Q
 . . L +^MAGDOUTP(2006.574,0):1E9 ; Background process MUST wait
 . . K ^MAGDOUTP(2006.574,D0)
 . . K ^MAGDOUTP(2006.574,"C",FROM,D0)
 . . S X=$G(^MAGDOUTP(2006.574,0))
 . . S $P(X,"^",4)=$P(X,"^",4)-1
 . . S ^MAGDOUTP(2006.574,0)=X
 . . L -^MAGDOUTP(2006.574,0)
 . . Q
 . S OUT(1)=1
 . S OUT(2)=D0
 . S OUT(3)=D1
 . S X=$G(^MAGDOUTP(2006.574,D0,0))
 . S OUT(4)=$P(X,"^",1) ; Application
 . S OUT(5)=$P(X,"^",2) ; Group
 . S OUT(6)=$P(X,"^",3) ; Accession Number
 . S OUT(7)=+$G(^MAGDOUTP(2006.574,D0,1,D1,0)) ; Image
 . S OUT(8)=$P($G(^MAG(2005,+OUT(7),0)),"^",6)
 . S TYPE=$S($G(^MAG(2005,+OUT(7),"FBIG"))'="":"BIG",1:"FULL")
 . ; 3rd parameter set to 1 to allow retrieval from jukebox
 . D FILEFIND^MAGDFB(+OUT(7),TYPE,1,0,.F1,.F2)
 . S OUT(9)=F1
 . S OUT(10)=F2
 . S OUT(11)=$P($G(^MAG(2005,+OUT(5),0)),"^",7) ; get DFN
 . ; get path for *.TXT, always the same as the FULL file
 . D FILEFIND^MAGDFB(+OUT(7),"FULL",1,0,.F1,.F3)
 . S OUT(12)=F3
 . Q
 Q
 ;
FIND(DATE,CASE,NUM) ;
 ; Use the ADC x-reference in the radiology patient file
 N NDATE,X,X1,X2,Y
 S X1=DATE,X2=NUM D C^%DTC S NDATE=X
 I NDATE<1 Q 0
 S NDATE=$$MMDDYY(NDATE)
 Q $O(^RADPT("ADC",NDATE_"-"_CASE,""))
 ;
MMDDYY(DAY) ; Convert Fileman date to mmddyy
 I DAY'?7N Q 0
 Q $E(DAY,4,7)_$E(DAY,2,3)
 ;
INIT(OUT,LOCATION) ; RPC = MAG DICOM QUEUE INIT
 N D0,N
 I '$G(LOCATION) S OUT="-3,No origin specified." Q
 I '$D(^MAGDOUTP(2006.574,0)) S OUT="-1,No entries at all in queue." Q
 ;
 S N=0,D0="" F  S D0=$O(^MAGDOUTP(2006.574,"C",LOCATION,D0)) Q:D0=""  D
 . K ^MAGDOUTP(2006.574,D0)
 . K ^MAGDOUTP(2006.574,"C",LOCATION,D0)
 . S N=N+1
 . Q
 ;
 I 'N S OUT="-2,No entries present for "_$$GET1^DIQ(4,LOCATION,.01)_"." Q
 ;
 S $P(^MAGDOUTP(2006.574,0),"^",4)=$P(^MAGDOUTP(2006.574,0),"^",4)-N
 S OUT=N_" entr"_$S(N=1:"y",1:"ies")_" removed from Image Transmission Queue."
 Q
 ;
