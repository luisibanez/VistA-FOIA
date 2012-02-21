IBCEP8 ;ALB/TMP - Functions for NON-VA PROVIDER ;11-07-00
 ;;2.0;INTEGRATED BILLING;**51,137,232,288**;21-MAR-94
 ;
EN ; -- main entry point
 N IBNPRV
 D FULL^VALM1
 D EN^VALM("IBCE PRVNVA MAINT")
 Q
 ;
HDR ; -- header code
 K VALMHDR
 Q
 ;
INIT ; Initialization
 N DIC,DA,X,Y,DLAYGO,IBIF,DIR,DTOUT,DUOUT
 K ^TMP("IBCE_PRVNVA_MAINT",$J)
 S DIR("A")="(I)NDIVIDUAL OR (F)ACILITY?: ",DIR(0)="SA^I:INDIVIDUAL;F:FACILITY" D ^DIR K DIR
 I $D(DUOUT)!$D(DTOUT) S VALMQUIT=1 G INITQ
 S IBIF=Y
 S DIC="^IBA(355.93,",DIC("DR")=".02////"_$S(IBIF'="F":2,1:1)
 S DIC("S")="I $P(^(0),U,2)="_$S(IBIF'="F":2,1:1)
 S DLAYGO=355.93,DIC(0)="AELMQ",DIC("A")="Select a NON"_$S(IBIF="I":"-",1:"/OTHER ")_"VA PROVIDER: "
 D ^DIC K DIC,DLAYGO
 I Y'>0 S VALMQUIT=1 G INITQ
 S IBNPRV=+Y
 D BLD
INITQ Q
 ;
BLD ; Build/Rebuild display
 N IBLCT,IBCT,Z,Z1
 S (IBLCT,IBCT)=0,Z=$G(^IBA(355.93,IBNPRV,0))
 S IBCT=IBCT+1
 S Z1=$J("",10)_"       NAME: "_$P(Z,U) D SET1(.IBLCT,Z1,IBCT)
 S IBCT=IBCT+1
 S Z1=$J("",10)_"       TYPE: "_$S($P(Z,U,2)=2:"INDIVIDUAL PROVIDER",1:"OUTSIDE OR OTHER VA FACILITY") D SET1(.IBLCT,Z1,IBCT)
 I $P(Z,U,2)=2 D
 . S IBCT=IBCT+1
 . S Z1=$J("",10)_"CREDENTIALS: "_$P(Z,U,3) D SET1(.IBLCT,Z1,IBCT)
 . S IBCT=IBCT+1
 . S Z1=$J("",10)_"  SPECIALTY: "_$P(Z,U,4) D SET1(.IBLCT,Z1,IBCT)
 E  D
 . S IBCT=IBCT+1
 . S Z1=" " D SET1(.IBLCT,Z1,IBCT)
 . S IBCT=IBCT+1
 . S Z1=$J("",10)_"    ADDRESS: "_$P(Z,U,5) D SET1(.IBLCT,Z1,IBCT)
 . I $P(Z,U,10) D
 .. S IBCT=IBCT+1
 .. S Z1=$J("",23)_$P(Z,U,10)
 . S IBCT=IBCT+1
 . S Z1=$J("",23)_$P(Z,U,6)_$S($P(Z,U,6)'="":", ",1:"")_$S($P(Z,U,7):$$EXTERNAL^DILFD(355.93,.07,"",$P(Z,U,7))_"  ",1:"")_$P(Z,U,8) D SET1(.IBLCT,Z1,IBCT)
 K VALMBG,VALMCNT
 S VALMBG=1,VALMCNT=IBLCT
 Q
 ;
SET1(IBLCT,TEXT,IBCT) ;
 S IBLCT=IBLCT+1 D SET^VALM10(IBLCT,TEXT,$G(IBCT))
 Q
EXPND ;
 Q
 ;
HELP ;
 Q
 ;
EXIT ;
 K ^TMP("IBCE_PRVNVA_MAINT",$J)
 D CLEAN^VALM10
 Q
 ;
EDIT1(IBNPRV,IBNOLM) ; Edit non-VA provider/facility demographics
 ; IBNPRV = ien of entry in file 355.93
 ; IBNOLM = 1 if not called from list manager
 ;
 N DA,X,Y,DIE,DR,IBP
 I '$G(IBNOLM) D FULL^VALM1
 I IBNPRV D
 . I '$G(IBNOLM) D CLEAR^VALM1
 . S DIE="^IBA(355.93,",DA=IBNPRV,IBP=($P($G(^IBA(355.93,IBNPRV,0)),U,2)=2)
 . S DR=".01;"_$S(IBP:".03;.04",1:".05;.1;.06;.07;.08;.09;.11")
 . D ^DIE
 . Q:$G(IBNOLM)
 . D BLD
 I '$G(IBNOLM) K VALMBCK S VALMBCK="R"
 Q
 ;
EDITID(IBNPRV) ; Link from this list template to maintain provider-specific ids
 ; IBNPRV = ien of entry in file 355.93
 N IBPRV
 D FULL^VALM1
 D CLEAR^VALM1
 S IBPRV=IBNPRV
 D EN1^IBCEP5
 K VALMQUIT
 S VALMBCK="R"
 Q
 ;
NVAFAC ; Enter/edit Non-VA facility information
 N X,Y,DA,DIC,IBNPRV,DLAYGO
 S DIC="^IBA(355.93,",DIC("S")="I $P(^(0),U,2)=1",DIC("DR")=".02////1"
 S DLAYGO=355.93,DIC(0)="AELMQ",DIC("A")="Select a NON/Other VA FACILITY: "
 D ^DIC K DIC,DLAYGO
 I Y'>0 S VALMQUIT=1 G NVAFACQ
 S IBNPRV=+Y
 D EDIT1(IBNPRV,1)
 ;
NVAFACQ Q
 ;
GETFAC(IB,IBFILE,IBELE) ; Returns facility name,address lines or city-state-zip
 ; IB = ien of entry in file
 ; IBFILE = 0 for retrieval from file 4, 1 for retrieval from file 355.93
 ; If IBELE=0, returns name
 ;         =1, returns address line 1
 ;         =2, returns address line 2
 ;         =3, returns city, state zip
 ;         = "3C", returns city  = "3S", state    = "3Z", zip
 ;
 N Z,IBX
 S IBX=""
 S Z=$S('IBFILE:$G(^DIC(4,+IB,1)),1:$G(^IBA(355.93,+IB,0)))
 I +IBELE=0 S IBX=$S('IBFILE:$P($G(^DIC(4,+IB,0)),U),1:$P($G(^IBA(355.93,+IB,0)),U))
 I IBELE=1!(IBELE=12) S IBX=$S('IBFILE:$P(Z,U),1:$P(Z,U,5))
 I IBELE=2!(IBELE=12) S IBX=$S(IBELE=12:IBX_" ",1:"")_$S('IBFILE:$P(Z,U,2),1:$P(Z,U,10))
 I +IBELE=3,'IBFILE D
 . S:IBELE=3!(IBELE["C") IBX=$P(Z,U,3) Q:IBELE["C"
 . S:IBELE=3 IBX=IBX_$S(IBX'="":", ",1:"") S:IBELE=3!(IBELE["S") IBX=IBX_$$STATE^IBCEFG1($P($G(^DIC(4,+IB,0)),U,2)) Q:IBELE["S"
 . S:IBELE=3 IBX=IBX_" " S:IBELE=3!(IBELE["Z") IBX=IBX_$P(Z,U,4)
 I +IBELE=3,IBFILE D
 . S:IBELE=3!(IBELE["C") IBX=$P(Z,U,6) Q:IBELE["C"
 . S:IBELE=3 IBX=IBX_$S(IBX'="":", ",1:"") S:IBELE=3!(IBELE["S") IBX=IBX_$$STATE^IBCEFG1($P(Z,U,7))
 . S:IBELE=3 IBX=IBX_" " S:IBELE=3!(IBELE["Z") IBX=IBX_$P(Z,U,8)
 Q IBX
 ;
ALLID(IBPRV,IBPTYP,IBZ) ; Returns array IBZ for all ids for provider IBPRV
 ; for all provider id types or for id type in IBPTYP
 ; IBPRV = vp ien of provider
 ; IBPTYP = ien of provider id type to return or "" for all
 ; IBZ = array returned with internal data:
 ;  IBZ(file 355.9 ien)=ID type^ID#^ins co^form typ^bill care typ^care un^X12 code for id type
 N Z,Z0
 K IBZ
 G:'$G(IBPRV) ALLIDQ
 S IBPTYP=$G(IBPTYP)
 S Z=0 F  S Z=$O(^IBA(355.9,"B",IBPRV,Z)) Q:'Z  S Z0=$G(^IBA(355.9,Z,0)) D
 . I $S(IBPTYP="":1,1:($P(Z0,U,6)=IBPTYP)) S IBZ(Z)=($P(Z0,U,6)_U_$P(Z0,U,7)_U_$P(Z0,U,2)_U_$P(Z0,U,4)_U_$P(Z0,U,5)_U_$P(Z0,U,3))_U_$P($G(^IBE(355.97,+$P(Z0,U,6),0)),U,3)
 ;
ALLIDQ Q
 ;
CLIA() ; Returns ien of CLIA # provider id type
 N Z,IBZ
 S (IBZ,Z)=0 F  S Z=$O(^IBE(355.97,Z)) Q:'Z  I $P($G(^(Z,0)),U,3)="X4",$P(^(0),U)["CLIA" S IBZ=Z Q
 Q IBZ
 ;
STLIC() ; Returns ien of STLIC# provider id type
 N Z,IBZ
 S (IBZ,Z)=0 F  S Z=$O(^IBE(355.97,Z)) Q:'Z  I $P($G(^(Z,1)),U,3) S IBZ=Z Q
 Q IBZ
 ;
TAXID() ; Returns ien of Fed tax id provider id type
 N Z,IBZ
 S (IBZ,Z)=0 F  S Z=$O(^IBE(355.97,Z)) Q:'Z  I $P($G(^(Z,1)),U,4) S IBZ=Z Q
 Q IBZ
 ;
CLIANVA(IBIFN) ; Returns CLIA # for a non-VA facility on bill ien IBIFN
 N IBCLIA,IBZ,IBNVA,Z
 S IBCLIA="",IBZ=$$CLIA()
 I IBZ D
 . S IBNVA=$P($G(^DGCR(399,IBIFN,"U2")),U,10) Q:'IBNVA
 . S IBCLIA=$$IDFIND^IBCEP2(IBIFN,IBZ,IBNVA_";IBA(355.93,")
 Q IBCLIA
 ;
VALFAC(X) ; Function returns 1 if format is valid for X12 facility name
 ; Alpha/numeric/certain punctuation valid.  Must start with an Alpha
 N OK,VAL
 S OK=1
 S VAL("A")="",VAL("N")="",VAL=",.- "
 I $E(X)'?1A!'$$VALFMT(X,.VAL) S OK=0
 Q OK
 ;
VALFMT(X,VAL) ; Returns 1 if format of X is valid, 0 if not
 ; X = data to be examined
 ; VAL = a 'string' of valid characters AND/OR (passed by reference)
 ;    if VAL("A") defined ==> Alpha
 ;    if VAL("A") defined ==> Numeric valid
 ;    if VAL("A") defined ==> Punctuation valid
 ;   any other character included in the string is checked individually
 N Z
 I $D(VAL("A")) D
 . N Z0
 . F Z=1:1:$L(X) I $E(X,Z)?1A S Z0(Z)=""
 . S Z0="" F  S Z0=$O(Z0(Z0),-1) Q:'Z0  S $E(X,Z0)=""
 I $D(VAL("N")) D
 . N Z0
 . F Z=1:1:$L(X) I $E(X,Z)?1N S Z0(Z)=""
 . S Z0="" F  S Z0=$O(Z0(Z0),-1) Q:'Z0  S $E(X,Z0)=""
 I $D(VAL("P")) D
 . N Z0
 . F Z=1:1:$L(X) I $E(X,Z)?1P S Z0(Z)=""
 . S Z0="" F  S Z0=$O(Z0(Z0),-1) Q:'Z0  S $E(X,Z0)=""
 I $G(VAL)'="" S X=$TR(X,VAL,"")
 Q (X="")
 ;
PS(IBXSAVE) ; Returns 1 if IBXSAVE("PSVC") indicates the svc was non-lab
 ; 
 Q $S($G(IBXSAVE("PSVC"))="":0,1:"13"[IBXSAVE("PSVC"))
 ;
