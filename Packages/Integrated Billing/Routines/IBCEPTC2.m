IBCEPTC2 ;ALB/TMK - EDI PREVIOUSLY TRANSMITTED CLAIMS LIST MGR ;01/20/05
 ;;2.0;INTEGRATED BILLING;**296**;21-MAR-94
 ;
HDR ;
 K VALMHDR
 S VALMHDR(1)="** A claim may appear multiple times if transmitted more than once. **"
 I $G(IBSORT)=1 D
 . S VALMHDR(2)=">>># of Claims Selected: "_+$G(^TMP("IB_PREV_CLAIM_SELECT",$J))_" (marked with *)"
 I $G(IBSORT)=2 D
 . S VALMHDR(2)=" ** T=claim was only sent as a test claim   ** R=batch was rejected"
 . S VALMHDR(3)=" >>># of Claims Selected: "_+$G(^TMP("IB_PREV_CLAIM_SELECT",$J))_" (marked with *)"
 ;
 Q
 ;
INIT ;
 S VALMCNT=0,VALMBG=1
 D BLD
 Q
 ;
BLD ; Build display lines
 N IBDA,IBS1,IBS2,IBIFN,IB0,IBX,IBCNT,IBLEV1,IBBDA
 K ^TMP("IB_PREV_CLAIM_LIST",$J),^TMP("IB_PREV_CLAIM_SELECT",$J),^TMP("IB_PREV_CLAIM_BATCH",$J)
 S IBCNT=0
 I $O(^TMP("IB_PREV_CLAIM",$J,""))="" D  G BLDQ
 . S IBX=" ** NO PREVIOUSLY TRANSMITTED CLAIMS EXIST FOR SEARCH CRITERIA SELECTED **"
 . D WRT(IBX,"",0,0,"","S","",.IBCNT,0)
 ;
 S IBS1="" F  S IBS1=$O(^TMP("IB_PREV_CLAIM",$J,IBS1)) Q:IBS1=""  D
 . ; First level sort
 . I IBSORT=1 S IBLEV1="Batch: "_$P(IBS1,U,2)_"  Date Last Transmitted: "_$G(^TMP("IB_PREV_CLAIM",$J,IBS1)),IBBDA=+$O(^IBA(364.1,"B",$P(IBS1,U,2),0)) D
 .. I $P(IBS1,U,3) S IBLEV1=IBLEV1_" ** Test"
 .. I $P(IBS1,U,4) S IBLEV1=IBLEV1_" ** Rejected"
 . I IBSORT=2 D
 .. S IBLEV1="Insurance Co: "_$P(IBS1,U)_"  "_$$CURRINS(+$G(^TMP("IB_PREV_CLAIM",$J,IBS1)))
 . D WRT(IBLEV1,"",0,0,IBSORT,"S","",IBCNT,0) ; Add header line
 . ;
 . I IBSORT=1,IBBDA S ^TMP("IB_PREV_CLAIM_BATCH",$J,IBBDA)=VALMCNT
 . S IBS2="" F  S IBS2=$O(^TMP("IB_PREV_CLAIM",$J,IBS1,IBS2)) Q:IBS2=""  S IBDA=0 F  S IBDA=$O(^TMP("IB_PREV_CLAIM",$J,IBS1,IBS2,IBDA)) Q:'IBDA  D
 .. S IBIFN=+$G(^IBA(364,+IBDA,0)),IB0=$G(^DGCR(399,IBIFN,0))
 .. D WRT(IBS1,IBS2,IBDA,IBIFN,IBSORT,"S","",.IBCNT,0)
 .. I IBSORT=1,IBBDA S ^TMP("IB_PREV_CLAIM_BATCH",$J,IBBDA,VALMCNT)=IBIFN_U_IBCNT
 ;
BLDQ Q
 ;
EXIT ; Clean up code
 ;
 K ^TMP("IB_PREV_CLAIM_LIST",$J)
 K ^TMP("IB_PREV_CLAIM_SELECT",$J)
 K ^TMP("IB_PREV_CLAIM_LIST_DX",$J)
 K ^TMP("IB_PREV_CLAIM_BATCH",$J)
 D CLEAR^VALM1
 Q
 ;
SELECT ; Select claims to resubmit
 N IBIFN,IBZ,IBI,IBQ,DIR,VALMY,X,Y
 D FULL^VALM1
 D EN^VALM2($G(XQORNOD(0)))
 S IBZ=0 F  S IBZ=$O(VALMY(IBZ)) Q:'IBZ  D
 . S IBQ=$G(^TMP("IB_PREV_CLAIM_LIST_DX",$J,IBZ)),IBI=+$P(IBQ,U,2),IBQ=+IBQ
 . S IBIFN=+$G(^IBA(364,IBI,0))
 . Q:'IBIFN
 . D MARK(IBIFN,IBZ,IBQ,IBI,1,.VALMHDR)
 S VALMBCK="R"
 Q
 ;
SELBATCH ; Select a batch to resubmit
 N DIC,DIR,X,Y,Z,IBQ,IBZ,IBI,IBDX,IBASK,IBOK,IBY,DTOUT,DUOUT
 D FULL^VALM1
 I IBSORT'=1 D  G SELBQ
 . S DIR(0)="EA",DIR("A",1)="This action is not available unless you chose to sort by batch",DIR("A")="Press return to continue: "
 . W ! D ^DIR K DIR
 S DIC="^IBA(364.1,",DIC(0)="AEMQ",DIC("S")="I $D(^TMP(""IB_PREV_CLAIM_BATCH"",$J,+Y))"
 D ^DIC K DIC
 I Y'>0 G SELBQ
 S IBY=+Y,VALMBG=+$G(^TMP("IB_PREV_CLAIM_BATCH",$J,IBY))
 ;
 S (IBOK,IBASK)=1
 I $G(^TMP("IB_PREV_CLAIM_BATCH",$J,IBY,"SEL")) D  G:'IBOK SELBQ
 . S DIR(0)="YA",DIR("A",1)="This batch was previously selected.",DIR("A")="Do you want to de-select all claims in this batch?: ",DIR("B")="No"
 . W ! D ^DIR K DIR
 . I $D(DTOUT)!$D(DUOUT) S IBOK=0 Q
 . I Y S IBASK=0 K ^TMP("IB_PREV_CLAIM_BATCH",$J,IBY,"SEL")
 ;
 S IBQ=0      ; last screen row# for claim
 F  S IBQ=$O(^TMP("IB_PREV_CLAIM_BATCH",$J,IBY,IBQ)) Q:'IBQ  D
 . S IBZ=$G(^(IBQ))      ; IBIFN^selection#
 . S Z=$P(IBZ,U,2)       ; selection#
 . S IBDX=$G(^TMP("IB_PREV_CLAIM_LIST_DX",$J,+Z))   ; 1st screen row# for claim^364 ien
 . S IBI=$P(IBDX,U,2)    ; 364 ien
 . D MARK(+IBZ,Z,+IBDX,IBI,IBASK,.VALMHDR)
 ;
 I IBASK S ^TMP("IB_PREV_CLAIM_BATCH",$J,IBY,"SEL")=1
 ;
SELBQ S VALMBCK="R"
 Q
 ;
MARK(IBIFN,IBZ,IBQ,IBI,IBASK,VALMHDR) ; Mark claim as selected for resubmit
 ; Returns VALMHDR killed if any selections/de-selections made
 N DIR,X,Y
 I $D(^TMP("IB_PREV_CLAIM_SELECT",$J,IBIFN)) D  Q
 . S Y=1
 . I IBASK D
 .. S DIR(0)="YA",DIR("B")="No",DIR("A",1)="Claim "_$P($G(^DGCR(399,IBIFN,0)),U)_" for entry # "_IBZ_" has already been selected",DIR("A")="Do you want to de-select it?: " W ! D ^DIR K DIR
 . I Y=1 K ^TMP("IB_PREV_CLAIM_SELECT",$J,IBIFN) S $E(^TMP("IB_PREV_CLAIM_LIST",$J,IBQ,0),6)=" ",^TMP("IB_PREV_CLAIM_SELECT",$J)=^TMP("IB_PREV_CLAIM_SELECT",$J)-1 K VALMHDR
 ;
 S ^TMP("IB_PREV_CLAIM_SELECT",$J,IBIFN)=IBQ,^TMP("IB_PREV_CLAIM_SELECT",$J,IBIFN,0)=IBI,^TMP("IB_PREV_CLAIM_SELECT",$J)=$G(^TMP("IB_PREV_CLAIM_SELECT",$J))+1
 S $E(^TMP("IB_PREV_CLAIM_LIST",$J,IBQ,0),6)="*" K VALMHDR
 Q
 ;
VIEW ; View claims selected
 N IBCT,IBQUIT,DIR,X,Y,Z,Z0
 D FULL^VALM1
 I '$O(^TMP("IB_PREV_CLAIM_SELECT",$J,0)) D  G VIEWQ
 . S DIR(0)="EA",DIR("A")="No claims have been selected - Press return to continue " D ^DIR K DIR
 W @IOF
 S (IBQUIT,IBCT)=0
 W !,+^TMP("IB_PREV_CLAIM_SELECT",$J)," claims selected:"
 S Z="" F  S Z=$O(^TMP("IB_PREV_CLAIM_SELECT",$J,Z)) Q:'Z  S Z0=+$G(^(Z)) D
 . Q:'$D(^TMP("IB_PREV_CLAIM_LIST",$J,Z0,0))
 . S IBCT=IBCT+1
 . I '(IBCT#15) S IBQUIT=0 D  Q:IBQUIT
 .. S DIR(0)="E" D ^DIR K DIR
 .. I 'Y S IBQUIT=1
 . W !,"  ",$E(^TMP("IB_PREV_CLAIM_LIST",$J,Z0,0),7,51)
 ;
 G:IBQUIT VIEWQ
 S DIR(0)="E" D ^DIR K DIR
 ;
VIEWQ S VALMBCK="R"
 Q
 ;
RESUB ; Resubmit selected claims
 N DIR,X,Y,Z,Z0,Z1
 D FULL^VALM1
 I '$O(^TMP("IB_PREV_CLAIM_SELECT",$J,0)) D  S VALMBCK="R" G RESUBQ
 . N DIR,X,Y
 . S DIR(0)="EA",DIR("A")="No claims have been selected - Press return to continue " D ^DIR K DIR
 ;
 S DIR(0)="YA",DIR("B")="No",DIR("A",1)="You are about to resubmit "_+^TMP("IB_PREV_CLAIM_SELECT",$J)_" claims as TEST",DIR("A")="Are you sure you want to continue?: " W ! D ^DIR K DIR
 I Y'=1 S VALMBCK="R" G RESUBQ
 ;
RESUB1 ; Entrypoint to resubmit on exit
 W !,"Resubmission in process ..."
 S ^TMP("IBEDI_TEST_BATCH",$J)=1
 S Z=0 F  S Z=$O(^TMP("IB_PREV_CLAIM_SELECT",$J,Z)) Q:'Z  S Z1=+$G(^(Z)),Z0=+$G(^(Z,0)) I Z0 D
 . S ^TMP("IBEDI_TEST_BATCH",$J,Z0)=""
 . S:Z1 $E(^TMP("IB_PREV_CLAIM_LIST",$J,Z1,0),6)=" "
 ;
 M ^TMP("IBRESUBMIT",$J)=^TMP("IBEDI_TEST_BATCH",$J)
 S ^TMP("IBRESUBMIT",$J)="^^0^1"
 D ONE^IBCE837
 K ^TMP("IBEDI_TEST_BATCH",$J),^TMP("IBRESUBMIT",$J),^TMP("IB_PREV_CLAIM_SELECT",$J)
 S DIR(0)="EA",DIR("A",1)="Selected claims have been resubmitted as TEST",DIR("A")="Press return to continue " W ! D ^DIR K DIR
 K VALMHDR S VALMBCK="R"
 ;
RESUBQ Q
 ;
REPORT ; Print report
 ; Assumes IBSORT, IBDT1, IBDT2 defined
 N IBACT,Z
 D FULL^VALM1
 F  S IBACT=0 D DEVSEL^IBCEPTC(.IBACT) Q:IBACT 
 I IBACT'=99 D
 . N IBREP
 . S IBREP="R" D RPT^IBCEPTC1(IBSORT,IBDT1,IBDT2)
 ;
 D HOME^%ZIS
 S VALMBCK="R"
 Q
 ;
WRT(IBS1,IBS2,IBDA,IBIFN,IBSORT,IBREP,IBHDR,IBPAGE,IBSTOP) ; Wrt/output
 ;
 N IBX,IB0,Z,IBCNT
 S IBCNT=IBPAGE
 ;
 I 'IBIFN D  G WRTQ
 . I IBREP="R" D  Q
 .. S Z="",$P(Z,"=",133)=""
 .. D SET(Z,1,IBDA,IBREP,IBHDR,1,0,.IBPAGE,.IBSTOP)
 .. D SET(IBS1,2,IBDA,IBREP,IBHDR,1,0,.IBPAGE,.IBSTOP)
 . D SET(IBS1,0,IBDA,IBREP,IBHDR,IBCNT+1,.VALMCNT,.IBPAGE,.IBSTOP)
 ;
 S IB0=$G(^DGCR(399,IBIFN,0))
 S IBX=$E($P(IB0,U)_$J("",8),1,8)
 S IBX=IBX_$S(IBSORT=2&$P($G(^IBA(364,+IBDA,0)),U,7):"T",1:" ")
 S IBX=IBX_" "
 S IBX=IBX_$S($P(IB0,U,19)=2:"HCFA",1:"UB92")_"  "
 S Z=$$INPAT^IBCEF(IBIFN) S IBX=IBX_$S(Z:"INPT ",1:"OUTPT")_"  "
 S IBX=IBX_$J($P(IB0,U,21),3)_"  "
 S IBX=IBX_$E($$EXTERNAL^DILFD(399,.13,"",$P(IB0,U,13))_$J("",15),1,15)_"  "
 ;
 I IBSORT=1 D
 . N Z,IBZ,IBXDATA
 . ; Print current payer, payer address, other payers
 . D F^IBCEF("N-CURR INSURANCE COMPANY NAME","IBZ",,IBIFN)
 . S IBX=IBX_$E(IBZ_$J("",25),1,25)_"    "
 . S IBX=IBX_$$CURRINS(IBIFN)
 . K IBZ D F^IBCEF("N-OTH INSURANCE CO. NAME","IBZ",,IBIFN)
 . F Z=1,2 D
 .. I Z=1 S IBX=IBX_$E($P($G(IBZ(1)),U),1,19),IBCNT=IBCNT+1 D SET(.IBX,1,IBDA,IBREP,IBHDR,IBCNT,.VALMCNT,.IBPAGE,.IBSTOP) S IBX=""
 .. I Z=2,$G(IBZ(2))'="" S IBX=$J("",108)_$E($P(IBZ(2),U),1,21) D SET(.IBX,1,IBDA,IBREP,IBHDR,IBCNT,.VALMCNT,.IBPAGE,.IBSTOP)
 ;
 I IBSORT=2 D
 . N Z,IBZ
 . ; Print other payers, date last trans, batch #, reject flag
 . D F^IBCEF("N-OTH INSURANCE CO. NAME","IBZ",,IBIFN)
 . S IBX=IBX_$E($P($G(IBZ(1)),U)_$J("",25),1,25)_"    "
 . S Z=+$P($G(^IBA(364,+IBDA,0)),U,2) ; Batch ptr
 . S IBX=IBX_$E($$FMTE^XLFDT($P($G(^IBA(364.1,+Z,1)),U,3)\1,"1")_$J("",21),1,21)_"  "
 . S IBX=IBX_$E($P($G(^IBA(364.1,Z,0)),U)_$J("",10),1,10)_$S($P($G(^IBA(364.1,Z,0)),U,5):" R",1:"")
 . S IBCNT=IBCNT+1 D SET(.IBX,1,IBDA,IBREP,IBHDR,IBCNT,.VALMCNT,.IBPAGE,.IBSTOP)
 . I $G(IBZ(2))'="" S IBX=$J("",45) S IBX=IBX_$E($P(IBZ(2),U),1,25) D SET(.IBX,1,IBDA,IBREP,IBHDR,IBCNT,.VALMCNT,.IBPAGE,.IBSTOP)
 ;
WRTQ I IBREP="S" S IBPAGE=IBCNT
 Q
 ;
SET(IBX,IBLINE,IBDA,IBREP,IBHDR,IBCNT,VALMCNT,IBPAGE,IBSTOP) ;
 N Q,Z,IBZ
 S IBZ=IBX,IBX=""
 I IBREP="R" D  Q
 . D:($Y+5)>IOSL!'IBPAGE HDR^IBCEPTC1(IBHDR,IBSORT,.IBPAGE,.IBSTOP) D
 . I IBLINE F Z=1:1:IBLINE W !
 . W:'IBSTOP IBZ
 . Q
 ; only display the counter if we have a line with the claim#
 S VALMCNT=VALMCNT+1,^TMP("IB_PREV_CLAIM_LIST",$J,VALMCNT,0)=$S(IBDA&($TR($E(IBZ,1,8)," ")'=""):$E(IBCNT_"     ",1,5)_" ",1:$J("",6))_IBZ
 S ^TMP("IB_PREV_CLAIM_LIST",$J,"IDX",VALMCNT,IBCNT)=""
 I IBDA,$TR($E(IBZ,1,8)," ")'="" S ^TMP("IB_PREV_CLAIM_LIST_DX",$J,IBCNT)=VALMCNT_U_IBDA
 Q
 ;
CURRINS(IBIFN) ; Returns Current insurance address
 N IBX,IBZ
 D F^IBCEF("N-CURR INS CO FULL ADDRESS","IBZ",,IBIFN)
 S IBX=$E($E($G(IBZ(1)),1,25)_" "_$G(IBZ(4))_" "_$P($G(^DIC(5,+$G(IBZ(5)),0)),U,2)_$J("",32),1,32)_"  "
 Q IBX
 ;
CKSENT(VALMBCK) ; Make sure selected entries are transmitted
 ;
 N IBOK,DIR,X,Y
 S IBOK=1
 I $O(^TMP("IB_PREV_CLAIM_SELECT",$J,0)) D
 . D FULL^VALM1
 . S DIR(0)="YA",DIR("A",1)="You have selected "_+$G(^TMP("IB_PREV_CLAIM_SELECT",$J))_" claims, but have not resubmitted them",DIR("A")="Are you sure you want to quit before you resubmit them?: ",DIR("B")="No"
 . W ! D ^DIR K DIR
 . I Y'=1 S VALMBCK="R",IBOK=0
 I IBOK S VALMBCK="Q"
 Q
 ;
