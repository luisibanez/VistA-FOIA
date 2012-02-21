PRSALVX ;HISC/REL-Cancel Leave Request ;12-SEP-00
 ;;4.0;PAID;**61**;Sep 21, 1995
 S DFN="",SSN=$P($G(^VA(200,DUZ,1)),"^",9) I SSN'="" S DFN=$O(^PRSPC("SSN",SSN,0))
 I 'DFN W !!,*7,"Your SSN was not found in both the New Person & Employee File!" G EX
 S TLE=$P($G(^PRSPC(DFN,0)),"^",8) S:TLE="" TLE="   " S TLI=+$O(^PRST(455.5,"B",TLE,0))
 W:$E(IOST,1,2)="C-" @IOF W !?26,"VA TIME & ATTENDANCE SYSTEM",!?29,"CANCEL LEAVE REQUESTS"
 S X=$G(^PRSPC(DFN,0)) W !!,$P(X,"^",1) S X=$P(X,"^",9) I X W ?50,$E(X,1,3),"-",$E(X,4,5),"-",$E(X,6,9)
 K %DT S %DT="AEFX",%DT("A")="Begin with Date: ",%DT("B")="T" W ! D ^%DT K %DT S:$D(DTOUT) Y=0 G:Y<1 EX S EDT=9999999-Y
 W ! S NUM=1 D DISP^PRSALVS
 G:'CNT EX
X1 R !!,"Cancel Which Request #? ",X:DTIME G:'$T!("^"[X) EX I X'?1N.N!(X<1)!(X>CNT) W *7," Enter # of Request to Cancel" G X1
 S X=+X,DA=R(X),$P(^PRST(458.1,DA,0),"^",9)="X" K ^PRST(458.1,"AR",DFN,DA)
 D UPD^PRSASAL W "  ... done"
EX G KILL^XUSCLEAN
