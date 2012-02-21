IBCEXTRP ;ALB/JEH - VIEW/PRINT EDI EXTRACT DATA ; 4/22/03 9:59am
 ;;2.0;INTEGRATED BILLING;**137,197,211**;21-MAR-94
 ;
EN ;
INIT ;
 W !!,"This option will display the EDI extract data for a bill.",!
 N IBREC1,IBIEN,IBINC,DIC,X,Y,DIR,IB364IEN,IBVNUM
 ;
 N DPTNOFZY S DPTNOFZY=1 ; Suppress PATIENT file fuzzy lookups
 S DIC="^DGCR(399,",DIC(0)="AEMQ",DIC("S")="I 234[$P(^(0),U,13)" D ^DIC
 I Y<1 G EXITQ
 S IBIEN=+Y,IBREC1=$G(^DGCR(399,IBIEN,0))
 S IB364IEN=$$LAST364^IBCEF4(IBIEN) I +$G(IB364IEN)=0 D  G EXITQ
 . W !,"There is no entry in the EDI Transmit Bill file for this bill number."
 S IBVNUM=$P($G(^IBA(364,IB364IEN,0)),U,2) I +$G(IBVNUM)=0 D  G EXITQ
 . W !!,"There is no batch # for this bill.  It has not been transmitted."
 S IBVNUM=$P($G(^IBA(364.1,IBVNUM,0)),U)
 S DIR("A")="INCLUDE FIELDS WITH NO DATA?: ",DIR("B")="NO",DIR(0)="YA" D ^DIR K DIR
 I $D(DTOUT)!$D(DUOUT) G EXITQ
 S IBINC=+Y
DEV ; - Select device
 N %ZIS,ZTRTN,ZTSAVE,ZTDESC
 S %ZIS="QM" D ^%ZIS G:POP EXITQ
 I $D(IO("Q")) D  G EXITQ
 . S ZTRTN="LIST^IBCEXTRP",ZTDESC="Transmitted Bill Extract Data"
 . S ZTSAVE("IB*")=""
 . D ^%ZTLOAD
 . W !!,$S($D(ZTSK):"Your task number "_ZTSK_" has been queued.",1:"Unable to queue this job.")
 .K ZTSK,IO("Q") D HOME^%ZIS
 U IO
 ;
LIST ; - set up array and print data
 N IBPG,IBSEQ,IBPC,IBDA,IBREC,IBQUIT,IBILL,IBLINE,IBXDATA,IBERR,IBXERR,Z,Z0,Z1
 D EXTRACT(IBIEN,IBVNUM,8,1)
 S (IBPG,IBQUIT,IBSEQ,IBPC,IBDA,IBLINE)=0
 K ^TMP($J,"IBLINES")
 ;IB*2.0*211 - rely on form type instead of bill charge type
 ;S IBILL=$S($$INPAT^IBCEF(IBIEN,1):"Inpt",1:"Oupt")_"/"_$S($$INSPRF^IBCEF(IBIEN)=1:"UB92",1:"HCFA")
 N IBFMTYP S IBFMTYP=$$FT^IBCEF(IBIEN)
 S IBFMTYP=$S(IBFMTYP=2:"HCFA",IBFMTYP=3:"UB-92",1:"OTHER"_"("_IBFMTYP_")")
 S IBILL=$S($$INPAT^IBCEF(IBIEN,1):"Inpt",1:"Oupt")_"/"_IBFMTYP
 I $D(^TMP("IBXERR",$J)) D  G EXITQ
 . S IBERR=0 F  S IBERR=$O(^TMP("IBXERR",$J,IBERR)) Q:'IBERR  W !,$G(^TMP("IBXERR",$J,IBERR))
 F  S IBSEQ=$O(^IBA(364.6,"ASEQ",8,IBSEQ)) Q:'IBSEQ!(IBQUIT)  F  S IBPC=$O(^IBA(364.6,"ASEQ",8,IBSEQ,1,IBPC)) Q:'IBPC!(IBQUIT)  F  S IBDA=$O(^IBA(364.6,"ASEQ",8,IBSEQ,1,IBPC,IBDA)) Q:'IBDA!(IBQUIT)  S IBREC=$G(^IBA(364.6,IBDA,0)) D  Q:IBQUIT
 . N IBOK,Z,IBMULT
 . I $P(IBREC,U,11)=1 Q
 . I IBPC=1 S IBOK=0 D
 .. S Z=1 F  S Z=$O(^TMP("IBXDATA",$J,1,IBSEQ,1,Z)) Q:'Z  I $G(^(Z))'="" S IBOK=1 Q
 .. I 'IBOK S $P(^TMP("IBXDATA",$J,1,IBSEQ,1,1),U)=$P($G(^TMP("IBXDATA",$J,1,IBSEQ,1,1)),U)_"  (NO DATA - RECORD NOT SENT)"
 . S IBMULT=0 F  S IBMULT=$O(^TMP("IBXDATA",$J,1,IBSEQ,IBMULT)) Q:'IBMULT   D
 .. I '$G(IBINC),$P($G(^TMP("IBXDATA",$J,1,IBSEQ,IBMULT,IBPC)),U)="" Q
 .. S ^TMP($J,"IBLINES",IBSEQ,IBMULT,IBPC)=$E($P(IBREC,U,10)_$J("",30),1,30)_": "_$P($G(^TMP("IBXDATA",$J,1,IBSEQ,IBMULT,IBPC)),U)
 .
 W:$E(IOST,1,2)["C-" @IOF ; initial form feed for screen print
 ;S IBILL=$S($$INPAT^IBCEF(IBIEN,1):"Inpt",1:"Oupt")_"/"_$S($$INSPRF^IBCEF(IBIEN)=1:"UB92",1:"HCFA")
 N IBFMTYP S IBFMTYP=$$FT^IBCEF(IBIEN)
 S IBFMTYP=$S(IBFMTYP=2:"HCFA",IBFMTYP=3:"UB-92",1:"OTHER"_"("_IBFMTYP_")")
 S IBILL=$S($$INPAT^IBCEF(IBIEN,1):"Inpt",1:"Oupt")_"/"_IBFMTYP
 D HDR
 S Z=0 F  S Z=$O(^TMP($J,"IBLINES",Z)) Q:'Z  S Z0=0 F  S Z0=$O(^TMP($J,"IBLINES",Z,Z0)) Q:'Z0  S Z1=0 F  S Z1=$O(^TMP($J,"IBLINES",Z,Z0,Z1)) Q:'Z1  D  G:IBQUIT Q1
 . D:IBLINE>(IOSL-5) HDR Q:IBQUIT
 . W !,^TMP($J,"IBLINES",Z,Z0,Z1)
 . S IBLINE=IBLINE+1
Q1 K ^TMP($J,"IBLINES")
 Q
 ;
HDR ; - Report header
 N DIR,Y
 I IBPG D  Q:IBQUIT
 . I $E(IOST,1,2)["C-" K DIR S DIR(0)="E" D ^DIR K DIR S IBQUIT=('Y) Q:IBQUIT
 . W @IOF
 ;
 S IBPG=IBPG+1
 W !!,?25,"EDI Transmitted Bill Extract Data",!,"Bill #",?11,"Type",?27,"Patient Name",?52,"SSN",?57,$$FMTE^XLFDT(DT),?71,"Page: "_IBPG
 W !,$TR($J("",IOM)," ","=")
 W !,$P(IBREC1,U)_" "_"("_IBILL_")",?27,$P($G(^DPT(+$P(IBREC1,U,2),0)),U),?52,$P($G(^DPT($P(IBREC1,U,2),0)),U,9),!
 S IBLINE=5
 Q
 ;
ASK ;
 I $E(IOST,1,2)'["C-" Q
 N DIR,DIROUT,DIRUT,DTOUT,DUOUT
 S DIR(0)="E" D ^DIR
 I ($D(DIRUT))!($D(DUOUT)) S IBQUIT=1
 Q
 ;
EXITQ ; - clean up and exit
 I $E(IOST,1,2)["C-" K DIR S DIR(0)="E" W ! D ^DIR K DIR
 K ^TMP("IBXERR",$J),^TMP("IBXDATA",$J),IBXERR
 D CLEAN^DILF
 Q
 ;
EXTRACT(IBIFN,IBBATCH,IBFORM,IBLOCAL) ; Extracts transmitted form data into global
 ; ^TMP("IBXDATA",$J).  Errors are in ^TMP("IBXERR",$J,err_num)=text.
 ; IBBATCH = Batch # of bill (if known), otherwise, set to 1.  This
 ;          variable must be > 0 to prevent a new batch from being added
 ; IBFORM = the ien of the form in file 353
 ; IBLOCAL = 1 if OK to use local form, 0 if not
 N IBVNUM,IBL
 D FORMPRE^IBCFP1
 S IBVNUM=$G(IBBATCH)
 S IBL=$S('$G(IBLOCAL):IBFORM,1:"") ; No local form ... set = main form
 ; Get local form associated with parent, if any
 I IBL="" S IBL=$S($P($G(^IBE(353,+IBFORM,2)),U,8):$P(^(2),U,8),1:IBFORM)
 D SETUP^IBCE837(1)
 D ROUT^IBCFP1(IBFORM,1,IBIFN,0,IBL)
 Q
 ;
