DGPFDD ;ALB/RPM - PRF DATA DICTIONARY UTILITIES ; 2/28/05 12:02pm
 ;;5.3;Registration;**425,554**;Aug 13, 1993
 ;
 Q  ;No direct entry
 ;
INACT(DGIEN,DGSTAT,DGFILE,DGUSER) ;Inactivate flag trigger
 ; This procedure is used as a trigger that is fired when the
 ; STATUS (#.02) field of a record in either the PRF LOCAL FLAG (#26.11)
 ; file or PRF NATIONAL FLAG (#26.15) file is changed from Active to
 ; Inactive.  The trigger will inactivate all Patient Record
 ; Flag assignments associated with the inactivated Flag.
 ;
 ; Input:
 ;   DGIEN  - IEN of entry in PRF LOCAL FLAG file or PRF NATIONAL 
 ;            FLAG file
 ;   DGSTAT - Flag Status
 ;   DGFILE - PRF LOCAL FLAG file number (26.11) or PRF NATIONAL
 ;            FLAG file number (26.15)
 ;   DGUSER - IEN of user in NEW PERSON file
 ;
 ; Output:  none
 ;
 N DGAIEN  ;assignment record IEN
 N DGSUB   ;variable ptr index subscript
 ;
 Q:('$G(DGIEN))
 Q:($G(DGSTAT)'=0)
 Q:(($G(DGFILE)'=26.11)&($G(DGFILE)'=26.15))
 Q:('$G(DGUSER))
 ;
 S DGSUB=DGIEN_";DGPF("_DGFILE_","
 S DGAIEN=0
 F  S DGAIEN=$O(^DGPF(26.13,"ASTAT",1,DGSUB,DGAIEN)) Q:'DGAIEN  D
 . N DGPFA     ;assignment data array
 . N DGPFAH    ;assignment history data array
 . I $$GETASGN^DGPFAA(DGAIEN,.DGPFA) D
 . . Q:($P($G(DGPFA("STATUS")),U,1)=0)
 . . S DGPFA("STATUS")=0
 . . S DGPFA("REVIEWDT")=""
 . . S DGPFAH("ACTION")=3
 . . S DGPFAH("ASSIGNDT")=$$NOW^XLFDT()
 . . S DGPFAH("ENTERBY")=DGUSER
 . . S DGPFAH("APPRVBY")=DGUSER
 . . S DGPFAH("COMMENT",1,0)="Assignment Inactivated automatically due to Flag Inactivation."
 . . I $$STOALL^DGPFAA(.DGPFA,.DGPFAH)
 Q
 ;
PIHELP ;Executable help for PRINCIPAL INVESTIGATOR(S) (#.01) sub-field of
 ;PRINCIPLE INVESTIGATOR(S) (#2) multiple field of PRF LOCAL FLAG
 ;(#26.11) file.
 ;
 ;This sub-routine displays individuals selected as a principal
 ;investigator for a research type patient record flag.
 ;
 ;  Input:
 ;    DGLKUP - (required) array of principal investigators subscripted
 ;             by the pointer to the NEW PERSON (#200) file and the
 ;             pointer to the PRF LOCAL FLAG (#26.11) file.
 ;             Example:  DGLKUP(11744,6)=""
 ;
 ;  Output:
 ;    none
 ;
 Q:'$D(DGLKUP)
 ;
 N DGCNT
 N DGIEN
 N DGNAMES
 ;
 S DGIEN=0,DGCNT=0
 F  S DGIEN=$O(DGLKUP(DGIEN)) Q:'DGIEN  D
 . S DGCNT=DGCNT+1
 . S DGNAMES(DGCNT)=$$EXTERNAL^DILFD(26.112,.01,"F",DGIEN)
 S DGNAMES(DGCNT+1)=""  ;add a blank line
 D EN^DDIOL(.DGNAMES)
 Q
 ;
COS(DGAPRV) ;transform POSTMASTER to CHIEF OF STAFF
 ;This output transform converts the internal field value of .5
 ;(POSTMASTER) to CHIEF OF STAFF.
 ;
 ;  Supported DBIA #10060 - This supported DBIA permits FileMan reads
 ;                          on all fields of the NEW PERSON (#200) file.
 ;
 ;  Input:
 ;    DGAPRV - internal value of PRF ASSIGNMENT HISTORY (#26.14) file
 ;             APPROVED BY (#.05) field
 ;
 ;  Output:
 ;   Function Value - Returns "CHIEF OF STAFF" when input value is .5 or
 ;                    external value from NAME (.01) field of the NEW
 ;                    PERSON (#200) file on success.
 ;                    Returns null ("") on failure.
 ;
 N DGERR
 ;
 Q:(+$G(DGAPRV)'>0) ""
 ;
 Q $S(DGAPRV=.5:"CHIEF OF STAFF",1:$$GET1^DIQ(200,DGAPRV_",",.01,"","","DGERR"))
 ;
TIULIST(DGTIUIEN) ;DD lookup screen for (#26.11) file (#.07) field
 ;Get list of TIU Progress Note Titles for Category II (Local) Flags.
 ;This function will assist the DIC("S") lookup screen of allowable
 ;TIU Progress Note Titles the user can see and select from.
 ;
 ; Supported DBIA:  #4380 - $$CHKDOC^TIUPRF - TIU API's for PRF
 ;                  #4383 - $$FNDTITLE^DGPFAPI1
 ;
 ;  Input:
 ;    DGTIUIEN - [Required] IEN of (#8925.1) entry being screened
 ;
 ;  Output:
 ;    Function Value - Returns 1 on success, 0 on failure
 ;
 N DGPNLIST  ;temporary file name to hold list of titles
 N DGRSLT    ;function return value
 N DGX       ;loop var
 N DGY       ;loop var
 ;
 Q:DGTIUIEN']"" 0
 ;
 S DGRSLT=0
 ;
 ; get list from TIU Progress Note Title API call IA #4380
 S DGPNLIST=$NA(^TMP("DGPNLIST",$J))
 K @DGPNLIST
 ;
 ; only get Category II (Local) TIU PN Titles (pass a 2)
 I $$GETLIST(2,DGPNLIST) D
 . S (DGX,DGY)="" F  S DGX=$O(@DGPNLIST@("CAT II",DGX)) Q:DGX=""  D
 . . S DGY=$G(@DGPNLIST@("CAT II",DGX))
 . . ; Need to setup the current assigned progress note title as a
 . . ;  selectable entry or the ^DIR call won't accept the default
 . . ;   entry when the user hits the retrun key to go to next prompt.
 . . ; Only setup if called by PRF action protocol DGPF EDIT FLAG
 . . I $P($G(XQORNOD(0)),U,3)="Edit Record Flag",+DGY=$P($G(DGPFORIG("TIUTITLE")),U) D  Q
 . . . S @DGPNLIST@(+DGY)=""
 . . Q:'DGY
 . . I '$$FNDTITLE^DGPFAPI1($P(DGY,U,1)) S @DGPNLIST@(+DGY)=""
 ;
 I $D(@DGPNLIST@(DGTIUIEN)) S DGRSLT=1
 K @DGPNLIST
 ;
 Q DGRSLT
 ;
GETLIST(DGCAT,DGLIST) ;Get list of TIU Progress Note Titles
 ; This function is used to retrieve a list of active TIU Progress
 ; Note Titles that can be associated with Category I or Category II
 ; Record Flags.
 ;
 ;  Supported DBIA:  #4380 - $$CHKDOC^TIUPRF - TIU API's for PRF
 ;
 ;  Input: [Required]
 ;     DGCAT - Category of TIU Progress Note Titles to look for
 ;             1:Category I
 ;             2:Category II
 ;             3:Both Category I and II
 ;    DGLIST - Closed root reference array name to return values
 ;
 ;  Output:
 ;    Function Value - returns 1 on success, 0 on failure
 ;          DGLIST() - Closed Root reference name of returned data
 ;
 N DGRSLT  ;function value
 S DGRSLT=0
 ;
 I $G(DGCAT)>0,DGLIST]"",$$GETLIST^TIUPRF(DGCAT,DGLIST) S DGRSLT=1
 ;
 Q DGRSLT
