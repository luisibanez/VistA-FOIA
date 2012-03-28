FHNO21 ; HISC/REL/NCA - Print Feeding Labels ;8/26/94  12:01 
 ;;5.0;Dietetics;**38,39**;Oct 11, 1995
 S DTP=DT\1 D DTP^FH S DTE=DTP_" "_TIM_$S(TIM=10:"AM",1:"PM")
 S S1=$S(LAB=1:6,1:9),S2=LAB=2*5+33
 K N F L=0:0 S L=$O(^FH(118,L)) Q:L<1  S Y=^(L,0),N1=$P(Y,"^",1),^TMP($J,"I",$E(N1,1,26)_","_L)=L I '$D(^FH(118,L,"I")) S N(L)=$P(Y,"^",1,2)
 S LNOD="" F  S LNOD=$O(^TMP($J,"L",LNOD)) Q:LNOD=""  D P2
 Q
P2 S PNOD="",N1=0 K C F  S PNOD=$O(^TMP($J,"L",LNOD,PNOD)) Q:PNOD=""  S Y2=^(PNOD) D P3
 I LAB<3 D P5 Q
 Q
P3 S N1=N1+1
 S DFN=$P(PNOD,"~",3),WRD=$P(Y2,"^",10)
 S NAM=$P(^DPT(DFN,0),"^",1),IS=$P(Y2,"^",9) D PID^FHDPA
 I LAB>2 D LL Q
 I $P(FHPAR,"^",4)="Y" G P4
 W !,$E(NAM,1,S2-$L(WRD)),?(S2+2-$L(WRD)),$E(WRD,3,99),!?$S(LAB=1:3,1:0),BID W:IS'="" ?(S2-22),"*NURSE" W ?(S2-15),DTE S LN=2 I LAB=2 W !! S LN=4
 F L=1:2:7 S Z=$P(Y2,"^",L) I Z'="" D
 .S Q=$P(Y2,"^",L+1) S:'Q Q=1
 .W !,$J(Q,2)," "
 .W $S($D(N(Z)):$P(N(Z),"^",1),$D(^FH(118,+Z,0)):$P(^(0),"^",1),1:"")
 .S LN=LN+1 S:'$D(C(Z)) C(Z)=0 S C(Z)=C(Z)+Q
 .Q
 I LN<S1 F L=LN+1:1:S1 W !
 Q
P4 F L=1:2:7 S Z=$P(Y2,"^",L) I Z'="",$S($D(N(Z)):$P(N(Z),"^",2),$D(^FH(118,+Z,0)):$P(^(0),"^",2),1:"")'="N" D
 .S Q=$P(Y2,"^",L+1) S:'Q Q=1
 .W !,$E(NAM,1,S2-$L(WRD)),?(S2+2-$L(WRD)),$E(WRD,3,99),!,BID
 .W:IS'="" ?11,"*NURSE"
 .W ?(S2-15),DTE,!!,$J(Q,2)," "
 .W $S($D(N(Z)):$P(N(Z),"^",1),$D(^FH(118,+Z,0)):$P(^(0),"^",1),1:""),!!
 .W:LAB=2 !!!
 .S:'$D(C(Z)) C(Z)=0 S C(Z)=C(Z)+Q
 .Q
 Q
P5 S Y=$S(XX="S":$P($G(^FH(119.74,D1,0)),"^",1),1:$P($G(^FH(119.6,W1,0)),"^",1))
 W !?3,"**** INGREDIENTS LIST ****",!!?(33-$L(Y)\2),Y,!?9,DTE,!! S LN=6
 S A1="" F K=0:0 S A1=$O(^TMP($J,"I",A1)) Q:A1=""  S L=^(A1) I $D(C(L)),C(L) W !,$S($D(N(L)):$P(N(L),"^",1),$D(^FH(118,+L,0)):$P(^(0),"^",1),1:""),?28,$J(C(L),5,0) S LN=LN+1
P6 W !!?4,"**** PATIENTS = ",N1," ****",! S LN=LN+3
 S LN=LN#S1 I LN F L=LN+1:1:S1 W !
 Q
LL ;
 S FHCOL=$S(LAB=3:3,1:2)
 I LABSTART>1 F FHLABST=1:1:(LABSTART-1)*FHCOL D  S LABSTART=1
 .I LAB=3 S (PCL1,PCL2,PCL3,PCL4,PCL5,PCL6)="" D LL3^FHLABEL
 .I LAB=4 S (PCL1,PCL2,PCL3,PCL4,PCL5,PCL6,PCL7,PCL8)="" D LL4^FHLABEL
 .Q
 S FHTAB=$S(LAB=3:24,1:37)
 S WRD1=$E(WRD,3,99)
 S NAM=$E(NAM,1,FHTAB-$L(WRD1)),BIDIS=BID I IS="N" S BIDIS=BID_" *NURSE"
 S LNA=NAM_$J(WRD1,FHTAB+1-$L(NAM)),LNB=BIDIS_$J(DTE,FHTAB+1-$L(BIDIS))
 I $P(FHPAR,"^",4)="Y" D LL2 Q
 S NUM=0 F XSF=1:2:7 I $P(Y2,U,XSF)'="" S NUM=NUM+1
 S INDX=0 F XSF=1:2:7 D
 .S SFPTR=$P(Y2,U,XSF) I SFPTR="" Q
 .S QTY=$P(Y2,U,XSF+1),SFNM=$P($G(^FH(118,SFPTR,0)),U,1)
 .S INDX=INDX+1,ZF(INDX)=$J(QTY,2)_" "_SFNM
 .Q
 I LAB=3 D
 .I NUM=1 S (PCL1,PCL2,PCL6)="",PCL3=LNA,PCL4=LNB,PCL5=ZF(1)
 .I NUM=2 S (PCL1,PCL6)="",PCL2=LNA,PCL3=LNB,PCL4=ZF(1),PCL5=ZF(2)
 .I NUM=3 S PCL1="",PCL2=LNA,PCL3=LNB,PCL4=ZF(1),PCL5=ZF(2),PCL6=ZF(3)
 .I NUM=4 S PCL1=LNA,PCL2=LNB,PCL3=ZF(1),PCL4=ZF(2),PCL5=ZF(3),PCL6=ZF(4)
 .D LL3^FHLABEL
 I LAB=4 D
 .I NUM=1 S (PCL1,PCL2,PCL3,PCL7,PCL8)="",PCL4=LNA,PCL5=LNB,PCL6=ZF(1)
 .I NUM=2 S (PCL1,PCL2,PCL7,PCL8)="",PCL3=LNA,PCL4=LNB,PCL5=ZF(1),PCL6=ZF(2)
 .I NUM=3 S (PCL1,PCL2,PCL8)="",PCL3=LNA,PCL4=LNB,PCL5=ZF(1),PCL6=ZF(2),PCL7=ZF(3)
 .I NUM=4 S (PCL1,PCL8)="",PCL2=LNA,PCL3=LNB,PCL4=ZF(1),PCL5=ZF(2),PCL6=ZF(3),PCL7=ZF(4)
 .D LL4^FHLABEL
 Q
LL2 ;
 F XSF=1:2:7 D
 .S SFPTR=$P(Y2,U,XSF) I SFPTR="" Q
 .S QTY=$P(Y2,U,XSF+1),SFNM=$P($G(^FH(118,SFPTR,0)),U,1)
 .S LNC=$J(QTY,2)_" "_SFNM
 .I LAB=3 S (PCL1,PCL4,PCL6)="",PCL2=LNA,PCL3=LNB,PCL5=LNC D LL3^FHLABEL
 .I LAB=4 S (PCL1,PCL2,PCL5,PCL7,PCL8)="",PCL3=LNA,PCL4=LNB,PCL6=LNC D LL4^FHLABEL
 Q
