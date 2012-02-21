PXRMETXR ; SLC/PJH - Reminder section of extract ;12/16/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ; 
 ; Called from PXRMETX
 ;
UPD(CNT) ;Update totals
 S DATA=$G(^TMP("PXRMETX",$J,SEQ,INST,RCNT,GSEQ,FSEQ))
 ;Total count
 S $P(DATA,U,2)=$P(DATA,U,2)+CNT
 ;Applicable count
 S $P(DATA,U,3)=$P(DATA,U,3)+(APPL*CNT)
 ;Not applicable count
 I 'APPL,'DUE S $P(DATA,U,4)=$P(DATA,U,4)+CNT
 ;Due count
 S $P(DATA,U,5)=$P(DATA,U,5)+(DUE*CNT)
 ;Not due count
 I APPL,'DUE S $P(DATA,U,6)=$P(DATA,U,6)+CNT
 ;Update current count
 S ^TMP("PXRMETX",$J,SEQ,INST,RCNT,GSEQ,FSEQ)=DATA
 Q
 ;
DATE ;Check if finding is most recent in evaluation group
 N FDATE,GDATE
 ;Determine finding date and existing group date
 S FDATE=$G(FIEV(FNUM,"DATE")),GDATE=$G(GROUP(GSEQ,"DATE")) Q:FDATE=""
 ;Ignore findings outside to the extract period
 ;I $$FMDIFF^XLFDT(PXRMSTRT,FDATE,2)>0 Q
 ;If this is first or only entry in group then save finding date
 I 'GDATE S GROUP(GSEQ,"DATE")=FDATE,GROUP(GSEQ)=FSEQ Q
 ;Save finding if most recent date for the group
 I $$FMDIFF^XLFDT(FDATE,GDATE,2)>0 S GROUP(GSEQ,"DATE")=FDATE,GROUP(GSEQ)=FSEQ Q
 Q
 ;
FIND(SEQ,RCNT,PXRMSTRT,PXRMSTOP) ;Process findings for reminder
 ;
 ;Default is extract no findings
 N DATA,FCNT,FIEN,FIND,FNUM,FSEQ,GDATA,GROUP,GSEQ,GTYP
 S FNUM=0,FCNT=0
 F  S FNUM=$O(FIEV(FNUM)) Q:'FNUM  D
 .;Ignore if not found for patient
 .I +FIEV(FNUM)=0 Q
 .;Only terms are counted
 .S FIND=$G(FIEV(FNUM,"TERM IEN")) Q:FIND=""
 .;Check if in list to be accumulated
 .I '$D(REM(RCNT,FIND)) Q
 .;Find groups to which finding belongs
 .S GSEQ=""
 .F  S GSEQ=$O(REM(RCNT,FIND,GSEQ)) Q:GSEQ=""  D
 ..;Determine Evaluation type
 ..S GTYP=REM(RCNT,FIND,GSEQ)
 ..;Ignore utilization groups
 ..I GTYP="UR" Q
 ..;Sequence determines where the finding will be stored
 ..S FSEQ=""
 ..F  S FSEQ=$O(REM(RCNT,FIND,GSEQ,FSEQ)) Q:FSEQ=""  D
 ...;Evaluation Group logic to save latest entry only
 ...I GTYP="MRFP" D DATE Q
 ...;Save finding totals
 ...D UPD(1)
 ;
 ;Check for group totals
 S GSEQ=""
 F  S GSEQ=$O(GROUP(GSEQ)) Q:GSEQ=""  D
 .S GDATA=$G(GROUP(GSEQ)) Q:GDATA=""
 .;Update if found
 .S FSEQ=$P(GDATA,U) D UPD(1)
 ;
 ;Utilization counts are done separately
 N CNT,FDATA,GTYP,FIND,FINDPA,FTIEN,PLIST,TLIST
 ;modify start date to include incomplete dates
 I $E(PXRMSTRT,6,7)="01" S PXRMSTRT=$E(PXRMSTRT,1,5)_"00"
 ;Include incomplete dates in January
 I $E(PXRMSTRT,4,5)="01" S PXRMSTRT=$E(PXRMSTRT,1,3)_"0000"
 ;Set start and stop dates for term
 S $P(FINDPA(0),U,8)=PXRMSTRT,$P(FINDPA(0),U,11)=PXRMSTOP
 ;Count all entries
 S $P(FINDPA(0),U,14)="*"
 ;
 S FTIEN="",GTYP="UR"
 F  S FTIEN=$O(FUTIL(RCNT,FTIEN)) Q:FTIEN=""  D
 .S GSEQ=""
 .F  S GSEQ=$O(FUTIL(RCNT,FTIEN,GSEQ)) Q:GSEQ=""  D
 ..S FSEQ=""
 ..F  S FSEQ=$O(FUTIL(RCNT,FTIEN,GSEQ,FSEQ)) Q:FSEQ=""  D
 ...;Recover list of term findings
 ...K TLIST M TLIST=FUTIL(RCNT,FTIEN,GSEQ,FSEQ)
 ...;Process term 
 ...K PLIST D EVALTERM^PXRMTERM(DFN,.FINDPA,.TLIST,.PLIST)
 ...;Determine count from PLIST then add to ETX
 ...S CNT=+$O(PLIST(1,999999),-1) Q:'CNT
 ...D UPD(CNT)
 Q
 ;
REM(SUB,PXRMLIST,PXRMSTRT,PXRMSTOP,PARTYPE) ;Run reminders against patient lists
 N DATA,DEFARR,FRIEN,FUTIL,PXRMDATE,RCNT,REM,RIEN,RNAM,TODAY
 ;Scan reminders for this parameter set
 S RCNT=0,SUB1=0
 F  S SUB1=$O(^PXRM(810.2,IEN,10,SUB,10,SUB1)) Q:'SUB1  D
 .S DATA=$G(^PXRM(810.2,IEN,10,SUB,10,SUB1,0)) Q:DATA=""
 .;Reminder ien
 .S RIEN=$P(DATA,U,2) Q:'RIEN
 .;Evaluation date is period end
 .S PXRMDATE=PXRMSTOP,TODAY=$$DT^XLFDT
 .;Except if the period is incomplete
 .I $$FMDIFF^XLFDT(PXRMDATE,TODAY,2)>0 S PXRMDATE=TODAY
 .;Finding Rule
 .S FRIEN=$P(DATA,U,3)
 .;Reminder print name
 .S RNAM=$P($G(^PXD(811.9,RIEN,0)),U,3)
 .;Save details to REM array
 .S RCNT=RCNT+1,REM(RCNT)=RIEN_U_RNAM_U_FRIEN
 .;Build list of terms from extract finding rule #810.7
 .I FRIEN D FRULE(FRIEN,RCNT,SEQ,.REM,.FUTIL) Q
 .;If no extract finding rule defined collect all findings in reminder
 .I 'FRIEN D REMF(RIEN,RCNT,SEQ,.REM)
 ;
 ;Process patient list
 N APPL,DATA,DEFAULT,DEMARR,DFN,DOD,DUE,EVAL,FIEV,FRIEN,INST
 N RCNT,RIEN,RNAM,STATUS,SUB
 S SUB=0,DEFAULT=+$P($$SITE^VASITE,U,3)
 F  S SUB=$O(^PXRMXP(810.5,PXRMLIST,30,SUB)) Q:'SUB  D
 .S DFN=$P($G(^PXRMXP(810.5,PXRMLIST,30,SUB,0)),U) Q:'DFN
 .S INST=$P($G(^PXRMXP(810.5,PXRMLIST,30,SUB,0)),U,2)
 .I INST="" S INST=DEFAULT
 .;Get patient demographic data
 .D DEM^PXRMPINF(DFN,PXRMSTOP,.DEMARR)
 .S RCNT=0
 .F  S RCNT=$O(REM(RCNT)) Q:'RCNT  D
 ..S RIEN=$P(REM(RCNT),U),RNAM=$P(REM(RCNT),U,2),FRIEN=$P(REM(RCNT),U,3)
 ..;Clear evaluation fields
 ..K ^TMP("PXRHM",$J),^TMP("PXRMID",$J)
 ..;Evaluate reminders and store results
 ..D DEF^PXRMLDR(RIEN,.DEFARR)
 ..D EVAL^PXRM(DFN,.DEFARR,1,1,.FIEV,PXRMDATE)
 ..;Determine update from reminder status
 ..S APPL=0,EVAL=1,DUE=0
 ..;Check if the patient is applicable or due (exclude test patient)
 ..I $E(DEMARR("SSN"),1,5)'="00000" D
 ...;Ignore dead at start of period treat as N/A
 ...I DEMARR("DOD")'="" Q
 ...;Determine reminder evaluation status
 ...S STATUS=$P($G(^TMP("PXRHM",$J,RIEN,RNAM)),U) I STATUS="" Q
 ...;Ignore not applicables
 ...I (STATUS="")!(STATUS="ERROR")!(STATUS["N/A")!(STATUS["NEVER")!(STATUS["CNBD") Q
 ...;Otherwise applicable
 ...S APPL=1
 ...;Check if due
 ...I STATUS="DUE NOW" S DUE=1
 ..;Compliance totals
 ..S DATA=$G(^TMP("PXRMETX",$J,SEQ,INST,RCNT))
 ..;Reminder ien
 ..I $P(DATA,U)="" S $P(DATA,U)=RIEN
 ..;Evaluated total
 ..S $P(DATA,U,2)=$P(DATA,U,2)+1
 ..;Applicable total
 ..S $P(DATA,U,3)=$P(DATA,U,3)+APPL
 ..;Not applicable total
 ..I 'APPL,'DUE S $P(DATA,U,4)=$P(DATA,U,4)+1
 ..;Due total
 ..S $P(DATA,U,5)=$P(DATA,U,5)+DUE
 ..;Not due count
 ..I APPL,'DUE S $P(DATA,U,6)=$P(DATA,U,6)+1
 ..;Add patient list
 ..I $P(DATA,U,7)="" S $P(DATA,U,7)=PXRMLIST
 ..;Update workfile
 ..S ^TMP("PXRMETX",$J,SEQ,INST,RCNT)=DATA
 ..;Save finding totals
 ..I PARTYPE="CF" D FIND(SEQ,RCNT,PXRMSTRT,PXRMSTOP)
 ..;Clear evaluation fields
 ..K DEFARR,FIEV,^TMP("PXRHM",$J),^TMP("PXRMID",$J)
 Q
 ;
FRULE(FRIEN,RCNT,SEQ,REM,FUTIL) ;Build array of findings in the finding rule
 N DATA,FIND,FSEQ,GIEN,GNAM,GSEQ,GTYP,GSTA,SUB,TLIST
 S GSEQ=0
 F  S GSEQ=$O(^PXRM(810.7,FRIEN,10,"B",GSEQ)) Q:GSEQ=""  D
 .S SUB=$O(^PXRM(810.7,FRIEN,10,"B",GSEQ,"")) Q:'SUB
 .S DATA=$G(^PXRM(810.7,FRIEN,10,SUB,0)) Q:DATA=""
 .;Get the finding group ien and reminder status
 .S GIEN=$P(DATA,U,2),GSTA=$P(DATA,U,3) Q:'GIEN
 .;If no status then report finding totals for all patients 
 .I GSTA="" S GSTA="T"
 .;Get finding group info
 .S DATA=$G(^PXRM(810.8,GIEN,0)) Q:DATA=""
 .;Get group name and count type
 .S GTYP=$P(DATA,U,3),GNAM=$P(DATA,U) Q:GTYP=""
 .;Save group in workfile
 .S ^TMP("PXRMETX1",$J,SEQ,RCNT,GSEQ)=GNAM_U_GTYP_U_GSTA
 .;Get all findings in group
 .S FSEQ=0
 .F  S FSEQ=$O(^PXRM(810.8,GIEN,10,"B",FSEQ)) Q:FSEQ=""  D
 ..S SUB=$O(^PXRM(810.8,GIEN,10,"B",FSEQ,"")) Q:'SUB
 ..S DATA=$G(^PXRM(810.8,GIEN,10,SUB,0)) Q:DATA=""
 ..;Get the finding ien and exclusion status
 ..S FIND=$P(DATA,U,2) Q:'FIND
 ..;Initialize count for finding
 ..S ^TMP("PXRMETX1",$J,SEQ,RCNT,GSEQ,FSEQ)=FIND
 ..;Reminder evaluation counts work from REM
 ..I GTYP'="UR" D  Q
 ...S REM(RCNT,FIND,GSEQ,FSEQ)=""
 ...S REM(RCNT,FIND,GSEQ)=GTYP
 ..;Utilization counts work from FUTIL
 ..D TERM^PXRMLDR(FIND,.TLIST)
 ..;Save TLIST
 ..M FUTIL(RCNT,FIND,GSEQ,FSEQ)=TLIST
 Q
 ;
REMF(RIEN,RCNT,SEQ,REM) ;Build array of all findings in the reminder
 N GNAM,GSEQ,FIND,FSEQ,GTYP,SUB
 S GNAM="Finding totals",GSEQ="001",FSEQ=0,GTYP="MRF"
 ;Save group name
 S ^TMP("PXRMETX",$J,SEQ,RCNT,GSEQ)=GNAM_U_GTYP
 ;Select all findings in the reminder
 S SUB=0
 F  S SUB=$O(^PXD(811.9,RIEN,20,SUB)) Q:'SUB  D
 .;Ignore if finding is not a term
 .S FIND=$P($G(^PXD(811.9,RIEN,20,SUB,0)),U) Q:FIND'["PXRMD(811.5"
 .;Convert to term ien
 .S FIND=$P(FIND,";")
 .;Build sequence number
 .S FSEQ=FSEQ+1,FSEQ=$$RJ^XLFSTR(FSEQ,3,0)
 .;Evaluation counts
 .S REM(RCNT,FIND,GSEQ,FSEQ)=""
 .S REM(RCNT,FIND,GSEQ)=GTYP
 .;Update Workfile
 .S ^TMP("PXRMETX1",$J,SEQ,RCNT,GSEQ,FSEQ)=FIND
 Q
