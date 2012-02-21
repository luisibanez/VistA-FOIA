ONCSAPI ;Hines OIFO/SG - COLLABORATIVE STAGING API  ; 3/18/04 8:22am
 ;;2.11;ONCOLOGY;**40**;Mar 07, 1995
 ;
 ; ONCSAPI ------------- API DESCRIPTOR
 ;
 ; ONCSAPI(
 ;
 ;   "DEBUG")            Debug mode
 ;                         0  Disabled
 ;                         1  Enabled
 ;
 ;   "MSG",              ""
 ;     IEN,
 ;       0)              Error Descriptor
 ;                         ^01: Error Code   (see MSGLIST^ONCSAPIE)
 ;                         ^02: Error Message
 ;                         ^03: Label+Offset (optional)
 ;                         ^04: Routine      (optional)
 ;       1,i)            Error details (text)
 ;     "E",
 ;       Error Code,
 ;         IEN)    ""
 ;
 ; ^XTMP("ONCSAPI") ---- LOCAL CS TABLE CACHE
 ;
 ; ^XTMP("ONCSAPI",
 ;
 ;   0)                  Node descriptor
 ;                         ^01: Purge date  (FileMan)
 ;                         ^02: Create date (FileMan)
 ;                         ^03: Description
 ;
 ;   "SCHEMAS",
 ;     Schema#,
 ;       0)              Schema name
 ;
 ;     "N",
 ;       Name)           Schema#
 ;
 ;     "SH",
 ;       Site,Hist)      Schema#
 ;
 ;   "TABLES",           DLL Version
 ;
 ;     IEN,
 ;       0)              Table descriptor
 ;                         ^01: Number of rows
 ;                         ^02: Schema number
 ;                         ^03: Table number
 ;                         ^04: Table pattern
 ;                         ^05: Table name
 ;       Row#,
 ;         1)            Codes
 ;                         ^01: Row code
 ;                         ^02: Additional code #1
 ;                         ^03: Additional code #2
 ;                         ^04: ...
 ;         3,i)          Description (text)
 ;
 ;       "C",
 ;         RowCode)      Descriptor
 ;                         ^01: Row#
 ;                         ^02: Upper boundary (for intervals)
 ;
 ;       "FN",
 ;         Note#,i)      Footnote (text)
 ;       "TN",
 ;         Note#,i)      Note (text)
 ;
 ;     "ST",
 ;       Schema#,
 ;         Table#)       IEN
 ;
 ; CS TABLE NUMBER ----- TABLE DESCRIPTION
 ;
 ;               1       CS Tumor Size
 ;               2       CS Extension
 ;               3       CS Size/Ext Eval
 ;               4       CS Lymph Nodes
 ;               5       CS Reg Nodes Eval
 ;               6       Regional Nodes Positive
 ;               7       Regional Nodes Examined
 ;               8       CS Mets at DX
 ;               9       CS Mets Eval
 ;              10       CS Site-Specific Factor 1
 ;              11       CS Site-Specific Factor 2
 ;              12       CS Site-Specific Factor 3
 ;              13       CS Site-Specific Factor 4
 ;              14       CS Site-Specific Factor 5
 ;              15       CS Site-Specific Factor 6
 ;              16       Histologies
 ;
 ; API ENTRY POINTS ---- DESCRIPTIONS
 ;
 ;       HELP^ONCSAPI1   Displays the feild's valid codes
 ;      INPUT^ONCSAPI1   Checks if the code is valid
 ;
 ;     $$CALC^ONCSAPI3   Calculates the staging values
 ;
 ;       DEMO^ONCSAPID   Demonstration program
 ;
 ; TOOLS --------------- DESCRIPTIONS
 ;
 ;   $$SCHEMA^ONCSAPIS   Returns schema number
 ;
 ; $$CODEDESC^ONCSAPIT   Loads the CS code description
 ; $$GETCSTBL^ONCSAPIT   Returns table IEN (loads table if necessary)
 ;
 ;   $$CHKVER^ONCSAPIV   Checks version of the local table cache
 ;  $$VERSION^ONCSAPIV   Returns the CS API version
 ;
 ; UTILITIES ----------- DESCRIPTIONS
 ;
 ;      CLEAR^ONCSAPIE   Initializes the error stack
 ;      $$DBS^ONCSAPIE   Cehcks for FileMan DBS errors
 ;    $$ERROR^ONCSAPIE   Generates an error message
 ;      $$MSG^ONCSAPIE   Returns the text and type of the message
 ;    PRTERRS^ONCSAPIE   Displays the error messages
 ;      STORE^ONCSAPIE   Stores the message into the error stack
 ;
 ;   $$CHKERR^ONCSAPIR   Checks for parsing and web-service errors
 ;     HEADER^ONCSAPIR   Generates the request header
 ;   $$PARAMS^ONCSAPIR   Converts input parameters into XML format
 ;        PUT^ONCSAPIR   Adds element/text to the destination buffer
 ;  $$REQUEST^ONCSAPIR   Sends the request and gets the response
 ;    TRAILER^ONCSAPIR   Generates the request trailer
 ;
 ; $$GETCSURL^ONCSAPIU   Returns the CS web-service URL
 ;     $$PAGE^ONCSAPIU   Pauses the output at page end
 ; $$UPDCSURL^ONCSAPIU   Updates the CS web-service URL
 ;         ZW^ONCSAPIU   Emulates and extends the ZWRITE command
 ;
 ; INITIALS ------------ DEVELOPER
 ;
 ; SG                    Sergey Gavrilov
 ;
 Q
 ;
 ;***** DEMO ENTRY POINT
DEMO ;
 G DEMO^ONCSAPID
