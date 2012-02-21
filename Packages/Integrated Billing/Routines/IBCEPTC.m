IBCEPTC ;ALB/TMK - EDI PREVIOUSLY TRANSMITTED CLAIMS ; 4/12/05 11:15am
 ;;2.0;INTEGRATED BILLING;**296**;21-MAR-94
 ;
EN ; Main entrypoint
 ; IBDT1,IBDT2 = last transmit date range to use
 ; IBSORT = primary sort criteria to use B=BATCH #,I=INS CO NAME
 ; IBFORM = form type to limit selection to U=UB92,H=HCFA 1500,B=BOTH
 ; IBCRIT = the additional sort criteria needed
 ; ^TMP("IB_PREV_CLAIM_INS,$J) = 1 for specific ins co/null for all
 ;                        ^($J,ien)="" for ien of each ins co selected
 ; IBREP = format output should be put in R=report,S=Listman
 ;
 N DIR,DIC,X,Y,Z,Z0,Z1,IBHOW,IBACT,IBCT,IBREP,IBCRIT,IBDT1,IBDT2,IBINS,IBFORM,IBOK,IBQUIT,IBSORT,IBY,DTOUT,DUOUT,%ZIS,ZTSAVE,ZTRTN,ZTDESC,POP
 ;
Q1 ;
 W !!,"*** Please Note ***"
 W ?20,"2 '^' are needed to abort this option (^^)"
 W !?20,"1 '^' brings you back to the previous prompt (^)"
 W !
 ;
 S DIR(0)="SA^C:Claim;B:Batch;L:List",DIR("A")="Select By: (C)laim, (B)atch or see a (L)ist to pick from?: ",DIR("B")="List"
 D ^DIR K DIR
 I $D(DTOUT)!$D(DUOUT) G ENQ
 S IBHOW=Y
 I IBHOW="L" G Q1A
 ;
 S IBQUIT=0,IBCT=0
 K ^TMP($J,IBHOW)
 F  D  Q:IBQUIT
 . I IBHOW="C" S DIR("A")="Select a"_$S(IBCT:"nother",1:"")_" Claim: ",DIR(0)="PA^364:AEMQZ",DIR("S")="I '$P(^(0),U,7),'$O(^IBA(364,""B"",+^(0),Y))"
 . I IBHOW="B" S DIR("A")="Select a"_$S(IBCT:"nother",1:"")_" Batch: ",DIR(0)="PA^IBA(364.1,:AEMQ^W ""  "",$P(^(0),U,3),"" Claims""",DIR("S")="I '$P(^(0),U,14)"
 . S DIR("?")="^D SELDSP^IBCEPTC(IBHOW)"
 . S:IBCT $P(DIR(0),U)=$P(DIR(0),U)_"O" ; Optional prompt after one is selected
 . D ^DIR K DIR
 . I Y'>0 S IBQUIT=$S(X="^":2,X="^^":3,1:1) Q
 . S IBY=$S(IBHOW="C":+Y,1:""),Y=$S(IBHOW="C":+Y(0),1:Y)
 . I '$D(^TMP($J,IBHOW,+Y)) S IBCT=IBCT+1,^TMP($J,IBHOW,+Y)=IBY
 ;
 G:IBQUIT=3 ENQ
 G:IBQUIT=2!'$O(^TMP($J,IBHOW,0)) Q1
 S Z=0
 I IBHOW="C" F  S Z=$O(^TMP($J,"C",Z)) Q:'Z  S ^TMP("IB_PREV_CLAIM_SELECT",$J,Z,0)=^TMP($J,"C",Z)
 I IBHOW="B" S (Z,IBCT)=0 F  S Z=$O(^TMP($J,"B",Z)) Q:'Z  D
 . S Z0=0 F  S Z0=$O(^IBA(364,"C",Z,Z0)) Q:'Z0  S Z1=+$G(^IBA(364,Z0,0)) I Z1,'$D(^TMP("IB_PREV_CLAIM_SELECT",$J,Z1,0)) S ^(0)=Z0,IBCT=IBCT+1
 S ^TMP("IB_PREV_CLAIM_SELECT",$J)=IBCT
 D RESUB^IBCEPTC2
 G ENQ
 ;
Q1A K ^TMP("IB_PREV_CLAIM_INS",$J)
 S DIR(0)="SA^A:All Payers;S:Selected Payers"
 S DIR("A")="Run for (A)ll Payers or (S)elected Payers?: " S DIR("B")="Selected Payers"
 W !!,"PAYER SELECTION:" D ^DIR K DIR
 I X="^^" G ENQ
 I $D(DTOUT)!$D(DUOUT) G Q1
 ;
 I Y="A" S ^TMP("IB_PREV_CLAIM_INS",$J)="" G Q2
 ;
 S ^TMP("IB_PREV_CLAIM_INS",$J)=1
 S IBQUIT=0
 F  S DIC(0)="AEMQ",DIC="^DIC(36,",DIC("A")="Select Specific Payer: " D ^DIC K DIC D  Q:IBQUIT
 . I Y>0 S ^TMP("IB_PREV_CLAIM_INS",$J,+Y)="" Q
 . I X="",$O(^TMP("IB_PREV_CLAIM_INS",$J,0)) S IBQUIT=1 Q
 . I X="" W !!,"No specific payers selected!!" S IBQUIT=2 Q
 . I X=U S IBQUIT=2 Q
 . I X="^^" S IBQUIT=3 Q
 . I Y'>0 Q
 ;
 I IBQUIT=2 G Q1A
 I IBQUIT=3 G ENQ
 ;
Q2 S DIR(0)="SA^H:HCFA 1500;U:UB92;B:Both",DIR("B")="Both"
 S DIR("A")="Run for (U)B92, (H)CFA 1500 or (B)oth: "
 W !!,"BILL FORM TYPE SELECTION:" D ^DIR K DIR
 I X="^^" G ENQ
 I $D(DTOUT)!$D(DUOUT) G Q1A
 S IBFORM=Y
 ;
Q3 S DIR(0)="DA^0:9999999:EPX",DIR("A")="Start with Date Last Transmitted: "
 S DIR("?",1)="This is the earliest date on which a batch that you want to include on this",DIR("?",2)=" report was last transmitted. You may choose a maximum date range of 90 days.",DIR("?")=" "
 W !!,"LAST BATCH TRANSMIT DATE RANGE SELECTION:" D ^DIR K DIR
 I X="^^" G ENQ
 I $D(DTOUT)!$D(DUOUT) G Q2
 S IBDT1=Y
 S IBDT2=$$FMADD^XLFDT(IBDT1,90) I IBDT2>DT S IBDT2=DT
 S DIR("?",1)="This is the latest date on which a batch that you want to include on this",DIR("?",2)=" report was last transmitted. You may choose a maximum date range of 90 days.",DIR("?")=" "
 S DIR("B")=$$FMTE^XLFDT(IBDT2,2),DIR(0)="DA^"_IBDT1_":"_IBDT2_":EPX"
 S DIR("A")="Go to Date Last Transmitted:("_$$FMTE^XLFDT(IBDT1,2)_"-"_$$FMTE^XLFDT(IBDT2,2)_"): " D ^DIR K DIR
 I X="^^" G ENQ
 I $D(DTOUT)!$D(DUOUT) G Q3
 S IBDT2=Y
 ;
Q4 ; Additional selection criteria
 S DIR(0)="SAO^1:MRA Secondary Only;2:Primary Claims Only;3:Secondary Claims Only;4:Claims Previously Printed at Clearinghouse"
 S DIR("A",1)="ADDITIONAL SELECTION CRITERIA:",DIR("A",2)=" ",DIR("A",3)="1 - MRA Secondary Only",DIR("A",4)="2 - Primary Claims Only",DIR("A",5)="3 - Secondary Claims Only"
 S DIR("A",6)="4 - Claims Sent to Print at Clearinghouse Only",DIR("A",7)=" ",DIR("A")="Select Additional Limiting Criteria (optional): "
 S DIR("?")="Select one of the listed criteria to further limit the claims to include"
 W ! D ^DIR K DIR
 I X="^^" G ENQ
 I $D(DTOUT)!$D(DUOUT) G Q3
 S IBCRIT=Y
 ;
Q5 S DIR("L",1)="Select one of the following: ",DIR("L",2)=" ",DIR("L",3)=$J("",10)_"1         Batch By Last Transmitted Date (Claims within a Batch)",DIR("L",4)=$J("",10)_"2         Current Payer (Insurance Company)"
 S DIR("L",5)=" "
 S DIR(0)="SA^1:Batch By Last Transmitted Date (Claims within a Batch);2:Current Payer (Insurance Company)",DIR("B")="Current Payer"
 S DIR("A")="Sort By: "
 W ! D ^DIR K DIR
 I X="^^" G ENQ
 I $D(DTOUT)!$D(DUOUT) G Q4
 S IBSORT=Y
 ;
Q6 S DIR(0)="SA^R:Report;S:Screen List"
 S DIR("A")="Do you want a (R)eport or a (S)creen List format?: "
 S DIR("B")="Screen List"
 W ! D ^DIR K DIR
 I X="^^" G ENQ
 I $D(DTOUT)!$D(DUOUT) G Q5
 S IBREP=Y
 ; 
 I IBREP="S" D LIST G ENQ
 ;
Q7 ; Select device
 F  S IBACT=0 D DEVSEL(.IBACT) Q:IBACT
 I IBACT=99 G ENQ
 U IO
 D LIST
 ;
ENQ K ^TMP("IB_PREV_CLAIM_INS",$J),^TMP("IB_PREV_CLAIM_SELECT",$J)
 Q
 ;
LIST ; Queued report format entrypoint
 ; variables pre-defined: IBREP,IBSORT,IBFORM,IBDT1,IBDT2,IBCRIT
 ;  ^TMP("IB_PREV_CLAIM_INS,$J) global
 K ^TMP("IB_PREV_CLAIM",$J)
 N IBBDA,IBBDA0,IBCURI,IBDA,IBDT,IBFT,IBIFN,IBINS,IBS1,IBS2,IBDTX
 I IBREP="R" N IBPAGE,IBSTOP,IBHDRDT S (IBPAGE,IBSTOP)=0
 S IBDT=IBDT1-.1
 S IBINS=+$G(^TMP("IB_PREV_CLAIM_INS",$J))
 F  S IBDT=$O(^IBA(364.1,"ALT",IBDT)) Q:'IBDT!((IBDT\1)>IBDT2)  S IBBDA=0 F  S IBBDA=$O(^IBA(364.1,"ALT",IBDT,IBBDA)) Q:'IBBDA  D
 . S IBDTX=IBDT\1
 . S IBDA=0 F  S IBDA=$O(^IBA(364,"C",IBBDA,IBDA)) Q:'IBDA  S IBIFN=+$G(^IBA(364,IBDA,0)) D
 .. I IBFORM'="B" S IBFT=$$FT^IBCEF(IBIFN) Q:$S(IBFT=3:IBFORM="H",IBFT=2:IBFORM="U",1:1)
 .. S IBCURI=$$CURR^IBCEF2(IBIFN) Q:'IBCURI
 .. I IBINS Q:'$D(^TMP("IB_PREV_CLAIM_INS",$J,IBCURI))
 .. I IBCRIT=1 Q:'$$MRASEC^IBCEF4(IBIFN)
 .. I IBCRIT=2 Q:$$COBN^IBCEF(IBIFN)>1
 .. I IBCRIT=3 Q:$$COBN^IBCEF(IBIFN)=1
 .. I IBCRIT=4 Q:'$P($G(^DGCR(399,IBIFN,"TX")),U,7)
 .. S IBBDA0=$G(^IBA(364.1,+IBBDA,0))
 .. S IBS1=$S(IBSORT=1:(99999999-IBDTX)_U_$P(IBBDA0,U)_U_$P(IBBDA0,U,14)_U_+$P(IBBDA0,U,5),1:$P($G(^DIC(36,+IBCURI,0)),U)_U_+IBCURI),IBS2=$S(IBSORT=1:$P($G(^DGCR(399,IBIFN,0)),U),1:99999999-IBDTX)
 .. ; Meets all selection criteria - extract to sort global
 .. S:IBS1="" IBS1=" " S:IBS2="" IBS2=" "
 .. I '$D(^TMP("IB_PREV_CLAIM",$J,IBS1)) S ^TMP("IB_PREV_CLAIM",$J,IBS1)=$S(IBSORT=1:$$FMTE^XLFDT(IBDTX,"1"),1:IBIFN)
 .. S ^TMP("IB_PREV_CLAIM",$J,IBS1,IBS2,IBDA)=""
 ;
 I IBREP="R" D RPT^IBCEPTC1(IBSORT,IBDT1,IBDT2) G END  ; Output report
 ;
 D EN^VALM("IBCE VIEW PREV TRANS"_IBSORT) ; List Manager
 ;
END K ^TMP("IB_PREV_CLAIM",$J),^TMP("IB_PREV_CLAIM_INS",$J)
 Q
 ;
DEVSEL(IBACT) ;
 N DIR,POP,X,Y,ZTRTN,ZTSAVE
 W !!,"You will need a 132 column printer for this report!"
 S %ZIS="QM" D ^%ZIS I POP S IBACT=99 G DEVSELQ
 I $G(IOM),IOM<132 S IBOK=1 D  I 'IBOK S IBACT=0 G DEVSELQ
 . S DIR(0)="YA",DIR("A",1)="This report requires output to a 132 column device.",DIR("A",2)="The device you have chosen is only set for "_IOM_".",DIR("A")="Are you sure you want to continue?: ",DIR("B")="No"
 . W ! D ^DIR K DIR
 . I Y'=1 S IBOK=0 W !
 I $D(IO("Q")) D  S IBACT=99 G DEVSELQ
 . K IO("Q")
 . S ZTRTN="LIST^IBCEPTC",ZTSAVE("IBCRIT(")="",ZTSAVE("IB*")="",ZTSAVE("^TMP(""IB_PREV_CLAIM_INS"",$J)")="",ZTSAVE("^TMP(""IB_PREV_CLAIM_INS"",$J,")="",ZTDESC="IB - Previously Transmitted Claims Report"
 . D ^%ZTLOAD K ZTSK D HOME^%ZIS
 S IBACT=1
DEVSELQ Q
 ;
SELDSP(IBHOW) ; Display list of selected claims/batches
 ; IBHOW = "C" for claims   "B" for batches
 N Z,DIR,CT,QUIT
 I '$O(^TMP($J,IBHOW,0)) Q
 S (CT,QUIT)=0
 W !!,$S(IBHOW="C":"Claims",1:"Batches")," Already Selected:"
 S Z=0 F  S Z=$O(^TMP($J,IBHOW,Z)) Q:'Z!QUIT  S Z0=$G(^(Z)) D  Q:QUIT
 . I IBHOW="C" W !,?3,$P($G(^DGCR(399,Z,0)),U) Q
 . W !,?3,$P($G(^IBA(364.1,Z,0)),U),"  ",$P(^(0),U,3)," Claims"
 . S CT=CT+1
 . I '(CT#10),$O(^TMP($J,IBHOW,Z)) S DIR("A")="Press return for more or '^' to exit ",DIR(0)="EA" W ! D ^DIR K DIR I $D(DTOUT)!$D(DUOUT) S QUIT=1
 W !
 Q
 ;
