AUPATLKI ;IHS PATIENT LOOK-UP UTILITY (including inactive files) [ 04/03/86  11:11 AM ]
 ;IHS-OKLA CITY AREA OFFICE-LMD
LKUP W !!,"Select PATIENT: " K DFLT,DIC("S") I $D(DFN),$D(^DPT(DFN,0)) S DFLT=$P(^(0),"^",1) W DFLT,"//"
 D SBRS Q:$D(DFOUT)!$D(DUOUT)!$D(DTOUT)!$D(DLOUT)  G QUES:$D(DQOUT)
 W ! S (X,LX)=Y,DIC="^DPT(",DIC(0)="QZEM" G CHART:+X>0 S DIC("S")="I $D(^AUPNPAT(Y,41,DUZ(2),0))"
LKUP1 S DIC("W")="W ?45,$J($P(^AUPNPAT(Y,41,DUZ(2),0),U,2),6) W $S($P(^(0),U,5)=""I"":""(I)"",1:""  "") W ?56,$P(^DPT(Y,0),U,9),?69 S RGG=$P(^DPT(Y,0),U,3) I RGG'="""" S RGG=$E(RGG,4,5)_""-""_$E(RGG,6,7)_""-""_($E(RGG,1,3)+1700) W $J(RGG,10)"
L1 G L2:+LX>0 D ^AUNMLK G LKUP:+Y<0 S DFN=+Y G END
L2 D IX^DIC G LKUP:+Y<0 S DFN=+Y G END
CHART S (X,LX)=+X,DIC("S")="I $D(^AUPNPAT(""D"",LX,Y,DUZ(2)))",D="D",DIC="^AUPNPAT(" G LKUP1
QUES W !!,"Please enter:",!,"  a) the PATIENT'S NAME (HORSECHIEF,ALLEN J) or",!,"  b) the IHS CHART NUMBER." G LKUP
END K DIC,RGG Q
SBRS K DFOUT,DTOUT,DUOUT,DQOUT,DLOUT R Y:DTIME I '$T W *7 R Y:5 G SBRS:Y="." I '$T S (DTOUT,DFOUT)="" Q
 S:Y="" DLOUT="" S:Y="^" (DUOUT,Y)="" S:Y?1"?".E!(Y["^") (DQOUT,Y)=""
 Q
