IBNCPEB ;WOIFO/AAT - BULLETINS FOR NCPDP ;05-NOV-04
 ;;2.0;INTEGRATED BILLING;**276**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 Q
 ;
BULL(DFN,IBD,IBERR,IBIFN) ;Process NCPDP Error Messages.
 N IBC,IBT,IBPT,XMSUB,XMY,XMTEXT,XMDUZ,IBMSGT,IBI,IBGRP,IBDUZ,IBRXNO
 ; Input: same as RX^IBNCPDP2()
 ;
 S IBDUZ=$G(IBD("FILLED BY"))
 S IBRXNO=$G(IBD("RX NO"),"UNKNOWN")
 S IBPT=$$PT^IBEFUNC(DFN)
 S XMSUB="NCPDP BILLING ERROR - RX #"_IBRXNO
 S IBC=0
 D T("An error occurred while creating IB Third Party Bill for RX #"_IBRXNO)
 I $G(IBIFN) D T("IB Bill #"_$P($G(^DGCR(399,+IBIFN,0)),U)_" created with errors.")
 D T()
 D T("The following error was encountered: "_$P(IBERR,U,2))
 D T()
 D T("      Patient: "_$S($L(IBPT):$P(IBPT,U)_"       Pt. ID: "_$P(IBPT,U,2),1:"Not Defined"))
 D T(" Rx filled by: "_$P($G(^VA(200,+IBDUZ,0)),U))
 D T(" Prescription: "_IBRXNO)
 D T("  Fill Number: "_$G(IBD("FILL NUMBER")))
 D T("    Fill Date: "_$G(IBD("FILL DATE")))
 D T("   Group Plan: "_$P($G(^IBA(355.3,+$G(IBD("PLAN")),0)),U)_"  (IEN="_+$G(IBD("PLAN"))_")")
 D T("         Drug: "_$P($G(^PSDRUG(+$G(IBD("DRUG")),0)),U))
 D T("Amount Billed: "_$J($G(IBD("BILLED")),5,2))
 D T("  Amount Paid: "_$J($G(IBD("PAID")),5,2))
 D T()
 D T("Please review the circumstances surrounding this error and make necessary")
 D T("corrections.")
 S XMDUZ="INTEGRATED BILLING PACKAGE",XMTEXT="IBT("
 S XMY("G.IB ERROR")=""
 D ZXMD
 Q
 ;
 ;call mailman in background (using taskman)
ZXMD ;
 N ZTIO,ZTRTN,ZTDTH,ZTSAVE,ZTDESC
 N %,%H,%I,X
 D NOW^%DTC
 S ZTIO="",ZTDTH=%,ZTDESC="NCPDP BILLING ERROR BULLETIN"
 S ZTSAVE("IBT*")="",ZTSAVE("XM*")=""
 S ZTRTN="^XMD"
 D ^%ZTLOAD
 Q
 ;
T(IBTXT) ; Add text to the message
 S IBC=IBC+1,IBT(IBC)=$G(IBTXT," ")
 Q
 ;
 ;-------------------------
 ;Release charges off hold bulletin
RELBUL(DFN,IBRX,IBFIL,IBADT,IBACT,IBCR,IBCC,IBIFN) ;
 ; Input:
 ;   DFN - Patient
 ;   IBRX - Rx IEN
 ;   IBFIL - Refill#
 ;   IBADT - Fill date
 ;   IBACT - pointer to #350
 ;   IBCR - Close Reason code (.01 of BPS CLOSE REASON)
 ;   IBCC - Close Reason Comment
 N IBT,IBC,IBGRP,XMSUB,XMDUZ,XMY,XMTEXT,VAERR,VADM,X,VA
 N IBNAME,IBAGE,IBPID,IBBID
 D DEM^VADPT ; get patient demographic data
 I VAERR K VADM
 S IBNAME=$$PR($G(VADM(1)),26)
 S IBAGE=$$PR($G(VADM(4)),3)
 S IBPID=$G(VA("PID"))
 S IBBID=$G(VA("BID"))
 S XMSUB=$E(IBNAME,1,8)_"("_IBBID_")"_" PATIENT CHRG RELEASED"_"-"_$E($$MCDIV(IBRX,IBFIL),1,11)
 ;
 S IBC=0
 D T("The following charge has been automatically released from HOLD")
 I 'IBCR D T("The decision was made based on the electronic NCPDP response from the Payer")
 I IBCR D T("because the e-pharmacy claim was closed by OPECC as '"_$$REASON^IBNCPDPU(IBCR)_"'")
 I $G(IBCC)'="" D T("Additional comment: "_IBCC)
 D T()
 D T("Name: "_IBNAME_"   Age    : "_IBAGE_"       Pt. ID: "_IBPID)
 ;
 D CHRG
 ; Transmit mail
 S XMDUZ="INTEGRATED BILLING PACKAGE",XMTEXT="IBT("
 S IBGRP=$P($G(^XMB(3.8,+$P($G(^IBE(350.9,1,0)),U,11),0)),U)
 I IBGRP]"" S XMY("G."_IBGRP_"@"_^XMB("NETNAME"))=""
 D ^XMD
 Q
 ;
CHRG ; gets charge data and sets up charge lines
 N IBTYP,IBFR,IBTO,IBX,IBX1,IBRXN,IBRF,IENS
 S IBX=$G(^IB(IBACT,0))
 S IBX1=$G(^IB(IBACT,1))
 S IBFR=$$DAT1^IBOUTL($S($P(IBX,U,14)'="":($P(IBX,U,14)),1:$P(IBX1,U,2)))
 S IBTO=$$DAT1^IBOUTL($S($P(IBX,U,15)'="":($P(IBX,U,15)),1:$P(IBX1,U,2)))
 S IBRXN=$P($G(^PSRX(IBRX,0)),U) ;$P($P(IBX,U,8),"-")
 S IBTYP=$P(IBX,U,3)
 S:IBTYP IBTYP=$P($G(^IBE(350.1,IBTYP,0)),U,3)
 S:IBTYP IBTYP=$P($$CATN^PRCAFN(IBTYP),U,2)
 D T("Type: "_$$PR(IBTYP,28)_" Amount : $"_$J(+$P(IBX,U,7),0,2))
 D T("From: "_$$PR(IBFR,28)_" To     : "_IBTO)
 D T("Rx #: "_$$PR(IBRXN_$S(IBFIL:" ("_IBFIL_")",1:""),28)_" Fill Dt: "_$$DAT1^IBOUTL(IBADT))
 D T()
 D T("REFERENCE NUMBER : "_$P(IBX,U))
 D T("FIRST PARTY BILL : "_$P(IBX,U,11))
 I $G(IBIFN) D T("THIRD PARTY BILL : "_$P($G(^PRCA(430,+IBIFN,0)),U))
 Q
 ;
PR(STR,LEN) ; pad right
 N B S STR=$E(STR,1,LEN),$P(B," ",LEN-$L(STR))=" "
 Q STR_$G(B)
 ;
 ;MC Division for the IB
MCDIV(IBRX,IBFIL) ; Get MC DIVISION name from the Rx/Fill
 N IBDIV,IBINST,IBMCDIV,IBNAM,IBUNK
 S IBUNK="DIV UNKNWN"
 ; outpatient division
 I 'IBFIL S IBDIV=+$P($G(^PSRX(IBRX,2)),U,9)
 E  S IBDIV=+$P($G(^PSRX(IBRX,1,IBFIL,0)),U,9)
 I 'IBDIV Q IBUNK
 ; related institution
 S IBINST=+$P($G(^PS(59,IBDIV,"INI")),U) Q:'IBINST IBUNK
 S IBMCDIV=+$O(^DG(40.8,"AD",IBINST,0)) ; medical center division
 I 'IBMCDIV Q IBUNK
 S IBNAM=$P($G(^DG(40.8,IBMCDIV,0)),U)
 Q $S(IBNAM="":IBUNK,1:IBNAM)
 ;
