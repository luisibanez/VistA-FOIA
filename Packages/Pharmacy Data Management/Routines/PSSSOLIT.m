PSSSOLIT	;BIR/RTR/WRT-Manual match Solutions to Orderable Items; 09/02/97 8:54
	;;1.0;PHARMACY DATA MANAGEMENT;**32,41,125**;9/30/97;Build 2
	;
EN	I $D(PSSIEN) L -^PS(52.7,PSSIEN)
	D:$G(PSDELSLG) REMSS D:$G(PSMASTER) END Q:$G(PSSSSS)!($G(PSMASTER))  D END W ! S (PSSOUT,CHANGE,CHKFLAG)=0 K DIC S DIC="^PS(52.7,",DIC(0)="QEAMZ",DIC("A")="Select IV SOLUTION: " D ^DIC K DIC G:Y<0!($D(DTOUT))!($D(DUOUT)) END
MAS	;Entry point for Master Drug Enter/Edit
	S PSSIEN=+Y,PSSNAME=$P(Y,"^",2),PSDISP=+$P($G(^PS(52.7,+Y,0)),"^",2),(PSSOI,PSOLDOI)=+$P($G(^(0)),"^",11),PSSVOL=$P($G(^(0)),"^",3) L +^PS(52.7,PSSIEN):$S($G(DILOCKTM)>0:DILOCKTM,1:3) I '$T W !,$C(7),"Another person is editing this one." Q
	I 'PSDISP W $C(7),!!?5,"This IV Solution does not point to the Dispense Drug File (#50)",!?5,"it cannot be matched to an Orderable Item!",! G EN
ENTER	I 'PSSOI G ^PSSSOLI1
	S PSOINAME=$P($G(^PS(50.7,PSSOI,0)),"^"),PSOIDOSE=+$P($G(^(0)),"^",2) W !!,"IV Solution ->  ",PSSNAME,"    ",PSSVOL,!,"  is already matched to:",!,PSOINAME,"    ",$P($G(^PS(50.606,PSOIDOSE,0)),"^")
	W ! K DIR S DIR(0)="Y",DIR("A")="Do you want to re-match this IV Solution",DIR("B")="NO" D ^DIR K DIR I Y'=1 D SELIV G @$S($G(PSSJI)&('$G(PSSIVOUT)):"ENS^PSSVIDRG",1:"EN")
	S PSDELSLG=1,PSDELSOL=PSSIEN,PSDELOIS=PSSOI
	K DIE S DA=PSSIEN,DIE="^PS(52.7,",DR="9////"_"@" D ^DIE K DIE D EN^PSSPOIDT(PSSOI),EN2^PSSHL1(PSSOI,"MUP") K PSOINAME,PSOIDOSE,PSSOI G ^PSSSOLI1
INACT	W ! K DIE S PSBEFORE=$P(^PS(50.7,PSSOI,0),"^",4),PSAFTER=0,PSINORDE="" S DIE="^PS(50.7,",DR=".04;.05;.06;.07;.08",DA=PSSOI D ^DIE S PSAFTER=$P(^PS(50.7,PSSOI,0),"^",4) K DIE
	S:PSBEFORE&('PSAFTER) PSINORDE="D" S:PSAFTER PSINORDE="I"
	I PSINORDE'="" D REST^PSSPOIDT(PSSOI)
	K PSBEFORE,PSAFTER,PSINORDE
SYN	W ! K DIC S:'$D(^PS(50.7,PSSOI,2,0)) ^PS(50.7,PSSOI,2,0)="^50.72^0^0" S DIC="^PS(50.7,"_PSSOI_",2,",DA(1)=PSSOI,DIC(0)="QEAMLZ",DIC("A")="Select SYNONYM: ",DLAYGO=50.7 D ^DIC K DIC
	I Y<0!($D(DTOUT))!($D(DUOUT)) K:'$O(^PS(50.7,PSSOI,2,0)) ^PS(50.7,PSSOI,2,0) Q:$G(NEWFLAG)  D EN^PSSPOIDT(PSSOI) D:'$G(PSSSSS) EN2^PSSHL1(PSSOI,"MUP") G EN
	W ! S DA=+Y,DIE="^PS(50.7,"_PSSOI_",2,",DA(1)=PSSOI,DR=.01 D ^DIE K DIE G SYN
	Q:$G(NEWFLAG)  D EN^PSSPOIDT(PSSOI) D:'$G(PSSSSS) EN2^PSSHL1(PSSOI,"MUP")
	G EN
END	I $D(PSSIEN) L -^PS(52.7,PSSIEN)
	K DA,DIC,DIR,PSSIEN,PSSNAME,PSDISP,PSSOI,PSDOSNM,CHANGE,CHKFLAG,DA,DR,DIR,DIE,INFLAG,HOLDOI,INPUT,J,JJ,HOLDNAME,NEWFLAG,PSDOSPTR,PSND,PSND1,PSND3,PSNDOSE,PSOIDOSE,PSOINAME,PSOLDOI,PSONEW,PSOTHER,PSSOUT,PSSVOL,ZZ,ZZZZFLAG,ZZPOI,ZZFLAG
	K SS,QQ,WW,PSNEWOI,PPFLAG,VV,VVV,TT,SCLAST,SYN,SYN1,SCOUNT,PSANS,ZZFLAG,ZZXFLAG,PSPOI,SYNNAM,PSDELSOL,PSDELSLG,PSDELOIS,PSSSSS Q
	Q
REMAT	;Rematch Additive to Orderable Item
	I '$G(PSDELADD)!('$G(PSDELOIT)) G QREMAT
	I $P($G(^PS(52.6,PSDELADD,0)),"^",11) G QREMAT
	I $P($G(^PS(50.7,+PSDELOIT,0)),"^",3),'$O(^PS(52.6,"AOI",+PSDELOIT,0)) D
	.K DIE S DIE="^PS(52.6,",DA=PSDELADD,DR="15////"_PSDELOIT D ^DIE K DIE D EN^PSSPOIDT(PSDELOIT),EN2^PSSHL1(PSDELOIT,"MUP")
QREMAT	K PSDELADD,PSDELFLG,PSDELOIT Q
	;
REMSS	;Rematch solution to Orderable Item
	I '$G(PSDELSOL)!('$G(PSDELOIS)) G QRESOL
	I $P($G(^PS(52.7,PSDELSOL,0)),"^",11) G QRESOL
	I $P($G(^PS(50.7,+PSDELOIS,0)),"^",3) D
	.K DIE S DIE="^PS(52.7,",DA=PSDELSOL,DR="9////"_PSDELOIS D ^DIE K DIE D EN^PSSPOIDT(PSDELOIS),EN2^PSSHL1(PSDELOIS,"MUP")
QRESOL	K PSDELSOL,PSDELOIS,PSDELSLG Q
	;
SELIV	;Ask user to select another IV Additive or Solution.
	K PSSIVOUT
	W ! K DIR S DIR(0)="Y",DIR("A")="Would you like to enter another IV Additive or Solution",DIR("B")="NO" D ^DIR K DIR I Y'=1 S PSSIVOUT=1
	Q
