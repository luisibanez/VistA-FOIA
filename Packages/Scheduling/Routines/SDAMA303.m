SDAMA303 ;BPOIFO/ACS-Filter API By Patient ;04 Dec 2003
 ;;5.3;Scheduling;**301,347**;13 Aug 1993
 ;
 ;*****************************************************************
 ;              CHANGE LOG
 ;
 ;  DATE      PATCH       DESCRIPTION
 ;--------  ----------    -----------------------------------------
 ;12/04/03  SD*5.3*301    ROUTINE COMPLETED
 ;08/06/04  SD*5.3*347    CHANGE CALL TO ^SDAMA305 TO SETARRAY
 ;
 ;*****************************************************************
 ;
 ;*****************************************************************
 ;
 ;               GET APPOINTMENT DATA BY PATIENT
 ;
 ;INPUT
 ;  SDARRAY   Appointment Filter array
 ;  SDDV      Appointment Data Values array
 ;  SDFLTR    Filter Flags array
 ;  
 ;*****************************************************************
PAT(SDARRAY,SDDV,SDFLTR) ;
 N SDCOUNT,SDX,SDQUIT,SDPATIEN,SDSTART,SDEND,SDGBL
 S (SDCOUNT,SDQUIT)=0
 ;Set up start and end date/times for search criteria
 I $G(SDARRAY("MAX"))'<0  D
 .S SDSTART=$S(SDARRAY("FR")'="":(SDARRAY("FR")-.000001),1:0)
 .S SDEND=(SDARRAY("TO"))
 I $G(SDARRAY("MAX"))<0  D
 .S SDSTART=$S($G(SDARRAY("FR"))'="":SDARRAY("FR"),1:0)
 .S SDEND=(SDARRAY("TO")+.000001)
 ;
 ;if patient is not in global, get patient from filter list
 I SDARRAY("PATGBL")=0 D
 . S SDCOUNT=$L(SDARRAY(4),";")
 . ;for each patient in the filter:
 . F SDX=1:1:SDCOUNT D
 .. S SDPATIEN=$P(SDARRAY(4),";",SDX)
 .. D GETAPPT(SDPATIEN,SDSTART,SDEND,.SDARRAY)
 ;if patient is in global, get patient from global
 I SDARRAY("PATGBL")=1 D
 . S SDGBL=SDARRAY(4),SDPATIEN=0
 . ;for each patient in the global:
 . F  S SDPATIEN=$O(@(SDGBL_"SDPATIEN)")) Q:+$G(SDPATIEN)=0  D
 .. D GETAPPT(SDPATIEN,SDSTART,SDEND,.SDARRAY)
 Q
 ;
GETAPPT(SDPATIEN,SDSTART,SDEND,SDARRAY) ;
 ;if the patient has no appointments on ^DPT, get next patient
 Q:'$D(^DPT(SDPATIEN,"S"))
 ;since "by patient", 1st sort is patient
 S (SDARRAY("SORT1"),SDARRAY("PAT"))=SDPATIEN
 N SDAPPTDT
 ;
 ;get first "N" appointments
 I $G(SDARRAY("MAX"))'<0  D
 .S SDAPPTDT=SDSTART
 .;Spin through each appointment on DPT for current patient
 .F  S SDAPPTDT=$O(^DPT(SDPATIEN,"S",SDAPPTDT)) Q:$S(+$G(SDAPPTDT)=0:1,SDAPPTDT>SDEND:1,SDARRAY("CNT")=$G(SDARRAY("MAX")):1,1:0)  D
 .. D GETINFO(SDPATIEN,SDAPPTDT,.SDARRAY)
 ;
 ;get last "N" appointments
 I $G(SDARRAY("MAX"))<0  D
 .S SDAPPTDT=SDEND
 .;spin through each appointment on DPT for current patient (REVERSE Order)
 .F  S SDAPPTDT=$O(^DPT(SDPATIEN,"S",SDAPPTDT),-1) Q:$S(+$G(SDAPPTDT)=0:1,SDAPPTDT<SDSTART:1,SDARRAY("CNT")=-$G(SDARRAY("MAX")):1,1:0)  D
 .. D GETINFO(SDPATIEN,SDAPPTDT,.SDARRAY)
 Q
 ;
GETINFO(SDPATIEN,SDAPPTDT,SDARRAY) ;
 N SDMATCH,SDCLINIC,SDA,SDQUIT
 S SDQUIT=0
 ; initialize array to hold data values
 S SDARRAY("DPT0")=$G(^DPT(SDPATIEN,"S",SDAPPTDT,0))
 S SDARRAY("DPT1")=$G(^DPT(SDPATIEN,"S",SDAPPTDT,1))
 S SDARRAY("DATE")=SDAPPTDT
 ;appointment must match the "patient" filter values
 I $$MATCH^SDAMA304("P",.SDARRAY,.SDFLTR,.SDDV) D
 . ;set clinic appointment data to null and get clinic
 . S (SDARRAY("SC0"),SDARRAY("SCC"),SDARRAY("SCOB"))=""
 . S SDCLINIC=+$G(SDARRAY("DPT0"))
 . ;quit if clinic is null(0)
 . Q:SDCLINIC=0
 . S SDARRAY("CLIN")=SDCLINIC
 . ;since "by patient", 2nd sort is clinic
 . S SDARRAY("SORT2")=SDCLINIC
 . ;make sure clinic has not migrated
 . Q:($$CLMIG^SDAMA307(SDCLINIC))
 . S SDMATCH=1
 . ;if appointment is not cancelled on ^DPT, find corresponding appt on ^SC
 . ;and get data
 . I ";C;CA;PC;PCA;"'[(";"_$P($G(SDARRAY("DPT0")),"^",2)_";") D
 .. N SDCANCEL
 .. S SDQUIT=0,SDA=0,SDMATCH=0
 .. ;for current clinic and appt d/t, find matching appt on ^SC
 .. F  S SDA=$O(^SC(SDCLINIC,"S",SDAPPTDT,1,SDA)) Q:(($G(SDA)="")!(SDQUIT=1))  D
 ... S SDCANCEL=0
 ... ;get next appt if patient doesn't match
 ... Q:(+$G(^SC(SDCLINIC,"S",SDAPPTDT,1,SDA,0))'=SDPATIEN)
 ... ;get appointment data on ^SC
 ... S SDARRAY("SC0")=$G(^SC(SDCLINIC,"S",SDAPPTDT,1,SDA,0))
 ... ;get next appt if cancelled on SC
 ... S SDCANCEL=$P($G(SDARRAY("SC0")),"^",9)
 ... Q:($G(SDCANCEL)="C")
 ... ;get appointment "C" node on ^SC
 ... S SDARRAY("SCC")=$G(^SC(SDCLINIC,"S",SDAPPTDT,1,SDA,"C"))
 ... ;get appointment "OB" node on ^SC
 ... S SDARRAY("SCOB")=$G(^SC(SDCLINIC,"S",SDAPPTDT,1,SDA,"OB"))
 ... ;Corresponding appointment found on ^SC
 ... S SDQUIT=1,SDMATCH=1
 . ;if appointment matches the clinic filters, put appointment data into output array
 . I SDMATCH D
 .. I $$MATCH^SDAMA304("C",.SDARRAY,.SDFLTR,.SDDV) D SETARRAY^SDAMA305(.SDFLTR,.SDARRAY)
 Q
