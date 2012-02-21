IBCEF21 ;ALB/TMP - FORMATTER SPECIFIC BILL FUNCTIONS CONTINUED ;06-FEB-96
 ;;2.0;INTEGRATED BILLING;**51,296**;21-MAR-94
 ;
COID(IBIFN) ; Claim office ID
 N IBCOID,IBCOID1,IBIN
 S IBIN=$$CURR^IBCEF2(IBIFN),IBCOID1="",IBCOID=$P($$ADDRESS^IBCNSC0(IBIN,.11,5),U,11)
 ;
 I IBIN D
 . I $D(^IBA(364.2,"C",IBIFN)) S IBCOID1=$P($$ADDRESS^IBCNSC0(IBIN,.18,5),U,11) Q  ;Rx
 . I $P($G(^DGCR(399,IBIFN,0)),U,5)<3 S IBCOID1=$P($$ADDRESS^IBCNSC0(IBIN,.12,5),U,11) Q  ;Inpt
 . I $P($G(^DGCR(399,IBIFN,0)),U,5)'<3 S IBCOID1=$P($$ADDRESS^IBCNSC0(IBIN,.16,5),U,11) Q  ;Outpt
 ;
 Q $S(IBCOID1'="":IBCOID1,1:IBCOID)
 ;
ESGHPST(IBIFN,COB) ; return insureds employment status if the bill policy defined by COB is an Employer Sponsored Group Health Plan
 ; ESGHP FLAG (2.312,2.1) ^ the employment status (2.312,2.11)
 ;
 N PPOL,DFN,X,Y S Y=""
 S PPOL=$$PPOL^IBCEF2($G(IBIFN),$G(COB)),DFN=$P($G(^DGCR(399,+$G(IBIFN),0)),U,2)
 I +PPOL,+DFN S X=$G(^DPT(DFN,.312,+PPOL,2)) S Y=+$P(X,U,10)_U_$P(X,U,11)
 Q Y
 ;
ESGHPNL(IBIFN,COB) ; return employer name and location if the bill policy defined by COB is an Employer Sponsored Group Health Plan
 ; ESGHP FLAG (2.312,2.1) ^ employer name (2.312,2.015) ^ employer city (2.312,2.05) 
 ;                        ^ employer state abbr (2.312,2.06) ^ employer state ifn  (2.312,2.06)
 ;
 N PPOL,DFN,X,Y S Y=""
 S PPOL=$$PPOL^IBCEF2($G(IBIFN),$G(COB)),DFN=$P($G(^DGCR(399,+$G(IBIFN),0)),U,2)
 I +PPOL,+DFN S X=$G(^DPT(DFN,.312,+PPOL,2)) S Y=+$P(X,U,10)_U_$P(X,U,9)_U_$P(X,U,5)_U_$P($G(^DIC(5,+$P(X,U,6),0)),U,2)_U_$P(X,U,6)
 Q Y
 ;
REMARKS(IBIFN) ; Compile array of bill remarks
 ;IBIFN = bill ien
 N Z,Z0,Z1,IBARRAY,IBSM
 S Z=0
 ;S:$P($G(^DGCR(399,IBIFN,"U1")),U,2) Z=Z+1,Z0=$P(^("U1"),U,2),IBXDATA(Z)="OFFSET AMOUNT: "_"$"_+$P(Z0,".")_"."_$E($P(Z0,".",2)_"00",1,2)
 S:$P($G(^DGCR(399,IBIFN,"U1")),U,8)'="" Z=Z+1,IBXDATA(Z)=$P(^("U1"),U,8) ;Bill comment on bill
 S Z0=$G(^DGCR(399,IBIFN,0)),Z1=$G(^DGCR(399.3,+$P(Z0,U,7),0))
 D SET^IBCSC5B(IBIFN,.IBARRAY)
 I $P($G(IBARRAY),U,2) D  ;Prosthetics
 . S Z0=0 F  S Z0=$O(IBARRAY(Z0)) Q:Z0=""  S Z1=0 F  S Z1=$O(IBARRAY(Z0,Z1)) Q:'Z1  S Z=Z+1,IBXDATA(Z)="Prosthetic: "_$E($P($$PIN^IBCSC5B(Z1),U,2),1,39)_" "_$E(Z0,4,5)_"/"_$E(Z0,6,7)_"/"_$E(Z0,1,2)
 Q
 ;
CREM(IBIFN) ; Compile array of bill remarks common to every bill
 ;IBIFN = bill ien
 N Z
 S Z=0
 S:$P($G(^IBE(350.9,1,1)),U,4)'="" Z=Z+1,IBXDATA(Z)=$P(^(1),U,4) ;Site specific 'every bill' comment
 Q
 ;
ADMDT(IBIFN,NOOUTCK) ; Calculate admission/start of care date/time
 ; IBIFN = bill ien
 ; NOOUTCK = flag that will:
 ;          (1) no check for inpt episode overlap for outpt
 ;          (0 or null) performs check for inpt episode overlap for outpt
 ;                                      
 ; Returns IBXDATA = fileman date format
 N Z,Z0,Z1
 S Z=$G(^DGCR(399,IBIFN,0)),Z1=$P($G(^("U")),U,20),Z0=$$INPAT^IBCEF(IBIFN,1)
 S IBXDATA=$S(Z0&$P(Z,U,8):$P($G(^DGPT(+$P(Z,U,8),0)),U,2),1:"")
 S:'IBXDATA IBXDATA=$P(Z,U,3)_$S(Z0&(Z1<25):"."_$E("0",$L(Z1))_Z1,1:"")
 ; Check to see if outpt episode (date in event date) overlaps inpt
 ;  episode - use admit date if it does
 I 'Z0,IBXDATA,'$G(NOOUTCK) D
 . N VAINDT,VAIN,DFN
 . S VAINDT=IBXDATA,DFN=$P($G(^DGCR(399,IBIFN,0)),U)
 . D INP^VADPT S IBXDATA=+VAIN(7) S:'IBXDATA IBXDATA=""
 I 'IBXDATA,'Z0 S IBXDATA=$$SERVDT^IBCEF(IBIFN,,2)
 Q
 ;
DISDT(IBIFN) ; Calculate discharge date
 ; IBIFN = bill ien
 N Z,Z0
 S Z=$$INPAT^IBCEF(IBIFN,1),Z0=$G(^DGCR(399,IBIFN,0))
 I Z S IBXDATA=+$G(^DGPT(+$P(Z0,U,8),70)) S:'IBXDATA IBXDATA=$P(Z0,U,16)
 I 'Z N VAINDT,VAIN,DFN S DFN=$P($G(^DGCR(399,IBIFN,0)),U,2) D INP^VADPT I VAIN(1) S IBXDATA=+$G(^DGPM(+$P($G(^DGPM(+VAIN(1),0)),U,17),0))
 Q
 ;
