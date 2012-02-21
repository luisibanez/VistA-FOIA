IBCEP2A ;ALB/TMP - EDI UTILITIES for provider ID ;25-APR-01
 ;;2.0;INTEGRATED BILLING;**137,232**;21-MAR-94
 ;
ALT(IBPERF,IBSRC,IBALT,IBINS4,IBPTYP) ; set source level to next higher level 
 ; or set the alternate type and source if performing provider id
 ; alternate type and source exist
 ; IBPERF = 1 if performing provider id is requested
 ; IBINS4 = '4' node of insurance co (file 36)
 ; Pass IBPTYP by reference to get alternate provider id type
 ; Pass IBALT by reference.  Set to 1 if alternate id is to be used next
 ;
 I '$G(IBPERF)!($P(IBINS4,U,3)=1) S IBSRC=IBSRC-1 G ALTQ
 S IBSRC=""
 I '$G(IBALT),$P(IBINS4,U,3)=2,$P(IBINS4,U,10),$P(IBINS4,U,11) S IBALT=1,IBSRC=$P(IBINS4,U,11),IBPTYP=$P(IBINS4,U,10) S:IBPTYP="" IBPTYP=$P(IBINS4,U)
 ;
ALTQ Q IBSRC
 ;
IDSET(IBPTYP,IBINS4,IBPERF,IBSPEC,IBSRC,IBUP) ; set variables for provider id type search
 N Z
 S IBSPEC=$G(^IBE(355.97,+IBPTYP,1))
 S Z=$S($G(IBPERF):2,$P(IBSPEC,U,5):6,$P(IBSPEC,U,6):4,1:2)
 S IBSRC=$P(IBINS4,U,Z),IBUP=$P(IBINS4,U,$S(IBSRC:Z+1,1:0))
 Q
 ;
CAREST(IBIFN) ; Return state file ien of state where care was performed
 ; IBIFN = ien of bill in file 399
 ; Get it from rendering facility or if none, the billing facility
 N Z,IBXDATA,STATE
 S STATE=""
 D F^IBCEF("N-RENDERING INSTITUTION",,,IBIFN)
 I IBXDATA D
 . I '$P(IBXDATA,U,2) S STATE=+$P($G(^DIC(4,+IBXDATA,0)),U,2) Q
 . S STATE=+$P($G(^IBA(355.93,+IBXDATA,0)),U,7)
 E  D
 . D F^IBCEF("N-AGENT CASHIER STATE",,,IBIFN)
 . S STATE=IBXDATA
 Q STATE
 ;
RECALCA(IBIFN) ; Recalculate all performing provider id's on bill IBIFN
 ; IBIFN = ien of bill entry (file 399)
 N IBZ,IBZ0,IBX,IBP,IBSEQ,DA,DIE,DR,DIR,X,Y
 ;
 D EN^DDIOL("THIS FUNCTION HAS BEEN DISABLED",,"!") Q
 ;
 S DA(1)=IBIFN
 I '$D(^XUSEC("IB SUPERVISOR",DUZ)) D EN^DDIOL("YOU ARE NOT AUTHORIZED TO PERFORM THIS FUNCTION",,"!")
 S IBZ=0 F  S IBZ=$O(^DGCR(399,IBIFN,"PRV",IBZ)) Q:'IBZ  S IBP=$G(^(IBZ,0)) I $P(IBP,U,2)'="" D
 . S DA=IBZ
 . F IBZ0=5:1:7 Q:'$G(^DGCR(399,IBIFN,"I"_(IBZ0-4)))  D
 .. S IBSEQ=$$EXPAND^IBTRE(399.0222,.01,+IBP)_" "_$P("PRIMARY^SECONDARY^TERTIARY",U,IBZ0-4)_" PROVIDER ID "
 .. S IBX=$$RECALC(.DA,IBZ0-4,$P(IBP,U,IBZ0),1)
 .. I IBX'="",IBX=$P(IBP,U,IBZ0) D EN^DDIOL(IBSEQ_"NO CHANGE NEEDED",,"!") Q
 .. I IBX'="",IBX'=$P(IBP,U,IBZ0) D  Q
 ... S DR=(IBZ0/100)_"////"_IBX,DIE="^DGCR(399,"_DA(1)_",""PRV""," D ^DIE
 ... D EN^DDIOL(IBSEQ_"CHANGED TO "_IBX,,"!")
 .. D EN^DDIOL(IBSEQ_"NOT FOUND",,"!")
 Q
 ;
RECALC(IBDA,IBSEQ,IBX,IBD) ; Recalculate id #, if possible - called
 ;   from input transforms in subfile 399.0222, fields .05-.07
 ; IBDA = DA array of the provider entry (file 399.0222)
 ; IBSEQ = the numeric COB sequence of the provider id (1-3)
 ; IBX = the current value of the id in the subfile
 ; IBD = flag that if set to 1 will suppress the display text
 ;
 N IBPN,IBZ
 S IBPN=$P($G(^DGCR(399,IBDA(1),"PRV",IBDA,0)),U,2)
 I IBPN="" D:'$G(IBD) EN^DDIOL("   CAN'T CALCULATE WITHOUT A PROVIDER NAME","","?0") G RECALCQ
 S IBZ=$$GETID^IBCEP2(IBDA(1),2,IBPN,IBSEQ)
 I IBZ="" D:'$G(IBD) EN^DDIOL("   ID COULD NOT BE DETERMINED","","?0") G RECALCQ
 D:'$G(IBD) EN^DDIOL("  "_IBZ_$S(IBZ'=IBX:"",1:" (no change)"),"","?0")
 S IBX=IBZ
 ;
RECALCQ Q IBX
 ;
PERFPRV(IBIFN) ; Returns the variable pointer of the 'performing provider'
 ; (attending or rendering) for a bill IBIFN
 N IBP,IBPT,IBQ,Z
 S Z=$$FT^IBCEF(IBIFN),IBPT=$S(Z=2:3,Z=3:4,1:0)
 D GETPRV^IBCEU(IBIFN,IBPT,.IBP)
 Q $P($G(IBP(IBPT,1)),U,3)
 ;
INSPAR(IBIFN,SEQ) ;
 N Z,Z4,Z0
 Q:$G(X)'="??"
 S:'$G(SEQ) SEQ=$$COBN^IBCEF(IBIFN)
 S Z=+$G(^DGCR(399,IBIFN,"I"_SEQ)),Z4=$G(^DIC(36,Z,4))
 I Z D
 . D EN^DDIOL(">"_$J("",20)_"-- PERFORMING PROVIDER ID PARAMETERS --",,"!")
 . S Z0=$P("  PRIMARY^SECONDARY^ TERTIARY",U,SEQ)_" INSURANCE: "_$P($G(^DIC(36,Z,0)),U)
 . D EN^DDIOL(">"_$J("",(80-$L(Z0))\2)_Z0,,"!")
 . D EN^DDIOL(">  Secondary Perf Prov ID Type (HCFA): "_$$EXPAND^IBTRE(36,4.01,+Z4),,"!")
 . D EN^DDIOL(">  Secondary Perf Prov ID Type (UB92): "_$$EXPAND^IBTRE(36,4.02,$P(Z4,U,2)),,"!")
 . D EN^DDIOL(">    Secondary Perf Prov IDs Required: "_$$EXPAND^IBTRE(36,4.03,$P(Z4,U,3)),,"!")
 . D EN^DDIOL(" ",,"!")
 Q
 ;
GETTYP(IBXIEN,IBCOBN) ; Function returns provider id type for insurance co
 ; with COB of IBCOBN on claim ien IBXIEN in first ^ pc and 1 in second
 ; ^ piece if the id is required
 ; 
 N A,R,Z,Z0
 S A="",R=0
 S:'$G(IBCOBN)!(IBCOBN>3) IBCOBN=$$COBN^IBCEF(IBXIEN)
 S Z=+$G(^DGCR(399,IBXIEN,"I"_+IBCOBN))
 I Z D
 . S Z0=$$FT^IBCEF(IBXIEN)
 . S A=+$P($G(^DIC(36,Z,4)),U,$S(Z0=2:1,1:2))
 . I A S R=$P($G(^DIC(36,Z,4)),U,3),R=$S('R:0,R=3:1,R=1:Z0=2,R=2:Z0=3,1:0)
 Q A_U_R
 ;
