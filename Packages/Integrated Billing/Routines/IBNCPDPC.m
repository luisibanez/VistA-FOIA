IBNCPDPC ;DALOI/SS - CLAIMS TRACKING EDITOR for ECME ;27-JUN-2005
 ;;2.0;INTEGRATED BILLING;**276**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;This code supports DBIA4693
 ;
% ; -- main entry point for IBT CLAIMS TRACKING EDIT
 ;DFN- patients IEN (file #2)
 ;IBECMEN - NCPDP/ECME number (last 7 digits of the IEN of file #52)
 ; that belong to this claim.
 ;ien in CLAIMS TRACKING file #356  
 ;
CT(DFN,IBECMEN,IBREFNUM) ;
 Q:$$PFSSON^IBNCPDPI()  ;quit if PFSS is ON
 Q:'$G(DFN)
 Q:'$G(IBECMEN)
 N IBTRN
 S IBTRN=+$$SELCT(IBECMEN,IBREFNUM)
 I +IBTRN=0 D  Q
 . W !,"There is no claims tracking record for this claim."
 . D PAUSE^VALM1
 D EN^VALM("IBNCPDP LSTMN CT")
 Q
 ;
EN ; -- main entry point for IBT EXPAND/EDIT TRACKING
 I '$D(DT) D DT^DICRW
 K XQORS,VALMEVL,DFN,IBTRN,IBTRV,IBTRC,IBTRD
 I '$G(IBTRN) G EN^IBTRE Q  ; entry from programmer mode
 D EN^VALM("IBT EXPAND/EDIT TRACKING")
 K IBFASTXT
 Q
 ;
HDR ; -- header code
 D PID^VADPT
 S VALMHDR(1)="Expanded Claims Tracking Info for: "_$E($P($G(^DPT(DFN,0)),"^"),1,20)_" "_$E($G(^(0)),1)_VA("BID")_"   ROI: "_$$EXPAND^IBTRE(356,.31,$P(^IBT(356,IBTRN,0),"^",31))
 S VALMHDR(2)="                              For: "_$$ETYP(IBTRN)
 Q
 ;
INIT ; -- init variables and list array
 K VALMQUIT
 S VALMCNT=0,VALMBG=1
 D BLD,HDR
 Q
 ;
BLD ; -- list builder
 N IBTRND,IBTRND1,IBTRND2,IBETYP
 K ^TMP("IBTRED",$J)
 F I=1:1:30 D BLANK(.I)
 I '$G(IBTRPRF) S IBTRPRF=123
 I IBTRPRF<10 S X=$S(IBTRPRF=1:"IBTRED  HR MENU",IBTRPRF=2:"IBTRED  IR MENU",IBTRPRF=3:"IBTRED  BI MENU",1:"IBTRED  MENU") D PROT^IBTRPR(X)
 D KILL^VALM10()
 S IBTRND=$G(^IBT(356,IBTRN,0)),IBTRND1=$G(^(1))
 S IBETYP=$G(^IBE(356.6,+$P(IBTRND,"^",18),0))
 S VALMCNT=30
 D VISIT D ^IBTRED0,^IBTRED01
 Q
 ;
VISIT ; -- Visit info Region
 N OFFSET,START,IBOE,IBOE0
 S START=1,OFFSET=2
 D SET^IBCNSP(START,OFFSET," Visit Information ",IORVON,IORVOFF)
 D SET^IBCNSP(START+1,OFFSET,"    Visit Type: "_$P(IBETYP,"^"))
 I '$D(IBETYP) N IBETYP S IBETYP=$G(^IBE(356.6,+$P(IBTRND,"^",18),0))
 S X=$P(IBETYP,"^",3) D @X
 Q
1 ; -- visit region for admission or scheduled admission
 I $P($G(^DGPM(+$P(IBTRND,"^",5),0)),"^",17) S VAINDT=+$G(^DGPM(+$P(IBTRND,"^",5),0))
 I '$D(VAIN) S VA200="" D INP^VADPT
 I VAIN(7)="" S Y=$P(IBTRND,"^",6) D D^DIQ S $P(VAIN(7),"^",2)=Y
 D SET^IBCNSP(START+2,OFFSET,"Admission Date: "_$P(VAIN(7),"^",2))
 D SET^IBCNSP(START+3,OFFSET,"          Ward: "_$P(VAIN(4),"^",2))
 D SET^IBCNSP(START+4,OFFSET,"     Specialty: "_$P(VAIN(3),"^",2))
 Q
2 ; -- visit region for  outpatient care
 S IBOE=$P(IBTRND,"^",4),IBOE0=$$SCE^IBSDU(+IBOE)
 D SET^IBCNSP(START+2,OFFSET,"    Visit Date: "_$$DAT1^IBOUTL($P(IBTRND,"^",6),"2P"))
 I +IBOE<1 D  Q
 .D SET^IBCNSP(START+3,OFFSET,"  No Outpatient Encounter Found") Q
 D SET^IBCNSP(START+3,OFFSET,"        Clinic: "_$P($G(^SC(+$P(IBOE0,"^",4),0)),"^"))
 D SET^IBCNSP(START+4,OFFSET,"  Appt. Status: "_$$EXPAND^IBTRE(409.68,.12,$P(IBOE0,"^",12)))
 D SET^IBCNSP(START+5,OFFSET,"    Appt. Type: "_$$EXPAND^IBTRE(409.68,.1,$P(IBOE0,"^",10)))
 D SET^IBCNSP(START+6,OFFSET,"  Special Cond: "_$$ENCL(IBOE))
 Q
 ;
3 ; -- visit region for rx refill
 N PSONTALK,PSOTMP
 S PSONTALK=1 ;PSORXN=+$P(IBTRND,"^",8),PSOFILL=+$P(IBTRND,"^",10)
 S X=+$P(IBTRND,"^",8)_"^"_+$P(IBTRND,"^",10) D EN^PSOCPVW
 I '$D(PSOTMP) D PSOCPVW(+$P(IBTRND,"^",2),+$P(IBTRND,"^",8),.PSOTMP)
 D SET^IBCNSP(START+2,OFFSET,"Prescription #: "_$G(PSOTMP(52,+$P(IBTRND,"^",8),.01,"E")))
 I $P(IBTRND,"^",10)=0 D SET^IBCNSP(START+3,OFFSET,"     Fill Date: "_$$FMTE^XLFDT(+$P(IBTRND,"^",6)))
 I +$P(IBTRND,"^",10) D SET^IBCNSP(START+3,OFFSET,"   Refill Date: "_$$FMTE^XLFDT(+$P(IBTRND,"^",6)))
 D SET^IBCNSP(START+4,OFFSET,"          Drug: "_$G(PSOTMP(52,+$P(IBTRND,"^",8),6,"E")))
 D SET^IBCNSP(START+5,OFFSET,"      Quantity: "_$J($G(PSOTMP(52,+$P(IBTRND,"^",8),7,"E")),8))
 D SET^IBCNSP(START+6,OFFSET,"   Days Supply: "_$J($G(PSOTMP(52,+$P(IBTRND,"^",8),8,"E")),8))
 D SET^IBCNSP(START+7,OFFSET,"          NDC#: "_$$GETNDC^PSONDCUT(+$P(IBTRND,"^",8),$P(IBTRND,"^",10)),2)
 D SET^IBCNSP(START+8,OFFSET,"     Physician: "_$G(PSOTMP(52,+$P(IBTRND,"^",8),4,"E")))
 Q
 ;
4 ; -- Visit region for prosthetics
 D 4^IBTRED01
 Q
 ;
HELP ; -- help code
 S X="?" D DISP^XQORM1 W !!
 Q
 ;
EXIT ; -- exit code
 K VALMQUIT,IBTRN
 D CLEAN^VALM10,FULL^VALM1
 Q
 ;
BLANK(LINE) ; -- Build blank line
 D SET^VALM10(.LINE,$J("",80))
 Q
 ;
ETYP(IBTRN) ; -- Expand type of epidose and date
 N IBY S IBY=""
 S IBTRND=$G(^IBT(356,+IBTRN,0)) I IBTRND="" G ETYPQ
 S IBETYPD=$G(^IBE(356.6,+$P(IBTRND,"^",18),0))
 I IBETYPD="" G ETYPQ
 S IBY=$P(IBETYPD,"^")_" on "_$$DAT1^IBOUTL($P(IBTRND,"^",6),"2P")
ETYPQ Q IBY
 ;
ENCL(IBOE) ; -- output format of classifications
 N I,X,IBCL,IBCL1 S IBCL=""
 I '$G(IBOE) G ENCLQ
 S IBCL1=$$ENCL^IBAMTS2(+IBOE)
 F I=1:1:7 S X=$P(IBCL1,"^",I) S:X IBCL=IBCL_$S(I=1:"AO",I=2:"IR",I=3:"SC",I=4:"EC",I=5:"MST",I=6:"HNC",I=7:"CV",1:"")_"  "
ENCLQ Q IBCL
 ;
SELCT(IBECMEN,IBREFNUM) ;
 N IBRET,IB356
 S (IB356,IBRET)=0
 F  S IB356=+$O(^IBT(356,"AE",IBECMEN,IB356)) Q:((IB356=0)!(IBRET'=0))  D
 . I IBREFNUM=+$P($G(^IBT(356,IB356,0)),U,10) S IBRET=IB356
 Q +IBRET
 ;
 ;return RX info 
 ;IBDFN - patient's DFN
 ;IBRX - ien in #52
 ;output in .PSOTMP array
PSOCPVW(IBDFN,IBRX,PSOTMP) ;
 Q:($G(IBDFN)=0)!($G(IBRX)=0)
 K ^TMP($J,"IBNCPDP-RXINFO")
 D RX^PSO52API(IBDFN,"IBNCPDP-RXINFO",IBRX,"",0)
 S PSOTMP(52,+$P(IBTRND,"^",8),.01,"E")=$G(^TMP($J,"IBNCPDP-RXINFO",IBDFN,IBRX,.01))
 S PSOTMP(52,+$P(IBTRND,"^",8),7,"E")=$G(^TMP($J,"IBNCPDP-RXINFO",IBDFN,IBRX,7))
 S PSOTMP(52,+$P(IBTRND,"^",8),8,"E")=$G(^TMP($J,"IBNCPDP-RXINFO",IBDFN,IBRX,8))
 S PSOTMP(52,+$P(IBTRND,"^",8),6,"E")=$P($G(^TMP($J,"IBNCPDP-RXINFO",IBDFN,IBRX,6)),U,2)
 K ^TMP($J,"IBNCPDP-RXINFO")
 Q
 ;
