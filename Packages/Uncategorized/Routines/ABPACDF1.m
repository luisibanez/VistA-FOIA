ABPACDF1 ;PRIV-INS DELETE OPEN CLAIM;[ 05/24/91  1:12 PM ]
 ;;1.4;AO PVT-INS TRACKING;*0*;IHS-OKC/KJR;JULY 25, 1991
PAT D XIT S ABPA("HD",1)=ABPATLE
 S ABPA("HD",2)="DELETE CLAIMS for a patient" D ^ABPAHD
 W !! D ^ABPAPATL I $D(ABPATDFN)'=1 D XIT Q
 I +ABPATDFN<1 G PAT
 S $P(ABPAX,"=",80)="",ABPAHRN=$P(^ABPVAO(ABPATDFN,0),"^",3)
 S ABPAFAC=$P(^ABPVAO(ABPATDFN,0),"^",2)
 S ABPAL=$E($P(^DIC(4,$P(^ABPVAO(DA,0),U,2),0),U),1,25)
 S $P(ABPAXX,"-",80)="" D ^ABPACDF2
 ;--------------------------------------------------------------------
 ;PROCEDURE TO PROCESS OPEN CLAIMS
 S ABPAC=0 F ABPAI=1:1 D  Q:+ABPAC=0  K QFLG D DT3 Q:$D(QFLG)=1
 .S ABPAC=$O(^ABPVAO("CS","O",ABPATDFN,ABPAC))
 S ABPAMESS="End of display...press any key to continue" W !
 D:+ABPAI>1 CONT D PAUSE^ABPAMAIN G PAT
 ;--------------------------------------------------------------------
DT3 S Y=^ABPVAO(DA,1,ABPAC,0),ABPA(ABPAI,ABPAC)=+Y
 S ABPAINS=$E($P(^AUTNINS($P(Y,U,6),0),U),1,15)
 W !,$J(ABPAI,2),?5,$J("",14-$L(ABPAINS)\2)_ABPAINS,?22,$J((+$E(Y,4,5)_"/"_+$E(Y,6,7)_"/"_+$E(Y,2,3)),8),?33,$J($P(Y,U,7),8,2)
 S ABPASTAT=$P(Y,"^",17)
 W ?43,ABPASTAT,$S(ABPASTAT="C":"LOSED",ABPASTAT="D":"ENIED",ABPASTAT="PA":"ID",ABPASTAT="PE":"NDING",ABPASTAT="O":"PEN",1:"??????")
 I ABPASTAT="PA"!(ABPASTAT="C") S R=0,CNT=0 F I=1:1 D  Q:+R=0
 .S R=$O(^ABPVAO(DA,"P",R)) Q:+R=0  S RR=0 F I=1:1 D  Q:+RR=0
 ..S RR=$O(^ABPVAO(DA,"P",R,"D",RR)) Q:+RR=0
 ..Q:$D(^ABPVAO(DA,"P",R,"D",RR,0))'=1
 ..Q:+$P(^ABPVAO(DA,"P",R,"D",RR,0),"^",2)'=+ABPAC
 ..S ABPAPDT=+^ABPVAO(DA,"P",R,0)
 ..S ABPAPDT=$J((+$E(ABPAPDT,4,5)_"/"_+$E(ABPAPDT,6,7)_"/"_+$E(ABPAPDT,2,3)),10)
 ..S CNT=CNT+1 W:+CNT>1 ! W ?50,ABPAPDT S RR=0
 ..S RRR=0 F J=1:1 D  Q:+RRR=0
 ...S RRR=$O(^ABPVAO(DA,"P",R,"A",RRR)) Q:+RRR=0
 ...Q:$D(^ABPVAO(DA,"P",R,"A",RRR,0))'=1
 ...W:+J>1 ! W ?62,$J(+^ABPVAO(DA,"P",R,"A",RRR,0),10,2)
 ...W "  (",$P(^ABPVAO(DA,"P",R,"A",RRR,0),"^",2),")"
 K ABPA("STAT"),R,RR,CNT,I
 I $Y>21 D CONT Q:$D(QFLG)=1  D ^ABPAOCS1
 Q
 ;---------------------------------------------------------------------
CONT ;PROCEDURE TO PAUSE DISPLAY AND PROCESS ACTION REQUEST
 W !,"Press 'RETURN' to Cont., Select 'List Number' to Delete "
 R "or '^' to Exit ",X:DTIME
 I '$T!(X["^") S QFLG="" Q
 I +X>0 D
 .Q:$D(ABPA(+X))'=10  S ABPAC1=$O(ABPA(X,"")) Q:+ABPAC1=0
 .Q:$D(^ABPVAO(ABPATDFN,1,+ABPAC1,0))'=1
 .S D0=+ABPATDFN,ABPA("CDEL")="" D ^ABPADETC S QFLG=""
 .K DIR S DIR(0)="Y",DIR("A")="Delete this claim - are you sure"
 .K ABPA("CDEL") S DIR("B")="NO" W *7 D ^DIR I Y D
 ..K DIK,DA S DIK="^ABPVAO("_ABPATDFN_",1,",DA(1)=ABPATDFN,DA=ABPAC1
 ..D WAIT^DICD,^DIK K ABPAMESS S ABPAMESS="Claim Deletion Completed!"
 ..S ABPAMESS(2)="...Press any key to continue... " D PAUSE^ABPAMAIN
 Q
 ;---------------------------------------------------------------------
XIT K ABPARECV,ABPAPD,ABPAENT,ABPADDFN,ABPATDFN,ABPADT,ABPADTD,ABPAPAT,D
 K ABPA,ABPAL,DIC,C,ABPADT,ABPAQKS,ABPAQK,ABPAHRN,ABPARECV,DA,J,K,Z,XQH
 K ABPAC,ABPAI,ABPAXX,ABPAINS,DIE,DR,%DT,ABPAX,ABPAZ,ABPAPDT,QFLG,YY,ZR
 K ABPASTAT
 Q
