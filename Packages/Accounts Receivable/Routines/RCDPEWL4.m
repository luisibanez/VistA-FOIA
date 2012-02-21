RCDPEWL4 ;ALB/TMK - ELECTRONIC EOB WORKLIST ACTIONS ;24-FEB-03
 ;;4.5;Accounts Receivable;**173,208**;Mar 20, 1995
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ; RCSCR variable must be defined for this routine
 Q
 ;
DISTADJ(RCFR,RCTO,RCAMT,RCCOM) ; Action that distributes an adjustment amount
 ; against another line item's payment
 ; Assumes RCSCR = ien of the entry in file 344.49
 ; RCFR = ien of entry in 344.491 that has a negative net
 ; RCTO = ien of entry in 344.491 that will be decremented
 ; RCAMT = the amount being adjusted (positive #)
 ; RCCOM = the comment to place on the decrease adjustment
 ;
 N RCFRX,RCREF,RCFR0,RCFR1,RCFR10,RCTO0,RCTO1,RCTO10,RCY,DIK,DA,DR,DIC,X,Y,DLAYGO,DD,DO,DIE,DIR
 I $G(^TMP("RCBATCH_SELECTED",$J)) D NOBATCH^RCDPEWL Q
 S RCFR0=$G(^RCY(344.49,RCSCR,1,RCFR,0)),RCTO0=$G(^RCY(344.49,RCSCR,1,RCTO,0)),RCFRX=+$O(^RCY(344.49,RCSCR,1,"B",RCFR0\1,0)),RCFRX=$G(^RCY(344.49,RCSCR,1,RCFRX,0))
 S RCREF=$P($P(RCFRX,U,2),"**ADJ",2),RCREF=$S(RCREF="":"",RCREF=0:$P(RCFRX,U,9),1:$P($G(^RCY(344.4,RCSCR,2,+RCREF,0)),U))
 S RCFR1=+$O(^RCY(344.49,RCSCR,1,"B",RCFR0\1,0)),RCTO1=+$O(^RCY(344.49,RCSCR,1,"B",RCTO0\1,0))
 S RCFR10=$G(^RCY(344.49,RCSCR,1,RCFR1,0)),RCTO10=$G(^RCY(344.49,RCSCR,1,RCTO1,0))
 S RCFR0=$G(^RCY(344.49,RCSCR,1,RCFR,0)),RCTO0=$G(^RCY(344.49,RCSCR,1,RCTO,0))
 S DA(2)=RCSCR,DA(1)=RCFR
 S DIC("DR")=".02////1;.03////"_RCAMT_";.04////"_$S($P(RCTO0,U,2)'="":$P(RCTO0,U,2),RCREF'="":RCREF,1:"UNKNOWN")
 S DIC("DR")=DIC("DR")_";.05////0;.06////0;.09////RETRACTED FUNDS DEDUCTED FROM OTHER PAYMENT ON THIS ERA",DIC="^RCY(344.49,"_DA(2)_",1,"_DA(1)_",1,"
 S DLAYGO=344.4911,DIC(0)="L",X=+$O(^RCY(344.49,RCSCR,1,RCFR,1,"B",""),-1)+1
 D FILE^DICN K DIC,DD,DO,DLAYGO
 S RCY=+Y
 I RCY'>0 D  Q
 . S DIR(0)="EA",DIR("A",1)="PROBLEM ADDING ADJUSTMENT - NO DISTRIBUTION PERFORMED",DIR("A")="PRESS RETURN TO CONTINUE " D ^DIR K DIR
 ;
 S DA(2)=RCSCR,DA(1)=RCTO
 S DIC("DR")=".02////0;.03////"_$J(-RCAMT,"",2)
 S DIC("DR")=DIC("DR")_";.04////"_$S($P(RCFR0,U,2)'="":$P(RCFR0,U,2),RCREF'="":RCREF,1:"UNKNOWN")_";.05////"_$S($P($G(^RCY(344.49,RCSCR,1,RCTO1,0)),U,2)'["**ADJ":"1;.08////0",1:0)_";.06////0"_$S(RCCOM'="":";.09////"_RCCOM,1:"")
 S DIC="^RCY(344.49,"_DA(2)_",1,"_DA(1)_",1,"
 S DLAYGO=344.4911,DIC(0)="L",X=+$O(^RCY(344.49,RCSCR,1,RCTO,1,"B",""),-1)+1
 D FILE^DICN K DIC,DD,DO,DLAYGO
 S RCY=+Y
 ;
 I RCY'>0 D  Q
 . N DA
 . S DA(2)=RCSCR,DA(1)=RCFR,DA=RCY,DIK="^RCY(344.49,"_DA(2)_",1,"_DA(1)_",1," D ^DIK
 . S DIR(0)="EA",DIR("A",1)="PROBLEM ADDING ADJUSTMENT - NO DISTRIBUTION PERFORMED",DIR("A")="PRESS RETURN TO CONTINUE " D ^DIR K DIR
 ;
 S DA(1)=RCSCR,DA=RCFR,DIE="^RCY(344.49,"_DA(1)_",1,",DR=".06////"_$J($P(RCFR0,U,6)+RCAMT,"",2)_";.08////"_$J($P(RCFR0,U,8)+RCAMT,"",2) D ^DIE
 S DA=RCFR1,DIE="^RCY(344.49,"_DA(1)_",1,",DR=".06////"_$J($P(RCFR10,U,6)+RCAMT,"",2) D ^DIE
 S DA(1)=RCSCR,DA=RCTO,DIE="^RCY(344.49,"_DA(1)_",1,",DR=".06////"_$J($P(RCTO0,U,6)-RCAMT,"",2)_";.03////"_$J($P(RCTO0,U,3)-RCAMT,"",2)_";.08////"_$J($P(RCTO0,U,8)-RCAMT,"",2) D ^DIE
 S DA(1)=RCSCR,DA=RCTO1,DIE="^RCY(344.49,"_DA(1)_",1,",DR=".06////"_$J($P(RCTO10,U,6)-RCAMT,"",2)_";.03////"_$J($P(RCTO10,U,3)-RCAMT,"",2)_";.08////"_$J($P(RCTO10,U,8)-RCAMT,"",2) D ^DIE
 D BLD^RCDPEWL1($G(^TMP($J,"RC_SORTPARM")))
 Q
 ;
NEWREC ; Create a new receipt from scratch pad entry
 N Z,Z0,RCOK,RCRECTDA,RCSTOP,DIR,X,Y,RECTDA,CT,DIE,DA,DR,RCER,RCPAYTY,RCHAC,RCDEP,DIC
 D FULL^VALM1
 I $G(RCSCR("NOEDIT"))=2 D NOTAV^RCDPEWL2 G NEWRECQ
 S (RCSTOP,RCOK)=0,VALMBCK="R"
 S RECTDA=$P($G(^RCY(344.49,RCSCR,0)),U,2)
 I 'RECTDA S RECTDA=$P($G(^RCY(344.4,RCSCR,0)),U,8)
 I RECTDA D  G NEWRECQ
 . S DIR(0)="EA",DIR("A",1)="THIS ERA ALREADY HAS A RECEIPT - "_$P($G(^RCY(344,+$P($G(^RCY(344.49,RCSCR,0)),U,2),0)),U)_" - NO RECEIPT CREATED",DIR("A")="PRESS RETURN TO CONTINUE" W ! D ^DIR K DIR
 S DIR("A",1)="THIS ACTION WILL CREATE THE RECEIPT FOR THIS ERA.  ONCE THE RECEIPT IS",DIR("A",2)=" CREATED HERE, NO MORE AUTOMATIC ADJUSTMENTS MAY BE MADE FOR THIS ERA.",DIR("A",3)=" "
 S DIR("A")="ARE YOU SURE YOU ARE READY TO CREATE THIS RECEIPT?: ",DIR("B")="NO",DIR(0)="YA"
 W ! D ^DIR K DIR W !
 I Y'=1 S DIR(0)="EA",DIR("A")="NO RECEIPT CREATED - PRESS RETURN TO CONTINUE" W ! D ^DIR K DIR G NEWRECQ
 I $$HASADJ^RCDPEWL8(RCSCR,.RCOK) D  G NEWRECQ
 . S DIR(0)="EA",DIR("A",1)="AT LEAST ONE LINE ITEM WAS FOUND WITH A NEGATIVE PAYMENT AMOUNT",DIR("A")="NO RECEIPT CAN BE CREATED - PRESS RETURN TO CONTINUE " D ^DIR K DIR S RCSTOP=1
 I 'RCOK S DIR(0)="EA",DIR("A")="NO RECEIPT CAN BE CREATED - NO POSTABLE LINE ITEMS WERE FOUND" W ! D ^DIR K DIR G NEWRECQ
 ;
 S RCHAC=$$HACERA^RCDPEU(RCSCR)
 S RCPAYTY=$S(RCHAC:8,$P($G(^RCY(344.4,+RCSCR,0)),U,13)="":14,1:4)
 S RCDEP=""
 I RCPAYTY=4 D
 . N RCOK1
 . F  D  Q:RCOK1
 .. S RCOK1=1
 .. S DIC="^RCY(344.1,",DIC("S")="I $P(^(0),U,12)=1",DIC(0)="AEMQ" D ^DIC
 .. Q:Y'>0
 .. S RCDEP=+Y
 .. I RCDEP,$$TOOOLD^RCDPEWLA(RCDEP) S RCOK1=0,RCDEP=""
 S RECTDA=$$BLDRCPT^RCDPUREC(DT,+RCDEP_$S(RCPAYTY=4:"ERACHK",1:""),+$O(^RC(341.1,"AC",+RCPAYTY,0))) ; Note:ERA with paper check is type 4, but receipt needs to start with an 'E'
 I 'RECTDA W ! S DIR(0)="EA",DIR("A",1)="A PROBLEM WAS ENCOUNTERED ADDING THE RECEIPT - NO RECEIPT ADDED",DIR("A")="PRESS RETURN TO CONTINUE" W ! D ^DIR K DIR G NEWRECQ
 ;
 D RCPTDET^RCDPEM(RCSCR,RECTDA,.RCER)
 ;
 S DIE="^RCY(344.49,",DA=RCSCR,DR=".02////"_RECTDA D ^DIE
 S DIE="^RCY(344.4,",DA=RCSCR,DR=".08////"_RECTDA D ^DIE
 S Z=+$O(^RCY(344.31,"AERA",RCSCR,0))
 S DIE="^RCY(344,",DA=RECTDA,DR=".18////"_RCSCR_$S(Z:";.17////"_Z,1:"")_$S(RCPAYTY=4:";.06////"_RCDEP,1:"")_$S($P($G(^RCY(344.31,Z,0)),U,15)'="":";.16////"_$P(^RCY(344.31,Z,0),U,15),1:"") D ^DIE
 ;
 I $O(RCER(0)) D
 . S CT=1,DIR(0)="EA",DIR("A",1)="THE FOLLOWING PROBLEMS OCCURRED WHILE ADDING THE RECEIPT: "
 . S Z=0 F  S Z=$O(RCER(Z)) Q:'Z  S CT=CT+1,DIR("A",CT)=RCER(Z)
 . S DIR("A")="PRESS RETURN TO CONTINUE "
 . W ! D ^DIR K DIR
 ;
 S DIR(0)="YA",DIR("A")="DO YOU WANT TO GO TO RECEIPT PROCESSING NOW? ",DIR("A",1)=" ",DIR("A",2)="RECEIPT "_$P($G(^RCY(344,+RECTDA,0)),U)_" HAS BEEN CREATED FOR THIS ERA",DIR("B")="YES" W ! D ^DIR K DIR
 I Y=1 S RCRECTDA=RECTDA D EN^VALM("RCDP RECEIPT PROFILE")
 S RCSCR=0
 S VALMBCK="Q"
 ;
NEWRECQ Q
 ;
VRECPT ; Preview receipt lines
 N RCZ,RCOK,Z,Z0,DIR,X,Y
 D FULL^VALM1
 S VALMBCK="R"
 I $G(^TMP("RCBATCH_SELECTED",$J)) D NOBATCH^RCDPEWL Q
 I $O(^RCY(344.49,RCSCR,3,0)) D  Q:'RCOK
 . S RCOK=1
 . S Z=0 F  S Z=$O(^RCY(344.49,RCSCR,3,Z)) Q:'Z  I '$P($G(^(Z,0)),U,3) S RCOK=0 Q
 . I 'RCOK S DIR(0)="EA",DIR("A",1)="A RECEIPT CANNOT BE PREVIEWED UNTIL ALL BATCHES FOR THIS ERA ARE MARKED AS",DIR("A",2)="'READY TO POST'",DIR("A")="PRESS RETURN TO CONTINUE " W ! D ^DIR K DIR
 ;
 S Z=0 F  S Z=$O(^RCY(344.49,RCSCR,1,Z)) Q:'Z  I $P(Z,".",2) S Z0=$G(^(Z,0)) I $P(Z0,U,6)<0 S RCZ($P(Z0,U))=$P(Z0,U,2)_U_$P(Z0,U,6)
 I $O(RCZ(""))'="" D
 . W !,"THE FOLLOWING LINES HAVE A NET PAYMENT LESS THAN 0.  THESE LINES MUST HAVE",!,"THIS NEGATIVE AMOUNT DISTRIBUTED TO OTHER LINE(S) IN THE ERA BEFORE A",!,"RECEIPT CAN BE CREATED."
 . S Z="" F  S Z=$O(RCZ(Z)) Q:Z=""  W !,$J("",5)_$J(Z,10)_"  "_$E($P(RCZ(Z),U)_$J("",15),1,15)_"  "_$J(+$P(RCZ(Z),U,2),"",2)
 . W !
 . S DIR(0)="E" D ^DIR K DIR
 ;
 D EN^VALM("RCDPE EOB RECEIPT PREVIEW")
 S VALMBCK=$S('$G(RCSCR):"Q",1:"R")
 Q
 ;
