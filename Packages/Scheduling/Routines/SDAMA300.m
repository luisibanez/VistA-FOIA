SDAMA300 ;BPOIFO/ACS-Filter API Validate Filters ; 12/13/04 3:26pm
 ;;5.3;Scheduling;**301,347**;13 Aug 1993
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
 ;
 ;*****************************************************************
 ;
 ;*****************************************************************
 ;
 ;              VALIDATE FILTER ARRAY CONTENTS
 ;INPUT
 ;  SDARRAY    Appointment filters
 ;  SDFLTR     Filter Flag array
 ;
 ;OUTPUT
 ;  -1 if error
 ;   1 if no errors
 ;
 ;*****************************************************************
VALARR(SDARRAY,SDFLTR) ;
 ;Initialize local variables
 N SDI,SDX,SDQUIT,SDDATA,SDCOUNT,SDERR
 S SDQUIT=0,SDERR=115
 ;
 ;Set filter flags and validate input array entries
 F SDI="MAX","FLDS","FLTRS","SORT" Q:SDQUIT  D @SDI
 Q:(SDARRAY("CNT")=-1) -1
 ;filters allowed on these fields
 F SDI=1:1:4,13,16 Q:SDQUIT  D
 . I $G(SDARRAY(SDI))']"" S SDFLTR(SDI)=0
 . E  S SDFLTR(SDI)=1 D
 .. S SDCOUNT=$L(SDARRAY(SDI),";")
 .. S SDQUIT=0
 .. D @SDI
 ;
 I SDQUIT=0 D
 . ;filters not allowed on these fields
 . F SDI=5:1:12,14,15,17:1:SDARRAY("FC") Q:SDQUIT  D NOFIL
 Q SDARRAY("CNT")
 ;
 ;*****************************************************************
 ;
1 ;SDARRAY(1): Appt dates
 ;validate from/to date(/time)s
 D CHKDTES($G(SDARRAY("FR")),$G(SDARRAY("TO")))
 Q:SDQUIT
 ;allow seconds in date/time filter!
 I $L(SDARRAY("FR"))>14 D ERROR(SDERR)
 Q:SDQUIT
 I $L(SDARRAY("TO"))>14 D ERROR(SDERR)
 Q
2 ;SDARRAY(2): Clinic IEN
 ;Clinic must be on ^SC
 ;Clinic list is not in global
 I SDARRAY("CLNGBL")'=1 D
 . ; get each clinic IEN in the string and validate
 . F SDX=1:1:SDCOUNT Q:SDQUIT  D
 .. S SDDATA=$P(SDARRAY(2),";",SDX)
 .. I ($G(SDDATA)=""!'$D(^SC(SDDATA,0))) D ERROR(SDERR)
 ;Clinic list is in global or local array
 I SDARRAY("CLNGBL")=1 D
 . S SDX=SDARRAY(2)
 . ;check for existence of IENs
 . N SDIEN S SDIEN=$O(@(SDX_"0)")) I +$G(SDIEN)=0 D ERROR(SDERR)
 . Q:SDQUIT
 . S SDDATA=0
 . ; get each IEN in the array and validate
 . F  S SDDATA=$O(@(SDX_"SDDATA)")) Q:(($G(SDDATA)="")!(SDQUIT))  D
 .. I '$D(^SC(SDDATA,0)) D ERROR(SDERR)
 Q
3 ;SDARRAY(3): Appointment Status Code
 F SDX=1:1:SDCOUNT Q:SDQUIT  D
 . S SDDATA=";"_$P(SDARRAY(3),";",SDX)_";"
 . I ";I;R;NT;NS;NSR;CC;CCR;CP;CPR;"'[(SDDATA) D ERROR(SDERR)
 Q
4 ;SDARRAY(4): Patient DFN
 ;patient must be on ^DPT
 ;DFN list is not in global
 I SDARRAY("PATGBL")'=1 D
 . ; get each DFN in the string and validate
 . F SDX=1:1:SDCOUNT Q:SDQUIT  D
 .. S SDDATA=$P(SDARRAY(4),";",SDX)
 .. I $G(SDDATA)="" D ERROR(SDERR)
 .. Q:SDQUIT
 .. I '$D(^DPT(SDDATA)) D ERROR(SDERR)
 .. Q:SDQUIT
 ;DFN list is in global or local array
 I SDARRAY("PATGBL")=1 D
 . S SDX=SDARRAY(4)
 . ;check for existence of DFNs
 . N SDDFN S SDDFN=$O(@(SDX_"0)")) I +$G(SDDFN)=0 D ERROR(SDERR)
 . Q:SDQUIT
 . S SDDATA=0
 . ; get each DFN in the array and validate
 . F  S SDDATA=$O(@(SDX_"SDDATA)")) Q:(($G(SDDATA)="")!(SDQUIT))  D
 .. I '$D(^DPT(SDDATA)) D ERROR(SDERR)
 .. Q:SDQUIT
 Q
13 ;SDARRAY(13): Primary Stop Code
 ;primary stop code must exist on ^DIC(40.7
 N SDY,SDVALID
 S SDVALID=0
 F SDX=1:1:SDCOUNT Q:SDQUIT  D
 . S SDDATA=$P(SDARRAY(13),";",SDX) D
 .. I (($G(SDDATA)<1)!($G(SDDATA)>999)) S SDQUIT=1 Q 
 .. ;I '$D(^DIC(40.7,SDDATA)) S SDQUIT=1 Q
 .. S SDVALID=0,SDY=0
 .. F  S SDY=$O(^DIC(40.7,SDY)) Q:((SDY="")!(SDVALID=1))  D
 ... I SDDATA=$P($G(^DIC(40.7,SDY,0)),"^",2) S SDVALID=1
 .. I SDVALID=0 S SDQUIT=1
 I SDQUIT D ERROR(SDERR)
 Q
16 ;SDARRAY(16): Date Appointment Made
 ;validate from/to date(s)
 D CHKDTES($G(SDARRAY("DAMFR")),$G(SDARRAY("DAMTO")))
 Q:SDQUIT
 ;ensure time not entered
 I $L(SDARRAY("DAMFR"))>7 D ERROR(SDERR)
 Q:SDQUIT
 I $L(SDARRAY("DAMTO"))>7 D ERROR(SDERR)
 Q
NOFIL ;No filter allowed
 I $G(SDARRAY(SDI))]"" D ERROR(SDERR)
 Q
FMDATE(SDDATE,SDERR) ;
 ;dates must be valid internal FileMan format
 N X,Y,%H,%T,%Y
 S Y=SDDATE D DD^%DT I Y=-1 D ERROR(SDERR)
 Q:SDQUIT
 ;dates cannot be imprecise
 S X=SDDATE D H^%DTC I %H=0 D ERROR(SDERR)
 Q
CHKDTES(SDFROM,SDTO) ;validate date(/time)s
 N SDI,X,Y,%DT
 S %DT="STX"
 F SDI=SDFROM,SDTO Q:SDQUIT  D
 .;valid fileman format
 .I $G(SDI)'="" D
 ..D FMDATE(SDI,SDERR)
 ..Q:SDQUIT
 ..;date(/time) must be numeric
 ..I SDI'=+(SDI) D ERROR(SDERR)
 ..;check for valid dates / leap yr dates
 ..I SDI'[9999999 D
 ...S X=$$FMTE^XLFDT(SDI)
 ...D ^%DT
 ...I Y<0 D ERROR(SDERR)
 .Q:SDQUIT
 Q:SDQUIT
 ;from date(/time) can't be after to  date(/time)
 I SDFROM>SDTO D ERROR(SDERR)
 Q
MAX ;Maximum number of appointments requested
 ;max can't be 0
 N SDMAXAPT,SDPCOUNT,SDCCOUNT
 S SDMAXAPT=$G(SDARRAY("MAX"))
 S (SDPCOUNT,SDCCOUNT)=0
 I $G(SDMAXAPT)]"" D
 . ;Check Max Entry
 . I +SDMAXAPT'=SDMAXAPT S SDQUIT=1 Q
 . I SDMAXAPT=0 S SDQUIT=1 Q
 . I SDMAXAPT["." S SDQUIT=1 Q
 . ;Verify a SINGLE valid PATIENT &/OR CLINIC Entry
 . ;Get Number of Patients passed in
 . I SDARRAY("PATGBL")=1 S SDPCOUNT=$$CHKGBL(SDARRAY(4))
 . I SDARRAY("PATGBL")=0 S SDPCOUNT=$L(SDARRAY(4),";")
 . ;Get Number of Clinics passed in
 . I SDARRAY("CLNGBL")=1 S SDCCOUNT=$$CHKGBL(SDARRAY(2))
 . I SDARRAY("CLNGBL")=0 S SDCCOUNT=$L(SDARRAY(4),";")
 . I (SDPCOUNT>1)!(SDCCOUNT>1) S SDQUIT=1 Q
 . I SDPCOUNT=0,SDCCOUNT=0 S SDQUIT=1
 I SDQUIT D ERROR(SDERR)
 Q
 ;
FLDS ;Quit if field list is null
 N SDFIELDS,SDFIELD
 I $G(SDARRAY("FLDS"))="" D ERROR(SDERR)
 Q:SDQUIT
 S SDFIELDS=SDARRAY("FLDS")
 S SDCOUNT=$L(SDFIELDS,";")
 F SDI=1:1:SDCOUNT Q:SDQUIT  D
 . S SDFIELD=$P(SDFIELDS,";",SDI)
 . I (($G(SDFIELD)'?.N)!($G(SDFIELD)<1)!($G(SDFIELD)>SDARRAY("FC"))) D ERROR(SDERR) S SDQUIT=1
 Q
 ;
FLTRS ;Quit if max filters exceeded
 N SDFCNT S SDFCNT=0
 F SDI=1:1:SDARRAY("FC") D
 . I $G(SDARRAY(SDI))]"" S SDFCNT=SDFCNT+1
 I SDFCNT>SDARRAY("MF") D ERROR(SDERR) S SDQUIT=1
 Q
 ;
SORT ;Quit if SORT Filter is a value other than P or null
 N SDSORT
 S SDSORT=$G(SDARRAY("SORT"))
 I $G(SDSORT)="" Q
 I '($G(SDSORT)="P") D ERROR(SDERR)
 Q
 ;
ERROR(SDERRNUM) ;Generate Error and put in ^TMP global
 S SDARRAY("CNT")=-1,SDQUIT=1
 S $P(^TMP($J,"SDAMA301",SDERRNUM),"^",1)=$P($T(@SDERRNUM),";;",2)
 Q
 ;
 ;Error code 101 is not used yet
101 ;;DATABASE IS UNAVAILABLE
115 ;;INVALID INPUT ARRAY ENTRY
116 ;;DATA MISMATCH
 ;
CHKGBL(SDGBL) ;Check Global for number of entries
 N SDIEN,SDCOUNT
 S (SDIEN,SDCOUNT)=0
 F  S SDIEN=$O(@(SDGBL_"SDIEN)"))  Q:(+$G(SDIEN)=0)!(SDCOUNT>2)  D
 .S SDCOUNT=SDCOUNT+1
 Q SDCOUNT
