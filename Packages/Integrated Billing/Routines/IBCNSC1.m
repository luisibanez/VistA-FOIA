IBCNSC1 ;ALB/NLR - IBCNS INSURANCE COMPANY ;23-MAR-93
 ;;2.0;INTEGRATED BILLING;**62,137,232,291**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
% G EN^IBCNSC
 ;
AI ; -- (In)Activate Company
 D FULL^VALM1 W !!
 I '$D(^XUSEC("IB INSURANCE SUPERVISOR",DUZ)) D SORRY G EXIT
 D ^IBCNSC2
 G EXIT
CC ; -- Change Insurance Company
 D FULL^VALM1 W !!
 S IBCNS1=IBCNS K IBCNS D INSCO^IBCNSC
 I '$D(IBCNS) S IBCNS=IBCNS1
 K IBCNS1,VALMQUIT
 G EXIT
EA ; -- Billing,Claims,Appeals,Inquiry,Telephone,Main,Remarks,Synonyms
 D FULL^VALM1 W !!
 D MAIN
 ;
 ; -- was company deleted
 I '$D(^DIC(36,IBCNS)) W !!,"<DELETED>",!! S VALMQUIT="" Q
 ;
EXIT ;
 D HDR^IBCNSC,BLD^IBCNSC
 S VALMBCK="R"
 Q
MAIN ; -- Call edit template
 N DIR,X,Y,DTOUT,DUOUT
 S Y=1
 I $G(IBY)'=",12," S DIR(0)="YA",DIR("B")="YES",DIR("A")="WANT TO EDIT BILLING FACILITY PRIMARY IDs?: " W ! D ^DIR K DIR
 G:$D(DTOUT)!$D(DUOUT) MAINQ
 I Y D FACID
 L +^DIC(36,+IBCNS):5 I '$T D LOCKED^IBTRCD1 G MAINQ
 N DIE,DA,DR S DIE="^DIC(36,",(DA,Y)=IBCNS,DR="[IBEDIT INS CO1]" D ^DIE K DIE I $D(Y) S IB("^")=1
 I $G(IBY)=",12," D EDITID^IBCEP(+IBCNS)
 L -^DIC(36,+IBCNS)
MAINQ Q
 ;
FACID ; -- Edit facility ids
 D FACID^IBCEP2B(+IBCNS)
 Q
 ;
SORRY ; -- can't inactivate, don't have key
 W !!,"You do not have access to Inactivate entries.  See your application coordinator.",! D PAUSE^VALM1
 Q
PRESCR ;
 N OFFSET,START,IBCNS18,IBADD
 S IBCNS18=$$ADDRESS^IBCNSC0(IBCNS,.18,11)
 S START=34,OFFSET=2
 D SET^IBCNSP(START,OFFSET+19," Prescription Claims Office Information ",IORVON,IORVOFF)
 D SET^IBCNSP(START+1,OFFSET," Company Name: "_$P($G(^DIC(36,+$P(IBCNS18,"^",7),0)),"^",1))
 D SET^IBCNSP(START+2,OFFSET,"       Street: "_$P(IBCNS18,"^",1))
 D SET^IBCNSP(START+3,OFFSET,"     Street 2: "_$P(IBCNS18,"^",2))
 ; D SET^IBCNSP(START+4,OFFSET,"Claim Off. ID: "_$P(IBCNS18,"^",11))
 N OFFSET S OFFSET=45
 D SET^IBCNSP(START+1,OFFSET,"     Street 3: "_$P(IBCNS18,"^",3)) S IBADD=1
 D SET^IBCNSP(START+1+IBADD,OFFSET,"   City/State: "_$E($P(IBCNS18,"^",4),1,15)_$S($P(IBCNS18,"^",4)="":"",1:", ")_$P($G(^DIC(5,+$P(IBCNS18,"^",5),0)),"^",2)_" "_$E($P(IBCNS18,"^",6),1,5))
 D SET^IBCNSP(START+2+IBADD,OFFSET,"        Phone: "_$P(IBCNS18,"^",8))
 D SET^IBCNSP(START+3+IBADD,OFFSET,"          Fax: "_$P(IBCNS18,"^",9))
 Q
 ;
PROVID N OFFSET,START,IBCNS4,IBCNS3,IBDISP,Z
 S START=53,OFFSET=2,IBCNS4=$G(^DIC(36,IBCNS,4)),IBCNS3=$G(^(3))
 D SET^IBCNSP(START,OFFSET+25," Provider ID Parameters ",IORVON,IORVOFF)
 D PARAMS(IBCNS4,IBCNS3,.IBDISP)
 S Z=0 F  S Z=$O(IBDISP(Z)) Q:'Z  D SET^IBCNSP(START+Z,OFFSET+$P(IBDISP(Z),U),$P(IBDISP(Z),U,2))
 ;
 Q
 ;
INSDEF(IBINS,IBPTYP) ; Returns the default id # for an ins co, if possible
 N X
 S X=""
 I IBINS,IBPTYP S X=$P($G(^IBA(355.91,+$O(^IBA(355.91,"AC",IBINS,IBPTYP,"*N/A*","")),0)),U,7)
 Q X
 ;
PARAMS(IBCNS4,IBCNS3,IBDISP) ; Returns array containing prov id parameters
 ; IBCNS3,IBCNS4 = '3','4' nodes of ins co
 ; IBDISP = returned IBDISP(line#)=offset^text
 N IBQ
 S IBDISP(1)="0^Perf Provider Secondary ID Type (HCFA): "_$$EXPAND^IBTRE(36,4.01,+$P(IBCNS4,U))
 S IBDISP(2)="0^Perf Provider Secondary ID Type (UB92): "_$$EXPAND^IBTRE(36,4.02,+$P(IBCNS4,U,2))
 S IBDISP(3)="0^Perf Provider Secondary ID Requirement: "_$$EXPAND^IBTRE(36,4.03,+$P(IBCNS4,U,3))
 S IBDISP(4)="0^Require Provider's SSN To Print (HCFA): "_$$EXPAND^IBTRE(36,3.11,+$P(IBCNS3,U,11))
 S IBDISP(5)="0^Require Provider's SSN To Print (UB92): "_$$EXPAND^IBTRE(36,3.12,+$P(IBCNS3,U,12))
 S IBDISP(6)="22^Care Unit Prompt: "_$$EXPAND^IBTRE(36,4.09,$P(IBCNS4,U,9))
 Q
 ;
