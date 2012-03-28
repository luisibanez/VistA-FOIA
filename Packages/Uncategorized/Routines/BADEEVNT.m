BADEEVNT ;IHS/MSC/MGH - Dentrix HL7 interface  ;30-Jun-2009 15:26;PLS
 ;;1.0;DENTAL/EDR INTERFACE;;Oct 13, 2009
 Q
TLOADPT ;EP Taskman call to start patient load
 N STOP,ZTDTH,ZTIO,ZTDESC,ZTRTN,ZTSAVE,ZTPRI,ZTSK
 ;Make sure its not already running
 S STOP=$$GET^XPAR("ALL","BADE EDR PAUSE PATIENT LOAD",1,"E")
 ;Its already running and shouldn't be restarted
 I STOP="NO" D  H 3 Q
 .W !,"Process is already running",!
 I $$GET^XPAR("ALL","BADE EDR LAST DFN") D  H 3 Q
 .W !,"Upload process has already begun. Please use Restart option.",!
 S ZTIO=""
 S ZTPRI=1
 S ZTDESC="Load Patient Data to EDR"
 S ZTRTN="LOADPT^BADEEVNT"
 S ZTSAVE("DUZ")=""
 D ^%ZTLOAD
 I $G(ZTSK) D
 .D EN^XPAR("SYS","BADE EDR LOAD TSK",1,ZTSK)
 .W !,"Task number "_ZTSK H 2
 Q
LOADPT ;EP Load all patient's data
 N DFN,CNT,CNTCHK,DATA,TOTAL,STOP,THROTTLE
 ;Make sure the stop parameter is NO
 D EN^XPAR("SYS","BADE EDR PAUSE PATIENT LOAD",1,"NO")
 ;Make sure the Pt DFN is set to null
 S DFN=$$GET^XPAR("ALL","BADE EDR LAST DFN")
 ;Check to see how many patients to process before throttling
 S CNTCHK=$$GET^XPAR("ALL","BADE EDR THROTTLE CT")
 ;Loop through the patients and send data
LOOP S DFN=$S(DFN>0:DFN,1:0),CNT=0,STOP="NO",TOTAL=0
 F  S DFN=$O(^DPT(DFN)) Q:+DFN'>0!(STOP="YES")  D
 .S CNT=CNT+1
 .D A28^BADEEVNT(DFN)
 .;Set IEN into the DFN parameter
 .D EN^XPAR("SYS","BADE EDR LAST DFN",1,"`"_DFN)
 .;Add to total count
 .S TOTAL=TOTAL+1
 .D EN^XPAR("SYS","BADE EDR TOTAL PROCESSED",1,TOTAL)
 .;Check to see if we should stop
 .S STOP=$$GET^XPAR("ALL","BADE EDR PAUSE PATIENT LOAD",1,"E")
 .Q:STOP="YES"
 .;If count=check throttle parameter
 .I CNT=CNTCHK D
 ..S THROTTLE=$$GET^XPAR("ALL","BADE EDR PT THROTTLE")
 ..S CNTCHK=$$GET^XPAR("ALL","BADE EDR THROTTLE CT")
 ..I THROTTLE>0 H THROTTLE
 ..S CNT=0
 ;Finish up by resetting the pt parameter to null and the stop paramater to YES
 I STOP="NO" D
 .D EN^XPAR("SYS","BADE EDR PAUSE PATIENT LOAD",1,"YES")
 .D EN^XPAR("SYS","BADE EDR LOAD TSK",1,"Upload complete")
 .D COMPLETE
 Q
TRESTRT ;EP Taskman call to restart patient load
 N STOP,ZTDTH,ZTIO,ZTDESC,ZTRTN,ZTSAVE,ZTPRI,ZTSK
 ;Make sure its not already running
 S STOP=$$GET^XPAR("ALL","BADE EDR PAUSE PATIENT LOAD",1,"E")
 ;Its already running and shouldn't be restarted
 I STOP="NO" W !,"Process is already running",!!! H 3 Q
 S ZTIO=""
 S ZTPRI=1
 S ZTDESC="Load Patient Data to EDR"
 S ZTRTN="RESTPT^BADEEVNT"
 S ZTSAVE("DUZ")=""
 D ^%ZTLOAD
 I $G(ZTSK) D
 .D EN^XPAR("SYS","BADE EDR LOAD TSK",,ZTSK)
 .W !,"Task number "_ZTSK H 2
 Q
RESTPT ;EP Restart the patient load
 N DFN,CNT,CNTCHK,TOTAL,DATA,STOP
 ;Get the last used DFN from the parameter
 S DFN=$$GET^XPAR("ALL","BADE EDR LAST DFN")
 ;Set the stop parameter to NO
 D EN^XPAR("SYS","BADE EDR PAUSE PATIENT LOAD",,0)
 ;Get the total count
 S TOTAL=$$GET^XPAR("ALL","BADE EDR TOTAL PROCESSED")
 S CNTCHK=$$GET^XPAR("ALL","BADE EDR THROTTLE CT")
 ;Task off the job of restarting
LOOP2 S CNT=0,STOP="NO"
 S DFN=$S(DFN>0:DFN,1:0)
 F  S DFN=$O(^DPT(DFN)) Q:+DFN'>0!(STOP="YES")  D
 .S CNT=CNT+1
 .D A28^BADEEVNT(DFN)
 .;Set IEN into the DFN parameter
 .D EN^XPAR("SYS","BADE EDR LAST DFN",1,"`"_DFN)
 .;Add to total count
 .S TOTAL=TOTAL+1
 .D EN^XPAR("SYS","BADE EDR TOTAL PROCESSED",1,TOTAL)
 .;See if we should stop
 .S STOP=$$GET^XPAR("ALL","BADE EDR PAUSE PATIENT LOAD",1,"E")
 .Q:STOP="YES"
 .;if count=parameter value check throttle parameter
 .I CNT=CNTCHK D
 ..S THROTTLE=$$GET^XPAR("ALL","BADE EDR PT THROTTLE")
 ..S CNTCHK=$$GET^XPAR("ALL","BADE EDR THROTTLE CT")
 ..I THROTTLE>0 H THROTTLE
 ..S CNT=0
 ;Finish up by resetting the pt parameter to null and the stop parameter to YES
 I STOP="NO" D
 .D EN^XPAR("SYS","BADE EDR PAUSE PATIENT LOAD",1,1)
 .D EN^XPAR("SYS","BADE EDR LOAD TSK",1,"Upload complete")
 .D COMPLETE
 Q
COMPLETE ;Mark options out of order
 N DA,DIE,DR,MSG
 S DA="",MSG="Upload completed"
 S DA=$O(^DIC(19,"B","BADE EDR UPLOAD ALL PATIENTS",DA))
 I DA'=""  D
 .S DIE="^DIC(19,",DR="2///^S X=MSG"
 .D ^DIE
 N DA,DIE,DR
 S DA="",MSG="Upload completed"
 S DA=$O(^DIC(19,"B","BADE EDR RESTART PAT UPLOAD",DA))
 I DA'=""  D
 .S DIE="^DIC(19,",DR="2///^S X=MSG"
 .D ^DIE
 ; Enable event protocols
 D EDPROT^BADEUTIL("BADE PATIENT A28")
 D EDPROT^BADEUTIL("BADE PATIENT A31")
 Q
SENDA28 ;Send one A28 message
 N ERR,DIC,DT,DFN,Y
 S DIC=2,DIC("A")=" Select Patient:  ",DIC(0)="AEQMZ",DT=$$DT^XLFDT D ^DIC I +Y>0 D
 .S DFN=+Y
 .D A28(DFN)
 .I '$D(ERR) W !,"Message was sent" H 2
 .I $D(ERR) W !,"Unable to send HL7 message" H 2
 Q
SENDA31 ;Send one A31 message
 N ERR,DIC,DT,DFN,BADERR,Y
 S DIC=2,DIC("A")=" Select Patient:  ",DIC(0)="AEQMZ",DT=$$DT^XLFDT D ^DIC I +Y>0 D
 .S DFN=+Y
 .D A31(DFN)
 .I '$D(ERR) W !,"Message was sent" H 2
 .I $D(ERR) W !,"Unable to send HL7 message" H 2
 Q
A28(DFN) ;EP Create and send one A28 message
 N EVNTTYPE,DOD
 S EVNTTYPE="A28"
 ;If patient has been merged, send the merged DFN
 Q:$D(^DPT(DFN,-9))
 I '$D(^DPT(DFN,0)) S ERR="No zero node for patient "_DFN D NOTIF^BADEHL1(DFN,ERR) Q
 ;Patient must be alive
 S DOD=$P($G(^DPT(DFN,.35)),U,1)
 I DOD="" D NEWMSG^BADEHL1(DFN,EVNTTYPE)
 Q
A31(DFN) ;EP Create and send one A31 message
 N EVNTTYPE,DOD
 S EVNTTYPE="A31"
 I '$D(^DPT(DFN,0)) S ERR="No zero node for patient "_DFN D NOTIF^BADEHL1(DFN,ERR) Q
 ;Don't send if patient is deceased
 ;S DOD=$P($G(^DPT(DFN,.35)),U,1)
 ;I DOD=""
 D NEWMSG^BADEHL1(DFN,EVNTTYPE)
 Q
MSA ;EP
 N MSA,HLST
 D SET(.ARY,"MSA",0)
 D SET(.ARY,"AA",1)
 D SET(.ARY,"TODO-MSGID",2)
 D SET(.ARY,"Transaction Successful",3)
 D SET(.ARY,"todo-010",4)
 S MSA=$$ADDSEG^HLOAPI(.HLST,.ARY)
 Q
SET(ARY,V,F,C,S,R) ;EP
 D SET^HLOAPI(.ARY,.V,.F,.C,.S,.R)
 Q
