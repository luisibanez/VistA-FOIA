ABSPOSO2 ; IHS/FCS/DRS - NCPDP Override-Fman utils ;  [ 09/03/2002  11:10 AM ]
 ;;1.0;PHARMACY POINT OF SALE;**3,23**;JUN 21, 2001
 Q
 ; EDIT,EDITGEN are called from the menus in ABSPOSO1,
 ;   typically reached from the pharmacy package's call
 ;   to OVERRIDE^ABSPOSO
 ; GET511 is called from ABSPOSCD during claim construction
 ;
 ;IHS/SD/lwj 8/01/02  NCPDP 5.1 changes to GET511 subroutine
 ; Routine was changed to look at an exceptions list, if the
 ; field being processed is in the exceptions list it will
 ; create a "claim header" and "claim rx" entry.  The reason
 ; for this is that several 300 range fields were moved to the 
 ; claim rx area within the 5.1 segments creating duplicate flds.
 ; (i.e. the <402 and >402 rule is no longer valid)
 ;
 ; New routine (PRIORA) added to handle the input of the prior
 ; authorization information at prescription creation time.
 ;
 ;IHS/SD/RLT - 06/21/07 - 10/18/07 - Patch 23
 ; Added new tags NEW3 and NEW4 for DIAGNOSIS CODE
 ;
EDIT(IEN,FIELDNUM) ;
 I '$D(FIELDNUM) D EDITGEN(IEN) Q
 ; Editing one field
 N DIE,DA,DR,DIDEL,DTOUT,FIELDNAM
 S DA=$$HASVALUE(IEN,FIELDNUM)
 ; Make sure the entry exists in the subfile.
 ; Create an empty one if necessary.
 I 'DA S DA=$$SETVALUE(IEN,FIELDNUM,"")
 ; edit the value field in the subfile
 S DIE="^ABSP(9002313.511,"_IEN_",1,",DA(1)=IEN
 S DR=.02_$TR($$FIELDNAM(FIELDNUM),""";~","")
 D ^DIE
 ; If the value is null, then delete the entire FIELDNUM entry
 I $$GETVALUE(IEN,FIELDNUM)="" D DELVALUE(IEN,FIELDNUM)
 Q
EDITGEN(IEN)       ; general edit
 ; First pass:  quick & dirty Fileman ^DIE call
 ; Future: Screenman interface
 N DIE,DA,DR,DIDEL,DTOUT
 S DA=IEN,DIE=$$FILENUM,DR=1 D ^DIE
 ; And we need to delete any entries with null values
 N A S A=0 F  S A=$O(^ABSP(9002313.511,IEN,1,A)) Q:'A  D
 . N X S X=^ABSP(9002313.511,IEN,1,A,0)
 . I $P(X,U,2)="" D
 . . N FIELDNUM S FIELDNUM=$P(^ABSPF(9002313.91,$P(X,U),0),U)
 . . D DELVALUE(IEN,FIELDNUM)
 Q
GET511(IEN,ARR101,ARR402) ;EP - from ABSPOSCD - load arrays with data from IEN
 ; IHS/SD/lwj 8/1/02 altered for NCPDP 5.1 - must store some 
 ; 300 range fields at the "header" and "detail" level due to 
 ; restructing of 5.1 claim segments
 ;
 N A,C S A=0,C=0
 N EXPTLST,TFLD                ;IHS/SD/lwj 8/1/02
 ;
 S EXPTLST=",308,315,316,317,318,319,320,327,"  ;IHS/SD/lwj 8/1/02
 ;
 F  S A=$O(^ABSP(9002313.511,IEN,1,A)) Q:'A  D
 . N X S X=^ABSP(9002313.511,IEN,1,A,0)
 . N F S F=$P(X,U) ; field IEN, points to 9002313.91
 . ; store in either claim header or claim detail, based on field #
 . I $$FIELDNUM(F)<402 S @ARR101@(F)=$P(X,U,2)
 . E  S @ARR402@(F)=$P(X,U,2)
 . ;
 . ; IHS/SD/lwj 8/1/02  nxt 2 lns added to check for exception flds
 . S TFLD=","_$$FIELDNUM(F)_","
 . I EXPTLST[TFLD S @ARR402@(F)=$P(X,U,2)
 . ;
 . S C=C+1
 Q:$Q C Q
 ; 
 ; Generalized utilities - good for everything, not just auth #
LOCK() L +^ABSP(9002313.511,IEN):300 Q $T
UNLOCK L -^ABSP(9002313.511,IEN) Q
FILENUM()          Q 9002313.511
SUBFNUM()          Q 9002313.5111
FLOCK() L +^ABSP(9002313.511):300 Q $T
FUNLOCK L -^ABSP(9002313.511) Q
FIELDIEN(FIELDNUM) ; ien of a 9002313.91 NCPDP Data Dictionary field
 Q $$FIND1^DIC(9002313.91,,,FIELDNUM)
FIELDNAM(FIELDNUM) ; name of a 9002313.91 NCPDP Data Dictionary field
 Q $$GET1^DIQ(9002313.91,$$FIELDIEN(FIELDNUM),.03)
 ; given pointer to NCPDP Data Dictionary fields, return external #
FIELDNUM(IEN91)    Q $P($G(^ABSPF(9002313.91,IEN91,0)),U)
NEW() ;EP -  create new entry in 9002313.511
 F  Q:$$FLOCK  Q:'$$IMPOSS^ABSPOSUE("L","RTI","interlock on new Override record creation",,"NEW",$T(+0))
 N FLAGS,FDA,IEN,MSG,FN,X,NEWREC S FN=$$FILENUM
 D NEW1
 D FUNLOCK
 Q NEWREC
NEW1 ;EP  (from ABSPOSD2 and ABSPOSD3)
 S FDA(FN,"+1,",.01)=$O(^ABSP(FN,"B",999999999999),-1)+1
 D UPDATE^DIE(,"FDA","IEN","MSG")
 I $D(MSG) D  G NEW1:$$IMPOSS^ABSPOSUE("FM","TRI","UPDATE^DIE failed",,"NEW1",$T(+0))
 . D ZWRITE^ABSPOS("FDA","IEN","MSG")
 . K MSG
 S NEWREC=IEN(1)
NEW2 ;
 S FDA(FN,NEWREC_",",.02)="NOW"
 D FILE^DIE("E","FDA","MSG")
 ;Q:'$D(MSG)  ; success
 G:$D(MSG) NEW2:$$IMPOSS^ABSPOSUE("FM","TRI","FILE^DIE failed",,"NEW2",$T(+0))
 Q:FN'=9002313.491      ;quit if not DIAGNOSIS CODE - use for DUR too????
NEW3 ;
 S FDA(FN,NEWREC_",",.03)=RXI
 D FILE^DIE(,"FDA","MSG")
 G:$D(MSG) NEW3:$$IMPOSS^ABSPOSUE("FM","TRI","FILE^DIE failed",,"NEW3",$T(+0))
NEW4 ;
 S FDA(FN,NEWREC_",",.04)=RXR
 D FILE^DIE(,"FDA","MSG")
 G:$D(MSG) NEW4:$$IMPOSS^ABSPOSUE("FM","TRI","FILE^DIE failed",,"NEW4",$T(+0))
 ;
 Q
HASVALUE(IEN,FIELDNUM)       ; does the FIELDNUM have an override value?
 ; returns IEN into the subfile
 Q $$FIND1^DIC($$SUBFNUM,","_IEN_",",,FIELDNUM)
GETVALUE(IEN,FIELDNUM) ; return currently-set override value for given FIELDNUM
 N X S X=$$HASVALUE(IEN,FIELDNUM) I 'X Q ""
 Q $$GET1^DIQ($$SUBFNUM,X_","_IEN_",",.02)
SETVALUE(IEN,FIELDNUM,VALUE) ;
 ; can DO or $$; $$ = ien in subfile for this FIELDNUM
 ; Special case for the override file:  if you're trying to set the
 ; field's value to "@", don't just delete the field value,
 ; which would leave the field defined with a null value.
 ; Instead, delete the entire override for the field.
 ; This prevents accidentally overriding a genuine value with null.
 I "@"=VALUE D DELVALUE(IEN,FIELDNUM) Q:$Q "" Q
 ; But the usual case is just storing a value:
 N FDA,MSG,IENS,IENARRAY
 ; Note:  I tried the "+?1,ien," method but it always created a new
 ; entry, even when it meant creating duplicates.  So now we test to
 ; see if there's already an entry for the fieldnum, and if not,
 ; then we put in a "+1,"
 N ENTRY S ENTRY=$$HASVALUE(IEN,FIELDNUM) ; do we already have FIELDNUM
 I 'ENTRY S ENTRY="+1" ; if not, then create a new entry
 S IENS=ENTRY_","_IEN_","
 S FDA($$SUBFNUM,IENS,.01)=FIELDNUM
 S FDA($$SUBFNUM,IENS,.02)=VALUE
 D SETV1
 I ENTRY="+1" S ENTRY=$G(IENARRAY(1))
 Q:$Q ENTRY Q
SETV1 ;
 D UPDATE^DIE("E","FDA","IENARRAY","MSG")
 Q:'$D(MSG)  ; success
 K ^TMP("ABSP",$J,"ABSPOSO2",$J,"SETVALUE")
 S ^TMP("ABSP",$J,"ABSPOSO2",$J,"SETVALUE")=$$ERRHDR
 M ^TMP("ABSP",$J,"ABSPOSO2",$J,"SETVALUE","MSG")=MSG
 I $D(IENARRAY) M ^TMP("ABSP",$J,"ABSPOSO2",$J,"SETVALUE","IENARRAY")=IENARRAY
 D ZWRITE^ABSPOS("FDA","IENARRAY","MSG")
 G SETV1:$$IMPOSS^ABSPOSUE("FM","TRI",,,"SETVALUE",$T(+0))
 Q
DELVALUE(IEN,FIELDNUM)       ;
 N ENTRY S ENTRY=$$HASVALUE(IEN,FIELDNUM) Q:'ENTRY  ; wasn't defined
 N FDA,MSG
 S FDA($$SUBFNUM,ENTRY_","_IEN_",",.01)="@"
DE5 D FILE^DIE("E","FDA","MSG")
 Q:'$D(MSG)  ; success
 K ^TMP("ABSP",$J,"ABSPOSO2",$J,"DELVALUE")
 S ^TMP("ABSP",$J,"ABSPOSO2",$J,"DELVALUE")=$$ERRHDR
 D ZWRITE^ABSPOS("IEN","FDA","MSG")
 G DE5:$$IMPOSS^ABSPOSUE("FM","TRI",,,"DELVALUE",$T(+0))
 Q
ERRHDR() Q "ERROR AT $H="_$H_" FOR $J="_$J
SEE(IEN) N TMP M TMP=^ABSP($$FILENUM,IEN) D ZWRITE^ABSPOS("TMP") Q  ; debugging
 ;
PRIORA(IEN) ;IHS/SD/lwj 9/3/02 NCPDP 5.1 Changes - Prior Authorization 
 ; We are still processing 5.1 and 3.2 claims, so we have to be able
 ; to populate fields 461, 462 and 416.  416 will be created based
 ; on the input into fields 461, and 462.
 ;
 N FIELDNUM
 ;
 S FIELDNUM=461              ;Prior authorization type code
 D EDIT(IEN,FIELDNUM)
 ;
 S FIELDNUM=462              ;Prior authorization number submitted
 D EDIT(IEN,FIELDNUM)
 ;
 ;now we combine field 461 and 462 to creat field 416
 ;
 N VAL461,VAL462,VAL416,DA
 S (VAL461,VAL462,VAL416)=""
 ;
 S VAL461=$$GETVALUE(IEN,461)
 S VAL462=$$GETVALUE(IEN,462)
 S VAL416=VAL461_VAL462
 Q:VAL416=""
 ;
 S DA=$$SETVALUE(IEN,416,"")
 S:$G(DA)'="" DA=$$SETVALUE(IEN,416,VAL416)
 ;
 ;
 Q
