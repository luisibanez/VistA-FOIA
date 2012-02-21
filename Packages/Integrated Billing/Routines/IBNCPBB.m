IBNCPBB ;DALOI/AAT - ECME BACKBILLING ;24-JUN-2003
 ;;2.0;INTEGRATED BILLING;**276**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
 ;
 Q
EN ; [IB GENERATE ECME RX BILLS] entry
 N IBMOD1,IBMOD3,IBPAT,IBRX,IBBDT,IBEDT,IBSEL,IBREF,IBPAUSE
 S IBREF=$NA(^TMP($J,"IBNCPBB"))
 S IBPAUSE=1
 K @IBREF D
 . N IBEXIT
 . S IBEXIT=0
 . D MODE I IBEXIT Q
 . I IBMOD1="P" D SELECT I IBEXIT Q
 . I IBMOD1="R" D SELECT2 I IBEXIT Q
 . D CONFIRM I IBEXIT Q
 . D PROCESS I IBEXIT Q
 I IBPAUSE W ! D PAUSE()
 K @IBREF
 Q
 ;
CT(IBTRN) ; CT ENTRY
 N IBZ,IBRX,IBRXN,IBFL,IBEXIT,IBPAT,IBRDT,IBFDT,IBRES,IBBIL,IBBN,IBQ,IBSCRES
 S IBQ=0
 D FULL^VALM1
 W !!,"This option sends electronic Pharmacy Claims to the Payer"
 S VALMBCK="R"
 S IBZ=$G(^IBT(356,IBTRN,0)) Q:IBZ=""
 S IBRX=$P(IBZ,U,8),IBFL=$P(IBZ,U,10)
 I 'IBRX D  Q
 . W !!,"This is not a Pharmacy Claims Tracking record",*7,!
 . D PAUSE("Cannot submit to ECME")
 ;
 ; Release date:
 I IBFL=0 S IBRDT=$P($G(^PSRX(IBRX,2)),U,13)
 E  S IBRDT=$P($G(^PSRX(IBRX,1,IBFL,0)),U,18)
 I 'IBRDT D  Q
 . W !!,"The Prescription is not released.",!
 . D PAUSE("Cannot submit to ECME")
 ;
 S IBPAT=$P(IBZ,U,2)
 I $$SC($P(IBZ,U,19)) D  Q:IBQ
 . N DIR,DIE,DA,DR,Y
 . W !!,"The Rx is marked 'non-billable' in CT: ",$P($G(^IBE(356.8,+$P(IBZ,U,19),0)),U)
 . W !,"If you continue, the NON-BILLABLE REASON will be deleted.",!
 . S DIR(0)="Y",DIR("A")="Are you sure you want to bill this episode"
 . S DIR("B")="NO"
 . S DIR("?")="If you want to bill this Rx, enter 'Yes' - otherwise, enter 'No'"
 . W ! D ^DIR K DIR
 . I 'Y S IBQ=1 Q
 . S DIE="^IBT(356,",DA=IBTRN,DR=".19///@" D ^DIE ;clean NB reason
 . S IBSCRES(IBRX,IBFL)=1 ; sc resolved flag
 ;
 S IBZ=$G(^IBT(356,IBTRN,0)) ; refresh
 I $P(IBZ,U,19) D  Q
 . W !!,"The Prescription is marked 'non-billable' in Claims Tracking",*7
 . W !,"Reason non-billable: ",$P($G(^IBE(356.8,+$P(IBZ,U,19),0),"Unknown"),U),!
 . D PAUSE("Cannot submit to ECME")
 ; Fill/Refill Date:
 S IBFDT=$S('IBFL:$P($G(^PSRX(IBRX,2)),U,2),1:$P($G(^PSRX(IBRX,1,IBFL,0)),U))
 ; Is the patient billable at the released date?
 S IBRES=$$ECMEBIL^IBNCPDPU(IBPAT,IBFDT)
 I 'IBRES D  Q
 . W !!,"The patient is not ECME Billable at the ",$S(IBFL:"re",1:""),"fill date."
 . W !,"Reason: ",$P(IBRES,U,2,255),!
 . D PAUSE("Cannot submit to ECME")
 ;
 S IBRXN=$P(^PSRX(IBRX,0),U)
 S IBBIL=$$BILL(IBRXN,IBRDT)
 I IBBIL,'$P($G(^DGCR(399,IBBIL,"S")),U,16) D  Q
 . W !!,"Rx# ",IBRXN," was previously billed."
 . W !,"Please manually cancel the bill# ",$P($G(^DGCR(399,IBBIL,0)),U)," before submitting claim to ECME.",!
 . D PAUSE("Cannot submit to ECME")
 I IBBIL W !,"The bill# ",$P($G(^DGCR(399,IBBIL,0)),U)," has been cancelled.",!
 ;
 D CONFRX(IBRXN) Q:$G(IBEXIT)
 ;
 W !!,"Submitting Rx# ",IBRXN W:IBFL ", Refill# ",IBFL W " ..."
 S IBRES=$$SUBMIT^IBNCPDPU(IBRX,IBFL) W !,"  ",$S(+IBRES=0:"S",1:"Not s")_"ent through ECME."
 I +IBRES'=0 W !,"  *** ECME returned status: ",$$STAT(IBRES),!
 I +IBRES=0 W !!,"The Rx have been submitted to ECME for electronic billing",!
 D PAUSE()
 Q
 ;
MODE ;
 ; IBMOD1: "P"-Single Patient, "R"-Single Rx
 ; IBMOD3 (if IBMOD1="P"): "U"-Unbilled, "A"-All Rx
 ; IBPAT (if IBMOD1="P"): Patient's DFN
 ; IBBDT,IBEDT (if IBMOD1="P"): From/To dates inclusive
 N DIR,DIC,DIRUT,DUOUT,Y
 S (IBMOD1,IBMOD3)=""
 S DIR(0)="S^P:SINGLE (P)ATIENT;R:SINGLE (R)X"
 S DIR("A")="SINGLE (P)ATIENT, SINGLE (R)X"
 S DIR("B")="P"
 D ^DIR K DIR I $D(DIRUT) S IBEXIT=1,IBPAUSE=0 Q
 S IBMOD1=Y
 ; Enter Rx
 I IBMOD1="R" W ! S DIC="^PSRX(",DIC(0)="AEQMN" D ^DIC S:$D(DUOUT) IBEXIT=1 S IBRX=$S(Y>0:+Y,1:0) S:IBRX="" IBEXIT=1,IBPAUSE=0
 I IBMOD1="R" Q
 ;
 I IBMOD1'="P" W !,"???" S IBEXIT=1 Q  ; Invalid mode
 ; Enter the Patient
 S DIC="^DPT(",DIC(0)="AEQMN" D ^DIC S:$D(DUOUT) IBEXIT=1 S IBPAT=$S(Y>0:+Y,1:0) S:'IBPAT IBEXIT=1,IBPAUSE=0
 Q:IBEXIT
 I '$$ECMEBIL^IBNCPDPU(IBPAT,DT) W *7,!!,"Warning! The patient is currently not ECME billable!"
 ;
 D DATE I IBEXIT S IBPAUSE=0 Q
 ;
 S DIR(0)="S^U:UNBILLED;A:ALL RX"
 S DIR("A")="(U)NBILLED, (A)LL RX"
 S DIR("B")="U"
 D ^DIR K DIR I $D(DIRUT) S IBEXIT=1,IBPAUSE=0 Q
 S IBMOD3=Y
 Q
 ;
 ;begin/end date
DATE ;
 N Y,%DT
 S (IBBDT,IBEDT)=DT
 W !
 S %DT="AEX"
 S %DT("A")="START WITH DATE: ",%DT("B")="TODAY"
 D ^%DT K %DT
 I Y'>0 S IBEXIT=1 Q
 S IBBDT=+Y
 S %DT="AEX"
 S %DT("A")="GO TO DATE: ",%DT("B")="TODAY" ;$$DAT2^IBOUTL(IBBDT)
 D ^%DT K %DT
 I Y'>0 S IBEXIT=1 Q
 S IBEDT=+Y
 Q
 ;
SELECT ; Select from the patient's list
 ; (IBPAT,IBBDT,IBEDT,IBMOD3)
 N IBD,IBRX,IBZ,IBDATA,IBCNT,Y
 S IBCNT=0
 S IBD=$O(^PSRX("AL",IBBDT),-1)
 F  S IBD=$O(^PSRX("AL",IBD)) Q:'IBD  Q:$P(IBD,".")>$P(IBEDT,".")  D
 . S IBRX=0 F  S IBRX=$O(^PSRX("AL",IBD,IBRX)) Q:'IBRX  D
 .. S IBZ=$G(^PSRX(IBRX,0)) Q:IBZ=""
 .. I $P(IBZ,U,2)'=IBPAT Q
 .. I '$P($G(^PSRX(IBRX,2)),U,13) Q  ; not released
 .. S IBDATA=$$RXDATA(IBRX,0)
 .. I ('$P(IBDATA,U,6))!(IBMOD3="A") S IBCNT=IBCNT+1,@IBREF@(IBCNT)=IBDATA
 .. ; Now process refill(s)
 .. S Y=0 F  S Y=$O(^PSRX(IBRX,1,Y)) Q:'Y  D:$P($G(^PSRX(IBRX,1,Y,0)),U,18)
 ... S IBDATA=$$RXDATA(IBRX,Y)
 ... I $P(IBDATA,U,6),IBMOD3'="A" Q  ; unbilled only
 ... S IBCNT=IBCNT+1,@IBREF@(IBCNT)=IBDATA
 ..
 D MKCHOICE
 Q
SELECT2 ; Select from the Rx (and refills) list
 ; (IBRX)
 N IBCNT,Y
 W ! S IBPAUSE=1
 I '$D(^PSRX(IBRX,0)) W !,"The Rx does not exist. Please try again." S IBEXIT=1 Q
 I '$P($G(^PSRX(IBRX,2)),U,13) W !,"The Rx has not been released. Please try again." S IBEXIT=1 Q
 S IBCNT=1,@IBREF@(IBCNT)=$$RXDATA(IBRX,0)
 S Y=0 F  S Y=$O(^PSRX(IBRX,1,Y)) Q:'Y  D:$P($G(^PSRX(IBRX,1,Y,0)),U,18)
 . S IBCNT=IBCNT+1,@IBREF@(IBCNT)=$$RXDATA(IBRX,Y)
 D MKCHOICE
 Q
 ;
MKCHOICE ; Make choice
 N Y
 ; display the collected data
 W !
 S Y=0 F  S Y=$O(@IBREF@(Y)) Q:'Y  D DISP(Y)
 ;
 I $O(@IBREF@(0))="" S IBEXIT=1 W !!," No Rxs meet the entered criteria. Please try again." Q
 I $O(@IBREF@(""),-1)=1 S IBSEL(1)="" Q  ; one item only
 F  W !!,"Enter Line Item(s) to submit to ECME or (A)LL :" R IBSEL:DTIME S:'$T IBEXIT=1 Q:IBEXIT  Q:IBSEL'["?"  D
 . W !?10,"Enter number(s) or item range(s) separated by comma."
 . W !?10,"Example: 1,3,7-11"
 Q:IBEXIT
 I IBSEL'="",$TR(IBSEL,"al","AL")=$E("ALL",1,$L(IBSEL)),$L(IBSEL)<3 W $E("ALL",$L(IBSEL)+1,3) S IBSEL="ALL"
 I IBSEL="" S IBEXIT=1 W " Nothing selected" Q
 I IBSEL="^" S IBEXIT=1 W " Cancelled" Q
 ; Now collect the required into the IBSEL(i) local array
 D PARSE(.IBSEL)
 I $O(IBSEL(0))="" S IBEXIT=1 W !!,"No item(s) match the selection." Q
 Q
 ;
CONFIRM ;
 N DIR,Y
 W !
 S DIR(0)="Y",DIR("B")="NO",DIR("A")="Submit the selected RX(s) to ECME for electronic billing"
 D ^DIR I Y'=1 S IBEXIT=1
 Q
 ;
CONFRX(IBRX) ;
 N DIR,Y
 W !
 S DIR(0)="Y",DIR("B")="NO",DIR("A")="Submit the Rx# "_IBRX_" to ECME for electronic billing"
 D ^DIR I Y'=1 S IBEXIT=1
 Q
 ;
STAT(X) ;
 I +X<6 Q $P(X,"^",2)
 Q "Unknown Status"
 ;
PROCESS ;
 N RES,IBY,IBD,IBRX,IBFIL,IBERR,IBBIL
 S IBERR=0
 S IBY=0 F  S IBY=$O(IBSEL(IBY)) Q:'IBY  D
 . S IBD=$G(@IBREF@(IBY)) Q:IBD=""
 . S IBRX=$P(IBD,U),IBFIL=+$P(IBD,U,3),IBBIL=$P(IBD,U,6)
 . W !,"Submitting Rx# ",$P(IBD,U,2) W:IBFIL "Refill# ",IBFIL W:'IBFIL " (original fill)" W " ..."
 . I IBBIL,'$P($G(^DGCR(399,IBBIL,"S")),U,16) D  S IBERR=IBERR+1 Q
 .. W !," *** Rx# ",$P(IBD,U,2)," was previously billed."
 .. W !," Please cancel the Bill No ",$P($G(^DGCR(399,IBBIL,0)),U)," before submitting the claim"
 . S RES=$$SUBMIT^IBNCPDPU(IBRX,IBFIL) W "  ",$S(+RES=0:"Sent through ECME",1:"Not sent")
 . I +RES'=0 W !?5,"*** ECME returned status: ",$$STAT(RES) S IBERR=IBERR+1
 I 'IBERR W !!,"The selected Rx(s) have been submitted to ECME",!,"for electronic billing"
 Q
 ;
BILL(IBRXN,IBDT) ; Bill IEN (if any) or null
 N RES,X,IBZ
 S IBDT=$P(IBDT,".")
 S RES=""
 S X="" F  S X=$O(^IBA(362.4,"B",IBRXN,X),-1) Q:X=""  D:X  Q:RES
 . S IBZ=$G(^IBA(362.4,X,0))
 . I $P($P(IBZ,U,3),".")=IBDT,$P(IBZ,U,2) S RES=+$P(IBZ,U,2)
 Q RES
 ;
 ;
RXDATA(IBRX,IBFIL) ;Collect Rx-related data
 ;RxIEN^Rx#^Fill#^RelDate^DrugIEN^BillIEN
 N IBRXN,IBDT,IBDRUG,IBBIL
 S IBRXN=$P($G(^PSRX(IBRX,0)),U) ; Rx Number
 I IBFIL=0 S IBDT=$P($G(^PSRX(IBRX,2)),U,2) ;Fill
 E  S IBDT=$P($G(^PSRX(IBRX,1,IBFIL,0)),U)
 S IBDT=$P(IBDT,".")
 S IBDRUG=+$P($G(^PSRX(IBRX,0)),U,6) ;Drug IEN
 S IBBIL=$$BILL(IBRXN,IBDT)
 Q IBRX_U_IBRXN_U_IBFIL_U_IBDT_U_IBDRUG_U_IBBIL
 ;
DISP(IBITEM) ;
 N IBD,IBBILN,IBDRUG,IBBIL
 S IBD=$G(@IBREF@(IBITEM)) Q:IBD=""
 W !,IBITEM," ",?4,$P(IBD,U,2)," ",?15,$P(IBD,U,3)," ",?20,$$DAT2^IBOUTL($P(IBD,U,4))," "
 W ?32,$E($P($G(^PSDRUG(+$P(IBD,U,5),0)),U),1,30)
 S IBBIL=$P(IBD,U,6)
 I IBBIL W ?64,$P($G(^DGCR(399,+IBBIL,0)),U) I $P($G(^DGCR(399,IBBIL,"S")),U,16) W "(canc)"
 Q
 ;
PARSE(X) ;Parse the input
 N I,J,N
 S X=$TR(X," ")
 S X=$TR(X,";",",")
 I $TR(IBSEL,"al","AL")="ALL" D  Q
 . F I=1:1 Q:'$D(@IBREF@(I))  S IBSEL(I)=""
 F I=1:1:$L(X,",") S N=$P(X,",",I) D:N'=""
 . I N'["-" D:N  Q
 . . I $D(@IBREF@(N)) S X(N)=""
 . ; Processing the range
 . N N1,N2
 . S N1=+$P(N,"-",1),N2=+$P(N,"-",2)
 . F J=N1:$S(N2<N1:-1,1:1):N2 I $D(@IBREF@(J)) S X(J)=""
 Q
 ;
PAUSE(MESSAGE) ;
 W !
 I $G(MESSAGE)'="" W MESSAGE,". "
 W "Press RETURN to continue: "
 R %:DTIME
 Q
 ;
SC(IEN) ; Service connected?
 N IBT
 I 'IEN Q 0
 S IBT=$P($G(^IBE(356.8,IEN,0)),U)
 I IBT="NEEDS SC DETERMINATION" Q 1
 I IBT="OTHER" Q 1
 ;
 Q 0
