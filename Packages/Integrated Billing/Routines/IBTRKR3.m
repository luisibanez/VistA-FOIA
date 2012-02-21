IBTRKR3 ;ALB/AAS - CLAIMS TRACKING - ADD/TRACK RX FILLS ;13-AUG-93
 ;;2.0;INTEGRATED BILLING;**13,43,121,160,247,275,260,309,336**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
% ; -- entry point for nightly background job
 N IBTSBDT,IBTSEDT
 S IBTSBDT=$$FMADD^XLFDT(DT,-14)-.1
 S IBTSEDT=$$FMADD^XLFDT(DT,-7)+.9
 D EN1
 Q
 ;
EN ; -- entry point to ask date range
 N IBBDT,IBEDT,IBTSBDT,IBTSEDT,IBTALK,IBMESS
 S IBTALK=1
 I '$P($G(^IBE(350.9,1,6)),"^",4) W !!,"I'm sorry, Tracking of Prescription Refills is currently turned off." G ENQ
 W !!!,"Select the Date Range of Rx Refills to Add to Claims Tracking.",!
 D DATE^IBOUTL
 I IBBDT<1!(IBEDT<1) G ENQ
 S IBTSBDT=IBBDT,IBTSEDT=IBEDT
 ;
 ; -- check selected dates
 S IBTRKR=$G(^IBE(350.9,1,6))
 ; start date can't be before parameters
 I +IBTRKR,IBTSBDT<+IBTRKR S IBTSBDT=IBTRKR W !!,"Begin date is before Claims Tracking Start Date, changed to ",$$DAT1^IBOUTL(IBTSBDT)
 ; -- end date into future
 I IBTSEDT>$$FMADD^XLFDT(DT,-3) W !!,"I'll automatically change the end date to 3 days prior to the date queued to run."
 ;
 W !!!,"I'm going to automatically queue this off and send you a"
 W !,"mail message when complete.",!
 S ZTIO="",ZTRTN="EN1^IBTRKR3",ZTSAVE("IB*")="",ZTDESC="IB - Add Rx Refills to Claims Tracking"
 D ^%ZTLOAD I $G(ZTSK) K ZTSK W !,"Request Queued"
ENQ K ZTSK,ZTIO,ZTSAVE,ZTDESC,ZTRTN
 D HOME^%ZIS
 Q
 ;
EN1 ; -- add rx refills to claims tracking file
 N I,J,X,Y,IBTRKR,IBDT,IBRXN,IBFILL,DFN,IBDATA,IBCNT,IBCNT1,IBCNT2
 ;
 ; -- check parameters
 S IBTRKR=$G(^IBE(350.9,1,6))
 G:'$P(IBTRKR,"^",4) EN1Q ; quit if rx tracking off
 I +IBTRKR,IBTSBDT<+IBTRKR S IBTSBDT=IBTRKR ; start date can't be before parameters
 ;
 ; -- users can queue into future, make sure dates not after date run
 I IBTSEDT>$$FMADD^XLFDT(DT,-3) S IBMESS="(Selected end date of "_$$DAT1^IBOUTL(IBTSEDT)_" automatically changed to "_$$DAT1^IBOUTL($$FMADD^XLFDT(DT,-3))_".)",IBTSEDT=$$FMADD^XLFDT(DT,-3)
 ;
 S IBRXTYP=$O(^IBE(356.6,"AC",4,0)) ; event type pointer for rx billing
 ;
 ; -- cnt= total count, cnt1=count added nsc, cnt2=count of pending
 S (IBCNT,IBCNT1,IBCNT2)=0
 S IBDT=IBTSBDT-.0001
 F  S IBDT=$O(^PSRX("AD",IBDT)) Q:'IBDT!(IBDT>IBTSEDT)  S IBRXN="" F  S IBRXN=$O(^PSRX("AD",IBDT,IBRXN)) Q:'IBRXN  S IBFILL="" F  S IBFILL=$O(^PSRX("AD",IBDT,IBRXN,IBFILL)) Q:IBFILL=""  D RXCHK
 ;
 I $G(IBTALK) D BULL^IBTRKR31
EN1Q I $D(ZTQUEUED) S ZTREQ="@"
 Q
 ;
RXCHK ; -- check and add rx
 S IBCNT=IBCNT+1
 ;I IBFILL<1 G RXCHKQ ;       original fill
 I IBDT>(DT+.24) G RXCHKQ ;  future fill
 I '$D(ZTQUEUED),($G(IBTALK)) W "."
 ;
 S IBRXDATA=$G(^PSRX(IBRXN,0)),IBRXSTAT=$P(IBRXDATA,"^",15)
 S DFN=$P(IBRXDATA,"^",2)
 ;I IBDT=$P($O(^DPT(DFN,"S",(IBDT-.00001))),".") G RXCHKQ ;scheduled appointment on same day as fill date
 ;I $$BABCSC^IBEFUNC(DFN,$P(IBDT,".",1)) G RXCHKQ ; is billable clinic stop in encounter file for data (allows telephone stops on same day, but not others) (P121 - RC, can now bill Rx if on same day as opt visit)
 ;
 ; -- not already in claims tracking
 I $O(^IBT(356,"ARXFL",IBRXN,IBFILL,0)) G RXCHKQ ; already in claims tracking
 ;
 ; -- see if tracking only insured and pt is insured
 I $P(IBTRKR,"^",4)=1,'$$INSURED^IBCNS1(DFN,IBDT) G RXCHKQ ; patient not insure
 ;
 ; -- check rx status (not deleted)
 I IBRXSTAT=13 G RXCHKQ
 ;
 ; -- original fill not released or returned to stock
 I 'IBFILL,'$P($G(^PSRX(IBRXN,2)),"^",13) G RXCHKQ
 I 'IBFILL,$P($G(^PSRX(IBRXN,2)),"^",15) G RXCHKQ
 ;
 ; -- refill not released or returned to stock
 I +IBFILL,'$P($G(^PSRX(IBRXN,1,IBFILL,0)),"^",18) G RXCHKQ
 I +IBFILL,$P($G(^PSRX(IBRXN,1,IBFILL,0)),"^",16) G RXCHKQ
 ;
 ; -- check drug (not investigational, supply, or over the counter drug
 S IBDRUG=$P(IBRXDATA,"^",6)
 D ZERO^IBRXUTL(IBDRUG)
 S IBDEA=$G(^TMP($J,"IBDRUG",+IBDRUG,3))
 K ^TMP($J,"IBDRUG")
 I IBDEA["I"!(IBDEA["S")!(IBDEA["9") G RXCHKQ ; investigational drug, supply or otc
 ;
 ; -- see if insured for prescriptions
 I '$$PTCOV^IBCNSU3(DFN,IBDT,"PHARMACY",.IBANY) S IBRMARK=$S($G(IBANY):"SERVICE NOT COVERED",1:"NOT INSURED")
 ;
 ; -- check sc status and others
 ; -- new ICD node in PSO with CIDC, if it exists use this for determination
 I $G(IBRMARK)="",$D(^PSRX(IBRXN,"ICD")) D CL^SDCO21(DFN,IBDT,"",.IBARR) I $D(IBARR) D
 . S IBM=0 F  S IBM=$O(^PSRX(IBRXN,"ICD",IBM)) Q:'IBM!($G(IBRMARK)'="")  S IBZ=$G(^PSRX(IBRXN,"ICD",IBM,0)) F IBP=1:1:7 Q:$G(IBRMARK)'=""  I $D(IBARR(IBP)) D
 .. S IBRMARK=$S($P(IBZ,"^",IBP+1):$P($T(EXEMPT+IBP),";",3),$P(IBZ,"^",IBP+1)=0:"",1:"NEEDS SC DETERMINATION")
 ;
 ; -- no new ICD node in PSO, use old method of determining status
 I $G(IBRMARK)="",'$D(^PSRX(IBRXN,"ICD")) D
 . D ELIG^VADPT
 . ;if the patient is covered by insurance for pharmacy ($G(IBRMARK)="")
 . ;AND if no copay in #350
 . ;then we need to determine the non billable reason and set IBRMARK
 . ;
 . ;IF VAEL(3) -- if this is a veteran with SC(service connection) status
 . I VAEL(3),'$G(^PSRX(IBRXN,"IB")) D
 . . I $P(VAEL(3),"^",2)>49 S IBRMARK="NEEDS SC DETERMINATION"
 . . ;in case of POW and Unempl.vet we cannot decide if the 3rd party should be exempt
 . . N IBPOWUNV,IBAUTRET S IBAUTRET=$$AUTOINFO^DGMTCOU1(DFN),IBPOWUNV=$S($P(IBAUTRET,U,8):1,$P(IBAUTRET,U,9):1,1:0)
 . . I $P(VAEL(3),"^",2)<50 S IBRMARK=$S(IBPOWUNV:"NEEDS SC DETERMINATION",1:"SC TREATMENT")
 . . I $$RXST^IBARXEU(DFN,$P(IBRXDATA,U,13))>0 S IBRMARK="NEEDS SC DETERMINATION"
 . ;
 . ;IF +VAEL(3)=0 if the veteran doesn't have SC status, but
 . ;the veteran still may have CV status active
 . I $G(IBRMARK)="",+VAEL(3)=0,'$G(^PSRX(IBRXN,"IB")) D
 . . I $$CVEDT^IBACV(DFN,IBDT) S IBRMARK="NEEDS SC DETERMINATION" ;SC-because IB staff usually is using this reason to search for cases that need to be reviewed. COMBAT VETERAN reason will be used after review if this was a case
 ;
 ;
 ; -- ok to add to tracking module
 D REFILL^IBTUTL1(DFN,IBRXTYP,IBDT,IBRXN,IBFILL,$G(IBRMARK)) I '$D(ZTQUEUED),$G(IBTALK) W "+"
 I $G(IBRMARK)'="" S IBCNT2=IBCNT2+1
 I $G(IBRMARK)="" S IBCNT1=IBCNT1+1
 K IBANY,IBRMARK,VAEL,VA,IBDEA,IBDRUG,IBRXSTAT,IBRXDATA,DFN,X,Y
 K IBARR,IBM,IBZ,IBP
RXCHKQ Q
 ;
EXEMPT ; exemption reasons
 ;;AGENT ORANGE
 ;;IONIZING RADIATION
 ;;SC TREATMENT
 ;;ENV. CONTAM.
 ;;MILITARY SEXUAL TRAUMA
 ;;HEAD/NECK CANCER
 ;;COMBAT VETERAN
 ;;
