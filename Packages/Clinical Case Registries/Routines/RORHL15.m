RORHL15 ;HOIFO/BH - HL7 IV DATA: OBR, OBX ; 8/26/05 2:43pm
 ;;1.5;CLINICAL CASE REGISTRIES;;Feb 17, 2006
 ;
 ; This routine uses the following IAs:
 ;
 ; #117          Read access to the file #55 (controlled)
 ; #2400         OCL^PSOORRL and OEL^PSOORRL (controlled)
 ; #4549         ZERO^PSS52P6 (supported)
 ; #4550         ZERO^PSS52P7 (supported)
 ;
 Q
 ;
 ;***** SEARCHES FOR IV DATA
 ;
 ; RORDFN        IEN of the patient in the PATIENT file (#2)
 ;
 ; .DXDTS        Reference to a local variable where the
 ;               data extraction time frames are stored.
 ;
 ; Return Values:
 ;       <0  Error code
 ;        0  Ok
 ;       >0  Non-fatal error(s)
 ;
 ; The ^TMP("PS",$J) global node is used by this function.
 ;
EN1(RORDFN,DXDTS) ;
 N ERRCNT,IDX,II,RC,RORENDT,RORII,RORORD,RORSTDT,RORTMP
 S (ERRCNT,RC)=0
 S RORTMP=$$ALLOC^RORTMP()
 ;
 S IDX=0
 F  S IDX=$O(DXDTS(14,IDX))  Q:IDX'>0  D  Q:RC<0
 . S RORSTDT=$P(DXDTS(14,IDX),U),RORENDT=$P(DXDTS(14,IDX),U,2)
 . ;--- Load the list of prescriptions
 . K ^TMP("PS",$J),@RORTMP
 . D OCL^PSOORRL(RORDFN,RORSTDT,RORENDT)
 . Q:$D(^TMP("PS",$J))<10
 . ;
 . ;--- Select the prescriptions
 . S RORII=0
 . F  S RORII=$O(^TMP("PS",$J,RORII))  Q:'RORII  D
 . . S RORORD=$P(^TMP("PS",$J,RORII,0),U)
 . . Q:RORORD'>0
 . . S II=$P(RORORD,";"),II=$E(II,$L(II))
 . . Q:II'="V"
 . . ;---
 . . M @RORTMP@(RORII)=^TMP("PS",$J,RORII)
 . ;
 . ;--- Browse through the list and generate the HL7 segments
 . S RORII=0
 . F  S RORII=$O(@RORTMP@(RORII))  Q:'RORII  D
 . . S RORORD=$P(@RORTMP@(RORII,0),U)
 . . S RORORD=$P(RORORD,";")
 . . S RORORD=$E(RORORD,1,$L(RORORD)-1)
 . . ;---
 . . S TMP=$$OBR(RORORD,RORDFN)
 . . I TMP  Q:TMP<0  S ERRCNT=ERRCNT+TMP
 . . S TMP=$$OBX(RORORD,RORDFN)
 . . I TMP  Q:TMP<0  S ERRCNT=ERRCNT+TMP
 ;
 D FREE^RORTMP(RORTMP)
 K ^TMP("PS",$J)
 Q $S(RC<0:RC,1:ERRCNT)
 ;
 ;***** IV OBR SEGMENT BUILDER
 ;
 ; RORORD        Order Number
 ; RORDFN        IEN of the patient in the PATIENT file (#2)
 ;
 ; Return Values:
 ;       <0  Error code
 ;        0  Ok
 ;       >0  Non-fatal error(s)
 ;
OBR(RORORD,RORDFN) ;
 N CS,ERRCNT,IEN,RC,RORBUF,RORIENS,RORMSG,RORSEG,TMP
 S (ERRCNT,RC)=0
 D ECH^RORHL7(.CS)
 ;
 S RORIENS=$$GETIENS(RORORD,RORDFN)  Q:'RORIENS 0
 D GETS^DIQ(55.01,RORIENS,".02;.03;.04;.08;.09;9","IE","RORBUF","RORMSG")
 I $G(DIERR)  D  S ERRCNT=ERRCNT+1
 . D DBS^RORERR("RORMSG",-9,,RORDFN,55.01,RORIENS)
 ;
 ;--- Initialize the segment
 S RORSEG(0)="OBR"
 ;
 ;--- OBR-3 - Order Number
 S RORSEG(3)=RORORD
 ;
 ;--- OBR-4 - IV CPT Code
 S RORSEG(4)="90780"_CS_"IV"_CS_"C4"
 ;
 ;--- OBR-7 - Start Date
 S TMP=$$FMTHL7^XLFDT($G(RORBUF(55.01,RORIENS,.02,"I")))
 Q:TMP'>0 $$ERROR^RORERR(-95,,,RORDFN,55.01,RORIENS,.02)
 S RORSEG(7)=TMP
 ;
 ;--- OBR-8 - Stop Date
 S TMP=$G(RORBUF(55.01,RORIENS,.03,"I"))
 S RORSEG(8)=$$FM2HL^RORHL7(TMP)
 ;
 ;--- OBR-13 - Schedule
 S TMP=$G(RORBUF(55.01,RORIENS,.09,"I"))
 S RORSEG(13)=$$ESCAPE^RORHL7(TMP)
 ;
 ;--- OBR-20 - Infusion Rate
 S TMP=$G(RORBUF(55.01,RORIENS,.08,"I"))
 S RORSEG(20)=$$ESCAPE^RORHL7(TMP)
 ;
 ;--- OBR-24 - Diagnostic Service ID
 S RORSEG(24)="IMM"
 ;
 ;--- OBR-40 - Type
 S TMP=$G(RORBUF(55.01,RORIENS,.04,"I"))
 I TMP'=""  D  S RORSEG(40)=TMP
 . S $P(TMP,CS,2)=$G(RORBUF(55.01,RORIENS,.04,"E"))
 . S $P(TMP,CS,3)="VA"
 ;
 ;--- OBR-44 - Division
 S IEN=+$G(RORBUF(55.01,RORIENS,9,"I"))
 I IEN>0  D
 . S IEN=+$$GET1^DIQ(42,IEN_",",44,"I",,"RORMSG")
 . D:$G(DIERR) DBS^RORERR("RORMSG",-99,,,42,IEN_",")
 S RORSEG(44)=$$DIV44^RORHLUT1(IEN,CS)
 ;
 ;--- Store the segment
 D ADDSEG^RORHL7(.RORSEG)
 Q ERRCNT
 ;
 ;***** IV OBX SEGMENT(S) BUILDER
 ;
 ; RORORD        Order Number
 ; RORDFN        IEN of the patient in the PATIENT file (#2)
 ;
 ; Return Values:
 ;       <0  Error code
 ;        0  Ok
 ;       >0  Non-fatal error(s)
 ;
OBX(RORORD,RORDFN) ;
 N CS,ERRCNT,IEN,RC,RORID,RORIENS,RORKEY,RORLST,RORMSG,TMP
 S (ERRCNT,RC)=0
 D ECH^RORHL7(.CS)
 ;
 S RORIENS=$$GETIENS(RORORD,RORDFN)  Q:'RORIENS 0
 ;
 ;=== Other Print information
 S TMP=$$GET1^DIQ(55.01,RORIENS,31,"E",,"RORMSG")
 I $G(DIERR)  D  S ERRCNT=ERRCNT+1
 . D DBS^RORERR("RORMSG",-99,,RORDFN,55.01,RORIENS)
 I TMP'=""  D  D SETOBX(TMP,RORID)
 . S RORID="OTPR"_CS_"Other Print info."_CS_"VA080"
 ;
 ;=== Additive data
 K RORMSG,RORLST
 D LIST^DIC(55.02,","_RORIENS,"@;.01;.02","I",,,,,,,"RORLST","RORMSG")
 I $G(DIERR)  D  S ERRCNT=ERRCNT+1
 . D DBS^RORERR("RORMSG",-99,,RORDFN,55.02,","_RORIENS)
 I $D(RORLST)>1  D
 . N RORAD,RORST,RORTMP,RORTS
 . S RORTMP=$$ALLOC^RORTMP(.RORTS)
 . S RORID="ADD"_CS_"Additive"_CS_"VA080"
 . S RORKEY=""
 . F  S RORKEY=$O(RORLST("DILIST","ID",RORKEY))  Q:'RORKEY  D
 . . S IEN=+$G(RORLST("DILIST","ID",RORKEY,.01))  Q:IEN'>0
 . . D ZERO^PSS52P6(IEN,,,RORTS)
 . . S RORAD=$G(@RORTMP@(IEN,.01))  Q:RORAD=""
 . . S RORST=$G(RORLST("DILIST","ID",RORKEY,.02))
 . . D SETOBX(RORAD,RORID,RORST)
 . D FREE^RORTMP(RORTMP)
 ;
 ;=== Solution Data
 K RORMSG,RORLST
 D LIST^DIC(55.11,","_RORIENS,"@;.01;1","I",,,,,,,"RORLST","RORMSG")
 I $G(DIERR)  D  S ERRCNT=ERRCNT+1
 . D DBS^RORERR("RORMSG",-99,,,55.11,","_RORIENS)
 I $D(RORLST)>1  D
 . N RORSOL,RORVOL,RORTMP,RORTS
 . S RORTMP=$$ALLOC^RORTMP(.RORTS)
 . S RORID="SOL"_CS_"Solution"_CS_"VA080"
 . S RORKEY=""
 . F  S RORKEY=$O(RORLST("DILIST","ID",RORKEY))  Q:'RORKEY  D
 . . S IEN=+$G(RORLST("DILIST","ID",RORKEY,.01))  Q:IEN'>0
 . . D ZERO^PSS52P7(IEN,,,RORTS)
 . . S RORSOL=$G(@RORTMP@(IEN,.01))  Q:RORSOL=""
 . . S RORVOL=$G(RORLST("DILIST","ID",RORKEY,1))
 . . D SETOBX(RORSOL,RORID,RORVOL)
 . D FREE^RORTMP(RORTMP)
 ;
 Q ERRCNT
 ;
 ;*****
GETIENS(RORORD,RORDFN) ;
 N IEN
 S IEN=$O(^PS(55,RORDFN,"IV","B",RORORD,""))
 Q $S(IEN>0:IEN_","_RORDFN_",",1:"")
 ;
 ;***** CREATES AND STORES THE OBX SEGMENT
SETOBX(OBX5,OBX3,OBX7) ;
 N RORSEG
 ;--- Initialize the segment
 S RORSEG(0)="OBX"
 ;--- OBX-2 - Value Type
 S RORSEG(2)="FT"
 ;--- OBX-3 - Obervation Identifier
 S RORSEG(3)=OBX3
 ;--- OBX-5 - Observation Value
 S RORSEG(5)=$$ESCAPE^RORHL7(OBX5)
 ;--- OBX-7 - Strength (additives) or volume (solutions)
 S:$G(OBX7)'="" RORSEG(7)=OBX7
 ;--- OBX-11 - Observation Result Status
 S RORSEG(11)="F"
 ;--- Store the segment
 D ADDSEG^RORHL7(.RORSEG)
 Q
