PXRMLRHL ; SLC/PJH - List Rule help. ;12/05/2002
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;======================================================================
LOAD(SUB) ;
 ;If necessary load the help text into the ^TMP array.
 ;Check if the help text has already been loaded.
 I $D(^TMP(SUB,$J,"VALMCNT")) D  Q
 . S VALMCNT=^TMP(SUB,$J,"VALMCNT")
 ;
 N DONE,IND,LABEL,TEXT
 S LABEL=$S(SUB["LRM":"TX1",SUB["LRED":"TX2",SUB["LPUH":"TX3",SUB["LPPH":"TXT4",SUB["LPAH":"TX5",1:"NOHLP")
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
 ;;CV  Change View
 ;;
 ;;    Toggle view between different rule types
 ;;
 ;;    - Rule Sets (containing Finding Rules and Patient List Rules)
 ;;    - Finding Rules (based on Reminder Terms)
 ;;    - Patient List Rules (based on existing Patient Lists) 
 ;;
 ;;CR  Create Rule
 ;;
 ;;    Create a list rule of the type currently displayed. Finding Rules
 ;;    and Patient List Rules must be created before a Rule Set may be
 ;;    created. 
 ;;
 ;;DR  Display/Edit Rule
 ;;
 ;;    Display or edit an existing list rule. Only local list rules may
 ;;    be edited.
 ;;
 ;;QU  Quit
 ;;**End Text**
 ;
 ;
TX2 ;Help Text
 ;;The following actions are available:
 ;;
 ;;ED  Edit Rule
 ;;
 ;;    Edit a list rule.
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
 ;;  Can View a List and can copy a list into a new list.
 ;;
 ;;Creator:
 ;;  Can view a list, copy a list into a new list, delete a list, and 
 ;;  can copy a list into a OR/RR team list.
 ;;
 ;;**End Text**
TX4 ;Help Text
 ;;The following actions are available.
 ;;
 ;;DEM
 ;;
 ;;    Display specific demographic data against the Patient List in
 ;;    Delimited or detail formated output
 ;;
 ;;HSA
 ;;    Run a Health Summary report against the entire Patient List
 ;;
 ;;HSI
 ;;    Run a Health Summary report against an individual Patient
 ;;
 ;;USR
 ;;    View the users who have access to the list
 ;;
 ;;QU  Quit
 ;;**End Text**
TX5 ;Help Text
 ;;The following actions are available both need Creator access:
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
 ;======================================================================
NOHLP ;Help text
 ;;
 ;;No Help Text Available
 ;;
 ;;**End Text**
 Q
