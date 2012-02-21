PXRMLHLP ; SLC/PKR - Reminder Patient List help. ;9/3/2002
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;======================================================================
LOAD(SUB) ;
 ;If necessary load the help text into the ^TMP array.
 ;Check if the help text has already been loaded.
 I $D(^TMP(SUB,$J,"VALMCNT")) D  Q
 . S VALMCNT=^TMP(SUB,$J,"VALMCNT")
 ;
 N DONE,IND,LABEL,TEXT
 S LABEL=$S(SUB["LPM":"TX1",SUB["LPP":"TX2",SUB["LPUH":"TX3",SUB["LPAH":"TX4",SUB["LPUP":"TX5",1:"NOHLP")
 S DONE=0
 S VALMCNT=0
 F IND=1:1 Q:DONE  D
 . S TEXT=$P($T(@(LABEL_"+"_IND)),";",3)
 . I TEXT="**End Text**" S DONE=1 Q
 . S VALMCNT=VALMCNT+1
 . S ^TMP(SUB,$J,VALMCNT,0)=TEXT
 S ^TMP(SUB,$J,"VALMCNT")=VALMCNT
 Q
 ;
TX1 ;Help Text
 ;;The following actions are available:
 ;;
 ;;CO  Copy Patient List
 ;;
 ;;    Copy all patients in the patient list into a new local patient
 ;;    list.
 ;;
 ;;CR  Create Patient List
 ;;
 ;;    Use a list rule set to create a new local patient list.
 ;;
 ;;VW  View my List
 ;;    
 ;;    Display a list of secure Patient Lists that the user has access
 ;;    to.
 ;;
 ;;PUB View Public List
 ;;    Display a list of unsecure Patient Lists.
 ;;
 ;;LRM List Rule Management
 ;;
 ;;    Create or edit list rules.
 ;;
 ;;QU  Quit
 ;;**End Text**
 Q
 ;
 ;======================================================================
TX2 ;Help text
 ;;The following actions are available:
 ;;
 ;;CV   Change View
 ;; 
 ;;     Toggle between display by patient name and display by patient
 ;;     name within facility.
 ;;
 ;;DEM  Demographic Report
 ;;
 ;;     Display specific demographic data against the Patient List in
 ;;     Delimited or detail formated output
 ;;
 ;;HSA  Print Health Summary (All Patients)
 ;;
 ;;     Print a Health Summary for all patients in the patient list.
 ;;
 ;;HSI  Print Health Summary (Individual Patients)
 ;;
 ;;     Print a Health Summary for selected patients in the patient list.
 ;;
 ;;USR  View User
 ;;     View the users who have access to this list.
 ;;
 ;;QU  Quit
 ;;**End Text**
 Q
 ;
TX3 ;Help Text
 ;;
 ;;Patient List have two level of control Authorized User and Creator
 ;;
 ;;Authorized User:
 ;;  Authorized User can have one of two levels of control assign to 
 ;;  them. View only access and Full control.
 ;;  Full Control allowed an authorized user full access to a Patient
 ;;  List the only thing an authorized user cannot do is delete the
 ;;  list. 
 ;;
 ;;Creator:
 ;;  Can view a list, copy a list into a new list, delete a list, and 
 ;;  can copy a list into a OR/RR team list. A Creator is the only
 ;;  is the only person who can delete a secure patient list.
 ;;
 ;;The following actions are available:
 ;;
 ;;CO  Copy Patient List
 ;;
 ;;    Copy all patients in the patient list into a new local patient
 ;;    list.
 ;;
 ;;COE Copy Patient List to OE/RR Team
 ;;
 ;;    Copy all patients in the patient list into a new OE/RR Team 
 ;;    list.
 ;;
 ;;CR  Create Patient List
 ;;
 ;;    Use a list rule set to create a new local patient list.
 ;;
 ;;DE  Delete Patient List (Creator Only)
 ;;
 ;;    Delete selected local patient lists.
 ;;
 ;;DSP Display Patient List
 ;;
 ;;    Display a selected patient list with option to print. Also 
 ;;    view and modify the list of users assigned access to the list.
 ;;
 ;;LRM List Rule Management
 ;;
 ;;    Create or edit list rules.
 ;;
 ;;QU  Quit
 ;;**End Text**
 Q
 ;
TX4 ;Help Text
 ;;Both of the following option require the user to have Creator access:
 ;;
 ;;ADD Add user
 ;;
 ;;    Add a user as an Authorized User to the list
 ;;
 ;;DEL Delete User
 ;;    Delete one or multiple Authozed Users from the List
 ;;
 ;;QU  Quit
 ;;**End Text**
 Q
 ;
TX5 ;Help Text
 ;;
 ;;The following actions are available:
 ;;
 ;;CO  Copy Patient List
 ;;
 ;;    Copy all patients in the patient list into a new local patient
 ;;    list.
 ;;
 ;;COE Copy Patient List to OE/RR Team
 ;;
 ;;    Copy all patients in the patient list into a new OE/RR Team 
 ;;    list.
 ;;
 ;;CR  Create Patient List
 ;;
 ;;    Use a list rule set to create a new local patient list.
 ;;
 ;;DE  Delete Patient List
 ;;
 ;;    Delete selected local patient lists.
 ;;
 ;;DSP Display Patient List
 ;;
 ;;    Display a selected patient list with options to print. Also
 ;;    view and modify the list of users assigned access to the list.
 ;;
 ;;LRM List Rule Management
 ;;
 ;;    Create or edit list rules.
 ;;
 ;;QU  Quit
 ;;**End Text**
 Q
 ;
 ;======================================================================
NOHLP ;Help text
 ;;
 ;;No Help Text Available
 ;;
 ;;**End Text**
 Q
