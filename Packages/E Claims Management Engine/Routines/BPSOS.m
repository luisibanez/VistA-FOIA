BPSOS ;BHAM ISC/FCS/DRS - Table of Contents, etc ;06/01/2004        
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 D EN^BPSOS6A() Q  ; convenient shortcut for programmer mode
VERSION() ;EP
 Q $P($T(+2),";",3)
VARIANT() ;EP
 Q "Base level 1"
TOC N I,X F I=0:1 S X=$P($T(TOC1+I),";",2,9) Q:X="*"  D
 . W X,!
 Q
TOC1 ; Directory of BPSOS*
 ; BPSECA* - Build/Parse formatted claim/response packets
 ; BPSECFM - Formatting (signed numeric overpunch, RJZF, LJBF, etc.)
 ; BPSECP* - Receipts
 ; BPSECR* - Development - print NCPDP formats - 9002313.91,9002313.92
 ; BPSECX* - Low-level 9002313.02 routines, descendant from BPSOSQ2
 ; BPSECZ* - ILC A/R claims inquiry routines
 ;            (want to decouple from billing system)
 ; BPSER*  - Obsolete Reports - to be phased out
 ; BPSES*  - ILC A/R selection utilities
 ; BPSMHDR - Menu header
 ; BPSOS0* - Some fetch utilities for 9002313.02, 9002313.03
 ; BPSOS1* - none
 ; BPSOS2# - Insurance auto-selection
 ; BPSOS2,2x - Manager's Stats & misc. options ScreenMan
 ; BPSOS3* - The survey routines - probes of VISTA insurance data, etc.
 ; BPSOS4* - none
 ; BPSOS5* - none
 ; BPSOS6* - User's data entry ScreenMan
 ; BPSOS7* - none
 ; BPSOS8* - none 
 ; BPSOS9  - NDC number utilities
 ; BPSOS9* - none
 ; BPSOSA* - Modem handling, low-level communications routines
 ; BPSOSB* - A/R interfaces - post charges to A/R
 ; BPSOSC# - Certification utilities (sporadic development use only)
 ; BPSOSCx - Building 9002313.02 claim (BPSOSQ2->QG->CA->C*)
 ; BPSOSD* - none
 ; BPSOSE* - none
 ; BPSOSF* - new NCPDP forms (in development for future release)
 ; BPSOSG* - none
 ; BPSOSH* - none
 ; BPSOSI* - Data Entry / ScreenMan interface
 ; BPSOSJ* - none
 ; BPSOSK* - Winnowing old data
 ; BPSOSL* - Log file utilities
 ; BPSOSM* - Report Master file 9002313.61 / Inquire/Report 9002313.57
 ;            (note: BPSOSMA-BPSOSMZ are in development for future)
 ; BPSOSN* - ILC A/R Billing Interface - NCPDP Paper forms print
 ; BPSOSO* - Data Entry - Override NCPDP Data Dictionary values
 ; BPSOSP* - ILC A/R Billing Interface - EOB to Payment batches
 ; BPSOSQ* - Claim processing through the queues
 ; BPSOSR* - Callable entry points from VISTA Pharm; and
 ;            Background Silent Claim Submitter (monitors ^PSRX indexes)
 ; BPSOSS* - Setup POS
 ; BPSOST* - None (some name conflicts in ILC A/R V1 and V2)
 ; BPSOSU* - Utilities; some from ABSUD0xx series in ILC A/R V1
 ; BPSOSV* - None
 ; BPSOSW* - None
 ; BPSOSX* - Utilties for support usage
 ; BPSOSY* - None
 ; BPSOSZ* - Special for upgrades, installations
 ;   Generally, only BPSOSZ is distributed.
 ;   BPSOSZ_ are not distributed, and are marked DELETE AT SITE.
 ;*
RXDEL(RXI,RXR) ; EP - $$ is RX deleted?
 ; For refills:  if the refill multiple is gone, it's been "deleted"
 I $G(RXR) Q '$D(^PSRX(RXI,1,RXR,0))
 ; For first fill: look at the STATUS flag
 I '$D(^PSRX(RXI,0)) Q 1 ; shouldn't be missing, but it is
 N X S X=$P(^PSRX(RXI,0),U,15)
 Q X=13 ; if status is DELETED
ZWRITE(%,VARA,VARB,VARC,VARD,VARE)          ;EP - from many, many places
 I %="%"!(%?1"VAR"1U) D  Q
 . D IMPOSS^BPSOSUE("P","TI","Conflict in var names",%,"ZWRITE",$T(+0))
 I '$D(@%) W %," is undefined",! Q
 I $D(@%)#10 W %,"=",@%,!
 F  S %=$Q(@%) Q:%=""  W %,"=",@%,!
 I $D(VARA) D ZWRITE(VARA)
 I $D(VARB) D ZWRITE(VARB)
 I $D(VARC) D ZWRITE(VARC)
 I $D(VARD) D ZWRITE(VARD)
 I $D(VARE) D ZWRITE(VARE)
 Q
ZE() ;EP - return value of $ZERROR
 D ^ZTER
 Q $ECODE
NOW() ;EP -
 N %,%H,%I,X D NOW^%DTC Q %
NOWEXT() ;EP -
 N %H,%,Y,X S %H=$H D YX^%DTC Q Y
