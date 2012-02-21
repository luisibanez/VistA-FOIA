RORHL071 ;HOIFO/BH - HL7 IV PHARMACY: ORC,RXE ; 1/25/06 12:22pm
 ;;1.5;CLINICAL CASE REGISTRIES;;Feb 17, 2006
 ;
 ; This routine uses the following IAs:
 ;
 ; #2497         Read access to file #55 (controlled)
 ; #10039        Read access to file #42 (supported)
 ; #10060        Read access to file #200 (supported)
 ;
 Q
 ;
 ;***** IV PHARMACY ORC SEGMENT BUILDER
 ;
 ; RORIENS       IENS of IV in subfile #55.01
 ;
 ; .RORORC       Array with info (from OEL^PSOORRL)
 ;
 ; Return Values:
 ;       <0  Error Code
 ;        0  Ok
 ;       >0  Non-fatal error(s)
 ;
ORC(RORIENS,RORORC) ;
 N BUF,CS,ERRCNT,IEN42,IEN44,RC,RORMSG,RORSEG,TMP
 S (ERRCNT,RC)=0
 D ECH^RORHL7(.CS)
 ;--- Check the parameters
 S:$E(RORIENS,$L(RORIENS))'="," RORIENS=RORIENS_","
 ;
 ;--- Initialize the segment
 S RORSEG(0)="ORC"
 ;
 ;--- ORC-1 - Order Control 
 S RORSEG(1)="NW"
 ;
 ;--- ORC-2 - Placer Order Number
 S TMP=$$GET1^DIQ(55.01,RORIENS,.01,,,"RORMSG")
 Q:$G(DIERR) $$DBS^RORERR("RORMSG",-9,,,55.01,RORIENS)
 S RORSEG(2)=RORDFN_"V"_TMP_CS_"IP"
 ;
 ;--- ORC-12 - Provider
 S BUF=+$P($G(RORORC("P",0)),U)
 I BUF>0  D
 . S $P(BUF,CS,13)=$$GET1^DIQ(200,+BUF_",",53.5,"E",,"RORMSG")
 . I $G(DIERR)  D  S ERRCNT=ERRCNT+1
 . . D DBS^RORERR("RORMSG",-99,,,200,+BUF_",")
 . S RORSEG(12)=BUF
 ;
 ;--- ORC-15 - Order Date/Time
 S TMP=$$FMTHL7^XLFDT($P($G(RORORC(0)),U,5))
 Q:TMP'>0 $$ERROR^RORERR(-100,,,,"No order date","OEL^PSOORRL")
 S RORSEG(15)=TMP
 ;
 ;--- ORC-16 - Control Code Reason
 S RORSEG(16)=CS_CS_CS_CS_"NEW"
 ;
 ;--- ORC-17 - Division
 S IEN42=+$$GET1^DIQ(55.01,RORIENS,9,"I",,"RORMSG")
 I $G(DIERR)  D  S ERRCNT=ERRCNT+1
 . D DBS^RORERR("RORMSG",-99,,,55.01,RORIENS)
 I IEN42>0  D
 . S IEN44=+$$GET1^DIQ(42,IEN42_",",44,"I",,"RORMSG")
 . I $G(DIERR)  D  S ERRCNT=ERRCNT+1
 . . D DBS^RORERR("RORMSG",-99,,,42,IEN42_",")
 E  S IEN44=0
 S RORSEG(17)=$$DIV44^RORHLUT1(IEN44,CS)
 ;
 ;--- Store the segment
 D ADDSEG^RORHL7(.RORSEG)
 Q ERRCNT
 ;
 ;***** IV PHARMACY RXE SEGMENT BUILDER
 ;
 ; RORIENS       IENS of Pharmacy Record in subfile #55.01
 ; .RORRXE       Array containing info (from OEL^PSJORRL)
 ;
 ; Return Values:
 ;       <0  Error Code
 ;        0  Ok
 ;       >0  Non-fatal error(s)
 ;
RXE(RORIENS,RORRXE) ;
 N BUF,CS,ERRCNT,IDGN,II,INDF,RC,RORMSG,RORMR,ROROUT,RORQT,RORSEG,TMP
 S (ERRCNT,RC)=0
 D ECH^RORHL7(.CS)
 ;--- Check the parameters
 S:$E(RORIENS,$L(RORIENS))'="," RORIENS=RORIENS_","
 ;
 Q:$P($G(RORRXE(0)),U)="" 0
 ;
 ;--- Load the data
 D GETS^DIQ(55.01,RORIENS,"132;.09","E","ROROUT","RORMSG")
 I $G(DIERR)  D  S ERRCNT=ERRCNT+1
 . D DBS^RORERR("RORMSG",-99,,,55.01,RORIENS)
 S RORMR=$$ESCAPE^RORHL7($G(ROROUT(55.01,RORIENS,132,"E")))
 S TMP=$G(ROROUT(55.01,RORIENS,.09,"E")),RORQT=""
 S:TMP'="" $P(RORQT,CS,8)=$$ESCAPE^RORHL7(TMP)
 ;
 S II=0
 F  S II=$O(RORRXE("DD",II)) Q:II=""  D  Q:RC<0
 . K ROROUT,RORSEG
 . ;--- Initialize the segment
 . S RORSEG(0)="RXE"
 . ;
 . ;--- RXE-1 - Quantity/Timing
 . S RORSEG(1)=RORQT
 . ;
 . ;--- RXE-2 - Give Code
 . S IDGN=+$P($G(RORRXE("DD",II,0)),U)
 . S:IDGN'>0 IDGN=+$P($G(RORRXE("DD",II,0)),U,3)  Q:IDGN'>0
 . S BUF="",TMP=$$RXE2^RORHL031(IDGN,CS,.BUF,.INDF)
 . I TMP  S ERRCNT=ERRCNT+1  Q:TMP<0
 . Q:BUF=""
 . S RORSEG(2)=BUF
 . ;
 . ;--- RXE-3 - Give Amount (Min)
 . S RORSEG(3)=""""""
 . ;
 . ;--- RXE-5 - Give Units
 . S TMP=$$RXE5^RORHL031(+$G(INDF),CS,.BUF)
 . S:TMP ERRCNT=ERRCNT+1
 . S:BUF'="" RORSEG(5)=BUF
 . ;
 . ;--- RXE-18 - Stop Date/Time
 . S TMP=$P($G(RORRXE(0)),U,3)
 . S RORSEG(18)=$$FM2HL^RORHL7(TMP)
 . ;
 . ;--- RXE-21 - Medication Route
 . S:RORMR'="" RORSEG(21)=RORMR
 . ;
 . ;--- RXE-24 - Units per dose
 . S TMP=$P($G(RORRXE("DD",II,0)),U,2)
 . S:TMP'="" RORSEG(24)=+TMP
 . ;
 . ;--- Store the segment
 . D ADDSEG^RORHL7(.RORSEG)
 ;
 Q ERRCNT
