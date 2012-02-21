BPSOSL ;BHAM ISC/FCS/DRS/DLF - logging ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
 ; Lots of entry points called from lots of places.
 ; 
 ; The job that reads the prescription does this:
 ; DO INIT^BPSOSL(ABSBRXI,NODELETE) to init a new session
 ;       It will also DO SETSLOT() for you and timestamp.
 ;       NODELETE true will keep anything already there,
 ;       otherwise, any previous data is deleted.
 ; DO LOG^BPSOSL(text) to log an event
 ; DO RELSLOT^BPSOSL to release the slot
 ;
 ; The job(s) that build the packet and handle the communications
 ; should do the following to stuff info into a prescription's log:
 ; DO SETSLOT^BPSOSL(prescription ien)
 ; DO LOG^BPSOSL(text) to log an event
 ; DO RELSLOT^BPSOSL to release the slot
 ;
 ; DO LOG2LIST^BPSOSL(text) to log to all IEN59 in RXILIST(IEN59)
 ; DO LOG2CLM^BPSOSL(text,IEN02) to log all IEN59 represented
 ;    in ^BPSC(IEN02, claim
 ; DO LOG59(text,IEN59) to log to IEN59 (does SETSLOT/RELSLOT for you)
 ; DO LOGARRTO(root,slot) to log an entire array to IEN59
 ;
 ; DO FINDPREV(type[,start]) to find most recent slot of given n.type
 ;  (type is the decimal suffix)  start = optional start at this #
 ;
 ; Communications jobs - to not interfere with prescription numbers,
 ; add an extra .1 onto the index.
 ;  DO INIT^BPSOSL(.1)
 ; Processing responses (BPSOSQ4) - tacks on .11
 ; Billing jobs - add an extra .2 onto the index - (DT+.2)
 ; Silent submitter (BPSOSR1) - add .3 - (these will be DT+.3)
 ; Calls to ABSOPSRX - add .4 - (these will be DT+.4)
 ; Winnowing - BPSOSK - add .5 - (these will be DT+.5)
 ; Back billing - add .6 (these will be DT+.6)
 ;
 ; The job(s) that handle the response should 
 ; DO SETSLOT^BPSOSL(prescription ien)
 ; DO LOG^BPSOSL(text) to log an event
 ; DO DONE^BPSOSL to close a session
 ;       It will also do RELSLOT for you.
 ;
 ;
 ; Other functions:
 ; $$GETSLOT returns the slot # currently in use (as when you wish to
 ;   use a different one and stack this one for later reuse)
 ; $$GETINDEX returns the position of the logging (a subscript,
 ;   a copy of ^BPSECP("LOG",slot #,0))
 ; $$GETINDEX(SLOT)  gets it for some other given slot, not your own
 ; $$GETPLACE returns $$GETSLOT_","_$$GETINDEX
 ; $$EXISTS(SLOT)   does this slot # exist?
 ;
 ;
 ; PRINTLOG(SLOT) to print the log of entire session from SLOT
 ; PRCLLOG("slot,line",claim#) to print the transmissions log
 ;   excerpt relevant to claim#
 ;
 ; ^BPSECP("LOG","LAST SLOT")=last # assigned ; obsolete
 ; ^BPSECP("LOG","JOB",j)=# ; given $J, what's the log #
 ; ^BPSECP("LOG",#)=time assigned^job number^time done
 ; ^BPSECP("LOG",#,0)=last n assigned
 ; ^BPSECP("LOG",#,n)=$H secs^event text
 ;
 ;
LOG(TEXT,ECHO,SPECIAL) ;EP - log the event given by TEXT
 ; SPECIAL="D" to prefix with printable date, T time, DT both
 N H S H=$H
 I $D(TEXT("IEN")) S ^BPSECP("LOG","JOB",$J)=TEXT("IEN")
 N SLOT S SLOT=$G(^BPSECP("LOG","JOB",$J)) Q:'SLOT
 N N S N=$G(^BPSECP("LOG",SLOT,0))+1,^(0)=N
 I $G(SPECIAL)]"",SPECIAL["D"!(SPECIAL["T") D
 . N %,%H,%I,X,Y D NOW^%DTC S Y=% X ^DD("DD")
 . I SPECIAL'["D" S Y=$P(Y,"@",2)
 . I  I SPECIAL'["T" S Y=$P(Y,"@")
 . S TEXT=Y_" "_TEXT
 S ^BPSECP("LOG",SLOT,N)=$P(H,",",2)_"^"_$E(TEXT,1,200)
 N VARX
 S VARX=0 I '$P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) S VARX=1
 I 'VARX,$G(ECHO) D
 .N IO S IO=$I
 .U $P W:$X>0 ! W TEXT,!
 .U IO
 I $G(SPECIAL)=9999 S $P(^BPSECP("LOG",SLOT),"^",3)=H
 Q
INIT(SLOTNUM,NODELETE,TMSTAMP) ;EP - very first caller does this:
 ; TMSTAMP undef or 1 -> you'll get a one-line time stamp
 ; TMSTAMP = 0 -> you won't get it.
 ; TMSTAMP = -1 -> timestamp only if brand new log file
 I '$G(^BPSECP("LOG","LAST SLOT")) D
 . N X S X=$O(^BPSECP("LOG",999999999999),-1) S:'X X=99
 . S ^BPSECP("LOG","LAST SLOT")=X\1
 F  L +^BPSECP("LOG"):300 Q:$T  Q:'$$IMPOSS^BPSOSUE("L","RTI","interlock on obtaining new log file slot",,"INIT",$T(+0))
 N SLOT
 I $G(SLOTNUM)'<1 D  ; if a specific slot number was specified:
 . S SLOT=SLOTNUM
 E  D  ; SLOTNUM<1, a differential to add
 . I '$D(SLOTNUM) S SLOTNUM=0
 . S SLOT=^BPSECP("LOG","LAST SLOT")+1+SLOTNUM ; add in the differential
 . ; check:  slot doesn't exist
 . N STOP S STOP=0
 . F  D  Q:STOP  S SLOT=SLOT+1
 . . ; want: nothing in this SLOT\1 range
 . . I $D(^BPSECP("LOG",SLOT\1)) Q  ; no, ^BPSECP("LOG",xxx) defined
 . . I $O(^BPSECP("LOG",SLOT\1))\1=(SLOT\1) Q  ; no,^BPSECP("LOG",xxx.yy) defined
 . . S STOP=1
 . S ^BPSECP("LOG","LAST SLOT")=SLOT\1
 D SETSLOT(SLOT)
 I '$G(NODELETE) K ^BPSECP("LOG",SLOT)
 I '$G(NODELETE)!('$D(^BPSECP("LOG",SLOT,0))) S ^BPSECP("LOG",SLOT,0)=0
 I $G(TMSTAMP)=-1 D  ; we want a time stamp only if it's brand new file
 . S TMSTAMP='$D(^BPSECP("LOG",SLOT,1))
 I $G(TMSTAMP)'=0 D  ; only skip if TMSTAMP is explicitly 0
 . N %,%H,%I,X D NOW^%DTC S Y=% X ^DD("DD") D LOG("Log Time Stamp "_Y_" "_%H_" "_%_" "_SLOT)
 L -^BPSECP("LOG")
 Q
SETSLOT(SLOT) ;EP -
 S ^BPSECP("LOG","JOB",$J)=SLOT
 I SLOT S ^BPSECP("LOG",SLOT)=$H_"^"_$J
 Q
RELSLOT ; EP  -
 N SLOT S SLOT=$G(^BPSECP("LOG","JOB",$J))
 I SLOT S $P(^BPSECP("LOG","JOB",$J),U,2)="R"
 Q
 ;
GETSLOT() ;EP -
 N X S X=$G(^BPSECP("LOG","JOB",$J)) ; = "" if you had none
 I X?.E1"^R" S X="" ; you (or prev user) had one, but it was released
 Q X
 ;
GETINDEX(SLOT)         Q $G(^BPSECP("LOG",$S($D(SLOT):SLOT,1:$$GETSLOT),0))
 ;
GETPLACE() ;EP -
 Q $$GETSLOT_","_$$GETINDEX
 ;
DONE ;EP -
 D LOG("DONE^BPSOSL",0,9999)
 D RELSLOT
 K ^BPSECP("LOG","JOB",$J)
 Q
PRCLLOG(WHERE,CLAIM) ;EP - print portion of comms log related to given claim
 N SLOT,START,END,END1,X,FOUND
 S SLOT=$P(WHERE,","),START=$P(WHERE,",",2)
 S END=$$PRINTEND(SLOT) I 'END Q
 ; Is the START what we expect?
 ; this must match text at CLAIMBEG, CLAIMEND^BPSOSAM
 S X=$G(^BPSECP("LOG",SLOT,START))
 I $P(X,U,2)'[("CLAIM - BEGIN - #"_CLAIM) D  Q
 .W "Found ",X,!
 .W "  instead of expected beginning of claim ",CLAIM,".",!
 S FOUND=0 ; whether we found the expected end or not
 F END1=START+1:1:END D  Q:FOUND  ; with END1 pointing to the end
 .S X=$G(^BPSECP("LOG",SLOT,END1))
 .I $P(X,U,2)[("CLAIM - END - #"_CLAIM) S FOUND=1
 I 'FOUND D
 .W "Did not find the expected end of claim transmission info.",!
 .W "We will print out some of what is there.",!
 .S END1=START+25 S:END1>END END1=END
 D PRINTLOG(SLOT,START,END1)
 Q
PRINTEND(SLOT) ;EP -find the end of the logging session 
 N END S END=$G(^BPSECP("LOG",SLOT,0))
 I 'END D
 .W "Missing the 0 node that tells us where the end is?",!
 .S END=$O(^BPSECP("LOG",SLOT,""),-1)
 .W "Working backwards, we think the end is at ",END,!
 Q END
PRINTLOG(SLOT,START,END)     ;EP -
 D PRINTLOG^BPSOSL1(SLOT,$G(START),$G(END)) Q
HDIF(THEN,NOW)     Q $P(NOW,",")-$P(THEN,",")*86400+$P(NOW,",",2)-$P(THEN,",",2)
EXISTS(X) ;EP -
 Q $D(^BPSECP("LOG",X))
FINDPREV(TYPE,START) ;
 I '$D(START) D  Q:'START
 . I TYPE>1 S START=TYPE-1,TYPE=TYPE#1 Q
 . S START=+$G(^BPSECP("LOG","LAST SLOT"))+1
 I START#1=0 S START=START+TYPE
 I START#1'=TYPE S START=START\1-1+TYPE
 F  Q:$D(^BPSECP("LOG",START))  S START=START-1 I START<1 S START="" Q
 Q START
 ; These logging utilities originally came from BPSOSQ2
LOG2LIST(MSG) ;EP - write MSG to the log files of all in RXILIST(*)
 N IEN59 S IEN59=0
 F  S IEN59=$O(RXILIST(IEN59)) Q:'IEN59  D
 . D LOG59(MSG,IEN59)
 Q
LOG2CLM(MSG,IEN02) ;EP - write MSG to log file for all claims in this 9002313.02
 N IEN59 S IEN59=0
 F  S IEN59=$O(^BPST("AE",IEN02,IEN59)) Q:'IEN59  D
 . D LOG59(MSG,IEN59)
 Q
LOG59(MSG,IEN59)   ;EP -
 D LOG2SLOT(MSG,IEN59) Q
 ; obsolete:
 D SETSLOT(IEN59)
 D LOG(MSG)
 D RELSLOT
 Q
LOG2SLOT(MSG,SLOT) ;EP -
 N OLDSLOT S OLDSLOT=$$GETSLOT
 D SETSLOT(SLOT)
 D LOG(MSG)
 D RELSLOT
 D SETSLOT(OLDSLOT)
 Q
LOGARRAY(ROOT,SLOT,MAX) ;EP -
 N REF S REF=ROOT
 N COUNT S COUNT=0
 I '$D(MAX) S MAX=100
 I $D(@REF)#10'=1 S REF=$Q(@REF)
 F  Q:REF=""  D  Q:'MAX
 . I $D(SLOT) D
 . . D LOG2SLOT(REF_"="_@REF,SLOT)
 . E  D LOG(REF_"="_@REF)
 . S COUNT=COUNT+1
 . S REF=$Q(@REF)
 . S MAX=MAX-1
 I 'MAX,REF]"" D LOG2SLOT("More of "_ROOT_" to log, but max reached",SLOT)
 I 'COUNT D LOG2SLOT("Nothing found in "_ORIGROOT,SLOT)
 Q
