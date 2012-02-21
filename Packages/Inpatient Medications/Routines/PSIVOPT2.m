PSIVOPT2 ;BIR/PR,MLM-OPTION DRIVER (CONT) ;02 Mar 99 / 9:27 AM
 ;;5.0; INPATIENT MEDICATIONS ;**23,29,58,110,127,133,135**;16 DEC 97
 ;
 ; Reference to ^PS(55 is supported by DBIA# 2191.
 ; Reference to ^PSSLOCK is supported by DBIA #2789
 ;
D ; Discontinue order.
 D NATURE^PSIVOREN I '$D(P("NAT")) W !,$C(7),"Order Unchanged." S COMQUIT=1 Q
 ;* 8/2* D EN1^PSJHL2(DFN,"OD",+ON55_"V","ORDER DISCONTINUED"),D1
 I '$$REQPROV^PSGOEC W !,$C(7),"Order Unchanged." S COMQUIT=1 Q
 I 'PSJCOM D
 .D D1
 .S PSIVALT=1,PSIVALCK="STOP",PSIVREA="D",ON=ON55 D LOG^PSIVORAL S P(3)=$P($G(^PS(55,DFN,"IV",+ON55,0)),U,3)
 I PSJCOM N COMFLG S COMFLG=0 D
 .I ON55'["P" N COMFLG,O,OO S (COMFLG,O)=0,OO="" F  S O=$O(^PS(55,"ACX",PSJCOM,O)) Q:'O  F  S OO=$O(^PS(55,"ACX",PSJCOM,O,OO)) Q:OO=""  Q:COMFLG  D
 .. Q:OO=ON55  I '$$LS^PSSLOCK(DFN,OO) S COMFLG=1 Q
 I PSJCOM Q:COMFLG  N O,OO S O=0,OO="" F  S O=$O(^PS(55,"ACX",PSJCOM,O)) Q:'O  F  S OO=$O(^PS(55,"ACX",PSJCOM,O,OO)) Q:OO=""  D
 .I OO["V" S ON55=OO D D1 S PSIVALT=1,PSIVALCK="STOP",PSIVREA="D",ON=ON55 D LOG^PSIVORAL N PSJORD S P(3)=$P($G(^PS(55,DFN,"IV",+ON55,0)),U,3),PSJORD=ON55 D HL^PSIVORA Q
 .I OO["U" N PSGORD,PSJORD,PSJNOO K DA D NOW^%DTC S PSGDT=%,T=$E("T",'PSJSYSU),PSGALR=20,PSGP=DFN,DA=+OO,DA(1)=PSGP,(PSGORD,PSJORD)=OO,PSJNOO=P("NAT") D
 ..S CF=$S($P(PSJSYSP0,U,5):1,PSGORD["U":0,1:($P($G(^PS(53.1,+PSGORD,0)),U,25)=""&($P($G(^(4)),U,7)=DUZ)))  D ASET^PSGOEC,AC^PSGOEC
 Q
D1 N %,DA,DIE,DIU,STP,NSTOP
 S NSTOP=$$DATE^PSJUTL2(),STP=$P($G(^PS(55,DFN,"IV",+ON55,0)),U,3),NSTOP=+$S(STP>NSTOP:NSTOP,1:STP),P(17)="D"
 K TMP
 S TMP(55.01,""_+ON55_","_DFN_","_"",109)=NSTOP
 S:'$P($G(^PS(55,DFN,"IV",+ON55,2)),U,7) TMP(55.01,""_+ON55_","_DFN_","_"",116)=STP
 S TMP(55.01,""_+ON55_","_DFN_","_"",100)="D"
 S TMP(55.01,""_+ON55_","_DFN_","_"",.03)=NSTOP
 S PSIVACT=1
 D FILE^DIE("","TMP")
 K TMP
 I $S($G(PSIVAC)="OD":0,$G(PSIVAC)'="AD":1,$G(PSGALO)<1060:0,1:$P($G(PSJSYSW0),U,15)) S X=$S($G(PSIVAC)="AD":1,1:2) D ENLBL^PSIVOPT(X,$S(X=1:+$G(PSGUOW),1:DUZ),DFN,3,+ON55,$E("AD",1,3-X))
 D:'$D(PSJIVORF) ORPARM^PSIVOREN Q:'PSJIVORF  ;* S ORIFN=$P($G(^PS(55,DFN,"IV",+ON55,0)),U,21) Q:'ORIFN
 Q
 ;
R ; Renew order.
 ;I PSJCOM D RIV^PSJCOMR Q
 I PSJCOM D ^PSJCOMR Q
 I P(17)="D",P(12) N ERR D RI W:$G(ERR)=1 $C(7),"  Order unchanged." I $G(ERR)<2 S COMQUIT=1 Q
 NEW PSGORQF S PSIVRNFG=1 D ORDCHK^PSJLIFN K PSIVRNFG W !
 I $G(PSGORQF) S COMQUIT=1 Q
 ;
R1 ;
 I $$EXPIRED^PSGOER(DFN,ON55) D  Q
 .W !?3,"  THIS ORDER HAS BEEN INACTIVE FOR ONE OR MORE SCHEDULED ADMINISTRATIONS"
 .W !?20,"  AND CANNOT BE RENEWED!"
 N PSJRNWDT,PSJOSTOP,OREASON S PSJRNWDT=$$DATE2^PSJUTL2(PSGDT) S:$G(ON55) PSJOSTOP=$P($G(^PS(55,DFN,"IV",+ON55,0)),U,3) I '(PSJOSTOP>P(2)),$G(PSGDT) S PSJOSTOP=PSGDT
 S (PSIVOK,EDIT)="25^1" S P2=P(2),P(2)=PSJRNWDT D EDIT^PSIVEDT S P(2)=P2 K P2 I X="^" Q
 S P(11)=$$ENRNAT^PSGOU($P($G(^PS(55,DFN,"IV",+ON55,2)),U,10),+VAIN(4),P(9),P(11))
 D OK G:X["N" R1 I X=U D RD Q
 S PSIVCHG=2
 S P(17)="A",OREASON=P("RES"),P("RES")="R",P("FRES")="" D:'$D(PSJIVORF) ORPARM^PSIVOREN I PSJIVORF D  Q:'$D(P("NAT"))
 .D NATURE^PSIVOREN I '$D(P("NAT")) D RD Q
 .S ON=ON55
 S P(16)="",PSJORIFN="",PSIVACT=1,P("21FLG")="",P("RES")=OREASON D SET55^PSIVORFB
 D:$P(^PS(55,DFN,"IV",+ON55,0),U,17)="A" RUPDATE^PSIVOREN(DFN,ON55,P(2))
 I PSJIVORF,$P(^PS(55,DFN,"IV",+ON55,0),U,17)'="A" S X=$$LS^PSSLOCK(DFN,+ON55_"V") D
 .D EXPOE^PSGOER(DFN,ON55)
 .S P("RES")="R",PSJREN=1
 .D ENUDTX^PSJOREN(DFN,ON55,"NR"),EN1^PSJHL2(DFN,"SN",+ON55_"V","ORDER RENEWED"),UPDREN(DFN,ON55,PSJRNWDT,P(6),PSJOSTOP,P("NAT"))
 S OD=P(2)
 D VF1^PSJLIACT("","",1),UNL^PSSLOCK(DFN,+ON55_"V")
 D ENLBL^PSIVOPT(2,DUZ,DFN,3,+ON55,"R")
 I $G(PSJOSTOP),$G(ON55),$G(DFN) D STIX^PSIVOREN(PSJOSTOP,ON55,DFN)
 Q
 ;
RD ; Delete for renew.
 ;Q:'$G(PSJVFY)
 ;D DEL55^PSIVORE2 S (ON55,P("OLDON"))=P("PON") D GT55^PSIVORFB
 Q
 ;
OK ;Print example label, run order through checker, ask if it is ok.
 S P16=0,PSIVEXAM=1,(PSIVNOL,PSIVCT)=1 D GTOT^PSIVUTL(P(4)) I ($G(P("PD"))="") D GTPD^PSIVORE2
 D ^PSIVCHK I $D(DUOUT) S X="^",COMQUIT=1 Q
 I ERR=1 S X="N",COMQUIT=1 Q
 W ! D ^PSIVORLB K PSIVEXAM S Y=P(2) W !,"Start date: " X ^DD("DD") W $P(Y,"@")," ",$P(Y,"@",2),?30," Stop date: " S Y=P(3) X ^DD("DD") W $P(Y,"@")," ",$P(Y,"@",2),!
 I $G(PSIVCHG),($G(PSIVREA)'="R") W !,"*** This change will cause a new order to be created. ***"
 S X="Is this O.K.: ^"_$S(ERR:"N",1:"Y")_"^^NO"_$S(ERR'=1:",YES",1:"") D ENQ^PSIV I X["?" S HELP="OK" D ^PSIVHLP G OK
 Q
 ;
RI ; Reinstate Auto-DC'ed order.
 N DA,DIE,DIR,DIU,DR,PSIVACT,PSIVALT,PSIVALCK,PSIVREA W !!,$C(7),"This order has been Auto-DC'ed."
 S DIR(0)="Y",DIR("A")="Reinstate this order" D ^DIR K DIR I 'Y S ERR=1 Q
 D NOW^%DTC I %>$P($G(^PS(55,DFN,"IV",+ON55,2)),U,7) D
 .K DIR S ERR=1,DIR(0)="Y",DIR("A",1)="The original stop date of this order has past.",DIR("A")="Do you wish to renew this order" D ^DIR K DIR S ERR=$S(Y:2,1:1)
 Q:$G(ERR)  S X=$G(^VA(200,+P(6),"PS")) I $S('X:1,'$P(X,U,4):0,DT<$P(X,U,4):0,1:1) S ERR=1
 I $G(ERR) W !!,$C(7),"This order's provider is no longer valid. Please enter a valid provider." S (EDIT,PSIVOK)=1 D EDIT^PSIVEDT I $G(DONE) W $C(7),"Order unchanged." S ERR=1 Q
 N PSGALO S PSGALO=18530 D ENARI^PSIVOPT(DFN,ON,DUZ,PSGALO)
 Q
 ;
UPDREN(DFN,ORD,RNWDT,PROV,OSTOPDT,PSJNOO) ;
 Q:'DFN!'ORD!'RNWDT!'PROV!'OSTOPDT!(PSJNOO="")
 K DR,DA,DIC,DIE,DD,DO N ND0,PSGOEORD
 S DIC="^PS(55,"_DFN_",""IV"","_+ORD S ND0=$G(@(DIC_",0)")),PSGOEORD=$P(ND0,"^",21) I $G(ON)["P",$G(PSGOLDOE) S PSGOEORD=PSGOLDOE
 S DIC=DIC_",14,",DIC(0)="L",DIC("P")="55.1138DA",ND14=$G(@(DIC_"0)")),DINUM=$P(ND14,"^",3)+1,DA(2)=DFN,DA(1)=+ORD D
 .S DIC("DR")=".01////"_$G(RNWDT)_";1////"_$G(DUZ)_";2////"_$G(PROV)_";3////"_$G(OSTOPDT)_";4////"_+PSGOEORD,X=$G(RNWDT) D FILE^DICN
 .Q
 K DO,DINUM
