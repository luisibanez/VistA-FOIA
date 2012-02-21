IBNCPDP3 ;OAK/ELZ - STORES NDC/AWP UPDATES ;20-JUN-2003
 ;;2.0;INTEGRATED BILLING;**223,276**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
 ;
UPAWP(IBNDC,IBAWP,IBADT) ; updates AWP prices for NDCs
 ;
 N IBITEM,IBCS
 ;
 ;
 S IBCS=$P($G(^IBE(350.9,1,9)),"^",12)
 I 'IBCS Q "0^Unable to find Charge Set"
 ;
 S IBNDC=$$NDC^IBNCPDPU(IBNDC)
 ;
 S IBITEM=+$$ADDBI^IBCREF("NDC",IBNDC) I IBITEM Q "0^Unable to add item"
 ;
 I '$$ADDCI^IBCREF(IBCS,IBITEM,IBADT,IBAWP) Q "0^Unable to add charge"
 ;
 Q 1
 ;
 ;
REJECT(DFN,IBD) ; used to process rejected claims
 ; if ct turned on, need to make sure on file.
 ; nothing else to do with this here.
 ;
 N IBADT,IBTRKR,IBTRKRN,IBRXN,IBFIL,IBEABD,IBY,IBLOCK,IBDUZ,IBRXTYP
 S IBDUZ=.5
 S IBY=1,IBLOCK=0
 ;
 S IBADT=+$G(IBD("FILL DATE")) I 'IBADT S IBY="0^No fill date" G REJQ
 S IBRXN=+$G(IBD("PRESCRIPTION")) I 'IBRXN S IBY="0^No Rx IEN" G REJQ
 S IBFIL=+$G(IBD("FILL NUMBER"),-1) I IBFIL<0 S IBY="0^No fill number" G REJQ
 S IBD("BCID")=IBD("CLAIMID")_";"_IBADT
 L +^DGCR(399,"AG",IBD("BCID")):15 E  S IBY="0^Cannot lock ECME number" G REJQ
 S IBLOCK=1
 ;
 ; -- claims tracking info
 S IBTRKR=$G(^IBE(350.9,1,6))
 ; date can't be before parameters
 S $P(IBTRKR,"^")=$S('$P(IBTRKR,"^",4):0,+IBTRKR&(IBADT<+IBTRKR):0,1:IBADT)
 S IBTRKRN=+$O(^IBT(356,"ARXFL",IBRXN,IBFIL,0))
 ;
 I $D(IBD("CLOSE REASON")),'$D(IBD("DROP TO PAPER")) S IBD("DROP TO PAPER")=""
 ;
 I IBTRKRN,$G(IBD("CLOSE REASON")) D  S IBY=1 G REJQ
 . N IBCR,IBCC,IBPAP,IBRELC
 . S IBCR=IBD("CLOSE REASON")
 . S IBPAP=IBD("DROP TO PAPER")
 . S IBRELC=$G(IBD("RELEASE COPAY"))
 . S IBCC=$G(IBD("CLOSE COMMENT"))
 . D NONBR^IBNCPNB(DFN,IBRXN,IBFIL,IBADT,IBCR,IBPAP,IBRELC,IBCC)
 ;
 ; if in CT already - set EABD+60 if still there.
 I IBTRKRN,$P(^IBT(356,IBTRKRN,0),"^",17) D  S IBY=1 G REJQ
 . N IBLOCK
 . L +^IBT(356,IBTRKRN):10 S IBLOCK=$T
 . S IBEABD=$$EABD^IBTUTL($O(^IBE(356.6,"AC",4,0)),IBADT)
 . S:'IBEABD IBEABD=DT
 . S IBEABD=$$FMADD^XLFDT(IBEABD,60)
 . S DIE="^IBT(356,",DA=IBTRKRN,DR=".17////^S X=IBEABD"
 . D ^DIE
 . I IBLOCK L -^IBT(356,IBTRKRN)
 ;
 S IBY=1 ; OK
 ;
REJQ ;
 D LOG^IBNCPDP2("REJECT",IBY)
 I IBLOCK L -^DGCR(399,"AG",IBD("BCID"))
 Q IBY
 ;
 ;
REVERSE(DFN,IBD,IBAUTO) ;process reversed claims
 N IBIFN,I,IB,IBIL,IBCHG,IBCRES,IBY,X,Y,DA,DIE,DR,IBADT,IBLOCK,IBLDT
 N IBNOW,IBDUZ,IBCR,IBRELC,IBCC,IBPAP,IBRXN,IBFIL,IBRTS,IBARES
 S IBDUZ=.5
 ;
 S IBLOCK=0
 ; find bill number
 I '$L($G(IBD("CLAIMID"))) S IBY="0^Missing ECME Number" G REVQ
 S IBADT=+$G(IBD("FILL DATE")) I 'IBADT S IBY="0^Missing Fill Date" G REVQ
 S IBRXN=+$G(IBD("PRESCRIPTION")) I 'IBRXN S IBY="0^No Rx IEN" G REVQ
 S IBFIL=+$G(IBD("FILL NUMBER"),-1) I IBFIL<0 S IBY="0^No fill number" G REVQ
 I $E($G(IBD("RESPONSE")),1)="R" D  G REVQ:+'$G(IBRTS)
 . S IBY="0^REVERSAL rejected by payer"
 . S IBRTS=$$RTS(IBD("REVERSAL REASON"))
 ;
 S IBD("BCID")=(+IBD("CLAIMID"))_";"_IBADT ; BC ID Number
 L +^DGCR(399,"AG",IBD("BCID")):15 E  S IBY="0^Cannot lock ECME number" G REVQ
 S IBLOCK=1
 I $D(^DGCR(399,"AG",IBD("BCID"))) S ^(IBD("BCID"))=""
 S IBIFN=$$MATCH^IBNCPDP2(IBD("BCID"))
 I $D(IBD("CLOSE REASON")),'$D(IBD("DROP TO PAPER")) S IBD("DROP TO PAPER")=""
 S IBCR=+$G(IBD("CLOSE REASON"))
 S IBPAP=$G(IBD("DROP TO PAPER"))
 S IBRELC=$G(IBD("RELEASE COPAY"))
 S IBCC=$G(IBD("CLOSE COMMENT"))
 D NONBR^IBNCPNB(DFN,IBRXN,IBFIL,IBADT,IBCR,IBPAP,IBRELC,IBCC)
 I 'IBIFN S IBY="0^"_$S(IBPAP:"Dropped to paper",IBCR>1:"Set non-billable reason in CT",1:"Cannot find the bill to reverse") G REVQ
 ;
 F I=0,"S" S IB(I)=$G(^DGCR(399,IBIFN,I))
 I IB(0)="" S IBY="0^No data in bill" G REVQ
 I +$P(IB("S"),U,16),$P(IB("S"),U,17)]"" S IBY="0^Bill already cancelled" G REVQ
 ;
 S:'$D(IBCRES) IBCRES="ECME PRESCRIPTION REVERSED"
 S DA=IBIFN,DR="16////1;19////"_IBCRES,DIE="^DGCR(399,"
 D ^DIE K DA,DIE,DR
 ;
 ; - decrease out the receivable in AR
 S IB("U1")=$G(^DGCR(399,IBIFN,"U1"))
 S IBIL=$P($G(^PRCA(430,IBIFN,0)),"^")
 S IBCHG=$S(IB("U1")']"":0,$P(IB("U1"),"^",1)]"":$P(IB("U1"),"^",1),1:0)
 ;
 S X="21^"_IBCHG_"^"_IBIL_"^"_IBDUZ_"^"_DT_"^"_IBCRES
 D ^PRCASER1
 S IBARES=Y
 I IBARES<0 S IBY=IBARES D BULL
 ;
 S IBY=$S(IBARES<0:"0^"_$P(IBARES,"^",2),1:1)
 ;
 I IBDUZ'=DUZ D  ; set the real user
 . N IBI,IBT S IBI=18,IBT(399,IBIFN_",",IBI)=IBDUZ D FILE^DIE("","IBT")
 ;
REVQ ;
 I IBY=1,$G(IBIFN) S IBY=+IBIFN
 D LOG^IBNCPDP2($S($G(IBAUTO)=1:"AUTO REVERSE",$G(IBAUTO)=2:"BILL CANCELLED",1:"REVERSE"),IBY)
 I IBLOCK L -^DGCR(399,"AG",IBD("BCID"))
 Q IBY
 ;
RTS(IBRR) ; Return to Stock processing on Released Rx
 ; input - IBRR = reversal reason
 ; output - 0 = reversal not due to a Rx RETURN TO STOCK or Rx DELETE
 ;          1 = reversal due to a Rx RETURN TO STOCK or Rx DELETE
 I IBRR'="RX RETURNED TO STOCK"&(IBRR'="RX DELETED") Q 0
 N IBTRKRN,IBLOCK2,IBCMT,DA,DIE,DR
 S IBTRKRN=+$O(^IBT(356,"ARXFL",IBRXN,IBFIL,0))
 I 'IBTRKRN Q 0  ; CT record does not exist
 I '$P($G(^IBT(356,IBTRKRN,0)),U,11) Q 0  ; BILL does not exist
 S IBCRES=$$GETRSN(DFN,IBRXN,IBFIL)  ; recorded in file 399 entry
 L +^IBT(356,IBTRKRN):5 S IBLOCK2=$T
 S DIE="^IBT(356,",DA=IBTRKRN,IBCMT="Rx RTS - May Need Refund"
 S DR="1.08////"_IBCMT
 D ^DIE
 I IBLOCK2 L -^IBT(356,IBTRKRN)
 Q 1
 ;
BULL ; Generate a bulletin if there is an error in cancelling the claim.
 N IBC,IBT,IBPT,IBGRP,XMDUZ,XMTEXT,XMSUB,XMY
 ;
 S IBPT=$$PT^IBEFUNC(DFN)
 S XMSUB=$E($P(IBPT,"^"),1,14)_"  "_$P(IBPT,"^",3)_" - ERROR ENCOUNTERED"
 S XMDUZ="INTEGRATED BILLING PACKAGE",XMTEXT="IBT("
 S XMY(IBDUZ)=""
 S IBGRP=$P($G(^XMB(3.8,+$P($G(^IBE(350.9,1,1)),"^",7),0)),"^")
 I IBGRP]"" S XMY("G."_IBGRP_"@"_^XMB("NETNAME"))=""
 ;
 S IBT(1)="An error occurred while cancelling the Pharmacy claim from ECME"
 S IBT(2)="fiscal intermediary for the following patient:"
 S IBT(3)=" " S IBC=3
 D PAT^IBAERR1 ; Accepts IBDUZ
 S IBC=IBC+1,IBT(IBC)="   Bill #: "_IBIL
 S IBC=IBC+1,IBT(IBC)=" "
 S IBC=IBC+1,IBT(IBC)="The following error was encountered:"
 S IBC=IBC+1,IBT(IBC)=" "
 D ERR^IBAERR1
 S IBC=IBC+1,IBT(IBC)=" "
 S IBC=IBC+1,IBT(IBC)="Please review the circumstances surrounding this error and decrease"
 S IBC=IBC+1,IBT(IBC)="out this receivable in Accounts Receivable if necessary."
 D ^XMD
 Q
 ;
GETRSN(DFN,IBRXN,IBFIL) ;
 ; retrieve charge removal reason from file 354.71
 ; input - DFN,IBRXN=Rx ien,IBFIL=fill number
 ; output - charge removal reason 
 N IBDT,IBDA,IBXRSN,IBRXFIL,IB0
 S (IBDT,IBDA)=0,IBXRSN=""
 S IBRXFIL=$S('IBFIL:IBRXN,1:IBRXN_";"_IBFIL)
 F  S IBDT=$O(^IBAM(354.71,"AD",DFN,IBDT)) Q:'IBDT  Q:IBXRSN]""  D
 . F  S IBDA=$O(^IBAM(354.71,"AD",DFN,IBDT,IBDA)) Q:'IBDA  Q:IBXRSN]""  D
 . . S IB0=^IBAM(354.71,IBDA,0)
 . . Q:$P(IB0,"^",6)'[IBRXFIL
 . . S IBXRSN=$$GET1^DIQ(354.71,IBDA_",",.19)
 S:IBXRSN']"" IBXRSN="CHARGE REMOVAL REASON NOT FOUND"
 Q "Reversal Rej, no pymt due<>"_IBXRSN
 ;
 ;IBNCPDP3
