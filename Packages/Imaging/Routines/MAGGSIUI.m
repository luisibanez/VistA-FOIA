MAGGSIUI ;WOIFO/GEK - Utilities for Image Import API
 ;;3.0;IMAGING;**7,8,48**;Jan 11, 2005
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
REMOTE(MAGRY,MAGDATA) ;RPC [MAG4 REMOTE IMPORT]
 ; To Import Images into VistA from a Windows App, by sending an array.
 I ($D(MAGDATA)<10) S MAGRY(0)="0^Missing Data Array !." Q
 N I,J,ICT,DCT,MAGIX,IMAGES,ERR,X,Z
 S (ERR,ICT,DCT)=0
 S I="" F  S I=$O(MAGDATA(I)) Q:I=""  S X=MAGDATA(I) D  Q:ERR
 . S Z=$P(X,U)
 . I (X="")!(Z="") S MAGRY(0)="0^INVALID Data in Input Array: Node "_I_"="""_X_"",ERR=1 Q
 . I Z="IMAGE" S ICT=ICT+1,IMAGES(ICT)=$P(X,U,2,99) Q
 . S DCT=DCT+1,MAGIX(Z)=$P(X,U,2,99)
 I 'ERR D IMPORT(.MAGRY,.IMAGES,.MAGIX)
 Q
 ;
IMPORT(MAGRY,IMAGES,MAGIX) ;
 ; "IDFN","PXPKG","PXIEN","PXDT","TRKID","ACQD","ACQS","ACQL","STSCB","ITYPE",
 ;        "CMTH","CDUZ","USERNAME","PASSWORD","GDESC","DFLG","TRTYPE","DOCCTG","DOCDT",
 ;        "IXTYPE","IXSPEC","IXPROC","IXORIGIN    ;Patch 8: Added Index fields
 ;
 ;   Index fields Package and Class ("IXPKG" and "IXCLS") aren't accepted.  The values for those
 ;     fields are computed.
 ;We'll convert the parameters into the Image Data Array,
 ;   validate it, then set the Import Queue
 ;
 N $ETRAP,$ESTACK S $ETRAP="D ERR^MAGGSIUI"
 K MAGRY S MAGRY(0)="0^Importing data..."
 N APISESS
 N PRM,CT,MAGA,MAGY,MAGTN,TNODE
 N IDFN,PXPKG,PXIEN,PXDT,TRKID,ACQD,ACQS,ACQL,STSCB,ITYPE,CMTH,CDUZ,USERNAME,PASSWORD,GDESC,DFLG,TRTYPE,DOCCTG,DOCDT,IXPKG,IXCLS,IXTYPE,IXSPEC,IXPROC,IXORIGIN
 N MAGTM,QTIME,MAGIXZ
 S CT=0
 M MAGIXZ=MAGIX
 F PRM="IDFN","PXPKG","PXIEN","PXDT","TRKID","ACQD","ACQS","ACQL","STSCB","ITYPE","CMTH","CDUZ","USERNAME","PASSWORD","GDESC","DFLG","TRTYPE","DOCCTG","DOCDT","IXTYPE","IXSPEC","IXPROC","IXORIGIN" D
 . S @PRM=$G(MAGIX(PRM)) K MAGIX(PRM) ; P8T14 added K.. and next line to account for field numbers later.
 . Q
 S PRM="" F  S PRM=$O(MAGIX(PRM)) Q:PRM=""  D SA(PRM,$G(MAGIX(PRM)))
 ;
 S MAGTM=$$NOW^XLFDT
 I '$G(DUZ) S MAGRY(0)="0^DUZ is undefined." Q  ;D ERRTRK Q
 ; DATATRK sets the Global Variable APISESS  = Internal entry number for Session File.
 D DATATRK
 I '$$REQPARAM() D ERRTRK Q
 ;
 ; Set the image data array
 ;S CT=0
 D SA(5,IDFN)    ;PATIENT
 D SA(16,PXPKG)   ;PARENT DATA FILE
 D SA(17,PXIEN) ;PARENT GLOBAL ROOT
 D SA(15,PXDT)   ; PROCEDURE/EXAM DATE/TIME
 D SA(108,TRKID) ; TRACKING ID (new)
 D SA("ACQD",ACQD)  ; ACQUISTION DEVICE ( new )
 ; Acquisition site is a 2 ';' piece param of INSTITUTION ';' HOSPITAL LOCATION  
 ;//  ACQS had Location in it, doesn't now.
 D SA(.05,ACQS) ; this used to be fld 105
 D SA(101,ACQL)
 ;// 5/7/03 Patch 8 : fix bug with ACQS and ACQL this ';' was old way of sending info.
 ;//D SA("ACQS",ACQS_";"_$G(ACQL)) ;Fields of ACQUISITION DEVICE file: #1 INSTITUTION ';' #2 HOSPITAL LOCATION
 D SA("STATUSCB",STSCB)  ; STATUS CALLBACK  (was referred to as ExceptionHandler)
 D SA(3,ITYPE)   ; OBJECT TYPE
 D SA("CALLMTH",CMTH)     ; CALL METHOD
 D SA(8,CDUZ)    ; IMAGE SAVE BY
 ; // It was USERPASS = USERNAME_";"_(encrypted)PASSWORD
 D SA("USERNAME",USERNAME)
 D SA("PASSWORD",PASSWORD)
 D SA(10,GDESC)  ; SHORT DESCRIPTION
 D SA("DELFLAG",DFLG)    ; DELETE FLAG
 D SA("TRNSTYP",TRTYPE)  ; TRANSACTION TYPE
 D SA(100,DOCCTG) ;  document Main category
 ;D SA("DOCCTG2",DOCCTG2) ;  document Sub category
 ;D SA("DOCCTG3",DOCCTG3) ;  document Sub Sub category
 D SA(110,DOCDT)     ;  document date
 ; Patch 8 allows Index fields to be imported.
 ;"IXTYPE","IXSPEC","IXPROC","IXORIGIN"
 D SA(42,IXTYPE)     ;  Index Type
 D SA(43,IXPROC)     ;  Index Proc/Event
 D SA(44,IXSPEC)     ;  Index Spec/SubSpec
 D SA(45,IXORIGIN)         ;  Index Origin
 ;
 ;
 D VAL^MAGGSIV(.MAGRY,.MAGA,1)
 I 'MAGRY(0) D ERRTRK Q
 D SI("IMAGES",.IMAGES)  ; ARRAY OF IMAGES TO IMPORT
 I 'MAGRY(0) D ERRTRK Q
 K MAGRY
 ;
 I TRTYPE="NOQUEUE" M MAGRY=MAGA S MAGRY(0)="1^" Q
 ; Testing without BackGround Processor.
 ;
 ; This call is for BP
 S QTIME=$$NOW^XLFDT
 S MAGY=$$IMPORT^MAGBAPI(.MAGA,STSCB,TRKID,$$PLACE^MAGBAPI(DUZ(2))) ; DBI - SEB 10/11/2002
 ; RETURN THE QUEUE NUMBER
 I 'MAGY S MAGRY(0)="0^Error Setting Queue: "_$P(MAGY,U,2),MAGY=TRKID
 E  S MAGRY(0)=MAGY_"^Data has been Queued.",MAGY=+MAGY
 ; for Testing, we'll track input array, and results array by Queue number.
 I 'MAGRY(0) D ERRTRK Q
 D LOGRES^MAGGSIU3(.MAGRY,0,APISESS)
 ;
 Q
REQPARAM() ;Check that the required parameters have values.
 N CT
 S CT=0
 S MAGRY(0)="1^Checking for Required parameter values..."
 I IDFN="" S CT=CT+1,MAGRY(CT)="DFN is Required. !"
 I '$D(IMAGES),'CMTH S CT=CT+1,MAGRY(CT)="List of Images is Required. !"
 ;
 I (PXPKG=""),(DOCCTG=""),(IXTYPE="") S CT=CT+1,MAGRY(CT)="Procedure or Category or Index Type is Required. !"
 I (PXPKG'=""),(DOCCTG'="") S CT=CT+1,MAGRY(CT)="Procedure OR Document Category. Not BOTH. !"
 ;
 I (PXPKG'=""),(PXIEN="") S CT=CT+1,MAGRY(CT)="Procedure IEN is Required. !"
 I (PXPKG=""),(PXIEN'="") S CT=CT+1,MAGRY(CT)="Procedure Package is Required. !"
 I (PXPKG'=""),(PXDT="") S CT=CT+1,MAGRY(CT)="Procedure Date is Required. !"
 ;
 ;Patch 8 index field check... could be using Patch 7 or Patch 8.
 ;  We're this far, so either PXIEN or DOCCTG is defined
 I (IXTYPE'=""),(DOCCTG'="") S CT=CT+1,MAGRY(CT)="Image Type OR Document Category. Not BOTH. !"
 ; MAGGSIA computes PACKAGE #40 and CLASS #41 when adding an Image (2005) entry.
 ;
 I TRKID="" S CT=CT+1,MAGRY(CT)="Tracking ID is Required. !"
 I ACQD="" S CT=CT+1,MAGRY(CT)="Acquisition Device is Required. !"
 ;   ACQS ( could ? ) default to users institution i.e. DUZ(2)
 I ACQS="" S CT=CT+1,MAGRY(CT)="Acquisition Site is Required. !"
 ;
 I STSCB="" S CT=CT+1,MAGRY(CT)="Status Handler (TAG^ROUTINE) is Required. !"
 ;
 I (DOCCTG'=""),(DOCDT="") S CT=CT+1,MAGRY(CT)="Document Date is Required. !"
 ;
 I (CT>0) S MAGRY(0)="0^Required parameter is null" Q MAGRY(0)
 ; More Checks here to stop Duplicate or incorrect Tracking ID's from being Queued
 ;  //TODO: Need to check the Queue File, to see if this Tracking ID is already Queued.
 I (TRKID'="") I $D(^MAG(2005,"ATRKID",TRKID)) S MAGRY(0)="0^Tracking ID Must be Unique !"
 I (TRKID'="") I ($L(TRKID,";")<2) S MAGRY(0)="0^Tracking ID Must have "";"" Delimiter"
 ;
 Q MAGRY(0)
 ;
SA(FLD,VAL) ;Set the data array with Fld,Value
 Q:VAL=""
 S CT=CT+1,MAGA(CT)=FLD_U_VAL
 Q
SI(FLD,ARR) ;Set the images into the data array
 ; Don't New 'CT' it is a global variable.
 ; P48T1 changes to account for more than 1 '.' in filename.
 S MAGRY(0)="1^Valid Image file Extensions."
 N I,MAGEXT,MAGFN
 S I="" F  S I=$O(ARR(I)) Q:I=""  D  Q:'MAGRY(0)
 . S CT=CT+1
 . I ($L($P(ARR(I),U),".")<2) S MAGRY(0)="0^Invalid file name: "_ARR(I) Q
 . S MAGFN=$P(ARR(I),"^")
 . S MAGEXT=$$UP^XLFSTR($P(MAGFN,".",$L(MAGFN,".")))
 . I '$D(^MAG(2005.021,"B",MAGEXT)) S MAGRY(0)="0^Unsupported File Type:'."_MAGEXT Q
 . S MAGA(CT)="IMAGE"_U_ARR(I)
 Q
GETARR(ARR,QNUM) ;RPC [MAG4 DATA FROM IMPORT QUEUE]
 ; Get the Input Array from Queue Number
 ; P48T1 Take out changes that Stopped Duplicates.
 ;    BP changes will handle it now.
 I '$G(QNUM) S ARR(0)="0^INVALID QUEUE Number: "_$G(QNUM) Q
 D IMPAR^MAGQBUT2(.ARR,QNUM)
 Q
STATUSCB(MAGRY,STAT,TAGRTN,DOCB) ;RPC [MAG4 STATUS CALLBACK]
 ; Report Status to calling application
 ; Now the IAPI and OCX make this call.  Not BP
 ; STAT(0)= "0^message" or "1^message"
 ; STAT(1)=TRKID,
 ;        (2)=QNUM
 ;        (3..N)=warnings
 ;TAGRTN                 : The TAG^RTN to call with Status Array
 ;DOCB                   : (1|0) to suppress execution of Status Callback
 ; 
 N APISESS,TRKID,CBMSG
 S DOCB=$S($G(DOCB)="":1,1:+$G(DOCB)) ;  Default to TRUE
 ; Old Import API and BP that made this call, will work : DOCB defaults to 1
 S CBMSG=$S(DOCB:"Status Callback was called",1:"Status Callback was NOT called")
 I DOCB D @(TAGRTN_"(.STAT)")
 S MAGRY="1^"_CBMSG
 S STAT($O(STAT(""),-1)+1)=MAGRY
 S TRKID=$G(STAT(1))
 ; Log Results if Status Callback was made or not.
 I $L(TRKID) D
 . S APISESS=$$SES4TRK^MAGGSIU3(TRKID) ;
 . I APISESS D LOGRES^MAGGSIU3(.STAT,0,APISESS) ;gek/send Tracking ID to log status
 Q
TESTCB(STATARR) ;TESTING.  This is used as the Status Callback for testing purposes
 ; a Valid "M" TAG^ROUTINE must be sent as a value for the import property STATUSCB
 ; This TAG is here so that the STATUSCB value validates successfully
 Q
ERRTRK ;Track bad data and Quit
 N I
 D LOGERR^MAGGSERR("---- New Error ----",APISESS)
 S I="" F  S I=$O(MAGRY(I)) Q:I=""  D LOGERR^MAGGSERR(MAGRY(I),APISESS)
 Q
DATATRK ; Track the raw data being sent to the Import API.
 ; This is called to log the data being imported.  
 ; Later the Results (or error messages) will be logged
 N XY
 S APISESS=$$LOG^MAGGSIU3(.XY,.MAGIXZ,.IMAGES,IDFN,ACQD,TRKID)
 Q
ERR ; ERROR TRAP FOR Import API
 N ERR S ERR=$$EC^%ZOSV
 S MAGRY(0)="0^ETRAP: "_ERR
 D @^%ZOSF("ERRTN")
 I $G(APISESS) D ERRTRK
 Q
