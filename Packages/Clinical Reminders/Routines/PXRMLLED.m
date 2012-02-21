PXRMLLED ; SLC/PJH - Edit a location list. ;11/01/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;================================================================
 N DA,DIC,DLAYGO,DTOUT,DUOUT,FILEA,IENA,NUM,Y
GETNAME ;Get the name of the location list to edit.
 K CLASS,DA,DIC,DLAYGO,DTOUT,DUOUT,INUSE,PXRMEDOK,Y
 S PXRMEDOK=1
 S DIC="^PXRMD(810.9,"
 S DIC(0)="AEMQL"
 S DIC("A")="Select Location List: "
 S DLAYGO=810.9
 ;Set the starting place for additions.
 D SETSTART^PXRMCOPY(DIC)
 W !
 D ^DIC
 I ($D(DTOUT))!($D(DUOUT)) Q
 I Y=-1 G END
 S DA=$P(Y,U,1)
 S CLASS=$P($G(^PXRMD(810.9,DA,0)),U,2)
 I (CLASS="N")&('$G(PXRMINST)) D  G GETNAME
 . W !,"You cannot edit National Location Lists!"
 D EDIT(DIC,DA)
 G GETNAME
END ;
 Q
 ;
 ;================================================================
EDIT(ROOT,DA) ;
 N DIE,DR,DIDEL
 S DIE=ROOT,DIDEL=810.9
 S DR=".01;.02"
 D ^DIE
 I '$D(DA) Q
 ;
 ;Description
 S DR="1"
 D ^DIE
 ;
 ;Clinic Stops
 S DR="40.7"
 S DR(2,810.9001)=".01;1"
 D ^DIE
 ;
 ;Hospital Locations
 S DR="44"
 D ^DIE
 Q
 ;
 ;================================================================
INUSE(SIEN) ;This is used by ^DD(810.9,.01,"DEL",1,0) to determine if it
 ;is ok to delete a sponsor.
 N FILE,FILEA,IEN,IENA,IENT,IND,LIST,NUM,SP,TEXT
 D EN^DDIOL("Checking usage ...")
 S NUM=0
 F FILE=811.9 D
 . K LIST
 . D LIST^DIC(FILE,"","@","","","","","","","","LIST")
 . S IENT=$P(LIST("DILIST",0),U,1)
 . F IND=1:1:IENT D
 .. S IEN=LIST("DILIST",2,IND)
 .. S SP=+$$GET1^DIQ(FILE,IEN,101,"I")
 .. I SP=SIEN D
 ... S NUM=NUM+1
 ... S FILEA(NUM)=FILE
 ... S IENA(NUM)=IEN
 I NUM>0 D
 . D EN^DDIOL("This Sponsor cannot be deleted, it is in use by the following:")
 . D EN^DDIOL("FILE","","!!")
 . D EN^DDIOL("ENTRY","","?35")
 . D EN^DDIOL("----")
 . D EN^DDIOL("-----","","?35")
 . F IND=1:1:NUM D
 .. S IENA(IND)=$$GET1^DIQ(FILEA(IND),IENA(IND),.01)
 .. S FILEA(IND)=$$GET1^DID(FILEA(IND),"","","NAME")
 .. D EN^DDIOL(FILEA(IND))
 .. D EN^DDIOL(IENA(IND),"","?35")
 . D EN^DDIOL("","","!!")
 Q NUM
 ;
 ;================================================================
KAMIS(X,DA) ;Kill the AMIS Reporting Stop Code.
 ;Do not execute as part of a verify fields.
 I $G(DIUTIL)="VERIFY FIELDS" Q
 ;Do not execute as part of exchange.
 I $G(PXRMEXCH) Q
 S $P(^PXRMD(810.9,DA(1),40.7,DA,0),U,2)=""
 Q
 ;
 ;================================================================
SAMIS(X,DA) ;Set the AMIS Reporting Stop Code.
 ;Do not execute as part of a verify fields.
 I $G(DIUTIL)="VERIFY FIELDS" Q
 ;Do not execute as part of exchange.
 I $G(PXRMEXCH) Q
 N AMIS
 S AMIS=$P(^DIC(40.7,X,0),U,2)
 S $P(^PXRMD(810.9,DA(1),40.7,DA,0),U,2)=AMIS
 Q
 ;
