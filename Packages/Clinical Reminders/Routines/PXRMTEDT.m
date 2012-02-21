PXRMTEDT ; SLC/PKR - Edit a taxonomy item. ;04/29/2003
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;===============================================
 N CS1,CS2,DA,DIC,DLAYGO,DTOUT,DUOUT,Y
GETNAME ;Get the name of the reminder taxonomy to edit.
 K DA,DIC,DLAYGO,DTOUT,DUOUT,Y
 S DIC="^PXD(811.2,"
 S DIC(0)="AEMQL"
 S DIC("A")="Select Reminder Taxonomy: "
 S DIC("S")="I $$VEDIT^PXRMUTIL(DIC,Y)"
 S DLAYGO=811.2
 ;Set the starting place for additions.
 D SETSTART^PXRMCOPY(DIC)
 W !
 D ^DIC
 I ($D(DTOUT))!($D(DUOUT)) Q
 I Y=-1 G END
 S DA=$P(Y,U,1)
 S CS1=$$FILE^PXRMEXCS(811.2,DA)
 D EDIT(DIC,DA)
 ;See if any changes have been made, if so do the edit history.
 S CS2=$$FILE^PXRMEXCS(811.2,DA)
 I CS2'=0,CS2'=CS1 D SEHIST^PXRMUTIL(811.2,DIC,DA)
 G GETNAME
END ;
 Q
 ;
 ;===============================================
EDIT(ROOT,DA) ;
 N DIE,DR,DIDEL,RESULT,X
 S DIE=ROOT,DIDEL=811.2
 W !!,"General Taxonomy Data"
 S DR=".01"
 D ^DIE
 ;If DA is undefined then the entry was deleted.
 I '$D(DA) Q
 I $D(Y) Q
 ;
 S DR=".02"
 D ^DIE
 I '$D(DA) Q
 I $D(Y) Q
 ;
CLASS ;
 ;Class
 W !!
 S DR="100"
 D ^DIE
 I $D(Y) Q
 ;Sponsor
 S DR="101"
 D ^DIE
 I $D(Y) Q
 ;Make sure Class and Sponsor Class are in synch.
 S RESULT=$$VSPONSOR^PXRMINTR(X)
 I RESULT=0 G CLASS
 ;Review date
 W !!
 S DR="102"
 D ^DIE
 I $D(Y) Q
 ;
 W !!
 S DR="4"
 D ^DIE
 I '$D(DA) Q
 I $D(Y) Q
 ;
 S DR="10"
 D ^DIE
 I '$D(DA) Q
 I $D(Y) Q
 ;
 S DR="1.6"
 D ^DIE
 I '$D(DA) Q
 I $D(Y) Q
 ;
 W !!,"ICD0 Range of Coded Values"
 S DR="2103"
 S DR(2,811.22103)=".01;1"
 D ^DIE
 I $D(Y) Q
 ;
 W !!,"ICD9 Range of Coded Values"
 S DR="2102"
 S DR(2,811.22102)=".01;1"
 D ^DIE
 I $D(Y) Q
 ;
 W !!,"CPT Range of Coded Values"
 S DR="2104"
 S DR(2,811.22104)=".01;1"
 D ^DIE
 I $D(Y) Q
 Q
 ;
