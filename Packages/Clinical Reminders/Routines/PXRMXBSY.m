PXRMXBSY ; SLC/PJH - Let the user know the computer is busy. ;01/12/2002
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;=======================================================================
INIT(SPINCNT) ;Initialize the busy display components.
 S SPINCNT=0
 Q
 ;
 ;=======================================================================
DONE(DTEXT) ;Write out the done message.
 W @IOBS,DTEXT,!
 Q
 ;
 ;======================================================================
ERROR ;
 ;Print Error message
 I $D(^XTMP(PXRMXTMP,"ERROR"))>0 D
 .W !!,"WARNING - REMINDER EVALUATION ERRORS, REPORT RESULTS MAY BE INCORRECT!"
 .N ERRNAME S ERRNAME=""
 .F  S ERRNAME=$O(^XTMP(PXRMXTMP,"ERROR",ERRNAME)) Q:ERRNAME=""  D
 ..W !,"Reminder: "_ERRNAME_" had a total of "_$G(^XTMP(PXRMXTMP,"ERROR",ERRNAME))_" evaluation errors."
 ;
 ;Print Could not be determine message
 I $D(^XTMP(PXRMXTMP,"CNBD"))>0 D
 .W !!,"WARNING - REMINDER COULD NOT BE DETERMINE, REPORT RESULTS MAY BE INCORRECT!"
 .N ERRNAME S ERRNAME=""
 .F  S ERRNAME=$O(^XTMP(PXRMXTMP,"CNBD",ERRNAME)) Q:ERRNAME=""  D
 ..W !,"Reminder: "_ERRNAME_" had a total of "_$G(^XTMP(PXRMXTMP,"CNBD",ERRNAME))_" evaluation errors."
 Q
 ;=======================================================================
SPIN(SPINTEXT,SPINCNT) ;Move the spinner.
 N QUAD
 I SPINCNT=0 W !!,SPINTEXT,"  "
 S SPINCNT=SPINCNT+1
 S QUAD=SPINCNT#8
 I QUAD=1 W @IOBS,"|"
 I QUAD=3 W @IOBS,"/"
 I QUAD=5 W @IOBS,"-"
 I QUAD=7 W @IOBS,"\"
 Q
