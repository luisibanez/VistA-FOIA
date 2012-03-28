PSARWS ;BIR/LTL,JMB-Collects Ward Stock Data ;7/23/97
 ;;3.0; DRUG ACCOUNTABILITY/INVENTORY INTERFACE;**3**; 10/24/97
 ;This routine gathers AR/WS dispensing data. It is called by PSGWUAS.
 ;
 N D0,DR,DA,DIC,DIE,DLAYGO,PSA,PSAB,PSAD,PSADT,PSASIT,PSAT,PSADRUG,PSALOC,PSAQTY,PSADA,PSADAL,PSAPS,X,Y S (PSAPS,PSA)=0,PSADA=""
 ;get date dispensed,site(aou),drug,qty
 F  S PSA=$O(^PSI(58.5,"AMIS",PSA)),(PSADT,PSA(1),PSASIT,PSADRUG,PSAQTY)="" Q:'PSA  S PSADT=$O(^PSI(58.5,"AMIS",PSA,PSADT)) Q:'PSADT  S PSA(1)=$O(^PSI(58.5,"AMIS",PSA,PSADT,PSA(1))) Q:PSA(1)']""  D
 .S PSASIT=$O(^PSI(58.5,"AMIS",PSA,PSADT,PSA(1),PSASIT)) Q:'PSASIT!('$P($G(^PS(59.4,+$G(^PSI(58.1,+PSASIT,"SITE")),0)),U,26))  S PSASIT(1)=$G(^PSI(58.1,PSASIT,"SITE"))
 .S PSADRUG=$O(^PSI(58.5,"AMIS",PSA,PSADT,PSA(1),PSASIT,PSADRUG))
 .;drug stocked by any primary DA location?
 .Q:'PSADRUG!('$O(^PSD(58.8,"C",+PSADRUG,0)))
 .S (PSAPS,PSADA)=0
 .;If the location is active, the drug is tracked, & it is tracked in an
 .;inpatient site, set the PSADA(PSAPS) array.
 .F  S PSADA=$O(^PSD(58.8,"C",+PSADRUG,PSADA)) Q:'PSADA  I $G(^PSD(58.8,+PSADA,"I"))="",$P($G(^PSD(58.8,+PSADA,0)),U,2)="P",+$P($G(^PSD(58.8,+PSADA,0)),U,3) S PSAPS=PSAPS+1,PSADA(PSAPS)=PSADA
 .Q:'PSAPS
 .S PSAQTY=$O(^PSI(58.5,"AMIS",PSA,PSADT,PSA(1),PSASIT,PSADRUG,0))
 .S:PSA(1)="R" PSAQTY=-PSAQTY
 .;drug stocked by only one DA location
 .I PSAPS=1 S ^TMP("PSAR",$J,PSADRUG,PSADA(PSAPS))=PSAQTY+$G(^TMP("PSAR",$J,PSADRUG,PSADA(PSAPS))) Q
 .;more than one, check site
 .;
 .;Dave B (PSA*3*3)
 .S (PSAPS,PSAPS(1))=0 F  S PSAPS(1)=$O(PSADA(PSAPS(1))) Q:'PSAPS(1)  S PSADA=PSADA(PSAPS(1)) I $D(^PSD(58.8,"ASITE",+PSASIT(1),"P",PSADA)) S ^TMP("PSAR",$J,PSADRUG,PSADA)=PSAQTY+$G(^TMP("PSAR",$J,PSADRUG,PSADA))
COUNT G:'$O(^TMP("PSAR",$J,"")) END S PSAPS(1)=0
 F PSA=0:1 S PSA=$O(^TMP("PSAR",$J,PSA)) Q:'PSA  S PSAPS(1)=$G(PSAPS(1))+1
 ;get transaction numbers
 F  L +^PSD(58.81,0):0 I  Q
FIND S PSAD=$P(^PSD(58.81,0),U,3)+1 I $D(^PSD(58.81,PSAD)) S $P(^PSD(58.81,0),U,3)=$P(^PSD(58.81,0),U,3)+1 G FIND
 S PSAT=PSAD,DIC="^PSD(58.81,",DIC(0)="L",DLAYGO=58.81,(PSA,PSA(1))=""
 F PSAD=PSAT:1:(PSAT+PSAPS(1)-1) S (DINUM,X)=PSAD D ^DIC
 L -^PSD(58.81,0) K DIC,DINUM,DLAYGO
 ;loop thru array
 F  S PSA=$O(^TMP("PSAR",$J,PSA)) Q:'PSA  D
 .S PSALOC=$O(^TMP("PSAR",$J,PSA,0))
 .S PSAB(1)=$G(^TMP("PSAR",$J,PSA,PSALOC))
 .;get date + current balance + update balance
 .F  L +^PSD(58.8,+PSALOC,1,+PSA,0):0 I  Q
 .D NOW^%DTC
 .S PSADT=+$E(%,1,12),PSAB=+$P($G(^PSD(58.8,+PSALOC,1,+PSA,0)),U,4),$P(^PSD(58.8,+PSALOC,1,+PSA,0),U,4)=PSAB-PSAB(1) K %
 .L -^PSD(58.8,+PSALOC,1,+PSA,0)
 .;update monthly activity multiple
 .S:'$D(^PSD(58.8,+PSALOC,1,+PSA,5,0)) ^(0)="^58.801A^^"
 .I '$D(^PSD(58.8,+PSALOC,1,+PSA,5,$E(DT,1,5)*100,0)) D
 ..S DIC="^PSD(58.8,+PSALOC,1,+PSA,5,",DIC(0)="L",DIC("DR")="1////^S X=$G(PSAB)",(X,DINUM)=$E(DT,1,5)*100,DA(2)=PSALOC,DA(1)=PSA,DLAYGO=58.8 D ^DIC K DIC("DR"),DINUM,DLAYGO
 ..S X="T-1M" D ^%DT S (X,DINUM)=$E(Y,1,5)*100 D ^DIC K DINUM
 ..S DIE=DIC,DA=+Y,DR="3////^S X=$G(PSAB)" D ^DIE K DIE,DA
 .S DIE="^PSD(58.8,+PSALOC,1,+PSA,5,",DA(2)=PSALOC,DA(1)=PSA
 .S DA=$E(DT,1,5)*100,DR="9////^S X=$P($G(^PSD(58.8,+PSALOC,1,+PSA,5,+$E(DT,1,5)*100,0)),U,6)+PSAB(1)"
 .D ^DIE K DIE,DA
 .;update transaction
 .S DIE="^PSD(58.81,",DR="1////2;2////^S X=PSALOC;3///^S X=PSADT;4////^S X=PSA;5////^S X=$G(PSAB(1));9////^S X=PSAB",DA=PSAT
 .D ^DIE
 .S:'$D(^PSD(58.8,+PSALOC,1,+PSA,4,0)) ^(0)="^58.800119PA^^"
 .S DIC="^PSD(58.8,+PSALOC,1,+PSA,4,",DIC(0)="L",(X,DINUM)=PSAT,DA(2)=PSALOC,DA(1)=PSA,DLAYGO=58.8 D ^DIC K DA,DIC,DINUM,DLAYGO S PSAT=PSAT+1
END K ^TMP("PSAR",$J)
 Q
