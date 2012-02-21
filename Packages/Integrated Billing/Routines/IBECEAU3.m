IBECEAU3 ;ALB/CPM-Cancel/Edit/Add... Add New IB Action;11-MAR-93
 ;;2.0;INTEGRATED BILLING;**132,150,167,183**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
ADD ; Add a new Integrated Billing Action entry.
 ;   Input:     DFN  --  Pointer to patient in file #2
 ;           IBATYP  --  Pointer to Action Type in file #350.1
 ;           IBUNIT  --  Number of units of charge
 ;            IBCHG  --  Total charge
 ;           IBDESC  --  Charge description
 ;           IBSITE  --  Pointer to the facility in file #4
 ;            IBFAC  --  Facility number
 ;             IBFR  --  Bill From date
 ;             IBTO  --  Bill To date
 ;             IBSL  --  Softlink  [OPTIONAL]
 ;          IBPARNT  --  Pointer to parent entry in #350  [OPTIONAL]
 ;           IBEVDA  --  Pointer to parent event in #350  [OPTIONAL], or
 ;                   --  "*" to set ibevda=ibn
 ;           IBEVDT  --  Event Date  [OPTIONAL]
 ;             IBIL  --  Bill Number  [OPTIONAL]
 ;           IBCRES  --  Pointer to canc. reason in #350.3  [OPTIONAL]
 ;             IBXA  --  IB Action billing group  [OPTIONAL]
 ;            IBJOB  --  Option being executed  [OPTIONAL]
 ;            IBCVA  --  CHAMPVA Admission date [OPTIONAL]
 ;         IBSTOPDA  --  Pointer to clinic stop entry in #352.5 [OPTIONAL]
 ;                       (used for new outpatient appts created in IB)
 ;           IBGMTR  --  GMT Related flag [OPTIONAL]
 ;
 ;  Output:     IBN  --  Internal number of new entry in file #350
 ;
 N DA,DIK,IBASTR,IBND,Y
 D ADD^IBAUTL I Y<1 S IBY=Y G ADDQ
 S:$G(IBEVDA)="*" IBEVDA=IBN
 S IBND=DFN_"^"_IBATYP_"^"_$S($G(IBSL):IBSL,1:"350:"_IBN)_"^1^"_IBUNIT_"^"_IBCHG_"^"_IBDESC_"^"_$S($D(IBPARNT):IBPARNT,1:IBN)_"^"_$G(IBCRES)_"^"_$G(IBIL)_"^^"_IBFAC
 I IBDESC["RX COPAY",$D(IBAM) S $P(IBND,"^",18)=IBAM,$P(^IBAM(354.71,IBAM,0),"^",6)="350:"_IBN ; mark 354.71 entry back and forth
 I IBDESC'["RX COPAY" S IBND=IBND_"^"_IBFR_"^"_IBTO_"^"_$G(IBEVDA)_$S($G(IBEVDT):"^"_IBEVDT,$G(IBXA)=1!($G(IBXA)=4)!($G(IBJOB)=5):"^"_IBFR,1:"")
 I $G(IBSTOPDA) S $P(IBND,"^",19)=IBSTOPDA
 S $P(^IB(IBN,0),"^",2,20)=IBND
 I $G(IBGMTR) S $P(^IB(IBN,0),"^",21)=1 ; GMT Related
 D NOW^%DTC S $P(^IB(IBN,1),"^")=DUZ,$P(^(1),"^",3,5)=DUZ_"^"_%_$S($G(IBCVA):"^"_IBCVA,1:"")
 S DIK="^IB(",DA=IBN D IX1^DIK
ADDQ Q
 ;
CTBB ; Charge to be billed
 ; Check Outpat. Fee Service less than 20% Outpat Co Pay
 D:$G(IBAFEE) FEE^IBECEAU5 Q:IBY<1
 W !!,"Charge to be billed --> $",$J(IBCHG,0,2)
 Q
 ;
NODED ; Could not determine the Medicare Deductible amount.
 W !,*7,"The Medicare Deductible Amount for ",$$DAT1^IBOUTL(IBCLDT)," could not be determined."
 W !,"You should determine the cause of this problem before proceeding."
 S IBY=-1
 Q
