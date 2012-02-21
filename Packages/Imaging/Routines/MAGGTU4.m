MAGGTU4 ;WOIFO/GEK - Testing callbacks for Delphi Doc Image Prototype ; [ 06/20/2001 08:57 ]
 ;;3.0;IMAGING;**8,48,63,45**;Sep 12, 2005
 ;; +---------------------------------------------------------------+
 ;; | Property of the US Government.                                |
 ;; | No permission to copy or redistribute this software is given. |
 ;; | Use of unreleased versions of this software requires the user |
 ;; | to execute a written test agreement with the VistA Imaging    |
 ;; | Development Office of the Department of Veterans Affairs,     |
 ;; | telephone (301) 734-0100.                                     |
 ;; |                                                               |
 ;; | The Food and Drug Administration classifies this software as  |
 ;; | a medical device.  As such, it may not be changed in any way. |
 ;; | Modifications to this software may result in an adulterated   |
 ;; | medical device under 21CFR820, the use of which is considered |
 ;; | to be a violation of US Federal Statutes.                     |
 ;; +---------------------------------------------------------------+
 ;;
 Q
GETVER(SVRVER,SVRTVER,ALLOWCL) ;
 ; We Can't compute the Server's current version
 ; KIDS installs aren't all related to the Delphi Client.
 ; The Server Version SVRVER needs hardcoded to match the Delphi Client.
 ; and This Routine must be distributed whenever a new Client is
 S SVRVER="3.0.45"
 S SVRTVER="8" ; This is the T version that the server expects
 ; released Client will have the T version that the server expects
 S ALLOWCL="|3.0.24|3.0.33|3.0.42|3.0.8|3.0.48|3.0.63|3.0.41|3.0.45|3.0.59|"
 Q
 ;
CHKVER(MAGRY,CLVER) ;RPC [MAG4 VERSION CHECK]
 ; CLVER is the version of the Delphi Client.
 ; CLVER format = Major,Minor,Patch,T Version
 ; example : for Version 3.0 Patch 8 T 21 -->  CLVER=3.0.8.21
 ; Ver 2.5P9 (2.5.24.1) is first Delphi Ver that makes this call.
 ; 3 possible return codes in 1st '^' piece of MAGRY(0).
 ; 0^message     :       The Client will display the message and continue.
 ; 1^message :   The Client will continue without displaying any message.
 ; 2^message :   The Client will display the message and then Abort. (Terminate)
 ; the message  : consists of 2nd '^' piece of (0) node and any other nodes. i.e. MAGRY(1..n)
 ;
 ;// NEXT LINE is what Version 3.0.7 and before, Returned in MAGRY(0) to the Delphi App
 ;// S MAGRY(0)="1^Version not Checked, continue"
 ;// Q
 ; Bug in 42.  the Version comes in as 30.5.42.x  
 ;   because 42 client didn't have the code to convert the 'Sequence' Version
 ;   to the VistA Version format.  This will account for that.
 S CLVER=$G(CLVER)
 I $P(CLVER,".",1)="30" S CLVER="3.0."_$P(CLVER,".",3,99)
 N PLC,SV,ST,CV,CP,CT,ALLOWV,WARN
 ; PLC = Entry in 2006.1
 ; SV = Server Version -> (3.0.8) from (3.0.8.43) Hard coded to Sync with Delphi Clients
 ; ST = Server T Version -> 43 from full version (3.0.8.43)
 ; CV = Client Version sent from Client 3.0.8 same format as SV
 ; CT = Client T Version sent from Client i.e. 43 same format as ST
 ; ALLOWV = Hard coded string of allowed clients for this KIDS.
 ; WARN = 1|0 Boolean value determines if client needs EKG Warning. 
 S PLC=$$PLACE^MAGBAPI($G(DUZ(2)))
 ;       Quit if we don't have a valid DUZ(2) or valid PLACE: ^MAG(2006.1,PLC)
 I 'PLC D  Q
 . S MAGRY(0)="2^   Error verifying Imaging Site (Place) "
 . S MAGRY(5)="   Contact IRM.  Application will abort"
 . Q
 ;       Set up local variables.
 D GETVER(.SV,.ST,.ALLOWV)
 S CV=$P(CLVER,".",1,3),CP=$P(CLVER,".",3),CT=$P(CLVER,".",4)
 ;  set WARN to indicate if Warning is needed or not.
 D NEEDWARN(.WARN)
 ;       Quit if site has VERSION CHECKING=0 (OFF) in Imaging Site Params File.  
 I '$$VERCHKON(PLC) D  Q
 . S MAGRY(0)="1^Temporarily Allowing All Versions"
 . ; But, need to Display the warning, even if Version Checking is OFF
 . I WARN S MAGRY(0)="0^      =========== WARNING ===============" D WARNING
 . Q
 I $P(CLVER,"|",2)="RIV" D  Q
 . S MAGJOB("RIV")=1
 . ; Allowing |RIV clients always 
 . S MAGRY(0)="1^Allowing Remote Image Connection"
 . Q
 ;
 ;       Check version and Terminate the client if not an allowable Version.
 ;Abort the Client if it isn't one of the Allowed Clients.
 I (CV'=SV),'(ALLOWV[("|"_CV_"|")) D  Q
 . S MAGRY(0)="2^Server has Imaging V. "_SV_" installed."
 . S MAGRY(5)="Client is running     Imaging V. "_CV
 . S MAGRY(7)="    "
 . S MAGRY(10)=" The Client application will not run correctly"
 . S MAGRY(20)=" Contact the Imaging System Manager"
 . S MAGRY(25)=" to update this workstation."
 . S MAGRY(30)="   "
 . S MAGRY(40)="      APPLICATION WILL ABORT !"
 . ;  Clients prior to 8, have a 'Cancel' button on Message Dialog (oversight)
 . I $P(CV,".",1)=2 S MAGRY(50)="(clicking 'Cancel' will not stop the Abort.)"
 . Q 
 ; Warn the Client, allow to continue
 I (CV'=SV) D  Q
 . S MAGRY(0)="0^   Server is running Imaging V. "_SV
 . S MAGRY(5)="   Client is running   Imaging V. "_CV
 . S MAGRY(7)="    "
 . S MAGRY(10)="  The Client application should be updated "
 . S MAGRY(20)="  Contact the Imaging System Manager"
 . S MAGRY(25)="  to update this workstation."
 . S MAGRY(30)="   "
 . S MAGRY(40)="       APPLICATION Will Continue"
 . ;  Clients prior to 8, have a 'Cancel' button on Message Dialog (oversight)
 . I $P(CV,".",1)=2 S MAGRY(50)="(clicking 'Cancel' will not stop the Client.)"
 . I WARN D WARNING
 . Q
 ; Versions are the Same: If T versions are not, warn the Client.
 ; Released Client (of any version) will have the T version that the server expects, and 
 ; no warning will be displayed.
 I CT,(CT'=ST) D  Q
 . S MAGRY(0)="0^   Server is running Imaging V. "_SV_"."_ST
 . S MAGRY(5)="   Client is running   Imaging V. "_CLVER
 . S MAGRY(10)="     "
 . S MAGRY(20)="  Test Versions of Patch "_SV_" other than T"_ST_" may not work correctly."
 . S MAGRY(25)="     "
 . S MAGRY(30)="                       APPLICATION will Continue  "
 . Q
 ; Client and Server Versions are the same, to the T. (Ha, get it)
 S MAGRY(0)="1^Version Check OK. Server: "_SV_" Client: "_CV Q
 Q
 ;
VERCHKON(PLC) ; Is Version checking on for the site (Place)
 Q +$P(^MAG(2006.1,PLC,"KEYS"),"^",5)
 ;
NEEDWARN(WARN) ; This call determines if Client needs the warning.
 I CV="3.0.59"    S WARN=0 Q  ; Client 59 has 63.
 I CV="3.0.45"    S WARN=0 Q  ; Client 45 has 63.
 I CV="3.0.41"    S WARN=0 Q  ; It is fixed in 41
 I CV="3.0.63"    S WARN=0 Q  ; It is fixed in 63
 I $P(CV,".",1)=2 S WARN=0 Q  ;Older Clients don't have the EKG Problem.
 I ALLOWV'[CV     S WARN=0 Q  ; Patch 3.0.7, 3.0.2 don't have EKG problem.
 S WARN=1 ; This means to Show the EKG Warning.
 Q
 ;
WARNING ; This is hard coded for the EKG Warning.
 ; Put Warning at the End of any Return Message.
 S MAGRY(1000)=" "
 S MAGRY(1010)="!*************************************************!"
 S MAGRY(1015)=" "
 S MAGRY(1020)="  PATIENT SAFETY NOTIFICATION"
 S MAGRY(1025)=" "
 S MAGRY(1030)="      Under certain circumstances, the EKG window will not"
 S MAGRY(1040)="refresh properly when you select a new patient in CPRS; "
 S MAGRY(1050)="instead of showing the new patient, the EKG window will "
 S MAGRY(1060)="continue to show the previous patient.   "
 S MAGRY(1065)="   "
 S MAGRY(1070)="To prevent this problem:"
 S MAGRY(1075)=" "
 S MAGRY(1080)="     Verify that the 'Show MUSE EKGs' option under"
 S MAGRY(1085)="     Options > View Preferences is checked;"
 S MAGRY(1090)="     OR"
 S MAGRY(1100)="     Do not minimize the Imaging Display window while viewing EKGs."
 S MAGRY(1110)="   "
 S MAGRY(1115)="This problem will be corrected shortly by Imaging Patch 63."
 S MAGRY(1120)="!*************************************************!"
 Q
ABSJB(MAGRY,MAGIN) ;RPC [MAG ABSJB] SET ABSTRACT AND/OR JUKEBOX QUEUES
 N MAGIENAB,MAGIENJB,MAGERR,X
 S MAGERR=0
 N $ETRAP,$ESTACK S $ETRAP="D ERR^"_$T(+0)
 S MAGRY="0^ERROR: Setting Queue for Abstract or JukeBox copy"
 S MAGIENAB=+$P(MAGIN,"^",1),MAGIENJB=$P(MAGIN,"^",2)
 L +(^MAGQUEUE(2006.03,0),^MAGQUEUE(2006.031)):10 E  D QERR Q
 I +MAGIENAB>0 S X=$$ABSTRACT^MAGBAPI(MAGIENAB,$$DA2PLC^MAGBAPIP(MAGIENAB,"F"))
 I MAGIENJB'="" S X=$$JUKEBOX^MAGBAPI(MAGIENJB,$$DA2PLC^MAGBAPIP(MAGIENJB,"F"))
 L -(^MAGQUEUE(2006.03,0),^MAGQUEUE(2006.031))
 S MAGRY="1^SUCCESSFUL"
 Q
ERR ;
 L -(^MAGQUEUE(2006.03,0),^MAGQUEUE(2006.031))
 N ERR S ERR=$$EC^%ZOSV
 S MAGRY="0^Error setting JukeBox/Abstract Queue.  Not Fatal.  'Save' will continue..."
 D LOGERR^MAGGTERR(ERR)
 D @^%ZOSF("ERRTN")
 Q
QERR ;
 N MAGTXT
 S MAGTXT="Failed to set JukeBox/Abstract Queue."
 ;ENTRY(MAGIMT,MAGDUZ,MAGO,MAGPACK,MAGDFN,MAGCT,MAGAD)
 D ENTRY^MAGLOG("QFAIL",$G(DUZ),MAGIENJB,"","","",MAGTXT)
 D ACTION^MAGGTAU(MAGTXT,1)
 S MAGRY="1^"_MAGTXT_"  Message was sent to IRM.  Not Fatal.  'Save' will continue..."
 N XMSUB,XMY,XMTEXT,XMK,XMDUZ
 S XMTEXT="^TMP($J,""MAGQ"","
 S XMSUB=MAGTXT
 K ^TMP($J,"MAGQ")
 S ^TMP($J,"MAGQ",1)=MAGTXT
 S ^TMP($J,"MAGQ",2)=" for Image IEN: "_MAGIENJB
 S ^TMP($J,"MAGQ",3)="You need to run the Verifier for this Image IEN"
 S XMY("G.IMAGING DEVELOPMENT@FORUM.VA.GOV")=""
 D ^XMD
 S XMDUZ=DUZ D KLQ^XMA1B
 K ^TMP($J,"MAGQ")
 Q
