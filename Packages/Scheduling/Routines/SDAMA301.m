SDAMA301 ;BPOIFO/ACS-Filter API Main Entry ;12/13/04 3:21pm
 ;;5.3;Scheduling;**301,347,426**;13 Aug 1993
 ;
 ;**   BEFORE USING THE API IN THIS ROUTINE, PLEASE SUBSCRIBE    **
 ;**   TO DBIA #4433                                             **
 ;
 ;*****************************************************************
 ;              CHANGE LOG
 ;
 ;  DATE      PATCH       DESCRIPTION
 ;--------  ----------    -----------------------------------------
 ;12/04/03  SD*5.3*301    ROUTINE COMPLETED
 ;08/06/04  SD*5.3*347    ADDITION OF A NEW FILTER - DATE APPOINTMENT
 ;                        MADE (FIELD #16) AND 2 NEW FIELDS TO RETURN:
 ;                        1) AUTO-REBOOKED APPT DATE/TIME (FIELD #24)
 ;                        2) NO-SHOW/CANCEL APPT DATE/TIME (FIELD #25)
 ;                        INCREASE NUMBER OF FILTERS ALLOWED TO 6
 ;*****************************************************************
 ;
 ;*****************************************************************
 ;
 ;               GET APPOINTMENT DATA
 ;
 ;INPUT
 ;  SDINPUT   Appointment Filters (required)
 ;  
 ;OUTPUT
 ;    Extrinsic call returns: 
 ;      -1 if error
 ;      Appointment count if no error
 ;    If no error, data returned in:
 ;      ^TMP($J,"SDAMA301",SORT1,SORT2,Appt Date/Time)=DATAn^DATAn^..
 ;      where SORT1 is first sort (patient or clinic), SORT2 is
 ;      second sort (patient or clnic), and DATAn
 ;      is the appointment data requested
 ;    If errors, error codes and messages returned in:
 ;      ^TMP($J,"SDAMA301",error_code)=error_message
 ;  
 ;*****************************************************************
SDAPI(SDINPUT) ;
 K ^TMP($J,"SDAMA301")
 ;Initialize global variables
 N SDDV,SDI,SDARRAY,SDQUIT,SDFLTR,SDTEMP
 S (SDARRAY("CNT"),SDARRAY("RSA"),SDQUIT,SDFLTR,SDTEMP)=0
 ;Set Field Count and Max Filter variables
 S SDARRAY("FC")=25,SDARRAY("MF")=6
 ;Copy input array into "working" array
 F SDI=1:1:SDARRAY("FC") S SDARRAY(SDI)=$G(SDINPUT(SDI))
 S SDARRAY("FLDS")=$G(SDINPUT("FLDS"))
 S SDARRAY("MAX")=$G(SDINPUT("MAX"))
 S SDARRAY("SORT")=$G(SDINPUT("SORT"))
 ;Initialize Input Array Filters as needed. Quit if error
 D INITAE^SDAMA306(.SDARRAY)
 Q:SDQUIT -1
 ;Validate Input Array Filters.  Quit if error
 I ($$VALARR^SDAMA300(.SDARRAY,.SDFLTR)=-1) S SDQUIT=1
 Q:SDQUIT -1
 ;
 ;If Patient DFN populated, process by patient
 I $G(SDARRAY(4))]"" D
 . ;set RSA flag to true
 . S SDARRAY("RSA")=1
 . ;get data
 . D PAT^SDAMA303(.SDARRAY,.SDDV,.SDFLTR)
 ;
 ;If Patient DFN is not populated, process by clinic
 I $G(SDARRAY(4))']"" D
 . D CLIN^SDAMA302(.SDARRAY,.SDDV,.SDFLTR)
 ;
 ;--Phase II--
 N SDRSA
 S SDRSA=0
 ;If RSA flag = "true" and RSA implemented, get data from RSA
 I SDARRAY("RSA"),$$IMP^SDAMA307(1) D DATA^SDAMA307(.SDARRAY)
 ;
 ;Pass back appointment count
 Q SDARRAY("CNT")
