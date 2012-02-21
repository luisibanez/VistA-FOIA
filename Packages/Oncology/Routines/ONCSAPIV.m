ONCSAPIV ;Hines OIFO/SG - COLLABORATIVE STAGING (VERSION)  ; 3/18/04 8:21am
 ;;2.11;ONCOLOGY;**40**;Mar 07, 1995
 ;
 Q
 ;
 ;***** CHECKS THE VERSION OF THE LOCAL TABLE CACHE
 ;
 ; [.ONCSAPI]    Reference to the API descriptor (see ^ONCSAPI)
 ;
 ; Return Values:
 ;        0  Ok
 ;       <0  Error code
 ;
CHKVER(ONCSAPI) ;
 N APIVER,NODE,RC,TMP
 D CLEAR^ONCSAPIE()
 ;--- Get the version of the CS API
 S APIVER=$$VERSION(.ONCSAPI)  Q:APIVER<0 APIVER
 ;--- Check the version of the local table cache
 S NODE=$NA(^XTMP("ONCSAPI"))
 L +@NODE:5  E  Q $$ERROR^ONCSAPIE(-15,,"CS table cache")
 I APIVER'="",$G(@NODE@("TABLES"))'=APIVER  D
 . K @NODE  S @NODE@("TABLES")=APIVER
 L -@NODE
 ;--- Refresh the node descriptor
 S TMP=$$FMADD^XLFDT(DT,30)
 S @NODE@(0)=TMP_U_DT_U_"Local CS table cache"
 Q 0
 ;
 ;***** SETS THE EVENT INTERFACE ENTRY POINTS
 ;
 ; .CBK          Reference to the destination list
 ;
SETCBK(CBK) ;
 ;;CHARACTERS^TEXT^ONCSAPIV
 ;
 D SETCBK^ONCSAPIX(.CBK,"SETCBK^ONCSAPIV")
 Q
 ;
 ;***** TEXT CALLBACK FOR THE SAX PARSER
 ;
 ; TXT           Line of unmarked text
 ;
TEXT(TXT) ;
 N L,L2E
 S L=$L(ONCXML("PATH"),","),L2E=$P(ONCXML("PATH"),",",L-1,L)
 ;--- CS API Version
 I L2E="CS-RESPONSE,APIVER"  S ONCXML("APIVER")=TXT  Q
 ;--- Default processing
 D TEXT^ONCSAPIX(TXT)
 Q
 ;
 ;***** RETURNS THE CS API VERSION
 ;
 ; [.ONCSAPI]    Reference to the API descriptor (see ^ONCSAPI)
 ;
 ; The ^TMP("ONCSAPIV",$J) global node is used by this function.
 ;
 ; Return Values:
 ;        0  Ok
 ;       <0  Error code
 ;
VERSION(ONCSAPI) ;
 N CBK,ONCREQ,ONCRSP,ONCXML,RC,URL
 D CLEAR^ONCSAPIE()
 S ONCRSP=$NA(^TMP("ONCSAPIV",$J))  K @ONCRSP
 ;--- Get the server URL
 S URL=$$GETCSURL^ONCSAPIU()
 ;
 S RC=0  D
 . ;--- Prepare the request data
 . S RC=$$PARAMS^ONCSAPIR("ONCREQ","CS-GETVER")           Q:RC<0
 . ;--- Request the DLL version
 . D:$G(ONCSAPI("DEBUG"))
 . . D ZW^ONCSAPIU("ONCREQ","*** 'VERSION' REQUEST ***",1)
 . S RC=$$REQUEST^ONCSAPIR(URL,ONCRSP,"ONCREQ")           Q:RC<0
 . D:$G(ONCSAPI("DEBUG"))
 . . D ZW^ONCSAPIU(ONCRSP,"*** 'VERSION' RESPONSE ***",1)
 . K ONCREQ
 . ;--- Parse the response
 . D SETCBK(.CBK),EN^MXMLPRSE(ONCRSP,.CBK,"W")
 . ;--- Check for parsing and web service errors
 . S RC=$$CHKERR^ONCSAPIR(.ONCXML)                        Q:RC<0
 . ;--- Check the version number
 . I $G(ONCXML("APIVER"))=""  S RC=$$ERROR^ONCSAPIE(-13)  Q
 ;
 ;--- Cleanup
 K @ONCRSP
 Q $S(RC<0:RC,1:$G(ONCXML("APIVER")))
