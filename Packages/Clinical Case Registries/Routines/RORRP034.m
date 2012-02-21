RORRP034 ;HCIOFO/SG - RPC: HIV PATIENT SAVE/CANCEL ; 11/29/05 8:49am
 ;;1.5;CLINICAL CASE REGISTRIES;;Feb 17, 2006
 ;
 Q
 ;
 ;***** UPDATES THE PATIENT'S REGISTRY DATA
 ; RPC: [RORICR PATIENT SAVE]
 ;
 ; .RESULTS      Reference to a local variable where the results
 ;               are returned to.
 ;
 ; REGIEN        Registry IEN
 ;
 ; PTIEN         IEN of the registry patient (DFN)
 ;
 ; [CANCEL]      Cancel the update and unlock the registry data
 ;
 ; .DATA         Reference to a local array that contains the data
 ;               in the same format as the output of the RORICR
 ;               PATIENT LOAD remote procedure. Only PH, ICR, and
 ;               LFV segments are processed; the others are ignored.
 ;
 ; Return Values:
 ;
 ; A negative value of the first "^"-piece of the RESULTS(0)
 ; indicates an error (see the RPCSTK^RORERR procedure for more
 ; details).
 ;
 ; Otherwise, zero is returned in the RESULTS(0).
 ;
SAVE(RESULTS,REGIEN,PTIEN,CANCEL,DATA) ;
 N IENS,LOCK,RC,RORERRDL
 D CLEAR^RORERR("SAVE^RORRP034",1)
 K RESULTS  S (RESULTS(0),RC)=0
 D
 . ;--- Registry IEN
 . I $G(REGIEN)'>0  D  Q
 . . S RC=$$ERROR^RORERR(-88,,,,"REGIEN",$G(REGIEN))
 . S REGIEN=+REGIEN
 . ;--- Patient IEN
 . I $G(PTIEN)'>0  D  Q
 . . S RC=$$ERROR^RORERR(-88,,,,"PTIEN",$G(PTIEN))
 . S PTIEN=+PTIEN
 . ;--- Get the IENS of the registry record
 . S IENS=$$PRRIEN^RORUTL01(PTIEN,REGIEN)_","
 . S:IENS>0 (LOCK(798,IENS),LOCK(799.4,IENS))=""
 . Q:$G(CANCEL)
 . ;--- Save the data
 . S RC=$$SAVE1(.IENS)
 . I '$D(LOCK)  S:IENS>0 (LOCK(798,IENS),LOCK(799.4,IENS))=""
 . S:RC>0 RESULTS(0)=RC
 ;
 ;--- Do not unlock the records if there are errors in the data
 ;    (positive value is returned by the $$SAVE1), since the user
 ;--- will have another chance to correct the data and save it.
 D:RC'>0 UNLOCK^RORLOCK(.LOCK)
 D:RC<0 RPCSTK^RORERR(.RESULTS,RC)
 Q
 ;
 ;***** INTERNAL ENTRY POINT THAT UPDATES THE REGISTRY DATA
SAVE1(IENS798) ;
 N IENS,LFIEN,LFV,RC,RDI,REGNAME,RORFDA,RORMSG,SEG,TMP
 ;
 ;=== Add the patient to the registry if necessary
 I IENS798'>0  S RC=0  D  Q:RC<0 RC
 . S REGNAME=$P($$REGNAME^RORUTL01(REGIEN),U)
 . ;--- Add the patient to the registry
 . S RC=$$ADDPAT^RORUPD06(PTIEN,REGNAME)  Q:RC<0
 . ;--- Get the IENS of the registry record
 . S IENS798=$$PRRIEN^RORUTL01(PTIEN,REGIEN)_","
 . S:IENS798'>0 RC=$$ERROR^RORERR(-97,,,PTIEN,REGNAME)
 ;
 ;=== Prepare the data
 S (LFCNT,RDI,RC)=0
 F  S RDI=$O(DATA(RDI))  Q:RDI'>0  D  Q:RC
 . S SEG=$P(DATA(RDI),U)
 . ;--- Risk factors
 . I SEG="PH"  D  Q
 . . S RC=$$CDCFDA^RORRP026(IENS798,"PH^RORRP026",DATA(RDI),.RORFDA)
 . ;--- Registry data
 . I SEG="ICR"  D  Q
 . . S TMP=$P(DATA(RDI),U,3)
 . . S RORFDA(799.4,IENS798,.02)=TMP
 . . S RORFDA(799.4,IENS798,.03)=$S(TMP:$P(DATA(RDI),U,4),1:"")
 . ;--- Local field values
 . I SEG="LFV"  D  Q
 . . S LFIEN=+$P(DATA(RDI),U,3)
 . . S:LFIEN>0 LFV(LFIEN)=DATA(RDI)
 Q:RC RC
 ;
 ;=== Confirm the pending patient
 D:$$GET1^DIQ(798,IENS798,3,"I",,"RORMSG")=4
 . ;--- Do not clear the DON'T SEND flag for 'test' patients
 . S:'$$TESTPAT^RORUTL01(PTIEN) RORFDA(798,IENS798,11)="@"
 . ;--- Change the STATUS from 'Pending' to 'Active'
 . S RORFDA(798,IENS798,3)=0
 ;
 ;=== Update the local fields
 I $D(LFV)>1  D  Q:RC<0 RC
 . S RORFDA(798,IENS798,5)=1  ; UPDATE LOCAL REGISTRY DATA
 . S RC=$$UPDLFV^RORUTL19(IENS798,.LFV)
 ;
 ;=== Update the record(s)
 I $D(RORFDA)>1  D  Q:RC<0 RC
 . S RORFDA(798,IENS798,5)=1  ; UPDATE LOCAL REGISTRY DATA
 . D FILE^DIE(,"RORFDA","RORMSG")
 . S:$G(DIERR) RC=$$DBS^RORERR("RORMSG",-9,,PTIEN,"798&799.4",IENS798)
 ;
 ;=== Success
 Q 0
