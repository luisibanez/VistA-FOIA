BPSOSQ2 ;BHAM ISC/FCS/DRS/DLF - form transmission packets ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
PACKETS ; construct packets for transmission to NDC
 N ERROR,SILENT S SILENT=1
 N RXILIST,STATUS30
 D STATUS31^BPSOSQF ; deal with insurer alseep waiting
 F STATUS30=30 I $D(^BPST("AD",STATUS30)) D STATUS30
 ; If there are still any claims with status 30,
 ; perhaps due to failed LOCK59, queue up BPSOSQ2 to run again
 N NEEDQ1 S NEEDQ1=$O(^BPST("AD",30,0))
 I NEEDQ1 H 60 D TASK^BPSOSQ1
 Q
SETSTAT(NEWSTAT) ;EP - BPSOSQF ; given IEN59
 N ABSBRXI S ABSBRXI=IEN59 ; unfortunate variable naming convention
 D SETSTAT^BPSOSU(NEWSTAT)
 Q
SETRESU(RESCODE,TEXT)   ; given IEN59
 N ABSBRXI S ABSBRXI=IEN59 ; unfortunate variable naming convention
 D SETRESU^BPSOSU(RESCODE,TEXT)
 Q
LOCK59() ;EP - BPSOSQF
 L +^BPST("AD",STATUS30):60 Q $T
UNLOCK59 ;EP - BPSOSQF
 L -^BPST("AD",STATUS30) Q
NEXT59(X) ;EP - BPSOSQF
 N INS,T
N59A ;
 ;LJE;6/25/03; If it's a VA prescriptions go to the VAN59A subroutine
 I '$P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) G VAN59A
 S X=$O(^BPST("AD",STATUS30,X))
 I X="" Q X  ; end of list, return ""
 ; but if the insurer is asleep, don't take this one
 S INS=$P(^BPST(X,1),U,6)
 S T=$P($G(^BPSEI(INS,101)),U) ; insurer asleep retry time
 I 'T Q X  ; insurer is not asleep
 ; - below here - insurer is asleep -
 ; If cancellation is requested, let it through, regardless of sleep.
 ; This will speed it on its way to cancellation
 I $G(^BPST(X,3)) Q X
 ; If necessary, update the .59's record of when to retry
 I $P($G(^BPST(X,8)),U)'=T D  ;
 . S $P(^BPST(X,8),U)=T ; stamp with latest retry time
 . N IEN59 S IEN59=X D SETSTAT(31) ; force screen update, too
 . D LOG59^BPSOSQ("Insurer still asleep - retry at "_T,IEN59)
 I T<$$NOW Q X  ; time to retry, so yes, we do this one
 ;. don't clear this - a successful non-sleep response will clear it
 ;. but don't clear the piece 5 current interval, as we may increment
 ; Else still in waiting - if it's status 30, change it to 31
 I STATUS30=30 D
 . N IEN59 S IEN59=X D SETSTAT(31)
 . S $P(^BPST(IEN59,8),U)=$P(^BPSEI(INS,101),U)
 . S $P(^BPST(IEN59,8),U,3)=INS
 G N59A ; still in wait time; don't look at this claim
NOW() N %,%H,%I,X D NOW^%DTC Q %
VAN59A ;lje;6/26/03;VA wait time/insurer asleep
 N PAYSH,PAYSHNM
 S X=$O(^BPST("AD",STATUS30,X))
 I X="" Q X  ; end of list, return ""
 ; but if the insurer is asleep, don't take this one
 S INS=$P(^BPST(X,9),U,1) S:INS="" INS=1,$P(^BPST(X,9),U,1)=INS  ;LJE;8/25/03  ;current insurance
 S PAYSH=$$PAYERSH^BPSOSQF(X)
 S PAYSHNM=$$GET1^DIQ(9002313.92,PAYSH_",",.01,"E")
 S T=$$GET1^DIQ(9002313.92,PAYSH_",",1.12,"I")    ;RETRY TIME
 I 'T Q X  ; insurer is not asleep
 ; - below here - insurer is asleep -
 ; If cancellation is requested, let it through, regardless of sleep.
 ; This will speed it on its way to cancellation
 I $G(^BPST(X,3)) Q X
 ; If necessary, update the .59's record of when to retry
 I $P($G(^BPST(X,8)),U)'=T D  ;
 . S $P(^BPST(X,8),U)=T ; stamp with latest retry time
 . N IEN59 S IEN59=X D SETSTAT(31) ; force screen update, too
 . D LOG59^BPSOSQ($T(+0)_" - Insurer still asleep - retry at "_T_" for "_$G(PAYSHNM),IEN59)
 I T'>$$NOW Q X  ; time to retry, so yes, we do this one
 I STATUS30=30 D
 . N IEN59 S IEN59=X D SETSTAT(31)
 . S $P(^BPST(IEN59,8),U)=$P($G(^BPSF(9002313.92,PAYSH,1)),"^",12)
 . S $P(^BPST(IEN59,8),U,3)=$G(PAYSHNM)
 G VAN59A ; still in wait time; don't look at this claim
 ;
STATUS30 ; given STATUS30=30
 N IEN59 S IEN59=""
 Q:'$$LOCK59
 F  S IEN59=$$NEXT59(IEN59) Q:IEN59=""  D
 . K RXILIST ; init list each time through this loop
 . S RXILIST(IEN59)=""
 . D SETSTAT(40) ; set its status to "packetizing"
 .; Reversals go in a packet alone
 . I $G(^BPST(IEN59,4)) G POINTX
 . G:$$CHKPA2() POINTX
 . I '$P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) I $D(VADIAL) G POINTX:VADIAL="1VA"
 . I '$P($G(^BPS(9002313.99,1,"SITE TYPE")),"^",1) I '$D(VADIAL) G POINTX
 . N RA0,RA1 S RA0=^BPST(IEN59,0),RA1=^(1)
 . N IEN59 S IEN59="" ; preserve the top-level index!
 . F  S IEN59=$$NEXT59(IEN59) Q:'IEN59  D
 . . N RB0,RB1 S RB0=^BPST(IEN59,0),RB1=^(1)
 . . ; Only bundle when you have the same:
 . . ; Patient, Visit, Division, Division Source, Insurer, Pharmacy
 . . I $P(RA0,U,6,7)'=$P(RB0,U,6,7) Q
 . . I $P(RA1,U,4,7)'=$P(RB1,U,4,7) Q
 . . I $P(RB0,U,2)'=30 Q  ; might have been canceled, or maybe 31'd
 . . I $P(RB0,U,2)'=STATUS30 D  Q
 . . . D IMPOSS^BPSOSUE("P","TI","IEN59 status "_$P(RB0,U,2)_" but must be 30",,"STATUS30",$T(+0))
 . . D SETSTAT(40)
 . . S RXILIST(IEN59)=""
POINTX . ; (reversals branch here around multi-claim packeting)
 . S ERROR=$$PACKET^BPSOSQG ; 
 . S IEN59="" F  S IEN59=$O(RXILIST(IEN59)) Q:IEN59=""  D
 . . I ERROR D
 . . . D SETSTAT(99) ; 
 . . . D SETRESU($P(ERROR,U),$P(ERROR,U,2,$L(ERROR,U))) ;
 . . E  D
 . . . D SETSTAT(50) ; "Waiting for transmit"
 D UNLOCK59
 Q
TASK ;EP - BPSOS2D,BPSOSAP,BPSOSC3,BPSOSQG
 N X,Y,%DT
 S X="N",%DT="ST" D ^%DT
 D TASKAT(Y)
 Q
TASKAT(ZTDTH) ;EP - BPSOSQJ
 N ZTRTN,ZTIO,ZTSAVE
 S ZTRTN="COMMS^BPSOSQ3",ZTIO=""
 S ZTSAVE("DIALOUT")="" ; which entry in 9002313.55
 D ^%ZTLOAD
 Q
KSCRATCH ;EP - BPSOSQG ; Kill scratch globals
 K ^BPSECX($J,"R")
 K ^BPSECX($J,"C")
 Q
 ;
CHKPA() ;---------------------------------------------------------------  
 N OVRREC,OVRFLD,NCPDPF,NCPDPFN,PACLM
 S PACLM=0
 ;
 S OVRREC=$P($G(^BPST(IEN59,1)),U,13)   ;grab the overrides
 Q:OVRREC="" 0   ;no overrides - can't be a prior auth claim
 ;
 ; loop through the overrides and look for the prior auth fields
 S OVRFLD=0
 F  S OVRFLD=$O(^BPS(9002313.511,OVRREC,1,OVRFLD)) Q:'+OVRFLD  D
 . S NCPDPF=$P($G(^BPS(9002313.511,OVRREC,1,OVRFLD,0)),U) ;int fld
 . S NCPDPFN=$P($G(^BPSF(9002313.91,NCPDPF,0)),U)  ;fld number
 . Q:(NCPDPFN<498.01)!(NCPDPFN>498.04)
 . S PACLM=1
 ;
 Q PACLM
 ;
CHKPA2() ;---------------------------------------------------------------  
 N PATYP,PANUM
 S PACLM=0
 ;
 S PATYP=$P($G(^BPST(IEN59,1)),U,15)    ;prior auth type code
 S PANUM=$P($G(^BPST(IEN59,1)),U,9)     ;prior auth number
 I ($G(PATYP)'="")!($G(PANUM)'="") S PACLM=1
 ;
 Q PACLM
