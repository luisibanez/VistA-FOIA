BPSOSIZ ;BHAM ISC/FCS/DRS/DLF - Filing with .51,.59 ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
LOCK() L +^TMP($J,"BPSOSIZ"):300 Q $T
UNLOCK L -^TMP($J,"BPSOSIZ") Q
LOCK59() L +^BPST:300 Q $T
UNLOCK59 L -^BPST Q
FILE(IEN,ECHO) ;EP - from BPSOSI, BPSOSIV
 ; <PF1> E was hit - so we make these claims official
 ; ^BPS(9002313.51,IEN,...) -> 9002313.59 or wherever
 I '$D(ECHO) S ECHO=1
 N ENTRY S ENTRY=0
 N BPSOSQ1 S BPSOSQ1=0 ; set to nonzero if you need background job
 D DELEMPTY ; delete empty entries from the multiple
 I '$P($G(^BPS(9002313.51,IEN,2,0)),U,4) D  G FZ
 . I ECHO W "Nothing entered..."
 I ECHO W "Submitting claims...",!
 ; Because of the way that BPS DATA INPUT is setup, there will only 
 ;   be one entry in the LINE ITEMS multiple.  If there was ever more than one,
 ;   the entire filing code will need to be rewritten to properly doing locking,
 ;   resetting, and initializing of the BPS Transactions.
 ;
 ; Accordingly, the only way to get DUR to work with the current structure without
 ;   re-writing this now is to set the DUR multiple into BPS Transaction for each
 ;   insurance record.
 ;
  F  S ENTRY=$O(^BPS(9002313.51,IEN,2,ENTRY)) Q:'ENTRY  D
 . I ECHO D QUICK51(IEN,ENTRY)
 . F  Q:$$LOCK  Q:'$$IMPOSS^BPSOSUE("L","RTI","Single-thread filing through BPSOSIZ",,"FILE",$T(+0))
 . D INSUR(IEN,ENTRY,ECHO)
 . D FILE1(IEN,ENTRY,ECHO)
 . D UNLOCK
 ; start background job if necessary
 I BPSOSQ1 D TASK
FZ I ECHO W "...done.",! H 2
 Q
TASK ;EP - from BPSOS2D,BPSOS6D,BPSOSQ1,BPSOSQ4,BPSOSU
 N BPSQQQT
 S BPSQQQT=0
 D
 . N CHECK
 . S CHECK=$G(^BPSECP("CHECKTIM"))  ;last submittal time
 . S:$$FMDIFF^XLFDT($$NOW^XLFDT,CHECK,2)'>2 BPSQQQT=1
 Q:BPSQQQT
 S ^BPSECP("CHECKTIM")=$$NOW^XLFDT
 ;
 ;IHS/SD/lwj 11/03/02  end changes
 ;
 N X,Y,%DT
 S X="N",%DT="ST" D ^%DT
 D TASKAT(Y)
 Q
TASKAT(ZTDTH)         ;EP - from above and from BPSOSQS
 N ZTRTN,ZTIO
 S ZTRTN="LOOP^BPSOSQ1",ZTIO=""
 D ^%ZTLOAD
 Q
DELEMPTY ; the multiple probably has some empty entries - delete them
 ; IEN is inherited from caller
 N FDA,MSG,FN,ENTRY S FN=9002313.512,ENTRY=0
 F  S ENTRY=$O(^BPS(9002313.51,IEN,2,ENTRY)) Q:'ENTRY  D
 . N X,Y S X=^BPS(9002313.51,IEN,2,ENTRY,0),Y=$G(^(1))
 . I X?1N.N."^",Y?."^" D  ; see Note 1, below
 . . S FDA(FN,ENTRY_","_IEN_",",.01)=""
 Q:'$D(FDA)  ; nothing to delete
D5 D FILE^DIE("","FDA","MSG")
 Q:'$D(MSG)  ; success
 D ZWRITE^BPSOS("FDA","MSG")
 G D5:$$IMPOSS^BPSOSUE("FM","TRI","FILE^DIE failed",,"DELEMPTY",$T(+0))
 Q
 ; Note 1.  In DELEMPTY, the test for an empty node:
 ;  piece 1 is the entry number, uneditable, ?1N.N
 ;  pieces 2ff may be present but null - apparently, just visiting
 ;   a field (e.g., pressing down arrow from NDC number)
 ; And also need to test for no fields in the ^(1) node ; 09/21/2000
 ;   could lead to filling in some empty values)
INSUR(IEN,ENTRY,ECHO)        ; ^BPS(9002313.51,IEN,2,ENTRY,"I",*)
 ; need to move it into ^BPS(9002313.51,IEN,2,ENTRY,6)=PINS data
 ; and ^BPS(9002313.51,IEN,2,ENTRY,7)=insurer IENs
 N N S N=0 F  S N=$O(^BPS(9002313.51,IEN,2,ENTRY,"I",N)) Q:'N  D
 . N X S X=^BPS(9002313.51,IEN,2,ENTRY,"I",N,0)
 . I $P(X,U,2) D  ; ORDER is given
 . . N ORDER S ORDER=$P(X,U,2)
 . . S $P(^BPS(9002313.51,IEN,2,ENTRY,6),U,ORDER)=$P(X,U,4) ; PINS
 . . S $P(^BPS(9002313.51,IEN,2,ENTRY,7),U,ORDER)=$P(X,U,3) ;ins ien
 ; Delete the entire INS SEL SCRATCH field - it's no longer needed
 K ^BPS(9002313.51,IEN,2,ENTRY,"I")
 Q
FILE1(IEN,ENTRY,ECHO)   ; ^BPS(9002313.51,IEN,2,ENTRY,...)
 N INPUT M INPUT=^BPS(9002313.51,IEN,2,ENTRY) ; convenience
 N ORIGIN S ORIGIN=$P(^BPS(9002313.51,IEN,0),U,3)
 N X S X=$P(INPUT(0),U,2)
 D REMAP
 D FILERX
 Q
REMAP ; do any needed adjusing of INPUT(*) to handle postage, supplies, etc.
 Q
ISRX() ; return pointer to ^PSRX if true, else return ""
 N X S X=$P(INPUT(1),U) I 'X Q ""
 I $P(INPUT(0),U,3)?1"POSTAGE".E Q ""
 Q X
ISPOST() ; return pointer to ^PSRX if true, else return ""
 N X S X=$P(INPUT(1),U) I 'X Q ""
 I $P(INPUT(0),U,3)?1"POSTAGE".E Q X
 Q ""
ISVISIT() ; return pointer to visit if true, else return ""
 ; (this is for non-prescription items)
 N X S X=$P(INPUT(1),U) I X Q "" ; has ^PSRX pointer, so ret false
 Q $P(INPUT(1),U,6)
FILERX ; EVERYTHING is filed here: postage, supplies, as well as RX's
 ;
 ;  If it's being actively processed now, do not allow it to be
 ;  submitted again here.
 ;
 N DEBUG S DEBUG=0
 N IEN59 S IEN59=$$IEN59^BPSOSIY
RXA I $$ACTIVE59(IEN59) Q:'$$ACTIVEWT^BPSOSIY(IEN59,IEN,ENTRY)  D  G RXA
 . D UNLOCK H 30
 . F  Q:$$LOCK  Q:'$$IMPOSS^BPSOSUE("L","RTI","LOCK transaction record for IEN59="_IEN59,,"RXA",$T(+0))
 N X
 ;
 ;  If it's been submitted in the past, 
 ;    mention that fact and look at what happened to it.
 ;  case 1:   Payable    or   Duplicate of a paid claim   or  Paper
 ;     Invite a reversal
 ;
 ;   NOTE  for the indefinite interim:
 ;       We don't yet have it set up to invite an easy reversal here.
 ;       We are letting paper claims go through and be resubmitted.
 ;
 ;  case 2:   Not paid
 ;     Allow it to be submitted again here.
 ;
 S X=$$RXPAID^BPSOSIY(IEN,ENTRY) I X D  I X=1!(X=3) Q
 . I X=1!(X=3) D
 .. D LOG59^BPSOSL($T(+0)_" - Skipping: RXPAID^BPSOSIY returned "_X,IEN59)
 .. N A,B
 .. S A=$$RXI^BPSOSIY(IEN,ENTRY)
 .. I A S B=$$RXR^BPSOSIY(IEN,ENTRY) I B]"" K ^XTMP("BPSOSRX",A,B)
 . I '$G(ECHO) Q  ; not interactive, so just skip it
 . W ?5,"This claim has already been submitted.",!
 . I X=1!(X=3) D
 . . W ?5,"It was an electronic claim and it was "
 . . W $S(X=1:"paid",X=3:"captured."),!
 . I X=2 D
 . . W ?5,"It was flagged to be sent on a paper claim.",!
 . . W ?5,"It will be processed again, as if it had been reversed.",!
 . I X=1 D
 . . W ?5,"You must first reverse the original claim,",!
 . . W ?5,"and then resubmit it.  RES will do it all for you.",!
 . D PRESSANY^BPSOSU5() ; $$WANTREV^BPSOSIY not yet implemented
 ;
 ; Not active, not submitted in the past - SUBMIT IT NOW
 ; Create a .59 entry, fill in the pieces
 ;
L59A I '$$LOCK59 G L59A:$$IMPOSS^BPSOSUE("L","RTI","LOCK transaction for IEN59="_IEN59,,"L59A",$T(+0))
 I $$EXIST59(IEN59) D
 . D CLEAR59(IEN59)
 E  D
L59N . I $$NEW59(IEN59)'=IEN59 G L59N:$$IMPOSS^BPSOSUE("FM,DB,P","RTI","init new transaction record for IEN59="_IEN59,,"L59N",$T(+0))
 I $$SETUP59^BPSOSIY(IEN,IEN59,ORIGIN) S BPSOSQ1=BPSOSQ1+1
 D UNLOCK59
 Q
EXIST59(N)         ;
 N X
 S X=$$FIND1^DIC(9002313.59,,"QX","`"_N)
 Q $S(X>0:X,X=0:0)
NEW59(N) ; send N = desired IEN in file 9002313.59
 N FLAGS,FDA,IEN,MSG,X,FN
 S FLAGS="" ; internal values
 N X S X="+1,"
 S FN=9002313.59
 S (IEN(1),FDA(FN,X,.01))=N
 D UPDATE^DIE(FLAGS,"FDA","IEN","MSG")
 I $D(MSG) Q 0
 Q IEN(1)
CLEAR59(N)         ;
 ; Deletes all values except for fields:
 ;   Entry # (.01)
 ;   Resubmit after reversal (1.12)
 ;   Result Text (202)
 ;   Comments (111 multiple)
 ; If reverse/resubmit), then also do not clear fields:
 ;   Status (1)
 ;   Last Update (7)
 ;   Start Date (15)
 N FN,X,FLAGS,FDA,MSG,FIELD,SKIP
 S FN=9002313.59,X=N_",",FLAGS=""
 S SKIP(1.12)="",SKIP(202)=""
 I $G(MOREDATA("REVERSE THEN RESUBMIT"))=1 S SKIP(1)="",SKIP(7)="",SKIP(15)=""
 S FIELD=.01 ; $O will skip past this field
 F  S FIELD=$O(^DD(FN,FIELD)) Q:'FIELD  I '$D(SKIP(FIELD)) S FDA(FN,X,FIELD)=""
 ; Delete Insurance multiple
 S FN=9002313.59902,ENTRY=0
 F  S ENTRY=$O(^BPST(N,10,ENTRY)) Q:ENTRY="B"!(ENTRY="")  D
 . S FDA(FN,ENTRY_","_N_",",.01)=""
 ; Delete DUR multiple
 S FN=9002313.5913,ENTRY=0
 F  S ENTRY=$O(^BPST(N,13,ENTRY)) Q:+ENTRY=0  D
 . S FDA(FN,ENTRY_","_N_",",.01)=""
 D FILE^DIE(FLAGS,"FDA","MSG")
 D PREVISLY(N) ; for result text field 202
 Q
PREVISLY(IEN59)    ;EP ; Bracket result text with [Previously: ], if not null
 ; Called by REVERSE^BPSOS6D, too
 N X S X=$$GET1^DIQ(9002313.59,IEN59,202)
 Q:X=""
 S X=$E("[Previously: "_X_"]",1,200)
 N FN,FDA,MSG S FDA(9002313.59,IEN59_",",202)=X
PR5 D FILE^DIE("","FDA","MSG") Q:'$D(MSG)
 D ZWRITE^BPSOS("FDA","MSG","IEN59","X")
 G PR5:$$IMPOSS^BPSOSUE("FM","TRI","FILE^DIE failed",,"PREVISLY",$T(+0))
 Q
ACTIVE59(N)        ; is ^BPST(N) active now?
 F  Q:$$LOCK59  Q:'$$IMPOSS^BPSOSUE("L","RTI","LOCK of transaction for IEN59="_IEN59,,"ACTIVE59",$T(+0))
 N Z S Z=$G(^BPST(N,0))
 D UNLOCK59
 I Z="" Q 0 ; easy - there's no such record
 I $P(Z,U,2)=99 Q 0 ; status = complete
 I $$TIMEDIFI^BPSOSUD($P(Z,U,8),$$NOW)>604800 Q 0  ; Must have been stranded over a week?  Let it through.
 Q 1 ; status not complete
NOW() N %,%H,%I,X D NOW^%DTC Q %
QUICK51(IEN,ENTRY)          ; ^BPS(9002313.51,IEN,2,ENTRY,...)
 N X
 S X=^BPS(9002313.51,IEN,2,ENTRY,0)
 W $P(X,U,4)," ",$P(X,U,2)," ",$P(X,U,5)," ",$P(X,U,7),!
 W !
 Q
