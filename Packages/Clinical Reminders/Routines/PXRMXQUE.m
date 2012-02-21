PXRMXQUE ; SLC/PJH - Reminder reports general queuing routine.;07/29/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
QUE(DESC,PXRMIOV,ROUTINE,SAVE) ;Queue a task.
 ;
 N ZTSAVE,ZTRTN,ZTIO,ZTDESC
 D @SAVE
 S ZTDESC=DESC
 S ZTIO=PXRMIOV
 S ZTRTN=ROUTINE
 D ^%ZTLOAD
 I $D(ZTSK)=0 W !!,DESC," cancelled"
 E  W !!,DESC," has been queued, task number ",ZTSK
 Q $G(ZTSK)
 ;
DEVICE(ZTRTN,ZTDESC,ZTSAVE,%ZIS,ZTSK) ;
 W !
 D EN^XUTMDEVQ(ZTRTN,ZTDESC,.ZTSAVE,.%ZIS,.ZTSK)
 I $D(ZTSK)>1 W !!,ZTDESC," has been queued, task number "_$G(ZTSK) H 2
 I $G(ZTSK)="" S ZTSK=0
 Q ZTSK
 ;
 ;=======================================================================
REQUE(DESC,ROUTINE,TASK) ;Reque a task.
 N ZTRTN,ZTIO,ZTDESC,ZTSAVE
 S ZTDESC=DESC
 S ZTRTN=ROUTINE
 S ZTSK=TASK
 D REQ^%ZTLOAD
 Q
 ;
 ;=======================================================================
SAVE ;Save the variables for queing.
 S ZTSAVE("PXRMBDT")="",ZTSAVE("PXRMEDT")="",ZTSAVE("PXRMSDT")=""
 S ZTSAVE("PXRMCS(")="",ZTSAVE("NCS")=""
 S ZTSAVE("PXRMCGRP(")="",ZTSAVE("NCGRP")=""
 S ZTSAVE("PXRMFAC(")="",ZTSAVE("NFAC")=""
 S ZTSAVE("PXRMFACN(")=""
 S ZTSAVE("PXRMFCMB")=""
 S ZTSAVE("PXRMFUT")="",ZTSAVE("PXRMDLOC")=""
 S ZTSAVE("PXRMFD")=""
 S ZTSAVE("PXRMINP")=""
 S ZTSAVE("PXRMIOD")=""
 S ZTSAVE("PXRMLCHL(")="",ZTSAVE("NHL")=""
 S ZTSAVE("PXRMLCMB")=""
 S ZTSAVE("PXRMLCSC")=""
 S ZTSAVE("PXRMPRIM")=""
 S ZTSAVE("PXRMQUE")=""
 S ZTSAVE("PXRMREP")=""
 S ZTSAVE("PXRMRT")=""
 S ZTSAVE("PXRMSCAT")=""
 S ZTSAVE("PXRMSEL")=""
 S ZTSAVE("PXRMSRT")=""
 S ZTSAVE("PXRMSSN")=""
 S ZTSAVE("PXRMTABC")=""
 S ZTSAVE("PXRMTABS")=""
 S ZTSAVE("PXRMTCMB")=""
 S ZTSAVE("PXRMTMP")=""
 S ZTSAVE("PXRMTOT")=""
 S ZTSAVE("PXRMXTMP")=""
 ; Time initiated
 S ZTSAVE("PXRMXST")=""
 ; New selection criteria
 S ZTSAVE("PXRMOTM(")="",ZTSAVE("NOTM")=""
 S ZTSAVE("PXRMPRV(")="",ZTSAVE("NPRV")=""
 S ZTSAVE("PXRMPAT(")="",ZTSAVE("NPAT")=""
 S ZTSAVE("PXRMPCM(")="",ZTSAVE("NPCM")=""
 S ZTSAVE("PXRMREM(")="",ZTSAVE("NREM")=""
 S ZTSAVE("PXRMRCAT(")="",ZTSAVE("NCAT")=""
 S ZTSAVE("PXRMUSER")=""
 ;Reminder list
 S ZTSAVE("REMINDER(")=""
 ; Arrays by IEN
 S ZTSAVE("PXRMLOCN(")=""
 S ZTSAVE("PXRMCSN(")=""
 S ZTSAVE("PXRMCGRN(")=""
 ;Patient List
 S ZTSAVE("PATCREAT")=""
 S ZTSAVE("PATLST")=""
 S ZTSAVE("PXRMLIST(")=""
 S ZTSAVE("PXRMLIS1")=""
 ;User DUZ
 S ZTSAVE("DBDUZ")=""
 S ZTSAVE("PXRMRERR(")=""
 Q
