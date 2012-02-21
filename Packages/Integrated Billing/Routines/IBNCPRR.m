IBNCPRR ;DALOI/AAT - Prescription Report for 3rd Party Billing cross check ;07/21/04
 ;;2.0;INTEGRATED BILLING;**276**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
EN ;
 N IBQ,IBSITE,IBWMC,IBENB,IBBDT,IBEDT,IBINS,IBSDE,IBSCR
 S IBQ=0 ; quit flag
 ; Prompts to the user:
 D DIV Q:IBQ  ; Division
 D WMC Q:IBQ  ; W/M/C criteria
 D ENB Q:IBQ  ; ECME/NON-ECME/BOTH criteria
 D DATE Q:IBQ  ; From-To date range
 D INS Q:IBQ  ; Insurance company
 D SDE Q:IBQ  ; Summary/Detailed/Excel criteria
 D DEVICE Q:IBQ
 D RUN
 I IBQ'=2 D PAUSE2
 Q
 ;
DIV N DIC,DIRUT
 W ! S DIC("A")="Division: ",DIC=59,DIC(0)="AEQM" D ^DIC
 I $D(DIRUT) S IBQ=1 Q
 I Y'>0 S IBQ=1 Q
 S IBSITE=+Y
 Q
 ;
WMC N DIR,DIRUT,Y
 W ! S DIR("B")="CMOP",DIR("A")="(W)INDOW/(M)AIL/(C)MOP: "
 S DIR(0)="SA^W:WINDOW;M:MAIL;C:CMOP" D ^DIR
 I $D(DIRUT) S IBQ=1 Q
 S IBWMC=Y
 Q
 ;
ENB N DIR,DIRUT,Y
 W ! S DIR("B")="ECME BILLABLE",DIR("A")="(E)CME Billable/(N)on-ECME Billable/(B)OTH: "
 S DIR(0)="SA^E:ECME BILLABLE;N:NON-ECME BILLABLE;B:BOTH" D ^DIR
 I $D(DIRUT) S IBQ=1 Q
 S IBENB=Y
 Q
 ;
DATE ;
 N %DT,Y
 S (IBBDT,IBEDT)=DT
 S %DT="AEX"
 S %DT("A")="FROM RELEASE DATE: ",%DT("B")="TODAY"
 W ! D ^%DT K %DT
 I Y<0 S IBQ=1 Q
 S IBBDT=+Y
 S %DT="AEX"
 S %DT("A")="TO RELEASE DATE: ",%DT("B")="TODAY" ;$$DAT2^IBOUTL(IBBDT)
 D ^%DT K %DT
 I Y<0 S IBQ=1 Q
 S IBEDT=+Y
 Q
 ;
INS N DIR,DIC,DIRUT,Y
 W ! S DIR("B")="ALL",DIR("A")="(S)INGLE Insurance Company /(A)LL Insurance Companies: "
 S DIR(0)="SA^S:SINGLE INSURANCE COMPANY;A:ALL" D ^DIR
 I $D(DIRUT) S IBQ=1 Q
 I Y="A" S IBINS=0 Q
 ;
 S DIC(0)="AEQM",DIC=36
 W ! D ^DIC
 I $D(DIRUT) S IBQ=1 Q
 I Y'>0 S IBQ=1 Q
 S IBINS=+Y
 Q
 ;
SDE N DIR,DIRUT
 S DIR("B")="SUMMARY",DIR("A")="(S)UMMARY/(D)ETAILED/(E)XCEL: "
 S DIR(0)="SA^S:SUMMARY;D:DETAILED;E:EXCEL"
 W ! D ^DIR
 I $D(DIRUT) S IBQ=1 Q
 S IBSDE=Y
 Q
 ;
DEVICE ;
 N %ZIS,ZTSK,ZTRTN,ZTIO,ZTDESC,POP,ZTSAVE
 S %ZIS="QM"
 W ! D ^%ZIS
 I POP S IBQ=1 Q
 S IBSCR=$S($E($G(IOST),1,2)="C-":1,1:0)
 ;
 I $D(IO("Q")) D  S IBQ=1
 . S ZTRTN="RUN^IBNCPRR"
 . S ZTIO=ION
 . S ZTSAVE("IB*")=""
 . S ZTDESC="IB ECME CMOP REPORT"
 . D ^%ZTLOAD
 . W !,$S($D(ZTSK):"REQUEST QUEUED TASK="_ZTSK,1:"REQUEST CANCELLED")
 . D HOME^%ZIS
 U IO
 Q
 ;
RUN ;
 N IBPAGE,REF
 S REF=$NA(^TMP($J,"IBNCPRR"))
 K @REF
 S IBPAGE=0
 D COLLECT  ; Collect the data in ^TMP
 U IO
 D REPORT
 I 'IBSCR W !,@IOF
 D ^%ZISC
 K @REF
 Q
 ;
REPORT ;
 N IBDT,IBRX,IBFL,IBPN,DFN,IBD
 D HDR
 I '$D(@REF) W !,"No data meet the criteria."
 S IBDT="" F  S IBDT=$O(@REF@(IBDT)) Q:IBDT=""  D  Q:IBQ
 . S IBPN="" F  S IBPN=$O(@REF@(IBDT,IBPN)) Q:IBPN=""  D  Q:IBQ
 .. S IBRX="" F  S IBRX=$O(@REF@(IBDT,IBPN,IBRX)) Q:IBRX=""  D  Q:IBQ
 ... S IBFL="" F  S IBFL=$O(@REF@(IBDT,IBPN,IBRX,IBFL)) Q:IBFL=""  D  Q:IBQ
 .... S IBD=$G(@REF@(IBDT,IBPN,IBRX,IBFL)) Q:IBD=""
 .... I IBSDE="S" D WRLINE Q
 .... I IBSDE="D" D WRLINE2 Q
 .... I IBSDE="E" D WRLINE3 Q
 ;
 Q
 ;
WRLINE ; Write the summary report line
 D CHKP Q:IBQ
 W !,$$DAT3^IBOUTL(IBDT)," ",?12,$E(IBPN,1,23)," "
 W ?36,$E($P($G(^PSRX(IBRX,0)),U),1,11)," ",?48,IBFL
 W ?51,$P(IBD,U,3)," " ; ECME number
 W ?59,$P($G(^DGCR(399,+$P(IBD,U,4),0)),U)," " ; Bill #
 W ?67,$E($P($G(^DIC(36,+$P(IBD,U,5),0)),U),1,13) ; Insurance
 Q
 ;
WRLINE2 ; Write the detailed report line
 D CHKP Q:IBQ
 W !,$$DAT(IBDT)," ",?10,$E(IBPN,1,18)," "
 W ?29,$$SSN4(+IBD)
 W ?34,$E($P($G(^PSRX(IBRX,0)),U),1,10)," "
 W ?45,IBFL," "
 W ?49,$$DAT($P(IBD,U,2))," "
 W ?60,$E($P($G(^PSDRUG(+$P($G(^PSRX(IBRX,0)),U,6),0)),U),1,20)
 ; ECME#/Rx Status/Copay
 D CHKP Q:IBQ
 W !?5,"ECME#: ",$P(IBD,U,3),", Rx Status: ",$$RXSTAT(+IBD,IBRX),", Rx Copay: ",$$COPAY(IBRX,IBFL)
 ; Bill Number/Insurance/Group
 I $P(IBD,U,4) D CHKP Q:IBQ  D
 . W !?5,"Bill#: ",$P($G(^DGCR(399,+$P(IBD,U,4),0)),U)
 . W ", Insurance: ",$E($P($G(^DIC(36,+$P(IBD,U,5),0)),U),1,20)
 . ;W ", Group Ins.Plan: ?"
 ; CMOP Transactions
 I IBWMC="C" D  Q:IBQ
 . N IBCMOP,IBZ,IBANY
 . S IBANY=0
 . S IBCMOP=0 F  S IBCMOP=$O(^PSRX(IBRX,4,IBCMOP)) Q:'IBCMOP  D  Q:IBQ
 .. S IBZ=$G(^PSRX(IBRX,4,IBCMOP,0)) Q:IBZ=""
 .. I +$P(IBZ,U,3)'=IBFL Q  ; different refill
 .. D CHKP Q:IBQ
 .. W !?5,"CMOP SEQUENCE# ",$P(IBZ,U,2)
 .. W ", STATUS: ",$$EXTERNAL^DILFD(52.01,3,,$P(IBZ,U,4))
 .. W ", NDC: ",$P(IBZ,U,8) S IBANY=1
 . I 'IBANY D CHKP Q:IBQ  W !?5,"NO CMOP TRANSACTIONS FOUND"
 ;
 ; Write activity log
 N IBACT,IBFROM,IBTO
 S IBFROM=IBDT,IBTO=$$NXTREFDT(IBRX,IBFL)
 I IBTO<IBFROM S IBTO=IBFROM
 S IBACT=0  F  S IBACT=$O(^PSRX(IBRX,"A",IBACT)) Q:'IBACT  D  Q:IBQ
 . N IBZ,IBTXT
 . S IBZ=^PSRX(IBRX,"A",IBACT,0) Q:IBZ=""
 . I $P(IBZ,U,2)'="B",$P(IBZ,U,2)'="M" Q
 . I IBZ<IBFROM Q
 . I IBZ>IBTO Q
 . D CHKP Q:IBQ
 . S IBTXT=$P(IBZ,U,5)
 . S:$TR(IBTXT," ")="" IBTXT=$$EXTERNAL^DILFD(52.3,.02,,$P(IBZ,U,2))
 . W !?5,$$DATTIM(+IBZ),?21,$E(IBTXT,1,59)
 D CHKP Q:IBQ
 W !?5,"-------------------------------"
 Q
 ;
WRLINE3 ; Write the Excel report line
 W !,$$DAT(IBDT),U,$E(IBPN,1,23),U
 W $E($P($G(^PSRX(IBRX,0)),U),1,11),U,IBFL,U
 W $$DAT($P(IBD,U,2)),U
 W $P(IBD,U,3),U ; ECME number
 W $P($G(^DGCR(399,+$P(IBD,U,4),0)),U),U ; Bill #
 W $E($P($G(^DIC(36,+$P(IBD,U,5),0)),U),1,13) ; Insurance
 Q
 ;
HDR S IBPAGE=IBPAGE+1
 W @IOF,?10,"IB THIRD PARTY BILLING PHARMACY CROSS-CHECK REPORT for "_$P(^PS(59,IBSITE,0),U),!
 W ?10,$S(IBWMC="C":"CMOP",IBWMC="M":"MAIL",1:"WINDOW")," PRESCRIPTIONS" W ", ",$S(IBSDE="S":"SUMMARY",1:"DETAILED")
 W !?10,"Released ",$$DAT3^IBOUTL(IBBDT)_" to "_$$DAT3^IBOUTL(IBEDT),?70,"Page: "_IBPAGE
 I IBSDE="S" D
 . W !!,"Rel.Date    Patient Name            Rx No   Fill#  ECME#   Bill    Insurance"
 I IBSDE="D" D
 . W !!,"Rel.Date  Patient Name       SSN  Rx No   Fill#  Fil.Date   Drug"
 I IBSDE="E" D
 . W !!,"Rel.Date^Patient Name^SSN^Rx No^Fill#^Fil.Date^ECME#^Bill"
 I IBSDE'="E" D ULINE("=")
 Q
 ;
 ;
COLLECT ;
 N IBDT,IBRX,IBFL,IBP,DFN,IBRXINS,IBZ,IBRXN,IBFLDT,IBPN,IBECN,IBECMBIL,IBRXSITE,IBBIL
 S IBDT=IBBDT-.0001
 ; Released Prescriptions/Refills
 F  S IBDT=$O(^PSRX("AL",IBDT)) Q:'IBDT!($P(IBDT,".")>IBEDT)  D
 . S IBRX="" F  S IBRX=$O(^PSRX("AL",IBDT,IBRX)) Q:IBRX=""  D
 .. S IBZ=$G(^PSRX(IBRX,0))
 .. I IBZ="" Q  ; corrupted x-ref
 .. S IBFL="" F  S IBFL=$O(^PSRX("AL",IBDT,IBRX,IBFL)) Q:IBFL=""  D
 ... S IBRXN=$P(IBZ,U) ; Rx No
 ... S DFN=+$P(IBZ,U,2) ; Patient
 ... S IBPN=$E($P($G(^DPT(DFN,0)),U),1,30) S:IBPN="" IBPN=" "
 ... S IBRXSITE=+$P($G(^PSRX(IBRX,2)),U,9)
 ... I IBSITE'=IBRXSITE Q
 ... S IBFLDT=$S('IBFL:$P($G(^PSRX(IBRX,2)),U,2),1:$P($G(^PSRX(IBRX,1,IBFL,0)),U))
 ... S:'IBFLDT IBFLDT=IBDT
 ... S IBBIL=$$BILL^IBNCPBB(IBRXN,IBFLDT) ; IB Bill
 ... S IBRXINS=$$BILLINS(IBBIL)
 ... I 'IBRXINS S IBRXINS=$$RXINS(IBRX,IBFL)
 ... S IBECMBIL=$$ECMEBIL^IBNCPDPU(DFN,IBFLDT) ; ECME Billable?
 ... ; Apply filters:
 ... I IBENB="E",'IBECMBIL Q
 ... I IBENB="N",IBECMBIL Q
 ... I IBINS,IBRXINS'=IBINS Q
 ... ; Mail/Window/CMOP
 ... I IBWMC'=$$RXWMC(IBRX) Q
 ... S IBECN=$S(IBECMBIL:$$ECMENO(IBRX),1:"")
 ... S @REF@($P(IBDT,"."),IBPN,IBRX,IBFL)=DFN_U_IBFLDT_U_IBECN_U_IBBIL_U_IBRXINS
 ;
 ;;Partial Prescriptions
 ;S IBRXN=0
 ;S IBDT=IBBDT-.001 F  S IBDT=$O(^PSRX("ADP",IBDT)) Q:'IBDT!($P(IBDT,".")>IBEDT)  D
 ;. F  S IBRX=$O(^PSRX("ADP",IBDT,IBRX)) Q:'IBRX  D
 ;.. S IBP=0 F  S IBP=$O(^PSRX("ADP",IBDT,IBRX,IBP)) Q:'IBP  D
 ;... I $G(^PSRX(IBRX,0))="" Q
 ;... S IBPAR=1 D REF
 Q
 ;
RXINS(IBRX,IBFL) ; Determine insurance by the RX
 Q 0
 ;
RXWMC(IBRX) ;WMC
 N IBZ,IBWM
 I $O(^PSRX(IBRX,4,0)) Q "C"
 S IBZ=$G(^PSRX(IBRX,0))
 S IBWM=$P(IBZ,U,11)
 I IBWM="" S IBWM="W" ;default
 Q IBWM
 ;
ECMENO(IBRX) ;
 Q $E(IBRX,$L(IBRX)-6,$L(IBRX))
 ;
BILLINS(IBIFN) ; Insurance from the Bill#
 I 'IBIFN Q 0
 Q +$P($G(^DGCR(399,+IBIFN,"M")),U)
 ;
CHKP ;Check for EOP
 I $Y>(IOSL-4) D:IBSCR PAUSE Q:IBQ  D HDR
 Q
 ;
PAUSE ;
 N X U IO(0) W !!,"Press RETURN to continue, '^' to exit:" R X:DTIME S:'$T X="^" S:X["^" IBQ=2
 U IO
 Q
 ;
PAUSE2 ;
 N X U IO(0) W !!,"Press RETURN to continue:" R X:DTIME S:'$T X="^" S:X["^" IBQ=2
 U IO
 Q
 ;
ULINE(X) ;line
 D CHKP Q:IBQ
 N I W ! F I=1:1:80 W $G(X,"-")
 Q
 ;
DAT(X) ;Convert FM date to displayable (mm/dd/yy) format.
 N DATE,YR
 I $G(X) S YR=$E(X,2,3)
 I $G(X) S DATE=$S(X:$E(X,4,5)_"/"_$E(X,6,7)_"/"_YR,1:"")
 Q $G(DATE)
 ;
DATTIM(X) ;Convert FM date to displayable (mm/dd/yy HH:MM) format.
 N DATE,YR,IBT,IBM,IBH,IBAP
 I $G(X) S YR=$E(X,2,3)
 I $G(X) S DATE=$S(X:$E(X,4,5)_"/"_$E(X,6,7)_"/"_YR,1:"")
 S IBT=$P(X,".",2) S:$L(IBT)<4 IBT=IBT_$E("0000",1,4-$L(IBT))
 S IBH=$E(IBT,1,2),IBM=$E(IBT,3,4)
 S IBAP="a" I IBH>12 S IBH=IBH-12,IBAP="p" S:$L(IBH)<2 IBH="0"_IBH
 I IBT S:'IBH IBH=12 S DATE=DATE_" "_IBH_":"_IBM_IBAP
 Q $G(DATE)
 ;
SSN4(DFN) ;last 4 SSN
 N X
 S X=$P($G(^DPT(DFN,0)),U,9)
 Q $E(X,$L(X)-3,$L(X))
 ;
RXSTAT(IBDFN,IBRX) ;
 N IBS
 ;instead of: S IBS=$P($G(^PSRX(IBRX,"STA")),U)
 S IBS=$$RXSTATUS(IBDFN,IBRX)
 Q $$EXTERNAL^DILFD(52,100,,IBS)
 ;
COPAY(IBRX,IBFL) ;
 N IBACT,IBCOP
 S IBACT=$S('IBFL:$P($G(^PSRX(IBRX,"IB")),U,2),1:$P($G(^PSRX(IBRX,1,IBFL,"IB")),U))
 S IBCOP=$P($G(^IB(+IBACT,0)),U,7)
 Q $J(IBCOP,5,2)
 ;
 ; Next refill date (in not exist - DT)
NXTREFDT(IBRX,IBFL) ;
 N IBDT
 S IBDT=$P($P($G(^PSRX(IBRX,1,IBFL+1,0)),U),".")
 S:'IBDT IBDT=DT
 Q IBDT
 ;
RXSTATUS(IBDFN,IBRX) ;
 N X
 K ^TMP($J,"IBNCPDP52")
 D RX^PSO52API(IBDFN,"IBNCPDP52",IBRX,"","ST")
 S X=+$G(^TMP($J,"IBNCPDP52",IBDFN,IBRX,100))
 K ^TMP($J,"IBNCPDP52")
 Q X
 ;
