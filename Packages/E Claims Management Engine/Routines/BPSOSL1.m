BPSOSL1 ;BHAM ISC/FCS/DRS/DLF - log file printing ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
 ; D CLAIMLOG^BPSOS6M - individual claims, as called from user screen
 ; D PRINTLOG^BPSOSBD - DT+.2 - background posting to A/R 
 ; D label^BPSOSBL   - billing log file - ILC interface - n+.2
 ; BPSOSC2, BPSOSC3 - testing and certification
 ; D LOGFILE^BPSOSR1 - DT+.3 - background scanner of ^PSRX(indexes)
 ; D LASTLOG^BPSOSRB - same as in BPSOSRX, below
 ; D LASTLOG^BPSOSRX - DT+.4 - background claims submission 
 ; D LOGFILE^BPSOSR4 - DT+.6 - back billing
 ; D COMMSLOG^BPSOSU6 - dial out's log files - offset .1
 ; (no entry point)  - DT+.5 - winnowing old data
 ; D PRINT^BPSOSUT - the programmer-mode modem tests
 ;
 ;  Two entry points:  PRINTLOG to print the log file, given the #
 ;  And PRINTDAT(type,start,end) prints all log files of the given
 ;    type in the given date range.  It prompts for missing parameters.
 ;    (if start is given and end is missing, it just does start)
 ;
PRINTDAT(TYPE,START,END) ;EP
 I '$D(TYPE) S TYPE=$$GETTYPE Q:'TYPE
 W !
 I $D(START) D
 . I '$D(END) S END=START
 E  D  Q:'START
 . S START=$$GETDATES,END=$P(START,U,2),START=$P(START,U)
 N POP D ^%ZIS Q:$G(POP)
 N FORDATE S FORDATE=START F  D  Q:FORDATE>END
 . N SLOT S SLOT=FORDATE+(TYPE/10)
 . I $$EXISTS^BPSOSL(SLOT) D
 . . D PRINTLOG(SLOT)
 . E  D
 . . W "There is no log file ",SLOT,! H 1
 . S FORDATE=$$TADD^BPSOSUD(FORDATE,1) ; add one day
 D ^%ZISC
 Q
GETDATES() ; return start^end
 N PROMPT1 S PROMPT1="Starting date: "
 N PROMPT2 S PROMPT2="  Ending date: "
 N DEF1,DEF2 S (DEF1,DEF2)=DT
 Q $$DTR^BPSOSU1(PROMPT1,PROMPT2,DEF1,DEF2,"")
GETTYPE() ; return 2 = billing, 3 = background scanner, etc.
 N PROMPT S PROMPT="Which log file? "
 N DEF S DEF=2
 N MODE S MODE="V"
 N MENU S MENU="2:Billing;3:Background scan;4:Claims submitter;5:Winnowing;6:Back billing"
 Q $$SET^BPSOSU3(PROMPT,DEF,1,MODE,MENU)
PRINTLOG(SLOT,START,END)     ; EP 
 I $Y D HDR
 I '$$EXISTS^BPSOSL(SLOT) W "Nothing in SLOT=",SLOT,! Q
 I '$G(START) N START S START=1
 I '$G(END) N END S END=$$PRINTEND^BPSOSL(SLOT)
 N PREVTIME S PREVTIME=""
 N MISS S MISS=0 ; count of missing lines
 N LEN S LEN=$S($G(IOM):IOM,1:80)-10-1
 I '$D(STOP) N STOP S STOP=0
 N LINE F LINE=START:1:END D  Q:STOP
 .I '$D(^BPSECP("LOG",SLOT,LINE)) D  Q
 ..I MISS>3 Q  ; don't bother saying any more
 ..S MISS=MISS+1 W "Missing line ",LINE
 ..I MISS=3 W "; no more missing lines will be reported."
 ..W !
 .N X S X=^BPSECP("LOG",SLOT,LINE) ; =$H seconds^text
 .N % S %=$P(X,U)
 .I %'=PREVTIME S PREVTIME=% D
 ..S %=PREVTIME W $J(%\3600,2),":" S %=%#3600
 ..W $TR($J(%\60,2)," ","0"),":" S %=$J(%#60,2) W $TR(%," ",0)
 .S X=$P(X,U,2,$L(X,U))
 .N I F I=1:LEN:$L(X) D  Q:STOP
 ..I I>1 W ?6,"..."
 ..W ?10,$E(X,I,I+LEN-1),!
 ..D EOP
 Q
EOP ; end of page handling
 ; set STOP if the user wants to get out
 S STOP=$$EOPQ^BPSOSU8(2,,"D HDR^"_$T(+0))
 Q
HDR W @IOF,"Log file #",SLOT,! Q
