PSJONIT1 ; ; 06-OCT-1994
 ;;4.5; Inpatient Medications ;;7 Oct 94
 ; LOADS
 ;
 I $S('$D(DUZ)#2:1,'$D(DUZ(0))#2:1,1:0) W !,"DUZ and DUZ(0) must be defined to continue." K DIFQ Q
 K DIF,DIK,D,DDF,DDT,DTO,D0,DLAYGO,DIC,DIR,DA,DFR,DTN,DIX,DZ D DT^PSJONIT2 S %=1,U="^",DSEC=1
 S NO=$P("I 0^I $D(@X)#2,X[U",U,%) I %<1 K DIFQ Q
 W !,"    PROTOCOL INSTALLATION"
 Q:'$D(DIFQ)  ;S %=0 W !!,"ARE YOU SURE YOU WANT TO CONTINUE" D YN^DICN I %-1 K DIFQ Q
 D DT^PSJONIT2 K ^UTILITY(U,$J),^UTILITY("DIK",$J) W !,"...OK, this may take a while, hold on please..." F R=1001:1:1005 D @("^PSJON"_$E(R,2,4)) W "."
