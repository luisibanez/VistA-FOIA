PXRMSTA2 ; SLC/AGP - Routines for building status list. ;10/27/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
DATA(FILE,DA,TYPE,RXTYPE) ;
 ; this sub routine get the list of statuses from the apporiate global
 ;
 N ARRAY,ARRAY1,CNT,CODE,DEF,OUTPUT,SARRAY,STAT
LOOP ;
 ;get build status list into a local array from each pharmacy type of
 ;finding item
 I TYPE="DRUG" D
 .I $D(RXTYPE("I"))>0 D
 . . D FIELD^DID(55.06,28,"","POINTER","SARRAY")
 . . D ARRAYFOR(.SARRAY,.ARRAY,"I") K CODE
 . . D FIELD^DID(55.01,100,"","POINTER","SARRAY")
 . . D ARRAYFOR(.SARRAY,.ARRAY1,"I") K CODE
 . . D COMPARE(.ARRAY,.ARRAY1,"I",.OUTPUT)
 . I $D(RXTYPE("O"))>0 D
 . . K ARRAY,ARRAY1,CODE
 . . D FIELD^DID(52,100,"","POINTER","SARRAY")
 . . D ARRAYFOR(.SARRAY,.ARRAY,"O") K CODE
 . . I $D(OUTPUT)>0 K ARRAY1 M ARRAY1=OUTPUT K OUTPUT D COMPARE(.ARRAY,.ARRAY1,"",.OUTPUT)
 . . E  M OUTPUT=ARRAY
 . I $D(RXTYPE("N"))>0 D
 . . K ARRAY,ARRAY1,CODE
 . . D FIELD^DID(55.05,5,"","POINTER","SARRAY")
 . . S SARRAY("POINTER")=SARRAY("POINTER")_"0:ACTIVE;"
 . . D ARRAYFOR(.SARRAY,.ARRAY,"N") K CODE
 . . I $D(OUTPUT)>0 K ARRAY1 M ARRAY1=OUTPUT K OUTPUT D COMPARE(.ARRAY,.ARRAY1,"",.OUTPUT)
 . . E  M OUTPUT=ARRAY
 ;
 I TYPE="ORD(101.43," D
 . S CNT=0,STAT="" F  S STAT=$O(^ORD(100.01,"B",STAT)) Q:STAT=""  D
 . . S CNT=CNT+1 S OUTPUT(STAT)=STAT
 I TYPE="RAMIS(71," D
 . S CNT=0,STAT="" F  S STAT=$O(^RA(72,"B",STAT)) Q:STAT=""  D
 . . S CNT=CNT+1 S OUTPUT(STAT)=STAT
 D SELECT(.OUTPUT,FILE,TYPE,.STATUS,.DA)
 ;
 Q $G(STATUS)
 ;
COMPARE(ARRAY,ARRAY1,TYPE,OUTPUT) ;
 ; this sub routine is use to combine the InPatient and 
 ; Both Pharmacy type into one array
 N ARY,CNT,COMP,NODE
 K OUTPUT
 S COMP=""
 ;
 ;inpatient pharmacy list is built from two seperated fields in file #55
 ;this is used to combined the two fields into one array
 I $G(TYPE)="I" D
 . F  S COMP=$O(ARRAY(COMP)) Q:COMP=""  D
 . . S OUTPUT(COMP)=ARRAY(COMP)
 . S (COMP)="" F  S COMP=$O(ARRAY1(COMP)) Q:COMP=""  D
 . . I '$D(OUTPUT(COMP)) S OUTPUT(COMP)=ARRAY1(COMP)
 ;
 ;this section is uses to combine the different RX Types into one array
 I $G(TYPE)'="I" D
 . F  S COMP=$O(ARRAY(COMP)) Q:COMP=""  D
 . . S NODE=$G(ARRAY(COMP))
 . . S OUTPUT(COMP)=NODE
 . S COMP="" F  S COMP=$O(ARRAY1(COMP)) Q:COMP=""  D
 . . S NODE=$G(ARRAY1(COMP))
 . . I '$D(OUTPUT(COMP)) S OUTPUT(COMP)=NODE Q
 . . I $D(OUTPUT(COMP)) S $P(OUTPUT(COMP),U,2)=$P(OUTPUT(COMP),U,2)_$P(NODE,U,2)
 Q
 ;
ARRAYFOR(ARRAY,OUTPUT,DEF) ;
 ;this sub routine is use to format that array data into a standard 
 ;format
 ;
 N CNT,COMP,PIECE,STR,TYPE
 S PIECE=0
 ;
 ;determine the number of pieces minus one in the string
 F CNT=1:1:$L(ARRAY("POINTER")) I $E(ARRAY("POINTER"),CNT)=";" S PIECE=PIECE+1 I PIECE>0 D
 . S STR=$P($P($G(ARRAY("POINTER")),";",PIECE),":",2)
 . S OUTPUT($P($P($G(ARRAY("POINTER")),";",PIECE),":",2))=STR_U_$G(DEF)
 ;
 ;add last piece in the string to the array
 I PIECE>0 S PIECE=PIECE+1 D
 . I $P($G(ARRAY("POINTER")),";",PIECE)'="" D
 . . S OUTPUT($P($P($G(ARRAY("POINTER")),";",PIECE),":",2))=$P($P($G(ARRAY("POINTER")),";",PIECE),":",2)_U_$G(DEF)
 Q
 ;
SELECT(ARRAY,FILE,TYPE,STATUS,DA) ;
 ; this sub routine is use to sort through the formated array and 
 ; set up the DIR call
 ;
 N CHECK,CNT,CNT1,DIR,DUOUT,DTOUT,EMPTY,EXTR
 N HELP,LENGTH,NODE,STAT,STR,TEXT,TMP,Y
DISPLAY ;
 I TYPE="DRUG" S TEXT="Select a Medication Status from the status list or enter '^' to Quit",HELP="Select a status from the Medication Status list or '^' to Quit"
 I TYPE="ORD(101.43," S TEXT="Select a Order Status from the status list or enter '^' to Quit",HELP="Select a Order Status from the status list or '^' to Quit"
 I TYPE="RAMIS(71," S TEXT="Select a Radiology Procedure Status from the status list or enter '^' to Quit",HELP="Select a Radiology Procedure Status from the status list or '^' to Quit"
 I TYPE="TAX" S TEXT="Select a Taxonomy Status from the status list or enter '^' to Quit",HELP="Select a Taxonomy Status from the status list or '^' to Quit"
 ;
 S CNT=0,CNT1=0,STAT=""
 ;if text is not entered into the prompt or no match is found display
 ;entire list of statuses for this finding item
 ;
 F  S STAT=$O(ARRAY(STAT)) Q:STAT=""  D
 . S NODE=$G(ARRAY(STAT))
 . I TYPE="DRUG" S STR=$P(NODE,U)_" ("_$P(NODE,U,2)_")"
 . E  S STR=$P(NODE,U)
 . S CNT=CNT+1,CNT1=CNT1+1
 . I CNT=1 S TMP="SO^*:WildCard;"_CNT1_":"_STR
 . I CNT'=1 S TMP=TMP_";"_CNT1_":"_STR
 ;
 ;if no match display all possible status in a DIR output
 S DIR(0)=TMP
 S DIR("A")=TEXT
 S DIR("?")=HELP
 D ^DIR
 I $D(DTOUT)!($D(DUOUT))!($G(Y)="") S STATUS="" Q
 S STATUS=Y(0)
 I STATUS="WildCard" S STATUS="*"
 I TYPE="DRUG",STATUS'="*" S STATUS=$P(STATUS," ",1,($L(STATUS," ")-1))
 Q
 ;
