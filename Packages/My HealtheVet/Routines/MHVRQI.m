MHVRQI ;WAS/GPM - Request Manager Immediate Mode ; [8/22/05 6:19pm]
 ;;1.0;My HealtheVet;;Aug 23, 2005
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 ;
 ;
REALTIME(REQ,XMT,HL) ; Manage real time requests
 ;
 ;  It is assumed no ROI logging or checking is needed for real time
 ; request.
 ;
 ;  Triage, execute/extract and respond to real time requests and
 ; queries.  If the request is rejected (blocked, or doesn't support
 ; real time access), send a negative acknowledgement, otherwise call
 ; the execute/extraction routine.  If there are no errors transmit
 ; the results, send a negative acknowledgement if there are errors.
 ;
 ; Input:
 ;      REQ - Parsed query and query paramters
 ;      XMT - Transmission parameters
 ;       HL - HL7 package array variable
 ;
 ; Output:
 ;      Extract information and respond to query
 ;
 N ERR,DATAROOT
 S DATAROOT="^TMP(""MHVEXTRACT"",$J,"_REQ("TYPE")_")"
 S ERR=""
 ;
 D LOG^MHV7U("REAL TIME","BEGIN","S",0)
 ;
 I $$REJECT(.REQ,.ERR) D  Q
 . D LOG^MHV7U("REQUEST CHECK","REJECT^"_ERR,"S",0)
 . D XMIT^MHV7T(.REQ,.XMT,ERR,"",.HL)
 D LOG^MHV7U("REQUEST CHECK","PROCESS","S",0)
 ;
 I '$$EXECUTE(.REQ,.ERR,DATAROOT) D  Q
 . D LOG^MHV7U("EXECUTE","ERROR^"_ERR,"S",0)
 . D XMIT^MHV7T(.REQ,.XMT,ERR,DATAROOT,.HL)
 D LOG^MHV7U("EXECUTE","COMPLETE","S",0)
 ;
 D XMIT^MHV7T(.REQ,.XMT,ERR,DATAROOT,.HL)
 K @DATAROOT
 ;
 D LOG^MHV7U("REAL TIME","END","S",0)
 ;
 Q
 ;
REJECT(REQ,ERR) ;Check to see if request can be processed
 S ERR=""
 I REQ("BLOCKED") D  Q 1
 . S ERR="^207^AR^Request Type Blocked by Site"
 . I $D(REQ("QPD")) S ERR="QPD^1^5"_ERR    ;Its a query flag the QPD
 . E  S ERR="MSH^1^9"_ERR
 . Q
 I 'REQ("REALTIME") D  Q 1
 . S ERR="^207^AR^Real Time Calls Not Supported By Request Type"
 . I $D(REQ("QPD")) S ERR="RCP^1^1"_ERR    ;Its a query flag the RCP
 . E  S ERR="MSH^1^9"_ERR
 . Q
 Q 0
 ;
EXECUTE(REQ,ERR,DATAROOT) ;Execute action or extraction
 ;Calls the execute routine for this request type
 ;For queries this is the extraction routine
 ;Parameters can be passed on REQ
 ;Errors are passed on ERR
 ;DATAROOT is the name holding the data, can be local or global
 S ERR=""
 D @(REQ("EXECUTE")_"(.REQ,.ERR,DATAROOT)")
 I ERR D  Q 0
 . S ERR="^207^AR^"_$P(ERR,"^",2)
 . I $D(REQ("QPD")) S ERR="QPD^1^5"_ERR    ;Its a query flag the QPD
 . E  S ERR="MSH^1^9"_ERR
 . Q
 Q 1
 ;
