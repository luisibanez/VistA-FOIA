IBCBB ;ALB/AAS - EDIT CHECK ROUTINE TO BE INVOKED BEFORE ALL BILL APPROVAL ACTIONS ;2-NOV-89
 ;;2.0;INTEGRATED BILLING;**80,51,137,288**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
 ;MAP TO DGCRBB
 ;
 ;IBNDn = IBND(n) = ^ib(399,n)
 ;RETURNS:
 ;IBER=fields with errors separated by semi-colons
 ;PRCASV("OKAY")=1 if iber="" and $D(prcasv("array")) compete
 ;
GVAR ;set up variables for mccr
 Q:'$D(IBIFN)  F I=0,"M","U","U1","S","MP","TX","UF3","UF31","U2" S @("IBND"_I)=$G(^DGCR(399,IBIFN,I))
 S IBBNO=$P(IBND0,"^"),DFN=$P(IBND0,"^",2),IBEVDT=$P(IBND0,"^",3)
 S IBLOC=$P(IBND0,"^",4),IBCL=$P(IBND0,"^",5),IBTF=$P(IBND0,"^",6)
 S IBAT=$P(IBND0,"^",7),IBWHO=$P(IBND0,"^",11),IBST=$P(IBND0,"^",13),IBFT=$P(IBND0,"^",19)
 S IBFDT=$P(IBNDU,"^",1),IBTDT=$P(IBNDU,"^",2)
 S IBTC=$P(IBNDU1,"^",1),IBFY=$P(IBNDU1,"^",9),IBFYC=$P(IBNDU1,"^",10)
 S IBEU=$P(IBNDS,"^",2),IBRU=$P(IBNDS,"^",5),IBAU=$P(IBNDS,"^",8)
 S IBTOB=$$TOB(IBND0),IBTOB12=$E(IBTOB,1,2)
 K ^TMP($J,"BILL-WARN")
 Q
 ;
EN ;Entry to check for errors
 N IBQ,IBXERR,IBXDATA,IBXSAVE,IBZPRC92,IBQUIT,IBISEQ,IDDATA,IBERRNO
 I $D(IBFL) N IBFL
 K ^TMP($J)
 W !
 S IBER="" D GVAR I '$D(IBND0) S IBER=-1 Q
 ;
 ;I $$ISPROS^IBCEF1(IBIFN) D
 ;. D WARN^IBCBB11("Bill has prosthetics item(s) and will only print locally")
 ;. I $$NEEDMRA^IBEFUNC(IBIFN) S IBQUIT=$$IBER^IBCBB3(.IBER,"098")
 ;
 ;patient in patient file
 I DFN="" S IBER=IBER_"IB057;"
 I DFN]"",'$D(^DPT(DFN)) S IBER=IBER_"IB057;"
 ;
 ;Event date in correct format
 I IBEVDT="" S IBER=IBER_"IB049;"
 I IBEVDT]"",IBEVDT'?7N&(IBEVDT'?7N1".".N) S IBER=IBER_"IB049;"
 ;
 ;Rate Type
 I IBAT="" S IBER=IBER_"IB059;"
 I IBAT]"",'$D(^DGCR(399.3,IBAT,0)) S IBER=IBER_"IB059;"
 I IBAT]"",$D(^DGCR(399.3,IBAT,0)),'$P(^(0),"^",6) S IBER=IBER_"IB059;",IBAT=""
 ;I IBAT]"",$D(^DGCR(399.3,IBAT,0)) S IBARTP=$P(^PRCA(430.2,$P(^DGCR(399.3,IBAT,0),"^",6),0),"^",6)
 I IBAT]"",$P($G(^DGCR(399.3,IBAT,0)),"^",6) S IBARTP=$P($$CATN^PRCAFN($P(^DGCR(399.3,IBAT,0),"^",6)),"^",3)
 ;Check that AR category expects same debtor as defined in who's respon.
 I $D(IBARTP),IBWHO="i"&(IBARTP'="T")!(IBWHO="p"&("PC"'[IBARTP))!(IBWHO="o"&(IBARTP'="N")) S IBER=IBER_"IB058;"
 ;
 ;Who's Responsible
 I IBWHO=""!($L(IBWHO)>1)!("iop"'[IBWHO) S IBER=IBER_"IB065;"
 S IBMRA=$S($$MCRWNR^IBEFUNC(+$$CURR^IBCEF2(IBIFN)):$$TXMT^IBCEF4(IBIFN)>0,1:0)
 ;  MCR will not reimburse is only valid if there is subsequent insurance
 ;   that will reimburse
 I IBWHO="i" D
 . I IBMRA D  Q
 .. N Z,IBZ
 .. S IBZ=0
 .. F Z=$$COBN^IBCEF(IBIFN):1:3 I $D(^DGCR(399,IBIFN,"I"_(Z+1))),$P($G(^DIC(36,+$G(^DGCR(399,IBIFN,"I"_(Z+1))),0)),U,2)'="N" S IBZ=1 Q
 .. I 'IBZ S IBER=IBER_"IB054;" D WARN^IBCBB11("A valid claim for MEDICARE WNR needs subsequent ins. that will reimburse")
 .. 
 . I $S('IBNDMP:1,1:$P(IBNDMP,U,2)'=$$BPP^IBCNS2(IBIFN,1)) S IBER=IBER_"IB054;"
 I IBWHO="o",'$P(IBNDM,"^",11) S IBER=IBER_"IB053;"
 ;
 ; All insurance subscribers must have a birthdate on file
 ;  - 11/10/04 - IB*2.0*288
 F IBISEQ=1:1:3 D
 . I '$P($G(^DGCR(399,IBIFN,"I"_IBISEQ)),U,1) Q   ; no insurance here
 . K ^UTILITY("VADM",$J),^UTILITY("VAPA",$J)
 . S IDDATA=$$INSDEM^IBCEF(IBIFN,IBISEQ)
 . K ^UTILITY("VADM",$J),^UTILITY("VAPA",$J)
 . I $P(IDDATA,U,1) Q   ; birthdate exists
 . ; IB error codes
 . ;    IB221 - primary insured's dob missing
 . ;    IB222 - secondary insured's dob missing
 . ;    IB223 - tertiary insured's dob missing
 . S IBERRNO=220+IBISEQ
 . S IBER=IBER_"IB"_IBERRNO_";"
 . Q
 ;
 D ^IBCBB1
 Q
 ;
EDIT(IBIFN) ; Run edits from within the billing edit screens
 N IBVIEW,IBDISP,IBNOFIX,DIR,X,Y
 S (IBNOFIX,IBVIEW,IBDISP)=1
 D EDITS^IBCB2
 W ! S DIR("A")="Press RETURN to continue",DIR(0)="E" D ^DIR K DIR
 Q
 ;
TOB(IBND0) ;
 ; IBND0 = the 0-node of the bill (file 399)
 Q ($P(IBND0,U,24)_$P($G(^DGCR(399.1,+$P(IBND0,U,25),0)),U,2)_$P(IBND0,U,26))
 ;
