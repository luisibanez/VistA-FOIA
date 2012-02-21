BPSOS2A ;BHAM ISC/FCS/DRS/DLF - continuation of BPSOS2 ;06/01/2004   
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
JOBS ; protocol BPS P2 TMIT JOBS
 N WHAT S WHAT="Maximum number of transmitter-receiver jobs: "
 N PMT S PMT=WHAT
 S DEF=$$MAXJOBS^BPSOSQ3
 N OPT,MIN,MAX,DEC S OPT=1,MIN=1,MAX=10,DEC=0
 N ANS S ANS=$$NUMERIC^BPSOSU2(PMT,DEF,OPT,MIN,MAX,DEC)
 I ANS?1N.N D MAXJOBS^BPSOSQ3(ANS)
 S ANS=$$MAXJOBS^BPSOSQ3
 W !,WHAT," = ",ANS,!
 D ANY
 S VALMBCK=""
 Q
WOW ; protocol BPS P2 WINNOW ; Winnow or Erase data or Big erase data
 ; This is going to be put on the manager menu proper, instead.
 ; Re-development is underway in BPSOSK*
 W !,"This option is temporarily disabled.",! D ANY S VALMBCK="R" Q
 ;
 ;Statistics & Misc Options Screen - Zero Stats
 ;
 ;Protocol - BPS P2 ZERO - clearing stats
ZERO N ZTYP,X
 S ZTYP=$$SELZTYP() I ZTYP="^" W !!!,"Nothing changed.",! D ANY
 I ZTYP'="^" D
 .I $$SURE'=1 W !!!,"Nothing changed.",! D ANY Q
 .;
 .;Clear Local Stats
 .I ZTYP=0 D ZLOCAL
 .;
 .;Clear Permanent Stats
 .I ZTYP=1 D ZPERM,FETCHES^BPSOS2(0) ; fetch all these zeroes into BASE(*)
 D UPD^BPSOS2
 S VALMBCK=""
 Q
 ;
 ;Zero Local Statistics
 ;
 ;Reset Base Numbers to Current Numbers
ZLOCAL K BASE M BASE=CURR
 Q
 ;
 ;Zero Permanent Statistics
 ;
ZPERM N FILE S FILE=9002313.58
 L +^BPSECX("S"):300 I '$T W "LOCK failed",! Q
 D
 .N I F I=3,4 D
 . . N N S N=$P(^BPSECX("S",0),U,I)+1
 . . S $P(^BPSECX("S",0),U,I)=N
 . N N S N=$P(^BPSECX("S",0),U,3)
 .M ^BPSECX("S",N)=^BPSECX("S",1)
 .S $P(^BPSECX("S",N,0),U)=N ; fix up the .01 field
 .N DIK,DA S DIK="^BPSECX(""S"",",DA=N D IX^DIK ; trivial indexing
 N FIELD S FIELD=.01
 F  S FIELD=$O(^DD(FILE,FIELD)) Q:'FIELD  D
 .N VALUE
 .I FIELD=2 D  ; date/time last cleared
 ..N %,%H,%I,X D NOW^%DTC S VALUE=%
 .E  S VALUE=0
 .N DIE,DA,DR S DIE=FILE,DA=1,DR=FIELD_"////"_VALUE D ^DIE
 L -^BPSECX("S")
 Q
TMR ; Protocol BPS P2 TRANSMITTER ; Transmitter on/off
 N CURR S CURR=$$SHUTDOWN^BPSOSQ3 ; currently, the shutdown flag is:
 D TMNOW
 N PMT,DEF,OPT,ANS S PMT="Do you wish to "_$S(CURR:"en",1:"dis")
 S PMT=PMT_"able the transmitter-receiver"
 S DEF="N"
 S OPT=1
 S ANS=$$YESNO^BPSOSU3(PMT,DEF,OPT)
 I ANS=1 I $$SHUTDOWN^BPSOSQ3('CURR)
 S CURR=$$SHUTDOWN^BPSOSQ3
 D TMNOW,ANY
 S VALMBCK=""
 Q
TMNOW W !,"The transmitter-receiver is currently "
 W $S(CURR:"dis",1:"en"),"abled.",! Q
POK ; protocol BPS P2 POKE ; Poke the queues
 W !,"Poke the queues? " I $$SURE=1 D POKE^BPSOS2D
 S VALMBCK=""
 Q
 ;
 ;Prompt whether to delete (refresh) local or permanent copy
 ;
 ; Returns -> 0 = Local Copy
 ;            1 = Permanent Copy
 ;            ^ Quit
 ;            
SELZTYP() N DIR,DIRUT,DTOUT,DUOUT,X,Y
 S DFLT="Local Copy"
 S DIR(0)="S^L:Local Copy;P:Permanent Copy",DIR("A")="Delete (L)ocal Copy or (P)ermanent Copy of the statistics",DIR("B")=DFLT
 D ^DIR
 I ($G(DUOUT)=1)!($G(DTOUT)=1) S Y="^"
 S Y=$S(Y="P":1,Y="L":0,1:Y)
 Q Y
 ;
SURE(DEF) N SURE,PMT,OPT,ANS
 S PMT="Are you sure"
 I '$D(DEF) S DEF="N"
 S OPT=1 ; answer is optional
 S ANS=$$YESNO^BPSOSU3(PMT,DEF,OPT)
 Q ANS ; 1 or 0 or -1 or ^ or ^^ or null
ANY ;EP - from BPSOS6D,BPSOS6K
 W:$X ! D PRESSANY^BPSOSU5() Q  ; Press any key
