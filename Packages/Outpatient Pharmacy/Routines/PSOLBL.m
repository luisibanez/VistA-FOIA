PSOLBL ;BIR/SAB/RTR-BOTTLE LABEL ;5/9/07 8:57am
 ;;7.0;OUTPATIENT PHARMACY;**8,19,30,36,47,71,92,120,157,244,206,225,303**;DEC 1997;Build 19
 ;DBIAs PSDRUG-221, PS(55-2228, IBARX-125, PSXSRP-2201, %ZIS-3435, DPT-3097
 ;
 ;*244 rem test for part fill when testing status > 11
 ;
DQ I $D(PSOIOS),PSOIOS]"" D DEVBAR^PSOBMST
 I $G(PSOBAR0)]"",$G(PSOBAR1)]"",$D(^PS(59,PSOSITE,1)) S PSOBARS=1
DQ1 D ^PSOLBL4
 I $G(IOST(0)),$D(^%ZIS(2,IOST(0),55,"B","LL")) G ^PSOLLLI
 G:'$D(PPL) HLEX G:($P($G(PSOPAR),"^",30)=2)&('$G(PSOEXREP)) HLEX K RXFLX S PSOCKHN=","_$G(PPL) S PSRESOLV=+PPL D CHECK F PI=1:1  D  S RX=$P(PPL,",",PI) D C Q:$G(PSOLAPPL)  D:$G(PSDFNFLG) TRAIL^PSOLBL2 K RXP,REPRINT
 .S (PSDFNFLG,PSOLAPPL)=0 S NEXTRX=$P(PPL,",",(PI+1)) I NEXTRX=""!(NEXTRX=",") S PSOLAPPL=1 Q
 .I PSOPDFN'=$P(^PSRX(NEXTRX,0),"^",2) S PSDFNFLG=1,PSOPDFN=$P(^PSRX(NEXTRX,0),"^",2) Q
 I $P(^PS(59,PSOSITE,1),"^",28) D ^PSOLBLN2
 D:'$P(^PS(59,PSOSITE,1),"^",28) ^PSOLBLS
DQ5 I $D(^TMP($J,"PSOCP",DFN)),'$P(^PS(59,PSOSITE,1),"^",28) D INV^PSOCPE
HLEX K RXPI,PSORX,RXP,PSOIOS,PSOLAPPL,XXX,COPAYVAR,TECH,PHYS,MFG,NURSE,STATE,SIDE,COPIES,EXDT,ISD,PSOINST,RXN,RXY,VADT,DEA,WARN,FDT,QTY,PATST,PDA,PS,PS1,PS2,PSL,PSNP,INRX,RR,XTYPE,SSNP,SSNPN,PNM,ADDR,PSODBQ,PSOLASTF,PSRESOLV,PSOEXREP,PSOSXQ
 K ^TMP($J,"PSOCP",+$G(PSOCPN)),PSOCPN,PSOLBLDR,PSOLBLPS,PSOLBLCP,RXPR,RXRP,RXRS,PSOCKHN,RXFLX,PSOLAPPL,PSOPDFN,PSDFNFLG,PSOZERO,NEXTRX,PSOBLALL,STA S:'$G(PSOSUREP)&('$G(PSOSUSPR)) ZTREQ="@" Q
C I $G(IOST(0)),$D(^%ZIS(2,IOST(0),55,"B","LL")) G C^PSOLLLI
 U IO S X=$S('$P(^PS(59,PSOSITE,1),"^",28):132,1:158) X ^%ZOSF("RM") Q:'$D(^PSRX(RX,0))
 S:$G(PSOBLALL) PSOBLRX=RX
 S:$D(RXRP(RX)) REPRINT=1 S:$D(RXPR(RX)) RXP=RXPR(RX)
 I $G(PSOSUREP)!($G(PSOEXREP)) S REPRINT=1 S:'$G(RXRP(RX)) RXRP(RX)=1
 S RXY=^PSRX(RX,0),RXSTA=$P(^PSRX(RX,"STA"),"^") I RXSTA>11 D AL("QT") K RXY,RXP,REPRINT Q         ;*244
 I RXSTA=3 D AL("QT") K RXY,RXP,REPRINT Q
 I $G(RXPR(RX)),'$D(^PSRX(RX,"P",RXP,0)) K RXY,RXP,REPRINT Q
 I $P($G(RXFL(RX)),"^"),'$D(^PSRX(RX,1,$P($G(RXFL(RX)),"^"),0)) K RXY,RXP,REPRINT Q
 I $G(PSODBQ)!($G(RXRS(RX))) S RR=$O(^PS(52.5,"B",RX,0)) Q:'RR  I $G(^PS(52.5,RR,"P"))=1 K RXY,RXP,REPRINT Q
 I $G(RXRS(RX))!($G(PSOPULL)) S PSOSXQ=0 N DR,DA,DIE D  I $G(PSOSXQ) K RXY,RXP,REPRINT Q
 .S DA=$O(^PS(52.5,"B",RX,0)) Q:'DA  S A=$P($G(^PS(52.5,DA,0)),"^",7) Q:A=""
 .I A="Q" S DIE="^PS(52.5,",DR="3////P" D ^DIE Q
 .K RXRS(RX) S PSOSXQ=1
 I $G(PSRESOLV)=RX D ENLBL^PSOBSET K PSRESOLV
 I RXSTA'=4 D:$G(PSOSUSPR) AREC^PSOSUTL D:$G(PSOPULL)!($G(RXRS(RX))) AREC1^PSOSUTL D:$G(PSOSUREP) AREC^PSOSUSRP D:$G(PSXREP) AREC^PSXSRP
 K ^UTILITY("DIQ1",$J) S DA=$P($$SITE^VASITE(),"^") I $G(DA) S DIC=4,DIQ(0)="I",DR="99" D EN^DIQ1 S PSOINST=$G(^UTILITY("DIQ1",$J,4,DA,99,"I")) K ^UTILITY("DIQ1",$J),DA,DR,DIC
 S RXN=$P(RXY,"^"),ISD=$P(RXY,"^",13),RXF=0,DFN=+$P(RXY,"^",2),SIG=$P($G(^PSRX(RX,"SIG")),"^"),ISD=$E(ISD,4,5)_"/"_$E(ISD,6,7)_"/"_($E(ISD,1,3)+1700),ZY=0,$P(LINE,"_",28)="_"
 S PSOLBLPS=+$P(RXY,"^",3),PSOLBLDR=+$P(RXY,"^",6)
 S NURSE=$S($P($G(^DPT(DFN,"NHC")),"^")="Y":1,$P($G(^PS(55,DFN,40)),"^"):1,1:0) S FDT=$P(^PSRX(RX,2),"^",2),PS=$S($D(^PS(59,PSOSITE,0)):^(0),1:""),PS1=$S($D(^(1)):^(1),1:""),PSOSITE7=$P(^("IB"),"^")
 S PS2=$P(PS,"^")_"^"_$P(PS,"^",6)
 S (EXPDT,EXDT)=$P(^PSRX(RX,2),"^",6),EXDT=$S('EXDT:"",1:$E(EXDT,4,5)_"/"_$E(EXDT,6,7)_"/"_($E(EXDT,1,3)+1700))
 S COPIES=$S($P($G(RXRP(RX)),"^",2):$P($G(RXRP(RX)),"^",2),$P(RXY,"^",18)]"":$P(RXY,"^",18),1:1)
 K PSOCKHNX S PSOCKHL=$L(RX),PSOCKHN=$E($G(PSOCKHN),(PSOCKHL+2),999) D  K PSOCKHNX,PSOCKHL,PSOCKHA
 .S PSOCKHA=","_RX_","
 .I PSOCKHN'[PSOCKHA Q
 .S PSOCKHA=$E(PSOCKHA,1,($L(PSOCKHA)-1))
 .S PSOCKHNX=$L(PSOCKHN,PSOCKHA)-1
 .I +$G(PSOCKHNX)>0 D DOUB
 I $O(^PSRX(RX,1,0)),$G(RXFL(RX))'=0 S $P(^PSRX(RX,3),"^",6)="" K ^PSRX(RX,"DAI"),^PSRX(RX,"DRI")
 I '$G(RXP),'$O(^PSRX(RX,1,0)) S RXFL(RX)=0
 I '$G(RXP) D OSET I '$O(^PSRX(RX,1,0))!($G(RXFL(RX))=0) G ORIG
 I $O(^PSRX(RX,1,0)),'$G(RXP),'$G(RXFL(RX)) S XTYPE=1 D REF G STA
 I $O(^PSRX(RX,1,0)),'$G(RXP),$G(RXFL(RX)) G STA
 I $G(RXP) S XTYPE="P" D REF G STA
ORIG S TECH=$P($G(^VA(200,+$P(^PSRX(RX,0),"^",16),0)),"^"),QTY=$P(^PSRX(RX,0),"^",7),PHYS=$S($D(^VA(200,+$P(^PSRX(RX,0),"^",4),0)):$P(^(0),"^"),1:"UKN") D 6^VADPT,PID^VADPT S SSNPN=$E($G(VA("PID")),5,12)
 S DAYS=$P(^PSRX(RX,0),"^",8),MFG="________",LOT="________"
STA S STATE=$S($D(^DIC(5,+$P(PS,"^",8),0)):$P(^(0),"^",2),1:"UKN")
 S DRUG=$$ZZ^PSOSUTL(RX),DEA=$P($G(^PSDRUG(+$P(RXY,"^",6),0)),"^",3),WARN=$P($G(^(0)),"^",8)
 S SIDE=$S($P($G(RXRP(RX)),"^",3):1,1:0)
 I $G(^PSRX(RX,"P",+$G(RXP),0))]"" S RXPI=RXP D
 .S RXP=^PSRX(RX,"P",RXP,0)
 .S RXY=$P(RXP,"^")_"^"_$P(RXY,"^",2,6)_"^"_$P(RXP,"^",4)_"^"_$P(RXP,"^",10)_"^"_$P(RXY,"^",9)_"^"_$P($G(^PSRX(RX,"SIG")),"^",2)_"^"_$P(RXP,"^",2)_"^"_$P(RXY,"^",12,14)_"^"_$P(^PSRX(RX,"STA"),"^")_"^"_$P(RXP,"^",7)_"^"_$P(RXY,"^",17,99)
 .S FDT=$P(RXP,"^")
 S MW=$P(RXY,"^",11) I $G(RXFL(RX))'=0 D:$G(RXFL(RX))  I '$G(RXFL(RX)) F I=0:0 S I=$O(^PSRX(RX,1,I)) Q:'I  S RXF=RXF+1 S:'$G(RXP) MW=$P(^PSRX(RX,1,I,0),"^",2) I +^PSRX(RX,1,I,0)'<FDT S FDT=+^(0)
 .I $G(RXFL(RX)),'$D(^PSRX(RX,1,RXFL(RX),0)) K RXFL(RX) Q
 .S RXF=RXFL(RX) S:'$G(RXP) MW=$P($G(^PSRX(RX,1,RXF,0)),"^",2) I +^PSRX(RX,1,RXF,0)'<FDT S FDT=+^(0)
 I MW="W" S PSMP=$G(^PSRX(RX,"MP")) I PSMP]"" D
 .S PSJ=0 F PSI=1:1:$L(PSMP) S PSMP(PSI)="",PSJ=PSJ+1 F PSJ=PSJ:1 S PSMP(PSI)=PSMP(PSI)_$P(PSMP," ",PSJ)_" " Q:($L(PSMP(PSI))+$L($P(PSMP," ",PSJ+1))>30)
 .K PSMP(PSI)
 S X=$S($D(^PS(55,DFN,0)):^(0),1:""),PSCAP=$P(X,"^",2),PS55=$P($G(X),"^",3),PS55X=$P($G(X),"^",5)
 I (($G(PS55X)]"")&(PS55>1)&(PS55X<DT)) S PS55=0
 S:MW="M" MW=$S((PS55=1!(PS55=4)):"R",1:MW)
 S MW=$S(MW="M":"REGULAR",MW="R":"CERTIFIED",1:"WINDOW")
 I ($G(PSMP(1))']""&($G(PS55)=2)) S PSMP(1)=$G(SSNPN)
 ;S X=$S($D(^PS(55,DFN,0)):^(0),1:""),PSCAP=$P(X,"^",2) S:MW="M" MW=$S(+$P(X,"^",3):"R",1:MW) S MW=$S(MW="M":"REGULAR",MW="R":"CERTIFIED",1:"WINDOW")
 S DATE=$E(FDT,1,7),REF=$P(RXY,"^",9)-RXF S:'$G(RXP) $P(^PSRX(RX,3),"^")=FDT S:REF<1 REF=0 D ^PSOLBL2 S II=RX D ^PSORFL,RFLDT^PSORFL
 S PATST=$G(^PS(53,+$P(RXY,"^",3),0)) S PRTFL=1 I REF=0 S:('$P(PATST,"^",5))!(DEA["W")!(DEA[1)!(DEA[2) PRTFL=0
 S VRPH=$P(^PSRX(RX,2),"^",10),PSCLN=+$P(RXY,"^",5),PSCLN=$S($D(^SC(PSCLN,0)):$P(^(0),"^",2),1:"UNKNOWN")
 S PATST=$P(PATST,"^",2),X1=DT,X2=$P(RXY,"^",8)-10 D C^%DTC:REF I $D(^PSRX(RX,2)),$P(^(2),"^",6),REF,X'<$P(^(2),"^",6) S REF=0,VRPH=$P(^(2),"^",10)
 I $G(PSOCHAMP),$G(PSOTRAMT) S COPAYVAR="CHAMPUS" G LBL
 I $G(RXP) S COPAYVAR="" G LBL
 I $P($G(^PS(53,+$G(PSOLBLPS),0)),"^",7) D SNO G LBL
 I $P($G(^PSDRUG(+$G(PSOLBLDR),0)),"^",3)["I"!($P($G(^(0)),"^",3)["S")!($P($G(^(0)),"^",3)["N") D SNO G LBL
 I $P(^PSRX(RX,"STA"),"^")>0,$P(^("STA"),"^")'=2,'$G(PSODBQ) D SNO G LBL
 I $G(PSOLBLCP)="" D IBCP
 N PSOQI S PSOQI=$G(^PSRX(RX,"IBQ")) I $G(PSOLBLCP)=0 D SNO G LBL
 I $G(PSOLBLCP)=1 I $P(PSOQI,"^",2)!($P(PSOQI,"^",3))!($P(PSOQI,"^",4))!($P(PSOQI,"^",5))!($P(PSOQI,"^",6))!($P(PSOQI,"^",7))!($P(PSOQI,"^",8)) D SNO G LBL
 I $G(PSOLBLCP)=2 I $P(PSOQI,"^")!($P(PSOQI,"^",2))!($P(PSOQI,"^",3))!($P(PSOQI,"^",4))!($P(PSOQI,"^",5))!($P(PSOQI,"^",6))!($P(PSOQI,"^",7))!($P(PSOQI,"^",8)) D SNO G LBL
 I $G(PSOLBLCP)=2,'$P($G(^PSRX(RX,"IB")),"^") D SNO G LBL
 S PSOCPN=$P(^PSRX(RX,0),"^",2),INRX=$P(^(0),"^") I $G(^TMP($J,"PSOCP",PSOCPN))="" S ^(PSOCPN)=PSOCPN
 S ^TMP($J,"PSOCP",PSOCPN,INRX)=INRX_"^"_$$ZZ^PSOSUTL(RX)_"^"_+$G(DAYS) S COPAYVAR="COPAY" K ZDRUG
LBL G ^PSOLBLD:$P(^PSRX(RX,"STA"),"^")=4 D ^PSOLBLD:$D(^PSRX(RX,"DRI"))&('$G(RXF))&('$G(RXP)) D:$P($G(^PSRX(RX,3)),"^",6)&('$G(RXF))&('$G(RXP)) ^PSOLBLD1 G ^PSOLBL1:'$P(^PS(59,PSOSITE,1),"^",28)
 G ^PSOLBLN
REF F XXX=0:0 S XXX=$O(^PSRX(RX,XTYPE,XXX)) Q:+XXX'>0  D
 .S TECH=$S($D(^VA(200,+$P(^PSRX(RX,XTYPE,XXX,0),"^",7),0)):$P(^(0),"^"),1:"UNKNOWN")
 .S QTY=$P(^PSRX(RX,XTYPE,XXX,0),"^",4),PHYS=$S($D(^VA(200,+$P(^PSRX(RX,XTYPE,XXX,0),"^",17),0)):$P(^(0),"^"),$D(^VA(200,+$P(^PSRX(RX,0),"^",4),0)):$P(^(0),"^"),1:"UNKNOWN") D 6^VADPT,PID^VADPT S SSNPN=$E($G(VA("PID")),5,12)
 .S DAYS=$P(^PSRX(RX,XTYPE,XXX,0),"^",10),LOT="________",MFG="________"
 Q
CHECK S PSDFNFLG=0,PSOZERO=$P(PPL,","),PSOPDFN=$P(^PSRX(PSOZERO,0),"^",2)
 Q
OSET D OSET^PSOLBL1
 Q
DOUB Q:'$D(RXFL(RX))  I +$G(RXFL(RX))-PSOCKHNX<0 Q
 S RXFLX(RX)=$G(RXFL(RX)),RXFL(RX)=$G(RXFL(RX))-PSOCKHNX
 Q
AL(T) N I,IR,RF,USR,TY,DES S USR=""
 I T="UT" D
 .N J,RX S USR=$G(DUZ),TY="B",DES="Label never queued to print by User"
 .F J=1:1  S RX=+$P(PPL,",",J) Q:'RX  D AL1
 I T="QT" D
 .S I=+$P(^PSRX(RX,"STA"),"^"),TY=$S((I=3)!(I=16):"H",I=13:"D",1:"C")
 .S DES=I_" "_$S((I=3)!(I=16):"HOLD"_$S(I=16:"(PROVIDER)",1:""),(I=12)!(I=14)!(I=15):"DISCONTINUED"_$S(I=14:"(PROVIDER)",I=15:"(EDIT)",1:""),I=13:"DELETED",1:"")
 .S DES="Queued label terminated - "_DES D AL1
 K %,%H,%I Q
AL1 S (IR,I,RF)=0 F  S I=$O(^PSRX(RX,1,I)) Q:'I  S RF=I S:I>5 RF=I+1
 S I=0 F  S I=$O(^PSRX(RX,"A",I)) Q:'I  S IR=I
 S IR=IR+1,^PSRX(RX,"A",0)="^52.3DA^"_IR_"^"_IR
 D NOW^%DTC S ^PSRX(RX,"A",IR,0)=%_"^"_TY_"^"_USR_"^"_$S($G(RXPR(RX)):6,1:RF)_"^"_DES
 Q
IBCP N X,Y,PSOJJ,PSOLL
 S PSOLBLCP="",X=$P($G(^PS(59,+$G(PSOSITE),"IB")),"^")_"^"_$G(DFN) D XTYPE^IBARX
 S PSOJJ="" F  S PSOJJ=$O(Y(PSOJJ)) Q:'PSOJJ  S PSOLL="" F  S PSOLL=$O(Y(PSOJJ,PSOLL)) Q:PSOLL=""  S:PSOLL>0 PSOLBLCP=PSOLL
 I '$G(PSOLBLCP) S PSOLBLCP=0
 Q
SNO S COPAYVAR="NO COPAY" Q
