PXRMEDIT ; SLC/PKR - Clinical Reminder edit driver. ;05/18/2000
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
EDIT(ROOT,IENN) ;Call the appropriate edit routine.
 ;Taxonomy
 I ROOT="^PXD(811.2," D EDIT^PXRMTEDT(ROOT,IENN) Q
 ;
 ;Reminder term
 I ROOT="^PXRMD(811.5," D EDIT^PXRMTMED(ROOT,IENN) Q
 ;
 ;Reminder
 I ROOT="^PXD(811.9," D
 .;Build list of finding types for finding edit
 . N DEF,DEF1,DEF2 D DEF^PXRMRUTL("811.902",.DEF,.DEF1,.DEF2)
 .;Edit reminder
 . D ALL^PXRMREDT(ROOT,IENN) Q
 Q
 ;
