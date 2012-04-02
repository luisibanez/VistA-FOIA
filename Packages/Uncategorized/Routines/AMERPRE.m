AMERPRE ; IHS/OIT/SCR - PRE-INIT ROUTINE FOR ERS V3.0 ; 
 ;;3.0;ER VISIT SYSTEM;;FEB 23, 2009
EN ;ENTRY POINT FROM KIDS BUILD AMER*3.0
 ;
 Q:$G(^AMERVSIT(0))=""   ;if this is a fist time installation, don't do pre-init stuff
EDITMAP ;
 ; TASK 1: REMOVE UNWANTED ENTRIES FROM "ER INPUT MAP" requirement 4
 ; ALGORITHM
 ; FIRST: LOOK UP THE ENTRY IN "ER INPUT MAP" FOR THE TAG THAT
 ;        HAS BEEN REMOVED
 ;        1. ;QD51 ; SECOND VEHICLE INVOLVED
 ;        2. ;QD52 ; SECOND VEHICLE DRIVER'S NAME
 ;        3. ;QD53 ; SV DRIVER INSURANCE COMPANY
 ;        4. ;QD54 ; SECOND VEHICLE DRIVER POLICY NUMBER
 ;        5. ;QD55 ; SECOND VEHICLE OWNER'S NAME
 ;        5. ;QD56 ; SECOND VEHICLE OWNER'S INSURANCE COMPANY
 ;        6. ;QD57 ; SECOND VEHICLE OWNER'S POLICY NUMBER
 ;        7. ;QD61 ; RESPONSIBLE PARTY
 ;        8. ;QD62 ; NAME OF RESPONSIBLE PARTY
 ;        9. ;QD63 ; ADDRESS OF RESPONSIBLE PARTY
 ;       10. ;QD64 ; PHONE OF RESPONSIBLE PARTY
 ;       11. ;QD70 ; BRIEF DESCRIPTION OF WHAT HAPPENED
 ;       12. ;QD8 ; TRAUMA SURGEON NOTIFIED
 ;       13. ;QD9 ; TRAUMA SURGEON TIME
 ;       14. ;QD7 ; INDUSTRY
 ;       15. ;QD4 ; SELECT DRUGS
 ;       16. ;QD3 ; SUBSTANCE ABUSE
 ; NEXT : DELTE THAT ENTRY FROM THE GLOBAL
 ; FINALY: RE-INDEX THE FILE TO GET RID OF "BAD" CROSS-REFERENCES
 N AMERTAGS,AMERTAG,AMERIEN,AMERI,AMERSTRG,AMERMODE,AMERCAT,AMEROPT
 S AMERTAGS="QD8^QD9^QD7^QD4^QD51^QD52^QD53^QD54^QD55^QD56^QD57"
 S AMERTAGS=AMERTAGS_"^QD61^QD62^QD63^QD64^QD70^QD3"
 S DIC="^AMER(2.3,"
 S DIC(0)="X"
 S DIK="^AMER(2.3,"
 F AMERI=1:1:17 D
 .S AMERTAG=$P(AMERTAGS,U,AMERI)
 .S X=AMERTAG
 .D ^DIC
 .S AMERIEN=$P($G(Y),U,1)
 .I AMERIEN>0 D
 ..S DA=AMERIEN
 ..D ^DIK
 ..D IX^DIK
 ..Q
 .Q
EDITMETA ;
 ; TASK 2: REMOVE UNWANTED ENTRY FROM ER METADATA ^AMER(2.2
 ; FIRST: LOOK UP THE ENTRY FOR "ALCOHOL RELATED"
 S AMERTAG="ALCOHOL RELATED",AMERIEN=0
 S AMERIEN=$O(^AMER(2.2,"B",AMERTAG,AMERIEN))
 I AMERIEN'="" D
 .S DIK="^AMER(2.2,"
 .Q:AMERIEN<0
 .S DA=AMERIEN
 .D ^DIK
 .D IX^DIK
 .Q
UPDTOPT ;
 ; TASK 3: UPDATE ER CATEGORY FILE TO INCLUDE "ER CONSULTANT TYPE" CATEGORY
 S DIC="^AMER(2,"
 S DIC(0)="XL"
 S X="ER CONSULTANT"
 D ^DIC
 ; TASK 4: UPDATE ER OPTIONS FILE TO INCLUDE THESE ER CATEGORY "MODE OF TRANSPORT" ENTRIES
 ; FIXED WING, GROUND, ROTARY WING.
ADDMODE ;
 S AMERSTRG="FIXED WING^GROUND^ROTARY WING"
 S AMERMODE=0
 S AMERMODE=$O(^AMER(2,"B","MODE OF TRANSPORT",AMERMODE))
 S DIC(0)="XL"
 S DIC="^AMER(3,"
 F AMERI=1:1:3 D
 .S X=$P(AMERSTRG,U,AMERI)
 .D ^DIC
 .Q:Y<0
 .S DA=$P(Y,U,1)
 .S DIE=DIC,DR="1////"_AMERMODE
 .D ^DIE
 .Q
 Q
POSTINST  ;IHS/OIT/SCR 2/20/09 added to force entry of HOME DISPOSITION into ER OPTIONS file
 S AMERDISP=0
 S AMERDONE=0
 S AMERDISP=$O(^AMER(2,"B","DISPOSITION",AMERDISP))   ;THIS IS THE POINTER TO DISPOSITION CATEGORY
 S AMERHOME=0
 F  S AMERHOME=$O(^AMER(3,AMERHOME)) Q:((AMERHOME="AC")!AMERDONE)  D
 .W !,$P(^AMER(3,AMERHOME,0),"^",1),"    ",$P(^AMER(3,AMERHOME,0),"^",2)
 .I $P(^AMER(3,AMERHOME,0),"^",1)="HOME"&($P(^AMER(3,AMERHOME,0),"^",2)=AMERDISP) S AMERDONE=1
 .Q
 Q:AMERDONE   ;THIS DISPOSITION ALREADY EXISTS
 S DIC(0)=""
 S DIC="^AMER(3,"
 S X="HOME"
 D FILE^DICN
 Q:Y<0
 S DA=$P(Y,U,1)
 S DIE=DIC
 S DR="1////"_AMERDISP
 D ^DIE
 Q