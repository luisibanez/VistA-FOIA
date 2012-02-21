BPSOSO ;BHAM ISC/FCS/DRS/DLF - "O" is for Override NCPDP field values ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ; 
 ; File 9002313.511 BPS NCPDP OVERRIDE
 ; It acts like an extension of the ^PSRX entry,
 ; though it's not tied to ^PSRX in any structural way.
 ; ^PSRX has a pointer to this file.
 ;
 ; IHS/SD/lwj 8/20/02 NCPDP 5.1 changes
 ; In 5.1 there is now some repeating fields/records.  The DUR/PPS
 ; segment is a repeating segment (i.e. all the fields in this
 ; segment repeat.)  Much like the values for the BPS NCPDP 
 ; Overrides are stored in a separate file, and referenced in
 ; the prescription file, the DUR/PPS values will be stored in
 ; a separate file (BPS DUR/PPS) and simply referenced in the 
 ; prescription file.  For this reason, I'm adding the retrieval
 ; of the prescription DUR/PPS pointer in this routine to keep
 ; things consistent. (Site must have Outpatient Pharmacy V6.0
 ; Patch 4 loaded for the DUR/PPS field to be found.)
 ; 
 Q
 ;
OVERRIDE(IEN)  ; main entry point
 ; IEN points to file 9002313.511
 ; Sometimes we have IEN; sometimes we don't
 ; called from pharmacy package
 ; called from somewhere in POS, too
 I $D(IEN) D
 . I '$D(^BPS(9002313.511,IEN)) D  ; it must have been winnowed
 . . S IEN=$$NEW^BPSOSO2
 E  D
 . I '$D(IEN) S IEN=$$NEW^BPSOSO2
 I 'IEN N RETVAL S RETVAL=$$IMPOSS^BPSOSUE("FM,P","TI","Failed to create Overrides record / or bad parameter in call",,"OVERRIDE",$T(+0)) Q ""
 D MENU^BPSOSO1(IEN)
 Q IEN
OVERRIDR(RXI,RXR)  ; alternative entry point - given RXI,RXR instead of IEN
 N IEN
 I $G(RXR) S IEN=$$GETIEN(RXI,RXR)
 E  S IEN=$$GETIEN(RXI)
 S IEN=$$OVERRIDE(IEN)
 Q IEN
GETIEN(RXI,RXR) ;EP -  also called from claim construction
 N IEN
 I $G(RXR) S IEN=$P($G(^PSRX(RXI,1,RXR,9999999)),U,12)
 E  S IEN=$P($G(^PSRX(RXI,9999999)),U,12)
 Q IEN
 ;
 ;
GETDUR(RXI,RXR) ;EP -  also called from claim construction
 ;IHS/SD/lwj 8/20/02  NCPDP 5.1 changes - retrieve DUR/PPS pointer 
 ; from the prescription file
 N IEN
 I $G(RXR) S IEN=$P($G(^PSRX(RXI,1,RXR,9999999)),U,13)
 E  S IEN=$P($G(^PSRX(RXI,9999999)),U,13)
 Q IEN
