PXRMDISC ; SLC/PKR - Return the reminder disclaimer in ^TMP. ;07/16/2002
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
LOAD ;If the Site Reminder Disclaimer is empty then return the Distributed
 ;Reminder disclaimer.
 ;If the disclaimer is already loaded don't do anything.
 I $D(^TMP("PXRM",$J,"DISC")) Q
 N DIWL,DIWR,IND,LC,X
 S DIWL=1,DIWR=70
 K ^UTILITY($J,"W")
 I $D(^PXRM(800,1,"DISC2"))>0 S IND="DISC2"
 E  S IND="DISC1"
 S LC=0
 F  S LC=$O(^PXRM(800,1,IND,LC)) Q:LC=""  D
 . S X=$G(^PXRM(800,1,IND,LC,0))
 . D ^DIWP
 ;
 ;Put the formatted text into ^TMP("PXRM",$J,"DISC",...)
 S LC=0
 F  S LC=$O(^UTILITY($J,"W",0,LC)) Q:LC=""  D
 . S ^TMP("PXRM",$J,"DISC",LC)=^UTILITY($J,"W",0,LC,0)
 K ^UTILITY($J,"W")
 Q
