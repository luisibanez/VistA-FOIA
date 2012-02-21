SDAMA307 ;BPOIFO/ACS-Filter API Call RSA ;04 Dec 2003 [5/13/04 1:49pm]
 ;;5.3;Scheduling;**301**;13 Aug 1993
 ;
 ;**              GET APPOINTMENT DATA FROM RSA                  **
 ;
 ;*****************************************************************
 ;              CHANGE LOG
 ;
 ;  DATE      PATCH       DESCRIPTION
 ;--------  ----------    -----------------------------------------
 ;12/04/03  SD*5.3*301    ROUTINE COMPLETED
 ;
 ;*****************************************************************
 ;  
DATA(SDARRAY) ;Get RSA appointment data (Phase II)
 Q
 ;Initialize variables
 ;Get VistA Instance
 N SDVI,SDERROR,SDRSA
 S SDERROR=0,SDRSA=0
 ;Set up XML for call to RSA
 D XML
 ;Call RSA if available
 I '$$AVAIL(1) S SDERROR=1
 E  D 
 . ;move migrated clinic list to correct array node
 . I $G(SDARRAY("MIG"))]"" S SDARRAY(2)=SDARRAY("MIG")
 . S SDRSA=$$CALL(.SDARRAY)
 . ;flag if error from RSA
 . I SDRSA=-1 S SDERROR=1
 ;if no errors and RSA returned data, add RSA data to VistA data
 I 'SDERROR I SDRSA D ADD^SDAMA306
 ;if error, delete VistA output and generate error msg 101
 I SDERROR D
 . ;database is not available
 . K ^TMP($J,"SDAMA301")
 . D ERROR^SDAMA300(101)
 Q
AVAIL(SDX) ;If RSA is available (VistA Link running), return 1 else return -1
 Q 1
IMP(SDX) ;If RSA Implemented, return 1 else return 0
 Q 0
CLMIG(SDCLIEN) ;If Clinic has migrated, return 1 else return 0
 Q 0
XML ;Set up XML for call to RSA
 Q
CALL(SDX) ;Call RSA and return appt count
 Q 0
