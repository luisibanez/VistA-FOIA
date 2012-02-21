IBCBB21 ;ALB/AAS - CONTINUATION OF EDIT CHECK ROUTINE FOR UB-92 ;2-NOV-89
 ;;2.0;INTEGRATED BILLING;**51,137,210,232,155,291**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
EN(IBZPRC92) ;
 ;
 N ECODE,IBTXMT,IBXDATA,IBLPRT,IBI,Z,Z0,Z1,IBREQMRA
 I '$D(IBZPRC92) D ALLPROC^IBCVA1(IBIFN,.IBZPRC92)
 S IBREQMRA=$$REQMRA^IBEFUNC(IBIFN)    ; MRA?
 K IBQUIT S IBQUIT=0
 S (Z,Z0,Z1)=0
 F  S Z=$O(IBZPRC92(Z)) Q:'Z  S:IBZPRC92(Z)["CPT" Z0=Z0+1 S:IBZPRC92(Z)["ICD" Z1=Z1+1
 S IBTXMT=$$TXMT^IBCEF4(IBIFN)
 S IBZPRC92=Z0_U_Z1 ;Save # of CPT's and ICD9's
 ; More than 50 procedures on a bill - must print locally
 I IBTXMT,(+IBZPRC92>50!(+$P(IBZPRC92,U,2)>50)) D  Q:IBQUIT
 . I 'IBREQMRA S IBQUIT=$$IBER^IBCBB3(.IBER,308) Q
 . I '$P(IBNDTX,U,9) S IBQUIT=$$IBER^IBCBB3(.IBER,325)
 ; If ICD9 procedures with dates and charges, bill 11x or 83x needs operating physician
 I IBTOB12="11",$P(IBZPRC92,U,2),'$$CKPROV^IBCEU(IBIFN,2) S IBER=IBER_"IB304;"
 I IBTOB12="83",$P(IBZPRC92,U,2),'$$CKPROV^IBCEU(IBIFN,2) S IBER=IBER_"IB312;"
 ;
 ; If any CPT procedures have more than 2 modifiers, warn
 S Z=0 F  S Z=$O(IBZPRC92(Z)) Q:'Z  I $P(IBZPRC92(Z),U)["ICPT(",$L($P(IBZPRC92(Z),U,15),",")>2 S Z0="Proc "_$$PRCD^IBCEF1($P(IBZPRC92(Z),U))_" has > 2 modifiers - only first 2 will be used" D WARN^IBCBB11(Z0)
 ;
 I $$WNRBILL^IBEFUNC(IBIFN),$$MRATYPE^IBEFUNC(IBIFN)'="A" S IBER=IBER_"IB086;"
 ;
 ; UB92 Diagnosis Codes
 K IBXDATA D F^IBCEF("N-DIAGNOSES",,,IBIFN)
 ;
 ; Only 9 dx's allowed per claim plus 1 E-code
 S (Z,ECODE,IBI)=0 F  S Z=$O(IBXDATA(Z)) Q:'Z  D  Q:IBER["309;"
 . S IBI=IBI+1
 . I $E($$ICD9^IBACSV(+$P(IBXDATA(Z),U)))="E" S:ECODE IBQUIT=$$IBER^IBCBB3(.IBER,301) S:'ECODE IBI=IBI-1,ECODE=1
 . ; max DX check does not apply to MRAs
 . I IBTXMT,IBI>9 D
 .. I 'IBREQMRA Q:$P(IBNDTX,U,8)  S IBER=IBER_"IB309;" Q
 .. I '$P(IBNDTX,U,9) S IBER=IBER_"IB326;"
 ;
 I 'IBI S IBER=IBER_"IB071;"   ;Require Diag code NOIS:OKL-0304-72495
 I IBI,$$INPAT^IBCEF(IBIFN,1),$E($$ICD9^IBACSV(+$P(IBXDATA(1),U)))="V" S Z="Principal Dx V-code may not be valid" D WARN^IBCBB11(Z)
 I '$$OCC10^IBCBB2(IBIFN,.IBXDATA,3) S IBER=IBER_"IB093;"
 ;
 K ^TMP($J,"IBC-RC")
 D F^IBCEF("N-UB92 SERVICE LINE (PRINT)",,,IBIFN)
 S (Z0,IBI)=0 F  S IBI=$O(^TMP($J,"IBC-RC",IBI)) Q:'IBI  S Z=$G(^(IBI))  Q:+$P(Z,U,2)=1  I $P(Z,U,2) D
 . I IBER'["IB090;",$P(Z,U,2)>1,($P(Z,U,7)>99999.99!($P(Z,U,8)>99999.99)) S IBER=IBER_"IB090;"
 . Q:$P(Z,U,2)'<180&($P(Z,U,2)'>189)  ;Pass days (LOA) don't matter
 . I '$P(Z,U,7),'$P(Z,U,8),'Z0,$$COBN^IBCEF(IBIFN)'>1  S Z0="Rev Code(s) having a 0-charge will not be transmitted for the bill" D WARN^IBCBB11(Z0) S Z0=1
 K ^TMP($J,"IBC-RC")
 I IBTXMT D
 . ; Force UB92 to print local if SSN ID required and claim may be
 . ; printed at clearinghouse
 . N IBZ
 . I 'IBREQMRA Q:$S('$P($G(^DIC(36,+$$CURR^IBCEF2(IBIFN),3)),U,12):1,1:$P($G(^DGCR(399,IBIFN,"TX")),U,8)=1)
 . I IBREQMRA Q:$S('$P($G(^DIC(36,+$P($G(^DGCR(399,IBIFN,"M")),U,$$COBN^IBCEF(IBIFN)+1),3)),U,12):1,1:$P($G(^DGCR(399,IBIFN,"TX")),U,9)=1)
 . D F^IBCEF("N-"_$S('IBREQMRA:"CURRENT",1:"ALL")_" INSURANCE CO 837 ID","IBZ",,IBIFN)
 . I IBREQMRA S IBZ=$G(IBI($$COBN^IBCEF(IBIFN)+1))
 . I $S(IBZ="":0,$E(IBZ,$L(IBZ)-3,$L(IBZ))="PRNT":0,1:1) Q
 . S IBER=IBER_"IB327;"
 Q
 ;
