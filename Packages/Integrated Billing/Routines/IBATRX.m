IBATRX ;LL/ELZ - TRANSFER PRICING RX ROUTINE ; 24-FEB-99
 ;;2.0;INTEGRATED BILLING;**115,309**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
RX(DFN,DT1,DT2,ARRAY) ; look up all rxs for a patient and date range
 ;
 N PIFN,RIFN,IBX,IBY,DTE,DTR,RX,IBCNT,IBRX0,IBRX2,IBS,IBRF K ARRAY,POARR S POARR=0
 S IBCNT=0,DT1=$G(DT1)-.0001,DT2=$G(DT2) S:'DT2 DT2=9999999 Q:'$G(DFN)
 S DTE=DT1 F  S DTE=$O(^PS(55,DFN,"P","A",DTE)) Q:'DTE  D
 . S IBRX=0 F  S IBRX=$O(^PS(55,DFN,"P","A",DTE,IBRX)) Q:'IBRX  D
 .. F IBY=0,2 S IBRX(IBY)=$G(^PSRX(IBRX,IBY))
 ..D ZERO^IBRXUTL(+$P(IBRX(0),"^",6))
 .. ; original fill
 .. S DTR=$P(IBRX(2),"^",2) I DTR'<DT1,DTR'>DT2 D
 ... S ARRAY(IBRX,+DTR)=$P(IBRX(0),"^")_"^"_0_"^"_$P(IBRX(0),"^",6)_"^"_$G(^TMP($J,"IBDRUG",+$P(IBRX(0),"^",6),.01))_"^"_$P(IBRX(0),"^",7)_"^"_$P(IBRX(0),"^",17)
 .. ; refills
 .. S DTR=DT1 F  S DTR=$O(^PSRX(IBRX,1,"B",DTR)) Q:'DTR!(DTR>DT2)  D
 ... S IBRF=0 F  S IBRF=$O(^PSRX(IBRX,1,"B",DTR,IBRF)) Q:'IBRF  D
 .... S IBY=$G(^PSRX(IBRX,1,IBRF,0)) Q:IBY=""
 .... S ARRAY(IBRX,+IBY)=$P(IBRX(0),"^")_"^"_IBRF_"^"_$P(IBRX(0),"^",6)_"^"_$G(^TMP($J,"IBDRUG",+$P(IBRX(0),"^",6),.01))_"^"_$P(IBY,"^",4)_"^"_$P(IBY,"^",11)
 K ^TMP($J,"IBDRUG")
 Q
