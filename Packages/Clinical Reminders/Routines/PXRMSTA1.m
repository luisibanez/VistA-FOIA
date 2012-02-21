PXRMSTA1 ; SLC/AGP - Routines for building status list. ;08/20/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;This routine and PXRMSTA2 will allow users to select the
 ;approriate status for Orders, Medication, Taxonomy, Problem List,
 ;and Radiology Procedure findings items.
 ;
CLEAR(GBL,FILE,DA) ;
 N IEN,NODE,DIK,TEMP
 W !,"Removing old Statuses from the file"
 I FILE="D" S DIK="^PXD(811.9,"_DA(2)_",20,"_DA(1)_",5,"
 I FILE="T" S DIK="^PXRMD(811.5,"_DA(2)_",20,"_DA(1)_",5,"
 S DA=0 F  S DA=$O(@GBL@(DA(2),20,DA(1),5,DA)) Q:DA'>0  S TEMP(DA)=""
 S DA=0 F  S DA=$O(TEMP(DA)) Q:DA'>0  D ^DIK
 H 1
 Q
 ;
STATUS(DA,FILE) ;
 N ANS,GBL,NODE,PXRMRX,STATUS,TAXIEN,TERMIEN,TAXTYPE,TTYPE,TYPE
 N RXTYPE,TAXNODE,TERMTYPE,Y
 N CSTATUS,UPDATE,HTEXT
 S DA(2)=DA(1),DA(1)=DA,DA="",UPDATE=0
 I FILE="D" S GBL="^PXD(811.9)"
 I FILE="T" S GBL="^PXRMD(811.5)"
 S NODE=$G(@GBL@(DA(2),20,DA(1),0))
 S TYPE=$P($G(@GBL@(DA(2),20,DA(1),0)),U)
 ;check for current defined statuses
 I $P($G(@GBL@(DA(2),20,DA(1),5,0)),U,4)>0!($D(CSTATUS)>0) D DISPLAY(GBL,UPDATE)
 E  S ANS="A"
 D ADDDEL($G(ANS),GBL,FILE,TYPE,.UPDATE)
 Q
 ;
ADDDEL(ANS,GBL,FILE,TYPE,UPDATE) ;
 I $G(ANS)="" S ANS=$$PROMPT("S^A:ADD STATUS;D:DELETE A STATUS;DA:DELETE ALL STATUSES;S:SAVE AND QUIT;Q:QUIT WITHOUT SAVING CHANGES")
 I "ADDASQ"'[ANS Q
 I ANS="A" D ADD(GBL,FILE,.CSTATUS,.DA,TYPE,.UPDATE)
 I ANS="D" D DELETE(GBL,FILE,.CSTATUS,.DA,.UPDATE)
 I ANS="DA" D DELALL(GBL,FILE,.CSTATUS,.DA,.UPDATE)
 I ANS="S" S UPDATE="S"
 I ANS="Q" S UPDATE=0
 I UPDATE>0 D ADDDEL("",GBL,FILE,TYPE,.UPDATE)
 I UPDATE=1!(UPDATE="S") D UPDATE(FILE,.UPDATE,.CSTATUS,.DA)
 Q
 ;
UPDATE(FILE,UPDATE,CSTATUS,DA) ;
 N FDA,MSG,NAME
 I UPDATE=0 G EXIT
 D CLEAR(GBL,FILE,.DA) I $D(CSTATUS)'>0 S UPDATE=0 G EXIT
 W !,"Adding current status list to the file"
 S NAME="" F  S NAME=$O(CSTATUS(NAME)) Q:NAME=""!($D(MSG)>0)  D
 .I FILE="D" S FDA(811.90221,"+3,"_DA(1)_","_DA(2)_",",.01)=NAME
 .I FILE="T" S FDA(811.54,"+3,"_DA(1)_","_DA(2)_",",.01)=NAME
 .D UPDATE^DIE("","FDA","","MSG")
 I $D(MSG)>0 D AWRITE^PXRMUTIL("MSG") H 2
 S UPDATE=0 H 1
EXIT ;
 Q
 ;
DISPLAY(GBL,UPDATE) ;
 ;display statuses defined in the 5 node or display statuses if CStatus
 ;array has been loaded
 N NAME
 S NAME=""
 W !!,"Statuses already defined for this finding item:"
 I $D(CSTATUS)'>0,UPDATE=0 D 
 .F  S NAME=$O(@GBL@(DA(2),20,DA(1),5,"B",NAME)) Q:NAME=""  D
 ..W !,NAME S CSTATUS(NAME)=$O(^PXD(811.9,DA(2),20,DA(1),5,"B","NAME",""))
 E  D
 .I $D(CSTATUS)'>0 W !,"All statuses have been deleted" Q 
 .F  S NAME=$O(CSTATUS(NAME)) Q:NAME=""  W !,NAME
 W !
 Q
 ;
ADD(GBL,FILE,CSTATUS,DA,TYPE,UPDATE) ;
 N ANS,STATUS,TERMIEN
 I TYPE["PXRMD(811.5," D
 .S TERMIEN=$P($G(TYPE),";")
 .S TYPE=$$TERMSTAT(TERMIEN) I TYPE=0 S STATUS="" Q
 .I TYPE["PXD" S TAXTYPE=$$TAXTYPE(TERMIEN,"")
 I TYPE=0 Q
 I TYPE["PXD(811.2,",$G(TAXTYPE)="" S TAXTYPE=$$TAXNODE($P(TYPE,";"),"")
 ;
 ;control of finding calls for list building
 I TYPE[";" S TYPE=$P($G(TYPE),";",2)
 S STATUS=""
 I TYPE="PXD(811.2," D  G ADDEX
 .I $G(TAXTYPE)="R" S STATUS=$$DATA^PXRMSTA2(FILE,.DA,"RAMIS(71,")
 .I $G(TAXTYPE)="P" S STATUS=$$PROB(FILE,.DA)
 .I $G(TAXTYPE)="B" S STATUS=$$TAX(FILE,.DA)
 I TYPE["PSDRUG("!(TYPE["PS(50.605")!(TYPE["PSNDF") D  G ADDEX
 .D SRXTYL^PXRMRXTY(NODE,.RXTYPE)
 .S STATUS=$$DATA^PXRMSTA2(FILE,.DA,"DRUG",.RXTYPE)
 S STATUS=$$DATA^PXRMSTA2(FILE,.DA,TYPE)
ADDEX ;
 I STATUS="" S UPDATE=0 Q
 I STATUS="*" K CSTATUS
 I STATUS'="" S CSTATUS(STATUS)="",UPDATE=1 D DISPLAY(GBL,UPDATE)
 Q
 ;
DELALL(GBL,FILE,CSTATUS,DA,UPDATE) ;
 N ANS,CNT,NAME,DIR,TMP,ONAME,HTEXT
 S HTEXT(1)="Select 'Y' to empty the status list. Select 'N' if you do not want "
 S HTEXT(2)="to empty the status list. Or enter '^' to quit."
 I $$ASK("Are you sure you want to delete all statuses? ",.HTEXT)=1 K CSTATUS D CLEAR(GBL,FILE,.DA)
 S UPDATE=2
 D DISPLAY(GBL,1)
 Q
 ;
DELETE(GBL,FILE,CSTATUS,DA,UPDATE) ;
 N ANS,CNT,NAME,DIR,TMP,ONAME
 S CNT=0,NAME="" F  S NAME=$O(CSTATUS(NAME)) Q:NAME=""  D
 .S CNT=CNT+1 I CNT=1 S TMP=CNT_":"_NAME,ONAME=NAME
 .I CNT>1 S TMP=TMP_";"_CNT_":"_NAME
 I CNT=1 S TMP=ONAME S RESULT=$$ASK("Delete "_ONAME_" ?") I RESULT="N"!(RESULT[U)!(RESULT="") Q 
 I CNT>1 S TMP="S^"_TMP S RESULT=$$PROMPTDE(TMP) I RESULT[U!(RESULT="") Q
 I CNT=1 S RESULT=ONAME
 K CSTATUS(RESULT) S UPDATE=1 D DISPLAY(GBL,UPDATE)
 Q
 ;
PROMPTDE(STR) ;
 N DIR
 S DIR(0)=STR
 S DIR("?")="Enter 'Y' to delete the entire status list or '^' to quit."
 D ^DIR
 Q Y(0)
 ;
PROMPT(STR) ;
 N DIR,HTEXT
 S HTEXT(1)="Select 'A' to add a status to the current status list. Select 'D' to "
 S HTEXT(2)="delete a status from the list. Select 'DA' to delete the entire status "
 S HTEXT(3)="list. Select 'S' to save your changes and quit. Select 'Q' to quit without saving your changes."
 S DIR(0)=STR
 S DIR("?")="Select one of the above option or '^' to quit. Enter ?? for detail help."
 S DIR("??")=U_"D HELP^PXRMEUT(.HTEXT)"
 D ^DIR
 I $G(Y)="" S Y=U
 Q Y
 ;
ASK(STR,HTEXT) ;
 N DIR,HTEXT
 I '$D(HTEXT) D
 .S HTEXT(1)="Enter 'Y' to continue editing the Status List or '^' to Quit"
 S DIR(0)="YA0"
 S DIR("A")=STR
 S DIR("B")="N"
 S DIR("?")="Select either 'Y' or 'N' or '^' to quit. Enter ?? for detail help."
 S DIR("??")=U_"D HELP^PXRMEUT(.HTEXT)"
 D ^DIR
 Q Y
 ;
PROB(VALUE,FILE,DA) ;
 ;Handle Problem List
 N CHECK,DIR,IEN,LENGHT
 S DIR(0)="SO^A:ACTIVE;I:INACTIVE",DIR("A")="STATUS" D ^DIR
 I Y=-1!(Y=U) S STATUS="" Q $G(STATUS)
 S STATUS=$G(Y(0))
 Q STATUS
 ;
TAX(FILE,DA) ;
 N ARRAY,CNT,STAT
 S CNT=0,STAT="" F  S STAT=$O(^RA(72,"B",STAT)) Q:STAT=""  D
 . S CNT=CNT+1 S ARRAY(STAT)=STAT
 I '$D(ARRAY("ACTIVE")) S ARRAY("ACTIVE")="ACTIVE"
 I '$D(ARRAY("INACTIVE")) S ARRAY("INACTIVE")="INACTIVE"
 D SELECT^PXRMSTA2(.ARRAY,FILE,"TAX",.STATUS,.DA)
 Q $G(STATUS)
 ;
WARN ;
 ;If the whole entry is being deleted don't give the warning.
 I $G(PXRMDEFD) Q
 I $G(PXRMTMD) Q
 ;Do not execute as part of exchange.
 I $G(PXRMEXCH) Q
 N TEXT
 S TEXT(1)=""
 S TEXT(2)="Since you changed the value of Rx Type, you should review the status list"
 S TEXT(3)="for the finding to make sure it is still appropriate."
 S TEXT(4)=""
 D EN^DDIOL(.TEXT)
 Q
 ;
 ;
TAXTYPE(TERMIEN,HELP) ;
 ;use to determine the Rx type of the term and the type of taxonomy
 N ARRAY,BOTH,CNT,IEN,TAXNODE,RAD,PL,RESULT,TYPE
 S (BOTH,PL,RAD,RESULT)=0
 S IEN=0 F  S IEN=$O(^PXRMD(811.5,TERMIEN,20,IEN)) Q:+IEN'>0  D
 .S TAXNODE=$G(^PXRMD(811.5,TERMIEN,20,IEN,0))
 .S ARRAY($P($P($G(TAXNODE),U),";"))=""
 I $D(ARRAY)>0 S IEN=0 F  S IEN=$O(ARRAY(IEN)) Q:IEN'>0  D
 .S TYPE=$$TAXNODE(IEN,$G(HELP))
 .I TYPE="R" S RAD=1
 .I TYPE="P" S PL=1
 .I TYPE="B" S BOTH=1
 I RAD=1,PL=1 S RESULT="B" Q
 I RAD=1,PL=0,BOTH=0 S RESULT="R"
 I RAD=0,PL=1,BOTH=0 S RESULT="P"
 Q RESULT
 ;
TAXNODE(TAXIEN,HELP) ;
 ;use to determine the type of taxonomy
 N TAXNODE,ICD,CPT,ARRAY,RAD,PL,BOTH,RADM,PLM,RESULT
 S (BOTH,PL,PLM,RAD,RADM,RESULT)=0
 D CHECK^PXRMBXTL(TAXIEN,"")
 I $D(^PXD(811.3,TAXIEN,71,"RCPTP"))>0 S RAD=1
 I $D(^PXD(811.3,TAXIEN,"PDS",9000011))>0 S PL=1
 I RAD=1,PL=1 S RESULT="B"
 I RAD=1,PL=0 S RESULT="R"
 I RAD=0,PL=1 S RESULT="P"
 Q RESULT
 ;
 ;
TERMSTAT(TIEN) ;
 N CNT,FIEN,NODE
 S (CNT,FIEN)=0
 S TYPE=0 F  S FIEN=$O(^PXRMD(811.5,TIEN,20,FIEN)) Q:+FIEN=0!(CNT=1)  D
 . S NODE=$G(^PXRMD(811.5,TIEN,20,FIEN,0)),TYPE=$P(NODE,U),CNT=CNT+1
 Q TYPE
