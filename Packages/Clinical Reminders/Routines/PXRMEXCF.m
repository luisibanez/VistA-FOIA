PXRMEXCF ; SLC/PKR - Reminder exchange routines for computed findings. ;12/22/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;==============================================
EXISTS(ROUTINE) ;Return true if routine ROUTINE exists.
 I ROUTINE="" Q 0
 N RTN
 S RTN="^"_ROUTINE
 Q $S($T(@RTN)'="":1,1:0)
 ;
 ;==============================================
GETRACT(ATTR,NEWNAME,NAMECHG,RTN,EXISTS) ;Get the action for a routine.
 N ACTION,CHOICES,DIR,DIROUT,DIRUT,DTOUT,DUOUT,ECS,IND,MSG
 N PCS,ROUTINE,SAME,TEXT,X,Y
 S NEWNAME=""
 ;If the routine exists compare the existing routine checksum with the
 ;the checksum of the routine in the packed definition.
 S ROUTINE=ATTR("NAME")
 I EXISTS="" S EXISTS=$$EXISTS^PXRMEXCF(ROUTINE)
 S CHOICES=$S(EXISTS:"COQS",1:"CIQS")
 I EXISTS D
 . S SAME=$$SAME(.ATTR,.RTN)
 . S TEXT(1)="Routine "_ROUTINE_" already exists "
 . I SAME S TEXT(1)=TEXT(1)_"and the packed routine is identical,"
 . I 'SAME S TEXT(1)=TEXT(1)_"but the packed routine is different,"
 . S TEXT(2)="what do you want to do?"
 . D EN^DDIOL(.TEXT)
 . S DIR("B")="S"
 . S ACTION=$$GETACT^PXRMEXIU(CHOICES,.DIR)
 E  D
 . W !!,"Routine "_ROUTINE_" is NEW, what do you want to do?"
 . S DIR("B")="I"
 . S ACTION=$$GETACT^PXRMEXIU(CHOICES,.DIR)
 ;
 I ACTION="Q" Q ACTION
 ;
 I ACTION="C" D
 . N CDONE
 . S CDONE=0
 . F  Q:CDONE  D
 .. S NEWNAME=$$GETNAME^PXRMEXIU(ATTR("MIN FIELD LENGTH"),ATTR("FIELD LENGTH"))
 .. I NEWNAME="" S ACTION="S",CDONE=1 Q
 .. S EXISTS=$$EXISTS^PXRMEXCF(NEWNAME)
 .. I EXISTS W !,"Routine ",NEWNAME," already exists, try again."
 .. E  D  Q
 ... S CDONE=1
 ... S NAMECHG(ATTR("FILE NUMBER"),ROUTINE)=NEWNAME
 ;
 I (ACTION="I")&(EXISTS) D
 .;If the action is overwrite double check that overwrite is what the
 .;user really wants to do.
 . K DIR
 . S DIR(0)="Y"_U_"A"
 . S DIR("A")="Are you sure you want to overwrite"
 . S DIR("B")="N"
 . D ^DIR
 . I $D(DIROUT)!$D(DIRUT) S Y=0
 . I $D(DTOUT)!$D(DUOUT) S Y=0
 . I 'Y S ACTION="S"
 . S NAMECHG(ATTR("FILE NUMBER"),ROUTINE)=NEWNAME
 Q ACTION
 ;
 ;==============================================
SAME(ATTR,RTN) ;Compare the existing routine and the new version
 ;in RTN to see if they are the same.
 N ECS,DIF,NEWCS,RT,SAME,X,XCNP
 ;Load the existing routine into RT.
 S XCNP=0
 S DIF="RT("
 S X=ATTR("NAME")
 X ^%ZOSF("LOAD")
 S ECS=$$ROUTINE^PXRMEXCS(.RT)
 K RT
 S NEWCS=$$ROUTINE^PXRMEXCS(.RTN)
 S SAME=$S(ECS=NEWCS:1,1:0)
 Q SAME
 ;
