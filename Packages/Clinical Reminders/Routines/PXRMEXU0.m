PXRMEXU0 ; SLC/PKR - Reminder exchange general utilities, #0. ;10/24/2003
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;=========================================================
LOC(FDA) ;Process the FDA for location lists.
 ;Direct reads of ^DIC(40.7) covered by DBIA #537.
 N AMIS,IEN,IENS,STOP,TEMP,TEXT
 ;Stop Codes may not have a unique name, use the AMIS Reporting Stop
 ;code to determine which one to use.
 S IENS=""
 F  S IENS=$O(FDA(810.9001,IENS)) Q:IENS=""  D
 . S STOP=FDA(810.9001,IENS,.01)
 . S AMIS=FDA(810.9001,IENS,.02)
 . S IEN=$O(^DIC(40.7,"C",AMIS,""))
 . S TEMP=$P(^DIC(40.7,IEN,0),U,1)
 . I TEMP'=STOP D  Q
 .. S TEXT(1)="Name associated with AMIS stop code does not match the one in the"
 .. S TEXT(2)="packed reminder:"
 .. S TEXT(3)=" AMIS="_AMIS
 .. S TEXT(4)=" Site Name="_TEMP
 .. S TEXT(5)=" Name in packed reminder="_STOP
 .. D EN^DDIOL(.TEXT)
 . S FDA(810.9001,IENS,.01)="`"_IEN
 Q
 ;
 ;=========================================================
SFNFTC(IEN) ;Set the found/not found text line counts in the reminder
 ;definition.
 D SNMLA^PXRMFNFT(IEN)
 D SNMLF^PXRMFNFT(IEN,20)
 D SNMLF^PXRMFNFT(IEN,25)
 D SNMLL^PXRMFNFT(IEN)
 Q
 ;
