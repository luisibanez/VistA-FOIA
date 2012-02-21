IBCC1 ;ALB/MJB - CANCEL UB-82 THIRD PARTY BILL ;10-OCT-94
 ;;2.0;INTEGRATED BILLING;**19,95,160,159**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
RNB ; -- Add a reason not billable to claims tracking
 N X,Y,DIC,DIE,I,J,DA,DR,IBTYP,IBTRE,IB,IBAPPT,IBDT,IBTALK,IBCODE,IBTRED,IBTSAV,FILL,IBRX,IBDATA,IBD,IBDT,IBQUIT,IBPRO,IBDD
 Q:'$G(IBIFN)
 S IB(0)=$G(^DGCR(399,IBIFN,0)),IBTYP=$P(IB(0),"^",5),IBQUIT=0
 I '$D(DFN) S DFN=$P(IB(0),"^",2)
 ;
 ; -- is inpt find entry in dgpm, then in ibt(356, s da=ibtre then edit
INPT I IBTYP<3 D
 .S DATE=$P(IB(0),"^",3),DFN=$P(IB(0),"^",2)
 .S DGPM=$O(^DGPM("APTT1",DFN,DATE,0)) ; double check for asih
 .I DGPM S (IBTRE,IBTSAV)=$O(^IBT(356,"AD",DGPM,0))
 .I $G(IBTRE) D RNBEDIT
 .Q:IBQUIT
 .;
 .; -- alternate inpt method
 .S IBCODE=$O(^IBE(356.6,"ACODE",1,0))
 .S DATE=$P(IB(0),"^",3),DFN=$P(IB(0),"^",2)
 .S IBDT=(DATE-.25) F  S IBDT=$O(^IBT(356,"APTY",DFN,IBCODE,IBDT)) Q:'IBDT!(IBDT>(DATE+.24))  D
 ..S IBTRE=0 F  S IBTRE=$O(^IBT(356,"APTY",DFN,IBCODE,IBDT,IBTRE)) Q:IBTRE=""!(IBQUIT)  D:$G(IBTSAV)'=IBTRE RNBEDIT
 .Q
 ;
OPT ; -- is opt-find entries in IBT(356, for opt dates and then edit
 I IBTYP>2 S IBCODE=$O(^IBE(356.6,"ACODE",2,0)) D
 .S IBAPPT=0 F  S IBAPPT=$O(^DGCR(399,IBIFN,"OP",IBAPPT)) Q:'IBAPPT!(IBQUIT)  D
 ..S IBDT=(IBAPPT-.01) F  S IBDT=$O(^IBT(356,"APTY",DFN,IBCODE,IBDT)) Q:'IBDT!(IBDT>(IBAPPT+.24))  D
 ...S IBTRE=0 F  S IBTRE=$O(^IBT(356,"APTY",DFN,IBCODE,IBDT,IBTRE)) Q:IBTRE=""!(IBQUIT)  D RNBEDIT
 .Q
 ;
RX ; -- find rx's on bill
 S IBDD=0 F  S IBDD=$O(^IBA(362.4,"AIFN"_IBIFN,IBDD)) Q:'IBDD  S IBD=0 F  S IBD=$O(^IBA(362.4,"AIFN"_IBIFN,IBDD,IBD)) Q:'IBD!(IBQUIT)  D
 .S IBDATA=$G(^IBA(362.4,IBD,0)),IBRX=$P(IBDATA,"^",5),IBDT=$P(IBDATA,"^",3)
 .I '$G(IBRX) S IBRX=$O(^PSRX("B",$P(IBDATA,"^",1),0)) Q:'IBRX
 .S FILL="" F  S FILL=$O(^IBT(356,"ARXFL",IBRX,FILL)) Q:FILL=""!(IBQUIT)  D
 ..S IBTRE=0 F  S IBTRE=$O(^IBT(356,"ARXFL",IBRX,FILL,IBTRE)) Q:'IBTRE!(IBQUIT)  I $P(^IBT(356,+IBTRE,0),"^",6)=IBDT D RNBEDIT
 ;
PRO ; -- find prosthetics on bill
 S IBDD=0 F  S IBDD=$O(^IBA(362.5,"AIFN"_IBIFN,IBDD)) Q:'IBDD  S IBD=0 F  S IBD=$O(^IBA(362.5,"AIFN"_IBIFN,IBDD,IBD)) Q:'IBD!(IBQUIT)  D
 .S IBDATA=$G(^IBA(362.5,IBD,0)),IBPRO=$P(IBDATA,"^",4)
 .Q:'$G(IBPRO)
 .S IBTRE=0 F  S IBTRE=$O(^IBT(356,"APRO",+IBPRO,IBTRE)) Q:'IBTRE!(IBQUIT)  D RNBEDIT
 Q
 ;
RNBEDIT ;
 Q:IBQUIT
 W:'$D(IBTALK) !!,"Since you have canceled this bill, you may enter a Reason Not Billable",!,"into Claims Tracking.  This will take the care off of the UNBILLED lists"
 S IBTALK=1
 ;
 N %,IBTRED S IBTRED=$G(^IBT(356,IBTRE,0))
 W !!,"Claims Tracking entry: ",+IBTRED,"  ",$$EXPAND^IBTRE(356,.18,$P(IBTRED,"^",18)),"  ",$$FMTE^XLFDT($P(IBTRED,"^",6))
 S DA=IBTRE,DIE="^IBT(356,",DR=".19" D ^DIE
 ;
 ; - if the RNB changed, update the user and date/time last edited
 I $P(IBTRED,"^",19)'=$P($G(^IBT(356,IBTRE,0)),"^",19) D NOW^%DTC S DR="1.03///"_%_";1.04////"_DUZ D ^DIE
 I $D(Y) S DFN=+$P(^IBT(356,IBTRE,0),"^",2) D FIND^IBOHCT(DFN,IBTRE) S IBQUIT=1
 Q
