IBCEP5 ;ALB/TMP - EDI UTILITIES for provider ID ;29-SEP-00
 ;;2.0;INTEGRATED BILLING;**137,232**;21-MAR-94
 ;
EN ; -- main entry point for IBCE PRV MAINT
 N IBPRV,IBINS
EN1 ; Entrypoint for non-VA provider ID maintenance hook
 N IBSLEV,DIR,Y,X
 D FULL^VALM1
 S DIR(0)="SA^1:PROVIDER'S OWN IDS;2:PROVIDER IDS FURNISHED BY AN INSURANCE COMPANY",DIR("A")="SELECT SOURCE OF ID: ",DIR("B")=$P($P(DIR(0),":",2),";")
 W ! D ^DIR K DIR W !
 I Y'>0 Q
 S IBSLEV=+Y
 D EN^VALM("IBCE PRVPRV MAINT")
 Q
 ;
HDR ; -- header code
 N IBC,Z
 K VALMHDR
 S IBC=1
 S Z="** "_$S($G(IBSLEV)=1:"Provider's Own IDs (No Specific Insurance Co)",1:"Provider IDs Furnished by Insurance Co")_" **"
 S VALMHDR(IBC)=$J("",80-$L(Z)\2)_Z,IBC=IBC+1
 I $G(IBPRV) S VALMHDR(IBC)="PROVIDER    : "_$$EXPAND^IBTRE(355.9,.01,IBPRV)_$S(IBPRV["VA(200":" (VA PROVIDER)",1:" (NON-VA PROVIDER)"),IBC=IBC+1
 I $G(IBINS) S VALMHDR(IBC)="INSURANCE CO: "_$P($G(^DIC(36,+IBINS,0)),U)
 Q
 ;
INIT ; -- init variables and list array
 N IBFILE,DIR,DIC,Y,X,DTOUT,DUOUT
 I $G(IBPRV) S IBFILE="IBA(355.93,",IBPRV=+IBPRV_";"_IBFILE
 I '$G(IBPRV) D  G:$G(VALMQUIT) INITQ
 . S DIR(0)="SAO^V:VA PROVIDER;N:NON-VA PROVIDER",DIR("A")="(V)A or (N)on-VA provider: ",DIR("B")="V"
 . D ^DIR K DIR
 . I "NV"'[Y!(Y="") S VALMQUIT=1 Q
 . S IBFILE=$S(Y="V":"VA(200,",1:"IBA(355.93,")
 . S DIC=U_IBFILE,DIC(0)="AEMQ"_$S(IBFILE["355.93":"L",1:"")
 . S DIC("A")="Select "_$S(IBFILE["355.93":"NON-",1:"")_"V.A. PROVIDER NAME: "
 . S:IBFILE["355.93" DIC("DR")=".02////2;.03;.04"
 . F  D  I $G(IBPRV)!$G(VALMQUIT) K DIC Q
 .. D ^DIC
 .. I $D(DTOUT)!$D(DUOUT) S VALMQUIT=1 Q
 .. I Y'>0 W !,*7,"This is a required response. Enter '^' to exit" Q
 .. S IBPRV=+Y_";"_IBFILE
 I $G(IBSLEV)=2 D
 . S DIR(0)="PA^DIC(36,:AEMQ",DIR("A")="Select INSURANCE CO: ",DIR("?",1)="Select an INSURANCE CO to display its provider ID's"
 . D ^DIR K DIR
 . S IBINS=$S(Y>0:+Y,1:"NO")
 E  D
 . S IBINS="NO"
 D BLD
INITQ Q
 ;
BLD ;  Build initial display
 ; Assumes IBPRV = the variable ptr for prov id file (355.9)
 ;         IBINS = the ien of the ins co or if null, ALL is assumed
 ;         IBSLEV = 1 to display only provider default ids
 ;                = 2 to display all provider/insurance co ids
 N IB,IBLCT,IBCT,CT,PT,CU,INS,FT,Z,IBENT,IB1
 K ^TMP("IBPRV_",$J),^TMP("IBPRV_SORT",$J)
 K Z0
 S (IBENT,IBCT,IBLCT)=0,INS="",IB1=1
 F  S INS=$S($G(IBINS):IBINS,IBSLEV=1:"*ALL*",1:$O(^IBA(355.9,"AUNIQ",IBPRV,INS))) Q:$S(INS="":1,$G(IBINS)!(IBSLEV=1):$D(CU),1:0)  S CU="",IB1=0 F  S CU=$O(^IBA(355.9,"AUNIQ",IBPRV,INS,CU)) Q:CU=""  D
 . S FT="" F  S FT=$O(^IBA(355.9,"AUNIQ",IBPRV,INS,CU,FT)) Q:FT=""  S CT="" F  S CT=$O(^IBA(355.9,"AUNIQ",IBPRV,INS,CU,FT,CT)) Q:CT=""  S PT=0 F  S PT=$O(^IBA(355.9,"AUNIQ",IBPRV,INS,CU,FT,CT,PT)) Q:'PT  D
 .. S Z=0 F  S Z=$O(^IBA(355.9,"AUNIQ",IBPRV,INS,CU,FT,CT,PT,Z)) Q:'Z  S IB=$G(^IBA(355.9,Z,0)) D
 ... S ^TMP("IBPRV_SORT",$J,$S(INS:$P($G(^DIC(36,+INS,0)),U)_" ",1:" ALL"),PT,FT,CT,CU,Z)=$P(IB,U,7)
 ;
 I IBSLEV=1,IBPRV["IBA(355.93",$P($G(^IBA(355.93,+IBPRV,0)),U,12)'="" S ^TMP("IBPRV_SORT",$J," ALL",+$$STLIC^IBCEP8(),0,0,"*N/A*",0)=$P(^IBA(355.93,+IBPRV,0),U,12)
 S INS="" F  S INS=$O(^TMP("IBPRV_SORT",$J,INS)) Q:INS=""  D
 . I '$G(IBINS) D:IBLCT SET^VALM10(IBLCT+1," ",IBCT) S IBLCT=$S(IBLCT:IBLCT+2,1:1) D SET^VALM10(IBLCT,"INSURANCE CO: "_$S($E(INS)=" ":"ALL INSURANCE",1:INS),$S(IBCT:IBCT,1:1))
 . S PT=""
 . F  S PT=$O(^TMP("IBPRV_SORT",$J,INS,PT)) Q:PT=""  S FT="" F  S FT=$O(^TMP("IBPRV_SORT",$J,INS,PT,FT)) Q:FT=""  S CT="" F  S CT=$O(^TMP("IBPRV_SORT",$J,INS,PT,FT,CT)) Q:CT=""  D
 .. S CU="" F  S CU=$O(^TMP("IBPRV_SORT",$J,INS,PT,FT,CT,CU)) Q:CU=""  S Z="" F  S Z=$O(^TMP("IBPRV_SORT",$J,INS,PT,FT,CT,CU,Z)) Q:Z=""  S IB=$G(^(Z)) D
 ... S IBLCT=IBLCT+1,IBCT=IBCT+1
 ... S Z0=$E(IBCT_"     ",1,4)_" "_$E($$EXPAND^IBTRE(355.9,.06,PT)_$S(PT=$$STLIC^IBCEP8():"("_$P($G(^DIC(5,+$P($G(^IBA(355.93,+IBPRV,0)),U,7),0)),U,2)_")",1:"")_$J("",20),1,20)_"  "_$S(FT=1:"UB-92",FT=2:"HCFA ",1:"BOTH ")
 ... S Z0=Z0_"  "_$E($S(CT=3:"RX",CT=1:"INPT",CT=2:"OUTPT",1:"INPT/OUTPT")_$J("",11),1,11)
 ... S Z0=Z0_"  "_$E($S(CU'="*N/A*":$P($G(^IBA(355.95,CU,0)),U),1:"")_$J("",15),1,15)
 ... D SET^VALM10(IBLCT,Z0_" "_IB,IBCT)
 ... S ^TMP("IBPRV_",$J,"ZIDX",IBCT)=$S(Z'=0:Z,1:"LIC^"_IBPRV)
 I IBSLEV=1,IBPRV["VA(200" D
 . N IBP
 . S IBP=+IBPRV
 . Q:'$$GETLIC^IBCEP5D(.IBP)
 . I IBCT S IBLCT=IBLCT+1 D SET^VALM10(IBLCT," ",IBCT)
 . S Z=0 F  S Z=$O(IBP(Z)) Q:'Z  D
 .. S IBLCT=IBLCT+1,IBCT=IBCT+1
 .. D SET^VALM10(IBLCT,$E(IBCT_"     ",1,4)_$E($P($G(^DIC(5,+Z,0)),U,2)_" STATE LICENSE #"_$J("",20),1,20)_$J("",39)_IBP(Z),IBCT)
 .. S ^TMP("IBPRV_",$J,"ZIDX",IBCT)="LIC^"_+IBPRV
 K ^TMP("IBPRV_SORT",$J)
 ;
 I IBLCT=0 D  G BLDQ ; No entries for ins co selected
 . D SET^VALM10(1," ")
 . D SET^VALM10(2,"  No ID's found for provider "_$S('$G(IBINS):"",1:"and selected insurance co"))
 . S IBLCT=2
 ;
BLDQ K VALMCNT,VALMBG
 S VALMCNT=IBLCT,VALMBG=1
 Q
 ;
HELP ; -- help code
 S X="?" D DISP^XQORM1 W !!
 Q
 ;
EXIT ; -- exit code
 K IBPRV
 D CLEAN^VALM10
 K ^TMP("IBPRV_",$J),^TMP("IBPRV_SORT",$J),IBINS,IBALL
 Q
 ;
EXPND ; -- expand code
 Q
 ;
SEL(IBDA,MANY) ; Select from provider id list
 ; IBDA is passed by reference and IBDA(1) returned containing
 ;  ien's of the provider id records selected (file 355.9).
 ; If > 1 entry can be selected, MANY is set to 1
 N Z
 S IBDA=0
 D EN^VALM2($G(XQORNOD(0)),$S($G(MANY):"",1:"S"))
 S Z=0 F  S Z=$O(VALMY(Z)) Q:'Z  S IBDA=IBDA+1,IBDA(IBDA)=$G(^TMP("IBPRV_",$J,"ZIDX",Z))
 Q
 ;
