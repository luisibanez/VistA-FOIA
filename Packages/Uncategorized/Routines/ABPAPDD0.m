ABPAPDD0 ;PVT-INS PAYMENT DELETE (START); [ 06/26/91  8:12 PM ]
 ;;1.4;AO PVT-INS TRACKING;*0*;IHS-OKC/KJR;JULY 25, 1991
 D XIT,CURRENT^%ZIS S U="^"
 S ABPA("HD",1)=ABPATLE,ABPA("HD",2)="DELETE existing payments"
 D ^ABPAHD
BATDT D ^ABPAGPB I $D(ABPABDT)'=1 D XIT G END
 K ABPA("HD")
 S ABPA("HD",1)=ABPATLE,ABPA("HD",2)="DELETE existing payments"
 D ^ABPAHD W !!
 S D0=ABPABDFN K DXS D ^ABPABAT K DXS
FAC K DIC S DIC="^DIC(4,",DIC(0)="AEQZ",DIC("A")="Select BATCH FACILITY: "
 W !! D ^DIC I +Y<1 D  G ABPAPDD0
 .D ^ABPABRC0,XIT S U="^"
 .S ABPA("HD",1)=ABPATLE_" - DELETE existing payments"
 .S ABPA("HD",2)="BATCH SUMMARY" D ^ABPAHD W !!
 .S D0=ABPABDFN K DXS D ^ABPABAT K DXS
 .W ! F X=1:1:79 W "="
 .D CLOSE^ABPABRC0,PAUSE^ABPAMAIN
 .L
 S ABPASITE=+Y
CONT G ^ABPAPDD1
XIT K ABPADDFN,ABPATDFN,ABPADT,ABPADTD,ABPAPAT,D,ABPAX,ABPAFRDT,ABPATODT
 K ABPA,ABPAL,DIC,C,ABPADT,ABPAQKS,ABPAQK,ABPAHRN,DA,J,K,Z,XQH
 K ABPAC,ABPAI,ABPAXX,ABPAINS,DIE,DR,ABPAPD,ABPABDT,ABPASITE,DIC,X,Y Q
END K ABPA("I"),ABPABDFN Q