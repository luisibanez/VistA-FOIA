MAGGSIV1 ;WOIFO/GEK - Imaging Validate Data ; [ 08/15/2004 08:57 ]
 ;;3.0;IMAGING;**8**;Sep 15, 2004
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
VALID(MAGF,MAGL,MAGD,MAGRES) ; call to validate a value for a field in a FM file.
 ; Function is boolean.  Returns:
 ;        0   -  Invalid 
 ;        1   -  Valid 
 ;        ""  -  Error
 ; Call this function before you set the FDA Array.
 ; MAGD - sent by reference because it could be Internal or External
 ;        and if it is external and valid, it is changed to Internal.
 ;        
 ; MAGF  : File Number
 ; MAGL  : Field Number
 ; MAGD  : (sent by reference) data value of field
 ; MAGRES: (sent by refernece) Result message
 ;
 N $ETRAP,$ESTACK S $ETRAP="D ERR^"_$T(+0)
 N MAGR,MAGMSG,MAGSP,MAGRESA,MAGE,MAGPT
 ;if a BAD field number
 I '$$VFIELD^DILFD(MAGF,MAGL) D  Q 0
 . S MAGRES="The field number: "_MAGL_", in File: "_MAGF_", is invalid."
 D FIELD^DID(MAGF,MAGL,"","SPECIFIER","MAGSP")
 ; If it is a pointer field 
 ; If an  integer - We assume it is a pointer and validate that and Quit.
 ; If not integer - We assume it is external value, proceed to let CHK do validate
 I (MAGSP("SPECIFIER")["P"),(+MAGD=MAGD) D  Q MAGPT
 . I $$EXTERNAL^DILFD(MAGF,MAGL,"",MAGD)'="" S MAGPT=1,MAGRES="Valid pointer" Q
 . S MAGPT=0,MAGRES="The value: "_MAGD_" for field: "_MAGL_" in File: "_MAGF_" is an invalid Pointer."
 . Q
 ;
 D CHK^DIE(MAGF,MAGL,"E",MAGD,.MAGR,"MAGMSG")
 ; If success, Quit. We changed External to Internal. Internal is in MAGR
 I MAGR'="^" S MAGD=MAGR Q 1
 ;  If not success Get the error text and Quit 0
 D MSG^DIALOG("A",.MAGRESA,245,5,"MAGMSG")
 S MAGRES=MAGRESA(1)
 Q 0
ERR ;
 N ERR
 S ERR=$$EC^%ZOSV
 S MAGRES="0^Error during data validation: "_ERR
 D LOGERR^MAGGTERR(ERR)
 D @^%ZOSF("ERRTN")
 D CLEAN^DILF
 Q
